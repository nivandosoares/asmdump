.BANK 10 SLOT 0
.ORG $0000

.SECTION "Bank10" FORCE

	eor $4B55.w,Y		; 59 55 4B
	eor $200000.l		; 4F 00 00 20
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	bmi 112.b		; 30 70
	rol $44AE.w,X		; 3E AE 44
	bvc  82.b		; 50 52
	lsr $54.b		; 46 54
	and ($30.b)		; 32 30
	eor $35.b,S		; 43 35
	rol $6F73.w		; 2E 73 6F
	jmp ($CF00.w)		; 6C 00 CF
	jmp ($E0D6.w,X)		; 7C D6 E0
	jmp ($831F.w,X)		; 7C 1F 83
	eor $9C89.w,X		; 5D 89 9C
	sta $1895DA.l		; 8F DA 95 18
	stz $A257.w		; 9C 57 A2
	sta $A8.b,X		; 95 A8
	pei ($AE.b)		; D4 AE
	ora ($B5.b)		; 12 B5
	eor ($BB.b),Y		; 51 BB
	sta $C7CEC1.l		; 8F C1 CE C7
	tsb $4ACE.w		; 0C CE 4A
	pei ($89.b)		; D4 89
	phx		; DA
	eor ($77.b)		; 52 77
	bvs 119.b		; 70 77
	adc [$70.b],Y		; 77 70
	ora [$07.b]		; 07 07
	adc [$66.b],Y		; 77 66
	bne  76.b		; D0 4C
	brk $00.b		; 00 00
	tsb $0F0C.w		; 0C 0C 0F
	cmp $FCF066.l		; CF 66 F0 FC
	sbc ($0B.b)		; F2 0B
	adc ($40.b,S),Y		; 73 40
	ora $D0.b,S		; 03 D0
	lsr $71.b,X		; 56 71
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	sta [$19.b],Y		; 97 19
	brk $52.b		; 00 52
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	sta $9999.w,Y		; 99 99 99
	sta $FF82.w,Y		; 99 82 FF
	sbc $FDFFFF.l,X		; FF FF FF FD
	tyx		; BB
	bne  19.b		; D0 13
	ldx $10.b		; A6 10
	tsx		; BA
	sep #$44		; E2 44
	bvc -30.b		; 50 E2
	mvn $C6,$3F		; 54 3F C6
	cpy #$2E.b		; C0 2E
	cpy #$11.b		; C0 11
	bpl  32.b		; 10 20
	brk $11.b		; 00 11
	ldx $22.b,Y		; B6 22
	tsx		; BA
	and $AA.b,S		; 23 AA
	ora ($31.b,X)		; 01 31
	ora ($1F.b,S),Y		; 13 1F
	ldx $12.b,Y		; B6 12
	jsl $2AA32B.l		; 22 2B A3 2A
	lda $B61122.l,X		; BF 22 11 B6
	and ($F0.b),Y		; 31 F0
	and $31.b,S		; 23 31
	tyx		; BB
	bmi -69.b		; 30 BB
	sbc ($B6.b,X)		; E1 B6
	eor ($13.b,X)		; 41 13
	ora $1B2303.l,X		; 1F 03 23 1B
	rep #$0B		; C2 0B
	ldx $AF.b,Y		; B6 AF
	ora ($02.b,S),Y		; 13 02
	and ($F1.b),Y		; 31 F1
	and $31.b,S		; 23 31
	lda $10B6.w		; AD B6 10
	dex		; CA
	beq  64.b		; F0 40
	and ($10.b)		; 32 10
	ora $23.b,S		; 03 23
	ldx $1B.b,Y		; B6 1B
	sbc $03A0FD.l		; EF FD A0 03
	ora $21.b,S		; 03 21
	brk $B6.b		; 00 B6
	and ($30.b)		; 32 30
	ldx $EAFF.w,Y		; BE FF EA
	brk $21.b		; 00 21
	and $B6.b,S		; 23 B6
	ora ($F4.b,X)		; 01 F4
	ora $EB.b,X		; 15 EB
	asl $B0FD.w		; 0E FD B0
	ora ($B6.b,X)		; 01 B6
	and $20.b,S		; 23 20
	rol $4E42.w		; 2E 42 4E
	lda ($DF.b),Y		; B1 DF
	stp		; DB
	ldx $00.b,Y		; B6 00
	ora ($22.b,S),Y		; 13 22
	cop $F3.b		; 02 F3
	and $EB.b,S		; 23 EB
	tsa		; 3B
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
	ldy $F0CD.w,X		; BC CD F0
	ora ($21.b),Y		; 11 21
	bit $53.b,X		; 34 53
	ldx $C3.b,Y		; B6 C3
	sta ($CD.b),Y		; 91 CD
	and $213F04.l		; 2F 04 3F 21
	sbc ($B6.b,S),Y		; F3 B6
	and ($CE.b)		; 32 CE
	and #$E31B.w		; 29 1B E3
	cmp ($43.b),Y		; D1 43
	sbc ($B6.b)		; F2 B6
	bpl  50.b		; 10 32
	bit $90E2.w		; 2C E2 90
	dec $153D.w		; CE 3D 15
	ldx $1F.b,Y		; B6 1F
	bmi   3.b		; 30 03
	jsl $1B19B0.l		; 22 B0 19 1B
	tsb $B6.b		; 04 B6
	lda ($60.b),Y		; B1 60
	sbc $F1.b		; E5 F1
	and ($2B.b),Y		; 31 2B
	bpl -96.b		; 10 A0
	ldx $B1.b,Y		; B6 B1
	dec A		; 3A
	rol $E1.b		; 26 E1
	eor $C21104.l		; 4F 04 11 C2
	ldx $EB.b,Y		; B6 EB
	xce		; FB
	and $A3.b,S		; 23 A3
	eor $0023.w,X		; 5D 23 00
	eor ($B6.b,X)		; 41 B6
	ora $CE1E.w		; 0D 1E CE
	cmp $1B.b,S		; C3 1B
	rol $C3.b,X		; 36 C3
	bmi -74.b		; 30 B6
	ora ($1E.b,S),Y		; 13 1E
	beq  -5.b		; F0 FB
	jmp.w [$A451]		; DC 51 A4
	jmp $F233B6.l		; 5C B6 33 F2
	and ($E0.b,X)		; 21 E0
	sbc $0AD6CC.l,X		; FF CC D6 0A
	ldx $53.b,Y		; B6 53
	cmp ($4E.b,S),Y		; D3 4E
	jsl $FC1F1D.l		; 22 1D 1F FC
	lda $9EEDB2.l,X		; BF B2 ED 9E
	inc $2515.w,X		; FE 15 25
	adc [$34.b]		; 67 34
	jsl $05C9B6.l		; 22 B6 C9 05
	tsb $134F.w		; 0C 4F 13
	eor $1D40.w		; 4D 40 1D
	dec $00.b		; C6 00
	inc $20C2.w,X		; FE C2 20
.ACCU 8
.INDEX 8
	sep #$F1		; E2 F1
	and ($F2.b,X)		; 21 F2
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	and ($11.b,X)		; 21 11
	xce		; FB
	cmp $02EFFE.l,X		; DF FE EF 02
.ACCU 16
	rep #$21		; C2 21
	and ($32.b,S),Y		; 33 32
	ora ($1E.b),Y		; 11 1E
	lda $EEFF.w,X		; BD FF EE
.ACCU 16
	rep #$E0		; C2 E0
	jsl $113213.l		; 22 13 32 11
	ora ($DA.b)		; 12 DA
	sbc $AEFCB2.l		; EF B2 FC AE
	ora $32.b		; 05 32
	ror $41.b		; 66 41
	jsl $C6B649.l		; 22 49 B6 C6
	ora ($BE.b,S),Y		; 13 BE
	.db $42, $5E		; 42 5E
	ora $1D.b,S		; 03 1D
	sbc ($C2.b,X)		; E1 C2
	ora ($CB.b)		; 12 CB
	sbc $02DF1D.l		; EF 1D DF 02
	ora ($33.b),Y		; 11 33
.INDEX 16
	rep #$10		; C2 10
	ora ($2C.b)		; 12 2C
	lda $01DDF1.l,X		; BF F1 DD 01
	and ($C2.b,X)		; 21 C2
	and $30.b,S		; 23 30
	ora ($22.b,X)		; 01 22
	ldy $1CF0.w,X		; BC F0 1C
	bne -62.b		; D0 C2
	ora ($12.b)		; 12 12
	and ($00.b,S),Y		; 33 00
	ora ($1B.b)		; 12 1B
	cmp $B2C600.l		; CF 00 C6 B2
	and ($1F.b,X)		; 21 1F
	ora ($FD.b)		; 12 FD
	ora ($1F.b),Y		; 11 1F
	lda ($B2.b,X)		; A1 B2
	bne   9.b		; D0 09
	cmp ($24.b,X)		; C1 24
	and $74.b		; 25 74
	cmp ($35.b),Y		; D1 35
.INDEX 16
	rep #$1A		; C2 1A
	cmp $11CE00.l,X		; DF 00 CE 11
	and ($34.b,X)		; 21 34
	asl $21C6.w,X		; 1E C6 21
	asl $21A2.w,X		; 1E A2 21
	sbc $1022.w,X		; FD 22 10
	cop $C6.b		; 02 C6
	ora $11E2.w,X		; 1D E2 11
	nop		; EA
	jsl $21E11F.l		; 22 1F E1 21
.INDEX 16
	rep #$11		; C2 11
	bit $0F.b,X		; 34 0F
	ora ($20.b)		; 12 20
	lda $FE00.w,X		; BD 00 FE
.ACCU 16
.INDEX 16
	rep #$F1		; C2 F1
	ora ($13.b),Y		; 11 13
	and $0B22F0.l,X		; 3F F0 22 0B
	bne -78.b		; D0 B2
	sbc $12CD.w,X		; FD CD 12
	and $66.b,S		; 23 66
	dec $5F15.w,X		; DE 15 5F
	dec $C2.b		; C6 C2
	jsr $01F0.w		; 20 F0 01
	bpl  18.b		; 10 12
	jsr ($B611.w,X)		; FC 11 B6
	rti		; 40

	lda #$EF35.w		; A9 35 EF
	brk $31.b		; 00 31
	ora ($4E.b,X)		; 01 4E
.ACCU 16
	rep #$E0		; C2 E0
	ora ($2F.b,S),Y		; 13 2F
	dec $FF0F.w		; CE 0F FF
	beq  16.b		; F0 10
	lda ($36.b)		; B2 36
	tsa		; 3B
	sbc ($55.b),Y		; F1 55
	sbc #$DEC0.w		; E9 C0 DE
	asl $31B6.w		; 0E B6 31
	cop $3C.b		; 02 3C
	lda $23.b,S		; A3 23
	inc A		; 1A
	lda ($2D.b,S),Y		; B3 2D
	ldx $12.b,Y		; B6 12
	sbc ($01.b)		; F2 01
	and ($CB.b),Y		; 31 CB
	and $31.b,S		; 23 31
	plb		; AB
	ldx $31.b,Y		; B6 31
	sbc ($3E.b,X)		; E1 3E
	ora ($12.b),Y		; 11 12
	trb $33C2.w		; 1C C2 33
	lda ($5F.b)		; B2 5F
	lda $E2EC.w,X		; BD EC E2
	beq  18.b		; F0 12
	mvp $B6,$0D		; 44 0D B6
	jsl $10BC31.l		; 22 31 BC 10
	sbc ($4E.b),Y		; F1 4E
	sbc ($13.b)		; F2 13
	lda ($40.b)		; B2 40
	cmp $CD5F14.l,X		; DF 14 5F CD
	jmp.w [$0FE2]		; DC E2 0F
	ldx $21.b,Y		; B6 21
	rol $21DE.w,X		; 3E DE 21
	and ($CD.b),Y		; 31 CD
	ora $21B202.l		; 0F 02 B2 21
	sbc ($24.b),Y		; F1 24
	and $5003DF.l		; 2F DF 03 50
	cmp $E0A6.w,X		; DD A6 E0
	eor [$FC.b],Y		; 57 FC
	and $2C.b,S		; 23 2C
	lda $6522.w,X		; BD 22 65
	lda ($0D.b)		; B2 0D
	stp		; DB
	cmp $330022.l		; CF 22 00 33
	ora $13B6EE.l		; 0F EE B6 13
	tsa		; 3B
	sbc $1E42F0.l		; EF F0 42 1E
	sbc ($0D.b,S),Y		; F3 0D
	ldx $FF.b,Y		; B6 FF
	brk $43.b		; 00 43
	cmp $04FF.w		; CD FF 04
	and ($FE.b,X)		; 21 FE
	lda ($22.b)		; B2 22
	sbc $51E2ED.l,X		; FF ED E2 51
	dec $12CC.w,X		; DE CC 12
	lda ($33.b)		; B2 33
	cop $1F.b		; 02 1F
	sbc $25DE.w,X		; FD DE 25
	and $B6EC.w		; 2D EC B6
	tsb $12.b		; 04 12
	trb $E020.w		; 1C 20 E0
	inc $3D14.w,X		; FE 14 3D
	lda ($DE.b)		; B2 DE
	cpy $3511.w		; CC 11 35
	ora ($1F.b,X)		; 01 1F
	inc $B6DE.w,X		; FE DE B6
	eor $EA.b,S		; 43 EA
	asl $02F5.w,X		; 1E F5 02
	bit $F0F1.w,X		; 3C F1 F0
	lda ($EC.b)		; B2 EC
.ACCU 8
	sep #$63		; E2 63
	dec $01DB.w,X		; DE DB 01
	and $2F.b		; 25 2F
	ldx $1F.b,Y		; B6 1F
	ora $E944E1.l		; 0F E1 44 E9
	bpl -44.b		; 10 D4
	ora ($B6.b)		; 12 B6
	rol $00C1.w,X		; 3E C1 00
	sbc $4E23.w,X		; FD 23 4E
	ldy #$B61D.w		; A0 1D B6
	eor ($13.b,X)		; 41 13
	asl A		; 0A
	jsr $D20F.w		; 20 0F D2
	bit $F9.b,X		; 34 F9
	lda ($DF.b)		; B2 DF
	cmp $EF4502.l		; CF 02 45 EF
	brk $EC.b		; 00 EC
	sbc ($B6.b,X)		; E1 B6
	eor $222D90.l		; 4F 90 2D 22
	ora ($2A.b)		; 12 2A
	sbc ($0E.b)		; F2 0E
	lda ($CE.b)		; B2 CE
	ora $5D.b,X		; 15 5D
	bne -18.b		; D0 EE
	ora ($36.b,X)		; 01 36
	asl $01B2.w		; 0E B2 01
	cpx $45E1.w		; EC E1 45
	cmp $E00E.w,X		; DD 0E E0
	bit $B2.b		; 24 B2
	adc ($D0.b),Y		; 71 D0
	asl $04CE.w,X		; 1E CE 04
	adc $FEC0.w		; 6D C0 FE
	lda ($F1.b)		; B2 F1
	rol $2D.b,X		; 36 2D
	cop $EC.b		; 02 EC
	bne  70.b		; D0 46
	jmp.w [$0FB2]		; DC B2 0F
	sbc $EF5313.l		; EF 13 53 EF
	rol $04CD.w		; 2E CD 04
	ldx $29.b,Y		; B6 29
	cmp $FF.b,X		; D5 FF
	ora ($32.b,X)		; 01 32
	xce		; FB
	tsb $CD.b		; 04 CD
	ldx $13.b,Y		; B6 13
	.db $42, $AB		; 42 AB
	bvc  -1.b		; 50 FF
	trb $10.b		; 14 10
	dec $2FB2.w		; CE B2 2F
	ldy $50F3.w,X		; BC F3 50
	ldy #$EF00.w		; A0 00 EF
	bit $B2.b,X		; 34 B2
	eor ($E2.b,X)		; 41 E2
	phd		; 0B
	cmp $F00A35.l,X		; DF 35 0A F0
	asl $04B6.w		; 0E B6 04
	jsr $30ED.w		; 20 ED 30
	sta ($33.b),Y		; 91 33
	and $B2A4.w		; 2D A4 B2
	brk $FE.b		; 00 FE
	and $41.b,S		; 23 41
	sbc ($2B.b),Y		; F1 2B
	lda $E9B624.l,X		; BF 24 B6 E9
	and ($0F.b)		; 32 0F
	cpx $20.b		; E4 20
	sbc $B29F11.l,X		; FF 11 9F B2
	sbc ($42.b)		; F2 42
	dec $0E00.w		; CE 00 0E
	ora ($31.b,S),Y		; 13 31
	and ($B6.b,X)		; 21 B6
	ora $22F4.w,Y		; 19 F4 22
	plx		; FA
	ora ($01.b)		; 12 01
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda ($13.b)		; B2 13
	ora ($CA.b)		; 12 CA
	sbc ($32.b),Y		; F1 32
	cmp $1FFF.w		; CD FF 1F
	lda ($04.b)		; B2 04
	and ($42.b)		; 32 42
	bit $12AF.w		; 2C AF 12
	and $B2DF.w		; 2D DF B2
	sbc ($00.b),Y		; F1 00
	and ($24.b)		; 32 24
	jsl $11F0DA.l		; 22 DA F0 11
	lda ($DC.b)		; B2 DC
	inc $F310.w		; EE 10 F3
	jsl $AE1D43.l		; 22 43 1D AE
	ldx $51.b		; A6 51
	inc A		; 1A
	cmp ($26.b,X)		; C1 26
	ora $145F.w,X		; 1D 5F 14
	tsb $CCB6.w		; 0C B6 CC
	and ($01.b,S),Y		; 33 01
	sbc $3201.w		; ED 01 32
	sbc ($01.b,X)		; E1 01
	lda ($44.b)		; B2 44
	rol $00AD.w		; 2E AD 00
	bpl -53.b		; 10 CB
	sbc ($31.b,X)		; E1 31
	ldx $00.b,Y		; B6 00
	ora ($0F.b)		; 12 0F
	ldy $0223.w,X		; BC 23 02
	xce		; FB
	sbc ($B2.b,S),Y		; F3 B2
	ora ($21.b,S),Y		; 13 21
	and $44.b,S		; 23 44
	eor $1100BC.l		; 4F BC 00 11
	lda ($BA.b)		; B2 BA
	bne  35.b		; D0 23
	ora ($34.b),Y		; 11 34
	mvp $CF,$FB		; 44 FB CF
	lda ($F1.b)		; B2 F1
	pld		; 2B
	sta $4103.w,X		; 9D 03 41
	ora ($44.b,S),Y		; 13 44
	eor $30C0B6.l,X		; 5F B6 C0 30
	ora ($9D.b)		; 12 9D
	eor $32.b,S		; 43 32
	bne  33.b		; D0 21
.ACCU 16
	rep #$23		; C2 23
	asl $F0DF.w		; 0E DF F0
	ora $01CE.w,X		; 1D CE 01
	and ($C2.b,X)		; 21 C2
	cop $22.b		; 02 22
	and ($ED.b),Y		; 31 ED
	sbc $E0DB01.l,X		; FF 01 DB E0
	lda ($25.b)		; B2 25
	and ($45.b),Y		; 31 45
	eor $3B.b		; 45 3B
	ldx $2AE0.w		; AE E0 2A
.ACCU 16
.INDEX 16
	rep #$BE		; C2 BE
	ora ($32.b,X)		; 01 32
	cop $22.b		; 02 22
	and ($ED.b)		; 32 ED
	sbc $DB01C2.l,X		; FF C2 01 DB
	cpx #$2012.w		; E0 12 20
	ora ($22.b)		; 12 22
	rol $F2C6.w		; 2E C6 F2
	ora ($1C.b,X)		; 01 1C
	sbc $11.b,S		; E3 11
	jsr $10E1.w		; 20 E1 10
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	sbc $01FF.w		; ED FF 01
	wai		; CB
	cpx #$2112.w		; E0 12 21
.ACCU 16
	rep #$22		; C2 22
	and $3E.b,S		; 23 3E
	dec $1CF0.w,X		; DE F0 1C
	ldx $C601.w,Y		; BE 01 C6
	jsr $00F1.w		; 20 F1 00
	ora ($BE.b),Y		; 11 BE
	ora ($11.b),Y		; 11 11
	lda $14D0B2.l,X		; BF B2 D0 14
	eor ($43.b,S),Y		; 53 43
	rol $7E.b,X		; 36 7E
	stz $C2E1.w		; 9C E1 C2
	tsb $00BF.w		; 0C BF 00
	and $22.b,S		; 23 22
	ora ($34.b)		; 12 34
	tsb $11C6.w		; 0C C6 11
	and $1131CF.l		; 2F CF 31 11
	bpl  15.b		; 10 0F
	ora ($C2.b),Y		; 11 C2
	rti		; 40

	cmp $FBF0.w		; CD F0 FB
	cmp $322300.l		; CF 00 23 32
.INDEX 16
	rep #$12		; C2 12
	mvp $DF,$0C		; 44 0C DF
	ora $01F0BC.l		; 0F BC F0 01
	dec $10.b		; C6 10
	asl $0D22.w		; 0E 22 0D
	lda ($21.b),Y		; B1 21
	cpx $C222.w		; EC 22 C2
	ora $023313.l		; 0F 13 33 02
	mvp $DF,$1C		; 44 1C DF
	asl $C2C6.w		; 0E C6 C2
	jsr $2102.w		; 20 02 21
	inc $0D22.w,X		; FE 22 0D
	lda ($B6.b),Y		; B1 B6
	eor ($AA.b),Y		; 51 AA
	mvn $44,$00		; 54 00 44
	ora $C630B5.l,X		; 1F B5 30 C6
	stp		; DB
	ora ($1C.b)		; 12 1C
	sbc $10.b,S		; E3 10
	ora $20.b,S		; 03 20
	inc $31C6.w,X		; FE C6 31
	ora $30B0.w		; 0D B0 30
	dec $0031.w,X		; DE 31 00
	and ($C2.b)		; 32 C2
	eor $13.b,S		; 43 13
	mvp $CF,$0C		; 44 0C CF
	jsr ($FFBE.w,X)		; FC BE FF
.ACCU 16
.INDEX 16
	rep #$F2		; C2 F2
	mvp $34,$31		; 44 31 34
	rti		; 40

	cpy $BBFF.w		; CC FF BB
	ldx $71.b,Y		; B6 71
	sbc ($54.b),Y		; F1 54
	ora $993FE3.l		; 0F E3 3F 99
	sbc $C2.b,X		; F5 C2
	xce		; FB
	lda $44F2FE.l,X		; BF FE F2 44
	and ($34.b)		; 32 34
	bmi -58.b		; 30 C6
	cpy #$C020.w		; C0 20 C0
	bmi   1.b		; 30 01
	jsl $C20000.l		; 22 00 00 C2
	eor $0C.b,S		; 43 0C
	dec $CFEA.w		; CE EA CF
	inc $4402.w		; EE 02 44
	ldx $F1.b,Y		; B6 F1
	ora ($F9.b,X)		; 01 F9
	lda $935F.w,X		; BD 5F 93
	lsr $B622.w		; 4E 22 B6
	mvp $1F,$01		; 44 01 1F
	ora $F9C5AB.l,X		; 1F AB C5 F9
	eor ($B6.b)		; 52 B6
.ACCU 8
.INDEX 8
	sep #$33		; E2 33
	eor ($11.b,X)		; 41 11
	sbc ($EA.b,X)		; E1 EA
	wai		; CB
	ror $A5B6.w		; 6E B6 A5
	ora $124422.l,X		; 1F 22 44 12
	ora $AC0F.w,X		; 1D 0F AC
	ldx $B5.b,Y		; B6 B5
	xba		; EB
	rts		; 60

	sbc ($33.b)		; F2 33
	eor ($22.b,X)		; 41 22
	cpy #$B6.b		; C0 B6
	nop		; EA
	stp		; DB
	eor $F0D5.w,X		; 5D D5 F0
	and $43.b,S		; 23 43
	jsl $0E1CB6.l		; 22 B6 1C 0E
	ldy $DFD3.w		; AC D3 DF
	and $B63511.l,X		; 3F 11 35 B6
	and ($11.b,S),Y		; 33 11
	lda ($DB.b),Y		; B1 DB
	cmp $124B.w		; CD 4B 12
	sbc ($B6.b),Y		; F1 B6
	jsl $FC3263.l		; 22 63 32 FC
	tsb $D3CC.w		; 0C CC D3
	lda ($B6.b)		; B2 B6
	and $233612.l		; 2F 12 36 23
	jsr $CCBF.w		; 20 BF CC
	dec $1CB6.w,X		; DE B6 1C
	and ($10.b,X)		; 21 10
	and $63.b,S		; 23 63
	jsl $B6ED0B.l		; 22 0B ED B6
	ldx $D2E0.w,Y		; BE E0 D2
	ora ($11.b),Y		; 11 11
	eor $42.b		; 45 42
	and $DBCDB6.l		; 2F B6 CD DB
	inc $22FD.w,X		; FE FD 22
	bpl   5.b		; 10 05
	mvn $21,$B6		; 54 B6 21
	tsb $DFCC.w		; 0C CC DF
	inc $20E2.w		; EE E2 20
	bpl -74.b		; 10 B6
	adc $41.b		; 65 41
	bpl -53.b		; 10 CB
	dec $DF0D.w		; CE 0D DF
	and $B6.b,S		; 23 B6
	brk $07.b		; 00 07
	eor ($12.b,S),Y		; 53 12
	phd		; 0B
	tyx		; BB
	beq -20.b		; F0 EC
	ldx $E3.b,Y		; B6 E3
	and $406511.l,X		; 3F 11 65 40
	ora ($BB.b),Y		; 11 BB
	ldy #$B6.b		; A0 B6
	trb $34CE.w		; 1C CE 34
	beq  38.b		; F0 26
	adc $02.b,S		; 63 02
	phd		; 0B
	ldx $AA.b,Y		; B6 AA
	and ($CB.b,X)		; 21 CB
	cpx $4F.b		; E4 4F
	sbc ($56.b,S),Y		; F3 56
	bmi -74.b		; 30 B6
	and ($AA.b,X)		; 21 AA
	ldx #$1C.b		; A2 1C
	lda $44E053.l		; AF 53 E0 44
.INDEX 16
	rep #$56		; C2 56
	lsr $63.b,X		; 56 63
	jsr ($DAEF.w,X)		; FC EF DA
	lda $C2ED.w		; AD ED C2
	bne  37.b		; D0 25
	adc $76.b		; 65 76
	and $AAFDCE.l,X		; 3F CE FD AA
.INDEX 16
	rep #$DE		; C2 DE
	dec $5602.w,X		; DE 02 56
	eor [$64.b],Y		; 57 64
	jsr ($C2EF.w,X)		; FC EF C2
	cmp $EDAD.w,Y		; D9 AD ED
	cpx #$5525.w		; E0 25 55
	adc $4E.b,X		; 75 4E
	dec $D2.b		; C6 D2
	asl $31C0.w,X		; 1E C0 31
.ACCU 8
	sep #$22		; E2 22
	bmi  17.b		; 30 11
	dec $FF.b		; C6 FF
	lda $EC30.w,X		; BD 30 EC
	ora $1E.b,S		; 03 1E
	jsl $01C623.l		; 22 23 C6 01
	ora $0ED3EC.l,X		; 1F EC D3 0E
	lda ($21.b)		; B2 21
	sep #$C6		; E2 C6
	and $2F.b,S		; 23 2F
	and ($FE.b,X)		; 21 FE
	cmp $EB21.w		; CD 21 EB
	jsl $221EC6.l		; 22 C6 1E 22
	and ($F2.b)		; 32 F2
	ora $2DD2EC.l,X		; 1F EC D2 2D
	dec $B2.b		; C6 B2
	jsr $23F2.w		; 20 F2 23
	bpl  33.b		; 10 21
	inc $C2CD.w,X		; FE CD C2
	cpx #$BDD9.w		; E0 D9 BD
	jmp.w [$45E1]		; DC E1 45
	lsr $65.b		; 46 65
.ACCU 16
	rep #$2F		; C2 2F
	dec $9B0D.w		; CE 0D 9B
	sbc $14CE.w		; ED CE 14
	mvp $30,$C6		; 44 C6 30
	inc $22EC.w,X		; FE EC 22
	jmp.w [$FF13]		; DC 13 FF
	jsl $3644C2.l		; 22 C2 44 36
	stz $30.b		; 64 30
	dec $AB0D.w		; CE 0D AB
	cmp $CEC2.w,X		; DD C2 CE
	trb $44.b		; 14 44
	ror $42.b		; 66 42
	tsb $DAE0.w		; 0C E0 DA
	ldx $14.b,Y		; B6 14
	sbc $046036.l,X		; FF 36 60 04
	ora $93EB.w,X		; 1D EB 93
	ldx $3B.b,Y		; B6 3B
	lda ($3F.b,X)		; A1 3F
	sbc ($75.b,S),Y		; F3 75
	brk $41.b		; 00 41
	dec $BAB6.w,X		; DE B6 BA
	trb $BB.b		; 14 BB
	cop $0F.b		; 02 0F
	rol $50.b,X		; 36 50
	tsb $B6.b		; 04 B6
	ora $A1EC.w,X		; 1D EC A1
	phk		; 4B
	bcs  33.b		; B0 21
	sbc $74.b,S		; E3 74
	ldx $01.b,Y		; B6 01
	and ($DE.b),Y		; 31 DE
	wai		; CB
	ora $CC.b,S		; 03 CC
	sbc ($2E.b),Y		; F1 2E
	ldx $37.b,Y		; B6 37
	rti		; 40

	ora $1E.b,S		; 03 1E
	cpx $3DCF.w		; EC CF 3D
	bcs -74.b		; B0 B6
	ora ($F3.b,X)		; 01 F3
	adc ($10.b,S),Y		; 73 10
	and ($FE.b,X)		; 21 FE
	cpy $B601.w		; CC 01 B6
	cpx $1FF0.w		; EC F0 1F
	and [$31.b],Y		; 37 31
	ora ($2F.b,X)		; 01 2F
	sbc $C0B6.w		; ED B6 C0
	asl $F1CF.w,X		; 1E CF F1
	cop $73.b		; 02 73
	ora ($11.b,X)		; 01 11
	ldx $0E.b,Y		; B6 0E
	jmp.w [$FB00]		; DC 00 FB
	asl $2710.w,X		; 1E 10 27
	bmi -62.b		; 30 C2
	and ($44.b,S),Y		; 33 44
	and ($FF.b),Y		; 31 FF
	inc $CDCD.w,X		; FE CD CD
	dec $72B6.w,X		; DE B6 72
	ora ($11.b,X)		; 01 11
	ora $EC0FDD.l		; 0F DD 0F EC
	and $00B6.w		; 2D B6 00
	and [$20.b],Y		; 37 20
	bpl  17.b		; 10 11
	sbc $0DD0.w,X		; FD D0 0D
	ldx $C2.b,Y		; B6 C2
	cmp $017212.l,X		; DF 12 72 01
	bpl  47.b		; 10 2F
	dec $F1B6.w,X		; DE B6 F1
	cpy $E13D.w		; CC 3D E1
	rol $2F.b,X		; 36 2F
	and ($01.b,X)		; 21 01
	ldx $0D.b,Y		; B6 0D
	inc $C31C.w,X		; FE 1C C3
	sbc $6113.w		; ED 13 61
	ora ($B6.b,X)		; 01 B6
	bpl  17.b		; 10 11
	cmp $20DCE0.l,X		; DF E0 DC 20
	cpy #$B645.w		; C0 45 B6
	bpl  18.b		; 10 12
	sbc ($1E.b),Y		; F1 1E
	ora $B20E.w		; 0D 0E B2
	ora $9DB2.w		; 0D B2 9D
	and $24.b,S		; 23 24
	stz $56.b		; 64 56
	eor $0F.b,S		; 43 0F
	sbc $02B6.w,Y		; F9 B6 02
	cmp $130045.l		; CF 45 00 13
	sbc ($2F.b,X)		; E1 2F
	tsb $F1B6.w		; 0C B6 F1
	lda $50E41E.l,X		; BF 1E E4 50
	sbc ($3E.b)		; F2 3E
	ora ($B2.b),Y		; 11 B2
	eor $1E.b,X		; 55 1E
	tsb $A9AC.w		; 0C AC A9
	cmp ($11.b),Y		; D1 11
	and $B2.b		; 25 B2
	and ($55.b,S),Y		; 33 55
	eor ($E0.b),Y		; 51 E0
	nop		; EA
	tyx		; BB
	stz $B200.w		; 9C 00 B2
	cop $42.b		; 02 42
	bit $54.b,X		; 34 54
	ora $AB0E.w,X		; 1D 0E AB
	tsx		; BA
	lda ($C0.b)		; B2 C0
	brk $14.b		; 00 14
	and ($56.b,S),Y		; 33 56
	eor ($E0.b)		; 52 E0
	phd		; 0B
	ldx $F1.b,Y		; B6 F1
	sbc ($30.b),Y		; F1 30
	cop $2F.b		; 02 2F
	cop $20.b		; 02 20
	jmp.w [$21B6]		; DC B6 21
	cpy $0220.w		; CC 20 02
	ora $22F122.l,X		; 1F 22 F1 22
	ldx $FE.b,Y		; B6 FE
	cmp ($2D.b,X)		; C1 2D
	lda ($00.b)		; B2 00
	jsr $2F02.w		; 20 02 2F
	lda ($24.b)		; B2 24
	adc $30.b		; 65 30
	sbc ($FA.b)		; F2 FA
	cmp $FFDE.w		; CD DE FF
	ldx $11.b,Y		; B6 11
	cop $12.b		; 02 12
	sbc $A13EDF.l,X		; FF DF 3E A1
	ora ($B2.b,X)		; 01 B2
	dec $11E0.w,X		; DE E0 11
	bit $64.b,X		; 34 64
	and ($F2.b),Y		; 31 F2
	phd		; 0B
	ldx $01.b		; A6 01
	and $142202.l,X		; 3F 02 22 14
	bit $EE.b		; 24 EE
	stp		; DB
	ldx $3E.b,Y		; B6 3E
	cmp $11FF03.l		; CF 03 FF 11
	bpl  49.b		; 10 31
	and $F232B2.l		; 2F B2 32 F2
	trb $EDAB.w		; 1C AB ED
	dec $03F0.w		; CE F0 03
	lda ($35.b)		; B2 35
	.db $42, $2F		; 42 2F
	jsl $EDBECB.l		; 22 CB BE ED
	sbc $4400B2.l		; EF B2 00 44
	eor $23.b,X		; 55 23
	sbc ($2C.b),Y		; F1 2C
	tyx		; BB
	sbc $F0DDB2.l		; EF B2 DD F0
	tsb $44.b		; 04 44
	eor ($20.b)		; 52 20
	ora ($DB.b)		; 12 DB
	ldx $02.b,Y		; B6 02
	and $1001.w		; 2D 01 10
	eor ($02.b,X)		; 41 02
	cmp ($E1.b,X)		; C1 E1
	lda ($3D.b)		; B2 3D
	tyx		; BB
	cmp $F4FFDD.l,X		; DF DD FF F4
	eor $62.b		; 45 62
	ldx $00.b,Y		; B6 00
	sbc ($AD.b,S),Y		; F3 AD
	bpl  62.b		; 10 3E
	sbc ($1F.b),Y		; F1 1F
	eor ($B2.b),Y		; 51 B2
	lsr $12.b		; 46 12
	jsr $AD3E.w		; 20 3E AD
	cmp $B6EFEC.l		; CF EC EF B6
	ora $10.b		; 05 10
	bit $E301.w		; 2C 01 E3
	wai		; CB
	and $E1B620.l,X		; 3F 20 B6 E1
	brk $51.b		; 00 51
	cop $B1.b		; 02 B1
	asl $B43C.w,X		; 1E 3C B4
	ldx $E2.b,Y		; B6 E2
	asl $F510.w		; 0E 10 F5
	jsr $112B.w		; 20 2B 11
.ACCU 8
.INDEX 8
	sep #$B6		; E2 B6
	phx		; DA
	eor $00D111.l		; 4F 11 D1 00
	eor ($01.b)		; 52 01
	cmp ($B2.b,X)		; C1 B2
	and ($30.b),Y		; 31 30
	stz $FEEE.w,X		; 9E EE FE
	sbc $54E2.w		; ED E2 54
	lda ($50.b)		; B2 50
	ora ($12.b,S),Y		; 13 12
	ora #$DF.b		; 09 DF
	cmp $B6CEEE.l,X		; DF EE CE B6
	eor $00.b,S		; 43 00
.ACCU 16
	rep #$2D		; C2 2D
	rol $3D93.w		; 2E 93 3D
	jsr $ECB2.w		; 20 B2 EC
	sbc ($54.b,X)		; E1 54
	rti		; 40

	trb $02.b		; 14 02
	asl A		; 0A
	bne -78.b		; D0 B2
	sbc $25CE0E.l		; EF 0E CE 25
	mvn $30,$01		; 54 01 30
	jsr $A2B6.w		; 20 B6 A2
	eor $DE12.w		; 4D 12 DE
	and $40.b,S		; 23 40
	sbc $B612.w,X		; FD 12 B6
	cmp ($EA.b)		; D2 EA
	bit $E0.b		; 24 E0
	bit $33E2.w,X		; 3C E2 33
	ora $3001B2.l,X		; 1F B2 01 30
	and $E21FAC.l,X		; 3F AC 1F E2
	cpx $B6E1.w		; EC E1 B6
	rti		; 40

	inc $D312.w		; EE 12 D3
	cpy $FE23.w		; CC 23 FE
	tad		; 5B
	lda ($CD.b)		; B2 CD
	tsb $42.b		; 04 42
	ora ($20.b,X)		; 01 20
	rol $00AC.w		; 2E AC 00
	lda ($E3.b)		; B2 E3
	cpx $44E0.w		; EC E0 44
	jsr $0322.w		; 20 22 03
	xce		; FB
	lda ($D1.b)		; B2 D1
	asl $CD3F.w,X		; 1E 3F CD
	tsb $42.b		; 04 42
	cop $20.b		; 02 20
	ldx $2C.b,Y		; B6 2C
	cmp $30.b,S		; C3 30
	cpx $DD.b		; E4 DD
	ora $4F.b,S		; 03 4F
	sbc $F22FB6.l,X		; FF B6 2F F2
	stp		; DB
	and ($1F.b)		; 32 1F
	and $B644CF.l		; 2F CF 44 B6
	sbc $2DFFF2.l,X		; FF F2 FF 2D
	cmp $20.b,S		; C3 20
	cop $FC.b		; 02 FC
	lda ($C0.b)		; B2 C0
	.db $42, $10		; 42 10
	and ($02.b,X)		; 21 02
	xba		; EB
	cpx #$01.b		; E0 01
	lda ($11.b)		; B2 11
	stp		; DB
	ora $21.b,S		; 03 21
	ora ($10.b)		; 12 10
	rol $B6BF.w		; 2E BF B6
	jsr $1B2F.w		; 20 2F 1B
	sbc $3E.b		; E5 3E
	brk $00.b		; 00 00
.ACCU 8
.INDEX 8
	sep #$B2		; E2 B2
	cpx $03F0.w		; EC F0 03
	ora ($EB.b)		; 12 EB
	ora $11.b,S		; 03 11
	and ($B2.b,X)		; 21 B2
	ora $00CF1E.l,X		; 1F 1E CF 00
	and ($1E.b)		; 32 1E
	ldy #$20.b		; A0 20
	ldx $01.b		; A6 01
	brk $C4.b		; 00 C4
	ldy $3551.w,X		; BC 51 35
	sbc $15A299.l		; EF 99 A2 15
	ora ($33.b),Y		; 11 33
	tsb $AE1C.w		; 0C 1C AE
	sbc ($76.b)		; F2 76
	ldx $EE.b,Y		; B6 EE
	cmp $2E.b		; C5 2E
	bpl  29.b		; 10 1D
	sbc ($EF.b)		; F2 EF
	jsr $23B6.w		; 20 B6 23
	inc $42ED.w,X		; FE ED 42
	cmp ($01.b)		; D2 01
	cpy #$2E.b		; C0 2E
	lda ($EF.b)		; B2 EF
	sbc ($53.b)		; F2 53
	ora $122FC0.l,X		; 1F C0 2F 12
	and $E0B2.w		; 2D B2 E0
	sbc $3026F0.l		; EF F0 26 30
	sbc $E1F1.w,X		; FD F1 E1
	ldx $10.b,Y		; B6 10
	ldx #$1F.b		; A2 1F
	ora $EF4D22.l,X		; 1F 22 4D EF
	cmp ($B6.b)		; D2 B6
	rol $EB13.w		; 2E 13 EB
	and ($F1.b,X)		; 21 F1
	sbc ($15.b,S),Y		; F3 15
	lda $120DB6.l,X		; BF B6 0D 12
	sbc ($4C.b,X)		; E1 4C
	lda ($00.b,S),Y		; B3 00
	rol $B632.w		; 2E 32 B6
	phk		; 4B
	beq -47.b		; F0 D1
	ora $3FAD14.l,X		; 1F 14 AD 3F
	ora ($B6.b),Y		; 11 B6
	sbc ($33.b)		; F2 33
	bcs  12.b		; B0 0C
	jsr $4901.w		; 20 01 49
	sbc $B6.b,S		; E3 B6
	sbc ($10.b),Y		; F1 10
	trb $2B.b		; 14 2B
	bpl -63.b		; 10 C1
	asl $B233.w,X		; 1E 33 B2
	wai		; CB
	sbc $11F0.w		; ED F0 11
	lsr $12.b,X		; 56 12
	and $B2F0.w		; 2D F0 B2
	sbc ($2B.b,X)		; E1 2B
	dec $01DF.w		; CE DF 01
	asl $50.b,X		; 16 50
	and ($B2.b)		; 32 B2
	cmp $AD220D.l,X		; DF 0D 22 AD
	jmp.w [$21F0]		; DC F0 21
	adc $B2.b		; 65 B2
	trb $2E.b		; 14 2E
	beq -29.b		; F0 E3
	inc A		; 1A
	sbc $12CF.w		; ED CF 12
	ldx $04.b,Y		; B6 04
	tsb $C24D.w		; 0C 4D C2
	sbc $F0B34D.l,X		; FF 4D B3 F0
	ldx $23.b,Y		; B6 23
	ora $DCD44F.l,X		; 1F 4F D4 DC
	rol $CD13.w		; 2E 13 CD
	lda ($EC.b)		; B2 EC
	cmp $422523.l		; CF 23 25 42
	.db $62, $E0, $DF		; 62 E0 DF
	lda ($2D.b)		; B2 2D
	ldx $02BC.w,Y		; BE BC 02
	.db $42, $54		; 42 54
	and $2E.b		; 25 2E
	lda ($0C.b)		; B2 0C
	sbc ($BB.b),Y		; F1 BB
	phx		; DA
	bcs  36.b		; B0 24
	ora ($43.b,S),Y		; 13 43
	lda ($52.b)		; B2 52
	sbc $CD1BDF.l		; EF DF 1B CD
	ldy $5213.w		; AC 13 52
	lda ($45.b)		; B2 45
	bit $3F.b,X		; 34 3F
	sbc $ADE1.w,X		; FD E1 AD
	dex		; CA
	lda ($B2.b),Y		; B1 B2
	bit $33.b,X		; 34 33
	mvn $FE,$43		; 54 43 FE
	inc $DC0A.w		; EE 0A DC
	ldx $E1.b,Y		; B6 E1
	.db $62, $1F, $02		; 62 1F 02
	beq  13.b		; F0 0D
	cpx #$01.b		; E0 01
	lda ($AD.b)		; B2 AD
	cmp #$C1.b		; C9 C1
	mvp $54,$43		; 44 43 54
	mvp $B6,$1E		; 44 1E B6
	ora ($FD.b,X)		; 01 FD
	rol $43D3.w		; 2E D3 43
	bpl -13.b		; 10 F3
	cpx #$B2.b		; E0 B2
	rti		; 40

	cmp $BDED.w,X		; DD ED BD
	lda $44D1.w,Y		; B9 D1 44
	eor $B2.b,S		; 43 B2
	stz $35.b		; 64 35
	ora $DCDE.w,X		; 1D DE DC
	phx		; DA
	sta $B224.w,X		; 9D 24 B2
	mvp $33,$36		; 44 36 33
	eor ($DD.b),Y		; 51 DD
	cpx $A9CD.w		; EC CD A9
	lda ($D2.b)		; B2 D2
	bit $43.b,X		; 34 43
	adc $36.b,S		; 63 36
	ora $CCCD.w,X		; 1D CD CC
	lda ($C9.b)		; B2 C9
	sta $4523.w,X		; 9D 23 45
	rol $33.b,X		; 36 33
	adc ($DC.b,X)		; 61 DC
	ldx $1E.b,Y		; B6 1E
	ora $1125D1.l,X		; 1F D1 25 11
	ora $B2133D.l,X		; 1F 3D 13 B2
	and $BDCD.w		; 2D CD BD
	cmp #$AD.b		; C9 AD
	and $45.b,S		; 23 45
	eor $B2.b		; 45 B2
	bit $62.b,X		; 34 62
	stp		; DB
	stp		; DB
	jmp.w [$E19A]		; DC 9A E1
	and ($B2.b,S),Y		; 33 B2
	eor $53.b,X		; 55 53
	lsr $3D.b		; 46 3D
	lda $C9CD.w,X		; BD CD C9
	ldx $32B6.w,Y		; BE B6 32
	ora ($00.b)		; 12 00
	sbc ($1E.b),Y		; F1 1E
	lda $1F1F.w,X		; BD 1F 1F
	ldx $C2.b,Y		; B6 C2
	and ($30.b)		; 32 30
	and ($FF.b,X)		; 21 FF
	and ($EB.b,X)		; 21 EB
.ACCU 16
.INDEX 16
	rep #$B2		; C2 B2
	cpy $BFB9.w		; CC B9 BF
	cop $35.b		; 02 35
	stz $45.b		; 64 45
	stz $B2.b		; 64 B2
	plx		; FA
	cpy $9BCB.w		; CC CB 9B
	beq  35.b		; F0 23
	lsr $44.b,X		; 56 44
	lda ($55.b)		; B2 55
	and $BACCAC.l,X		; 3F AC CC BA
	lda $B235F1.l		; AF F1 35 B2
	eor ($45.b,S),Y		; 53 45
	eor ($FA.b,S),Y		; 53 FA
	ldy $AACB.w,X		; BC CB AA
	sbc $6614B2.l,X		; FF B2 14 66
	eor $65.b		; 45 65
	bmi -69.b		; 30 BB
	wai		; CB
	tsx		; BA
	ldx $04.b,Y		; B6 04
	ora ($42.b,X)		; 01 42
	ora $EB0E11.l		; 0F 11 0E EB
	sbc ($B6.b),Y		; F1 B6
	sbc $1440F0.l,X		; FF F0 40 14
	and $FE2E01.l		; 2F 01 2E FE
	lda ($DA.b)		; B2 DA
	tyx		; BB
	tyx		; BB
	ldx $45EF.w		; AE EF 45
	eor $56.b		; 45 56
	ldx $EE.b,Y		; B6 EE
	sbc $00D0.w,X		; FD D0 00
	sbc $2F0540.l,X		; FF 40 05 2F
	ldx $11.b,Y		; B6 11
	asl $ECEF.w,X		; 1E EF EC
	sbc ($0F.b),Y		; F1 0F
	pea $B6F1.w		; F4 F1 B6
	eor ($F1.b)		; 52 F1
	ora ($EE.b),Y		; 11 EE
	sbc $EF11BF.l,X		; FF BF 11 EF
	ldx $4F.b,Y		; B6 4F
	ora $2F.b,X		; 15 2F
	ora ($0E.b)		; 12 0E
	cpx #$F1FA.w		; E0 FA F1
	ldx $1E.b,Y		; B6 1E
	pea $42F1.w		; F4 F1 42
	ora ($20.b,X)		; 01 20
	sbc $B601.w		; ED 01 B6
	lda $EF21.w		; AD 21 EF
	and $123F14.l,X		; 3F 14 3F 12
	asl $10B2.w		; 0E B2 10
	bit $DB9C.w,X		; 3C 9C DB
	ldx $25DE.w,Y		; BE DE 25
	eor $B6.b		; 45 B6
	and ($ED.b,X)		; 21 ED
	pea $329B.w		; F4 9B 32
	cmp $B6143F.l,X		; DF 3F 14 B6
	bmi   2.b		; 30 02
	asl $4AC0.w,X		; 1E C0 4A
	lda $2D.b,S		; A3 2D
	ora ($B6.b,X)		; 01 B6
	ora ($33.b,X)		; 01 33
	ora ($13.b,X)		; 01 13
	jmp.w [$B904]		; DC 04 B9
	and $B6.b,S		; 23 B6
	bne  16.b		; D0 10
	ora ($30.b,S),Y		; 13 30
	ora ($3E.b),Y		; 11 3E
	bcs  91.b		; B0 5B
	ldx $92.b,Y		; B6 92
	rol $01F1.w		; 2E F1 01
	and ($10.b)		; 32 10
	trb $EA.b		; 14 EA
	lda ($05.b)		; B2 05
	ora $CBAD.w,Y		; 19 AD CB
	cpy $24E1.w		; CC E1 24
	mvp $76,$B2		; 44 B2 76
	brk $52.b		; 00 52
	tax		; AA
	cmp $CEBC.w,X		; DD BC CE
	cop $B2.b		; 02 B2
	mvp $60,$47		; 44 47 60
	ora $2A.b		; 05 2A
	sta $BCDC.w,X		; 9D DC BC
	ldx $22.b,Y		; B6 22
	ora ($F1.b,S),Y		; 13 F1
	bmi -65.b		; 30 BF
	lsr $319D.w,X		; 5E 9D 31
	ldx $EF.b,Y		; B6 EF
	cop $21.b		; 02 21
	bmi   3.b		; 30 03
	trb $09E4.w		; 1C E4 09
	ldx $96.b		; A6 96
	tsa		; 3B
	sbc $011563.l		; EF 63 15 01
	eor ($CB.b),Y		; 51 CB
	ldx $31.b,Y		; B6 31
	stz $EF31.w		; 9C 31 EF
	sbc ($11.b,S),Y		; F3 11
	and ($02.b,X)		; 21 02
	ldx $1F.b,Y		; B6 1F
	sep #$0B		; E2 0B
.INDEX 16
	rep #$1E		; C2 1E
	sbc $B20231.l,X		; FF 31 02 B2
	and ($45.b,S),Y		; 33 45
	eor $34.b,S		; 43 34
	xba		; EB
	dec $BEDC.w,X		; DE DC BE
	ldx $10.b,Y		; B6 10
	jsl $001F02.l		; 22 02 1F 00
	phd		; 0B
	cmp ($1F.b),Y		; D1 1F
	ldx $CE.b		; A6 CE
	eor ($F4.b,S),Y		; 53 F4
	and ($22.b),Y		; 31 22
	ora ($FF.b),Y		; 11 FF
	sta $12A6.w,Y		; 99 A6 12
	sbc $3ED5.w		; ED D5 3E
	eor ($21.b,S),Y		; 53 21
	and ($3F.b,X)		; 21 3F
	ldx $CB.b		; A6 CB
	sta ($2E.b),Y		; 91 2E
	cmp $D544.w		; CD 44 D5
	and ($12.b)		; 32 12
	ldx $24.b		; A6 24
	ora #$22C9.w		; 09 C9 22
	jmp.w [$3DD4]		; DC D4 3D
	mvn $10,$B6		; 54 B6 10
	cop $21.b		; 02 21
	ldx $2DD1.w,Y		; BE D1 2D
	inc $B621.w,X		; FE 21 B6
	sbc ($31.b)		; F2 31
	brk $23.b		; 00 23
	and #$12FD.w		; 29 FD 12
	dec $E2B6.w,X		; DE B6 E2
	ora $020123.l,X		; 1F 23 01 02
	and ($AE.b)		; 32 AE
	cmp ($B6.b,X)		; C1 B6
	and $12EE.w,X		; 3D EE 12
	sbc $21.b,S		; E3 21
	brk $24.b		; 00 24
	rol A		; 2A
	ldx $AA.b		; A6 AA
	and [$9B.b]		; 27 9B
	cmp ($2E.b)		; D2 2E
	lsr $20.b		; 46 20
	pea $52B6.w		; F4 B6 52
	ldy $5DD0.w,X		; BC D0 5D
	dec $F211.w,X		; DE 11 F2
	jsl $26F0B6.l		; 22 B6 F0 26
	tas		; 1B
	cmp $DC05.w		; CD 05 DC
	sbc ($1F.b,X)		; E1 1F
	ldx $23.b,Y		; B6 23
	and $CB71F2.l		; 2F F2 71 CB
	cmp ($5E.b,X)		; C1 5E
	lda $0200B6.l,X		; BF B6 00 02
	and ($FF.b)		; 32 FF
	and [$1D.b]		; 27 1D
	ldy $B606.w,X		; BC 06 B6
	nop		; EA
	beq   0.b		; F0 00
	jsl $71D330.l		; 22 30 D3 71
	stp		; DB
.ACCU 16
	rep #$EE		; C2 EE
	ora ($DD.b),Y		; 11 DD
	cmp $01DF.w,X		; DD DF 01
	ora $2DB615.l,X		; 1F 15 B6 2D
	cmp #$0925.w		; C9 25 09
	beq -30.b		; F0 E2
	and ($40.b,X)		; 21 40
.ACCU 16
.INDEX 16
	rep #$F1		; C2 F1
	eor $31.b,X		; 55 31
	inc $ED11.w		; EE 11 ED
	jmp.w [$C6DF]		; DC DF C6
	cop $1D.b		; 02 1D
	bit $0F.b		; 24 0F
	jsr ($0D03.w,X)		; FC 03 0D
	beq -62.b		; F0 C2
	cmp $12FF.w		; CD FF 12
	sbc ($55.b,X)		; E1 55
	.db $42, $EE		; 42 EE
	ora ($C2.b),Y		; 11 C2
	sbc $DFDC.w		; ED DC DF
	sbc ($2E.b),Y		; F1 2E
	ora $54.b,X		; 15 54
	rol $03C6.w,X		; 3E C6 03
	trb $E1F0.w		; 1C F0 E1
	jsr $C321.w		; 20 21 C3
	rti		; 40

	dec $0F.b		; C6 0F
	bcs  48.b		; B0 30
	cmp $0212FF.l,X		; DF FF 12 02
	trb $25C2.w		; 1C C2 25
	mvp $E1,$3E		; 44 3E E1
	ora $FFCDDC.l,X		; 1F DC CD FF
.INDEX 16
	rep #$12		; C2 12
.INDEX 8
	sep #$54		; E2 54
	eor $FE.b,S		; 43 FE
	ora ($FE.b),Y		; 11 FE
	cpy $DEC2.w		; CC C2 DE
	sbc ($1E.b),Y		; F1 1E
	and $44.b		; 25 44
	and $C210E1.l,X		; 3F E1 10 C2
	stp		; DB
	lda $11EF.w,X		; BD EF 11
.INDEX 8
	sep #$54		; E2 54
	eor $FE.b,S		; 43 FE
	ldx $60.b,Y		; B6 60
	xce		; FB
	ldy #$32.b		; A0 32
	bit $FC.b		; 24 FC
	adc $01.b		; 65 01
.ACCU 16
.INDEX 16
	rep #$3F		; C2 3F
	cpx #$EB10.w		; E0 10 EB
	lda $10EF.w,X		; BD EF 10
	sbc ($B6.b)		; F2 B6
	bvc  31.b		; 50 1F
	sta $FB32.w,X		; 9D 32 FB
	sta ($31.b),Y		; 91 31
	and $B6.b		; 25 B6
	inc $1154.w		; EE 54 11
	plx		; FA
	cmp $20.b,S		; C3 20
	lda #$B613.w		; A9 13 B6
	ora ($4E.b,S),Y		; 13 4E
	sbc $32.b,X		; F5 32
	asl $14BC.w,X		; 1E BC 14
	plx		; FA
	ldx $91.b,Y		; B6 91
	bmi  67.b		; 30 43
	cpx #$2152.w		; E0 52 21
	xce		; FB
	cmp ($B6.b,X)		; C1 B6
	eor $04139A.l		; 4F 9A 13 04
	jsr $2204.w		; 20 04 22
	and $DCB6.w		; 2D B6 DC
	tsb $F9.b		; 04 F9
	ldx #$5120.w		; A2 20 51
	brk $42.b		; 00 42
	ldx $22.b,Y		; B6 22
	cmp $4FB1.w,X		; DD B1 4F
	txs		; 9A
	and ($14.b,X)		; 21 14
	ora ($B6.b),Y		; 11 B6
	ora $31.b,S		; 03 31
	and $23EA.w		; 2D EA 23
	nop		; EA
	lda ($12.b),Y		; B1 12
	ldx $40.b,Y		; B6 40
	and ($22.b,X)		; 21 22
	and ($CF.b)		; 32 CF
	ldx #$BA2E.w		; A2 2E BA
	ldx $20.b,Y		; B6 20
	bit $03.b		; 24 03
	cop $23.b		; 02 23
	ora $3109.w,X		; 1D 09 31
	ldx $DB.b,Y		; B6 DB
	cmp ($F4.b,X)		; C1 F4
	bmi  48.b		; 30 30
	jsl $B6D031.l		; 22 31 D0 B6
	sta ($0D.b,S),Y		; 93 0D
	cpy NMITIMEN.w		; CC 00 42
	ora ($11.b,S),Y		; 13 11
	and $B6.b,S		; 23 B6
	asl $4EFA.w		; 0E FA 4E
	cpx $05EE.w		; EC EE 05
	ora ($30.b)		; 12 30
	ldx $12.b,Y		; B6 12
	and $CFB30E.l,X		; 3F 0E B3 CF
	dec $50D1.w,X		; DE D1 50
	ldx $33.b,Y		; B6 33
	ora ($23.b,X)		; 01 23
	sbc ($CD.b),Y		; F1 CD
	pld		; 2B
	inc $B6ED.w,X		; FE ED B6
	and $14.b,S		; 23 14
	jsr $2E13.w		; 20 13 2E
	bit $AFD2.w		; 2C D2 AF
	ldx $0E.b,Y		; B6 0E
	lda ($31.b,S),Y		; B3 31
	.db $42, $01		; 42 01
	and ($E1.b)		; 32 E1
	sbc $19B6.w		; ED B6 19
	sbc ($CC.b)		; F2 CC
	and ($24.b)		; 32 24
	jsr $1E13.w		; 20 13 1E
	ldx $2E.b,Y		; B6 2E
	bne -97.b		; D0 9F
	phk		; 4B
	cmp $22.b,S		; C3 22
	eor ($11.b),Y		; 51 11
	ldx $21.b,Y		; B6 21
	brk $ED.b		; 00 ED
	plx		; FA
	sbc $9D.b,X		; F5 9D
	and ($34.b)		; 32 34
	ldx $10.b,Y		; B6 10
	jsl $DE1E00.l		; 22 00 1E DE
	ldy #$D34A.w		; A0 4A D3
	ldx $23.b,Y		; B6 23
	eor ($03.b,X)		; 41 03
	bpl   2.b		; 10 02
	cmp $23DA.w,X		; DD DA 23
	ldx $9E.b,Y		; B6 9E
	and ($34.b)		; 32 34
	ora ($21.b),Y		; 11 21
	sbc ($3C.b),Y		; F1 3C
	cmp $A3B6.w,X		; DD B6 A3
	and $23D4.w,Y		; 39 D4 23
	and ($21.b),Y		; 31 21
	brk $13.b		; 00 13
	ldx $CD.b,Y		; B6 CD
	tyx		; BB
	.db $42, $AC		; 42 AC
	eor ($43.b),Y		; 51 43
	ora ($10.b)		; 12 10
	ldx $F3.b,Y		; B6 F3
	bit $D4CB.w		; 2C CB D4
	inc A		; 1A
	dec $13.b		; C6 13
	rti		; 40

	ldx $31.b,Y		; B6 31
	inc $CC51.w,X		; FE 51 CC
	ldx $AD41.w		; AE 41 AD
	eor ($B6.b),Y		; 51 B6
	.db $42, $22		; 42 22
	ora $BA0CE6.l,X		; 1F E6 0C BA
	ora $19.b,S		; 03 19
	ldx $E5.b,Y		; B6 E5
	ora ($22.b,S),Y		; 13 22
	and ($EE.b),Y		; 31 EE
	bvs -54.b		; 70 CA
	lda ($C2.b),Y		; B1 C2
	sbc $01EFCB.l		; EF CB EF 01
	and ($32.b,S),Y		; 33 32
	ora $42.b,X		; 15 42
	ldx $9C.b,Y		; B6 9C
	ora ($1A.b),Y		; 11 1A
	ora $23.b,S		; 03 23
	trb $2F.b		; 14 2F
	bne -62.b		; D0 C2
	mvn $CE,$1E		; 54 1E CE
	inc $EFCC.w		; EE CC EF
	ora ($34.b,X)		; 01 34
.ACCU 16
.INDEX 16
	rep #$31		; C2 31
	and $41.b		; 25 41
	jmp.w [$ECEE]		; DC EE EC
	dec $C2F0.w		; CE F0 C2
	ora ($43.b,S),Y		; 13 43
	ora ($54.b)		; 12 54
	ora $EECE.w,X		; 1D CE EE
	jmp.w [$EFC2]		; DC C2 EF
	ora ($34.b,X)		; 01 34
	jsr $3125.w		; 20 25 31
	jmp.w [$C2EE]		; DC EE C2
	sbc $F0DE.w		; ED DE F0
	ora ($42.b,S),Y		; 13 42
	cop $53.b		; 02 53
	ora $E3B6.w,X		; 1D B6 E3
	sbc $03130F.l,X		; FF 0F 13 03
	.db $42, $CE		; 42 CE
	mvp $EC,$B6		; 44 B6 EC
	stz $F14E.w,X		; 9E 4E F1
	sbc ($30.b,X)		; E1 30
	bit $1C.b,X		; 34 1C
	ldx $F4.b,Y		; B6 F4
	rol $E4C9.w,X		; 3E C9 E4
	sbc $03042E.l		; EF 2E 04 03
	ldx $41.b,Y		; B6 41
	cmp $BEDC43.l		; CF 43 DC BE
	eor $E002.w		; 4D 02 E0
	lda ($F0.b)		; B2 F0
	and [$62.b]		; 27 62
	and $74.b		; 25 74
	phd		; 0B
	sta $B2BC.w,X		; 9D BC B2
	cpx $02BE.w		; EC BE 02
	adc $22.b,X		; 75 22
	eor [$40.b],Y		; 57 40
	lda $3EB6.w,Y		; B9 B6 3E
	ora ($FF.b),Y		; 11 FF
	jsl $03EE25.l		; 22 25 EE 03
	and $EBB6.w		; 2D B6 EB
	cmp ($F2.b)		; D2 F2
	ora $6D12E3.l,X		; 1F E3 12 6D
	cpx #$56B2.w		; E0 B2 56
	and ($CA.b,X)		; 21 CA
	ldy $DCEE.w,X		; BC EE DC
	cpx #$B227.w		; E0 27 B2
	and ($25.b)		; 32 25
	eor ($2C.b)		; 52 2C
	tax		; AA
	cmp $B6CEEE.l		; CF EE CE B6
	jsl $30005C.l		; 22 5C 00 30
	cmp ($AE.b),Y		; D1 AE
	sbc ($3F.b)		; F2 3F
	lda ($EC.b)		; B2 EC
	sbc $253336.l,X		; FF 36 33 25
	eor ($2D.b,X)		; 41 2D
	lda $76A6.w,Y		; B9 A6 76
	cmp ($C4.b,X)		; C1 C4
	ora [$5C.b]		; 07 5C
	ora $B6B34F.l		; 0F 4F B3 B6
	ldx $3DD5.w,Y		; BE D5 3D
	ora $F04110.l,X		; 1F 10 41 F0
	cop $B6.b		; 02 B6
	inc $DD2B.w,X		; FE 2B DD
	adc $C2.b,S		; 63 C2
.ACCU 8
.INDEX 8
	sep #$F4		; E2 F4
	bpl -74.b		; 10 B6
	beq  46.b		; F0 2E
	sbc ($CD.b),Y		; F1 CD
	cmp [$3C.b]		; C7 3C
	and $32B600.l		; 2F 00 B6 32
	ora $1DFF01.l		; 0F 01 FF 1D
	cpy $C273.w		; CC 73 C2
	ldx $00.b,Y		; B6 00
	sbc ($11.b,S),Y		; F3 11
	sbc $CCF22F.l,X		; FF 2F F2 CC
	cmp [$A6.b],Y		; D7 A6
	eor $FD31.w,Y		; 59 31 FD
	mvn $D2,$3D		; 54 3D D2
	sbc $CDB639.l,X		; FF 39 B6 CD
	adc $D1.b,S		; 63 D1
	bpl -30.b		; 10 E2
	jsl $B21FFE.l		; 22 FE 1F B2
	ora ($FA.b)		; 12 FA
	sta $1E021E.l,X		; 9F 1E 02 1E
	cop $53.b		; 02 53
	lda ($01.b)		; B2 01
	ora ($2F.b),Y		; 11 2F
	lda #$F1.b		; A9 F1
	cpx #$21.b		; E0 21
	sbc $ED24B6.l,X		; FF B6 24 ED
	bpl   2.b		; 10 02
	wai		; CB
	tsb $2E.b		; 04 2E
	ora ($B2.b)		; 12 B2
	asl $52E1.w,X		; 1E E1 52
	beq  17.b		; F0 11
	and $B6E0AB.l		; 2F AB E0 B6
.ACCU 8
	sep #$20		; E2 20
	dec $DC36.w,X		; DE 36 DC
	ora ($01.b),Y		; 11 01
	nop		; EA
	lda ($CE.b)		; B2 CE
	asl $3003.w		; 0E 03 30
	bne  99.b		; D0 63
	beq   1.b		; F0 01
	ldx $1D.b,Y		; B6 1D
	lda ($21.b)		; B2 21
	sbc ($20.b)		; F2 20
	cpx $DB37.w		; EC 37 DB
	lda ($F1.b)		; B2 F1
	ora ($09.b)		; 12 09
	cmp $3203FE.l,X		; DF FE 03 32
	cmp $EF74B2.l		; CF B2 74 EF
	ora ($20.b),Y		; 11 20
	lda $E00E.w		; AD 0E E0
	and ($B2.b,S),Y		; 33 B2
	bit $4EE6.w		; 2C E6 4E
	sbc ($12.b,X)		; E1 12
	ora #$D1.b		; 09 D1
	inc $03B2.w		; EE B2 03
	and ($CD.b,S),Y		; 33 CD
	stz $EE.b		; 64 EE
	ora ($20.b),Y		; 11 20
	stz $2EB2.w		; 9C B2 2E
	cpx #$43.b		; E0 43
	eor $4EC6.w		; 4D C6 4E
	sbc ($21.b,X)		; E1 21
	lda ($19.b)		; B2 19
.ACCU 16
.INDEX 16
	rep #$FD		; C2 FD
	tsb $24.b		; 04 24
	jmp.w [$ED54]		; DC 54 ED
	lda ($12.b)		; B2 12
	ora ($9B.b),Y		; 11 9B
	and $4E42CF.l		; 2F CF 42 4E
	ldy $B6.b,X		; B4 B6
	asl A		; 0A
	sbc ($2E.b,S),Y		; F3 2E
	ora $EC17.w,Y		; 19 17 EC
	rol $E2.b		; 26 E2
	lda ($FC.b)		; B2 FC
	and $FD.b,X		; 35 FD
	cop $01.b		; 02 01
	tsx		; BA
	and ($DE.b,X)		; 21 DE
	ldx $5F.b,Y		; B6 5F
	ora $3BC5.w,X		; 1D C5 3B
.ACCU 8
.INDEX 8
	sep #$3D		; E2 3D
	rol A		; 2A
	sbc [$B2.b],Y		; F7 B2
	ora $32E4.w,X		; 1D E4 32
	ora $0D14.w,X		; 1D 14 0D
	sbc ($01.b)		; F2 01
	lda ($CA.b)		; B2 CA
	ora ($EE.b)		; 12 EE
	mvp $E1,$32		; 44 32 E1
	rti		; 40

	sbc $1D20B2.l		; EF B2 20 1D
	ldy #$2E.b		; A0 2E
	sbc $32.b,S		; E3 32
	rol $B203.w		; 2E 03 B2
	asl $00E1.w		; 0E E1 00
	xba		; EB
	sbc ($EF.b)		; F2 EF
	and ($21.b,S),Y		; 33 21
	ldx $C3.b		; A6 C3
	jmp $6ECF.w		; 4C CF 6E
	sbc $7AA5.w,X		; FD A5 7A
	asl $B2.b,X		; 16 B2
	and ($10.b,S),Y		; 33 10
	ora ($0F.b)		; 12 0F
	cpx #$0F.b		; E0 0F
	jsr ($A2D1.w,X)		; FC D1 A2
	bne  84.b		; D0 54
	adc ($12.b,X)		; 61 12
	bmi  -6.b		; 30 FA
	beq -51.b		; F0 CD
	ldx $A1.b		; A6 A1
	adc $E345.w,X		; 7D 45 E3
	lda ($20.b),Y		; B1 20
	cmp ($A3.b),Y		; D1 A3
	ldx $3B.b		; A6 3B
	rol A		; 2A
	sbc [$E3.b],Y		; F7 E3
	lsr $223B.w,X		; 5E 3B 22
	phd		; 0B
	ldx $2A.b		; A6 2A
	ora $A4.b,X		; 15 A4
	ldy $3661.w		; AC 61 36
	cmp $D0.b,S		; C3 D0
	ldx $4F.b		; A6 4F
	ldy $AE.b		; A4 AE
	adc $A45B.w,Y		; 79 5B A4
	eor $6C.b,S		; 43 6C
	ldx $1F.b,Y		; B6 1F
	cop $0D.b		; 02 0D
	asl $D2D5.w,X		; 1E D5 D2
	sbc $B613.w		; ED 13 B6
	jsl $300FF0.l		; 22 F0 0F 30
	cmp ($ED.b,X)		; C1 ED
	eor $B22E.w,X		; 5D 2E B2
	plb		; AB
	sbc ($43.b),Y		; F1 43
	jsl $1F4013.l		; 22 13 40 1F
	bcs -74.b		; B0 B6
.ACCU 8
.INDEX 8
	sep #$FB		; E2 FB
	tsb $32.b		; 04 32
	asl $221F.w		; 0E 1F 22
	cpy #$B2.b		; C0 B2
	phd		; 0B
	asl $AA0F.w		; 0E 0F AA
	sbc ($34.b)		; F2 34
	ora ($13.b)		; 12 13
	ldx $2D.b,Y		; B6 2D
	sbc $19E1B5.l,X		; FF B5 E1 19
	tsb $41.b		; 04 41
	and $00B6.w		; 2D B6 00
	ora ($EF.b)		; 12 EF
	cpx $204E.w		; EC 4E 20
	lda $36B254.l		; AF 54 B2 36
	jsl $1F5323.l		; 22 23 53 1F
	ldx $09EF.w,Y		; BE EF 09
	ldx $E6.b,Y		; B6 E6
	eor ($3D.b,X)		; 41 3D
	sbc ($03.b),Y		; F1 03
	inc $3FDC.w,X		; FE DC 3F
	ldx $20.b,Y		; B6 20
	ldx $1355.w		; AE 55 13
	cmp $EC2020.l,X		; DF 20 20 EC
	ldx $D2.b,Y		; B6 D2
	sbc ($0A.b)		; F2 0A
	dec $51.b,X		; D6 51
	rol $01E2.w,X		; 3E E2 01
	ldx $2D.b,Y		; B6 2D
	cmp $302F.w		; CD 2F 30
	lda $1355.w		; AD 55 13
	sbc $20B6.w,X		; FD B6 20
	ora ($DA.b,S),Y		; 13 DA
	sbc ($F4.b,X)		; E1 F4
	plx		; FA
	cmp $61.b,X		; D5 61
	ldx $3F.b,Y		; B6 3F
	sbc ($01.b,X)		; E1 01
	rol $1F9E.w,X		; 3E 9E 1F
	eor $65B69E.l		; 4F 9E B6 65
	ora ($0D.b,S),Y		; 13 0D
	ora ($04.b),Y		; 11 04
	cmp $F4E1.w,Y		; D9 E1 F4
	ldx $EA.b,Y		; B6 EA
	inc $42.b		; E6 42
	bmi -32.b		; 30 E0
	ora ($5C.b,X)		; 01 5C
	sta $10B6.w,X		; 9D B6 10
	rol $54AF.w,X		; 3E AF 54
	and $0F.b,S		; 23 0F
	sbc ($15.b),Y		; F1 15
.ACCU 16
	rep #$2E		; C2 2E
	dec $FCE0.w,X		; DE E0 FC
	cmp $323302.l		; CF 02 33 32
	ldx $02.b,Y		; B6 02
	tad		; 5B
	stz $3D20.w		; 9C 20 3D
	bcs  83.b		; B0 53
	bit $B6.b		; 24 B6
	brk $E0.b		; 00 E0
	and $B9.b		; 25 B9
	rep #$02		; C2 02
	stp		; DB
	ora $B6.b,X		; 15 B6
	and $41.b,S		; 23 41
	inc $5BF3.w,X		; FE F3 5B
	plb		; AB
	ora ($1D.b),Y		; 11 1D
	ldx $C1.b,Y		; B6 C1
	eor ($25.b)		; 52 25
	bpl -18.b		; 10 EE
	eor $AB.b		; 45 AB
	ldx #$B6.b		; A2 B6
	ora ($DC.b,X)		; 01 DC
	bit $22.b		; 24 22
	eor ($FE.b)		; 52 FE
	cpx $4B.b		; E4 4B
	ldx $BA.b,Y		; B6 BA
	ora ($0D.b),Y		; 11 0D
	cmp ($42.b)		; D2 42
	and $20.b		; 25 20
	inc $43B6.w		; EE B6 43
	tyx		; BB
	lda ($10.b,X)		; A1 10
	dec $1333.w		; CE 33 13
	eor ($B6.b,S),Y		; 53 B6
	inc $2BE5.w,X		; FE E5 2B
	lda $FD21.w,Y		; B9 21 FD
	cpx $30.b		; E4 30
	ldx $35.b,Y		; B6 35
	and $CA51EE.l,X		; 3F EE 51 CA
	lda ($2E.b,X)		; A1 2E
	cpy #$B6.b		; C0 B6
	and ($03.b,S),Y		; 33 03
	adc $FE.b,S		; 63 FE
	sbc $FD.b,X		; F5 FD
	tsx		; BA
	cop $B6.b		; 02 B6
	cmp $3F04.w,X		; DD 04 3F
	and [$20.b],Y		; 37 20
	bne  78.b		; D0 4E
	xba		; EB
	ldx $AF.b,Y		; B6 AF
	and $33D2.w		; 2D D2 33
	sbc ($72.b,S),Y		; F3 72
	inc $B613.w,X		; FE 13 B6
	sbc $F2CA.w		; ED CA F2
	cmp $2023.w,X		; DD 23 20
	and [$2F.b],Y		; 37 2F
	ldx $F1.b,Y		; B6 F1
	asl $AEEC.w,X		; 1E EC AE
	and $41E2.w		; 2D E2 41
	tsb $B6.b		; 04 B6
	adc ($FF.b)		; 72 FF
	and $D1DAEE.l		; 2F EE DA D1
	inc $B624.w		; EE 24 B6
	ora ($56.b,X)		; 01 56
	ora $EEEE11.l,X		; 1F 11 EE EE
	sta $C22E.w,X		; 9D 2E C2
	ldy $F2FE.w,X		; BC FE F2
	eor $45.b		; 45 45
	eor ($21.b,S),Y		; 53 21
	tsb $D2B6.w		; 0C B6 D2
	cpx #$14.b		; E0 14
	ora ($65.b,X)		; 01 65
	ora $C2CE30.l,X		; 1F 30 CE C2
	ora ($CA.b),Y		; 11 CA
	wai		; CB
	ldy $02EE.w,X		; BC EE 02
	mvp $C6,$46		; 44 46 C6
	sbc $0B0F.w,X		; FD 0F 0B
	sbc ($00.b,X)		; E1 00
	ora ($02.b),Y		; 11 02
	jsl $2F10C6.l		; 22 C6 10 2F
	cmp $2FBE1F.l,X		; DF 1F BE 2F
	sbc ($10.b)		; F2 10
.INDEX 16
	rep #$13		; C2 13
	mvp $51,$57		; 44 57 51
	ora ($0B.b)		; 12 0B
	txy		; 9B
	wai		; CB
.INDEX 16
	rep #$DD		; C2 DD
	sbc ($34.b,X)		; E1 34
	lsr $75.b		; 46 75
	bpl  47.b		; 10 2F
	lda $40B6.w,Y		; B9 B6 40
	cpx $03.b		; E4 03
	mvp $41,$22		; 44 22 41
	sbc #$C6E5.w		; E9 E5 C6
	cpy $00F1.w		; CC F1 00
	bpl  34.b		; 10 22
	and ($12.b,X)		; 21 12
	ora $2E10C2.l		; 0F C2 10 2E
	tax		; AA
	wai		; CB
	lda $13D0.w,X		; BD D0 13
	eor $C6.b		; 45 C6
	jsr $02FC.w		; 20 FC 02
	lda $E1F2.w,X		; BD F2 E1
	bpl  49.b		; 10 31
	dec $21.b		; C6 21
	and ($0F.b,X)		; 21 0F
	cmp ($0C.b,X)		; C1 0C
	bne  30.b		; D0 1E
	ora ($C6.b),Y		; 11 C6
	ora ($12.b)		; 12 12
	and ($10.b,X)		; 21 10
	jsr ($BE10.w,X)		; FC 10 BE
	brk $C6.b		; 00 C6
.INDEX 8
	sep #$11		; E2 11
	jsr $2131.w		; 20 31 21
	beq -63.b		; F0 C1
	jsr ($BBC2.w,X)		; FC C2 BB
	tsx		; BA
	cmp $13F1.w		; CD F1 13
	lsr $65.b,X		; 56 65
	eor ($B6.b),Y		; 51 B6
	tsb $1E9E.w		; 0C 9E 1E
	cpy $23.b		; C4 23
	and ($55.b),Y		; 31 55
	jsr $0FB6.w		; 20 B6 0F
	lda $CCF1AB.l,X		; BF AB F1 CC
	mvp $06,$32		; 44 32 06
	ldx $61.b,Y		; B6 61
	beq  11.b		; F0 0B
	nop		; EA
	cpy #$0B.b		; C0 0B
	pei ($52.b)		; D4 52
	rep #$01		; C2 01
	lsr $65.b		; 46 65
	eor $31.b,X		; 55 31
	jmp.w [$A9DC]		; DC DC A9
	ldx $46.b,Y		; B6 46
	ora ($26.b),Y		; 11 26
	adc $A91CF1.l		; 6F F1 1C A9
	cop $C2.b		; 02 C2
	dex		; CA
	txy		; 9B
	sbc $5447F1.l,X		; FF F1 47 54
	lsr $3F.b,X		; 56 3F
	rep #$CD		; C2 CD
	cpx $CFA9.w		; EC A9 CF
	sbc $457514.l,X		; FF 14 75 45
	dec $2E.b		; C6 2E
	lda $DD12.w,X		; BD 12 DD
	sbc ($3F.b,S),Y		; F3 3F
	ora $32.b,S		; 03 32
	dec $FF.b		; C6 FF
	ora ($EB.b)		; 12 EB
.ACCU 16
	rep #$2D		; C2 2D
	cmp $C2F033.l,X		; DF 33 F0 C2
	and $64.b		; 25 64
	and $74.b,X		; 35 74
	stp		; DB
	sbc $C29DC9.l		; EF C9 9D C2
	inc $56F2.w,X		; FE F2 56
	eor $57.b,S		; 43 57
	eor $FCBF.w		; 4D BF FC
	dec $C0.b		; C6 C0
	.db $42, $E1		; 42 E1
	eor $0F.b,S		; 43 0F
	sbc ($2D.b,S),Y		; F3 2D
	stz $FFC2.w,X		; 9E C2 FF
	cmp #$FD9D.w		; C9 9D FD
	sbc ($65.b,S),Y		; F3 65
	and ($57.b)		; 32 57
.ACCU 16
.INDEX 16
	rep #$3C		; C2 3C
	lda $EF99FC.l,X		; BF FC 99 EF
	cmp $C65346.l,X		; DF 46 53 C6
	ora $2C.b,S		; 03 2C
	ldx $DC40.w		; AE 40 DC
	tsb $1E.b		; 04 1E
	and $C6.b		; 25 C6
	and $CA42FF.l		; 2F FF 42 CA
	cpx $0D.b		; E4 0D
	cmp ($31.b,X)		; C1 31
	dec $E2.b		; C6 E2
	eor ($FE.b)		; 52 FE
	tsb $2C.b		; 04 2C
	ldx $DC40.w		; AE 40 DC
.ACCU 16
	rep #$AE		; C2 AE
	cpx $54F4.w		; EC F4 54
	jsl $CF3D67.l		; 22 67 3D CF
	rep #$0D		; C2 0D
	txs		; 9A
	inc $45C0.w		; EE C0 45
	.db $42, $26		; 42 26
	adc ($C2.b)		; 72 C2
	jmp.w [$D9FF]		; DC FF D9
	ldx $04DC.w		; AE DC 04
	mvn $C2,$22		; 54 22 C2
	ror $2D.b		; 66 2D
	cmp $ED9B0D.l,X		; DF 0D 9B ED
	cpy #$C245.w		; C0 45 C2
	and ($26.b),Y		; 31 26
	.db $62, $ED, $F0		; 62 ED F0
	phx		; DA
	ldx $C6DC.w,Y		; BE DC C6
	mvp $E1,$1F		; 44 1F E1
	rti		; 40

	cmp $1EF1.w		; CD F1 1E
	cmp ($C6.b,X)		; C1 C6
	and $EE41F4.l		; 2F F4 41 EE
	bit $FD.b		; 24 FD
	cmp $EBC211.l,X		; DF 11 C2 EB
	ldx $14DC.w,Y		; BE DC 14
	eor ($13.b,S),Y		; 53 13
	adc $2F.b		; 65 2F
.ACCU 16
	rep #$EE		; C2 EE
	inc $DCBB.w,X		; FE BB DC
	cpy #$3044.w		; C0 44 30
	rol $C2.b		; 26 C2
	.db $42, $0E		; 42 0E
	sbc $DCBDEC.l		; EF EC BD DC
	ora $43.b,S		; 03 43
	ldx $C4.b,Y		; B6 C4
	ror $D0DC.w		; 6E DC D0
	asl $2FCE.w,X		; 1E CE 2F
	sbc [$B6.b],Y		; F7 B6
	adc $CD.b,S		; 63 CD
	lsr $ED.b		; 46 ED
	jmp.w [$ED01]		; DC 01 ED
	cpx #$0FB6.w		; E0 B6 0F
	ror $2D.b,X		; 76 2D
	pei ($4F.b)		; D4 4F
	cpx $1EDF.w		; EC DF 1E
	ldx $EF.b,Y		; B6 EF
	sbc $CE5316.l,X		; FF 16 53 CE
	mvp $CE,$FF		; 44 FF CE
	ldx $E1.b,Y		; B6 E1
	inc $F1EF.w		; EE EF F1
	adc $3C.b		; 65 3C
	cpx $3F.b		; E4 3F
	ldx $0C.b,Y		; B6 0C
	inc $0E0E.w		; EE 0E 0E
	sbc $CF6215.l		; EF 15 62 CF
	ldx $33.b,Y		; B6 33
	sbc ($CF.b),Y		; F1 CF
	bne -32.b		; D0 E0
	inc $55E2.w		; EE E2 55
	ldx $59.b		; A6 59
	inc $40.b		; E6 40
	and #$EDDC.w		; 29 DC ED
	trb $B6CB.w		; 1C CB B6
	and $43.b		; 25 43
	cpy #$0222.w		; C0 22 02
	cmp $B6F1EE.l		; CF EE F1 B6
	inc $44D2.w		; EE D2 44
	and $1002.w,X		; 3D 02 10
	and $B6EF.w,X		; 3D EF B6
	bne  14.b		; D0 0E
	sbc DMASRC2B.w		; ED 24 43
	bne  48.b		; D0 30
	ora $B6.b,S		; 03 B6
	dec $110B.w,X		; DE 0B 11
	cmp $3E43D1.l,X		; DF D1 43 3E
	ora $B6.b,S		; 03 B6
	beq  78.b		; F0 4E
	cpx #$0DA2.w		; E0 A2 0D
	sbc $2205.w,X		; FD 05 22
	ldx $F1.b,Y		; B6 F1
	and $1AFD04.l		; 2F 04 FD 1A
	and ($CF.b,X)		; 21 CF
	cpx #$E0B2.w		; E0 B2 E0
	jsl $653324.l		; 22 24 33 65
	and $DE.b,S		; 23 DE
	tas		; 1B
	ldx $FF.b,Y		; B6 FF
	sbc ($31.b,S),Y		; F3 31
	bpl  47.b		; 10 2F
	ora $1C.b,S		; 03 1C
	tas		; 1B
	lda ($E1.b)		; B2 E1
	dex		; CA
	tsx		; BA
	cmp $222302.l,X		; DF 02 23 22
	lsr $B2.b,X		; 56 B2
	jsl $9C2CFE.l		; 22 FE 2C 9C
	ldy $22E0.w,X		; BC E0 22
	and ($B2.b)		; 32 B2
	and $72.b		; 25 72
	and ($E2.b,X)		; 21 E2
	cmp $CECC.w,Y		; D9 CC CE
	sbc ($B6.b),Y		; F1 B6
	bpl   0.b		; 10 00
	and ($B0.b)		; 32 B0
	asl $A43C.w		; 0E 3C A4
	asl $12B6.w,X		; 1E B6 12
	ora ($F0.b)		; 12 F0
	ora ($3A.b,S),Y		; 13 3A
	ora ($E2.b,X)		; 01 E2
	phx		; DA
	ldx $31.b,Y		; B6 31
	sbc ($12.b,X)		; E1 12
	and $A03301.l		; 2F 01 33 A0
	rol $0FB6.w		; 2E B6 0F
	sta ($2D.b,S),Y		; 93 2D
	cop $22.b		; 02 22
	beq  19.b		; F0 13
	rol A		; 2A
	ldx $12.b,Y		; B6 12
	cpx #$23EA.w		; E0 EA 23
	cmp $022F22.l,X		; DF 22 2F 02
	ldx $32.b,Y		; B6 32
	lda ($20.b,X)		; A1 20
	inc $4DB1.w		; EE B1 4D
	sbc ($22.b),Y		; F1 22
	ldx $F0.b,Y		; B6 F0
	and ($1B.b)		; 32 1B
	ora ($1D.b)		; 12 1D
	cmp $EE04.w,X		; DD 04 EE
	lda ($DF.b)		; B2 DF
	bpl   3.b		; 10 03
	eor $00.b,X		; 55 00
	bit $1D.b,X		; 34 1D
	tyx		; BB
	lda ($0E.b)		; B2 0E
	cpy $F0E0.w		; CC E0 F0
	lsr $50.b		; 46 50
	ora $52.b,S		; 03 52
	lda ($DC.b)		; B2 DC
	lda $1FCEFD.l,X		; BF FD CE 1F
	ora $65.b		; 05 65
	brk $B6.b		; 00 B6
	and ($DA.b,S),Y		; 33 DA
	sbc $22DF40.l,X		; FF 40 DF 22
	sbc ($42.b),Y		; F1 42
	lda ($4F.b)		; B2 4F
	ora $63.b,S		; 03 63
	cpy $FDBF.w		; CC BF FD
	cmp $B6FE.w		; CD FE B6
	bit $3E.b		; 24 3E
	lda ($34.b),Y		; B1 34
	cmp $410E.w,Y		; D9 0E 41
	cmp $E0DFB2.l,X		; DF B2 DF E0
	lsr $5F.b		; 46 5F
	sbc ($74.b,S),Y		; F3 74
	jmp.w [$B6BF]		; DC BF B6
	ora $2EF0.w,X		; 1D F0 2E
	and ($3F.b,S),Y		; 33 3F
	ldy #$E944.w		; A0 44 E9
	lda ($CB.b)		; B2 CB
	beq -19.b		; F0 ED
	dec $47D0.w,X		; DE D0 47
	lsr $B6F3.w,X		; 5E F3 B6
	lsr $F49E.w,X		; 5E 9E F4
	asl $1FFF.w,X		; 1E FF 1F
	and ($4E.b,S),Y		; 33 4E
	ldx $91.b,Y		; B6 91
	eor $DB.b		; 45 DB
	cmp $F0DF42.l,X		; DF 42 DF F0
	ora $B2.b,S		; 03 B2
	and [$5D.b],Y		; 37 5D
	sbc $74.b,S		; E3 74
	jsr ($1EBF.w,X)		; FC BF 1E
	cmp $CCB2.w,X		; DD B2 CC
	ora ($75.b,S),Y		; 13 75
	dec $5037.w,X		; DE 37 50
	wai		; CB
	cop $B2.b		; 02 B2
	inc $C1EB.w		; EE EB C1
	rol $5D.b,X		; 36 5D
	cmp ($64.b,S),Y		; D3 64
	tsb $AFB2.w		; 0C B2 AF
	rol $ACEE.w		; 2E EE AC
	ora ($65.b,S),Y		; 13 65
	cmp $B246.w		; CD 46 B2
	rti		; 40

	wai		; CB
	sbc ($EE.b)		; F2 EE
	plx		; FA
	cmp ($36.b,X)		; C1 36
	jmp $1F07B6.l		; 5C B6 07 1F
	jmp.w [$2CE5]		; DC E5 2C
	ora ($A3.b,X)		; 01 A3
	eor ($B2.b)		; 52 B2
	stz $CD.b		; 64 CD
	eor $41.b,X		; 55 41
	phx		; DA
	cop $DF.b		; 02 DF
	sbc $C1B2.w,Y		; F9 B2 C1
	and $3C.b,X		; 35 3C
	cmp $43.b,X		; D5 43
	and $2EA0.w		; 2D A0 2E
	lda ($0F.b)		; B2 0F
	sta $6424.w,X		; 9D 24 64
	cmp $3253.w		; CD 53 32
	nop		; EA
	ldx $62.b,Y		; B6 62
.ACCU 16
	rep #$EB		; C2 EB
	and $21.b,X		; 35 21
	sbc $E117.w,Y		; F9 17 E1
	ldx $FD.b,Y		; B6 FD
	ldx $1D.b,Y		; B6 1D
	rol $52B3.w		; 2E B3 52
	ora $6EB6A0.l,X		; 1F A0 B6 6E
	ora ($CB.b),Y		; 11 CB
	adc ($D2.b,X)		; 61 D2
	cmp $1126.w,X		; DD 26 11
	ldx $FA.b,Y		; B6 FA
	ora $E2.b,X		; 15 E2
	trb $1EB5.w		; 1C B5 1E
	ora $B6E1.w,X		; 1D E1 B6
	adc ($00.b,X)		; 61 00
	lda ($4E.b,X)		; A1 4E
	jsl $E142CB.l		; 22 CB 42 E1
	ldx $C0.b,Y		; B6 C0
	asl $10.b		; 06 10
	phd		; 0B
	tsb $E2.b		; 04 E2
	tsa		; 3B
	cpy $B6.b		; C4 B6
	ora $51100C.l,X		; 1F 0C 10 51
	sbc ($C0.b),Y		; F1 C0
	and $F9A223.l		; 2F 23 A2 F9
	beq  28.b		; F0 1C
	sta $73B4.w,X		; 9D B4 73
	adc $B2C0.w		; 6D C0 B2
	sbc ($5F.b)		; F2 5F
	cmp $FEDC00.l		; CF 00 DC FE
	and $13.b,S		; 23 13
	ldx $CF.b,Y		; B6 CF
	and $209F34.l		; 2F 34 9F 20
	tas		; 1B
	ora ($F2.b,S),Y		; 13 F2
	lda ($21.b)		; B2 21
	and $6EF3EF.l,X		; 3F EF F3 6E
	sbc $B2BD00.l		; EF 00 BD B2
	bpl  18.b		; 10 12
	ora ($FD.b,S),Y		; 13 FD
	inc $EF46.w,X		; FE 46 EF
	beq -78.b		; F0 B2
	phd		; 0B
	sep #$01		; E2 01
	ora ($4F.b),Y		; 11 4F
	dec $5EE4.w		; CE E4 5E
	lda ($0F.b)		; B2 0F
	ora $1131BF.l		; 0F BF 31 11
	ora $FC.b,X		; 15 FC
	dec $54B2.w,X		; DE B2 54
	cpx #$EA00.w		; E0 00 EA
	tsb $10.b		; 04 10
	ora ($5D.b,X)		; 01 5D
	lda ($CD.b)		; B2 CD
	inc $4E.b,X		; F6 4E
	brk $FD.b		; 00 FD
	bcs  81.b		; B0 51
	brk $B2.b		; 00 B2
	asl $CC.b,X		; 16 CC
	cmp $1FE064.l,X		; DF 64 E0 1F
	stp		; DB
	asl $B2.b,X		; 16 B2
	ora $BC6BF2.l,X		; 1F F2 6B BC
	asl $3F.b		; 06 3F
	ora ($DC.b)		; 12 DC
	lda ($C2.b)		; B2 C2
	adc ($EF.b),Y		; 71 EF
	and $AB.b,X		; 35 AB
	lda ($52.b),Y		; B1 52
	cpx #$2CB2.w		; E0 B2 2C
	lda $1E47.w,X		; BD 47 1E
	sbc $4A.b,X		; F5 4A
	ldy $B225.w,X		; BC 25 B2
	and $E5BC13.l		; 2F 13 BC E5
	adc ($DF.b),Y		; 71 DF
	.db $62, $AA, $B2		; 62 AA B2
	cmp $41.b,S		; C3 41
.ACCU 8
	sep #$29		; E2 29
	ldx $1D66.w,Y		; BE 66 1D
	asl $B2.b		; 06 B2
	ora #$AD.b		; 09 AD
	and ($1E.b,S),Y		; 33 1E
	eor ($9C.b,X)		; 41 9C
	ora [$60.b]		; 07 60
	ldx $C4.b,Y		; B6 C4
	eor $54B0.w,Y		; 59 B0 54
	asl $B9E6.w		; 0E E6 B9
	eor $C2.b		; 45 C2
	eor $0E.b,S		; 43 0E
	ora ($FD.b,S),Y		; 13 FD
	bne  17.b		; D0 11
	ora $9DB22F.l		; 0F 2F B2 9D
	and [$60.b],Y		; 37 60
	cmp $4C.b,S		; C3 4C
	txs		; 9A
	ora ($3F.b)		; 12 3F
	ldx $05.b,Y		; B6 05
	txy		; 9B
	lsr $4F.b,X		; 56 4F
	lda $9D7F.w		; AD 7F 9D
	and $B2.b		; 25 B2
	ora ($E0.b,S),Y		; 13 E0
	jmp $679F.w		; 4C 9F 67
	rts		; 60

	pei ($2B.b)		; D4 2B
	lda ($9D.b)		; B2 9D
	ora ($3D.b),Y		; 11 3D
	ora ($C9.b,S),Y		; 13 C9
	asl $75.b		; 06 75
	inc $41B2.w,X		; FE B2 41
	sta $02D0.w,Y		; 99 D0 02
	cmp ($2C.b),Y		; D1 2C
	ldx #$B267.w		; A2 67 B2
	eor $9F19F4.l,X		; 5F F4 19 9F
	ora ($2D.b),Y		; 11 2D
	and ($BB.b,X)		; 21 BB
.ACCU 16
	rep #$23		; C2 23
	.db $42, $00		; 42 00
	jsr $F0CD.w		; 20 CD F0
	brk $E1.b		; 00 E1
	ldx $0A.b,Y		; B6 0A
	ora [$23.b],Y		; 17 23
	jmp.w [$D902]		; DC 02 D9
	bit $11.b		; 24 11
	ldx $EE.b,Y		; B6 EE
	eor $3C62B2.l		; 4F B2 62 3C
	sbc $B2922D.l		; EF 2D 92 B2
	beq  31.b		; F0 1F
	sbc ($FC.b,X)		; E1 FC
	tsb $67.b		; 04 67
	and ($02.b)		; 32 02
	ldx $C9.b,Y		; B6 C9
	bit $11.b,X		; 34 11
	cmp $33E43E.l,X		; DF 3E E4 33
	trb $1DB6.w		; 1C B6 1D
	ora $4193.w,X		; 1D 93 41
	trb $D0F4.w		; 1C F4 D0
	eor ($B6.b),Y		; 51 B6
	and ($C2.b),Y		; 31 C2
	bne -53.b		; D0 CB
	bit $2F.b		; 24 2F
	cmp $06B64D.l,X		; DF 4D B6 06
	ora $0D.b,S		; 03 0D
	and $B20C.w		; 2D 0C B2
	eor ($FC.b),Y		; 51 FC
	ldx $03.b,Y		; B6 03
	cmp ($5F.b)		; D2 5F
	bmi -31.b		; 30 E1
	sbc $B615CC.l		; EF CC 15 B6
	rol $3DC1.w		; 2E C1 3D
	mvp $FF,$F3		; 44 F3 FF
	asl $B6EC.w,X		; 1E EC B6
	cmp ($62.b,X)		; C1 62
	jmp.w [$E512]		; DC 12 E5
	and $B6013E.l,X		; 3F 3E 01 B6
	sbc $16DC.w		; ED DC 16
	ora $1FC2.w,X		; 1D C2 1F
	eor ($01.b,S),Y		; 53 01
	ldx $E1.b,Y		; B6 E1
	asl $C1DD.w,X		; 1E DD C1
	adc ($CC.b,X)		; 61 CC
	and ($F6.b),Y		; 31 F6
	ldx $30.b,Y		; B6 30
	asl $FC11.w		; 0E 11 FC
	xba		; EB
	rol $1C.b		; 26 1C
	lda ($B6.b,S),Y		; B3 B6
	ora ($53.b,X)		; 01 53
	ora $BE2FE1.l,X		; 1F E1 2F BE
	ldx #$B662.w		; A2 62 B6
	ldy $1530.w,X		; BC 30 15
	and ($DF.b)		; 32 DF
	ora ($FB.b)		; 12 FB
	nop		; EA
	ldx $36.b,Y		; B6 36
	tas		; 1B
	cmp $02.b,S		; C3 02
	eor $2D.b,S		; 43 2D
	sbc ($20.b),Y		; F1 20
	ldx $BC.b,Y		; B6 BC
	lda ($61.b,S),Y		; B3 61
	lda $2430.w		; AD 30 24
	.db $42, $B0		; 42 B0
	ldx $03.b,Y		; B6 03
	phd		; 0B
	wai		; CB
	rol $0A.b,X		; 36 0A
	cmp ($03.b,S),Y		; D3 03
	eor $B6.b,S		; 43 B6
	tsa		; 3B
	sbc ($31.b),Y		; F1 31
	plb		; AB
	cmp $60.b,S		; C3 60
	sta $33B621.l,X		; 9F 21 B6 33
	eor $AF.b,S		; 43 AF
	ora ($1B.b,S),Y		; 13 1B
	lda $0926.w		; AD 26 09
	ldx $F1.b,Y		; B6 F1
	and $34.b,S		; 23 34
	dec A		; 3A
.ACCU 8
.INDEX 8
	sep #$31		; E2 31
	lda $B6E3.w,Y		; B9 E3 B6
	eor $331290.l,X		; 5F 90 12 33
	eor $BD.b,S		; 43 BD
	and $1C.b,S		; 23 1C
	dec $CF.b		; C6 CF
	ora ($FD.b,S),Y		; 13 FD
	ora ($11.b,X)		; 01 11
	ora ($1E.b,S),Y		; 13 1E
	sbc ($C6.b,X)		; E1 C6
	jsr $F1FB.w		; 20 FB F1
	and $2110D0.l,X		; 3F D0 10 21
	and ($B2.b),Y		; 31 B2
	bvc  37.b		; 50 25
	adc ($A9.b,S),Y		; 73 A9
	bcs  -7.b		; B0 F9
	txy		; 9B
	cmp $4314C2.l,X		; DF C2 14 43
	ora ($23.b,X)		; 01 23
	and $0FCD.w		; 2D CD 0F
	cmp $10C6.w,X		; DD C6 10
	ora ($30.b)		; 12 30
	ora $1F02.w		; 0D 02 1F
	dec $B612.w		; CE 12 B6
	jsr ($12F2.w,X)		; FC F2 12
	and $1F.b,X		; 35 1F
	bcs  51.b		; B0 33
	sbc #$B6.b		; E9 B6
	lda ($4F.b),Y		; B1 4F
	cpy #$12.b		; C0 12
	ora ($51.b,S),Y		; 13 51
	tsb $B2F3.w		; 0C F3 B2
	adc $E9.b,X		; 75 E9
	ldx $ACDA.w		; AE DA AC
	dec $7627.w,X		; DE 27 76
	ldx $CF.b,Y		; B6 CF
	and $0A.b,S		; 23 0A
	ldy #$4E.b		; A0 4E
	cpx #$02.b		; E0 02
	tsb $B2.b		; 04 B2
	adc [$63.b]		; 67 63
	ora ($66.b,S),Y		; 13 66
	inc A		; 1A
	stz $ABCB.w,X		; 9E CB AB
	ldx $20.b,Y		; B6 20
	and $10.b,X		; 35 10
	cmp $AC1C13.l,X		; DF 13 1C AC
	eor $03FFB6.l,X		; 5F B6 FF 03
	pea $0D42.w		; F4 42 0D
	beq  50.b		; F0 32
	dex		; CA
	ldx $B5.b,Y		; B6 B5
	sbc $442F0F.l,X		; FF 0F 2F 44
	jsr $F3EF.w		; 20 EF F3
	ldx $3D.b,Y		; B6 3D
	tax		; AA
	eor $F2021F.l		; 4F 1F 02 F2
	eor $0E.b,S		; 43 0E
.ACCU 16
	rep #$21		; C2 21
	bit $2F.b		; 24 2F
	dec $EEEE.w		; CE EE EE
	inc $C202.w,X		; FE 02 C2
	and ($22.b,S),Y		; 33 22
	ora ($42.b)		; 12 42
	tsb $EEDD.w		; 0C DD EE
	sbc $25DEB2.l		; EF B2 DE 25
	eor $33.b,S		; 43 33
	rol $50.b		; 26 50
	sta $B2BC.w,Y		; 99 BC B2
	jmp.w [$E2ED]		; DC ED E2
	eor $43.b,X		; 55 43
	eor $66.b,S		; 43 66
	ora $F2A6.w,Y		; 19 A6 F2
	and ($D4.b),Y		; 31 D4
	sbc ($76.b,X)		; E1 76
	brk $F3.b		; 00 F3
	sbc ($B2.b,S),Y		; F3 B2
	.db $62, $A9, $AC		; 62 A9 AC
	cpx $D1ED.w		; EC ED D1
	mvp $B2,$43		; 44 43 B2
	eor $46.b,X		; 55 46
	tsa		; 3B
	sta $CECE.w,Y		; 99 CE CE
	cmp $B203.w,X		; DD 03 B2
	bit $34.b,X		; 34 34
	adc ($64.b,S),Y		; 73 64
	cmp #$FC9D.w		; C9 9D FC
	sbc $DFB2.w		; ED B2 DF
	and ($43.b)		; 32 43
	eor [$35.b]		; 47 35
	jmp $B6CFA9.l		; 5C A9 CF B6
	sbc ($F0.b,X)		; E1 F0
	and $02.b,S		; 23 02
	sbc ($5C.b),Y		; F1 5C
	ora ($9C.b),Y		; 11 9C
	ldx $E4.b,Y		; B6 E4
	and $1100.w		; 2D 00 11
	and $CF0630.l,X		; 3F 30 06 CF
	ldx $2A.b,Y		; B6 2A
	lda $01EF32.l,X		; BF 32 EF 01
	ora ($03.b)		; 12 03
	brk $B6.b		; 00 B6
	eor $BBF2.w,X		; 5D F2 BB
.ACCU 8
	sep #$2E		; E2 2E
	beq  17.b		; F0 11
	and $0631B6.l		; 2F B6 31 06
	dec $BE3B.w,X		; DE 3B BE
	jsl $B602FE.l		; 22 FE 02 B6
	cop $F3.b		; 02 F3
	jsr $E15E.w		; 20 5E E1
	phx		; DA
	sbc ($2F.b),Y		; F1 2F
	lda ($BC.b)		; B2 BC
	inc $24FF.w		; EE FF 24
	eor [$64.b]		; 47 64
	eor ($CB.b,X)		; 41 CB
	ldx $04.b		; A6 04
	stp		; DB
	rol $E1.b		; 26 E1
	inc $60.b,X		; F6 60
	bvs -33.b		; 70 DF
	lda ($1C.b)		; B2 1C
	cpy $ACED.w		; CC ED AC
	inc $15EE.w,X		; FE EE 15
	eor [$B6.b],Y		; 57 B6
	ora $00CFFD.l,X		; 1F FD CF 00
	sbc $E023.w,X		; FD 23 E0
	ora $B2.b,S		; 03 B2
	eor $67.b		; 45 67
	adc $1E.b		; 65 1E
	cmp $9BDC.w		; CD DC 9B
	sbc $DEB2.w,X		; FD B2 DE
	ora $56.b		; 05 56
	ror $61.b,X		; 76 61
	sbc $C9EE.w		; ED EE C9
	ldx $24.b,Y		; B6 24
	cmp $125112.l,X		; DF 12 51 12
	beq -66.b		; F0 BE
	beq -74.b		; F0 B6
	asl $4DD2.w		; 0E D2 4D
	sbc ($24.b),Y		; F1 24
	ora ($20.b),Y		; 11 20
	phd		; 0B
	ldx $EF.b,Y		; B6 EF
	brk $DD.b		; 00 DD
	bit $EE.b		; 24 EE
	ora ($42.b,S),Y		; 13 42
	cop $B6.b		; 02 B6
	ora $0CE1CE.l,X		; 1F CE E1 0C
	cmp ($3E.b,S),Y		; D3 3E
	cmp ($34.b)		; D2 34
	ldx $20.b,Y		; B6 20
	jsl $00EFEC.l		; 22 EC EF 00
	ldx $ED33.w,Y		; BE 33 ED
	ldx $23.b,Y		; B6 23
	eor ($12.b,X)		; 41 12
	rol $E1CE.w		; 2E CE E1
	inc A		; 1A
	cmp $A6.b,X		; D5 A6
	phk		; 4B
	sta $76.b,X		; 95 76
	bvc  84.b		; 50 54
	tsx		; BA
	cpy $B613.w		; CC 13 B6
	stz $DD52.w,X		; 9E 52 DD
	and ($33.b,S),Y		; 33 33
	sbc ($2E.b,S),Y		; F3 2E
	cmp $19D1B6.l		; CF B6 D1 19
	dec $1D.b,X		; D6 1D
	cmp ($34.b,S),Y		; D3 34
	and $DDB642.l		; 2F 42 B6 DD
	tsb $9D11.w		; 0C 11 9D
	adc ($DD.b,X)		; 61 DD
	bit $32.b,X		; 34 32
.ACCU 16
	rep #$24		; C2 24
	eor ($11.b,S),Y		; 53 11
	beq  12.b		; F0 0C
	ldx $CEFD.w,Y		; BE FD CE
	rep #$02		; C2 02
	and ($45.b)		; 32 45
	and ($2F.b),Y		; 31 2F
	brk $CB.b		; 00 CB
	sbc $E0DCC2.l,X		; FF C2 DC E0
	ora ($14.b)		; 12 14
	eor $12.b,S		; 43 12
	beq  12.b		; F0 0C
	ldx $D6.b,Y		; B6 D6
	tsb $43E4.w		; 0C E4 43
	rol $DD61.w		; 2E 61 DD
	dec A		; 3A
	ldx $01.b,Y		; B6 01
	sta $CE60.w,X		; 9D 60 CE
	eor ($31.b,S),Y		; 53 31
	inc $1D.b,X		; F6 1D
	ldx $D3.b,Y		; B6 D3
	ldy #$19.b		; A0 19
	dec $0B.b,X		; D6 0B
	sbc $34.b,X		; F5 34
	ora $ED60B6.l		; 0F B6 60 ED
	lsr A		; 4A
.ACCU 8
	sep #$AC		; E2 AC
	eor ($BF.b),Y		; 51 BF
	eor ($B6.b,S),Y		; 53 B6
	eor $E31E05.l		; 4F 05 1E E3
	ldx $C41B.w,Y		; BE 1B C4
	tas		; 1B
	ldx $04.b,Y		; B6 04
	bit $F0.b,X		; 34 F0
	eor ($DF.b),Y		; 51 DF
	bit $CBC1.w,X		; 3C C1 CB
	ldx $41.b,Y		; B6 41
	cpy #$43.b		; C0 43
	eor $021D05.l		; 4F 05 1D 02
	stp		; DB
	ldx $0D.b,Y		; B6 0D
	cmp $1C.b,S		; C3 1C
	tsb $43.b		; 04 43
	ora $B6EF51.l		; 0F 51 EF B6
	and $EBB0.w		; 2D B0 EB
	and ($D0.b,X)		; 21 D0
	eor ($20.b,S),Y		; 53 20
	ora $B6.b		; 05 B6
	ora $0EDB01.l		; 0F 01 DB 0E
	lda ($1D.b),Y		; B1 1D
	trb $41.b		; 14 41
	ldx $1F.b,Y		; B6 1F
	eor ($F0.b),Y		; 51 F0
	ora $ECA1.w,X		; 1D A1 EC
	ora ($E1.b,X)		; 01 E1
	lda ($E2.b)		; B2 E2
	bit $37.b,X		; 34 37
	ror $67.b,X		; 76 67
	and $99EB.w,X		; 3D EB 99
	ldx $0F.b,Y		; B6 0F
	trb $32.b		; 14 32
	brk $41.b		; 00 41
	beq  29.b		; F0 1D
	lda ($B6.b,X)		; A1 B6
	cmp $10F0.w,X		; DD F0 10
	eor $20.b,S		; 43 20
	ora $2F.b,S		; 03 2F
	bpl -74.b		; 10 B6
	wai		; CB
	ora $11ED.w,X		; 1D ED 11
	ora $22.b		; 05 22
	ora ($31.b,X)		; 01 31
	ldx $01.b,Y		; B6 01
	tsb $CEC0.w		; 0C C0 CE
	sbc $2F4230.l		; EF 30 42 2F
	ldx $22.b,Y		; B6 22
	jsr $BD10.w		; 20 10 BD
	jsr ($03FD.w,X)		; FC FD 03
	tsb $B6.b		; 04 B6
	jsl $0122F2.l		; 22 F2 22 01
	asl A		; 0A
	inc $D0CF.w,X		; FE CF D0
	lda ($BC.b)		; B2 BC
	cop $32.b		; 02 32
	lsr $77.b		; 46 77
	adc [$00.b],Y		; 77 00
	cmp $0CB6.w,Y		; D9 B6 0C
	ora $23.b,S		; 03 23
	jsr $2103.w		; 20 03 21
	ora ($F9.b,X)		; 01 F9
	ldx $2C.b,Y		; B6 2C
	cpy #$C0.b		; C0 C0
	.db $42, $23		; 42 23
	ora $B61042.l		; 0F 42 10 B6
	rol $CC92.w		; 2E 92 CC
	tas		; 1B
	ora $21.b		; 05 21
	bmi -11.b		; 30 F5
	ldx $11.b,Y		; B6 11
	ora ($DB.b),Y		; 11 DB
	pld		; 2B
	cmp ($B0.b,X)		; C1 B0
	eor ($22.b)		; 52 22
	ldx $F0.b,Y		; B6 F0
	eor ($02.b),Y		; 51 02
	tas		; 1B
	cmp ($AE.b),Y		; D1 AE
	inc A		; 1A
	ora $B6.b,X		; 15 B6
	ora ($1F.b,S),Y		; 13 1F
	ora $10.b,X		; 15 10
	and ($BD.b,X)		; 21 BD
	ora $B6F1.w,Y		; 19 F1 B6
	lda ($60.b,X)		; A1 60
	eor ($E2.b,X)		; 41 E2
	bvc   3.b		; 50 03
	asl A		; 0A
	sbc ($B6.b,X)		; E1 B6
	sta $04160B.l,X		; 9F 0B 16 04
	asl $0044.w		; 0E 44 00
	lsr $10C2.w		; 4E C2 10
	tsb $BCDD.w		; 0C DD BC
	sbc $330211.l,X		; FF 11 02 33
	ldx $05.b,Y		; B6 05
	cpy $A0FF.w		; CC FF A0
	jsr ($2224.w,X)		; FC 24 22
	ora $62B6.w,X		; 1D B6 62
	sbc ($5C.b),Y		; F1 5C
	cmp $C30FFA.l		; CF FA 0F C3
	and $B6.b,S		; 23 B6
	jsr $2EE6.w		; 20 E6 2E
	bit $CC.b		; 24 CC
	sbc $B6FDA0.l,X		; FF A0 FD B6
	and ($41.b)		; 32 41
	beq  97.b		; F0 61
	sbc $2E.b,S		; E3 2E
	bcs -21.b		; B0 EB
	ldx $FF.b,Y		; B6 FF
	sbc $14.b,S		; E3 14
	ora $401E15.l,X		; 1F 15 1E 40
	xce		; FB
	ldx $FE.b,Y		; B6 FE
	cmp $3113FF.l		; CF FF 13 31
	sbc $50.b,S		; E3 50
	cpx $B6.b		; E4 B6
	ora $E0FCAF.l		; 0F AF FC E0
	brk $32.b		; 00 32
	ora $64B235.l,X		; 1F 35 B2 64
	adc [$60.b],Y		; 77 60
	inc $9AB9.w,X		; FE B9 9A
	ldx $B601.w		; AE 01 B6
	sbc ($40.b,S),Y		; F3 40
.ACCU 8
	sep #$2F		; E2 2F
	lda $2ED0FD.l		; AF FD D0 2E
	lda ($EF.b)		; B2 EF
	brk $37.b		; 00 37
	stz $57.b		; 64 57
	eor $B6B9FD.l,X		; 5F FD B9 B6
	ora ($E4.b,X)		; 01 E4
	bpl  19.b		; 10 13
	rti		; 40

	sbc ($3E.b,X)		; E1 3E
	lda ($A6.b,X)		; A1 A6
	plb		; AB
	bne  47.b		; D0 2F
	eor ($22.b),Y		; 51 22
	adc [$0C.b]		; 67 0C
	asl $B6.b,X		; 16 B6
	sbc $EF2C.w,Y		; F9 2C EF
	ora ($F2.b,X)		; 01 F2
	ora ($13.b),Y		; 11 13
	bmi -78.b		; 30 B2
	and ($65.b,S),Y		; 33 65
	sbc ($CA.b,X)		; E1 CA
	tsx		; BA
	cpy $01DE.w		; CC DE 01
	lda ($47.b)		; B2 47
	adc ($46.b)		; 72 46
	lsr $AC1B.w		; 4E 1B AC
	ldy $B6DD.w		; AC DD B6
	ora $04.b,S		; 03 04
	bmi -78.b		; 30 B2
	rol $AFB2.w,X		; 3E B2 AF
	bit $30B6.w,X		; 3C B6 30
	beq  64.b		; F0 40
	bit $0A.b,X		; 34 0A
	and ($DD.b)		; 32 DD
	and #$B6.b		; 29 B6
	sbc $A4.b,X		; F5 A4
	asl $0314.w		; 0E 14 03
	eor $C22DB3.l		; 4F B3 2D C2
	ora ($DD.b,X)		; 01 DD
	ora $EEFF.w		; 0D FF EE
	bpl  36.b		; 10 24
	bmi -78.b		; 30 B2
	and $10.b,X		; 35 10
	ora $9EA0.w,Y		; 19 A0 9E
	plx		; FA
.INDEX 16
	rep #$14		; C2 14
	rep #$42		; C2 42
	cop $20.b		; 02 20
	bpl -51.b		; 10 CD
	ora $DEF0.w		; 0D F0 DE
	dec $3F.b		; C6 3F
	and $DF.b,S		; 23 DF
	bpl -16.b		; 10 F0
	tsb $D212.w		; 0C 12 D2
	dec $1D.b		; C6 1D
	ora ($F2.b,S),Y		; 13 F2
	and $0EF1.w,X		; 3D F1 0E
	and $0DC2C1.l		; 2F C1 C2 0D
	beq -50.b		; F0 CE
	bpl  37.b		; 10 25
	bpl  17.b		; 10 11
	ora ($C2.b,X)		; 01 C2
	tsb $EFE0.w		; 0C E0 EF
	ora $03E2.w,X		; 1D E2 03
	eor ($01.b),Y		; 51 01
	dec $FF.b		; C6 FF
	and $201EB3.l		; 2F B3 1E 20
	cmp ($3F.b),Y		; D1 3F
	jsl $1010C2.l		; 22 C2 10 10
	cop $0C.b		; 02 0C
	sbc $E20DE0.l,X		; FF E0 0D E2
	ldx $D6.b,Y		; B6 D6
	and $D002.w,Y		; 39 02 D0
	jmp $0F95.w		; 4C 95 0F
	and $6DB2B6.l,X		; 3F B6 B2 6D
	adc ($BF.b),Y		; 71 BF
	rol $C9F4.w		; 2E F4 C9
	bvc -78.b		; 50 B2
	cpx #$C2FC.w		; E0 FC C2
	asl $71.b		; 06 71
	ora ($0F.b)		; 12 0F
	bmi -74.b		; 30 B6
	sta $01.b,X		; 95 01
	asl $4FE0.w,X		; 1E E0 4F
	adc ($CF.b,X)		; 61 CF
	asl $F3B2.w,X		; 1E B2 F3
	asl A		; 0A
	inc $EE00.w		; EE 00 EE
	bne  22.b		; D0 16
	.db $62, $B6, $F0		; 62 B6 F0
	sbc $02A34E.l,X		; FF 4E A3 02
	asl $211E.w		; 0E 1E 21
	ldx $50.b,Y		; B6 50
	cmp $FAE40F.l,X		; DF 0F E4 FA
	jsr $C330.w		; 20 30 C3
	ldx $E1.b,Y		; B6 E1
	and $FE.b		; 25 FE
	beq  -2.b		; F0 FE
	bmi -79.b		; 30 B1
	ora ($B2.b)		; 12 B2
	ora $E10E.w,X		; 1D 0E E1
	mvn $00,$21		; 54 21 00
	cpx #$B22C.w		; E0 2C B2
	dec $D011.w,X		; DE 11 D0
	sbc $3215.w,X		; FD 15 32
	bpl  14.b		; 10 0E
	ldx $13.b,Y		; B6 13
	bcs  18.b		; B0 12
	tas		; 1B
	eor $FF4FD4.l		; 4F D4 4F FF
	lda ($00.b)		; B2 00
	cmp $02DE3E.l,X		; DF 3E DE 02
	cmp ($1D.b),Y		; D1 1D
	ora $A2.b,X		; 15 A2
	ror $3F.b,X		; 76 3F
	inc A		; 1A
	cmp $E9.b		; C5 E9
	cpy #$023A.w		; C0 3A 02
	ldx #$7590.w		; A2 90 75
	mvn $AB,$E0		; 54 E0 AB
	rts		; 60

	sta $A203.w,X		; 9D 03 A2
	cpy #$073B.w		; C0 3B 07
	eor $4E.b		; 45 4E
	inc A		; 1A
	ldx $29.b		; A6 29
	ldx $52.b		; A6 52
	bit $A214.w		; 2C 14 A2
	ror $9320.w,X		; 7E 20 93
	sta $9E53A2.l,X		; 9F A2 53 9E
	ora ($FE.b,X)		; 01 FE
	rol $34E4.w		; 2E E4 34
	eor $0CB2.w		; 4D B2 0C
.ACCU 16
	rep #$2D		; C2 2D
	beq   0.b		; F0 00
	ora ($00.b,X)		; 01 00
	ora ($A2.b)		; 12 A2
	lsr $D1.b,X		; 56 D1
	sta $AE45.w,Y		; 99 45 AE
	ora $B2112F.l		; 0F 2F 11 B2
	brk $22.b		; 00 22
	and $3DC20C.l,X		; 3F 0C C2 3D
	beq -15.b		; F0 F1
	ldx $F0.b,Y		; B6 F0
	bpl -14.b		; 10 F2
	ora ($C2.b,X)		; 01 C2
	cmp $B6B152.l		; CF 52 B1 B6
	asl $003F.w,X		; 1E 3F 00
	asl $1C21.w,X		; 1E 21 1C
	bit $A2F5.w		; 2C F5 A2
	adc $D3D1.w,X		; 7D D1 D3
	bmi   4.b		; 30 04
	sep #$45		; E2 45
	bne -74.b		; D0 B6
	cmp $2ECF43.l,X		; DF 43 CF 2E
	jsl $112ED1.l		; 22 D1 2E 11
	lda ($2F.b)		; B2 2F
	ora $4FB0.w		; 0D B0 4F
	cpx #$20E0.w		; E0 E0 20
	ora $B2.b,S		; 03 B2
	brk $22.b		; 00 22
	beq -20.b		; F0 EC
	tsb $0E.b		; 04 0E
	ora $0FB202.l		; 0F 02 B2 0F
	and ($02.b),Y		; 31 02
	and $40B00E.l		; 2F 0E B0 40
	bne -78.b		; D0 B2
	sbc $1FF220.l		; EF 20 F2 1F
	ora ($F0.b),Y		; 11 F0
	xba		; EB
	tsb $A2.b		; 04 A2
	tas		; 1B
	asl $1EF5.w		; 0E F5 1E
	stz $01.b		; 64 01
	and $D4B60D.l,X		; 3F 0D B6 D4
	eor $00D2.w		; 4D D2 00
	and $01FEF4.l		; 2F F4 FE 01
	lda ($00.b)		; B2 00
	xba		; EB
	sbc ($1D.b,S),Y		; F3 1D
	sbc $321FF1.l,X		; FF F1 1F 32
	lda ($10.b)		; B2 10
	brk $0E.b		; 00 0E
	bcs  33.b		; B0 21
	cmp $B611F0.l,X		; DF F0 11 B6
	sbc ($0F.b,S),Y		; F3 0F
	beq   0.b		; F0 00
	sbc $0C42.w		; ED 42 0C
	ora ($A6.b),Y		; 11 A6
	ora ($10.b,X)		; 01 10
	eor $1CE1EE.l,X		; 5F EE E1 1C
	lda [$22.b],Y		; B7 22
	ldx #$F0BC.w		; A2 BC F0
	sbc ($45.b),Y		; F1 45
	eor ($2E.b,S),Y		; 53 2E
	ora ($D9.b,X)		; 01 D9
	ldx #$4BF1.w		; A2 F1 4B
	cmp $55250F.l		; CF 0F 25 55
	and ($D0.b,S),Y		; 33 D0
	ldx #$9F0D.w		; A2 0D 9F
	tsb $CB.b		; 04 CB
	beq -30.b		; F0 E2
	adc $53.b		; 65 53
	ldx #$F04C.w		; A2 4C F0
	cmp $3CEE.w,Y		; D9 EE 3C
	stz $06FC.w,X		; 9E FC 06
	ldx #$3545.w		; A2 45 35
	cmp $E4AF0E.l		; CF 0E AF E4
	sbc #$B2F0.w		; E9 F0 B2
	sbc ($43.b,X)		; E1 43
	and ($3E.b),Y		; 31 3E
	beq  -3.b		; F0 FD
	sbc $C4B62F.l,X		; FF 2F B6 C4
	asl $E034.w		; 0E 34 E0
	sbc ($B1.b)		; F2 B1
	brk $E1.b		; 00 E1
	lda ($E2.b)		; B2 E2
	xce		; FB
	beq -31.b		; F0 E1
	eor $21.b,S		; 43 21
	and $FDB2EF.l,X		; 3F EF B2 FD
	inc $BF1F.w		; EE 1F BF
	asl $4325.w		; 0E 25 43
	and $B2.b,S		; 23 B2
	ora $E2DDF0.l		; 0F F0 DD E2
	xce		; FB
	beq -30.b		; F0 E2
	mvn $F0,$B6		; 54 B6 F0
	asl $2DFF.w		; 0E FF 2D
	brk $4E.b		; 00 4E
	ldy $1E.b,X		; B4 1E
	lda ($25.b)		; B2 25
	.db $42, $22		; 42 22
	ora $E2ECE0.l,X		; 1F E0 EC E2
	plx		; FA
	lda ($F0.b)		; B2 F0
.INDEX 8
	sep #$55		; E2 55
	and ($22.b)		; 32 22
	inc $CE0D.w,X		; FE 0D CE
	lda ($2F.b)		; B2 2F
	lda $53250F.l		; AF 0F 25 53
	ora ($20.b),Y		; 11 20
	bne -78.b		; D0 B2
	stp		; DB
.ACCU 8
	sep #$EA		; E2 EA
	cpx #$F3.b		; E0 F3
	eor $31.b,X		; 55 31
	ora ($B6.b,S),Y		; 13 B6
	sbc $E43C.w		; ED 3C E4
	tsa		; 3B
	pei ($1F.b)		; D4 1F
	eor $0F.b,S		; 43 0F
	lda ($11.b)		; B2 11
	and ($D1.b),Y		; 31 D1
	dex		; CA
	sbc ($CA.b)		; F2 CA
	sbc $56B2F3.l		; EF F3 B2 56
	rti		; 40

	ora $2D.b,S		; 03 2D
	tsb $2CAF.w		; 0C AF 2C
	lda $F0B2.w		; AD B2 F0
	and $65.b,X		; 35 65
	brk $33.b		; 00 33
	bne -70.b		; D0 BA
	ora $B2.b,S		; 03 B2
	tyx		; BB
	cpx #$04.b		; E0 04
	ror $50.b		; 66 50
	tsb $4D.b		; 04 4D
	asl A		; 0A
	lda ($A0.b)		; B2 A0
	rol A		; 2A
	lda $35F0.w,X		; BD F0 35
	ror $F0.b		; 66 F0
	mvp $D0,$B2		; 44 B2 D0
	txs		; 9A
	cop $AB.b		; 02 AB
	cmp $6F6713.l,X		; DF 13 67 6F
	lda ($04.b)		; B2 04
	lsr $A0F9.w,X		; 5E F9 A0
	inc A		; 1A
	lda $36F1.w,X		; BD F1 36
	ldx $10.b,Y		; B6 10
	sta ($42.b),Y		; 91 42
	bcc -94.b		; 90 A2
	bvc -111.b		; 50 91
	and ($B6.b,X)		; 21 B6
	and ($41.b),Y		; 31 41
	ora #$14.b		; 09 14
	inc A		; 1A
	xba		; EB
	and $FA.b,X		; 35 FA
	ldx $12.b,Y		; B6 12
	jsl $912F14.l		; 22 14 2F 91
	bvc -67.b		; 50 BD
	ldy $B2.b,X		; B4 B2
	asl $EF9B.w,X		; 1E 9B EF
	and $77.b,S		; 23 77
	rts		; 60

	ora $50.b		; 05 50
	ldx $BB.b,Y		; B6 BB
	mvn $13,$DC		; 54 DC 13
	ora ($24.b)		; 12 24
	ora $51B6B0.l		; 0F B0 B6 51
	lda $2DD6.w,Y		; B9 D6 2D
.ACCU 16
	rep #$22		; C2 22
	jsl $30C240.l		; 22 40 C2 30
	ora $30.b,S		; 03 30
	jmp.w [$ECF0]		; DC F0 EC
	sbc $12C601.l		; EF 01 C6 12
	brk $D0.b		; 00 D0
	bmi -21.b		; 30 EB
	ora $0F.b,S		; 03 0F
	sbc ($C2.b,X)		; E1 C2
	beq  18.b		; F0 12
	eor $30.b,S		; 43 30
	ora $30.b,S		; 03 30
	cpy $C2FF.w		; CC FF C2
	cpx $01EF.w		; EC EF 01
	bit $33.b		; 24 33
	brk $33.b		; 00 33
	phd		; 0B
	ldx $15.b,Y		; B6 15
	inc $21D4.w,X		; FE D4 21
	ora ($4E.b,S),Y		; 13 4E
	pld		; 2B
	tsb $C2.b		; 04 C2
	bmi -68.b		; 30 BC
	inc $E0DC.w,X		; FE DC E0
	sbc ($23.b),Y		; F1 23
	and $C2.b,S		; 23 C2
	ora ($33.b),Y		; 11 33
	phd		; 0B
	dec $CFFC.w,X		; DE FC CF
	ora $33C213.l		; 0F 13 C2 33
	eor ($13.b,X)		; 41 13
	and $CCEFBD.l,X		; 3F BD EF CC
	beq -74.b		; F0 B6
	pea $1140.w		; F4 40 11
	cmp $30995F.l		; CF 5F 99 30
	rol A		; 2A
	ldx $16.b,Y		; B6 16
	ora $0DF244.l		; 0F 44 F2 0D
	sbc $E9.b,X		; F5 E9
	ldx #$B6.b		; A2 B6
	ora ($92.b)		; 12 92
	adc $3F3FF5.l,X		; 7F F5 3F 3F
	cpx #$4D.b		; E0 4D
	ldx $9C.b,Y		; B6 9C
	ora ($1A.b,X)		; 01 1A
	and [$D0.b],Y		; 37 D0
	eor ($03.b)		; 52 03
	inc $03B6.w,X		; FE B6 03
	dex		; CA
	cmp $6CA520.l,X		; DF 20 A5 6C
	ora $11.b,X		; 15 11
	ldx $3F.b,Y		; B6 3F
	sbc ($2B.b,X)		; E1 2B
	lda $EBF3.w,X		; BD F3 EB
	adc $C2.b		; 65 C2
.ACCU 16
	rep #$22		; C2 22
	bit $42.b,X		; 34 42
	and $0E.b,S		; 23 0E
	cpy $BFED.w		; CC ED BF
	ldx $4C.b,Y		; B6 4C
	and ($04.b,S),Y		; 33 04
	ora ($D1.b,X)		; 01 D1
	inc A		; 1A
	nop		; EA
	tsb $C6.b		; 04 C6
	inc $E341.w		; EE 41 E3
	ora ($20.b,X)		; 01 20
	ora $C6DF10.l		; 0F 10 DF C6
	bne  45.b		; D0 2D
	tsb $0F.b		; 04 0F
	jsr $0012.w		; 20 12 00
	sbc ($C2.b),Y		; F1 C2
	and $BCCFFC.l		; 2F FC CF BC
	brk $F1.b		; 00 F1
	cop $44.b		; 02 44
	dec $0F.b		; C6 0F
	brk $D0.b		; 00 D0
	bne  44.b		; D0 2C
	and $F0.b,S		; 23 F0
	rol $41C6.w		; 2E C6 41
	brk $F0.b		; 00 F0
	inc $02FE.w,X		; FE FE 02
.ACCU 16
.INDEX 16
	rep #$3F		; C2 3F
	rep #$01		; C2 01
	ora $54.b,S		; 03 54
	eor $31.b,S		; 43 31
	inc $EACC.w,X		; FE CC EA
	ldx $46.b,Y		; B6 46
	sbc ($1F.b,X)		; E1 1F
	stz $F1.b		; 64 F1
	sbc $C2FDEB.l		; EF EB FD C2
	dec $00AD.w		; CE AD 00
	brk $03.b		; 00 03
	mvn $21,$43		; 54 43 21
	ldx $BF.b,Y		; B6 BF
	sbc $E15629.l		; EF 29 56 E1
.ACCU 8
	sep #$63		; E2 63
	sbc ($B6.b),Y		; F1 B6
	inc $0EDB.w,X		; FE DB 0E
	sbc ($A6.b),Y		; F1 A6
	rti		; 40

	inc $B644.w,X		; FE 44 B6
	lsr $EC2F.w		; 4E 2F EC
	lda ($EF.b),Y		; B1 EF
	jsr ($0F64.w,X)		; FC 64 0F
	ldx $D5.b,Y		; B6 D5
	eor $F2.b,S		; 43 F2
	ora $2EBC.w		; 0D BC 2E
	inc $B6D5.w,X		; FE D5 B6
	rti		; 40

	inc $3F63.w		; EE 63 3F
	bmi -54.b		; 30 CA
	cmp ($FE.b)		; D2 FE
	rep #$CC		; C2 CC
	cpx #$E10E.w		; E0 0E E1
	bit $35.b,X		; 34 35
	.db $42, $ED		; 42 ED
	ldx $20.b,Y		; B6 20
	cmp $4F04.w		; CD 04 4F
.INDEX 16
	rep #$53		; C2 53
	jsr $C230.w		; 20 30 C2
	rol $0DEF.w		; 2E EF 0D
	cpy $0EE1.w		; CC E1 0E
	sbc ($34.b)		; F2 34
	dec $02.b		; C6 02
	ora $11C0.w		; 0D C0 11
	dec $2F12.w,X		; DE 12 2F
	sep #$C2		; E2 C2
	and $33.b,S		; 23 33
	eor $1D.b,X		; 55 1D
	sbc $E1BD0D.l		; EF 0D BD E1
	dec $FE.b		; C6 FE
	jsl $1C0211.l		; 22 11 02 1C
	lda ($02.b)		; B2 02
	cmp $DEC2.w,X		; DD C2 DE
	ora $3422D0.l,X		; 1F D0 22 34
	lsr $1C.b,X		; 56 1C
	sbc $D22DC6.l,X		; FF C6 2D D2
	ora ($EE.b)		; 12 EE
	and ($01.b)		; 32 01
	ora ($1B.b)		; 12 1B
	rep #$CF		; C2 CF
	sbc ($EB.b),Y		; F1 EB
	cmp $22D00E.l,X		; DF 0E D0 22
	bit $C2.b,X		; 34 C2
	ror $0C.b		; 66 0C
	sbc $F0AD1F.l,X		; FF 1F AD F0
	cmp $C202.w,X		; DD 02 C2
	jsl $CF6046.l		; 22 46 60 CF
	beq  -6.b		; F0 FA
	cmp $D0C20D.l,X		; DF 0D C2 D0
	jsl $FC6524.l		; 22 24 65 FC
	sbc $C6BD0F.l,X		; FF 0F BD C6
	jsr $31D1.w		; 20 D1 31
	ora ($22.b,X)		; 01 22
	asl A		; 0A
	cmp ($01.b,S),Y		; D3 01
	dec $FB.b		; C6 FB
	and ($0D.b),Y		; 31 0D
	ora ($10.b,S),Y		; 13 10
	ora $2F.b,S		; 03 2F
	lda $FFC2.w,X		; BD C2 FF
	brk $BD.b		; 00 BD
	sbc $1211CE.l,X		; FF CE 11 12
	lsr $C6.b		; 46 C6
	xce		; FB
	cmp ($01.b,S),Y		; D3 01
	jsr ($FE12.w,X)		; FC 12 FE
	jsl $24C210.l		; 22 10 C2 24
	stz $0D.b		; 64 0D
	sbc $FECD00.l,X		; FF 00 CD FE
	dec $11C2.w		; CE C2 11
	ora ($46.b)		; 12 46
	rti		; 40

	cmp $DF0DF0.l,X		; DF F0 0D DF
	ldx $ED.b,Y		; B6 ED
	bit $10.b,X		; 34 10
	and $4D.b		; 25 4D
	stz $2011.w		; 9C 11 20
	ldx $BE.b,Y		; B6 BE
	rol $31E3.w,X		; 3E E3 31
	ora $44.b,S		; 03 44
	dex		; CA
	cmp ($B6.b,X)		; C1 B6
	ora ($1C.b),Y		; 11 1C
	cmp ($EF.b)		; D2 EF
	and ($10.b,S),Y		; 33 10
	bit $3D.b,X		; 34 3D
	lda ($1D.b)		; B2 1D
	dec $EB01.w,X		; DE 01 EB
	wai		; CB
	lda $1401.w		; AD 01 14
	rep #$45		; C2 45
	and ($FE.b),Y		; 31 FE
	beq  31.b		; F0 1F
	sbc $F0DD.w		; ED DD F0
.INDEX 16
	rep #$10		; C2 10
	bit $53.b		; 24 53
	bpl  -1.b		; 10 FF
	ora ($0E.b,X)		; 01 0E
	cmp $F5A6.w,X		; DD A6 F5
	eor ($06.b)		; 52 06
	adc $BB.b,X		; 75 BB
	txy		; 9B
	and $3F.b,S		; 23 3F
.ACCU 16
	rep #$ED		; C2 ED
	cmp $00E0.w,X		; DD E0 00
	and $43.b,S		; 23 43
	jsr $B6FF.w		; 20 FF B6
	and ($1C.b,X)		; 21 1C
	cpy #$2102.w		; C0 02 21
	ora $32.b,S		; 03 32
	sbc $02DDB6.l		; EF B6 DD 02
	jsr $F1CC.w		; 20 CC F1
	jsl $B23201.l		; 22 01 32 B2
	adc $40.b,X		; 75 40
	sbc $2DF1.w		; ED F1 2D
	lda #$FFAC.w		; A9 AC FF
	lda ($13.b)		; B2 13
	eor [$55.b],Y		; 57 55
	ora $EB23EF.l,X		; 1F EF 23 EB
	txs		; 9A
	ldx $13.b,Y		; B6 13
	sbc ($31.b)		; F2 31
	and $12EF1C.l		; 2F 1C EF 12
	rol A		; 2A
	ldx $DC.b		; A6 DC
	pea $455F.w		; F4 5F 45
	trb $01.b		; 14 01
	stz $B2FF.w		; 9C FF B2
	bit $DC.b		; 24 DC
	tax		; AA
	cmp $4533E0.l		; CF E0 33 45
	eor ($B6.b)		; 52 B6
	cpx #$3AF3.w		; E0 F3 3A
	bne -30.b		; D0 E2
	jsr $0123.w		; 20 23 01
	ldx $11.b,Y		; B6 11
	cmp $330F.w,X		; DD 0F 33
	lda $321C.w		; AD 1C 32
	sbc ($B2.b)		; F2 B2
	and ($35.b)		; 32 35
	eor ($00.b,S),Y		; 53 00
	sep #$4E		; E2 4E
	ldx $B69B.w,Y		; BE 9B B6
	rol $0033.w,X		; 3E 33 00
	and ($FC.b,X)		; 21 FC
	brk $23.b		; 00 23
	tyx		; BB
	lda ($FA.b)		; B2 FA
	ldx $32DF.w,Y		; BE DF 32
	bit $54.b		; 24 54
	ora $2DB602.l		; 0F 02 B6 2D
	ldy $DE.b		; A4 DE
	and $320F23.l,X		; 3F 23 0F 32
	jsr ($E3B6.w,X)		; FC B6 E3
	ora ($DA.b)		; 12 DA
	eor $3102B3.l		; 4F B3 02 31
	sbc $B2.b,S		; E3 B2
	adc $0E.b		; 65 0E
	jsl $F9AE31.l		; 22 31 AE F9
	cmp $B2E2.w		; CD E2 B2
	and $E35036.l		; 2F 36 50 E3
	and $1A.b,S		; 23 1A
	cpx #$B69B.w		; E0 9B B6
	and ($30.b,X)		; 21 30
	sbc $4F.b,S		; E3 4F
	ldx $0F50.w,Y		; BE 50 0F
	sta ($B2.b,S),Y		; 93 B2
	asl A		; 0A
	lda $2EE1.w		; AD E1 2E
	and [$60.b],Y		; 37 60
	sbc $43.b,S		; E3 43
	ldx $EA.b,Y		; B6 EA
	and ($AD.b,S),Y		; 33 AD
	eor ($30.b,X)		; 41 30
	cmp $40.b		; C5 40
	ldx $52B6.w		; AE B6 52
	inc $3CB2.w		; EE B2 3C
	cmp $22.b,S		; C3 22
	trb $B254.w		; 1C 54 B2
	bvs -29.b		; 70 E3
	eor ($0B.b,S),Y		; 53 0B
	cpx #$CFD9.w		; E0 D9 CF
	ora ($B6.b),Y		; 11 B6
	cmp $41.b,X		; D5 41
	stz $EC53.w,X		; 9E 53 EC
	cmp ($1E.b)		; D2 1E
	lda ($B6.b)		; B2 B6
	eor ($0D.b,X)		; 41 0D
	mvn $E5,$19		; 54 19 E5
	rol $11CD.w,X		; 3E CD 11
	lda ($D9.b)		; B2 D9
	lda $67D20F.l		; AF 0F D2 67
	ora $4E36.w		; 0D 36 4E
	lda ($DE.b)		; B2 DE
	inc $00BA.w,X		; FE BA 00
	sbc $7126.w,X		; FD 26 71
	cmp ($B2.b,S),Y		; D3 B2
	adc $ED.b		; 65 ED
	inc $A0EB.w		; EE EB A0
	asl $66D2.w		; 0E D2 66
	lda ($1D.b)		; B2 1D
	rol $5E.b,X		; 36 5E
	dec $CAED.w,X		; DE ED CA
	brk $DD.b		; 00 DD
	lda ($26.b)		; B2 26
	adc ($D2.b,X)		; 61 D2
	adc $ED.b		; 65 ED
	sbc $B0EC.w		; ED EC B0
	lda ($0D.b)		; B2 0D
.ACCU 8
	sep #$67		; E2 67
	and $5F37.w		; 2D 37 5F
	dec $B6DD.w,X		; DE DD B6
	asl $D140.w		; 0E 40 D1
	eor $2B.b,S		; 43 2B
	cmp $4F.b		; C5 4F
	cmp $0FB6.w		; CD B6 0F
	brk $F3.b		; 00 F3
	ora $3214.w		; 0D 14 32
	wai		; CB
	eor $B6.b,X		; 55 B6
	sbc $00CF.w		; ED CF 00
	brk $20.b		; 00 20
	cmp ($43.b),Y		; D1 43
	bit $D2B2.w		; 2C B2 D2
	stz $3E.b		; 64 3E
	cpy $EFDD.w		; CC DD EF
	jsr ($B6D1.w,X)		; FC D1 B6
	and ($CC.b)		; 32 CC
	mvp $AD,$E0		; 44 E0 AD
	ora ($01.b),Y		; 11 01
	ora $24CDB2.l,X		; 1F B2 CD 24
	adc $E2.b,S		; 63 E2
	stz $4F.b		; 64 4F
	ldy $B2DE.w		; AC DE B2
	beq -21.b		; F0 EB
	sbc ($46.b,X)		; E1 46
	rol $3425.w,X		; 3E 25 34
	sbc $CDB2.w,Y		; F9 B2 CD
	cpx #$BE0D.w		; E0 0D BE
	trb $63.b		; 14 63
.INDEX 8
	sep #$53		; E2 53
	ldx $2C.b,Y		; B6 2C
	sta ($20.b)		; 92 20
	jsr $23DE.w		; 20 DE 23
	and ($EB.b)		; 32 EB
	lda ($24.b)		; B2 24
	and $09.b,X		; 35 09
	ldx $1DE1.w,Y		; BE E1 1D
	lda $32C214.l,X		; BF 14 C2 32
	sbc ($21.b),Y		; F1 21
	bmi -51.b		; 30 CD
	sbc $C2ED00.l,X		; FF 00 ED C2
	beq  35.b		; F0 23
	and $0C1312.l		; 2F 12 13 0C
	cmp $1EC2F1.l,X		; DF F1 C2 1E
	cmp $013201.l,X		; DF 01 32 01
	ora ($30.b),Y		; 11 30
	cmp $FEB2.w		; CD B2 FE
	ora ($CB.b)		; 12 CB
	cpx #$36.b		; E0 36
	eor $C22722.l		; 4F 22 27 C2
	tsb $F0DF.w		; 0C DF F0
	asl $01DF.w,X		; 1E DF 01
	and ($00.b)		; 32 00
.INDEX 16
	rep #$11		; C2 11
	bmi -51.b		; 30 CD
	ora $F0EE11.l		; 0F 11 EE F0
	and $B6.b,S		; 23 B6
	xce		; FB
	ora ($14.b),Y		; 11 14
	sta $F234.w,Y		; 99 34 F2
	rol A		; 2A
	sbc ($B2.b),Y		; F1 B2
	sbc ($64.b,S),Y		; F3 64
	brk $12.b		; 00 12
	ror $FF9C.w		; 6E 9C FF
	ora $B6.b,S		; 03 B6
	lda $FB5212.l		; AF 12 52 FB
	ora ($22.b),Y		; 11 22
	stz $B623.w		; 9C 23 B6
	sbc ($49.b),Y		; F1 49
	sbc ($25.b),Y		; F1 25
	and $1912B1.l		; 2F B1 12 19
	lda ($BE.b)		; B2 BE
	sbc $C0DB04.l,X		; FF 04 DB C0
	lsr $4F.b,X		; 56 4F
	ora ($B2.b,X)		; 01 B2
	and ($CC.b,S),Y		; 33 CC
	inc $3EE0.w		; EE E0 3E
	ldy $6405.w,X		; BC 05 64
	ldx $B1.b,Y		; B6 B1
	ora ($FA.b)		; 12 FA
	ora ($00.b),Y		; 11 00
	and $CB.b,S		; 23 CB
	ora $B2.b,X		; 15 B2
	lsr $4F.b,X		; 56 4F
	ora ($21.b,X)		; 01 21
	ldx $E0FE.w,Y		; BE FE E0
	bmi -78.b		; 30 B2
	ldy $6325.w		; AC 25 63
	sbc $F00B12.l,X		; FF 12 0B F0
	dec $32B6.w,X		; DE B6 32
	phx		; DA
	ora [$31.b],Y		; 17 31
	jmp.w [$0F11]		; DC 11 0F
	cmp $B6.b		; C5 B6
	tsb $2D13.w		; 0C 13 2D
	ldx #$1D72.w		; A2 72 1D
	cmp ($10.b,X)		; C1 10
	lda ($EC.b)		; B2 EC
	and ($CE.b,X)		; 21 CE
	ora ($0A.b,S),Y		; 13 0A
	pei ($55.b)		; D4 55
	and $0E00B6.l		; 2F B6 00 0E
	inc $EB.b,X		; F6 EB
	and ($2D.b)		; 32 2D
	ldy $61.b		; A4 61
	lda ($41.b)		; B2 41
	sbc $31DDFF.l,X		; FF FF DD 31
	lda $B60A23.l,X		; BF 23 0A B6
	lsr $1F.b,X		; 56 1F
	dec $0E0F.w,X		; DE 0F 0E
	and $DB.b		; 25 DB
	and ($B6.b,S),Y		; 33 B6
	asl $50B5.w		; 0E B5 50
	inc $F0D0.w,X		; FE D0 F0
	sbc ($4D.b,S),Y		; F3 4D
	ldx $C2.b,Y		; B6 C2
	bmi -20.b		; 30 EC
	mvn $DE,$0F		; 54 0F DE
	beq  15.b		; F0 0F
	ldx $43.b,Y		; B6 43
	cmp $0E22.w,X		; DD 22 0E
	cmp $4F.b,X		; D5 4F
	inc $B2DF.w,X		; FE DF B2
	cmp $30D2.w,X		; DD D2 30
	cpx #$FE21.w		; E0 21 FE
	and $43.b		; 25 43
	lda ($0E.b)		; B2 0E
	lda $22CD.w,X		; BD CD 22
	asl $0FF1.w		; 0E F1 0F
	sbc ($B2.b)		; F2 B2
	eor ($30.b,S),Y		; 53 30
	xba		; EB
	jmp.w [$20E3]		; DC E3 20
	cpx #$A611.w		; E0 11 A6
	sbc $ABEF73.l,X		; FF 73 EF AB
.ACCU 16
	rep #$E6		; C2 E6
	ror $B20A.w,X		; 7E 0A B2
	beq  17.b		; F0 11
	ora $53.b,S		; 03 53
	and $F2CBCB.l		; 2F CB CB F2
	ldx $D2.b		; A6 D2
	sta ($31.b),Y		; 91 31
	and $ED52.w,X		; 3D 52 ED
	tsx		; BA
.ACCU 8
.INDEX 8
	sep #$B2		; E2 B2
	bcs  33.b		; B0 21
	rol $14F1.w		; 2E F1 14
	bit $43.b		; 24 43
	ora $1FCFB6.l,X		; 1F B6 CF 1F
	eor ($01.b),Y		; 51 01
	cpy #$21.b		; C0 21
	and $B621.w,X		; 3D 21 B6
	inc $F0DE.w,X		; FE DE F0
	sbc $20.b,X		; F5 20
	trb $1302.w		; 1C 02 13
	lda ($23.b)		; B2 23
	.db $42, $0D		; 42 0D
	tyx		; BB
	tyx		; BB
	cop $23.b		; 02 23
	sbc $5202B2.l,X		; FF B2 02 52
	bit $20.b,X		; 34 20
	wai		; CB
	tsx		; BA
	bcs  35.b		; B0 23
	lda ($3F.b)		; B2 3F
	beq  38.b		; F0 26
	and $41.b,S		; 23 41
	xce		; FB
	tyx		; BB
	txy		; 9B
	lda ($F2.b)		; B2 F2
	and ($FF.b,S),Y		; 33 FF
	ora $73.b,S		; 03 73
	bit $1E.b,X		; 34 1E
	tyx		; BB
	ldx $1D.b,Y		; B6 1D
	trb $31.b		; 14 31
	tas		; 1B
	ora ($33.b),Y		; 11 33
	bne  29.b		; D0 1D
	ldx $DD.b,Y		; B6 DD
	ora ($D1.b,X)		; 01 D1
	eor $10.b,S		; 43 10
	bne  19.b		; D0 13
	and $01B6.w,X		; 3D B6 01
	jmp.w [$1DE0]		; DC E0 1D
	ora $40.b		; 05 40
	ora $B6F2.w		; 0D F2 B6
	and ($D1.b,S),Y		; 33 D1
	ora $01BF.w		; 0D BF 01
	bne  84.b		; D0 54
	brk $B2.b		; 00 B2
	bpl  21.b		; 10 15
	stz $43.b,X		; 74 43
	phd		; 0B
	plb		; AB
	cmp #$9F.b		; C9 9F
	lda ($33.b)		; B2 33
	and ($01.b,X)		; 21 01
	lsr $54.b,X		; 56 54
	jsr $BCAA.w		; 20 AA BC
	ldx $EF.b,Y		; B6 EF
	stz $0E.b		; 64 0E
	asl $1014.w,X		; 1E 14 10
	inc $B6F9.w,X		; FE F9 B6
	ora ($1D.b,X)		; 01 1D
	inc $40.b,X		; F6 40
	sbc ($F0.b,X)		; E1 F0
	eor ($1F.b,X)		; 41 1F
	ldx $DE.b,Y		; B6 DE
	ldy #$11.b		; A0 11
	dec $FF74.w,X		; DE 74 FF
	bpl -12.b		; 10 F4
	lda ($56.b)		; B2 56
	eor ($E9.b,X)		; 41 E9
	txs		; 9A
	cmp #$90.b		; C9 90
	.db $42, $22		; 42 22
	ldx $00.b,Y		; B6 00
	and ($2F.b,X)		; 21 2F
	dec $02A1.w		; CE A1 02
	cmp $F0B673.l		; CF 73 B6 F0
	ora ($F2.b),Y		; 11 F2
	ora ($EC.b,S),Y		; 13 EC
	stp		; DB
	ora ($2C.b,X)		; 01 2C
	lda ($90.b)		; B2 90
	and ($22.b),Y		; 31 22
	mvp $76,$35		; 44 35 76
	asl $B29A.w,X		; 1E 9A B2
	ldy $0399.w,X		; BC 99 03
	ora ($24.b)		; 12 24
	eor $57.b,S		; 43 57
	rts		; 60

	ldx $EB.b,Y		; B6 EB
	ora ($1D.b,X)		; 01 1D
	sbc [$3D.b],Y		; F7 3D
	and ($21.b,X)		; 21 21
	cmp ($B6.b,S),Y		; D3 B6
	and $11C0AD.l,X		; 3F AD C0 11
	cpy #$72.b		; C0 72
.INDEX 8
	sep #$12		; E2 12
	ldx $1C.b,Y		; B6 1C
	eor $FA.b,S		; 43 FA
	jmp.w [$1CF2]		; DC F2 1C
	asl $3D.b		; 06 3D
	ldx $31.b,Y		; B6 31
	jsl $AD3FB4.l		; 22 B4 3F AD
	cmp $B6DF21.l		; CF 21 DF B6
	.db $62, $E3, $13		; 62 E3 13
	rol A		; 2A
	eor $FA.b,S		; 43 FA
	jmp.w [$B6F2]		; DC F2 B6
	asl $2EF5.w		; 0E F5 2E
	and ($32.b),Y		; 31 32
	lda ($3F.b,S),Y		; B3 3F
	lda $CEB6.w,X		; BD B6 CE
	bmi -17.b		; 30 EF
	eor ($E3.b)		; 52 E3
	trb $2B.b		; 14 2B
	and $B6.b,S		; 23 B6
	jsr ($E3CC.w,X)		; FC CC E3
	asl $3EF4.w		; 0E F4 3E
	and ($42.b),Y		; 31 42
	ldx $C1.b,Y		; B6 C1
	rol $CEEB.w,X		; 3E EB CE
	bmi -17.b		; 30 EF
	.db $42, $E4		; 42 E4
	ldx $14.b,Y		; B6 14
	and $FE02.w		; 2D 02 FE
	wai		; CB
	sbc $0E.b,S		; E3 0E
	sbc $B6.b		; E5 B6
	rol $3233.w		; 2E 33 32
	sbc $BEFC2F.l		; EF 2F FC BE
	bmi -78.b		; 30 B2
	lda $E1D0.w,Y		; B9 D0 E1
	rol $76.b,X		; 36 76
	eor $43.b		; 45 43
	asl A		; 0A
	ldx $B6.b		; A6 B6
	ora $6DA7.w,X		; 1D A7 6D
	eor $64.b,X		; 55 64
	inc $B6F1.w		; EE F1 B6
	inc $31AD.w,X		; FE AD 31
	sbc $F233.w		; ED 33 F2
	and ($2F.b,S),Y		; 33 2F
	ldx $0E.b,Y		; B6 0E
	bpl -23.b		; 10 E9
	cmp ($1E.b,S),Y		; D3 1E
	cmp ($3F.b,S),Y		; D3 3F
	trb $B6.b		; 14 B6
	and ($F0.b)		; 32 F0
	cpx #$0F.b		; E0 0F
	ldy $FC30.w		; AC 30 FC
	and ($B6.b,S),Y		; 33 B6
	sbc ($44.b),Y		; F1 44
	rol $F11E.w		; 2E 1E F1
	asl A		; 0A
	rep #$0F		; C2 0F
	ldx $D2.b,Y		; B6 D2
	eor $E14105.l		; 4F 05 41 E1
	inc $BC10.w,X		; FE 10 BC
	ldx $10.b,Y		; B6 10
	sbc $0F14.w,X		; FD 14 0F
	adc $2E.b,S		; 63 2E
	ora $1CB6D1.l,X		; 1F D1 B6 1C
	bcs  31.b		; B0 1F
	cmp ($40.b),Y		; D1 40
	sbc $41.b,X		; F5 41
	sbc ($B6.b,X)		; E1 B6
	trb $DB11.w		; 1C 11 DB
	beq  13.b		; F0 0D
	ora ($1F.b,S),Y		; 13 1F
	mvn $75,$B2		; 54 B2 75
	adc [$22.b]		; 67 22
	and ($DA.b),Y		; 31 DA
	ldy $DE99.w,X		; BC 99 DE
	ldx $F4.b,Y		; B6 F4
	eor ($E1.b),Y		; 51 E1
	ora $0DF1.w,X		; 1D F1 0D
	lda ($1D.b,X)		; A1 1D
	lda ($9C.b)		; B2 9C
	inc $7416.w		; EE 16 74
	lsr $41.b,X		; 56 41
	and ($09.b,S),Y		; 33 09
	ldx $11.b,Y		; B6 11
	sbc $420322.l		; EF 22 03 42
	cpx #$2F.b		; E0 2F
	cmp ($B2.b),Y		; D1 B2
	and ($AA.b),Y		; 31 AA
	dex		; CA
	txy		; 9B
	dec $6404.w,X		; DE 04 64
	eor $B2.b		; 45 B2
	.db $42, $23		; 42 23
	rol A		; 2A
	txy		; 9B
	lda #$AD.b		; A9 AD
	cpx #$46.b		; E0 46
	ldx $F0.b,Y		; B6 F0
	bpl -32.b		; 10 E0
	bpl -99.b		; 10 9D
	and $B622FF.l		; 2F FF 22 B6
	and $20.b,S		; 23 20
	ora ($0F.b,X)		; 01 0F
	sbc ($0A.b),Y		; F1 0A
	lda ($FF.b,S),Y		; B3 FF
	lda ($9C.b)		; B2 9C
	cpx #$34.b		; E0 34
	mvn $43,$55		; 54 55 43
	and ($E9.b,S),Y		; 33 E9
	ldx $30.b		; A6 30
	jmp.w [$3555]		; DC 55 35
	and ($F2.b)		; 32 F2
	bpl  14.b		; 10 0E
	ldx $1C.b,Y		; B6 1C
	lda ($0F.b,X)		; A1 0F
.ACCU 8
.INDEX 8
	sep #$31		; E2 31
	jsl $B6102F.l		; 22 2F 10 B6
	bpl -31.b		; 10 E1
	cmp $FD10.w,Y		; D9 10 FD
	and $21.b,S		; 23 21
	jsl $0200B6.l		; 22 B6 00 02
	asl $AFFE.w,X		; 1E FE AF
	ora $B641D1.l,X		; 1F D1 41 B6
	jsl $110120.l		; 22 20 01 11
	sbc $0CE1FA.l		; EF FA E1 0C
	lda ($9D.b)		; B2 9D
	sbc ($34.b),Y		; F1 34
	mvp $74,$46		; 44 46 74
	and ($CA.b),Y		; 31 CA
.INDEX 16
	rep #$DD		; C2 DD
	cpy $01EF.w		; CC EF 01
	jsl $213322.l		; 22 22 33 21
	ldx $FC.b,Y		; B6 FC
	bne  12.b		; D0 0C
	tsb $22.b		; 04 22
	and ($01.b,X)		; 21 01
	ora $B6.b,S		; 03 B6
	ora $F2DCEE.l,X		; 1F EE DC F2
	bcs  66.b		; B0 42
	jsl $10B610.l		; 22 10 B6 10
	and ($EE.b)		; 32 EE
	dec $1BDF.w,X		; DE DF 1B
	pea $B632.w		; F4 32 B6
	and ($01.b,X)		; 21 01
	ora $2E.b,S		; 03 2E
	jsr ($E1ED.w,X)		; FC ED E1
	cmp $1243B6.l		; CF B6 43 12
	ora ($10.b),Y		; 11 10
	and ($FF.b)		; 32 FF
	lda $1CB6DE.l,X		; BF DE B6 1C
	cpx $32.b		; E4 32
	ora ($11.b),Y		; 11 11
	tsb $1F.b		; 04 1F
	xce		; FB
.ACCU 16
.INDEX 16
	rep #$FE		; C2 FE
	cmp $DFCB.w,X		; DD CB DF
	ora ($12.b,X)		; 01 12
	jsl $FFB644.l		; 22 44 B6 FF
	ldx $0CFD.w,Y		; BE FD 0C
	sbc ($42.b,S),Y		; F3 42
	ora ($10.b),Y		; 11 10
	ldx $14.b,Y		; B6 14
	ora $EEEFFB.l,X		; 1F FB EF EE
	dec $3143.w,X		; DE 43 31
	ldx $11.b,Y		; B6 11
	ora ($41.b,X)		; 01 41
	asl $FECD.w		; 0E CD FE
	sbc $B6E3.w		; ED E3 B6
	and ($11.b,S),Y		; 33 11
	and $EC1024.l		; 2F 24 10 EC
	cmp $BBC2FD.l,X		; DF FD C2 BB
	cmp $121200.l,X		; DF 00 12 12
	mvp $1F,$43		; 44 43 1F
.ACCU 16
	rep #$EE		; C2 EE
	stp		; DB
	lda $01F0.w,X		; BD F0 01
	and ($24.b,X)		; 21 24
	mvp $EC,$B6		; 44 B6 EC
	inc $CFFD.w		; EE FD CF
	bit $21.b,X		; 34 21
	ora ($E2.b,S),Y		; 13 E2
	ldx $42.b,Y		; B6 42
	sbc $EFDE.w,X		; FD DE EF
	stp		; DB
	ora $41.b,S		; 03 41
	jsl $332EB6.l		; 22 B6 2E 33
	jsr $EDDD.w		; 20 DD ED
	inc $34A0.w,X		; FE A0 34
	ldx $11.b,Y		; B6 11
	and ($E2.b)		; 32 E2
	.db $42, $FD		; 42 FD
	bne -49.b		; D0 CF
	sbc $F4B6.w,Y		; F9 B6 F4
	eor ($13.b,X)		; 41 13
	rol $2024.w		; 2E 24 20
	cmp $B60C.w		; CD 0C B6
	sbc $11539F.l,X		; FF 9F 53 11
	rti		; 40

	cop $32.b		; 02 32
	tsb $11C2.w		; 0C C2 11
	inc $ADEA.w		; EE EA AD
	sbc $242202.l,X		; FF 02 22 24
.INDEX 16
	rep #$54		; C2 54
	jsr $EE1E.w		; 20 1E EE
	tax		; AA
	cmp $C222F0.l,X		; DF F0 22 C2
	jsl $114245.l		; 22 45 42 11
	inc $ADEA.w		; EE EA AD
	sbc $2202C2.l,X		; FF C2 02 22
	bit $54.b		; 24 54
	and ($2E.b,X)		; 21 2E
	inc $B6AA.w		; EE AA B6
	.db $62, $03, $31		; 62 03 31
	ora ($33.b,X)		; 01 33
	jsr ($90F1.w,X)		; FC F1 90
	dec $0B.b		; C6 0B
	ora $10.b,S		; 03 10
	and ($10.b,X)		; 21 10
	cop $1F.b		; 02 1F
	sbc $F00EC6.l,X		; FF C6 0E F0
	bcs  49.b		; B0 31
	cop $11.b		; 02 11
	brk $21.b		; 00 21
	dec $FF.b		; C6 FF
	beq -17.b		; F0 EF
	phd		; 0B
	ora $10.b,S		; 03 10
	and ($10.b,X)		; 21 10
	dec $02.b		; C6 02
	ora $F00EE0.l,X		; 1F E0 0E F0
	bcs  49.b		; B0 31
	cop $C2.b		; 02 C2
	jsl $324422.l		; 22 22 44 32
	and ($FE.b,X)		; 21 FE
	phx		; DA
	lda $EFC2.w		; AD C2 EF
	cop $22.b		; 02 22
	bit $43.b		; 24 43
	jsl $B6ED1F.l		; 22 1F ED B6
	bcc  66.b		; 90 42
	jsl $410040.l		; 22 40 00 41
	sbc $DDB6FF.l		; EF FF B6 DD
	nop		; EA
	tsb $13.b		; 04 13
	bit $00.b		; 24 00
	ora ($1E.b,S),Y		; 13 1E
	ldx $0E.b,Y		; B6 0E
	sbc $BFDE.w,X		; FD DE BF
	eor ($41.b,X)		; 41 41
	rti		; 40

	cop $B6.b		; 02 B6
	ora ($E0.b)		; 12 E0
	sbc $F3ECCD.l		; EF CD EC F3
	bit $14.b		; 24 14
	ldx $00.b		; A6 00
	.db $42, $4A		; 42 4A
	ora $AAD9.w,X		; 1D D9 AA
	ldx $A646.w,Y		; BE 46 A6
	stz $7F.b		; 64 7F
	trb $15.b		; 14 15
	bcs -21.b		; B0 EB
	plb		; AB
	sta $F1B6.w,X		; 9D B6 F1
	eor $22.b,S		; 43 22
	ora ($20.b,X)		; 01 20
	rol $DD0F.w		; 2E 0F DD
	ldx $EC.b,Y		; B6 EC
	sbc $203205.l,X		; FF 05 32 20
	ora ($02.b)		; 12 02
	sbc $EE1BB6.l		; EF B6 1B EE
	bcs -16.b		; B0 F0
	.db $62, $31, $02		; 62 31 02
	ora ($B6.b,X)		; 01 B6
	ora $EBAF00.l,X		; 1F 00 AF EB
	asl $3215.w,X		; 1E 15 32
	ora ($B6.b),Y		; 11 B6
	ora ($01.b),Y		; 11 01
	beq  -6.b		; F0 FA
	ora $D2C1.w		; 0D C1 D2
	eor $B6.b,S		; 43 B6
	and ($12.b,X)		; 21 12
	sbc ($2F.b),Y		; F1 2F
	asl $BDB1.w		; 0E B1 BD
	ora $34B6.w,X		; 1D B6 34
	and ($11.b)		; 32 11
	bpl  17.b		; 10 11
	sep #$CB		; E2 CB
	rol A		; 2A
	ldx $E2.b,Y		; B6 E2
	cmp $43.b,S		; C3 43
	and ($20.b,X)		; 21 20
	ora ($1E.b,X)		; 01 1E
	pld		; 2B
	ldx $C2.b,Y		; B6 C2
	sta $13252D.l,X		; 9F 2D 25 13
	ora ($F1.b)		; 12 F1
	bpl -74.b		; 10 B6
	ora ($AD.b,X)		; 01 AD
	and #$D3F2.w		; 29 F2 D3
	eor ($32.b,X)		; 41 32
	rol $11B6.w		; 2E B6 11
	ora ($09.b,X)		; 01 09
	sbc ($90.b),Y		; F1 90
	asl $1324.w,X		; 1E 24 13
	ldx $22.b,Y		; B6 22
	sbc ($1F.b,X)		; E1 1F
	and $120990.l		; 2F 90 09 12
.ACCU 8
.INDEX 8
	sep #$B6		; E2 B6
	and ($33.b),Y		; 31 33
	asl $E411.w,X		; 1E 11 E4
	phx		; DA
	ora $2DB692.l,X		; 1F 92 B6 2D
	and ($03.b,S),Y		; 33 03
	rti		; 40

	beq  31.b		; F0 1F
	and $B6A1.w,X		; 3D A1 B6
	nop		; EA
	and $C3.b,S		; 23 C3
	bmi  67.b		; 30 43
	beq   1.b		; F0 01
	sbc ($B6.b)		; F2 B6
	phx		; DA
	and $4CB1.w		; 2D B1 4C
	and ($04.b)		; 32 04
	eor $F0B6F2.l		; 4F F2 B6 F0
	bit $DBC1.w		; 2C C1 DB
	ora $C2.b,X		; 15 C2
	bmi  67.b		; 30 43
	ldx $FF.b,Y		; B6 FF
	rol $BD12.w		; 2E 12 BD
	ora $4DB2.w,X		; 1D B2 4D
	ora ($B6.b)		; 12 B6
	trb $3E.b		; 14 3E
	cop $E1.b		; 02 E1
	trb $DCEF.w		; 1C EF DC
	and $B6.b		; 25 B6
	bne  33.b		; D0 21
	.db $42, $F0		; 42 F0
	ora $EDB011.l,X		; 1F 11 B0 ED
	ldx $D2.b,Y		; B6 D2
	lsr $24F2.w		; 4E F2 24
	rol $F011.w		; 2E 11 F0
	tas		; 1B
	ldx $1D.b,Y		; B6 1D
	cmp $DF25.w,X		; DD 25 DF
	jsl $00F141.l		; 22 41 F1 00
	ldx $00.b,Y		; B6 00
	cmp ($DC.b,X)		; C1 DC
	sbc ($5C.b)		; F2 5C
	sbc ($24.b)		; F2 24
	ora $4354B2.l,X		; 1F B2 54 43
	bmi  29.b		; 30 1D
	sta $ECB1.w,Y		; 99 B1 EC
	bne -77.b		; D0 B3
	mvp $44,$35		; 44 35 44
	and ($02.b)		; 32 02
	cmp $1EAB.w,Y		; D9 AB 1E
	eor $4B55.w,Y		; 59 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bmi 112.b		; 30 70
	rol $44AE.w,X		; 3E AE 44
	bvc  65.b		; 50 41
	eor $4C.b,X		; 55 4C
	and $54.b,X		; 35 54
	pha		; 48
	eor ($2E.b,S),Y		; 53 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($CF00.w)		; 6C 00 CF
	jmp ($E0D6.w,X)		; 7C D6 E0
	jmp ($831F.w,X)		; 7C 1F 83
	eor $9C89.w,X		; 5D 89 9C
	sta $1895DA.l		; 8F DA 95 18
	stz $A257.w		; 9C 57 A2
	sta $A8.b,X		; 95 A8
	pei ($AE.b)		; D4 AE
	ora ($B5.b)		; 12 B5
	eor ($BB.b),Y		; 51 BB
	sta $C7CEC1.l		; 8F C1 CE C7
	tsb $4ACE.w		; 0C CE 4A
	pei ($89.b)		; D4 89
	phx		; DA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $64.b		; 00 64
	brk $00.b		; 00 00
	tsb $0040.w		; 0C 40 00
	brk $0C.b		; 00 0C
	cpy $E174.w		; CC 74 E1
	and ($06.b,X)		; 21 06
	adc $29B2.w,X		; 7D B2 29
	cpy #$10.b		; C0 10
	bvs   2.b		; 70 02
	cpx $6426.w		; EC 26 64
	rti		; 40

	bit $4E.b		; 24 4E
	txs		; 9A
	bra   3.b		; 80 03
	eor $54.b,X		; 55 54
	trb $BE99.w		; 1C 99 BE
	inc $74F2.w		; EE F2 74
	eor $12CF.w		; 4D CF 12
	ora $4CE1.w		; 0D E1 4C
	sta $7034.w,X		; 9D 34 70
	cpx $46CE.w		; EC CE 46
	.db $42, $00		; 42 00
	cpx $44C0.w		; EC C0 44
	bvs  12.b		; 70 0C
	dex		; CA
	lda #$9A.b		; A9 9A
	inc $E0EE.w		; EE EE E0
	cop $70.b		; 02 70
	bit $64.b		; 24 64
	tsb $E0AA.w		; 0C AA E0
	tsb $64.b		; 04 64
	tsb $EE80.w		; 0C 80 EE
	sbc $0D45F0.l		; EF F0 45 0D
	sbc $DFAA.w		; ED AA DF
	stz $F3.b,X		; 74 F3
	ora $EEE1.w		; 0D E1 EE
	and [$21.b],Y		; 37 21
	ora $627000.l		; 0F 00 70 62
	rol $74.b		; 26 74
	jsl $440220.l		; 22 20 02 44
	ror $80.b		; 66 80
	and ($10.b,X)		; 21 10
	inc $EFEE.w,X		; FE EE EF
	sbc $80DBFE.l,X		; FF FE DB 80
	ldy $02DF.w,X		; BC DF 02
	and ($00.b,X)		; 21 00
	ora ($22.b,X)		; 01 22
	and ($60.b,X)		; 21 60
	rti		; 40

	cmp #$C0.b		; C9 C0
	cpy #$44.b		; C0 44
	cpy $99C9.w		; CC C9 99
	ldy $00.b,X		; B4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $52B3.w,Y		; D9 B3 52
	cpy #$05.b		; C0 05
	ror $21.b,X		; 76 21
	ora $3301F0.l		; 0F F0 01 33
	ora $0E01B0.l		; 0F B0 01 0E
	cmp $DBF0.w,X		; DD F0 DB
	cmp ($1F.b),Y		; D1 1F
	inc $EEB4.w		; EE B4 EE
	jsl $D11C12.l		; 22 12 1C D1
	eor $33.b,S		; 43 33
	tsb $A9B4.w		; 0C B4 A9
	lda $1A4523.l,X		; BF 23 45 1A
	ldx $47F1.w		; AE F1 47
	ldy $64.b,X		; B4 64
	jsr $0FEE.w		; 20 EE 0F
	sbc $02FF10.l,X		; FF 10 FF 02
	ldy #$76.b		; A0 76
	and $D1AADC.l,X		; 3F DC AA D1
	eor $1F.b,S		; 43 1F
	inc $01A4.w		; EE A4 01
	bpl  15.b		; 10 0F
	dec $3324.w,X		; DE 24 33
	jsr $B4CB.w		; 20 CB B4
	wai		; CB
	cmp ($32.b),Y		; D1 32
	bpl  -3.b		; 10 FD
	dec $5514.w		; CE 14 55
	ldy $53.b		; A4 53
	and ($ED.b),Y		; 31 ED
	sbc $01EE00.l,X		; FF 00 EE 01
	sbc $2E1390.l,X		; FF 90 13 2E
	lda #$9C.b		; A9 9C
	ora $43.b,S		; 03 43
	ora $B4AA.w		; 0D AA B4
	cpx $52D3.w		; EC D3 52
	and $21.b,S		; 23 21
	asl $1EDE.w		; 0E DE 1E
	ldy $BE.b,X		; B4 BE
	and $00.b,S		; 23 00
	sbc $45BEFD.l,X		; FF FD BE 45
	eor $B4.b		; 45 B4
	mvn $CB,$0E		; 54 0E CB
	bne  17.b		; D0 11
	brk $FF.b		; 00 FF
	ora $43E2A0.l		; 0F A0 E2 43
	and $20.b,S		; 23 20
	ora ($23.b,X)		; 01 23
	.db $42, $00		; 42 00
	ldy $01.b,X		; B4 01
	brk $F0.b		; 00 F0
	brk $12.b		; 00 12
	.db $42, $0D		; 42 0D
	wai		; CB
	ldy $BE.b,X		; B4 BE
	ora ($21.b),Y		; 11 21
	sbc $F3DD.w		; ED DD F3
	eor $44.b,X		; 55 44
	ldy $4F.b		; A4 4F
	sbc $F000F0.l,X		; FF F0 00 F0
	bpl -16.b		; 10 F0
	beq -92.b		; F0 A4
	sbc $1023F0.l,X		; FF F0 23 10
	sbc $EFBC.w,X		; FD BC EF
	ora ($A4.b),Y		; 11 A4
	ora ($FD.b),Y		; 11 FD
	cmp $2F4535.l,X		; DF 35 45 2F
	cmp $A4BD.w,X		; DD BD A4
	beq  17.b		; F0 11
	sbc $15CFDC.l,X		; FF DC CF 15
	lsr $75.b,X		; 56 75
	sty $50.b,X		; 94 50
	cpx $DEAB.w		; EC AB DE
	beq  18.b		; F0 12
	plx		; FA
	sta $0294.w,X		; 9D 94 02
	mvn $10,$42		; 54 42 10
	inc $FF0E.w		; EE 0E FF
	ora ($A4.b,X)		; 01 A4
	bpl   0.b		; 10 00
	ora ($13.b,X)		; 01 13
	and ($1F.b)		; 32 1F
	wai		; CB
	ldy $DDC0.w,X		; BC C0 DD
	inc $CBED.w		; EE ED CB
	tax		; AA
	cmp $33F1.w		; CD F1 33
	sty $41.b,X		; 94 41
	beq  31.b		; F0 1F
	sbc $F00000.l		; EF 00 00 F0
	bpl -108.b		; 10 94
	inc $1101.w		; EE 01 11
	inc $CCDC.w,X		; FE DC CC
	cpx #$20.b		; E0 20
	sty $FC.b,X		; 94 FC
	dec $6704.w		; CE 04 67
	stz $FC.b		; 64 FC
	tyx		; BB
	dec $00A4.w,X		; DE A4 00
	ora $02DEDD.l		; 0F DD DE 02
	and $44.b,X		; 35 44
	.db $42, $84		; 42 84
	bmi -19.b		; 30 ED
	tsx		; BA
	ldx $EAFF.w,Y		; BE FF EA
	cpy $84CF.w		; CC CF 84
	ora ($54.b,S),Y		; 13 54
	and ($00.b)		; 32 00
	inc $100F.w		; EE 0F 10
	ora $110F94.l,X		; 1F 94 0F 11
	and $54.b,S		; 23 54
	and $CDBADA.l		; 2F DA BA CD
	ldy $F0.b		; A4 F0
	inc $CECC.w		; EE CC CE
	ora $45.b,S		; 03 45
	eor $33.b,X		; 55 33
	ldy $11.b		; A4 11
	nop		; EA
	inc $60.b,X		; F6 60
	cop $1D.b		; 02 1D
	cmp $3E94F1.l,X		; DF F1 94 3E
.INDEX 16
	rep #$5F		; C2 5F
	ldy $1FDF.w,X		; BC DF 1F
	lda $840E.w,X		; BD 0E 84
	ldy $5524.w		; AC 24 55
	ror $1C.b,X		; 76 1C
	lda $E100.w,X		; BD 00 E1
	ldy $00.b		; A4 00
	sbc $EFED.w		; ED ED EF
	ora ($45.b)		; 12 45
	eor $21.b,S		; 43 21
	sty $52.b		; 84 52
	jsr ($EBCF.w,X)		; FC CF EB
	jmp.w [$E19B]		; DC 9B E1
	brk $74.b		; 00 74
	sbc $443027.l,X		; FF 27 30 44
	sbc $EEF0EE.l,X		; FF EE F0 EE
	sty $01.b,X		; 94 01
	jsl $0E2133.l		; 22 33 21 0E
	cpy $DEDE.w		; CC DE DE
	ldy $ED.b		; A4 ED
	cpx $E0DD.w		; EC DD E0
	and $44.b,S		; 23 44
	eor $22.b,S		; 43 22
	sty $54.b		; 84 54
	and $11.b,S		; 23 11
	brk $00.b		; 00 00
	ora $84F0FF.l		; 0F FF F0 84
	inc $FDEF.w,X		; FE EF FD
	dec $CBDD.w,X		; DE DD CB
	stp		; DB
	lda $35F184.l,X		; BF 84 F1 35
	adc $41.b		; 65 41
	jsr ($F2FE.w,X)		; FC FE F2
	ora $BBDD94.l		; 0F 94 DD BB
	lda $45F2.w,X		; BD F2 45
	ror $54.b,X		; 76 54
	and ($84.b)		; 32 84
	jsr $FD00.w		; 20 00 FD
	cmp $CDCD.w,X		; DD CD CD
	sbc $BB80FF.l,X		; FF FF 80 BB
	dec $11F1.w		; CE F1 11
	ora ($11.b),Y		; 11 11
	brk $01.b		; 00 01
	sty $33.b		; 84 33
	eor $33.b		; 45 33
	asl $CCCC.w		; 0E CC CC
	jmp.w [$C0BA]		; DC BA C0
	inc $CBDC.w		; EE DC CB
	cpy $F0DE.w		; CC DE F0
	ora ($22.b),Y		; 11 22
	sty $53.b		; 84 53
	eor $31.b,S		; 43 31
	ora ($10.b),Y		; 11 10
	beq  -2.b		; F0 FE
	inc $FD84.w		; EE 84 FD
	ora $CCDDFE.l		; 0F FE DD CC
	cpy $D0CE.w		; CC CE D0
	sty $03.b		; 84 03
	eor $42.b		; 45 42
	ora $1FF1FF.l		; 0F FF F1 1F
	xce		; FB
	sty $CC.b,X		; 94 CC
	ldy $03DF.w,X		; BC DF 03
	eor $55.b,X		; 55 55
	eor $32.b,S		; 43 32
	stz $12.b,X		; 74 12
	asl $9CEB.w		; 0E EB 9C
	plb		; AB
	txy		; 9B
	inc $74DE.w		; EE DE 74
	sbc ($14.b),Y		; F1 14
	ora ($20.b,X)		; 01 20
	inc $0401.w		; EE 01 04
	mvp $22,$94		; 44 94 22
	ora ($10.b),Y		; 11 10
	sbc $EEFFFF.l,X		; FF FF FF EE
	cpy $AA94.w		; CC 94 AA
	txy		; 9B
	cmp $655613.l		; CF 13 56 65
	eor ($43.b,S),Y		; 53 43
	sty $44.b		; 84 44
	.db $42, $22		; 42 22
	bpl  17.b		; 10 11
	beq -18.b		; F0 EE
	dec $FF84.w,X		; DE 84 FF
	cpx #$ECED.w		; E0 ED EC
	cpy $EECD.w		; CC CD EE
	ora ($84.b,X)		; 01 84
	ora ($32.b)		; 12 32
	and ($00.b,X)		; 21 00
	brk $00.b		; 00 00
	asl $94DA.w		; 0E DA 94
	wai		; CB
	cmp $23E1.w		; CD E1 23
	mvn $33,$44		; 54 44 33
	jsl $0F3274.l		; 22 74 32 0F
	xba		; EB
	tsx		; BA
	wai		; CB
	tyx		; BB
	cpy $74FE.w		; CC FE 74
	ora ($21.b),Y		; 11 21
	brk $FE.b		; 00 FE
	jsr $2612.w		; 20 12 26
	lsr $94.b		; 46 94
	ora ($11.b),Y		; 11 11
	brk $FF.b		; 00 FF
	ora $CBDDFF.l		; 0F FF DD CB
	sty $AB.b,X		; 94 AB
	ldy $24E0.w		; AC E0 24
	eor $54.b		; 45 54
	mvp $84,$33		; 44 33 84
	mvp $23,$32		; 44 32 23
	and ($0F.b,X)		; 21 0F
	sbc $84EFED.l,X		; FF ED EF 84
	sbc $DDDDFE.l,X		; FF FE DD DD
	cpy $E0EE.w		; CC EE E0
	ora ($84.b,X)		; 01 84
	ora ($12.b),Y		; 11 12
	ora ($01.b),Y		; 11 01
	ora ($1F.b),Y		; 11 1F
	jsr ($B0BA.w,X)		; FC BA B0
	jmp.w [$CCCC]		; DC CC CC
	dec $12F0.w,X		; DE F0 12
	and $33.b,S		; 23 33
	sty $50.b		; 84 50
	ora $EEDEFF.l		; 0F FF DE EE
	dec $00EE.w,X		; DE EE 00
	stz $12.b,X		; 74 12
	ora ($E0.b,X)		; 01 E0
	sbc $442403.l		; EF 03 24 44
	eor ($94.b)		; 52 94
	ora ($00.b),Y		; 11 00
	brk $00.b		; 00 00
	beq -18.b		; F0 EE
	cpx $94CA.w		; EC CA 94
	tyx		; BB
	ldx $24F1.w,Y		; BE F1 24
	mvp $43,$44		; 44 44 43
	and ($84.b)		; 32 84
	mvn $32,$33		; 54 33 32
	bpl  15.b		; 10 0F
	inc $EFEE.w,X		; FE EE EF
	stz $ED.b,X		; 74 ED
	stp		; DB
	plb		; AB
	txs		; 9A
	txs		; 9A
	dec $02E0.w,X		; DE E0 02
	sty $01.b		; 84 01
	ora ($11.b),Y		; 11 11
	jsr $0F11.w		; 20 11 0F
	cpx $84B9.w		; EC B9 84
	lda #$BD.b		; A9 BD
	ora $56.b,S		; 03 56
	adc [$66.b],Y		; 77 66
	mvn $74,$33		; 54 33 74
	and ($1F.b,X)		; 21 1F
	cmp $CBEA.w,X		; DD EA CB
	phx		; DA
	dec $740F.w		; CE 0F 74
	and ($00.b,X)		; 21 00
	sbc $242401.l		; EF 01 24 24
	eor $23.b,S		; 43 23
	sty $10.b,X		; 94 10
	ora ($F0.b,X)		; 01 F0
	brk $FF.b		; 00 FF
	inc $BBCD.w,X		; FE CD BB
	sty $BC.b,X		; 94 BC
	dec $23F2.w,X		; DE F2 23
	mvp $33,$44		; 44 44 33
	and ($84.b)		; 32 84
	mvp $32,$33		; 44 33 32
	ora ($FE.b),Y		; 11 FE
	sbc $FFFF.w,X		; FD FF FF
	stz $DB.b,X		; 74 DB
	cmp $BAAA.w,Y		; D9 AA BA
	lda $F0EE.w		; AD EE F0
	brk $84.b		; 00 84
	ora ($10.b,X)		; 01 10
	and ($12.b,X)		; 21 12
	bpl  14.b		; 10 0E
	cpy $84AB.w		; CC AB 84
	txy		; 9B
	dec $4613.w,X		; DE 13 46
	adc $66.b,X		; 75 66
	mvn $74,$22		; 54 22 74
	and ($1F.b,X)		; 21 1F
	sbc $9DEC.w		; ED EC 9D
	lda $F0EE.w,X		; BD EE F0
	stz $F0.b,X		; 74 F0
	ora $221200.l		; 0F 00 12 22
	bit $33.b,X		; 34 33
	and $94.b,S		; 23 94
	ora ($F1.b,X)		; 01 F1
	brk $0F.b		; 00 0F
	ora $BBCDED.l		; 0F ED CD BB
	sty $CD.b,X		; 94 CD
	cmp $442311.l,X		; DF 11 23 44
	and ($43.b,S),Y		; 33 43
	jsl $325484.l		; 22 84 54 32
	and ($10.b),Y		; 31 10
	sbc $EEFEFE.l,X		; FF FE FE EE
	stz $EB.b,X		; 74 EB
	tsx		; BA
	dex		; CA
	tyx		; BB
	cmp $F0EE.w,X		; DD EE F0
	ora ($84.b,X)		; 01 84
	ora ($11.b,X)		; 01 11
	ora ($01.b)		; 12 01
	bpl -18.b		; 10 EE
	stp		; DB
	tyx		; BB
	sty $AD.b		; 84 AD
	sbc $565513.l		; EF 13 55 56
	mvn $23,$43		; 54 43 23
	stz $02.b,X		; 74 02
	sbc $DBCDEE.l,X		; FF EE CD DB
	dec $0EEE.w,X		; DE EE 0E
	bra -35.b		; 80 DD
	cpy $E0DE.w		; CC DE E0
	ora ($45.b)		; 12 45
	adc [$77.b]		; 67 77
	sty $01.b		; 84 01
	ora ($00.b,X)		; 01 00
	sbc $A9CAFD.l,X		; FF FD CA A9
	sta $AB84.w,Y		; 99 84 AB
	inc $5513.w		; EE 13 55
	lsr $65.b,X		; 56 65
	mvn $74,$54		; 54 54 74
	adc [$53.b]		; 67 53
	and ($1F.b)		; 32 1F
	sbc $DDCEDE.l,X		; FF DE CE DD
	stz $DB.b,X		; 74 DB
	jmp.w [$CDCB]		; DC CB CD
	cmp $11F0EF.l,X		; DF EF F0 11
	sty $F1.b		; 84 F1
	ora ($10.b),Y		; 11 10
	ora ($00.b),Y		; 11 00
	inc $CCDC.w		; EE DC CC
	sty $DE.b		; 84 DE
	sbc $354422.l,X		; FF 22 44 35
	eor $33.b,S		; 43 33
	and ($64.b,X)		; 21 64
	and ($00.b,X)		; 21 00
	ldy $ADBA.w,X		; BC BA AD
	cmp $CCC0.w,Y		; D9 C0 CC
	stz $FF.b		; 64 FF
	ora $443330.l		; 0F 30 33 44
	eor $42.b		; 45 42
	ora ($84.b),Y		; 11 84
	ora ($00.b,X)		; 01 00
	brk $0E.b		; 00 0E
	sbc $ABCC.w,X		; FD CC AB
	tyx		; BB
	sty $CC.b		; 84 CC
	sbc $454322.l,X		; FF 22 43 45
	eor $43.b		; 45 43
	eor $74.b,S		; 43 74
	stz $52.b		; 64 52
	ora ($01.b),Y		; 11 01
	sbc $DDEDED.l		; EF ED ED DD
	bcc  16.b		; 90 10
	inc $DCED.w,X		; FE ED DC
	cpy $CCCC.w		; CC CC CC
	cmp $1174.w,X		; DD 74 11
	ora ($12.b)		; 12 12
	jsr $EC0E.w		; 20 0E EC
	plb		; AB
	tax		; AA
	stz $BE.b,X		; 74 BE
	cpx #$5544.w		; E0 44 55
	ror $64.b,X		; 76 64
	eor ($23.b,S),Y		; 53 23
	stz $3F.b		; 64 3F
	sbc $ADEEFA.l,X		; FF FA EE AD
	cmp $CFC0.w		; CD C0 CF
	stz $0F.b		; 64 0F
	ora $043440.l		; 0F 40 34 04
	eor ($41.b,X)		; 41 41
	ora ($84.b),Y		; 11 84
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	sbc $CCDD.w		; ED DD CC
	cmp $AD74.w		; CD 74 AD
	cmp ($15.b),Y		; D1 15
	lsr $67.b		; 46 67
	ror $67.b		; 66 67
	eor $90.b,X		; 55 90
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc $44.b		; 65 44
	and ($11.b)		; 32 11
	stz $9C.b		; 64 9C
	cpy $BEBC.w		; CC BC BE
	xce		; FB
.ACCU 8
.INDEX 8
	sep #$FE		; E2 FE
	and $121074.l,X		; 3F 74 10 12
	sbc ($00.b)		; F2 00
	brk $EC.b		; 00 EC
	ldy $74DD.w,X		; BC DD 74
	cmp $3201.w,X		; DD 01 32
	bit $54.b,X		; 34 54
	.db $42, $33		; 42 33
	and ($90.b),Y		; 31 90
	mvp $32,$43		; 44 43 32
	and ($10.b,X)		; 21 10
	brk $00.b		; 00 00
	sbc $030F64.l,X		; FF 64 0F 03
	ora $04.b,S		; 03 04
	tsb $10.b		; 04 10
	eor ($11.b,X)		; 41 11
	stz $E0.b,X		; 74 E0
	bpl  15.b		; 10 0F
	inc $ABEC.w		; EE EC AB
	tyx		; BB
	ldx $9990.w,Y		; BE 90 99
	tax		; AA
	tax		; AA
	ldy $02DF.w,X		; BC DF 02
	bit $55.b,X		; 34 55
	stz $53.b		; 64 53
	and $EEFF32.l,X		; 3F 32 FF EE
	inc $DDDD.w		; EE DD DD
	stz $C9.b		; 64 C9
	jsr ($FF0B.w,X)		; FC 0B FF
	jsr ($3FEF.w,X)		; FC EF 3F
	and $0FF364.l,X		; 3F 64 F3 0F
	eor $BCCC4C.l		; 4F 4C CC BC
	ldx $743F.w,Y		; BE 3F 74
	ora ($E0.b),Y		; 11 E0
	bpl  -4.b		; 10 FC
	and $32.b,S		; 23 32
	lsr $32.b		; 46 32
	bra 118.b		; 80 76
	eor $43.b,X		; 55 43
	and ($11.b,X)		; 21 11
	brk $00.b		; 00 00
	ora $CCC960.l		; 0F 60 C9 CC
	cpy $4400.w		; CC 00 44
	mvp $77,$44		; 44 44 77
	bra  33.b		; 80 21
	ora ($10.b),Y		; 11 10
	inc $A9CB.w,X		; FE CB A9
	sta $74AA.w,Y		; 99 AA 74
	beq  -1.b		; F0 FF
	ora $2F11.w		; 0D 11 2F
	ora $52.b,S		; 03 52
	lsr $64.b		; 46 64
	.db $62, $2E, $E1		; 62 2E E1
	sbc ($D1.b,X)		; E1 D1
	ora $DC1D.w,X		; 1D 1D DC
	stz $0D.b		; 64 0D
	cmp $4F0B0F.l		; CF 0F 0B 4F
	ora $B50F0F.l		; 0F 0F 0F B5
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	eor $4B55.w,Y		; 59 55 4B
	eor $140000.l		; 4F 00 00 14
	bmi   0.b		; 30 00
	brk $1F.b		; 00 1F
	jsr $3E70.w		; 20 70 3E
	ldx $4A44.w		; AE 44 4A
	eor $50.b,X		; 55 50
	eor #$54.b		; 49 54
	eor ($4C.b)		; 52 4C
	mvp $73,$2E		; 44 2E 73
	adc $CF006C.l		; 6F 6C 00 CF
	jmp ($E0D6.w,X)		; 7C D6 E0
	jmp ($831F.w,X)		; 7C 1F 83
	eor $9C89.w,X		; 5D 89 9C
	sta $1895DA.l		; 8F DA 95 18
	stz $A257.w		; 9C 57 A2
	sta $A8.b,X		; 95 A8
	pei ($AE.b)		; D4 AE
	ora ($B5.b)		; 12 B5
	eor ($BB.b),Y		; 51 BB
	sta $C7CEC1.l		; 8F C1 CE C7
	tsb $4ACE.w		; 0C CE 4A
	pei ($89.b)		; D4 89
	phx		; DA
	.db $62, $00, $C0		; 62 00 C0
	tsb $44.b		; 04 44
	adc [$77.b],Y		; 77 77
	adc [$74.b],Y		; 77 74
	ror $00.b,X		; 76 00
	inc $ECEE.w		; EE EE EC
	ldy $75F2.w,X		; BC F2 75
	lsr $76.b,X		; 56 76
	eor ($11.b)		; 52 11
	cmp $1E101E.l,X		; DF 1E 10 1E
	bpl -38.b		; 10 DA
	stx $DC.b		; 86 DC
	cmp $DFDD.w,X		; DD DD DF
	bit $75.b		; 24 75
	eor ($21.b,S),Y		; 53 21
	ldx #$33.b		; A2 33
	mvp $33,$44		; 44 44 33
	jsl $0F1011.l		; 22 11 10 0F
	stx $ED.b,Y		; 96 ED
	cmp $F2ED.w,X		; DD ED F2
	adc $23.b,S		; 63 23
	ora ($23.b)		; 12 23
	stx $12.b,Y		; 96 12
	bmi -64.b		; 30 C0
	bpl -48.b		; 10 D0
	and ($EE.b,X)		; 21 EE
	stp		; DB
	stx $BE.b,Y		; 96 BE
	beq -52.b		; F0 CC
	pea $0540.w		; F4 40 05
	eor $55.b,S		; 43 55
	stx $65.b,Y		; 96 65
	stp		; DB
	pea $D41B.w		; F4 1B D4
	and ($EB.b,X)		; 21 EB
	tax		; AA
	ldx $E0.b		; A6 E0
	trb $2EDF.w		; 1C DF 2E
	brk $00.b		; 00 00
	and ($35.b,S),Y		; 33 35
	ldx $72.b		; A6 72
	inc $FD12.w		; EE 12 FD
	ora $21.b,S		; 03 21
	cmp $B2CE.w,X		; DD CE B2
	inc $BCEC.w		; EE EC BC
	wai		; CB
	sta $ABAA.w,Y		; 99 AA AB
.ACCU 8
.INDEX 8
	sep #$B2		; E2 B2
	adc [$76.b]		; 67 76
	adc [$64.b]		; 67 64
	lsr $76.b		; 46 76
	.db $42, $0F		; 42 0F
	ldx $11.b		; A6 11
	cpx $0DE0.w		; EC E0 0D
	jmp.w [$0EDF]		; DC DF 0E
	ora [$B6.b]		; 07 B6
	eor ($21.b)		; 52 21
	and ($FF.b,X)		; 21 FF
	ora $10.b,S		; 03 10
	sbc $01C2EF.l		; EF EF C2 01
	ora $DDFEFF.l		; 0F FF FE DD
	wai		; CB
	tyx		; BB
	cmp $43A6.w		; CD A6 43
	ror $65.b		; 66 65
	ora $4F05.w,X		; 1D 05 4F
	dec $A6DD.w,X		; DE DD A6
	ora ($EC.b),Y		; 11 EC
	sbc ($0D.b,X)		; E1 0D
	cpy $CDDC.w		; CC DC CD
	ora $B6.b,X		; 15 B6
	brk $03.b		; 00 03
	eor $10.b,X		; 55 10
	sbc ($20.b,S),Y		; F3 20
	sbc $02A6FF.l		; EF FF A6 02
	cpx $0CE1.w		; EC E1 0C
	cmp $CCCD.w		; CD CD CC
	pea $1FB6.w		; F4 B6 1F
	beq  70.b		; F0 46
	eor ($03.b,X)		; 41 03
	and $A6EFFF.l,X		; 3F FF EF A6
	ora ($EC.b)		; 12 EC
	sbc ($FD.b),Y		; F1 FD
	cmp $DCCC.w		; CD CC DC
	sbc ($B6.b),Y		; F1 B6
	ora $5324FF.l,X		; 1F FF 24 53
	and $30.b,S		; 23 30
	sbc $23C2FF.l		; EF FF C2 23
	and ($11.b,X)		; 21 11
	bpl  -2.b		; 10 FE
	cmp $BCCB.w,X		; DD CB BC
	ldx $F0.b,Y		; B6 F0
	asl $3412.w		; 0E 12 34
	eor $30.b		; 45 30
	sbc $33C2FF.l,X		; FF FF C2 33
	and ($11.b,X)		; 21 11
	bpl  -2.b		; 10 FE
	sbc $CCCC.w		; ED CC CC
	ldx $FE.b,Y		; B6 FE
	brk $F2.b		; 00 F2
	ora ($66.b)		; 12 66
	bvc  -1.b		; 50 FF
	sbc $3233C2.l,X		; FF C2 33 32
	jsl $EDFF10.l		; 22 10 FF ED
	cpy $C6CC.w		; CC CC C6
	sbc $100000.l,X		; FF 00 00 10
	bit $31.b		; 24 31
	beq -16.b		; F0 F0
	lda ($67.b)		; B2 67
	stz $44.b		; 64 44
	and ($0E.b),Y		; 31 0E
	wai		; CB
	sta $C299.w,Y		; 99 99 C2
	wai		; CB
	tyx		; BB
	cpy $E2DD.w		; CC DD E2
	adc [$65.b]		; 67 65
	mvp $12,$A6		; 44 A6 12
	inc $FC01.w,X		; FE 01 FC
	jmp.w [$CEDC]		; DC DC CE
	ora $FEEEB6.l,X		; 1F B6 EE FE
	ora ($0F.b)		; 12 0F
	and $75.b		; 25 75
	ora $12A6FF.l,X		; 1F FF A6 12
	inc $EC02.w,X		; FE 02 EC
	cmp $CECD.w,X		; DD CD CE
	ora $EFEEB6.l,X		; 1F B6 EE EF
	cop $1E.b		; 02 1E
	trb $66.b		; 14 66
	bmi  -2.b		; 30 FE
	rep #$44		; C2 44
	eor $33.b,S		; 43 33
	and ($00.b,X)		; 21 00
	inc $DDDD.w,X		; FE DD DD
	ldx $EE.b,Y		; B6 EE
	inc $1F02.w,X		; FE 02 1F
	ora $55.b,S		; 03 55
	.db $42, $FE		; 42 FE
	rep #$44		; C2 44
	eor $33.b,S		; 43 33
	and ($10.b)		; 32 10
	inc $EDDD.w,X		; FE DD ED
	ldx $EE.b,Y		; B6 EE
	inc $1FF3.w		; EE F3 1F
	cop $45.b		; 02 45
	eor $0E.b,S		; 43 0E
	rep #$45		; C2 45
	eor $44.b,S		; 43 44
	and ($10.b)		; 32 10
	inc $EDEE.w,X		; FE EE ED
	ldx $EE.b,Y		; B6 EE
	inc $20F2.w		; EE F2 20
	sbc ($44.b),Y		; F1 44
	mvp $96,$1E		; 44 1E 96
	rol $FC.b		; 26 FC
	eor ($B9.b),Y		; 51 B9
	tax		; AA
	sta $0AA1.w,Y		; 99 A1 0A
	ldx $EE.b,Y		; B6 EE
	sbc $21F1.w,X		; FD F1 21
	sbc ($24.b),Y		; F1 24
	mvp $96,$2F		; 44 2F 96
	asl $FD.b,X		; 16 FD
	eor ($AA.b),Y		; 51 AA
	tax		; AA
	sta $09B1.w,Y		; 99 B1 09
	ldx $EE.b,Y		; B6 EE
	inc $21E1.w,X		; FE E1 21
	brk $14.b		; 00 14
	eor $31.b,S		; 43 31
	stx $E4.b,Y		; 96 E4
	ora $AA9A41.l		; 0F 41 9A AA
	lda #$B1.b		; A9 B1
	plx		; FA
.INDEX 16
	rep #$DC		; C2 DC
	wai		; CB
	plb		; AB
	cmp $E0ED.w		; CD ED E0
	and $45.b,S		; 23 45
	stx $04.b,Y		; 96 04
	brk $31.b		; 00 31
	tax		; AA
	tax		; AA
	sta $E9D2.w,Y		; 99 D2 E9
.INDEX 16
	rep #$DC		; C2 DC
	wai		; CB
	plb		; AB
	cmp $DFED.w		; CD ED DF
	ora ($45.b)		; 12 45
.INDEX 16
	rep #$55		; C2 55
	mvn $32,$54		; 54 54 32
	ora ($0F.b),Y		; 11 0F
	sbc $EEB6FE.l,X		; FF FE B6 EE
	inc $22F0.w		; EE F0 22
	ora $3242E4.l,X		; 1F E4 42 32
	ldx $32.b		; A6 32
	bpl  47.b		; 10 2F
	dec $CDDD.w,X		; DE DD CD
	sbc ($EC.b)		; F2 EC
	ldx $EE.b,Y		; B6 EE
	sbc $1F32EF.l		; EF EF 32 1F
	sbc $42.b,S		; E3 42
	and ($A6.b)		; 32 A6
	eor $10.b,S		; 43 10
	and $CDDDED.l		; 2F ED DD CD
	ora ($EC.b,X)		; 01 EC
	ldx $CD.b		; A6 CD
	cpy $45DF.w		; CC DF 45
	rol $75D4.w		; 2E D4 75
	eor $A6.b,X		; 55 A6
	mvp $2F,$01		; 44 01 2F
	dec $CDDD.w,X		; DE DD CD
	bpl -20.b		; 10 EC
	ldx $CD.b		; A6 CD
	cpy $46DE.w		; CC DE 46
	and $66E3.w		; 2D E3 66
	eor $A6.b		; 45 A6
	mvn $2F,$20		; 54 20 2F
	cmp $CEDE.w,X		; DD DE CE
	ora ($DC.b,X)		; 01 DC
	ldx $CD.b		; A6 CD
	cmp $46CE.w		; CD CE 46
	and $65D2.w,X		; 3D D2 65
	eor $A6.b,X		; 55 A6
	eor $11.b,X		; 55 11
	and $DEDDDD.l		; 2F DD DD DE
	bpl -51.b		; 10 CD
	ldx $CD.b		; A6 CD
	cmp $57CD.w		; CD CD 57
	and $46D2.w		; 2D D2 46
	mvn $55,$A6		; 54 A6 55
	and ($1E.b)		; 32 1E
	sbc $DFDD.w		; ED DD DF
	brk $CD.b		; 00 CD
.INDEX 16
	rep #$DD		; C2 DD
	wai		; CB
	tsx		; BA
	dec $DEFE.w		; CE FE DE
	beq  35.b		; F0 23
	ldx $46.b		; A6 46
	.db $42, $1E		; 42 1E
	dec $DFDD.w,X		; DE DD DF
	ora $EEB6CD.l,X		; 1F CD B6 EE
	sbc $1E25EE.l		; EF EE 25 1E
	sbc ($13.b,X)		; E1 13
	and ($A6.b)		; 32 A6
	lsr $43.b		; 46 43
	asl $EDDD.w,X		; 1E DD ED
	cmp $B6CD1F.l,X		; DF 1F CD B6
	inc $EEEF.w		; EE EF EE
	and $1E.b		; 25 1E
	sbc ($12.b,X)		; E1 12
	and ($A6.b,S),Y		; 33 A6
	and $63.b,X		; 35 63
	ora $EDED.w,X		; 1D ED ED
	bne  30.b		; D0 1E
	cmp $EEB6.w		; CD B6 EE
	sbc $1E25EE.l		; EF EE 25 1E
	sbc ($12.b,X)		; E1 12
	and ($A6.b,S),Y		; 33 A6
	and $64.b		; 25 64
	asl $DDED.w		; 0E ED DD
	cpx #$CC1E.w		; E0 1E CC
	ldx $FE.b,Y		; B6 FE
	inc $25EF.w		; EE EF 25
	asl $11F0.w		; 0E F0 11
	eor $A6.b,S		; 43 A6
	and $65.b		; 25 65
	asl $DDDE.w		; 0E DE DD
	sbc ($0D.b,X)		; E1 0D
	jmp.w [$EFB6]		; DC B6 EF
	inc $24EF.w		; EE EF 24
	asl $02F0.w,X		; 1E F0 02
	and ($A6.b,S),Y		; 33 A6
	and $66.b,X		; 35 66
	ora $ECED.w		; 0D ED EC
	sbc ($0D.b),Y		; F1 0D
	cmp $EFB6.w		; CD B6 EF
	inc $24EF.w		; EE EF 24
	asl $01F0.w,X		; 1E F0 01
	eor $A6.b,S		; 43 A6
	bit $75.b,X		; 34 75
	ora $DDED.w,X		; 1D ED DD
	sbc ($0D.b),Y		; F1 0D
	cmp $EDC2.w		; CD C2 ED
	cpy $CEBB.w		; CC BB CE
	inc $EEEE.w,X		; FE EE EE
	cop $A6.b		; 02 A6
	bit $76.b,X		; 34 76
	ora $DDDE.w,X		; 1D DE DD
	sbc ($FD.b)		; F2 FD
	cmp $EEB6.w		; CD B6 EE
	inc $24EF.w,X		; FE EF 24
	asl $00F0.w,X		; 1E F0 00
	bit $A6.b,X		; 34 A6
	bit $76.b,X		; 34 76
	ora $DDEE.w,X		; 1D EE DD
	ora ($FC.b,X)		; 01 FC
	cmp $EEB6.w,X		; DD B6 EE
	inc $24EF.w,X		; FE EF 24
	asl $F0F1.w,X		; 1E F1 F0
	bit $A6.b,X		; 34 A6
	bit $76.b,X		; 34 76
	ora $DDEE.w,X		; 1D EE DD
	ora ($FC.b,X)		; 01 FC
	cmp $EDC2.w,X		; DD C2 ED
	cpy $CEBB.w		; CC BB CE
	inc $EEEE.w,X		; FE EE EE
	sbc ($A6.b),Y		; F1 A6
	eor $66.b		; 45 66
	asl $EDDE.w,X		; 1E DE ED
	ora ($FC.b,X)		; 01 FC
	cmp $EDC2.w,X		; DD C2 ED
	cpy $CEBB.w		; CC BB CE
	inc $EEEE.w,X		; FE EE EE
	sbc ($A6.b),Y		; F1 A6
	eor $75.b		; 45 75
	ora $11DEDE.l,X		; 1F DE DE 11
	cmp $C2DC.w,X		; DD DC C2
	sbc $BBCC.w		; ED CC BB
	dec $EEFE.w		; CE FE EE
	inc $A6F1.w		; EE F1 A6
	eor $74.b,X		; 55 74
	ora $11DEEE.l,X		; 1F EE DE 11
	cmp $C2DC.w,X		; DD DC C2
	sbc $BBCC.w		; ED CC BB
	dec $EEFE.w		; CE FE EE
	sbc $A6F1.w		; ED F1 A6
	lsr $73.b,X		; 56 73
	and $20DEEE.l		; 2F EE DE 20
	cmp $A6DC.w,X		; DD DC A6
	cmp $CFCD.w,X		; DD CD CF
	eor [$1D.b]		; 47 1D
	sbc ($DE.b),Y		; F1 DE
	eor [$A6.b]		; 47 A6
	eor [$73.b],Y		; 57 73
	ora ($ED.b,X)		; 01 ED
	bne  16.b		; D0 10
	cmp $A6DC.w,X		; DD DC A6
	cmp $CFCD.w,X		; DD CD CF
	lsr $1E.b		; 46 1E
	ora ($DD.b,X)		; 01 DD
	and [$C2.b],Y		; 37 C2
	ora ($55.b,S),Y		; 13 55
	eor $43.b,X		; 55 43
	jsl $FF1022.l		; 22 22 10 FF
	ldx $DC.b		; A6 DC
	jmp.w [$35EF]		; DC EF 35
	rol $DD00.w		; 2E 00 DD
	and [$B6.b],Y		; 37 B6
	bit $41.b		; 24 41
	brk $0F.b		; 00 0F
	beq   0.b		; F0 00
	sbc $ECA6EE.l		; EF EE A6 EC
	jmp.w [$35D0]		; DC D0 35
	ora $35DD00.l,X		; 1F 00 DD 35
	ldx $34.b,Y		; B6 34
	eor ($00.b,X)		; 41 00
	ora $EE00F0.l		; 0F F0 00 EE
	inc $DDA6.w,X		; FE A6 DD
	cmp $34D0.w		; CD D0 34
	jsr $DEF0.w		; 20 F0 DE
	bit $B6.b		; 24 B6
	bit $51.b,X		; 34 51
	beq  15.b		; F0 0F
	beq  31.b		; F0 1F
	sbc $EDC2EF.l		; EF EF C2 ED
	jmp.w [$DEBC]		; DC BC DE
	sbc $EFEEFE.l,X		; FF FE EE EF
	ldx $35.b,Y		; B6 35
	bvc -16.b		; 50 F0
	ora $EF1FF0.l,X		; 1F F0 1F EF
	sbc $CCCDA6.l		; EF A6 CD CC
	sbc ($23.b,X)		; E1 23
	jsr $DE0F.w		; 20 0F DE
	jsl $5135B6.l		; 22 B6 35 51
	cpx #$F11F.w		; E0 1F F1
	ora $C2EFEF.l		; 0F EF EF C2
	sbc $CCDC.w		; ED DC CC
	dec $FFEF.w,X		; DE EF FF
	inc $B6EF.w		; EE EF B6
	rol $50.b,X		; 36 50
	cpx #$F110.w		; E0 10 F1
	asl $EEFF.w		; 0E FF EE
.ACCU 16
	rep #$ED		; C2 ED
	jmp.w [$DECC]		; DC CC DE
	sbc $EEEEFF.l		; EF FF EE EE
	ldx $36.b,Y		; B6 36
	bvc -32.b		; 50 E0
	bpl -15.b		; 10 F1
	asl $EEFF.w		; 0E FF EE
	stx $C9.b,Y		; 96 C9
	txs		; 9A
	cmp ($15.b)		; D2 15
	eor ($0C.b,S),Y		; 53 0C
	ldx $B611.w		; AE 11 B6
	rol $60.b		; 26 60
	sbc $FF0101.l,X		; FF 01 01 FF
	sbc $9996EF.l		; EF EF 96 99
	txs		; 9A
	sbc ($14.b,X)		; E1 14
	stz $0C.b		; 64 0C
	sta $B620.w,X		; 9D 20 B6
	rol $61.b		; 26 61
	sbc $FF0101.l		; EF 01 01 FF
	sbc $9A96EF.l		; EF EF 96 9A
	txs		; 9A
	sbc ($04.b),Y		; F1 04
	eor $0B.b,X		; 55 0B
	stz $B63E.w,X		; 9E 3E B6
	rol $61.b		; 26 61
	sbc $0E1001.l		; EF 01 10 0E
	inc $96FE.w,X		; FE FE 96
	tax		; AA
	txy		; 9B
	sbc ($03.b),Y		; F1 03
	adc $0A.b		; 65 0A
	ldx $B63D.w		; AE 3D B6
	asl $71.b,X		; 16 71
	sbc $EF1101.l		; EF 01 11 EF
	inc $B2FE.w,X		; FE FE B2
	wai		; CB
	lda #$AB9A.w		; A9 9A AB
	dec $CCED.w,X		; DE ED CC
	jmp.w [$16B6]		; DC B6 16
	adc ($EF.b),Y		; 71 EF
	ora ($11.b,X)		; 01 11
	inc $FEFE.w,X		; FE FE FE
	stx $C9.b,Y		; 96 C9
	txy		; 9B
	ora ($F2.b,X)		; 01 F2
	ror $0A.b		; 66 0A
	lda $07B62C.l		; AF 2C B6 07
	adc ($EF.b),Y		; 71 EF
	sbc ($21.b),Y		; F1 21
	sbc $96FEFE.l		; EF FE FE 96
	tsx		; BA
	txy		; 9B
	bpl -14.b		; 10 F2
	eor [$0A.b],Y		; 57 0A
	lda $06B61C.l		; AF 1C B6 06
	adc ($EF.b)		; 72 EF
	sbc ($21.b),Y		; F1 21
	sbc $B2FEFE.l		; EF FE FE B2
	wai		; CB
	lda #$ABAA.w		; A9 AA AB
	cmp $CCCCFD.l,X		; DF FD CC CC
	ldx $06.b,Y		; B6 06
	adc ($EF.b)		; 72 EF
	sbc ($30.b),Y		; F1 30
	inc $FFFE.w,X		; FE FE FF
	lda ($DB.b)		; B2 DB
	lda #$ABAA.w		; A9 AA AB
	cmp $CCCCFD.l,X		; DF FD CC CC
	ldx $05.b,Y		; B6 05
	adc ($FF.b)		; 72 FF
	sbc ($21.b),Y		; F1 21
	sbc $A6FEFE.l		; EF FE FE A6
	cmp $00DF.w,X		; DD DF 00
	beq  52.b		; F0 34
	tsb $0EE0.w		; 0C E0 0E
	ldx $05.b,Y		; B6 05
	adc $FF.b,S		; 63 FF
	sbc ($21.b),Y		; F1 21
	sbc $A6FEFE.l		; EF FE FE A6
	cpx $1FDF.w		; EC DF 1F
	beq  52.b		; F0 34
	ora $0FD0.w		; 0D D0 0F
	ldx $04.b,Y		; B6 04
	adc $0E.b,S		; 63 0E
	sbc ($21.b),Y		; F1 21
	inc $EFFF.w,X		; FE FF EF
	ldx $DC.b		; A6 DC
	bne  15.b		; D0 0F
	beq  53.b		; F0 35
	jsr ($0FE0.w,X)		; FC E0 0F
	ldx $03.b,Y		; B6 03
	stz $0E.b		; 64 0E
	brk $21.b		; 00 21
	inc $EFFF.w,X		; FE FF EF
	ldx $CD.b		; A6 CD
	sbc $35F00F.l		; EF 0F F0 35
	jsr ($1EE0.w,X)		; FC E0 1E
	ldx $03.b,Y		; B6 03
	stz $0E.b		; 64 0E
	ora ($10.b,X)		; 01 10
	asl $EFFF.w		; 0E FF EF
	ldx $DC.b		; A6 DC
	cpx #$F10E.w		; E0 0E F1
	bit $FC.b,X		; 34 FC
	sbc ($0E.b,X)		; E1 0E
	ldx $02.b,Y		; B6 02
	adc $0E.b		; 65 0E
	ora ($01.b,X)		; 01 01
	asl $EFFF.w		; 0E FF EF
	lda ($DB.b)		; B2 DB
	plb		; AB
	tyx		; BB
	tyx		; BB
	cmp $DCCDFD.l,X		; DF FD CD DC
	ldx $02.b,Y		; B6 02
	eor $1E.b,X		; 55 1E
	ora ($00.b,X)		; 01 00
	ora $B2FFFE.l		; 0F FE FF B2
	stp		; DB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	cmp $DCCDFD.l,X		; DF FD CD DC
	ldx $01.b,Y		; B6 01
	eor $1F.b,X		; 55 1F
	ora ($0F.b,X)		; 01 0F
	ora $96FEEF.l,X		; 1F EF FE 96
	lda $FBC2.w,Y		; B9 C2 FB
	sbc ($57.b),Y		; F1 57
	asl A		; 0A
	lda ($FF.b),Y		; B1 FF
	ldx $01.b,Y		; B6 01
	lsr $1F.b		; 46 1F
	ora ($F0.b,X)		; 01 F0
	brk $EF.b		; 00 EF
	inc $B996.w,X		; FE 96 B9
	cmp ($EB.b)		; D2 EB
	ora ($46.b,X)		; 01 46
	inc A		; 1A
	cmp ($FE.b,X)		; C1 FE
	ldx $01.b,Y		; B6 01
	rol $2F.b,X		; 36 2F
	ora ($FF.b,X)		; 01 FF
	bpl -17.b		; 10 EF
	sbc $E1B996.l		; EF 96 B9 E1
	xba		; EB
	sbc ($46.b)		; F2 46
	inc A		; 1A
	lda ($0E.b),Y		; B1 0E
	ldx $01.b,Y		; B6 01
	rol $3F.b		; 26 3F
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	sbc $F2A996.l		; EF 96 A9 F2
	wai		; CB
	ora ($36.b),Y		; 11 36
	inc A		; 1A
	cmp ($FF.b,X)		; C1 FF
	ldx $01.b,Y		; B6 01
	and $30.b		; 25 30
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	sbc $F29A96.l		; EF 96 9A F2
	wai		; CB
	ora ($25.b)		; 12 25
	tas		; 1B
	cmp ($FF.b,X)		; C1 FF
	ldx $10.b,Y		; B6 10
	asl $30.b,X		; 16 30
	bpl  -2.b		; 10 FE
	ora ($FF.b,X)		; 01 FF
	sbc $F19B96.l		; EF 96 9B F1
	wai		; CB
	ora ($25.b)		; 12 25
	tas		; 1B
	cmp ($0E.b,X)		; C1 0E
	ldx $10.b,Y		; B6 10
	ora $40.b,X		; 15 40
	bpl  -2.b		; 10 FE
	ora ($FF.b,X)		; 01 FF
	sbc $019B96.l		; EF 96 9B 01
	ldy $2412.w,X		; BC 12 24
	tas		; 1B
.ACCU 16
.INDEX 16
	rep #$F0		; C2 F0
	ldx $00.b,Y		; B6 00
	trb $51.b		; 14 51
	ora $FFF1FF.l,X		; 1F FF F1 FF
	inc $BB96.w,X		; FE 96 BB
	ora ($BC.b,X)		; 01 BC
	ora ($22.b)		; 12 22
	bit $FFC2.w		; 2C C2 FF
	ldx $10.b,Y		; B6 10
	tsb $43.b		; 04 43
	ora $1EF0FF.l		; 0F FF F0 1E
	inc $BC96.w,X		; FE 96 BC
	bpl -69.b		; 10 BB
	jsl $D02D12.l		; 22 12 2D D0
	ora $041FB6.l		; 0F B6 1F 04
	eor ($0F.b,S),Y		; 53 0F
	sbc $FE0FF0.l,X		; FF F0 0F FE
	stx $BC.b,Y		; 96 BC
	bpl -84.b		; 10 AC
	and $02.b,S		; 23 02
	asl $00D0.w,X		; 1E D0 00
	ldx $1F.b,Y		; B6 1F
	ora $54.b,S		; 03 54
	ora $00E0FF.l		; 0F FF E0 00
	sbc $2FAC96.l		; EF 96 AC 2F
	ldy $1F23.w		; AC 23 1F
	rol $F1D1.w,X		; 3E D1 F1
	ldx $00.b,Y		; B6 00
	sbc ($54.b,S),Y		; F3 54
	asl $F0FF.w,X		; 1E FF F0
	ora $CE96FE.l		; 0F FE 96 CE
	rol $339C.w		; 2E 9C 33
	ora $01E02F.l		; 0F 2F E0 01
	ldx $00.b,Y		; B6 00
	sbc ($64.b)		; F2 64
	asl $FFFF.w,X		; 1E FF FF
	brk $FE.b		; 00 FE
	stx $BF.b,Y		; 96 BF
	ora $FE449B.l,X		; 1F 9B 44 FE
	and $B612EF.l,X		; 3F EF 12 B6
	ora $1E6501.l		; 0F 01 65 1E
	sbc $FEF1E0.l,X		; FF E0 F1 FE
	stx $BE.b,Y		; 96 BE
	and $45AC.w		; 2D AC 45
	dec $D021.w,X		; DE 21 D0
	ora $B6.b,S		; 03 B6
	ora $1D5601.l		; 0F 01 56 1D
	sbc $FF00FF.l,X		; FF FF 00 FF
	stx $AF.b,Y		; 96 AF
	ora $459D.w,X		; 1D 9D 45
	cmp $E021.w,X		; DD 21 E0
	ora $B6.b,S		; 03 B6
	ora $1E55F2.l		; 0F F2 55 1E
	sbc $FFF1FF.l,X		; FF FF F1 FF
	stx $90.b,Y		; 96 90
	ora $459D.w,X		; 1D 9D 45
	cpy $E041.w		; CC 41 E0
	ora $B6.b,S		; 03 B6
	ora $1E46F2.l		; 0F F2 46 1E
	sbc $0FF0FF.l,X		; FF FF F0 0F
	stx $AF.b,Y		; 96 AF
	bit $549D.w		; 2C 9D 54
	cmp $F021.w		; CD 21 F0
	ora ($B6.b)		; 12 B6
	ora $2E45F2.l		; 0F F2 45 2E
	sbc $0FF0FF.l,X		; FF FF F0 0F
	stx $A0.b,Y		; 96 A0
	tas		; 1B
	ldx $DB44.w		; AE 44 DB
	and ($F0.b),Y		; 31 F0
	jsl $F20FB6.l		; 22 B6 0F F2
	and $2F.b,X		; 35 2F
	sbc $0FF0FE.l,X		; FF FE F0 0F
	stx $C1.b,Y		; 96 C1
	tas		; 1B
	ldx $CC53.w		; AE 53 CC
	and ($00.b,X)		; 21 00
	and $B6.b,S		; 23 B6
	sbc $3F4401.l,X		; FF 01 44 3F
	sbc $1FFFFF.l		; EF FF FF 1F
	stx $B2.b,Y		; 96 B2
	asl A		; 0A
	lda $22CB53.l		; AF 53 CB 22
	brk $23.b		; 00 23
	ldx $FF.b,Y		; B6 FF
	ora ($35.b,X)		; 01 35
	jsr $FFEF.w		; 20 EF FF
	sbc $B29600.l,X		; FF 00 96 B2
	asl A		; 0A
	lda $13BB54.l		; AF 54 BB 13
	ora ($22.b,X)		; 01 22
	rep #$0F		; C2 0F
	beq  19.b		; F0 13
	mvp $11,$32		; 44 32 11
	brk $00.b		; 00 00
	stx $E1.b,Y		; 96 E1
	ora #$63AF.w		; 09 AF 63
	tyx		; BB
	tsb $10.b		; 04 10
	and ($A6.b)		; 32 A6
	sbc $5604.w		; ED 04 56
	adc ($DE.b,X)		; 61 DE
	sbc $00EE.w		; ED EE 00
	stx $F1.b,Y		; 96 F1
	sbc $63A0.w,Y		; F9 A0 63
	plb		; AB
	ora $21.b,S		; 03 21
	jsl $04EDA6.l		; 22 A6 ED 04
	eor $62.b,X		; 55 62
	cmp $EDEE.w,X		; DD EE ED
	sbc ($96.b),Y		; F1 96
	ora ($DB.b),Y		; 11 DB
	bcc 115.b		; 90 73
	txy		; 9B
	tsb $21.b		; 04 21
	jsl $05EDA6.l		; 22 A6 ED 05
	bit $73.b,X		; 34 73
	cmp $DEEE.w,X		; DD EE DE
	beq -106.b		; F0 96
	and ($DA.b),Y		; 31 DA
	lda ($72.b,X)		; A1 72
	txs		; 9A
	tsb $31.b		; 04 31
	and ($A6.b),Y		; 31 A6
	sbc $3305.w		; ED 05 33
	stz $CE.b,X		; 74 CE
	inc $E1DE.w		; EE DE E1
	ldx #$EB00.w		; A2 00 EB
	txs		; 9A
	sbc $DE9BB9.l		; EF B9 9B DE
	brk $A6.b		; 00 A6
	sbc $3205.w		; ED 05 32
	stz $ED.b,X		; 74 ED
	inc $E0DE.w		; EE DE E0
	ldx #$EB00.w		; A2 00 EB
	txs		; 9A
	sbc $EF9BB9.l		; EF B9 9B EF
	brk $A6.b		; 00 A6
	sbc VMAIN.w		; ED 15 21
	adc $FD.b		; 65 FD
	sbc $D0EE.w		; ED EE D0
	stx $72.b,Y		; 96 72
	tsx		; BA
.ACCU 16
	rep #$60		; C2 60
	tax		; AA
	sbc $51.b		; E5 51
	bmi -90.b		; 30 A6
	sbc VMAIN.w		; ED 15 21
	eor $0C.b,X		; 55 0C
	inc $E0ED.w		; EE ED E0
	stx $72.b,Y		; 96 72
	tsx		; BA
.ACCU 16
.INDEX 16
	rep #$7F		; C2 7F
	txy		; 9B
	cpx $62.b		; E4 62
	bmi -90.b		; 30 A6
	cmp $2024.w,X		; DD 24 20
	eor $1D.b,X		; 55 1D
	sbc $DFEE.w		; ED EE DF
	ldx $42.b		; A6 42
	cmp $3FE2.w,X		; DD E2 3F
	cmp $32F2.w,X		; DD F2 32
	bpl -90.b		; 10 A6
	cmp $1F25.w,X		; DD 25 1F
	lsr $1D.b,X		; 56 1D
	sbc $C0EE.w		; ED EE C0
	ldx $42.b		; A6 42
	cmp $3FE2.w,X		; DD E2 3F
	cmp $32F2.w,X		; DD F2 32
	bpl -90.b		; 10 A6
	cmp $1F25.w,X		; DD 25 1F
	lsr $1E.b		; 46 1E
	dec $D0ED.w,X		; DE ED D0
	ldx #$FB02.w		; A2 02 FB
	ldy $C90F.w		; AC 0F C9
	txy		; 9B
	sbc ($21.b,X)		; E1 21
	ldx $DE.b		; A6 DE
	and $0F.b		; 25 0F
	rol $2E.b,X		; 36 2E
	dec $E0ED.w,X		; DE ED E0
	ldx #$FBF1.w		; A2 F1 FB
	lda $C90F.w		; AD 0F C9
	txs		; 9A
	sbc ($21.b),Y		; F1 21
	ldx $DF.b		; A6 DF
	bit $0F.b		; 24 0F
	rol $3E.b		; 26 3E
	dec $D0EE.w,X		; DE EE D0
	ldx $22.b		; A6 22
	sbc $4EE3.w		; ED E3 4E
	dec $42E2.w		; CE E2 42
	ora $23DFA6.l,X		; 1F A6 DF 23
	asl $4E26.w,X		; 1E 26 4E
	dec $E0ED.w,X		; DE ED E0
	ldx $12.b		; A6 12
	sbc $3DE4.w,X		; FD E4 3D
	dec $53E1.w,X		; DE E1 53
	ora $32DFA6.l		; 0F A6 DF 32
	asl $4F16.w,X		; 1E 16 4F
	dec $E0ED.w,X		; DE ED E0
	ldx $11.b		; A6 11
	ora $2EF3.w		; 0D F3 2E
	dec $53D2.w,X		; DE D2 53
	asl $E0A6.w		; 0E A6 E0
	jsl $50050F.l		; 22 0F 05 50
	cmp $E0FD.w,X		; DD FD E0
	ldx $10.b		; A6 10
	asl $2EF3.w		; 0E F3 2E
	cmp $63E1.w,X		; DD E1 63
	asl $E0A6.w		; 0E A6 E0
	and ($1F.b,X)		; 21 1F
	tsb $51.b		; 04 51
	cmp $E1EE.w,X		; DD EE E1
	ldx $0F.b		; A6 0F
	ora $ED2DF3.l		; 0F F3 2D ED
	sbc ($63.b,X)		; E1 63
	asl $E1A6.w		; 0E A6 E1
	ora ($1F.b),Y		; 11 1F
	ora $52.b,S		; 03 52
	cmp $E1EE.w,X		; DD EE E1
	ldx $0F.b		; A6 0F
	ora $ED2D02.l		; 0F 02 2D ED
	sbc ($64.b,X)		; E1 64
	ora $E1A6.w		; 0D A6 E1
	ora ($1E.b),Y		; 11 1E
	ora $52.b,S		; 03 52
	sbc $F1ED.w		; ED ED F1
	ldx $0E.b		; A6 0E
	brk $02.b		; 00 02
	and $E1DE.w		; 2D DE E1
	stz $0D.b		; 64 0D
	ldx $E1.b		; A6 E1
	ora ($00.b),Y		; 11 00
	sbc ($52.b)		; F2 52
	sbc $F2ED.w,X		; FD ED F2
	ldx $FD.b		; A6 FD
	brk $13.b		; 00 13
	ora $E1DE.w,X		; 1D DE E1
	stz $0C.b		; 64 0C
	ldx $01.b		; A6 01
	ora $53F21F.l,X		; 1F 1F F2 53
	sbc $F2ED.w,X		; FD ED F2
	ldx $FD.b		; A6 FD
	sbc ($13.b),Y		; F1 13
	ora $E1DE.w,X		; 1D DE E1
	stz $0D.b		; 64 0D
	ldx $F2.b		; A6 F2
	beq  31.b		; F0 1F
	sbc ($44.b),Y		; F1 44
	inc $01DE.w,X		; FE DE 01
	ldx $FC.b		; A6 FC
	brk $23.b		; 00 23
	ora $E1DE.w,X		; 1D DE E1
	adc $FD.b		; 65 FD
	stx $F3.b,Y		; 96 F3
	sbc $77C32E.l,X		; FF 2E C3 77
	tsb $F2BD.w		; 0C BD F2
	ldx $ED.b		; A6 ED
	beq  52.b		; F0 34
	ora $E1DE.w		; 0D DE E1
	adc $FD.b		; 65 FD
	ldx #$1012.w		; A2 12 10
	bpl -17.b		; 10 EF
	rol $64.b		; 26 64
	bpl   0.b		; 10 00
	ldx $ED.b		; A6 ED
	beq  67.b		; F0 43
	tsb $E1EE.w		; 0C EE E1
	adc $FE.b		; 65 FE
	ldx #$1023.w		; A2 23 10
	bpl -18.b		; 10 EE
	ora $64.b,X		; 15 64
	bpl   1.b		; 10 01
	ldx $ED.b		; A6 ED
	sbc ($43.b,X)		; E1 43
	sbc $E1EE.w,X		; FD EE E1
	adc $FE.b		; 65 FE
	ldx #$0023.w		; A2 23 00
	bpl -18.b		; 10 EE
	tsb $64.b		; 04 64
	bpl   1.b		; 10 01
	ldx $ED.b		; A6 ED
	cpx #$FD44.w		; E0 44 FD
	inc $66E1.w		; EE E1 66
	sbc $2096.w,X		; FD 96 20
	dec $C02D.w		; CE 2D C0
	and [$5F.b],Y		; 37 5F
	lda $A621.w,X		; BD 21 A6
	sbc $44E0.w		; ED E0 44
	sbc $E1EE.w,X		; FD EE E1
	ror $FD.b		; 66 FD
	stx $20.b,Y		; 96 20
	lda $26CF1E.l,X		; BF 1E CF 26
	bvs -66.b		; 70 BE
	jsr $FCA2.w		; 20 A2 FC
	tyx		; BB
	sbc ($2F.b,S),Y		; F3 2F
	stp		; DB
	txy		; 9B
	and [$53.b]		; 27 53
	stx $2F.b,Y		; 96 2F
	ldx $BF2E.w		; AE 2E BF
	bit $72.b		; 24 72
	lda $FDA220.l,X		; BF 20 A2 FD
	tyx		; BB
	sbc ($2F.b,S),Y		; F3 2F
	stp		; DB
	ldy $5327.w		; AC 27 53
	stx $3E.b,Y		; 96 3E
	ldx $BE2E.w		; AE 2E BE
	trb $72.b		; 14 72
	bne  16.b		; D0 10
	ldx $DE.b		; A6 DE
	sbc $EE0D34.l,X		; FF 34 0D EE
.ACCU 8
	sep #$64		; E2 64
	beq -94.b		; F0 A2
	eor ($0F.b,S),Y		; 53 0F
	ora $23CECB.l		; 0F CB CE 23
	and ($22.b,X)		; 21 22
	ldx #$CCFD.w		; A2 FD CC
	sbc ($30.b,S),Y		; F3 30
	cpx $26BC.w		; EC BC 26
	eor $96.b,X		; 55 96
	ora $2D9F.w		; 0D 9F 2D
	lda $7412.w,X		; BD 12 74
	ora $FEA22E.l		; 0F 2E A2 FE
	cpy $30F2.w		; CC F2 30
	cpx $26BD.w		; EC BD 26
	eor $96.b,X		; 55 96
	ora $2E9E.w,X		; 1D 9E 2E
	lda $6602.w		; AD 02 66
	brk $1E.b		; 00 1E
	ldx #$DCFE.w		; A2 FE DC
	sbc ($30.b)		; F2 30
	cpx $26BD.w		; EC BD 26
	adc $96.b		; 65 96
	tsb $1F9F.w		; 0C 9F 1F
	ldy $5602.w		; AC 02 56
	jsr $A61D.w		; 20 1D A6
	sbc $1E13F0.l		; EF F0 13 1E
	inc $54E2.w		; EE E2 54
	brk $96.b		; 00 96
	tas		; 1B
	ldx $AD1E.w,Y		; BE 1E AD
	brk $57.b		; 00 57
	and ($0E.b,X)		; 21 0E
	ldx $EF.b		; A6 EF
	beq  18.b		; F0 12
	ora $53E2EE.l,X		; 1F EE E2 53
	bpl -106.b		; 10 96
	phd		; 0B
	ldx $BC1E.w,Y		; BE 1E BC
	ora $1D3157.l		; 0F 57 31 1D
	ldx #$EE0E.w		; A2 0E EE
	beq  17.b		; F0 11
	sbc $25BE.w,X		; FD BE 25
	ror $96.b		; 66 96
	xba		; EB
	dec $BB0F.w		; CE 0F BB
	beq  71.b		; F0 47
	eor ($0D.b),Y		; 51 0D
	ldx $EF.b		; A6 EF
	brk $11.b		; 00 11
	bpl -18.b		; 10 EE
.INDEX 8
	sep #$52		; E2 52
	jsr $52A2.w		; 20 A2 52
	ora $AACAFF.l		; 0F FF CA AA
	cpy #$34.b		; C0 34
	and ($A2.b),Y		; 31 A2
	ora $1100EF.l		; 0F EF 00 11
	ora $35CF.w		; 0D CF 35
	adc [$96.b],Y		; 77 96
	stp		; DB
	cmp $CB0F.w		; CD 0F CB
	beq  39.b		; F0 27
	adc $FD.b,S		; 63 FD
	stx $DF.b,Y		; 96 DF
	sbc ($11.b),Y		; F1 11
	ora ($EB.b,X)		; 01 EB
	sbc $65.b		; E5 65
	eor ($96.b),Y		; 51 96
	cpy $0FCD.w		; CC CD 0F
	ldy $16E1.w,X		; BC E1 16
	stz $FB.b,X		; 74 FB
	stx $FF.b,Y		; 96 FF
	sbc ($10.b),Y		; F1 10
	ora ($FC.b,X)		; 01 FC
	cpx $55.b		; E4 55
	adc ($A2.b,X)		; 61 A2
	.db $42, $0F		; 42 0F
	inc $9ACA.w		; EE CA 9A
	ldx $3124.w,Y		; BE 24 31
	stx $E0.b,Y		; 96 E0
	sbc ($10.b),Y		; F1 10
	sbc ($0C.b),Y		; F1 0C
	sbc $45.b		; E5 45
	adc ($A6.b,X)		; 61 A6
	dec $00FE.w,X		; DE FE 00
	sbc $12F0.w		; ED F0 12
	.db $42, $FF		; 42 FF
	stx $EF.b,Y		; 96 EF
	ora ($10.b,X)		; 01 10
	beq  29.b		; F0 1D
	cpx $45.b		; E4 45
	adc ($A2.b,X)		; 61 A2
	eor ($0E.b,X)		; 41 0E
	inc $9ACA.w		; EE CA 9A
	lda $3114.w,X		; BD 14 31
	stx $F0.b,Y		; 96 F0
	ora ($1F.b,X)		; 01 1F
	beq  30.b		; F0 1E
	cpx $44.b		; E4 44
	bvs -90.b		; 70 A6
	dec $00FE.w,X		; DE FE 00
	sbc $11F0.w		; ED F0 11
	eor $FF.b,S		; 43 FF
	stx $E0.b,Y		; 96 E0
	ora ($1F.b,X)		; 01 1F
	cpx #$1F.b		; E0 1F
	cpx $44.b		; E4 44
	rts		; 60

	ldx $DE.b		; A6 DE
	inc $ED00.w,X		; FE 00 ED
	sbc ($01.b),Y		; F1 01
	eor $FF.b,S		; 43 FF
	stx $E0.b,Y		; 96 E0
	ora ($1F.b),Y		; 11 1F
	inc $E410.w,X		; FE 10 E4
	mvp $A6,$50		; 44 50 A6
	sbc $F0FF.w		; ED FF F0
	inc $01F0.w		; EE F0 01
	eor $0E.b,S		; 43 0E
	stx $F0.b,Y		; 96 F0
	ora ($1F.b),Y		; 11 1F
	sbc $340300.l		; EF 00 03 34
	rts		; 60

	ldx #$31.b		; A2 31
	ora $9ACAEE.l		; 0F EE CA 9A
	ldy $2003.w		; AC 03 20
	stx $F0.b,Y		; 96 F0
	and ($00.b,X)		; 21 00
	sbc $2304F1.l		; EF F1 04 23
	rts		; 60

	ldx #$31.b		; A2 31
	asl $CAEE.w		; 0E EE CA
	txs		; 9A
	plb		; AB
	sbc ($20.b,S),Y		; F3 20
	stx $F1.b,Y		; 96 F1
	ora ($0F.b)		; 12 0F
	inc $23F0.w,X		; FE F0 23
	and ($51.b,S),Y		; 33 51
	stx $AC.b,Y		; 96 AC
	dec $DBFF.w,X		; DE FF DB
	sbc ($F1.b,X)		; E1 F1
	adc [$0D.b],Y		; 77 0D
	stx $F1.b,Y		; 96 F1
	and ($0F.b,X)		; 21 0F
	inc $24F0.w,X		; FE F0 24
	trb $50.b		; 14 50
	stx $BC.b,Y		; 96 BC
	dec $CCF0.w		; CE F0 CC
	cpx #$01.b		; E0 01
	ror $1D.b		; 66 1D
	stx $F1.b,Y		; 96 F1
	and ($0F.b),Y		; 31 0F
	inc $43E0.w,X		; FE E0 43
	jsl $BC9650.l		; 22 50 96 BC
	cmp $DCF0.w,X		; DD F0 DC
	sbc $1F5502.l		; EF 02 55 1F
	stx $F1.b,Y		; 96 F1
	jsl $E0FEF0.l		; 22 F0 FE E0
	mvp $41,$12		; 44 12 41
	stx $BB.b,Y		; 96 BB
	cmp $DDF0.w,X		; DD F0 DD
	bne   2.b		; D0 02
	and $2F.b,X		; 35 2F
	stx $F1.b,Y		; 96 F1
	and ($00.b),Y		; 31 00
	sbc $44E0.w,X		; FD E0 44
	and ($31.b,X)		; 21 31
	stx $CC.b,Y		; 96 CC
	cmp $DC00.w		; CD 00 DC
	bne  17.b		; D0 11
	bit $3F.b,X		; 34 3F
	stx $01.b,Y		; 96 01
	and ($00.b),Y		; 31 00
	sbc $55EF.w,X		; FD EF 55
	jsr $9621.w		; 20 21 96
	jmp.w [$F0CD]		; DC CD F0
	cpx $11EF.w		; EC EF 11
	and $31.b,S		; 23 31
	stx $01.b,Y		; 96 01
	and ($10.b,X)		; 21 10
	sbc $55EF.w,X		; FD EF 55
	jsr $9611.w		; 20 11 96
	cpx $0FBD.w		; EC BD 0F
	sbc $20DF.w		; ED DF 20
	and $32.b,S		; 23 32
	stx $F1.b,Y		; 96 F1
	and ($11.b,X)		; 21 11
	sbc $56DF.w,X		; FD DF 56
	jsr $9601.w		; 20 01 96
	cpx $FFCD.w		; EC CD FF
	sbc $11DF.w,X		; FD DF 11
	ora ($33.b)		; 12 33
	stx $00.b,Y		; 96 00
	jsl $CFFD11.l		; 22 11 FD CF
	eor [$2F.b],Y		; 57 2F
	ora ($96.b,X)		; 01 96
	sbc $E0CC.w		; ED CC E0
	sbc $22EE.w,X		; FD EE 22
	sbc ($33.b)		; F2 33
	stx $00.b,Y		; 96 00
	and ($20.b),Y		; 31 20
	ora $47C0.w		; 0D C0 47
	rol $96F1.w,X		; 3E F1 96
	sbc $FFBC.w,X		; FD BC FF
	inc $13DF.w,X		; FE DF 13
	beq  68.b		; F0 44
	stx $00.b,Y		; 96 00
	jsl $DFFD21.l		; 22 21 FD DF
	eor [$3E.b]		; 47 3E
.INDEX 8
	sep #$96		; E2 96
	jsr ($E0CC.w,X)		; FC CC E0
	inc $21DF.w,X		; FE DF 21
	ora $109644.l		; 0F 44 96 10
	ora ($22.b)		; 12 22
	sbc $47DF.w,X		; FD DF 47
	rol $96F1.w		; 2E F1 96
	sbc $EFCC.w,X		; FD CC EF
	asl $12DF.w		; 0E DF 12
	sbc $119644.l,X		; FF 44 96 11
	ora ($23.b)		; 12 23
	sbc $46C0.w		; ED C0 46
	rol $96E1.w,X		; 3E E1 96
	tsb $E0DB.w		; 0C DB E0
	ora $12EF.w		; 0D EF 12
	sbc $209644.l		; EF 44 96 20
	and ($33.b,X)		; 21 33
	sbc $46DF.w		; ED DF 46
	rol $96E0.w,X		; 3E E0 96
	ora $EFCB.w,X		; 1D CB EF
	asl $12EF.w		; 0E EF 12
	inc $9644.w		; EE 44 96
	and ($01.b),Y		; 31 01
	eor $FC.b,S		; 43 FC
	cmp $EF2F46.l,X		; DF 46 2F EF
	stx $1D.b,Y		; 96 1D
	cpy $0ED0.w		; CC D0 0E
	sbc $34EF11.l		; EF 11 EF 34
	stx $31.b,Y		; 96 31
	ora ($44.b,X)		; 01 44
	xce		; FB
	sbc $EF3E45.l		; EF 45 3E EF
	stx $1E.b,Y		; 96 1E
	wai		; CB
	bne  15.b		; D0 0F
	cmp $35DE21.l,X		; DF 21 DE 35
	stx $31.b,Y		; 96 31
	bpl  84.b		; 10 54
	cpx $44D0.w		; EC D0 44
	and $0E96D0.l,X		; 3F D0 96 0E
	cpy $1EDF.w		; CC DF 1E
	sbc $25DE12.l		; EF 12 DE 25
	stx $32.b,Y		; 96 32
	ora ($53.b,X)		; 01 53
	jsr ($44D0.w,X)		; FC D0 44
	and $0F96EF.l		; 2F EF 96 0F
	wai		; CB
	cmp $21EF0F.l,X		; DF 0F EF 21
	sbc $9625.w		; ED 25 96
	.db $42, $F1		; 42 F1
	mvn $C0,$FC		; 54 FC C0
	mvn $EF,$2E		; 54 2E EF
	stx $1E.b,Y		; 96 1E
	stp		; DB
	cmp $11E00F.l,X		; DF 0F E0 11
	cmp $9625.w,X		; DD 25 96
	.db $42, $01		; 42 01
	eor ($0C.b,S),Y		; 53 0C
	cpy #$54.b		; C0 54
	ora $0E96FF.l		; 0F FF 96 0E
	jmp.w [$0EDF]		; DC DF 0E
	sbc $14ED20.l,X		; FF 20 ED 14
	stx $53.b,Y		; 96 53
	sbc ($54.b),Y		; F1 54
	tsb $53D0.w		; 0C D0 53
	ora $0E96FF.l		; 0F FF 96 0E
	cmp $0EDF.w		; CD DF 0E
	sbc $14DE20.l,X		; FF 20 DE 14
	stx $53.b,Y		; 96 53
	sbc ($54.b),Y		; F1 54
	sbc $52C1.w,X		; FD C1 52
	ora $FE960F.l		; 0F 0F 96 FE
	jmp.w [$0EEE]		; DC EE 0E
	beq  32.b		; F0 20
	dec $9604.w,X		; DE 04 96
	eor ($00.b,S),Y		; 53 00
	mvn $D1,$0C		; 54 0C D1
	eor $F0.b,S		; 43 F0
	sbc $A9FC86.l,X		; FF 86 FC A9
	lda $D2FC.w,X		; BD FC D2
	and $9607AC.l,X		; 3F AC 07 96
	adc $01.b,S		; 63 01
	eor $FD.b		; 45 FD
	cmp ($42.b),Y		; D1 42
	asl $A200.w		; 0E 00 A2
	jsl $CCEC1F.l		; 22 1F EC CC
	tyx		; BB
	cpy $BBCC.w		; CC CC BB
	stx $36.b,Y		; 96 36
	bmi  21.b		; 30 15
	eor $2F14DE.l		; 4F DE 14 2F
	sbc $1F22A2.l,X		; FF A2 22 1F
	cpx $BBCC.w		; EC CC BB
	cpy $BBCC.w		; CC CC BB
	stx $45.b,Y		; 96 45
	and ($05.b),Y		; 31 05
	eor $1F24DE.l		; 4F DE 24 1F
	sbc $CA0E86.l,X		; FF 86 0E CA
	plb		; AB
	inc $31CE.w		; EE CE 31
	jmp.w [$96DF]		; DC DF 96
	and $31.b,X		; 35 31
	ora $4F.b,X		; 15 4F
	dec $1F24.w,X		; DE 24 1F
	cpx #$86.b		; E0 86
	inc $ACD9.w,X		; FE D9 AC
	inc $32BE.w		; EE BE 32
	cmp $96DE.w		; CD DE 96
	and $31.b,X		; 35 31
	and $3F.b		; 25 3F
	dec $1E34.w,X		; DE 34 1E
	sbc $BBFF86.l,X		; FF 86 FF BB
	ldy $BEED.w,X		; BC ED BE
	and ($CC.b)		; 32 CC
	inc $3496.w		; EE 96 34
	eor ($25.b,X)		; 41 25
	jsr $34DE.w		; 20 DE 34
	asl $86EF.w,X		; 1E EF 86
	asl $ADDA.w		; 0E DA AD
	inc $30BE.w		; EE BE 30
	cmp $96EE.w,X		; DD EE 96
	and $32.b		; 25 32
	bit $2F.b		; 24 2F
	cpx #$34.b		; E0 34
	sbc $F186EE.l,X		; FF EE 86 F1
	dex		; CA
	lda $BEFC.w,X		; BD FC BE
	rti		; 40

	ldx $96EE.w,Y		; BE EE 96
	bit $42.b		; 24 42
	bit $20.b		; 24 20
	bne  67.b		; D0 43
	inc $86FE.w,X		; FE FE 86
.ACCU 8
.INDEX 8
	sep #$BB		; E2 BB
	lda $CEFC.w,X		; BD FC CE
	sbc ($0B.b,S),Y		; F3 0B
	inc $F296.w		; EE 96 F2
	eor $24.b,S		; 43 24
	and ($FE.b)		; 32 FE
	trb $20.b		; 14 20
	inc $CE86.w		; EE 86 CE
	ora $DFAB.w,X		; 1D AB DF
	jmp.w [$FCE2]		; DC E2 FC
	sbc $43F196.l		; EF 96 F1 43
	and ($42.b,S),Y		; 33 42
	inc $2F14.w,X		; FE 14 2F
	inc $BD86.w,X		; FE 86 BD
	ora $DCEF9C.l		; 0F 9C EF DC
	beq  -4.b		; F0 FC
	sbc $430096.l		; EF 96 00 43
	bit $41.b,X		; 34 41
	sbc $EF3E14.l		; EF 14 3E EF
	stx $BC.b		; 86 BC
	brk $AB.b		; 00 AB
	inc $E0DD.w,X		; FE DD E0
	jsr ($96E0.w,X)		; FC E0 96
	sbc ($34.b),Y		; F1 34
	bit $41.b		; 24 41
	inc $2F33.w,X		; FE 33 2F
	sbc $F1AC86.l		; EF 86 AC F1
	stz $EDFE.w		; 9C FE ED
	cpx #$DC.b		; E0 DC
	beq -106.b		; F0 96
	sbc ($33.b),Y		; F1 33
	bit $42.b,X		; 34 42
	cmp $EF2E34.l,X		; DF 34 2E EF
	stx $AB.b		; 86 AB
	sbc ($BB.b),Y		; F1 BB
	sbc $CCF0DD.l,X		; FF DD F0 CC
	beq -106.b		; F0 96
	sbc ($33.b),Y		; F1 33
	bit $51.b,X		; 34 51
	cmp $FE1E44.l,X		; DF 44 1E FE
	stx $B9.b		; 86 B9
	sbc ($DC.b,X)		; E1 DC
	inc $FFED.w,X		; FE ED FF
	cpy $96E1.w		; CC E1 96
	brk $32.b		; 00 32
	mvp $D0,$51		; 44 51 D0
	mvp $FE,$0E		; 44 0E FE
	stx $AB.b		; 86 AB
	cmp ($DC.b),Y		; D1 DC
	inc $FFFD.w,X		; FE FD FF
	ldy $9600.w		; AC 00 96
	ora ($2F.b,X)		; 01 2F
	and ($54.b,S),Y		; 33 54
	asl $4004.w,X		; 1E 04 40
	sbc $0F31A2.l		; EF A2 31 0F
	sbc $DDDDEE.l,X		; FF EE DD DD
	wai		; CB
	plb		; AB
	stx $1F.b,Y		; 96 1F
	cop $33.b		; 02 33
	eor $0E.b,X		; 55 0E
	ora $40.b		; 05 40
	cmp $0F31A2.l,X		; DF A2 31 0F
	sbc $DDDDED.l,X		; FF ED DD DD
	wai		; CB
	plb		; AB
	stx $10.b,Y		; 96 10
	ora ($24.b,X)		; 01 24
	eor $0E.b,X		; 55 0E
	ora $30.b,X		; 15 30
	cmp $9ADA86.l,X		; DF 86 DA 9A
	ora ($DD.b),Y		; 11 DD
	cpx #$00.b		; E0 00
	lda #$D1.b		; A9 D1
	stx $10.b,Y		; 96 10
	ora ($23.b,X)		; 01 23
	adc $0E.b		; 65 0E
	ora $3F.b,X		; 15 3F
	inc $FD96.w,X		; FE 96 FD
	cmp $FE01.w		; CD 01 FE
	beq   0.b		; F0 00
	cmp $96E0.w,X		; DD E0 96
	bpl  16.b		; 10 10
	bit $55.b		; 24 55
	asl $3F15.w,X		; 1E 15 3F
	sbc $FE31A2.l		; EF A2 31 FE
	sbc $EEDDED.l		; EF ED DD EE
	wai		; CB
	plb		; AB
	stx $10.b,Y		; 96 10
	bpl  35.b		; 10 23
	adc $1E.b		; 65 1E
	and $2F.b		; 25 2F
	sbc $FE31A2.l		; EF A2 31 FE
	sbc $EEDEFE.l		; EF FE DE EE
	wai		; CB
	tax		; AA
	stx $11.b,Y		; 96 11
	brk $14.b		; 00 14
	adc $1E.b		; 65 1E
	and $2F.b		; 25 2F
	sbc $CDED96.l		; EF 96 ED CD
	ora ($0E.b,X)		; 01 0E
.INDEX 8
	sep #$1F		; E2 1F
	cmp $96EF.w		; CD EF 96
	ora ($00.b)		; 12 00
	tsb $65.b		; 04 65
	asl $2135.w,X		; 1E 35 21
	inc $FE96.w,X		; FE 96 FE
	stp		; DB
	sbc $22EE10.l		; EF 10 EE 22
	jsr ($96CE.w,X)		; FC CE 96
	brk $21.b		; 00 21
	brk $46.b		; 00 46
	bvc -13.b		; 50 F3
	eor ($FE.b)		; 52 FE
	stx $EE.b,Y		; 96 EE
	jmp.w [$11DF]		; DC DF 11
	inc $FC22.w		; EE 22 FC
	dec $F196.w		; CE 96 F1
	ora ($00.b),Y		; 11 00
	lsr $51.b		; 46 51
	sbc ($52.b,S),Y		; F3 52
	sbc $CDEE96.l		; EF 96 EE CD
	cmp $23EF10.l,X		; DF 10 EF 23
	cpx $96CE.w		; EC CE 96
	sbc ($21.b,X)		; E1 21
	brk $46.b		; 00 46
	.db $42, $03		; 42 03
	eor ($FE.b,X)		; 41 FE
	stx $FE.b,Y		; 96 FE
	cmp $1FDF.w		; CD DF 1F
	sbc $DEEB33.l		; EF 33 EB DE
	stx $E0.b,Y		; 96 E0
	jsl $42460F.l		; 22 0F 46 42
	tsb $31.b		; 04 31
	asl $EE96.w		; 0E 96 EE
	jmp.w [$10DF]		; DC DF 10
	sbc $BEEC33.l		; EF 33 EC BE
	stx $F0.b,Y		; 96 F0
	and ($00.b,X)		; 21 00
	rol $42.b,X		; 36 42
	trb $32.b		; 14 32
	inc $EE96.w,X		; FE 96 EE
	cpy $1FEF.w		; CC EF 1F
	sbc $DDFB42.l		; EF 42 FB DD
	stx $E0.b,Y		; 96 E0
	jsl $423500.l		; 22 00 35 42
	bit $31.b		; 24 31
	sbc $CDED96.l,X		; FF 96 ED CD
	bne  15.b		; D0 0F
	cpx #$33.b		; E0 33
	cpx $96CE.w		; EC CE 96
	sbc $350031.l		; EF 31 00 35
	eor $23.b,S		; 43 23
	and ($FF.b),Y		; 31 FF
	stx $EE.b,Y		; 96 EE
	cpy $01EF.w		; CC EF 01
	inc $2F04.w		; EE 04 2F
	lda $ED96.w,X		; BD 96 ED
	sbc ($3F.b)		; F2 3F
	ora $54.b,S		; 03 54
	and ($42.b)		; 32 42
	bpl -106.b		; 10 96
	sbc $00DDCD.l		; EF CD DD 00
	sbc $3E14.w		; ED 14 3E
	cmp $ED96.w		; CD 96 ED
.ACCU 8
	sep #$21		; E2 21
	sbc ($54.b,S),Y		; F3 54
	and ($32.b,S),Y		; 33 32
	bpl -106.b		; 10 96
	inc $CEDD.w,X		; FE DD CE
	sbc ($EC.b),Y		; F1 EC
	ora $3E.b,X		; 15 3E
	cpy $EE96.w		; CC 96 EE
.INDEX 8
	sep #$11		; E2 11
	ora $54.b,S		; 03 54
	and ($32.b,S),Y		; 33 32
	bpl -106.b		; 10 96
	inc $CEDD.w,X		; FE DD CE
	beq -19.b		; F0 ED
	trb $4E.b		; 14 4E
	cmp $DD96.w		; CD 96 DD
	sbc ($20.b),Y		; F1 20
	ora ($55.b)		; 12 55
	bit $32.b		; 24 32
	brk $96.b		; 00 96
	inc $DEEC.w,X		; FE EC DE
	beq -35.b		; F0 DD
	ora $3F.b,X		; 15 3F
	cmp $DE96.w		; CD 96 DE
	cmp ($21.b),Y		; D1 21
	ora ($45.b)		; 12 45
	bit $32.b,X		; 34 32
	ora ($96.b,X)		; 01 96
	inc $CFCD.w,X		; FE CD CF
	beq -35.b		; F0 DD
	asl $3E.b		; 06 3E
	cmp $DD96.w,X		; DD 96 DD
	cpx #$12.b		; E0 12
	jsl $413444.l		; 22 44 34 41
	ora ($96.b,X)		; 01 96
	inc $DFDC.w,X		; FE DC DF
	sbc $3F05ED.l,X		; FF ED 05 3F
	cmp $DD96.w,X		; DD 96 DD
	cpx #$11.b		; E0 11
	and $44.b,S		; 23 44
	bit $31.b,X		; 34 31
	bpl -106.b		; 10 96
	asl $DFDC.w		; 0E DC DF
	sbc $3005EC.l,X		; FF EC 05 30
	cpy #$96.b		; C0 96
	sbc $00DD.w		; ED DD 00
	and $24.b,S		; 23 24
	bit $43.b,X		; 34 43
	and ($96.b,X)		; 21 96
	ora $FFCEED.l		; 0F ED CE FF
	inc $43D0.w		; EE D0 43
	asl $DD96.w		; 0E 96 DD
	cmp $23F0.w,X		; DD F0 23
	and ($44.b,S),Y		; 33 44
	eor $11.b,S		; 43 11
	ldx #$76.b		; A2 76
	eor ($10.b,S),Y		; 53 10
	sbc $E0CCED.l,X		; FF ED CC E0
	ora $DDED96.l		; 0F 96 ED DD
	sbc $444323.l,X		; FF 23 43 44
	.db $42, $20		; 42 20
	ldx #$76.b		; A2 76
	eor ($10.b,S),Y		; 53 10
	sbc $E0CCED.l,X		; FF ED CC E0
	ora $CEED96.l		; 0F 96 ED CE
	bne  36.b		; D0 24
	and ($35.b,S),Y		; 33 35
	.db $42, $20		; 42 20
	stx $11.b		; 86 11
	cmp #$AB.b		; C9 AB
	sbc $CFCB.w		; ED CB CF
	adc $3D.b		; 65 3D
	stx $DD.b,Y		; 96 DD
	cmp $24EF.w,X		; DD EF 24
	bit $34.b,X		; 34 34
	eor $10.b,S		; 43 10
	stx $20.b		; 86 20
	cmp $DB9E.w,Y		; D9 9E DB
	cmp $54B0.w		; CD B0 54
	and $DDDD96.l,X		; 3F 96 DD DD
	cmp $353325.l,X		; DF 25 33 35
	.db $42, $20		; 42 20
	stx $01.b		; 86 01
	phx		; DA
	lda $BBDC.w		; AD DC BB
	sbc $962044.l		; EF 44 20 96
	cpx $EEDD.w		; EC DD EE
	ora $43.b,X		; 15 43
	and $42.b,X		; 35 42
	ora ($86.b),Y		; 11 86
	ora ($DB.b,X)		; 01 DB
	lda $BCDB.w		; AD DB BC
	sbc $963223.l		; EF 23 32 96
	sbc $DECD.w		; ED CD DE
	ora $5F.b,X		; 15 5F
	eor $44.b,S		; 43 44
	jsl $1FF186.l		; 22 86 F1 1F
	plb		; AB
	jmp.w [$DFBA]		; DC BA DF
	sbc ($23.b),Y		; F1 23
	stx $1F.b,Y		; 96 1F
	cmp $E2CD.w		; CD CD E2
	mvn $53,$33		; 54 33 53
	bmi -122.b		; 30 86
	ora ($2E.b),Y		; 11 2E
	ldy $BADC.w,X		; BC DC BA
	cmp $9614F0.l,X		; DF F0 14 96
	ora $D2DDDC.l,X		; 1F DC DD D2
	mvn $43,$34		; 54 34 43
	and ($86.b,X)		; 21 86
	cop $1F.b		; 02 1F
	wai		; CB
	jmp.w [$D0BA]		; DC BA D0
	ora $2F96F4.l		; 0F F4 96 2F
	jmp.w [$E1DC]		; DC DC E1
	eor $33.b,X		; 55 33
	mvp $86,$11		; 44 11 86
	ora ($20.b),Y		; 11 20
	ldy $BBDB.w,X		; BC DB BB
	cpx #$0E.b		; E0 0E
	sbc $96.b,S		; E3 96
	jsr $DCCD.w		; 20 CD DC
	sbc ($45.b,X)		; E1 45
	eor $34.b,S		; 43 34
	ora ($86.b),Y		; 11 86
	ora ($11.b),Y		; 11 11
	cmp $ABDB.w		; CD DB AB
	sbc ($0E.b,X)		; E1 0E
	cmp ($96.b,S),Y		; D3 96
	jsr $CDCD.w		; 20 CD CD
	sbc ($45.b,X)		; E1 45
	.db $42, $43		; 42 43
	and ($86.b,X)		; 21 86
	ora ($11.b,X)		; 01 11
	cmp $BCCB.w,X		; DD CB BC
	cmp ($1C.b)		; D2 1C
	cmp ($96.b)		; D2 96
	jsr $CCDD.w		; 20 DD CC
	sep #$44		; E2 44
	eor $43.b,S		; 43 43
	jsr $F186.w		; 20 86 F1
	and ($ED.b),Y		; 31 ED
	wai		; CB
	ldy $0DD2.w,X		; BC D2 0D
	cmp ($96.b),Y		; D1 96
	jsr $CDDD.w		; 20 DD CD
	sbc ($44.b,X)		; E1 44
	eor $33.b,S		; 43 33
	jsr $0186.w		; 20 86 01
	ora ($2E.b)		; 12 2E
	jsr ($C0B9.w,X)		; FC B9 C0
	ora ($CC.b),Y		; 11 CC
	stx $02.b,Y		; 96 02
	asl $DEDC.w		; 0E DC DE
	trb $43.b		; 14 43
	and ($32.b,S),Y		; 33 32
	stx $0F.b		; 86 0F
	ora ($21.b)		; 12 21
	jmp.w [$B0BC]		; DC BC B0
	jsr $96BD.w		; 20 BD 96
	ora ($1E.b,X)		; 01 1E
	cmp $13DE.w		; CD DE 13
	mvp $31,$24		; 44 24 31
	stx $1F.b		; 86 1F
	cop $31.b		; 02 31
	xba		; EB
	wai		; CB
	cmp $86BC3F.l,X		; DF 3F BC 86
	ora ($2D.b,X)		; 01 2D
	sta $379D.w,Y		; 99 9D 37
	adc [$57.b]		; 67 57
	stz $86.b		; 64 86
	sbc $FB3202.l,X		; FF 02 32 FB
	ldy $10D0.w,X		; BC D0 10
	ldy $DEA2.w,X		; BC A2 DE
	inc $A9CB.w		; EE CB A9
	ldy $13E0.w		; AC E0 13
	eor $86.b		; 45 86
	ora DMASRC0L.w		; 0D 02 43
	cpx $E0BC.w		; EC BC E0
	ora $0096CB.l,X		; 1F CB 96 00
	ora $23DEDD.l		; 0F DD DE 23
	and ($24.b)		; 32 24
	eor ($86.b,X)		; 41 86
	inc $54F3.w,X		; FE F3 54
	xba		; EB
	ldy $1DE2.w,X		; BC E2 1D
	cmp $FE86.w		; CD 86 FE
	asl $BCB9.w,X		; 1E B9 BC
	rol $63.b,X		; 36 63
	eor [$73.b],Y		; 57 73
	stx $0E.b		; 86 0E
	sbc $45.b,S		; E3 45
	asl A		; 0A
	lda $2CE2.w,X		; BD E2 2C
	dec $EEA2.w		; CE A2 EE
	sbc $AACB.w		; ED CB AA
	ldy $02EF.w,X		; BC EF 02
	mvp $0D,$86		; 44 86 0D
	ora ($64.b,X)		; 01 64
	asl A		; 0A
	cmp $21E0.w		; CD E0 21
	jmp.w [$EEA2]		; DC A2 EE
	inc $BADC.w		; EE DC BA
	plb		; AB
	dec $13F0.w		; CE F0 13
	stx $41.b		; 86 41
	bne   6.b		; D0 06
	bvc -68.b		; 50 BC
	dec $CB31.w,X		; DE 31 CB
	stx $FF.b,Y		; 96 FF
	sbc $F1DEFE.l,X		; FF FE DE F1
	and $11.b,S		; 23 11
	mvp $40,$86		; 44 86 40
	cmp $AC5215.l,X		; DF 15 52 AC
	cmp $96BC32.l,X		; DF 32 BC 96
	sbc $DFFEFF.l		; EF FF FE DF
	beq  50.b		; F0 32
	ora ($44.b),Y		; 11 44
	stx $4F.b		; 86 4F
	sbc $BC6114.l		; EF 14 61 BC
	sbc $96BB32.l		; EF 32 BB 96
	inc $FEFF.w,X		; FE FF FE
	inc $32F0.w		; EE F0 32
	ora ($34.b),Y		; 11 34
	stx $60.b		; 86 60
	cmp $CD5114.l,X		; DF 14 51 CD
	sbc $96AC32.l		; EF 32 AC 96
	inc $EFFF.w,X		; FE FF EF
	cmp $1022F0.l,X		; DF F0 22 10
	eor $86.b		; 45 86
	bvc -33.b		; 50 DF
	and $42.b,S		; 23 42
	jmp.w [$41EF]		; DC EF 41
	tyx		; BB
	stx $FE.b,Y		; 96 FE
	sbc $F0EFFE.l		; EF FE EF F0
	jsl $863501.l		; 22 01 35 86
	adc ($DE.b),Y		; 71 DE
	and $41.b,S		; 23 41
	sbc $32EF.w		; ED EF 32
	plb		; AB
	stx $FF.b,Y		; 96 FF
	inc $FEFE.w		; EE FE FE
	ora $351022.l		; 0F 22 10 35
	stx $71.b		; 86 71
	cmp $EE3213.l,X		; DF 13 32 EE
	bne  64.b		; D0 40
	lda $CC86.w,X		; BD 86 CC
	cmp $ECDF.w		; CD DF EC
	inc $4112.w		; EE 12 41
	asl $96.b,X		; 16 96
	eor ($1F.b,S),Y		; 53 1F
	sbc ($12.b),Y		; F1 12
	brk $FF.b		; 00 FF
	ora ($0E.b,X)		; 01 0E
	stx $CD.b		; 86 CD
	wai		; CB
	cpx $E0DD.w		; EC DD E0
	sbc ($42.b)		; F2 42
	ora $96.b,X		; 15 96
	mvp $01,$1F		; 44 1F 01
	ora ($00.b,X)		; 01 00
	brk $F2.b		; 00 F2
	asl $BD86.w		; 0E 86 BD
	ldy $DDCD.w,X		; BC CD DD
	cpx #$01.b		; E0 01
	and ($15.b,S),Y		; 33 15
	sta ($37.b)		; 92 37
	adc [$77.b],Y		; 77 77
	adc [$66.b],Y		; 77 66
	adc $45.b		; 65 45
	eor ($86.b,S),Y		; 53 86
	cpy $CEBC.w		; CC BC CE
	cmp $01E1.w		; CD E1 01
	ora ($34.b,S),Y		; 13 34
	sta ($37.b)		; 92 37
	adc [$77.b],Y		; 77 77
	ror $55.b,X		; 76 55
	ror $55.b		; 66 55
	eor ($86.b,S),Y		; 53 86
	wai		; CB
	tyx		; BB
	cmp $FFDE.w,X		; DD DE FF
	ora $923323.l,X		; 1F 23 33 92
	rol $77.b		; 26 77
	adc [$76.b],Y		; 77 76
	eor $66.b,X		; 55 66
	lsr $53.b,X		; 56 53
	stx $DA.b		; 86 DA
	ldy $DEDC.w,X		; BC DC DE
	sbc ($0F.b,X)		; E1 0F
	trb $33.b		; 14 33
	stx $77.b		; 86 77
	.db $42, $11		; 42 11
	asl $41F0.w		; 0E F0 41
	sbc ($0E.b),Y		; F1 0E
	stx $BB.b		; 86 BB
	ldy $EECC.w		; AC CC EE
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	ora $53.b,S		; 03 53
	stx $76.b		; 86 76
	eor ($22.b),Y		; 51 22
	sbc $52E1.w,X		; FD E1 52
	beq  14.b		; F0 0E
	stx $CA.b		; 86 CA
	ldy $CECD.w		; AC CD CE
	sbc ($0F.b)		; F2 0F
	cpx $F5.b		; E4 F5
	stx $36.b		; 86 36
	stz $22.b,X		; 74 22
	and $3015DE.l		; 2F DE 15 30
	cmp ($86.b),Y		; D1 86
	cpx $BDB9.w		; EC B9 BD
	cmp $20D0.w,X		; DD D0 20
	inc $8627.w,X		; FE 27 86
	and $64.b,X		; 35 64
	eor $1E.b,S		; 43 1E
	dec $3F26.w		; CE 26 3F
	cpx #$86.b		; E0 86
	sbc $AE9A.w,X		; FD 9A AE
	cmp $11D0.w,X		; DD D0 11
	sbc $8636.w		; ED 36 86
	mvn $55,$63		; 54 63 55
	trb $27BE.w		; 1C BE 27
	eor $0D86D0.l		; 4F D0 86 0D
	sta $EDAD.w,Y		; 99 AD ED
	cmp $27ED21.l,X		; DF 21 ED 27
	stx $63.b		; 86 63
	mvn $2B,$55		; 54 55 2B
	cmp $4F37.w		; CD 37 4F
	bne -106.b		; D0 96
	asl $DFDC.w		; 0E DC DF
	inc $01F0.w,X		; FE F0 01
	inc $8614.w,X		; FE 14 86
	eor $43.b		; 45 43
	ror $1B.b,X		; 76 1B
	ldx $5F37.w		; AE 37 5F
	cmp $DC0F96.l		; CF 96 0F DC
	dec $F0FE.w,X		; DE FE F0
	ora ($EE.b),Y		; 11 EE
	trb $A2.b		; 14 A2
	ora ($12.b,X)		; 01 12
	eor $54.b		; 45 54
	and ($24.b,X)		; 21 24
	mvn $96,$32		; 54 32 96
	ora $FECFDC.l		; 0F DC CF FE
	beq  17.b		; F0 11
	inc $9604.w		; EE 04 96
	.db $42, $12		; 42 12
	and $0D.b,X		; 35 0D
	cmp $EF3F24.l		; CF 24 3F EF
	ldx #$21.b		; A2 21
	asl $CBCC.w		; 0E CC CB
	tyx		; BB
	cmp $CECB.w		; CD CB CE
	stx $42.b,Y		; 96 42
	ora ($45.b),Y		; 11 45
	ora ($DC.b,X)		; 01 DC
	sbc ($43.b)		; F2 43
	inc $E186.w,X		; FE 86 E1
	cmp $DF99.w,Y		; D9 99 DF
	dec $3BE3.w,X		; DE E3 3B
	lda ($96.b,X)		; A1 96
	mvp $14,$21		; 44 21 14
	bvc -35.b		; 50 DD
	sbc ($42.b)		; F2 42
	asl $22A2.w		; 0E A2 22
	bpl -20.b		; 10 EC
	cpy $BCBB.w		; CC BB BC
	jmp.w [$96AB]		; DC AB 96
	eor $21.b		; 45 21
	trb $41.b		; 14 41
	jmp.w [$41F3]		; DC F3 41
	asl $22A2.w		; 0E A2 22
	bpl -20.b		; 10 EC
	cpy $BCBB.w		; CC BB BC
	jmp.w [$96AB]		; DC AB 96
	eor $21.b		; 45 21
	trb $41.b		; 14 41
	jmp.w [$41F3]		; DC F3 41
	asl $22A2.w		; 0E A2 22
	bpl -20.b		; 10 EC
	cpy $BCBB.w		; CC BB BC
	cpy $96BB.w		; CC BB 96
	eor $30.b		; 45 30
	trb $51.b		; 14 51
	cmp $32F3.w		; CD F3 32
	sbc $1032A2.l,X		; FF A2 32 10
	cpx $BBCC.w		; EC CC BB
	ldy $BBDC.w,X		; BC DC BB
	stx $36.b,Y		; 96 36
	rti		; 40

	tsb $51.b		; 04 51
	cmp $31F4.w		; CD F4 31
	sbc $DBFE86.l,X		; FF 86 FE DB
	sta $ECDE.w,Y		; 99 DE EC
	ora ($1B.b,S),Y		; 13 1B
	lda $403596.l,X		; BF 96 35 40
	ora $51.b		; 05 51
	cmp $3003.w		; CD 03 30
	beq -122.b		; F0 86
	sbc $DF9ADA.l		; EF DA 9A DF
	cmp $0D12.w		; CD 12 0D
	ldx $3597.w,Y		; BE 97 35
	eor ($04.b,X)		; 41 04
	bvc -20.b		; 50 EC
	tsb $30.b		; 04 30
	cpx #$59.b		; E0 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	bcs -23.b		; B0 E9
	ora $1A.b,S		; 03 1A
	jsr $4143.w		; 20 43 41
	eor ($53.b)		; 52 53
	.db $42, $55		; 42 55
	eor $2E50.w		; 4D 50 2E
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	ora #$90.b		; 09 90
	ldy #$00.b		; A0 00
	ora $3302CC.l		; 0F CC 02 33
	and ($FE.b),Y		; 31 FE
	ora $94.b		; 05 94
	dec A		; 3A
	sbc ($21.b,S),Y		; F3 21
	bit $149B.w		; 2C 9B 14
	ora $0F9403.l,X		; 1F 03 94 0F
	inc $7026.w,X		; FE 26 70
	plb		; AB
	ora [$61.b],Y		; 17 61
	txs		; 9A
	bcs   0.b		; B0 00
	sbc $ED1001.l,X		; FF 01 10 ED
	cmp $BADD.w,X		; DD DD BA
	ldy $F1.b		; A4 F1
	brk $FD.b		; 00 FD
	cmp $20F2.w,X		; DD F2 20
	sbc ($34.b),Y		; F1 34
	ldy $53.b		; A4 53
	ora $33E2.w		; 0D E2 33
	and ($1E.b,S),Y		; 33 1E
	sbc ($33.b)		; F2 33
	ldy $00.b,X		; B4 00
	ora ($40.b)		; 12 40
	lda $1E35.w		; AD 35 1E
	beq -18.b		; F0 EE
	ldy $25.b		; A4 25
	trb $1FBF.w		; 1C BF 1F
	cmp $7F1722.l,X		; DF 22 17 7F
	ldy $E0.b,X		; B4 E0
	and ($01.b,X)		; 21 01
	cpx $BDCC.w		; EC CC BD
	and ($ED.b,S),Y		; 33 ED
	ldy $25.b,X		; B4 25
	rol $F4CB.w		; 2E CB F4
	ora $44FF44.l,X		; 1F 44 FF 44
	ldy $CA.b,X		; B4 CA
	pea $DB51.w		; F4 51 DB
	sbc $1D.b,S		; E3 1D
	pea $B43F.w		; F4 3F B4
	cmp $E05313.l		; CF 13 53 E0
	rti		; 40

	bne  45.b		; D0 2D
	dec $B9B0.w		; CE B0 B9
	txy		; 9B
	beq -18.b		; F0 EE
	ora $50.b,X		; 15 50
	cmp $0EB423.l,X		; DF 23 B4 0E
	stp		; DB
	cpx $2C.b		; E4 2C
	cmp $31.b,S		; C3 31
	sbc $B4FF.w,X		; FD FF B4
	inc $0201.w,X		; FE 01 02
	and ($24.b,S),Y		; 33 24
	ora $A4FB13.l,X		; 1F 13 FB A4
	txs		; 9A
	bne  51.b		; D0 33
	eor $21.b,S		; 43 21
	ora $B4BCEB.l		; 0F EB BC B4
	sbc $24EFEF.l,X		; FF EF EF 24
	.db $62, $EE, $63		; 62 EE 63
	cpy $51A4.w		; CC A4 51
	lda ($64.b),Y		; B1 64
	jsl $ABFB00.l		; 22 00 FB AB
	wai		; CB
	ldy $DF.b,X		; B4 DF
	and $11.b,S		; 23 11
	and $3E.b,X		; 35 3E
	dec $2E13.w		; CE 13 2E
	ldy $D1.b,X		; B4 D1
	ora ($11.b),Y		; 11 11
	ora $31C0EC.l		; 0F EC C0 31
	cpx $DFC0.w		; EC C0 DF
	inc $DFEE.w,X		; FE EE DF
	cop $44.b		; 02 44
	eor $32.b,X		; 55 32
	ldy $12.b		; A4 12
	jmp.w [$EDEF]		; DC EF ED
	ora $44.b,S		; 03 44
	eor $4D.b		; 45 4D
	cpy #$22.b		; C0 22
	jsr $CCED.w		; 20 ED CC
	cmp $EFEE.w		; CD EE EF
	sbc $F00FA4.l,X		; FF A4 0F F0
	ora ($1E.b,X)		; 01 1E
	cpx $12AB.w		; EC AB 12
	inc $01B4.w		; EE B4 01
	brk $04.b		; 00 04
	eor ($F2.b)		; 52 F2
	lsr $6FD4.w,X		; 5E D4 6F
	ldy $CD.b,X		; B4 CD
	cop $33.b		; 02 33
	rti		; 40

	tyx		; BB
	sbc $A4DD0F.l		; EF 0F DD A4
	cmp $544315.l		; CF 15 43 54
	cmp $E0DE.w,Y		; D9 DE E0
	asl $CBA4.w,X		; 1E A4 CB
	lda $FFEE.w,X		; BD EE FF
	inc $0244.w		; EE 44 02
	mvp $62,$94		; 44 94 62
	beq  53.b		; F0 35
	adc [$76.b],Y		; 77 76
	and ($10.b)		; 32 10
	brk $A4.b		; 00 A4
	sbc $EFDE.w		; ED DE EF
	brk $CC.b		; 00 CC
	ora $239B.w		; 0D 9B 23
	ldy $1D.b		; A4 1D
	beq   0.b		; F0 00
	and $74.b		; 25 74
	and ($20.b,S),Y		; 33 20
	beq -92.b		; F0 A4
	inc $7404.w		; EE 04 74
	cpx #$21.b		; E0 21
	dec $D900.w,X		; DE 00 D9
	ldy $B2.b		; A4 B2
	eor ($E0.b),Y		; 51 E0
	sbc $EECD.w,X		; FD CD EE
	ora ($33.b,X)		; 01 33
	ldy $0E.b		; A4 0E
	ora ($0F.b,X)		; 01 0F
	ora $BCE911.l		; 0F 11 E9 BC
	sbc ($A4.b)		; F2 A4
	eor $0F40E2.l		; 4F E2 40 0F
	sbc ($12.b),Y		; F1 12
	ora ($23.b),Y		; 11 23
	ldy $11.b		; A4 11
	eor [$66.b],Y		; 57 66
	jsr $3113.w		; 20 13 31
	beq  31.b		; F0 1F
	ldy $ED.b		; A4 ED
	stp		; DB
	tax		; AA
	cpy $EDED.w		; CC ED ED
	cmp $A405.w,X		; DD 05 A4
	ror $77.b		; 66 77
	asl A		; 0A
	ldx $01F0.w		; AE F0 01
	and $3E.b,X		; 35 3E
	ldy $CD.b		; A4 CD
	nop		; EA
	cmp ($22.b)		; D2 22
	bit $0B.b,X		; 34 0B
	ldy $A4CE.w,X		; BC CE A4
	ora $22.b,S		; 03 22
	ora ($24.b)		; 12 24
	mvp $31,$35		; 44 35 31
	inc $AB94.w		; EE 94 AB
	cop $01.b		; 02 01
	asl $BBB9.w,X		; 1E B9 BB
	dec $A4EF.w		; CE EF A4
	brk $01.b		; 00 01
	bpl -16.b		; 10 F0
	ora ($45.b,S),Y		; 13 45
	and ($21.b)		; 32 21
	ldy $0E.b		; A4 0E
	wai		; CB
	cpx #$FE.b		; E0 FE
	inc $DDFF.w,X		; FE FF DD
	brk $A4.b		; 00 A4
	bne  11.b		; D0 0B
	bcs  16.b		; B0 10
	and $33.b,S		; 23 33
	and $22.b,S		; 23 22
	sty $3F.b,X		; 94 3F
	tsb $51.b		; 04 51
	cmp $01E0FD.l,X		; DF FD E0 01
	and ($94.b,X)		; 21 94
	lsr $63.b,X		; 56 63
	and ($21.b,X)		; 21 21
	bpl -15.b		; 10 F1
	ora $E094DD.l,X		; 1F DD 94 E0
	and $DCBBEB.l		; 2F EB BB DC
	cpx $DEDD.w		; EC DD DE
	sty $FE.b,X		; 94 FE
	cmp $FECE.w,X		; DD CE FE
	tax		; AA
	cmp $FFDF.w		; CD DF FF
	sty $00.b,X		; 94 00
	ora ($23.b),Y		; 11 23
	lsr $6E.b		; 46 6E
	sbc $2E.b,S		; E3 2E
	ora $94.b,X		; 15 94
	and ($55.b)		; 32 55
	lsr $66.b		; 46 66
	lsr $45.b,X		; 56 45
	mvp $A4,$46		; 44 46 A4
	and ($0F.b),Y		; 31 0F
	ora ($30.b,S),Y		; 13 30
	jsl $BC0EFF.l		; 22 FF 0E BC
	ldy $DE.b		; A4 DE
	cmp $EEFE.w		; CD FE EE
	sbc $DEDEDD.l,X		; FF DD DE DE
	cpy #$AA.b		; C0 AA
	plb		; AB
	tyx		; BB
	cpy $EEDD.w		; CC DD EE
	sbc $40B402.l,X		; FF 02 B4 40
	ora $2E.b,X		; 15 2E
	cmp $221200.l,X		; DF 00 12 22
	and $F161B0.l,X		; 3F B0 61 F1
	mvp $22,$FF		; 44 FF 22
	stp		; DB
	cmp $A4BC.w,X		; DD BC A4
	jmp $4352A4.l		; 5C A4 52 43
	tax		; AA
	eor [$FD.b]		; 47 FD
	ldx $03B0.w,Y		; BE B0 03
	jsr $4701.w		; 20 01 47
	adc ($37.b,S),Y		; 73 37
	stz $13.b,X		; 74 13
	ldy $10.b,X		; B4 10
	ora $1FBE.w,X		; 1D BE 1F
	bne  66.b		; D0 42
	cpx $B0F3.w		; EC F3 B0
	nop		; EA
	ldx $CE0E.w		; AE 0E CE
	bit $20.b,X		; 34 20
	cpx $B0BC.w		; EC BC B0
	cmp $4702.w		; CD 02 47
	adc ($FE.b,S),Y		; 73 FE
	cop $47.b		; 02 47
	ror $B4.b,X		; 76 B4
	sbc $41E1.w		; ED E1 41
	sbc $21E0.w		; ED E0 21
	cop $31.b		; 02 31
	ldy $EF.b,X		; B4 EF
	and ($EB.b,X)		; 21 EB
	ora ($FD.b,X)		; 01 FD
	sbc $23E0.w		; ED E0 23
	ldy #$01.b		; A0 01
	lda #$F4.b		; A9 F4
	tsb $11E1.w		; 0C E1 11
	bit $45.b		; 24 45
	ldy $32.b		; A4 32
	dec $C03E.w,X		; DE 3E C0
	jsl $ACFB43.l		; 22 43 FB AC
	ldy $36.b		; A4 36
	.db $42, $FD		; 42 FD
	ora $3F.b,S		; 03 3F
	beq  16.b		; F0 10
	bit $B4.b,X		; 34 B4
	ora $24EF10.l,X		; 1F 10 EF 24
	and $3FF3.w		; 2D F3 3F
	jmp.w [$CDB4]		; DC B4 CD
	cmp ($3F.b),Y		; D1 3F
	ldx $1211.w,Y		; BE 11 12
	ora $E0B4EE.l,X		; 1F EE B4 E0
	jsl $32C10C.l		; 22 0C C1 32
	inc $2FF3.w		; EE F3 2F
	ldy $0F.b,X		; B4 0F
	cpx #$32.b		; E0 32
	beq  69.b		; F0 45
	rol $2D25.w		; 2E 25 2D
	ldy $CF.b,X		; B4 CF
	ora ($FF.b),Y		; 11 FF
	sbc $1D3412.l		; EF 12 34 1D
	lda $EDB0.w,X		; BD B0 ED
	bne  32.b		; D0 20
	xba		; EB
	tax		; AA
	cmp $B40C23.l		; CF 23 0C B4
	sbc ($32.b,S),Y		; F3 32
	jsr ($1FBD.w,X)		; FC BD 1F
	sbc ($52.b,S),Y		; F3 52
	jmp.w [$CBC0]		; DC C0 CB
	dec $FF00.w		; CE 00 FF
	inc $02F0.w,X		; FE F0 02
	and ($C0.b,X)		; 21 C0
	sbc $EFCCFD.l,X		; FF FD CC EF
	sbc $00CE.w		; ED CE 00
	ora ($A4.b,X)		; 01 A4
	rol $12E0.w,X		; 3E E0 12
	mvn $33,$EF		; 54 EF 33
	eor $0C.b,X		; 55 0C
	ldy $F1.b,X		; B4 F1
	ora ($0C.b,X)		; 01 0C
	cmp $CCFE21.l		; CF 21 FE CC
	sbc ($A4.b,X)		; E1 A4
	jsl $E03044.l		; 22 44 30 E0
	inc $F1DD.w		; EE DD F1
	ora $1011A4.l,X		; 1F A4 11 10
	and [$62.b],Y		; 37 62
	ora $33.b,S		; 03 33
	.db $42, $0E		; 42 0E
	ldy $DD.b		; A4 DD
	beq -34.b		; F0 DE
	ora ($BA.b)		; 12 BA
	ora ($CA.b)		; 12 CA
	ora ($A4.b,S),Y		; 13 A4
	cmp $12D1.w,Y		; D9 D1 12
	sbc $E102.w		; ED 02 E1
	rti		; 40

	sbc ($A4.b)		; F2 A4
	eor ($00.b)		; 52 00
	ora $022E23.l,X		; 1F 23 2E 02
	bmi -31.b		; 30 E1
	sty $5D.b,X		; 94 5D
	sbc [$4C.b],Y		; F7 4C
	ldy $31E1.w		; AC E1 31
	sbc $CD94FD.l		; EF FD 94 CD
	cpx $DBBC.w		; EC BC DB
	dec $F1EF.w		; CE EF F1
	asl A		; 0A
	cpy #$CC.b		; C0 CC
	jmp.w [$CDCC]		; DC CC CD
	sbc $331201.l		; EF 01 12 33
	sty $11.b,X		; 94 11
	eor [$41.b]		; 47 41
	jsl $210F22.l		; 22 22 0F 21
	inc $03A4.w		; EE A4 03
	.db $42, $EE		; 42 EE
	ora $EFEDFD.l		; 0F FD ED EF
	sbc $CCDDA4.l		; EF A4 DD CC
	lda $1BE4.w,Y		; B9 E4 1B
	cmp ($25.b)		; D2 25
	.db $62, $B4, $F0		; 62 B4 F0
	ora $0E4412.l		; 0F 12 44 0E
	trb $2E.b		; 14 2E
	beq -76.b		; F0 B4
	ora ($0D.b,S),Y		; 13 0D
	cmp $4F051E.l,X		; DF 1E 05 4F
	cpx #$F0.b		; E0 F0
	ldy $35.b		; A4 35
	mvp $AC,$72		; 44 72 AC
	and ($ED.b),Y		; 31 ED
	tsx		; BA
	beq -76.b		; F0 B4
	sbc $FF01.w		; ED 01 FF
	sbc $E143F3.l		; EF F3 43 E1
	eor ($A4.b)		; 52 A4
	tyx		; BB
	jsr ($D1DC.w,X)		; FC DC D1
	eor ($32.b,X)		; 41 32
	jmp.w [$B414]		; DC 14 B4
	ora $C02DC0.l,X		; 1F C0 2D C0
	ora ($00.b),Y		; 11 00
	trb $1C.b		; 14 1C
	ldy $A5.b		; A4 A5
	bvs -68.b		; 70 BC
	dec $1265.w		; CE 65 12
	eor $0E.b,X		; 55 0E
	ldy $D2.b		; A4 D2
	and $E360C3.l,X		; 3F C3 60 E3
	and $75D2.w		; 2D D2 75
	ldy $FD.b		; A4 FD
	cmp $1EF4.w,X		; DD F4 1E
	phx		; DA
	sbc ($0A.b,S),Y		; F3 0A
	lda $B9A4.w		; AD A4 B9
	lda ($60.b,S),Y		; B3 60
	cmp $FD4432.l		; CF 32 44 FD
	ora ($B4.b,S),Y		; 13 B4
	jsr ($FEF1.w,X)		; FC F1 FE
	sbc ($FE.b),Y		; F1 FE
	cop $52.b		; 02 52
	sbc $F010B4.l,X		; FF B4 10 F0
	mvp $E1,$2E		; 44 2E E1
	mvp $FF,$0E		; 44 0E FF
	ldy $CE.b,X		; B4 CE
	and ($ED.b)		; 32 ED
	ora ($22.b,X)		; 01 22
	cpx $41BE.w		; EC BE 41
	ldy $CE.b		; A4 CE
	ora ($31.b,X)		; 01 31
	ora $4B.b		; 05 4B
	sta $B09C41.l,X		; 9F 41 9C B0
	cpy #$33.b		; C0 33
	bit $30.b,X		; 34 30
	ora $31.b,S		; 03 31
	ora $1EB4EF.l		; 0F EF B4 1E
	sep #$42		; E2 42
	sbc $101122.l		; EF 22 11 10
	ora $F1BAA4.l		; 0F A4 BA F1
	sbc $2CCF1F.l,X		; FF 1F CF 2C
	sta $A41C.w,X		; 9D 1C A4
	ldy $3224.w		; AC 24 32
	jsr $3E36.w		; 20 36 3E
	sbc ($42.b)		; F2 42
	ldy $F0.b,X		; B4 F0
	ora ($34.b,S),Y		; 13 34
	and ($EB.b),Y		; 31 EB
	dec $2E24.w		; CE 24 2E
	ldy $D3.b,X		; B4 D3
	rol $D1CB.w		; 2E CB D1
	and ($23.b)		; 32 23
	rol $A4CE.w		; 2E CE A4
	lda #$9F.b		; A9 9F
	ror $64.b		; 66 64
	lsr $1A.b,X		; 56 1A
	stz $B4D9.w		; 9C D9 B4
	bne  51.b		; D0 33
	jsl $FC3122.l		; 22 22 31 FC
	cpy #$20.b		; C0 20
	ldy $CD.b,X		; B4 CD
	jsl $EE44DE.l		; 22 DE 44 EE
	and $23.b,S		; 23 23
	asl $00B4.w		; 0E B4 00
	cmp $DFFE.w		; CD FE DF
	and $34.b,S		; 23 34
	and ($FC.b,S),Y		; 33 FC
	ldy $AF.b,X		; B4 AF
	bmi -47.b		; 30 D1
	and ($20.b,S),Y		; 33 20
	inc $C0CD.w,X		; FE CD C0
	ldy $42.b,X		; B4 42
	sbc $22CF31.l		; EF 31 CF 22
	bit $0D.b,X		; 34 0D
	bne -92.b		; D0 A4
	ora $43BD00.l		; 0F 00 BD 43
	bcs 117.b		; B0 75
	ora ($3D.b,X)		; 01 3D
	ldy $9E.b		; A4 9E
	inc $0FF2.w,X		; FE F2 0F
	tsb $42.b		; 04 42
	and ($1F.b,X)		; 21 1F
	ldy $F0.b		; A4 F0
	ora ($DB.b),Y		; 11 DB
	cmp $47BC.w,X		; DD BC 47
	nop		; EA
	inc $EEB4.w		; EE B4 EE
	and $4F.b		; 25 4F
	cmp ($23.b),Y		; D1 23
	and $B4E0FF.l		; 2F FF E0 B4
	and ($EC.b,S),Y		; 33 EC
	trb $2D.b		; 14 2D
.INDEX 8
	sep #$1E		; E2 1E
	sbc $E3A40F.l,X		; FF 0F A4 E3
	mvp $EC,$42		; 44 42 EC
	ldx $0C13.w,Y		; BE 13 0C
	tax		; AA
	ldy $CC.b,X		; B4 CC
	sbc ($21.b,S),Y		; F3 21
	and ($DE.b,X)		; 21 DE
	beq  16.b		; F0 10
	ora $1D33B4.l		; 0F B4 33 1D
	tsb $30.b		; 04 30
	ora ($FA.b,S),Y		; 13 FA
	pea $A42E.w		; F4 2E A4
	cmp $3C05.w,X		; DD 05 3C
	bcs  68.b		; B0 44
	lsr $53.b,X		; 56 53
	bit $B4.b		; 24 B4
	tsb $DFDE.w		; 0C DE DF
	and ($EC.b,S),Y		; 33 EC
	tsb $2F.b		; 04 2F
	sbc ($C0.b),Y		; F1 C0
	bpl  -1.b		; 10 FF
	asl $EFDD.w		; 0E DD EF
	inc $BBDC.w,X		; FE DC BB
	ldy $67.b		; A4 67
	and ($01.b),Y		; 31 01
	adc $CC.b,X		; 75 CC
	eor ($B0.b)		; 52 B0
	jmp $E0B0.w		; 4C B0 E0
	and ($DA.b,X)		; 21 DA
	stz $FDF0.w		; 9C F0 FD
	cpy $A4BA.w		; CC BA A4
	ora $30.b,S		; 03 30
	ora ($12.b),Y		; 11 12
	ora $451F12.l,X		; 1F 12 1F 45
	ldy $00.b,X		; B4 00
	ora ($21.b),Y		; 11 21
	brk $0E.b		; 00 0E
	cmp ($2D.b),Y		; D1 2D
	cmp $EDB4.w		; CD B4 ED
	cmp ($32.b),Y		; D1 32
	beq   0.b		; F0 00
	ora ($FB.b,S),Y		; 13 FB
	cpx $A4.b		; E4 A4
	tda		; 7B
	sta ($2D.b),Y		; 91 2D
	pea $1F31.w		; F4 31 1F
	sbc $B4D5.w		; ED D5 B4
	and ($FF.b),Y		; 31 FF
	sbc ($33.b)		; F2 33
	and ($CC.b),Y		; 31 CC
	sbc ($12.b)		; F2 12
	bcs  82.b		; B0 52
	phx		; DA
	tax		; AA
	cmp $9ADCFE.l,X		; DF FE DC 9A
	cmp $E0B4.w,X		; DD B4 E0
	and ($ED.b),Y		; 31 ED
	sbc $0E5403.l		; EF 03 54 0E
	sbc ($B4.b,S),Y		; F3 B4
	eor ($C0.b,X)		; 41 C0
	and ($E1.b),Y		; 31 E1
	rti		; 40

	dec $0F22.w		; CE 22 0F
	ldy $FE.b		; A4 FE
	cmp $00DF.w		; CD DF 00
	eor [$3B.b]		; 47 3B
	cmp ($54.b)		; D2 54
	ldy $DB.b		; A4 DB
	pea $BF4E.w		; F4 4E BF
	bpl -48.b		; 10 D0
	jsr $A40F.w		; 20 0F A4
	sbc ($3E.b,X)		; E1 3E
	pea $F23E.w		; F4 3E F2
	ora ($FC.b),Y		; 11 FC
	cmp $FF10B4.l		; CF B4 10 FF
	bpl -32.b		; 10 E0
	inc $F3ED.w,X		; FE ED F3
	bvc -76.b		; 50 B4
	cpy #$35.b		; C0 35
	and $3135DF.l,X		; 3F DF 35 31
	sbc $EFA40F.l		; EF 0F A4 EF
	and ($01.b),Y		; 31 01
	ora ($66.b),Y		; 11 66
	ora ($3D.b,X)		; 01 3D
	sbc $B4.b		; E5 B4
	asl A		; 0A
	lda ($4F.b,X)		; A1 4F
	lda $C0FE1F.l,X		; BF 1F FE C0
	and ($B4.b,X)		; 21 B4
	cop $EC.b		; 02 EC
	dec $1D25.w		; CE 25 1D
	sbc $A413DE.l		; EF DE 13 A4
	ora $61CE65.l,X		; 1F 65 CE 61
	cmp $5C.b,S		; C3 5C
	sta $9CB0EA.l,X		; 9F EA B0 9C
	ora ($0E.b,X)		; 01 0E
	sbc ($30.b,S),Y		; F3 30
	ora $3F.b,S		; 03 3F
	cmp $FCA4.w		; CD A4 FC
	and [$66.b]		; 27 66
	eor $F79C.w		; 4D 9C F7
	ror $A4CF.w,X		; 7E CF A4
	inc $44CF.w,X		; FE CF 44
	eor $FD.b,X		; 55 FD
	rol $33.b,X		; 36 33
	lsr A		; 4A
	ldy $AD.b,X		; B4 AD
	ora $CC2FF1.l,X		; 1F F1 2F CC
	sep #$0F		; E2 0F
	sbc ($B4.b,S),Y		; F3 B4
	jsl $24BC2F.l		; 22 2F BC 24
	ora $21CD.w,X		; 1D CD 21
	bne -80.b		; D0 B0
	inc $0FCE.w		; EE CE 0F
	sbc ($1E.b,X)		; E1 1E
	sbc ($55.b,S),Y		; F3 55
	eor ($B4.b,X)		; 41 B4
	sbc ($63.b)		; F2 63
	jmp.w [$0B25]		; DC 25 0B
	beq  -1.b		; F0 FF
	mvp $0E,$B4		; 44 B4 0E
	bne  67.b		; D0 43
	xba		; EB
	sbc ($0F.b,X)		; E1 0F
	ora ($FE.b)		; 12 FE
	ldy $15.b,X		; B4 15
	rol $16CD.w,X		; 3E CD 16
	lsr $10C0.w		; 4E C0 10
	ora ($B0.b),Y		; 11 B0
	and ($13.b)		; 32 13
	eor $21.b,S		; 43 21
	bpl -38.b		; 10 DA
	cpy #$0C.b		; C0 0C
	bcs -102.b		; B0 9A
	cpx #$0E.b		; E0 0E
	lda $DBAE.w,Y		; B9 AE DB
	ldy $B4CD.w,X		; BC CD B4
	bmi -33.b		; 30 DF
	ora $53.b,S		; 03 53
	sbc $3015.w		; ED 15 30
	stp		; DB
	ldy $C0.b,X		; B4 C0
	mvn $C0,$EB		; 54 EB C0
	and $2E.b,S		; 23 2E
	bcs  79.b		; B0 4F
	ldy $E2.b,X		; B4 E2
	and $10D0EC.l,X		; 3F EC D0 10
	jsl $B435DD.l		; 22 DD 35 B4
	ora $F3BC.w,X		; 1D BC F3
	and ($20.b,S),Y		; 33 20
	cmp $B02C34.l,X		; DF 34 2C B0
	cmp $2C25.w,X		; DD 25 2C
	ldy $55F2.w		; AC F2 55
	jsr $B024.w		; 20 24 B0
	bmi   2.b		; 30 02
	jsr $0300.w		; 20 00 03
	mvn $4E,$47		; 54 47 4E
	ldy $A4.b		; A4 A4
	adc $F9.b		; 65 F9
	ldy $19.b,X		; B4 19
	cpy $0A.b		; C4 0A
	sbc ($B4.b,X)		; E1 B4
	ora ($1D.b,X)		; 01 1D
	ora $1E.b,S		; 03 1E
	dec $3F05.w,X		; DE 05 3F
	dec $C1A4.w,X		; DE A4 C1
	adc $FD.b		; 65 FD
	cpx $EB25.w		; EC 25 EB
	cpx $B4D5.w		; EC D5 B4
	and $F3EBF2.l,X		; 3F F2 EB F3
	and ($1E.b,S),Y		; 33 1E
	pea $B43E.w		; F4 3E B4
	lda ($51.b)		; B2 51
	sep #$41		; E2 41
	ldx $4114.w,Y		; BE 14 41
	inc $EFA4.w		; EE A4 EF
	ora ($1E.b,S),Y		; 13 1E
	inc $6F16.w		; EE 16 6F
	lda $24B453.l		; AF 53 B4 24
	and $03BC.w		; 2D BC 03
	sbc $CB13.w,X		; FD 13 CB
	tsb $B4.b		; 04 B4
	xce		; FB
	cpx #$F2.b		; E0 F2
	rol $FFBE.w,X		; 3E BE FF
	bit $0D.b,X		; 34 0D
	ldy $BE.b,X		; B4 BE
	and $1E.b,X		; 35 1E
	brk $F0.b		; 00 F0
	and $B43003.l		; 2F 03 30 B4
	inc $1E04.w,X		; FE 04 1E
	sbc ($35.b,X)		; E1 35
	and $33E1.w		; 2D E1 33
	ldy $10.b,X		; B4 10
	inc $33DE.w		; EE DE 33
	xba		; EB
	sbc $3E.b,S		; E3 3E
	cmp ($A4.b)		; D2 A4
	adc $22409F.l,X		; 7F 9F 40 22
	ldy $BE2E.w,X		; BC 2E BE
	cmp $AF64A4.l,X		; DF A4 64 AF
	rts		; 60

	ldx $3033.w		; AE 33 30
	lda $B030.w,X		; BD 30 B0
	jmp.w [$10CE]		; DC CE 10
	sbc $DD1000.l		; EF 00 10 DD
	ora ($B0.b,S),Y		; 13 B0
	ora $21BF.w,X		; 1D BF 21
	dex		; CA
	cmp ($1E.b)		; D2 1E
	cpx #$FC.b		; E0 FC
	ldy $DC.b		; A4 DC
	bcc 116.b		; 90 74
	cpx #$23.b		; E0 23
	eor ($BF.b,X)		; 41 BF
	tas		; 1B
	ldy $B0.b,X		; B4 B0
	.db $42, $F1		; 42 F1
	ora $32FE23.l,X		; 1F 23 FE 32
	sbc $EC22B4.l,X		; FF B4 22 EC
.ACCU 8
	sep #$20		; E2 20
	cpx #$25.b		; E0 25
	rol $B4D1.w,X		; 3E D1 B4
	bmi  16.b		; 30 10
	sbc $C01D35.l		; EF 35 1D C0
	bpl  32.b		; 10 20
	bcs  29.b		; B0 1D
	cpx #$11.b		; E0 11
	sbc $41E3.w,X		; FD E3 41
	sbc $B0A9.w		; ED A9 B0
	cmp ($0B.b),Y		; D1 0B
	ldy $3102.w		; AC 02 31
	wai		; CB
	cmp $C0BB.w,X		; DD BB C0
	beq   0.b		; F0 00
	inc $FEEF.w,X		; FE EF FE
	jmp.w [$01CD]		; DC CD 01
	ldy $21.b,X		; B4 21
	cmp $4203.w,X		; DD 03 42
	inc $2E03.w,X		; FE 03 2E
	cpx #$A4.b		; E0 A4
	and ($23.b)		; 32 23
	bpl   0.b		; 10 00
	cmp #$B2.b		; C9 B2
	lsr $B4D2.w		; 4E D2 B4
	and $EF20E0.l		; 2F E0 20 EF
	jsl $0EEF43.l		; 22 43 EF 0E
	ldy $E3.b,X		; B4 E3
	and $24CDCC.l,X		; 3F CC CD 24
	bit $22BE.w		; 2C BE 22
	ldy $30.b,X		; B4 30
	stp		; DB
	sbc ($22.b)		; F2 22
	tsb $41B1.w		; 0C B1 41
	sbc $C2A4.w		; ED A4 C2
	.db $42, $DD		; 42 DD
	rol $55.b		; 26 55
	bmi  -5.b		; 30 FB
	ldx #$B4.b		; A2 B4
	eor ($EF.b,X)		; 41 EF
	asl $42BF.w,X		; 1E BF 42
	inc $24F0.w		; EE F0 24
	ldy $2D.b,X		; B4 2D
	inc $5FF3.w		; EE F3 5F
	cmp ($40.b)		; D2 40
	cmp ($42.b,X)		; C1 42
	ldy $0E.b,X		; B4 0E
	and $0C.b,S		; 23 0C
	cpy $3004.w		; CC 04 30
	cpy #$22.b		; C0 22
	bcs  46.b		; B0 2E
	dec $CC20.w		; CE 20 CC
	sbc ($45.b),Y		; F1 45
	mvp $B4,$54		; 44 54 B4
	jmp.w [$30E1]		; DC E1 30
	sbc $1CF1.w		; ED F1 1C
	pea $B43E.w		; F4 3E B4
	cmp ($53.b,X)		; C1 53
	sbc $0F24FE.l,X		; FF FE 24 0F
	and $44A4D1.l,X		; 3F D1 A4 44
	and $2D.b,S		; 23 2D
.INDEX 16
	rep #$1B		; C2 1B
	ora $0B.b		; 05 0B
	beq -92.b		; F0 A4
	inc $F5FB.w		; EE FB F5
	adc $329E.w		; 6D 9E 32
	asl $4E.b,X		; 16 4E
	bcs  14.b		; B0 0E
	cmp $5315.w,X		; DD 15 53
	cop $44.b		; 02 44
	and ($13.b)		; 32 13
	ldy $1D.b		; A4 1D
	ora $CD.b,X		; 15 CD
	adc $ED.b		; 65 ED
	inc $E0DF.w		; EE DF E0
	ldy $11.b,X		; B4 11
	cpx $31E2.w		; EC E2 31
	jmp.w [$E0E1]		; DC E1 E0
	jsr $E0A4.w		; 20 A4 E0
	sbc $1611.w		; ED 11 16
	bmi -54.b		; 30 CA
	cmp [$72.b],Y		; D7 72
	ldy $0D.b		; A4 0D
	ldx $EC75.w		; AE 75 EC
	eor $D9.b		; 45 D9
	inc $7F.b		; E6 7F
	ldy $E5.b		; A4 E5
	rol A		; 2A
	dec $51.b		; C6 51
	sbc $2FBF.w,X		; FD BF 2F
	lda $2022B4.l,X		; BF B4 22 20
	lda $E010.w,X		; BD 10 E0
	asl $3F14.w		; 0E 14 3F
	bcs -19.b		; B0 ED
	sbc ($42.b,S),Y		; F3 42
	sbc $02AB.w,X		; FD AB 02
	ora $44A4EE.l		; 0F EE A4 44
	eor [$29.b]		; 47 29
	cmp $C062AF.l		; CF AF 62 C0
	ora $CCB0.w		; 0D B0 CC
	sbc ($46.b),Y		; F1 46
	rti		; 40

	cmp $FE12.w		; CD 12 FE
	sbc $AAB0.w		; ED B0 AA
	sbc ($11.b)		; F2 11
	ora ($25.b),Y		; 11 25
	ror $3F.b,X		; 76 3F
	ora $B0.b,S		; 03 B0
	ora $03EE11.l,X		; 1F 11 EE 03
	eor ($02.b,S),Y		; 53 02
	and $10B4DE.l,X		; 3F DE B4 10
	and ($0D.b)		; 32 0D
	sbc ($FD.b),Y		; F1 FD
	and $FC.b,S		; 23 FC
	sbc $B0.b,S		; E3 B0
	ora $F2CCEE.l,X		; 1F EE CC F2
	bit $52.b		; 24 52
	beq  52.b		; F0 34
	bcs  16.b		; B0 10
	ora $31E2CB.l,X		; 1F CB E2 31
	sbc ($2F.b),Y		; F1 2F
	cmp $FEB0.w		; CD B0 FE
	tsx		; BA
	ldx $1F12.w,Y		; BE 12 1F
	xba		; EB
	txs		; 9A
	sbc $E4B9A4.l		; EF A4 B9 E4
	bmi   2.b		; 30 02
	eor $1B.b		; 45 1B
	stz $A40B.w,X		; 9E 0B A4
	ora [$5D.b]		; 07 5D
	lda ($20.b),Y		; B1 20
	and $13.b,S		; 23 13
	ora $9FA42F.l,X		; 1F 2F A4 9F
	adc ($CC.b,X)		; 61 CC
	dec $3324.w,X		; DE 24 33
	cpx $B402.w		; EC 02 B4
	ora ($2E.b,S),Y		; 13 2E
	sbc ($0E.b,X)		; E1 0E
	trb $2E.b		; 14 2E
	dec $A403.w,X		; DE 03 A4
	eor $44AE.w,X		; 5D AE 44
	asl A		; 0A
	sbc $FB.b,S		; E3 FB
	asl $3D.b,X		; 16 3D
	ldy $CD.b		; A4 CD
	cmp $E023FD.l		; CF FD 23 E0
	eor ($FE.b,X)		; 41 FE
	cpx #$66A4.w		; E0 A4 66
	and $CCEF.w		; 2D EF CC
	and $52.b		; 25 52
	ora $35A4CE.l,X		; 1F CE A4 35
	and $FBE1FE.l		; 2F FE E1 FB
	cmp $64.b,S		; C3 64
	nop		; EA
	ldy $C1.b		; A4 C1
	jsl $913C35.l		; 22 35 3C 91
	rts		; 60

	ldy $A4D1.w,X		; BC D1 A4
	stz $BD.b,X		; 74 BD
	mvn $DE,$EC		; 54 EC DE
	eor [$4F.b]		; 47 4F
	inc $BDA4.w		; EE A4 BD
	bit $EC.b,X		; 34 EC
	cop $2D.b		; 02 2D
	ldx $0F32.w,Y		; BE 32 0F
	ldy $E0.b		; A4 E0
	eor ($CB.b,X)		; 41 CB
	lda $1245.w,X		; BD 45 12
	asl $B0C1.w		; 0E C1 B0
	sbc ($1F.b),Y		; F1 1F
	cpy $9CB9.w		; CC B9 9C
	ora ($FE.b,X)		; 01 FE
	beq -80.b		; F0 B0
	sbc $215403.l,X		; FF 03 54 21
	beq  15.b		; F0 0F
	and $64.b		; 25 64
	ldy $DD.b		; A4 DD
	ora $3D.b,X		; 15 3D
	ldy $1102.w,X		; BC 02 11
	mvp $A4,$EB		; 44 EB A4
	dec BG4HOFS.w		; CE 13 21
	jsr ($40B1.w,X)		; FC B1 40
	ora $1C.b		; 05 1C
	ldy $D1.b		; A4 D1
	asl $30C0.w		; 0E C0 30
	cmp $4403.w		; CD 03 44
	and $13CEA4.l		; 2F A4 CE 13
	eor $DC.b,S		; 43 DC
	beq -34.b		; F0 DE
	beq  52.b		; F0 34
	ldy $10.b		; A4 10
	ora $EA44D1.l,X		; 1F D1 44 EA
	bcs  83.b		; B0 53
	ora $F0FEA0.l		; 0F A0 FE F0
	ora ($31.b,S),Y		; 13 31
	xce		; FB
	ldx $56E0.w,Y		; BE E0 56
	ldy $D1.b		; A4 D1
	jsr ($55E2.w,X)		; FC E2 55
	rol $149C.w,X		; 3E 9C 14
	and ($A4.b,S),Y		; 33 A4
	ora $52D3BB.l,X		; 1F BB D3 52
	dec $CE20.w		; CE 20 CE
	and ($A0.b,X)		; 21 A0
	jmp.w [$CCCC]		; DC CC CC
	cmp ($51.b,S),Y		; D3 51
	wai		; CB
	bne  33.b		; D0 21
	sty $03.b,X		; 94 03
	and $DDAD.w,X		; 3D AD DD
	jsl LC22AEB.l		; 22 EB AA C2
	ldy $54.b		; A4 54
	tsb $40F4.w		; 0C F4 40
	sbc ($2E.b,X)		; E1 2E
	trb $0D.b		; 14 0D
	ldy $DE.b		; A4 DE
	brk $0F.b		; 00 0F
	cpx $5005.w		; EC 05 50
	cpx $A0D1.w		; EC D1 A0
	tsb $65.b		; 04 65
	ora $EC3003.l,X		; 1F 03 30 EC
	bne  50.b		; D0 32
	ldy $EF.b		; A4 EF
	inc $0C25.w,X		; FE 25 0C
	cmp ($41.b),Y		; D1 41
	cmp $A4F0.w,X		; DD F0 A4
	ora ($2F.b)		; 12 2F
	dec $EB22.w		; CE 22 EB
	pea $FF40.w		; F4 40 FF
	ldy $CE.b		; A4 CE
	ora ($54.b)		; 12 54
	xce		; FB
	trb $FC.b		; 14 FC
	tsb $31.b		; 04 31
	ldy $21.b		; A4 21
	sbc $34DF.w,X		; FD DF 34
	stp		; DB
	cpx $4E.b		; E4 4E
	sbc ($A0.b,S),Y		; F3 A0
	and $34BFCB.l,X		; 3F CB BF 34
	asl $CDEC.w		; 0E EC CD
	sbc $DFA0.w		; ED A0 DF
	and $41.b,X		; 35 41
	sbc $EFDE.w,X		; FD DE EF
	ora $10A0BC.l		; 0F BC A0 10
	tyx		; BB
	sbc ($32.b)		; F2 32
	jsr ($04AC.w,X)		; FC AC 04
	ror $94.b		; 66 94
	ldy $AA32.w,X		; BC 32 AA
	adc $EF.b		; 65 EF
	ora $942302.l		; 0F 02 23 94
	rol $22BE.w,X		; 3E BE 22
	sbc $2345.w		; ED 45 23
	ora ($30.b),Y		; 11 30
	ldy $DE.b		; A4 DE
	ora ($0E.b),Y		; 11 0E
	sbc $E2EC11.l,X		; FF 11 EC E2
	asl $B694.w,X		; 1E 94 B6
	dec A		; 3A
	ldx #$1967.w		; A2 67 19
	dec $3B.b		; C6 3B
	bit $94.b		; 24 94
	phx		; DA
	bit $0E.b		; 24 0E
	jmp.w [$1D35]		; DC 35 1D
	dec $8447.w,X		; DE 47 84
	jmp ($46D3.w,X)		; 7C D3 46
	asl $16FE.w,X		; 1E FE 16
	and $0194C9.l		; 2F C9 94 01
	sbc $CD21.w		; ED 21 CD
	ora ($C9.b),Y		; 11 C9
	lda ($74.b,X)		; A1 74
	sty $DE.b,X		; 94 DE
	.db $42, $DF		; 42 DF
	eor ($F1.b,X)		; 41 F1
	jsr ($4306.w,X)		; FC 06 43
	sty $31.b,X		; 94 31
	sbc ($2F.b),Y		; F1 2F
	inc $21F1.w		; EE F1 21
	phx		; DA
	cmp ($94.b,S),Y		; D3 94
	mvn $AF,$1B		; 54 1B AF
	and ($00.b,X)		; 21 00
	cmp $94CC3E.l,X		; DF 3E CC 94
	inc $2EC0.w,X		; FE C0 2E
	cmp ($43.b,X)		; C1 43
	bmi -69.b		; 30 BB
	sbc ($94.b),Y		; F1 94
	lsr $FD.b,X		; 56 FD
	ora ($02.b),Y		; 11 02
	bit $3F.b,X		; 34 3F
	ldy $9414.w		; AC 14 94
	lsr $51B1.w		; 4E B1 51
	cmp ($31.b),Y		; D1 31
	ora ($EE.b),Y		; 11 EE
	brk $84.b		; 00 84
	lda #$12.b		; A9 12
	dex		; CA
	cmp $FECB.w,X		; DD CB FE
	cmp $249444.l		; CF 44 94 24
	eor ($02.b,X)		; 41 02
	ora ($30.b),Y		; 11 30
	cmp ($3E.b),Y		; D1 3E
	stz $6594.w,X		; 9E 94 65
	cpy $2CF1.w		; CC F1 2C
	lda ($60.b,X)		; A1 60
	bcs  68.b		; B0 44
	sty $FC.b,X		; 94 FC
	lda $14CD42.l,X		; BF 42 CD 14
	phd		; 0B
	ora ($EE.b,X)		; 01 EE
	sty $E1.b		; 84 E1
	eor $BD.b,S		; 43 BD
	and $461E26.l		; 2F 26 1E 46
	trb $A0.b		; 14 A0
	eor $66.b		; 45 66
	eor $12.b,S		; 43 12
	eor $10.b,S		; 43 10
	beq  17.b		; F0 11
	sty $CF.b,X		; 94 CF
	and $2F.b,X		; 35 2F
	and ($D0.b,X)		; 21 D0
	eor ($DF.b,X)		; 41 DF
	and ($84.b)		; 32 84
	sbc $DE0C.w		; ED 0C DE
	cpy $4036.w		; CC 36 40
	sbc #$9B.b		; E9 9B
	sty $14.b,X		; 94 14
	and $1FF1BD.l,X		; 3F BD F1 1F
	cmp $A03312.l,X		; DF 12 33 A0
	brk $23.b		; 00 23
	bpl  36.b		; 10 24
	lsr $65.b,X		; 56 65
	eor $20.b,S		; 43 20
	sty $F1.b,X		; 94 F1
	and ($EC.b,X)		; 21 EC
	beq  13.b		; F0 0D
	cmp ($30.b,S),Y		; D3 30
	trb $90.b		; 14 90
	adc [$73.b],Y		; 77 73
	brk $0E.b		; 00 0E
	sbc ($45.b,X)		; E1 45
	eor ($11.b,S),Y		; 53 11
	sty $DB.b,X		; 94 DB
	cmp ($12.b),Y		; D1 12
	ora ($01.b),Y		; 11 01
	ora ($22.b),Y		; 11 22
	ora $DA0184.l,X		; 1F 84 01 DA
	plb		; AB
	ora $40.b,S		; 03 40
	jsl $90BEFB.l		; 22 FB BE 90
	cpy #$0F55.w		; C0 55 0F
	and $3F.b,X		; 35 3F
	cpx #$B920.w		; E0 20 B9
	sty $13.b,X		; 94 13
	ora $EEEF.w		; 0D EF EE
	trb $41.b		; 14 41
	inc $9024.w		; EE 24 90
	bmi -36.b		; 30 DC
	sbc ($00.b,X)		; E1 00
	asl $12DF.w		; 0E DF 12
	bit $84.b,X		; 34 84
	brk $40.b		; 00 40
	wai		; CB
	dex		; CA
	lda $3F0343.l		; AF 43 03 3F
	sty $E0.b		; 84 E0
	and ($FA.b,X)		; 21 FA
	sta $F2DC53.l,X		; 9F 53 DC F2
	eor ($84.b)		; 52 84
	cpx #$A13E.w		; E0 3E A1
	.db $42, $EC		; 42 EC
	cmp $51.b		; C5 51
	rol $84.b		; 26 84
	trb $12F2.w		; 1C F2 12
	asl $BF0F.w		; 0E 0F BF
	and ($F0.b,S),Y		; 33 F0
	bcc  35.b		; 90 23
	and ($00.b),Y		; 31 00
	sbc $CA3014.l,X		; FF 14 30 CA
	cmp $11CA84.l,X		; DF 84 CA 11
	ora ($EE.b,X)		; 01 EE
	ora ($DE.b,X)		; 01 DE
	bit $33.b		; 24 33
	sty $2E.b		; 84 2E
	cmp ($43.b,X)		; C1 43
	eor ($DA.b,X)		; 41 DA
	cmp $4F.b,S		; C3 4F
	inc $0384.w		; EE 84 03
	and ($33.b)		; 32 33
	sbc $AC0F.w		; ED 0F AC
	beq   0.b		; F0 00
	sty $CD.b		; 84 CD
	bne  18.b		; D0 12
	mvn $22,$10		; 54 10 22
	brk $11.b		; 00 11
	sty $10.b		; 84 10
	ora $EE3224.l		; 0F 24 32 EE
	sbc $74D0AC.l,X		; FF AC D0 74
	cmp ($40.b),Y		; D1 40
	cmp $0E36.w		; CD 36 0E
	bmi -65.b		; 30 BF
	bvc -124.b		; 50 84
	sbc $413310.l		; EF 10 33 41
	dec $CB21.w,X		; DE 21 CB
	inc $3384.w		; EE 84 33
	and $EFFEEE.l		; 2F EE FE EF
	cop $36.b		; 02 36
	eor $022F80.l		; 4F 80 2F 02
	jsr $4103.w		; 20 03 41
	ora ($20.b,S),Y		; 13 20
	cmp #$84.b		; C9 84
	sbc $FE10F0.l		; EF F0 10 FE
	brk $25.b		; 00 25
	ora $507401.l,X		; 1F 01 74 50
	and $060E0F.l		; 2F 0F 0E 06
	adc ($DF.b,X)		; 61 DF
	sbc $2FE474.l		; EF 74 E4 2F
	tsb $10.b		; 04 10
	cmp $DE42.w,X		; DD 42 DE
	jsl $F0FF84.l		; 22 84 FF F0
	ora ($10.b,X)		; 01 10
	cpx #$2422.w		; E0 22 24
	ora ($84.b),Y		; 11 84
	sbc $1FF2EE.l,X		; FF EE F2 1F
	lda $DE0D.w,X		; BD 0D DE
	brk $90.b		; 00 90
	tsx		; BA
	sta $CB9B.w,Y		; 99 9B CB
	tax		; AA
	dec $01FF.w,X		; DE FF 01
	bvs  64.b		; 70 40
	cpx $74A0.w		; EC A0 74
	dex		; CA
	cpx #$E0EC.w		; E0 EC E0
	stz $01.b,X		; 74 01
	and $04.b,S		; 23 04
	eor $F5.b,S		; 43 F5
	.db $42, $FC		; 42 FC
	beq 116.b		; F0 74
	eor ($DB.b,S),Y		; 53 DB
	sbc ($23.b)		; F2 23
	eor ($DF.b,X)		; 41 DF
	inc $74F0.w,X		; FE F0 74
	plx		; FA
	dec $DFFE.w		; CE FE DF
	sbc $FD11.w		; ED 11 FD
	ora ($74.b),Y		; 11 74
	sbc ($2D.b),Y		; F1 2D
	and ($01.b,X)		; 21 01
	jsr $FA03.w		; 20 03 FA
	lda $FF0F84.l		; AF 84 0F FF
	cmp $FFEE00.l,X		; DF 00 EE FF
	beq  52.b		; F0 34
	stz $3E.b,X		; 74 3E
	ora [$32.b],Y		; 17 32
	mvp $10,$31		; 44 31 10
	sbc $4070E1.l,X		; FF E1 70 40
	cop $00.b		; 02 00
	cpx $E0EE.w		; EC EE E0
	mvp $80,$26		; 44 26 80
	and ($45.b)		; 32 45
	.db $42, $24		; 42 24
	mvn $0E,$22		; 54 22 0E
	cmp $DF3064.l,X		; DF 64 30 DF
	brk $0F.b		; 00 0F
	tsb $3FCB.w		; 0C CB 3F
	ora $CE0F74.l		; 0F 74 0F CE
	sbc ($0D.b,S),Y		; F3 0D
	ora $F010F2.l		; 0F F2 10 F0
	bra -35.b		; 80 DD
	sbc $F0BDEC.l		; EF EC BD F0
	sbc $80F0DD.l,X		; FF DD F0 80
	brk $FE.b		; 00 FE
	sbc ($34.b),Y		; F1 34
	mvp $45,$34		; 44 34 45
	mvn $34,$80		; 54 80 34
	mvn $00,$21		; 54 21 00
	ora ($00.b),Y		; 11 00
	ora $7C64DD.l		; 0F DD 64 7C
	cpy $0323.w		; CC 23 03
	eor $45.b,S		; 43 45
	stz $8004.w		; 9C 04 80
	bpl  15.b		; 10 0F
	cmp $CBEE.w,X		; DD EE CB
	ldy $BCBB.w,X		; BC BB BC
	stz $0F.b,X		; 74 0F
	cmp ($12.b,X)		; C1 12
	ora $EF22E1.l		; 0F E1 22 EF
	inc $AA70.w		; EE 70 AA
	dec $CCEE.w		; CE EE CC
	inc $CCEE.w		; EE EE CC
	inc $0C64.w		; EE 64 0C
	beq  55.b		; F0 37
	eor $74D0.w		; 4D D0 74
	ora $6401.w,X		; 1D 01 64
	ora $01.b		; 05 01
	bne  29.b		; D0 1D
	brk $41.b		; 00 41
	ora $64C4.w		; 0D C4 64
	eor $CCC0.w		; 4D C0 CC
	ora $40.b,S		; 03 40
	cpy $0F03.w		; CC 03 0F
	stz $40.b		; 64 40
	cpy #$C00F.w		; C0 0F C0
	cmp $4F0FF3.l		; CF F3 0F 4F
	rts		; 60

	cpy $99CC.w		; CC CC 99
	cpy $9CC9.w		; CC C9 9C
	tsb $44.b		; 04 44
	rts		; 60

	brk $47.b		; 00 47
	adc [$74.b],Y		; 77 74
	adc [$74.b],Y		; 77 74
	rti		; 40

	brk $60.b		; 00 60
	mvp $CC,$40		; 44 40 CC
	cpy $99CC.w		; CC CC 99
	cpy #$5000.w		; C0 00 50
	brk $00.b		; 00 00
	adc [$00.b],Y		; 77 00
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	cpy $CCCC.w		; CC CC CC
	cmp #$CC.b		; C9 CC
	sta $9960.w,Y		; 99 60 99
	stz $CCCC.w		; 9C CC CC
	sta $CC9C.w,Y		; 99 9C CC
	cpy $CC60.w		; CC 60 CC
	cpy $99CC.w		; CC CC 99
	cpy $CCCC.w		; CC CC CC
	cmp #$54.b		; C9 54
	sbc $F0F060.l,X		; FF 60 F0 F0
	beq -16.b		; F0 F0
	beq 112.b		; F0 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $90.b		; 00 90
	ora #$90.b		; 09 90
	ora #$90.b		; 09 90
	ora #$99.b		; 09 99
	adc ($EE.b),Y		; 71 EE
	inc $EEE0.w		; EE E0 EE
	inc $EEEE.w		; EE EE EE
	sbc [$59.b]		; E7 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	bvc -23.b		; 50 E9
	ora $1A.b,S		; 03 1A
	jsr $4857.w		; 20 57 48
	eor $732E41.l		; 4F 41 2E 73
	adc $73006C.l		; 6F 6C 00 73
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
	bvc   9.b		; 50 09
	sta $0099.w,Y		; 99 99 00
	ora [$77.b]		; 07 77
	adc [$77.b],Y		; 77 77
	stz $01.b		; 64 01
	cpy #$0CCC.w		; C0 CC 0C
	ldy $F3EF.w,X		; BC EF F3
	and $70.b,S		; 23 70
	cop $67.b		; 02 67
	adc [$77.b],Y		; 77 77
	ror $42.b		; 66 42
	brk $EC.b		; 00 EC
	stz $0C.b		; 64 0C
	sbc $34F3C3.l,X		; FF C3 F3 34
	mvp $11,$04		; 44 04 11
	stz $D0.b		; 64 D0
	jmp.w [$BCDC]		; DC DC BC
	sbc $3433FF.l,X		; FF FF 33 34
	mvn $10,$07		; 54 07 10
	bpl   1.b		; 10 01
	ora ($09.b,X)		; 01 09
	brk $00.b		; 00 00
	stz $0C.b		; 64 0C
	brk $0F.b		; 00 0F
	tsb $00.b		; 04 00
	tsb $FC0C.w		; 0C 0C FC
	stz $CB.b		; 64 CB
	and $4474F6.l,X		; 3F F6 74 44
	ora ($01.b),Y		; 11 01
	cmp $1180.w,X		; DD 80 11
	bpl  17.b		; 10 11
	ora ($11.b),Y		; 11 11
	brk $FE.b		; 00 FE
	wai		; CB
	stz $ED.b,X		; 74 ED
	cmp $521213.l,X		; DF 13 12 52
	bit $21.b		; 24 21
	ora ($64.b,X)		; 01 64
	cpx #$DDE0.w		; E0 E0 DD
	ora $C00C.w		; 0D 0C C0
	ldy $70FF.w,X		; BC FF 70
	sta $EEAC.w,Y		; 99 AC EE
	cop $22.b		; 02 22
	mvp $22,$42		; 44 42 22
	rts		; 60

	mvp $00,$44		; 44 44 00
	cpy $9999.w		; CC 99 99
	sta $64CC.w,Y		; 99 CC 64
	rti		; 40

	and ($04.b),Y		; 31 04
	bne -51.b		; D0 CD
	jsr ($0BCF.w,X)		; FC CF 0B
	stz $0D.b,X		; 74 0D
	ora ($01.b,X)		; 01 01
	ora ($44.b)		; 12 44
	bit $12.b		; 24 12
	sbc $FD1090.l,X		; FF 90 10 FD
	wai		; CB
	tyx		; BB
	cmp $01EF.w		; CD EF 01
	ora ($80.b)		; 12 80
	mvp $33,$33		; 44 33 33
	bit $45.b,X		; 34 45
	mvp $0E,$31		; 44 31 0E
	stz $EC.b,X		; 74 EC
	cmp $323201.l,X		; DF 01 32 32
	jsl $80EF01.l		; 22 01 EF 80
	ora $AABAEC.l		; 0F EC BA AA
	ldy $F1DE.w,X		; BC DE F1
	jsl $231290.l		; 22 90 12 23
	bit $32.b,X		; 34 32
	bpl -20.b		; 10 EC
	tsx		; BA
	tax		; AA
	stz $54.b,X		; 74 54
	eor ($64.b,S),Y		; 53 64
	ora ($01.b,X)		; 01 01
	sbc $741202.l		; EF 02 12 74
	and ($01.b,X)		; 21 01
	jsr ($CCDC.w,X)		; FC DC CC
	cmp $741514.l,X		; DF 14 15 74
	.db $42, $23		; 42 23
	sbc $DDAADA.l		; EF DA AA DD
	sbc ($25.b,S),Y		; F3 25
	stz $45.b,X		; 74 45
	eor ($01.b,X)		; 41 01
	sbc $2200EE.l		; EF EE 00 22
	jsl $FE1074.l		; 22 74 10 FE
	beq -18.b		; F0 EE
	brk $EC.b		; 00 EC
	xba		; EB
	cmp $D074.w		; CD 74 D0
	ora ($55.b,S),Y		; 13 55
	rol $43.b,X		; 36 43
	and $74ED1F.l,X		; 3F 1F ED 74
	asl $200F.w,X		; 1E 0F 20
	brk $10.b		; 00 10
	inc $A9DC.w		; EE DC A9
	stz $BD.b,X		; 74 BD
	sbc ($25.b,X)		; E1 25
	lsr $54.b		; 46 54
	eor $10.b,S		; 43 10
	sbc $001F74.l,X		; FF 74 1F 00
	bpl  16.b		; 10 10
	asl $FC1E.w,X		; 1E 1E FC
	dex		; CA
	stz $A9.b,X		; 74 A9
	jmp.w [$2510]		; DC 10 25
	eor $54.b,X		; 55 54
	eor $3F.b,S		; 43 3F
	stz $1F.b,X		; 74 1F
	ora $1010F0.l		; 0F F0 10 10
	asl $CBFC.w,X		; 1E FC CB
	sty $DB.b		; 84 DB
	sbc $22F0.w		; ED F0 22
	and ($42.b,S),Y		; 33 42
	and ($11.b,X)		; 21 11
	stz $FF.b,X		; 74 FF
	ora $031110.l		; 0F 10 11 03
	ora $84AAFD.l		; 0F FD AA 84
	lda $F0CF.w,X		; BD CF F0
	jsl $123333.l		; 22 33 33 12
	bpl -128.b		; 10 80
	ror $65.b,X		; 76 65
	eor $56.b,X		; 55 56
	ror $64.b		; 66 64
	jsr $84D9.w		; 20 D9 84
	ldy $F2EE.w,X		; BC EE F2
	jsl $113243.l		; 22 43 32 11
	and $0F1084.l		; 2F 84 10 0F
	cop $00.b		; 02 00
	bpl -17.b		; 10 EF
	sbc $74CB.w		; ED CB 74
	sta $26C0.w,X		; 9D C0 26
	eor [$76.b]		; 47 76
	bit $31.b		; 24 31
	ora ($84.b),Y		; 11 84
	sbc ($F1.b),Y		; F1 F1
	brk $10.b		; 00 10
	sbc $CDDBED.l,X		; FF ED DB CD
	stz $D0.b,X		; 74 D0
	asl $47.b		; 06 47
	eor [$43.b],Y		; 57 43
	and $F1.b,S		; 23 F1
	ora ($84.b),Y		; 11 84
	sbc ($00.b)		; F2 00
	ora $CBDE0E.l,X		; 1F 0E DE CB
	cmp $74FF.w		; CD FF 74
	lsr $65.b		; 46 65
	ror $43.b,X		; 76 43
	ora ($F1.b)		; 12 F1
	ora ($11.b),Y		; 11 11
	sty $12.b		; 84 12
	beq -18.b		; F0 EE
	jmp.w [$CEBB]		; DC BB CE
	sbc ($24.b),Y		; F1 24
	stz $67.b,X		; 74 67
	ror $32.b,X		; 76 32
	ora ($FF.b),Y		; 11 FF
	ora ($23.b),Y		; 11 23
	and ($84.b),Y		; 31 84
	sbc $BCCBFC.l,X		; FF FC CB BC
	dec $3412.w,X		; DE 12 34
	mvp $64,$74		; 44 74 64
	and ($1F.b),Y		; 31 1F
	sbc ($11.b),Y		; F1 11
	and $1F.b,S		; 23 1F
	jsr ($CD84.w,X)		; FC 84 CD
	tsx		; BA
	dec $14E1.w		; CE E1 14
	mvp $31,$43		; 44 43 31
	sty $1F.b		; 84 1F
	ora $10211F.l		; 0F 1F 21 10
	sbc $84CADD.l,X		; FF DD CA 84
	lda $13DF.w,X		; BD DF 13
	mvp $23,$45		; 44 45 23
	ora ($F0.b,X)		; 01 F0
	sty $00.b		; 84 00
	ora ($12.b,X)		; 01 12
	sbc $BBCBDD.l,X		; FF DD CB BB
	inc $1284.w		; EE 84 12
	eor $45.b		; 45 45
	and ($01.b,S),Y		; 33 01
	sbc $84200F.l,X		; FF 0F 20 84
	ora ($FF.b),Y		; 11 FF
	dec $BBCB.w,X		; DE CB BB
	sbc $844502.l		; EF 02 45 84
	mvn $1F,$43		; 54 43 1F
	ora $2100F0.l		; 0F F0 00 21
	asl $DC84.w		; 0E 84 DC
	stp		; DB
	ldy $04E0.w		; AC E0 04
	eor $65.b,X		; 55 65
	and ($84.b),Y		; 31 84
	ora $00F1FF.l		; 0F FF F1 00
	jsr $CDFD.w		; 20 FD CD
	dex		; CA
	sty $BE.b		; 84 BE
	sbc ($34.b,X)		; E1 34
	eor [$54.b],Y		; 57 54
	bmi  -1.b		; 30 FF
	sbc $00F184.l		; EF 84 F1 00
	ora $BBCDED.l,X		; 1F ED CD BB
	cmp $5684F2.l		; CF F2 84 56
	ror $44.b		; 66 44
	ora $F0DFFE.l,X		; 1F FE DF F0
	ora ($84.b),Y		; 11 84
	asl $CDDD.w		; 0E DD CD
	tyx		; BB
	beq  35.b		; F0 23
	ror $65.b,X		; 76 65
	stz $72.b,X		; 74 72
	dec $BFCB.w		; CE CB BF
	brk $01.b		; 00 01
	dex		; CA
	tax		; AA
	sty $EB.b		; 84 EB
	cmp $7546F2.l,X		; DF F2 46 75
	mvp $ED,$1E		; 44 1E ED
	sty $DE.b		; 84 DE
	cpx #$0F10.w		; E0 10 0F
	sbc $CBED.w		; ED ED CB
	ora ($84.b,X)		; 01 84
	bit $77.b		; 24 77
	mvn $DD,$20		; 54 20 DD
	cmp $11D0.w,X		; DD D0 11
	sty $10.b		; 84 10
	sbc $ECDF.w,X		; FD DF EC
	cmp ($01.b),Y		; D1 01
	lsr $73.b		; 46 73
	bcc 119.b		; 90 77
	stz $31.b,X		; 74 31
	asl $00EF.w		; 0E EF 00
	brk $FE.b		; 00 FE
	bcc -35.b		; 90 DD
	lda #$AA.b		; A9 AA
	cmp $756725.l		; CF 25 67 75
	and ($84.b,X)		; 21 84
	inc $30E1.w		; EE E1 30
	bpl  -4.b		; 10 FC
	sbc ($C9.b),Y		; F1 C9
	ora ($90.b,X)		; 01 90
	lda $6715.w,X		; BD 15 67
	ror $31.b,X		; 76 31
	ora $9000DE.l		; 0F DE 00 90
	brk $0F.b		; 00 0F
	dec $ABFB.w,X		; DE FB AB
	tyx		; BB
	sbc $56.b,S		; E3 56
	sty $22.b		; 84 22
	tsx		; BA
	dec $43CF.w,X		; DE CF 43
	ora ($10.b,X)		; 01 10
	lda $C11D94.l,X		; BF 94 1D C1
	brk $25.b		; 00 25
	eor ($11.b,X)		; 41 11
	cpx $94F0.w		; EC F0 94
	inc $0022.w		; EE 22 00
	ora $CE20FF.l		; 0F FF 20 CE
	rol $0494.w		; 2E 94 04
	eor ($02.b,S),Y		; 53 02
	phd		; 0B
	cpy #$14EE.w		; C0 EE 14
	bpl -108.b		; 10 94
	ora ($FD.b,X)		; 01 FD
	and ($BB.b,X)		; 21 BB
	bpl -27.b		; 10 E5
	stz $12.b		; 64 12
	sty $1B.b,X		; 94 1B
	lda $1F041D.l,X		; BF 1D 04 1F
	sbc ($FE.b),Y		; F1 FE
	ora ($94.b,S),Y		; 13 94
	sbc #$01.b		; E9 01
	sbc $75.b,S		; E3 75
	jsr $9E1C.w		; 20 1C 9E
	ora $10E0A0.l,X		; 1F A0 E0 10
	brk $10.b		; 00 10
	cop $0C.b		; 02 0C
	ldy $A4BD.w,X		; BC BD A4
	mvn $1D,$00		; 54 00 1D
	cpy #$F210.w		; C0 10 F2
	ora $00A4E0.l,X		; 1F E0 A4 00
	ora ($0C.b,S),Y		; 13 0C
	cmp ($E0.b),Y		; D1 E0
	mvn $0E,$20		; 54 20 0E
	ldy $AF.b		; A4 AF
	ora ($02.b),Y		; 11 02
	rol $10E1.w		; 2E E1 10
	ora $FA.b,S		; 03 FA
	ldy $D0.b		; A4 D0
	sbc ($66.b),Y		; F1 66
	and $31BFFD.l		; 2F FD BF 31
	sbc ($A4.b),Y		; F1 A4
	asl $12E1.w		; 0E E1 12
	ora ($0B.b)		; 12 0B
	bcs   0.b		; B0 00
	adc $A4.b		; 65 A4
	rol $BFFE.w		; 2E FE BF
	and ($00.b)		; 32 00
	ora $32E1.w,X		; 1D E1 32
	bcs  34.b		; B0 22
	ora $CEBB.w,X		; 1D BB CE
	and $53.b		; 25 53
	jsr $A4EE.w		; 20 EE A4
	eor ($FE.b,X)		; 41 FE
	ora $42F2.w		; 0D F2 42
	and ($EB.b,X)		; 21 EB
	bcc -92.b		; 90 A4
	and ($56.b,X)		; 21 56
	asl $EFDF.w		; 0E DF EF
	.db $42, $FE		; 42 FE
	sbc $43E3A4.l		; EF A4 E3 43
	ora $33A1E9.l		; 0F E9 A1 33
	ror $FD.b		; 66 FD
	ldy #$EE10.w		; A0 10 EE
	and $0C.b,S		; 23 0C
	tsx		; BA
	bcs  70.b		; B0 46
	stz $A4.b		; 64 A4
	jmp.w [$41CE]		; DC CE 41
	bit $1F.b		; 24 1F
	sbc ($1F.b,X)		; E1 1F
	ora ($A4.b),Y		; 11 A4
	cmp $03E1.w,X		; DD E1 03
	eor ($0D.b,X)		; 41 0D
	sbc $42BF.w,X		; FD BF 42
	ldy $15.b		; A4 15
	asl $1EF0.w,X		; 1E F0 1E
	ora ($DD.b,X)		; 01 DD
	sbc ($14.b),Y		; F1 14
	ldy #$4255.w		; A0 55 42
	asl $ADC9.w		; 0E C9 AD
	cmp $945434.l		; CF 34 54 94
	bit $BDB0.w		; 2C B0 BD
	cmp $32.b,S		; C3 32
	adc ($3E.b,S),Y		; 73 3E
	cmp $02BBA4.l,X		; DF A4 BB 02
	trb $51.b		; 14 51
	sbc $FEE20E.l,X		; FF 0E E2 FE
	ldy $D0.b		; A4 D0
	ora ($42.b),Y		; 11 42
	ora $C2EDFF.l,X		; 1F FF ED C2
	bpl -96.b		; 10 A0
	trb $64.b		; 14 64
	mvp $FE,$00		; 44 00 FE
	wai		; CB
	dec $A403.w,X		; DE 03 A4
	and ($EF.b,X)		; 21 EF
	stp		; DB
	lda ($31.b)		; B2 31
	mvn $E1,$1F		; 54 1F E1
	ldy $D0.b		; A4 D0
	asl $11DE.w		; 0E DE 11
	mvp $DF,$20		; 44 20 DF
	cmp $30CEA4.l,X		; DF A4 CE 30
	bit $32.b		; 24 32
	sbc ($ED.b),Y		; F1 ED
	sbc $12A4EE.l		; EF EE A4 12
	and $22.b,S		; 23 22
	sbc $409DFC.l,X		; FF FC 9D 40
	and [$A0.b],Y		; 37 A0
	adc [$55.b],Y		; 77 55
	and $BCDA0F.l		; 2F 0F DA BC
	cmp ($56.b,S),Y		; D3 56
	ldy $FF.b		; A4 FF
	dec $13DB.w,X		; DE DB 13
	ora $42.b		; 05 42
	ora $E0A40C.l		; 0F 0C A4 E0
	sbc $2302.w		; ED 02 23
	and ($0D.b,S),Y		; 33 0D
	sbc $A4AB.w		; ED AB A4
	and ($17.b,S),Y		; 33 17
	rti		; 40

	sbc $DC000C.l,X		; FF 0C 00 DC
	cop $A4.b		; 02 A4
	and $51.b		; 25 51
	jsr ($ECDC.w,X)		; FC DC EC
	trb $05.b		; 14 05
	eor ($A4.b)		; 52 A4
	ora $DECF0C.l		; 0F 0C CF DE
	tsb $33.b		; 04 33
	.db $42, $FD		; 42 FD
	bcs  15.b		; B0 0F
	cmp #$BD.b		; C9 BD
	sep #$44		; E2 44
	eor $20.b,S		; 43 20
	sbc $03DDA4.l,X		; FF A4 DD 03
	rol $51.b		; 26 51
	jsr ($CCCB.w,X)		; FC CB CC
	bit $A4.b,X		; 34 A4
	and [$32.b]		; 27 32
	sbc $DDDEFC.l,X		; FF FC DE DD
	trb $45.b		; 14 45
	ldy $21.b,X		; B4 21
	sbc $C0FE.w,X		; FD FE C0
	and ($24.b,X)		; 21 24
	brk $00.b		; 00 00
	ldy $EB.b		; A4 EB
	ora $33BF.w		; 0D BF 33
	eor [$2F.b]		; 47 2F
	jmp.w [$A4CC]		; DC CC A4
	bcs  66.b		; B0 42
	ror $12.b		; 66 12
	sbc $EFEDCC.l		; EF CC ED EF
	ldy $22.b,X		; B4 22
	jsl $FCEE10.l		; 22 10 EE FC
.INDEX 8
	sep #$11		; E2 11
	eor ($A4.b)		; 52 A4
	sbc $EBC00D.l,X		; FF 0D C0 EB
.ACCU 8
.INDEX 8
	sep #$34		; E2 34
	adc ($EE.b)		; 72 EE
	ldy $DC.b		; A4 DC
	inc $30C2.w		; EE C2 30
	adc $3F.b,X		; 75 3F
	inc $B49D.w		; EE 9D B4
	ora $212101.l		; 0F 01 21 21
	asl $DCFE.w,X		; 1E FE DC
	ora ($B0.b,S),Y		; 13 B0
.ACCU 8
	sep #$66		; E2 66
	eor $2F.b,S		; 43 2F
	sbc $F3CEDC.l		; EF DC CE F3
	bcs 102.b		; B0 66
	eor ($EC.b,X)		; 41 EC
	tsx		; BA
	lda $544502.l,X		; BF 02 45 54
	ldy $0A.b		; A4 0A
	lda $27DF.w,X		; BD DF 27
	mvn $DB,$30		; 54 30 DB
	jmp.w [$CEB4]		; DC B4 CE
	and ($26.b),Y		; 31 26
	jsr $DD0F.w		; 20 0F DD
	sbc $44A4FF.l,X		; FF FF A4 44
	eor [$2E.b],Y		; 57 2E
	stp		; DB
	lda $54EC.w		; AD EC 54
	and [$B0.b]		; 27 B0
	ror $54.b		; 66 54
	rol $BBCC.w		; 2E CC BB
	sbc ($34.b,X)		; E1 34
	adc $B4.b		; 65 B4
	sbc $D0FC.w		; ED FC D0
	eor ($45.b,X)		; 41 45
	ora $A4CFFF.l		; 0F FF CF A4
	jsr ($44E2.w,X)		; FC E2 44
	ror $0C.b,X		; 76 0C
	lda $DFB0.w,Y		; B9 B0 DF
	bcs -32.b		; B0 E0
	ora $76.b,X		; 15 76
	eor $0C.b,S		; 43 0C
	tyx		; BB
	ldy $B403.w,X		; BC 03 B4
	ora ($0F.b)		; 12 0F
	dec $E2EC.w,X		; DE EC E2
	and ($63.b)		; 32 63
	sbc $C0FDB4.l,X		; FF B4 FD C0
	inc $2302.w,X		; FE 02 23
	.db $42, $EE		; 42 EE
	cmp $ABB0.w		; CD B0 AB
	txy		; 9B
	beq  55.b		; F0 37
	ror $42.b,X		; 76 42
	phx		; DA
	tax		; AA
	cpy #$DF.b		; C0 DF
	ora ($33.b)		; 12 33
	and ($0F.b),Y		; 31 0F
	jmp.w [$F1CE]		; DC CE F1
	ldy $61.b,X		; B4 61
	sbc $EFD0DD.l,X		; FF DD D0 EF
	ora ($34.b)		; 12 34
	rti		; 40

	ldy $DD.b,X		; B4 DD
	cmp $E4F0.w		; CD F0 E4
	and ($44.b),Y		; 31 44
	asl $B4ED.w		; 0E ED B4
	ldx $1410.w		; AE 10 14
	eor ($21.b,X)		; 41 21
	sbc $CCED.w		; ED ED CC
	ldy $33.b,X		; B4 33
	rol $5F.b,X		; 36 5F
	inc $F0CC.w,X		; FE CC F0
	cpx #$22.b		; E0 22
	ldy $44.b,X		; B4 44
	rol $CDDC.w,X		; 3E DC CD
	asl $1315.w,X		; 1E 15 13
	.db $42, $B0		; 42 B0
	adc $2D.b,X		; 75 2D
	sta $E39A.w,Y		; 99 9A E3
	lsr $76.b,X		; 56 76
	bmi -76.b		; 30 B4
	sbc $43CE.w		; ED CE 43
	eor [$3E.b]		; 47 3E
	sbc $0FCC.w		; ED CC 0F
	ldy $F1.b,X		; B4 F1
	and ($44.b,S),Y		; 33 44
	asl $CFCC.w		; 0E CC CF
	asl $B434.w,X		; 1E 34 B4
	ora ($50.b,S),Y		; 13 50
	inc $D1CB.w		; EE CB D1
	cop $44.b		; 02 44
	and ($B4.b,X)		; 21 B4
	asl $DCDD.w,X		; 1E DD DC
	rep #$44		; C2 44
	ror $0D.b		; 66 0D
	cpx $BFB4.w		; EC B4 BF
	asl $3402.w		; 0E 02 34
	eor ($EC.b,S),Y		; 53 EC
	dex		; CA
	cmp ($B4.b)		; D2 B4
	beq  98.b		; F0 62
	ora $3F.b,X		; 15 3F
	cmp $01BA.w,X		; DD BA 01
	trb $B4.b		; 14 B4
	.db $62, $11, $FD		; 62 11 FD
	cmp $F4DB.w,X		; DD DB F4
	eor $73.b		; 45 73
	ldy $ED.b,X		; B4 ED
	wai		; CB
	cpy #$0F.b		; C0 0F
	and $44.b,S		; 23 44
	rti		; 40

	stp		; DB
	ldy $BB.b,X		; B4 BB
	ora ($F4.b,X)		; 01 F4
	rts		; 60

	mvp $DC,$0D		; 44 0D DC
	sta $21B4.w,X		; 9D B4 21
	rol $41.b,X		; 36 41
	bpl -51.b		; 10 CD
	dec $25CD.w,X		; DE CD 25
	ldy $37.b,X		; B4 37
	adc $F1BAEC.l		; 6F EC BA F1
	sbc ($33.b)		; F2 33
	bit $B4.b,X		; 34 B4
	and $BECC.w		; 2D CC BE
	bpl   6.b		; 10 06
	and ($62.b),Y		; 31 62
	jmp.w [$DAB4]		; DC B4 DA
	lda ($31.b),Y		; B1 31
	lsr $20.b		; 46 20
	asl $DCCD.w,X		; 1E CD DC
	ldy $DF.b,X		; B4 DF
	adc $57.b		; 65 57
	ora $ADDB.w,X		; 1D DB AD
	bpl   3.b		; 10 03
	ldy $44.b,X		; B4 44
	eor $EC.b,S		; 43 EC
	tsx		; BA
	cmp ($2F.b,X)		; C1 2F
	lsr $04.b,X		; 56 04
	ldy $5E.b,X		; B4 5E
	ldy $E4BA.w,X		; BC BA E4
	bit $64.b		; 24 64
	sbc ($FC.b),Y		; F1 FC
	ldy $CD.b,X		; B4 CD
	cmp $65E3.w,X		; DD E3 65
	stz $FC.b		; 64 FC
	tsx		; BA
	bcs -76.b		; B0 B4
	ora ($33.b),Y		; 11 33
	eor $40.b,S		; 43 40
	wai		; CB
	plb		; AB
	sbc ($11.b,S),Y		; F3 11
	ldy $73.b,X		; B4 73
	ora $1B.b,X		; 15 1B
	wai		; CB
	lda $3524.w		; AD 24 35
	eor ($B4.b),Y		; 51 B4
	beq -37.b		; F0 DB
	sbc $17CD.w		; ED CD 17
	adc $6F.b		; 65 6F
	stp		; DB
	ldy $AA.b,X		; B4 AA
	sbc ($02.b)		; F2 02
	eor $44.b,S		; 43 44
	bit $ADBA.w		; 2C BA AD
	ldy $32.b,X		; B4 32
	ora [$5F.b],Y		; 17 5F
	eor ($CB.b)		; 52 CB
	dex		; CA
	lda ($43.b),Y		; B1 43
	cpy #$14.b		; C0 14
	mvn $FE,$42		; 54 42 FE
	jmp.w [$D1BB]		; DC BB D1
	rol $B4.b,X		; 36 B4
	and $ACBA.w,X		; 3D BA AC
	jsl $324323.l		; 22 23 43 32
	xce		; FB
	ldy $AA.b,X		; B4 AA
	cmp ($41.b,X)		; C1 41
	eor [$02.b]		; 47 02
	lsr $CAAC.w		; 4E AC CA
	ldy $F4.b,X		; B4 F4
	mvp $EF,$64		; 44 64 EF
	xce		; FB
	dec $E4DD.w		; CE DD E4
	cpy #$03.b		; C0 03
	adc [$63.b]		; 67 63
	jsr ($DEAB.w,X)		; FC AB DE
	sbc ($34.b),Y		; F1 34
	cpy $20.b		; C4 20
	cmp $02DD.w,X		; DD DD 02
	ora ($41.b)		; 12 41
	cop $0D.b		; 02 0D
	ldy $AC.b,X		; B4 AC
	lda $3754.w		; AD 54 37
	bvc -33.b		; 50 DF
	tyx		; BB
	inc $EFB4.w		; EE B4 EF
	rol $65.b		; 26 65
	rti		; 40

	tsx		; BA
	txy		; 9B
	sbc ($33.b,S),Y		; F3 33
	cpy $22.b		; C4 22
	ora ($0E.b),Y		; 11 0E
	cmp $21EF.w,X		; DD EF 21
	trb $20.b		; 14 20
	ldy $30.b,X		; B4 30
	plb		; AB
	wai		; CB
	cpy $53.b		; C4 53
	adc $1D.b		; 65 1D
	jsr ($EDC0.w,X)		; FC C0 ED
	wai		; CB
	plb		; AB
	cop $57.b		; 02 57
	stz $0D.b		; 64 0D
	tax		; AA
	ldy $42.b,X		; B4 42
	and $32.b,X		; 35 32
	and ($CA.b),Y		; 31 CA
	lda $22E3.w,Y		; B9 E3 22
	cpy $52.b		; C4 52
	cop $0D.b		; 02 0D
	dec $12EE.w,X		; DE EE 12
	and $31.b,S		; 23 31
	ldy $DF.b,X		; B4 DF
	cmp #$DE.b		; C9 DE
	cpx #$16.b		; E0 16
	stz $41.b,X		; 74 41
	dex		; CA
	ldy $9A.b,X		; B4 9A
	sbc $33.b,S		; E3 33
	mvn $1C,$31		; 54 31 1C
	tax		; AA
	lda $25B4.w,X		; BD B4 25
	ora [$7F.b],Y		; 17 7F
	jsl $C2CBB9.l		; 22 B9 CB C2
	stz $C0.b		; 64 C0
	and $64.b		; 25 64
	and ($EC.b),Y		; 31 EC
	tyx		; BB
	plb		; AB
	sbc ($57.b,S),Y		; F3 57
	ldy $1C.b,X		; B4 1C
	lda #$9E.b		; A9 9E
	and ($36.b,S),Y		; 33 36
	.db $42, $21		; 42 21
	phx		; DA
	cpy $DD.b		; C4 DD
	sbc ($12.b,X)		; E1 12
	eor ($11.b)		; 52 11
	ora $EFDD.w		; 0D DD EF
	ldy $24.b,X		; B4 24
	eor $72.b		; 45 72
	ora $AEA9.w		; 0D A9 AE
	ora $17.b,S		; 03 17
	ldy $72.b,X		; B4 72
	.db $42, $B9		; 42 B9
	tax		; AA
.INDEX 16
	rep #$55		; C2 55
	eor $3F.b,X		; 55 3F
	cpy #$FC42.w		; C0 42 FC
	tax		; AA
	lda $55E3.w,X		; BD E3 55
	adc $1E.b,X		; 75 1E
	ldy $AC.b,X		; B4 AC
	pea $5554.w		; F4 54 55
	asl $ADFB.w		; 0E FB AD
	cmp $04BCC0.l,X		; DF C0 BC 04
	eor [$63.b],Y		; 57 63
	tsb $CDAA.w		; 0C AA CD
	cop $C0.b		; 02 C0
	eor $65.b		; 45 65
	and $EF9CC9.l		; 2F C9 9C EF
	and $46.b,X		; 35 46
	ldy $19.b,X		; B4 19
	ldy $46BD.w		; AC BD 46
	eor $60.b		; 45 60
	dec $B4CA.w,X		; DE CA B4
	dec $27FF.w,X		; DE FF 27
	stz $30.b,X		; 74 30
	lda $F49B.w,Y		; B9 9B F4
	cpy #$24E0.w		; C0 E0 24
	eor $52.b,X		; 55 52
	jsr ($BDA9.w,X)		; FC A9 BD
	sbc $B4.b,S		; E3 B4
	bvc  48.b		; 50 30
	lda #$CB.b		; A9 CB
	pei ($54.b)		; D4 54
	lsr $1E.b,X		; 56 1E
	cpy $FE.b		; C4 FE
	dec $01F0.w		; CE F0 01
	bit $21.b,X		; 34 21
	ora $B4DC.w,X		; 1D DC B4
	ldx $4534.w,Y		; BE 34 45
	eor $10.b,S		; 43 10
	cmp #$AB.b		; C9 AB
	sbc $C4.b,S		; E3 C4
	and ($43.b,X)		; 21 43
	ora ($0D.b,X)		; 01 0D
	dec $23EE.w		; CE EE 23
	and $C0.b,S		; 23 C0
	ror $43.b		; 66 43
	asl $BBCB.w,X		; 1E CB BB
	cmp $B46735.l		; CF 35 67 B4
	cmp #$9A.b		; C9 9A
	sbc ($34.b,S),Y		; F3 34
	eor ($32.b,S),Y		; 53 32
	tsb $C0A9.w		; 0C A9 C0
	lda #$BD.b		; A9 BD
.ACCU 8
	sep #$65		; E2 65
	lsr $3F.b,X		; 56 3F
	stp		; DB
	txy		; 9B
	cpy #$36E1.w		; C0 E1 36
	stz $31.b		; 64 31
	cpx $BBBB.w		; EC BB BB
	sbc ($B4.b,S),Y		; F3 B4
	eor ($2C.b,S),Y		; 53 2C
	sta $33AE.w,Y		; 99 AE 33
	eor $42.b		; 45 42
	and ($C0.b,X)		; 21 C0
	bmi -38.b		; 30 DA
	txy		; 9B
	dec $5625.w,X		; DE 25 56
	adc $FD.b,S		; 63 FD
	ldy $DC.b,X		; B4 DC
	and $54.b		; 25 54
	adc $EE.b,S		; 63 EE
	cmp #$BD.b		; C9 BD
	ora ($C0.b,X)		; 01 C0
	cmp $516735.l,X		; DF 35 67 51
	phx		; DA
	txs		; 9A
	cmp $55C024.l,X		; DF 24 C0 55
	eor ($0D.b,S),Y		; 53 0D
	lda $E1AD.w,Y		; B9 AD E1
	eor $66.b,X		; 55 66
	ldy $A9.b,X		; B4 A9
	ldy $55D2.w,X		; BC D2 55
	eor $3E.b		; 45 3E
	sbc $C4AB.w		; ED AB C4
	sbc $212401.l,X		; FF 01 24 21
	rol $EEDC.w		; 2E DC EE
	ora ($C0.b)		; 12 C0
	sbc ($35.b)		; F2 35
	eor $40.b,X		; 55 40
	stp		; DB
	txs		; 9A
	dec $B405.w,X		; DE 05 B4
	and $CC9A3D.l		; 2F 3D 9A CC
	asl $54.b		; 06 54
	mvn $C4,$ED		; 54 ED C4
	inc $F0DF.w,X		; FE DF F0
	ora ($43.b,X)		; 01 43
	and ($FD.b,X)		; 21 FD
	jmp.w [$D1B4]		; DC B4 D1
	eor $54.b,S		; 43 54
	jsl $ABBA2F.l		; 22 2F BA AB
	sbc $C4.b,X		; F5 C4
	and ($42.b,X)		; 21 42
	ora ($FD.b,X)		; 01 FD
	dec $23EF.w,X		; DE EF 23
	jsl $4266C0.l		; 22 C0 66 42
	ora $BBBB.w		; 0D BB BB
	cmp ($45.b),Y		; D1 45
	ror $C0.b,X		; 76 C0
	and $E1ACC9.l,X		; 3F C9 AC E1
	bit $55.b,X		; 34 55
	.db $42, $FC		; 42 FC
	cpy #$BCAA.w		; C0 AA BC
	pea $6456.w		; F4 56 64
	asl $ACCA.w,X		; 1E CA AC
	cpy #$46F1.w		; C0 F1 46
	adc $30.b		; 65 30
	dex		; CA
	plb		; AB
	dec $C014.w,X		; DE 14 C0
	eor $64.b,X		; 55 64
	tsb $AEA9.w		; 0C A9 AE
	ora ($55.b,S),Y		; 13 55
	eor $C0.b,S		; 43 C0
	ora $BEBBDC.l,X		; 1F DC BB BE
	and $66.b,X		; 35 66
	eor ($DB.b),Y		; 51 DB
	ldy $E2.b,X		; B4 E2
	and ($53.b,S),Y		; 33 53
	and ($2D.b)		; 32 2D
	lda #$BC.b		; A9 BC
	and $C0.b		; 25 C0
	beq  69.b		; F0 45
	lsr $40.b		; 46 40
	stp		; DB
	tax		; AA
	bne  37.b		; D0 25
	ldy $3F.b,X		; B4 3F
	cmp $DEBB.w,X		; DD BB DE
	ora ($37.b,X)		; 01 37
	adc ($2F.b,S),Y		; 73 2F
	cpy #$BA2E.w		; C0 2E BA
	ldy $34F1.w		; AC F1 34
	eor $41.b,X		; 55 41
	cpx $AAC0.w		; EC C0 AA
	cmp $55F4.w		; CD F4 55
	adc $1E.b		; 65 1E
	dex		; CA
	lda $F2C0.w		; AD C0 F2
	eor $55.b		; 45 55
	bmi -37.b		; 30 DB
	plb		; AB
	cmp $55C004.l,X		; DF 04 C0 55
	stz $0D.b		; 64 0D
	tsx		; BA
	ldx $4513.w		; AE 13 45
	eor $B4.b,S		; 43 B4
	cpx $E0BE.w		; EC BE E0
	cop $77.b		; 02 77
	and $FA.b,S		; 23 FA
	txs		; 9A
	ldy $D0.b,X		; B4 D0
	eor $44.b,S		; 43 44
	jsl $BBBA2F.l		; 22 2F BA BB
	sbc $B4.b,X		; F5 B4
	eor ($75.b,X)		; 41 75
.INDEX 8
	sep #$1A		; E2 1A
	ldy $46CD.w		; AC CD 46
	mvp $50,$B4		; 44 B4 50
	sbc $DEDA.w		; ED DA DE
	sbc ($23.b),Y		; F1 23
	adc $31.b,X		; 75 31
	ldy $D9.b,X		; B4 D9
	txy		; 9B
	cmp ($54.b)		; D2 54
	eor $21.b,S		; 43 21
	asl $B4CB.w		; 0E CB B4
	lda $1702.w,X		; BD 02 17
	adc ($31.b)		; 72 31
	lda $D2BC.w,Y		; B9 BC D2
	ldy $44.b,X		; B4 44
	mvp $0C,$30		; 44 30 0C
	tax		; AA
	dec $2335.w		; CE 35 23
	ldy $71.b,X		; B4 71
	ora $C9.b,S		; 03 C9
	ldy $75D2.w		; AC D2 75
	bit $2D.b,X		; 34 2D
	cpy $FF.b		; C4 FF
	inc $00FF.w		; EE FF 00
	trb $31.b		; 14 31
	ora $ADB4DD.l,X		; 1F DD B4 AD
	bit $34.b		; 24 34
	and ($12.b)		; 32 12
	xce		; FB
	plb		; AB
	cmp $1654B4.l		; CF B4 54 16
	lsr $AA21.w,X		; 5E 21 AA
	cpy $64E4.w		; CC E4 64
	cpy #$45.b		; C0 45
	eor ($20.b,S),Y		; 53 20
	cpx $CDBB.w		; EC BB CD
	sbc ($56.b,S),Y		; F3 56
	cpy #$64.b		; C0 64
	ora $BEBA.w,X		; 1D BA BE
	cop $34.b		; 02 34
	mvp $C0,$31		; 44 31 C0
	cpx $DEBB.w		; EC BB DE
	tsb $45.b		; 04 45
	stz $0D.b		; 64 0D
	tsx		; BA
	ldy $24.b,X		; B4 24
	mvn $00,$33		; 54 33 00
	stp		; DB
	ldy $63D1.w		; AC D1 63
	ldy $17.b,X		; B4 17
	rol $9920.w,X		; 3E 20 99
	cmp $6305.w,X		; DD 05 63
	and ($B4.b,S),Y		; 33 B4
	sbc $BEFD.w,X		; FD FD BE
	cpx #$01.b		; E0 01
	eor [$23.b],Y		; 57 23
	trb $9AB4.w		; 1C B4 9A
	cmp $123434.l		; CF 34 34 12
	and ($DB.b,X)		; 21 DB
	tyx		; BB
	ldy $D2.b,X		; B4 D2
	eor ($36.b)		; 52 36
	ora $DD9B3F.l,X		; 1F 3F 9B DD
	sbc $C0.b,X		; F5 C0
	cop $45.b		; 02 45
	eor $20.b,S		; 43 20
	cpx $CDCC.w		; EC CC CD
	ora $B4.b,S		; 03 B4
	and ($1C.b,S),Y		; 33 1C
	txs		; 9A
	dec DMASRC3B.w		; CE 34 43
	jsl $DCB420.l		; 22 20 B4 DC
	tyx		; BB
	sbc ($21.b,X)		; E1 21
	ror $13.b,X		; 76 13
	tas		; 1B
	plb		; AB
	ldy $CD.b,X		; B4 CD
	bit $44.b		; 24 44
	.db $42, $00		; 42 00
	wai		; CB
	ldy $C0E2.w,X		; BC E2 C0
	sbc $534414.l		; EF 14 44 53
	sbc $BEBA.w,X		; FD BA BE
	ora ($B4.b)		; 12 B4
	and ($FE.b)		; 32 FE
	cpx $E0CE.w		; EC CE E0
	ora ($76.b,X)		; 01 76
	bit $B4.b		; 24 B4
	xce		; FB
	txy		; 9B
	cpy #$33.b		; C0 33
	eor $22.b,S		; 43 22
	jsr $B4DB.w		; 20 DB B4
	plb		; AB
	sbc $42.b,S		; E3 42
	and [$01.b],Y		; 37 01
	rol $CDAA.w		; 2E AA CD
	ldy $15.b,X		; B4 15
	mvp $FE,$43		; 44 43 FE
	cpx $E0BD.w		; EC BD E0
	ora ($C0.b),Y		; 11 C0
	tsb $56.b		; 04 56
	adc $FC.b,S		; 63 FC
	tsx		; BA
	dec $3402.w		; CE 02 34
	ldy $10.b,X		; B4 10
	xba		; EB
	plb		; AB
.ACCU 8
.INDEX 8
	sep #$31		; E2 31
	ror $13.b		; 66 13
	trb $9BB4.w		; 1C B4 9B
	cmp $4424.w		; CD 24 44
	.db $42, $00		; 42 00
	stp		; DB
	ldy $D1B4.w,X		; BC B4 D1
	.db $42, $37		; 42 37
	bmi  61.b		; 30 3D
	sta $15DD.w,Y		; 99 DD 15
	ldy $53.b,X		; B4 53
	and ($0E.b,S),Y		; 33 0E
	jsr ($EFBD.w,X)		; FC BD EF
	bpl  87.b		; 10 57
	ldy $35.b,X		; B4 35
	trb $BE9A.w		; 1C 9A BE
	and $53.b,S		; 23 53
	and ($21.b)		; 32 21
	ldy $EC.b,X		; B4 EC
	tax		; AA
	bne  52.b		; D0 34
	rol $40.b		; 26 40
	jsr $B4BA.w		; 20 BA B4
	lda $54E3.w,X		; BD E3 54
	mvp $FD,$1E		; 44 1E FD
	ldy $C0DE.w,X		; BC DE C0
	cpy $46D1.w		; CC D1 46
	ror $2E.b,X		; 76 2E
	dex		; CA
	ldy $B4F1.w		; AC F1 B4
	and ($31.b,S),Y		; 33 31
	ora $CDA9.w		; 0D A9 CD
	and ($36.b,S),Y		; 33 36
	adc ($B4.b,X)		; 61 B4
	and ($C9.b,X)		; 21 C9
	ldy $45E1.w		; AC E1 45
	mvn $FC,$30		; 54 30 FC
	cpy #$FD.b		; C0 FD
	tsx		; BA
	ldy $45D0.w,X		; BC D0 45
	ror $40.b		; 66 40
	dex		; CA
	ldy $E2.b,X		; B4 E2
	eor $44.b		; 45 44
	and ($1D.b,X)		; 21 1D
	lda $04BD.w,Y		; B9 BD 04
	cpy #$E0.b		; C0 E0
	and $56.b,X		; 35 56
	eor ($DB.b,X)		; 41 DB
	tax		; AA
	cmp $55C024.l		; CF 24 C0 55
	eor $0E.b,S		; 43 0E
	wai		; CB
	ldy $25CE.w,X		; BC CE 25
	adc [$C0.b]		; 67 C0
	eor ($EB.b)		; 52 EB
	tax		; AA
	cmp $554513.l		; CF 13 45 55
	and $F29CB4.l		; 2F B4 9C F2
	eor ($37.b,S),Y		; 53 37
	bpl  46.b		; 10 2E
	sta $B4DD.w,Y		; 99 DD B4
	tsb $65.b		; 04 65
	eor $FE.b,S		; 43 FE
	xba		; EB
	lda $21DF.w,X		; BD DF 21
	cpy $25.b		; C4 25
	and ($1E.b,X)		; 21 1E
	cpy $12EF.w		; CC EF 12
	jsl $21B412.l		; 22 12 B4 21
	xce		; FB
	txs		; 9A
	cmp $512545.l		; CF 45 25 51
	ora ($B4.b),Y		; 11 B4
	cmp #$AD.b		; C9 AD
	sbc ($56.b,X)		; E1 56
	eor ($1F.b,S),Y		; 53 1F
	sbc $C4BC.w,X		; FD BC C4
	inc $0301.w,X		; FE 01 03
	.db $42, $11		; 42 11
	cpx $F1CE.w		; EC CE F1
	ldy $45.b,X		; B4 45
	and ($31.b,S),Y		; 33 31
	rol $BCB9.w		; 2E B9 BC
	ora $52.b,S		; 03 52
	ldy $55.b,X		; B4 55
	ora ($2C.b,X)		; 01 2C
	txs		; 9A
	cmp $7415.w,X		; DD 15 74
	eor ($C4.b,X)		; 41 C4
	beq -18.b		; F0 EE
	inc $10F0.w		; EE F0 10
	bit $21.b,X		; 34 21
	asl $99B4.w		; 0E B4 99
	dec $4314.w,X		; DE 14 43
	eor $11.b,S		; 43 11
	xce		; FB
	txy		; 9B
	ldy $C0.b,X		; B4 C0
	and $33.b,X		; 35 33
	bvc  18.b		; 50 12
	sbc #$AC.b		; E9 AC
	cpx #$B4.b		; E0 B4
	lsr $53.b,X		; 56 53
	rol $CCFE.w		; 2E FE CC
	cmp $13F2.w,X		; DD F2 13
	cpy #$35.b		; C0 35
	ror $41.b		; 66 41
	stp		; DB
	tyx		; BB
	cmp $B44412.l,X		; DF 12 44 B4
	bpl -38.b		; 10 DA
	plb		; AB
	sbc ($53.b)		; F2 53
	and $20.b		; 25 20
	jsr $AAB4.w		; 20 B4 AA
	cpy $65F4.w		; CC F4 65
	.db $42, $FF		; 42 FF
	jsr ($B4CD.w,X)		; FC CD B4
	cmp $1622.w,X		; DD 22 16
	adc ($10.b)		; 72 10
	cmp #$BD.b		; C9 BD
.ACCU 8
.INDEX 8
	sep #$B4		; E2 B4
	mvp $30,$33		; 44 33 30
	asl $CCBA.w,X		; 1E BA CC
	ora ($32.b,S),Y		; 13 32
	cpy #$24.b		; C0 24
	eor $53.b		; 45 53
	jsr ($BEBA.w,X)		; FC BA BE
	ora ($44.b,S),Y		; 13 44
	ldy $0F.b,X		; B4 0F
	xba		; EB
	ldy $33D1.w,X		; BC D1 33
	and [$31.b]		; 27 31
	rol $B9B4.w		; 2E B4 B9
	cmp $54F3.w,X		; DD F3 54
	bit $00.b,X		; 34 00
	sbc $B4AC.w,X		; FD AC B4
	dec $1324.w		; CE 24 13
	adc ($12.b)		; 72 12
	sbc #$AD.b		; E9 AD
	bne -76.b		; D0 B4
	eor $43.b		; 45 43
	and $CDCB0F.l,X		; 3F 0F CB CD
	sbc ($31.b)		; F2 31
	ldy $56.b,X		; B4 56
	ora ($2C.b),Y		; 11 2C
	txy		; 9B
	dec $5314.w,X		; DE 14 53
	eor ($B4.b,X)		; 41 B4
	brk $FB.b		; 00 FB
	ldy $35DF.w,X		; BC DF 35
	ora ($60.b,S),Y		; 13 60
	ora ($B4.b),Y		; 11 B4
	sbc #$BE.b		; E9 BE
	cmp ($55.b,X)		; C1 55
	bit $1F.b,X		; 34 1F
	sbc $DCC0CC.l,X		; FF CC C0 DC
	lda $14EE.w,X		; BD EE 14
	eor $53.b		; 45 53
	sbc $B4CB.w,X		; FD CB B4
	bit $42.b		; 24 42
	and ($11.b),Y		; 31 11
	xce		; FB
	ldy $44C0.w,X		; BC C0 44
	ldy $13.b,X		; B4 13
	rti		; 40

	ora ($FA.b)		; 12 FA
	cpy $55B1.w		; CC B1 55
	mvp $0F,$B4		; 44 B4 0F
	sbc $E2EDDD.l,X		; FF DD ED E2
	ora $B41366.l,X		; 1F 66 13 B4
	trb $ED9C.w		; 1C 9C ED
	bit $22.b		; 24 22
	eor ($12.b,X)		; 41 12
	jsr ($BCB4.w,X)		; FC B4 BC
	cmp $411234.l		; CF 34 12 41
	ora ($0B.b,S),Y		; 13 0B
	ldy $B0B4.w,X		; BC B4 B0
	mvp $2E,$44		; 44 44 2E
	brk $DD.b		; 00 DD
	sbc $B4D0.w		; ED D0 B4
	jsr $3236.w		; 20 36 32
	rol $ECAB.w,X		; 3E AB EC
	sbc ($32.b,S),Y		; F3 32
	ldy $43.b,X		; B4 43
	cop $1D.b		; 02 1D
	lda $12BE.w,X		; BD BE 12
	and ($24.b),Y		; 31 24
	ldy $13.b,X		; B4 13
	and $BCBC.w		; 2D BC BC
	bit $44.b		; 24 44
	bmi   0.b		; 30 00
	ldy $FD.b,X		; B4 FD
	inc $11CE.w		; EE CE 11
	sbc $61.b,X		; F5 61
	.db $42, $DA		; 42 DA
	ldy $CD.b,X		; B4 CD
	cmp ($23.b,X)		; C1 23
	bit $21.b		; 24 21
	jsr $CBDC.w		; 20 DC CB
	ldy $F1.b,X		; B4 F1
	jsl $323213.l		; 22 13 32 32
	stp		; DB
	tyx		; BB
	cmp ($B4.b)		; D2 B4
	and $43.b,X		; 35 43
	brk $0F.b		; 00 0F
	sbc $E1DC.w		; ED DC E1
	bpl -76.b		; 10 B4
	lsr $23.b,X		; 56 23
	ora $CDBC.w,X		; 1D BC CD
	cop $33.b		; 02 33
	.db $42, $B4		; 42 B4
	ora ($0D.b)		; 12 0D
	cpy $02BF.w		; CC BF 02
	and ($33.b),Y		; 31 33
	and $B4.b,S		; 23 B4
	asl $BDBB.w,X		; 1E BB BD
	trb $44.b		; 14 44
	and ($00.b),Y		; 31 00
	inc $DDB4.w,X		; FE B4 DD
	dec $1301.w		; CE 01 13
	.db $62, $33, $EC		; 62 33 EC
	ldy $CFB4.w,X		; BC B4 CF
	and $24.b,S		; 23 24
	and ($21.b),Y		; 31 21
	cmp $EFCB.w,X		; DD CB EF
	ldy $23.b,X		; B4 23
	ora ($41.b)		; 12 41
	and ($FC.b,S),Y		; 33 FC
	tyx		; BB
	bcs  51.b		; B0 33
	ldy $54.b,X		; B4 54
	bpl  16.b		; 10 10
	sbc $DFDC.w		; ED DC DF
	and ($15.b,X)		; 21 15
	ldy $42.b,X		; B4 42
	eor ($CB.b,X)		; 41 CB
	wai		; CB
	cmp ($32.b),Y		; D1 32
	mvp $B4,$21		; 44 21 B4
	rol $CCDD.w		; 2E DD CC
	sbc ($22.b,X)		; E1 22
	ora ($32.b,S),Y		; 13 32
	eor ($B4.b,X)		; 41 B4
	stp		; DB
	tyx		; BB
	sbc ($25.b,X)		; E1 25
	eor $10.b,S		; 43 10
	ora $CCB4ED.l,X		; 1F ED B4 CC
	sbc $332521.l,X		; FF 21 25 33
	bmi -53.b		; 30 CB
	wai		; CB
	ldy $E1.b,X		; B4 E1
	and ($43.b,S),Y		; 33 43
	and ($1F.b,X)		; 21 1F
	cmp $F1BC.w,X		; DD BC F1
	ldy $22.b,X		; B4 22
	ora ($33.b,S),Y		; 13 33
	bmi -21.b		; 30 EB
	tyx		; BB
	cmp ($35.b),Y		; D1 35
	ldy $43.b,X		; B4 43
	bpl  31.b		; 10 1F
	sbc $E0CC.w		; ED CC E0
	and ($24.b,X)		; 21 24
	ldy $42.b,X		; B4 42
	and ($CC.b),Y		; 31 CC
	tyx		; BB
	cpx #$33.b		; E0 33
	eor ($12.b,S),Y		; 53 12
	ldy $1F.b,X		; B4 1F
	cmp $E0BD.w,X		; DD BD E0
	jsl $313314.l		; 22 14 33 31
	ldy $DB.b,X		; B4 DB
	tyx		; BB
	cmp ($34.b),Y		; D1 34
	eor $21.b,S		; 43 21
	ora $CCB4ED.l		; 0F ED B4 CC
	cpx #$13.b		; E0 13
	ora ($42.b,S),Y		; 13 42
	and ($FB.b),Y		; 31 FB
	tyx		; BB
	ldy $C0.b,X		; B4 C0
	bit $44.b,X		; 34 44
	jsr $ED1F.w		; 20 1F ED
	jmp.w [$B4EF]		; DC EF B4
	ora ($13.b)		; 12 13
	eor $32.b,S		; 43 32
	xba		; EB
	wai		; CB
	cmp $44B433.l		; CF 33 B4 44
	and ($10.b,X)		; 21 10
	sbc $EFCC.w		; ED CC EF
	ora ($30.b)		; 12 30
	ldy $34.b,X		; B4 34
	ora ($0E.b,S),Y		; 13 0E
	ldy $14CD.w		; AC CD 14
	mvp $C0,$31		; 44 31 C0
	and ($21.b,S),Y		; 33 21
	asl $CDDC.w		; 0E DC CD
	sbc $B43413.l		; EF 13 34 B4
	ora $BDCC.w,X		; 1D CC BD
	ora ($34.b)		; 12 34
	eor ($11.b,X)		; 41 11
	inc $DDB4.w,X		; FE B4 DD
	cmp $032200.l		; CF 00 22 03
	.db $42, $20		; 42 20
	nop		; EA
	ldy $CC.b,X		; B4 CC
	sbc ($44.b,X)		; E1 44
	and ($00.b,S),Y		; 33 00
	brk $EE.b		; 00 EE
	jmp.w [$E0B4]		; DC B4 E0
	ora ($13.b)		; 12 13
	and ($32.b)		; 32 32
	cpx $C0CB.w		; EC CB C0
	ldy $23.b,X		; B4 23
	mvp $1F,$20		; 44 20 1F
	inc $EFDC.w,X		; FE DC EF
	cop $B4.b		; 02 B4
	jsr $2234.w		; 20 34 22
	asl $CCBC.w,X		; 1E BC CC
	ora ($44.b,S),Y		; 13 44
	ldy $62.b		; A4 62
	sbc ($FD.b),Y		; F1 FD
	dex		; CA
	txy		; 9B
	sep #$42		; E2 42
	eor [$B4.b],Y		; 57 B4
	and $2F.b,S		; 23 2F
	stp		; DB
	wai		; CB
	sbc ($34.b)		; F2 34
	.db $42, $10		; 42 10
	cpy #$32.b		; C0 32
	bpl -19.b		; 10 ED
	cpy $F0DF.w		; CC DF F0
	and $34.b,S		; 23 34
	ldy $0C.b,X		; B4 0C
	lda $24BF.w,X		; BD BF 24
	eor $20.b,S		; 43 20
	brk $FF.b		; 00 FF
	ldy $ED.b,X		; B4 ED
	cmp $3311F2.l		; CF F2 11 33
	bit $1E.b		; 24 1E
	cpy $BDB4.w		; CC B4 BD
	cop $34.b		; 02 34
	and ($11.b),Y		; 31 11
	ora $B4CEED.l		; 0F ED CE B4
	sbc $420222.l,X		; FF 22 02 42
	and ($FB.b)		; 32 FB
	wai		; CB
	cpy #$B0.b		; C0 B0
	ldx $6525.w		; AE 25 65
	eor $42.b,X		; 55 42
	tsb $9B99.w		; 0C 99 9B
	ldy $21.b,X		; B4 21
	bit $23.b		; 24 23
	ora $02CCCB.l,X		; 1F CB CC 02
	eor $A4.b,S		; 43 A4
	adc ($11.b,S),Y		; 73 11
	asl $9ADA.w		; 0E DA 9A
	cmp $B40544.l,X		; DF 44 05 B4
	.db $42, $32		; 42 32
	xce		; FB
	cpy $24B0.w		; CC B0 24
	bit $11.b,X		; 34 11
	cpy #$33.b		; C0 33
	and ($0E.b,X)		; 21 0E
	jmp.w [$EFCD]		; DC CD EF
	cop $34.b		; 02 34
	ldy $2F.b,X		; B4 2F
	stp		; DB
	ldy $34F2.w,X		; BC F2 34
	.db $42, $01		; 42 01
	ora $ED20C0.l		; 0F C0 20 ED
	cpy $E0DE.w		; CC DE E0
	jsl $B45245.l		; 22 45 52 B4
	wai		; CB
	ldx $4423.w,Y		; BE 23 44
	jsr $FF11.w		; 20 11 FF
	cpx $CEB4.w		; EC B4 CE
	sbc ($30.b),Y		; F1 30
	and $23.b,S		; 23 23
	and ($DC.b),Y		; 31 DC
	tyx		; BB
	ldy $D1.b,X		; B4 D1
	bit $43.b,X		; 34 43
	ora ($01.b,X)		; 01 01
	inc $DFCC.w,X		; FE CC DF
	ldy $03.b,X		; B4 03
	ora ($33.b),Y		; 11 33
	and $2E.b,S		; 23 2E
	cpy $02AC.w		; CC AC 02
	ldy $44.b,X		; B4 44
	eor ($10.b,X)		; 41 10
	ora $E0CCFD.l,X		; 1F FD CC E0
	ora ($B4.b,S),Y		; 13 B4
	cop $42.b		; 02 42
	and ($0C.b,S),Y		; 33 0C
	wai		; CB
	lda $4423.w,X		; BD 23 44
	ldy $30.b,X		; B4 30
	ora ($F0.b),Y		; 11 F0
	cpx $F0CD.w		; EC CD F0
	and ($13.b),Y		; 31 13
	ldy $32.b,X		; B4 32
	and ($EC.b,S),Y		; 33 EC
	tsx		; BA
	cmp $114434.l		; CF 34 44 11
	ldy $01.b,X		; B4 01
	sbc $F2CEDC.l,X		; FF DC CE F2
	bmi  35.b		; 30 23
	and $B4.b,S		; 23 B4
	and ($DB.b)		; 32 DB
	tsx		; BA
	cmp ($34.b),Y		; D1 34
	mvp $01,$01		; 44 01 01
	ldy $FF.b,X		; B4 FF
	cpy $F3CF.w		; CC CF F3
	jsr $2324.w		; 20 24 23
	bmi -76.b		; 30 B4
	stp		; DB
	tsx		; BA
.ACCU 8
.INDEX 8
	sep #$34		; E2 34
	eor $00.b,S		; 43 00
	bpl  14.b		; 10 0E
	ldy $DB.b,X		; B4 DB
	cmp $2320F3.l,X		; DF F3 20 23
	and $40.b,S		; 23 40
	cpy $AAB4.w		; CC B4 AA
	sep #$44		; E2 44
	.db $42, $10		; 42 10
	bpl  14.b		; 10 0E
	cpy $DEB4.w		; CC B4 DE
	ora $20.b,S		; 03 20
	and $23.b,S		; 23 23
	rti		; 40

	stp		; DB
	tax		; AA
	ldy $E2.b,X		; B4 E2
	bit $52.b,X		; 34 52
	ora ($10.b,X)		; 01 10
	asl $DEDB.w		; 0E DB DE
	ldy $02.b,X		; B4 02
	bmi  19.b		; 30 13
	and $42.b,S		; 23 42
	stp		; DB
	lda $B4D1.w,Y		; B9 D1 B4
	eor $43.b,S		; 43 43
	bpl  17.b		; 10 11
	ora $F1CEDC.l		; 0F DC CE F1
	ldy $30.b,X		; B4 30
	ora ($32.b,S),Y		; 13 32
	eor $EC.b,S		; 43 EC
	tsx		; BA
	lda $54B433.l,X		; BF 33 B4 54
	bpl  17.b		; 10 11
	brk $EC.b		; 00 EC
	ldx $32E0.w,Y		; BE E0 32
	ldy $F2.b,X		; B4 F2
	and ($44.b)		; 32 44
	trb $9ECA.w		; 1C CA 9E
	trb $35.b		; 14 35
	ldy $3F.b,X		; B4 3F
	ora ($10.b),Y		; 11 10
	ora $EEBC.w		; 0D BC EE
	trb $1F.b		; 14 1F
	ldy $33.b,X		; B4 33
	ora $4F.b,X		; 15 4F
	cpy $F29A.w		; CC 9A F2
	bit $51.b,X		; 34 51
	ldy $01.b,X		; B4 01
	ora ($00.b),Y		; 11 00
	wai		; CB
	dec $30F2.w		; CE F2 30
	ora $B4.b,S		; 03 B4
	jsl $B9FC54.l		; 22 54 FC B9
	ldy #$23.b		; A0 23
	mvn $B4,$1F		; 54 1F B4
	ora ($11.b)		; 12 11
	jsr ($DFBC.w,X)		; FC BC DF
	and ($00.b,S),Y		; 33 00
	jsl $5F25B4.l		; 22 B4 25 5F
	stp		; DB
	txs		; 9A
	sbc ($44.b),Y		; F1 44
	eor ($01.b,X)		; 41 01
	ldy $11.b,X		; B4 11
	jsr $CCCB.w		; 20 CB CC
	sbc ($32.b)		; F2 32
	sbc ($22.b),Y		; F1 22
	ldy $45.b,X		; B4 45
	and $9EC9.w		; 2D C9 9E
	ora ($45.b)		; 12 45
	and $12B411.l		; 2F 11 B4 12
	asl $CEBC.w,X		; 1E BC CE
	ora $20.b,S		; 03 20
	cop $13.b		; 02 13
	ldy $54.b,X		; B4 54
	ora $BFA9.w		; 0D A9 BF
	and $44.b,S		; 23 44
	brk $02.b		; 00 02
	ldy $22.b,X		; B4 22
	ora $DFBB.w		; 0D BB DF
	ora ($2F.b,S),Y		; 13 2F
	ora ($24.b,X)		; 01 24
	ldy $63.b,X		; B4 63
	jsr ($C0A9.w,X)		; FC A9 C0
	and $42.b,S		; 23 42
	brk $12.b		; 00 12
	ldy $22.b,X		; B4 22
	ora $DFBB.w		; 0D BB DF
	ora ($1F.b,S),Y		; 13 1F
	cop $24.b		; 02 24
	ldy $63.b,X		; B4 63
	jsr ($C0A9.w,X)		; FC A9 C0
	and $32.b,S		; 23 32
	brk $12.b		; 00 12
	ldy $33.b,X		; B4 33
	ora $DEBA.w		; 0D BA DE
	jsl $24F22F.l		; 22 2F F2 24
	ldy $64.b,X		; B4 64
	ora $AFA9.w		; 0D A9 AF
	and $33.b,S		; 23 33
	brk $03.b		; 00 03
	ldy $33.b,X		; B4 33
	asl $BEBA.w,X		; 1E BA BE
	ora ($20.b)		; 12 20
	sbc ($23.b),Y		; F1 23
	cpy #$47.b		; C0 47
	adc $2E.b,X		; 75 2E
	tsx		; BA
	lda $00E0.w,X		; BD E0 00
	ora ($B4.b)		; 12 B4
	bit $2F.b,X		; 34 2F
	tsx		; BA
	lda $2202.w		; AD 02 22
	sbc $57B413.l,X		; FF 13 B4 57
	bmi -55.b		; 30 C9
	txs		; 9A
	sbc ($34.b)		; F2 34
	jsr $B401.w		; 20 01 B4
	bit $31.b,X		; 34 31
	stp		; DB
	txy		; 9B
	sbc ($32.b,X)		; E1 32
	asl $C002.w,X		; 1E 02 C0
	trb $77.b		; 14 77
	adc $FC.b,S		; 63 FC
	tax		; AA
	dec $0100.w		; CE 00 01
	ldy $23.b,X		; B4 23
	and ($0D.b,S),Y		; 33 0D
	tax		; AA
	dec BG4HOFS.w		; CE 13 21
	cpx #$C0.b		; E0 C0
	sbc ($46.b),Y		; F1 46
	ror $3F.b,X		; 76 3F
	dex		; CA
	ldy $00EF.w		; AC EF 00
	ldy $01.b,X		; B4 01
	bit $30.b,X		; 34 30
	nop		; EA
	plb		; AB
	sbc ($23.b,X)		; E1 23
	asl $EFC0.w,X		; 1E C0 EF
	ora $67.b,S		; 03 67
	stz $0D.b		; 64 0D
	tax		; AA
	lda $B4F0.w,X		; BD F0 B4
	bpl  18.b		; 10 12
	eor $2E.b,S		; 43 2E
	tsx		; BA
	lda $3201.w,X		; BD 01 32
	ldy $FF.b,X		; B4 FF
	ora ($46.b)		; 12 46
	eor ($DB.b),Y		; 51 DB
	sta $23D1.w,Y		; 99 D1 23
	ldy $32.b,X		; B4 32
	brk $23.b		; 00 23
	and ($0D.b,S),Y		; 33 0D
	tsx		; BA
	cmp $B412.w		; CD 12 B4
	and ($0E.b),Y		; 31 0E
	ora ($46.b,S),Y		; 13 46
	rti		; 40

	phx		; DA
	txs		; 9A
	sbc ($B4.b,X)		; E1 B4
	and ($31.b,S),Y		; 33 31
	brk $23.b		; 00 23
	and ($0D.b)		; 32 0D
	tyx		; BB
	lda $2212B4.l,X		; BF B4 12 22
	inc $4512.w,X		; FE 12 45
	eor ($CB.b),Y		; 51 CB
	tax		; AA
	ldy $E1.b,X		; B4 E1
	and $31.b,S		; 23 31
	brk $13.b		; 00 13
	and $1D.b,S		; 23 1D
	wai		; CB
	ldy $BE.b,X		; B4 BE
	ora ($22.b)		; 12 22
	asl $34F2.w		; 0E F2 34
	eor ($FC.b)		; 52 FC
	ldy $BA.b,X		; B4 BA
	cpy #$23.b		; C0 23
	jsl $23120F.l		; 22 0F 12 23
	ora $BDDDB4.l,X		; 1F B4 DD BD
	ora ($21.b,X)		; 01 21
	ora $4523E0.l,X		; 1F E0 23 45
	ldy $1E.b,X		; B4 1E
	cpy $12BD.w		; CC BD 12
	ora ($1F.b,S),Y		; 13 1F
	sbc ($22.b),Y		; F1 22
	ldy $63.b		; A4 63
	xba		; EB
	sta $22BF.w,Y		; 99 BF 22
	and ($EC.b),Y		; 31 EC
	sbc ($B4.b,S),Y		; F3 B4
	bit $42.b,X		; 34 42
	sbc $D0CC.w,X		; FD CC D0
	ora ($21.b),Y		; 11 21
	beq -92.b		; F0 A4
	jsl $CB4F55.l		; 22 55 4F CB
	txy		; 9B
	sbc ($22.b,X)		; E1 22
	asl $FEB4.w,X		; 1E B4 FE
	ora ($34.b)		; 12 34
	and ($ED.b),Y		; 31 ED
	cmp $11E0.w,X		; DD E0 11
	ldy $10.b		; A4 10
	beq  52.b		; F0 34
	eor $2E.b,X		; 55 2E
	wai		; CB
	lda $A4F0.w,X		; BD F0 A4
	ora ($FE.b),Y		; 11 FE
	sbc $6625.w		; ED 25 66
	adc $DC.b,S		; 63 DC
	tsx		; BA
	ldy $CF.b		; A4 CF
	brk $01.b		; 00 01
	ora ($34.b,X)		; 01 34
	mvn $DC,$2F		; 54 2F DC
	ldy $BD.b		; A4 BD
	cpx #$00.b		; E0 00
	sbc $5503FE.l,X		; FF FE 03 55
	adc $A4.b		; 65 A4
	ora $ACCB.w,X		; 1D CB AC
	beq   0.b		; F0 00
	ora ($23.b),Y		; 11 23
	mvn $31,$A4		; 54 A4 31
	jsr ($DFCC.w,X)		; FC CC DF
	brk $00.b		; 00 00
	sbc $26A4FF.l		; EF FF A4 26
	lsr $42.b		; 46 42
	cpx $CECA.w		; EC CA CE
	beq   2.b		; F0 02
	bcs -17.b		; B0 EF
	ora ($45.b,S),Y		; 13 45
	stz $31.b		; 64 31
	inc $DEEE.w,X		; FE EE DE
	ldy $F0.b		; A4 F0
	beq   0.b		; F0 00
	bit $34.b,X		; 34 34
	rti		; 40

	cpx $94CB.w		; EC CB 94
	stz $3401.w,X		; 9E 01 34
	and $55.b,S		; 23 55
	mvp $DA,$2D		; 44 2D DA
	sty $AB.b,X		; 94 AB
	sbc $EF1E01.l,X		; FF 01 1E EF
	inc $6737.w,X		; FE 37 67
	ldy $41.b		; A4 41
	inc $DFDC.w		; EE DC DF
	ora $230111.l		; 0F 11 01 23
	sty $34.b,X		; 94 34
	and $F0CDDC.l,X		; 3F DC CD F0
	sbc $A4DF0D.l,X		; FF 0D DF A4
	beq   2.b		; F0 02
	and ($43.b)		; 32 43
	ora $FECDFD.l,X		; 1F FD CD FE
	sty $02.b,X		; 94 02
	and ($23.b,X)		; 21 23
	bit $54.b,X		; 34 54
	asl $DEDB.w		; 0E DB DE
	sty $E0.b,X		; 94 E0
	ora $10EEED.l		; 0F ED EE 10
	rol $65.b,X		; 36 65
	.db $62, $94, $FD		; 62 94 FD
	dex		; CA
	lda $01EE.w		; AD EE 01
	ora ($43.b)		; 12 43
	mvp $52,$84		; 44 84 52
	cpy $CFAA.w		; CC AA CF
	sbc $DEBDED.l		; EF ED BD DE
	sty $1F.b,X		; 94 1F
	and $46.b		; 25 46
	eor ($1E.b,S),Y		; 53 1E
	phx		; DA
	ldy $84DE.w		; AC DE 84
	sbc ($24.b)		; F2 24
	adc [$77.b]		; 67 77
	stz $FE.b,X		; 74 FE
	lda #$BD.b		; A9 BD
	sty $EF.b,X		; 94 EF
	asl $FFEE.w		; 0E EE FF
	bpl  20.b		; 10 14
	mvn $94,$55		; 54 55 94
	and $ABDB.w		; 2D DB AB
	dec $12F2.w,X		; DE F2 12
	bit $33.b		; 24 33
	sty $42.b,X		; 94 42
	ora $FFCFDC.l		; 0F DC CF FF
	ora ($EF.b),Y		; 11 EF
	inc $E194.w,X		; FE 94 E1
	brk $34.b		; 00 34
	and $42.b,X		; 35 42
	inc $CECA.w,X		; FE CA CE
	sty $CE.b		; 84 CE
	and ($13.b,S),Y		; 33 13
	eor $46.b		; 45 46
	eor ($0D.b),Y		; 51 0D
	tax		; AA
	ldy #$FF.b		; A0 FF
	beq   0.b		; F0 00
	sbc $BCCB.w		; ED CB BC
	cmp $94F1.w		; CD F1 94
	and $41.b,X		; 35 41
	sbc $EFDDCB.l,X		; FF CB DD EF
	bpl   2.b		; 10 02
	sty $34.b		; 84 34
	lsr $53.b,X		; 56 53
	rol $EDBB.w		; 2E BB ED
	sbc ($FD.b)		; F2 FD
	sty $EE.b,X		; 94 EE
	dec $01F1.w,X		; DE F1 01
	and ($35.b,S),Y		; 33 35
	.db $42, $00		; 42 00
	sty $DB.b,X		; 94 DB
	jmp.w [$1FDD]		; DC DD 1F
	cop $22.b		; 02 22
	bit $31.b,X		; 34 31
	sty $31.b		; 84 31
	tyx		; BB
	cpy $0ED0.w		; CC D0 0E
	jsr ($FECC.w,X)		; FC CC FE
	sty $10.b,X		; 94 10
	ora ($24.b,S),Y		; 13 24
	eor ($20.b,S),Y		; 53 20
	sbc $CDCC.w,X		; FD CC CD
	sty $B0.b		; 84 B0
	ora ($54.b),Y		; 11 54
	lsr $66.b,X		; 56 66
	and ($EC.b)		; 32 EC
	tsx		; BA
	sty $DE.b		; 84 DE
	sbc ($0F.b),Y		; F1 0F
	sbc $E1CD.w		; ED CD E1
	and $12A046.l		; 2F 46 A0 12
	eor $55.b		; 45 55
	.db $42, $0E		; 42 0E
	jmp.w [$DDCC]		; DC CC DD
	sty $43.b		; 84 43
	mvp $22,$43		; 44 43 22
	inc $CFCC.w,X		; FE CC CF
	ora ($84.b,X)		; 01 84
	ora $D0DDEC.l,X		; 1F EC DD D0
	and $764405.l,X		; 3F 05 44 76
	sty $40.b		; 84 40
	trb $AA9B.w		; 1C 9B AA
	cpy #$00.b		; C0 00
	bit $13.b,X		; 34 13
	sty $44.b		; 84 44
	bit $2F.b,X		; 34 2F
	sbc $F0BB.w		; ED BB F0
	cop $0F.b		; 02 0F
	sty $DD.b		; 84 DD
	cmp $0001.w		; CD 01 00
	eor ($35.b)		; 52 35
	stz $33.b,X		; 74 33
	sty $EA.b		; 84 EA
	tax		; AA
	txs		; 9A
	sbc $343303.l,X		; FF 03 33 34
	.db $42, $84		; 42 84
	.db $42, $1F		; 42 1F
	stp		; DB
	lda $23D0.w,X		; BD D0 23
	ora $CE84ED.l,X		; 1F ED 84 CE
	cop $20.b		; 02 20
	bpl   2.b		; 10 02
	eor $53.b		; 45 53
	and $9ACA84.l		; 2F 84 CA 9A
	cmp $102312.l,X		; DF 12 23 10
	jsl $418433.l		; 22 33 84 41
	ora $CFC9.w		; 0D C9 CF
	trb $34.b		; 14 34
	sbc $CF84BC.l,X		; FF BC 84 CF
	jsl $E0EF20.l		; 22 20 EF E0
	and [$76.b],Y		; 37 76
	eor $9ABA84.l		; 4F 84 BA 9A
	cpy #$23.b		; C0 23
	bmi  -2.b		; 30 FE
	beq  53.b		; F0 35
	sty $64.b		; 84 64
	and $F4BBBA.l		; 2F BA BB F4
	lsr $30.b		; 46 30
	stp		; DB
	sty $DF.b,X		; 94 DF
	ora ($11.b,X)		; 01 11
	ora $35F1DE.l		; 0F DE F1 35
	mvp $65,$A0		; 44 A0 65
	and ($FE.b),Y		; 31 FE
	dec $FFEF.w,X		; DE EF FF
	inc $84EE.w		; EE EE 84
	eor [$76.b]		; 47 76
	rol $ACB9.w		; 2E B9 AC
	cmp ($36.b)		; D2 36
	eor ($84.b,X)		; 41 84
	sbc $00CE.w,X		; FD CE 00
	and ($0F.b)		; 32 0F
	cmp #$AD.b		; C9 AD
	bit $94.b		; 24 94
	eor $42.b		; 45 42
	ora $01DFDD.l		; 0F DD DF 01
	bpl  -2.b		; 10 FE
	sty $CE.b		; 84 CE
	ora $57.b,S		; 03 57
	stz $1D.b		; 64 1D
	tyx		; BB
	cmp $028003.l		; CF 03 80 02
	jsl $E0DD0E.l		; 22 0E DD E0
	and $2F.b,S		; 23 2F
	cmp #$84.b		; C9 84
	cmp $4434E2.l		; CF E2 34 44
	jsl $0EFE00.l		; 22 00 FE 0E
	stz $CD.b,X		; 74 CD
	dex		; CA
	lda $27F1.w,X		; BD F1 27
	lsr $42.b,X		; 56 42
	and ($74.b),Y		; 31 74
	sbc $CCDEEF.l,X		; FF EF DE CC
	cmp $6531.w		; CD 31 65
	.db $42, $84		; 42 84
	ora $E0FEDE.l,X		; 1F DE FE E0
	inc $01EE.w,X		; FE EE 01
	rol $84.b		; 26 84
	eor $41.b,X		; 55 41
	inc $CECD.w,X		; FE CD CE
	ora $90FE00.l		; 0F 00 FE 90
	cmp $13EF.w		; CD EF 13
	eor $54.b		; 45 54
	and ($FE.b,X)		; 21 FE
	inc $CC80.w		; EE 80 CC
	cpy $24E0.w		; CC E0 24
	adc [$76.b],Y		; 77 76
	bmi -55.b		; 30 C9
	sty $EE.b		; 84 EE
	ora $14011E.l		; 0F 1E 01 14
	eor $44.b		; 45 44
	ora $BCEC84.l,X		; 1F 84 EC BC
	sbc $0F0FF0.l		; EF F0 0F 0F
	ora ($23.b),Y		; 11 23
	stz $75.b,X		; 74 75
	eor ($FE.b,X)		; 41 FE
	tsx		; BA
	inc $0FDE.w,X		; FE DE 0F
	sbc $2174.w		; ED 74 21
	eor [$65.b],Y		; 57 65
	and $CD9ABB.l,X		; 3F BB 9A CD
	sbc $EE1F84.l,X		; FF 84 1F EE
	ora ($25.b,X)		; 01 25
	lsr $43.b,X		; 56 43
	sbc $84DC.w,X		; FD DC 84
	cmp $F0FF.w		; CD FF F0
	sbc $3503F0.l,X		; FF F0 03 35
	and ($74.b,S),Y		; 33 74
	eor $CEBBCB.l		; 4F CB BB CE
	beq -19.b		; F0 ED
	bne -13.b		; D0 F3
	sty $24.b		; 84 24
	mvp $FD,$21		; 44 21 FD
	cpy $E1DE.w		; CC DE E1
	beq -124.b		; F0 84
	sbc $4402EF.l,X		; FF EF 02 44
	eor $31.b,X		; 55 31
	ora $90DD.w		; 0D DD 90
	asl $EDEE.w		; 0E EE ED
	jmp.w [$DECC]		; DC CC DE
	ora ($34.b,X)		; 01 34
	stz $40.b,X		; 74 40
	cmp $CEBD.w,X		; DD BD CE
	cpx #$ED.b		; E0 ED
	sbc $74F0.w		; ED F0 74
	and $56.b,X		; 35 56
	stz $32.b		; 64 32
	xce		; FB
	stp		; DB
	tsx		; BA
	ldy $BB90.w,X		; BC 90 BB
	tyx		; BB
	ldy $E0DD.w,X		; BC DD E0
	ora ($46.b,S),Y		; 13 46
	ror $74.b		; 66 74
	xba		; EB
	lda #$AA.b		; A9 AA
	cmp $31F1D1.l		; CF D1 F1 31
	bit $74.b,X		; 34 74
	eor $44.b,X		; 55 44
	bpl -35.b		; 10 DD
	phx		; DA
	dec $01ED.w		; CE ED 01
	bra -69.b		; 80 BB
	dec $24F1.w		; CE F1 24
	lsr $55.b,X		; 56 55
	eor $21.b,S		; 43 21
	stz $EE.b,X		; 74 EE
	inc $EDCD.w		; EE CD ED
	sbc ($13.b),Y		; F1 13
	and ($2E.b,X)		; 21 2E
	stz $10.b,X		; 74 10
	bit $44.b		; 24 44
	and ($FD.b)		; 32 FD
	tyx		; BB
	cpy $74D0.w		; CC D0 74
	ora ($21.b),Y		; 11 21
	brk $10.b		; 00 10
	bit $24.b		; 24 24
	and $2C70FF.l		; 2F FF 70 2C
	lda #$99.b		; A9 99
	tax		; AA
	cpy $E0CC.w		; CC CC E0
	bit $64.b		; 24 64
	eor $1D.b,X		; 55 1D
	jmp.w [$CF9C]		; DC 9C CF
	bit $34.b,X		; 34 34
	eor $0C64.w		; 4D 64 0C
	stz $F0FF.w		; 9C FF F0
	sbc $F2BB0B.l,X		; FF 0B BB F2
	stz $36.b,X		; 74 36
	mvn $1D,$52		; 54 52 1D
	cmp $E0DE.w,X		; DD DE E0
	beq 116.b		; F0 74
	inc $F1D0.w		; EE D0 F1
	and $44.b		; 25 44
	and ($0D.b,X)		; 21 0D
	inc $DC64.w,X		; FE 64 DC
	ora $FCCC00.l		; 0F 00 CC FC
	sbc ($43.b)		; F2 43
	stz $64.b,X		; 74 64
	trb $DC.b		; 14 DC
	trb $00C0.w		; 1C C0 00
	beq -52.b		; F0 CC
	beq -128.b		; F0 80
	sbc $433412.l		; EF 12 34 43
	ora $CCBBDC.l,X		; 1F DC BB CC
	stz $F0.b,X		; 74 F0
	inc $13F0.w,X		; FE F0 13
	adc $54.b		; 65 54
	ora $9964DD.l,X		; 1F DD 64 99
	cpy $0FFF.w		; CC FF 0F
	jsr ($33FF.w,X)		; FC FF 33
	and [$74.b],Y		; 37 74
	.db $42, $10		; 42 10
	inc $E0FE.w,X		; FE FE E0
	brk $0E.b		; 00 0E
	inc $AA70.w,X		; FE 70 AA
	ldy $24E0.w		; AC E0 24
	mvp $00,$42		; 44 42 00
	asl $0064.w		; 0E 64 00
	ora $30FCC0.l		; 0F C0 FC 30
	and ($04.b,S),Y		; 33 04
	ora ($64.b,X)		; 01 64
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	trb $CCCC.w		; 1C CC CC
	stz $FF.b		; 64 FF
	and $F0F030.l,X		; 3F 30 F0 F0
	sbc ($44.b,S),Y		; F3 44
	mvp $41,$64		; 44 64 41
	sbc $CCCD.w		; ED CD CC
	ora $F00C30.l		; 0F 30 0C F0
	rts		; 60

	sta $47C0.w,Y		; 99 C0 47
	adc [$74.b],Y		; 77 74
	brk $CC.b		; 00 CC
	cpy $CC60.w		; CC 60 CC
	cpy $9CC9.w		; CC C9 9C
	cpy #$04.b		; C0 04
	mvp $50,$40		; 44 40 50
	brk $99.b		; 00 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $0F54.w,Y		; 99 54 0F
	ora $00070F.l		; 0F 0F 07 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	sta $9999.w,Y		; 99 99 99
	bcc  80.b		; 90 50
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	sta $9999.w,Y		; 99 99 99
	sta $0F54.w,Y		; 99 54 0F
	ora $000070.l		; 0F 70 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $09.b		; 00 09
	sta $9099.w,Y		; 99 99 90
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	sta $5090.w,Y		; 99 90 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $50.b		; 00 50
	brk $99.b		; 00 99
	sta $9999.w,Y		; 99 99 99
	bcc   0.b		; 90 00
	brk $51.b		; 00 51
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $9099.w,Y		; 99 99 90
	sta [$59.b],Y		; 97 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $25.b		; 00 25
	jsr $03E9.w		; 20 E9 03
	inc A		; 1A
	jsr $5259.w		; 20 59 52
	.db $42, $55		; 42 55
	eor ($54.b,S),Y		; 53 54
	eor $44.b		; 45 44
	rol $6F73.w		; 2E 73 6F
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $0000.w,Y		; 99 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $9999.w,Y		; 99 99 99
	sta $0064.w,Y		; 99 64 00
	jsr ($0F0F.w,X)		; FC 0F 0F
	ora $F00FCF.l		; 0F CF 0F F0
	stz $FF.b		; 64 FF
	beq -13.b		; F0 F3
	ora $03.b,S		; 03 03
	tsb $04.b		; 04 04
	trb $64.b		; 14 64
	trb $15.b		; 14 15
	ora ($11.b),Y		; 11 11
	and ($D1.b,X)		; 21 D1
	ora $641D.w,X		; 1D 1D 64
	ora $0C0D.w		; 0D 0D 0C
	tsb $CFF0.w		; 0C F0 CF
	jsr ($64FF.w,X)		; FC FF 64
	xce		; FB
	sbc $EBAFBF.l,X		; FF BF AF EB
	nop		; EA
	inc $74E5.w		; EE E5 74
	rol $52D5.w,X		; 3E D5 52
	tsb $40.b		; 04 40
	trb $43.b		; 14 43
	sbc ($64.b),Y		; F1 64
	rol $BE65.w		; 2E 65 BE
	ora ($AD.b)		; 12 AD
	pei ($99.b)		; D4 99
	tsb $CF64.w		; 0C 64 CF
	jsr ($FFFF.w,X)		; FC FF FF
	and $340433.l,X		; 3F 33 04 34
	stz $14.b		; 64 14
	eor ($15.b,X)		; 41 15
	ora ($E1.b),Y		; 11 E1
	ora $CD1D.w,X		; 1D 1D CD
	stz $0C.b		; 64 0C
	cpy $FBFC.w		; CC FC FB
	xce		; FB
	plx		; FA
	inc $74BE.w,X		; FE BE 74
	cmp $CFFDDD.l,X		; DF DD FD CF
	.db $42, $1C		; 42 1C
	asl $52.b,X		; 16 52
	stz $24.b,X		; 74 24
	.db $42, $15		; 42 15
	eor $2F.b,S		; 43 2F
	sbc ($31.b),Y		; F1 31
	sbc $326580.l		; EF 80 65 32
	ora ($FD.b),Y		; 11 FD
	cpy $CCCC.w		; CC CC CC
	cmp $3364.w		; CD 64 33
	eor $45.b,S		; 43 45
	eor $55.b		; 45 55
	and ($22.b,X)		; 21 22
	ora ($74.b)		; 12 74
	sbc $ECDEEF.l,X		; FF EF DE EC
	inc $DDBE.w		; EE BE DD
	cmp $FE84.w,X		; DD 84 FE
	sbc $DFEF.w,X		; FD EF DF
	beq  35.b		; F0 23
	ora $8426.w		; 0D 26 84
	eor ($23.b,X)		; 41 23
	and ($32.b)		; 32 32
	jsl $21E011.l		; 22 11 E0 21
	stz $CA.b,X		; 74 CA
	cmp $ADECDB.l,X		; DF DB EC AD
	xba		; EB
	cmp ($0D.b),Y		; D1 0D
	stz $D1.b,X		; 74 D1
	eor $34.b		; 45 34
	mvp $55,$46		; 44 46 55
	mvn $74,$20		; 54 20 74
	and ($0E.b,X)		; 21 0E
	xba		; EB
	cmp $AABC.w,X		; DD BC AA
	stp		; DB
	lda $EF84.w,X		; BD 84 EF
	inc $FEFF.w		; EE FF FE
	sbc $E1DE.w		; ED DE E1
	adc [$94.b]		; 67 94
	sbc $4224.w		; ED 24 42
	ora ($02.b),Y		; 11 02
	and ($01.b),Y		; 31 01
	and $31BE84.l		; 2F 84 BE 31
	cpx $E0CC.w		; EC CC E0
	tsb $0DCF.w		; 0C CF 0D
	sty $F2.b		; 84 F2
	ora ($23.b),Y		; 11 23
	ora ($55.b)		; 12 55
	eor ($33.b,X)		; 41 33
	ora ($84.b),Y		; 11 84
	and ($EF.b),Y		; 31 EF
	inc $EDDE.w,X		; FE DE ED
	cpy $DEDD.w		; CC DD DE
	sty $FF.b,X		; 94 FF
	sbc $EEFFFF.l		; EF FF FF EE
	inc $73E3.w,X		; FE E3 73
	sty $BE.b,X		; 94 BE
	lsr $54.b		; 46 54
	ora $E25103.l,X		; 1F 03 51 E2
	ora $1FCF94.l,X		; 1F 94 CF 1F
	sbc $0DE2CC.l,X		; FF CC E2 0D
	cpx #$FF.b		; E0 FF
	sty $12.b,X		; 94 12
	ora ($22.b,S),Y		; 13 22
	ora ($45.b),Y		; 11 45
	jsr $111F.w		; 20 1F 11
	sty $2E.b		; 84 2E
	ldy $BCDC.w,X		; BC DC BC
	stp		; DB
	ldy $F0DD.w		; AC DD F0
	ldy $0F.b		; A4 0F
	sbc $EFFF00.l,X		; FF 00 FF EF
	sbc ($52.b)		; F2 52
	cmp $764694.l,X		; DF 94 46 76
	rol $50F3.w		; 2E F3 50
	sbc ($2D.b),Y		; F1 2D
	ldx $EE94.w,Y		; BE 94 EE
	bpl -55.b		; 10 C9
	cmp ($2F.b),Y		; D1 2F
	beq  -1.b		; F0 FF
	eor $94.b		; 45 94
	jsl $431243.l		; 22 43 12 43
	ora ($1E.b),Y		; 11 1E
	sbc $A9841E.l		; EF 1E 84 A9
	txs		; 9A
	ldx $BFE9.w		; AE E9 BF
	cmp $1C02.w,X		; DD 02 1C
	ldy $FE.b		; A4 FE
	sbc $73E10E.l,X		; FF 0E E1 73
	dec $4623.w,X		; DE 23 46
	sty $3C.b,X		; 94 3C
	cmp $72.b,S		; C3 72
	bne  28.b		; D0 1C
	dec $03CA.w		; CE CA 03
	bcs  -2.b		; B0 FE
	cpy $EFDD.w		; CC DD EF
	inc $22F1.w		; EE F1 22
	mvp $12,$94		; 44 94 12
	jsl $AC2F01.l		; 22 01 2F AC
	inc $DADE.w,X		; FE DE DA
	sty $BF.b,X		; 94 BF
	asl $FEE0.w		; 0E E0 FE
	sbc ($FD.b),Y		; F1 FD
	cmp $A4CC.w,X		; DD CC A4
.ACCU 8
.INDEX 8
	sep #$75		; E2 75
	sbc $5702.w,X		; FD 02 57
	eor $A421EF.l,X		; 5F EF 21 A4
	beq  15.b		; F0 0F
	cmp $1FE2DB.l,X		; DF DB E2 1F
	cmp $B0F0.w,X		; DD F0 B0
	cmp $34020F.l,X		; DF 0F 02 34
	lsr $77.b,X		; 56 77
	ror $54.b,X		; 76 54
	sty $11.b,X		; 94 11
	wai		; CB
	tsx		; BA
	ldx $BEED.w,Y		; BE ED BE
	inc $B4E0.w,X		; FE E0 B4
	brk $0F.b		; 00 0F
	inc $F2FF.w,X		; FE FF F2
	eor ($FE.b,S),Y		; 53 FE
	ora ($B4.b),Y		; 11 B4
	bit $30.b,X		; 34 30
	sbc $0FF010.l		; EF 10 F0 0F
	inc $A4ED.w,X		; FE ED A4
	sbc ($3F.b,X)		; E1 3F
	inc $25F0.w		; EE F0 25
	and ($45.b)		; 32 45
	and ($C0.b,X)		; 21 C0
	mvp $44,$44		; 44 44 44
	and ($11.b,X)		; 21 11
	brk $FE.b		; 00 FE
	cmp $FEA4.w,X		; DD A4 FE
	beq  16.b		; F0 10
	sbc $DDDFFE.l,X		; FF FE DF DD
	sbc $B4.b,X		; F5 B4
	eor ($0F.b,S),Y		; 53 0F
	bpl  53.b		; 10 35
	jsr $0FF0.w		; 20 F0 0F
	cpx #$A4.b		; E0 A4
	sbc $B9FF.w		; ED FF B9
	cpy #$21.b		; C0 21
	bpl  -1.b		; 10 FF
	and $A4.b		; 25 A4
	mvp $31,$66		; 44 66 31
	ora $CC1FF1.l,X		; 1F F1 1F CC
	cpy $DFA4.w		; CC A4 DF
	inc $FFDF.w,X		; FE DF FF
	beq  16.b		; F0 10
	sbc $EFB4DB.l,X		; FF DB B4 EF
	sbc ($64.b,S),Y		; F3 64
	brk $00.b		; 00 00
	bit $41.b		; 24 41
	ora $1143C0.l		; 0F C0 43 11
	brk $00.b		; 00 00
	sbc $CCCB.w,X		; FD CB CC
	sbc $131FA4.l		; EF A4 1F 13
	eor $77.b		; 45 77
	eor ($1D.b,X)		; 41 1D
	dec $A40F.w		; CE 0F A4
	inc $BDBA.w		; EE BA BD
	ora $F00E01.l		; 0F 01 0E F0
	sbc $FEFFB4.l,X		; FF B4 FF FE
	cpx #$45.b		; E0 45
	and ($00.b),Y		; 31 00
	tsb $32.b		; 04 32
	ldy $00.b		; A4 00
	ora $E1CACB.l,X		; 1F CB CA E1
	trb $DFAC.w		; 1C AC DF
	ldy $25.b		; A4 25
	and ($24.b)		; 32 24
	mvp $44,$46		; 44 46 44
	bmi -37.b		; 30 DB
	ldy $CC.b		; A4 CC
	dec $CCEC.w,X		; DE EC CC
	dec $11F0.w,X		; DE F0 11
	ora ($B4.b),Y		; 11 B4
	ora $E3EEEF.l		; 0F EF EE E3
	adc $11.b		; 65 11
	sbc $73A414.l,X		; FF 14 A4 73
	brk $0C.b		; 00 0C
	tax		; AA
	ldy $1BF3.w,X		; BC F3 1B
	tyx		; BB
	ldy $E0.b		; A4 E0
	lsr $53.b		; 46 53
	bit $32.b,X		; 34 32
	eor [$52.b],Y		; 57 52
	rol $AAA4.w		; 2E A4 AA
	ldy $FDCE.w,X		; BC CE FD
	cmp $E2DD.w		; CD DD E2
	jsl $FE00B4.l		; 22 B4 00 FE
	inc $57E0.w		; EE E0 57
	.db $42, $0F		; 42 0F
	sbc ($B4.b),Y		; F1 B4
	and ($10.b,S),Y		; 33 10
	ora $E0CDDC.l,X		; 1F DC CD E0
	and ($EE.b,X)		; 21 EE
	ldy $CD.b		; A4 CD
	ora $67.b		; 05 67
	ror $52.b		; 66 52
	ora ($44.b,S),Y		; 13 44
	and ($C0.b),Y		; 31 C0
	mvn $ED,$20		; 54 20 ED
	cmp $CCDD.w,X		; DD DD CC
	tyx		; BB
	cpy $11B4.w		; CC B4 11
	asl $E0ED.w		; 0E ED E0
	eor [$54.b]		; 47 54
	ora $12B4E1.l,X		; 1F E1 B4 12
	ora ($2F.b),Y		; 11 2F
	cpx $D0BB.w		; EC BB D0
	and ($0F.b,X)		; 21 0F
	ldy $FE.b,X		; B4 FE
	sbc ($33.b),Y		; F1 33
	mvp $11,$52		; 44 52 11
	brk $01.b		; 00 01
	ldy $DC.b		; A4 DC
	lda $CE99.w,Y		; B9 99 CE
	cpx #$1F.b		; E0 1F
	sbc $00B4FF.l		; EF FF B4 00
	ora $55F4EE.l		; 0F EE F4 55
	.db $42, $00		; 42 00
	cop $B4.b		; 02 B4
	bpl   1.b		; 10 01
	asl $CDDC.w		; 0E DC CD
	beq  31.b		; F0 1F
	brk $B4.b		; 00 B4
	beq  17.b		; F0 11
	and $44.b,S		; 23 44
	.db $42, $11		; 42 11
	brk $FE.b		; 00 FE
	ldy $CC.b		; A4 CC
	tyx		; BB
	plb		; AB
	cmp $00E0.w,X		; DD E0 00
	brk $FF.b		; 00 FF
	ldy $FF.b,X		; B4 FF
	sbc $5356E1.l		; EF E1 56 53
	ora $B42101.l,X		; 1F 01 21 B4
	sbc ($1F.b),Y		; F1 1F
	cmp $E0BC.w,X		; DD BC E0
	ora ($F0.b),Y		; 11 F0
	ora $13F2B4.l		; 0F B4 F2 13
	bit $52.b,X		; 34 52
	jsr $0000.w		; 20 00 00
	inc $BAA4.w		; EE A4 BA
	tax		; AA
	cmp $10E0.w,X		; DD E0 10
	sbc $B4FFFF.l,X		; FF FF FF B4
	sbc $6435DE.l,X		; FF DE 35 64
	and ($0F.b),Y		; 31 0F
	ora ($0F.b)		; 12 0F
	ldy $11.b,X		; B4 11
	inc $CECC.w		; EE CC CE
	ora ($10.b,X)		; 01 10
	brk $F1.b		; 00 F1
	ldy $11.b,X		; B4 11
	and ($54.b,S),Y		; 33 54
	and ($1F.b,X)		; 21 1F
	ora $A4EEFE.l		; 0F FE EE A4
	tsx		; BA
	ldy $11EE.w,X		; BC EE 11
	brk $FF.b		; 00 FF
	sbc $EEB4ED.l,X		; FF ED B4 EE
	pea $4265.w		; F4 65 42
	brk $01.b		; 00 01
	bpl   1.b		; 10 01
	ldy $0E.b,X		; B4 0E
	cpx $F1BC.w		; EC BC F1
	bpl  16.b		; 10 10
	beq   2.b		; F0 02
	ldy $13.b,X		; B4 13
	mvp $10,$42		; 44 42 10
	beq  -1.b		; F0 FF
	inc $A4DE.w		; EE DE A4
	plb		; AB
	dec $11F2.w,X		; DE F2 11
	ora $ECEEFF.l		; 0F FF EE EC
	ldy $EF.b,X		; B4 EF
	and $63.b		; 25 63
	and ($00.b,X)		; 21 00
	ora ($00.b),Y		; 11 00
	bpl -76.b		; 10 B4
	inc $DECC.w,X		; FE CC DE
	ora ($00.b,X)		; 01 00
	brk $F1.b		; 00 F1
	ora ($B4.b)		; 12 B4
	and $44.b,S		; 23 44
	and ($10.b,X)		; 21 10
	brk $FE.b		; 00 FE
	dec $A4DE.w,X		; DE DE A4
	lda $22DF.w,X		; BD DF 22
	brk $FF.b		; 00 FF
	ora $B4CBFE.l		; 0F FE CB B4
	bne  54.b		; D0 36
	mvp $01,$10		; 44 10 01
	ora ($01.b),Y		; 11 01
	bpl -76.b		; 10 B4
	sbc $DECC.w,X		; FD CC DE
	ora ($00.b),Y		; 11 00
	beq -15.b		; F0 F1
	ora ($B4.b)		; 12 B4
	bit $42.b,X		; 34 42
	jsr $1100.w		; 20 00 11
	inc $DEED.w,X		; FE ED DE
	ldy $BD.b		; A4 BD
	cpx #$22.b		; E0 22
	brk $FF.b		; 00 FF
	brk $1E.b		; 00 1E
	jmp.w [$DDB4]		; DC B4 DD
	tsb $54.b		; 04 54
	and ($00.b),Y		; 31 00
	ora ($10.b),Y		; 11 10
	and ($B4.b,X)		; 21 B4
	ora $F1BDDC.l		; 0F DC BD F1
	brk $00.b		; 00 00
	beq  17.b		; F0 11
	ldy $23.b,X		; B4 23
	mvp $1F,$21		; 44 21 1F
	ora ($00.b,X)		; 01 00
	inc $A4DE.w		; EE DE A4
	ldy $03DE.w		; AC DE 03
	ora ($1F.b),Y		; 11 1F
	beq  16.b		; F0 10
	sbc $EEB4.w,X		; FD B4 EE
	dec $4434.w		; CE 34 44
	jsr $1201.w		; 20 01 12
	ora ($B4.b,X)		; 01 B4
	jsr $CB0E.w		; 20 0E CB
	dec $0001.w		; CE 01 00
	ora $11B401.l		; 0F 01 B4 11
	bit $43.b		; 24 43
	jsr $10FF.w		; 20 FF 10
	bpl  -3.b		; 10 FD
	ldy $BA.b		; A4 BA
	tyx		; BB
	bne  35.b		; D0 23
	and ($0F.b,X)		; 21 0F
	beq  17.b		; F0 11
	ldy $0F.b,X		; B4 0F
	cmp $14CE.w,X		; DD CE 14
	eor $30.b		; 45 30
	brk $12.b		; 00 12
	ldy $01.b,X		; B4 01
	jsl $BECB0E.l		; 22 0E CB BE
	sbc ($11.b),Y		; F1 11
	ora $11F0B4.l		; 0F B4 F0 11
	bit $43.b		; 24 43
	and ($FE.b,X)		; 21 FE
	ora ($11.b,X)		; 01 11
	ldy $FC.b		; A4 FC
	sta $EFAB.w,Y		; 99 AB EF
	and $33.b,S		; 23 33
	asl $B4E0.w		; 0E E0 B4
	ora ($1F.b),Y		; 11 1F
	sbc $E1CC.w		; ED CC E1
	mvp $00,$54		; 44 54 00
	ldy $F0.b,X		; B4 F0
	and ($23.b,X)		; 21 23
	bpl -20.b		; 10 EC
	tyx		; BB
	bne  18.b		; D0 12
	ldy $10.b,X		; B4 10
	sbc $351300.l		; EF 00 13 35
	and ($0F.b)		; 32 0F
	cpx #$B0.b		; E0 B0
	adc [$77.b]		; 67 77
	.db $62, $EB, $99		; 62 EB 99
	txs		; 9A
	dec $B4FF.w		; CE FF B4
	sbc $0F2101.l,X		; FF 01 21 0F
	jmp.w [$F0BD]		; DC BD F0
	eor $B4.b		; 45 B4
	mvp $E1,$0F		; 44 0F E1
	and ($23.b,S),Y		; 33 23
	bpl -20.b		; 10 EC
	plb		; AB
	cpy #$CC.b		; C0 CC
	dec $DCFE.w,X		; DE FE DC
	cmp $13EF.w		; CD EF 13
	eor $B4.b,X		; 55 B4
	ora $2212D0.l		; 0F D0 12 22
	sbc $EFCC.w		; ED CC EF
	cop $B4.b		; 02 B4
	ora ($10.b),Y		; 11 10
	sbc $1F2201.l,X		; FF 01 22 1F
	cmp $B4BD.w,X		; DD BD B4
	cmp $4235F2.l,X		; DF F2 35 42
	sbc $214313.l,X		; FF 13 43 21
	ldy $FE.b,X		; B4 FE
	cpx $F0CC.w		; EC CC F0
	ora ($0D.b),Y		; 11 0D
	cmp $F0C002.l,X		; DF 02 C0 F0
	and $44.b,S		; 23 44
	eor $33.b,S		; 43 33
	bit $54.b,X		; 34 54
	and ($B0.b),Y		; 31 B0
	xba		; EB
	plb		; AB
	cmp $EEEE.w		; CD EE EE
	sbc $B42301.l		; EF 01 23 B4
	ora $EEDEDD.l		; 0F DD DE EE
	sbc $204414.l		; EF 14 44 20
	ldy $F2.b		; A4 F2
	adc [$52.b]		; 67 52
	asl $B9ED.w,X		; 1E ED B9
	stz $A4F0.w		; 9C F0 A4
	ora $35D1DB.l,X		; 1F DB D1 35
	adc $43.b		; 65 43
	and ($0F.b)		; 32 0F
	ldy $01.b		; A4 01
	and $1E.b,S		; 23 1E
	tsx		; BA
	lda $10F0.w,X		; BD F0 10
	ora ($B0.b,X)		; 01 B0
	sbc $2301F0.l,X		; FF F0 01 23
	and ($FD.b,X)		; 21 FD
	wai		; CB
	lda #$C0.b		; A9 C0
	tsx		; BA
	txs		; 9A
	lda $2201.w,X		; BD 01 22
	and $45.b,S		; 23 45
	eor $C0.b,X		; 55 C0
	eor $43.b,X		; 55 43
	ora $DDDDED.l,X		; 1F ED DD DD
	jmp.w [$A4CC]		; DC CC A4
	bit $55.b,X		; 34 55
	mvp $FF,$42		; 44 42 FF
	sbc ($12.b),Y		; F1 12
	ora $CCA4.w		; 0D A4 CC
	dec $0000.w,X		; DE 00 00
	ora ($10.b,X)		; 01 10
	ora ($11.b,X)		; 01 11
	ldy $21.b		; A4 21
	inc $EEDD.w,X		; FE DD EE
	sbc $BCBB.w		; ED BB BC
	sbc ($B4.b,S),Y		; F3 B4
	mvp $10,$43		; 44 43 10
	ora ($22.b),Y		; 11 22
	ora ($0F.b),Y		; 11 0F
	sbc $9AA4.w		; ED A4 9A
	cmp $DE1EF1.l		; CF F1 1E DE
	sbc ($35.b),Y		; F1 35
	mvn $56,$B0		; 54 B0 56
	ror $55.b		; 66 55
	eor $67.b,X		; 55 67
	stz $20.b		; 64 20
	sbc $1294.w		; ED 94 12
	ora ($1F.b),Y		; 11 1F
	sbc $4223F1.l		; EF F1 23 42
	asl $0FC0.w		; 0E C0 0F
	sbc $DCEEFF.l,X		; FF FF EE DC
	tsx		; BA
	plb		; AB
	cmp $1F42B4.l,X		; DF B4 42 1F
	cop $22.b		; 02 22
	jsl $DDEE0F.l		; 22 0F EE DD
	ldy $BF.b		; A4 BF
	sbc ($1E.b),Y		; F1 1E
	ldy $36E0.w,X		; BC E0 36
	eor $42.b,X		; 55 42
	ldy $31.b		; A4 31
	bpl  33.b		; 10 21
	jsl $BDCB0E.l		; 22 0E CB BD
	beq -108.b		; F0 94
	bpl -19.b		; 10 ED
	sbc $643523.l,X		; FF 23 35 64
	and ($DE.b,X)		; 21 DE
	ldy $E0.b		; A4 E0
	ora $BCCCFD.l		; 0F FD CC BC
	cpy $67E2.w		; CC E2 67
	ldy $75.b		; A4 75
	jsr $4502.w		; 20 02 45
	eor $0E.b,S		; 43 0E
	jmp.w [$A4CA]		; DC CA A4
	dec $1FF0.w		; CE F0 1F
	cpx $23EF.w		; EC EF 23
	eor $33.b,X		; 55 33
	sty $41.b,X		; 94 41
	ora ($F1.b,X)		; 01 F1
	and $21.b,S		; 23 21
	phx		; DA
	sta $A0B0.w,Y		; 99 B0 A0
	cpy $DDDE.w		; CC DE DD
	cmp $13EF.w,X		; DD EF 13
	eor $54.b		; 45 54
	sty $DD.b,X		; 94 DD
	cmp $A9ECE0.l,X		; DF E0 EC A9
	sta $DFBC.w,Y		; 99 BC DF
	ldy $25.b		; A4 25
	eor $42.b,X		; 55 42
	brk $24.b		; 00 24
	and ($20.b,S),Y		; 33 20
	inc $CB94.w,X		; FE 94 CB
	txs		; 9A
	ldy $FCE0.w,X		; BC E0 FC
	cpy $36E0.w		; CC E0 36
	sty $55.b,X		; 94 55
	mvp $32,$43		; 44 43 32
	ora ($12.b),Y		; 11 12
	jsr $940E.w		; 20 0E 94
	ldy $FFCD.w,X		; BC CD FF
	sbc $1001F0.l		; EF F0 01 10
	ora ($94.b,X)		; 01 94
	jsl $DDFF21.l		; 22 21 FF DD
	inc $CCFE.w,X		; FE FE CC
	tyx		; BB
	ldy $ED.b		; A4 ED
	sbc ($24.b,X)		; E1 24
	mvn $01,$21		; 54 21 01
	cop $22.b		; 02 22
	sty $32.b,X		; 94 32
	jsr $AADC.w		; 20 DC AA
	cmp $00F0.w		; CD F0 00
	sbc $DE94.w		; ED 94 DE
	beq  34.b		; F0 22
	mvp $21,$43		; 44 43 21
	brk $01.b		; 00 01
	sty $44.b		; 84 44
	and ($FD.b)		; 32 FD
	cpy $DDDC.w		; CC DC DD
	beq -16.b		; F0 F0
	stz $DB.b		; 64 DB
	tax		; AA
	jsl $FF3B52.l		; 22 52 3B FF
	sbc $BD74BB.l,X		; FF BB 74 BD
	cmp $BADFFE.l,X		; DF FE DF BA
	dec $2302.w		; CE 02 23
	stz $23.b,X		; 74 23
	and ($22.b,S),Y		; 33 22
	jsl $314544.l		; 22 44 45 31
	bmi 100.b		; 30 64
	xce		; FB
	inc $D1DE.w		; EE DE D1
	ora ($11.b,X)		; 01 11
	jmp.w [$6410]		; DC 10 64
	tsb $45.b		; 04 45
	trb $ED.b		; 14 ED
	cmp $040C.w,X		; DD 0C 04
	ora ($64.b,X)		; 01 64
	rti		; 40

	bpl -48.b		; 10 D0
	eor ($40.b,X)		; 41 40
	cmp ($D0.b),Y		; D1 D0
	brk $74.b		; 00 74
	ora $0E0E00.l		; 0F 00 0E 0E
	sbc $DFDCEE.l		; EF EE DC DF
	stz $AE.b		; 64 AE
	asl $EE2E.w,X		; 1E 2E EE
	nop		; EA
	jsl $703F22.l		; 22 22 3F 70
	sta $AC9A.w,Y		; 99 9A AC
	inc $EEEE.w		; EE EE EE
	cop $47.b		; 02 47
	stz $34.b,X		; 74 34
	and ($24.b,S),Y		; 33 24
	and ($23.b),Y		; 31 23
	ora ($10.b)		; 12 10
	ora $BA64.w		; 0D 64 BA
	cmp ($AD.b),Y		; D1 AD
	cpy $F0CC.w		; CC CC F0
	sbc $446433.l,X		; FF 33 64 44
	brk $01.b		; 00 01
	tsb $CB0D.w		; 0C 0D CB
	wai		; CB
	sbc $BEFF64.l,X		; FF 64 FF BE
	sbc ($33.b)		; F2 33
	stz $40.b		; 64 40
	brk $DC.b		; 00 DC
	stz $EE.b,X		; 74 EE
	ora $DFDCE0.l		; 0F E0 DC DF
	cmp $64F1F1.l,X		; DF F1 F1 64
	sbc $3736E2.l		; EF E2 36 37
	rti		; 40

	brk $DC.b		; 00 DC
	brk $74.b		; 00 74
	asl $000F.w		; 0E 0F 00
	ora $422422.l		; 0F 22 24 42
	eor ($64.b),Y		; 51 64
	lsr $22.b,X		; 56 22
	adc ($FF.b)		; 72 FF
	inc $9DEE.w		; EE EE 9D
	jmp.w [$0D64]		; DC 64 0D
	wai		; CB
	wai		; CB
	xce		; FB
	and ($33.b)		; 32 33
	beq  15.b		; F0 0F
	rts		; 60

	cpy $4400.w		; CC 00 44
	mvp $C9,$00		; 44 00 C9
	sta $6499.w,Y		; 99 99 64
	jsr ($FFFC.w,X)		; FC FC FF
	and $0F3030.l,X		; 3F 30 30 0F
	brk $74.b		; 00 74
	jsr $ECE0.w		; 20 E0 EC
	jmp.w [$EDDF]		; DC DF ED
	jsr ($74FF.w,X)		; FC FF 74
	ora $15.b,S		; 03 15
	bit $12.b,X		; 34 12
	bmi  34.b		; 30 22
	and ($21.b),Y		; 31 21
	stz $2E.b		; 64 2E
	phx		; DA
	bne  16.b		; D0 10
	bpl  16.b		; 10 10
	bpl  69.b		; 10 45
	bra  86.b		; 80 56
	adc [$77.b],Y		; 77 77
	adc [$66.b],Y		; 77 66
	mvn $FD,$20		; 54 20 FD
	stz $CD.b,X		; 74 CD
	sbc $11101F.l		; EF 1F 10 11
	jsl $640212.l		; 22 12 02 64
	bvc  29.b		; 50 1D
	trb $0C0D.w		; 1C 0D 0C
	cpy $BFF0.w		; CC F0 BF
	mvn $E5,$EF		; 54 EF E5
	inc $FF.b,X		; F6 FF
	adc $000007.l,X		; 7F 07 00 00
	stz $C0.b		; 64 C0
	cpy $EBBC.w		; CC BC EB
	tyx		; BB
	nop		; EA
	inc $64E2.w		; EE E2 64
	ora ($23.b,S),Y		; 13 23
	adc $44.b,S		; 63 44
	tsb $05.b		; 04 05
	ora $11.b		; 05 11
	stz $11.b		; 64 11
	ora ($10.b),Y		; 11 10
	ora ($11.b),Y		; 11 11
	eor ($11.b),Y		; 51 11
	and ($80.b,X)		; 21 80
	eor $55.b,X		; 55 55
	mvn $21,$33		; 54 33 21
	brk $FE.b		; 00 FE
	inc $CF64.w		; EE 64 CF
	beq  -1.b		; F0 FF
	ora $0F0F3F.l		; 0F 3F 0F 0F
	eor $F00054.l		; 4F 54 00 F0
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $44.b		; 00 44
	brk $0C.b		; 00 0C
	cpy $C9CC.w		; CC CC C9
	sta $CF64.w,Y		; 99 64 CF
	cmp $FFFFFF.l		; CF FF FF FF
	lda $642FFF.l,X		; BF FF 2F 64
	beq  -1.b		; F0 FF
	xce		; FB
	sbc ($F3.b)		; F2 F3
	ora $30.b,S		; 03 30
	bmi 100.b		; 30 64
	mvp $41,$05		; 44 05 41
	eor ($11.b),Y		; 51 11
	ora ($11.b)		; 12 11
	ora ($54.b),Y		; 11 54
	lda ($2B.b)		; B2 2B
	ora ($A1.b),Y		; 11 A1
	ora ($1A.b),Y		; 11 1A
	ora ($09.b,X)		; 01 09
	rts		; 60

	brk $00.b		; 00 00
	cpy $99CC.w		; CC CC 99
	sta $CC99.w,Y		; 99 99 CC
	rts		; 60

	cmp #$99.b		; C9 99
	sta $CC9C.w,Y		; 99 9C CC
	cpy $0400.w		; CC 00 04
	rts		; 60

	mvp $44,$44		; 44 44 44
	mvp $00,$00		; 44 00 00
	cpy $6499.w		; CC 99 64
	phd		; 0B
	ora $F0FFF0.l		; 0F F0 FF F0
	sbc $64F30F.l,X		; FF 0F F3 64
	tsb $F0FF.w		; 0C FF F0
	sbc $F0BF0F.l,X		; FF 0F BF F0
	sbc $F33F64.l,X		; FF 64 3F F3
	ora $03.b,S		; 03 03
	rti		; 40

	eor ($41.b,X)		; 41 41
	ora ($64.b,X)		; 01 64
	ora ($C1.b),Y		; 11 C1
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($04.b,X)		; 01 04
	bvs 102.b		; 70 66
	ror $64.b		; 66 64
	mvp $22,$22		; 44 22 22
	brk $EE.b		; 00 EE
	mvn $F0,$F0		; 54 F0 F0
	beq -16.b		; F0 F0
	beq  -9.b		; F0 F7
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $9999.w,Y		; 99 99 99
	rts		; 60

	cpy $CCCC.w		; CC CC CC
	cpy $C9CC.w		; CC CC C9
	sta $6099.w,Y		; 99 99 60
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	sbc $FFFFFF.l		; EF FF FF FF
	sbc $0FF0F7.l,X		; FF F7 F0 0F
	mvn $0F,$0F		; 54 0F 0F
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	adc ($01.b),Y		; 71 01
	bvc 119.b		; 50 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$60.b],Y		; 77 60
	mvp $77,$44		; 44 44 77
	adc [$77.b],Y		; 77 77
	adc [$74.b],Y		; 77 74
	mvp $10,$54		; 44 54 10
	bpl  25.b		; 10 19
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $CC.b		; 00 CC
	cpy $CCCC.w		; CC CC CC
	sta $9999.w,Y		; 99 99 99
	stz $0F.b		; 64 0F
	tsb $F0FF.w		; 0C FF F0
	sbc $0FF30F.l,X		; FF 0F F3 0F
	mvn $FF,$0F		; 54 0F FF
	inc $0F.b,X		; F6 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	bvc -103.b		; 50 99
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	adc [$77.b],Y		; 77 77
	adc [$54.b],Y		; 77 54
	ora ($09.b,X)		; 01 09
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$54.b],Y		; 77 54
	ora ($90.b,X)		; 01 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	sta $9999.w,Y		; 99 99 99
	rts		; 60

	cpy $99C9.w		; CC C9 99
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	sbc $F0F0F7.l,X		; FF F7 F0 F0
	beq -16.b		; F0 F0
	beq  -9.b		; F0 F7
	mvn $9F,$00		; 54 00 9F
	ora $000007.l		; 0F 07 00 00
	brk $07.b		; 00 07
	mvn $10,$10		; 54 10 10
	ora $0000.w,Y		; 19 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	sta $2499.w,Y		; 99 99 24
	stz $CCCC.w		; 9C CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $54CC.w		; CC CC 54
	ora $700F0F.l		; 0F 0F 0F 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	ora #$99.b		; 09 99
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	beq  -9.b		; F0 F7
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
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	mvn $0F,$0F		; 54 0F 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	bvs   0.b		; 70 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	sta $9999.w,Y		; 99 99 99
	mvn $F0,$F0		; 54 F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq  -9.b		; F0 F7
	mvn $F0,$09		; 54 09 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	ora $0F540F.l		; 0F 0F 54 0F
	ora $00700F.l		; 0F 0F 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $09.b		; 00 09
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	sbc [$00.b],Y		; F7 00
	mvn $00,$00		; 54 00 00
	sta $0F0F0F.l,X		; 9F 0F 0F 0F
	ora $99500F.l		; 0F 0F 50 99
	sta $0090.w,Y		; 99 90 00
	brk $00.b		; 00 00
	sta $5499.w,Y		; 99 99 54
	ora $00700F.l		; 0F 0F 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora #$99.b		; 09 99
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	beq  -9.b		; F0 F7
	brk $00.b		; 00 00
	sta $0F0F0F.l,X		; 9F 0F 0F 0F
	bvc -103.b		; 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $9950.w,Y		; 99 50 99
	sta $0099.w,Y		; 99 99 00
	brk $00.b		; 00 00
	sta $5499.w,Y		; 99 99 54
	beq -16.b		; F0 F0
	ora $00070F.l		; 0F 0F 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $99.b		; 00 99
	sta $9099.w,Y		; 99 99 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   9.b		; 50 09
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
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $9999.w,Y		; 99 99 99
	mvn $0F,$0F		; 54 0F 0F
	ora $070F0F.l		; 0F 0F 0F 07
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	sta $9999.w,Y		; 99 99 99
	mvn $F0,$F0		; 54 F0 F0
	beq -16.b		; F0 F0
	beq  -9.b		; F0 F7
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	cpy $C0CC.w		; CC CC C0
	eor [$74.b]		; 47 74
	bit $52.b		; 24 52
	ora ($D1.b),Y		; 11 D1
	sbc ($E1.b),Y		; F1 E1
	ora ($0F.b,X)		; 01 0F
	mvn $11,$91		; 54 91 11
	ora ($11.b),Y		; 11 11
	sta ($01.b),Y		; 91 01
	ora ($09.b,X)		; 01 09
	stz $00.b		; 64 00
	tsb $04.b		; 04 04
	ora $01.b		; 05 01
	eor ($05.b),Y		; 51 05
	ora ($64.b),Y		; 11 64
	eor ($55.b)		; 52 55
	jsl $1EEE22.l		; 22 22 EE 1E
	dec $A0D0.w,X		; DE D0 A0
	brk $00.b		; 00 00
	sbc $DDEEFE.l,X		; FF FE EE DD
	jmp.w [$B0CC]		; DC CC B0
	sbc $CCDC.w		; ED DC CC
	tyx		; BB
	tsx		; BA
	lda #$9A.b		; A9 9A
	plb		; AB
	sty $45.b		; 84 45
	ror $2E.b,X		; 76 2E
	cpx $BBCC.w		; EC CC BB
	sbc ($0F.b),Y		; F1 0F
	sty $E0.b		; 84 E0
	inc $12DE.w,X		; FE DE 12
	lsr $66.b,X		; 56 66
	adc [$42.b],Y		; 77 42
	sty $44.b		; 84 44
	mvn $64,$65		; 54 65 64
	jsr $EFFE.w		; 20 FE EF
	ora ($84.b,X)		; 01 84
	eor $54.b,X		; 55 54
	and ($1F.b)		; 32 1F
	sbc $21F0.w		; ED F0 21
	ora $EE0FA4.l		; 0F A4 0F EE
	inc $3313.w		; EE 13 33
	lsr $63.b,X		; 56 63
	ora $99EB94.l		; 0F 94 EB 99
	lda $EDF0.w,X		; BD F0 ED
	sbc $C0DB.w		; ED DB C0
	bcs -34.b		; B0 DE
	sbc ($35.b),Y		; F1 35
	ror $54.b		; 66 54
	and ($0F.b,X)		; 21 0F
	inc $FE94.w		; EE 94 FE
	inc $E0FF.w		; EE FF E0
	trb $44.b		; 14 44
	eor $20.b,S		; 43 20
	sty $EC.b,X		; 94 EC
	lda $CDBC.w,X		; BD BC CD
	sbc $DDDEDC.l		; EF DC DE DD
	ldy $EF.b		; A4 EF
	inc $44E1.w		; EE E1 44
	lsr $66.b		; 46 66
	rti		; 40

	inc $DCA4.w,X		; FE A4 DC
	cpy $FEDF.w		; CC DF FE
	inc $FFFF.w		; EE FF FF
	bit $A4.b		; 24 A4
	mvp $42,$54		; 44 54 42
	asl $DDEE.w		; 0E EE DD
	inc $A40F.w		; EE 0F A4
	inc $F0FE.w		; EE FE F0
	ora ($56.b,S),Y		; 13 56
	eor $33.b,X		; 55 33
	asl $CCA4.w		; 0E A4 CC
	cpy $F0DE.w		; CC DE F0
	ora $F1000F.l,X		; 1F 0F 00 F1
	ldy $02.b		; A4 02
	brk $FE.b		; 00 FE
	cmp $34F3.w,X		; DD F3 34
	eor $53.b,X		; 55 53
	sty $EB.b,X		; 94 EB
	cmp #$AC.b		; C9 AC
	cmp $DDFD34.l,X		; DF 34 FD DD
	jmp.w [$F3A4]		; DC A4 F3
	mvp $31,$34		; 44 34 31
	inc $FFDD.w,X		; FE DD FF
	sbc ($A4.b),Y		; F1 A4
	ora ($0E.b,X)		; 01 0E
	sbc $3402FF.l		; EF FF 02 34
	eor $21.b,S		; 43 21
	sty $1E.b,X		; 94 1E
	cpy $DDDE.w		; CC DE DD
	sbc $01EEEE.l		; EF EE EE 01
	ldy $10.b		; A4 10
	ora $DDED0E.l		; 0F 0E ED DD
	dec $6426.w,X		; DE 26 64
	ldy $65.b		; A4 65
	eor ($CD.b),Y		; 51 CD
	inc $FFDE.w,X		; FE DE FF
	asl $A4CC.w		; 0E CC A4
	sbc $6436F1.l,X		; FF F1 36 64
	jsl $E0ED1E.l		; 22 1E ED E0
	ldy $FF.b		; A4 FF
	beq -18.b		; F0 EE
	cmp $22F1.w,X		; DD F1 22
	bit $41.b,X		; 34 41
	bcs  68.b		; B0 44
	mvp $44,$44		; 44 44 44
	.db $42, $0F		; 42 0F
	jmp.w [$94BB]		; DC BB 94
	rol $74.b,X		; 36 74
	bmi -21.b		; 30 EB
	txy		; 9B
	lda $DCEC.w,X		; BD EC DC
	ldy $D2.b		; A4 D2
	eor ($57.b,S),Y		; 53 57
	ror $3E.b		; 66 3E
	sbc $A4DEBB.l		; EF BB DE A4
	sbc $F0FFFD.l		; EF FD FF F0
	ora ($56.b,S),Y		; 13 56
	mvp $94,$32		; 44 32 94
	wai		; CB
	tsx		; BA
	wai		; CB
	cmp $DFDBFD.l		; CF FD DB DF
	jsl $4424A4.l		; 22 A4 24 44
	jsl $FFFF11.l		; 22 11 FF FF
	inc $94ED.w,X		; FE ED 94
	ldy $14DF.w,X		; BC DF 14
	mvn $FD,$33		; 54 33 FD
	tyx		; BB
	wai		; CB
	cpy #$ED.b		; C0 ED
	cmp $CECC.w,X		; DD CC CE
	sbc ($24.b),Y		; F1 24
	eor $43.b,X		; 55 43
	ldy $EC.b		; A4 EC
	lda $FEEF.w,X		; BD EF FE
	cmp $5712FF.l		; CF FF 12 57
	ldy $63.b		; A4 63
	and ($0C.b)		; 32 0C
	cmp $EEEF.w,X		; DD EF EE
	ora $EFA4DE.l		; 0F DE A4 EF
	ora ($34.b,S),Y		; 13 34
	eor ($21.b,S),Y		; 53 21
	beq  15.b		; F0 0F
	sbc ($94.b),Y		; F1 94
	inc $BBBA.w		; EE BA BB
	cmp $316526.l,X		; DF 26 65 31
	xce		; FB
	ldy $FE.b,X		; B4 FE
	beq -16.b		; F0 F0
	sbc $33F3ED.l,X		; FF ED F3 33
	mvp $73,$A4		; 44 A4 73
	cpx $BCCC.w		; EC CC BC
	sbc $FECDFF.l,X		; FF FF CD FE
	cpy #$DE.b		; C0 DE
	sbc ($34.b),Y		; F1 34
	mvp $11,$43		; 44 43 11
	brk $0F.b		; 00 0F
	ldy $FF.b		; A4 FF
	jmp.w [$14EF]		; DC EF 14
	eor $53.b		; 45 53
	bpl -18.b		; 10 EE
	sty $0F.b,X		; 94 0F
	ora ($1F.b,X)		; 01 1F
	wai		; CB
	plb		; AB
	bne  70.b		; D0 46
	stz $A4.b		; 64 A4
	bpl -19.b		; 10 ED
	sbc $0FF0.w		; ED F0 0F
	sbc $A0DB.w,X		; FD DB A0
	ldy $44.b,X		; B4 44
	and $43.b,X		; 35 43
	ora $EDDF.w		; 0D DF ED
	sbc ($0F.b),Y		; F1 0F
	ldy $EE.b,X		; B4 EE
	cpx #$F1.b		; E0 F1
	bit $53.b,X		; 34 53
	bpl  14.b		; 10 0E
	dec $00A4.w,X		; DE A4 00
	ora $D0DCDE.l		; 0F DE DC D0
	bit $65.b		; 24 65
	mvp $0C,$94		; 44 94 0C
	ldy $12F1.w		; AC F1 12
	and $E2ADC9.l		; 2F C9 AD E2
	sty $47.b,X		; 94 47
	stz $FD.b		; 64 FD
	cpy $E1BD.w		; CC BD E1
	asl $B4BC.w,X		; 1E BC B4
	sbc $5304EE.l		; EF EE 04 53
	mvp $ED,$2F		; 44 2F ED
	sbc $00DFB4.l,X		; FF B4 DF 00
	inc $11EE.w		; EE EE 11
	trb $43.b		; 14 43
	bmi -92.b		; 30 A4
	sbc $0FC0EC.l,X		; FF EC C0 0F
	cmp $DFCD.w,X		; DD CD DF
	and $A4.b		; 25 A4
	eor $43.b,X		; 55 43
	ora $01F0EE.l,X		; 1F EE F0 01
	brk $ED.b		; 00 ED
	sty $BE.b,X		; 94 BE
	ora ($46.b),Y		; 11 46
	eor ($0D.b,S),Y		; 53 0D
	cmp $F0DE.w,X		; DD DE F0
	ldy $0F.b,X		; B4 0F
	inc $FFFF.w,X		; FE FF FF
	ora $333215.l		; 0F 15 32 33
	ldy $20.b		; A4 20
	ldy $BDFD.w		; AC FD BD
	inc $E0CD.w,X		; FE CD E0
	and ($A4.b)		; 32 A4
	eor [$64.b],Y		; 57 64
	bmi  -1.b		; 30 FF
	cpx $EDEF.w		; EC EF ED
	cmp $EEA4.w,X		; DD A4 EE
	sbc ($45.b),Y		; F1 45
	eor $32.b,S		; 43 32
	ora $840FFF.l		; 0F FF 0F 84
	plb		; AB
	jmp.w [$07AA]		; DC AA 07
	stz $47.b,X		; 74 47
	bmi -66.b		; 30 BE
	sty $0F.b,X		; 94 0F
	inc $CBEE.w		; EE EE CB
	dec $F0EF.w,X		; DE EF F0
	xba		; EB
	cpy #$DE.b		; C0 DE
	ora ($24.b,X)		; 01 24
	eor $42.b,X		; 55 42
	ora ($FE.b),Y		; 11 FE
	inc $FDA4.w		; EE A4 FD
	inc $2513.w		; EE 13 25
	adc $41.b,X		; 75 41
	inc $A4ED.w,X		; FE ED A4
	dec $DE0E.w,X		; DE 0E DE
	cmp $4335FF.l,X		; DF FF 35 43
	and ($94.b)		; 32 94
	and $FEFFCE.l		; 2F CE FF FE
	sbc $F2CD.w		; ED CD F2
	mvp $33,$94		; 44 94 33
	jsr $F0EE.w		; 20 EE F0
	beq  -2.b		; F0 FE
	wai		; CB
	lda $F0B4.w		; AD B4 F0
	brk $0F.b		; 00 0F
	cpx #$53.b		; E0 53
	ora ($31.b,S),Y		; 13 31
	ora $BFA4.w		; 0D A4 BF
	xba		; EB
	cmp ($FC.b)		; D2 FC
	dec $1403.w,X		; DE 03 14
	ror $94.b,X		; 76 94
	adc ($1D.b,X)		; 61 1D
	cpy $1DCD.w		; CC CD 1D
	lda #$AB.b		; A9 AB
	cpx #$A4.b		; E0 A4
	bit $53.b		; 24 53
	jsl $01F01F.l		; 22 1F F0 01
	sbc $AC94EF.l,X		; FF EF 94 AC
	sbc ($44.b,S),Y		; F3 44
	.db $42, $1F		; 42 1F
	inc $1111.w		; EE 11 11
	sty $FE.b,X		; 94 FE
	wai		; CB
	ldy $10D0.w		; AC D0 10
	ora $A4B0FC.l,X		; 1F FC B0 A4
	adc [$34.b]		; 67 34
	eor ($EC.b,X)		; 41 EC
	lda $0DE01E.l,X		; BF 1E E0 0D
	ldy $CE.b		; A4 CE
	ora $33.b,S		; 03 33
	mvn $FF,$2F		; 54 2F FF
	beq -16.b		; F0 F0
	bcs  33.b		; B0 21
	sbc $BCCB.w,X		; FD CB BC
	cpx #$12.b		; E0 12
	jsl $139422.l		; 22 22 94 13
	.db $42, $FC		; 42 FC
	tyx		; BB
	bne  36.b		; D0 24
	and ($FE.b)		; 32 FE
	sty $DE.b,X		; 94 DE
	cop $33.b		; 02 33
	jsr $BDDB.w		; 20 DB BD
	sbc $DDB0F1.l		; EF F1 B0 DD
	cpy $A9BB.w		; CC BB A9
	cmp ($24.b)		; D2 24
	adc [$65.b],Y		; 77 65
	ldy $B0.b		; A4 B0
	rol $FBCF.w,X		; 3E CF FB
	lda $31F2.w,X		; BD F2 31
	eor $A4.b		; 45 A4
	jsr $2112.w		; 20 12 21
	ora $DEBC1D.l,X		; 1F 1D BC DE
	cpx #$94.b		; E0 94
	and ($11.b,S),Y		; 33 11
	ora ($55.b)		; 12 55
	adc [$51.b]		; 67 51
	cpx $94CC.w		; EC CC 94
	dec $FE10.w		; CE 10 FE
	dec $34F0.w,X		; DE F0 34
	eor $0F.b,S		; 43 0F
	sty $DD.b,X		; 94 DD
	cmp $FCEE00.l,X		; DF 00 EE FC
	cmp $0CF1.w		; CD F1 0C
	ldy $E1.b		; A4 E1
	adc ($F6.b,S),Y		; 73 F6
	eor ($1F.b),Y		; 51 1F
	sbc ($FC.b,X)		; E1 FC
	cpx #$A4.b		; E0 A4
	jmp.w [$00DE]		; DC DE 00
	cop $44.b		; 02 44
	jsl $941031.l		; 22 31 10 94
	ora ($FA.b),Y		; 11 FA
	tyx		; BB
	tyx		; BB
	lda $341200.l,X		; BF 00 12 34
	sty $34.b,X		; 94 34
	eor $32.b,X		; 55 32
	and ($FD.b,X)		; 21 FD
	cmp $DDCC.w,X		; DD CC DD
	sty $BC.b		; 84 BC
	cmp ($23.b)		; D2 23
	bit $54.b		; 24 54
	and ($1F.b),Y		; 31 1F
	wai		; CB
	sty $EE.b,X		; 94 EE
	sbc $00EF.w		; ED EF 00
	beq  17.b		; F0 11
	ora $A0E7.w		; 0D E7 A0
	and ($47.b,S),Y		; 33 47
	adc [$64.b],Y		; 77 64
	mvp $10,$31		; 44 31 10
	stp		; DB
	sty $AF.b		; 84 AF
	and ($36.b),Y		; 31 36
	eor ($03.b)		; 52 03
	mvn $40,$65		; 54 65 40
	sty $DB.b		; 84 DB
	cmp $E0DD.w		; CD DD E0
	cpx $03CF.w		; EC CF 03
	eor $84.b		; 45 84
	adc $41.b		; 65 41
	ora ($0F.b,X)		; 01 0F
	sbc $CBBBDC.l,X		; FF DC BB CB
	stz $CE.b,X		; 74 CE
	sbc ($00.b)		; F2 00
	ora $0F.b,S		; 03 0F
	sbc $741501.l,X		; FF 01 15 74
	eor [$32.b],Y		; 57 32
	and ($B1.b,X)		; 21 B1
	jsl $BADEFE.l		; 22 FE DE BA
	sty $CB.b		; 84 CB
	ora $02.b,S		; 03 02
	adc $03.b		; 65 03
	ora ($32.b),Y		; 11 32
	cop $74.b		; 02 74
	asl A		; 0A
	plb		; AB
	ldx $D0EE.w		; AE EE D0
	cmp $35F1.w		; CD F1 35
	stz $54.b,X		; 74 54
	eor ($01.b,X)		; 41 01
	and $31.b,S		; 23 31
	ora $E0FB.w,X		; 1D FB E0
	stz $24.b,X		; 74 24
	and ($1E.b,X)		; 21 1E
	cmp $CBEC.w,X		; DD EC CB
	sbc $9B74DD.l		; EF DD 74 9B
	inc $5524.w		; EE 24 55
	eor ($E0.b)		; 52 E0
	ora $24.b,S		; 03 24
	bra  85.b		; 80 55
	and ($FD.b),Y		; 31 FD
	cpy $CCCC.w		; CC CC CC
	wai		; CB
	ldy $C070.w,X		; BC 70 C0
	bit $44.b		; 24 44
	lsr $66.b		; 46 66
	ror $2E.b		; 66 2E
	tax		; AA
	stz $F7.b		; 64 F7
	stz $5D.b,X		; 74 5D
	cmp $34C0.w		; CD C0 34
	mvp $64,$51		; 44 51 64
	ora ($14.b),Y		; 11 14
	ora ($D1.b)		; 12 D1
	cmp $01D0.w,X		; DD D0 01
	rti		; 40

	stz $DC.b		; 64 DC
	cpy #$00.b		; C0 00
	ora $0C.b,S		; 03 0C
	cpy $BBFC.w		; CC FC BB
	stz $FE.b,X		; 74 FE
	sbc $044133.l,X		; FF 33 41 04
	and $74CCCE.l		; 2F CE CC 74
	cmp $3001F1.l		; CF F1 01 30
	dec $33F0.w,X		; DE F0 33
	bit $70.b		; 24 70
	ror $44.b,X		; 76 44
	jsl $EC0020.l		; 22 20 00 EC
	ldy $64C0.w		; AC C0 64
	and ($40.b),Y		; 31 40
	bne -36.b		; D0 DC
	bit $41.b,X		; 34 41
	tsb $D4.b		; 04 D4
	stz $15.b		; 64 15
	trb $12.b		; 14 12
	ora ($D1.b),Y		; 11 D1
	inc A		; 1A
	tsb $D9.b		; 04 D9
	bra  -1.b		; 80 FF
	jmp.w [$BABB]		; DC BB BA
	plb		; AB
	cmp $F0CD.w		; CD CD F0
	stz $E2.b,X		; 74 E2
	jsr $BF00.w		; 20 00 BF
	rol $3ECE.w		; 2E CE 3E
	bcs 100.b		; B0 64
	rtl		; 6B

	sbc $733FB6.l,X		; FF B6 3F 73
	sta ($4C.b,S),Y		; 93 4C
	and $E270.w,X		; 3D 70 E2
	cpy $A00C.w		; CC 0C A0
	cop $42.b		; 02 42
	bit $44.b		; 24 44
	stz $5D.b		; 64 5D
	mvp $7D,$AD		; 44 AD 7D
	pei ($0D.b)		; D4 0D
	eor ($C1.b,X)		; 41 C1
	bvs  44.b		; 70 2C
	cpx #$9A.b		; E0 9A
	tsb $AAEE.w		; 0C EE AA
	lda #$9A.b		; A9 9A
	stz $FF.b		; 64 FF
	bmi -61.b		; 30 C3
	beq -16.b		; F0 F0
	bmi -49.b		; 30 CF
	ora $70.b,S		; 03 70
	cpx $AACE.w		; EC CE AA
	cpy $CEEA.w		; CC EA CE
	ldy $700E.w		; AC 0E 70
	brk $24.b		; 00 24
	jsl $242220.l		; 22 20 22 24
	mvp $70,$26		; 44 26 70
	rts		; 60

	eor [$24.b]		; 47 24
	.db $42, $22		; 42 22
	jsr $E240.w		; 20 40 E2
	bvs   0.b		; 70 00
	jsl $444624.l		; 22 24 46 44
	mvp $42,$47		; 44 47 42
	bvs 100.b		; 70 64
	.db $42, $02		; 42 02
	asl $0000.w		; 0E 00 00
	tsb $22.b		; 04 22
	stz $71.b		; 64 71
	trb $11.b		; 14 11
	cmp ($4E.b),Y		; D1 4E
	jmp.w [$D04D]		; DC 4D D0
	rts		; 60

	rti		; 40

	tsb $00.b		; 04 00
	bvs  71.b		; 70 47
	mvp $00,$0C		; 44 0C 00
	bvc -112.b		; 50 90
	adc $0990.w,Y		; 79 90 09
	ora #$90.b		; 09 90
	sta $7000.w,Y		; 99 00 70
	dec $CCEC.w		; CE EC CC
	cpy $CCCC.w		; CC CC CC
	dex		; CA
	dex		; CA
	bvs -100.b		; 70 9C
	ldy $EE0C.w		; AC 0C EE
	cpy $ECCC.w		; CC CC EC
	cpy $CF64.w		; CC 64 CF
	cmp $FF.b,S		; C3 FF
	bvs -12.b		; 70 F4
	brk $0C.b		; 00 0C
	rti		; 40

	stz $0E.b,X		; 74 0E
	cpx $A0.b		; E4 A0
	trb $E121.w		; 1C 21 E1
	asl $602F.w		; 0E 2F 60
	stz $0CCC.w		; 9C CC 0C
	cpy $C9CC.w		; CC CC C9
	cpy #$99.b		; C0 99
	rts		; 60

	cmp #$C9.b		; C9 C9
	stz $0CCC.w		; 9C CC 0C
	stz $9C99.w		; 9C 99 9C
	rts		; 60

	cpy $C9CC.w		; CC CC C9
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	rti		; 40

	bvs   0.b		; 70 00
	inc $CE0C.w		; EE 0C CE
	ldy $CEEC.w		; AC EC CE
	cpx $0060.w		; EC 60 00
	mvp $04,$00		; 44 00 04
	jmp $9040.w		; 4C 40 90
	cmp #$70.b		; C9 70
	nop		; EA
	dec $0EAE.w		; CE AE 0E
	brk $EE.b		; 00 EE
	cpx #$EE.b		; E0 EE
	stz $0C.b		; 64 0C
	bmi   3.b		; 30 03
	cpy $CC.b		; C4 CC
	bvs -60.b		; 70 C4
	cpy #$60.b		; C0 60
	tsb $900C.w		; 0C 0C 90
	ora #$00.b		; 09 00
	stz $CC00.w		; 9C 00 CC
	rts		; 60

	cmp #$0C.b		; C9 0C
	cpy #$CC.b		; C0 CC
	cpy $0CC0.w		; CC C0 0C
	brk $70.b		; 00 70
	cpx #$EE.b		; E0 EE
	inc $A0EE.w		; EE EE A0
	tsb $E000.w		; 0C 00 E0
	bvc   0.b		; 50 00
	adc [$00.b],Y		; 77 00
	bvs   0.b		; 70 00
	bcc   9.b		; 90 09
	brk $60.b		; 00 60
	cpy $C9.b		; C4 C9
	jmp $C994.w		; 4C 94 C9
	jmp $CCC0.w		; 4C C0 CC
	rts		; 60

	mvp $00,$40		; 44 40 00
	rti		; 40

	brk $0C.b		; 00 0C
	tsb $6090.w		; 0C 90 60
	cpy #$40.b		; C0 40
	tsb $0407.w		; 0C 07 04
	jmp $9044.w		; 4C 44 90
	bvc 121.b		; 50 79
	sta $0090.w,Y		; 99 90 00
	ora #$70.b		; 09 70
	sta [$00.b],Y		; 97 00
	bvc 119.b		; 50 77
	sta [$77.b],Y		; 97 77
	bvs   0.b		; 70 00
	ora [$00.b]		; 07 00
	brk $50.b		; 00 50
	adc [$00.b],Y		; 77 00
	brk $09.b		; 00 09
	bvs -105.b		; 70 97
	bcc 121.b		; 90 79
	bvc -105.b		; 50 97
	brk $70.b		; 00 70
	ora [$70.b]		; 07 70
	ora [$00.b]		; 07 00
	bvs  80.b		; 70 50
	bcc   9.b		; 90 09
	sta $9099.w,Y		; 99 99 90
	sta $9009.w,Y		; 99 09 90
	rts		; 60

	tsb $C900.w		; 0C 00 C9
	bcc -55.b		; 90 C9
	jmp $9CC0.w		; 4C C0 9C
	bvc   9.b		; 50 09
	ora #$90.b		; 09 90
	sta $9999.w,Y		; 99 99 99
	bcc -103.b		; 90 99
	rts		; 60

	cpy $C9C0.w		; CC C0 C9
	cpy $C9CC.w		; CC CC C9
	cpy $50CC.w		; CC CC 50
	sta $9999.w,Y		; 99 99 99
	sta $9900.w,Y		; 99 00 99
	bcc   9.b		; 90 09
	bvc   0.b		; 50 00
	brk $70.b		; 00 70
	bcc   0.b		; 90 00
	brk $99.b		; 00 99
	brk $50.b		; 00 50
	sta $9900.w,Y		; 99 00 99
	sta $0090.w,Y		; 99 90 00
	brk $09.b		; 00 09
	bvc -112.b		; 50 90
	sta $9000.w,Y		; 99 00 90
	ora #$99.b		; 09 99
	bcc -103.b		; 90 99
	bvc   9.b		; 50 09
	brk $90.b		; 00 90
	ora #$00.b		; 09 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	bcc   9.b		; 90 09
	sta $9009.w,Y		; 99 09 90
	sta $0950.w,Y		; 99 50 09
	bcc -112.b		; 90 90
	ora #$90.b		; 09 90
	brk $00.b		; 00 00
	bcc  80.b		; 90 50
	ora #$00.b		; 09 00
	brk $90.b		; 00 90
	ora #$00.b		; 09 00
	bcc   0.b		; 90 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $0950.w,Y		; 99 50 09
	bcc -103.b		; 90 99
	bcc -103.b		; 90 99
	ora #$00.b		; 09 00
	sta $0050.w,Y		; 99 50 00
	bcc   9.b		; 90 09
	ora #$90.b		; 09 90
	sta $9999.w,Y		; 99 99 99
	bvc -103.b		; 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $9050.w,Y		; 99 50 90
	sta $9000.w,Y		; 99 00 90
	ora #$99.b		; 09 99
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5099.w,Y		; 99 99 50
	sta $9900.w,Y		; 99 00 99
	sta $9999.w,Y		; 99 99 99
	bcc   0.b		; 90 00
	mvn $0F,$9F		; 54 9F 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $005470.l		; 0F 70 54 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $540F0F.l,X		; 9F 0F 0F 54
	ora $00700F.l		; 0F 0F 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	mvn $F0,$F0		; 54 F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	sbc [$00.b],Y		; F7 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	sta $9999.w,Y		; 99 99 99
	bit $9C.b		; 24 9C
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0F54.w		; CC 54 0F
	ora $00070F.l		; 0F 0F 07 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	ora #$90.b		; 09 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	sta $9999.w,Y		; 99 99 99
	bvc -112.b		; 50 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $5499.w,Y		; 99 99 54
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $00700F.l		; 0F 0F 70 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	sta $F054.w,Y		; 99 54 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	bvs   0.b		; 70 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $0090.w,Y		; 99 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	ora #$90.b		; 09 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $9950.w,Y		; 99 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $9950.w,Y		; 99 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $9950.w,Y		; 99 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $F054.w,Y		; 99 54 F0
	beq -16.b		; F0 F0
	beq 112.b		; F0 70
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	sta $0099.w,Y		; 99 99 00
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
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $070F0F.l		; 0F 0F 0F 07
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	sta $0F54.w,Y		; 99 54 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	bvs   0.b		; 70 00
	brk $74.b		; 00 74
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsl $22706E.l		; 22 6E 70 22
	jsr $0EE0.w		; 20 E0 0E
	brk $AC.b		; 00 AC
	tsb $70AC.w		; 0C AC 70
	ldy $CEEC.w		; AC EC CE
	dec $EE00.w		; CE 00 EE
	dec $7074.w		; CE 74 70
	rep #$4C		; C2 4C
	cpx #$EE.b		; E0 EE
	cpx $ACE0.w		; EC E0 AC
	tsb $5674.w		; 0C 74 56
	sbc $D10C.w		; ED 0C D1
	bit $01E3.w		; 2C E3 01
	brk $70.b		; 00 70
	rol $22.b		; 26 22
	jsl $ECEE00.l		; 22 00 EE EC
	cpy #$0C.b		; C0 0C
	bvs -84.b		; 70 AC
	inc $00EE.w		; EE EE 00
	brk $EE.b		; 00 EE
	tsb $70CE.w		; 0C CE 70
	dex		; CA
	cpy $ACCE.w		; CC CE AC
	cpx $ECCE.w		; EC CE EC
	cpy $0074.w		; CC 74 00
	sbc $D5F00E.l		; EF 0E F0 D5
	asl $0201.w		; 0E 01 02
	stz $34.b		; 64 34
	brk $01.b		; 00 01
	mvp $11,$10		; 44 10 11
	sty $01.b,X		; 94 01
	rts		; 60

	stz $00.b,X		; 74 00
	brk $04.b		; 00 04
	mvp $04,$44		; 44 44 04
	mvp $77,$50		; 44 50 77
	brk $07.b		; 00 07
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	adc [$64.b],Y		; 77 64
	cmp $0034.w		; CD 34 00
	eor ($01.b,X)		; 41 01
	eor ($41.b,X)		; 41 41
	cmp ($64.b),Y		; D1 64
	ora $400D.w,X		; 1D 0D 40
	bcc   0.b		; 90 00
	cpy $BBCC.w		; CC CC BB
	stz $D0.b,X		; 74 D0
	cmp $F0BD.w,X		; DD BD F0
	eor ($EF.b)		; 52 EF
	eor ($25.b),Y		; 51 25
	stz $62.b,X		; 74 62
	bpl  18.b		; 10 12
	and ($F0.b),Y		; 31 F0
	sbc $00F0.w,X		; FD F0 00
	stz $AC.b		; 64 AC
	cpy $4F3F.w		; CC 3F 4F
	tsb $30C7.w		; 0C C7 30
	brk $64.b		; 00 64
	brk $04.b		; 00 04
	rti		; 40

	trb $00D0.w		; 1C D0 00
	rti		; 40

	stz $CC70.w		; 9C 70 CC
	cpy $CACC.w		; CC CC CA
	ldy $0EE0.w		; AC E0 0E
	rol $74.b		; 26 74
	bvc -12.b		; 50 F4
	ora $DD1E03.l,X		; 1F 03 1E DD
	cpx #$CC.b		; E0 CC
	stz $ED.b,X		; 74 ED
	cmp $FBFF.w		; CD FF FB
	cmp $FDDE0F.l,X		; DF 0F DE FD
	sty $03.b		; 84 03
	eor ($E2.b,X)		; 41 E2
	and ($23.b),Y		; 31 23
	bmi  31.b		; 30 1F
	cop $74.b		; 02 74
	jmp $DADF.w		; 4C DF DA
	cpx #$0E.b		; E0 0E
	ldy $0111.w		; AC 11 01
	stz $12.b,X		; 74 12
	ora $124127.l		; 0F 27 41 12
	bpl  49.b		; 10 31
	and $00DD74.l,X		; 3F 74 DD 00
	inc $CCEF.w,X		; FE EF CC
	sbc ($2D.b),Y		; F1 2D
	ora $642174.l		; 0F 74 21 64
	rti		; 40

	and ($33.b)		; 32 33
	and $74DDDF.l,X		; 3F DF DD 74
	sbc $BDABAC.l		; EF AC AB BD
	sbc $E0CB.w		; ED CB E0
	cpx #$84.b		; E0 84
	ora $F065F2.l		; 0F F2 65 F0
	mvn $42,$03		; 54 03 42
	sbc $2FF084.l,X		; FF 84 F0 2F
	ldx $DFED.w,Y		; BE ED DF
	brk $DE.b		; 00 DE
	sbc ($84.b)		; F2 84
	ora ($22.b),Y		; 11 22
	and ($03.b,X)		; 21 03
	.db $42, $00		; 42 00
	ora ($00.b),Y		; 11 00
	stz $1F.b,X		; 74 1F
	tyx		; BB
	dec $CB0C.w,X		; DE 0C CB
	ora $31D1.w		; 0D D1 31
	stz $10.b,X		; 74 10
	ora $66.b,X		; 15 66
	eor $33.b		; 45 33
	and $21.b,S		; 23 21
	cmp $CD74.w		; CD 74 CD
	lda $99AA.w		; AD AA 99
	ldy $C0EE.w,X		; BC EE C0
	cpx #$94.b		; E0 94
	brk $10.b		; 00 10
	beq  52.b		; F0 34
	asl $2013.w,X		; 1E 13 20
	ora ($84.b)		; 12 84
	inc $10DE.w,X		; FE DE 10
	stp		; DB
	cmp $FE02DD.l,X		; DF DD 02 FE
	stz $E2.b,X		; 74 E2
	adc $52.b,X		; 75 52
	adc $23.b,S		; 63 23
	adc [$0E.b]		; 67 0E
	bne 116.b		; D0 74
	ora $DBFC.w,X		; 1D FC DB
	plb		; AB
	ora $11FFDB.l		; 0F DB FF 11
	stz $43.b,X		; 74 43
	rti		; 40

	trb $66.b		; 14 66
	eor ($52.b,S),Y		; 53 52
	beq  81.b		; F0 51
	stz $EA.b,X		; 74 EA
	stp		; DB
	ldy $A9CB.w,X		; BC CB A9
	ldy $DEE0.w,X		; BC E0 DE
	sty $0F.b		; 84 0F
	ora ($22.b,X)		; 01 22
	sbc $5125F2.l,X		; FF F2 25 51
	cpy #$84.b		; C0 84
	eor ($22.b),Y		; 51 22
	ora $01DE.w		; 0D DE 01
	ora $00CC.w		; 0D CC 00
	stz $02.b,X		; 74 02
	rol $57C1.w,X		; 3E C1 57
	stz $10.b		; 64 10
	ora ($25.b,S),Y		; 13 25
	stz $3E.b,X		; 74 3E
	tyx		; BB
	ora ($0D.b,X)		; 01 0D
	cpy $F1AE.w		; CC AE F1
	ora $13CF74.l,X		; 1F 74 CF 13
	eor $40.b,S		; 43 40
	cop $54.b		; 02 54
	and ($0F.b)		; 32 0F
	stz $12.b,X		; 74 12
	and $E0DDFF.l,X		; 3F FF DD E0
	inc $DFCA.w,X		; FE CA DF
	stz $CE.b		; 64 CE
	ldx $D2AA.w		; AE AA D2
	asl $2FE1.w,X		; 1E E1 2F
	inc $0084.w		; EE 84 00
	ora ($52.b,X)		; 01 52
	cpx #$33.b		; E0 33
	cop $00.b		; 02 00
	beq 116.b		; F0 74
	cmp ($0E.b,X)		; C1 0E
	tsx		; BA
	ora $E02F0F.l		; 0F 0F 2F E0
	ora ($74.b,S),Y		; 13 74
	mvp $22,$01		; 44 01 22
	ora ($31.b)		; 12 31
	sbc $0EE1.w,X		; FD E1 0E
	bra  15.b		; 80 0F
	jmp.w [$CCCC]		; DC CC CC
	tyx		; BB
	lda $01E0.w,X		; BD E0 01
	stz $41.b		; 64 41
	mvp $E1,$55		; 44 55 E1
	ora ($55.b),Y		; 11 55
	rol A		; 2A
	ldy $74.b		; A4 74
	asl $DC1E.w,X		; 1E 1E DC
	sbc $BC00.w		; ED 00 BC
	lda $84FF.w,X		; BD FF 84
	beq  -1.b		; F0 FF
	brk $01.b		; 00 01
	sbc $0E44F2.l,X		; FF F2 44 0E
	stz $46.b,X		; 74 46
	and $43.b,S		; 23 43
	sbc $30DE.w		; ED DE 30
	tsx		; BA
	dec $EF74.w		; CE 74 EF
	sbc ($0D.b),Y		; F1 0D
	ora $35.b,S		; 03 35
	jsl $742132.l		; 22 32 21 74
	eor ($0D.b)		; 52 0D
	inc $FC1E.w,X		; FE 1E FC
	jmp.w [$1FDE]		; DC DE 1F
	stz $0D.b,X		; 74 0D
	ora ($13.b,X)		; 01 13
	jsl $240222.l		; 22 22 02 24
	ora ($64.b),Y		; 11 64
	dec $1111.w,X		; DE 11 11
	cmp ($D0.b),Y		; D1 D0
	trb $0D.b		; 14 0D
	cmp $0074.w,X		; DD 74 00
	inc $BEEE.w		; EE EE BE
	cmp $DD1D.w,X		; DD 1D DD
	sbc ($84.b),Y		; F1 84
	brk $F0.b		; 00 F0
	cpx #$04.b		; E0 04
	eor ($D1.b),Y		; 51 D1
	eor $12.b,S		; 43 12
	stz $4F.b,X		; 74 4F
	sbc $1BF2.w		; ED F2 1B
	txs		; 9A
	sbc $741EEF.l		; EF EF 1E 74
	cmp $025415.l,X		; DF 15 54 02
	bit $34.b,X		; 34 34
	and ($ED.b),Y		; 31 ED
	stz $F0.b,X		; 74 F0
	ora $D0CEAD.l,X		; 1F AD CE D0
	beq -34.b		; F0 DE
	sbc ($74.b,S),Y		; F3 74
	and ($22.b),Y		; 31 22
	cop $42.b		; 02 42
	eor ($0F.b,X)		; 41 0F
	beq  16.b		; F0 10
	stz $E9.b		; 64 E9
	ora $4400.w		; 0D 00 44
	ora $41C4.w		; 0D C4 41
	ora $CE74.w		; 0D 74 CE
	cpx #$ED.b		; E0 ED
	xba		; EB
	dec $FDE1.w,X		; DE E1 FD
	sbc $F0F184.l,X		; FF 84 F1 F0
	beq  20.b		; F0 14
	and $122203.l,X		; 3F 03 22 12
	stz $11.b,X		; 74 11
	cmp $FB10.w,X		; DD 10 FB
	ldx $FFEC.w		; AE EC FF
	ora $15F074.l		; 0F 74 F0 15
	eor ($22.b)		; 52 22
	and ($34.b)		; 32 34
	ora ($EF.b),Y		; 11 EF
	bra  84.b		; 80 54
	and ($0E.b)		; 32 0E
	wai		; CB
	tax		; AA
	tax		; AA
	sta $74AC.w,Y		; 99 AC 74
	and $22.b,S		; 23 22
	jsr $3024.w		; 20 24 30
	ora $6410F0.l,X		; 1F F0 10 64
	cmp ($91.b),Y		; D1 91
	tsb $0D.b		; 04 0D
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	stz $EE.b,X		; 74 EE
	inc $EDFC.w		; EE FC ED
	sbc $FFFFFF.l,X		; FF FF FF FF
	stz $F3.b,X		; 74 F3
	beq -65.b		; F0 BF
	eor [$4E.b],Y		; 57 4E
	tsb $22.b		; 04 22
	eor $74.b		; 45 74
	ora $1D10DE.l,X		; 1F DE 10 1D
	ldx $F2EC.w		; AE EC F2
	asl $BF64.w,X		; 1E 64 BF
	adc [$74.b]		; 67 74
	eor $15.b		; 45 15
	lsr $5E.b		; 46 5E
	nop		; EA
	stz $0F.b,X		; 74 0F
	sbc $0FCCEE.l		; EF EE CC 0F
	beq -16.b		; F0 F0
	sbc ($74.b),Y		; F1 74
	and $22.b,S		; 23 22
	jsr $5022.w		; 20 22 50
	ora $70F001.l,X		; 1F 01 F0 70
	ror $42.b,X		; 76 42
	brk $00.b		; 00 00
	inc $CCCC.w		; EE CC CC
	cpy $CC64.w		; CC 64 CC
	sbc $BEBBFF.l,X		; FF FF BB BE
	lda ($2B.b)		; B2 2B
	xba		; EB
	stz $1F.b,X		; 74 1F
	ora $5213ED.l,X		; 1F ED 13 52
	ora ($24.b,X)		; 01 24
	and $80.b,S		; 23 80
	adc [$65.b],Y		; 77 65
	eor $54.b,X		; 55 54
	and ($0E.b),Y		; 31 0E
	cmp $74DD.w,X		; DD DD 74
	sbc $202301.l		; EF 01 23 20
	jsl $1E4112.l		; 22 12 41 1E
	stz $2D.b		; 64 2D
	ora $D91D.w,X		; 1D 1D D9
	wai		; CB
	ora $64FFFC.l		; 0F FC FF 64
	sbc ($33.b,S),Y		; F3 33
	rti		; 40

	ora $45.b,S		; 03 45
	eor ($11.b,X)		; 41 11
	ora ($64.b),Y		; 11 64
	ora ($D1.b),Y		; 11 D1
	bne -48.b		; D0 D0
	bne -52.b		; D0 CC
	jsr ($64F0.w,X)		; FC F0 64
	lda $BFFFCE.l,X		; BF CE FF BF
	sbc $FF2FEF.l		; EF EF 2F FF
	stz $F0.b,X		; 74 F0
	beq -34.b		; F0 DE
	sbc $5E.b,X		; F5 5E
	sbc $40.b,S		; E3 40
	bit $74.b		; 24 74
	eor ($FE.b,X)		; 41 FE
	ora ($1E.b)		; 12 1E
	beq  -4.b		; F0 FC
	cpx #$2E.b		; E0 2E
	stz $CC.b		; 64 CC
	sbc ($03.b,S),Y		; F3 03
	rti		; 40

	brk $07.b		; 00 07
	eor ($11.b,X)		; 41 11
	bvs 102.b		; 70 66
	ror $66.b		; 66 66
	.db $42, $00		; 42 00
	brk $EE.b		; 00 EE
	cpx $9960.w		; EC 60 99
	stz $CCCC.w		; 9C CC CC
	cpy #$04.b		; C0 04
	mvp $64,$44		; 44 44 64
	eor ($01.b,X)		; 41 01
	cmp ($00.b,X)		; C1 00
	ora ($C0.b,X)		; 01 C0
	cpy #$0C.b		; C0 0C
	stz $F0.b		; 64 F0
	cmp $0F02BF.l		; CF BF 02 0F
	beq  -1.b		; F0 FF
	beq 100.b		; F0 64
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	cmp $0F3FF3.l		; CF F3 3F 0F
	rts		; 60

	cpy $0400.w		; CC 00 04
	mvp $77,$44		; 44 44 77
	mvp $60,$44		; 44 44 60
	mvp $44,$44		; 44 44 44
	eor [$77.b]		; 47 77
	adc [$77.b],Y		; 77 77
	mvp $77,$50		; 44 50 77
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bcc  80.b		; 90 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	mvn $0F,$0F		; 54 0F 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora [$00.b]		; 07 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $CC60.w,Y		; 99 60 CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cmp #$64.b		; C9 64
	sbc $F0F000.l,X		; FF 00 F0 F0
	jsr ($FFF0.w,X)		; FC F0 FF
	beq 112.b		; F0 70
	tax		; AA
	cpy $EECC.w		; CC CC EE
	cpx #$00.b		; E0 00
	cop $22.b		; 02 22
	bvc 119.b		; 50 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$54.b],Y		; 77 54
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  25.b		; 10 19
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $0F54.w,Y		; 99 54 0F
	ora $000070.l		; 0F 70 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $99.b		; 00 99
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	sta $9C24.w,Y		; 99 24 9C
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $9950.w		; CC 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $9950.w,Y		; 99 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $9950.w,Y		; 99 50 99
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $07.b		; 00 07
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	bvc 119.b		; 50 77
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	sta $CC60.w,Y		; 99 60 CC
	cmp #$99.b		; C9 99
	sta $9999.w,Y		; 99 99 99
	sta $6099.w,Y		; 99 99 60
	sta $CCCC.w,Y		; 99 CC CC
	cpy $CCCC.w		; CC CC CC
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
	bvc   0.b		; 50 00
	ora #$99.b		; 09 99
	sta $9999.w,Y		; 99 99 99
	sta $5499.w,Y		; 99 99 54
	beq -16.b		; F0 F0
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	sta $9C24.w,Y		; 99 24 9C
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $9950.w		; CC 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $F754.w,Y		; 99 54 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $99.b		; 00 99
	sta $9999.w,Y		; 99 99 99
	sta $9099.w,Y		; 99 99 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	sta $9999.w,Y		; 99 99 99
	sta $9950.w,Y		; 99 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $EE71.w,Y		; 99 71 EE
	inc $EEEE.w		; EE EE EE
	inc $EEEE.w		; EE EE EE
	nop		; EA
	eor $4B55.w,Y		; 59 55 4B
	eor $000000.l		; 4F 00 00 00
	bpl   0.b		; 10 00
	brk $11.b		; 00 11
	beq  -1.b		; F0 FF
	sbc $50FFFF.l,X		; FF FF FF 50
	and $3935.w,Y		; 39 35 39
	eor $2E4B38.l,X		; 5F 38 4B 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($7C00.w)		; 6C 00 7C
	asl $7D.b,X		; 16 7D
	asl $09.b,X		; 16 09
	ora [$0A.b],Y		; 17 0A
	ora [$0B.b],Y		; 17 0B
	ora [$0C.b],Y		; 17 0C
	ora [$0D.b],Y		; 17 0D
	ora [$0E.b],Y		; 17 0E
	ora [$0F.b],Y		; 17 0F
	ora [$10.b],Y		; 17 10
	ora [$11.b],Y		; 17 11
	ora [$12.b],Y		; 17 12
	ora [$13.b],Y		; 17 13
	ora [$14.b],Y		; 17 14
	ora [$15.b],Y		; 17 15
	ora [$16.b],Y		; 17 16
	ora [$17.b],Y		; 17 17
	ora [$18.b],Y		; 17 18
	ora [$A2.b],Y		; 17 A2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($AB.b,S),Y		; 13 AB
	lda ($50.b)		; B2 50
	cmp $CCEE.w,X		; DD EE CC
	cpy $32F1.w		; CC F1 32
	and ($B6.b,X)		; 21 B6
	asl $FEB0.w		; 0E B0 FE
	bpl  -2.b		; 10 FE
	sbc $A61000.l,X		; FF 00 10 A6
	sbc $2002FF.l,X		; FF FF 02 20
	and ($43.b,S),Y		; 33 43
	eor [$DB.b]		; 47 DB
	ldx $F0.b,Y		; B6 F0
	bpl  18.b		; 10 12
	eor ($EE.b,X)		; 41 EE
	beq  17.b		; F0 11
	ora ($B6.b),Y		; 11 B6
	beq  32.b		; F0 20
	beq -34.b		; F0 DE
	ora ($32.b),Y		; 11 32
	ora $E3A6CE.l		; 0F CE A6 E3
	bpl  50.b		; 10 32
	inc $FE03.w,X		; FE 03 FE
.ACCU 16
	rep #$24		; C2 24
	ldx $01.b		; A6 01
	lsr $E1EE.w		; 4E EE E1
	eor $56.b,S		; 43 56
	phx		; DA
	stz $FEA6.w,X		; 9E A6 FE
	and ($EF.b),Y		; 31 EF
	sbc $EC11.w		; ED 11 EC
	cmp $DEA6FD.l		; CF FD A6 DE
	sbc $6046.w,X		; FD 46 60
	cpx #$E0.b		; E0 E0
	lsr $A6F7.w		; 4E F7 A6
	brk $10.b		; 00 10
	brk $01.b		; 00 01
	and $25C0.w,X		; 3D C0 25
	eor ($A6.b,S),Y		; 53 A6
	trb $1101.w		; 1C 01 11
	ora $33E1.w,Y		; 19 E1 33
	mvp $A6,$20		; 44 20 A6
	asl $FFDD.w		; 0E DD FF
	dec $3107.w,X		; DE 07 31
	beq  28.b		; F0 1C
	ldx $E0.b		; A6 E0
	cmp ($57.b),Y		; D1 57
	and ($F2.b)		; 32 F2
	eor #$42CE.w		; 49 CE 42
	ldx $F5.b		; A6 F5
	bmi  -4.b		; 30 FC
	ldy $F0CC.w		; AC CC F0
	tsb $C2F1.w		; 0C F1 C2
	jmp.w [$BBCB]		; DC CB BB
	tyx		; BB
	lda $FEFF.w,X		; BD FF FE
	sbc $BFB2.w		; ED B2 BF
	ora ($20.b)		; 12 20
	inc $00DD.w		; EE DD 00
	brk $FD.b		; 00 FD
	ldx $F2.b,Y		; B6 F2
	asl $10F1.w,X		; 1E F1 10
	inc $F001.w,X		; FE 01 F0
	and $A6.b		; 25 A6
	and $33A299.l,X		; 3F 99 A2 33
	and ($03.b,X)		; 21 03
	asl $B6E1.w		; 0E E1 B6
	and $E13013.l		; 2F 13 30 E1
	brk $12.b		; 00 12
	and $C224.w		; 2D 24 C2
	mvn $11,$32		; 54 32 11
	ora ($52.b,S),Y		; 13 52
	ora ($00.b),Y		; 11 00
	asl $D3A6.w		; 0E A6 D3
	jsl $22DD2D.l		; 22 2D DD 22
	asl $55F1.w,X		; 1E F1 55
	ldx $4A.b		; A6 4A
	bne -17.b		; D0 EF
	sbc $56.b,S		; E3 56
	cmp $CBFD.w		; CD FD CB
	ldx $03.b		; A6 03
	.db $62, $10, $1F		; 62 10 1F
	inc $32DF.w		; EE DF 32
	beq -94.b		; F0 A2
	ora ($34.b),Y		; 11 34
	rol $BFAA.w		; 2E AA BF
	and ($24.b,S),Y		; 33 24
	bmi -90.b		; 30 A6
	beq  -2.b		; F0 FE
	lsr $14.b,X		; 56 14
	lsr A		; 4A
	cop $42.b		; 02 42
	ora $02FEA6.l,X		; 1F A6 FE 02
	lsr $33BC.w		; 4E BC 33
	and $A6DEBB.l,X		; 3F BB DE A6
	cmp $3106.w,Y		; D9 06 31
	cmp ($EC.b),Y		; D1 EC
	sbc $B22FF4.l,X		; FF F4 2F B2
	sbc ($32.b),Y		; F1 32
	bit $43.b		; 24 43
	tsb $DEBB.w		; 0C BB DE
	ora ($B2.b,X)		; 01 B2
	and ($B9.b,X)		; 21 B9
	ldy $CCDC.w		; AC DC CC
	cmp $99C9.w		; CD C9 99
	ldx $11.b		; A6 11
	bpl  49.b		; 10 31
	inc $03EE.w,X		; FE EE 03
	tda		; 7B
	ldx $DEB2.w,Y		; BE B2 DE
	sbc ($22.b),Y		; F1 22
	and ($02.b)		; 32 02
	mvp $56,$45		; 44 45 56
	ldx $21.b		; A6 21
	ora ($D1.b),Y		; 11 D1
	jsl $5BB310.l		; 22 10 B3 5B
	sbc ($A6.b),Y		; F1 A6
	inc $EFE0.w		; EE E0 EF
	jsr $FCF5.w		; 20 F5 FC
	sbc $00B6F4.l,X		; FF F4 B6 00
	.db $42, $11		; 42 11
	asl $C11D.w		; 0E 1D C1
	bit $21.b,X		; 34 21
	lda ($62.b)		; B2 62
	bpl -71.b		; 10 B9
	plb		; AB
	bne  17.b		; D0 11
	inc $C2DB.w,X		; FE DB C2
	cmp $DDEE.w,X		; DD EE DD
	beq  -2.b		; F0 FE
	dec $CCEE.w,X		; DE EE CC
	ldx $0F.b		; A6 0F
	eor $4E.b,X		; 55 4E
	dec $1FF0.w		; CE F0 1F
	cop $33.b		; 02 33
	ldx $23.b		; A6 23
	jsr $2EBD.w		; 20 BD 2E
	cmp ($20.b)		; D2 20
	cmp ($50.b,S),Y		; D3 50
	ldx $DB.b		; A6 DB
	bcs  45.b		; B0 2D
	and $6F.b,S		; 23 6F
	sbc $EE.b,S		; E3 EE
	lsr $A6.b		; 46 A6
	eor ($10.b)		; 52 10
	ora ($31.b,S),Y		; 13 31
	ora ($61.b,X)		; 01 61
	sbc ($00.b,X)		; E1 00
	ldx $FD.b		; A6 FD
	cmp ($43.b),Y		; D1 43
	lda $EE4502.l		; AF 02 45 EE
	xce		; FB
	ldx $EE.b		; A6 EE
	eor ($FE.b,X)		; 41 FE
	ora $1E.b,S		; 03 1E
	tyx		; BB
	cmp $A622.w		; CD 22 A6
	eor $3CCFED.l		; 4F ED CF 3C
.ACCU 8
	sep #$22		; E2 22
	bpl -21.b		; 10 EB
	stx $33.b,Y		; 96 33
	ora [$40.b],Y		; 17 40
	sbc ($7F.b)		; F2 7F
	jmp.w [$FFEF]		; DC EF FF
	ldx $02.b		; A6 02
	cpx $0EE0.w		; EC E0 0E
	tyx		; BB
	sbc ($10.b)		; F2 10
	sbc $2302B6.l,X		; FF B6 02 23
	ora $2225E1.l		; 0F E1 25 22
	and $55C2E1.l		; 2F E1 C2 55
	mvn $33,$43		; 54 43 33
	ora ($22.b),Y		; 11 22
	and $21.b,S		; 23 21
	ldx $FF.b		; A6 FF
	sbc $2210F1.l,X		; FF F1 10 22
	rol $D2A9.w		; 2E A9 D2
	ldx $51.b		; A6 51
	cmp $DCEE23.l,X		; DF 23 EE DC
	sbc ($22.b)		; F2 22
	bpl -94.b		; 10 A2
	sbc ($DA.b),Y		; F1 DA
	tax		; AA
	cpx $0E.b		; E4 0E
	sbc $54.b,S		; E3 54
	trb $9DA6.w		; 1C A6 9D
	ora $21.b,X		; 15 21
	cmp $F2BA.w		; CD BA F2
	and ($0F.b),Y		; 31 0F
	ldx $00.b		; A6 00
	cop $34.b		; 02 34
	bpl -50.b		; 10 CE
	beq  68.b		; F0 44
	eor ($B2.b)		; 52 B2
	mvn $22,$22		; 54 22 22
	ora ($23.b)		; 12 23
	and ($24.b,S),Y		; 33 24
	mvp $3E,$A6		; 44 A6 3E
	cpy $43DF.w		; CC DF 43
	and $E001.w,X		; 3D 01 E0
	and #$A6.b		; 29 A6
	ldy $1300.w,X		; BC 00 13
	bit $30.b,X		; 34 30
	sbc $0FDC.w		; ED DC 0F
	ldx $27.b		; A6 27
	ror $02.b,X		; 76 02
	bvc  -2.b		; 50 FE
	cmp ($70.b),Y		; D1 70
	bit $C2.b		; 24 C2
	mvn $23,$22		; 54 22 23
	and ($1F.b,X)		; 21 1F
	stp		; DB
	cmp $A6FF.w		; CD FF A6
	inc $FECE.w		; EE CE FE
	sbc ($01.b)		; F2 01
	and [$51.b]		; 27 51
	bpl -90.b		; 10 A6
	sbc $3D.b		; E5 3D
	brk $E0.b		; 00 E0
	ora ($10.b)		; 12 10
	rol A		; 2A
	cmp $B6.b,S		; C3 B6
	brk $E1.b		; 00 E1
	and $0F.b,S		; 23 0F
	cmp ($21.b,X)		; C1 21
	asl $A600.w		; 0E 00 A6
	trb $FD.b		; 14 FD
	and ($0A.b,X)		; 21 0A
	sbc ($F1.b)		; F2 F1
	ora ($31.b,S),Y		; 13 31
	ldx $EE.b		; A6 EE
	cmp ($34.b)		; D2 34
	cmp $DF2E25.l,X		; DF 25 2E DF
	pea $31A6.w		; F4 A6 31
	rol $F1BE.w,X		; 3E BE F1
	ldy $02ED.w,X		; BC ED 02
	cpx #$A6.b		; E0 A6
	eor $ECEF.w		; 4D EF EC
	dec $3103.w		; CE 03 31
	ora $CDA625.l		; 0F 25 A6 CD
	inc $FE02.w		; EE 02 FE
	bpl  19.b		; 10 13
	eor ($9B.b),Y		; 51 9B
	ldx $EF.b,Y		; B6 EF
	cop $51.b		; 02 51
	ora $FFFFEF.l		; 0F EF FF FF
	and ($A6.b)		; 32 A6
	and $2E.b,S		; 23 2E
	lda #$C2.b		; A9 C2
	bmi  -1.b		; 30 FF
	eor $22.b,S		; 43 22
	ldx $EE.b		; A6 EE
	.db $62, $2E, $12		; 62 2E 12
	eor ($27.b,X)		; 41 27
	eor ($EE.b,S),Y		; 53 EE
	ldx $04.b,Y		; B6 04
	bpl   1.b		; 10 01
	ora $DF1E11.l		; 0F 11 1E DF
	ora ($A6.b,S),Y		; 13 A6
	tax		; AA
	ldx #$21.b		; A2 21
	lda $0200.w,X		; BD 00 02
	asl $A6C4.w,X		; 1E C4 A6
	mvp $BF,$1E		; 44 1E BF
	bpl  18.b		; 10 12
	lsr A		; 4A
	ldx $A621.w,Y		; BE 21 A6
	sbc $DFE0.w		; ED E0 DF
	and $FFD0.w		; 2D D0 FF
	dec $B214.w,X		; DE 14 B2
	dec $CEDC.w,X		; DE DC CE
	inc $BA9A.w,X		; FE 9A BA
	lda $A612.w,X		; BD 12 A6
	ora $10CE.w		; 0D CE 10
	cpx #$21.b		; E0 21
	jsl $A63236.l		; 22 36 32 A6
	tas		; 1B
	ldx #$46.b		; A2 46
	mvn $EF,$2C		; 54 2C EF
	inc $A6D2.w,X		; FE D2 A6
	brk $42.b		; 00 42
	bpl -36.b		; 10 DC
	ora $0301E0.l		; 0F E0 01 03
	ldx $3B.b		; A6 3B
	and $AE.b		; 25 AE
	bpl  31.b		; 10 1F
	eor ($1E.b)		; 52 1E
	wai		; CB
	ldx $55.b		; A6 55
	jmp $EFBA.w		; 4C BA EF
	ora $1B.b,X		; 15 1B
	and ($CD.b),Y		; 31 CD
.INDEX 16
	rep #$DD		; C2 DD
	cpy $EDDD.w		; CC DD ED
	inc $DCDD.w		; EE DD DC
	cpy $26A6.w		; CC A6 26
	bvc -85.b		; 50 AB
	cmp ($32.b,X)		; C1 32
	.db $42, $01		; 42 01
	lsr $A6.b		; 46 A6
	bpl  46.b		; 10 2E
	tsb $42.b		; 04 42
	and $F1C1.w		; 2D C1 F1
	adc $A6.b,S		; 63 A6
	trb $AEEF.w		; 1C EF AE
	ora $FE12.w		; 0D 12 FE
	sbc ($56.b)		; F2 56
	ldx $ED.b		; A6 ED
	cmp $4725.w,X		; DD 25 47
	adc $30F2.w		; 6D F2 30
	sbc [$A6.b],Y		; F7 A6
	tsb $1CE0.w		; 0C E0 1C
	cmp $0C1511.l,X		; DF 11 15 0C
	asl $EEA2.w		; 0E A2 EE
	cmp #$03.b		; C9 03
	bvc -31.b		; 50 E1
	brk $0B.b		; 00 0B
	sta $0EA6.w,Y		; 99 A6 0E
	lda $EEED24.l,X		; BF 24 ED EE
	sbc $5BE0.w,X		; FD E0 5B
	lda ($9C.b)		; B2 9C
	inc $CAED.w		; EE ED CA
	txy		; 9B
	sbc ($34.b),Y		; F1 34
	jsr $12B2.w		; 20 B2 12
	ora $AACB.w,X		; 1D CB AA
	plb		; AB
	cmp $DCEE.w		; CD EE DC
	ldx $CE.b		; A6 CE
	stz $40.b		; 64 40
	ora ($21.b),Y		; 11 21
	ora ($11.b)		; 12 11
	ora $11F1B6.l,X		; 1F B6 F1 11
	sbc ($22.b),Y		; F1 22
	inc $14CE.w,X		; FE CE 14
	.db $42, $B2		; 42 B2
	ror $75.b		; 66 75
	ora $0FEF.w,X		; 1D EF 0F
	sbc ($22.b)		; F2 22
	and $C19DA6.l,X		; 3F A6 9D C1
	adc $0C3113.l		; 6F 13 31 0C
	cmp $A623.w		; CD 23 A6
	eor $0F1102.l,X		; 5F 02 11 0F
	cop $1F.b		; 02 1F
.ACCU 16
	rep #$20		; C2 20
	ldx $0E.b		; A6 0E
	cmp ($24.b),Y		; D1 24
	jmp.w [$DCCD]		; DC CD DC
	sbc ($11.b),Y		; F1 11
	stx $EB.b,Y		; 96 EB
	cpx #$50E5.w		; E0 E5 50
	brk $34.b		; 00 34
	bmi  -2.b		; 30 FE
	ldx $25.b		; A6 25
	and $04EF13.l,X		; 3F 13 EF 04
	inc $16D0.w,X		; FE D0 16
	ldx $32.b		; A6 32
	brk $FD.b		; 00 FD
	cmp $FC74E5.l,X		; DF E5 74 FC
	asl $EFA6.w,X		; 1E A6 EF
	wai		; CB
	jsl $EC4415.l		; 22 15 44 EC
	ldy #$A623.w		; A0 23 A6
	bpl   1.b		; 10 01
	and ($00.b,X)		; 21 00
	trb $1E.b		; 14 1E
	dec $B612.w		; CE 12 B6
	ora $11D021.l		; 0F 21 D0 11
	cpx $01C0.w		; EC C0 01
	brk $A6.b		; 00 A6
	asl $DEC9.w,X		; 1E C9 DE
	ora $2222EF.l,X		; 1F EF 22 22
	ora $EFA6.w,X		; 1D A6 EF
	tsb $4C.b		; 04 4C
	ora ($4F.b,X)		; 01 4F
	sbc ($43.b,S),Y		; F3 43
	phx		; DA
	ldx $BF.b		; A6 BF
	beq  51.b		; F0 33
	and $01000F.l,X		; 3F 0F 00 01
	wai		; CB
	ldx $03.b		; A6 03
	eor [$1F.b],Y		; 57 1F
	dec $24D2.w,X		; DE D2 24
	.db $62, $F0, $A6		; 62 F0 A6
	inc $4304.w,X		; FE 04 43
	sbc $14F0.w,X		; FD F0 14
	eor $1D.b,S		; 43 1D
	ldx $B6.b		; A6 B6
	and ($FB.b),Y		; 31 FB
	sta ($45.b)		; 92 45
	asl $D0AC.w,X		; 1E AC D0
	ldx $AD.b		; A6 AD
	and $2F.b,S		; 23 2F
	lda $3FF3.w		; AD F3 3F
	bpl -34.b		; 10 DE
	ldx $03.b		; A6 03
	and ($F1.b)		; 32 F1
	bit $ED.b,X		; 34 ED
	cpy $42F3.w		; CC F3 42
	ldx $CC.b		; A6 CC
	cpx #$3E34.w		; E0 34 3E
	cmp ($10.b)		; D2 10
	wai		; CB
	cpx $A6.b		; E4 A6
	eor $A1.b,S		; 43 A1
	and $20.b,X		; 35 20
	lda $01B2.w,Y		; B9 B2 01
	eor ($A6.b),Y		; 51 A6
	bpl   1.b		; 10 01
	and ($0B.b),Y		; 31 0B
	trb $42.b		; 14 42
	brk $34.b		; 00 34
	ldx $2E.b,Y		; B6 2E
	cpy #$1034.w		; C0 34 10
	inc $1002.w,X		; FE 02 10
	inc $FEB2.w		; EE B2 FE
	sbc $BC9A.w,X		; FD 9A BC
	beq  12.b		; F0 0C
	lda $A6EE.w,X		; BD EE A6
	sbc $CE6224.l,X		; FF 24 62 CE
	ora $EF.b,S		; 03 EF
	and $01B6EE.l		; 2F EE B6 01
	and $51E0DB.l,X		; 3F DB E0 51
	ora $A61FDF.l		; 0F DF 1F A6
	cmp $3032DE.l		; CF DE 32 30
	sbc $0FCE.w,X		; FD CE 0F
	brk $A6.b		; 00 A6
	rep #$44		; C2 44
	asl $2FD1.w		; 0E D1 2F
	brk $F3.b		; 00 F3
	eor $2125A6.l		; 4F A6 25 21
	ora $163112.l,X		; 1F 12 31 16
	asl $96E1.w		; 0E E1 96
	eor ($1F.b),Y		; 51 1F
	inc $F1CB.w		; EE CB F1
	sbc ($42.b),Y		; F1 42
	nop		; EA
	stx $D0.b,Y		; 96 D0
	and ($44.b,X)		; 21 44
	eor $1D.b,S		; 43 1D
	ora $51.b		; 05 51
	lda $03F0A6.l,X		; BF A6 F0 03
	rts		; 60

	stp		; DB
	ora ($0E.b,X)		; 01 0E
	cpx #$A622.w		; E0 22 A6
	ora $11BA.w,X		; 1D BA 11
	phd		; 0B
	sep #$0E		; E2 0E
	tsx		; BA
	pei ($A6.b)		; D4 A6
	and ($10.b)		; 32 10
	cpx $10DE.w		; EC DE 10
	bit $32.b		; 24 32
	brk $A6.b		; 00 A6
	asl $52F2.w		; 0E F2 52
	trb $1301.w		; 1C 01 13
	asl $A2CD.w,X		; 1E CD A2
	ora ($57.b,S),Y		; 13 57
	rol $FD00.w,X		; 3E 00 FD
	lda $E3AB.w,Y		; B9 AB E3
	ldx $42.b		; A6 42
	dec $33F3.w		; CE F3 33
	asl $45E5.w		; 0E E5 45
	jsl $DD2BA6.l		; 22 A6 2B DD
	inc $2EF5.w		; EE F5 2E
	dec $54E4.w		; CE E4 54
	ldx $FF.b,Y		; B6 FF
	inc $0FF1.w,X		; FE F1 0F
	cpy #$4123.w		; C0 23 41
	cmp $CBA6.w		; CD A6 CB
	ora ($0C.b),Y		; 11 0C
	dec $3045.w		; CE 45 30
	ora ($EE.b,X)		; 01 EE
	ldx $E0.b,Y		; B6 E0
	bpl  49.b		; 10 31
	brk $02.b		; 00 02
	and ($3F.b,X)		; 21 3F
	dex		; CA
.ACCU 16
	rep #$EF		; C2 EF
	ora ($32.b,X)		; 01 32
	jsl $CCDC0F.l		; 22 0F DC CC
	dec $1FA6.w,X		; DE A6 1F
	and ($0F.b,S),Y		; 33 0F
	sbc $7046F0.l		; EF F0 46 70
	and ($A6.b,S),Y		; 33 A6
	rol $F0CD.w		; 2E CD F0
	and $34.b,S		; 23 34
	sbc $2000.w,X		; FD 00 20
	lda ($1D.b)		; B2 1D
	sbc ($45.b)		; F2 45
	ror $55.b		; 66 55
	.db $42, $0E		; 42 0E
	beq -90.b		; F0 A6
	beq  15.b		; F0 0F
	ora ($30.b,X)		; 01 30
	inc $F2BE.w,X		; FE BE F2
	and ($A6.b)		; 32 A6
	asl $1BE3.w		; 0E E3 1B
	cop $22.b		; 02 22
	phd		; 0B
	ora ($1C.b,X)		; 01 1C
	ldx $E6.b		; A6 E6
	cmp $0F11.w		; CD 11 0F
	tsx		; BA
	ldx $33FE.w,Y		; BE FE 33
	lda ($AA.b)		; B2 AA
	ldy $BCDC.w,X		; BC DC BC
	cmp $4502FF.l,X		; DF FF 02 45
	stx $32.b,Y		; 96 32
	bvs -49.b		; 70 CF
	tax		; AA
	sbc ($70.b,S),Y		; F3 70
	sbc $A6F5.w		; ED F5 A6
	mvn $9B,$32		; 54 32 9B
	cpx $33.b		; E4 33
	bvc -35.b		; 50 DD
	sbc ($A6.b)		; F2 A6
	bmi -33.b		; 30 DF
	ora ($01.b,X)		; 01 01
	jsr ($32DE.w,X)		; FC DE 32
	ora $15A6.w		; 0D A6 15
	eor ($FD.b,X)		; 41 FD
	tsb $C0.b		; 04 C0
	.db $42, $22		; 42 22
	beq -90.b		; F0 A6
	and $D042EE.l,X		; 3F EE 42 D0
	sbc #$0DFF.w		; E9 FF 0D
	cmp $1E9AA6.l,X		; DF A6 9A 1E
	sbc ($EF.b,X)		; E1 EF
	bmi -32.b		; 30 E0
	dec $A661.w,X		; DE 61 A6
	cop $45.b		; 02 45
	eor $21F0CE.l,X		; 5F CE F0 21
	ora $B2EE.w,X		; 1D EE B2
	sbc ($45.b,X)		; E1 45
	and $FEDFAB.l		; 2F AB DF FE
	sbc ($22.b),Y		; F1 22
	ldx $EF.b		; A6 EF
	jsr $F1DD.w		; 20 DD F1
	jsl $B20F31.l		; 22 31 0F B2
	ldx $60.b		; A6 60
	and $F1.b,S		; 23 F1
	and [$4F.b],Y		; 37 4F
	lda $020F.w,X		; BD 0F 02
	ldx $34.b		; A6 34
	lsr $BB04.w		; 4E 04 BB
	lda ($0B.b),Y		; B1 0B
	inc $A6E7.w		; EE E7 A6
	rol A		; 2A
	cpy $23C1.w		; CC C1 23
	jsr $00CF.w		; 20 CF 00
	eor $B2.b,S		; 43 B2
	sbc $43E0EE.l,X		; FF EE E0 43
	tsb $FFCD.w		; 0C CD FF
	sbc ($A6.b,S),Y		; F3 A6
	cpx $3290.w		; EC 90 32
	mvp $E2,$FF		; 44 FF E2
	inc $B61C.w,X		; FE 1C B6
.INDEX 8
	sep #$11		; E2 11
	ora ($FB.b,X)		; 01 FB
	inc $0201.w		; EE 01 02
	bpl -62.b		; 10 C2
	brk $00.b		; 00 00
	sbc $322301.l,X		; FF 01 23 32
	eor $55.b		; 45 55
	ldx $44.b		; A6 44
	sbc ($21.b,X)		; E1 21
	sbc $2332.w		; ED 32 23
	and ($BC.b,S),Y		; 33 BC
	ldx $CC.b		; A6 CC
	cmp $0FEE.w		; CD EE 0F
	cop $0E.b		; 02 0E
	brk $0F.b		; 00 0F
	ldx $CE.b		; A6 CE
	and $34.b,S		; 23 34
	ora $211DE3.l,X		; 1F E3 1D 21
	cmp $B1A6.w,Y		; D9 A6 B1
	sbc $ED23E2.l,X		; FF E2 23 ED
	sbc $22DC.w		; ED DC 22
	ldx $EE.b		; A6 EE
	sbc $3E34CE.l		; EF CE 34 3E
	tyx		; BB
	bpl  -1.b		; 10 FF
	ldx $DE.b		; A6 DE
	eor [$60.b],Y		; 57 60
	ora $44159E.l,X		; 1F 9E 15 44
	dec $07A6.w,X		; DE A6 07
	eor $EF.b,X		; 55 EF
	inc BG4VOFS.w		; EE 14 21
	sbc $67.b,S		; E3 67
	ldx $A9.b		; A6 A9
	lda ($10.b,X)		; A1 10
	cop $6F.b		; 02 6F
	trb $1C.b		; 14 1C
	sta $1102B6.l,X		; 9F B6 02 11
	sbc ($21.b),Y		; F1 21
	and ($11.b,X)		; 21 11
	xba		; EB
	ora ($A6.b,X)		; 01 A6
	eor $72DF.w,X		; 5D DF 72
	bcs  -5.b		; B0 FB
	sbc ($6B.b,X)		; E1 6B
	cpy #$A6.b		; C0 A6
	cop $0C.b		; 02 0C
	lda $2925BC.l,X		; BF BC 25 29
	cmp $D1A60F.l		; CF 0F A6 D1
	wai		; CB
	cmp ($56.b,S),Y		; D3 56
	cpx $44D2.w		; EC D2 44
	ora $37E1A6.l,X		; 1F A6 E1 37
	mvn $D4,$2E		; 54 2E D4
	jmp.w [$73C4]		; DC C4 73
	ldx $0E.b		; A6 0E
	bit $0EA2.w		; 2C A2 0E
	stz $1E16.w,X		; 9E 16 1E
	jsr $EFA6.w		; 20 A6 EF
	ora ($00.b,X)		; 01 00
	ora $43.b,X		; 15 43
	bvc -48.b		; 50 D0
	brk $A6.b		; 00 A6
	cmp ($62.b),Y		; D1 62
	ora $10900B.l,X		; 1F 0B 90 10
	stz $2C.b		; 64 2C
	ldx $05.b		; A6 05
	lda $EDF34D.l,X		; BF 4D F3 ED
	ldy $20.b,X		; B4 20
	ora $CFACA6.l		; 0F A6 AC CF
	ora ($EF.b)		; 12 EF
	sbc ($FF.b)		; F2 FF
	sbc $9CA2E0.l		; EF E0 A2 9C
	txs		; 9A
	cpy $20CC.w		; CC CC 20
	cmp #$25BF.w		; C9 BF 25
	ldx $0B.b		; A6 0B
	cmp $0FF1.w		; CD F1 0F
	jsl $BB1FFF.l		; 22 FF 1F BB
	ldx $02.b		; A6 02
	ora ($23.b),Y		; 11 23
	adc ($ED.b,X)		; 61 ED
	sbc $A67125.l		; EF 25 71 A6
	and ($DF.b,S),Y		; 33 DF
	ora $0D.b,X		; 15 0D
	and ($30.b)		; 32 30
	phx		; DA
	mvp $77,$B2		; 44 B2 77
	adc $44.b		; 65 44
	and ($2F.b,S),Y		; 33 2F
	sbc $37E0.w		; ED E0 37
	lda ($75.b)		; B2 75
	ora $FFEFEE.l		; 0F EE EF FF
	cop $21.b		; 02 21
	and ($A6.b)		; 32 A6
	beq  -1.b		; F0 FF
	ora ($0E.b,X)		; 01 0E
	mvp $24,$00		; 44 00 24
	sbc $0F21C2.l,X		; FF C2 21 0F
	inc $21F1.w,X		; FE F1 21
	sbc $A9DB.w,X		; FD DB A9
	stx $14.b,Y		; 96 14
	ror $FFC2.w		; 6E C2 FF
	inc $10E2.w		; EE E2 10
	ora [$A2.b]		; 07 A2
	sbc ($46.b),Y		; F1 46
	stz $00.b		; 64 00
	ora $72D7EC.l		; 0F EC D7 72
	ldx $BF.b		; A6 BF
	and ($FD.b),Y		; 31 FD
	ora $51.b,S		; 03 51
	ora ($C2.b)		; 12 C2
	eor ($A6.b)		; 52 A6
	cpx $0D21.w		; EC 21 0D
	cpx #$04.b		; E0 04
	adc $A6F0DB.l		; 6F DB F0 A6
	sbc ($21.b)		; F2 21
	brk $21.b		; 00 21
	ora $65E1.w		; 0D E1 65
	.db $42, $A6		; 42 A6
	cmp #$6394.w		; C9 94 63
	ora $A923CF.l,X		; 1F CF 23 A9
	sta $121DA6.l,X		; 9F A6 1D 12
	and $CFFDFF.l		; 2F FF FD CF
	asl $0F.b,X		; 16 0F
	ldx $E2.b		; A6 E2
	mvp $11,$ED		; 44 ED 11
	ora $AD56.w,X		; 1D 56 AD
	cpx #$A6.b		; E0 A6
	eor $EC.b		; 45 EC
	lda $32.b,S		; A3 32
	sbc $DE2100.l		; EF 00 21 DE
	ldx $FE.b		; A6 FE
	beq 115.b		; F0 73
	ora $EFFF.w,X		; 1D FF EF
	ora $76A6FF.l		; 0F FF A6 76
	bvc  -3.b		; 50 FD
	jsl $530F01.l		; 22 01 0F 53
	asl $A6.b,X		; 16 A6
	eor ($42.b,X)		; 41 42
	sbc $3FDF0F.l,X		; FF 0F DF 3F
	and [$20.b]		; 27 20
	ldx $CC.b		; A6 CC
	tsx		; BA
	inc $EFFE.w		; EE FE EF
	cmp $3B25.w		; CD 25 3B
	stx $EF.b,Y		; 96 EF
	sta ($3F.b)		; 92 3F
	ror $E0.b		; 66 E0
	ora ($BB.b,X)		; 01 BB
	cmp ($A6.b),Y		; D1 A6
	asl $BD21.w,X		; 1E 21 BD
	stp		; DB
	ora $6E.b,S		; 03 6E
.ACCU 16
.INDEX 16
	rep #$FC		; C2 FC
	ldx $B0.b		; A6 B0
	eor [$31.b]		; 47 31
	bmi  -5.b		; 30 FB
	cmp $23D0.w		; CD D0 23
	ldx $FF.b		; A6 FF
	stz $1A.b,X		; 74 1A
	dec $25CF.w,X		; DE CF 25
	lsr $22.b,X		; 56 22
	ldx $02.b,Y		; B6 02
	jsr $D00F.w		; 20 0F D0
	bit $31.b,X		; 34 31
	asl $A6F0.w,X		; 1E F0 A6
	ora $10DECC.l		; 0F CC DE 10
	ora ($FD.b)		; 12 FD
	inc $A6B2.w		; EE B2 A6
	asl $4F14.w		; 0E 14 4F
	cop $FF.b		; 02 FF
	jsr ($12DF.w,X)		; FC DF 12
	ldx $42.b		; A6 42
	bpl -103.b		; 10 99
	bpl -38.b		; 10 DA
	jsl $962913.l		; 22 13 29 96
	sta $C01D.w,X		; 9D 1D C0
	tsx		; BA
	lda ($52.b),Y		; B1 52
	xba		; EB
	jsr ($B096.w,X)		; FC 96 B0
	cop $F0.b		; 02 F0
	asl $41.b,X		; 16 41
	sta ($56.b),Y		; 91 56
	and ($A6.b,X)		; 21 A6
	trb $4D.b		; 14 4D
	eor [$EF.b]		; 47 EF
	and $53.b,X		; 35 53
	beq   0.b		; F0 00
	ldx $ED.b		; A6 ED
	mvp $04,$3D		; 44 3D 04
	jmp.w [$01C1]		; DC C1 01
	inc $04A6.w		; EE A6 04
	jsr $FE21.w		; 20 21 FE
	sbc ($74.b)		; F2 74
	ora $3F9613.l		; 0F 13 96 3F
	sta ($21.b),Y		; 91 21
	ora ($7A.b,S),Y		; 13 7A
	txy		; 9B
	adc [$71.b],Y		; 77 71
	ldx $EB.b		; A6 EB
	beq -33.b		; F0 DF
	sbc ($44.b,X)		; E1 44
	cmp $01BA.w,X		; DD BA 01
	ldx $EE.b		; A6 EE
	ora $30.b,S		; 03 30
	sta $01DE.w,X		; 9D DE 01
	sbc ($30.b)		; F2 30
	ldx $33.b		; A6 33
	sbc $11F0FF.l,X		; FF FF F0 11
	bpl -18.b		; 10 EE
	adc ($A6.b)		; 72 A6
	ora $4F9FDD.l		; 0F DD 9F 4F
	ora ($BB.b,S),Y		; 13 BB
	pei ($2E.b)		; D4 2E
	ldx $21.b		; A6 21
	sbc $44DD.w,X		; FD DD 44
	and ($10.b)		; 32 10
	ora ($12.b),Y		; 11 12
	ldx $20.b		; A6 20
	and ($E1.b,X)		; 21 E1
	asl $35D0.w,X		; 1E D0 35
	ora #$A2DF.w		; 09 DF A2
	ora $42D7.w,X		; 1D D7 42
	bpl -22.b		; 10 EA
	cmp $05DE.w		; CD DE 05
	ldx $21.b		; A6 21
	xce		; FB
	plb		; AB
	sbc ($32.b)		; F2 32
	ora ($10.b)		; 12 10
	tsb $DFA6.w		; 0C A6 DF
	cop $42.b		; 02 42
	asl $5213.w		; 0E 13 52
	beq -18.b		; F0 EE
	ldx $63.b		; A6 63
	and $25CF0F.l		; 2F 0F CF 25
	sbc $ECCD.w,X		; FD CD EC
	ldx $DD.b		; A6 DD
	lda $02FF11.l,X		; BF 11 FF 02
	eor $1F.b,S		; 43 1F
	cmp $1F03B6.l,X		; DF B6 03 1F
	ora ($5F.b,S),Y		; 13 5F
	ora ($EF.b),Y		; 11 EF
	beq   1.b		; F0 01
	ldx $10.b		; A6 10
	pea $2032.w		; F4 32 20
	cpx #$AEFC.w		; E0 FC AE
	eor $A6.b,S		; 43 A6
	and ($F0.b,S),Y		; 33 F0
	and $01A9.w		; 2D A9 01
	and ($0F.b)		; 32 0F
	inc $AFA6.w,X		; FE A6 AF
	bit $CC.b		; 24 CC
	and ($2F.b,S),Y		; 33 2F
	sbc ($2E.b),Y		; F1 2E
	sbc $C2.b,S		; E3 C2
	inc $00EF.w,X		; FE EF 00
	ora ($FF.b,X)		; 01 FF
	sbc $A6CBFD.l,X		; FF FD CB A6
	cmp $20.b,X		; D5 20
	jmp.w [$2DF7]		; DC F7 2D
	ldy $02DF.w,X		; BC DF 02
	lda ($AD.b)		; B2 AD
	sbc $ED0F01.l,X		; FF 01 0F ED
	cpx #$0022.w		; E0 22 00
	ldx $35.b		; A6 35
	sbc $202411.l,X		; FF 11 24 20
	cmp $4213.w,X		; DD 13 42
	ldx $FF.b		; A6 FF
	cop $41.b		; 02 41
	cpx $FFF1.w		; EC F1 FF
	cop $20.b		; 02 20
	ldx $50.b		; A6 50
	dec $45DC.w		; CE DC 45
	mvn $E1,$1C		; 54 1C E1
	.db $42, $96		; 42 96
	jsr $9742.w		; 20 42 97
	bvs -68.b		; 70 BC
	cmp $A63304.l,X		; DF 04 33 A6
	xce		; FB
	lda $DE12.w,X		; BD 12 DE
	xba		; EB
	sbc $A6011F.l,X		; FF 1F 01 A6
	bpl -78.b		; 10 B2
	lsr $D222.w,X		; 5E 22 D2
	stz $0E.b		; 64 0E
	beq -90.b		; F0 A6
	ora #$0D27.w		; 09 27 0D
	cmp $4FF1.w		; CD F1 4F
.INDEX 8
	sep #$10		; E2 10
	ldx $0F.b		; A6 0F
	pei ($1E.b)		; D4 1E
	cpx #$46.b		; E0 46
	eor $A6B0ED.l		; 4F ED B0 A6
	ora ($D1.b,S),Y		; 13 D1
	ror $1C.b		; 66 1C
	sbc $7324D2.l,X		; FF D2 24 73
	ldx $F3.b		; A6 F3
	and $66A3EB.l		; 2F EB A3 66
	bpl -23.b		; 10 E9
	dec $C2.b		; C6 C2
	bpl  15.b		; 10 0F
	sbc ($10.b),Y		; F1 10
	asl $CECB.w		; 0E CB CE
	ora ($A6.b,X)		; 01 A6
	ora $DFAB.w,X		; 1D AB DF
	cop $32.b		; 02 32
	ora $B6FF00.l		; 0F 00 FF B6
	sbc $0F120E.l,X		; FF 0E 12 0F
	xba		; EB
	sbc $A61032.l		; EF 32 10 A6
	jmp.w [$E0FF]		; DC FF E0
	jmp.w [$65F2]		; DC F2 65
	plx		; FA
	cmp $CFA6.w		; CD A6 CF
	eor [$E0.b]		; 47 E0
	and $1F.b,S		; 23 1F
	ora ($11.b),Y		; 11 11
	bit $A6.b,X		; 34 A6
	ora $52.b,S		; 03 52
	jsl $1131E0.l		; 22 E0 31 11
	bpl  21.b		; 10 15
	ldx $10.b,Y		; B6 10
	jsr $E1DC.w		; 20 DC E1
	cmp $000F11.l,X		; DF 11 0F 00
	lda ($00.b)		; B2 00
	sbc $CDDD.w,X		; FD DD CD
	tsb $67.b		; 04 67
	adc ($03.b,S),Y		; 73 03
	ldx $FD.b		; A6 FD
	cmp ($42.b)		; D2 42
	ora ($FC.b),Y		; 11 FC
	lda $0034.w,Y		; B9 34 00
	ldx $10.b		; A6 10
	cpy $DF1E.w		; CC 1E DF
	cop $01.b		; 02 01
	and $FD.b		; 25 FD
	ldx $BE.b		; A6 BE
	ora $3023F1.l		; 0F F1 23 30
	jmp.w [$2102]		; DC 02 21
	ldx $FF.b,Y		; B6 FF
	ora ($12.b,X)		; 01 12
	ora ($0F.b)		; 12 0F
	cmp $A62126.l,X		; DF 26 21 A6
	dec $62F2.w,X		; DE F2 62
	tyx		; BB
	tyx		; BB
	adc ($E1.b,S),Y		; 73 E1
	and $2C02A6.l		; 2F A6 02 2C
	bne  18.b		; D0 12
	and $2F.b,X		; 35 2F
	jsl $C1A62B.l		; 22 2B A6 C1
	ora ($3E.b),Y		; 11 3E
	cpy $50F0.w		; CC F0 50
	phx		; DA
	cmp $1E63A6.l		; CF A6 63 1E
	ldy $F01E.w,X		; BC 1E F0
	cmp $32E2.w		; CD E2 32
.ACCU 16
	rep #$EE		; C2 EE
	stp		; DB
	lda #$BC9A.w		; A9 9A BC
	inc $DCEE.w		; EE EE DC
	ldx $D4.b		; A6 D4
	eor $20.b,X		; 55 20
	ora ($34.b)		; 12 34
	jsr $20E2.w		; 20 E2 20
	ldx $00.b,Y		; B6 00
	brk $11.b		; 00 11
	ora ($1E.b,X)		; 01 1E
	cpy $0E10.w		; CC 10 0E
	ldx $35.b		; A6 35
	cmp $11E1.w,X		; DD E1 11
	bpl -11.b		; 10 F5
	ora $A657.w,X		; 1D 57 A6
	eor ($FB.b,S),Y		; 53 FB
	eor $4F.b,S		; 43 4F
	ora ($10.b,X)		; 01 10
	beq  13.b		; F0 0D
	ldx $D0.b		; A6 D0
	rts		; 60

	nop		; EA
	mvn $FF,$EF		; 54 EF FF
	cop $30.b		; 02 30
	ldx #$40.b		; A2 40
	ora ($20.b,X)		; 01 20
	jmp.w [$EEA9]		; DC A9 EE
	sbc $0EA6DB.l		; EF DB A6 0E
	sbc ($ED.b,S),Y		; F3 ED
	eor ($0E.b),Y		; 51 0E
	ora $13.b,S		; 03 13
	and $BBA6.w		; 2D A6 BB
	eor $5C.b		; 45 5C
	inc $F2DD.w		; EE DD F2
	phx		; DA
	sbc ($A6.b,X)		; E1 A6
	and $10.b,S		; 23 10
	cpy $00C2.w		; CC C2 00
	mvn $35,$60		; 54 60 35
	ldx $C0.b		; A6 C0
	rti		; 40

	brk $64.b		; 00 64
	bpl  18.b		; 10 12
	sbc $22A6F2.l,X		; FF F2 A6 22
	lda $44F5.w,X		; BD F5 44
	ora $E0AE.w,X		; 1D AE E0
	inc $0FA6.w		; EE A6 0F
	brk $23.b		; 00 23
	jmp $EFAB.w		; 4C AB EF
	asl $A615.w,X		; 1E 15 A6
	.db $42, $CF		; 42 CF
	cmp $5F04.w,Y		; D9 04 5F
	sbc $A64E12.l		; EF 12 4E A6
	cpy #$FE.b		; C0 FE
	and $1E.b,S		; 23 1E
	inc $F6DE.w		; EE DE F6
	phx		; DA
	stx $0E.b,Y		; 96 0E
	lda $BFBC.w,X		; BD BC BF
	ora #$6216.w		; 09 16 62
	sbc $36A6.w,Y		; F9 A6 36
	cmp ($3F.b,X)		; C1 3F
	rol $00.b		; 26 00
	and $A61114.l		; 2F 14 11 A6
	and $00DE.w		; 2D DE 00
	dec $31.b,X		; D6 31
	eor ($FD.b,S),Y		; 53 FD
	cpy $F0B6.w		; CC B6 F0
	tsb $1F.b		; 04 1F
	sbc $F00B12.l		; EF 12 0B F0
	bmi -78.b		; 30 B2
	ora ($12.b,X)		; 01 12
	jsl $C0FD22.l		; 22 22 FD C0
	eor [$65.b]		; 47 65
	ldx $FF.b,Y		; B6 FF
	ora $22F101.l		; 0F 01 F1 22
	jsr $04CE.w		; 20 CE 04
	ldx $EC.b		; A6 EC
	cpy $11D0.w		; CC D0 11
	and $BEFEDF.l		; 2F DF FE BE
	ldx $F3.b		; A6 F3
	ora ($F2.b),Y		; 11 F2
	and ($FC.b,S),Y		; 33 FC
	sbc $7F.b,S		; E3 7F
	ora ($B2.b),Y		; 11 B2
	jsl $534413.l		; 22 13 44 53
	inc $35EF.w,X		; FE EF 35
	rti		; 40

	ldx #$DE.b		; A2 DE
	sbc $F00FF0.l		; EF F0 0F F0
	jsl $A6BA1D.l		; 22 1D BA A6
	ora $55.b		; 05 55
	bmi -36.b		; 30 DC
	sbc $12.b,S		; E3 12
	eor ($10.b),Y		; 51 10
	ldx $03.b		; A6 03
	eor ($13.b),Y		; 51 13
	dec $4214.w,X		; DE 14 42
	inc $A62E.w		; EE 2E A6
	cpx #$20.b		; E0 20
	ldx $BC00.w		; AE 00 BC
	inc $F0FD.w,X		; FE FD F0
	ldx $2F.b		; A6 2F
	sbc $30EF.w		; ED EF 30
	jsr ($2F34.w,X)		; FC 34 2F
	dec $00A6.w,X		; DE A6 00
	asl $EEC0.w		; 0E C0 EE
	tsa		; 3B
	sta $2135.w,X		; 9D 35 21
	lda ($DA.b)		; B2 DA
	plb		; AB
	wai		; CB
	sta $01BF.w,Y		; 99 BF 01
	jsr $A6FF.w		; 20 FF A6
	jsr ($34B1.w,X)		; FC B1 34
	and ($41.b,S),Y		; 33 41
	sbc $5EF2.w		; ED F2 5E
	ldx $01.b		; A6 01
	eor $43.b,X		; 55 43
	and ($F1.b),Y		; 31 F1
	jmp $56F3.w		; 4C F3 56
	ldx $4F.b,Y		; B6 4F
	brk $10.b		; 00 10
	ora $22DD.w		; 0D DD 22
	ora ($1F.b),Y		; 11 1F
	lda [$DF.b]		; A7 DF
	eor ($EB.b,X)		; 41 EB
	beq   1.b		; F0 01
	bit $1245.w		; 2C 45 12
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 057FFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 057FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 057FFF. Skipping.
.ENDS
