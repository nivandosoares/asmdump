.BANK 26 SLOT 0
.ORG $0000

.SECTION "Bank26" FORCE

	clc		; 18
	brk $00.b		; 00 00
	tax		; AA
	beq  17.b		; F0 11
	brk $09.b		; 00 09
	brk $13.b		; 00 13
	brk $09.b		; 00 09
	bvs  20.b		; 70 14
	brk $09.b		; 00 09
	bra  21.b		; 80 15
	brk $09.b		; 00 09
	bcc  22.b		; 90 16
	brk $08.b		; 00 08
	rol A		; 2A
	bra -124.b		; 80 84
	brk $A6.b		; 00 A6
	eor $CD.b,X		; 55 CD
	sbc $CDFFCD.l,X		; FF CD FF CD
	sbc $000000.l,X		; FF 00 00 00
	brk $DD.b		; 00 DD
	sbc $02FFCD.l,X		; FF CD FF 02
	brk $00.b		; 00 00
	brk $ED.b		; 00 ED
	sbc $04FFCD.l,X		; FF CD FF 04
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $06FFCD.l,X		; FF CD FF 06
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $CD.b		; 00 CD
	sbc $000008.l,X		; FF 08 00 00
	brk $1D.b		; 00 1D
	brk $CD.b		; 00 CD
	sbc $00000A.l,X		; FF 0A 00 00
	brk $2D.b		; 00 2D
	brk $CD.b		; 00 CD
	sbc $00000C.l,X		; FF 0C 00 00
	brk $3D.b		; 00 3D
	brk $CD.b		; 00 CD
	sbc $00000E.l,X		; FF 0E 00 00
	brk $4D.b		; 00 4D
	brk $CD.b		; 00 CD
	sbc $000020.l,X		; FF 20 00 00
	brk $A6.b		; 00 A6
	sbc $22FFDD.l,X		; FF DD FF 22
	brk $00.b		; 00 00
	brk $B6.b		; 00 B6
	sbc $24FFDD.l,X		; FF DD FF 24
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	sbc $26FFDD.l,X		; FF DD FF 26
	brk $00.b		; 00 00
	brk $D6.b		; 00 D6
	sbc $28FFDD.l,X		; FF DD FF 28
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	sbc $2AFFDD.l,X		; FF DD FF 2A
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $2CFFDD.l,X		; FF DD FF 2C
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $DD.b		; 00 DD
	sbc $00002E.l,X		; FF 2E 00 00
	brk $16.b		; 00 16
	brk $DD.b		; 00 DD
	sbc $000040.l,X		; FF 40 00 00
	brk $26.b		; 00 26
	brk $DD.b		; 00 DD
	sbc $000042.l,X		; FF 42 00 00
	brk $36.b		; 00 36
	brk $DD.b		; 00 DD
	sbc $000044.l,X		; FF 44 00 00
	brk $46.b		; 00 46
	brk $DD.b		; 00 DD
	sbc $000046.l,X		; FF 46 00 00
	brk $A6.b		; 00 A6
	sbc $48FFED.l,X		; FF ED FF 48
	brk $00.b		; 00 00
	brk $B6.b		; 00 B6
	sbc $4AFFED.l,X		; FF ED FF 4A
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	sbc $4CFFED.l,X		; FF ED FF 4C
	brk $00.b		; 00 00
	brk $D6.b		; 00 D6
	sbc $4EFFED.l,X		; FF ED FF 4E
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	sbc $60FFED.l,X		; FF ED FF 60
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $60FFED.l,X		; FF ED FF 60
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $ED.b		; 00 ED
	sbc $000062.l,X		; FF 62 00 00
	brk $16.b		; 00 16
	brk $ED.b		; 00 ED
	sbc $000064.l,X		; FF 64 00 00
	brk $26.b		; 00 26
	brk $ED.b		; 00 ED
	sbc $000066.l,X		; FF 66 00 00
	brk $36.b		; 00 36
	brk $ED.b		; 00 ED
	sbc $000068.l,X		; FF 68 00 00
	brk $46.b		; 00 46
	brk $ED.b		; 00 ED
	sbc $00006A.l,X		; FF 6A 00 00
	brk $A8.b		; 00 A8
	sbc $6CFFFD.l,X		; FF FD FF 6C
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	sbc $6EFFFD.l,X		; FF FD FF 6E
	brk $00.b		; 00 00
	brk $C8.b		; 00 C8
	sbc $6EFFFD.l,X		; FF FD FF 6E
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	sbc $6EFFFD.l,X		; FF FD FF 6E
	brk $00.b		; 00 00
	brk $E8.b		; 00 E8
	sbc $6EFFFD.l,X		; FF FD FF 6E
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $6EFFFD.l,X		; FF FD FF 6E
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $FD.b		; 00 FD
	sbc $00006E.l,X		; FF 6E 00 00
	brk $18.b		; 00 18
	brk $FD.b		; 00 FD
	sbc $00006E.l,X		; FF 6E 00 00
	brk $28.b		; 00 28
	brk $FD.b		; 00 FD
	sbc $00006E.l,X		; FF 6E 00 00
	brk $38.b		; 00 38
	brk $FD.b		; 00 FD
	sbc $00006E.l,X		; FF 6E 00 00
	brk $48.b		; 00 48
	brk $FD.b		; 00 FD
	sbc $000080.l,X		; FF 80 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0C.b		; 00 0C
	ora ($32.b,X)		; 01 32
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $01.b,S		; 03 01
	ora $003D07.l		; 0F 07 3D 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $08.b		; 00 08
	cop $43.b		; 02 43
	ora $6729.w,Y		; 19 29 67
	lda $325F9D.l		; AF 9D 5F 32
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $0F.b,S		; 03 0F
	ora $D47A7D.l,X		; 1F 7D 7A D4
	sbc $E348.w,Y		; F9 48 E3
	sta ($01.b,X)		; 81 01
	ora [$48.b]		; 07 48
	ora [$23.b]		; 07 23
	stz $788E.w,X		; 9E 8E 78
	sei		; 78
	bne  -8.b		; D0 F8
	rti		; 40

	beq   0.b		; F0 00
	cpx #$00.b		; E0 00
	ora $1F03.w,X		; 1D 03 1F
	bvs  -4.b		; 70 FC
	cmp ($F0.b,X)		; C1 F0
	asl $90.b		; 06 90
	brk $60.b		; 00 60
	plp		; 28
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc ($13.b,S),Y		; F3 13
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $07F8FF.l,X		; FF FF F8 07
	tsb $0010.w		; 0C 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	jsr ($FF00.w,X)		; FC 00 FF
	cpx #$9F.b		; E0 9F
	tsa		; 3B
	cop $01.b		; 02 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $1B.b		; 00 1B
	cpx #$00.b		; E0 00
	sbc $05007F.l,X		; FF 7F 00 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $00.b,S		; 03 00
	brk $10.b		; 00 10
	cpx #$02.b		; E0 02
	jsr ($FE01.w,X)		; FC 01 FE
	ldy #$1F.b		; A0 1F
	txs		; 9A
	sbc ($E3.b,X)		; E1 E3
	sec		; 38
	sbc $800C.w,Y		; F9 0C 80
	brk $7C.b		; 00 7C
	bra  15.b		; 80 0F
	beq -13.b		; F0 F3
	tsb $017E.w		; 0C 7E 01
	sbc [$70.b]		; E7 70
	sed		; F8
	dec $F7FC.w,X		; DE FC F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $03.b		; C4 03
	bit $05CC.w		; 2C CC 05
	sbc ($42.b)		; F2 42
	and $0C50.w,Y		; 39 50 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	xce		; FB
	ora [$73.b]		; 07 73
	bra -97.b		; 80 9F
	rts		; 60

	sbc $883710.l		; EF 10 37 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	tsb $8370.w		; 0C 70 83
	ora $8CC320.l		; 0F 20 C3 8C
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra 112.b		; 80 70
	jsr ($3CCF.w,X)		; FC CF 3C
	xce		; FB
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	bra -26.b		; 80 E6
	sed		; F8
	trb $007E.w		; 1C 7E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	beq  -8.b		; F0 F8
	asl $E3FF.w,X		; 1E FF E3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $04.b		; 00 04
	ora [$08.b]		; 07 08
	ora $070F00.l		; 0F 00 0F 07
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	php		; 08
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $EE.b		; 06 EE
	sbc ($00.b,X)		; E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $1E.b		; 06 1E
	sbc ($00.b,X)		; E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $62.b		; 00 62
	rts		; 60

	cli		; 58
	ora ($0B.b),Y		; 11 0B
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	sbc $1F.b,S		; E3 1F
	ora [$EC.b]		; 07 EC
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	tsb $3301.w		; 0C 01 33
	ora [$8E.b]		; 07 8E
	asl $7C39.w,X		; 1E 39 7C
	sbc ($FB.b)		; F2 FB
	cmp $F7.b		; C5 F7
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora ($0F.b,X)		; 01 0F
	ora [$3C.b]		; 07 3C
	and $C6FFF1.l,X		; 3F F1 FF C6
	jsr ($FC0C.w,X)		; FC 0C FC
	rol $1CCD.w,X		; 3E CD 1C
	and ($79.b,S),Y		; 33 79
	cmp $23E7.w		; CD E7 23
	stz $789E.w,X		; 9E 9E 78
	clc		; 18
	beq  16.b		; F0 10
	beq   0.b		; F0 00
	beq  31.b		; F0 1F
	sbc ($7F.b)		; F2 7F
	cmp $34FE.w		; CD FE 34
	jsr ($D0C0.w,X)		; FC C0 D0
	and ($D0.b),Y		; 31 D0
	and [$D0.b],Y		; 37 D0
	and $B73F00.l,X		; 3F 00 3F B7
	sbc $809FEF.l		; EF EF 9F 80
	and $027E01.l,X		; 3F 01 7E 02
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $09.b		; 00 09
	brk $CF.b		; 00 CF
	dey		; 88
	ora $7F3F10.l,X		; 1F 10 3F 7F
	ror $FCFE.w,X		; 7E FE FC
	jsr ($F800.w,X)		; FC 00 F8
	brk $F8.b		; 00 F8
	brk $F1.b		; 00 F1
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $008000.l,X		; FF 00 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000001.l,X		; FF 01 00 00
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
	sbc $FF3F00.l,X		; FF 00 3F FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	adc $00023F.l,X		; 7F 3F 02 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	tsb $0C01.w		; 0C 01 0C
	brk $0F.b		; 00 0F
	brk $FA.b		; 00 FA
	ora $FF.b,S		; 03 FF
	sbc $010701.l,X		; FF 01 07 01
	ora [$03.b]		; 07 03
	ora [$03.b]		; 07 03
	ora $000F00.l		; 0F 00 0F 00
	ora $FB0804.l		; 0F 04 08 FB
	xce		; FB
	jsr ($FEC2.w,X)		; FC C2 FE
	sbc ($01.b),Y		; F1 01
	sbc $03FF00.l,X		; FF 00 FF 03
	brk $FE.b		; 00 FE
	ora $7F.b,S		; 03 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $FF0FFF.l,X		; 3F FF 0F FF
	inc $FFFF.w,X		; FE FF FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	adc $FFFFFF.l,X		; 7F FF FF FF
	bit $03.b,X		; 34 03
	ora $0E80.w,Y		; 19 80 0E
	cpy #$07.b		; C0 07
	cpy #$FF.b		; C0 FF
	brk $3F.b		; 00 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C7C08F.l,X		; FF 8F C0 C7
	beq -63.b		; F0 C1
	sed		; F8
	cpy #$FC.b		; C0 FC
	brk $E0.b		; 00 E0
	lda $FFFF7F.l,X		; BF 7F FF FF
	sbc $3E41FF.l,X		; FF FF 41 3E
	jsr $909F.w		; 20 9F 90
	eor $A8234C.l		; 4F 4C 23 A8
	ora $F3FFFF.l,X		; 1F FF FF F3
	sbc $FFFF84.l,X		; FF 84 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DC.b		; 00 DC
	brk $70.b		; 00 70
	ora [$F7.b]		; 07 F7
	sbc [$FF.b],Y		; F7 FF
	sbc ($99.b,S),Y		; F3 99
	cpx #$87.b		; E0 87
	sta $0EC130.l		; 8F 30 C1 0E
	sbc ($00.b)		; F2 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FD186F.l,X		; FF 6F 18 FD
	ora $FD.b,S		; 03 FD
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C200FF.l,X		; FF FF 00 C2
	cpx #$F8.b		; E0 F8
	inc $1F1F.w,X		; FE 1F 1F
	brk $80.b		; 00 80
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	beq  62.b		; F0 3E
	sbc $60BF07.l,X		; FF 07 BF 60
	rti		; 40

	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $00FF80.l,X		; FF 80 FF 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $88.b		; 00 88
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	cpy #$F0.b		; C0 F0
	sei		; 78
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $000080.l,X		; 7F 80 00 00
	tsb $0B.b		; 04 0B
	ora [$08.b]		; 07 08
	tsb $0B.b		; 04 0B
	jsr $E03F.w		; 20 3F E0
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $0CFF00.l,X		; FF 00 FF 0C
	brk $07.b		; 00 07
	brk $14.b		; 00 14
	brk $40.b		; 00 40
	bra -32.b		; 80 E0
	beq -128.b		; F0 80
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $23.b		; 00 23
	cmp $01FE01.l,X		; DF 01 FE 01
	inc $906F.w,X		; FE 6F 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0100.w		; 20 00 01
	brk $01.b		; 00 01
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	ora ($0E.b,X)		; 01 0E
	ora $0000.w		; 0D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cop $0D.b		; 02 0D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $6F770D.l		; 0F 0D 77 6F
	stz $707F.w		; 9C 7F 70
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($03.b,X)		; 01 03
	ora $6F17.w		; 0D 17 6F
	ldy $705F.w,X		; BC 5F 70
	plx		; FA
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	and $6F33.w,X		; 3D 33 6F
	ora $C6FFFF.l,X		; 1F FF FF C6
	plx		; FA
	ora [$F0.b]		; 07 F0
	and $0000E0.l,X		; 3F E0 00 00
	brk $03.b		; 00 03
	ora $EF33.w		; 0D 33 EF
	ora $FDFFFF.l,X		; 1F FF FF FD
	cpy #$08.b		; C0 08
	bra   0.b		; 80 00
	and $1F.b,S		; 23 1F
	trb $8FF3.w		; 1C F3 8F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FD7F.w,X		; FD 7F FD
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	trb $8F73.w		; 1C 73 8F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta $01.b,S		; 83 01
	cop $00.b		; 02 00
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	cmp $FFFF3F.l		; CF 3F FF FF
	sbc $FFC0FF.l,X		; FF FF C0 FF
	cpx #$FF.b		; E0 FF
	bra 127.b		; 80 7F
	ldy #$3F.b		; A0 3F
	beq  31.b		; F0 1F
	cmp $FFFF3F.l		; CF 3F FF FF
	sbc $FFC0FF.l,X		; FF FF C0 FF
	cpx #$FF.b		; E0 FF
	cpx #$1F.b		; E0 1F
	bvc  15.b		; 50 0F
	tsb $CF13.w		; 0C 13 CF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $489768.l,X		; FF 68 97 48
	lda [$68.b],Y		; B7 68
	lda [$61.b],Y		; B7 61
	cmp $CFFF39.l,X		; DF 39 FF CF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $78FF78.l,X		; FF 78 FF 78
	sbc $71DF78.l,X		; FF 78 DF 71
	sbc $C339FF.l,X		; FF FF 39 C3
	xce		; FB
	sbc $FFD0FF.l		; EF FF D0 FF
	ldy #$FF.b		; A0 FF
	cpy #$FF.b		; C0 FF
	rti		; 40

	sbc $E0FF80.l,X		; FF 80 FF E0
	sta $E0F8C4.l,X		; 9F C4 F8 E0
	beq -60.b		; F0 C4
	inx		; E8
	bra -49.b		; 80 CF
	bcc -113.b		; 90 8F
	ora $001F80.l,X		; 1F 80 1F 00
	rts		; 60

	brk $9F.b		; 00 9F
	bra  -1.b		; 80 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7F0060.l,X		; FF 60 00 7F
	adc $001F00.l,X		; 7F 00 1F 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ora $FF.b,S		; 03 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FEC03E.l,X		; FF 3E C0 FE
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $7F.b		; 00 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00F00F.l,X		; FF 0F F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $0000CF.l,X		; FF CF 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $003FFF.l,X		; FF FF 3F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $7CFFFF.l,X		; FF FF FF 7C
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	cpy #$C0.b		; C0 C0
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $FF60E0.l,X		; FF E0 60 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00009F.l,X		; FF 9F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	sbc [$C8.b],Y		; F7 C8
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $10FF10.l,X		; FF 10 FF 10
	sbc $10FF10.l,X		; FF 10 FF 10
	sbc $C1F7FF.l,X		; FF FF F7 C1
	inc $FF.b,X		; F6 FF
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	brk $6B.b		; 00 6B
	sty $6B.b,X		; 94 6B
	sty $2F.b,X		; 94 2F
	bne   1.b		; D0 01
	inc $FE01.w,X		; FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	rtl		; 6B

	brk $6B.b		; 00 6B
	brk $2F.b		; 00 2F
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	brk $03.b		; 00 03
	ora $0A.b,S		; 03 0A
	ora #$131F.w		; 09 1F 13
	rol $2827.w,X		; 3E 27 28
	ora $007F80.l,X		; 1F 80 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $06.b,S		; 03 06
	ora #$130F.w		; 09 0F 13
	asl $6827.w,X		; 1E 27 68
	asl $6080.w,X		; 1E 80 60
	and $EC37.w,Y		; 39 37 EC
	sta $C07FA0.l,X		; 9F A0 7F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $6C3709.l,X		; FF 09 37 6C
	sta $C07EA0.l,X		; 9F A0 7E C0
	beq   0.b		; F0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $FF03.w,X		; FD 03 FF
	ora [$FE.b]		; 07 FE
	eor [$FE.b]		; 47 FE
	sbc [$FC.b]		; E7 FC
	ora $F0C0F8.l		; 0F F8 C0 F0
	brk $80.b		; 00 80
	cop $00.b		; 02 00
	brk $01.b		; 00 01
	brk $42.b		; 00 42
	rti		; 40

	sep #$40		; E2 40
	mvp $00,$00		; 44 00 00
	adc $80FFC0.l,X		; 7F C0 FF 80
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $4C.b		; 00 4C
	brk $10.b		; 00 10
	brk $A0.b		; 00 A0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	ora $FC05FE.l		; 0F FE 05 FC
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	iny		; C8
	cop $64.b		; 02 64
	cop $10.b		; 02 10
	ora ($08.b,X)		; 01 08
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	bmi  -1.b		; 30 FF
	bmi  -1.b		; 30 FF
	bra  79.b		; 80 4F
	sbc $B0FFB0.l		; EF B0 FF B0
	sbc $7FFFFF.l,X		; FF FF FF 7F
	inc $0001.w,X		; FE 01 00
	bmi   0.b		; 30 00
	bmi -112.b		; 30 90
	bmi 127.b		; 30 7F
	bpl  79.b		; 10 4F
	bcs   0.b		; B0 00
	sbc $C00000.l,X		; FF 00 00 C0
	and $FFC0FF.l,X		; 3F FF C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	sbc $C03F3F.l,X		; FF 3F 3F C0
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	sbc $0000C0.l,X		; FF C0 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $100000.l,X		; FF 00 00 10
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $93FFFF.l,X		; FF FF FF 93
	jmp ($00FF.w,X)		; 7C FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cmp [$3F.b]		; C7 3F
	sbc $00DF00.l,X		; FF 00 DF 00
	cmp $00DF00.l,X		; DF 00 DF 00
	sbc $BFBFFF.l,X		; FF FF BF BF
	sbc $1FE700.l		; EF 00 E7 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	rti		; 40

	brk $F0.b		; 00 F0
	sbc $20FF00.l,X		; FF 00 FF 20
	and $A0BFA0.l,X		; 3F A0 BF A0
	lda $E0FFE0.l,X		; BF E0 FF E0
	sbc $F7BF60.l,X		; FF 60 BF F7
	sed		; F8
	sed		; F8
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bmi  64.b		; 30 40
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi -64.b		; 30 C0
	bmi   0.b		; 30 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	sbc $F904.w,Y		; F9 04 F9
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FD.b,S		; 03 FD
	ora [$FA.b]		; 07 FA
	ora $0016F4.l		; 0F F4 16 00
	asl $00.b		; 06 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $01.b		; 02 01
	tsb $02.b		; 04 02
	php		; 08
	tsb $00.b		; 04 00
	sbc $10FF00.l,X		; FF 00 FF 10
	beq  79.b		; F0 4F
	brk $FF.b		; 00 FF
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $23FF00.l,X		; FF 00 FF 23
	and $FF3FF8.l,X		; 3F F8 3F FF
	asl $02FE.w		; 0E FE 02
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp [$03.b]		; C7 03
	brk $33.b		; 00 33
	ora ($0C.b,X)		; 01 0C
	ora ($02.b,X)		; 01 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $60FFC0.l,X		; FF C0 FF 60
	brk $00.b		; 00 00
	inc $F000.w,X		; FE 00 F0
	inc $E018.w,X		; FE 18 E0
	sbc $007F00.l,X		; FF 00 7F 00
	and $401F80.l,X		; 3F 80 1F 40
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl A		; 0A
	sbc $F5FF05.l,X		; FF 05 FF F5
	ora $F00FF5.l		; 0F F5 0F F0
	ora $000FF0.l		; 0F F0 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $05.b		; 05 05
	ora $F5.b		; 05 F5
	ora $F5.b		; 05 F5
	ora $F0.b		; 05 F0
	ora $F0.b		; 05 F0
	ora $03.b		; 05 03
	sbc $FD03.w,X		; FD 03 FD
	sbc $FD57FD.l,X		; FF FD 57 FD
	eor [$FD.b],Y		; 57 FD
	eor [$FD.b],Y		; 57 FD
	ora $FD.b,S		; 03 FD
	ora $FD.b,S		; 03 FD
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	lsr $55.b,X		; 56 55
	lsr $55.b,X		; 56 55
	lsr $55.b,X		; 56 55
	lsr $55.b,X		; 56 55
	cop $55.b		; 02 55
	cop $55.b		; 02 55
	brk $FF.b		; 00 FF
	sbc $F7F9.w,Y		; F9 F9 F7
	sbc $E0.b,X		; F5 E0
	sbc $7FFFC0.l,X		; FF C0 FF 7F
	rti		; 40

	adc $FF7FFF.l,X		; 7F FF 7F FF
	brk $80.b		; 00 80
	asl $01.b		; 06 01
	asl A		; 0A
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	bra -65.b		; 80 BF
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   2.b		; 80 02
	jsr ($FCFD.w,X)		; FC FD FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0003FF.l,X		; FF FF 03 00
	ora $FC.b,S		; 03 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $F80FF8.l,X		; FF F8 0F F8
	ora $F80FF8.l		; 0F F8 0F F8
	ora [$F0.b]		; 07 F0
	sbc $F0F718.l,X		; FF 18 F7 F0
	sbc [$E0.b]		; E7 E0
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $E0.b		; 00 E0
	php		; 08
	brk $08.b		; 00 08
	bpl   8.b		; 10 08
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	lda $3FBF3F.l,X		; BF 3F BF 3F
	lda $7FFF3F.l,X		; BF 3F FF 7F
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	rti		; 40

	and $403F40.l,X		; 3F 40 3F 40
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $1F3F3F.l,X		; 3F 3F 3F 1F
	and $071F0F.l,X		; 3F 0F 1F 07
	sta $4F4080.l,X		; 9F 80 40 4F
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	sed		; F8
	brk $7F.b		; 00 7F
	bra -80.b		; 80 B0
	rti		; 40

	rts		; 60

	lda $FFF08F.l,X		; BF 8F F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	bmi -81.b		; 30 AF
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C1.b		; 00 C1
	rol $00FF.w,X		; 3E FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $30FFE8.l,X		; 1F E8 FF 30
	cmp $60FF10.l,X		; DF 10 FF 60
	lda $40FF20.l,X		; BF 20 FF 40
	sbc $007FC0.l,X		; FF C0 7F 00
	bpl   8.b		; 10 08
	cpy #$10.b		; C0 10
	cpx #$10.b		; E0 10
	bra  32.b		; 80 20
	cpy #$20.b		; C0 20
	bra  64.b		; 80 40
	brk $C0.b		; 00 C0
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1FFF30.l,X		; FF 30 FF 1F
	sbc [$17.b],Y		; F7 17
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	xce		; FB
	phd		; 0B
	sbc $07FF07.l,X		; FF 07 FF 07
	ora $100020.l		; 0F 20 00 10
	php		; 08
	bpl   0.b		; 10 00
	php		; 08
	brk $08.b		; 00 08
	tsb $08.b		; 04 08
	brk $07.b		; 00 07
	brk $04.b		; 00 04
	beq  15.b		; F0 0F
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	sbc $FF.b,X		; F5 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	beq   5.b		; F0 05
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $FD.b,S		; 03 FD
	ora $FD.b,S		; 03 FD
	ora $FD.b,S		; 03 FD
	eor [$FD.b],Y		; 57 FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	inc $FCFE.w,X		; FE FE FC
	jsr ($5502.w,X)		; FC 02 55
	cop $55.b		; 02 55
	cop $55.b		; 02 55
	cop $A1.b		; 02 A1
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	brk $FE.b		; 00 FE
	cop $00.b		; 02 00
	rti		; 40

	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	brk $40.b		; 00 40
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $00BF00.l,X		; 1F 00 BF 00
	and $00FF00.l,X		; 3F 00 FF 00
	and $000040.l,X		; 3F 40 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	beq   8.b		; F0 08
	beq  12.b		; F0 0C
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	jsr $2020.w		; 20 20 20
	jsr $1020.w		; 20 20 10
	bpl   0.b		; 10 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	rti		; 40

	ora $601F60.l,X		; 1F 60 1F 60
	ora $100F60.l,X		; 1F 60 0F 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $00003F.l,X		; 3F 3F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$3F.b		; C0 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	xce		; FB
	php		; 08
	bit $C7.b,X		; 34 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc [$00.b],Y		; F7 00
	sec		; 38
	brk $BF.b		; 00 BF
	lda $7F3F3F.l,X		; BF 3F 3F 7F
	adc $E37E7E.l,X		; 7F 7E 7E E3
	sbc $00.b,S		; E3 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $C00040.l,X		; FF 40 00 C0
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	brk $1C.b		; 00 1C
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $C7FFFF.l,X		; FF FF FF C7
	cmp [$7F.b]		; C7 7F
	adc $01E1E1.l,X		; 7F E1 E1 01
	ora ($07.b,X)		; 01 07
	xce		; FB
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	ora [$80.b]		; 07 80
	adc $FEE11E.l,X		; 7F 1E E1 FE
	ora ($FC.b,X)		; 01 FC
	ora ($0F.b,X)		; 01 0F
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra   3.b		; 80 03
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	adc $008380.l,X		; 7F 80 83 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $80FF00.l,X		; 7F 00 FF 80
	sbc $80FF80.l,X		; FF 80 FF 80
	adc $007F00.l,X		; 7F 00 7F 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $05FD07.l,X		; FF 07 FD 05
	sbc $02FE03.l,X		; FF 03 FE 02
	jsr ($FD00.w,X)		; FC 00 FD
	ora ($FD.b,X)		; 01 FD
	ora ($FD.b,X)		; 01 FD
	ora ($00.b,X)		; 01 00
	tsb $02.b		; 04 02
	tsb $00.b		; 04 00
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $FF.b,S		; 03 FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FCFC00.l,X		; FF 00 FC FC
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	tsb $04.b		; 04 04
	cop $00.b		; 02 00
	asl $FE00.w		; 0E 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	cop $F8.b		; 02 F8
	tsb $FF.b		; 04 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	ora ($FB.b,X)		; 01 FB
	ora $F0.b,S		; 03 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $01.b,S		; 03 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cop $60.b		; 02 60
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $02FC00.l,X		; FF 00 FC 02
	bra  96.b		; 80 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	jsr ($8000.w,X)		; FC 00 80
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sed		; F8
	brk $F8.b		; 00 F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $06.b		; 00 06
	brk $F5.b		; 00 F5
	tsb $FCE5.w		; 0C E5 FC
	inc $FF.b,X		; F6 FF
	sbc $FF.b		; E5 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $E5FF.w,X		; FE FF E5
	sbc $000001.l,X		; FF 01 00 00
	brk $04.b		; 00 04
	brk $E5.b		; 00 E5
	sbc $004000.l,X		; FF 00 40 00
	brk $F5.b		; 00 F5
	sbc $02FFED.l,X		; FF ED FF 02
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $03FFED.l,X		; FF ED FF 03
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $ED.b		; 00 ED
	sbc $004002.l,X		; FF 02 40 00
	brk $F6.b		; 00 F6
	sbc $04FFF5.l,X		; FF F5 FF 04
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $05FFF5.l,X		; FF F5 FF 05
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F5.b		; 00 F5
	sbc $004004.l,X		; FF 04 40 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $41.b		; 00 41
	brk $43.b		; 00 43
	brk $83.b		; 00 83
	php		; 08
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $0F.b,S		; 03 0F
	tsb $1F.b		; 04 1F
	php		; 08
	and $247F14.l,X		; 3F 14 7F 24
	adc $FCFF28.l,X		; 7F 28 FF FC
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	brk $86.b		; 00 86
	brk $87.b		; 00 87
	sei		; 78
	tda		; 7B
	jsr ($FC00.w,X)		; FC 00 FC
	jsr ($03FF.w,X)		; FC FF 03
	sbc $30FF00.l,X		; FF 00 FF 30
	sbc $787B30.l,X		; FF 30 7B 78
	sbc $4387FC.l,X		; FF FC 87 43
	tsb $0FC6.w		; 0C C6 0F
	sta $1B.b,S		; 83 1B
	bra  24.b		; 80 18
.ACCU 16
.INDEX 16
	rep #$38		; C2 38
	cmp ($28.b,S),Y		; D3 28
	eor ($08.b,S),Y		; 53 08
	cli		; 58
	ora $1C.b		; 05 1C
	adc $3FF92F.l,X		; 7F 2F F9 3F
	jsr ($FF39.w,X)		; FC 39 FF
	sec		; 38
	sbc $FC38.w,X		; FD 38 FC
	sec		; 38
	adc $3C7F1D.l,X		; 7F 1D 7F 3C
	sbc $DBFF66.l,X		; FF 66 FF DB
	sbc $5AF7DB.l,X		; FF DB F7 5A
	sbc [$66.b]		; E7 66
	bit $817E.w,X		; 3C 7E 81
	sbc $C3FF99.l,X		; FF 99 FF C3
	sbc $24FF99.l,X		; FF 99 FF 24
	sbc $BDFF2C.l,X		; FF 2C FF BD
	sbc $FFFFDB.l,X		; FF DB FF FF
	sbc $2AD366.l,X		; FF 66 D3 2A
	eor $0B6610.l		; 4F 10 66 0B
	and ($0E.b),Y		; 31 0E
	ora $0E03.w,Y		; 19 03 0E
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $3F.b		; 00 3F
	sbc $7F3F.w,X		; FD 3F 7F
	ora $3F0F7D.l,X		; 1F 7D 0F 3F
	ora $1E.b,S		; 03 1E
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	cmp $843349.l		; CF 49 33 84
	adc $0203.w,Y		; 79 03 02
	sta $FE.b		; 85 FE
	ora $79.b,S		; 03 79
	jsr ($0003.w,X)		; FC 03 00
	inc $FF00.w,X		; FE 00 FF
	ldx $CF.b,Y		; B6 CF
	sbc $CFCE03.l,X		; FF 03 CE CF
	sbc $FCFDFF.l,X		; FF FF FD FC
	sta [$00.b]		; 87 00
	sbc $09FE00.l,X		; FF 00 FE 09
	brk $09.b		; 00 09
	brk $F5.b		; 00 F5
	tsb $FCE5.w		; 0C E5 FC
	inc $FF.b,X		; F6 FF
	sbc $FF.b		; E5 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $E5FF.w,X		; FE FF E5
	sbc $000001.l,X		; FF 01 00 00
	brk $06.b		; 00 06
	brk $E5.b		; 00 E5
	sbc $000002.l,X		; FF 02 00 00
	brk $F5.b		; 00 F5
	sbc $03FFED.l,X		; FF ED FF 03
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $04FFED.l,X		; FF ED FF 04
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $ED.b		; 00 ED
	sbc $000005.l,X		; FF 05 00 00
	brk $F6.b		; 00 F6
	sbc $06FFF5.l,X		; FF F5 FF 06
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $07FFF5.l,X		; FF F5 FF 07
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $F5.b		; 00 F5
	sbc $000008.l,X		; FF 08 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $42.b		; 00 42
	brk $86.b		; 00 86
	php		; 08
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $0F.b,S		; 03 0F
	tsb $1F.b		; 04 1F
	php		; 08
	and $247F15.l,X		; 3F 15 7F 24
	adc $FF28.w,X		; 7D 28 FF
	jsr ($0300.w,X)		; FC 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $1E.b		; 00 1E
	jsr $F026.w		; 20 26 F0
	sbc ($FF.b),Y		; F1 FF
	brk $FC.b		; 00 FC
	jsr ($03FF.w,X)		; FC FF 03
	sbc $C0FF00.l,X		; FF 00 FF C0
	sbc $F1FFE0.l		; EF E0 FF F1
	cmp $000EFF.l,X		; DF FF 0E 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $84.b		; 00 84
	cpy #$0000.w		; C0 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	bra -32.b		; 80 E0
	rti		; 40

	beq  32.b		; F0 20
	sed		; F8
	bcc  -8.b		; 90 F8
	bne 124.b		; D0 7C
	eor $0C.b,S		; 43 0C
	dec $09.b		; C6 09
	sta [$1F.b]		; 87 1F
	sta $1F.b,S		; 83 1F
	cpy #$D638.w		; C0 38 D6
	plp		; 28
	eor ($0C.b,S),Y		; 53 0C
	eor $1C04.w,Y		; 59 04 1C
	adc $3FFF29.l,X		; 7F 29 FF 3F
	sed		; F8
	and $FF3BFC.l,X		; 3F FC 3B FF
	sec		; 38
	sbc $7E3C.w,X		; FD 3C 7E
	trb $7D7F.w		; 1C 7F 7D
	sbc $DAFF66.l,X		; FF 66 FF DA
	sbc $DAF6DA.l,X		; FF DA F6 DA
	sbc [$67.b]		; E7 67
	ldy $403F.w,X		; BC 3F 40
	sec		; 38
	phk		; 4B
	sbc $99FF82.l,X		; FF 82 FF 99
	sbc $2DFF25.l,X		; FF 25 FF 2D
	sbc $DBFF3D.l,X		; FF 3D FF DB
	sbc $F77FFF.l,X		; FF FF 7F F7
	.db $82, $F0, $03		; 82 F0 03
	bcc  65.b		; 90 41
	clc		; 18
	cmp ($18.b,X)		; C1 18
	eor $1C.b,S		; 43 1C
	phb		; 8B
	pei ($EA.b)		; D4 EA
	bvs  -6.b		; 70 FA
	brk $F8.b		; 00 F8
	ror $FFB4.w,X		; 7E B4 FF
	trb $1CBF.w		; 1C BF 1C
	and $DCFF9C.l,X		; 3F 9C FF DC
	adc $F89EFC.l,X		; 7F FC 9E F8
	inc $2CD0.w,X		; FE D0 2C
	pha		; 48
	trb $66.b		; 14 66
	phd		; 0B
	and ($0E.b,S),Y		; 33 0E
	ora $0E03.w,Y		; 19 03 0E
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $3D.b		; 00 3D
	sbc $1F7F3F.l,X		; FF 3F 7F 1F
	adc $3D0F.w,X		; 7D 0F 3D
	ora $1E.b,S		; 03 1E
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	stz $A1.b		; 64 A1
	dec $D120.w		; CE 20 D1
	eor ($C2.b,X)		; 41 C2
	adc $FE.b		; 65 FE
	ora $79.b,S		; 03 79
	jsr ($0003.w,X)		; FC 03 00
	inc $F300.w,X		; FE 00 F3
	cmp $E3F3E1.l,X		; DF E1 F3 E3
	ldx $BFEF.w		; AE EF BF
	sbc $87FCFD.l,X		; FF FD FC 87
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	jmp ($C890.w)		; 6C 90 C8
	jsr $4098.w		; 20 98 40
	bmi -64.b		; 30 C0
	rts		; 60

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	jsr ($F8F0.w,X)		; FC F0 F8
	cpx #$C0F8.w		; E0 F8 C0
	beq   0.b		; F0 00
	cpx #$C000.w		; E0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$0600.w		; 09 00 06
	brk $F5.b		; 00 F5
	tsb $FCE5.w		; 0C E5 FC
	inc $FF.b,X		; F6 FF
	sbc $FF.b		; E5 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $E5FF.w,X		; FE FF E5
	sbc $000001.l,X		; FF 01 00 00
	brk $04.b		; 00 04
	brk $E5.b		; 00 E5
	sbc $004000.l,X		; FF 00 40 00
	brk $F5.b		; 00 F5
	sbc $02FFED.l,X		; FF ED FF 02
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $03FFED.l,X		; FF ED FF 03
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $ED.b		; 00 ED
	sbc $004002.l,X		; FF 02 40 00
	brk $F6.b		; 00 F6
	sbc $04FFF5.l,X		; FF F5 FF 04
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $05FFF5.l,X		; FF F5 FF 05
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F5.b		; 00 F5
	sbc $004004.l,X		; FF 04 40 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $41.b		; 00 41
	brk $43.b		; 00 43
	brk $83.b		; 00 83
	php		; 08
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $0F.b,S		; 03 0F
	tsb $1F.b		; 04 1F
	php		; 08
	and $247F14.l,X		; 3F 14 7F 24
	adc $FCFF28.l,X		; 7F 28 FF FC
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	brk $86.b		; 00 86
	brk $87.b		; 00 87
	sei		; 78
	tda		; 7B
	jsr ($FC00.w,X)		; FC 00 FC
	jsr ($03FF.w,X)		; FC FF 03
	sbc $30FF00.l,X		; FF 00 FF 30
	sbc $787B30.l,X		; FF 30 7B 78
	sbc $4387FC.l,X		; FF FC 87 43
	tsb $0FC6.w		; 0C C6 0F
	sta $1B.b,S		; 83 1B
	bra  24.b		; 80 18
.ACCU 16
.INDEX 16
	rep #$38		; C2 38
	cmp ($28.b,S),Y		; D3 28
	eor ($08.b,S),Y		; 53 08
	cli		; 58
	ora $1C.b		; 05 1C
	adc $3FF92F.l,X		; 7F 2F F9 3F
	jsr ($FF39.w,X)		; FC 39 FF
	sec		; 38
	sbc $FC38.w,X		; FD 38 FC
	sec		; 38
	adc $3C7F1D.l,X		; 7F 1D 7F 3C
	sbc $DBFF66.l,X		; FF 66 FF DB
	sbc $5AF7DB.l,X		; FF DB F7 5A
	sbc [$66.b]		; E7 66
	bit $817E.w,X		; 3C 7E 81
	sbc $C3FF99.l,X		; FF 99 FF C3
	sbc $24FF99.l,X		; FF 99 FF 24
	sbc $BDFF2C.l,X		; FF 2C FF BD
	sbc $FFFFDB.l,X		; FF DB FF FF
	sbc $2AD366.l,X		; FF 66 D3 2A
	eor $0B6610.l		; 4F 10 66 0B
	and ($0E.b),Y		; 31 0E
	ora $0E03.w,Y		; 19 03 0E
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $3F.b		; 00 3F
	sbc $7F3F.w,X		; FD 3F 7F
	ora $3F0F7D.l,X		; 1F 7D 0F 3F
	ora $1E.b,S		; 03 1E
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	cmp $843349.l		; CF 49 33 84
	adc $0203.w,Y		; 79 03 02
	sta $FE.b		; 85 FE
	ora $79.b,S		; 03 79
	jsr ($0003.w,X)		; FC 03 00
	inc $FF00.w,X		; FE 00 FF
	ldx $CF.b,Y		; B6 CF
	sbc $CFCE03.l,X		; FF 03 CE CF
	sbc $FCFDFF.l,X		; FF FF FD FC
	sta [$00.b]		; 87 00
	sbc $09FE00.l,X		; FF 00 FE 09
	brk $06.b		; 00 06
	brk $F5.b		; 00 F5
	tsb $FCE5.w		; 0C E5 FC
	inc $FF.b,X		; F6 FF
	sbc $FF.b		; E5 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $E5FF.w,X		; FE FF E5
	sbc $000001.l,X		; FF 01 00 00
	brk $04.b		; 00 04
	brk $E5.b		; 00 E5
	sbc $004000.l,X		; FF 00 40 00
	brk $F5.b		; 00 F5
	sbc $02FFED.l,X		; FF ED FF 02
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $03FFED.l,X		; FF ED FF 03
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $ED.b		; 00 ED
	sbc $004002.l,X		; FF 02 40 00
	brk $F6.b		; 00 F6
	sbc $04FFF5.l,X		; FF F5 FF 04
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $05FFF5.l,X		; FF F5 FF 05
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F5.b		; 00 F5
	sbc $004004.l,X		; FF 04 40 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $41.b		; 00 41
	brk $43.b		; 00 43
	brk $83.b		; 00 83
	php		; 08
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $0F.b,S		; 03 0F
	tsb $1F.b		; 04 1F
	php		; 08
	and $247F14.l,X		; 3F 14 7F 24
	adc $FCFF28.l,X		; 7F 28 FF FC
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	brk $86.b		; 00 86
	brk $87.b		; 00 87
	sei		; 78
	tda		; 7B
	jsr ($FC00.w,X)		; FC 00 FC
	jsr ($03FF.w,X)		; FC FF 03
	sbc $30FF00.l,X		; FF 00 FF 30
	sbc $787B30.l,X		; FF 30 7B 78
	sbc $4387FC.l,X		; FF FC 87 43
	tsb $0FC6.w		; 0C C6 0F
	sta $1B.b,S		; 83 1B
	bra  24.b		; 80 18
.ACCU 16
.INDEX 16
	rep #$38		; C2 38
	cmp ($28.b,S),Y		; D3 28
	eor ($08.b,S),Y		; 53 08
	cli		; 58
	ora $1C.b		; 05 1C
	adc $3FF92F.l,X		; 7F 2F F9 3F
	jsr ($FF39.w,X)		; FC 39 FF
	sec		; 38
	sbc $FC38.w,X		; FD 38 FC
	sec		; 38
	adc $3C7F1D.l,X		; 7F 1D 7F 3C
	sbc $DBFF66.l,X		; FF 66 FF DB
	sbc $5AF7DB.l,X		; FF DB F7 5A
	sbc [$66.b]		; E7 66
	bit $817E.w,X		; 3C 7E 81
	sbc $C3FF99.l,X		; FF 99 FF C3
	sbc $24FF99.l,X		; FF 99 FF 24
	sbc $BDFF2C.l,X		; FF 2C FF BD
	sbc $FFFFDB.l,X		; FF DB FF FF
	sbc $2AD366.l,X		; FF 66 D3 2A
	eor $0B6610.l		; 4F 10 66 0B
	and ($0E.b),Y		; 31 0E
	ora $0E03.w,Y		; 19 03 0E
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $3F.b		; 00 3F
	sbc $7F3F.w,X		; FD 3F 7F
	ora $3F0F7D.l,X		; 1F 7D 0F 3F
	ora $1E.b,S		; 03 1E
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	cmp $843349.l		; CF 49 33 84
	adc $0203.w,Y		; 79 03 02
	sta $FE.b		; 85 FE
	ora $79.b,S		; 03 79
	jsr ($0003.w,X)		; FC 03 00
	inc $FF00.w,X		; FE 00 FF
	ldx $CF.b,Y		; B6 CF
	sbc $CFCE03.l,X		; FF 03 CE CF
	sbc $FCFDFF.l,X		; FF FF FD FC
	sta [$00.b]		; 87 00
	sbc $08FE00.l,X		; FF 00 FE 08
	brk $08.b		; 00 08
	brk $F2.b		; 00 F2
	ora ($D0.b,S),Y		; 13 D0
	jmp.w [$FFF6]		; DC F6 FF
	bne  -1.b		; D0 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	inc $D0FF.w,X		; FE FF D0
	sbc $000201.l,X		; FF 01 02 00
	brk $06.b		; 00 06
	brk $D0.b		; 00 D0
	sbc $000202.l,X		; FF 02 02 00
	brk $0E.b		; 00 0E
	brk $D0.b		; 00 D0
	sbc $000203.l,X		; FF 03 02 00
	brk $F2.b		; 00 F2
	sbc $04FFD8.l,X		; FF D8 FF 04
	cop $00.b		; 02 00
	brk $FA.b		; 00 FA
	sbc $05FFD8.l,X		; FF D8 FF 05
	cop $00.b		; 02 00
	brk $02.b		; 00 02
	brk $D8.b		; 00 D8
	sbc $000206.l,X		; FF 06 02 00
	brk $0A.b		; 00 0A
	brk $D8.b		; 00 D8
	sbc $000207.l,X		; FF 07 02 00
	brk $03.b		; 00 03
	ora $07.b,S		; 03 07
	tsb $0F.b		; 04 0F
	php		; 08
	ora $0F1F07.l		; 0F 07 1F 0F
	and $3F7F1F.l,X		; 3F 1F 7F 3F
	rti		; 40

	adc $0F0003.l,X		; 7F 03 00 0F
	phd		; 0B
	ora $181F07.l		; 0F 07 1F 18
	and $607F30.l,X		; 3F 30 7F 60
	sbc $BFFFC0.l,X		; FF C0 FF BF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF01FE.l,X		; FF FE 01 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FEFF01.l,X		; FF 01 FF FE
	sed		; F8
	jsr ($00FF.w,X)		; FC FF 00
	sbc $BFFF3C.l,X		; FF 3C FF BF
	sbc $7F877F.l,X		; FF 7F 87 7F
	cop $FF.b		; 02 FF
	brk $06.b		; 00 06
	sbc $FFFF07.l,X		; FF 07 FF FF
	sbc $40FFC3.l,X		; FF C3 FF 40
	sbc $F8FF80.l,X		; FF 80 FF F8
	sbc $FFFFFD.l,X		; FF FD FF FF
	brk $00.b		; 00 00
	cpx #$F830.w		; E0 30 F8
	php		; 08
	sed		; F8
	cpy #$F8F0.w		; C0 F0 F8
	bmi -16.b		; 30 F0
	bmi -16.b		; 30 F0
	brk $30.b		; 00 30
	brk $80.b		; 00 80
	beq -36.b		; F0 DC
	sed		; F8
	pea $3CF8.w		; F4 F8 3C
	sed		; F8
	php		; 08
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	beq -16.b		; F0 F0
	php		; 08
	ora $101000.l		; 0F 00 10 10
	bvc  31.b		; 50 1F
	eor $008000.l,X		; 5F 00 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora [$3F.b],Y		; 17 3F
	and $1F6F10.l,X		; 3F 10 6F 1F
	rts		; 60

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $00E0.w		; 20 E0 00
	jsr $7F3F.w		; 20 3F 7F
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cmp $7FFFE0.l,X		; DF E0 FF 7F
	cpy #$20C0.w		; C0 C0 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $26.b		; 00 26
	brk $00.b		; 00 00
	jsr ($00FE.w,X)		; FC FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $FE46.w,X		; FE 46 FE
	inc $0002.w,X		; FE 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	ldy $F0.b		; A4 F0
	ora ($00.b),Y		; 11 00
	php		; 08
	sec		; 38
	ora ($00.b,S),Y		; 13 00
	php		; 08
	bra  20.b		; 80 14
	brk $08.b		; 00 08
	iny		; C8
	ora $00.b,X		; 15 00
	php		; 08
	bpl  23.b		; 10 17
	brk $09.b		; 00 09
	bra  24.b		; 80 18
	brk $09.b		; 00 09
	beq  25.b		; F0 19
	brk $09.b		; 00 09
	rts		; 60

	tas		; 1B
	brk $09.b		; 00 09
	bne  28.b		; D0 1C
	brk $09.b		; 00 09
	rti		; 40

	asl $0900.w,X		; 1E 00 09
	bcs  31.b		; B0 1F
	brk $09.b		; 00 09
	jsr $0021.w		; 20 21 00
	ora #$2290.w		; 09 90 22
	brk $09.b		; 00 09
	brk $24.b		; 00 24
	brk $09.b		; 00 09
	bvs  37.b		; 70 25
	brk $09.b		; 00 09
	cpx #$0026.w		; E0 26 00
	ora #$2850.w		; 09 50 28
	brk $09.b		; 00 09
	bit $80.b		; 24 80
	sty $00.b		; 84 00
	lda #$C852.w		; A9 52 C8
	brk $A9.b		; 00 A9
	sbc $00FFF1.l,X		; FF F1 FF 00
	brk $00.b		; 00 00
	brk $B9.b		; 00 B9
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $C9.b		; 00 C9
	sbc $04FFF1.l,X		; FF F1 FF 04
	brk $00.b		; 00 00
	brk $D9.b		; 00 D9
	sbc $06FFF1.l,X		; FF F1 FF 06
	brk $00.b		; 00 00
	brk $E9.b		; 00 E9
	sbc $08FFF1.l,X		; FF F1 FF 08
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $08FFF1.l,X		; FF F1 FF 08
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $F1.b		; 00 F1
	sbc $00000A.l,X		; FF 0A 00 00
	brk $19.b		; 00 19
	brk $F1.b		; 00 F1
	sbc $00000C.l,X		; FF 0C 00 00
	brk $29.b		; 00 29
	brk $F1.b		; 00 F1
	sbc $000004.l,X		; FF 04 00 00
	brk $39.b		; 00 39
	brk $F1.b		; 00 F1
	sbc $00000E.l,X		; FF 0E 00 00
	brk $49.b		; 00 49
	brk $F1.b		; 00 F1
	sbc $000020.l,X		; FF 20 00 00
	brk $A9.b		; 00 A9
	sbc $22FFE1.l,X		; FF E1 FF 22
	brk $00.b		; 00 00
	brk $B9.b		; 00 B9
	sbc $24FFE1.l,X		; FF E1 FF 24
	brk $00.b		; 00 00
	brk $C9.b		; 00 C9
	sbc $26FFE1.l,X		; FF E1 FF 26
	brk $00.b		; 00 00
	brk $D9.b		; 00 D9
	sbc $28FFE1.l,X		; FF E1 FF 28
	brk $00.b		; 00 00
	brk $E9.b		; 00 E9
	sbc $2AFFE1.l,X		; FF E1 FF 2A
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $2AFFE1.l,X		; FF E1 FF 2A
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $E1.b		; 00 E1
	sbc $00002C.l,X		; FF 2C 00 00
	brk $19.b		; 00 19
	brk $E1.b		; 00 E1
	sbc $00002E.l,X		; FF 2E 00 00
	brk $29.b		; 00 29
	brk $E1.b		; 00 E1
	sbc $000040.l,X		; FF 40 00 00
	brk $39.b		; 00 39
	brk $E1.b		; 00 E1
	sbc $000042.l,X		; FF 42 00 00
	brk $49.b		; 00 49
	brk $E1.b		; 00 E1
	sbc $000044.l,X		; FF 44 00 00
	brk $B6.b		; 00 B6
	sbc $46FFD1.l,X		; FF D1 FF 46
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	sbc $48FFD1.l,X		; FF D1 FF 48
	brk $00.b		; 00 00
	brk $D6.b		; 00 D6
	sbc $4AFFD1.l,X		; FF D1 FF 4A
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	sbc $4CFFD1.l,X		; FF D1 FF 4C
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $4EFFD1.l,X		; FF D1 FF 4E
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $D1.b		; 00 D1
	sbc $000060.l,X		; FF 60 00 00
	brk $16.b		; 00 16
	brk $D1.b		; 00 D1
	sbc $000062.l,X		; FF 62 00 00
	brk $26.b		; 00 26
	brk $D1.b		; 00 D1
	sbc $000064.l,X		; FF 64 00 00
	brk $36.b		; 00 36
	brk $D1.b		; 00 D1
	sbc $000066.l,X		; FF 66 00 00
	brk $46.b		; 00 46
	brk $D1.b		; 00 D1
	sbc $000068.l,X		; FF 68 00 00
	brk $EB.b		; 00 EB
	sbc $6AFFC1.l,X		; FF C1 FF 6A
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $6CFFC1.l,X		; FF C1 FF 6C
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $C1.b		; 00 C1
	sbc $00006E.l,X		; FF 6E 00 00
	brk $1B.b		; 00 1B
	brk $C1.b		; 00 C1
	sbc $000080.l,X		; FF 80 00 00
	brk $20.b		; 00 20
	and $309F60.l,X		; 3F 60 9F 30
	and $1C5F28.l,X		; 3F 28 5F 1C
	ora $010F0F.l,X		; 1F 0F 0F 01
	ora ($00.b,X)		; 01 00
	brk $3F.b		; 00 3F
	and $3FFFFF.l,X		; 3F FF FF 3F
	and $1F7F7F.l,X		; 3F 7F 7F 1F
	ora $010F0F.l,X		; 1F 0F 0F 01
	ora ($00.b,X)		; 01 00
	brk $7F.b		; 00 7F
	ldy #$D12E.w		; A0 2E D1
	and $E01FC0.l,X		; 3F C0 1F E0
	asl $FCF1.w		; 0E F1 FC
	sbc $07FFFF.l,X		; FF FF FF 07
	ora [$E0.b]		; 07 E0
	cpx #$FFFF.w		; E0 FF FF
	cpx #$F0E0.w		; E0 E0 F0
	beq  -1.b		; F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0707.l,X		; FF 07 07 FF
	ora [$3F.b]		; 07 3F
	sbc $E206FF.l,X		; FF FF 06 E2
	asl $3A.b		; 06 3A
	inc $EE6A.w,X		; FE 6A EE
	stx $FE.b		; 86 FE
	jsr ($07FC.w,X)		; FC FC 07
	ora [$FF.b]		; 07 FF
	sbc $060606.l,X		; FF 06 06 06
	asl $FE.b		; 06 FE
	inc $EEEE.w,X		; FE EE EE
	inc $FCFE.w,X		; FE FE FC
	jsr ($40BF.w,X)		; FC BF 40
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sta $F88F78.l		; 8F 78 8F F8
	ora $EE0FFC.l		; 0F FC 0F EE
	ora $C307E7.l		; 0F E7 07 C3
	ora $C1.b,S		; 03 C1
	ora ($0F.b,X)		; 01 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $030707.l		; 0F 07 07 03
	ora $01.b,S		; 03 01
	ora ($FF.b,X)		; 01 FF
	brk $7F.b		; 00 7F
	bra  63.b		; 80 3F
	cpy #$FF00.w		; C0 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E7F00F.l,X		; FF 0F F0 E7
	asl $03FD.w,X		; 1E FD 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FFE1FF.l		; 0F FF E1 FF
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E31CE3.l,X		; FF E3 1C E3
	trb $FC07.w		; 1C 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	sbc $FCFDFC.l,X		; FF FC FD FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FC3C.w,X)		; FC 3C FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($807F.w,X)		; FC 7F 80
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
	beq 127.b		; F0 7F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	cmp $0FCF1F.l,X		; DF 1F CF 0F
	sta [$07.b]		; 87 07
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	ora $07070F.l		; 0F 0F 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($FE.b,X)		; 01 FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FCFC.l,X		; FF FC FC 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFCFF.l,X		; FF FF FC FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001F00.l		; 0F 00 1F 00
	and $007F00.l,X		; 3F 00 7F 00
	and $000F00.l,X		; 3F 00 0F 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $070F.w,Y		; F9 0F 07
	sbc $F0FFFC.l,X		; FF FC FF F0
	sbc $00F8F8.l,X		; FF F8 F8 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $FCFEFE.l		; 0F FE FE FC
	jsr ($F0F0.w,X)		; FC F0 F0
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C000.w		; C0 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($02.b,X)		; 01 02
	ora $05.b,S		; 03 05
	asl $0B.b		; 06 0B
	tsb $1916.w		; 0C 16 19
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	trb $2217.w		; 1C 17 22
	rol $7F46.w,X		; 3E 46 7F
	jmp ($F083.w,X)		; 7C 83 F0
	ora $833FC0.l		; 0F C0 3F 83
	jmp ($F00F.w,X)		; 7C 0F F0
	clc		; 18
	ora $001F01.l,X		; 1F 01 1F 00
	and $FFFF7F.l,X		; 3F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $78F887.l,X		; FF 87 F8 78
	sta [$07.b]		; 87 07
	sed		; F8
	ora $00FFE0.l,X		; 1F E0 FF 00
	sbc $FE0100.l,X		; FF 00 01 FE
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F80700.l,X		; FF 00 07 F8
	bvs -113.b		; 70 8F
	ora #$F7F7.w		; 09 F7 F7
	asl $18EF.w		; 0E EF 18
	cmp $63BC30.l,X		; DF 30 BC 63
	sbc $FFFFFF.l,X		; FF FF FF FF
	beq  -1.b		; F0 FF
	ora $FEFEFF.l		; 0F FF FE FE
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	cpx #$E7E0.w		; E0 E0 E7
	clc		; 18
	ora [$F8.b]		; 07 F8
	bra 127.b		; 80 7F
	sbc $00FF80.l,X		; FF 80 FF 00
	cpx #$003F.w		; E0 3F 00
	sbc $E7807F.l,X		; FF 7F 80 E7
	sbc $FFFF07.l,X		; FF 07 FF FF
	sbc $008080.l,X		; FF 80 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	cpx #$3EE1.w		; E0 E1 3E
	jsr ($FE0F.w,X)		; FC 0F FE
	ora $3F.b,S		; 03 3F
	cmp ($8F.b,X)		; C1 8F
	bvs  -1.b		; 70 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0F3F3F.l,X		; FF 3F 3F 0F
	ora $010303.l		; 0F 03 03 01
	ora ($00.b,X)		; 01 00
	brk $F7.b		; 00 F7
	ora $F708F8.l		; 0F F8 08 F7
	php		; 08
	sbc $817E00.l,X		; FF 00 7E 81
	ror $1E81.w,X		; 7E 81 1E
	sbc ($8F.b,X)		; E1 8F
	beq  -1.b		; F0 FF
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DFFFFF.l,X		; FF FF FF DF
	jsr $20DF.w		; 20 DF 20
	jsr $20FF.w		; 20 FF 20
	sbc $20FF20.l,X		; FF 20 FF 20
	sbc $20FF20.l,X		; FF 20 FF 20
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F2FFFF.l,X		; FF FF FF F2
	ora $03FD.w		; 0D FD 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $98D1.w,X		; FE D1 98
	sbc [$20.b],Y		; F7 20
	sbc $20FF20.l,X		; FF 20 FF 20
	sbc $40FF20.l,X		; FF 20 FF 40
	sbc $FFFF40.l,X		; FF 40 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $04FC04.l,X		; FF 04 FC 04
	jsr ($FC18.w,X)		; FC 18 FC
	ora $2EF9.w,Y		; 19 F9 2E
	cmp $7A8E75.l,X		; DF 75 8E 7A
	sta $FC.b		; 85 FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $F1FFE0.l,X		; FF E0 FF F1
	sbc $C0FFFB.l,X		; FF FB FF C0
	sbc $EC3E39.l,X		; FF 39 3E EC
	xba		; EB
	sbc ($EF.b,S),Y		; F3 EF
	eor $709FB8.l		; 4F B8 9F 70
	rol $78E1.w,X		; 3E E1 78
	cmp [$00.b]		; C7 00
	sbc $17FFC1.l,X		; FF C1 FF 17
	sbc $78FF1F.l,X		; FF 1F FF 78
	sed		; F8
	beq -16.b		; F0 F0
	cpx #$C0E0.w		; E0 E0 C0
	cpy #$0000.w		; C0 00 00
	beq   0.b		; F0 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $68.b		; 00 68
	eor [$D0.b],Y		; 57 D0
	lda $E01FE0.l		; AF E0 1F E0
	ora $FFFFFF.l,X		; 1F FF FF FF
	sbc $1C01BF.l,X		; FF BF 01 1C
	sbc $2F.b,S		; E3 2F
	and $FF7F5F.l,X		; 3F 5F 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $8101FF.l,X		; FF FF 01 81
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $7FC1BE.l,X		; FF BE C1 7F
	ldy #$B14E.w		; A0 4E B1
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpx #$FFE0.w		; E0 E0 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $3D03FD.l,X		; FF FD 03 3D
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0303.l,X		; FF 03 03 FF
	sbc $77E679.l,X		; FF 79 E6 77
	iny		; C8
	sbc $90EF90.l		; EF 90 EF 90
	cmp $00FF20.l,X		; DF 20 FF 00
	sbc $40BF00.l,X		; FF 00 BF 40
	cpx #$C0E0.w		; E0 E0 C0
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$18.b]		; E7 18
	xce		; FB
	tsb $FD.b		; 04 FD
	cop $FD.b		; 02 FD
	cop $FE.b		; 02 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	sed		; F8
	sbc $7C.b,S		; E3 7C
	sbc ($3E.b,X)		; E1 3E
	beq  63.b		; F0 3F
	beq  31.b		; F0 1F
	beq  31.b		; F0 1F
	beq  31.b		; F0 1F
	sed		; F8
	ora $7FFFFF.l		; 0F FF FF 7F
	adc $3F3F3F.l,X		; 7F 3F 3F 3F
	and $1F1F1F.l,X		; 3F 1F 1F 1F
	ora $0F1F1F.l,X		; 1F 1F 1F 0F
	ora $20FF20.l		; 0F 20 FF 20
	sbc $207FA0.l,X		; FF A0 7F 20
	sbc $E03FC0.l,X		; FF C0 3F E0
	ora $F71FE8.l,X		; 1F E8 1F F7
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $02FF02.l,X		; FF 02 FF 02
	sbc $F8FF04.l,X		; FF 04 FF F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $40FF40.l,X		; FF 40 FF 40
	sbc $01FE81.l,X		; FF 81 FE 01
	inc $FC03.w,X		; FE 03 FC
	ora $FC.b,S		; 03 FC
	asl $3FF1.w		; 0E F1 3F
	cpy #$FFFF.w		; C0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $09F6FF.l,X		; FF FF F6 09
	pei ($2B.b)		; D4 2B
	sta $B973.w		; 8D 73 B9
	eor [$3B.b]		; 47 3B
	cmp [$73.b]		; C7 73
	stx $0EF3.w		; 8E F3 0E
	sbc $1E.b,S		; E3 1E
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc $FFFFFF.l		; EF FF FF FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $8CF3.w,X		; FE F3 8C
	sbc $20DF90.l		; EF 90 DF 20
	cmp $40BF20.l,X		; DF 20 BF 40
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $808080.l,X		; 7F 80 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFE00.l,X		; FF 00 FE FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sta ($7E.b,X)		; 81 7E
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $F80780.l,X		; 7F 80 07 F8
	brk $FF.b		; 00 FF
	sbc [$F8.b]		; E7 F8
	sbc $FC3E.w,Y		; F9 3E FC
	ora $1F877E.l		; 0F 7E 87 1F
	sbc $7F.b,S		; E3 7F
	sbc $FFFF07.l,X		; FF 07 FF FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	and $070F0F.l,X		; 3F 0F 0F 07
	ora [$03.b]		; 07 03
	ora $DF.b,S		; 03 DF
	rts		; 60

	lda $FF1F70.l		; AF 70 1F FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $01FE00.l,X		; FF 00 FE 01
	brk $FF.b		; 00 FF
	ora $FC.b,S		; 03 FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F107.w,Y		; F9 07 F1
	ora $FDFFFF.l		; 0F FF FF FD
	sta ($D9.b,X)		; 81 D9
	sta ($DF.b,X)		; 81 DF
	sta ($F9.b,X)		; 81 F9
	sta ($80.b,X)		; 81 80
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $81FFFF.l,X		; FF FF FF 81
	inc $FE81.w,X		; FE 81 FE
	sta ($FE.b,X)		; 81 FE
	sta ($FE.b,X)		; 81 FE
	bra  -1.b		; 80 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$40C0.w		; C0 C0 40
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C040.w		; C0 40 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $02.b		; 00 02
	ora $0C.b		; 05 0C
	phd		; 0B
	clc		; 18
	ora ($7C.b,X)		; 01 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora $08.b,S		; 03 08
	ora $401E30.l,X		; 1F 30 1E 40
	ldy $F980.w,X		; BC 80 F9
	ora ($E2.b,X)		; 01 E2
	ora $CD.b,S		; 03 CD
	ora [$18.b]		; 07 18
	ora $0F0007.l		; 0F 07 00 0F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $F9.b		; 00 F9
	ora ($F0.b,X)		; 01 F0
	ora ($C8.b,X)		; 01 C8
	ora $621E11.l		; 0F 11 1E 62
	bit $78FC.w,X		; 3C FC 78
	bvc  -8.b		; 50 F8
	bra -56.b		; 80 C8
	pha		; 48
	iny		; C8
	bmi  -8.b		; 30 F8
	beq   3.b		; F0 03
	sbc ($07.b,X)		; E1 07
	rep #$0E		; C2 0E
	ldy $403C.w,X		; BC 3C 40
	sei		; 78
	bcs  -8.b		; B0 F8
	bmi  -8.b		; 30 F8
	brk $F8.b		; 00 F8
	bra   0.b		; 80 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $09F731.l		; CF 31 F7 09
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FD.b		; 04 FD
	cop $FD.b		; 02 FD
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $C07FC0.l,X		; FF C0 7F C0
	adc $FF7FE0.l,X		; 7F E0 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7F7F.l,X		; FF 7F 7F 7F
	adc $007F7F.l,X		; 7F 7F 7F 00
	sbc $01FC03.l,X		; FF 03 FC 01
	inc $FE01.w,X		; FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	inc $FEFF.w,X		; FE FF FE
	inc $FFFD.w,X		; FE FD FF
	jsr ($FCFE.w,X)		; FC FE FC
	inc $FFFD.w,X		; FE FD FF
	inc $FFFE.w,X		; FE FE FF
	sbc $FE807F.l,X		; FF 7F 80 FE
	ora [$FF.b]		; 07 FF
	brk $FE.b		; 00 FE
	ora [$FE.b]		; 07 FE
	ora [$FF.b]		; 07 FF
	brk $FE.b		; 00 FE
	ora [$E0.b]		; 07 E0
	ora $07FF7F.l,X		; 1F 7F FF 07
	ora [$FF.b]		; 07 FF
	sbc $070707.l,X		; FF 07 07 07
	ora [$FF.b]		; 07 FF
	sbc $FF0707.l,X		; FF 07 07 FF
	sbc $4000C0.l,X		; FF C0 00 40
	cpy #$C040.w		; C0 40 C0
	rti		; 40

	cpy #$C040.w		; C0 40 C0
	rti		; 40

	cpy #$C040.w		; C0 40 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $07.b		; 06 07
	and $BFE033.l,X		; 3F 33 E0 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	bit $C03F.w,X		; 3C 3F C0
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6F.b		; 00 6F
	adc ($DF.b),Y		; 71 DF
	and $00FFE0.l,X		; 3F E0 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	adc $00FFC0.l,X		; 7F C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	and $80FFFF.l,X		; 3F FF FF 80
	sbc $03C03F.l,X		; FF 3F C0 03
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $FF003F.l,X		; 3F 3F 00 FF
	brk $FF.b		; 00 FF
	and $FF03FF.l,X		; 3F FF 03 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tas		; 1B
	trb $3FC3.w		; 1C C3 3F
	jsr ($00FF.w,X)		; FC FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $00FFC0.l,X		; 1F C0 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	ora ($69.b,X)		; 01 69
	adc [$0F.b],Y		; 77 0F
	sbc $01FFFE.l,X		; FF FE FF 01
	inc $00FF.w,X		; FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($01.b,X)		; 01 01
	sei		; 78
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $FFFF01.l,X		; FF 01 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $A7F030.l,X		; FF 30 F0 A7
	cmp $00FCFB.l,X		; DF FB FC 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	tsb $0F.b		; 04 0F
	brk $20.b		; 00 20
	cpx #$FE02.w		; E0 02 FE
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	rts		; 60

	adc $C3FF00.l,X		; 7F 00 FF C3
	bit $3FDF.w,X		; 3C DF 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	.db $82, $03, $00		; 82 03 00
	ora $C03F2B.l		; 0F 2B 3F C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BCF800.l,X		; FF 00 F8 BC
	jsr ($7FBF.w,X)		; FC BF 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F8F800.l,X		; FF 00 F8 F8
	jsr ($FFFC.w,X)		; FC FC FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($02.b,X)		; 01 02
	ora $00.b,S		; 03 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	cmp $079F1E.l		; CF 1E 9F 07
	sta [$00.b]		; 87 00
	bra 127.b		; 80 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $37FF00.l,X		; FF 00 FF 37
	ora [$60.b]		; 07 60
	brk $78.b		; 00 78
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $83.b		; 00 83
	adc $EFF0.w,X		; 7D F0 EF
	jmp.w [$F7FB]		; DC FB F7
	inc $FFFD.w,X		; FE FD FF
	cpx #$00FF.w		; E0 FF 00
	sbc $82FF00.l,X		; FF 00 FF 82
	inc $FFF0.w,X		; FE F0 FF
	trb $071F.w		; 1C 1F 07
	ora [$01.b]		; 07 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	cpy #$70C8.w		; C0 C8 70
	and ($DC.b)		; 32 DC
	ora $82F6.w		; 0D F6 82
	adc $2EE758.l,X		; 7F 58 E7 2E
	sbc ($17.b),Y		; F1 17
	sed		; F8
	brk $00.b		; 00 00
	cpy #$30C0.w		; C0 C0 30
	beq  12.b		; F0 0C
	jsr ($FE82.w,X)		; FC 82 FE
	sei		; 78
	adc $1F3F3E.l,X		; 7F 3E 3F 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	bra  24.b		; 80 18
	cpx #$D834.w		; E0 34 D8
	phb		; 8B
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  48.b		; 80 30
	beq -125.b		; F0 83
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $02FFFF.l,X		; FF FF FF 02
	ora [$01.b]		; 07 01
	cop $F9.b		; 02 F9
	sbc ($FB.b)		; F2 FB
	sbc $00FF.w,X		; FD FF 00
	sbc $FACF02.l,X		; FF 02 CF FA
	cmp $000032.l,X		; DF 32 00 00
	tsb $00.b		; 04 00
	pea $02F0.w		; F4 F0 02
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F7FFFF.l,X		; FF FF FF F7
	sbc [$00.b],Y		; F7 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FE.b		; 00 FE
	ora ($F3.b,X)		; 01 F3
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $FFE01F.l,X		; FF 1F E0 FF
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $07.b		; 00 07
	sed		; F8
	rti		; 40

	sbc $000000.l,X		; FF 00 00 00
	brk $07.b		; 00 07
	ora [$00.b]		; 07 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF07.l,X		; FF 07 FF 00
	sbc $FF18F7.l,X		; FF F7 18 FF
	bmi  -1.b		; 30 FF
	cpy #$E0FF.w		; C0 FF E0
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $F00F00.l,X		; FF 00 0F F0
	ora $3F3F1F.l,X		; 1F 1F 3F 3F
	sbc $FF1FFF.l,X		; FF FF 1F FF
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $03FDFF.l		; 0F FF FD 03
	sbc $03FE01.l,X		; FF 01 FE 03
	sbc $FF8004.l,X		; FF 04 80 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFC00.l,X		; FF 00 FC FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $8000FF.l,X		; FF FF 00 80
	cpy #$74F0.w		; C0 F0 74
	jsr ($0FF0.w,X)		; FC F0 0F
	brk $FF.b		; 00 FF
	cmp $10EF20.l,X		; DF 20 EF 10
	sbc [$08.b],Y		; F7 08
	bra -128.b		; 80 80
	bpl -16.b		; 10 F0
	tsb $F3FC.w		; 0C FC F3
	sbc $FFFFC0.l,X		; FF C0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000100.l,X		; FF 00 01 00
	cop $11.b		; 02 11
	ora $FBCB.w,X		; 1D CB FB
	and $00FFC0.l,X		; 3F C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	inc A		; 1A
	ora $3FFFE4.l,X		; 1F E4 FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F4FFFF.l,X		; FF FF FF F4
	cpy $1F1E.w		; CC 1E 1F
	cpx #$FFE0.w		; E0 E0 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3C.b		; 00 3C
	jsr ($FFE0.w,X)		; FC E0 FF
	ora $FF00FF.l,X		; 1F FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	inx		; E8
	clc		; 18
	bpl  32.b		; 10 20
	beq -48.b		; F0 D0
	cpx #$E020.w		; E0 20 E0
	jsr $4080.w		; 20 80 40
	bra  64.b		; 80 40
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	bne -16.b		; D0 F0
	bmi -16.b		; 30 F0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$C0C0.w		; E0 C0 C0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $01.b,S		; 03 01
	tsb $0F.b		; 04 0F
	clc		; 18
	asl $7C20.w,X		; 1E 20 7C
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora $003F00.l,X		; 1F 00 3F 00
	ora [$19.b],Y		; 17 19
	ora [$6F.b],Y		; 17 6F
	jsr $E0BF.w		; 20 BF E0
	ora $820FE1.l		; 0F E1 0F 82
	trb $7844.w		; 1C 44 78
	dey		; 88
	beq  30.b		; F0 1E
	ora $403F30.l,X		; 1F 30 3F 40
	ora $F907F0.l		; 0F F0 07 F9
	ora $840EE2.l		; 0F E2 0E 84
	trb $3808.w		; 1C 08 38
	sbc $FFE0FF.l,X		; FF FF E0 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $3FFF.w,X		; FE FF 3F
	sbc $03FF00.l,X		; FF 00 FF 03
	jsr ($FFFF.w,X)		; FC FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcc 112.b		; 90 70
	sbc $01FE.w,Y		; F9 FE 01
	sbc $C6FF00.l,X		; FF 00 FF C6
	sbc $3F3F.w,Y		; F9 3F 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $3FFF.w,X		; FE FF 3F
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  -6.b		; 80 FA
	inc $0F.b,X		; F6 0F
	sbc $A0FF03.l,X		; FF 03 FF A0
	cmp $177D7E.l,X		; DF 7E 7D 17
	ora $800000.l,X		; 1F 00 00 80
	bra  14.b		; 80 0E
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	cpx #$7EFF.w		; E0 FF 7E
	adc $000707.l,X		; 7F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	rti		; 40

	sed		; F8
	inx		; E8
	jmp ($07F8.w,X)		; 7C F8 07
	xce		; FB
	cmp ($BE.b,X)		; C1 BE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$18C0.w		; C0 C0 18
	sed		; F8
	tsb $FC.b		; 04 FC
	asl $FE.b		; 06 FE
	cmp ($FF.b,X)		; C1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	bra -112.b		; 80 90
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	php		; 08
	brk $08.b		; 00 08
	brk $F7.b		; 00 F7
	asl A		; 0A
	sbc #$F7FD.w		; E9 FD F7
	sbc $00FFF6.l,X		; FF F6 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFF6.l,X		; FF F6 FF 01
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $F6.b		; 00 F6
	sbc $000002.l,X		; FF 02 00 00
	brk $F7.b		; 00 F7
	sbc $03FFEE.l,X		; FF EE FF 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $04FFEE.l,X		; FF EE FF 04
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $EE.b		; 00 EE
	sbc $000005.l,X		; FF 05 00 00
	brk $F9.b		; 00 F9
	sbc $06FFE6.l,X		; FF E6 FF 06
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $E6.b		; 00 E6
	sbc $000007.l,X		; FF 07 00 00
	brk $6C.b		; 00 6C
	ldy $34.b,X		; B4 34
	jsr ($5B3B.w,X)		; FC 3B 5B
	rol $77.b,X		; 36 77
	ora $0331.w,X		; 1D 31 03
	clc		; 18
	cop $0E.b		; 02 0E
	brk $03.b		; 00 03
	eor $00.b,S		; 43 00
	ora $00.b,S		; 03 00
	bit $00.b		; 24 00
	php		; 08
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	cop $92.b		; 02 92
	sbc ($09.b,S),Y		; F3 09
	sbc $0EFE.w,Y		; F9 FE 0E
	sbc ($F0.b,S),Y		; F3 F0
	adc $FC61.w		; 6D 61 FC
	ora $FCFC00.l		; 0F 00 FC FC
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $9E.b		; 00 9E
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	bcc -128.b		; 90 80
	bcs  64.b		; B0 40
	jsr $E080.w		; 20 80 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $34.b		; 00 34
	tda		; 7B
	adc $297F.w,Y		; 79 7F 29
	ldy #$B0B7.w		; A0 B7 B0
	lda $8C.b,X		; B5 8C
	lda ($8C.b),Y		; B1 8C
	sta ($AC.b),Y		; 91 AC
	bpl -84.b		; 10 AC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $004F00.l,X		; 5F 00 4F 00
	eor $00.b,S		; 43 00
	eor $00.b,S		; 43 00
	eor $00.b,S		; 43 00
	eor $00.b,S		; 43 00
	and ($1E.b),Y		; 31 1E
	adc ($0F.b,X)		; 61 0F
	sed		; F8
	brk $6F.b		; 00 6F
	rts		; 60

	lda ($93.b)		; B2 93
	beq -109.b		; F0 93
	jmp $67FC17.l		; 5C 17 FC 67
	cpx #$F000.w		; E0 00 F0
	brk $FF.b		; 00 FF
	brk $9F.b		; 00 9F
	brk $6C.b		; 00 6C
	brk $6C.b		; 00 6C
	brk $E8.b		; 00 E8
	brk $98.b		; 00 98
	brk $C0.b		; 00 C0
	cpx #$E0E0.w		; E0 E0 E0
	cpy #$D0D0.w		; C0 D0 D0
	bne -48.b		; D0 D0
	bpl -48.b		; 10 D0
	bpl -48.b		; 10 D0
	bvc -64.b		; 50 C0
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $3303.w		; 0E 03 33
	inc A		; 1A
	jmp $78B02F.l		; 5C 2F B0 78
	ror $00.b		; 66 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0C.b		; 00 0C
	brk $21.b		; 00 21
	brk $41.b		; 00 41
	brk $81.b		; 00 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bvs -56.b		; 70 C8
	cpy $DAB8.w		; CC B8 DA
	bit $8E45.w,X		; 3C 45 8E
	adc ($00.b)		; 72 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $30.b		; 00 30
	brk $04.b		; 00 04
	brk $82.b		; 00 82
	brk $81.b		; 00 81
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $F7.b		; 00 F7
	asl A		; 0A
	sbc #$F7FD.w		; E9 FD F7
	sbc $00FFF6.l,X		; FF F6 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFF6.l,X		; FF F6 FF 01
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $F6.b		; 00 F6
	sbc $000002.l,X		; FF 02 00 00
	brk $F7.b		; 00 F7
	sbc $03FFEE.l,X		; FF EE FF 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $04FFEE.l,X		; FF EE FF 04
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $EE.b		; 00 EE
	sbc $000005.l,X		; FF 05 00 00
	brk $F9.b		; 00 F9
	sbc $06FFE6.l,X		; FF E6 FF 06
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $E6.b		; 00 E6
	sbc $000007.l,X		; FF 07 00 00
	brk $6D.b		; 00 6D
	lda ($37.b,S),Y		; B3 37
	sbc $5C3A.w,Y		; F9 3A 5C
	rol $76.b,X		; 36 76
	ora $0331.w,X		; 1D 31 03
	clc		; 18
	cop $0E.b		; 02 0E
	brk $03.b		; 00 03
	rti		; 40

	brk $00.b		; 00 00
	brk $21.b		; 00 21
	brk $09.b		; 00 09
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $1D.b		; 00 1D
	ora $077D62.l,X		; 1F 62 7D 07
	adc $C6BA.w,Y		; 79 BA C6
	adc ($F0.b,S),Y		; 73 F0
	adc $FC61.w		; 6D 61 FC
	ora $E0FC00.l		; 0F 00 FC E0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $9E.b		; 00 9E
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	bcc -128.b		; 90 80
	bcs  64.b		; B0 40
	jsr $E080.w		; 20 80 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	adc ($7A.b)		; 72 7A
	ror $37.b		; 66 37
	ldx $A8B3.w		; AE B3 A8
	sta $BCBD80.l,X		; 9F 80 BD BC
	sta [$AE.b],Y		; 97 AE
	ora $01A7.w,Y		; 19 A7 01
	brk $01.b		; 00 01
	brk $41.b		; 00 41
	brk $47.b		; 00 47
	brk $7F.b		; 00 7F
	brk $43.b		; 00 43
	brk $41.b		; 00 41
	brk $40.b		; 00 40
	brk $5F.b		; 00 5F
	ply		; 7A
	lda $07FE32.l,X		; BF 32 FE 07
	ror $B267.w		; 6E 67 B2
	sta ($F2.b,S),Y		; 93 F2
	sta ($5E.b,S),Y		; 93 5E
	ora ($F1.b),Y		; 11 F1
	rts		; 60

	sty $00.b		; 84 00
	cpy $F800.w		; CC 00 F8
	brk $98.b		; 00 98
	brk $6C.b		; 00 6C
	brk $6C.b		; 00 6C
	brk $EE.b		; 00 EE
	brk $9F.b		; 00 9F
	brk $C0.b		; 00 C0
	cpx #$60E0.w		; E0 E0 60
	cpy #$D050.w		; C0 50 D0
	bpl -48.b		; 10 D0
	bpl -48.b		; 10 D0
	bpl -48.b		; 10 D0
	bvc  64.b		; 50 40
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $3303.w		; 0E 03 33
	tas		; 1B
	jmp $7AB62D.l		; 5C 2D B6 7A
	rtl		; 6B

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	tsb $2000.w		; 0C 00 20
	brk $48.b		; 00 48
	brk $84.b		; 00 84
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bvs -56.b		; 70 C8
	cpy $1AF8.w		; CC F8 1A
	pei ($35.b)		; D4 35
	rol $00E6.w		; 2E E6 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $30.b		; 00 30
	brk $04.b		; 00 04
	brk $0A.b		; 00 0A
	brk $19.b		; 00 19
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $F7.b		; 00 F7
	asl A		; 0A
	sbc #$F7FD.w		; E9 FD F7
	sbc $00FFF6.l,X		; FF F6 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFF6.l,X		; FF F6 FF 01
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $F6.b		; 00 F6
	sbc $000002.l,X		; FF 02 00 00
	brk $F7.b		; 00 F7
	sbc $03FFEE.l,X		; FF EE FF 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $04FFEE.l,X		; FF EE FF 04
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $EE.b		; 00 EE
	sbc $000005.l,X		; FF 05 00 00
	brk $F9.b		; 00 F9
	sbc $06FFE6.l,X		; FF E6 FF 06
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $E6.b		; 00 E6
	sbc $000007.l,X		; FF 07 00 00
	brk $67.b		; 00 67
	lda [$34.b],Y		; B7 34
	xce		; FB
	and $763758.l,X		; 3F 58 37 76
	ora $0331.w,X		; 1D 31 03
	clc		; 18
	cop $0E.b		; 02 0E
	brk $03.b		; 00 03
	pha		; 48
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $08.b		; 00 08
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $79.b		; 00 79
	asl $DD52.w,X		; 1E 52 DD
	eor [$D9.b]		; 47 D9
	stx $F352.w		; 8E 52 F3
	beq 109.b		; F0 6D
	adc ($FC.b,X)		; 61 FC
	ora $E0FC00.l		; 0F 00 FC E0
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $21.b		; 00 21
	brk $0F.b		; 00 0F
	brk $9E.b		; 00 9E
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	bcc -128.b		; 90 80
	bcs  64.b		; B0 40
	jsr $E080.w		; 20 80 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3B.b		; 00 3B
	adc ($66.b,S),Y		; 73 66
	bvs  19.b		; 70 13
	tay		; A8
	sta ($AC.b),Y		; 91 AC
	lda $BB86.w,Y		; B9 86 BB
	stx $98.b		; 86 98
	ldy $19.b		; A4 19
	lda #$000C.w		; A9 0C 00
	ora $004700.l		; 0F 00 47 00
	eor $00.b,S		; 43 00
	eor ($00.b,X)		; 41 00
	eor ($00.b,X)		; 41 00
	eor $00.b,S		; 43 00
	lsr $00.b		; 46 00
	lda $79F2.w,Y		; B9 F2 79
	.db $62, $FC, $07		; 62 FC 07
	ror $BA67.w		; 6E 67 BA
	sta ($FE.b,S),Y		; 93 FE
	sta ($59.b),Y		; 91 59
	bpl -13.b		; 10 F3
	adc $0C.b,S		; 63 0C
	brk $9C.b		; 00 9C
	brk $F8.b		; 00 F8
	brk $98.b		; 00 98
	brk $6C.b		; 00 6C
	brk $6E.b		; 00 6E
	brk $EF.b		; 00 EF
	brk $9C.b		; 00 9C
	brk $C0.b		; 00 C0
	cpx #$60E0.w		; E0 E0 60
	cpy #$D050.w		; C0 50 D0
	bvc -48.b		; 50 D0
	bpl  80.b		; 10 50
	bcc -48.b		; 90 D0
	bvc  64.b		; 50 40
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $3303.w		; 0E 03 33
	tas		; 1B
	jmp $74B02F.l		; 5C 2F B0 74
	tda		; 7B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	tsb $2000.w		; 0C 00 20
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bvs -56.b		; 70 C8
	cpy $7AB8.w		; CC B8 7A
	bit $C5.b		; 24 C5
	ror $CA.b		; 66 CA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bmi   0.b		; 30 00
	tsb $00.b		; 04 00
	dec A		; 3A
	brk $31.b		; 00 31
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $F7.b		; 00 F7
	asl A		; 0A
	sbc #$F7FD.w		; E9 FD F7
	sbc $00FFF6.l,X		; FF F6 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFF6.l,X		; FF F6 FF 01
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $F6.b		; 00 F6
	sbc $000002.l,X		; FF 02 00 00
	brk $F7.b		; 00 F7
	sbc $03FFEE.l,X		; FF EE FF 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $04FFEE.l,X		; FF EE FF 04
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $EE.b		; 00 EE
	sbc $000005.l,X		; FF 05 00 00
	brk $F9.b		; 00 F9
	sbc $06FFE6.l,X		; FF E6 FF 06
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $E6.b		; 00 E6
	sbc $000007.l,X		; FF 07 00 00
	brk $6C.b		; 00 6C
	ldy $34.b,X		; B4 34
	jsr ($5B3B.w,X)		; FC 3B 5B
	rol $77.b,X		; 36 77
	ora $0331.w,X		; 1D 31 03
	clc		; 18
	cop $0E.b		; 02 0E
	brk $03.b		; 00 03
	eor $00.b,S		; 43 00
	ora $00.b,S		; 03 00
	bit $00.b		; 24 00
	php		; 08
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	cop $92.b		; 02 92
	sbc ($09.b,S),Y		; F3 09
	sbc $0EFE.w,Y		; F9 FE 0E
	sbc ($F0.b,S),Y		; F3 F0
	adc $FC61.w		; 6D 61 FC
	ora $FCFC00.l		; 0F 00 FC FC
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $9E.b		; 00 9E
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	bcc -128.b		; 90 80
	bcs  64.b		; B0 40
	jsr $E080.w		; 20 80 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $34.b		; 00 34
	tda		; 7B
	adc $297F.w,Y		; 79 7F 29
	ldy #$B0B7.w		; A0 B7 B0
	lda $8C.b,X		; B5 8C
	lda ($8C.b),Y		; B1 8C
	sta ($AC.b),Y		; 91 AC
	bpl -84.b		; 10 AC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $004F00.l,X		; 5F 00 4F 00
	eor $00.b,S		; 43 00
	eor $00.b,S		; 43 00
	eor $00.b,S		; 43 00
	eor $00.b,S		; 43 00
	and ($1E.b),Y		; 31 1E
	adc ($0F.b,X)		; 61 0F
	sed		; F8
	brk $6F.b		; 00 6F
	rts		; 60

	lda ($93.b)		; B2 93
	beq -109.b		; F0 93
	jmp $67FC17.l		; 5C 17 FC 67
	cpx #$F000.w		; E0 00 F0
	brk $FF.b		; 00 FF
	brk $9F.b		; 00 9F
	brk $6C.b		; 00 6C
	brk $6C.b		; 00 6C
	brk $E8.b		; 00 E8
	brk $98.b		; 00 98
	brk $C0.b		; 00 C0
	cpx #$E0E0.w		; E0 E0 E0
	cpy #$D0D0.w		; C0 D0 D0
	bne -48.b		; D0 D0
	bpl -48.b		; 10 D0
	bpl -48.b		; 10 D0
	bvc -64.b		; 50 C0
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $3303.w		; 0E 03 33
	inc A		; 1A
	jmp $78B02F.l		; 5C 2F B0 78
	ror $00.b		; 66 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0C.b		; 00 0C
	brk $21.b		; 00 21
	brk $41.b		; 00 41
	brk $81.b		; 00 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bvs -56.b		; 70 C8
	cpy $DAB8.w		; CC B8 DA
	bit $8E45.w,X		; 3C 45 8E
	adc ($00.b)		; 72 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $30.b		; 00 30
	brk $04.b		; 00 04
	brk $82.b		; 00 82
	brk $81.b		; 00 81
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $30.b		; 00 30
	jsr $4060.w		; 20 60 40
	lda $817EC0.l,X		; BF C0 7E 81
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	and $00FF00.l,X		; 3F 00 FF 00
	cpy #$003F.w		; C0 3F 00
	sbc $0FFF1F.l,X		; FF 1F FF 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $BC.b		; 00 BC
	brk $BF.b		; 00 BF
	brk $03.b		; 00 03
	jsr ($FF00.w,X)		; FC 00 FF
	clv		; B8
	sbc $FFFFF9.l,X		; FF F9 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $40C040.l,X		; FF 40 C0 40
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora $15.b,X		; 15 15
	and $5E5E2D.l		; 2F 2D 5E 5E
	tyx		; BB
	tyx		; BB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1F1B0F.l		; 0F 0F 1B 1F
	and ($3F.b,S),Y		; 33 3F
	adc $7F.b,S		; 63 7F
	dec $FF.b		; C6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	asl $07.b		; 06 07
	ora [$03.b]		; 07 03
	ora $03.b,S		; 03 03
	ora $02.b,S		; 03 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $FFF8.w,X		; FE F8 FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $00FFFD.l,X		; FF FD FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sty $3F3D.w		; 8C 3D 3F
	and $3A3F.w,X		; 3D 3F 3A
	dec A		; 3A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($C3FC.w,X)		; 7C FC C3
	sbc $C6FFC3.l,X		; FF C3 FF C6
	inc $0009.w,X		; FE 09 00
	ora #$F300.w		; 09 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $30.b		; 00 30
	jsr $4060.w		; 20 60 40
	lda $817EC0.l,X		; BF C0 7E 81
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	and $00FF00.l,X		; 3F 00 FF 00
	cpy #$003F.w		; C0 3F 00
	sbc $0FFF1F.l,X		; FF 1F FF 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $BC.b		; 00 BC
	brk $BF.b		; 00 BF
	brk $03.b		; 00 03
	jsr ($FF00.w,X)		; FC 00 FF
	clv		; B8
	sbc $FFFFF9.l,X		; FF F9 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $40C040.l,X		; FF 40 C0 40
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora $15.b,X		; 15 15
	and $5E5E2D.l		; 2F 2D 5E 5E
	tyx		; BB
	tyx		; BB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1F1B0F.l		; 0F 0F 1B 1F
	and ($3F.b,S),Y		; 33 3F
	adc $7F.b,S		; 63 7F
	dec $FF.b		; C6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FCFC00.l,X		; FF 00 FC FC
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FC00FF.l,X		; FF FF 00 FC
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	asl $F8.b		; 06 F8
	sed		; F8
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $00FFFD.l,X		; FF FD FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0301.w		; 0C 01 03
	and $3A3F.w,X		; 3D 3F 3A
	dec A		; 3A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($837C.w,X)		; 7C 7C 83
	sta $C3.b,S		; 83 C3
	sbc $09FEC6.l,X		; FF C6 FE 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $30.b		; 00 30
	jsr $4060.w		; 20 60 40
	lda $817EC0.l,X		; BF C0 7E 81
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	and $00FF00.l,X		; 3F 00 FF 00
	cpy #$003F.w		; C0 3F 00
	sbc $0FFF1F.l,X		; FF 1F FF 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $BC.b		; 00 BC
	brk $BF.b		; 00 BF
	brk $03.b		; 00 03
	jsr ($FF00.w,X)		; FC 00 FF
	clv		; B8
	sbc $FFFFF9.l,X		; FF F9 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $40C040.l,X		; FF 40 C0 40
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $5E5E2D.l		; 2F 2D 5E 5E
	tyx		; BB
	tyx		; BB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $13130F.l		; 0F 0F 13 13
	and ($3F.b,S),Y		; 33 3F
	adc $7F.b,S		; 63 7F
	dec $FF.b		; C6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FEFD.w,X		; FD FD FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	ora ($FD.b,X)		; 01 FD
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($03FC.w,X)		; FC FC 03
	ora $02.b,S		; 03 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $F8F8.w,X		; FE F8 F8
	jsr ($FCFC.w,X)		; FC FC FC
	sbc $00FFFD.l,X		; FF FD FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb DMADEST0.w		; 0C 01 43
	ora ($03.b,X)		; 01 03
	dec A		; 3A
	dec A		; 3A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $83.b,S		; 43 83
	sta $C6.b,S		; 83 C6
	inc $0009.w,X		; FE 09 00
	ora #$F300.w		; 09 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $30.b		; 00 30
	jsr $4060.w		; 20 60 40
	lda $817EC0.l,X		; BF C0 7E 81
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	and $00FF00.l,X		; 3F 00 FF 00
	cpy #$003F.w		; C0 3F 00
	sbc $0FFF1F.l,X		; FF 1F FF 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $BC.b		; 00 BC
	brk $BF.b		; 00 BF
	brk $03.b		; 00 03
	jsr ($FF00.w,X)		; FC 00 FF
	clv		; B8
	sbc $FFFFF9.l,X		; FF F9 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $40C040.l,X		; FF 40 C0 40
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	lsr $BB5E.w,X		; 5E 5E BB
	tyx		; BB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $13130F.l		; 0F 0F 13 13
	and $23.b,S		; 23 23
	adc $7F.b,S		; 63 7F
	dec $FF.b		; C6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	ora ($01.b,X)		; 01 01
	sbc $FEFD.w,X		; FD FD FE
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	ora ($01.b,X)		; 01 01
	ora ($FD.b,X)		; 01 FD
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($0202.w,X)		; 7C 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $FFFD.w		; 9C FD FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $02		; 42 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$09		; C2 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $30.b		; 00 30
	jsr $4060.w		; 20 60 40
	lda $817EC0.l,X		; BF C0 7E 81
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	and $00FF00.l,X		; 3F 00 FF 00
	cpy #$003F.w		; C0 3F 00
	sbc $0FFF1F.l,X		; FF 1F FF 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	php		; 08
	ldy $BF00.w,X		; BC 00 BF
	brk $03.b		; 00 03
	jsr ($FF00.w,X)		; FC 00 FF
	clv		; B8
	sbc $FFFFF9.l,X		; FF F9 FF FF
	sbc $FFF8F8.l,X		; FF F8 F8 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $404040.l,X		; FF 40 40 40
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	cpy #$80C0.w		; C0 C0 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	php		; 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	.db $42, $42		; 42 42
	tyx		; BB
	tyx		; BB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $13130F.l		; 0F 0F 13 13
	and $23.b,S		; 23 23
	eor $43.b,S		; 43 43
	dec $FF.b		; C6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($7C1C.w,X)		; 7C 1C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $9C7C.w		; 9C 7C 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $82		; 42 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$09		; C2 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $30.b		; 00 30
	jsr $4060.w		; 20 60 40
	lda $817EC0.l,X		; BF C0 7E 81
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1D15FF.l,X		; FF FF 15 1D
	and $00FF00.l,X		; 3F 00 FF 00
	cpy #$003F.w		; C0 3F 00
	sbc $0FFF1F.l,X		; FF 1F FF 0F
	sbc $97FFFF.l,X		; FF FF FF 97
	sta $FFFFFF.l,X		; 9F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $90FFFF.l,X		; FF FF FF 90
	dey		; 88
	bcs   8.b		; B0 08
	lda $FC0300.l,X		; BF 00 03 FC
	brk $FF.b		; 00 FF
	clv		; B8
	sbc $FFFFF9.l,X		; FF F9 FF FF
	sbc $F89898.l,X		; FF 98 98 F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	.db $42, $42		; 42 42
	.db $82, $82, $00		; 82 82 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $231313.l		; 0F 13 13 23
	and $43.b,S		; 23 43
	eor $86.b,S		; 43 86
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($7C1C.w,X)		; 7C 1C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $9C7C.w		; 9C 7C 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $82		; 42 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$09		; C2 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $20.b		; 00 20
	jsr $4060.w		; 20 60 40
	lda $817EC0.l,X		; BF C0 7E 81
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $20207F.l,X		; 7F 7F 20 20
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1D15FF.l,X		; FF FF 15 1D
	ora ($3D.b),Y		; 11 3D
	sbc $3FC000.l,X		; FF 00 C0 3F
	brk $FF.b		; 00 FF
	ora $FF0FFF.l,X		; 1F FF 0F FF
	sbc $1F17FF.l,X		; FF FF 17 1F
	lda $9B.b,X		; B5 9B
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bcc -120.b		; 90 88
	bra -72.b		; 80 B8
	bcs   8.b		; B0 08
	ora $FC.b,S		; 03 FC
	brk $FF.b		; 00 FF
	clv		; B8
	sbc $FFFFF9.l,X		; FF F9 FF FF
	sbc $B89898.l,X		; FF 98 98 B8
	clv		; B8
	sed		; F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $4040FF.l,X		; FF FF 40 40
	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	.db $42, $42		; 42 42
	.db $82, $82, $00		; 82 82 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $231313.l		; 0F 13 13 23
	and $43.b,S		; 23 43
	eor $86.b,S		; 43 86
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($7C1C.w,X)		; 7C 1C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $9C7C.w		; 9C 7C 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $82		; 42 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$09		; C2 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $20.b		; 00 20
	jsr $4040.w		; 20 40 40
	lda $817EC0.l,X		; BF C0 7E 81
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $20207F.l,X		; 7F 7F 20 20
	rti		; 40

	rti		; 40

	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	cpy #$8040.w		; C0 40 80
	cpy #$80FF.w		; C0 FF 80
	sbc $FF0080.l,X		; FF 80 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$FFC0.w		; C0 C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $15FFFF.l,X		; FF FF FF 15
	ora $3D11.w,X		; 1D 11 3D
	sta ($2D.b,X)		; 81 2D
	cpy #$003F.w		; C0 3F 00
	sbc $0FFF1F.l,X		; FF 1F FF 0F
	sbc $17FFFF.l,X		; FF FF FF 17
	ora $AD1B35.l,X		; 1F 35 1B AD
	sta ($FF.b,S),Y		; 93 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $808890.l,X		; FF 90 88 80
	clv		; B8
	ldy #$0088.w		; A0 88 00
	beq   0.b		; F0 00
	sbc $F9FFB8.l,X		; FF B8 FF F9
	sbc $98FFFF.l,X		; FF FF FF 98
	tya		; 98
	clv		; B8
	clv		; B8
	tay		; A8
	tay		; A8
	beq -16.b		; F0 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	.db $42, $42		; 42 42
	.db $82, $82, $00		; 82 82 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $231313.l		; 0F 13 13 23
	and $43.b,S		; 23 43
	eor $86.b,S		; 43 86
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($7C1C.w,X)		; 7C 1C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $9C7C.w		; 9C 7C 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $82		; 42 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$09		; C2 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $20.b		; 00 20
	jsr $4040.w		; 20 40 40
	sta ($80.b,X)		; 81 80
	ror $0181.w,X		; 7E 81 01
	sbc $41FF01.l,X		; FF 01 FF 41
	sbc $207F7F.l,X		; FF 7F 7F 20
	jsr $4040.w		; 20 40 40
	sta ($81.b,X)		; 81 81
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	bra -128.b		; 80 80
	sbc $FF0080.l,X		; FF 80 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$80C0.w		; C0 C0 80
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $111D15.l,X		; FF 15 1D 11
	and $2D01.w,X		; 3D 01 2D
	sta ($1D.b,X)		; 81 1D
	brk $FF.b		; 00 FF
	ora $FF0FFF.l,X		; 1F FF 0F FF
	sbc $1F17FF.l,X		; FF FF 17 1F
	and $1B.b,X		; 35 1B
	and $9D13.w		; 2D 13 9D
	sta $FF.b,S		; 83 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $90FFFF.l,X		; FF FF FF 90
	dey		; 88
	bra -72.b		; 80 B8
	ldy #$0098.w		; A0 98 00
	sec		; 38
	brk $F8.b		; 00 F8
	clv		; B8
	sbc $FFFFF9.l,X		; FF F9 FF FF
	sbc $B89898.l,X		; FF 98 98 B8
	clv		; B8
	clv		; B8
	clv		; B8
	sec		; 38
	sec		; 38
	sed		; F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $4040FF.l,X		; FF FF 40 40
	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	.db $42, $42		; 42 42
	.db $82, $82, $00		; 82 82 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $231313.l		; 0F 13 13 23
	and $43.b,S		; 23 43
	eor $86.b,S		; 43 86
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($7C1C.w,X)		; 7C 1C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $9C7C.w		; 9C 7C 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $82		; 42 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$09		; C2 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $20.b		; 00 20
	jsr $4040.w		; 20 40 40
	sta ($80.b,X)		; 81 80
	brk $81.b		; 00 81
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $20207F.l,X		; 7F 7F 20 20
	rti		; 40

	rti		; 40

	sta ($81.b,X)		; 81 81
	sta ($81.b,X)		; 81 81
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	cpy #$8040.w		; C0 40 80
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$80C0.w		; C0 C0 80
	bra -128.b		; 80 80
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $15FFFF.l,X		; FF FF FF 15
	ora $3D11.w,X		; 1D 11 3D
	ora ($2D.b,X)		; 01 2D
	ora ($1D.b,X)		; 01 1D
	ora ($99.b,X)		; 01 99
	ora $FF0FFF.l,X		; 1F FF 0F FF
	sbc $1F17FF.l,X		; FF FF 17 1F
	and $1B.b,X		; 35 1B
	and $1D13.w		; 2D 13 1D
	ora $99.b,S		; 03 99
	sta [$FF.b]		; 87 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $808890.l,X		; FF 90 88 80
	clv		; B8
	ldy #$0098.w		; A0 98 00
	sec		; 38
	brk $38.b		; 00 38
	bcs  -8.b		; B0 F8
	sbc $FFFF.w,Y		; F9 FF FF
	sbc $B89898.l,X		; FF 98 98 B8
	clv		; B8
	clv		; B8
	clv		; B8
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sed		; F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	.db $42, $42		; 42 42
	.db $82, $82, $00		; 82 82 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $231313.l		; 0F 13 13 23
	and $43.b,S		; 23 43
	eor $86.b,S		; 43 86
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($7C1C.w,X)		; 7C 1C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $9C7C.w		; 9C 7C 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $82		; 42 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$09		; C2 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $20.b		; 00 20
	jsr $4040.w		; 20 40 40
	sta ($80.b,X)		; 81 80
	brk $81.b		; 00 81
	ora ($81.b,X)		; 01 81
	ora ($FF.b,X)		; 01 FF
	eor ($FF.b,X)		; 41 FF
	adc $20207F.l,X		; 7F 7F 20 20
	rti		; 40

	rti		; 40

	sta ($81.b,X)		; 81 81
	sta ($81.b,X)		; 81 81
	sta ($81.b,X)		; 81 81
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$80C0.w		; C0 C0 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $111D15.l,X		; FF 15 1D 11
	and $2D01.w,X		; 3D 01 2D
	ora ($1D.b,X)		; 01 1D
	ora ($19.b,X)		; 01 19
	ora $9B.b,S		; 03 9B
	ora $FFFFFF.l		; 0F FF FF FF
	ora [$1F.b],Y		; 17 1F
	and $1B.b,X		; 35 1B
	and $1D13.w		; 2D 13 1D
	ora $19.b,S		; 03 19
	ora [$9B.b]		; 07 9B
	sta [$FF.b]		; 87 FF
	sbc $90FFFF.l,X		; FF FF FF 90
	dey		; 88
	bra -72.b		; 80 B8
	ldy #$0098.w		; A0 98 00
	sec		; 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	sbc ($F9.b),Y		; F1 F9
	sbc $9898FF.l,X		; FF FF 98 98
	clv		; B8
	clv		; B8
	clv		; B8
	clv		; B8
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sbc $FFF9.w,Y		; F9 F9 FF
	sbc $404040.l,X		; FF 40 40 40
	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	.db $42, $42		; 42 42
	.db $82, $82, $00		; 82 82 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $231313.l		; 0F 13 13 23
	and $43.b,S		; 23 43
	eor $86.b,S		; 43 86
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($7C1C.w,X)		; 7C 1C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $9C7C.w		; 9C 7C 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $82		; 42 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$09		; C2 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $20.b		; 00 20
	jsr $4040.w		; 20 40 40
	sta ($80.b,X)		; 81 80
	brk $81.b		; 00 81
	ora ($81.b,X)		; 01 81
	ora ($81.b,X)		; 01 81
	eor ($FF.b,X)		; 41 FF
	adc $20207F.l,X		; 7F 7F 20 20
	rti		; 40

	rti		; 40

	sta ($81.b,X)		; 81 81
	sta ($81.b,X)		; 81 81
	sta ($81.b,X)		; 81 81
	sta ($81.b,X)		; 81 81
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	cpy #$8040.w		; C0 40 80
	cpy #$8080.w		; C0 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$80C0.w		; C0 C0 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra  -1.b		; 80 FF
	sbc $15FFFF.l,X		; FF FF FF 15
	ora $3D11.w,X		; 1D 11 3D
	ora ($2D.b,X)		; 01 2D
	ora ($1D.b,X)		; 01 1D
	ora ($19.b,X)		; 01 19
	ora $1B.b,S		; 03 1B
	ora #$FF89.w		; 09 89 FF
	sbc $351F17.l,X		; FF 17 1F 35
	tas		; 1B
	and $1D13.w		; 2D 13 1D
	ora $19.b,S		; 03 19
	ora [$1B.b]		; 07 1B
	ora [$8F.b]		; 07 8F
	sta $90FFFF.l		; 8F FF FF 90
	dey		; 88
	bra -72.b		; 80 B8
	ldy #$0098.w		; A0 98 00
	sec		; 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	cmp ($F9.b,X)		; C1 F9
	sbc $9898FF.l,X		; FF FF 98 98
	clv		; B8
	clv		; B8
	clv		; B8
	clv		; B8
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sbc $FFF9.w,Y		; F9 F9 FF
	sbc $404040.l,X		; FF 40 40 40
	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	.db $42, $42		; 42 42
	.db $82, $82, $00		; 82 82 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $231313.l		; 0F 13 13 23
	and $43.b,S		; 23 43
	eor $86.b,S		; 43 86
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($7C1C.w,X)		; 7C 1C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $9C7C.w		; 9C 7C 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $82		; 42 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$09		; C2 09
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $CE.b,X		; 15 CE
	phx		; DA
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFD3.l,X		; FF D3 FF 01
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000202.l,X		; FF 02 02 00
	brk $0B.b		; 00 0B
	brk $D3.b		; 00 D3
	sbc $000203.l,X		; FF 03 02 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000204.l,X		; FF 04 02 00
	brk $F6.b		; 00 F6
	sbc $05FFCB.l,X		; FF CB FF 05
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $06FFCB.l,X		; FF CB FF 06
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $CB.b		; 00 CB
	sbc $000207.l,X		; FF 07 02 00
	brk $0E.b		; 00 0E
	brk $CB.b		; 00 CB
	sbc $000208.l,X		; FF 08 02 00
	brk $20.b		; 00 20
	jsr $4040.w		; 20 40 40
	sta ($80.b,X)		; 81 80
	brk $81.b		; 00 81
	ora ($81.b,X)		; 01 81
	ora ($81.b,X)		; 01 81
	eor ($C1.b,X)		; 41 C1
	adc $20207F.l,X		; 7F 7F 20 20
	rti		; 40

	rti		; 40

	sta ($81.b,X)		; 81 81
	sta ($81.b,X)		; 81 81
	sta ($81.b,X)		; 81 81
	sta ($81.b,X)		; 81 81
	cmp ($C1.b,X)		; C1 C1
	adc $40C07F.l,X		; 7F 7F C0 40
	bra -64.b		; 80 C0
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$80C0.w		; C0 C0 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra  -1.b		; 80 FF
	sbc $111D15.l,X		; FF 15 1D 11
	and $2D01.w,X		; 3D 01 2D
	ora ($1D.b,X)		; 01 1D
	ora ($19.b,X)		; 01 19
	ora $1B.b,S		; 03 1B
	ora #$FF09.w		; 09 09 FF
	sbc $351F17.l,X		; FF 17 1F 35
	tas		; 1B
	and $1D13.w		; 2D 13 1D
	ora $19.b,S		; 03 19
	ora [$1B.b]		; 07 1B
	ora [$0F.b]		; 07 0F
	ora $90FFFF.l		; 0F FF FF 90
	dey		; 88
	bra -72.b		; 80 B8
	ldy #$0098.w		; A0 98 00
	sec		; 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	cmp ($F9.b,X)		; C1 F9
	sbc $9898FF.l,X		; FF FF 98 98
	clv		; B8
	clv		; B8
	clv		; B8
	clv		; B8
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sec		; 38
	sbc $FFF9.w,Y		; F9 F9 FF
	sbc $404040.l,X		; FF 40 40 40
	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	ora ($11.b),Y		; 11 11
	and $21.b,S		; 23 21
	.db $42, $42		; 42 42
	.db $82, $82, $00		; 82 82 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $231313.l		; 0F 13 13 23
	and $43.b,S		; 23 43
	eor $86.b,S		; 43 86
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	asl $F8.b		; 06 F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	jmp ($7C1C.w,X)		; 7C 1C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F8FE.w,X		; FE FE F8
	sed		; F8
	jsr ($7CFC.w,X)		; FC FC 7C
	stz $9C7C.w		; 9C 7C 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($43.b,X)		; 01 43
	ora ($43.b,X)		; 01 43
	.db $42, $82		; 42 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($437C.w,X)		; 7C 7C 43
	eor $43.b,S		; 43 43
	eor $C2.b,S		; 43 C2
	rep #$42		; C2 42
	xce		; FB
	brk $0E.b		; 00 0E
	asl $BC.b		; 06 BC
	brk $0E.b		; 00 0E
	asl $B5.b		; 06 B5
	ora $B6.b,X		; 15 B6
	brk $00.b		; 00 00
	lda [$B6.b],Y		; B7 B6
	ldx $B8.b,Y		; B6 B8
	asl $B900.w		; 0E 00 B9
	lda [$B7.b],Y		; B7 B7
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
	ldx $C1BE.w,Y		; BE BE C1
	lda $08C2BF.l,X		; BF BF C2 08
	cpy #$C1C3.w		; C0 C3 C1
	cmp ($C4.b,X)		; C1 C4
	rep #$C0		; C2 C0
	cmp $08.b		; C5 08
	eor #$C5C6.w		; 49 C6 C5
	php		; 08
	cmp [$C3.b]		; C7 C3
	cmp $C8.b,S		; C3 C8
	php		; 08
	ora $C9.b,S		; 03 C9
	php		; 08
	php		; 08
	dex		; CA
	php		; 08
	eor $0040.w		; 4D 40 00
	trb $C800.w		; 1C 00 C8
	ora ($08.b,X)		; 01 08
	cop $C8.b		; 02 C8
	php		; 08
	tsb $08.b		; 04 08
	ora $08.b		; 05 08
	asl $08.b		; 06 08
	ora [$C9.b]		; 07 C9
	php		; 08
	ora #$0A08.w		; 09 08 0A
	php		; 08
	phd		; 0B
	php		; 08
	tsb $0D08.w		; 0C 08 0D
	php		; 08
	ora ($08.b,X)		; 01 08
	cop $C8.b		; 02 C8
	php		; 08
	tsb $08.b		; 04 08
	ora $08.b		; 05 08
	asl $08.b		; 06 08
	ora [$C9.b]		; 07 C9
	php		; 08
	ora #$0A08.w		; 09 08 0A
	php		; 08
	phd		; 0B
	php		; 08
	tsb $0D08.w		; 0C 08 0D
	php		; 08
	ora ($08.b,X)		; 01 08
	cop $C8.b		; 02 C8
	php		; 08
	tsb $08.b		; 04 08
	ora $08.b		; 05 08
	asl $C4.b		; 06 C4
	ora $081008.l		; 0F 08 10 08
	ora ($08.b),Y		; 11 08
	ora ($08.b)		; 12 08
	ora ($08.b,S),Y		; 13 08
	trb $08.b		; 14 08
	ora $08.b,X		; 15 08
	asl $08.b,X		; 16 08
	ora [$08.b],Y		; 17 08
	clc		; 18
	php		; 08
	ora $1A08.w,Y		; 19 08 1A
	php		; 08
	tas		; 1B
	php		; 08
	ora $081008.l		; 0F 08 10 08
	ora ($08.b),Y		; 11 08
	ora ($08.b)		; 12 08
	ora ($08.b,S),Y		; 13 08
	trb $08.b		; 14 08
	ora $08.b,X		; 15 08
	asl $08.b,X		; 16 08
	ora [$08.b],Y		; 17 08
	clc		; 18
	php		; 08
	ora $1A08.w,Y		; 19 08 1A
	php		; 08
	tas		; 1B
	php		; 08
	ora $081008.l		; 0F 08 10 08
	ora ($08.b),Y		; 11 08
	ora ($08.b)		; 12 08
	ora ($08.b,S),Y		; 13 08
	trb $C4.b		; 14 C4
	trb $1D08.w		; 1C 08 1D
	php		; 08
	asl $1F08.w,X		; 1E 08 1F
	php		; 08
	jsr $2108.w		; 20 08 21
	php		; 08
	jsl $082308.l		; 22 08 23 08
	bit $08.b		; 24 08
	and $08.b		; 25 08
	rol $08.b		; 26 08
	and [$08.b]		; 27 08
	plp		; 28
	php		; 08
	trb $1D08.w		; 1C 08 1D
	php		; 08
	asl $1F08.w,X		; 1E 08 1F
	php		; 08
	jsr $2108.w		; 20 08 21
	php		; 08
	jsl $082308.l		; 22 08 23 08
	bit $08.b		; 24 08
	and $08.b		; 25 08
	rol $08.b		; 26 08
	and [$08.b]		; 27 08
	plp		; 28
	php		; 08
	trb $1D08.w		; 1C 08 1D
	php		; 08
	asl $1F08.w,X		; 1E 08 1F
	php		; 08
	jsr $2108.w		; 20 08 21
	cpy $29.b		; C4 29
	php		; 08
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
	and $08.b,X		; 35 08
	and #$2A08.w		; 29 08 2A
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
	and $08.b,X		; 35 08
	and #$2A08.w		; 29 08 2A
	php		; 08
	pld		; 2B
	php		; 08
	bit $2D08.w		; 2C 08 2D
	php		; 08
	rol $36C4.w		; 2E C4 36
	php		; 08
	and [$08.b],Y		; 37 08
	sec		; 38
	php		; 08
	and $3A08.w,Y		; 39 08 3A
	php		; 08
	tsa		; 3B
	php		; 08
	bit $3D08.w,X		; 3C 08 3D
	php		; 08
	rol $3F08.w,X		; 3E 08 3F
	php		; 08
	rti		; 40

	php		; 08
	eor ($08.b,X)		; 41 08
	.db $42, $08		; 42 08
	rol $08.b,X		; 36 08
	and [$08.b],Y		; 37 08
	sec		; 38
	php		; 08
	and $3A08.w,Y		; 39 08 3A
	php		; 08
	tsa		; 3B
	php		; 08
	bit $3D08.w,X		; 3C 08 3D
	php		; 08
	rol $3F08.w,X		; 3E 08 3F
	php		; 08
	rti		; 40

	php		; 08
	eor ($08.b,X)		; 41 08
	.db $42, $08		; 42 08
	rol $08.b,X		; 36 08
	and [$08.b],Y		; 37 08
	sec		; 38
	php		; 08
	and $3A08.w,Y		; 39 08 3A
	php		; 08
	tsa		; 3B
	cpy $43.b		; C4 43
	php		; 08
	mvp $45,$08		; 44 08 45
	php		; 08
	lsr $08.b		; 46 08
	eor [$08.b]		; 47 08
	pha		; 48
	dec $4A.b		; C6 4A
	php		; 08
	phk		; 4B
	php		; 08
	jmp $08CA.w		; 4C CA 08
	lsr $4F08.w		; 4E 08 4F
	php		; 08
	eor $08.b,S		; 43 08
	mvp $45,$08		; 44 08 45
	php		; 08
	lsr $08.b		; 46 08
	eor [$08.b]		; 47 08
	pha		; 48
	dec $4A.b		; C6 4A
	php		; 08
	phk		; 4B
	php		; 08
	jmp $08CA.w		; 4C CA 08
	lsr $4F08.w		; 4E 08 4F
	php		; 08
	eor $08.b,S		; 43 08
	mvp $45,$08		; 44 08 45
	php		; 08
	lsr $08.b		; 46 08
	eor [$08.b]		; 47 08
	pha		; 48
	cpy $50.b		; C4 50
	php		; 08
	eor ($08.b),Y		; 51 08
	eor ($08.b)		; 52 08
	eor ($08.b,S),Y		; 53 08
	mvn $55,$08		; 54 08 55
	php		; 08
	lsr $08.b,X		; 56 08
	eor [$08.b],Y		; 57 08
	cli		; 58
	php		; 08
	eor $5A08.w,Y		; 59 08 5A
	php		; 08
	tad		; 5B
	php		; 08
	jmp $085008.l		; 5C 08 50 08
	eor ($08.b),Y		; 51 08
	eor ($08.b)		; 52 08
	eor ($08.b,S),Y		; 53 08
	mvn $55,$08		; 54 08 55
	php		; 08
	lsr $08.b,X		; 56 08
	eor [$08.b],Y		; 57 08
	cli		; 58
	php		; 08
	eor $5A08.w,Y		; 59 08 5A
	php		; 08
	tad		; 5B
	php		; 08
	jmp $085008.l		; 5C 08 50 08
	eor ($08.b),Y		; 51 08
	eor ($08.b)		; 52 08
	eor ($08.b,S),Y		; 53 08
	mvn $55,$08		; 54 08 55
	cpy $5D.b		; C4 5D
	php		; 08
	lsr $5F08.w,X		; 5E 08 5F
	php		; 08
	rts		; 60

	php		; 08
	adc ($08.b,X)		; 61 08
	.db $62, $08, $63		; 62 08 63
	php		; 08
	stz $08.b		; 64 08
	adc $08.b		; 65 08
	ror $08.b		; 66 08
	adc [$CA.b]		; 67 CA
	dey		; 88
	pla		; 68
	php		; 08
	eor $5E08.w,X		; 5D 08 5E
	php		; 08
	eor $086008.l,X		; 5F 08 60 08
	adc ($08.b,X)		; 61 08
	.db $62, $08, $63		; 62 08 63
	php		; 08
	stz $08.b		; 64 08
	adc $08.b		; 65 08
	ror $08.b		; 66 08
	adc [$CA.b]		; 67 CA
	dey		; 88
	pla		; 68
	php		; 08
	eor $5E08.w,X		; 5D 08 5E
	php		; 08
	eor $086008.l,X		; 5F 08 60 08
	adc ($08.b,X)		; 61 08
	.db $62, $C4, $69		; 62 C4 69
	php		; 08
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
	adc ($08.b)		; 72 08
	adc ($08.b,S),Y		; 73 08
	stz $08.b,X		; 74 08
	adc $08.b,X		; 75 08
	adc #$6A08.w		; 69 08 6A
	php		; 08
	rtl		; 6B

	php		; 08
	jmp ($6D08.w)		; 6C 08 6D
	php		; 08
	ror $6F08.w		; 6E 08 6F
	php		; 08
	bvs   8.b		; 70 08
	adc ($08.b),Y		; 71 08
	adc ($08.b)		; 72 08
	adc ($08.b,S),Y		; 73 08
	stz $08.b,X		; 74 08
	adc $08.b,X		; 75 08
	adc #$6A08.w		; 69 08 6A
	php		; 08
	rtl		; 6B

	php		; 08
	jmp ($6D08.w)		; 6C 08 6D
	php		; 08
	ror $76C4.w		; 6E C4 76
	php		; 08
	adc [$08.b],Y		; 77 08
	sei		; 78
	php		; 08
	adc $7A08.w,Y		; 79 08 7A
	php		; 08
	tda		; 7B
	php		; 08
	jmp ($7D08.w,X)		; 7C 08 7D
	php		; 08
	ror $7F08.w,X		; 7E 08 7F
	php		; 08
	bra   8.b		; 80 08
	sta ($08.b,X)		; 81 08
	.db $82, $08, $76		; 82 08 76
	php		; 08
	adc [$08.b],Y		; 77 08
	sei		; 78
	php		; 08
	adc $7A08.w,Y		; 79 08 7A
	php		; 08
	tda		; 7B
	php		; 08
	jmp ($7D08.w,X)		; 7C 08 7D
	php		; 08
	ror $7F08.w,X		; 7E 08 7F
	php		; 08
	bra   8.b		; 80 08
	sta ($08.b,X)		; 81 08
	.db $82, $08, $76		; 82 08 76
	php		; 08
	adc [$08.b],Y		; 77 08
	sei		; 78
	php		; 08
	adc $7A08.w,Y		; 79 08 7A
	php		; 08
	tda		; 7B
	cpy $83.b		; C4 83
	php		; 08
	sty $08.b		; 84 08
	sta $08.b		; 85 08
	stx $08.b		; 86 08
	sta [$08.b]		; 87 08
	dey		; 88
	php		; 08
	bit #$8A08.w		; 89 08 8A
	php		; 08
	phb		; 8B
	php		; 08
	sty $8D08.w		; 8C 08 8D
	php		; 08
	stx $8F08.w		; 8E 08 8F
	php		; 08
	sta $08.b,S		; 83 08
	sty $08.b		; 84 08
	sta $08.b		; 85 08
	stx $08.b		; 86 08
	sta [$08.b]		; 87 08
	dey		; 88
	php		; 08
	bit #$8A08.w		; 89 08 8A
	php		; 08
	phb		; 8B
	php		; 08
	sty $8D08.w		; 8C 08 8D
	php		; 08
	stx $8F08.w		; 8E 08 8F
	php		; 08
	sta $08.b,S		; 83 08
	sty $08.b		; 84 08
	sta $08.b		; 85 08
	stx $08.b		; 86 08
	sta [$08.b]		; 87 08
	dey		; 88
	cpy $90.b		; C4 90
	php		; 08
	sta ($08.b),Y		; 91 08
	sta ($08.b)		; 92 08
	sta ($08.b,S),Y		; 93 08
	sty $08.b,X		; 94 08
	sta $08.b,X		; 95 08
	stx $08.b,Y		; 96 08
	sta [$08.b],Y		; 97 08
	tya		; 98
	php		; 08
	sta $9A08.w,Y		; 99 08 9A
	php		; 08
	txy		; 9B
	php		; 08
	stz $9008.w		; 9C 08 90
	php		; 08
	sta ($08.b),Y		; 91 08
	sta ($08.b)		; 92 08
	sta ($08.b,S),Y		; 93 08
	sty $08.b,X		; 94 08
	sta $08.b,X		; 95 08
	stx $08.b,Y		; 96 08
	sta [$08.b],Y		; 97 08
	tya		; 98
	php		; 08
	sta $9A08.w,Y		; 99 08 9A
	php		; 08
	txy		; 9B
	php		; 08
	stz $9008.w		; 9C 08 90
	php		; 08
	sta ($08.b),Y		; 91 08
	sta ($08.b)		; 92 08
	sta ($08.b,S),Y		; 93 08
	sty $08.b,X		; 94 08
	sta $C4.b,X		; 95 C4
	sta $9E08.w,X		; 9D 08 9E
	php		; 08
	sta $08A008.l,X		; 9F 08 A0 08
	lda ($08.b,X)		; A1 08
	ldx #$A3C6.w		; A2 C6 A3
	php		; 08
	ldy $08.b		; A4 08
	lda $C6.b		; A5 C6
	ldx $08.b		; A6 08
	lda [$08.b]		; A7 08
	sta $9E08.w,X		; 9D 08 9E
	php		; 08
	sta $08A008.l,X		; 9F 08 A0 08
	lda ($08.b,X)		; A1 08
	ldx #$A3C6.w		; A2 C6 A3
	php		; 08
	ldy $08.b		; A4 08
	lda $C6.b		; A5 C6
	ldx $08.b		; A6 08
	lda [$08.b]		; A7 08
	sta $9E08.w,X		; 9D 08 9E
	php		; 08
	sta $08A008.l,X		; 9F 08 A0 08
	lda ($08.b,X)		; A1 08
	ldx #$A8C4.w		; A2 C4 A8
	php		; 08
	lda #$AA08.w		; A9 08 AA
	php		; 08
	plb		; AB
	php		; 08
	ldy $AD08.w		; AC 08 AD
	php		; 08
	ldx $AF08.w		; AE 08 AF
	dec $B0.b		; C6 B0
	php		; 08
	lda ($08.b),Y		; B1 08
	lda ($08.b)		; B2 08
	lda ($08.b,S),Y		; B3 08
	ldy $08.b,X		; B4 08
	lda #$AA08.w		; A9 08 AA
	php		; 08
	plb		; AB
	php		; 08
	ldy $AD08.w		; AC 08 AD
	php		; 08
	ldx $AF08.w		; AE 08 AF
	dec $B0.b		; C6 B0
	php		; 08
	lda ($08.b),Y		; B1 08
	lda ($08.b)		; B2 08
	lda ($08.b,S),Y		; B3 08
	ldy $08.b,X		; B4 08
	lda #$AA08.w		; A9 08 AA
	php		; 08
	plb		; AB
	php		; 08
	ldy $AD08.w		; AC 08 AD
.ACCU 16
.INDEX 16
	rep #$BE		; C2 BE
	ldy $B8BA.w,X		; BC BA B8
	asl $C7C7.w		; 0E C7 C7
	cmp [$C3.b]		; C7 C3
	lda $00.b,X		; B5 00
	brk $26.b		; 00 26
	xce		; FB
	brk $16.b		; 00 16
	ldy #$0004.w		; A0 04 00
	and $D349.w		; 2D 49 D3
	bit $95.b,X		; 34 95
	ror $393C.w		; 6E 3C 39
	tas		; 1B
	txa		; 8A
	sty $90.b		; 84 90
	php		; 08
	bpl  59.b		; 10 3B
	ora ($2E.b,X)		; 01 2E
	clc		; 18
	cmp #$D92F.w		; C9 2F D9
	and #$18F1.w		; 29 F1 18
	eor $08.b,S		; 43 08
	bvc  68.b		; 50 44
	eor ($D2.b,X)		; 41 D2
	adc #$50F5.w		; 69 F5 50
	bit #$3543.w		; 89 43 35
	bit $99.b		; 24 99
	and ($12.b),Y		; 31 12
	lda $9D565A.l,X		; BF 5A 56 9D
	inc $4D.b		; E6 4D
	mvp $CE,$F2		; 44 F2 CE
	lda $4AA2.w,Y		; B9 A2 4A
	sta ($9A.b,S),Y		; 93 9A
	sbc [$CD.b],Y		; F7 CD
	bit $88.b		; 24 88
	sta ($FE.b),Y		; 91 FE
	sta $8A.b,X		; 95 8A
	sbc [$A7.b],Y		; F7 A7
	pld		; 2B
	phk		; 4B
	inc $93.b		; E6 93
	cmp $8F27.w,Y		; D9 27 8F
	cmp ($7B.b,S),Y		; D3 7B
	adc $96.b		; 65 96
	lda [$26.b]		; A7 26
	cmp $BB76AA.l		; CF AA 76 BB
	and ($E9.b)		; 32 E9
	sbc $4D.b		; E5 4D
	eor $96.b,X		; 55 96
	sbc $6636.w,X		; FD 36 66
	dec $4F.b,X		; D6 4F
	cmp [$24.b],Y		; D7 24
	lda ($54.b,S),Y		; B3 54
	pei ($49.b)		; D4 49
	jsr ($1591.w,X)		; FC 91 15
	and [$59.b],Y		; 37 59
	jsl $F2AF93.l		; 22 93 AF F2
	xba		; EB
	ror $5997.w		; 6E 97 59
	rol A		; 2A
	bit $5997.w		; 2C 97 59
	lda $BA.b		; A5 BA
	cpy $4640.w		; CC 40 46
	plb		; AB
	trb $4A.b		; 14 4A
	plb		; AB
	cmp [$FA.b],Y		; D7 FA
	ora ($7A.b)		; 12 7A
	cpy #$8815.w		; C0 15 88
	pld		; 2B
	inc $1E.b,X		; F6 1E
	bmi -77.b		; 30 B3
	pla		; 68
	sbc $56.b,S		; E3 56
	ror $66.b		; 66 66
	sta [$3D.b],Y		; 97 3D
	sta $94.b,X		; 95 94
	bit $84.b,X		; 34 84
	eor $C9.b		; 45 C9
	adc ($5E.b)		; 72 5E
	ora [$65.b],Y		; 17 65
	cld		; D8
	plb		; AB
	lsr $D2AE.w,X		; 5E AE D2
	lda $7C.b		; A5 7C
	ror $37.b		; 66 37
.ACCU 8
	sep #$E3		; E2 E3
	adc $16E0.w,Y		; 79 E0 16
	phd		; 0B
	rol $D4.b		; 26 D4
	cmp $1D.b,X		; D5 1D
	lda $8CE6.w,Y		; B9 E6 8C
	ora $5F46.w,X		; 1D 46 5F
	lda $FC5F.w,X		; BD 5F FC
	iny		; C8
	rol $91.b,X		; 36 91
	cmp $D89F.w,X		; DD 9F D8
	rol A		; 2A
	sbc $63.b,S		; E3 63
	eor $51.b		; 45 51
	phx		; DA
	and ($C7.b),Y		; 31 C7
	sta $5015.w		; 8D 15 50
	ora $64A9.w		; 0D A9 64
	sbc $0D.b,X		; F5 0D
	eor ($B5.b),Y		; 51 B5
	bit $B40A.w		; 2C 0A B4
	eor ($95.b),Y		; 51 95
	adc ($A2.b,X)		; 61 A2
	phb		; 8B
	jmp ($E0EC.w)		; 6C EC E0
	trb $8A.b		; 14 8A
	lda $22.b		; A5 22
	sta $5C70.w,Y		; 99 70 5C
	asl A		; 0A
	lda ($DD.b)		; B2 DD
	and ($32.b)		; 32 32
	eor #$94.b		; 49 94
	xce		; FB
	ldy $7F.b,X		; B4 7F
	inx		; E8
	asl $81.b		; 06 81
	lda $34.b		; A5 34
	ldx $BC.b		; A6 BC
	sbc $15E20F.l		; EF 0F E2 15
	stz $74.b,X		; 74 74
	ora $57.b,X		; 15 57
	adc #$51.b		; 69 51
	phx		; DA
	brk $5D.b		; 00 5D
	bpl  85.b		; 10 55
	sta ($D4.b,S),Y		; 93 D4
	asl $BE.b,X		; 16 BE
	bit $D4.b,X		; 34 D4
	plx		; FA
	inc $DECC.w,X		; FE CC DE
	pei ($5F.b)		; D4 5F
	cpy $76E2.w		; CC E2 76
	and [$41.b],Y		; 37 41
	lda $2D.b,X		; B5 2D
	stz $E019.w,X		; 9E 19 E0
	sta $CE6FF2.l,X		; 9F F2 6F CE
	brk $C1.b		; 00 C1
	sbc ($FF.b,S),Y		; F3 FF
	stz $DB.b,X		; 74 DB
	.db $82, $0F, $FF		; 82 0F FF
	ora ($86.b,S),Y		; 13 86
	rol A		; 2A
	inx		; E8
	inx		; E8
	wai		; CB
	xce		; FB
	dec $D6BB.w,X		; DE BB D6
	cpy $DC.b		; C4 DC
	phk		; 4B
	sbc $1A00.w,X		; FD 00 1A
	eor $E5.b,S		; 43 E5
	ora $DAA1.w,X		; 1D A1 DA
	stz $FD33.w		; 9C 33 FD
	cmp $55.b		; C5 55
	lda [$6D.b],Y		; B7 6D
	.db $82, $C0, $02		; 82 C0 02
	sta $2A06.w,Y		; 99 06 2A
	cmp #$65.b		; C9 65
	sbc $AB4D.w,Y		; F9 4D AB
	jmp $E6A0C7.l		; 5C C7 A0 E6
	brk $54.b		; 00 54
	and $6C7C79.l,X		; 3F 79 7C 6C
	ora $AB61.w		; 0D 61 AB
	tsb $44.b		; 04 44
	mvp $48,$44		; 44 44 48
	ora ($9F.b,S),Y		; 13 9F
	sty $FA.b		; 84 FA
	sbc ($7F.b)		; F2 7F
	lda $06.b,S		; A3 06
	inc $144F.w		; EE 4F 14
	inc $0EB2.w,X		; FE B2 0E
	sta ($36.b,S),Y		; 93 36
	phb		; 8B
	eor ($D9.b)		; 52 D9
	plb		; AB
	stz $C1.b,X		; 74 C1
	adc [$E5.b],Y		; 77 E5
	sbc ($50.b),Y		; F1 50
	bne  32.b		; D0 20
	cpy $E24E.w		; CC 4E E2
	adc $ACFD29.l		; 6F 29 FD AC
	tas		; 1B
	beq -98.b		; F0 9E
	bit #$F3.b		; 89 F3
	pha		; 48
	tsa		; 3B
	cpx $F5.b		; E4 F5
	.db $62, $BF, $E4		; 62 BF E4
	jmp.w [$6F30]		; DC 30 6F
	stx $9366.w		; 8E 66 93
	bcc 115.b		; 90 73
	ora ($E6.b)		; 12 E6
	cmp $5C30.w,X		; DD 30 5C
	inc $EB.b,X		; F6 EB
	ora ($A0.b,X)		; 01 A0
	eor ($94.b,X)		; 41 94
	dec $79.b		; C6 79
	pea $9859.w		; F4 59 98
	rol $E0.b,X		; 36 E0
	cmp ($17.b)		; D2 17
	bit $1C.b		; 24 1C
	sbc ($A3.b,S),Y		; F3 A3
.INDEX 8
	sep #$51		; E2 51
	sbc $AD1B0C.l,X		; FF 0C 1B AD
	rol $E7.b,X		; 36 E7
	sbc ($90.b,S),Y		; F3 90
	adc [$C7.b],Y		; 77 C7
	sbc #$BB.b		; E9 BB
	cmp [$53.b],Y		; D7 53
	sta $7EC19C.l,X		; 9F 9C C1 7E
	eor ($BE.b,X)		; 41 BE
	dec A		; 3A
	and $E9.b		; 25 E9
	asl $4B.b		; 06 4B
	sbc [$64.b],Y		; F7 64
	sbc #$C5.b		; E9 C5
	sbc ($98.b)		; F2 98
	tya		; 98
	and $739AEF.l		; 2F EF 9A 73
	sbc [$95.b],Y		; F7 95
	dey		; 88
	and ($3F.b)		; 32 3F
	xce		; FB
	cpx $6F.b		; E4 6F
	ldx $D5.b		; A6 D5
	bmi 111.b		; 30 6F
	sbc ($1B.b)		; F2 1B
	cmp ($32.b)		; D2 32
	asl $FEF2.w		; 0E F2 FE
	phb		; 8B
	phb		; 8B
	sta $DF60AA.l		; 8F AA 60 DF
	dec $61.b,X		; D6 61
	ora ($90.b),Y		; 11 90
	adc ($AC.b)		; 72 AC
	eor ($30.b),Y		; 51 30
	jmp $154079.l		; 5C 79 40 15
	dey		; 88
	and ($5E.b,S),Y		; 33 5E
	and $9E99.w,Y		; 39 99 9E
	sta ($C9.b,S),Y		; 93 C9
	rts		; 60

	cmp $E459.w,X		; DD 59 E4
	stz $0701.w,X		; 9E 01 07
	tad		; 5B
	lda [$36.b],Y		; B7 36
	sta $D8.b,S		; 83 D8
	ror $7D4C.w,X		; 7E 4C 7D
	sty $97DF.w		; 8C DF 97
	sta ($AC.b),Y		; 91 AC
	adc ($29.b)		; 72 29
	sta [$47.b],Y		; 97 47
	stz $76.b		; 64 76
	ror $49.b		; 66 49
	inc $0E.b,X		; F6 0E
	sta ($80.b,X)		; 81 80
	and $3014.w		; 2D 14 30
	sei		; 78
	eor ($20.b)		; 52 20
	.db $42, $5C		; 42 5C
	inx		; E8
	ldx $6599.w		; AE 99 65
	sbc #$B6.b		; E9 B6
	txy		; 9B
	eor $5CAB.w		; 4D AB 5C
	wai		; CB
	cmp ($40.b,S),Y		; D3 40
	tyx		; BB
	bit $E5.b,X		; 34 E5
	sbc ($7C.b),Y		; F1 7C
	eor $BD021B.l,X		; 5F 1B 02 BD
	lsr $26.b,X		; 56 26
	plp		; 28
	ror $FCC5.w		; 6E C5 FC
	lda $B71C05.l,X		; BF 05 1C B7
	sbc ($B0.b,X)		; E1 B0
	lsr $2B.b,X		; 56 2B
	ora $8C.b,X		; 15 8C
	cmp ($B9.b,S),Y		; D3 B9
	rol $47.b,X		; 36 47
	bvs 101.b		; 70 65
	cli		; 58
	adc [$67.b]		; 67 67
	txy		; 9B
	eor $99.b		; 45 99
	txs		; 9A
	jmp $A55AF6.l		; 5C F6 5A A5
	cmp ($70.b,X)		; C1 70
	adc #$0B.b		; 69 0B
	sta ($E4.b)		; 92 E4
	ldy $C82E.w,X		; BC 2E C8
	nop		; EA
	adc ($B1.b),Y		; 71 B1
	adc $CA.b,S		; 63 CA
	stz $7A.b		; 64 7A
	sta $EE7E.w,Y		; 99 7E EE
	and $63130F.l,X		; 3F 0F 13 63
	stz $C2.b		; 64 C2
	and $E6.b,X		; 35 E6
	sty $ED.b,X		; 94 ED
	stx $DCF0.w		; 8E F0 DC
	ora $0523.w,Y		; 19 23 05
	sbc $36.b,X		; F5 36
	cmp ($FD.b),Y		; D1 FD
	and $4ABC.w,Y		; 39 BC 4A
	sbc [$84.b],Y		; F7 84
	ora [$C5.b],Y		; 17 C5
	and $19EC49.l,X		; 3F 49 EC 19
	inc $56.b		; E6 56
	eor $7C.b,X		; 55 7C
	eor [$8C.b],Y		; 57 8C
	sbc $6C72.w,Y		; F9 72 6C
	xba		; EB
	sbc $45.b,S		; E3 45
	eor $8B.b,X		; 55 8B
	lsr $1F61.w,X		; 5E 61 1F
	cli		; 58
	jsr ($1C27.w,X)		; FC 27 1C
	phx		; DA
	stx $0A.b,Y		; 96 0A
.ACCU 16
	rep #$E6		; C2 E6
	cmp $8656.w,Y		; D9 56 86
	stx $86.b		; 86 86
	txa		; 8A
	and $4085.w		; 2D 85 40
	and #$8A14.w		; 29 14 8A
	eor $22.b		; 45 22
	sta $A6BB.w,Y		; 99 BB A6
	sbc ($B8.b,X)		; E1 B8
	sei		; 78
	adc $BDE869.l,X		; 7F 69 E8 BD
	adc [$AB.b]		; 67 AB
	and [$BF.b]		; 27 BF
	jmp ($9CE0.w)		; 6C E0 9C
	ora ($F1.b,S),Y		; 13 F1
	txs		; 9A
	sta ($B5.b,S),Y		; 93 B5
	bit $C7.b,X		; 34 C7
	stz $5B.b,X		; 74 5B
	ldx $AA.b,Y		; B6 AA
	ldy $586C.w,X		; BC 6C 58
	lda $D2.b,X		; B5 D2
	jmp ($B4DA.w)		; 6C DA B4
	iny		; C8
	pld		; 2B
	php		; 08
	inc $9C.b		; E6 9C
	adc ($C1.b)		; 72 C1
	and $C72E.w,X		; 3D 2E C7
	dec A		; 3A
	ror $7F85.w,X		; 7E 85 7F
	eor $9FC7.w		; 4D C7 9F
	stp		; DB
	cmp $72F7.w,X		; DD F7 72
	sbc $1A94.w,Y		; F9 94 1A
	cmp ($58.b,S),Y		; D3 58
	adc $7C07.w,Y		; 79 07 7C
	adc [$E7.b],Y		; 77 E7
	ldy $037A.w,X		; BC 7A 03
	ora $D1.b		; 05 D1
	plx		; FA
	lda ($36.b),Y		; B1 36
	and ($6D.b)		; 32 6D
	sbc $24F8.w,Y		; F9 F8 24
	ora [$F4.b],Y		; 17 F4
	sty $8893.w		; 8C 93 88
	eor [$23.b],Y		; 57 23
	cmp ($B0.b)		; D2 B0
	adc $AC7A.w		; 6D 7A AC
	eor ($10.b)		; 52 10
	adc $82.b,X		; 75 82
	lda ($56.b),Y		; B1 56
	plb		; AB
	ora $CF.b		; 05 CF
	adc $3DC32A.l		; 6F 2A C3 3D
	.db $82, $0C, $A6		; 82 0C A6
	eor $2E.b,X		; 55 2E
	ora [$31.b]		; 07 31
	sta $63.b,S		; 83 63
	lda #$C5C6.w		; A9 C6 C5
	cmp $90.b,X		; D5 90
	adc $93.b,X		; 75 93
	php		; 08
	sta [$9A.b],Y		; 97 9A
	cpy #$8E.b		; C0 8E
	clv		; B8
	sta ($29.b,X)		; 81 29
	lda ($B1.b,S),Y		; B3 B1
	ldy $0BE6.w,X		; BC E6 0B
	dex		; CA
	dex		; CA
	lda $6F7A8B.l		; AF 8B 7A 6F
	php		; 08
	and ($5E.b,S),Y		; 33 5E
	adc ($0F.b,X)		; 61 0F
	jmp.w [$FC60]		; DC 60 FC
	stp		; DB
	and $0A8180.l,X		; 3F 80 81 0A
	stx $65.b		; 86 65
	rol $0D.b		; 26 0D
	cmp $70D3.w,X		; DD D3 70
	inx		; E8
	jsr $67EB.w		; 20 EB 67
	tsb $CF.b		; 04 CF
	ldx $C1.b		; A6 C1
	ldx $ED.b,Y		; B6 ED
	lda $0EB2.w		; AD B2 0E
	ldx $03.b		; A6 03
	tsa		; 3B
	ora $C7.b		; 05 C7
	sta $3D.b,X		; 95 3D
	rol $3AC7.w		; 2E C7 3A
	cpx #$83.b		; E0 83
	and $E5.b,X		; 35 E5
	asl $B4.b		; 06 B4
	adc ($18.b,S),Y		; 73 18
	ora ($D5.b),Y		; 11 D5
	bcc  37.b		; 90 25
	ora $EE.b,X		; 15 EE
	stx $0583.w		; 8E 83 05
	stp		; DB
	lda [$36.b],Y		; B7 36
	stx $71.b		; 86 71
	stz $41.b,X		; 74 41
	sty $CB.b,X		; 94 CB
	ldx #$BD.b		; A2 BD
	cmp ($55.b,S),Y		; D3 55
	sta $68.b,S		; 83 68
	lda $40.b,S		; A3 40
	bcs  65.b		; B0 41
	pei ($89.b)		; D4 89
	pea $1BAC.w		; F4 AC 1B
	rol $5774.w		; 2E 74 57
	eor ($10.b)		; 52 10
	adc $E9.b,X		; 75 E9
	ldy #$31.b		; A0 31
	eor $76.b,S		; 43 76
	and $28F8E5.l		; 2F E5 F8 28
	sbc $BF.b		; E5 BF
	tsb $D5BC.w		; 0C BC D5
	ldy $3356.w		; AC 56 33
	lsr $D9E4.w		; 4E E4 D9
	ora $AEC1.w,X		; 1D C1 AE
	ora ($9E.b,X)		; 01 9E
	adc $6616.w		; 6D 16 66
	adc #$D973.w		; 69 73 D9
	ror $CE.b		; 66 CE
	dec $F3.b		; C6 F3
	ldx BG1HOFS.w		; AE 0D 21
	adc ($5C.b)		; 72 5C
	sta [$85.b],Y		; 97 85
	cmp $6F7A.w,Y		; D9 7A 6F
	php		; 08
	sbc ($99.b)		; F2 99
	asl $5FA6.w,X		; 1E A6 5F
	tyx		; BB
	sta $D8C4C3.l		; 8F C3 C4 D8
	lda $E67571.l,X		; BF 71 75 E6
	sty $ED.b,X		; 94 ED
	stx $DCF0.w		; 8E F0 DC
	ora $E027.w,Y		; 19 27 E0
	ora ($57.b,X)		; 01 57
	lda #$8FB6.w		; A9 B6 8F
	sbc #$E2CD.w		; E9 CD E2
	eor [$BC.b],Y		; 57 BC
	cpy $A0A4.w		; CC A4 A0
	trb $F453.w		; 1C 53 F4
	stz $9EC1.w,X		; 9E C1 9E
	bvc   3.b		; 50 03
	dec $7C.b		; C6 7C
	lda $7536.w,Y		; B9 36 75
	sbc ($A2.b),Y		; F1 A2
	tax		; AA
	cmp $9F.b		; C5 9F
	eor $B17E.w		; 4D 7E B1
	sed		; F8
	lsr $B539.w		; 4E 39 B5
	bit $8B15.w		; 2C 15 8B
	rts		; 60

	pld		; 2B
	eor $43.b,S		; 43 43
	eor $45.b,S		; 43 45
	asl $D9.b,X		; 16 D9
	pei ($29.b)		; D4 29
	trb $8A.b		; 14 8A
	eor $22.b		; 45 22
	sta $0370.w,Y		; 99 70 03
	sta [$87.b]		; 87 87
	inc $9E.b,X		; F6 9E
	phb		; 8B
	dec $7A.b,X		; D6 7A
	lda ($7B.b)		; B2 7B
	inc $F062.w		; EE 62 F0
	eor $4E6AC6.l		; 4F C6 6A 4E
	pei ($D3.b)		; D4 D3
	ora $ABD1.w,X		; 1D D1 AB
	ora ($57.b,X)		; 01 57
	sta $168B.w		; 8D 8B 16
	tsx		; BA
	eor $569B.w		; 4D 9B 56
	pld		; 2B
	cmp $001D.w,X		; DD 1D 00
	tsb $9A23.w		; 0C 23 9A
	adc ($CB.b),Y		; 71 CB
	asl $71.b		; 06 71
	stz $4F.b,X		; 74 4F
	bne -81.b		; D0 AF
	sbc #$F3B8.w		; E9 B8 F3
	xce		; FB
	tda		; 7B
	ldx $5FEE.w,Y		; BE EE 5F
	and ($BD.b)		; 32 BD
	cmp ($57.b,S),Y		; D3 57
	cli		; 58
	adc $7C07.w,Y		; 79 07 7C
	adc [$E7.b],Y		; 77 E7
	ldy $067A.w,X		; BC 7A 06
	sta ($60.b,X)		; 81 60
	eor $A3.b,X		; 55 A3
	sbc $62.b,X		; F5 62
	jmp ($DB64.w)		; 6C 64 DB
	sbc ($F0.b,S),Y		; F3 F0
	adc [$D2.b]		; 67 D2
	tay		; A8
	ora [$D2.b]		; 07 D2
	and ($4E.b)		; 32 4E
	and ($5C.b,X)		; 21 5C
	bcc   7.b		; 90 07
	bcs  -4.b		; B0 FC
	tya		; 98
	xce		; FB
	ora $2FBF.w,Y		; 19 BF 2F
	and $58.b,S		; 23 58
	cpx $47.b		; E4 47
	lda $5E.b		; A5 5E
	iny		; C8
	cpx $93CC.w		; EC CC 93
	cpx $031D.w		; EC 1D 03
	brk $90.b		; 00 90
	asl $0F.b		; 06 0F
	plb		; AB
	eor $48.b,X		; 55 48
	rol $0CC0.w,X		; 3E C0 0C
	lda ($F4.b)		; B2 F4
	stp		; DB
	eor $D5A6.w		; 4D A6 D5
	ldx $9863.w		; AE 63 98
	lda [$66.b],Y		; B7 66
	stz $2FBE.w		; 9C BE 2F
	phb		; 8B
	sbc $60.b,S		; E3 60
	ror A		; 6A
	cpy #$60.b		; C0 60
	tsx		; BA
	plp		; 28
	stz $3BDB.w,X		; 9E DB 3B
	and ($05.b),Y		; 31 05
	cmp ($29.b)		; D2 29
	sta [$05.b],Y		; 97 05
	iny		; C8
	cmp ($71.b,X)		; C1 71
	mvp $C4,$C4		; 44 C4 C4
	cpy $41.b		; C4 41
	adc $8A.b,X		; 75 8A
	cmp $62.b		; C5 62
	bcs -63.b		; B0 C1
	adc ($68.b,S),Y		; 73 68
	eor $A6.b,X		; 55 A6
	cmp $7936.w		; CD 36 79
	ora $DD.b		; 05 DD
	asl $CB.b,X		; 16 CB
	sta ($F0.b)		; 92 F0
	rts		; 60

	clv		; B8
	nop		; EA
	and $DA.b,X		; 35 DA
	sbc $EA.b,X		; F5 EA
	bcc  93.b		; 90 5D
	sta ($04.b,S),Y		; 93 04
	cmp ($2C.b,X)		; C1 2C
	asl A		; 0A
	plb		; AB
	eor $19.b		; 45 19
	ldx $5A.b,Y		; B6 5A
	inc A		; 1A
	and [$B6.b]		; 27 B6
	brk $14.b		; 00 14
	txa		; 8A
	sta $22.b		; 85 22
	sta ($4C.b),Y		; 91 4C
	rts		; 60

	tay		; A8
	ldy $BD.b		; A4 BD
	wai		; CB
	iny		; C8
	sta ($35.b,S),Y		; 93 35
	sty $00.b,X		; 94 00
	pld		; 2B
	ora $01C6.w,Y		; 19 C6 01
	ror $8C5D.w,X		; 7E 5D 8C
	ora #$2690.w		; 09 90 26
	cmp ($79.b,X)		; C1 79
	lda $E4B1.w,Y		; B9 B1 E4
	and $206F.w,Y		; 39 6F 20
	.db $82, $EF, $CC		; 82 EF CC
	ora $E7.b,S		; 03 E7
	stz $C110.w,X		; 9E 10 C1
	lda $CAF9.w,Y		; B9 F9 CA
	ldy $1B.b		; A4 1B
	ply		; 7A
	brk $30.b		; 00 30
	eor $EC7C2B.l,X		; 5F 2B 7C EC
	stz $2E4C.w,X		; 9E 4C 2E
	cpy #$82.b		; C0 82
	sbc [$A7.b],Y		; F7 A7
	bit $0EF0.w		; 2C F0 0E
	rts		; 60

	cmp ($74.b,X)		; C1 74
	bvc -86.b		; 50 AA
	ldy $17.b		; A4 17
	pha		; 48
	.db $82, $95, $56		; 82 95 56
	jmp $E9DD.w		; 4C DD E9
	and $518B56.l,X		; 3F 56 8B 51
	sbc $00.b		; E5 00
	ora $F8.b		; 05 F8
	txs		; 9A
	.db $62, $F8, $D7		; 62 F8 D7
	sty $141B.w		; 8C 1B 14
	jmp $444C.w		; 4C 4C 44
	tas		; 1B
	cli		; 58
	ldy $3656.w		; AC 56 36
	txs		; 9A
	bit #$BFFE.w		; 89 FE BF
	and $693BF1.l,X		; 3F F1 3B 69
	rol $57D5.w		; 2E D5 57
	ldy $7E.b		; A4 7E
	adc $ED.b,S		; 63 ED
	stz $5252.w		; 9C 52 52
	asl A		; 0A
	txa		; 8A
	and $55.b		; 25 55
	dec $A8.b		; C6 A8
	tax		; AA
	lda $88.b,X		; B5 88
	rol A		; 2A
	cmp #$3205.w		; C9 05 32
	lda ($B2.b)		; B2 B2
	wai		; CB
	cmp ($6D.b,S),Y		; D3 6D
	rol A		; 2A
	lda $76D9.w		; AD D9 76
	eor $729A.w,X		; 5D 9A 72
	sed		; F8
	.db $82, $A7, $BC		; 82 A7 BC
	txy		; 9B
	bvs  -3.b		; 70 FD
	tya		; 98
	lda [$13.b],Y		; B7 13
	ror $55E5.w,X		; 7E E5 55
	cmp $E46738.l		; CF 38 67 E4
	sec		; 38
	adc [$CB.b]		; 67 CB
	jsr $B1A8.w		; 20 A8 B1
	trb $DF4D.w		; 1C 4D DF
	txs		; 9A
	cmp $EB3E.w		; CD 3E EB
	pld		; 2B
	jmp.w [$DF55]		; DC 55 DF
	txy		; 9B
	sbc ($CF.b,S),Y		; F3 CF
	rol $014E.w		; 2E 4E 01
	dec $0F80.w,X		; DE 80 0F
	eor $8FD1A9.l,X		; 5F A9 D1 8F
	and [$1F.b]		; 27 1F
	dey		; 88
	cpx #$2A.b		; E0 2A
	lda $4D6A68.l		; AF 68 6A 4D
	bit #$32B7.w		; 89 B7 32
	php		; 08
	pld		; 2B
	lda $EBC9EC.l		; AF EC C9 EB
	.db $62, $76, $F1		; 62 76 F1
	sbc #$562D.w		; E9 2D 56
	eor $5F.b,X		; 55 5F
	tsb $8FF1.w		; 0C F1 8F
	dey		; 88
	cmp ($22.b),Y		; D1 22
	jsr $7DA9.w		; 20 A9 7D
	sei		; 78
	inc $75.b,X		; F6 75
	nop		; EA
	and $74.b,X		; 35 74
	adc [$CA.b],Y		; 77 CA
	plb		; AB
.INDEX 8
	sep #$9C		; E2 9C
	adc ($C9.b)		; 72 C9
	rts		; 60

	dec $5390.w,X		; DE 90 53
	ora $50.b		; 05 50
	bne -86.b		; D0 AA
	ldy #$01.b		; A0 01
	pha		; 48
	ldy $41.b		; A4 41
	lsr $B913.w		; 4E 13 B9
	adc [$38.b],Y		; 77 38
	ror $694B.w,X		; 7E 4B 69
	eor $71.b,X		; 55 71
	lsr $C211.w		; 4E 11 C2
	and $F822.w,X		; 3D 22 F8
	.db $82, $B2, $F2		; 82 B2 F2
	pld		; 2B
	plx		; FA
	and ($EB.b)		; 32 EB
	jmp $0BFC6A.l		; 5C 6A FC 0B
	ror $D5.b,X		; 76 D5
	bvs  15.b		; 70 0F
	plp		; 28
	sbc [$1B.b]		; E7 1B
	eor ($74.b,S),Y		; 53 74
	eor ($00.b,S),Y		; 53 00
	clc		; 18
	inx		; E8
	sed		; F8
	sbc $595C.w,Y		; F9 5C 59
	lda $FCA8.w,X		; BD A8 FC
	inc $A2.b		; E6 A2
	ldx $F9A8.w		; AE A8 F9
	dec $D8.b		; C6 D8
	beq  77.b		; F0 4D
	sbc ($64.b,X)		; E1 64
	brk $7C.b		; 00 7C
	jmp ($447D.w,X)		; 7C 7D 44
	lda $EAAD9F.l,X		; BF 9F AD EA
	eor ($C1.b),Y		; 51 C1
	eor $5F.b,X		; 55 5F
	mvn $1F,$E9		; 54 E9 1F
	mvn $18,$DA		; 54 DA 18
	stz $14.b		; 64 14
	plb		; AB
	lsr $13AB.w,X		; 5E AB 13
	trb $37.b		; 14 37
	.db $62, $FE, $5F		; 62 FE 5F
	bra   2.b		; 80 02
	cmp ($58.b,X)		; C1 58
	ldy $3356.w		; AC 56 33
	lsr $59E4.w		; 4E E4 59
	sbc $58E5.w		; ED E5 58
	adc [$67.b]		; 67 67
	txy		; 9B
	eor $99.b		; 45 99
	tya		; 98
	and #$4B95.w		; 29 95 4B
	.db $82, $E0, $D2		; 82 E0 D2
	ora [$25.b],Y		; 17 25
	iny		; C8
	plb		; AB
	ora $364E.w,X		; 1D 4E 36
	bit $4C79.w		; 2C 79 4C
	sta $DD2F53.l		; 8F 53 2F DD
	brk $B2.b		; 00 B2
	adc ($1A.b,X)		; 61 1A
	sbc ($4A.b,S),Y		; F3 4A
	ror $C7.b,X		; 76 C7
	sei		; 78
	bmi 127.b		; 30 7F
	eor ($6D.b,S),Y		; 53 6D
	ora $FE20D3.l,X		; 1F D3 20 FE
	and #$45FA.w		; 29 FA 45
	jmp $F8AAAC.l		; 5C AC AA F8
	lda $E4F219.l		; AF 19 F2 E4
	cmp $C6D7.w,Y		; D9 D7 C6
	brk $D7.b		; 00 D7
	tya		; 98
	eor [$D6.b]		; 47 D6
	and $36C709.l,X		; 3F 09 C7 36
	ldx #$AA.b		; A2 AA
	inc $D9.b		; E6 D9
	lsr $86.b,X		; 56 86
	stx $80.b		; 86 80
	brk $A8.b		; 00 A8
	ora $22.b		; 05 22
	sta ($48.b),Y		; 91 48
	eor $DD.b,X		; 55 DD
	cmp ($70.b,S),Y		; D3 70
	jmp.w [$3F3C]		; DC 3C 3F
	ldy $F4.b,X		; B4 F4
	lsr $05B0.w,X		; 5E B0 05
	lda ($82.b,S),Y		; B3 82
	bvs  79.b		; 70 4F
	dec $6A.b		; C6 6A
	lsr $55D4.w		; 4E D4 55
	lda [$6D.b],Y		; B7 6D
	eor $78.b,X		; 55 78
	cld		; D8
	lda ($6B.b),Y		; B1 6B
	bra  41.b		; 80 29
	bcc  86.b		; 90 56
	ora ($CD.b),Y		; 11 CD
	asl $3C.b,X		; 16 3C
	lda #$76E9.w		; A9 E9 76
	and $F4D3.w,Y		; 39 D3 F4
	pld		; 2B
	plx		; FA
	ror $FE3C.w		; 6E 3C FE
	cld		; D8
	rtl		; 6B

	dex		; CA
	ora $AC69.w		; 0D 69 AC
	bit $BE83.w,X		; 3C 83 BE
	tsa		; 3B
	sbc ($83.b),Y		; F1 83
	inx		; E8
	sbc $9B58.w,X		; FD 58 9B
	ora ($0F.b)		; 12 0F
	plx		; FA
	lsr $48.b		; 46 48
	plb		; AB
	ror $DADC.w		; 6E DC DA
	ora $31F961.l		; 0F 61 F9 31
	inc $33.b,X		; F6 33
	ror $0A50.w,X		; 7E 50 0A
	adc $D1.b		; 65 D1
	cmp $991D.w,Y		; D9 1D 99
	sta ($7D.b)		; 92 7D
	sta ($56.b,X)		; 81 56
	jmp $99AEE8.l		; 5C E8 AE 99
	adc $E9.b		; 65 E9
	ldx $9B.b,Y		; B6 9B
	rti		; 40

	ora [$A6.b],Y		; 17 A6
	sta ($76.b,X)		; 81 76
	adc #$E2CB.w		; 69 CB E2
	sed		; F8
	lda $96.b,S		; A3 96
	jsr ($F332.w,X)		; FC 32 F3
	cli		; 58
	and [$64.b],Y		; 37 64
	adc [$06.b],Y		; 77 06
	clv		; B8
	sta $A5.b,S		; 83 A5
	cmp $3B9B65.l		; CF 65 9B 3B
	tas		; 1B
	dec $BB60.w		; CE 60 BB
.ACCU 16
	rep #$EC		; C2 EC
	lda $8437.w,X		; BD 37 84
	ora $C38F.w,Y		; 19 8F C3
	cpy $D8.b		; C4 D8
	lda $778371.l,X		; BF 71 83 77
	asl $49.b		; 06 49
	sed		; F8
	php		; 08
	dec A		; 3A
	adc $E6BD12.l		; 6F 12 BD E6
	adc $26.b		; 65 26
	ora $0CF6.w		; 0D F6 0C
	sbc ($82.b)		; F2 82
	asl $AB8A.w		; 0E 8A AB
	asl $7D.b,X		; 16 7D
	rol $0B.b,X		; 36 0B
	ldx #$8B.b		; A2 8B
	ora $62.b		; 05 62
	cmp $5206.w,Y		; D9 06 52
	inc A		; 1A
	plp		; 28
	ldx $CE.b,Y		; B6 CE
	cmp ($91.b,X)		; C1 91
	eor ($29.b)		; 52 29
	sta [$04.b],Y		; 97 04
	ora $7A58.w,Y		; 19 58 7A
	lda ($7B.b)		; B2 7B
	inc $0663.w		; EE 63 06
	sbc #$E88E.w		; E9 8E E8
	cmp $90.b,X		; D5 90
	stz $9B.b,X		; 74 9B
	rol $AC.b,X		; 36 AC
	eor [$BA.b],Y		; 57 BA
	dec A		; 3A
	tsb $C717.w		; 0C 17 C7
	bit $C519.w		; 2C 19 C5
	cmp ($06.b),Y		; D1 06
	ror $B9FB.w		; 6E FB B9
	jmp ($F7CA.w,X)		; 7C CA F7
	eor $0B56.w		; 4D 56 0B
	sbc [$8F.b],Y		; F7 8F
	rti		; 40

	bne  44.b		; D0 2C
	bpl 100.b		; 10 64
	txy		; 9B
	ror $0C7E.w,X		; 7E 7E 0C
	plx		; FA
	lsr $0D.b,X		; 56 0D
.INDEX 8
	sep #$15		; E2 15
	cmp #$3B08.w		; C9 08 3B
	sta ($AC.b),Y		; 91 AC
	adc ($23.b)		; 72 23
	cmp ($B0.b)		; D2 B0
	adc $24C040.l		; 6F 40 C0 24
	jsr $5AE5.w		; 20 E5 5A
	lda $58.b,X		; B5 58
	rol $D04C.w		; 2E 4C D0
	phd		; 0B
	tsb $19.b		; 04 19
	ror $AD36.w,X		; 7E 36 AD
	adc ($1C.b,S),Y		; 73 1C
	dec $0D.b		; C6 0D
	ldx $0636.w,Y		; BE 36 06
	ldy $A883.w		; AC 83 A8
	ldx #$7B.b		; A2 7B
	jmp ($DBEC.w)		; 6C EC DB
	eor $FF44.w		; 4D 44 FF
	eor $9DF89F.l,X		; 5F 9F F8 9D
	lda $22.b,X		; B5 22
	sta $5C70.w,Y		; 99 70 5C
	sta $F323.w,X		; 9D 23 F3
	ora $91E26C.l,X		; 1F 6C E2 91
	mvp $C4,$C4		; 44 C4 C4
	cmp $0C.b		; C5 0C
	tax		; AA
	lda $8A.b,X		; B5 8A
	cmp $62.b		; C5 62
	lda ($58.b),Y		; B1 58
	.db $82, $A6, $D0		; 82 A6 D0
	plb		; AB
	eor $6C9A.w		; 4D 9A 6C
	inc $56.b,X		; F6 56
	lsr $59.b,X		; 56 59
	ply		; 7A
	adc [$45.b],Y		; 77 45
	lda ($E4.b)		; B2 E4
	ldy $CB2E.w,X		; BC 2E CB
	lda ($EC.b)		; B2 EC
	cmp ($91.b,S),Y		; D3 91
	pei ($6B.b)		; D4 6B
	lda $EB.b,X		; B5 EB
	cmp $9E.b,X		; D5 9E
	sbc ($6D.b)		; F2 6D
	cmp $F6.b,S		; C3 F6
	.db $62, $DC, $59		; 62 DC 59
	bmi  76.b		; 30 4C
	ora ($C1.b)		; 12 C1
	stz $CF70.w,X		; 9E 70 CF
	iny		; C8
	bvs -52.b		; 70 CC
	stp		; DB
	and $130D.w		; 2D 0D 13
	stp		; DB
	phb		; 8B
	ora ($C4.b),Y		; 11 C4
	cmp $ACF9.w,X		; DD F9 AC
	cmp $0A.b,X		; D5 0A
	eor $22.b		; 45 22
	sta $37BF.w,Y		; 99 BF 37
	sbc [$9E.b]		; E7 9E
	jmp $E55E92.l		; 5C 92 5E E5
	cpx $49.b		; E4 49
	txs		; 9A
	dex		; CA
	sbc $FA.b,X		; F5 FA
	sta $F218.w,X		; 9D 18 F2
	adc ($F8.b),Y		; 71 F8
	sta $01C6.w,Y		; 99 C6 01
	ror $9D5D.w,X		; 7E 5D 9D
	lda ($A9.b,X)		; A1 A9
	rol $26.b,X		; 36 26
	jmp.w [$BE60]		; DC 60 BE
	lda $AD27B3.l,X		; BF B3 27 AD
	bit #$C7DB.w		; 89 DB C7
	ldy $20.b		; A4 20
	lda $8FF10C.l,X		; BF 0C F1 8F
	dey		; 88
	cmp ($33.b),Y		; D1 33
	adc ($63.b,S),Y		; 73 63
	iny		; C8
	adc ($DE.b)		; 72 DE
	mvp $BC,$BE		; 44 BE BC
	tda		; 7B
	dec A		; 3A
	sbc $1A.b,X		; F5 1A
	lda [$E6.b],Y		; B7 E6
	ora ($F3.b,X)		; 01 F3
	cmp $4EF108.l		; CF 08 F1 4E
	and $B064.w,Y		; 39 64 B0
	rol $737E.w		; 2E 7E 73
	ora [$50.b]		; 07 50
	ora [$A4.b],Y		; 17 A4
	ora $E548.w,X		; 1D 48 E5
	adc $C9939D.l		; 6F 9D 93 C9
	sta $D8.b		; 85 D8
	sec		; 38
	lsr $DCE5.w		; 4E E5 DC
	sbc ($F9.b,X)		; E1 F9
	tsa		; 3B
	cmp ($96.b,S),Y		; D3 96
	sei		; 78
	ora [$30.b]		; 07 30
	cmp $38.b		; C5 38
	eor [$08.b]		; 47 08
	pea $288A.w		; F4 8A 28
	eor $5C.b,X		; 55 5C
	ldy $FE8A.w,X		; BC 8A FE
	sty $D7BA.w		; 8C BA D7
	inc A		; 1A
	sta ($05.b),Y		; 91 05
	rts		; 60

	asl $CE51.w,X		; 1E 51 CE
	rol $A6.b,X		; 36 A6
	pea $AB9F.w		; F4 9F AB
	eor $A8.b		; 45 A8
	sbc ($98.b)		; F2 98
	inx		; E8
	sed		; F8
	sbc $595C.w,Y		; F9 5C 59
	lda $D3A4.w,X		; BD A4 D3
	ora [$C6.b],Y		; 17 C6
	ldy $1FD5.w,X		; BC D5 1F
	sec		; 38
	stp		; DB
	asl $B108.w,X		; 1E 08 B1
	mvp $C4,$C4		; 44 C4 C4
	sed		; F8
	sed		; F8
	plx		; FA
	bit #$3F7F.w		; 89 7F 3F
	tad		; 5B
	pei ($0A.b)		; D4 0A
	cmp $62.b		; C5 62
	lda ($EA.b),Y		; B1 EA
	sta $EA23.w,X		; 9D 23 EA
	txy		; 9B
	.db $42, $4B		; 42 4B
	ldx $0D.b,Y		; B6 0D
	stx $5EA3.w		; 8E A3 5E
	eor ($0E.b)		; 52 0E
	lda ($60.b)		; B2 60
	tya		; 98
	cmp $18.b,X		; D5 18
	rol $338A.w		; 2E 8A 33
	jmp ($59B4.w)		; 6C B4 59
	jsr $45CA.w		; 20 CA 45
	.db $42, $90		; 42 90
	phx		; DA
	rts		; 60

	iny		; C8
	ldy $BD.b		; A4 BD
	wai		; CB
	iny		; C8
	ldx $CA20.w,Y		; BE 20 CA
	dec $71.b		; C6 71
	bra  77.b		; 80 4D
	xce		; FB
	tya		; 98
	ora ($F9.b),Y		; 11 F9
	stz $09.b		; 64 09
	eor $F7CABA.l		; 4F BA CA F7
	clc		; 18
	and $3C3637.l		; 2F 37 36 3C
	stx $DE01.w		; 8E 01 DE
	bcc 101.b		; 90 65
	sbc $3880.w,Y		; F9 80 38
	tsb $9F1F.w		; 0C 1F 9F
	sta $4090.w,X		; 9D 90 40
	sta $E9.b		; 85 E9
	ror A		; 6A
	lda ($06.b,S),Y		; B3 06
	sbc ($B7.b)		; F2 B7
	dec $22CA.w		; CE CA 22
	asl $9CDE.w		; 0E DE 9C
	lda ($47.b,S),Y		; B3 47
	jmp ($B4C1.w,X)		; 7C C1 B4
	bvc -69.b		; 50 BB
	cmp ($0E.b)		; D2 0E
	ldy $03.b		; A4 03
	eor $05.b,S		; 43 05
	cmp #$BD9B.w		; C9 9B BD
	and [$EA.b]		; 27 EA
	cmp ($20.b)		; D2 20
	wai		; CB
	sbc ($34.b),Y		; F1 34
	cmp $69.b,S		; C3 69
	sta $E2.b,S		; 83 E2
	txa		; 8A
	sed		; F8
	sta ($0A.b,X)		; 81 0A
	cmp $7E.b		; C5 7E
	ora $BB.b		; 05 BB
	jmp ($4517.w)		; 6C 17 45
	ora ($DB.b,S),Y		; 13 DB
	cmp $C814.w,X		; DD 14 C8
	and ($91.b)		; 32 91
	jmp $CE8F.w		; 4C 8F CE
	ror A		; 6A
	bmi  92.b		; 30 5C
	eor ($31.b),Y		; 51 31
	adc $19240B.l		; 6F 0B 24 19
	cli		; 58
	ldy $C151.w		; AC 51 C1
	rts		; 60

	cmp $2AB4.w,Y		; D9 B4 2A
	cmp ($C3.b,S),Y		; D3 C3
	jsr $A2EB.w		; 20 EB A2
	cld		; D8
	cmp [$AF.b],Y		; D7 AF
	lsr $7B.b,X		; 56 7B
	cmp #$0FB7.w		; C9 B7 0F
	cmp $718B.w,Y		; D9 8B 71
	and [$EE.b],Y		; 37 EE
	jmp $9EC112.l		; 5C 12 C1 9E
	bvs -49.b		; 70 CF
	iny		; C8
	bvs -49.b		; 70 CF
	stx $03.b,Y		; 96 03
	mvp $E2,$F6		; 44 F6 E2
	cpy $71.b		; C4 71
	and [$7E.b],Y		; 37 7E
	rtl		; 6B

	bit $FB.b,X		; 34 FB
	ldy $72AF.w		; AC AF 72
	sta ($4C.b),Y		; 91 4C
	cmp $CFF39B.l,X		; DF 9B F3 CF
	rol $014E.w		; 2E 4E 01
	dec $6692.w,X		; DE 92 66
	lda ($BD.b)		; B2 BD
	ror $46A7.w,X		; 7E A7 46
	bit $7E9C.w,X		; 3C 9C 7E
	and $80.b,S		; 23 80
	lda [$E5.b],Y		; B7 E5
	cmp $1ADA.w,Y		; D9 DA 1A
	sta ($62.b,S),Y		; 93 62
	adc $80CC.w		; 6D CC 80
	ora $7A.b,X		; 15 7A
	inc $9ECC.w,X		; FE CC 9E
	ldx $27.b,Y		; B6 27
	adc $D5921E.l		; 6F 1E 92 D5
	adc $00.b		; 65 00
	beq -49.b		; F0 CF
	clc		; 18
	sed		; F8
	sta $2012.w		; 8D 12 20
	trb $91B7.w		; 1C B7 91
	and $CE1EAF.l		; 2F AF 1E CE
	lda $AE46.w,X		; BD 46 AE
	stx $7EF9.w		; 8E F9 7E
	adc $1EE1.w,Y		; 79 E1 1E
	and #$2CC7.w		; 29 C7 2C
	stx $0D.b,Y		; 96 0D
	inx		; E8
	tsb $431D.w		; 0C 1D 43
	.db $42, $90		; 42 90
	adc $9022.w		; 6D 22 90
	ora $601726.l		; 0F 26 17 60
	sbc ($3B.b,X)		; E1 3B
	sta [$73.b],Y		; 97 73
	sta [$E4.b]		; 87 E4
	ldx $97.b,Y		; B6 97
	cpy #$39.b		; C0 39
	stx $29.b		; 86 29
.ACCU 16
.INDEX 16
	rep #$38		; C2 38
	eor [$A4.b]		; 47 A4
	eor $97AB00.l,X		; 5F 00 AB 97
	sta ($5F.b),Y		; 91 5F
	cmp ($97.b),Y		; D1 97
	phy		; 5A
	sbc $57.b,S		; E3 57
	cpx #$B65B.w		; E0 5B B6
	ora ($80.b,X)		; 01 80
	adc $3847.w,Y		; 79 47 38
	phx		; DA
	txy		; 9B
	ldx #$4599.w		; A2 99 45
	tay		; A8
	sbc ($98.b)		; F2 98
	inx		; E8
	sed		; F8
	sbc $595C.w,Y		; F9 5C 59
	lda $FCA8.w,X		; BD A8 FC
	inc $A5.b		; E6 A5
	sbc ($AF.b),Y		; F1 AF
	and $47.b,X		; 35 47
	dec $C736.w		; CE 36 C7
	.db $82, $6F, $0B		; 82 6F 0B
	and $13.b,S		; 23 13
	ora ($E3.b,S),Y		; 13 E3
	sbc $EA.b,S		; E3 EA
	and $FC.b		; 25 FC
	sbc $526F.w,X		; FD 6F 52
	stx $D60A.w		; 8E 0A D6
	pld		; 2B
	asl $D2A9.w,X		; 1E A9 D2
	rol $B4A9.w,X		; 3E A9 B4
	bmi -64.b		; 30 C0
	adc [$66.b]		; 67 66
	phx		; DA
	ror A		; 6A
	and [$FA.b]		; 27 FA
	jsr ($C4FF.w,X)		; FC FF C4
	sbc $BBA4.w		; ED A4 BB
	tad		; 5B
	.db $82, $E4, $E9		; 82 E4 E9
	ora $67FB98.l,X		; 1F 98 FB 67
	trb $94.b		; 14 94
	asl $26.b		; 06 26
	plp		; 28
	adc $55.b		; 65 55
	dec $A8.b		; C6 A8
	lda $8A.b,X		; B5 8A
	cmp $62.b		; C5 62
	asl A		; 0A
	lda ($03.b)		; B2 03
	bit $D9.b,X		; 34 D9
	cpx $ACAC.w		; EC AC AC
	lda ($F4.b)		; B2 F4
	stp		; DB
	phk		; 4B
	adc ($5E.b)		; 72 5E
	ora [$65.b],Y		; 17 65
	cmp $6976.w,Y		; D9 76 69
	wai		; CB
	cpx #$3618.w		; E0 18 36
	txa		; 8A
	inc A		; 1A
	ora $36C8.w,Y		; 19 C8 36
	sta ($48.b),Y		; 91 48
	clv		; B8
	clc		; 18
	rol $56AD.w		; 2E AD 56
	plb		; AB
	eor $41AE.w,X		; 5D AE 41
	ror $0B.b,X		; 76 0B
	asl $09.b		; 06 09
	.db $82, $30, $5C		; 82 30 5C
	inc $F1.b,X		; F6 F1
	lda [$CC.b],Y		; B7 CC
	sbc ($E8.b,S),Y		; F3 E8
	bcc  93.b		; 90 5D
	and ($7A.b,S),Y		; 33 7A
	jmp $82411A.l		; 5C 1A 41 82
	cpx $BD.b		; E4 BD
	adc $63.b,S		; 63 63
	sta $F38218.l		; 8F 18 82 F3
	sta $AA51.w		; 8D 51 AA
	rol $A3.b,X		; 36 A3
	ora $E7.b		; 05 E7
	sbc [$2A.b]		; E7 2A
	cmp ($41.b),Y		; D1 41
	ora $DE.b		; 05 DE
	bra  20.b		; 80 14
	sta $55.b		; 85 55
	txa		; 8A
	ldy $5DB7.w		; AC B7 5D
	eor $BEB4.w		; 4D B4 BE
	adc $BB.b,S		; 63 BB
	brk $0B.b		; 00 0B
	asl $81.b		; 06 81
	cmp $3D.b		; C5 3D
	ora $EF.b,S		; 03 EF
	tsb $9F17.w		; 0C 17 9F
	sta $3DFF27.l,X		; 9F 27 FF 3D
	eor [$9E.b]		; 47 9E
	eor ($77.b,X)		; 41 77
	sta [$CC.b]		; 87 CC
	tsa		; 3B
	adc $F8.b,S		; 63 F8
	lsr $0D.b		; 46 0D
	cmp ($D0.b),Y		; D1 D0
	eor $20.b,X		; 55 20
	stp		; DB
	ldy #$8201.w		; A0 01 82
	inc $0F3B.w,X		; FE 3B 0F
	cmp $3373.w		; CD 73 33
	and $0B22.w,X		; 3D 22 0B
	tax		; AA
	ror $56D3.w,X		; 7E D3 56
	adc $AA22.w,Y		; 79 22 AA
	wai		; CB
	sta $E4A354.l,X		; 9F 54 A3 E4
	adc $93.b		; 65 93
	bit $00.b,X		; 34 00
	and $CBEC04.l		; 2F 04 EC CB
	lda ($FC.b)		; B2 FC
	rts		; 60

	clv		; B8
	ldx #$56AF.w		; A2 AF 56
	rol A		; 2A
	lda $0B72.w		; AD 72 0B
	ldy $2C58.w		; AC 58 2C
	clc		; 18
	and [$1B.b]		; 27 1B
	sbc $DDFED1.l		; EF D1 FE DD
	adc $997DFA.l		; 6F FA 7D 99
	ror $AAF2.w,X		; 7E F2 AA
	sbc $FAD3.w,X		; FD D3 FA
	eor $333CE5.l		; 4F E5 3C 33
	ror $41.b,X		; 76 41
	eor $EA.b,X		; 55 EA
	lda ($2A.b),Y		; B1 2A
	sbc $5E.b		; E5 5E
	tax		; AA
	lda $B082.w		; AD 82 B0
	ora ($9C.b,X)		; 01 9C
	eor ($4C.b,X)		; 41 4C
	cpy $D3CC.w		; CC CC D3
	adc [$B2.b]		; 67 B2
	tax		; AA
	lda $72C9.w		; AD C9 72
	jmp $D98597.l		; 5C 97 85 D9
	ora $51.b		; 05 51
	sbc [$CF.b]		; E7 CF
	plx		; FA
	ora $C6BE66.l,X		; 1F 66 BE C6
	adc $5F55EF.l,X		; 7F EF 55 5F
	bit $FA.b,X		; 34 FA
	sta [$86.b]		; 87 86
	stz $9F.b		; 64 9F
	cpx #$5541.w		; E0 41 55
	xce		; FB
	cmp [$1F.b],Y		; D7 1F
	sta $DE.b,X		; 95 DE
	and ($D1.b,S),Y		; 33 D1
	dec $D966.w,X		; DE 66 D9
	eor $F7.b,X		; 55 F7
	asl $F7F8.w		; 0E F8 F7
	phk		; 4B
	sta $DD.b,S		; 83 DD
	rol A		; 2A
	brk $0F.b		; 00 0F
	adc $AF.b,S		; 63 AF
	sta $4A27.w,X		; 9D 27 4A
	and $8AF97D.l,X		; 3F 7D F9 8A
	plb		; AB
	cmp $A617.w,Y		; D9 17 A6
	ldy #$8FEE.w		; A0 EE 8F
	inc $AE20.w,X		; FE 20 AE
	cmp [$3A.b]		; C7 3A
	eor $FC1F83.l,X		; 5F 83 1F FC
	ldy $72BA.w,X		; BC BA 72
	cpx #$AEAA.w		; E0 AA AE
	ldy $EE.b,X		; B4 EE
	eor $952DED.l		; 4F ED 2D 95
	iny		; C8
	rol A		; 2A
	adc $5E4F86.l		; 6F 86 4F 5E
	bit $A656.w,X		; 3C 56 A6
	sbc ($05.b,S),Y		; F3 05
	eor $7B.b,X		; 55 7B
	sta $C5.b,S		; 83 C5
	bmi -117.b		; 30 8B
	and $72.b		; 25 72
	asl A		; 0A
	adc $79C95B.l,X		; 7F 5B C9 79
	bmi -69.b		; 30 BB
	ora [$0D.b]		; 07 0D
	eor $7E.b,X		; 55 7E
	bit #$1EE0.w		; 89 E0 1E
	ora ($CC.b,X)		; 01 CC
	sec		; 38
	bit $15.b		; 24 15
	pei ($DB.b)		; D4 DB
	eor [$F5.b]		; 47 F5
	rol $D3.b		; 26 D3
	tsa		; 3B
	sec		; 38
	xce		; FB
	plx		; FA
	plp		; 28
	eor $E2.b,X		; 55 E2
	sta $9CEAA0.l,X		; 9F A0 EA 9C
	adc ($DB.b,S),Y		; 73 DB
	and #$0C00.w		; 29 00 0C
	sty $1F9F.w		; 8C 9F 1F
	cpx $A19F.w		; EC 9F A1
	and [$B9.b]		; 27 B9
	ora $EA.b,X		; 15 EA
	ldx $D294.w		; AE 94 D2
	sta $1DD640.l,X		; 9F 40 D6 1D
	sbc #$009C.w		; E9 9C 00
	rol $D3C6.w,X		; 3E C6 D3
	sed		; F8
	rol $FE.b		; 26 FE
	lda $F29A93.l		; AF 93 9A F2
	cmp $57.b,X		; D5 57
	cpy $3F.b		; C4 3F
	jsr ($53FF.w,X)		; FC FF 53
	jmp $2B886C.l		; 5C 6C 88 2B
	sta $F7F7.w		; 8D F7 F7
	lda $F0D6C7.l,X		; BF C7 D6 F0
	sta $7287A1.l,X		; 9F A1 87 72
	tax		; AA
	lda $C3FF74.l,X		; BF 74 FF C3
	bcc 126.b		; 90 7E
.ACCU 16
	rep #$60		; C2 60
	brk $21.b		; 00 21
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $74.b		; 00 74
	sbc ($59.b),Y		; F1 59
	inc A		; 1A
	rtl		; 6B

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
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	mvn $18,$63		; 54 63 18
	ldx $28.b		; A6 28
	sbc [$2C.b]		; E7 2C
	and #$2A35.w		; 29 35 2A
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
	rol $FB.b		; 26 FB
	brk $11.b		; 00 11
	jsr $0004.w		; 20 04 00
	jsl $34A549.l		; 22 49 A5 34
	sta $EF.b,X		; 95 EF
	rol $1B21.w		; 2E 21 1B
	sty $50C4.w		; 8C C4 50
	php		; 08
	bpl  32.b		; 10 20
	cmp ($07.b,X)		; C1 07
	and ($E1.b,X)		; 21 E1
	trb $4108.w		; 1C 08 41
	tsb $13A9.w		; 0C A9 13
	xce		; FB
	lda #$1B8A.w		; A9 8A 1B
	sec		; 38
	and $84.b		; 25 84
	adc $A2.b		; 65 A2
	eor #$8AF3.w		; 49 F3 8A
	sta $A088C8.l		; 8F C8 88 A0
	sty $43.b		; 84 43
	sbc ($ED.b)		; F2 ED
	eor $CF.b,X		; 55 CF
	and $88.b		; 25 88
	bpl  37.b		; 10 25
	php		; 08
	lda $502A.w		; AD 2A 50
	.db $82, $14, $44		; 82 14 44
	dec $89A8.w		; CE A8 89
	sbc ($32.b),Y		; F1 32
	eor #$9324.w		; 49 24 93
	tad		; 5B
	ror $99.b		; 66 99
	eor ($A7.b)		; 52 A7
	rol $2E.b,X		; 36 2E
	txy		; 9B
	sbc ($45.b,S),Y		; F3 45
	ldx #$DAD8.w		; A2 D8 DA
	sta $4B6F5D.l		; 8F 5D 6F 4B
	ror $92.b,X		; 76 92
	eor #$BEAC.w		; 49 AC BE
	cmp #$7A11.w		; C9 11 7A
	cpx $89.b		; E4 89
	and $A4.b,S		; 23 A4
	sta ($54.b)		; 92 54
	and $52.b		; 25 52
	adc $B264.w		; 6D 64 B2
	eor $212D.w,X		; 5D 2D 21
	ldy $4D.b,X		; B4 4D
	ldx $45.b,Y		; B6 45
	eor $F925.w,Y		; 59 25 F9
	and [$EB.b],Y		; 37 EB
	eor ($14.b,S),Y		; 53 14
	sta $BA65.w,X		; 9D 65 BA
	asl $2E57.w,X		; 1E 57 2E
	and $CA.b,S		; 23 CA
	cmp [$21.b]		; C7 21
	sbc $7A.b		; E5 7A
	eor $1B67.w,Y		; 59 67 1B
	eor [$74.b]		; 47 74
	adc $DDD19F.l,X		; 7F 9F D1 DD
	stz $A86C.w		; 9C 6C A8
	ror $86.b,X		; 76 86
	cmp $76D363.l		; CF 63 D3 76
	jmp $2E2049.l		; 5C 49 20 2E
	rol $29.b		; 26 29
	cop $E1.b		; 02 E1
	bit #$4092.w		; 89 92 40
	phx		; DA
	rtl		; 6B

	adc ($E4.b)		; 72 E4
	php		; 08
	txa		; 8A
	stp		; DB
	adc ($07.b)		; 72 07
.ACCU 16
.INDEX 16
	rep #$F9		; C2 F9
	asl $E7.b,X		; 16 E7
	sbc $066FBE.l		; EF BE 6F 06
	ora ($C3.b,S),Y		; 13 C3
	eor ($1F.b)		; 52 1F
	sta $7DEFD5.l		; 8F D5 EF 7D
	and $C3B5E3.l,X		; 3F E3 B5 C3
	sta $8846EB.l		; 8F EB 46 88
	cmp $F8CC.w		; CD CC F8
	sta $32F1F5.l,X		; 9F F5 F1 32
	stz $05.b		; 64 05
	rti		; 40

	ora $265A.w		; 0D 5A 26
	ldx #$A2D2.w		; A2 D2 A2
	dey		; 88
	bcs -102.b		; B0 9A
	ora ($5C.b,S),Y		; 13 5C
	clv		; B8
	asl A		; 0A
	bra  10.b		; 80 0A
	clv		; B8
	sta $14.b,X		; 95 14
	eor $11.b		; 45 11
	sbc [$3D.b],Y		; F7 3D
	ldy $3DB9.w,X		; BC B9 3D
	sbc $3F0079.l,X		; FF 79 00 3F
	ora [$FB.b],Y		; 17 FB
	tda		; 7B
	ora $DBB57B.l,X		; 1F 7B B5 DB
	nop		; EA
	sbc $7A.b,X		; F5 7A
	sbc $7F1181.l		; EF 81 11 7F
	lda $BCFD8D.l		; AF 8D FD BC
	.db $62, $10, $9E		; 62 10 9E
	ora ($CF.b,S),Y		; 13 CF
	ply		; 7A
	tda		; 7B
	bne -67.b		; D0 BD
	ora $6A48.w		; 0D 48 6A
	tsb $08.b		; 04 08
	trb $CF.b		; 14 CF
	jmp $C2F4.w		; 4C F4 C2
	sei		; 78
	eor $51A002.l		; 4F 02 A0 51
	sbc $80D927.l,X		; FF 27 D9 80
	bmi -112.b		; 30 90
	xce		; FB
	bvc -96.b		; 50 A0
	ora ($10.b,X)		; 01 10
	dec A		; 3A
	cmp [$D7.b]		; C7 D7
	ora $25.b,S		; 03 25
	lsr $20E6.w,X		; 5E E6 20
	bpl -76.b		; 10 B4
	asl $46.b,X		; 16 46
	cop $20.b		; 02 20
	rol $4B.b		; 26 4B
	eor ($DA.b),Y		; 51 DA
	brk $CB.b		; 00 CB
	sed		; F8
	brk $43.b		; 00 43
	cpy $0C.b		; C4 0C
	cpy $2260.w		; CC 60 22
	cop $72.b		; 02 72
	and ($63.b),Y		; 31 63
	cpy $01.b		; C4 01
	sbc [$3E.b],Y		; F7 3E
	tay		; A8
	ora #$2021.w		; 09 21 20
	bra  34.b		; 80 22
	ora [$58.b]		; 07 58
	xba		; EB
	ora ($72.b,X)		; 01 72
	lda $E2C50B.l		; AF 0B C5 E2
	lda ($F1.b)		; B2 F1
	ply		; 7A
	sbc $20.b,X		; F5 20
	trb $94.b		; 14 94
	sta ($49.b,X)		; 81 49
	pha		; 48
	ora $D5.b,X		; 15 D5
	dex		; CA
	sta $FD.b		; 85 FD
	jmp ($0A64.w,X)		; 7C 64 0A
	sta $44259A.l,X		; 9F 9A 25 44
	trb $A8.b		; 14 A8
	txs		; 9A
	mvn $4A,$41		; 54 41 4A
	bit #$44A5.w		; 89 A5 44
	jsr $CA16.w		; 20 16 CA
	sta $326208.l,X		; 9F 08 62 32
	lda ($9C.b,X)		; A1 9C
	adc $FFCB0E.l,X		; 7F 0E CB FF
	sta $12F5E0.l		; 8F E0 F5 12
	jsr $7ADC.w		; 20 DC 7A
	sty $0751.w		; 8C 51 07
	rts		; 60

	adc $19.b,X		; 75 19
	jsl $A0A70D.l		; 22 0D A7 A0
	sbc $C4.b		; E5 C4
	ora $831E.w,Y		; 19 1E 83
	sta [$BF.b],Y		; 97 BF
	ora $3B.b,S		; 03 3B
	dec A		; 3A
	inc $0F.b		; E6 0F
	nop		; EA
	sta $C34189.l,X		; 9F 89 41 C3
	sbc ($B8.b,S),Y		; F3 B8
	ror $9D76.w,X		; 7E 76 9D
	adc [$25.b],Y		; 77 25
	dec $67E8.w,X		; DE E8 67
	sbc $F38167.l,X		; FF 67 81 F3
	sta $DF.b,S		; 83 DF
	lda $DF.b,S		; A3 DF
	ldy #$6640.w		; A0 40 66
	dec $04.b,X		; D6 04
	stp		; DB
	lda $6A.b,S		; A3 6A
	sty $54.b		; 84 54
	lda $8548.w,X		; BD 48 85
	ora $71.b,X		; 15 71
	ora ($50.b,X)		; 01 50
	eor $54F341.l		; 4F 41 F3 54
	mvn $05,$01		; 54 01 05
	eor ($01.b),Y		; 51 01
	cmp $D3.b		; C5 D3
	tsb $9B.b		; 04 9B
	lda $5947.w		; AD 47 59
	ora $33.b,X		; 15 33
	ldx $7508.w		; AE 08 75
	tax		; AA
.INDEX 8
	sep #$5E		; E2 5E
	lda $DF4D.w,X		; BD 4D DF
	ror $13DF.w		; 6E DF 13
	ora $FBCE.w,Y		; 19 CE FB
	jsr ($BFEF.w,X)		; FC EF BF
	lda $7F4D9F.l		; AF 9F 4D 7F
	tyx		; BB
	.db $42, $BB		; 42 BB
	tsx		; BA
	bit $FD60.w,X		; 3C 60 FD
	sec		; 38
	sbc $C2324E.l,X		; FF 4E 32 C2
	ldy #$C9.b		; A0 C9
	ldx $69.b		; A6 69
	txs		; 9A
	ply		; 7A
	adc $FC.b,X		; 75 FC
.INDEX 8
	sep #$59		; E2 59
	pla		; 68
	plp		; 28
	and $AE.b		; 25 AE
	phy		; 5A
	sbc $AD.b		; E5 AD
	sec		; 38
	stx $00.b		; 86 00
	brk $6E.b		; 00 6E
	jmp ($3CFC.w)		; 6C FC 3C
	pha		; 48
	txa		; 8A
	brk $98.b		; 00 98
	sta $2A91.w		; 8D 91 2A
	ror A		; 6A
	tay		; A8
	dey		; 88
	ldy #$08.b		; A0 08
	php		; 08
	sta $35.b,X		; 95 35
	lda [$5B.b]		; A7 5B
	eor ($64.b)		; 52 64
	eor $8C.b		; 45 8C
	sty $8D49.w		; 8C 49 8D
	adc ($2A.b,X)		; 61 2A
	ror $AEB9.w		; 6E B9 AE
	rtl		; 6B

	xba		; EB
	sbc [$F1.b]		; E7 F1
	txa		; 8A
	xba		; EB
	dec $63.b		; C6 63
	pld		; 2B
	cmp $BC3EAF.l		; CF AF 3E BC
	xce		; FB
	asl $7421.w		; 0E 21 74
	tay		; A8
	eor [$19.b],Y		; 57 19
	tyx		; BB
	rol $9D9D.w		; 2E 9D 9D
	and $FB99.w,X		; 3D 99 FB
	bit #$3363.w		; 89 63 33
	adc $EC.b,S		; 63 EC
	sbc ($7B.b,S),Y		; F3 7B
	phk		; 4B
	adc $77E6.w,X		; 7D E6 77
	lda [$9D.b],Y		; B7 9D
	lda $C1CE.w,X		; BD CE C1
	plp		; 28
	php		; 08
	ora [$0A.b],Y		; 17 0A
	lsr A		; 4A
	rti		; 40

	bvc  82.b		; 50 52
	lda $20.b		; A5 20
	sbc $43.b		; E5 43
	bit $D9.b,X		; 34 D9
	cpx $667A.w		; EC 7A 66
	wai		; CB
	cmp ($40.b,S),Y		; D3 40
	ora [$A6.b],Y		; 17 A6
	cpy $04.b		; C4 04
	eor [$4D.b]		; 47 4D
	and [$0D.b]		; 27 0D
	sta [$23.b],Y		; 97 23
	jsr $A619.w		; 20 19 A6
	lsr $40.b		; 46 40
	cop $D1.b		; 02 D1
	sta $CDD7.w,Y		; 99 D7 CD
	sta $06.b,S		; 83 06
	sta $5EF7FD.l,X		; 9F FD F7 5E
	and [$75.b],Y		; 37 75
	bit $68C1.w,X		; 3C C1 68
	cmp $3427.w		; CD 27 34
	sbc $D5.b		; E5 D5
	txy		; 9B
	lsr $6D.b,X		; 56 6D
	eor $86A8.w,Y		; 59 A8 86
	and $261713.l		; 2F 13 17 26
	lda $1A92.w,Y		; B9 92 1A
	bmi -47.b		; 30 D1
	mvp $4B,$E4		; 44 E4 4B
	sbc ($F8.b,X)		; E1 F8
	bit $C11B.w,X		; 3C 1B C1
	cmp $A3.b,S		; C3 A3
	sta [$40.b]		; 87 40
	and $AA.b		; 25 AA
	lda $162A.w,Y		; B9 2A 16
	phb		; 8B
	pha		; 48
	sta $0F1F.w,Y		; 99 1F 0F
	bra -42.b		; 80 D6
	ora $881C.w,Y		; 19 1C 88
	eor ($7B.b,S),Y		; 53 7B
	trb $F6.b		; 14 F6
	ror $1576.w,X		; 7E 76 15
	wai		; CB
	sbc ($3D.b,S),Y		; F3 3D
	adc $57EB99.l		; 6F 99 EB 57
	and $2467.w		; 2D 67 24
	inc $4F68.w,X		; FE 68 4F
	ora #$D665.w		; 09 65 D6
	plb		; AB
	wai		; CB
	and #$3B51.w		; 29 51 3B
	rol A		; 2A
	eor #$B650.w		; 49 50 B6
	.db $82, $7E, $29		; 82 7E 29
	lsr A		; 4A
	inx		; E8
	cmp $0444.w,Y		; D9 44 04
	ldx #$03.b		; A2 03
	cpx #$B3.b		; E0 B3
	and $11351F.l		; 2F 1F 35 11
	.db $82, $99, $DB		; 82 99 DB
	and $CECB.w,Y		; 39 CB CE
	cpx $E6.b		; E4 E6
	ply		; 7A
	cli		; 58
	cmp ($54.b),Y		; D1 54
	eor $F3.b		; 45 F3
	lda $63E8BF.l,X		; BF BF E8 63
	cpy $8AC6.w		; CC C6 8A
	phy		; 5A
	cmp #$6369.w		; C9 69 63
	lda $64.b,X		; B5 64
	eor ($A2.b),Y		; 51 A2
	tay		; A8
	phb		; 8B
	lda $E416.w,Y		; B9 16 E4
	ror $46.b,X		; 76 46
	sta $7566.w		; 8D 66 75
	.db $62, $F0, $BF		; 62 F0 BF
	tsb $95BA.w		; 0C BA 95
	lda $5D.b,S		; A3 5D
	adc $55C6.w		; 6D C6 55
	beq 125.b		; F0 7D
	ror $720D.w,X		; 7E 0D 72
	dec $95.b,X		; D6 95
	tsb $4B.b		; 04 4B
	bvs -49.b		; 70 CF
	and $F3.b,X		; 35 F3
	plx		; FA
	ora [$FE.b]		; 07 FE
	lda $9004.w,X		; BD 04 90
	and $A0D7.w,X		; 3D D7 A0
	cmp $20.b		; C5 20
	ror $9D.b		; 66 9D
	asl $49.b		; 06 49
	cop $C7.b		; 02 C7
	ldy #$C5.b		; A0 C5
	sbc ($06.b,X)		; E1 06
	tyx		; BB
	pei ($72.b)		; D4 72
	cpx $0D.b		; E4 0D
	lda [$A8.b],Y		; B7 A8
	stp		; DB
	bcc  36.b		; 90 24
	dec A		; 3A
	stx $40EA.w		; 8E EA 40
	sbc $A30E.w		; ED 0E A3
	txy		; 9B
	jsr $4700.w		; 20 00 47
	sbc ($F3.b),Y		; F1 F3
	lda $34.b		; A5 34
	tsa		; 3B
	sta $E70E.w		; 8D 0E E7
	lda ($F8.b),Y		; B1 F8
	lda $0490.w,X		; BD 90 04
	ldx $81.b		; A6 81
	sei		; 78
	inc $E60E.w		; EE 0E E6
	cmp [$77.b],Y		; D7 77
	asl $55.b,X		; 16 55
	ldx $30CE.w		; AE CE 30
	ora $60DFF9.l,X		; 1F F9 DF 60
	cmp ($C0.b,X)		; C1 C0
	cpx #$53.b		; E0 53
	lsr $9F59.w		; 4E 59 9F
	adc #$9B03.w		; 69 03 9B
	rol $DC9C.w		; 2E 9C DC
	txs		; 9A
	rol $A1.b		; 26 A1
	mvn $41,$05		; 54 05 41
	rti		; 40

	ora $00.b		; 05 00
	mvn $50,$6A		; 54 6A 50
	ora $41AB.w		; 0D AB 41
	ror A		; 6A
	bne   0.b		; D0 00
	ldy #$64.b		; A0 64
	eor [$22.b],Y		; 57 22
	tsx		; BA
	bcc -27.b		; 90 E5
	cmp ($03.b)		; D2 03
	xce		; FB
	adc $79B9.w,Y		; 79 B9 79
	tda		; 7B
	tad		; 5B
	eor ($C7.b),Y		; 51 C7
	bra -16.b		; 80 F0
	jsr $BE81.w		; 20 81 BE
	cmp [$F0.b]		; C7 F0
	eor $64D8.w,Y		; 59 D8 64
	lda ($20.b,S),Y		; B3 20
	tsb $96.b		; 04 96
	cmp $DFB2.w		; CD B2 DF
	inc A		; 1A
	cmp $1F0CB1.l,X		; DF B1 0C 1F
	bne   1.b		; D0 01
	dey		; 88
	ldx $48.b,Y		; B6 48
	adc $9BA3.w,X		; 7D A3 9B
	ora $0A7F72.l		; 0F 72 7F 0A
	and $72EE63.l,X		; 3F 63 EE 72
	inc $08DE.w,X		; FE DE 08
	eor ($05.b)		; 52 05
	bmi -98.b		; 30 9E
	trb $7E4B.w		; 1C 4B 7E
	sbc $F6C6.w		; ED C6 F6
	lda $E6.b,X		; B5 E6
	sbc ($A2.b)		; F2 A2
	ror $0EDE.w,X		; 7E DE 0E
	trb $8839.w		; 1C 39 88
	brk $5E.b		; 00 5E
	cmp ($7B.b,X)		; C1 7B
	ora $EE.b		; 05 EE
	ora $F5.b,X		; 15 F5
	ora ($17.b),Y		; 11 17
	jmp $2FD3.w		; 4C D3 2F
	cmp $B486C3.l,X		; DF C3 86 B4
	lda #$5BB8.w		; A9 B8 5B
	nop		; EA
	jsl $FB252A.l		; 22 2A 25 FB
	sed		; F8
	bvs -119.b		; 70 89
	eor ($70.b,S),Y		; 53 70
	lda [$D4.b],Y		; B7 D4
	mvp $4B,$54		; 44 54 4B
	sbc [$F0.b],Y		; F7 F0
	sbc ($BA.b,X)		; E1 BA
	sta $37.b,X		; 95 37
	phd		; 0B
	adc $4544.w,X		; 7D 44 45
	mvp $7C,$F1		; 44 F1 7C
	sty $6638.w		; 8C 38 66
	rti		; 40

	cop $28.b		; 02 28
	sep #$8F		; E2 8F
	cmp #$5FE5.w		; C9 E5 5F
	eor ($11.b),Y		; 51 11
	jmp ($3E2C.w)		; 6C 2C 3E
	sbc $53530B.l		; EF 0B 53 53
	ldy $11C5.w,X		; BC C5 11
	eor ($37.b,S),Y		; 53 37
	ror $F8.b,X		; 76 F8
	sec		; 38
	cld		; D8
	lda [$22.b],Y		; B7 22
	.db $62, $54, $48		; 62 54 48
	tsb $08.b		; 04 08
	mvn $85,$80		; 54 80 85
	jmp $80B0A9.l		; 5C A9 B0 80
	ora [$F8.b]		; 07 F8
	adc $EF3D.w,X		; 7D 3D EF
	cop $73.b		; 02 73
	cmp $3E85.w,Y		; D9 85 3E
	adc [$6D.b]		; 67 6D
	sbc $E7.b		; E5 E7
	adc $F76597.l,X		; 7F 97 65 F7
	clv		; B8
	adc $25BA.w,Y		; 79 BA 25
	ora $73.b,S		; 03 73
	ror $E5.b		; 66 E5
	adc [$EF.b]		; 67 EF
	and $F3.b,X		; 35 F3
	lda $55.b,X		; B5 55
	tsb $0F.b		; 04 0F
	ora [$C8.b],Y		; 17 C8
	sbc $8F5E.w,X		; FD 5E 8F
	cmp $FA.b,X		; D5 FA
	sty $C0.b		; 84 C0
	txa		; 8A
	ldx $2B4F.w,Y		; BE 4F 2B
	cmp $E5.b		; C5 E5
	ply		; 7A
	trb $50A5.w		; 1C A5 50
	rti		; 40

	lda $1B0E7F.l,X		; BF 7F 0E 1B
	sbc [$C4.b],Y		; F7 C4
	ora ($57.b),Y		; 11 57
	phd		; 0B
	adc $AAC2.w,X		; 7D C2 AA
	.db $82, $05, $FB		; 82 05 FB
	sed		; F8
	bvs -33.b		; 70 DF
	ldx $8A20.w,Y		; BE 20 8A
	clv		; B8
	tad		; 5B
	inc $7117.w		; EE 17 71
	bvc  64.b		; 50 40
	pea $573F.w		; F4 3F 57
	sta ($F5.b),Y		; 91 F5
	and $445F.w,X		; 3D 5F 44
	bcs  17.b		; B0 11
	eor [$F9.b],Y		; 57 F9
	adc $875E.w,Y		; 79 5E 87
	pld		; 2B
	cmp $E5.b		; C5 E5
	pla		; 68
	jmp ($63BF.w,X)		; 7C BF 63
	sbc ($C7.b),Y		; F1 C7
	asl $2B.b,X		; 16 2B
	eor [$5D.b]		; 47 5D
	sbc [$F0.b]		; E7 F0
	tsx		; BA
	sbc $7FDCBB.l		; EF BB DC 7F
	cmp $9A.b		; C5 9A
	ora $C9B060.l,X		; 1F 60 B0 C9
	phb		; 8B
	dec $96C5.w,X		; DE C5 96
	adc $DBE171.l,X		; 7F 71 E1 DB
	ldy $9C.b		; A4 9C
	lda ($85.b,X)		; A1 85
	trb $15.b		; 14 15
	and #$A512.w		; 29 12 A5
	eor ($52.b),Y		; 51 52
	adc $889A60.l		; 6F 60 9A 88
	and $B1B8.w,Y		; 39 B8 B1
	ora $2B.b,X		; 15 2B
	jmp $1A80.w		; 4C 80 1A
	inc A		; 1A
	ora ($5D.b,X)		; 01 5D
	eor #$990C.w		; 49 0C 99
	asl $D1.b		; 06 D1
	eor ($12.b,S),Y		; 53 12
	cmp ($51.b),Y		; D1 51
	ora [$BA.b]		; 07 BA
	php		; 08
	rti		; 40

	eor ($A5.b)		; 52 A5
	plb		; AB
	eor $05.b		; 45 05
	eor $2684.w		; 4D 84 26
	txs		; 9A
	tsb $81F0.w		; 0C F0 81
	eor ($A8.b)		; 52 A8
	sta $30.b		; 85 30
	rol A		; 2A
	jmp ($E451.w,X)		; 7C 51 E4
	lsr $EE.b		; 46 EE
	ror $61.b		; 66 61
	eor ($AC.b)		; 52 AC
	brk $32.b		; 00 32
	sbc ($C2.b)		; F2 C2
	dec A		; 3A
	sta ($00.b)		; 92 00
	ldx #$95.b		; A2 95
	and #$A512.w		; 29 12 A5
	rol A		; 2A
	ldy $E42A.w		; AC 2A E4
	jsr $7354.w		; 20 54 73
	rol $19.b,X		; 36 19
	inc $BE.b		; E6 BE
	sbc ($9E.b,S),Y		; F3 9E
	jmp ($F43C.w)		; 6C 3C F4
	dey		; 88
	and $9EF7.w,X		; 3D F7 9E
	cmp $10.b		; C5 10
	ror $9C.b		; 66 9C
	pea $85DF.w		; F4 DF 85
	sta $7E8B3D.l		; 8F 3D 8B 7E
	inc A		; 1A
	sbc $209249.l		; EF 49 92 20
	stp		; DB
	ply		; 7A
	lsr $415C.w		; 4E 5C 41
	bvs -23.b		; 70 E9
	and ($6F.b)		; 32 6F
	cmp ($7A.b,X)		; C1 7A
	eor $83B8.w		; 4D B8 83
	eor $BBEA.w,X		; 5D EA BB
	tay		; A8
	sta $6D.b,S		; 83 6D
	nop		; EA
	lda $05B1.w,Y		; B9 B1 05
	cmp $AA.b,S		; C3 AA
	inc $E0B7.w		; EE B7 E0
	lda $3657.w,X		; BD 57 36
	jsl $9744A1.l		; 22 A1 44 97
	ror $7D1F.w,X		; 7E 1F 7D
	dec $DFDC.w,X		; DE DC DF
	eor $B0EDC4.l		; 4F C4 ED B0
	eor [$C2.b]		; 47 C2
	sty $8CCD.w		; 8C CD 8C
	lda $7F16.w,Y		; B9 16 7F
	adc $76.b,X		; 75 76
	dec $F387.w,X		; DE 87 F3
	inx		; E8
	ror $6BB4.w		; 6E B4 6B
	stx $B9.b,Y		; 96 B9
	eor $71.b		; 45 71
	sbc $0C.b,S		; E3 0C
	lsr $3C.b		; 46 3C
	pha		; 48
	jsl $8B1800.l		; 22 00 18 8B
	rts		; 60

	dey		; 88
	ldx $B83A.w		; AE 3A B8
	cop $08.b		; 02 08
	sta $37.b,X		; 95 37
	and ($3A.b,S),Y		; 33 3A
	jmp $4D6FE9.l		; 5C E9 6F 4D
	ply		; 7A
	sta $FD.b,S		; 83 FD
	inc $279F.w,X		; FE 9F 27
	plx		; FA
	adc $DD8547.l,X		; 7F 47 85 DD
	sed		; F8
	ora ($5E.b,S),Y		; 13 5E
	cpx #$E0.b		; E0 E0
	ldx #$70.b		; A2 70
	cmp #$4543.w		; C9 43 45
	sty $59.b,X		; 94 59
	.db $42, $AA		; 42 AA
	rol $2D.b		; 26 2D
	adc $6D9D.w		; 6D 9D 6D
	sta $E56A.w,X		; 9D 6A E5
	ldx $64.b		; A6 64
	rti		; 40

	dec $A9.b,X		; D6 A9
	and ($6A.b,S),Y		; 33 6A
	tax		; AA
	ldx #$0F.b		; A2 0F
	and $DAF5.w,X		; 3D F5 DA
	eor ($44.b,X)		; 41 44
	asl $A2.b		; 06 A2
	cop $0F.b		; 02 0F
	ldy $F9.b,X		; B4 F9
	tay		; A8
	asl A		; 0A
	jsr $1035.w		; 20 35 10
	bpl 127.b		; 10 7F
	and $E9.b,S		; 23 E9
	ldy #$28.b		; A0 28
	bra -86.b		; 80 AA
	ldx $6E.b,Y		; B6 6E
	rol A		; 2A
	ldx #$0F.b		; A2 0F
	plx		; FA
	and $148CB1.l,X		; 3F B1 8C 14
	rti		; 40

	eor $5E.b,X		; 55 5E
	mvp $1C,$39		; 44 39 1C
	ror $FC04.w,X		; 7E 04 FC
	rol $82E6.w,X		; 3E E6 82
	.db $82, $80, $34		; 82 80 34
	eor $4013.w		; 4D 13 40
	cmp $2A622A.l		; CF 2A 62 2A
	rol $1123.w		; 2E 23 11
	dey		; 88
	tay		; A8
	lda ($2A.b)		; B2 2A
	and #$B451.w		; 29 51 B4
	mvn $A3,$52		; 54 52 A3
	lda ($92.b),Y		; B1 92
	lsr $46.b		; 46 46
	ora ($72.b,X)		; 01 72
	cpx $20DC.w		; EC DC 20
	stx $0949.w		; 8E 49 09
	php		; 08
	sbc $96.b,S		; E3 96
	lsr $8E1E.w,X		; 5E 1E 8E
	lda $FF31.w		; AD 31 FF
	sta $23CA.w		; 8D CA 23
	sbc [$04.b],Y		; F7 04
	ora ($3F.b,X)		; 01 3F
	and $C1B237.l		; 2F 37 B2 C1
	inc $60.b		; E6 60
	lda $50A2.w,Y		; B9 A2 50
	tax		; AA
	stz $0CBD.w		; 9C BD 0C
	sei		; 78
	sta $04.b,X		; 95 04
	ora ($12.b,X)		; 01 12
	cld		; D8
	php		; 08
	rol A		; 2A
	tay		; A8
	brk $A8.b		; 00 A8
	jsr $8008.w		; 20 08 80
	php		; 08
	rol A		; 2A
	tay		; A8
	tsb $37FF.w		; 0C FF 37
	sbc $D1.b,X		; F5 D1
	bit $F3.b,X		; 34 F3
	eor $53F334.l		; 4F 34 F3 53
	tax		; AA
	rep #$07		; C2 07
	wai		; CB
	eor ($11.b),Y		; 51 11
	plp		; 28
	plp		; 28
	ora ($54.b),Y		; 11 54
	mvp $00,$45		; 44 45 00
	eor ($11.b),Y		; 51 11
	ora ($11.b),Y		; 11 11
	eor [$7B.b],Y		; 57 7B
	cpx $E7DD.w		; EC DD E7
	eor $5DE7.w,X		; 5D E7 5D
	sbc [$73.b]		; E7 73
	ldx $A680.w		; AE 80 A6
	and $60.b,S		; 23 60
	cld		; D8
	rol $0D.b,X		; 36 0D
	sta ($15.b,X)		; 81 15
	mvn $CA,$A9		; 54 A9 CA
	cop $22.b		; 02 22
	jsl $53A92A.l		; 22 2A A9 53
	sty $04.b,X		; 94 04
	mvp $55,$44		; 44 44 55
	stp		; DB
	sbc $BDBDFB.l,X		; FF FB BD BD
	dec $EFDE.w,X		; DE DE EF
	adc $02BA55.l		; 6F 55 BA 02
	sta [$0D.b],Y		; 97 0D
	sta $60.b,S		; 83 60
	cld		; D8
	rol $0A.b,X		; 36 0A
	sta ($09.b,X)		; 81 09
	ror $A11D.w		; 6E 1D A1
	lda $135DFC.l		; AF FC 5D 13
	eor $A0E8.w,X		; 5D E8 A0
	tas		; 1B
	adc $0D8845.l		; 6F 45 88 0D
	cmp $49D1.w,Y		; D9 D1 49
	cmp $23.b,S		; C3 23
	cmp ($62.b),Y		; D1 62
	stz $DD35.w		; 9C 35 DD
	ldx $40.b		; A6 40
	rol $DD.b,X		; 36 DD
	lda [$2C.b]		; A7 2C
	ora $B4D9.w		; 0D D9 B4
	cmp #$6438.w		; C9 38 64
	ror $9B.b,X		; 76 9B
	adc $4E.b		; 65 4E
	clv		; B8
	jmp $7750.w		; 4C 50 77
	jsr ($A572.w,X)		; FC 72 A5
	jmp.w [$0934]		; DC 34 09
	dec $C065.w		; CE 65 C0
	lda $6A.b,X		; B5 6A
	sec		; 38
	inx		; E8
	clv		; B8
	sbc #$5939.w		; E9 39 59
	and ($BE.b)		; 32 BE
	eor $0580.w		; 4D 80 05
	lda $B818.w		; AD 18 B8
	lda ($19.b)		; B2 19
	lsr $A4.b,X		; 56 A4
	sbc $D9.b		; E5 D9
	eor $0B.b		; 45 0B
	lsr $33A5.w,X		; 5E A5 33
	cmp ($56.b,S),Y		; D3 56
	dec $60.b,X		; D6 60
	bra  67.b		; 80 43
	sta $36.b,S		; 83 36
	lda $AB17.w		; AD 17 AB
	txs		; 9A
	tsx		; BA
	jsr $A50A.w		; 20 0A A5
	lsr A		; 4A
	ldx $91.b		; A6 91
	brk $17.b		; 00 17
	txy		; 9B
	cmp $6FDE.w		; CD DE 6F
	and $CC78F3.l,X		; 3F F3 78 CC
	ora $9A.b,X		; 15 9A
	cmp ($33.b,S),Y		; D3 33
	eor ($8E.b),Y		; 51 8E
	sta $DD53CC.l		; 8F CC 53 DD
	cmp ($50.b)		; D2 50
	wai		; CB
	jmp $7DB3BA.l		; 5C BA B3 7D
	clv		; B8
	sbc $8C6864.l,X		; FF 64 68 8C
	and $2C.b,S		; 23 2C
	eor [$4E.b],Y		; 57 4E
	sta $02E2F5.l		; 8F F5 E2 02
	phd		; 0B
	stz $76.b		; 64 76
	and $EC74.w		; 2D 74 EC
	eor ($88.b)		; 52 88
	txs		; 9A
	cmp [$85.b],Y		; D7 85
	lsr $8F.b,X		; 56 8F
	lda $CF.b		; A5 CF
	lda $93.b,X		; B5 93
	dec $D2.b		; C6 D2
	eor ($14.b),Y		; 51 14
	and $FF9D.w,Y		; 39 9D FF
	cpx #$D2.b		; E0 D2
.ACCU 8
	sep #$E9		; E2 E9
	adc ($74.b),Y		; 71 74
	bcc  85.b		; 90 55
	bvc  68.b		; 50 44
	eor ($14.b),Y		; 51 14
	ora ($11.b),Y		; 11 11
	bpl  85.b		; 10 55
	bvc  68.b		; 50 44
	eor ($14.b),Y		; 51 14
	ora ($11.b),Y		; 11 11
	dec A		; 3A
	cmp ($0A.b)		; D2 0A
	ldx $A54F.w		; AE 4F A5
	sbc $42.b,S		; E3 42
	stx $927E.w		; 8E 7E 92
	dey		; 88
	lda ($CC.b,X)		; A1 CC
	sbc $9706FF.l		; EF FF 06 97
	ora [$4B.b],Y		; 17 4B
	phb		; 8B
	lda $F1.b		; A5 F1
	ldy $FD.b,X		; B4 FD
	inc $DADB.w		; EE DB DA
	sbc $C95C.w,Y		; F9 5C C9
	lda $D5AC7C.l,X		; BF 7C AC D5
	sbc [$56.b]		; E7 56
	tda		; 7B
	eor ($F1.b)		; 52 F1
	sbc $E4.b		; E5 E4
	eor $CDEA.w		; 4D EA CD
	sbc [$CB.b]		; E7 CB
	plb		; AB
	rol $AD.b,X		; 36 AD
	dec $5F.b		; C6 5F
	sta $B99767.l,X		; 9F 67 97 B9
	sbc $EE.b		; E5 EE
	jmp ($CDFD.w,X)		; 7C FD CD
	sbc $8B.b,X		; F5 8B
	sta $95.b,X		; 95 95
	ora $59EA.w,Y		; 19 EA 59
	sbc $EE.b,S		; E3 EE
	sei		; 78
	xce		; FB
	stz $E7A6.w,X		; 9E A6 E7
	rol $C5.b,X		; 36 C5
	nop		; EA
	cld		; D8
	cld		; D8
	sta ($C2.b,S),Y		; 93 C2
	sta ($51.b),Y		; 91 51
	ror $7D.b,X		; 76 7D
	sta $C06B.w,X		; 9D 6B C0
	tax		; AA
	jsr $02BA.w		; 20 BA 02
	jsr $A202.w		; 20 02 A2
	tax		; AA
	cop $A8.b		; 02 A8
	.db $82, $82, $13		; 82 82 13
	brk $13.b		; 00 13
	inc $B7.b,X		; F6 B7
	xce		; FB
	phy		; 5A
	tay		; A8
	ora $06.b,S		; 03 06
	sta $D5.b,X		; 95 D5
	bvs -67.b		; 70 BD
	rol $8A.b		; 26 8A
	brk $40.b		; 00 40
	cop $79.b		; 02 79
	cpy #$01.b		; C0 01
	ora ($BA.b)		; 12 BA
	ldx $74A5.w,Y		; BE A5 74
	cmp ($08.b,S),Y		; D3 08
	brk $95.b		; 00 95
	ora ($44.b),Y		; 11 44
	tay		; A8
	txa		; 8A
	mvn $12,$45		; 54 45 12
	ldx #$29.b		; A2 29
	eor ($14.b),Y		; 51 14
	lsr A		; 4A
	dey		; 88
	lda $44.b		; A5 44
	eor ($2A.b),Y		; 51 2A
	bvs  85.b		; 70 55
	jsr $0000.w		; 20 00 00
	brk $54.b		; 00 54
	ldy #$02.b		; A0 02
	ldy #$56.b		; A0 56
	ora $00.b,X		; 15 00
	ora $54.b,X		; 15 54
	eor $01.b,X		; 55 01
	lda $56.b,X		; B5 56
	lsr A		; 4A
	and #$4A.b		; 29 4A
	adc $2BEA.w,X		; 7D EA 2B
	nop		; EA
	adc $5F295F.l,X		; 7F 5F 29 5F
	adc $2BFF.w,X		; 7D FF 2B
	sbc $FB267F.l,X		; FF 7F 26 FB
	brk $07.b		; 00 07
	asl $04.b		; 06 04
	brk $E1.b		; 00 E1
	eor [$16.b]		; 47 16
	tad		; 5B
	ora $C8.b,X		; 15 C8
	bpl  20.b		; 10 14
	cop $F2.b		; 02 F2
	eor ($B8.b,X)		; 41 B8
	bit $D5.b,X		; 34 D5
	cmp #$13.b		; C9 13
	rti		; 40

	sec		; 38
	ora #$24.b		; 09 24
	trb $C8D2.w		; 1C D2 C8
	mvn $68,$76		; 54 76 68
	sbc ($B3.b,X)		; E1 B3
	lda [$8B.b]		; A7 8B
	pha		; 48
	bit #$37.b		; 89 37
	jsr ($6024.w,X)		; FC 24 60
	eor $C9.b		; 45 C9
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	bvc  66.b		; 50 42
	adc $F9F1.w,Y		; 79 F1 F9
	bit $C9.b		; 24 C9
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
	eor #$24.b		; 49 24
	sta ($49.b)		; 92 49
	bit $93.b		; 24 93
	eor #$9E.b		; 49 9E
	cmp $C034.w,X		; DD 34 C0
	dec $46.b		; C6 46
	tya		; 98
	lda $68.b,S		; A3 68
	cmp ($31.b,S),Y		; D3 31
	lda $6D.b,X		; B5 6D
	stz $8103.w		; 9C 03 81
	cli		; 58
	lda ($62.b),Y		; B1 62
	cmp $8B.b		; C5 8B
	asl $2C.b,X		; 16 2C
	cli		; 58
	lda ($62.b),Y		; B1 62
	cmp $8B.b		; C5 8B
	asl $2C.b,X		; 16 2C
	adc $139C.w		; 6D 9C 13
	sta $69.b,S		; 83 69
	stx $DB.b,Y		; 96 DB
	lda [$0D.b],Y		; B7 0D
	wai		; CB
	sty $5A.b		; 84 5A
	lda $6A.b,X		; B5 6A
	cmp $AB.b,X		; D5 AB
	lsr $AD.b,X		; 56 AD
	phy		; 5A
	lda $6A.b,X		; B5 6A
	cmp $AB.b,X		; D5 AB
	lsr $AD.b,X		; 56 AD
	ror $971B.w		; 6E 1B 97
	asl A		; 0A
	cmp ($2D.b,S),Y		; D3 2D
	tsx		; BA
	bvs -53.b		; 70 CB
	sta [$2E.b],Y		; 97 2E
	jmp $E572B9.l		; 5C B9 72 E5
	wai		; CB
	sta [$2E.b],Y		; 97 2E
	jmp $E572B9.l		; 5C B9 72 E5
	wai		; CB
	sta [$38.b],Y		; 97 38
	adc [$10.b],Y		; 77 10
	cmp $CBB4.w,X		; DD B4 CB
	adc ($2E.b),Y		; 71 2E
	and #$C5.b		; 29 C5
	lda ($32.b)		; B2 32
	and ($32.b)		; 32 32
	and [$8C.b],Y		; 37 8C
	inc $7B.b		; E6 7B
	and $CF9E.w,X		; 3D 9E CF
	adc ($8C.b),Y		; 71 8C
	inc $46.b		; E6 46
	lsr $46.b		; 46 46
	lsr $F1.b		; 46 F1
	ldy #$D1.b		; A0 D1
	adc #$98.b		; 69 98
	cmp ($5E.b)		; D2 5E
	sbc $5C.b,S		; E3 5C
	adc ($7A.b,S),Y		; 73 7A
	sbc $DB.b,S		; E3 DB
	cmp [$20.b],Y		; D7 20
	dec $2E72.w		; CE 72 2E
	eor #$95.b		; 49 95
	cmp #$B9.b		; C9 B9
	eor [$2A.b]		; 47 2A
	sbc $9B.b		; E5 9B
	cmp [$2E.b],Y		; D7 2E
	cpy $1AE6.w		; CC E6 1A
	ora $9916.w		; 0D 16 99
	sta $EC25.w		; 8D 25 EC
	trb $9ACB.w		; 1C CB 9A
	adc ($6A.b,S),Y		; 73 6A
	adc ($8C.b,S),Y		; 73 8C
	inc $2D.b		; E6 2D
	sec		; 38
	sec		; 38
	adc ($AE.b,S),Y		; 73 AE
	bcc -23.b		; 90 E9
	rol $E994.w		; 2E 94 E9
	ror A		; 6A
	stz $C7.b,X		; 74 C7
	eor $CD73.w		; 4D 73 CD
	asl $8B.b		; 06 8B
	lda [$3A.b]		; A7 3A
	tda		; 7B
	tay		; A8
	dec A		; 3A
	dey		; 88
	brk $34.b		; 00 34
	sta [$B0.b],Y		; 97 B0
	adc $27.b,X		; 75 27
	eor ($75.b,S),Y		; 53 75
	eor [$55.b]		; 47 55
	adc $66.b,X		; 75 66
	adc ($AB.b,S),Y		; 73 AB
	tsx		; BA
	cmp $AC.b,S		; C3 AC
	tsx		; BA
	cmp ($AD.b,S),Y		; D3 AD
	tsx		; BA
	sbc $AE.b,S		; E3 AE
	tsx		; BA
	sbc ($AF.b,S),Y		; F3 AF
	tyx		; BB
	ora $B0.b,S		; 03 B0
	ldy $1A.b,X		; B4 1A
	rol $ECC4.w		; 2E C4 EC
	ror $ECC8.w		; 6E C8 EC
	ldy #$00.b		; A0 00
	cmp ($5E.b)		; D2 5E
	cpx $CECE.w		; EC CE CE
	sbc $D20E.w		; ED 0E D2
	sbc $D64E.w		; ED 4E D6
	sbc $DA8E.w		; ED 8E DA
	sbc $DECE.w		; ED CE DE
	inc $E20E.w		; EE 0E E2
	inc $E64E.w		; EE 4E E6
	inc $EA8E.w		; EE 8E EA
	inc $EECE.w		; EE CE EE
	bne 104.b		; D0 68
	tyx		; BB
	cmp $BC.b,S		; C3 BC
	tyx		; BB
	cmp ($BD.b,S),Y		; D3 BD
	lda [$CD.b],Y		; B7 CD
	sbc ($7C.b,S),Y		; F3 7C
	cmp $8E1A35.l,X		; DF 35 1A 8E
	sed		; F8
	lda $5BDF.w,X		; BD DF 5B
	inc $FD.b,X		; F6 FD
	cmp $FDF69B.l,X		; DF 9B F6 FD
	cmp $E001DE.l,X		; DF DE 01 E0
	lsr $E009.w,X		; 5E 09 E0
	dec $E111.w,X		; DE 11 E1
	lsr $E119.w,X		; 5E 19 E1
	dec $E221.w,X		; DE 21 E2
	lsr $E229.w,X		; 5E 29 E2
	jmp.w [$C6FB]		; DC FB C6
	bit $C76B.w,X		; 3C 6B C7
	bit $517B.w,X		; 3C 7B 51
	tay		; A8
	pei ($6A.b)		; D4 6A
	and $5A.b,X		; 35 5A
	lda $E4BD20.l		; AF 20 BD E4
	lsr $E449.w,X		; 5E 49 E4
	dec $E551.w,X		; DE 51 E5
	lsr $D059.w,X		; 5E 59 D0
	bit $CCBB.w,X		; 3C BB CC
	bit $CDCB.w,X		; 3C CB CD
	bit $CEDB.w,X		; 3C DB CE
	bit $CFEB.w,X		; 3C EB CF
	bit $D0FB.w,X		; 3C FB D0
	and $D10B.w,X		; 3D 0B D1
	and $A3F7.w,Y		; 39 F7 A3
	ply		; 7A
	eor [$A5.b]		; 47 A5
	ply		; 7A
	ror $AB.b		; 66 AB
	eor $AA.b,X		; 55 AA
	cmp $6B.b,X		; D5 6B
	and $9E.b,X		; 35 9E
	sta $D47B.w,X		; 9D 7B D4
	and $D54B.w,X		; 3D 4B D5
	and $D65B.w,X		; 3D 5B D6
	and $A06B.w,X		; 3D 6B A0
	ply		; 7A
	sbc [$AF.b]		; E7 AF
	tda		; 7B
	ora [$B1.b]		; 07 B1
	stz $2E.b,X		; 74 2E
	sta $EC.b		; 85 EC
	stz $EDCD.w,X		; 9E CD ED
	asl $EDD5.w,X		; 1E D5 ED
	stz $EEDD.w,X		; 9E DD EE
	asl $EEE5.w,X		; 1E E5 EE
	stz $EFED.w,X		; 9E ED EF
	inc A		; 1A
	cmp $B366.w		; CD 66 B3
	eor $D7AE.w,Y		; 59 AE D7
	tda		; 7B
	cmp $EF.b,X		; D5 EF
	jmp ($EFF7.w,X)		; 7C F7 EF
	bra  -8.b		; 80 F8
	and $6FF884.l		; 2F 84 F8 6F
	dey		; 88
	sed		; F8
	lda $EFF88C.l		; AF 8C F8 EF
	bcc  -7.b		; 90 F9
	and $6FF994.l		; 2F 94 F9 6F
	tya		; 98
	sbc $9CAF.w,Y		; F9 AF 9C
	sbc $A0EF.w,Y		; F9 EF A0
	plx		; FA
	and $6FFAA4.l		; 2F A4 FA 6F
	tay		; A8
	plx		; FA
	lda $BB76.w		; AD 76 BB
	eor $D8AE.w,X		; 5D AE D8
	jmp ($B33E.w)		; 6C 3E B3
	xba		; EB
	ldx $ECC3.w,Y		; BE C3 EC
	ldx $EDD3.w,Y		; BE D3 ED
	ldx $EEE3.w,Y		; BE E3 EE
	ldx $EFF3.w,Y		; BE F3 EF
	lda $BFF003.l,X		; BF 03 F0 BF
	ora ($F1.b,S),Y		; 13 F1
	lda $BFF223.l,X		; BF 23 F2 BF
	and ($F3.b,S),Y		; 33 F3
	lda $BFF443.l,X		; BF 43 F4 BF
	eor ($F5.b,S),Y		; 53 F5
	lda $7EA263.l,X		; BF 63 A2 7E
	cmp [$EE.b],Y		; D7 EE
	jmp ($1B36.w)		; 6C 36 1B
	ora $CB86.w		; 0D 86 CB
	adc $FB.b		; 65 FB
	cmp $5FFCC1.l,X		; DF C1 FC 5F
	cmp #$FC.b		; C9 FC
	cmp $5FFDD1.l,X		; DF D1 FD 5F
	cmp $DFFD.w,Y		; D9 FD DF
	sbc ($D1.b,X)		; E1 D1
	adc ($DF.b,S),Y		; 73 DF
	sbc $FE.b		; E5 FE
	sta $A31B.w,X		; 9D 1B A3
	adc $7FFCB7.l,X		; 7F B7 FC 7F
	cmp [$FE.b],Y		; D7 FE
	adc $B449F2.l,X		; 7F F2 49 B4
	txy		; 9B
	eor $9CB6.w,Y		; 59 B6 9C
	tsb $E0.b		; 04 E0
	ror $CB.b		; 66 CB
	adc $B2.b		; 65 B2
	lda ($59.b)		; B2 59
	sec		; 38
	and #$C1.b		; 29 C1
	cmp $DCBC.w		; CD BC DC
	eor $E1CC.w		; 4D CC E1
	and $B3.b		; 25 B3
	sta $9B.b		; 85 9B
	lda #$C3.b		; A9 C3
	phk		; 4B
	lda [$0F.b]		; A7 0F
	sec		; 38
	bit #$BB.b		; 89 BB
	txy		; 9B
	lda $CEC4.w,Y		; B9 C4 CE
	rol A		; 2A
	adc ($73.b),Y		; 71 73
	bit $DE.b		; 24 DE
	jmp $9FE9.w		; 4C E9 9F
	sec		; 38
	cmp #$A1.b		; C9 A1
	bit $66.b,X		; 34 66
	dec $4B69.w,X		; DE 69 4B
	and $92.b		; 25 92
	cmp #$7C.b		; C9 7C
	ldx $2F5F.w,Y		; BE 5F 2F
	sta [$CE.b],Y		; 97 CE
	rol $71.b,X		; 36 71
	cmp ($7B.b,S),Y		; D3 7B
	sec		; 38
	sbc $4EC8.w,Y		; F9 C8 4E
	lsr $72.b		; 46 72
	eor ($2C.b,S),Y		; 53 2C
	wai		; CB
	and ($CC.b)		; 32 CC
	lda ($2C.b,S),Y		; B3 2C
	wai		; CB
	and ($CC.b)		; 32 CC
	lda ($93.b,S),Y		; B3 93
	stz $E5A4.w		; 9C A4 E5
	adc [$2D.b]		; 67 2D
	and $7C79.w,Y		; 39 79 7C
	ldx $2F5F.w,Y		; BE 5F 2F
	sta [$CB.b],Y		; 97 CB
	sbc $F3.b		; E5 F3
	bit $CD.b,X		; 34 CD
	and ($4C.b,S),Y		; 33 4C
	cmp ($34.b,S),Y		; D3 34
	inc $26.b		; E6 26
	ora ($09.b,S),Y		; 13 09
	cpy $6ACE.w		; CC CE 6A
	adc ($30.b,X)		; 61 30
	tya		; 98
	jmp $1326.w		; 4C 26 13
	ora #$84.b		; 09 84
.ACCU 16
	rep #$61		; C2 61
	bmi -104.b		; 30 98
	jmp $3727.w		; 4C 27 37
	rol A		; 2A
	adc ($30.b,X)		; 61 30
	stz $CDE4.w		; 9C E4 CD
	and ($4C.b,S),Y		; 33 4C
	cmp ($34.b,S),Y		; D3 34
	cmp $9831.w		; CD 31 98
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
	ora $C68C.w,Y		; 19 8C C6
	adc $29.b,S		; 63 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $29.b		; A5 29
	lsr A		; 4A
	eor ($94.b)		; 52 94
	lda $34.b		; A5 34
	cpx $59.b		; E4 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	jsr $5936.w		; 20 36 59
	rol $03.b		; 26 03
	eor ($4F.b,S),Y		; 53 4F
	jmp $4449.w		; 4C 49 44
	phk		; 4B
	eor #$2E4B.w		; 49 4B 2E
	adc ($6F.b,S),Y		; 73 6F
	jmp ($9000.w)		; 6C 00 90
	cpy $5E.b		; C4 5E
	jsr ($5EC4.w,X)		; FC C4 5E
	plx		; FA
	phb		; 8B
	lsr $0E.b		; 46 0E
	rol $39.b		; 26 39
	ora [$75.b]		; 07 75
	asl $8B.b		; 06 8B
	lsr $10.b		; 46 10
	xba		; EB
	txy		; 9B
	bcc -72.b		; 90 B8
	trb $00.b		; 14 00
	sbc [$6E.b],Y		; F7 6E
	inc $068E.w,X		; FE 8E 06
	rol $59.b,X		; 36 59
	rol $03.b		; 26 03
	asl $84.b		; 06 84
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc [$77.b],Y		; 77 77
	adc [$50.b],Y		; 77 50
	adc [$99.b],Y		; 77 99
	sta $9999.w,Y		; 99 99 99
	bcc   0.b		; 90 00
	brk $C0.b		; 00 C0
	ora $EF.b		; 05 EF
	ora ($10.b)		; 12 10
	brk $F0.b		; 00 F0
	jsl $12C40D.l		; 22 0D C4 12
	bit $30D2.w,X		; 3C D2 30
	sbc $EB24F0.l		; EF F0 24 EB
	cpy $E1.b		; C4 E1
	eor ($DD.b)		; 52 DD
	sbc ($21.b),Y		; F1 21
	brk $FD.b		; 00 FD
	trb $B4.b		; 14 B4
	dec A		; 3A
	lda ($42.b)		; B2 42
	ora $21E010.l		; 0F 10 E0 21
	and ($B4.b,X)		; 21 B4
	bne  35.b		; D0 23
	sbc $41B33F.l,X		; FF 3F B3 41
	sbc $FDA421.l,X		; FF 21 A4 FD
	and [$FD.b],Y		; 37 FD
	.db $42, $AB		; 42 AB
	asl $75.b,X		; 16 75
	and ($B4.b,X)		; 21 B4
	sbc #$61A5.w		; E9 A5 61
	cmp ($32.b)		; D2 32
	ora $F2CE.w		; 0D CE F2
	ldy $5E.b		; A4 5E
	bcs  16.b		; B0 10
	cpx #$E0.b		; E0 E0
	sbc $94FEEF.l,X		; FF EF FE 94
	sbc $FFCD.w		; ED CD FF
	lda $DCDD.w		; AD DD DC
	cmp #$94DD.w		; C9 DD 94
	asl $AEDE.w,X		; 1E DE AE
	tsb $DD0C.w		; 0C 0C DD
	dec $941E.w,X		; DE 1E 94
	sbc $F1FC.w,X		; FD FC F1
	inc $DFF0.w,X		; FE F0 DF
	phk		; 4B
	cmp ($94.b)		; D2 94
	and $AF30E2.l		; 2F E2 30 AF
	and $01.b,X		; 35 01
	brk $E4.b		; 00 E4
	bcs  15.b		; B0 0F
	sbc ($53.b)		; F2 53
	beq  87.b		; F0 57
	adc $45.b,S		; 63 45
	eor $A4.b		; 45 A4
	and ($30.b,S),Y		; 33 30
	sbc ($13.b)		; F2 13
	ora $42.b,S		; 03 42
	and ($04.b),Y		; 31 04
	sty $33.b,X		; 94 33
	bit $43.b		; 24 43
	eor ($36.b),Y		; 51 36
	bit $22.b,X		; 34 22
	bit $94.b,X		; 34 94
	and ($32.b,S),Y		; 33 32
	bit $22.b		; 24 22
	and ($31.b)		; 32 31
	jsl $638424.l		; 22 24 84 63
	ora ($21.b),Y		; 11 21
	eor ($03.b,S),Y		; 53 03
	ora ($43.b)		; 12 43
	sbc $1574.w,X		; FD 74 15
	jsl $FEF2FF.l		; 22 FF F2 FE
	sbc ($BB.b,X)		; E1 BB
	cpy $DD84.w		; CC 84 DD
	bne -68.b		; D0 BC
	sbc $BADB.w		; ED DB BA
	wai		; CB
	ldy $EDC0.w,X		; BC C0 ED
	cmp $DDDC.w,X		; DD DC DD
	jmp.w [$BCCB]		; DC CB BC
	cpy $0DB4.w		; CC B4 0D
	cmp $ECF011.l,X		; DF 11 F0 EC
	beq   2.b		; F0 02
	ora $98C0.w		; 0D C0 98
	sta $98AA.w,Y		; 99 AA 98
	bit #$9999.w		; 89 99 99
	sta $DE94.w,Y		; 99 94 DE
	cmp $FDDE.w		; CD DE FD
	cmp $FDED.w,X		; DD ED FD
	inc $DC84.w		; EE 84 DC
	tyx		; BB
	tsb $CBFD.w		; 0C FD CB
	lda ($F1.b),Y		; B1 F1
	xba		; EB
	sty $2C.b		; 84 2C
	asl $331A.w		; 0E 1A 33
	bpl -65.b		; 10 BF
	ora [$21.b]		; 07 21
	sty $F1.b		; 84 F1
	ora ($23.b),Y		; 11 23
	rol $30.b,X		; 36 30
	bit $34.b		; 24 34
	adc [$94.b]		; 67 94
	jsr $2433.w		; 20 33 24
	eor $22.b,S		; 43 22
	and ($44.b,S),Y		; 33 44
	bit $94.b		; 24 94
	bit $54.b,X		; 34 54
	and $47.b,S		; 23 47
	eor ($32.b,S),Y		; 53 32
	mvp $A4,$47		; 44 47 A4
	and ($11.b,X)		; 21 11
	eor $21.b,S		; 43 21
	and ($12.b,X)		; 21 12
	ora $12.b,X		; 15 12
	cpy #$77.b		; C0 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	ror $77.b		; 66 77
	ror $94.b,X		; 76 94
	jsl $325112.l		; 22 12 51 32
	jsl $003410.l		; 22 10 34 00
	sty $15.b		; 84 15
	adc $1A.b		; 65 1A
	eor [$42.b]		; 47 42
	cmp $841022.l		; CF 22 10 84
	and $CD.b,X		; 35 CD
	bpl  15.b		; 10 0F
	bmi -82.b		; 30 AE
	ora $940F.w		; 0D 0F 94
	ora $CF000E.l		; 0F 0E 00 CF
	sbc $CD2E.w		; ED 2E CD
	bpl -108.b		; 10 94
	ldx $DEFE.w,Y		; BE FE DE
	sbc $0DDDDB.l		; EF DB DD 0D
	ldx $1D94.w,Y		; BE 94 1D
	tyx		; BB
	cpx $DCDE.w		; EC DE DC
	cmp $0DAE.w,X		; DD AE 0D
	cpy #$AA.b		; C0 AA
	plb		; AB
	tsx		; BA
	lda #$AA9A.w		; A9 9A AA
	tax		; AA
	lda #$EFA4.w		; A9 A4 EF
	ora $4FBDEC.l,X		; 1F EC BD 4F
	sbc $9400DD.l		; EF DD 00 94
	sbc $ECDE.w		; ED DE EC
	cmp $EEFF.w		; CD FF EE
	inc $84DD.w		; EE DD 84
	cmp $BED9ED.l,X		; DF ED D9 BE
	dec $DD0D.w,X		; DE 0D DD
	bit $9B74.w		; 2C 74 9B
	cmp $61CFCA.l,X		; DF CA CF 61
	xce		; FB
	sbc $0D74E4.l		; EF E4 74 0D
	bpl  37.b		; 10 25
	pea $1361.w		; F4 61 13
	and ($00.b,S),Y		; 33 00
	sty $32.b,X		; 94 32
	and ($0F.b,X)		; 21 0F
	asl $2F.b,X		; 16 2F
	ora ($22.b),Y		; 11 22
	and $94.b,S		; 23 94
	and ($F1.b),Y		; 31 F1
	mvp $30,$12		; 44 12 30
	tsb $26.b		; 04 26
	bpl -108.b		; 10 94
	eor ($02.b),Y		; 51 02
	mvp $23,$10		; 44 10 23
	and $40.b,X		; 35 40
	cop $84.b		; 02 84
	adc $36.b,X		; 75 36
	mvn $54,$55		; 54 55 54
	eor $46.b,X		; 55 46
	eor $94.b		; 45 94
	jsl $124610.l		; 22 10 46 12
	cop $51.b		; 02 51
	ora ($43.b),Y		; 11 43
	sty $03.b,X		; 94 03
	eor ($F3.b,X)		; 41 F3
	and ($22.b)		; 32 22
	ora ($33.b),Y		; 11 33
	ora ($84.b)		; 12 84
	and ($34.b,S),Y		; 33 34
	adc ($13.b,S),Y		; 73 13
	and ($36.b)		; 32 36
	bit $32.b,X		; 34 32
	sty $34.b		; 84 34
	bit $03.b		; 24 03
	eor $21.b,S		; 43 21
	eor $12.b,S		; 43 12
	jsl $346474.l		; 22 74 64 34
	eor ($61.b,S),Y		; 53 61
	ora $12.b,X		; 15 12
	rol $4F.b,X		; 36 4F
	stz $0E.b,X		; 74 0E
	adc ($61.b,X)		; 61 61
	ora $4EF3.w		; 0D F3 4E
	and $90E2.w		; 2D E2 90
	adc [$54.b],Y		; 77 54
	eor $42.b,X		; 55 42
	jsl $EF1F21.l		; 22 21 1F EF
	sty $0C.b		; 84 0C
	cpy #$01.b		; C0 01
	sbc $20BE.w,X		; FD BE 20
	jmp.w [$84BC]		; DC BC 84
	sbc $BEEDED.l,X		; FF ED ED BE
	asl $CCBE.w		; 0E BE CC
	cmp $CC84.w,X		; DD 84 CC
	xba		; EB
	cpy $CECC.w		; CC CC CE
	cpx $DA9C.w		; EC 9C DA
	cpy #$CC.b		; C0 CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $B984.w		; CC 84 B9
	wai		; CB
	lda $CCAB.w		; AD AB CC
	lda $AB99.w		; AD 99 AB
	sty $DC.b		; 84 DC
	lda $BB9C.w,Y		; B9 9C BB
	wai		; CB
	tsx		; BA
	tyx		; BB
	cpy $AB84.w		; CC 84 AB
	plb		; AB
	ldy $ACCC.w,X		; BC CC AC
	ldy $BCCC.w,X		; BC CC BC
	sty $CC.b		; 84 CC
	jmp.w [$DCCC]		; DC CC DC
	cmp $CDEC.w,X		; DD EC CD
	sbc $9C74.w		; ED 74 9C
	tyx		; BB
	plb		; AB
	jmp.w [$CEBF]		; DC BF CE
	cmp $74ED.w		; CD ED 74
	cmp $D22C.w,X		; DD 2C D2
	cpy #$00.b		; C0 00
	sbc $511F.w,X		; FD 1F 51
	stz $22.b,X		; 74 22
	cmp ($22.b,X)		; C1 22
	and ($13.b),Y		; 31 13
	eor [$10.b]		; 47 10
	tsb $84.b		; 04 84
	eor $23.b,S		; 43 23
	and ($13.b),Y		; 31 13
	and ($42.b,S),Y		; 33 42
	jsl $348454.l		; 22 54 84 34
	and ($55.b)		; 32 55
	adc $43.b,S		; 63 43
	lsr $54.b		; 46 54
	and $84.b,X		; 35 84
	adc $64.b		; 65 64
	eor $64.b,X		; 55 64
	adc [$55.b]		; 67 55
	ror $55.b		; 66 55
	sty $75.b		; 84 75
	eor [$56.b],Y		; 57 56
	eor [$65.b],Y		; 57 65
	ror $56.b,X		; 76 56
	adc $84.b,X		; 75 84
	ror $66.b		; 66 66
	adc $65.b		; 65 65
	adc $66.b		; 65 66
	lsr $55.b,X		; 56 55
	sty $46.b		; 84 46
	eor $47.b,X		; 55 47
	mvp $53,$54		; 44 54 53
	eor $44.b,X		; 55 44
	sty $33.b		; 84 33
	eor $33.b		; 45 33
	.db $42, $44		; 42 44
	and $32.b,S		; 23 32
	and $74.b,S		; 23 74
	adc $63.b		; 65 63
	eor ($36.b,S),Y		; 53 36
	jsl $232144.l		; 22 44 21 23
	stz $14.b,X		; 74 14
	bmi  18.b		; 30 12
	sbc ($2F.b,X)		; E1 2F
	ora $74E01F.l,X		; 1F 1F E0 74
	cpx #$2C.b		; E0 2C
	sbc $EFDEDD.l,X		; FF DD DE EF
	cpx $74BE.w		; EC BE 74
	cmp $9DCC.w,X		; DD CC 9D
	cpy $C9CA.w		; CC CA C9
	cmp $8499.w		; CD 99 84
	dec $ECCD.w,X		; DE CD EC
	dec $BECD.w		; CE CD BE
	cmp $84CC.w		; CD CC 84
	cpy $CCDC.w		; CC DC CC
	lda $CBDB.w,X		; BD DB CB
	xba		; EB
	ldy $CC84.w,X		; BC 84 CC
	stp		; DB
	ldy $BDDB.w,X		; BC DB BD
	stp		; DB
	cpy $84BC.w		; CC BC 84
	cpy $CBCD.w		; CC CD CB
	cmp $DCCB.w		; CD CB DC
	cpy $84CD.w		; CC CD 84
	cmp $CCDC.w		; CD DC CC
	cmp $CEED.w		; CD ED CE
	lda $74ED.w,X		; BD ED 74
	txy		; 9B
	ldy $CB99.w,X		; BC 99 CB
	wai		; CB
	dex		; CA
	cpy $74AC.w		; CC AC 74
	jmp.w [$DDCD]		; DC CD DD
	cpx $EDDB.w		; EC DB ED
	sbc $640C.w		; ED 0C 64
	cpy $0D9D.w		; CC 9D 0D
	sbc ($AE.b,X)		; E1 AE
	inc $0FFF.w,X		; FE FF 0F
	stz $C0.b		; 64 C0
	brk $14.b		; 00 14
	cmp ($12.b)		; D2 12
	jsl $74F223.l		; 22 23 F2 74
	ora $00.b,S		; 03 00
	.db $42, $20		; 42 20
	and $05.b,S		; 23 05
	and ($31.b,X)		; 21 31
	stz $33.b,X		; 74 33
	bit $12.b,X		; 34 12
	and ($32.b)		; 32 32
	eor ($42.b)		; 52 42
	eor $74.b,S		; 43 74
	bit $43.b		; 24 43
	eor $45.b,S		; 43 45
	and $35.b,S		; 23 35
	and ($34.b,S),Y		; 33 34
	stz $33.b,X		; 74 33
	mvn $31,$35		; 54 35 31
	mvn $43,$33		; 54 33 43
	and $74.b,X		; 35 74
	eor $43.b,S		; 43 43
	bit $52.b,X		; 34 52
	and $23.b,X		; 35 23
	eor $23.b		; 45 23
	stz $43.b,X		; 74 43
	trb $53.b		; 14 53
	and $32.b		; 25 32
	and ($25.b,S),Y		; 33 25
	and ($74.b,S),Y		; 33 74
	ora $31.b		; 05 31
	and $21.b,X		; 35 21
	eor ($33.b),Y		; 51 33
	and ($32.b),Y		; 31 32
	stz $31.b,X		; 74 31
	eor ($03.b),Y		; 51 03
	bmi  50.b		; 30 32
	bmi  80.b		; 30 50
	trb $64.b		; 14 64
	ora $14.b		; 05 14
	eor ($71.b,X)		; 41 71
	mvp $03,$04		; 44 04 03
	rti		; 40

	stz $33.b		; 64 33
	eor $023333.l		; 4F 33 33 02
	sbc [$F2.b],Y		; F7 F2
	and $F2E664.l,X		; 3F 64 E6 F2
	jsl $F5212F.l		; 22 2F 21 F5
	inc $6416.w		; EE 16 64
	dec $2D11.w,X		; DE 11 2D
	eor $D111.w,X		; 5D 11 D1
	bpl  29.b		; 10 1D
	rts		; 60

	adc [$77.b],Y		; 77 77
	mvp $4C,$44		; 44 44 4C
	cpy $CCCC.w		; CC CC CC
	stz $00.b		; 64 00
	beq   0.b		; F0 00
	jsr ($C30F.w,X)		; FC 0F C3
	cmp $BF64F0.l		; CF F0 64 BF
	bit $BFFF.w,X		; 3C FF BF
	sbc $EB3BEB.l,X		; FF EB 3B EB
	stz $2B.b		; 64 2B
	inc $2AEB.w,X		; FE EB 2A
	sbc $EEA2EE.l		; EF EE A2 EE
	stz $EB.b		; 64 EB
	stp		; DB
	inc A		; 1A
	sbc ($EA.b,X)		; E1 EA
	sbc ($AE.b,X)		; E1 AE
	nop		; EA
	stz $D1.b		; 64 D1
	nop		; EA
	dec $EDDD.w,X		; DE DD ED
	sbc $D1DA.w		; ED DA D1
	stz $E9.b		; 64 E9
	asl $ED9D.w,X		; 1E 9D ED
	cmp ($DA.b),Y		; D1 DA
	inc A		; 1A
	cmp $1A64.w,X		; DD 64 1A
	cmp $DEDD.w,X		; DD DD DE
	cmp $AD5D.w,Y		; D9 5D AD
	inc A		; 1A
	stz $DD.b		; 64 DD
	inc A		; 1A
	ora $DEDE.w,X		; 1D DE DE
	sta ($ED.b),Y		; 91 ED
	dec $DE64.w,X		; DE 64 DE
	dec $EDDD.w,X		; DE DD ED
	sbc $1E1A.w		; ED 1A 1E
	sbc $CB54.w		; ED 54 CB
	ldy $BCB3.w,X		; BC B3 BC
	cpy $CCCB.w		; CC CB CC
	wai		; CB
	stz $2E.b		; 64 2E
	inc $EFEE.w		; EE EE EF
	inc $B22E.w		; EE 2E B2
	inc $FE64.w		; EE 64 FE
	sbc $2BEE2B.l		; EF 2B EE 2B
	and $54FEFE.l		; 2F FE FE 54
	lsr $EDED.w,X		; 5E ED ED
	inc $EED6.w		; EE D6 EE
	inc $54EE.w		; EE EE 54
	inc $FEE6.w		; EE E6 FE
	inc $EFFF.w,X		; FE FF EF
	inc $FF.b		; E6 FF
	rts		; 60

	sta $C999.w,Y		; 99 99 C9
	stz $CCCC.w		; 9C CC CC
	cpy $24CC.w		; CC CC 24
	ldy $CCCC.w,X		; BC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $64CC.w		; CC CC 64
	brk $70.b		; 00 70
	ora ($00.b,X)		; 01 00
	tsb $D0.b		; 04 D0
	tsb $D0.b		; 04 D0
	stz $41.b		; 64 41
	ora ($4D.b,X)		; 01 4D
	ora $0D.b		; 05 0D
	eor ($11.b,X)		; 41 11
	ora ($64.b,X)		; 01 64
	bpl  17.b		; 10 11
	eor $1115.w		; 4D 15 11
	ora ($0E.b),Y		; 11 0E
	eor ($64.b,X)		; 41 64
	ora $1151.w,X		; 1D 51 11
	bpl -28.b		; 10 E4
	ora $1451.w,X		; 1D 51 14
	stz $E1.b		; 64 E1
	trb $E1.b		; 14 E1
	lsr $1111.w		; 4E 11 11
	ora ($11.b),Y		; 11 11
	bvs 119.b		; 70 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	adc [$64.b],Y		; 77 64
	and ($11.b,X)		; 21 11
	pei ($11.b)		; D4 11
	ora ($11.b),Y		; 11 11
	ora ($D5.b),Y		; 11 D5
	stz $1D.b		; 64 1D
	eor ($11.b,X)		; 41 11
	cmp ($10.b),Y		; D1 10
	ora ($01.b),Y		; 11 01
	ora ($64.b),Y		; 11 64
	ora ($10.b,X)		; 01 10
	ora ($10.b),Y		; 11 10
	ora $1041.w,X		; 1D 41 10
	ora $0564.w,X		; 1D 64 05
	bne  77.b		; D0 4D
	bpl  16.b		; 10 10
	trb $D0.b		; 14 D0
	bpl  96.b		; 10 60
	stz $74.b,X		; 74 74
	eor [$44.b]		; 47 44
	stz $44.b,X		; 74 44
	stz $44.b,X		; 74 44
	bvc 119.b		; 50 77
	adc [$79.b],Y		; 77 79
	adc [$07.b],Y		; 77 07
	adc $9999.w,Y		; 79 99 99
	bit $AC.b		; 24 AC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $9950.w		; CC 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $CC60.w,Y		; 99 60 CC
	cpy $CCCC.w		; CC CC CC
	stz $CCC9.w		; 9C C9 CC
	cmp #$3064.w		; C9 64 30
	cmp $0C.b,S		; C3 0C
	beq  -4.b		; F0 FC
	jmp ($F0C3.w,X)		; 7C C3 F0
	stz $F0.b		; 64 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	cmp $F0.b,S		; C3 F0
	beq 100.b		; F0 64
	beq  -4.b		; F0 FC
	bmi -16.b		; 30 F0
	beq -49.b		; F0 CF
	and $F06400.l,X		; 3F 00 64 F0
	beq  -4.b		; F0 FC
	bmi -77.b		; 30 B3
	ora $640F0F.l		; 0F 0F 0F 64
	ora $3F0C0F.l		; 0F 0F 0C 3F
	tsb $0F6C.w		; 0C 6C 0F
	ora $C0C764.l		; 0F 64 C7 C0
	beq -77.b		; F0 B3
	ora $F0C0C7.l		; 0F C7 C0 F0
	stz $FC.b		; 64 FC
	jmp ($CFF4.w,X)		; 7C F4 CF
	ora $F34C0F.l		; 0F 0F 4C F3
	rts		; 60

	cmp #$999C.w		; C9 9C 99
	cmp #$C99C.w		; C9 9C C9
	stz $60C9.w		; 9C C9 60
	cpy $CC99.w		; CC 99 CC
	stz $CCCC.w		; 9C CC CC
	sta $60CC.w,Y		; 99 CC 60
	stz $CCC9.w		; 9C C9 CC
	cpy $CCCC.w		; CC CC CC
	cpy $509C.w		; CC 9C 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5199.w,Y		; 99 99 51
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5999.w,Y		; 99 99 59
	eor $4B.b,X		; 55 4B
	eor $1C0000.l		; 4F 00 00 1C
	jsr $0000.w		; 20 00 00
	trb $0020.w		; 1C 20 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $FF.b		; 00 FF
	sbc $F56801.l,X		; FF 01 68 F5
	cmp $CDF5.w		; CD F5 CD
	brk $01.b		; 00 01
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cop $1F.b		; 02 1F
	beq  -3.b		; F0 FD
	bit $3F.b		; 24 3F
	cpx $A8CE.w		; EC CE A8
	bit $F1.b,X		; 34 F1
	cpy #$43.b		; C0 43
	asl $41C0.w,X		; 1E C0 41
	plb		; AB
	tay		; A8
	cmp ($52.b)		; D2 52
	cmp $C00B11.l,X		; DF 11 0B C0
	and ($0D.b),Y		; 31 0D
	tya		; 98
	pei ($29.b)		; D4 29
	ldx $FC11.w		; AE 11 FC
	cpx #$FE.b		; E0 FE
	sbc $CECD88.l		; EF 88 CD CE
	inc $EEBB.w		; EE BB EE
	cmp $DEDD.w,X		; DD DD DE
	tya		; 98
	sbc $EFFEEF.l		; EF EF FE EF
	ora $2ED1EB.l,X		; 1F EB D1 2E
	tay		; A8
	sbc ($0C.b),Y		; F1 0C
	cmp ($2F.b),Y		; D1 2F
	sbc $00FF0F.l,X		; FF 0F FF 00
	tya		; 98
	inc $F0FF.w,X		; FE FF F0
	adc $EA.b		; 65 EA
	jmp.w [$E2BB]		; DC BB E2
	clv		; B8
	and ($FF.b,X)		; 21 FF
	and ($FE.b,X)		; 21 FE
	sbc $FA4113.l		; EF 13 41 FA
	clv		; B8
	bcs  65.b		; B0 41
	ora ($21.b),Y		; 11 21
	asl $0FF1.w		; 0E F1 0F
	brk $98.b		; 00 98
	and $50.b,X		; 35 50
	and $00.b,S		; 23 00
	ora ($DE.b),Y		; 11 DE
	and $33.b,X		; 35 33
	ldy $45.b		; A4 45
	and ($22.b)		; 32 22
	ora ($22.b),Y		; 11 22
	jsr $E4DC.w		; 20 DC E4
	tay		; A8
	eor $0F32B0.l,X		; 5F B0 32 0F
	ora $30.b,S		; 03 30
	sbc ($11.b),Y		; F1 11
	dey		; 88
	eor $33.b		; 45 33
	bit $43.b,X		; 34 43
	bit $43.b,X		; 34 43
	eor $43.b,S		; 43 43
	tay		; A8
	ora ($10.b),Y		; 11 10
	ora ($0E.b),Y		; 11 0E
	cmp ($66.b),Y		; D1 66
	and $3288E0.l		; 2F E0 88 32
	and $34.b		; 25 34
	bit $34.b,X		; 34 34
	bit $34.b,X		; 34 34
	and ($88.b,S),Y		; 33 88
	bit $21.b,X		; 34 21
	lsr $54.b		; 46 54
	jsr $3136.w		; 20 36 31
	bit $98.b,X		; 34 98
	and ($11.b,X)		; 21 11
	jsl $421210.l		; 22 10 12 42
	beq  33.b		; F0 21
	tya		; 98
	brk $13.b		; 00 13
	.db $42, $00		; 42 00
	ora ($11.b,X)		; 01 11
	ora $1488EF.l		; 0F EF 88 14
	and ($36.b)		; 32 36
	and $03BFBB.l		; 2F BB BF 03
	mvn $FE,$98		; 54 98 FE
	cpx #$22.b		; E0 22
	brk $FC.b		; 00 FC
	ldy $43F2.w		; AC F2 43
	tya		; 98
	beq   0.b		; F0 00
	stp		; DB
	plb		; AB
	sbc ($4F.b)		; F2 4F
	dec $88FE.w,X		; DE FE 88
	cmp $CDDC.w		; CD DC CD
	jmp.w [$DDCC]		; DC CC DD
	jmp.w [$88CC]		; DC CC 88
	cmp $DDCC.w,X		; DD CC DD
	cpy $CCDD.w		; CC DD CC
	cmp $88CC.w,X		; DD CC 88
	jmp.w [$DDCD]		; DC CD DD
	cpy $DCCD.w		; CC CD DC
	jmp.w [$88DC]		; DC DC 88
	jmp.w [$DCCD]		; DC CD DC
	cmp $CDDC.w		; CD DC CD
	jmp.w [$88CD]		; DC CD 88
	jmp.w [$DCCD]		; DC CD DC
	cmp $CDDC.w		; CD DC CD
	jmp.w [$88CD]		; DC CD 88
	jmp.w [$DCCD]		; DC CD DC
	cmp $CCED.w		; CD ED CC
	cmp $98DC.w,X		; DD DC 98
	sbc $FEEFFE.l		; EF FE EF FE
	sbc $BB0EF1.l		; EF F1 0E BB
	tya		; 98
	pea $E00C.w		; F4 0C E0
	inc $2101.w,X		; FE 01 21
	jmp.w [$8801]		; DC 01 88
	sbc $240121.l,X		; FF 21 01 24
	eor ($CB.b),Y		; 51 CB
	cmp ($31.b),Y		; D1 31
	tya		; 98
	sbc ($34.b),Y		; F1 34
	and ($F1.b),Y		; 31 F1
	and $10.b,S		; 23 10
	sbc $628813.l,X		; FF 13 88 62
	and ($44.b,S),Y		; 33 44
	and ($33.b)		; 32 33
	and ($44.b,S),Y		; 33 44
	and ($88.b,S),Y		; 33 88
	bit $44.b,X		; 34 44
	and $44.b,S		; 23 44
	and ($44.b,S),Y		; 33 44
	and ($44.b,S),Y		; 33 44
	dey		; 88
	bit $43.b,X		; 34 43
	bit $43.b,X		; 34 43
	bit $43.b,X		; 34 43
	bit $44.b,X		; 34 44
	dey		; 88
	and ($34.b,S),Y		; 33 34
	mvp $44,$33		; 44 33 44
	and ($44.b,S),Y		; 33 44
	and ($88.b,S),Y		; 33 88
	mvp $44,$33		; 44 33 44
	bit $34.b,X		; 34 34
	bit $34.b,X		; 34 34
	bit $88.b,X		; 34 88
	bit $33.b,X		; 34 33
	bit $43.b,X		; 34 43
	and ($33.b,S),Y		; 33 33
	mvp $98,$32		; 44 32 98
	and ($21.b,X)		; 21 21
	and ($1F.b,X)		; 21 1F
	sbc ($45.b),Y		; F1 45
	and $317801.l		; 2F 01 78 31
	and ($FE.b,S),Y		; 33 FE
	trb $01.b		; 14 01
	and $54.b		; 25 54
	ora $E1FE88.l		; 0F 88 FE E1
	and $2EE1BC.l,X		; 3F BC E1 2E
	tyx		; BB
	cmp ($98.b),Y		; D1 98
	ora $D0EDEF.l,X		; 1F EF ED D0
	bpl -20.b		; 10 EC
	cpx #$FD.b		; E0 FD
	dey		; 88
	lda $DCED.w		; AD ED DC
	cmp $CDDC.w,X		; DD DC CD
	cpy $88DD.w		; CC DD 88
	cpy $CCDD.w		; CC DD CC
	cmp $DCCC.w,X		; DD CC DC
	jmp.w [$88DC]		; DC DC 88
	jmp.w [$DCDC]		; DC DC DC
	jmp.w [$DCDC]		; DC DC DC
	cmp $88DC.w		; CD DC 88
	cmp $DCDC.w		; CD DC DC
	jmp.w [$CDDC]		; DC DC CD
	cmp $78CD.w,X		; DD CD 78
	sta $A99A.w,Y		; 99 9A A9
	sta $AAAA.w,Y		; 99 AA AA
	tax		; AA
	stz $00A4.w		; 9C A4 00
	asl $F1DD.w		; 0E DD F1
	jsr $33F1.w		; 20 F1 33
	phd		; 0B
	tya		; 98
	lda $40.b,X		; B5 40
	ora ($12.b,X)		; 01 12
	and ($EA.b)		; 32 EA
	ldy $A8E0.w,X		; BC E0 A8
	and ($EF.b,X)		; 21 EF
	and $30.b,X		; 35 30
	lda $EF33.w		; AD 33 EF
	ora ($A8.b,S),Y		; 13 A8
	and $CE51B1.l,X		; 3F B1 51 CE
	inc $6704.w,X		; FE 04 67
	bit $32A4.w,X		; 3C A4 32
	and ($1E.b,S),Y		; 33 1E
	sbc ($53.b,S),Y		; F3 53
	ora $982202.l		; 0F 02 22 98
	cpx #$25.b		; E0 25
	and ($21.b,S),Y		; 33 21
	brk $22.b		; 00 22
	and ($22.b,X)		; 21 22
	tya		; 98
	and ($22.b,X)		; 21 22
	jsl $62F52F.l		; 22 2F F5 62
	sbc ($22.b),Y		; F1 22
	dey		; 88
	and ($44.b,S),Y		; 33 44
	bit $34.b,X		; 34 34
	bit $34.b,X		; 34 34
	bit $34.b,X		; 34 34
	dey		; 88
	bit $33.b,X		; 34 33
	mvp $11,$43		; 44 43 11
	eor [$64.b]		; 47 64
	brk $98.b		; 00 98
	ora ($13.b),Y		; 11 13
	bvc -33.b		; 50 DF
	lsr $51.b		; 46 51
	sbc $209813.l		; EF 13 98 20
	ora ($21.b)		; 12 21
	brk $FF.b		; 00 FF
	and [$63.b]		; 27 63
	xce		; FB
	tya		; 98
	pea $F02F.w		; F4 2F F0
	cop $45.b		; 02 45
	and $9823DE.l		; 2F DE 23 98
	tsb $64B0.w		; 0C B0 64
	jsl $ADFB20.l		; 22 20 FB AD
	ora $98.b,S		; 03 98
	eor $1D.b,X		; 55 1D
	dec OBJSEL.w		; CE 01 21
	jsr ($2EE2.w,X)		; FC E2 2E
	tay		; A8
	beq  15.b		; F0 0F
	beq  -1.b		; F0 FF
	ora ($1F.b)		; 12 1F
	cmp $A811.w		; CD 11 A8
	asl $31EF.w		; 0E EF 31
	sbc $20F1.w		; ED F1 20
	cpx $94B0.w		; EC B0 94
	cpy #$DC.b		; C0 DC
	dec $DDFF.w		; CE FF DD
	stp		; DB
	ldy $88DC.w		; AC DC 88
	cmp $DDCDCC.l,X		; DF CC CD DD
	cmp $CDDD.w		; CD DD CD
	cmp $9A78.w		; CD 78 9A
	txs		; 9A
	sta $99AA.w,Y		; 99 AA 99
	sta $99AA.w,Y		; 99 AA 99
	sei		; 78
	txs		; 9A
	lda #$A999.w		; A9 99 A9
	lda #$99A9.w		; A9 A9 99
	tax		; AA
	sei		; 78
	sta $A99A.w,Y		; 99 9A A9
	sta $A9A9.w,Y		; 99 A9 A9
	lda #$98A9.w		; A9 A9 98
	sbc $20DFFF.l		; EF FF DF 20
	tsx		; BA
	bne  50.b		; D0 32
	sbc $CB98.w,X		; FD 98 CB
	cmp ($4E.b)		; D2 4E
	lda $E3ED20.l		; AF 20 ED E3
	inc A		; 1A
	tay		; A8
	cmp ($21.b),Y		; D1 21
	ora $05DCF0.l		; 0F F0 DC 05
	asl $A8F1.w		; 0E F1 A8
	ora ($ED.b)		; 12 ED
	and $EB.b,X		; 35 EB
	bcs  84.b		; B0 54
	dec $9812.w,X		; DE 12 98
	rti		; 40

	lda $0032.w		; AD 32 00
	bpl   2.b		; 10 02
	bit $1B.b,X		; 34 1B
	tya		; 98
	lda ($43.b)		; B2 43
	jsr $1100.w		; 20 00 11
	eor $FC.b,S		; 43 FC
	ora $A8.b,X		; 15 A8
	bpl   1.b		; 10 01
	ora ($22.b),Y		; 11 22
	sbc $2024.w		; ED 24 20
	beq -104.b		; F0 98
	eor $01.b,S		; 43 01
	and ($F2.b),Y		; 31 F2
	eor ($F1.b,S),Y		; 53 F1
	jsl $768422.l		; 22 22 84 76
	ror $67.b		; 66 67
	adc [$77.b],Y		; 77 77
	ror $77.b		; 66 77
	adc [$78.b],Y		; 77 78
	ror $77.b		; 66 77
	adc [$77.b]		; 67 77
	adc [$76.b]		; 67 76
	adc [$77.b]		; 67 77
	dey		; 88
	and ($44.b,S),Y		; 33 44
	and ($34.b)		; 32 34
	eor $33.b,S		; 43 33
	mvp $98,$32		; 44 32 98
	ora ($14.b),Y		; 11 14
	eor ($F2.b,X)		; 41 F2
	jsl $0C2311.l		; 22 11 23 0C
	tay		; A8
	ora $21.b,S		; 03 21
	sbc $F3FB36.l,X		; FF 36 FB F3
	and ($EF.b,X)		; 21 EF
	ldy $02.b		; A4 02
	ora $4214DD.l,X		; 1F DD 14 42
	asl $12EF.w		; 0E EF 12
	tya		; 98
	inc $3CE2.w,X		; FE E2 3C
	lda $7F.b		; A5 7F
	lda ($1E.b)		; B2 1E
	cmp $1112B8.l		; CF B8 12 11
	sbc $13D0.w		; ED D0 13
	asl $10F1.w		; 0E F1 10
	tay		; A8
	and ($EB.b)		; 32 EB
	cmp $F000F0.l,X		; DF F0 00 F0
	ora $F1A80F.l		; 0F 0F A8 F1
	and ($0F.b)		; 32 0F
	jmp.w [$F2CD]		; DC CD F2
	bmi -16.b		; 30 F0
	ldy $14.b		; A4 14
	lsr $FEBD.w		; 4E BD FE
	beq  14.b		; F0 0E
	jmp.w [$98DE]		; DC DE 98
	inc $DA23.w		; EE 23 DA
	lda $ED22.w		; AD 22 ED
	sbc ($35.b),Y		; F1 35
	clv		; B8
	asl $11BE.w,X		; 1E BE 11
	bpl -16.b		; 10 F0
	brk $FF.b		; 00 FF
	beq -88.b		; F0 A8
	jsl $21CF0B.l		; 22 0B CF 21
	jsr ($0C13.w,X)		; FC 13 0C
	beq -88.b		; F0 A8
	jsl $21E1D9.l		; 22 D9 E1 21
	ora $0D12F0.l		; 0F F0 12 0D
	clv		; B8
	bne  48.b		; D0 30
	dec $1012.w		; CE 12 10
	sbc ($3E.b)		; F2 3E
	lda $11B8.w,X		; BD B8 11
	jsl $E3EC10.l		; 22 10 EC E3
	jsr $1201.w		; 20 01 12
	clv		; B8
	jsr ($24CE.w,X)		; FC CE 24
	jsr $FF10.w		; 20 10 FF
	ora $31A800.l		; 0F 00 A8 31
	ora ($3F.b),Y		; 11 3F
	tyx		; BB
.ACCU 8
	sep #$63		; E2 63
	sbc ($33.b),Y		; F1 33
	tay		; A8
	ora $2EC2.w		; 0D C2 2E
	cmp ($33.b)		; D2 33
	jsl $A8E6FA.l		; 22 FA E6 A8
	eor $FB13FF.l		; 4F FF 13 FB
	sbc ($65.b,S),Y		; F3 65
	asl $A8EF.w,X		; 1E EF A8
	ora ($EF.b),Y		; 11 EF
	and ($F0.b)		; 32 F0
	and ($F1.b)		; 32 F1
	and ($EE.b),Y		; 31 EE
	tay		; A8
	ora $5F.b,S		; 03 5F
	cmp ($42.b,X)		; C1 42
	asl $32F2.w		; 0E F2 32
	ora $E2A8.w		; 0D A8 E2
	jsl $11FE33.l		; 22 33 FE 11
	stp		; DB
	trb $42.b		; 14 42
	tay		; A8
	jsl $13CD1E.l		; 22 1E CD 13
	jsr $2201.w		; 20 01 22
	jsr $E0A8.w		; 20 A8 E0
	ora $36C0.w		; 0D C0 36
	rts		; 60

	bne  30.b		; D0 1E
	cmp $DEB4.w,X		; DD B4 DE
	sbc ($33.b),Y		; F1 33
	bpl   1.b		; 10 01
	bpl -20.b		; 10 EC
.ACCU 8
	sep #$A4		; E2 A4
	and $11D0.w,X		; 3D D0 11
	ora $313213.l		; 0F 13 32 31
	sbc $41A8.w		; ED A8 41
	cmp $2001.w,X		; DD 01 20
	ora ($3E.b)		; 12 3E
	dec $B40F.w		; CE 0F B4
	inc $12F0.w		; EE F0 12
	bit $2E.b,X		; 34 2E
	dec $EEFE.w		; CE FE EE
	tay		; A8
	eor $FB.b,S		; 43 FB
	ora ($0E.b)		; 12 0E
	dec $EC54.w		; CE 54 EC
	brk $A8.b		; 00 A8
	asl $33D0.w		; 0E D0 33
	bpl -20.b		; 10 EC
	cmp ($3F.b),Y		; D1 3F
.ACCU 8
.INDEX 8
	sep #$B8		; E2 B8
	ora $31E2.w,X		; 1D E2 31
	sbc $11E1.w		; ED E1 11
	ora $00A8F0.l		; 0F F0 A8 00
	beq   0.b		; F0 00
	ora ($0E.b,X)		; 01 0E
	cmp $ED32.w		; CD 32 ED
	ldy $DE.b		; A4 DE
	sbc $0D34EF.l,X		; FF EF 34 0D
	sbc $B800EF.l		; EF EF 00 B8
	sbc $CE2D03.l,X		; FF 03 2D CE
	cop $2F.b		; 02 2F
	sbc ($1F.b),Y		; F1 1F
	tay		; A8
	cmp $EFFE1F.l,X		; DF 1F FE EF
	eor $FC.b		; 45 FC
	cmp $0DA812.l,X		; DF 12 A8 0D
	lda $01CD64.l		; AF 64 CD 01
	brk $F3.b		; 00 F3
	bit $AAA4.w		; 2C A4 AA
	cpx #$13.b		; E0 13
	and $BC4FC0.l,X		; 3F C0 4F BC
	rol $B8.b		; 26 B8
	ora $01EF.w		; 0D EF 01
	bpl  18.b		; 10 12
	bpl -52.b		; 10 CC
	ora $A8.b,S		; 03 A8
	eor ($EC.b)		; 52 EC
	cpx #$12.b		; E0 12
	bpl -32.b		; 10 E0
	and ($F0.b,X)		; 21 F0
	tay		; A8
	bpl  -1.b		; 10 FF
	beq  31.b		; F0 1F
	pea $ED61.w		; F4 61 ED
	cmp $FF11A8.l,X		; DF A8 11 FF
	bit $32.b		; 24 32
	sbc $F0E0.w,X		; FD E0 F0
	and $98.b,S		; 23 98
	ora $FF2113.l		; 0F 13 21 FF
	and $2077AF.l		; 2F AF 77 20
	tya		; 98
	inc $31F1.w		; EE F1 31
	trb $50.b		; 14 50
	sbc $A8E3FC.l		; EF FC E3 A8
	jsl $EF1F23.l		; 22 23 1F EF
	sbc $0E3501.l,X		; FF 01 35 0E
	ldy $13.b		; A4 13
	jsr $06CB.w		; 20 CB 06
	adc $22.b,S		; 63 22
	jsr $98DC.w		; 20 DC 98
	eor $02.b,S		; 43 02
	lsr $4E.b,X		; 56 4E
	ldy $45F1.w,X		; BC F1 45
	eor ($98.b,X)		; 41 98
	sbc $24F0.w		; ED F0 24
	eor $6317CC.l		; 4F CC 17 63
	xba		; EB
	tay		; A8
	ora ($FE.b,X)		; 01 FE
	lsr $1D.b		; 46 1D
	cmp $520200.l,X		; DF 00 02 52
	ldy $2E.b		; A4 2E
	cpx #$20.b		; E0 20
	plb		; AB
	rol $42.b		; 26 42
	brk $1F.b		; 00 1F
	tay		; A8
	sbc $41.b,S		; E3 41
	sbc $4FE4.w,X		; FD E4 4F
	cpy $33E1.w		; CC E1 33
	tay		; A8
	jsl $CEDB32.l		; 22 32 DB CE
	ora $42.b,S		; 03 42
	asl $A8CE.w		; 0E CE A8
	eor $EF.b		; 45 EF
	and ($CD.b,X)		; 21 CD
	beq  18.b		; F0 12
	ora ($01.b),Y		; 11 01
	clv		; B8
	sbc $1E02E0.l,X		; FF E0 02 1E
	pea $CE3D.w		; F4 3D CE
	cop $A8.b		; 02 A8
	pld		; 2B
	pea $0D40.w		; F4 40 0D
	cpy $FE23.w		; CC 23 FE
	and $B8.b,S		; 23 B8
	ora $22EFFE.l		; 0F FE EF 22
	bpl  30.b		; 10 1E
	ldx $B831.w,Y		; BE 31 B8
	beq  18.b		; F0 12
	asl $03BE.w,X		; 1E BE 03
	ora $B410E1.l,X		; 1F E1 10 B4
	asl $1DE1.w		; 0E E1 1D
	cmp $0F2112.l		; CF 12 21 0F
	sbc $01A8.w		; ED A8 01
	bpl  18.b		; 10 12
	rti		; 40

	lda #$EF.b		; A9 EF
	ora ($20.b,X)		; 01 20
	tay		; A8
	brk $20.b		; 00 20
	phd		; 0B
	lda ($61.b)		; B2 61
	tyx		; BB
.ACCU 16
.INDEX 16
	rep #$33		; C2 33
	ldy $35.b		; A4 35
	rol $EEAC.w,X		; 3E AC EE
	cpx #$FA23.w		; E0 23 FA
	sbc [$B4.b]		; E7 B4
	and $35CF.w		; 2D CF 35
	and $00FFFF.l,X		; 3F FF FF 00
	sbc $2F0398.l,X		; FF 98 03 2F
	lda $5103.w,X		; BD 03 51
	sbc $A81C01.l		; EF 01 1C A8
	sbc ($1F.b,X)		; E1 1F
	sbc $2520F2.l,X		; FF F2 20 25
	tas		; 1B
	cmp $2201A8.l		; CF A8 01 22
	brk $E0.b		; 00 E0
	jsl $2D46CE.l		; 22 CE 46 2D
	ldy $EC.b,X		; B4 EC
	sbc ($21.b)		; F2 21
	jsl $EFED20.l		; 22 20 ED EF
	ora ($B8.b)		; 12 B8
	ora ($0E.b),Y		; 11 0E
	cmp $122102.l,X		; DF 02 21 12
	ora $B8E0.w		; 0D E0 B8
	brk $34.b		; 00 34
	asl $00EF.w,X		; 1E EF 00
	brk $10.b		; 00 10
	ora ($B8.b)		; 12 B8
	bmi -34.b		; 30 DE
	jsr $34DF.w		; 20 DF 34
	rol $40C0.w		; 2E C0 40
	tay		; A8
	cmp ($4E.b),Y		; D1 4E
	sep #$41		; E2 41
	cpx $56E1.w		; EC E1 56
	rol A		; 2A
	tay		; A8
	ldx $2E35.w,Y		; BE 35 2E
	ora $2F.b,S		; 03 2F
	dec $DB55.w		; CE 55 DB
	tay		; A8
	ora ($21.b,X)		; 01 21
	ora ($41.b,X)		; 01 41
	dec $E200.w		; CE 00 E2
	eor ($A8.b),Y		; 51 A8
	bne  65.b		; D0 41
	cpx $52E2.w		; EC E2 52
	plx		; FA
	cpy $63.b		; C4 63
	tya		; 98
	xce		; FB
.INDEX 16
	rep #$1E		; C2 1E
	cmp $46E2.w,X		; DD E2 46
	eor $2E.b,X		; 55 2E
	ldy $0A.b		; A4 0A
	lda $10E1EC.l,X		; BF EC E1 10
	sbc $981112.l		; EF 12 11 98
	sbc $41F4.w		; ED F4 41
	beq -21.b		; F0 EB
	ldx $5215.w		; AE 15 52
	tya		; 98
	ora $AB0B12.l		; 0F 12 0B AB
	sbc ($32.b)		; F2 32
	and ($0E.b)		; 32 0E
	tay		; A8
	inc $44D0.w		; EE D0 44
	cpx $30F1.w		; EC F1 30
	cmp $A800.w,X		; DD 00 A8
	brk $03.b		; 00 03
	eor $01FFAD.l		; 4F AD FF 01
	ora ($20.b)		; 12 20
	tay		; A8
	sbc $00DEFD.l,X		; FF FD DE 00
	bit $31.b		; 24 31
	stp		; DB
	lda $322598.l,X		; BF 98 25 32
	sbc $10F1.w,X		; FD F1 10
	stp		; DB
	dec $A8FF.w		; CE FF A8
	sbc ($61.b,S),Y		; F3 61
	ldx $CF1E.w,Y		; BE 1E CF
	and ($FF.b,X)		; 21 FF
	ora ($A8.b,X)		; 01 A8
	ora $0E11F0.l,X		; 1F F0 11 0E
	inc $F0FE.w		; EE FE F0
	lsr $A8.b		; 46 A8
	phd		; 0B
	sbc $2F.b,S		; E3 2F
	txs		; 9A
	asl $30.b,X		; 16 30
	inc $A8F0.w,X		; FE F0 A8
	and ($EE.b,X)		; 21 EE
	ora ($1E.b)		; 12 1E
	cmp $2111.w		; CD 11 21
	ora $2D02B8.l,X		; 1F B8 02 2D
	cmp $011F21.l		; CF 21 1F 01
	asl $A8E1.w,X		; 1E E1 A8
	and ($EE.b)		; 32 EE
	tsb $1F.b		; 04 1F
	cmp $12DD11.l,X		; DF 11 DD 12
	tay		; A8
	ora ($52.b)		; 12 52
	cpx $32CF.w		; EC CF 32
	cpx #$F121.w		; E0 21 F1
	tay		; A8
	rol $43CF.w		; 2E CF 43
	asl $14EE.w,X		; 1E EE 14
	rol $A8DF.w,X		; 3E DF A8
	bit $0A.b		; 24 0A
	cmp ($42.b,S),Y		; D3 42
	ora $EF0F00.l		; 0F 00 0F EF
	tay		; A8
	and $31.b,S		; 23 31
	cpy $1E24.w		; CC 24 1E
	cpy #$0D54.w		; C0 54 0D
	tay		; A8
	cmp ($3F.b),Y		; D1 3F
	bne  32.b		; D0 20
	ora ($24.b,X)		; 01 24
	and $98BF.w		; 2D BF 98
	bit $2F.b		; 24 2F
	sbc ($33.b),Y		; F1 33
	sbc $EB25.w,X		; FD 25 EB
	cmp ($A8.b),Y		; D1 A8
	and $31.b,S		; 23 31
	wai		; CB
	sbc ($23.b,X)		; E1 23
	eor $FE.b,S		; 43 FE
	ora ($A8.b,X)		; 01 A8
	jsr ($43C0.w,X)		; FC C0 43
	jsr $1100.w		; 20 00 11
	ora $A8D0.w		; 0D D0 A8
	bit $2F.b		; 24 2F
	bne   1.b		; D0 01
	ora ($0E.b)		; 12 0E
	sbc ($0F.b),Y		; F1 0F
	tya		; 98
	sbc ($67.b,X)		; E1 67
	and $25B0B9.l,X		; 3F B9 B0 25
	eor ($F0.b,S),Y		; 53 F0
	tay		; A8
	ora ($ED.b),Y		; 11 ED
	sbc ($33.b,X)		; E1 33
	and ($FD.b,X)		; 21 FD
	cmp $16A810.l		; CF 10 A8 16
	jmp $22C1.w		; 4C C1 22
	tsb $10D1.w		; 0C D1 10
	bit $A8.b,X		; 34 A8
	trb $22DE.w		; 1C DE 22
	ora $1023EF.l,X		; 1F EF 23 10
	ora $E0EDA8.l		; 0F A8 ED E0
	and ($3E.b,S),Y		; 33 3E
	dec $0F31.w		; CE 31 0F
	sbc $1F01B8.l,X		; FF B8 01 1F
	beq  33.b		; F0 21
	jsr ($10F2.w,X)		; FC F2 10
	sbc $3104A8.l,X		; FF A8 04 31
	jsr ($02CD.w,X)		; FC CD 02
	and ($21.b,X)		; 21 21
	sbc $FFA8.w,X		; FD A8 FF
	cmp $0FF033.l,X		; DF 33 F0 0F
	cmp $51F3.w		; CD F3 51
	tya		; 98
	ldx $BE1D.w,Y		; BE 1D BE
	ora $74E4EB.l		; 0F EB E4 74
	and ($A8.b),Y		; 31 A8
	cpx $F1CE.w		; EC CE F1
	ora ($FE.b)		; 12 FE
	sbc ($31.b,S),Y		; F3 31
	cpy $E298.w		; CC 98 E2
	brk $01.b		; 00 01
	ora $D2DCEE.l		; 0F EE DC D2
	adc $98.b		; 65 98
	ora $0FAF.w,X		; 1D AF 0F
	cpy $7EE6.w		; CC E6 7E
	cmp $FCA400.l		; CF 00 A4 FC
	cmp ($51.b,S),Y		; D3 51
	inc $FEFF.w		; EE FF FE
	sbc ($10.b),Y		; F1 10
	ldy $12.b		; A4 12
	asl $10F1.w		; 0E F1 10
	ora $1023DE.l		; 0F DE 23 10
	tya		; 98
	ora ($10.b),Y		; 11 10
	sbc $34D0.w		; ED D0 34
	rti		; 40

	inc $A8F1.w		; EE F1 A8
	ora $2F23E0.l		; 0F E0 23 2F
	brk $FC.b		; 00 FC
	beq  16.b		; F0 10
	tay		; A8
	and ($41.b,S),Y		; 33 41
	stp		; DB
	ora ($F0.b,X)		; 01 F0
	and ($FE.b)		; 32 FE
	bne -88.b		; D0 A8
	bit $20.b,X		; 34 20
	sbc $CE1E12.l		; EF 12 1E CE
	trb $40.b		; 14 40
	tay		; A8
	ora ($2F.b,X)		; 01 2F
	sbc $3105ED.l,X		; FF ED 05 31
	ora $0C9802.l		; 0F 02 98 0C
	sep #$45		; E2 45
	ora $46BD.w,X		; 1D BD 46
	and ($30.b)		; 32 30
	ldy $0E.b		; A4 0E
	sbc ($21.b),Y		; F1 21
	inc $4113.w		; EE 13 41
	dec $9431.w,X		; DE 31 94
	plb		; AB
	rol $74.b,X		; 36 74
	and $42.b,S		; 23 42
	ora ($1E.b)		; 12 1E
	cpx #$1E98.w		; E0 98 1E
	ora ($2F.b,S),Y		; 13 2F
	cpx #$FC56.w		; E0 56 FC
	lda $0FA856.l,X		; BF 56 A8 0F
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	ora $A441E2.l,X		; 1F E2 41 A4
	jsl $E0DD1F.l		; 22 1F DD E0
	ora ($22.b),Y		; 11 22
	and $4D.b,X		; 35 4D
	tay		; A8
	pei ($3F.b)		; D4 3F
	ora ($0F.b,X)		; 01 0F
	beq  35.b		; F0 23
	sbc $A803.w,X		; FD 03 A8
	and $2102CC.l		; 2F CC 02 21
	and ($F0.b),Y		; 31 F0
	and $E1A8CC.l		; 2F CC A8 E1
	and ($F2.b),Y		; 31 F2
	and ($FE.b)		; 32 FE
	dec $10F1.w,X		; DE F1 10
	tya		; 98
	cop $31.b		; 02 31
	nop		; EA
	sbc ($2D.b,S),Y		; F3 2D
	cmp $1012.w		; CD 12 10
	tya		; 98
	ora ($43.b,X)		; 01 43
	xba		; EB
	cpy $34DF.w		; CC DF 34
	lsr $A89F.w,X		; 5E 9F A8
	eor ($DD.b,X)		; 41 DD
	sbc $E12F13.l		; EF 13 2F E1
	ora $CDA4DE.l,X		; 1F DE A4 CD
	cpx #$0F21.w		; E0 21 0F
	ora ($1D.b)		; 12 1D
	cmp $3698EC.l,X		; DF EC 98 36
	and $45AC.w		; 2D AC 45
	jsr ($20DF.w,X)		; FC DF 20
	dec $2398.w,X		; DE 98 23
	rol $10BD.w		; 2E BD 10
	cpx #$1033.w		; E0 33 10
	jsr ($BE98.w,X)		; FC 98 BE
	inc $5316.w		; EE 16 53
	xce		; FB
	cmp ($EC.b),Y		; D1 EC
	bne -104.b		; D0 98
	ora ($22.b,S),Y		; 13 22
	and ($CA.b)		; 32 CA
	cmp $4E57D0.l,X		; DF D0 57 4E
	sty $FB.b,X		; 94 FB
	rol $0C.b		; 26 0C
	bne  33.b		; D0 21
	dec $DB11.w,X		; DE 11 DB
	tya		; 98
	asl $4F.b		; 06 4F
	bne   0.b		; D0 00
	ora $5025ED.l		; 0F ED 25 50
	sty $2B.b,X		; 94 2B
	ldx $0F11.w		; AE 11 0F
	trb $42.b		; 14 42
	inc $9403.w,X		; FE 03 94
	jsr $56E0.w		; 20 E0 56
	xce		; FB
	cmp ($53.b,X)		; C1 53
	lda $A8E3.w,Y		; B9 E3 A8
	bpl   0.b		; 10 00
	beq  15.b		; F0 0F
	beq   1.b		; F0 01
	bit $1D.b,X		; 34 1D
	tay		; A8
	cmp $1E13.w		; CD 13 1E
	cop $32.b		; 02 32
	inc $11E0.w,X		; FE E0 11
	tay		; A8
	sbc $E02F11.l,X		; FF 11 2F E0
	eor ($DE.b),Y		; 51 DE
	bpl  15.b		; 10 0F
	tay		; A8
	ora $4F.b,S		; 03 4F
	lda $2E0311.l,X		; BF 11 03 2E
	cmp ($20.b),Y		; D1 20
	ldy $0E.b		; A4 0E
	sbc ($4F.b,S),Y		; F3 4F
	cmp $3102.w		; CD 02 31
	ora $109800.l		; 0F 00 98 10
	jsr $F2FE.w		; 20 FE F2
	.db $42, $FF		; 42 FF
	ora $88CE.w,X		; 1D CE 88
	ror $50.b,X		; 76 50
	beq  17.b		; F0 11
	ora ($1E.b)		; 12 1E
	tyx		; BB
	cmp ($98.b),Y		; D1 98
	and $41.b,X		; 35 41
	stp		; DB
	cpy #$0023.w		; C0 23 00
	lsr $FA.b		; 46 FA
	tya		; 98
	dec $23F1.w		; CE F1 23
	eor ($CC.b,S),Y		; 53 CC
	ora ($E0.b,X)		; 01 E0
	bit $98.b		; 24 98
	rol $F4AB.w		; 2E AB F4
	stz $0F.b,X		; 74 0F
	jmp.w [$35D0]		; DC D0 35
	tya		; 98
	and $2DD4.w		; 2D D4 2D
	lda $361102.l,X		; BF 02 11 36
	ora #$AD98.w		; 09 98 AD
	ora ($42.b,S),Y		; 13 42
	bpl  15.b		; 10 0F
	sbc $41F1.w		; ED F1 41
	tay		; A8
	sbc $52E1.w,X		; FD E1 52
	inc $10E0.w,X		; FE E0 10
	cpx #$A414.w		; E0 14 A4
	eor ($CC.b),Y		; 51 CC
	sbc $320200.l		; EF 00 02 32
	jsr ($98BE.w,X)		; FC BE 98
	rti		; 40

	brk $00.b		; 00 00
	sbc $EB23.w		; ED 23 EB
	sbc ($21.b),Y		; F1 21
	dey		; 88
	ora $4FE2DC.l,X		; 1F DC E2 4F
	stz $E252.w,X		; 9E 52 E2
	eor $CB98.w		; 4D 98 CB
	cmp ($42.b)		; D2 42
	ora ($12.b,X)		; 01 12
	jsr ($E0CD.w,X)		; FC CD E0
	tya		; 98
	and ($FC.b,S),Y		; 33 FC
	sbc ($45.b,X)		; E1 45
	asl $D0DD.w,X		; 1E DD D0
	ora $72D188.l		; 0F 88 D1 72
	stz $E044.w		; 9C 44 E0
	bpl -18.b		; 10 EE
	sbc $010FA8.l,X		; FF A8 0F 01
	ora $4FE2.w,X		; 1D E2 4F
	sbc $980000.l		; EF 00 00 98
	asl $1A.b,X		; 16 1A
	cmp ($42.b,X)		; C1 42
	xba		; EB
	sbc ($FF.b),Y		; F1 FF
	bit $98.b		; 24 98
	adc ($A9.b,X)		; 61 A9
	jsl $2F55DE.l		; 22 DE 55 2F
	xba		; EB
	cmp ($98.b,X)		; C1 98
	adc ($CF.b,X)		; 61 CF
	bit $1C.b,X		; 34 1C
	cmp $5E.b		; C5 5E
	ldx $98FF.w		; AE FF 98
	rol $50.b		; 26 50
	beq  -4.b		; F0 FC
	sbc ($0D.b)		; F2 0D
	and $3E.b		; 25 3E
	tay		; A8
	sbc $66D000.l		; EF 00 D0 66
	asl $00EE.w		; 0E EE 00
	inc $E1A8.w,X		; FE A8 E1
	eor $F0.b,S		; 43 F0
	ora ($1C.b,S),Y		; 13 1C
	ldy #$0042.w		; A0 42 00
	tya		; 98
	and ($0C.b,S),Y		; 33 0C
	sbc $002011.l		; EF 11 20 00
	brk $13.b		; 00 13
	tya		; 98
	sbc $4115.w,X		; FD 15 41
	stp		; DB
	sbc ($31.b,X)		; E1 31
	cmp $FC8853.l,X		; DF 53 88 FC
	cop $60.b		; 02 60
	cmp $5F14.w		; CD 14 5F
	cmp ($2A.b),Y		; D1 2A
	tya		; 98
	sep #$42		; E2 42
	and $0A.b,S		; 23 0A
	ldy #$2123.w		; A0 23 21
	beq -104.b		; F0 98
	and $21.b,S		; 23 21
	jmp.w [$23D0]		; DC D0 23
	jsr $F0FE.w		; 20 FE F0
	tay		; A8
	ora ($10.b),Y		; 11 10
	beq  34.b		; F0 22
	ora $23BF.w		; 0D BF 23
	bpl -104.b		; 10 98
	ora $20.b,S		; 03 20
	cpx $1DD2.w		; EC D2 1D
	sep #$43		; E2 43
	ora $EC11A8.l,X		; 1F A8 11 EC
	cpx #$0D34.w		; E0 34 0D
	sbc ($1F.b),Y		; F1 1F
	inc $3498.w		; EE 98 34
	and ($10.b),Y		; 31 10
	asl $F1BC.w		; 0E BC F1
	bmi -32.b		; 30 E0
	sty $13.b,X		; 94 13
	jsr $2001.w		; 20 01 20
	inc $0C01.w		; EE 01 0C
	bcs -120.b		; B0 88
	jmp ($EDB0.w,X)		; 7C B0 ED
	sbc ($11.b),Y		; F1 11
	jmp.w [$22F3]		; DC F3 22
	sty $21.b,X		; 94 21
	cpx $DCEF.w		; EC EF DC
	tsb $63.b		; 04 63
	jmp.w [$A813]		; DC 13 A8
	sbc $52D1.w,X		; FD D1 52
	inc $F2EE.w,X		; FE EE F2
	jsr $98FF.w		; 20 FF 98
	ora $1C.b,S		; 03 1C
	cmp ($1F.b),Y		; D1 1F
	inc $4113.w		; EE 13 41
	dex		; CA
	tya		; 98
	cop $FD.b		; 02 FD
	and $3F.b,S		; 23 3F
	wai		; CB
	sbc ($50.b)		; F2 50
	lda $FB6398.l,X		; BF 98 63 FB
	lda $00EF52.l		; AF 52 EF 00
	ora ($20.b),Y		; 11 20
	tya		; 98
	jsr ($36DD.w,X)		; FC DD 36
	and #$2B07.w		; 29 07 2B
	lda $9837.w,X		; BD 37 98
	and $00DF.w		; 2D DF 00
	dec $5324.w,X		; DE 24 53
	sbc $98FF.w		; ED FF 98
	cpx #$FF21.w		; E0 21 FF
	sbc ($21.b),Y		; F1 21
	sbc $A85E15.l,X		; FF 15 5E A8
	jmp.w [$40F3]		; DC F3 40
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	ora $430198.l		; 0F 98 01 43
	asl $EFEF.w,X		; 1E EF EF
	bit $2F.b,X		; 34 2F
	inc $01A4.w		; EE A4 01
	ora ($11.b),Y		; 11 11
	bpl  -2.b		; 10 FE
	sbc ($30.b),Y		; F1 30
	dec $5794.w		; CE 94 57
	eor ($1E.b,S),Y		; 53 1E
	cmp $42F2.w,X		; DD F2 42
	trb $4F.b		; 14 4F
	dey		; 88
	lda $65.b,S		; A3 65
	rol $2F01.w		; 2E 01 2F
	sbc $5F34.w		; ED 34 5F
	tya		; 98
	cmp $5025.w		; CD 25 50
	lda $24AE50.l		; AF 50 AE 24
	bmi -104.b		; 30 98
	cmp $C12D24.l,X		; DF 24 2D C1
	ora $33E3.w		; 0D E3 33
	ora $F698.w		; 0D 98 F6
	rol $E1BD.w		; 2E BD E1
	eor $0C.b		; 45 0C
	cop $FD.b		; 02 FD
	sty $EF.b,X		; 94 EF
	ora ($0D.b),Y		; 11 0D
	dec $1F34.w		; CE 34 1F
	ora ($1E.b,X)		; 01 1E
	tya		; 98
	cmp ($50.b)		; D2 50
	cmp $F5FC10.l,X		; DF 10 FC F5
	ror $88CC.w		; 6E CC 88
	asl $4D.b		; 06 4D
	dec $FD04.w		; CE 04 FD
	cmp ($45.b),Y		; D1 45
	phx		; DA
	tya		; 98
	ora ($20.b,X)		; 01 20
	wai		; CB
	cop $21.b		; 02 21
	sbc $981D33.l,X		; FF 33 1D 98
	ldy $3FF2.w,X		; BC F2 3F
	sbc $4F.b,S		; E3 4F
	dec $01F1.w		; CE F1 01
	sty $0F.b,X		; 94 0F
	sbc ($20.b,X)		; E1 20
	sbc $02DE.w		; ED DE 02
	eor $2D.b		; 45 2D
	tya		; 98
	bne  35.b		; D0 23
	jsr $2FF0.w		; 20 F0 2F
	ldy $1E33.w		; AC 33 1E
	sty $CC.b,X		; 94 CC
	ora ($10.b,S),Y		; 13 10
	bpl -16.b		; 10 F0
	and ($02.b,X)		; 21 02
	and ($88.b),Y		; 31 88
	sta $1D04.w,X		; 9D 04 1D
	sbc $3F.b,X		; F5 3F
	sbc $98E914.l		; EF 14 E9 98
	cpy #$DC34.w		; C0 34 DC
	eor [$DB.b]		; 47 DB
	sbc ($0F.b),Y		; F1 0F
	cmp ($A8.b),Y		; D1 A8
	and ($EE.b)		; 32 EE
	sbc ($10.b),Y		; F1 10
	sbc $0E32E0.l,X		; FF E0 32 0E
	tya		; 98
	sbc ($3E.b),Y		; F1 3E
	sbc $3002.w		; ED 02 30
	sbc $94ED01.l,X		; FF 01 ED 94
	cmp ($43.b)		; D2 43
	asl $13DE.w,X		; 1E DE 13
	bmi -36.b		; 30 DC
	cop $94.b		; 02 94
	jsr ($43F2.w,X)		; FC F2 43
	asl $42F1.w,X		; 1E F1 42
	jmp.w [$98F0]		; DC F0 98
	sbc ($34.b,X)		; E1 34
	tas		; 1B
	ldy #$0032.w		; A0 32 00
	beq  18.b		; F0 12
	dey		; 88
	asl $DDEF.w,X		; 1E EF DD
	pea $1144.w		; F4 44 11
	and ($DA.b)		; 32 DA
	tya		; 98
	dec $1012.w,X		; DE 12 10
	ora ($42.b,X)		; 01 42
	inc $D20F.w		; EE 0F D2
	tya		; 98
	eor ($E0.b,X)		; 41 E0
	ora ($FC.b,X)		; 01 FC
	cmp ($43.b,S),Y		; D3 43
	ora $3094F2.l,X		; 1F F2 94 30
	cmp $43F2.w,X		; DD F2 43
	jsr $F3EC.w		; 20 EC F3
	rol $0288.w		; 2E 88 02
	sbc $FC4246.l		; EF 46 42 FC
	ldx $D032.w		; AE 32 D0
	tya		; 98
	and $2E.b,S		; 23 2E
	cmp ($3D.b,X)		; C1 3D
	lda ($61.b,S),Y		; B3 61
	bne  18.b		; D0 12
	tya		; 98
	asl $1FE2.w		; 0E E2 1F
	cmp $FF2015.l,X		; DF 15 20 FF
	beq -104.b		; F0 98
	ora $0E34EF.l		; 0F EF 34 0E
	ora ($00.b,X)		; 01 00
	ora $3498CF.l,X		; 1F CF 98 34
	rol $4EC1.w		; 2E C1 4E
	ldy #$F041.w		; A0 41 F0
	ora ($98.b),Y		; 11 98
	ora $D31B03.l,X		; 1F 03 1B D3
	rol $00F1.w		; 2E F1 00
	inc $B584.w		; EE 84 B5
	lsr $66F3.w,X		; 5E F3 66
	stz $31.b		; 64 31
	sbc $84A9.w,X		; FD A9 84
	dec $44DF.w		; CE DF 44
	asl $33DF.w,X		; 1E DF 33
	brk $22.b		; 00 22
	dey		; 88
	cpx $4FF4.w		; EC F4 4F
	sbc $1EE0.w		; ED E0 1E
	rol $3D.b		; 26 3D
	dey		; 88
	sbc $36CC0F.l		; EF 0F CC 36
	asl $FDFF.w,X		; 1E FF FD
	cpy #$5498.w		; C0 98 54
	tsb $11BE.w		; 0C BE 11
	cop $30.b		; 02 30
	beq  14.b		; F0 0E
	dey		; 88
	cmp $31D1.w,X		; DD D1 31
	brk $01.b		; 00 01
	asl $FBF2.w		; 0E F2 FB
	tya		; 98
	cpx #$0D33.w		; E0 33 0D
	cop $FC.b		; 02 FC
	cpx #$2100.w		; E0 00 21
	tya		; 98
	brk $00.b		; 00 00
	sbc $32F0FF.l,X		; FF FF F0 32
	trb $94C0.w		; 1C C0 94
	bpl -53.b		; 10 CB
	bne  33.b		; D0 21
	sbc $230100.l,X		; FF 00 01 23
	tya		; 98
	ora $44E3CB.l		; 0F CB E3 44
	ora $01EF.w		; 0D EF 01
	bpl -104.b		; 10 98
	inc $22E0.w,X		; FE E0 22
	ora $CF1FF0.l		; 0F F0 1F CF
	and ($88.b)		; 32 88
	inc $10F1.w		; EE F1 10
	beq   1.b		; F0 01
	asl A		; 0A
	lda ($62.b,S),Y		; B3 62
	sty $44.b		; 84 44
	trb $32B0.w		; 1C B0 32
	nop		; EA
	cpy $3C.b		; C4 3C
	dec $88.b,X		; D6 88
	rol $F1BC.w,X		; 3E BC F1
	sbc ($54.b),Y		; F1 54
	asl $02BC.w,X		; 1E BC 02
	dey		; 88
	jsr $42F2.w		; 20 F2 42
	beq  -1.b		; F0 FF
	sbc $51F5.w		; ED F5 51
	tya		; 98
	inc $32F2.w,X		; FE F2 32
	jsr ($21D2.w,X)		; FC D2 21
	ora ($22.b,X)		; 01 22
	tya		; 98
	cpx $2F13.w		; EC 13 2F
	cmp $1E34.w,X		; DD 34 1E
	cpx #$9833.w		; E0 33 98
	asl $42C1.w		; 0E C1 42
	sbc $CD40F2.l,X		; FF F2 40 CD
	ora $98.b,S		; 03 98
	rol $3DF5.w,X		; 3E F5 3D
	cmp ($10.b),Y		; D1 10
	brk $10.b		; 00 10
	ora ($88.b)		; 12 88
	rol $34DE.w,X		; 3E DE 34
	jsr ($FE12.w,X)		; FC 12 FE
	ora ($44.b,S),Y		; 13 44
	dey		; 88
	bmi -35.b		; 30 DD
	sbc $EF4103.l		; EF 03 41 EF
	cop $30.b		; 02 30
	dey		; 88
	sbc $E41D13.l		; EF 13 1D E4
	and $F02E03.l,X		; 3F 03 2E F0
	dey		; 88
	xba		; EB
	sbc ($46.b,X)		; E1 46
	and $E1EB11.l,X		; 3F 11 EB E1
	stz $94.b		; 64 94
	and $3104BB.l		; 2F BB 04 31
	asl $D0CC.w		; 0E CC D0
	bit $88.b,X		; 34 88
	dec $01EF.w,X		; DE EF 01
	inc $19F4.w,X		; FE F4 19
	lda ($76.b,S),Y		; B3 76
	tya		; 98
	ora $00EF.w,X		; 1D EF 00
	sbc $1F25.w		; ED 25 1F
	sbc $88F1.w		; ED F1 88
	eor $1E.b,S		; 43 1E
	cmp $01DE.w,X		; DD DE 01
	ora ($10.b),Y		; 11 10
	asl $DE84.w		; 0E 84 DE
	and ($DD.b,X)		; 21 DD
	inc $01DE.w,X		; FE DE 01
	bit $3E.b,X		; 34 3E
	tya		; 98
	cpx #$F00F.w		; E0 0F F0
	and $0B.b,X		; 35 0B
	cmp $9801F1.l		; CF F1 01 98
	and $FD.b,S		; 23 FD
	cmp $F3DD21.l,X		; DF 21 DD F3
	.db $42, $CD		; 42 CD
	dey		; 88
	cmp ($40.b)		; D2 40
	cmp ($4D.b,X)		; C1 4D
	lda $B6FA22.l		; AF 22 FA B6
	dey		; 88
	adc $2DD4.w		; 6D D4 2D
	dec $13EF.w		; CE EF 13
	bpl  16.b		; 10 10
	dey		; 88
	tsx		; BA
	sbc ($45.b,X)		; E1 45
	ora $0DEFFF.l,X		; 1F FF EF 0D
	ldy #$0684.w		; A0 84 06
	.db $42, $22		; 42 22
	asl $FFCD.w,X		; 1E CD FF
	sbc ($33.b,X)		; E1 33
	tya		; 98
	beq  15.b		; F0 0F
	beq   0.b		; F0 00
	bit $0C.b		; 24 0C
	bne   0.b		; D0 00
	dey		; 88
	cop $45.b		; 02 45
	asl $24BE.w		; 0E BE 24
	sbc $53E1.w		; ED E1 53
	dey		; 88
	cmp $EFBB73.l		; CF 73 BB EF
	trb $51.b		; 14 51
	sbc $88E2.w		; ED E2 88
	and $5E27DF.l,X		; 3F DF 27 5E
	bcs  -2.b		; B0 FE
	sbc ($35.b,X)		; E1 35
	dey		; 88
	rol $00EF.w		; 2E EF 00
	beq  53.b		; F0 35
	rti		; 40

	txy		; 9B
	eor $98.b		; 45 98
	ora $FC3100.l		; 0F 00 31 FC
	cpx #$1F44.w		; E0 44 1F
	sbc ($98.b,X)		; E1 98
	asl $42C1.w,X		; 1E C1 42
	beq   0.b		; F0 00
	brk $01.b		; 00 01
	ora $110388.l		; 0F 88 03 11
	brk $DE.b		; 00 DE
	sbc ($44.b)		; F2 44
	sbc $8834.w		; ED 34 88
	inc $CD20.w,X		; FE 20 CD
	ora ($22.b,S),Y		; 13 22
	beq   1.b		; F0 01
	brk $88.b		; 00 88
	inc $5E03.w,X		; FE 03 5E
	cpy #$0041.w		; C0 41 00
	sbc $0398EC.l,X		; FF EC 98 03
	and $0100EF.l,X		; 3F EF 00 01
	jsl $94FF0E.l		; 22 0E FF 94
	sbc $F0DE.w		; ED DE F0
	cop $44.b		; 02 44
	jsr ($21E1.w,X)		; FC E1 21
	dey		; 88
	dec $2E23.w		; CE 23 2E
	dec $3C03.w,X		; DE 03 3C
	cmp $52.b,S		; C3 52
	dey		; 88
	jsr ($0AE3.w,X)		; FC E3 0A
	cmp ($21.b)		; D2 21
	and ($1F.b,X)		; 21 1F
	sbc $2388.w		; ED 88 23
	asl $DEFF.w,X		; 1E FF DE
	ora ($C0.b),Y		; 11 C0
	ror $FC.b,X		; 76 FC
	dey		; 88
	cmp $33C11F.l		; CF 1F C1 33
	asl $11D0.w		; 0E D0 11
	brk $78.b		; 00 78
	stp		; DB
	inc $6F.b		; E6 6F
	cpy $05CD.w		; CC CD 05
	adc $D9.b		; 65 D9
	dey		; 88
	sbc ($DC.b)		; F2 DC
	ora $31.b,S		; 03 31
	inc $0F00.w,X		; FE 00 0F
	sbc $2F2288.l		; EF 88 22 2F
	cmp $14CE20.l		; CF 20 CE 14
	eor ($ED.b,X)		; 41 ED
	dey		; 88
	cmp $0D1101.l,X		; DF 01 11 0D
	ora $3B.b		; 05 3B
	lda $1E8825.l,X		; BF 25 88 1E
	lda $3105.w,X		; BD 05 31
	cmp $00F1.w,X		; DD F1 00
	ora ($88.b)		; 12 88
	bmi -53.b		; 30 CB
	sbc ($41.b,X)		; E1 41
	sbc $14ED30.l		; EF 30 ED 14
	dey		; 88
	eor $2EBF.w,X		; 5D BF 2E
	dec $3F14.w,X		; DE 14 3F
	cop $1E.b		; 02 1E
	sei		; 78
	cpy $01EF.w		; CC EF 01
	and ($EC.b)		; 32 EC
	bit $FB.b		; 24 FB
	ora ($88.b)		; 12 88
	brk $1F.b		; 00 1F
	sbc $DE1E21.l		; EF 21 1E DE
	and $5D.b		; 25 5D
	tya		; 98
	cmp $14FF20.l		; CF 20 FF 14
	and $00CF.w,X		; 3D CF 00
	ora ($78.b),Y		; 11 78
	and ($0D.b)		; 32 0D
	ora ($EA.b,S),Y		; 13 EA
	cmp $441024.l		; CF 24 10 44
	dey		; 88
	inc $DC10.w,X		; FE 10 DC
	cop $31.b		; 02 31
	brk $12.b		; 00 12
	eor $F29B88.l		; 4F 88 9B F2
	and $33.b,S		; 23 33
	inc A		; 1A
	lda ($50.b),Y		; B1 50
	inc $B174.w,X		; FE 74 B1
	eor ($04.b)		; 52 04
	eor ($22.b,S),Y		; 53 22
	and ($23.b,X)		; 21 23
	and ($78.b,S),Y		; 33 78
	and ($BB.b,X)		; 21 BB
	sbc ($44.b,S),Y		; F3 44
	bmi -34.b		; 30 DE
	and ($EE.b)		; 32 EE
	tya		; 98
	ora ($10.b,X)		; 01 10
	sbc $CF3E03.l,X		; FF 03 3E CF
	jsl $F1981F.l		; 22 1F 98 F1
	bpl -17.b		; 10 EF
	ora ($1F.b,S),Y		; 13 1F
	ora ($00.b,X)		; 01 00
	inc $0388.w,X		; FE 88 03
	asl $3F35.w		; 0E 35 3F
	dec $EF11.w		; CE 11 EF
	jsl $011088.l		; 22 88 10 01
	jsr $02EF.w		; 20 EF 02
	jsr $F3CD.w		; 20 CD F3
	tya		; 98
	and ($1F.b,X)		; 21 1F
	ora ($1D.b,X)		; 01 1D
	sbc ($21.b),Y		; F1 21
	sbc $88E1.w,X		; FD E1 88
	ror $1D.b		; 66 1D
	cmp $1103.w		; CD 03 11
	and ($FD.b)		; 32 FD
	cmp $E288.w,X		; DD 88 E2
	adc $DE.b,S		; 63 DE
	cop $3E.b		; 02 3E
	sta $880052.l,X		; 9F 52 00 88
	bpl  15.b		; 10 0F
	cpx $3FE3.w		; EC E3 3F
	sbc ($20.b,S),Y		; F3 20
	sbc $FC0198.l,X		; FF 98 01 FC
	sbc ($32.b,X)		; E1 32
	inc $0E24.w		; EE 24 0E
	dec $CF84.w,X		; DE 84 CF
	inc $56DF.w,X		; FE DF 56
	jsr ($DB01.w,X)		; FC 01 DB
	lda $4078.w,X		; BD 78 40
	cpy $70.b		; C4 70
	ldy $CCDC.w		; AC DC CC
	asl $51.b		; 06 51
	dey		; 88
	sbc $ED10F0.l,X		; FF F0 10 ED
	ora ($0C.b,S),Y		; 13 0C
	dec $8812.w,X		; DE 12 88
	rti		; 40

	jmp.w [$0D12]		; DC 12 0D
.ACCU 16
	rep #$64		; C2 64
	stp		; DB
	stz $3488.w,X		; 9E 88 34
	and $CF2ED1.l		; 2F D1 2E CF
	cop $20.b		; 02 20
	beq -120.b		; F0 88
	cpx $2DF5.w		; EC F5 2D
	cmp $FF1F13.l		; CF 13 1F FF
	sbc $FD3388.l		; EF 88 33 FD
	sbc $33F1FF.l,X		; FF FF F1 33
	asl $88BF.w,X		; 1E BF 88
	bmi -49.b		; 30 CF
	jsl $D00E12.l		; 22 12 0E D0
	bpl  -1.b		; 10 FF
	sei		; 78
	ora $30.b,S		; 03 30
	cop $1E.b		; 02 1E
	cmp $0E01.w,X		; DD 01 0E
	ora ($84.b,S),Y		; 13 84
	bit $54.b		; 24 54
	jsr $DEFE.w		; 20 FE DE
	bit $FC.b,X		; 34 FC
	ora $88.b,X		; 15 88
	tsb $55BF.w		; 0C BF 55
	bmi -36.b		; 30 DC
	sep #$42		; E2 42
	beq -120.b		; F0 88
	brk $EE.b		; 00 EE
	asl $5F.b		; 06 5F
	cmp $011F11.l,X		; DF 11 1F 01
	dey		; 88
	asl $3302.w		; 0E 02 33
	and $F2FFEE.l		; 2F EE FF F2
	stz $88.b,X		; 74 88
	sbc $20F0.w,X		; FD F0 20
	inc $64F3.w		; EE F3 64
	asl $88E0.w		; 0E E0 88
	asl $31E2.w		; 0E E2 31
	ora ($1C.b,S),Y		; 13 1C
	cpx $40.b		; E4 40
	sbc $F384.w		; ED 84 F3
	inc A		; 1A
	lda ($41.b)		; B2 41
	ora ($32.b)		; 12 32
	and ($FD.b,X)		; 21 FD
	dey		; 88
	ora ($12.b),Y		; 11 12
	and ($20.b,X)		; 21 20
	jmp.w [$51E2]		; DC E2 51
	sbc $150F88.l		; EF 88 0F 15
	eor $FDF0DF.l		; 4F DF F0 FD
	ora $4E.b		; 05 4E
	dey		; 88
	dec $0C24.w,X		; DE 24 0C
	sbc ($21.b,S),Y		; F3 21
	inc $FD01.w,X		; FE 01 FD
	sei		; 78
	cpy #$2067.w		; C0 67 20
	ora $00DEDC.l,X		; 1F DC DE 00
	ora $88.b,X		; 15 88
	bmi -36.b		; 30 DC
	cmp ($50.b,S),Y		; D3 50
	bne  31.b		; D0 1F
	sbc $F384F0.l		; EF F0 84 F3
	and $4FF4CC.l,X		; 3F CC F4 4F
	cmp $88ED0F.l,X		; DF 0F ED 88
	brk $11.b		; 00 11
	brk $2F.b		; 00 2F
	tax		; AA
	ora ($51.b,S),Y		; 13 51
	sbc $EC2088.l		; EF 88 20 EC
	lda $FD2223.l,X		; BF 23 22 FD
	bne  31.b		; D0 1F
	dey		; 88
	sbc ($0D.b),Y		; F1 0D
	pea $DC30.w		; F4 30 DC
	bne   1.b		; D0 01
	jsl $ED0D78.l		; 22 78 0D ED
	ldy $FC45.w,X		; BC 45 FC
	cpx #$2E24.w		; E0 24 2E
	dey		; 88
	dec $0E00.w,X		; DE 00 0E
	cmp $71.b,S		; C3 71
	lda $1F03.w		; AD 03 1F
	sei		; 78
	lda ($22.b),Y		; B1 22
	sbc $FCF0FF.l,X		; FF FF F0 FC
	sbc ($34.b,X)		; E1 34
	dey		; 88
	ora $FE11F0.l		; 0F F0 11 FE
	brk $EF.b		; 00 EF
	trb $41.b		; 14 41
	dey		; 88
	lda $FF11.w,X		; BD 11 FF
	inc $55E1.w,X		; FE E1 55
	rol $88DF.w,X		; 3E DF 88
	ora $21E0.w		; 0D E0 21
	jsr $1100.w		; 20 00 11
	brk $DC.b		; 00 DC
	dey		; 88
	pea $0E32.w		; F4 32 0E
	cop $2F.b		; 02 2F
	cmp $1E23.w,X		; DD 23 1E
	dey		; 88
	inc CGDATA.w		; EE 22 21
	jsr $1FE0.w		; 20 E0 1F
	cpy #$8430.w		; C0 30 84
	cmp $212245.l		; CF 45 22 21
	brk $12.b		; 00 12
	and $3478CC.l		; 2F CC 78 34
	eor $FA.b		; 45 FA
	cpy #$6522.w		; C0 22 65
	xce		; FB
	bne 120.b		; D0 78
	ora ($22.b,X)		; 01 22
	brk $F0.b		; 00 F0
	jsl $67D2FE.l		; 22 FE D2 67
	dey		; 88
	ora $32CF.w,X		; 1D CF 32
	asl $21E0.w,X		; 1E E0 21
	ora ($0F.b),Y		; 11 0F
	sei		; 78
	sbc $1B5601.l		; EF 01 56 1B
	cpy #$02EE.w		; C0 EE 02
	ora ($78.b)		; 12 78
	and ($DF.b),Y		; 31 DF
	mvp $FF,$1F		; 44 1F FF
	rol $629D.w		; 2E 9D 62
	dey		; 88
	sbc ($53.b,X)		; E1 53
	xce		; FB
	ldx #$FF63.w		; A2 63 FF
	inc $7802.w		; EE 02 78
	bvc -36.b		; 50 DC
	sbc ($22.b)		; F2 22
	and $EA.b,S		; 23 EA
	bcs  86.b		; B0 56
	sei		; 78
	phd		; 0B
	bit $4E.b		; 24 4E
	tax		; AA
	bit $FD.b,X		; 34 FD
	cmp ($55.b),Y		; D1 55
	sei		; 78
	ora ($20.b,X)		; 01 20
	cmp $64A0.w,Y		; D9 A0 64
	bpl -17.b		; 10 EF
	sbc ($88.b),Y		; F1 88
	ora ($10.b),Y		; 11 10
	sbc $22E0.w,X		; FD E0 22
	asl $1D04.w		; 0E 04 1D
	dey		; 88
	cmp $0F2213.l		; CF 13 22 0F
	dec $33E1.w,X		; DE E1 33
	sbc $0188.w		; ED 88 01
	jsr $14DD.w		; 20 DD 14
	.db $42, $0C		; 42 0C
	ldx $7812.w,Y		; BE 12 78
	eor ($FC.b,X)		; 41 FC
	cpx #$2E23.w		; E0 23 2E
	cmp $882012.l		; CF 12 20 88
	ora ($FD.b),Y		; 11 FD
	sbc ($FE.b),Y		; F1 FE
	sbc ($44.b,X)		; E1 44
	inc $7800.w,X		; FE 00 78
	dec $0200.w,X		; DE 00 02
	eor ($FC.b,X)		; 41 FC
	lda $3013.w,X		; BD 13 30
	sei		; 78
	sbc ($30.b),Y		; F1 30
	inc $EDFE.w		; EE FE ED
	ora $4E.b		; 05 4E
	sbc ($78.b)		; F2 78
	rol $11EE.w		; 2E EE 11
	phx		; DA
	ora $2F.b,X		; 15 2F
	and $EC.b,S		; 23 EC
	sei		; 78
	lda $F1ED43.l,X		; BF 43 ED F1
	jsr $46CF.w		; 20 CF 46
	lsr $EF88.w		; 4E 88 EF
	jsr ($33C1.w,X)		; FC C1 33
	jsr $F0EF.w		; 20 EF F0
	ora ($78.b,S),Y		; 13 78
	and $FFBF.w		; 2D BF FF
	sbc $25FD13.l		; EF 13 FD 25
	ora $C168.w		; 0D 68 C1
	eor $AA.b,S		; 43 AA
	ora ($D1.b),Y		; 11 D1
	adc ($DC.b,S),Y		; 73 DC
	sbc $01FF88.l,X		; FF 88 FF 01
	ora $EF40F2.l,X		; 1F F2 40 EF
	inc $78FF.w,X		; FE FF 78
	ora $5D.b,X		; 15 5D
	bne  35.b		; D0 23
	ora $14D0DE.l,X		; 1F DE D0 14
	sei		; 78
	jsl $CEDC21.l		; 22 21 DC CE
	mvp $25,$DD		; 44 DD 25
	eor ($78.b,X)		; 41 78
	dec $F10F.w,X		; DE 0F F1
	and ($0E.b),Y		; 31 0E
	inc $2401.w		; EE 01 24
	dey		; 88
	jsr $0FF1.w		; 20 F1 0F
	sbc $2E34F1.l		; EF F1 34 2E
	cmp $1378.w,X		; DD 78 13
	jsr $1033.w		; 20 33 10
	jsr $32CD.w		; 20 CD 32
	lda $4678.w,X		; BD 78 46
	and ($E0.b,X)		; 21 E0
	bit $2F.b		; 24 2F
	bcs  30.b		; B0 1E
	cmp ($78.b)		; D2 78
	eor $20.b,S		; 43 20
	sbc $ED3003.l,X		; FF 03 30 ED
	sbc ($55.b),Y		; F1 55
	sei		; 78
	asl A		; 0A
	sbc ($31.b,S),Y		; F3 31
	sbc $55E1.w,X		; FD E1 55
	asl $6400.w		; 0E 00 64
	jsr ($CEDD.w,X)		; FC DD CE
	lsr $10.b,X		; 56 10
	and $42.b,X		; 35 42
	ora ($78.b,X)		; 01 78
	ora ($11.b),Y		; 11 11
	xce		; FB
	cmp ($55.b)		; D2 55
	bit $43D2.w		; 2C D2 43
	stz $4C.b,X		; 74 4C
	lda $13BEFB.l		; AF FB BE 13
	jsr $2014.w		; 20 14 20
	sei		; 78
	beq -31.b		; F0 E1
	.db $42, $CE		; 42 CE
	jsl $23CD0E.l		; 22 0E CD 23
	pla		; 68
	adc ($10.b,X)		; 61 10
	tsb $DFCC.w		; 0C CC DF
	jsl $782A36.l		; 22 36 2A 78
	dec $12F0.w		; CE F0 12
	sbc $32F3.w,X		; FD F3 32
	cpy $7803.w		; CC 03 78
	inc $FE11.w		; EE 11 FE
	inc $33D0.w		; EE D0 33
	ora $88C0.w,X		; 1D C0 88
	jsr $11E0.w		; 20 E0 11
	tsb $4FC2.w		; 0C C2 4F
	bne  16.b		; D0 10
	stz $ED.b,X		; 74 ED
	sbc ($4F.b,S),Y		; F3 4F
	cmp $FFFF.w		; CD FF FF
	brk $23.b		; 00 23
	sei		; 78
	wai		; CB
	cop $0E.b		; 02 0E
	cmp $0DED65.l		; CF 65 ED 0D
	sta $2D1574.l,X		; 9F 74 15 2D
	dec $EC21.w		; CE 21 EC
	cmp $13DE.w,X		; DD DE 13
	sei		; 78
	ora $23E0ED.l		; 0F ED E0 23
	asl $FEF1.w,X		; 1E F1 FE
	cpy $1388.w		; CC 88 13
	bmi -53.b		; 30 CB
	eor $FC.b		; 45 FC
	beq  34.b		; F0 22
	ora $000F84.l		; 0F 84 0F 00
	sbc $44CF.w,X		; FD CF 44
	brk $11.b		; 00 11
	sbc $32F568.l,X		; FF 68 F5 32
	sbc ($24.b,X)		; E1 24
	sbc $22A0.w,Y		; F9 A0 22
	bit $68.b,X		; 34 68
	and $ED1F11.l		; 2F 11 1F ED
	ora ($01.b,X)		; 01 01
	mvn $64,$0D		; 54 0D 64
	sbc $0E13.w		; ED 13 0E
	cop $43.b		; 02 43
	ora $68FF11.l		; 0F 11 FF 68
	ora ($12.b)		; 12 12
	ora ($FD.b),Y		; 11 FD
	bne  52.b		; D0 34
	ora $FF58F1.l,X		; 1F F1 58 FF
	and $2E.b		; 25 2E
	cpx #$CA55.w		; E0 55 CA
	trb $0F.b		; 14 0F
	eor #$3034.w		; 49 34 30
	sbc $030E10.l,X		; FF 10 0E 03
	stz $1E.b		; 64 1E
	eor $4B55.w,Y		; 59 55 4B
	eor $010000.l		; 4F 00 00 01
	bpl   0.b		; 10 00
	brk $02.b		; 00 02
	bpl   0.b		; 10 00
	brk $FF.b		; 00 FF
	sbc $300004.l,X		; FF 04 00 30
	ror $00.b,X		; 76 00
	brk $F7.b		; 00 F7
	ror A		; 6A
	sbc [$6A.b],Y		; F7 6A
	brk $01.b		; 00 01
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4A.b		; 00 4A
	brk $00.b		; 00 00
	brk $51.b		; 00 51
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	rol A		; 2A
	rti		; 40

	and $32.b,S		; 23 32
	cpx #$C50F.w		; E0 0F C5
	inc A		; 1A
	sbc ($3A.b),Y		; F1 3A
	brk $E0.b		; 00 E0
	sbc $BBDE1E.l,X		; FF 1E DE BB
	phx		; DA
	tyx		; BB
	lsr A		; 4A
	cmp $DBDD.w,X		; DD DD DB
	cpy $CABB.w		; CC BB CA
	tsx		; BA
	lda #$DC5A.w		; A9 5A DC
	cmp $CCDB.w		; CD DB CC
	ldy $BBBB.w,X		; BC BB BB
	lda #$DD6A.w		; A9 6A DD
	jmp.w [$CCDC]		; DC DC CC
	cpy $BCBB.w		; CC BB BC
	tyx		; BB
	ply		; 7A
	cmp $DDDE.w,X		; DD DE DD
	cmp $DDCD.w		; CD CD DD
	cpy $7ACC.w		; CC CC 7A
	jmp.w [$DBCD]		; DC CD DB
	cmp $CCDC.w		; CD DC CC
	cmp $6ADD.w,X		; DD DD 6A
	lda #$BBAB.w		; A9 AB BB
	tyx		; BB
	tyx		; BB
	cpy $DDCC.w		; CC CC DD
	ply		; 7A
	sbc $0100FF.l,X		; FF FF 00 01
	ora ($22.b)		; 12 22
	and $44.b,S		; 23 44
	ply		; 7A
	eor $45.b		; 45 45
	eor $56.b,X		; 55 56
	adc $56.b		; 65 56
	ror $55.b		; 66 55
	ply		; 7A
	ror $54.b		; 66 54
	eor $44.b,X		; 55 44
	mvn $44,$33		; 54 33 44
	and ($6A.b)		; 32 6A
	eor $44.b		; 45 44
	eor $22.b,S		; 43 22
	jsl $101121.l		; 22 21 11 10
	dec A		; 3A
	sbc ($25.b,X)		; E1 25
	ora ($01.b),Y		; 11 01
	bpl  16.b		; 10 10
	brk $0F.b		; 00 0F
	rol A		; 2A
	asl $EFFD.w		; 0E FD EF
	cpy #$0010.w		; C0 10 00
	ora $BE2AFD.l,X		; 1F FD 2A BE
	phx		; DA
	wai		; CB
	jmp.w [$01FA]		; DC FA 01
	sbc ($02.b,X)		; E1 02
	rol A		; 2A
	asl $F000.w		; 0E 00 F0
	lsr $D0E0.w,X		; 5E E0 D0
	sbc ($E0.b)		; F2 E0
	rol A		; 2A
	eor $12.b,S		; 43 12
	and ($DF.b,S),Y		; 33 DF
	bpl -75.b		; 10 B5
	inc A		; 1A
	sbc ($3A.b),Y		; F1 3A
	brk $E0.b		; 00 E0
	sbc $BBDE1E.l,X		; FF 1E DE BB
	phx		; DA
	tyx		; BB
	lsr A		; 4A
	cmp $DBDD.w,X		; DD DD DB
	cpy $CABB.w		; CC BB CA
	tsx		; BA
	lda #$DC5A.w		; A9 5A DC
	cmp $CCDB.w		; CD DB CC
	ldy $BBBB.w,X		; BC BB BB
	lda #$DD6A.w		; A9 6A DD
	jmp.w [$CCDC]		; DC DC CC
	cpy $BCBB.w		; CC BB BC
	tyx		; BB
	ply		; 7A
	cmp $DDDE.w,X		; DD DE DD
	cmp $DDCD.w		; CD CD DD
	cpy $7ACC.w		; CC CC 7A
	jmp.w [$DBCD]		; DC CD DB
	cmp $CCDC.w		; CD DC CC
	cmp $6ADD.w,X		; DD DD 6A
	lda #$BBAB.w		; A9 AB BB
	tyx		; BB
	tyx		; BB
	cpy $DDCC.w		; CC CC DD
	ply		; 7A
	sbc $0100FF.l,X		; FF FF 00 01
	ora ($22.b)		; 12 22
	and $44.b,S		; 23 44
	ply		; 7A
	eor $45.b		; 45 45
	eor $56.b,X		; 55 56
	adc $56.b		; 65 56
	ror $55.b		; 66 55
	ply		; 7A
	ror $54.b		; 66 54
	eor $44.b,X		; 55 44
	mvn $44,$33		; 54 33 44
	and ($6A.b)		; 32 6A
	eor $44.b		; 45 44
	eor $22.b,S		; 43 22
	jsl $101121.l		; 22 21 11 10
	dec A		; 3A
	sbc ($25.b,X)		; E1 25
	ora ($01.b),Y		; 11 01
	bpl  16.b		; 10 10
	brk $0F.b		; 00 0F
	rol A		; 2A
	asl $EFFD.w		; 0E FD EF
	cpy #$0010.w		; C0 10 00
	ora $BE2BFD.l,X		; 1F FD 2B BE
	phx		; DA
	wai		; CB
	jmp.w [$01FA]		; DC FA 01
	sbc ($02.b,X)		; E1 02
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 0D7FFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0D7FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0D7FFF. Skipping.
.ENDS
