.BANK 17 SLOT 0
.ORG $0000

.SECTION "Bank17" FORCE

	ora $4480.w,Y		; 19 80 44
	brk $DA.b		; 00 DA
	and [$B8.b]		; 27 B8
	sbc $B8FFDA.l,X		; FF DA FF B8
	sbc $000000.l,X		; FF 00 00 00
	brk $EA.b		; 00 EA
	sbc $02FFB8.l,X		; FF B8 FF 02
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $04FFB8.l,X		; FF B8 FF 04
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $B8.b		; 00 B8
	sbc $004000.l,X		; FF 00 40 00
	brk $08.b		; 00 08
	brk $B8.b		; 00 B8
	sbc $000006.l,X		; FF 06 00 00
	brk $DB.b		; 00 DB
	sbc $08FFC8.l,X		; FF C8 FF 08
	brk $00.b		; 00 00
	brk $EB.b		; 00 EB
	sbc $0AFFC8.l,X		; FF C8 FF 0A
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $0CFFC8.l,X		; FF C8 FF 0C
	brk $00.b		; 00 00
	brk $17.b		; 00 17
	brk $C8.b		; 00 C8
	sbc $004008.l,X		; FF 08 40 00
	brk $07.b		; 00 07
	brk $C8.b		; 00 C8
	sbc $00000E.l,X		; FF 0E 00 00
	brk $E0.b		; 00 E0
	sbc $20FFD8.l,X		; FF D8 FF 20
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $22FFD8.l,X		; FF D8 FF 22
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	sbc $000024.l,X		; FF 24 00 00
	brk $12.b		; 00 12
	brk $D8.b		; 00 D8
	sbc $004020.l,X		; FF 20 40 00
	brk $02.b		; 00 02
	brk $D8.b		; 00 D8
	sbc $004022.l,X		; FF 22 40 00
	brk $DE.b		; 00 DE
	sbc $26FFE8.l,X		; FF E8 FF 26
	brk $00.b		; 00 00
	brk $EE.b		; 00 EE
	sbc $28FFE8.l,X		; FF E8 FF 28
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $2AFFE8.l,X		; FF E8 FF 2A
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	brk $E8.b		; 00 E8
	sbc $004026.l,X		; FF 26 40 00
	brk $04.b		; 00 04
	brk $E8.b		; 00 E8
	sbc $004028.l,X		; FF 28 40 00
	brk $DF.b		; 00 DF
	sbc $2CFFF8.l,X		; FF F8 FF 2C
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	sbc $2EFFF8.l,X		; FF F8 FF 2E
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $F8.b		; 00 F8
	sbc $000040.l,X		; FF 40 00 00
	brk $13.b		; 00 13
	brk $F8.b		; 00 F8
	sbc $00402C.l,X		; FF 2C 40 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $00402E.l,X		; FF 2E 40 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($40.b,X)		; 01 40
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	eor ($80.b,X)		; 41 80
	brk $80.b		; 00 80
	brk $83.b		; 00 83
	brk $80.b		; 00 80
	ora $007F80.l,X		; 1F 80 7F 00
	sbc $7F807F.l,X		; FF 7F 80 7F
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   3.b		; 80 03
	bra  31.b		; 80 1F
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	ora $000000.l,X		; 1F 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7F00FF.l,X		; FF FF 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FB00.l,X		; FF 00 FB 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $E0FF00.l,X		; FF 00 FF E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $6502.w,Y		; 19 02 65
	cop $F0.b		; 02 F0
	cop $B1.b		; 02 B1
	.db $42, $60		; 42 60
	ora [$00.b]		; 07 00
	ora [$01.b]		; 07 01
	ora [$00.b]		; 07 00
	ora [$02.b]		; 07 02
	clc		; 18
	cop $74.b		; 02 74
	ora $F0.b,S		; 03 F0
	ora $F0.b,S		; 03 F0
	ora [$60.b]		; 07 60
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $01.b		; 00 01
	adc $00FF80.l,X		; 7F 80 FF 00
	brk $00.b		; 00 00
	sbc $F80000.l,X		; FF 00 00 F8
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $BF.b		; 00 BF
	brk $00.b		; 00 00
	sbc $07F800.l,X		; FF 00 F8 07
	sed		; F8
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FE00FF.l,X		; FF FF 00 FE
	brk $01.b		; 00 01
	ora ($F9.b,X)		; 01 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($FC.b,X)		; 01 FC
	cop $00.b		; 02 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF007E.l,X		; FF 7E 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	jsr ($FC03.w,X)		; FC 03 FC
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $F9.b		; 00 F9
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc [$00.b],Y		; F7 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FC0000.l,X		; FF 00 00 FC
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $03FC00.l,X		; FF 00 FC 03
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF0678.l,X		; FF 78 06 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	and $FF3FC0.l,X		; 3F C0 3F FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	brk $80.b		; 00 80
	bra -97.b		; 80 9F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	bra  63.b		; 80 3F
	rti		; 40

	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	cli		; 58
	ora ($44.b,X)		; 01 44
	ora $1944.w,Y		; 19 44 19
	mvp $44,$19		; 44 19 44
	ora $1944.w,Y		; 19 44 19
	mvp $44,$19		; 44 19 44
	ora $F900.w,Y		; 19 00 F9
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	adc $807F80.l,X		; 7F 80 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	lda $40BF40.l,X		; BF 40 BF 40
	lda $40BF40.l,X		; BF 40 BF 40
	bra  31.b		; 80 1F
	bra  31.b		; 80 1F
	bra  31.b		; 80 1F
	bra  31.b		; 80 1F
	brk $5F.b		; 00 5F
	brk $5F.b		; 00 5F
	brk $5F.b		; 00 5F
	brk $5F.b		; 00 5F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($FB00.w,X)		; FC 00 FB
	brk $F7.b		; 00 F7
	brk $CF.b		; 00 CF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	xce		; FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $F8.b		; 00 F8
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($3F.b,X)		; 01 3F
	ora ($DF.b,X)		; 01 DF
	ora ($EF.b,X)		; 01 EF
	brk $F2.b		; 00 F2
	ora ($00.b,X)		; 01 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $00FF01.l,X		; FF 01 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  95.b		; F0 5F
	bvc  -1.b		; 50 FF
	beq -65.b		; F0 BF
	bcs  -1.b		; B0 FF
	cpx #$0F.b		; E0 0F
	beq   0.b		; F0 00
	sbc $10FF00.l,X		; FF 00 FF 10
	sbc $F0FF50.l,X		; FF 50 FF F0
	sbc $E0FFB0.l,X		; FF B0 FF E0
	sbc $01FF00.l,X		; FF 00 FF 01
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$01.b]		; 07 01
	asl $06.b		; 06 06
	ora ($06.b,X)		; 01 06
	ora ($06.b,X)		; 01 06
	ora ($06.b,X)		; 01 06
	ora ($06.b,X)		; 01 06
	ora ($06.b,X)		; 01 06
	ora ($06.b,X)		; 01 06
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $020002.l,X		; FF 02 00 02
	sbc $0002.w,X		; FD 02 00
	cop $FD.b		; 02 FD
	cop $00.b		; 02 00
	cop $FD.b		; 02 FD
	cop $00.b		; 02 00
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	brk $40.b		; 00 40
	lda $400040.l,X		; BF 40 00 40
	lda $400040.l,X		; BF 40 00 40
	lda $000040.l,X		; BF 40 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $20FF00.l,X		; FF 00 FF 20
	eor $20C020.l,X		; 5F 20 C0 20
	cmp $A0C020.l,X		; DF 20 C0 A0
	cmp $20C020.l,X		; DF 20 C0 20
	cmp $80C020.l,X		; DF 20 C0 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $007F80.l,X		; 7F 80 7F 00
	adc $807F80.l,X		; 7F 80 7F 80
	adc $007F80.l,X		; 7F 80 7F 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40FF00.l,X		; FF 00 FF 40
	lda $400040.l,X		; BF 40 00 40
	lda $470040.l,X		; BF 40 00 47
	sta [$40.b]		; 87 40
	ora [$40.b]		; 07 40
	bra  64.b		; 80 40
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $8E0000.l,X		; FF 00 00 8E
	stx $9A00.w		; 8E 00 9A
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
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	trb $001C.w		; 1C 1C 00
	asl $00.b,X		; 16 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $780000.l,X		; FF 00 00 78
	sei		; 78
	brk $78.b		; 00 78
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
	brk $3F.b		; 00 3F
	ora [$3F.b]		; 07 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	bmi  15.b		; 30 0F
	bmi  15.b		; 30 0F
	brk $00.b		; 00 00
	and $003F00.l,X		; 3F 00 3F 00
	and $000000.l,X		; 3F 00 00 00
	and $FF0000.l,X		; 3F 00 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	ora $FF00FF.l		; 0F FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00F000.l,X		; FF 00 F0 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $C02000.l,X		; FF 00 20 C0
	jsr $2040.w		; 20 40 20
	rti		; 40

	jsr $2040.w		; 20 40 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $000F00.l,X		; 3F 00 0F 00
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
	sbc $00EF00.l,X		; FF 00 EF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
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
	jsr $20DF.w		; 20 DF 20
	cpy #$20.b		; C0 20
	cpy #$40.b		; C0 40
	ldy #$07.b		; A0 07
	sbc [$07.b]		; E7 07
	sbc [$00.b]		; E7 00
	cpx #$00.b		; E0 00
	cpx #$80.b		; E0 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $C03FC0.l,X		; 7F C0 3F C0
	and $C03FC0.l,X		; 3F C0 3F C0
	and $003FC0.l,X		; 3F C0 3F 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	ldy $BCBC.w,X		; BC BC BC
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
	rti		; 40

	lda $400040.l,X		; BF 40 00 40
	and $400040.l,X		; 3F 40 00 40
	and $400040.l,X		; 3F 40 00 40
	and $000040.l,X		; 3F 40 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00C000.l,X		; FF 00 C0 00
	sbc $00C000.l,X		; FF 00 C0 00
	sbc $00C000.l,X		; FF 00 C0 00
	sbc $00C000.l,X		; FF 00 C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $20FF00.l,X		; FF 00 FF 20
	ora $3F403F.l,X		; 1F 3F 40 3F
	rti		; 40

	and $400040.l,X		; 3F 40 00 40
	brk $40.b		; 00 40
	bpl  96.b		; 10 60
	bpl  96.b		; 10 60
	and $403F00.l,X		; 3F 00 3F 40
	and $C03FC0.l,X		; 3F C0 3F C0
	and $403F40.l,X		; 3F 40 3F 40
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr ($FC00.w,X)		; FC 00 FC
	ora $FE.b,S		; 03 FE
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FC.b,X)		; 01 FC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FF.b		; 00 FF
	adc $807F00.l,X		; 7F 00 7F 80
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sed		; F8
	brk $F8.b		; 00 F8
	ora [$FC.b]		; 07 FC
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	ora $F8.b,S		; 03 F8
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000F00.l		; 0F 00 0F 00
	ora $000F00.l		; 0F 00 0F 00
	ora $000F00.l		; 0F 00 0F 00
	ora $000700.l		; 0F 00 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $02.b		; 00 02
	brk $FA.b		; 00 FA
	ora [$F2.b]		; 07 F2
	sbc $F2FFFA.l,X		; FF FA FF F2
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $004000.l,X		; FF 00 40 00
	brk $FA.b		; 00 FA
	sbc $01FFFA.l,X		; FF FA FF 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $004001.l,X		; FF 01 40 00
	brk $00.b		; 00 00
	tas		; 1B
	tas		; 1B
	and [$3B.b],Y		; 37 3B
	mvn $6F,$04		; 54 04 6F
	adc $F06FB0.l		; 6F B0 6F F0
	stz $EF.b		; 64 EF
	sbc $00007F.l,X		; FF 7F 00 00
	tas		; 1B
	tas		; 1B
	tsa		; 3B
	tsa		; 3B
	tsb $14.b		; 04 14
	adc $6F6F6F.l		; 6F 6F 6F 6F
	stz $74.b		; 64 74
	brk $FF.b		; 00 FF
	eor $F8070B.l		; 4F 0B 07 F8
	sta [$7B.b],Y		; 97 7B
	bcc 112.b		; 90 70
	cpx #$70.b		; E0 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phk		; 4B
	ldy $00.b,X		; B4 00
	sbc $60FF60.l,X		; FF 60 FF 60
	sbc $00F800.l,X		; FF 00 F8 00
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b,S		; 03 80
	php		; 08
	brk $F7.b		; 00 F7
	asl A		; 0A
	cpx $F7FF.w		; EC FF F7
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $00FFF0.l,X		; FF F0 FF 00
	rti		; 40

	brk $00.b		; 00 00
	sbc $E0FF.w,Y		; F9 FF E0
	sbc $000002.l,X		; FF 02 00 00
	brk $0C.b		; 00 0C
	asl $6B11.w,X		; 1E 11 6B
	tda		; 7B
	cmp $7B.b,X		; D5 7B
	stz $F57B.w		; 9C 7B F5
	and ($7B.b),Y		; 31 7B
	sbc $C0FF00.l,X		; FF 00 FF C0
	tsb $110D.w		; 0C 0D 11
	ora $7B.b,X		; 15 7B
	tda		; 7B
	tda		; 7B
	tda		; 7B
	tda		; 7B
	tda		; 7B
	and ($35.b),Y		; 31 35
	brk $FF.b		; 00 FF
	rol $6301.w,X		; 3E 01 63
	sbc [$98.b],Y		; F7 98
	sbc $6AFD.w,X		; FD FD 6A
	sbc $FDF3.w,X		; FD F3 FD
	ror A		; 6A
	tya		; 98
	sbc $00FF.w,X		; FD FF 00
	sbc $6B6300.l,X		; FF 00 63 6B
	tya		; 98
	txs		; 9A
	sbc $FDFD.w,X		; FD FD FD
	sbc $FDFD.w,X		; FD FD FD
	tya		; 98
	txs		; 9A
	brk $FF.b		; 00 FF
	sbc [$08.b],Y		; F7 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $00.b		; 25 00
	ora ($FE.b,X)		; 01 FE
	eor $447E.w,X		; 5D 7E 44
	dec $DC40.w,X		; DE 40 DC
	cli		; 58
	jmp $001410.l		; 5C 10 14 00
	brk $24.b		; 00 24
	stp		; DB
	brk $FF.b		; 00 FF
	jsr $187F.w		; 20 7F 18
	sbc $00FF18.l,X		; FF 18 FF 00
	ror $7E00.w,X		; 7E 00 7E
	brk $7E.b		; 00 7E
	plx		; FA
	brk $F8.b		; 00 F8
	sbc [$0B.b],Y		; F7 0B
	ora [$F2.b]		; 07 F2
	ora [$00.b]		; 07 00
	ora $01.b,S		; 03 01
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	brk $F2.b		; 00 F2
	ora $FF00.w		; 0D 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	and ($6A.b),Y		; 31 6A
	tda		; 7B
	sty $7B.b		; 84 7B
	sta [$00.b]		; 87 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	and ($7B.b),Y		; 31 7B
	tda		; 7B
	tda		; 7B
	tda		; 7B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	sty $DE56.w		; 8C 56 DE
	and ($DE.b,X)		; 21 DE
	sbc ($00.b,X)		; E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	sty $DEDE.w		; 8C DE DE
	dec $04DE.w,X		; DE DE 04
	bra   8.b		; 80 08
	brk $F3.b		; 00 F3
	asl $FFE4.w		; 0E E4 FF
	sbc ($FF.b,S),Y		; F3 FF
	cpx $FF.b		; E4 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFE4FF.l,X		; FF FF E4 FF
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	pea $02FF.w		; F4 FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $02FFF4.l,X		; FF F4 FF 02
	rti		; 40

	brk $00.b		; 00 00
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $1D0F18.l		; 0F 18 0F 1D
	ora $0B0F03.l		; 0F 03 0F 0B
	ora [$0F.b]		; 07 0F
	clc		; 18
	rol $0303.w,X		; 3E 03 03
	ora [$07.b]		; 07 07
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora [$07.b]		; 07 07
	clc		; 18
	ora $8F06.w,Y		; 19 06 8F
	sta $3FDF56.l		; 8F 56 DF 3F
	cmp $39CFF0.l,X		; DF F0 CF 39
	cmp $DF8F50.l		; CF 50 8F DF
	bmi  -1.b		; 30 FF
	asl $06.b		; 06 06
	sta $DFDF8F.l		; 8F 8F DF DF
	cmp $CFCFDF.l,X		; DF DF CF CF
	cmp $AF8FEF.l		; CF EF 8F AF
	bmi  48.b		; 30 30
	eor $00.b,X		; 55 00
	inc A		; 1A
	asl A		; 0A
	and $7F007F.l,X		; 3F 7F 00 7F
	and $3F617F.l,X		; 3F 7F 61 3F
	rtl		; 6B

	and $153F61.l,X		; 3F 61 3F 15
	ror A		; 6A
	inc A		; 1A
	adc $7F00.w		; 6D 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	asl $147F.w,X		; 1E 7F 14
	sbc $5FFF1E.l,X		; FF 1E FF 5F
	jsr $89BF.w		; 20 BF 89
	sbc $807F90.l		; EF 90 7F 80
	bmi -128.b		; 30 80
	and $809F8F.l,X		; 3F 8F 9F 80
	bra -128.b		; 80 80
	eor $708FB0.l		; 4F B0 8F 70
	eor $BF40B0.l		; 4F B0 40 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bit $7E5E.w,X		; 3C 5E 7E
	lda $7EB37E.l		; AF 7E B3 7E
	sta [$3E.b],Y		; 97 3E
	eor $407E3C.l,X		; 5F 3C 7E 40
	and $3C3F5F.l,X		; 3F 5F 3F 3C
	and $7E7E.w,X		; 3D 7E 7E
	ror $7E7E.w,X		; 7E 7E 7E
	ror $3E3E.w,X		; 7E 3E 3E
	bit $003D.w,X		; 3C 3D 00
	adc $797F00.l,X		; 7F 00 7F 79
	cmp $FFDFFF.l		; CF FF DF FF
	sbc $FFDFFF.l		; EF FF DF FF
	ldx $79.b,Y		; B6 79
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF7979.l,X		; FF 79 79 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $79FFFF.l,X		; FF FF FF 79
	adc $FF00.w,Y		; 79 00 FF
	brk $FF.b		; 00 FF
	ror $743F.w,X		; 7E 3F 74
	and $7E.b,X		; 35 7E
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $003F00.l,X		; 7F 00 3F 00
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
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	bra  20.b		; 80 14
	brk $EF.b		; 00 EF
	ora ($DC.b)		; 12 DC
	sbc $F0FFEF.l,X		; FF EF FF F0
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	sbc $004000.l,X		; FF 00 40 00
	brk $EF.b		; 00 EF
	sbc $04FFE0.l,X		; FF E0 FF 04
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $06FFE0.l,X		; FF E0 FF 06
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $E0.b		; 00 E0
	sbc $004004.l,X		; FF 04 40 00
	brk $F2.b		; 00 F2
	sbc $08FFD0.l,X		; FF D0 FF 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D0.b		; 00 D0
	sbc $004008.l,X		; FF 08 40 00
	brk $E0.b		; 00 E0
	ora $17005A.l,X		; 1F 5A 00 17
	ora $3F.b		; 05 3F
	ldy #$00.b		; A0 00
	sbc $7D7F3F.l,X		; FF 3F 7F 7D
	adc $007F65.l,X		; 7F 65 7F 00
	sbc $17E51A.l,X		; FF 1A E5 17
	cpx $C01F.w		; EC 1F C0
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	cop $7F.b		; 02 7F
	inc A		; 1A
	adc $5BFF00.l,X		; 7F 00 FF 5B
	tsb $EF.b		; 04 EF
	lda ($FF.b,X)		; A1 FF
	brk $1F.b		; 00 1F
	sbc $C4.b,S		; E3 C4
	cpx #$C4.b		; E0 C4
	cpx #$C4.b		; E0 C4
	cpx #$00.b		; E0 00
	sbc $EBA45B.l,X		; FF 5B A4 EB
	trb $FB.b		; 14 FB
	tsb $18.b		; 04 18
	sbc [$00.b]		; E7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FDFF00.l,X		; FF 00 FF FD
	cop $FF.b		; 02 FF
	php		; 08
	sbc $FCFF00.l,X		; FF 00 FF FC
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $FD02.w,X		; FD 02 FD
	cop $FD.b		; 02 FD
	cop $01.b		; 02 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	lda $00.b		; A5 00
	ror $FF5A.w,X		; 7E 5A FF
	brk $80.b		; 00 80
	adc $3B7F3F.l,X		; 7F 3F 7F 3B
	adc $007F3A.l,X		; 7F 3A 7F 00
	sbc $7E5AA5.l,X		; FF A5 5A 7E
	sta $FF.b,S		; 83 FF
	brk $80.b		; 00 80
	adc $04FF00.l,X		; 7F 00 FF 04
	sbc $0FFF05.l,X		; FF 05 FF 0F
	bpl  15.b		; 10 0F
	ora ($07.b),Y		; 11 07
	php		; 08
	ora [$0C.b]		; 07 0C
	ora $07.b,S		; 03 07
	brk $1F.b		; 00 1F
	rol $7F63.w,X		; 3E 63 7F
	txs		; 9A
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	rol $7F3E.w,X		; 3E 3E 7F
	adc $F33CF3.l,X		; 7F F3 3C F3
	ldy $3EF3.w,X		; BC F3 3E
	sbc ($33.b,X)		; E1 33
	sbc ($F3.b,X)		; E1 F3
	brk $DF.b		; 00 DF
	ora $EA3FBF.l,X		; 1F BF 3F EA
	sbc ($F3.b,S),Y		; F3 F3
	sbc ($F3.b,S),Y		; F3 F3
	sbc ($F3.b,S),Y		; F3 F3
	sbc ($ED.b,X)		; E1 ED
	sbc ($ED.b,X)		; E1 ED
	brk $20.b		; 00 20
	ora $3F3F5F.l,X		; 1F 5F 3F 3F
	jsr ($FC63.w,X)		; FC 63 FC
	sta ($FC.b,S),Y		; 93 FC
	sbc [$F8.b],Y		; F7 F8
	tsb $FCF8.w		; 0C F8 FC
	brk $FF.b		; 00 FF
	ora $F59FFF.l		; 0F FF 9F F5
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	sed		; F8
	xce		; FB
	sed		; F8
	xce		; FB
	brk $00.b		; 00 00
	ora $9F9F0F.l		; 0F 0F 9F 9F
	sbc $D8FFC0.l,X		; FF C0 FF D8
	inc $7EC1.w,X		; FE C1 7E
	cmp $7C.b,S		; C3 7C
	inc $BF00.w,X		; FE 00 BF
	sta [$DC.b]		; 87 DC
	cmp $FFFF75.l		; CF 75 FF FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	ror $7C7E.w,X		; 7E 7E 7C
	jmp ($4000.w,X)		; 7C 00 40
	sta [$A7.b]		; 87 A7
	cmp $0000CF.l		; CF CF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $FF64.w,X		; FD 64 FF
	stz $BF.b		; 64 BF
	adc $78BD.w,X		; 7D BD 78
	sec		; 38
	stz $24.b		; 64 24
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF.b		; 05 FF
	tas		; 1B
	sbc $00FF1B.l,X		; FF 1B FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $003F00.l,X		; 7F 00 3F 00
	ora $E0E067.l,X		; 1F 67 E0 E0
	cpx #$A0.b		; E0 A0
	cpx #$A0.b		; E0 A0
	cpx #$A0.b		; E0 A0
	cpx #$20.b		; E0 20
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc ($7B.b,X)		; 61 7B
	adc ($7F.b)		; 72 7F
	eor ($7F.b)		; 52 7F
	tad		; 5B
	tda		; 7B
	eor ($71.b),Y		; 51 71
	.db $42, $62		; 42 62
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc A		; 1A
	sbc $0DFF0D.l,X		; FF 0D FF 0D
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7F7F00.l,X		; FF 00 7F 7F
	sbc #$7F.b		; E9 7F
	sbc $7FEB7F.l,X		; FF 7F EB 7F
	ldy $433E.w		; AC 3E 43
	rol $007F.w,X		; 3E 7F 00
	bit $40BF.w,X		; 3C BF 40
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	rol $3E3E.w,X		; 3E 3E 3E
	rol $0300.w,X		; 3E 00 03
	brk $FF.b		; 00 FF
	lda $73BF79.l,X		; BF 79 BF 73
	lda $F53F77.l,X		; BF 77 3F F5
	ora $3F1FB1.l,X		; 1F B1 1F 3F
	brk $1E.b		; 00 1E
	sbc $BFBF00.l,X		; FF 00 BF BF
	lda $BFBFBF.l,X		; BF BF BF BF
	and $5F1F3F.l,X		; 3F 3F 1F 5F
	ora $E100DF.l,X		; 1F DF 00 E1
	brk $FF.b		; 00 FF
	sbc $FCFFF9.l,X		; FF F9 FF FC
	sbc $FA9FFE.l,X		; FF FE 9F FA
	ora $9F0FF8.l		; 0F F8 0F 9F
	brk $07.b		; 00 07
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta $0F0F9F.l,X		; 9F 9F 0F 0F
	ora $F8006F.l		; 0F 6F 00 F8
	brk $FF.b		; 00 FF
	cmp $EFDFE9.l,X		; DF E9 DF EF
	cmp $F3CFED.l,X		; DF ED CF F3
	sta [$DC.b]		; 87 DC
	sta [$CF.b]		; 87 CF
	brk $83.b		; 00 83
	sbc $DFDF00.l,X		; FF 00 DF DF
	cmp $DFDFDF.l,X		; DF DF DF DF
	cmp $A787CF.l		; CF CF 87 A7
	sta [$B7.b]		; 87 B7
	brk $7C.b		; 00 7C
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $613F2E.l,X		; 1F 2E 3F 61
	adc $000092.l,X		; 7F 92 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3F3F1F.l,X		; 1F 1F 3F 3F
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$88.b]		; 07 88
	sta $6F9FF8.l		; 8F F8 9F 6F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	sta $9F9F8F.l		; 8F 8F 9F 9F
	ora #$80.b		; 09 80
	clc		; 18
	brk $EB.b		; 00 EB
	asl $D4.b,X		; 16 D4
	sbc $D4FFEB.l,X		; FF EB FF D4
	sbc $000000.l,X		; FF 00 00 00
	brk $FB.b		; 00 FB
	sbc $02FFD4.l,X		; FF D4 FF 02
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $D4.b		; 00 D4
	sbc $004000.l,X		; FF 00 40 00
	brk $EB.b		; 00 EB
	sbc $04FFE4.l,X		; FF E4 FF 04
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $06FFE4.l,X		; FF E4 FF 06
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $E4.b		; 00 E4
	sbc $004004.l,X		; FF 04 40 00
	brk $EB.b		; 00 EB
	sbc $08FFF4.l,X		; FF F4 FF 08
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $0AFFF4.l,X		; FF F4 FF 0A
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $F4.b		; 00 F4
	sbc $004008.l,X		; FF 08 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $01.b,S		; 03 01
	cop $03.b		; 02 03
	ora $03.b		; 05 03
	asl $0E03.w		; 0E 03 0E
	ora $0E.b,S		; 03 0E
	ora $05.b,S		; 03 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	brk $F8.b		; 00 F8
	sed		; F8
	ror $FC.b,X		; 76 FC
	xce		; FB
	inc $FE75.w,X		; FE 75 FE
	bit #$FE.b		; 89 FE
	eor $FE5FFE.l,X		; 5F FE 5F FE
	sbc ($00.b),Y		; F1 00
	brk $F8.b		; 00 F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	brk $1F.b		; 00 1F
	ora $661F30.l		; 0F 30 1F 66
	and $D67F76.l,X		; 3F 76 7F D6
	adc $C97FCF.l,X		; 7F CF 7F C9
	and $0000D0.l,X		; 3F D0 00 00
	ora $1F1F0F.l		; 0F 0F 1F 1F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	and $81003F.l,X		; 3F 3F 00 81
	ora ($C6.b,X)		; 01 C6
	sta $6D.b,S		; 83 6D
	cmp [$EA.b]		; C7 EA
	sbc [$B9.b]		; E7 B9
	sbc [$3F.b]		; E7 3F
	sbc [$3F.b]		; E7 3F
	cmp [$B8.b]		; C7 B8
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	sta $83.b,S		; 83 83
	cmp [$C7.b]		; C7 C7
	sbc [$E7.b]		; E7 E7
	sbc [$E7.b]		; E7 E7
	sbc [$E7.b]		; E7 E7
	cmp [$C7.b]		; C7 C7
	adc $997F99.l,X		; 7F 99 7F 99
	adc $F73FA9.l,X		; 7F A9 3F F7
	and $7F1F60.l,X		; 3F 60 1F 7F
	brk $1F.b		; 00 1F
	lda $7F7F40.l,X		; BF 40 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	ora $00001F.l,X		; 1F 1F 00 00
	brk $FF.b		; 00 FF
	sbc $9EEF9E.l		; EF 9E EF 9E
	sbc $7EC71F.l		; EF 1F C7 7E
	cmp $EE.b,S		; C3 EE
	sta $CF.b,S		; 83 CF
	brk $03.b		; 00 03
	sbc $EFEF00.l,X		; FF 00 EF EF
	sbc $EFEFEF.l		; EF EF EF EF
	cmp [$C7.b]		; C7 C7
	cmp $D3.b,S		; C3 D3
	sta $B3.b,S		; 83 B3
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	sbc $36FFB6.l,X		; FF B6 FF 36
	sbc $D6F976.l,X		; FF 76 F9 D6
	sbc $F01F.w,Y		; F9 1F F0
	sbc $E000.w,Y		; F9 00 E0
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F9F9.w,Y		; F9 F9 F9
	sbc $F6F0.w,Y		; F9 F0 F6
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	sbc $C7FFD7.l,X		; FF D7 FF C7
	sbc $B7FEEF.l,X		; FF EF FE B7
	jsr ($FC87.w,X)		; FC 87 FC
	sbc $FF7C00.l,X		; FF 00 7C FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFEFE.l,X		; FF FE FE FC
	jsr ($FCFC.w,X)		; FC FC FC
	brk $83.b		; 00 83
	brk $FF.b		; 00 FF
	tsa		; 3B
	adc $787F73.l,X		; 7F 73 7F 78
	tyx		; BB
	adc ($BF.b,S),Y		; 73 BF
	sei		; 78
	tyx		; BB
	adc ($BF.b),Y		; 71 BF
	tda		; 7B
	tyx		; BB
	tda		; 7B
	tsa		; 3B
	tsb $7F.b		; 04 7F
	tsb $037F.w		; 0C 7F 03
	sbc $03FF0C.l,X		; FF 0C FF 03
	sbc $00FF0E.l,X		; FF 0E FF 00
	sbc $787F00.l,X		; FF 00 7F 78
	jsr ($FC38.w,X)		; FC 38 FC
	mvn $34,$7C		; 54 7C 34
	jsr ($7C54.w,X)		; FC 54 7C
	bit $FC.b,X		; 34 FC
	stz $7C.b		; 64 7C
	stz $7C.b		; 64 7C
	bra  -1.b		; 80 FF
	cpy #$FF.b		; C0 FF
	jsr $C0FF.w		; 20 FF C0
	sbc $C0FF20.l,X		; FF 20 FF C0
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	adc $007F00.l,X		; 7F 00 7F 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($03.b),Y		; 31 03
	and ($03.b),Y		; 31 03
	sep #$03		; E2 03
	sep #$03		; E2 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	ora $04.b,S		; 03 04
	ora ($03.b,X)		; 01 03
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	ora $6F3F70.l,X		; 1F 70 3F 6F
	and $967FE9.l,X		; 3F E9 7F 96
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3F3F1F.l,X		; 1F 1F 3F 3F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	inc $FC0F.w,X		; FE 0F FC
	asl $FC.b		; 06 FC
	inc $FB00.w,X		; FE 00 FB
	sta $EF.b,S		; 83 EF
	cmp $6E.b,S		; C3 6E
	cmp [$7E.b]		; C7 7E
	sbc $FEFE1F.l		; EF 1F FE FE
	jsr ($FCFD.w,X)		; FC FD FC
	sbc $0400.w,X		; FD 00 04
	sta $93.b,S		; 83 93
	cmp $D3.b,S		; C3 D3
	cmp [$C7.b]		; C7 C7
	sbc $EF3FEF.l		; EF EF 3F EF
	ora $7F1F70.l,X		; 1F 70 1F 7F
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	sbc $F91F.w,Y		; F9 1F F9
	dec $FF.b		; C6 FF
	lsr $3F.b,X		; 56 3F
	and $1F9F1F.l,X		; 3F 1F 9F 1F
	sta $F00000.l,X		; 9F 00 00 F0
	beq  -7.b		; F0 F9
	sbc $F9F9.w,Y		; F9 F9 F9
	sbc $7FC7FF.l,X		; FF FF C7 7F
	sta $E6.b,S		; 83 E6
	sta $E7.b,S		; 83 E7
	brk $FD.b		; 00 FD
	jsr ($FCFF.w,X)		; FC FF FC
	sta [$FE.b]		; 87 FE
	and [$FF.b],Y		; 37 FF
	lda $83C7C7.l		; AF C7 C7 83
	txy		; 9B
	sta $9B.b,S		; 83 9B
	brk $02.b		; 00 02
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FEFE.w,X)		; FC FE FE
	sbc $3FCFFF.l,X		; FF FF CF 3F
	sbc $004CF0.l,X		; FF F0 4C 00
	ora $000C03.l		; 0F 03 0C 00
	and $FF00FF.l,X		; 3F FF 00 FF
	and $FF007F.l,X		; 3F 7F 00 FF
	ora $F30C00.l		; 0F 00 0C F3
	ora $F30CF3.l		; 0F F3 0C F3
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	stp		; DB
	brk $A5.b		; 00 A5
	bit $DB.b		; 24 DB
	brk $FF.b		; 00 FF
	jsr ($FC03.w,X)		; FC 03 FC
	sed		; F8
	jsr ($FF00.w,X)		; FC 00 FF
	sbc $24DB00.l,X		; FF 00 DB 24
	lda $5A.b		; A5 5A
	stp		; DB
	bit $03.b		; 24 03
	jsr ($FC03.w,X)		; FC 03 FC
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	adc $19FF80.l,X		; 7F 80 FF 19
	ldx $59.b		; A6 59
	lda $3FFF40.l,X		; BF 40 FF 3F
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	and $C03FC0.l,X		; 3F C0 3F C0
	and $C026C0.l,X		; 3F C0 26 C0
	and $FF00C0.l,X		; 3F C0 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FA10.w		; ED 10 FA
	.db $82, $5D, $A0		; 82 5D A0
	cmp $C3FC23.l,X		; DF 23 FC C3
	and ($03.b),Y		; 31 03
	brk $FF.b		; 00 FF
	cmp $32CD30.l		; CF 30 CD 32
	dex		; CA
	and $4D.b,X		; 35 4D
	and ($CC.b)		; 32 CC
	and ($0C.b,S),Y		; 33 0C
	sbc ($00.b,S),Y		; F3 00
	sbc $131858.l,X		; FF 58 18 13
	ora ($00.b,S),Y		; 13 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $003F00.l,X		; 7F 00 3F 00
	and $001F00.l,X		; 3F 00 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	trb $0C04.w		; 1C 04 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1C80.w		; 0D 80 1C
	brk $E7.b		; 00 E7
	inc A		; 1A
	cpy $E9FF.w		; CC FF E9
	sbc $00FFCC.l,X		; FF CC FF 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $02FFCC.l,X		; FF CC FF 02
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $CC.b		; 00 CC
	sbc $004000.l,X		; FF 00 40 00
	brk $E7.b		; 00 E7
	sbc $04FFDC.l,X		; FF DC FF 04
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $06FFDC.l,X		; FF DC FF 06
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $DC.b		; 00 DC
	sbc $004004.l,X		; FF 04 40 00
	brk $FB.b		; 00 FB
	sbc $06FFDC.l,X		; FF DC FF 06
	rti		; 40

	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	cpx $08FF.w		; EC FF 08
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $0AFFEC.l,X		; FF EC FF 0A
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $EC.b		; 00 EC
	sbc $004008.l,X		; FF 08 40 00
	brk $FB.b		; 00 FB
	sbc $0AFFEC.l,X		; FF EC FF 0A
	rti		; 40

	brk $00.b		; 00 00
	sbc #$FF.b		; E9 FF
	jsr ($0CFF.w,X)		; FC FF 0C
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $FC.b		; 00 FC
	sbc $00400C.l,X		; FF 0C 40 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $03.b,S		; 03 03
	brk $03.b		; 00 03
	ora $070E03.l		; 0F 03 0E 07
	clc		; 18
	ora [$19.b]		; 07 19
	ora [$19.b]		; 07 19
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	brk $FC.b		; 00 FC
	sei		; 78
	sbc $FF79FE.l,X		; FF FE 79 FF
	ora $FF.b		; 05 FF
	stz $FF.b,X		; 74 FF
	txa		; 8A
	sbc $15FF15.l,X		; FF 15 FF 15
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	inc $FFFE.w,X		; FE FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $030700.l,X		; FF 00 07 03
	ora $1F1C07.l,X		; 1F 07 1C 1F
	ldy $1F.b,X		; B4 1F
	lda $1F.b,X		; B5 1F
	sbc [$1F.b]		; E7 1F
	sbc #$1F.b		; E9 1F
	inx		; E8
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $E0001F.l,X		; 1F 1F 00 E0
	cpy #$F8.b		; C0 F8
	cpx #$38.b		; E0 38
	sed		; F8
	and $ADF8.w		; 2D F8 AD
	sed		; F8
	sbc [$F8.b]		; E7 F8
	sta [$F8.b],Y		; 97 F8
	ora [$00.b],Y		; 17 00
	brk $C0.b		; 00 C0
	cpy #$E0.b		; C0 E0
	cpx #$F8.b		; E0 F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	and $543F57.l,X		; 3F 57 3F 54
	and $ED3FEB.l,X		; 3F EB 3F ED
	and $EB3FEC.l,X		; 3F EC 3F EB
	and $673F5B.l,X		; 3F 5B 3F 67
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	sbc ($2F.b),Y		; F1 2F
	sbc ($CF.b),Y		; F1 CF
	sbc $F957.w,Y		; F9 57 F9
	lda [$F9.b],Y		; B7 F9
	lda [$F9.b],Y		; B7 F9
	adc [$F1.b],Y		; 77 F1
	sta $F1DFF1.l		; 8F F1 DF F1
	sbc ($F1.b),Y		; F1 F1
	sbc ($F9.b),Y		; F1 F9
	sbc $F9F9.w,Y		; F9 F9 F9
	sbc $F9F9.w,Y		; F9 F9 F9
	sbc $F1F1.w,Y		; F9 F1 F1
	sbc ($F1.b),Y		; F1 F1
	sbc $5AFF26.l,X		; FF 26 FF 5A
	sbc $55FF61.l,X		; FF 61 FF 55
	sbc $5DFF45.l,X		; FF 45 FF 5D
	sbc $B8FF5B.l,X		; FF 5B FF B8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta $F59FF6.l,X		; 9F F6 9F F5
	sbc $FAFFF8.l,X		; FF F8 FF FA
	sbc $FBFFFA.l,X		; FF FA FF FB
	sta $F19FFD.l,X		; 9F FD 9F F1
	sta $9F9F9F.l,X		; 9F 9F 9F 9F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta $9F9F9F.l,X		; 9F 9F 9F 9F
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	ora $7F0058.l,X		; 1F 58 00 7F
	brk $3F.b		; 00 3F
	ora $3F3D3F.l,X		; 1F 3F 3D 3F
	sec		; 38
	and $077906.l,X		; 3F 06 79 07
	sei		; 78
	ora [$60.b]		; 07 60
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	cop $3F.b		; 02 3F
	ora [$3F.b]		; 07 3F
	tyx		; BB
	sta $0066.w,Y		; 99 66 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	inc $DEFF.w,X		; FE FF DE
	sbc $BBFF9E.l,X		; FF 9E FF BB
	cpy $66.b		; C4 66
	sta $00FF.w,Y		; 99 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr $60FF.w		; 20 FF 60
	sbc $7E81BF.l,X		; FF BF 81 7E
	ora ($FF.b,X)		; 01 FF
	brk $7F.b		; 00 7F
	sta [$7F.b]		; 87 7F
	bra  24.b		; 80 18
	bra  24.b		; 80 18
	bra  24.b		; 80 18
	bra -89.b		; 80 A7
	cli		; 58
	ror $98.b		; 66 98
	sbc [$18.b]		; E7 18
	rts		; 60

	sta $009F60.l,X		; 9F 60 9F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F708FF.l,X		; FF FF 08 F7
	php		; 08
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $000100.l,X		; FF 00 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $F601.w,X		; FE 01 F6
	ora ($FE.b,X)		; 01 FE
	ora ($00.b,X)		; 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $BF22A2.l,X		; FF A2 22 BF
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $003F00.l,X		; 7F 00 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	tsb $FCC4.w		; 0C C4 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$19.b]		; 07 19
	ora $0D.b,S		; 03 0D
	ora $0C.b,S		; 03 0C
	ora $06.b,S		; 03 06
	ora ($03.b,X)		; 01 03
	brk $1F.b		; 00 1F
	asl $3FFF.w,X		; 1E FF 3F
	cpx #$07.b		; E0 07
	ora [$03.b]		; 07 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $1E.b		; 00 1E
	asl $3F3F.w,X		; 1E 3F 3F
	sbc $05FF75.l,X		; FF 75 FF 05
	sbc $07FEF9.l,X		; FF F9 FE 07
	jsr ($00FF.w,X)		; FC FF 00
	xce		; FB
	brk $C7.b		; 00 C7
	sta ($E7.b,X)		; 81 E7
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	jsr ($00FC.w,X)		; FC FC 00
	tsb $00.b		; 04 00
	sec		; 38
	sta ($99.b,X)		; 81 99
	ora $F31FEA.l,X		; 1F EA 1F F3
	ora $1C0FB8.l,X		; 1F B8 0F 1C
	ora [$1F.b]		; 07 1F
	brk $FF.b		; 00 FF
	beq  -2.b		; F0 FE
	jsr ($1FFF.w,X)		; FC FF 1F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	eor $07EF0F.l,X		; 5F 0F EF 07
	sbc [$00.b]		; E7 00
	brk $F0.b		; 00 F0
	sbc ($FC.b),Y		; F1 FC
	jsr ($57F8.w,X)		; FC F8 57
	sed		; F8
	cmp $F01DF8.l		; CF F8 1D F0
	sec		; 38
	cpx #$F8.b		; E0 F8
	brk $FF.b		; 00 FF
	ora $FF3F7F.l		; 0F 7F 3F FF
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	plx		; FA
	beq  -9.b		; F0 F7
	cpx #$E7.b		; E0 E7
	brk $00.b		; 00 00
	ora $3F3F8F.l		; 0F 8F 3F 3F
	ora $3F0F30.l,X		; 1F 30 0F 3F
	brk $0F.b		; 00 0F
	jsr $5F1F.w		; 20 1F 5F
	jsr $0778.w		; 20 78 07
	adc $002778.l,X		; 7F 78 27 00
	ora $0F0F1F.l,X		; 1F 1F 0F 0F
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	ora [$00.b]		; 07 00
	ora [$78.b]		; 07 78
	cpx #$39.b		; E0 39
	cpx #$F1.b		; E0 F1
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $006600.l,X		; FF 00 66 00
	cpx #$E6.b		; E0 E6
	cpx #$EE.b		; E0 EE
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $996600.l,X		; FF 00 66 99
	sbc $FF7FC1.l,X		; FF C1 7F FF
	brk $7E.b		; 00 7E
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $186700.l,X		; FF 00 67 18
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	brk $81.b		; 00 81
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc [$18.b]		; E7 18
	adc [$98.b]		; 67 98
	ora $9F0FF8.l		; 0F F8 0F 9F
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $01FE00.l,X		; FF 00 FE 01
	ora $6F0F0F.l		; 0F 0F 0F 6F
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FE01.w,X		; FE 01 FE
	ora ($38.b,X)		; 01 38
	adc $387D3D.l,X		; 7F 3D 7D 38
	adc $387D3D.l,X		; 7F 3D 7D 38
	eor $3D5D3D.l,X		; 5F 3D 5D 3D
	ora $1D3D.w,X		; 1D 3D 1D
	ora [$7F.b]		; 07 7F
	brk $FF.b		; 00 FF
	ora [$7F.b]		; 07 7F
	brk $7F.b		; 00 7F
	ora [$FF.b]		; 07 FF
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	stx $47FF.w		; 8E FF 47
	cmp $45FF8F.l,X		; DF 8F FF 45
	cmp $D9FF8D.l,X		; DF 8D FF D9
	cmp $09DFD9.l,X		; DF D9 DF 09
	ora $98FF70.l		; 0F 70 FF 98
	sbc $98FF70.l,X		; FF 70 FF 98
	sbc $00FF70.l,X		; FF 70 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0F871F.l,X		; FF 1F 87 0F
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $00C000.l,X		; DF 00 C0 00
	cpy #$00.b		; C0 00
	cpy #$FF.b		; C0 FF
	inc $00FF.w,X		; FE FF 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $002080.l		; 0F 80 20 00
.INDEX 8
	sep #$1F		; E2 1F
	cpy $FF.b		; C4 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	beq  -1.b		; F0 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	beq  -1.b		; F0 FF
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	cop $40.b		; 02 40
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	cpx #$FF.b		; E0 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	cpx #$FF.b		; E0 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	ora $FFE000.l		; 0F 00 E0 FF
	tsb $40.b		; 04 40
	brk $00.b		; 00 00
	sbc $FFE0FF.l,X		; FF FF E0 FF
	asl $40.b		; 06 40
	brk $00.b		; 00 00
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	bne  -1.b		; D0 FF
	php		; 08
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $0AFFD0.l,X		; FF D0 FF 0A
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $D0.b		; 00 D0
	sbc $004008.l,X		; FF 08 40 00
	brk $00.b		; 00 00
	brk $D0.b		; 00 D0
	sbc $00400A.l,X		; FF 0A 40 00
	brk $E9.b		; 00 E9
	sbc $0CFFC0.l,X		; FF C0 FF 0C
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $0EFFC0.l,X		; FF C0 FF 0E
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $C0.b		; 00 C0
	sbc $00400C.l,X		; FF 0C 40 00
	brk $1E.b		; 00 1E
	and $3E3F3E.l,X		; 3F 3E 3F 3E
	eor $3E5E3C.l,X		; 5F 3C 5E 3E
	eor $3C5F3E.l,X		; 5F 3E 5F 3C
	lsr $4F3E.w,X		; 5E 3E 4F
	ora ($3F.b,X)		; 01 3F
	ora ($3F.b,X)		; 01 3F
	ora ($7F.b,X)		; 01 7F
	cop $FF.b		; 02 FF
	ora ($FF.b,X)		; 01 FF
	ora ($7F.b,X)		; 01 7F
	cop $7F.b		; 02 7F
	ora ($FF.b,X)		; 01 FF
	sbc [$FF.b],Y		; F7 FF
	adc $FF.b,S		; 63 FF
	and ($FF.b,X)		; 21 FF
	sta $F7.b,X		; 95 F7
	adc $FF.b,S		; 63 FF
	and ($FF.b,X)		; 21 FF
	sta $F7.b,X		; 95 F7
	and ($FF.b,X)		; 21 FF
	php		; 08
	sbc $DEFF9C.l,X		; FF 9C FF DE
	sbc $9CFF62.l,X		; FF 62 FF 9C
	sbc $62FFDE.l,X		; FF DE FF 62
	sbc $C1FFDE.l,X		; FF DE FF C1
	beq -63.b		; F0 C1
	beq -127.b		; F0 81
	beq -95.b		; F0 A1
	beq -96.b		; F0 A0
	beq -96.b		; F0 A0
	beq  32.b		; F0 20
	cpx #$20.b		; E0 20
	cpx #$00.b		; E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80F900.l,X		; FF 00 F9 80
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FFF00.l,X		; FF 00 FF 1F
	bvs  15.b		; 70 0F
	adc $600F00.l,X		; 7F 00 0F 60
	ora $E7609F.l,X		; 1F 9F 60 E7
	ora $FF07F8.l,X		; 1F F8 07 FF
	jsr ($1F1F.w,X)		; FC 1F 1F
	ora $00000F.l		; 0F 0F 00 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $00.b,S		; 03 00
	sed		; F8
	trb $FCF0.w		; 1C F0 FC
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $FBF800.l,X		; FF 00 F8 FB
	beq -13.b		; F0 F3
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $F03F00.l,X		; FF 00 3F F0
	ora $1F00FF.l,X		; 1F FF 00 1F
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $3F3F00.l,X		; FF 00 3F 3F
	ora $E0001F.l,X		; 1F 1F 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr ($F003.w,X)		; FC 03 F0
	and $00F9E0.l,X		; 3F E0 F9 00
	cpy #$00.b		; C0 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $F0.b		; 00 F0
	beq -32.b		; F0 E0
	inc $00.b		; E6 00
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $01.b,S		; 03 01
	ora $0F3E07.l,X		; 1F 07 3E 0F
	and $691F.w,Y		; 39 1F 69
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora [$07.b]		; 07 07
	ora $1F1F0F.l		; 0F 0F 1F 1F
	adc $E03FCF.l,X		; 7F CF 3F E0
	ora $FF007F.l,X		; 1F 7F 00 FF
	cpx #$FE.b		; E0 FE
	sed		; F8
	asl $F6FC.w		; 0E FC F6
	inc $7FCD.w,X		; FE CD 7F
	adc $1F3F3F.l,X		; 7F 3F 3F 1F
	ora $E00000.l,X		; 1F 00 00 E0
	sbc ($F8.b,X)		; E1 F8
	sbc $FDFC.w,Y		; F9 FC FD
	inc $F8FE.w,X		; FE FE F8
	cmp $E03CF0.l		; CF F0 3C E0
	sed		; F8
	brk $DF.b		; 00 DF
	ora $3F.b,S		; 03 3F
	ora $781F7F.l		; 0F 7F 1F 78
	and $F8F8E6.l,X		; 3F E6 F8 F8
	beq -13.b		; F0 F3
	cpx #$E7.b		; E0 E7
	brk $20.b		; 00 20
	ora $C3.b,S		; 03 C3
	ora $9F1F8F.l		; 0F 8F 1F 9F
	and $E07F3F.l,X		; 3F 3F 7F E0
	and $FF1FF0.l,X		; 3F F0 1F FF
	brk $FF.b		; 00 FF
	cpy #$FC.b		; C0 FC
	beq  -1.b		; F0 FF
	sed		; F8
	and $7F6FFC.l,X		; 3F FC 6F 7F
	adc $1F3F3F.l,X		; 7F 3F 3F 1F
	ora $C00000.l,X		; 1F 00 00 C0
	cmp $F0.b,S		; C3 F0
	beq  -8.b		; F0 F8
	sed		; F8
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$03.b]		; 07 03
	ora $1F231F.l,X		; 1F 1F 23 1F
	adc $000000.l		; 6F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $1F.b,S		; 03 1F
	ora $001F1F.l,X		; 1F 1F 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$C0.b		; E0 C0
	jsr ($C6F8.w,X)		; FC F8 C6
	sed		; F8
	sbc [$00.b]		; E7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$F8.b		; C0 F8
	sed		; F8
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $3F.b,S		; 03 3F
	ora $731F78.l		; 0F 78 1F 73
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora $1F1F0F.l		; 0F 0F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	cpy #$FC.b		; C0 FC
	beq  30.b		; F0 1E
	sed		; F8
	dec $0000.w		; CE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	rol $3E4E.w,X		; 3E 4E 3E
	asl $0E3E.w		; 0E 3E 0E
	rol $06.b,X		; 36 06
	trb $04.b		; 14 04
	ora [$07.b],Y		; 17 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	inc $F7.b,X		; F6 F7
	inc $F7.b,X		; F6 F7
	bra -127.b		; 80 81
	bpl  17.b		; 10 11
	rts		; 60

	rts		; 60

	inc $00FF.w,X		; FE FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $20F700.l,X		; FF 00 F7 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$60.b		; E0 60
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
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
	adc [$04.b]		; 67 04
	asl $04.b		; 06 04
	ora [$04.b]		; 07 04
	ora $FF1F9C.l,X		; 1F 9C 1F FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	ora $F8037F.l,X		; 1F 7F 03 F8
	cop $F9.b		; 02 F9
	ora $F8.b,S		; 03 F8
	ora $E0.b,S		; 03 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	tsa		; 3B
	brk $D5.b		; 00 D5
	cpy $3B.b		; C4 3B
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3BFFFF.l,X		; FF FF FF 3B
	cpy $D5.b		; C4 D5
	nop		; EA
	tsa		; 3B
	cpy $FF.b		; C4 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $9DFF00.l,X		; FF 00 FF 9D
	cop $6F.b		; 02 6F
	rts		; 60

	stz $FE01.w,X		; 9E 01 FE
	ora ($FE.b,X)		; 01 FE
	sbc ($1F.b,X)		; E1 1F
	cpx #$1F.b		; E0 1F
	cpx #$83.b		; E0 83
	cpx #$9C.b		; E0 9C
	adc $6C.b,S		; 63 6C
	sta ($9C.b,S),Y		; 93 9C
	adc $FC.b,S		; 63 FC
	ora $1C.b,S		; 03 1C
	sbc $1C.b,S		; E3 1C
	sbc $1C.b,S		; E3 1C
	sbc $00.b,S		; E3 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	bmi -49.b		; 30 CF
	bmi  -1.b		; 30 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3F6A1F.l,X		; FF 1F 6A 3F
	cmp [$3F.b],Y		; D7 3F
	pei ($3F.b)		; D4 3F
	pei ($3F.b)		; D4 3F
	cmp [$3F.b],Y		; D7 3F
	phx		; DA
	ora $731F6D.l,X		; 1F 6D 1F 73
	ora $3F3F1F.l,X		; 1F 1F 3F 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	inc $FE35.w,X		; FE 35 FE
	cmp ($FE.b,S),Y		; D3 FE
	plb		; AB
	inc $FE2B.w,X		; FE 2B FE
	stp		; DB
	inc $FE33.w,X		; FE 33 FE
	sbc $FE.b		; E5 FE
	sbc ($FE.b,S),Y		; F3 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	and $EA7FED.l,X		; 3F ED 7F EA
	adc $E87FE8.l,X		; 7F E8 7F E8
	adc $EA7FE9.l,X		; 7F E9 7F EA
	and $F33FE9.l,X		; 3F E9 3F F3
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	jsr ($FFA7.w,X)		; FC A7 FF
	sta [$FF.b],Y		; 97 FF
	eor [$FF.b],Y		; 57 FF
	eor [$FF.b],Y		; 57 FF
	eor [$FF.b],Y		; 57 FF
	cmp [$FC.b],Y		; D7 FC
	lda [$FC.b],Y		; B7 FC
	sta $FFFCFC.l		; 8F FC FC FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFCFC.l,X		; FF FC FC FC
	jsr ($D83F.w,X)		; FC 3F D8
	and $A47FD3.l,X		; 3F D3 7F A4
	adc $AA7FAA.l,X		; 7F AA 7F AA
	adc $D77FAB.l,X		; 7F AB 7F D7
	and $3F3FC8.l,X		; 3F C8 3F 3F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	and $37FC3F.l,X		; 3F 3F FC 37
	jsr ($FE93.w,X)		; FC 93 FE
	rtl		; 6B

	inc $FEB5.w,X		; FE B5 FE
	lda $FE.b,X		; B5 FE
	lda $FE.b,X		; B5 FE
	wai		; CB
	jsr ($FC37.w,X)		; FC 37 FC
	jsr ($FCFC.w,X)		; FC FC FC
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FCFC.w,X		; FE FC FC
	and $E93FEC.l,X		; 3F EC 3F E9
	adc $D57FCB.l,X		; 7F CB 7F D5
	adc $D67FD4.l,X		; 7F D4 7F D6
	and $E73FC8.l,X		; 3F C8 3F E7
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	jsr ($FC37.w,X)		; FC 37 FC
	sta [$FE.b],Y		; 97 FE
	cmp ($FE.b,S),Y		; D3 FE
	plb		; AB
	inc $FE2B.w,X		; FE 2B FE
	rtl		; 6B

	jsr ($FC13.w,X)		; FC 13 FC
	sbc [$FC.b]		; E7 FC
	jsr ($FCFC.w,X)		; FC FC FC
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FCFE.w,X		; FE FE FC
	jsr ($FCFC.w,X)		; FC FC FC
	asl $80.b,X		; 16 80
	bit $00.b,X		; 34 00
	cmp $FFBD22.l,X		; DF 22 BD FF
	cmp $FFF0FF.l,X		; DF FF F0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFF0FF.l		; EF FF F0 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	sbc $FFF0FF.l,X		; FF FF F0 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	ora ($00.b,S),Y		; 13 00
	beq  -1.b		; F0 FF
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	beq  -1.b		; F0 FF
	cop $40.b		; 02 40
	brk $00.b		; 00 00
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	cpx #$FF.b		; E0 FF
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	sbc $00000A.l,X		; FF 0A 00 00
	brk $12.b		; 00 12
	brk $E0.b		; 00 E0
	sbc $004006.l,X		; FF 06 40 00
	brk $02.b		; 00 02
	brk $E0.b		; 00 E0
	sbc $004008.l,X		; FF 08 40 00
	brk $DF.b		; 00 DF
	sbc $0CFFD0.l,X		; FF D0 FF 0C
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	sbc $0EFFD0.l,X		; FF D0 FF 0E
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $20FFD0.l,X		; FF D0 FF 20
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	brk $D0.b		; 00 D0
	sbc $00400C.l,X		; FF 0C 40 00
	brk $03.b		; 00 03
	brk $D0.b		; 00 D0
	sbc $00400E.l,X		; FF 0E 40 00
	brk $E2.b		; 00 E2
	sbc $22FFC0.l,X		; FF C0 FF 22
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $24FFC0.l,X		; FF C0 FF 24
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $C0.b		; 00 C0
	sbc $004022.l,X		; FF 22 40 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	sbc $004024.l,X		; FF 24 40 00
	brk $E9.b		; 00 E9
	sbc $26FFB0.l,X		; FF B0 FF 26
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $28FFB0.l,X		; FF B0 FF 28
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $B0.b		; 00 B0
	sbc $004026.l,X		; FF 26 40 00
	brk $3E.b		; 00 3E
	and $3D5F3E.l,X		; 3F 3E 5F 3D
	eor $3E5F3E.l,X		; 5F 3E 5F 3E
	eor $3E5F3D.l,X		; 5F 3D 5F 3E
	eor $014F3D.l		; 4F 3D 4F 01
	and $027F01.l,X		; 3F 01 7F 02
	sbc $01FF01.l,X		; FF 01 FF 01
	adc $017F02.l,X		; 7F 02 7F 01
	sbc $31FF02.l,X		; FF 02 FF 31
	sbc $4AFF10.l,X		; FF 10 FF 4A
	tda		; 7B
	and ($FF.b),Y		; 31 FF
	bpl  -1.b		; 10 FF
	lsr A		; 4A
	tda		; 7B
	bpl  -1.b		; 10 FF
	lsr A		; 4A
	tda		; 7B
	dec $EFFF.w		; CE FF EF
	sbc $CEFF31.l,X		; FF 31 FF CE
	sbc $31FFEF.l,X		; FF EF FF 31
	sbc $31FFEF.l,X		; FF EF FF 31
	sbc $E0FCF0.l,X		; FF F0 FC E0
	jsr ($FC68.w,X)		; FC 68 FC
	inx		; E8
	jsr ($FCE8.w,X)		; FC E8 FC
	pha		; 48
	sed		; F8
	iny		; C8
	sed		; F8
	pha		; 48
	sed		; F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $FE.b		; 00 FE
	bra  -2.b		; 80 FE
	bvs   0.b		; 70 00
	adc $003F0F.l,X		; 7F 0F 3F 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
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
	cpx #$03.b		; E0 03
	cpx #$03.b		; E0 03
	cmp ($03.b,X)		; C1 03
	sta ($03.b,X)		; 81 03
	ora ($03.b,X)		; 01 03
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	brk $07.b		; 00 07
	rts		; 60

	ora $E7609F.l,X		; 1F 9F 60 E7
	ora $FF07F8.l,X		; 1F F8 07 FF
	jsr ($0467.w,X)		; FC 67 04
	ora [$04.b]		; 07 04
	ora [$04.b]		; 07 04
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $00.b,S		; 03 00
	ora $F8.b,S		; 03 F8
	ora $F8.b,S		; 03 F8
	ora $F8.b,S		; 03 F8
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $009C00.l,X		; FF 00 9C 00
	rtl		; 6B

	adc $6B.b,S		; 63 6B
	adc $00.b,S		; 63 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $9C.b		; 00 9C
	adc $6B.b,S		; 63 6B
	pea $F46B.w		; F4 6B F4
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $00E700.l,X		; FF 00 E7 00
	tad		; 5B
	clc		; 18
	tad		; 5B
	clc		; 18
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $18E700.l,X		; FF 00 E7 18
	tad		; 5B
	ldy $5B.b		; A4 5B
	ldy $00.b		; A4 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $3F.b		; 00 3F
	cpy #$3F.b		; C0 3F
	dec $FF.b		; C6 FF
	asl $00.b		; 06 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FFF00.l,X		; FF 00 FF 1F
	cpx #$1F.b		; E0 1F
	cpx #$1D.b		; E0 1D
.INDEX 8
	sep #$1F		; E2 1F
	cpx #$00.b		; E0 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	clc		; 18
	sbc $FF0018.l,X		; FF 18 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FE01.w,X		; FE 01 FE
	ora ($EE.b,X)		; 01 EE
	ora ($FE.b),Y		; 11 FE
	ora ($00.b,X)		; 01 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $39.b		; 00 39
	cpy #$36.b		; C0 36
	dec $F6.b		; C6 F6
	asl $00.b		; 06 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3FFF00.l,X		; FF 00 FF 3F
	cpy #$39.b		; C0 39
	dec $36.b		; C6 36
	cmp #$36.b		; C9 36
	cmp #$07.b		; C9 07
	rol $390F.w,X		; 3E 0F 39
	ora $6B1F69.l,X		; 1F 69 1F 6B
	and $D43FD6.l,X		; 3F D6 3F D4
	and $D53FD5.l,X		; 3F D5 3F D5
	ora [$07.b]		; 07 07
	ora $1F1F0F.l		; 0F 0F 1F 1F
	ora $3F3F1F.l,X		; 1F 1F 3F 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $07FC3F.l,X		; 3F 3F FC 07
	inc $FFFB.w,X		; FE FB FF
	inc $FF.b		; E6 FF
	inc A		; 1A
	sbc $95FFE9.l,X		; FF E9 FF 95
	sbc $15FF55.l,X		; FF 55 FF 15
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $9F03FF.l,X		; FF FF 03 9F
	ora [$9E.b]		; 07 9E
	ora $FB0FF9.l		; 0F F9 0F FB
	sta $7A9F7A.l,X		; 9F 7A 9F 7A
	sta $7A9F7A.l,X		; 9F 7A 9F 7A
	ora $63.b,S		; 03 63
	ora [$67.b]		; 07 67
	ora $0F0F0F.l		; 0F 0F 0F 0F
	sta $9F9F9F.l,X		; 9F 9F 9F 9F
	sta $9F9F9F.l,X		; 9F 9F 9F 9F
	inc $FFFF.w,X		; FE FF FF
	ora [$FF.b]		; 07 FF
	sta $74FF.w		; 8D FF 74
	sbc $6AFF92.l,X		; FF 92 FF 6A
	sbc $0AFF4A.l,X		; FF 4A FF 0A
	inc $FFFE.w,X		; FE FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3F4F3F.l,X		; FF 3F 4F 3F
	ora $370F3F.l		; 0F 3F 0F 37
	ora [$14.b]		; 07 14
	tsb $17.b		; 04 17
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $003F00.l,X		; 7F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $7B0700.l		; 0F 00 07 7B
	tda		; 7B
	tda		; 7B
	tda		; 7B
	rti		; 40

	rti		; 40

	php		; 08
	php		; 08
	bmi  48.b		; 30 30
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	dey		; 88
	sed		; F8
	dey		; 88
	sed		; F8
	dey		; 88
	sed		; F8
	php		; 08
	sei		; 78
	php		; 08
	sec		; 38
	clc		; 18
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	ora [$04.b]		; 07 04
	ora $FF1F9C.l,X		; 1F 9C 1F FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	ora $7F3E7F.l,X		; 1F 7F 3E 7F
	ror $037F.w,X		; 7E 7F 03
	sed		; F8
	ora $E0.b,S		; 03 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	ora ($7F.b,X)		; 01 7F
	ora ($7F.b,X)		; 01 7F
	stz $FF00.w		; 9C 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F7FFFF.l,X		; FF FF FF F7
	sbc $9CFFF7.l,X		; FF F7 FF 9C
	adc $FF.b,S		; 63 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $08FF00.l,X		; FF 00 FF 08
	sbc $E7FF08.l,X		; FF 08 FF E7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	cpx #$F8.b		; E0 F8
	cpx #$F8.b		; E0 F8
	cpx #$F8.b		; E0 F8
	sbc [$18.b]		; E7 18
	sbc $F80700.l,X		; FF 00 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cmp $DF26.w,Y		; D9 26 DF
	jsr $20DF.w		; 20 DF 20
	sbc $00FF1F.l,X		; FF 1F FF 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	ora $1FE0.w,Y		; 19 E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$00.b		; E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FE19E6.l,X		; FF E6 19 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	inc $00FF.w,X		; FE FF 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $01.b		; E6 01
	inc $FE01.w,X		; FE 01 FE
	ora ($00.b,X)		; 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00F9.l,X		; FF F9 00 FF
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora [$C1.b]		; 07 C1
	ora [$C1.b]		; 07 C1
	ora [$C1.b]		; 07 C1
	ora [$39.b]		; 07 39
	dec $3F.b		; C6 3F
	cpy #$38.b		; C0 38
	cmp [$38.b]		; C7 38
	cmp [$38.b]		; C7 38
	cmp [$00.b]		; C7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3FD63F.l,X		; FF 3F D6 3F
	stp		; DB
	ora $731F6C.l,X		; 1F 6C 1F 73
	ora $3F0738.l		; 0F 38 07 3F
	ora ($1F.b,X)		; 01 1F
	brk $07.b		; 00 07
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $07070F.l		; 0F 0F 07 07
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	sbc $19FFED.l,X		; FF ED FF 19
	sbc $F9FFF2.l,X		; FF F2 FF F9
	inc $FC07.w,X		; FE 07 FC
	sbc $00FEF0.l,X		; FF F0 FE 00
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FCFE.w,X		; FE FE FC
	jsr ($F1F0.w,X)		; FC F0 F1
	brk $07.b		; 00 07
	sta $7A9F7A.l,X		; 9F 7A 9F 7A
	ora $FC0FFA.l		; 0F FA 0F FC
	ora [$9E.b]		; 07 9E
	ora $1F.b,S		; 03 1F
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	sta $9F9F9F.l,X		; 9F 9F 9F 9F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora [$67.b]		; 07 67
	ora $E3.b,S		; 03 E3
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	sbc $9AFF6A.l,X		; FF 6A FF 9A
	sbc $F1FF76.l,X		; FF 76 FF F1
	sbc $FFFE03.l,X		; FF 03 FE FF
	sed		; F8
	sbc $FFFC00.l,X		; FF 00 FC FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8FEFE.l,X		; FF FE FE F8
	sed		; F8
	brk $03.b		; 00 03
	ora [$FF.b]		; 07 FF
	ora $FB9FFE.l		; 0F FE 9F FB
	sta $F4FFF2.l,X		; 9F F2 FF F4
	sbc $F5FFF5.l,X		; FF F5 FF F5
	sbc $0707F5.l,X		; FF F5 07 07
	ora $9F9F0F.l		; 0F 0F 9F 9F
	sta $FFFF9F.l,X		; 9F 9F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFCFF.l,X		; FF FF FC FF
	inc $FF07.w,X		; FE 07 FF
	ora $EDFF.w,Y		; 19 FF ED
	sbc $65FF95.l,X		; FF 95 FF 65
	sbc $05FF25.l,X		; FF 25 FF 05
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0300FF.l,X		; FF FF 00 03
	ora ($06.b,X)		; 01 06
	ora ($06.b,X)		; 01 06
	ora $0D.b,S		; 03 0D
	ora $0D.b,S		; 03 0D
	ora $0D.b,S		; 03 0D
	ora $0D.b,S		; 03 0D
	ora $0D.b,S		; 03 0D
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	sbc $C0FF7F.l,X		; FF 7F FF C0
	sbc $21FF9E.l,X		; FF 9E FF 21
	sbc $52FF5E.l,X		; FF 5E FF 52
	sbc $5EFF52.l,X		; FF 52 FF 5E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpx #$9C.b		; E0 9C
	beq -35.b		; F0 DD
	beq  77.b		; F0 4D
	sed		; F8
	lda $F8B7F8.l		; AF F8 B7 F8
	cmp [$F8.b],Y		; D7 F8
	cmp [$F8.b],Y		; D7 F8
	cmp [$E0.b],Y		; D7 E0
	cpx #$F0.b		; E0 F0
	beq -16.b		; F0 F0
	beq  -8.b		; F0 F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	and $D87FE7.l,X		; 3F E7 7F D8
	adc $97FFD3.l,X		; 7F D3 FF 97
	sbc $ABFFAC.l,X		; FF AC FF AB
	sbc $ACFFA8.l,X		; FF A8 FF AC
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F5FFF5.l,X		; FF F5 FF F5
	sta $F89FF6.l,X		; 9F F6 9F F8
	ora $9F07FC.l		; 0F FC 07 9F
	ora ($0F.b,X)		; 01 0F
	brk $03.b		; 00 03
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta $9F9F9F.l,X		; 9F 9F 9F 9F
	ora $67070F.l		; 0F 0F 07 67
	ora ($F1.b,X)		; 01 F1
	brk $FC.b		; 00 FC
	sbc $95FF65.l,X		; FF 65 FF 95
	sbc $F3FFE5.l,X		; FF E5 FF F3
	inc $FC07.w,X		; FE 07 FC
	sbc $00FFF0.l,X		; FF F0 FF 00
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	jsr ($F0FC.w,X)		; FC FC F0
	beq   0.b		; F0 00
	ora $03.b,S		; 03 03
	asl $01.b		; 06 01
	asl $01.b		; 06 01
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora $03FF0F.l,X		; 1F 0F FF 03
	ora $01.b,S		; 03 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $FFBFFF.l		; 0F FF BF FF
	rti		; 40

	sbc $80FF3F.l,X		; FF 3F FF 80
	adc $FF1FFF.l,X		; 7F FF 1F FF
	brk $FF.b		; 00 FF
	bra  -8.b		; 80 F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $1F1F7F.l,X		; 7F 7F 1F 1F
	brk $00.b		; 00 00
	bra -121.b		; 80 87
	sed		; F8
	and $F0DFF0.l		; 2F F0 DF F0
	sta $78E0.w,X		; 9D E0 78
	cpy #$F0.b		; C0 F0
	brk $EF.b		; 00 EF
	brk $BF.b		; 00 BF
	ora [$7F.b]		; 07 7F
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	beq -14.b		; F0 F2
	cpx #$E7.b		; E0 E7
	cpy #$CF.b		; C0 CF
	brk $10.b		; 00 10
	brk $40.b		; 00 40
	ora [$87.b]		; 07 87
	adc $CF7F90.l,X		; 7F 90 7F CF
	adc $F03FE0.l,X		; 7F E0 3F F0
	ora $FF07FF.l,X		; 1F FF 07 FF
	brk $FF.b		; 00 FF
	cpy #$FC.b		; C0 FC
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	ora $07071F.l,X		; 1F 1F 07 07
	brk $00.b		; 00 00
	cpy #$C3.b		; C0 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $8F7FFF.l		; 0F FF 7F 8F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $7F7F0F.l		; 0F 0F 7F 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	bra  -8.b		; 80 F8
	beq -116.b		; F0 8C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora [$7F.b]		; 07 7F
	ora $0000F0.l,X		; 1F F0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	ora $00001F.l,X		; 1F 1F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	bra  -8.b		; 80 F8
	cpx #$3C.b		; E0 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpx #$E0.b		; E0 E0
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	plx		; FA
	ora [$F1.b]		; 07 F1
	sbc $F1FFFA.l,X		; FF FA FF F1
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F1.b		; 00 F1
	sbc $000001.l,X		; FF 01 00 00
	brk $FB.b		; 00 FB
	sbc $02FFF9.l,X		; FF F9 FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $02FFF9.l,X		; FF F9 FF 02
	rti		; 40

	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra 127.b		; 80 7F
	and $00BF80.l,X		; 3F 80 BF 00
	brk $40.b		; 00 40
	and $47087F.l,X		; 3F 7F 08 47
	php		; 08
	bvs   0.b		; 70 00
	rti		; 40

	and $BF40C0.l,X		; 3F C0 40 BF
	rti		; 40

	lda $40007F.l,X		; BF 7F 00 40
	and $403F40.l,X		; 3F 40 3F 40
	and $040800.l,X		; 3F 00 08 04
	sed		; F8
	beq  68.b		; F0 44
	ldy $40.b,X		; B4 40
	brk $08.b		; 00 08
	beq  -8.b		; F0 F8
	rti		; 40

	dey		; 88
	rti		; 40

	sec		; 38
	brk $08.b		; 00 08
	beq  12.b		; F0 0C
	pha		; 48
	pea $F408.w		; F4 08 F4
	sed		; F8
	brk $08.b		; 00 08
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	beq  16.b		; F0 10
	sta $00E070.l		; 8F 70 E0 00
	sbc $0000C6.l		; EF C6 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	adc $F07F80.l,X		; 7F 80 7F F0
	brk $EF.b		; 00 EF
	bpl   0.b		; 10 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $04.b		; 00 04
	bra  12.b		; 80 0C
	brk $F6.b		; 00 F6
	phd		; 0B
	nop		; EA
	sbc $EAFFF6.l,X		; FF F6 FF EA
	sbc $000000.l,X		; FF 00 00 00
	brk $06.b		; 00 06
	brk $EA.b		; 00 EA
	sbc $000002.l,X		; FF 02 00 00
	brk $F8.b		; 00 F8
	sbc $04FFFA.l,X		; FF FA FF 04
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $04FFFA.l,X		; FF FA FF 04
	rti		; 40

	brk $00.b		; 00 00
	brk $20.b		; 00 20
	ora $3F8020.l		; 0F 20 80 3F
	sta $609F60.l,X		; 9F 60 9F 60
	ora $3F0020.l,X		; 1F 20 00 3F
	brk $3F.b		; 00 3F
	brk $20.b		; 00 20
	ora $A01F20.l		; 0F 20 1F A0
	jsr $20DF.w		; 20 DF 20
	cmp $3F5F20.l,X		; DF 20 5F 3F
	brk $20.b		; 00 20
	ora $FF0000.l,X		; 1F 00 00 FF
	brk $00.b		; 00 00
	sbc $DF03DF.l,X		; FF DF 03 DF
	ora $DF.b,S		; 03 DF
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $C01000.l,X		; FF 00 10 C0
	bpl   4.b		; 10 04
	beq -28.b		; F0 E4
	clc		; 18
	cpx $18.b		; E4 18
	cpx #$10.b		; E0 10
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $10.b		; 00 10
	cpy #$10.b		; C0 10
	cpx #$14.b		; E0 14
	bpl -20.b		; 10 EC
	bpl -20.b		; 10 EC
	bpl -24.b		; 10 E8
	beq   0.b		; F0 00
	bpl -32.b		; 10 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1C.b,S		; E3 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00E300.l,X		; FF 00 E3 00
	sbc $FC0000.l,X		; FF 00 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($0E.b),Y		; F1 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00F100.l,X		; FF 00 F1 00
	sbc $0F0000.l,X		; FF 00 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $20.b		; 02 20
	cop $3D.b		; 02 3D
	cop $20.b		; 02 20
	cop $3C.b		; 02 3C
	cop $20.b		; 02 20
	asl $34.b,X		; 16 34
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	jsr $201F.w		; 20 1F 20
	ora $201F20.l,X		; 1F 20 1F 20
	ora $201F20.l,X		; 1F 20 1F 20
	ora $3F1F20.l,X		; 1F 20 1F 3F
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	inc $0001.w,X		; FE 01 00
	lda $B4.b,X		; B5 B4
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $100000.l,X		; FF 00 00 10
	brk $F0.b		; 00 F0
	brk $10.b		; 00 10
	brk $F0.b		; 00 F0
	brk $10.b		; 00 10
	ldy #$B0.b		; A0 B0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	bpl -32.b		; 10 E0
	bpl -32.b		; 10 E0
	bpl -32.b		; 10 E0
	bpl -32.b		; 10 E0
	bpl -32.b		; 10 E0
	bpl -32.b		; 10 E0
	bpl -32.b		; 10 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	cop $00.b		; 02 00
	plx		; FA
	ora [$F2.b]		; 07 F2
	sbc $F2FFFA.l,X		; FF FA FF F2
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $004000.l,X		; FF 00 40 00
	brk $FA.b		; 00 FA
	sbc $01FFFA.l,X		; FF FA FF 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $004001.l,X		; FF 01 40 00
	brk $00.b		; 00 00
	tas		; 1B
	tas		; 1B
	and [$3B.b],Y		; 37 3B
	mvn $6F,$04		; 54 04 6F
	adc $F06FB0.l		; 6F B0 6F F0
	stz $EF.b		; 64 EF
	sbc $00007F.l,X		; FF 7F 00 00
	tas		; 1B
	tas		; 1B
	tsa		; 3B
	tsa		; 3B
	tsb $14.b		; 04 14
	adc $6F6F6F.l		; 6F 6F 6F 6F
	stz $74.b		; 64 74
	brk $FF.b		; 00 FF
	eor $F8070B.l		; 4F 0B 07 F8
	sta [$7B.b],Y		; 97 7B
	bcc 112.b		; 90 70
	cpx #$70.b		; E0 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phk		; 4B
	ldy $00.b,X		; B4 00
	sbc $60FF60.l,X		; FF 60 FF 60
	sbc $00F800.l,X		; FF 00 F8 00
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b,S		; 03 80
	php		; 08
	brk $F7.b		; 00 F7
	asl A		; 0A
	cpx $F7FF.w		; EC FF F7
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $00FFF0.l,X		; FF F0 FF 00
	rti		; 40

	brk $00.b		; 00 00
	sbc $E0FF.w,Y		; F9 FF E0
	sbc $000002.l,X		; FF 02 00 00
	brk $0C.b		; 00 0C
	asl $6B11.w,X		; 1E 11 6B
	tda		; 7B
	cmp $7B.b,X		; D5 7B
	stz $F57B.w		; 9C 7B F5
	and ($7B.b),Y		; 31 7B
	sbc $C0FF00.l,X		; FF 00 FF C0
	tsb $110D.w		; 0C 0D 11
	ora $7B.b,X		; 15 7B
	tda		; 7B
	tda		; 7B
	tda		; 7B
	tda		; 7B
	tda		; 7B
	and ($35.b),Y		; 31 35
	brk $FF.b		; 00 FF
	rol $6301.w,X		; 3E 01 63
	sbc [$98.b],Y		; F7 98
	sbc $6AFD.w,X		; FD FD 6A
	sbc $FDF3.w,X		; FD F3 FD
	ror A		; 6A
	tya		; 98
	sbc $00FF.w,X		; FD FF 00
	sbc $6B6300.l,X		; FF 00 63 6B
	tya		; 98
	txs		; 9A
	sbc $FDFD.w,X		; FD FD FD
	sbc $FDFD.w,X		; FD FD FD
	tya		; 98
	txs		; 9A
	brk $FF.b		; 00 FF
	sbc [$08.b],Y		; F7 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $00.b		; 25 00
	ora ($FE.b,X)		; 01 FE
	eor $447E.w,X		; 5D 7E 44
	dec $DC40.w,X		; DE 40 DC
	cli		; 58
	jmp $001410.l		; 5C 10 14 00
	brk $24.b		; 00 24
	stp		; DB
	brk $FF.b		; 00 FF
	jsr $187F.w		; 20 7F 18
	sbc $00FF18.l,X		; FF 18 FF 00
	ror $7E00.w,X		; 7E 00 7E
	brk $7E.b		; 00 7E
	plx		; FA
	brk $F8.b		; 00 F8
	sbc [$0B.b],Y		; F7 0B
	ora [$F2.b]		; 07 F2
	ora [$00.b]		; 07 00
	ora $01.b,S		; 03 01
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	brk $F2.b		; 00 F2
	ora $FF00.w		; 0D 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	and ($6A.b),Y		; 31 6A
	tda		; 7B
	sty $7B.b		; 84 7B
	sta [$00.b]		; 87 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	and ($7B.b),Y		; 31 7B
	tda		; 7B
	tda		; 7B
	tda		; 7B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	sty $DE56.w		; 8C 56 DE
	and ($DE.b,X)		; 21 DE
	sbc ($00.b,X)		; E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	sty $DEDE.w		; 8C DE DE
	dec $18DE.w,X		; DE DE 18
	brk $00.b		; 00 00
	lda $48.b		; A5 48
	ora ($00.b)		; 12 00
	ora #$B8.b		; 09 B8
	ora ($00.b,S),Y		; 13 00
	ora #$28.b		; 09 28
	ora $00.b,X		; 15 00
	ora #$98.b		; 09 98
	asl $00.b,X		; 16 00
	ora #$08.b		; 09 08
	clc		; 18
	brk $0C.b		; 00 0C
	and $80.b		; 25 80
	dey		; 88
	brk $A8.b		; 00 A8
	eor [$CD.b],Y		; 57 CD
	sbc $E3FFA8.l,X		; FF A8 FF E3
	sbc $000000.l,X		; FF 00 00 00
	brk $A8.b		; 00 A8
	sbc $02FFF3.l,X		; FF F3 FF 02
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	sbc $04FFDD.l,X		; FF DD FF 04
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	sbc $06FFED.l,X		; FF ED FF 06
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	sbc $08FFFD.l,X		; FF FD FF 08
	brk $00.b		; 00 00
	brk $C8.b		; 00 C8
	sbc $0AFFD6.l,X		; FF D6 FF 0A
	brk $00.b		; 00 00
	brk $C8.b		; 00 C8
	sbc $0CFFE6.l,X		; FF E6 FF 0C
	brk $00.b		; 00 00
	brk $C8.b		; 00 C8
	sbc $0EFFF6.l,X		; FF F6 FF 0E
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	sbc $20FFD0.l,X		; FF D0 FF 20
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	sbc $22FFE0.l,X		; FF E0 FF 22
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	sbc $24FFF0.l,X		; FF F0 FF 24
	brk $00.b		; 00 00
	brk $E8.b		; 00 E8
	sbc $26FFCD.l,X		; FF CD FF 26
	brk $00.b		; 00 00
	brk $E8.b		; 00 E8
	sbc $28FFDD.l,X		; FF DD FF 28
	brk $00.b		; 00 00
	brk $E8.b		; 00 E8
	sbc $2AFFED.l,X		; FF ED FF 2A
	brk $00.b		; 00 00
	brk $E8.b		; 00 E8
	sbc $08FFFD.l,X		; FF FD FF 08
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $2CFFCD.l,X		; FF CD FF 2C
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $2EFFDD.l,X		; FF DD FF 2E
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $40FFED.l,X		; FF ED FF 40
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $08FFFD.l,X		; FF FD FF 08
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $CD.b		; 00 CD
	sbc $000042.l,X		; FF 42 00 00
	brk $08.b		; 00 08
	brk $DD.b		; 00 DD
	sbc $000044.l,X		; FF 44 00 00
	brk $08.b		; 00 08
	brk $ED.b		; 00 ED
	sbc $000046.l,X		; FF 46 00 00
	brk $08.b		; 00 08
	brk $FD.b		; 00 FD
	sbc $000008.l,X		; FF 08 00 00
	brk $18.b		; 00 18
	brk $CE.b		; 00 CE
	sbc $000048.l,X		; FF 48 00 00
	brk $18.b		; 00 18
	brk $DE.b		; 00 DE
	sbc $00004A.l,X		; FF 4A 00 00
	brk $18.b		; 00 18
	brk $EE.b		; 00 EE
	sbc $00004C.l,X		; FF 4C 00 00
	brk $18.b		; 00 18
	brk $FE.b		; 00 FE
	sbc $00004E.l,X		; FF 4E 00 00
	brk $28.b		; 00 28
	brk $CF.b		; 00 CF
	sbc $000060.l,X		; FF 60 00 00
	brk $28.b		; 00 28
	brk $DF.b		; 00 DF
	sbc $000062.l,X		; FF 62 00 00
	brk $28.b		; 00 28
	brk $EF.b		; 00 EF
	sbc $000064.l,X		; FF 64 00 00
	brk $28.b		; 00 28
	brk $FF.b		; 00 FF
	sbc $000066.l,X		; FF 66 00 00
	brk $38.b		; 00 38
	brk $D1.b		; 00 D1
	sbc $000068.l,X		; FF 68 00 00
	brk $38.b		; 00 38
	brk $E1.b		; 00 E1
	sbc $00006A.l,X		; FF 6A 00 00
	brk $38.b		; 00 38
	brk $F1.b		; 00 F1
	sbc $00006C.l,X		; FF 6C 00 00
	brk $48.b		; 00 48
	brk $D2.b		; 00 D2
	sbc $00006E.l,X		; FF 6E 00 00
	brk $48.b		; 00 48
	brk $E2.b		; 00 E2
	sbc $000080.l,X		; FF 80 00 00
	brk $48.b		; 00 48
	brk $FA.b		; 00 FA
	sbc $000082.l,X		; FF 82 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora $08.b,S		; 03 08
	ora $380000.l		; 0F 00 00 38
	eor $000070.l,X		; 5F 70 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  48.b		; 10 30
	ora $7F0060.l		; 0F 60 00 7F
	brk $02.b		; 00 02
	ora $10.b,S		; 03 10
	ora $3EFF87.l,X		; 1F 87 FF 3E
	inc $F0F0.w,X		; FE F0 F0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $FF0000.l		; 0F 00 00 FF
	brk $00.b		; 00 00
	sbc $2F0C00.l,X		; FF 00 0C 2F
	jsr $2000.w		; 20 00 20
	brk $3F.b		; 00 3F
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	ora ($00.b,X)		; 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $03.b		; 02 03
	bpl  31.b		; 10 1F
	eor [$7F.b]		; 47 7F
	trb $F0FC.w		; 1C FC F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	brk $02.b		; 00 02
	ora $11.b,S		; 03 11
	ora $387F4F.l,X		; 1F 4F 7F 38
	sed		; F8
	cpx #$E0.b		; E0 E0
	sta $83.b,S		; 83 83
	clc		; 18
	ora $7F20.w,Y		; 19 20 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $007F00.l,X		; 1F 00 7F 00
	sed		; F8
	ora [$E0.b]		; 07 E0
	ora $C00700.l,X		; 1F 00 07 C0
	ora [$E0.b]		; 07 E0
	ora [$00.b]		; 07 00
	ora [$E0.b]		; 07 E0
	sbc [$C0.b]		; E7 C0
	cmp [$00.b]		; C7 00
	ora [$00.b]		; 07 00
	ora [$F0.b]		; 07 F0
	ora $F00FF0.l		; 0F F0 0F F0
	ora $100FF0.l		; 0F F0 0F 10
	ora $F00F30.l		; 0F 30 0F F0
	ora $000FF0.l		; 0F F0 0F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
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
	ora $01.b,S		; 03 01
	ora ($0F.b,X)		; 01 0F
	ora $007F78.l		; 0F 78 7F 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $02.b,S		; 03 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $43.b		; 00 43
	and $CF18.w,X		; 3D 18 CF
	sbc [$1F.b],Y		; F7 1F
	sta $FD7EFF.l		; 8F FF 7E FD
	trb $00FF.w		; 1C FF 00
	brk $07.b		; 00 07
	ora [$C2.b]		; 07 C2
	inc $F030.w,X		; FE 30 F0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	cop $01.b		; 02 01
	brk $03.b		; 00 03
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	php		; 08
	jsr ($FC04.w,X)		; FC 04 FC
	brk $FA.b		; 00 FA
	cop $FE.b		; 02 FE
	brk $FD.b		; 00 FD
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FE.b		; 00 FE
	ora $F807F0.l		; 0F F0 07 F8
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
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
	bpl  -4.b		; 10 FC
	bpl -36.b		; 10 DC
	jsr $00B8.w		; 20 B8 00
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($FC20.w,X)		; FC 20 FC
	rti		; 40

	sed		; F8
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	bra -96.b		; 80 A0
	cpy #$DF.b		; C0 DF
	cpx #$6F.b		; E0 6F
	bvs  55.b		; 70 37
	sec		; 38
	bpl  24.b		; 10 18
	ora [$1F.b],Y		; 17 1F
	ora [$1F.b],Y		; 17 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	and $001F00.l,X		; 3F 00 1F 00
	clc		; 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF87.l,X		; FF 87 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $003F00.l		; 0F 00 3F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $003F00.l		; 0F 00 3F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   1.b		; 80 01
	ora ($02.b,X)		; 01 02
	cop $00.b		; 02 00
	ora ($04.b,X)		; 01 04
	sbc $04.b,X		; F5 04
	ora [$00.b]		; 07 00
	ora $08.b,S		; 03 08
	phd		; 0B
	adc $00FF00.l,X		; 7F 00 FF 00
	inc $0001.w,X		; FE 01 00
	sbc $FC030C.l,X		; FF 0C 03 FC
	ora $F8.b,S		; 03 F8
	ora [$F8.b]		; 07 F8
	ora [$40.b]		; 07 40
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $F0.b,S		; 03 F0
	sbc ($00.b),Y		; F1 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F00BF0.l,X		; FF F0 0B F0
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FC.b		; 00 FC
	sbc $00F901.l,X		; FF 01 F9 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	cmp $FA.b,S		; C3 FA
	sbc $1AFB.w,Y		; F9 FB 1A
	tas		; 1B
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	bra -64.b		; 80 C0
	rti		; 40

	rts		; 60

	jsr $01F0.w		; 20 F0 01
	tsb $00.b		; 04 00
	tsb $E0.b		; 04 E0
	tsb $FA.b		; 04 FA
	tsb $FD.b		; 04 FD
	cop $FE.b		; 02 FE
	ora ($7F.b,X)		; 01 7F
	bra  63.b		; 80 3F
	cpy #$00.b		; C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE08.w,X		; FE 08 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $017F00.l		; 0F 00 7F 01
	sed		; F8
	ora $003FE7.l		; 0F E7 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($07.b,X)		; 01 07
	ora [$3E.b]		; 07 3E
	rol $F0F0.w,X		; 3E F0 F0
	cpy #$C0.b		; C0 C0
	ora ($00.b,X)		; 01 00
	ora $017F00.l		; 0F 00 7F 01
	sed		; F8
	ora $1F3FE7.l		; 0F E7 3F 1F
	inc $F0F8.w,X		; FE F8 F0
	cpx #$C0.b		; E0 C0
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	rol $F03E.w,X		; 3E 3E F0
	beq -64.b		; F0 C0
	cpy #$01.b		; C0 01
	brk $08.b		; 00 08
	brk $20.b		; 00 20
	brk $FF.b		; 00 FF
	sbc $BFFF7F.l,X		; FF 7F FF BF
	sbc $617FDC.l,X		; FF DC 7F 61
	and $001E1E.l,X		; 3F 1E 1E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	bra -95.b		; 80 A1
	rti		; 40

	lda $20DF40.l,X		; BF 40 DF 20
	sbc $FFF8FF.l,X		; FF FF F8 FF
	sta $FF.b,S		; 83 FF
	rts		; 60

	cpx #$80.b		; E0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	bra  -1.b		; 80 FF
	bra -64.b		; 80 C0
	bra -29.b		; 80 E3
	sta $FF.b,S		; 83 FF
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	asl $00FF.w		; 0E FF 00
	sbc $00FC00.l,X		; FF 00 FC 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	rol $F801.w,X		; 3E 01 F8
	ora $1E3FE7.l		; 0F E7 3F 1E
	jsr ($F0F8.w,X)		; FC F8 F0
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	asl $F01E.w,X		; 1E 1E F0
	beq -64.b		; F0 C0
	cpy #$02.b		; C0 02
	brk $08.b		; 00 08
	brk $40.b		; 00 40
	brk $F8.b		; 00 F8
	sbc $1F7FC1.l,X		; FF C1 7F 1F
	sbc $C0FCFE.l,X		; FF FE FC C0
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $02.b		; 00 02
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $30FF80.l,X		; FF 80 FF 30
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	sbc $00F818.l,X		; FF 18 F8 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	and $FF0000.l,X		; 3F 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	sbc $70FF80.l,X		; FF 80 FF 70
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	sbc $00FF07.l,X		; FF 07 FF 00
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
	brk $2F.b		; 00 2F
	cmp $E0F8DC.l,X		; DF DC F8 E0
	cpx #$B0.b		; E0 B0
	jmp $00EC10.l		; 5C 10 EC 00
	jsr ($FC00.w,X)		; FC 00 FC
	dey		; 88
	beq  32.b		; F0 20
	bpl   4.b		; 10 04
	bmi  16.b		; 30 10
	bmi -128.b		; 30 80
	jmp ($FC00.w,X)		; 7C 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	ora $008070.l		; 0F 70 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $03.b,S		; 03 03
	adc $00807F.l,X		; 7F 7F 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	jmp ($8000.w,X)		; 7C 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -33.b		; 80 DF
	jsr $20DF.w		; 20 DF 20
	sbc $10EF10.l		; EF 10 EF 10
	sbc $10EF10.l		; EF 10 EF 10
	sbc $11EE10.l		; EF 10 EE 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($0303.w,X)		; FC 03 03
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $1F.b		; 00 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $FF00FF.l		; 0F FF 00 FF
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
	ora $FC.b,S		; 03 FC
	sbc $FF00FF.l,X		; FF FF 00 FF
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $3F.b		; 00 3F
	and $00FFFF.l,X		; 3F FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $3F.b		; 00 3F
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
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
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $070707.l,X		; FF 07 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	cpy #$80.b		; C0 80
	sbc $8FFFFF.l,X		; FF FF FF 8F
	sbc $F19F83.l,X		; FF 83 9F F1
	sta [$B8.b]		; 87 B8
	sta $3E.b,S		; 83 3E
	sta $00.b,S		; 83 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $7C.b		; 00 7C
	rts		; 60

	ror $7F78.w,X		; 7E 78 7F
	jmp ($7E7D.w,X)		; 7C 7D 7E
	brk $FB.b		; 00 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $F7.b		; 04 F7
	php		; 08
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	brk $FF.b		; 00 FF
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
	sbc $201F00.l,X		; FF 00 1F 20
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	and $00FFC0.l,X		; 3F C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc [$08.b],Y		; F7 08
	jsr ($000C.w,X)		; FC 0C 00
	brk $FE.b		; 00 FE
	inc $00FF.w,X		; FE FF 00
	sbc $03FC00.l,X		; FF 00 FC 03
	sbc $07F800.l,X		; FF 00 F8 07
	jsr ($FF03.w,X)		; FC 03 FF
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	inc $FFFC.w,X		; FE FC FF
	sbc $BF40FF.l,X		; FF FF 40 BF
	bcs -48.b		; B0 D0
	cmp $F76EEF.l,X		; DF EF 6E F7
	and ($FD.b,S),Y		; 33 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $402F80.l,X		; 7F 80 2F 40
	bpl  32.b		; 10 20
	dey		; 88
	bpl -62.b		; 10 C2
	tsb $0000.w		; 0C 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	ora $FFFF00.l		; 0F 00 FF FF
	sbc $FF80FF.l,X		; FF FF 80 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$10.b],Y		; F7 10
	ora [$00.b]		; 07 00
	cmp $808F40.l		; CF 40 8F 80
	ora $007F00.l,X		; 1F 00 7F 00
	sbc $000000.l,X		; FF 00 00 00
	ora $E01FE0.l,X		; 1F E0 1F E0
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($FF01.w,X)		; FC 01 FF
	ora ($FD.b,X)		; 01 FD
	ora ($FF.b,X)		; 01 FF
	ora ($FD.b,X)		; 01 FD
	ora ($E8.b,X)		; 01 E8
	brk $84.b		; 00 84
	brk $02.b		; 00 02
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $0000FF.l,X		; FF FF 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000205.l,X		; FF 05 02 00
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$03.b]		; 07 03
	ora $FB.b,S		; 03 FB
	xce		; FB
	xce		; FB
	xce		; FB
	xce		; FB
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $01.b		; 04 01
	sta ($00.b,X)		; 81 00
	bra -127.b		; 80 81
	sta ($FE.b,X)		; 81 FE
	inc $8181.w,X		; FE 81 81
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7EFF.l,X		; FF FF 7E 7F
	adc $7F7E7F.l,X		; 7F 7F 7E 7F
	ora ($7E.b,X)		; 01 7E
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	cmp $F7DF00.l,X		; DF 00 DF F7
	php		; 08
	sbc [$08.b],Y		; F7 08
	beq  15.b		; F0 0F
	sbc [$08.b],Y		; F7 08
	sbc $10EF10.l		; EF 10 EF 10
	cmp $20DF20.l,X		; DF 20 DF 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FE01FF.l,X		; FF FF 01 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $0001.w,X		; FE 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $CEFF98.l,X		; FF 98 FF CE
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0FF00.l,X		; FF 00 FF C0
	cpy #$60.b		; C0 60
	sta [$30.b]		; 87 30
	cmp ($FF.b,X)		; C1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $F0.b		; 00 F0
	adc $008000.l,X		; 7F 00 80 00
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $0CFFF8.l,X		; FF F8 FF 0C
	jsr ($0000.w,X)		; FC 00 00
	bra   0.b		; 80 00
	adc $008080.l,X		; 7F 80 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc [$F0.b],Y		; F7 F0
	sbc [$10.b],Y		; F7 10
	sta [$80.b]		; 87 80
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF01.l,X		; FF 01 FF 00
	ora $708FE0.l,X		; 1F E0 8F 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	jsr ($FE01.w,X)		; FC 01 FE
	ora ($FC.b,X)		; 01 FC
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $57.b		; 00 57
	bvc  -1.b		; 50 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra   0.b		; 80 00
	sbc $FFFF01.l,X		; FF 01 FF FF
	brk $C0.b		; 00 C0
	cmp ($FF.b,X)		; C1 FF
	sbc $E0FF3F.l,X		; FF 3F FF E0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $3E.b		; 00 3E
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	cpx #$80.b		; E0 80
	sbc $3F0FFE.l,X		; FF FE 0F 3F
	cpy #$87.b		; C0 87
	jsr ($FFE0.w,X)		; FC E0 FF
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	and $7807C0.l,X		; 3F C0 07 78
	brk $1F.b		; 00 1F
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cop $06.b		; 02 06
	brk $0B.b		; 00 0B
	jsr $0117.w		; 20 17 01
	and $FFBF02.l		; 2F 02 BF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($F8.b,X)		; 01 F8
	ora [$F0.b]		; 07 F0
	ora $801FE0.l		; 0F E0 1F 80
	adc $100F01.l,X		; 7F 01 0F 10
	adc ($80.b,S),Y		; 73 80
	sta $007F00.l,X		; 9F 00 7F 00
	sbc $80FF20.l,X		; FF 20 FF 80
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $F0.b		; 00 F0
	ora $007F80.l		; 0F 80 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $001F00.l,X		; 3F 00 1F 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $001F00.l,X		; 3F 00 1F 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $000000.l,X		; FF 00 00 00
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
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $E0FF03.l,X		; FF 03 FF E0
	sbc $CF1FE7.l,X		; FF E7 1F CF
	and $FFFF3F.l,X		; 3F 3F FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40FF00.l,X		; FF 00 FF 40
	rts		; 60

	jsr $10B0.w		; 20 B0 10
	cld		; D8
	php		; 08
	inx		; E8
	brk $F4.b		; 00 F4
	brk $F8.b		; 00 F8
	tsb $FC.b		; 04 FC
	ora [$FC.b]		; 07 FC
	adc $C03F80.l,X		; 7F 80 3F C0
	ora $F00FE0.l,X		; 1F E0 0F F0
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FD.b,X)		; 01 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	cop $FF.b		; 02 FF
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	rti		; 40

	beq -128.b		; F0 80
	beq -128.b		; F0 80
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	jsr ($F800.w,X)		; FC 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	cpx #$E0.b		; E0 E0
	ora $FFFFFF.l,X		; 1F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpy #$E0.b		; C0 E0
	cpx #$D0.b		; E0 D0
	inx		; E8
	cld		; D8
	beq -24.b		; F0 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $3000.w		; 20 00 30
	bpl  56.b		; 10 38
	clc		; 18
	clc		; 18
	php		; 08
	brk $3F.b		; 00 3F
	and $FFFFFF.l,X		; 3F FF FF FF
	inc $01FF.w,X		; FE FF 01
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $80F800.l,X		; FF 00 F8 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	adc $007F04.l,X		; 7F 04 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $000700.l		; 0F 00 07 00
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000F00.l,X		; FF 00 0F 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FE.b		; 00 FE
	inc $FF01.w,X		; FE 01 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($FE.b,X)		; 01 FE
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FA.b,X)		; 01 FA
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	php		; 08
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $013F3F.l,X		; FF 3F 3F 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F4.b		; 00 F4
	cpx $F4FC.w		; EC FC F4
	sed		; F8
	pea $F2FE.w		; F4 FE F2
	jmp ($787A.w,X)		; 7C 7A 78
	ror $7678.w,X		; 7E 78 76
	bvs 126.b		; 70 7E
	trb $0C0C.w		; 1C 0C 0C
	tsb $0C.b		; 04 0C
	tsb $0E.b		; 04 0E
	cop $86.b		; 02 86
	cop $86.b		; 02 86
	cop $8E.b		; 02 8E
	brk $8E.b		; 00 8E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	cpx $D8E0.w		; EC E0 D8
	cpy #$B0.b		; C0 B0
	bcc 120.b		; 90 78
	ora $031530.l		; 0F 30 15 03
	plx		; FA
	asl $F6.b		; 06 F6
	asl $001C.w		; 0E 1C 00
	sec		; 38
	brk $70.b		; 00 70
	brk $F8.b		; 00 F8
	brk $3F.b		; 00 3F
	cpy #$FF.b		; C0 FF
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	sed		; F8
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($E703.w,X)		; FC 03 E7
	ora $E0FC3C.l,X		; 1F 3C FC E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EC.b		; 00 EC
	trb $78B8.w		; 1C B8 78
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F800.w,X)		; FC 00 F8
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
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $F5.b		; 00 F5
	ora #$E5.b		; 09 E5
	sbc $FFF5.w,Y		; F9 F5 FF
	sbc $FF.b		; E5 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	sbc $E5FF.w,X		; FD FF E5
	sbc $000201.l,X		; FF 01 02 00
	brk $05.b		; 00 05
	brk $E5.b		; 00 E5
	sbc $000202.l,X		; FF 02 02 00
	brk $F5.b		; 00 F5
	sbc $03FFED.l,X		; FF ED FF 03
	cop $00.b		; 02 00
	brk $FD.b		; 00 FD
	sbc $04FFED.l,X		; FF ED FF 04
	cop $00.b		; 02 00
	brk $05.b		; 00 05
	brk $ED.b		; 00 ED
	sbc $000205.l,X		; FF 05 02 00
	brk $F7.b		; 00 F7
	sbc $06FFF5.l,X		; FF F5 FF 06
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $07FFF5.l,X		; FF F5 FF 07
	cop $00.b		; 02 00
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	sbc $000208.l,X		; FF 08 02 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	cop $0C.b		; 02 0C
	ora $3F181F.l		; 0F 1F 18 3F
	bpl  60.b		; 10 3C
	rts		; 60

	adc ($20.b),Y		; 71 20
	brk $00.b		; 00 00
	cop $03.b		; 02 03
	asl A		; 0A
	ora $131C.w		; 0D 1C 13
	tsa		; 3B
	bit $57.b		; 24 57
	pla		; 68
	and $DEA550.l		; 2F 50 A5 DE
	bvc 112.b		; 50 70
	jsr ($07F8.w,X)		; FC F8 07
	inc $87F9.w,X		; FE F9 87
	asl $1FD3.w,X		; 1E D3 1F
	adc ($08.b),Y		; 71 08
	sta [$2C.b],Y		; 97 2C
	cmp ($88.b)		; D2 88
	sed		; F8
	plx		; FA
	asl $06.b		; 06 06
	sbc $06F9.w,Y		; F9 F9 06
	lsr $FFE1.w,X		; 5E E1 FF
	cpx #$DF.b		; E0 DF
	rts		; 60

	ror A		; 6A
	sta [$00.b],Y		; 97 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$60.b		; C0 60
	cpy #$E0.b		; C0 E0
	bcs -16.b		; B0 F0
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$40.b		; C0 40
	cpx #$20.b		; E0 20
	bvc -80.b		; 50 B0
	ldy #$50.b		; A0 50
	tay		; A8
	cli		; 58
	sbc ($CC.b),Y		; F1 CC
	cpx #$56.b		; E0 56
	sep #$49		; E2 49
	plx		; FA
	eor ($FD.b,X)		; 41 FD
	sbc ($50.b)		; F2 50
	adc $6B10.w		; 6D 10 6B
	plp		; 28
	bit $4F.b,X		; 34 4F
	ldx $AE55.w,Y		; BE 55 AE
	tad		; 5B
	ldy $5E.b		; A4 5E
	lda ($7F.b,X)		; A1 7F
	bra -18.b		; 80 EE
	sta ($2F.b,S),Y		; 93 2F
	eor [$76.b],Y		; 57 76
	phk		; 4B
	cld		; D8
	ora $90.b,S		; 03 90
	adc #$05.b		; 69 05
	txs		; 9A
	ora $9C.b,S		; 03 9C
	sta ($7E.b,X)		; 81 7E
	sta ($65.b)		; 92 65
	sbc ($0D.b),Y		; F1 0D
	tay		; A8
	cmp ($DF.b)		; D2 DF
	and [$9A.b]		; 27 9A
	adc [$8F.b]		; 67 8F
	bvs -101.b		; 70 9B
	stz $DF.b		; 64 DF
	jsr $8E75.w		; 20 75 8E
	adc $0DF69E.l		; 6F 9E F6 0D
	sed		; F8
	cld		; D8
	sed		; F8
	bpl  -8.b		; 10 F8
	bpl  -8.b		; 10 F8
	bmi 120.b		; 30 78
	sed		; F8
	bne -80.b		; D0 B0
	cpy #$B0.b		; C0 B0
	ldy #$60.b		; A0 60
	bne  40.b		; D0 28
	bne  40.b		; D0 28
	bne  40.b		; D0 28
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	clv		; B8
	pha		; 48
	ldy #$50.b		; A0 50
	bvs -112.b		; 70 90
	cmp $0F66.w,Y		; D9 66 0F
	eor $13.b,S		; 43 13
	bmi   0.b		; 30 00
	asl $0103.w		; 0E 03 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $5C2390.l		; 6F 90 23 5C
	clc		; 18
	and [$17.b]		; 27 17
	clc		; 18
	ora $06.b		; 05 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F81B.w,X		; FD 1B F8
	sbc ($E4.b,X)		; E1 E4
	asl $08.b		; 06 08
	sec		; 38
	rts		; 60

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	tsb $E2.b		; 04 E2
	ora $F20C.w,X		; 1D 0C F2
	jsr ($D004.w,X)		; FC 04 D0
	bmi   0.b		; 30 00
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
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $F5.b		; 00 F5
	ora #$E5.b		; 09 E5
	sbc $FFF5.w,Y		; F9 F5 FF
	sbc $FF.b		; E5 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	sbc $E5FF.w,X		; FD FF E5
	sbc $000201.l,X		; FF 01 02 00
	brk $05.b		; 00 05
	brk $E5.b		; 00 E5
	sbc $000202.l,X		; FF 02 02 00
	brk $F5.b		; 00 F5
	sbc $03FFED.l,X		; FF ED FF 03
	cop $00.b		; 02 00
	brk $FD.b		; 00 FD
	sbc $04FFED.l,X		; FF ED FF 04
	cop $00.b		; 02 00
	brk $05.b		; 00 05
	brk $ED.b		; 00 ED
	sbc $000205.l,X		; FF 05 02 00
	brk $F7.b		; 00 F7
	sbc $06FFF5.l,X		; FF F5 FF 06
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $07FFF5.l,X		; FF F5 FF 07
	cop $00.b		; 02 00
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	sbc $000208.l,X		; FF 08 02 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	cop $0C.b		; 02 0C
	ora $3F191F.l		; 0F 1F 19 3F
	ora [$3D.b],Y		; 17 3D
	adc $75.b,S		; 63 75
	jsr $0000.w		; 20 00 00
	cop $03.b		; 02 03
	asl A		; 0A
	ora $131C.w		; 0D 1C 13
	and $5727.w,Y		; 39 27 57
	rtl		; 6B

	and $A553.w		; 2D 53 A5
	phx		; DA
	bvc 112.b		; 50 70
	jsr ($07F8.w,X)		; FC F8 07
	inc $87F9.w,X		; FE F9 87
	inc $FF73.w,X		; FE 73 FF
	cmp $4E.b,X		; D5 4E
	sta $88D52F.l,X		; 9F 2F D5 88
	sed		; F8
	plx		; FA
	asl $06.b		; 06 06
	sbc $06F9.w,Y		; F9 F9 06
	ror $F581.w,X		; 7E 81 F5
	stx $AE5F.w		; 8E 5F AE
	adc $0096.w		; 6D 96 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$60.b		; C0 60
	cpy #$E0.b		; C0 E0
	bcs -16.b		; B0 F0
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$40.b		; C0 40
	cpx #$20.b		; E0 20
	bvc -80.b		; 50 B0
	ldy #$50.b		; A0 50
	tay		; A8
	cli		; 58
	sbc $5EEECE.l,X		; FF CE EE 5E
	inc $FE4F.w		; EE 4F FE
	eor $FD.b		; 45 FD
	sbc ($53.b)		; F2 53
	adc $2B6A17.l		; 6F 17 6A 2B
	and [$4F.b],Y		; 37 4F
	bcs  95.b		; B0 5F
	ldy $5F.b		; A4 5F
	ldx $AF54.w		; AE 54 AF
	adc $90EF80.l,X		; 7F 80 EF 90
	and $497750.l		; 2F 50 77 49
	cmp $6B9304.l,X		; DF 04 93 6B
	ora $9A.b		; 05 9A
	cop $9F.b		; 02 9F
	sta [$7F.b]		; 87 7F
	txs		; 9A
	adc $EC93FF.l		; 6F FF 93 EC
	dec $DF.b,X		; D6 DF
	jsr $649B.w		; 20 9B 64
	sta $679A70.l		; 8F 70 9A 67
	cmp $06FB27.l,X		; DF 27 FB 06
	lda $E9D6C0.l,X		; BF C0 D6 E9
	sed		; F8
	cld		; D8
	sed		; F8
	bpl  -8.b		; 10 F8
	bpl  -8.b		; 10 F8
	bmi 120.b		; 30 78
	sed		; F8
	bne -80.b		; D0 B0
	cpy #$B0.b		; C0 B0
	ldy #$60.b		; A0 60
	bne  40.b		; D0 28
	bne  40.b		; D0 28
	bne  40.b		; D0 28
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	clv		; B8
	pha		; 48
	ldy #$50.b		; A0 50
	bvs -112.b		; 70 90
	stp		; DB
	ror $0F.b		; 66 0F
	eor $13.b,S		; 43 13
	bmi   0.b		; 30 00
	asl $0103.w		; 0E 03 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $2393.w		; 6E 93 23
	jmp $172718.l		; 5C 18 27 17
	clc		; 18
	ora $06.b		; 05 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F81B.w,X		; FD 1B F8
	sbc ($E4.b,X)		; E1 E4
	asl $08.b		; 06 08
	sec		; 38
	rts		; 60

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	tsb $E2.b		; 04 E2
	ora $F20C.w,X		; 1D 0C F2
	jsr ($D004.w,X)		; FC 04 D0
	bmi   0.b		; 30 00
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
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $F5.b		; 00 F5
	ora #$E5.b		; 09 E5
	sbc $FFF5.w,Y		; F9 F5 FF
	sbc $FF.b		; E5 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	sbc $E5FF.w,X		; FD FF E5
	sbc $000201.l,X		; FF 01 02 00
	brk $05.b		; 00 05
	brk $E5.b		; 00 E5
	sbc $000202.l,X		; FF 02 02 00
	brk $F5.b		; 00 F5
	sbc $03FFED.l,X		; FF ED FF 03
	cop $00.b		; 02 00
	brk $FD.b		; 00 FD
	sbc $04FFED.l,X		; FF ED FF 04
	cop $00.b		; 02 00
	brk $05.b		; 00 05
	brk $ED.b		; 00 ED
	sbc $000205.l,X		; FF 05 02 00
	brk $F7.b		; 00 F7
	sbc $06FFF5.l,X		; FF F5 FF 06
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $07FFF5.l,X		; FF F5 FF 07
	cop $00.b		; 02 00
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	sbc $000208.l,X		; FF 08 02 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	cop $0C.b		; 02 0C
	ora $3F1A1F.l		; 0F 1F 1A 3F
	trb $38.b		; 14 38
	jmp ($2E71.w)		; 6C 71 2E
	brk $00.b		; 00 00
	cop $03.b		; 02 03
	asl A		; 0A
	ora $131C.w		; 0D 1C 13
	tsa		; 3B
	bit $57.b		; 24 57
	pla		; 68
	and $AF56.w		; 2D 56 AF
	dec $7050.w,X		; DE 50 70
	jsr ($07F8.w,X)		; FC F8 07
	inc $87F9.w,X		; FE F9 87
	inc $C313.w		; EE 13 C3
	and $07F8.w,X		; 3D F8 07
	and $F888D0.l		; 2F D0 88 F8
	plx		; FA
	asl $06.b		; 06 06
	sbc $06F9.w,Y		; F9 F9 06
	dec $39.b,X		; D6 39
	sbc $10EF38.l,X		; FF 38 EF 10
	adc $000090.l		; 6F 90 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	rts		; 60

	cpy #$E0.b		; C0 E0
	bmi -16.b		; 30 F0
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	rti		; 40

	cpx #$20.b		; E0 20
	bvc -80.b		; 50 B0
	jsr $A8D0.w		; 20 D0 A8
	cli		; 58
	sbc ($D4.b),Y		; F1 D4
	inc $E650.w,X		; FE 50 E6
	eor #$F8.b		; 49 F8
	eor [$F0.b],Y		; 57 F0
	sbc $107F40.l,X		; FF 40 7F 10
	adc $55342B.l		; 6F 2B 34 55
	ldx $A05F.w		; AE 5F A0
	eor $A05FA0.l,X		; 5F A0 5F A0
	tda		; 7B
	stx $F7.b		; 86 F7
	sta $77562B.l		; 8F 2B 56 77
	pha		; 48
	cmp $6B9600.l,X		; DF 00 96 6B
	tsb $9B.b		; 04 9B
	cop $9F.b		; 02 9F
	ora $EF1CF0.l		; 0F F0 1C EF
	sbc [$0F.b],Y		; F7 0F
	ldy #$DA.b		; A0 DA
	cmp $619F20.l,X		; DF 20 9F 61
	sta $659B73.l		; 8F 73 9B 65
	cmp $00FF20.l,X		; DF 20 FF 00
	sbc $3DDE18.l		; EF 18 DE 3D
	sed		; F8
	cld		; D8
	sed		; F8
	bcc 120.b		; 90 78
	bcc  -8.b		; 90 F8
	bcs  -8.b		; B0 F8
	sei		; 78
	bne -80.b		; D0 B0
	cpy #$B0.b		; C0 B0
	ldy #$60.b		; A0 60
	bne  40.b		; D0 28
	bne  40.b		; D0 28
	bne -88.b		; D0 A8
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	clv		; B8
	pha		; 48
	ldy #$50.b		; A0 50
	bvs -112.b		; 70 90
	cmp $0F6E.w,Y		; D9 6E 0F
	eor $13.b,S		; 43 13
	bmi   0.b		; 30 00
	asl $0103.w		; 0E 03 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $5C2390.l		; 6F 90 23 5C
	clc		; 18
	and [$17.b]		; 27 17
	clc		; 18
	ora $06.b		; 05 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $F83B.w,X		; DD 3B F8
	sbc ($E4.b,X)		; E1 E4
	asl $08.b		; 06 08
	sec		; 38
	rts		; 60

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	stz $E2.b		; 64 E2
	ora $F20C.w,X		; 1D 0C F2
	jsr ($D004.w,X)		; FC 04 D0
	bmi   0.b		; 30 00
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
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $F5.b		; 00 F5
	ora #$E5.b		; 09 E5
	sbc $FFF5.w,Y		; F9 F5 FF
	sbc $FF.b		; E5 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	sbc $E5FF.w,X		; FD FF E5
	sbc $000201.l,X		; FF 01 02 00
	brk $05.b		; 00 05
	brk $E5.b		; 00 E5
	sbc $000202.l,X		; FF 02 02 00
	brk $F5.b		; 00 F5
	sbc $03FFED.l,X		; FF ED FF 03
	cop $00.b		; 02 00
	brk $FD.b		; 00 FD
	sbc $04FFED.l,X		; FF ED FF 04
	cop $00.b		; 02 00
	brk $05.b		; 00 05
	brk $ED.b		; 00 ED
	sbc $000205.l,X		; FF 05 02 00
	brk $F7.b		; 00 F7
	sbc $06FFF5.l,X		; FF F5 FF 06
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $07FFF5.l,X		; FF F5 FF 07
	cop $00.b		; 02 00
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	sbc $000208.l,X		; FF 08 02 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	cop $0C.b		; 02 0C
	ora $3F181F.l		; 0F 1F 18 3F
	bpl  60.b		; 10 3C
	rts		; 60

	adc ($20.b),Y		; 71 20
	brk $00.b		; 00 00
	cop $03.b		; 02 03
	asl A		; 0A
	ora $131C.w		; 0D 1C 13
	tsa		; 3B
	bit $57.b		; 24 57
	pla		; 68
	and $DEA550.l		; 2F 50 A5 DE
	bvc 112.b		; 50 70
	jsr ($07F8.w,X)		; FC F8 07
	inc $87F9.w,X		; FE F9 87
	asl $1FD3.w,X		; 1E D3 1F
	adc ($08.b),Y		; 71 08
	sta [$2C.b],Y		; 97 2C
	cmp ($88.b)		; D2 88
	sed		; F8
	plx		; FA
	asl $06.b		; 06 06
	sbc $06F9.w,Y		; F9 F9 06
	lsr $FFE1.w,X		; 5E E1 FF
	cpx #$DF.b		; E0 DF
	rts		; 60

	ror A		; 6A
	sta [$00.b],Y		; 97 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$60.b		; C0 60
	cpy #$E0.b		; C0 E0
	bcs -16.b		; B0 F0
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$40.b		; C0 40
	cpx #$20.b		; E0 20
	bvc -80.b		; 50 B0
	ldy #$50.b		; A0 50
	tay		; A8
	cli		; 58
	sbc ($CC.b),Y		; F1 CC
	cpx #$56.b		; E0 56
	sep #$49		; E2 49
	plx		; FA
	eor ($FD.b,X)		; 41 FD
	sbc ($50.b)		; F2 50
	adc $6B10.w		; 6D 10 6B
	plp		; 28
	bit $4F.b,X		; 34 4F
	ldx $AE55.w,Y		; BE 55 AE
	tad		; 5B
	ldy $5E.b		; A4 5E
	lda ($7F.b,X)		; A1 7F
	bra -18.b		; 80 EE
	sta ($2F.b,S),Y		; 93 2F
	eor [$76.b],Y		; 57 76
	phk		; 4B
	cld		; D8
	ora $90.b,S		; 03 90
	adc #$05.b		; 69 05
	txs		; 9A
	ora $9C.b,S		; 03 9C
	sta ($7E.b,X)		; 81 7E
	sta ($65.b)		; 92 65
	sbc ($0D.b),Y		; F1 0D
	tay		; A8
	cmp ($DF.b)		; D2 DF
	and [$9A.b]		; 27 9A
	adc [$8F.b]		; 67 8F
	bvs -101.b		; 70 9B
	stz $DF.b		; 64 DF
	jsr $8E75.w		; 20 75 8E
	adc $0DF69E.l		; 6F 9E F6 0D
	sed		; F8
	cld		; D8
	sed		; F8
	bpl  -8.b		; 10 F8
	bpl  -8.b		; 10 F8
	bmi 120.b		; 30 78
	sed		; F8
	bne -80.b		; D0 B0
	cpy #$B0.b		; C0 B0
	ldy #$60.b		; A0 60
	bne  40.b		; D0 28
	bne  40.b		; D0 28
	bne  40.b		; D0 28
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	clv		; B8
	pha		; 48
	ldy #$50.b		; A0 50
	bvs -112.b		; 70 90
	cmp $0F66.w,Y		; D9 66 0F
	eor $13.b,S		; 43 13
	bmi   0.b		; 30 00
	asl $0103.w		; 0E 03 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $5C2390.l		; 6F 90 23 5C
	clc		; 18
	and [$17.b]		; 27 17
	clc		; 18
	ora $06.b		; 05 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F81B.w,X		; FD 1B F8
	sbc ($E4.b,X)		; E1 E4
	asl $08.b		; 06 08
	sec		; 38
	rts		; 60

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	tsb $E2.b		; 04 E2
	ora $F20C.w,X		; 1D 0C F2
	jsr ($D004.w,X)		; FC 04 D0
	bmi   0.b		; 30 00
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
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $D6.b		; 00 D6
	tsb $DDD0.w		; 0C D0 DD
	dec $FF.b,X		; D6 FF
	dec $FF.b,X		; D6 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	dec $D6FF.w,X		; DE FF D6
	sbc $000401.l,X		; FF 01 04 00
	brk $E6.b		; 00 E6
	sbc $02FFD6.l,X		; FF D6 FF 02
	tsb $00.b		; 04 00
	brk $EE.b		; 00 EE
	sbc $03FFD6.l,X		; FF D6 FF 03
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $04FFD6.l,X		; FF D6 FF 04
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $05FFD6.l,X		; FF D6 FF 05
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $D6.b		; 00 D6
	sbc $000406.l,X		; FF 06 04 00
	brk $E7.b		; 00 E7
	sbc $07FFCE.l,X		; FF CE FF 07
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $08FFCE.l,X		; FF CE FF 08
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $09FFCE.l,X		; FF CE FF 09
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $0AFFCE.l,X		; FF CE FF 0A
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $CE.b		; 00 CE
	sbc $00040B.l,X		; FF 0B 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $30.b,S		; 03 30
	bmi -64.b		; 30 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	jsr $708E.w		; 20 8E 70
	cpy #$3A.b		; C0 3A
	bra  31.b		; 80 1F
	bmi  63.b		; 30 3F
	ora $03.b,S		; 03 03
	ora $39390F.l		; 0F 0F 39 39
	cmp $FF8FFF.l,X		; DF FF 8F FF
	cmp $FF.b		; C5 FF
	cpx #$FF.b		; E0 FF
	cpy #$FF.b		; C0 FF
	adc $00FF00.l,X		; 7F 00 FF 00
	sed		; F8
	brk $C0.b		; 00 C0
	brk $03.b		; 00 03
	ora $3F.b,S		; 03 3F
	and $00FC7C.l,X		; 3F 7C FC 00
	brk $C7.b		; 00 C7
	cmp [$3F.b]		; C7 3F
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $C0FFFC.l,X		; FF FC FF C0
	sbc $00FC00.l,X		; FF 00 FC 00
	brk $F8.b		; 00 F8
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $F8FFFF.l,X		; 1F FF FF F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFE0FF.l,X		; FF FF E0 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $FFFF3F.l,X		; 3F 3F FF FF
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	sta ($FF.b,X)		; 81 FF
	cpx #$F0.b		; E0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -80.b		; 80 B0
	brk $70.b		; 00 70
	asl $00FE.w		; 0E FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4E.b		; 00 4E
	inc $FE8E.w,X		; FE 8E FE
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
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora [$07.b]		; 07 07
	bit $E13C.w,X		; 3C 3C E1
	sbc ($00.b,X)		; E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($3F.b,X)		; 01 3F
	and $01E0E0.l,X		; 3F E0 E0 01
	ora ($1F.b,X)		; 01 1F
	ora $00FFFF.l,X		; 1F FF FF 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FF7E7E.l,X		; FF 7E 7E FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	jsr ($04FC.w,X)		; FC FC 04
	tsb $04.b		; 04 04
	tsb $FC.b		; 04 FC
	jsr ($FCFC.w,X)		; FC FC FC
	jmp.w [$26FC]		; DC FC 26
	xce		; FB
	brk $07.b		; 00 07
	asl $04.b		; 06 04
	brk $E1.b		; 00 E1
	eor [$16.b]		; 47 16
	phk		; 4B
	ora ($2E.b)		; 12 2E
	stz $1D.b		; 64 1D
	sta $35.b,S		; 83 35
	php		; 08
	and $C1.b		; 25 C1
	cmp $24.b		; C5 24
	sta ($49.b,S),Y		; 93 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	cmp ($49.b)		; D2 49
	bit $92.b		; 24 92
	eor #$24.b		; 49 24
	cmp ($49.b,S),Y		; D3 49
	ora ($97.b,X)		; 01 97
	bit $92.b		; 24 92
	lsr A		; 4A
	ora ($A5.b,S),Y		; 13 A5
	sta ($00.b),Y		; 91 00
	sta $A4.b,X		; 95 A4
	ldx $90.b		; A6 90
	ora $05.b,X		; 15 05
	eor $64.b,X		; 55 64
	tsb $A5AB.w		; 0C AB A5
	jmp ($563E.w,X)		; 7C 3E 56
	asl $53.b,X		; 16 53
	and $AE2D.w		; 2D 2D AE
	rol $2FAF.w		; 2E AF 2F
	bcs  38.b		; B0 26
	rti		; 40

	sta ($0B.b,S),Y		; 93 0B
	ora ($1B.b,S),Y		; 13 1B
	and $2B.b,S		; 23 2B
	sbc #$F6.b		; E9 F6
	sta $9D99.w,X		; 9D 99 9D
	lda ($43.b,X)		; A1 43
	phk		; 4B
	eor ($5B.b,S),Y		; 53 5B
	.db $62, $04, $DB		; 62 04 DB
	tad		; 5B
	txy		; 9B
	jmp.w [$5C1C]		; DC 1C 5C
	stz $1DDD.w		; 9C DD 1D
	eor $67D78F.l,X		; 5F 8F D7 67
	adc [$F3.b],Y		; 77 F3
	sbc $AF02.w,X		; FD 02 AF
	ora $08482F.l		; 0F 2F 48 08
	asl $01D0.w,X		; 1E D0 01
	lsr A		; 4A
	php		; 08
	bcc  38.b		; 90 26
	xce		; FB
	brk $07.b		; 00 07
	brk $04.b		; 00 04
	brk $E0.b		; 00 E0
	sta ($52.b)		; 92 52
	phy		; 5A
	rep #$45		; C2 45
	eor $90050A.l		; 4F 0A 05 90
	ora ($A1.b)		; 12 A1
	dec $F5.b		; C6 F5
	stx $42.b		; 86 42
	adc ($08.b,X)		; 61 08
	lsr $3A.b		; 46 3A
	cmp $16.b		; C5 16
	pld		; 2B
	bpl -32.b		; 10 E0
	txa		; 8A
	pld		; 2B
	mvn $32,$F6		; 54 F6 32
	bcs  71.b		; B0 47
	rts		; 60

	inc $7A.b		; E6 7A
	sta ($D8.b),Y		; 91 D8
	stx $F5.b		; 86 F5
	eor [$6F.b]		; 47 6F
	eor $E4.b,X		; 55 E4
	tas		; 1B
	ora $0ED9.w,Y		; 19 D9 0E
	.db $82, $37, $EB		; 82 37 EB
	sta $08.b,X		; 95 08
	.db $62, $28, $DC		; 62 28 DC
	txs		; 9A
	cmp $26.b,X		; D5 26
	rol $51.b		; 26 51
	cmp ($F3.b,S),Y		; D3 F3
	inc A		; 1A
	ora ($8A.b)		; 12 8A
	sta ($35.b,S),Y		; 93 35
	eor $9324DF.l,X		; 5F DF 24 93
	phy		; 5A
	lsr $F9.b,X		; 56 F9
	stz $B1.b		; 64 B1
	tay		; A8
	phb		; 8B
	jmp ($9AEA.w)		; 6C EA 9A
	rol $35.b		; 26 35
	and ($A5.b,S),Y		; 33 A5
	ora ($2A.b)		; 12 2A
	adc $CB.b		; 65 CB
	and $1004.w		; 2D 04 10
	sty $F009.w		; 8C 09 F0
	rti		; 40

	dec $02.b		; C6 02
	adc ($A0.b)		; 72 A0
	sta ($8D.b),Y		; 91 8D
	tsb $D7.b		; 04 D7
	stz $0682.w,X		; 9E 82 06
	ldy $13.b,X		; B4 13
	ora $12DC7A.l,X		; 1F 7A DC 12
	rol $00.b,X		; 36 00
	mvp $70,$5C		; 44 5C 70
	ora ($07.b),Y		; 11 07
	trb $C1F6.w		; 1C F6 C1
	bit $4AE7.w,X		; 3C E7 4A
	eor ($38.b,X)		; 41 38
	cmp [$E4.b]		; C7 E4
	and $00.b		; 25 00
	txy		; 9B
	bit $93.b		; 24 93
	sta [$04.b],Y		; 97 04
	cmp #$24.b		; C9 24
	lda [$3C.b],Y		; B7 3C
	cmp ($D0.b,S),Y		; D3 D0
	adc $1C.b,S		; 63 1C
	tsx		; BA
	phd		; 0B
	cmp $2E.b,X		; D5 2E
	xba		; EB
	ldx $CA.b		; A6 CA
	and $848E.w,Y		; 39 8E 84
	ora $AA09.w,X		; 1D 09 AA
	txa		; 8A
	lda $F2EE.w,Y		; B9 EE F2
	cld		; D8
	dec $B7E6.w		; CE E6 B7
	sta $F8505B.l,X		; 9F 5B 50 F8
	eor $A90589.l		; 4F 89 05 A9
	lda $97.b		; A5 97
	sbc $99.b,X		; F5 99
	lda $F511.w		; AD 11 F5
	stx $1D84.w		; 8E 84 1D
	trb $53.b		; 14 53
	eor $773D03.l		; 4F 03 3D 77
	sbc $E2B848.l,X		; FF 48 B8 E2
	bvc  80.b		; 50 50
	cmp $7B.b		; C5 7B
	asl $30BB.w,X		; 1E BB 30
	eor $BFA2FD.l,X		; 5F FD A2 BF
	ora $E1.b,X		; 15 E1
	bpl  69.b		; 10 45
	cpx $7BCD.w		; EC CD 7B
	cpy #$2C.b		; C0 2C
	clv		; B8
	ora ($08.b)		; 12 08
	ora $41.b,S		; 03 41
	dec $B616.w		; CE 16 B6
	and $6061.w		; 2D 61 60
	ora $80.b		; 05 80
	stz $02.b,X		; 74 02
	eor $9C8B.w,Y		; 59 8B 9C
	sbc ($44.b),Y		; F1 44
	ora #$46.b		; 09 46
	bmi  49.b		; 30 31
	dec $A368.w		; CE 68 A3
	adc $76FB.w,X		; 7D FB 76
	sbc $1B2B.w		; ED 2B 1B
	pla		; 68
	adc $8F2503.l		; 6F 03 25 8F
	jmp ($F7AB.w)		; 6C AB F7
	and $A9BC.w		; 2D BC A9
	txy		; 9B
	and $58.b,S		; 23 58
	cpy $FD31.w		; CC 31 FD
	txy		; 9B
	jmp ($9E20.w,X)		; 7C 20 9E
	lda $B1.b,X		; B5 B1
	bra -100.b		; 80 9C
	lda $F3.b,X		; B5 F3
	cld		; D8
	lda [$5D.b],Y		; B7 5D
	adc ($CF.b),Y		; 71 CF
	sta ($FB.b,X)		; 81 FB
	lsr A		; 4A
	ldy $AD.b,X		; B4 AD
	eor $5B.b,X		; 55 5B
	lda [$62.b],Y		; B7 62
	cmp $A9.b,S		; C3 A9
	adc ($C3.b)		; 72 C3
	sbc [$15.b],Y		; F7 15
	and ($A4.b)		; 32 A4
	mvn $F6,$D6		; 54 D6 F6
	ldy $5A7D.w		; AC 7D 5A
	ora $7C.b		; 05 7C
	cmp $38.b,X		; D5 38
	jmp $DD7FE3.l		; 5C E3 7F DD
	adc $A802.w,Y		; 79 02 A8
	tay		; A8
	bit $36.b,X		; 34 36
	tax		; AA
	pla		; 68
	and $F75D.w,Y		; 39 5D F7
	asl $137C.w,X		; 1E 7C 13
	dec $09.b,X		; D6 09
	asl $7639.w		; 0E 39 76
	inx		; E8
	and [$38.b]		; 27 38
	sbc [$B5.b]		; E7 B5
	adc [$68.b],Y		; 77 68
	ora ($CC.b,S),Y		; 13 CC
	stz $20.b		; 64 20
	ora ($8C.b,S),Y		; 13 8C
	jmp ($66A4.w)		; 6C A4 66
	cop $7D.b		; 02 7D
	xce		; FB
	sed		; F8
	bmi   2.b		; 30 02
	adc $FB.b,X		; 75 FB
	sbc $1E8C.w,X		; FD 8C 1E
	brk $4D.b		; 00 4D
	phy		; 5A
	cld		; D8
	cmp #$24.b		; C9 24
	tsb $C5.b		; 04 C5
	lda $C4CE9E.l		; AF 9E CE C4
	sta $9C27E0.l,X		; 9F E0 27 9C
	sbc #$48.b		; E9 48
	and [$1C.b]		; 27 1C
	jsr ($E784.w,X)		; FC 84 E7
	brk $63.b		; 00 63
	trb $9CE0.w		; 1C E0 9C
	adc $1C.b,S		; 63 1C
	inx		; E8
	tsb $DA.b		; 04 DA
	adc #$9E.b		; 69 9E
	adc $65B7D3.l,X		; 7F D3 B7 65
	xce		; FB
	and $AAABCA.l		; 2F CA AB AA
	tsx		; BA
	tax		; AA
	adc ($9F.b,X)		; 61 9F
	sta $FFC0B7.l		; 8F B7 C0 FF
	adc $29F5.w		; 6D F5 29
	sbc $16.b,X		; F5 16
	adc $6714.w		; 6D 14 67
	lda $9E4B.w,Y		; B9 4B 9E
	inc A		; 1A
	dec $5F.b,X		; D6 5F
	inc $3D.b		; E6 3D
	adc $ED.b		; 65 ED
	eor ($B4.b)		; 52 B4
	eor ($E4.b)		; 52 E4
	inc $AD56.w		; EE 56 AD
	sbc $F39A3F.l		; EF 3F 9A F3
	sbc $9D572B.l		; EF 2B 57 9D
	xce		; FB
	pei ($E1.b)		; D4 E1
	adc ($C3.b,S),Y		; 73 C3
	phy		; 5A
	sta [$F9.b],Y		; 97 F9
	sta $AB555D.l		; 8F 5D 55 AB
	mvn $53,$D3		; 54 D3 53
	eor ($CF.b,X)		; 41 CF
	.db $62, $B5, $77		; 62 B5 77
	sbc ($5E.b,S),Y		; F3 5E
	ldx $AF.b,Y		; B6 AF
	adc ($D7.b)		; 72 D7
	sta ($98.b)		; 92 98
	eor ($9E.b)		; 52 9E
	ora [$3B.b]		; 07 3B
	eor $38AD4A.l		; 4F 4A AD 38
	bit $F5AD.w,X		; 3C AD F5
	cpx #$A6.b		; E0 A6
	sty $BA.b,X		; 94 BA
	sbc [$39.b]		; E7 39
	xba		; EB
	ror A		; 6A
	cmp ($82.b),Y		; D1 82
	lsr $B7.b		; 46 B7
	ora [$ED.b]		; 07 ED
	eor $F138A6.l		; 4F A6 38 F1
	.db $62, $A7, $4E		; 62 A7 4E
	clc		; 18
	adc $96.b		; 65 96
	sta $6271.w,Y		; 99 71 62
	lda $1C.b,S		; A3 1C
	sei		; 78
	adc ($7C.b),Y		; 71 7C
	ply		; 7A
	adc $25393C.l,X		; 7F 3C 39 25
	stx $59.b		; 86 59
	adc ($51.b),Y		; 71 51
	stx $693A.w		; 8E 3A 69
	stx $5D.b,Y		; 96 5D
.ACCU 16
.INDEX 16
	rep #$BD		; C2 BD
	txy		; 9B
	pei ($DE.b)		; D4 DE
	ldy $8F.b,X		; B4 8F
	asl $3A5E.w,X		; 1E 5E 3A
	ldy $ED.b,X		; B4 ED
	wai		; CB
	cpx $DC.b		; E4 DC
	cmp $7B.b		; C5 7B
	adc ($F2.b)		; 72 F2
	ora ($F5.b),Y		; 11 F5
	sbc $A6.b		; E5 A6
	tax		; AA
	clc		; 18
	dec $E4C2.w		; CE C2 E4
	phy		; 5A
	sta $47.b,S		; 83 47
	sta $3B7D2F.l		; 8F 2F 7D 3B
	sbc #$D662.w		; E9 62 D6
	cmp $80.b		; C5 80
	bcs  50.b		; B0 32
	sbc $AA29.w,Y		; F9 29 AA
	stz $5DB7.w		; 9C B7 5D
	dec $6146.w		; CE 46 61
	bne 115.b		; D0 73
	ora [$39.b],Y		; 17 39
	bne -121.b		; D0 87
	adc $4948.w,Y		; 79 48 49
	bne 115.b		; D0 73
	clc		; 18
	inc $39.b		; E6 39
	bne -115.b		; D0 8D
	sta $1A.b,S		; 83 1A
	jsl $BCC7F1.l		; 22 F1 C7 BC
	eor $4EAFB3.l,X		; 5F B3 AF 4E
	cmp ($BA.b,X)		; C1 BA
	lda ($1A.b),Y		; B1 1A
	plp		; 28
	sbc $FC.b,S		; E3 FC
	lda [$B1.b],Y		; B7 B1
	adc $FFB577.l		; 6F 77 B5 FF
	lda $BA8C.w		; AD 8C BA
	plp		; 28
	cmp $A9CFDE.l,X		; DF DE CF A9
	php		; 08
	pea $0D86.w		; F4 86 0D
	nop		; EA
	lda [$6E.b],Y		; B7 6E
	cmp ($46.b),Y		; D1 46
	inc $D5.b,X		; F6 D5
	lsr $24A8.w		; 4E A8 24
	jsl $DF75AE.l		; 22 AE 75 DF
	cmp $D7.b,X		; D5 D7
	rtl		; 6B

	cmp [$ED.b],Y		; D7 ED
	and $5969.w,X		; 3D 69 59
	tas		; 1B
	sbc $6F.b		; E5 6F
	txy		; 9B
	tsb $B2.b		; 04 B2
	tsx		; BA
	txs		; 9A
	plx		; FA
	ora $5A535B.l		; 0F 5B 53 5A
	ldx $E0.b		; A6 E0
	cmp ($E8.b,X)		; C1 E8
	sta [$E8.b],Y		; 97 E8
	stx $58.b,Y		; 96 58
	adc ($E9.b,X)		; 61 E9
	ora $FF.b,X		; 15 FF
	ldy $2C5C.w,X		; BC 5C 2C
	beq -77.b		; F0 B3
	pei ($CD.b)		; D4 CD
	sta $CB.b,X		; 95 CB
	cpx $86.b		; E4 86
	asl $3E95.w,X		; 1E 95 3E
	and $638D89.l		; 2F 89 8D 63
	cli		; 58
	lda $B2.b,X		; B5 B2
	adc $5CEE.w,Y		; 79 EE 5C
	cmp ($AD.b)		; D2 AD
	phk		; 4B
	sbc $E5E7.w,X		; FD E7 E5
	sbc #$A9C3.w		; E9 C3 A9
	tsb $CD33.w		; 0C 33 CD
	adc ($7A.b)		; 72 7A
	cmp $DF.b,X		; D5 DF
	ldy $C9FF.w		; AC FF C9
	cmp ($AD.b,S),Y		; D3 AD
	lda #$87DA.w		; A9 DA 87
	ror $9ECD.w		; 6E CD 9E
	lda ($5E.b,X)		; A1 5E
	bit #$985C.w		; 89 5C 98
	lda [$9E.b]		; A7 9E
	adc #$DCBF.w		; 69 BF DC
	ora $5932.w,Y		; 19 32 59
	adc [$A9.b],Y		; 77 A9
	beq -12.b		; F0 F4
	adc $345F3C.l,X		; 7F 3C 5F 34
	sbc $58DCFC.l,X		; FF FC DC 58
	and $2519.w,X		; 3D 19 25
	adc $1A.b,S		; 63 1A
	cmp $C095.w		; CD 95 C0
	dec A		; 3A
	ora $2FBB.w,Y		; 19 BB 2F
	eor #$8927.w		; 49 27 89
	ldy $B52C.w		; AC 2C B5
	sbc ($C7.b,S),Y		; F3 C7
	stp		; DB
	txy		; 9B
	cpx $A5BD.w		; EC BD A5
	and [$F8.b]		; 27 F8
	dec $36FE.w,X		; DE FE 36
	sbc $725B.w,Y		; F9 5B 72
	ora [$03.b]		; 07 03
.ACCU 8
.INDEX 8
	sep #$B0		; E2 B0
	bit $35.b		; 24 35
	eor $0692.w		; 4D 92 06
	dey		; 88
	ora ($2E.b,X)		; 01 2E
	sbc $C7.b		; E5 C7
	cmp $48DEF7.l,X		; DF F7 DE 48
	bne  21.b		; D0 15
	ora ($22.b,X)		; 01 22
	sbc $87.b		; E5 87
	inc $A43D.w		; EE 3D A4
	asl $BB04.w,X		; 1E 04 BB
	sta [$12.b],Y		; 97 12
	rol $C3.b,X		; 36 C3
	ldx #$A0.b		; A2 A0
	and $5C.b		; 25 5C
	inc $8187.w		; EE 87 81
	rol $8FC5.w,X		; 3E C5 8F
	sbc $93.b,S		; E3 93
	jsr ($399F.w,X)		; FC 9F 39
	ora #$4E.b		; 09 4E
	adc $695E.w,Y		; 79 5E 69
	eor $B642.w,X		; 5D 42 B6
	and ($E4.b,X)		; 21 E4
	cmp $513A.w,Y		; D9 3A 51
	tya		; 98
	sta [$73.b],Y		; 97 73
	cpx $61F3.w		; EC F3 61
	pei ($E3.b)		; D4 E3
	lda $1F.b,S		; A3 1F
	sta $77.b,S		; 83 77
	pei ($CF.b)		; D4 CF
	phk		; 4B
	rol $C8E5.w,X		; 3E E5 C8
	lda $C095.w,X		; BD 95 C0
	and ($C7.b),Y		; 31 C7
	tyx		; BB
	sta $AC9B.w		; 8D 9B AC
	phy		; 5A
	cld		; D8
	lda ($C0.b)		; B2 C0
	and $A1317D.l		; 2F 7D 31 A1
	adc $58.b,S		; 63 58
	rtl		; 6B

	cop $52.b		; 02 52
	bvc -124.b		; 50 84
	sty $02.b		; 84 02
	jmp ($C571.w)		; 6C 71 C5
	ora ($8D.b),Y		; 11 8D
	sbc [$0D.b]		; E7 0D
	tsb $A8.b		; 04 A8
	sbc ($45.b)		; F2 45
	ora $A0BA.w,Y		; 19 BA A0
	txy		; 9B
	cmp [$2B.b],Y		; D7 2B
	eor $1E.b		; 45 1E
	lda #$90.b		; A9 90
	and #$17.b		; 29 17
	eor ($23.b,X)		; 41 23
	lda $AE47A7.l		; AF A7 47 AE
	ror $2021.w		; 6E 21 20
	and $DA.b		; 25 DA
	lsr $13.b		; 46 13
	sbc $608161.l,X		; FF 61 81 60
	sty $8D.b,X		; 94 8D
	sta $F2.b,S		; 83 F2
	ora ($81.b,X)		; 01 81
	rol $69.b,X		; 36 69
	bcs -75.b		; B0 B5
	cmp ($40.b),Y		; D1 40
	tya		; 98
	ora ($A6.b)		; 12 A6
.ACCU 8
	sep #$6F		; E2 6F
	jmp ($1330.w,X)		; 7C 30 13
	adc ($87.b,X)		; 61 87
	ror A		; 6A
	lda $1212E0.l,X		; BF E0 12 12
	ora #$50.b		; 09 50
	sbc [$AB.b],Y		; F7 AB
	jsr ($B0A2.w,X)		; FC A2 B0
	rol $BC.b		; 26 BC
	trb $1A.b		; 14 1A
	clc		; 18
	ora #$AB.b		; 09 AB
	tsb $46.b		; 04 46
	sbc $76DB.w		; ED DB 76
	sbc $2E5A.w,Y		; F9 5A 2E
	sty $4AB0.w		; 8C B0 4A
	tyx		; BB
	jmp.w [$F8B7]		; DC B7 F8
	inx		; E8
	sbc #$0D.b		; E9 0D
	bpl  75.b		; 10 4B
	stx $1A.b		; 86 1A
	sbc $F7.b,X		; F5 F7
	ora $A1.b,S		; 03 A1
	bne  74.b		; D0 4A
	stx $8A.b		; 86 8A
	sbc $09AE48.l,X		; FF 48 AE 09
	lda $05.b,X		; B5 05
	cmp ($30.b,X)		; C1 30
	rts		; 60

	rol $B4.b		; 26 B4
	ora ($53.b),Y		; 11 53
	ora [$39.b],Y		; 17 39
	cpy $4860.w		; CC 60 48
	bmi  49.b		; 30 31
	lda ($8C.b)		; B2 8C
	adc ($98.b,S),Y		; 73 98
	cmp $C040.w,Y		; D9 40 C0
	adc ($C3.b,X)		; 61 C3
	tsx		; BA
	eor [$5C.b],Y		; 57 5C
	lda $E3D6DF.l		; AF DF D6 E3
	txy		; 9B
	ora ($79.b,S),Y		; 13 79
	.db $62, $81, $87		; 62 81 87
	eor [$77.b],Y		; 57 77
	rol $BF.b		; 26 BF
	ora [$5B.b]		; 07 5B
	tyx		; BB
	and [$13.b],Y		; 37 13
	ply		; 7A
	ora ($80.b,X)		; 01 80
	rti		; 40

	clc		; 18
	clc		; 18
	asl $16.b,X		; 16 16
	ora #$6B.b		; 09 6B
	tsb $46.b		; 04 46
	rts		; 60

	.db $42, $00		; 42 00
	asl A		; 0A
	rti		; 40

	.db $42, $45		; 42 45
	brk $54.b		; 00 54
	ora $7C007C.l,X		; 1F 7C 00 7C
	inx		; E8
	adc $7B30.w,Y		; 79 30 7B
	clv		; B8
	adc [$F7.b],Y		; 77 F7
	lsr $35AD.w,X		; 5E AD 35
	cli		; 58
	adc [$B8.b],Y		; 77 B8
	adc ($98.b,S),Y		; 73 98
	adc ($78.b,S),Y		; 73 78
	adc ($58.b,S),Y		; 73 58
	adc ($38.b,S),Y		; 73 38
	adc ($FF.b,S),Y		; 73 FF
	adc $1F7C1F.l,X		; 7F 1F 7C 1F
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
	ora $00E07C.l,X		; 1F 7C E0 00
	lda $56.b,X		; B5 56
	phy		; 5A
	rtl		; 6B

	lsr A		; 4A
	and #$FF.b		; 29 FF
	adc $152108.l,X		; 7F 08 21 15
	brk $10.b		; 00 10
	.db $42, $00		; 42 00
	cli		; 58
	.db $42, $08		; 42 08
	sty $10.b		; 84 10
	sbc $52947F.l,X		; FF 7F 94 52
	sbc $575F57.l,X		; FF 57 5F 57
	ldy #$56.b		; A0 56
	bpl  66.b		; 10 42
	brk $00.b		; 00 00
	jsr $8004.w		; 20 04 80
	tsb $14C0.w		; 0C C0 14
	brk $21.b		; 00 21
	rti		; 40

	and #$80.b		; 29 80
	and ($00.b),Y		; 31 00
	.db $42, $C7		; 42 C7
	lsr $72.b,X		; 56 72
	adc $947FFF.l		; 6F FF 7F 94
	eor ($4A.b)		; 52 4A
	and #$B7.b		; 29 B7
	trb $EF.b		; 14 EF
	jsr $0000.w		; 20 00 00
	sta ($5D.b),Y		; 91 5D
	sbc $4948.w		; ED 48 49
	mvp $28,$06		; 44 06 28
	ora $2C.b		; 05 2C
	bit $28.b		; 24 28
	ora $00.b,X		; 15 00
	dec $5A.b,X		; D6 5A
	lda $4235.w		; AD 35 42
	php		; 08
	sbc $006A7F.l,X		; FF 7F 6A 00
	.db $42, $08		; 42 08
	ora #$4C.b		; 09 4C
	sta $00005F.l,X		; 9F 5F 00 00
	and ($05.b,X)		; 21 05
	lda ($08.b,X)		; A1 08
	ora $00.b,X		; 15 00
	phb		; 8B
	brk $B5.b		; 00 B5
	lsr $4A.b,X		; 56 4A
	and #$22.b		; 29 22
	ora ($EA.b)		; 12 EA
	adc $FF295F.l,X		; 7F 5F 29 FF
	adc $421CE7.l,X		; 7F E7 1C 42
	php		; 08
	.db $82, $0D, $5F		; 82 0D 5F
	eor ($FB.b,S),Y		; 53 FB
	.db $42, $00		; 42 00
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	php		; 08
	lda $14.b		; A5 14
	php		; 08
	and ($6B.b,X)		; 21 6B
	and $39CE.w		; 2D CE 39
	and ($46.b),Y		; 31 46
	adc ($4E.b,S),Y		; 73 4E
	dec $5A.b,X		; D6 5A
	and $9C67.w,Y		; 39 67 9C
	adc ($FF.b,S),Y		; 73 FF
	adc $1F00F9.l,X		; 7F F9 00 1F
	eor ($FD.b,S),Y		; 53 FD
	ora ($00.b,X)		; 01 00
	brk $24.b		; 00 24
	brk $47.b		; 00 47
	brk $6B.b		; 00 6B
	brk $AF.b		; 00 AF
	brk $D2.b		; 00 D2
	brk $16.b		; 00 16
	ora ($5A.b,X)		; 01 5A
	ora ($00.b,X)		; 01 00
	brk $4A.b		; 00 4A
	and #$94.b		; 29 94
	eor ($FF.b)		; 52 FF
	adc $B40131.l,X		; 7F 31 01 B4
	ora $0161.w		; 0D 61 01
	stp		; DB
	rol $00.b,X		; 36 00
	brk $63.b		; 00 63
	brk $E7.b		; 00 E7
	brk $6B.b		; 00 6B
	ora ($EF.b,X)		; 01 EF
	ora ($73.b,X)		; 01 73
	cop $F7.b		; 02 F7
	cop $7B.b		; 02 7B
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	pld		; 2B
	sbc $7FFF53.l,X		; FF 53 FF 7F
	sty $52.b,X		; 94 52
	lsr A		; 4A
	and #$CF.b		; 29 CF
	brk $15.b		; 00 15
	ora $3DEF.w		; 0D EF 3D
	and $9946.w,X		; 3D 46 99
	and $F6.b,X		; 35 F6
	bit $95.b		; 24 95
	trb $32.b		; 14 32
	tsb $082E.w		; 0C 2E 08
	asl A		; 0A
	tsb $07.b		; 04 07
	brk $04.b		; 00 04
	brk $FF.b		; 00 FF
	adc $EF5EF7.l,X		; 7F F7 5E EF
	and $1CE7.w,X		; 3D E7 1C
	brk $00.b		; 00 00
	sbc $3EAF5E.l,X		; FF 5E AF 3E
	sbc $739C7F.l,X		; FF 7F 9C 73
	clc		; 18
	adc $94.b,S		; 63 94
	eor ($31.b)		; 52 31
	lsr $AD.b		; 46 AD
	and $4A.b,X		; 35 4A
	and #$C6.b		; 29 C6
	clc		; 18
	adc $0C.b,S		; 63 0C
	brk $00.b		; 00 00
	lda ($02.b),Y		; B1 02
	lda $02.b,X		; B5 02
	ora #$00.b		; 09 00
	sta $1C00.w		; 8D 00 1C
	eor ($29.b,S),Y		; 53 29
	and $DF.b		; 25 DF
	adc $9F57BF.l		; 6F BF 57 9F
	eor $5F.b,S		; 43 5F
	and $7726DB.l		; 2F DB 26 77
	asl $09D2.w,X		; 1E D2 09
	cmp #$00.b		; C9 00
	clv		; B8
	trb $B0.b		; 14 B0
	trb $FF.b		; 14 FF
	adc $EF5EF7.l,X		; 7F F7 5E EF
	and $1CE7.w,X		; 3D E7 1C
	brk $00.b		; 00 00
	eor $4B55.w,Y		; 59 55 4B
	eor $230000.l		; 4F 00 00 23
	jsr $0000.w		; 20 00 00
	and $20.b,S		; 23 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	sbc $6801FF.l,X		; FF FF 01 68
	pea $F466.w		; F4 66 F4
	ror $00.b		; 66 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pha		; 48
	cpx #$0F.b		; E0 0F
	asl $E11E.w,X		; 1E 1E E1
	lda $CE.b,S		; A3 CE
	and #$68.b		; 29 68
	asl $E100.w,X		; 1E 00 E1
	bne  13.b		; D0 0D
	and $E7FC.w,X		; 3D FC E7
	dey		; 88
	cpx #$FF.b		; E0 FF
	bpl  46.b		; 10 2E
	cmp $36C3.w,X		; DD C3 36
	phy		; 5A
	tay		; A8
	inc $F4EF.w		; EE EF F4
	sbc ($34.b,X)		; E1 34
	eor $B4D0DB.l,X		; 5F DB D0 B4
	cop $32.b		; 02 32
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	ora $B8C1.w		; 0D C1 B8
	lsr $10D1.w,X		; 5E D1 10
	ora ($00.b,X)		; 01 00
	brk $02.b		; 00 02
	bpl -92.b		; 10 A4
	ora ($31.b)		; 12 31
	sbc $0E4324.l,X		; FF 24 43 0E
	dec $A823.w		; CE 23 A8
	cmp $BC3113.l,X		; DF 13 31 BC
	tsb $53.b		; 04 53
	jmp.w [$A8F3]		; DC F3 A8
	eor $FE.b,S		; 43 FE
	cmp $21F1.w,X		; DD F1 21
	ora $A81300.l		; 0F 00 13 A8
	and ($DC.b),Y		; 31 DC
	dec $4403.w		; CE 03 44
	ora $E1CD.w		; 0D CD E1
	tya		; 98
	bit $44.b,X		; 34 44
	asl $D1BA.w,X		; 1E BA D1
	and ($1F.b),Y		; 31 1F
	inc $F198.w,X		; FE 98 F1
	ora ($FD.b),Y		; 11 FD
	sbc $53.b,S		; E3 53
	phd		; 0B
	stz $88F1.w		; 9C F1 88
	adc $1D.b		; 65 1D
	lda $2003.w,X		; BD 03 20
	jmp.w [$F2AC]		; DC AC F2
	dey		; 88
	and ($FC.b)		; 32 FC
	lda $0E00.w,X		; BD 00 0E
	wai		; CB
	dec $88F1.w,X		; DE F1 88
	bit $30.b,X		; 34 30
	stp		; DB
	txs		; 9A
	sbc ($44.b,S),Y		; F3 44
	asl $88DE.w,X		; 1E DE 88
	beq   0.b		; F0 00
	sbc $ED3024.l,X		; FF 24 30 ED
	cmp $88DE.w		; CD DE 88
	trb $31.b		; 14 31
	inc $EDF1.w,X		; FE F1 ED
	cmp $882F14.l		; CF 14 2F 88
	wai		; CB
	lda $13F0.w,X		; BD F0 13
	eor ($DC.b,X)		; 41 DC
	ldy $88CE.w,X		; BC CE 88
	sbc ($23.b,X)		; E1 23
	ora $FEBE.w		; 0D BE FE
	cmp $01EF.w,X		; DD EF 01
	tya		; 98
	ora $EE0EEF.l,X		; 1F EF 0E EE
	ora ($22.b,X)		; 01 22
	ora $DD98DD.l,X		; 1F DD 98 DD
	bne  36.b		; D0 24
	and ($ED.b)		; 32 ED
	dec $00E0.w,X		; DE E0 00
	sei		; 78
	bne  34.b		; D0 22
	and ($FD.b,X)		; 21 FD
	wai		; CB
	plb		; AB
	trb $30.b		; 14 30
	sei		; 78
	inc $FFF0.w		; EE F0 FF
	cop $44.b		; 02 44
	jsr $F1EE.w		; 20 EE F1
	dey		; 88
	ora ($33.b)		; 12 33
	jsr $03FF.w		; 20 FF 03
	and ($13.b)		; 32 13
	jsl $E0FF88.l		; 22 88 FF E0
	ora ($34.b,S),Y		; 13 34
	mvp $DF,$2F		; 44 2F DF
	ora ($88.b,S),Y		; 13 88
	eor $42.b		; 45 42
	ora $5513EE.l,X		; 1F EE 13 55
	.db $42, $11		; 42 11
	dey		; 88
	jsl $0F4234.l		; 22 34 42 0F
	ora ($35.b,X)		; 01 35
	adc $32.b		; 65 32
	tya		; 98
	ora ($21.b),Y		; 11 21
	inc $2201.w,X		; FE 01 22
	eor $31.b,S		; 43 31
	ora $230188.l		; 0F 88 01 23
	eor $1E.b,S		; 43 1E
	sbc $636723.l		; EF 23 67 63
	sei		; 78
	ora $1003.w		; 0D 03 10
	bit $55.b		; 24 55
	asl $6615.w,X		; 1E 15 66
	sei		; 78
	.db $42, $11		; 42 11
	ora ($00.b,X)		; 01 00
	trb $44.b		; 14 44
	ora $78CE.w,X		; 1D CE 78
	brk $FF.b		; 00 FF
	cop $34.b		; 02 34
	rol $CEBB.w		; 2E BB CE
	ora ($88.b)		; 12 88
	ora ($0D.b),Y		; 11 0D
	wai		; CB
	cmp $DD0F10.l,X		; DF 10 0F DD
	inc $DF78.w		; EE 78 DF
	jsr ($AC99.w,X)		; FC 99 AC
	wai		; CB
	ldy $CDDC.w		; AC DC CD
	sei		; 78
	stp		; DB
	tax		; AA
	dec $9BCA.w,X		; DE CA 9B
	cmp $12DE.w		; CD DE 12
	dey		; 88
	cpx $EFBC.w		; EC BC EF
	sbc $11EF.w		; ED EF 11
	sbc $78DD.w,X		; FD DD 78
	ldy $DFCC.w,X		; BC CC DF
	brk $EA.b		; 00 EA
	tax		; AA
	bne  13.b		; D0 0D
	sei		; 78
	cmp $1FF1.w,X		; DD F1 1F
	cpx $E0AB.w		; EC AB E0
	and $2F.b,S		; 23 2F
	sei		; 78
	wai		; CB
	cmp $FE4213.l		; CF 13 42 FE
	dec $00F0.w,X		; DE F0 00
	pla		; 68
	brk $01.b		; 00 01
	.db $42, $FC		; 42 FC
	lda $1F34.w,X		; BD 34 1F
	ora ($78.b,X)		; 01 78
	bpl -19.b		; 10 ED
	dec $23F0.w,X		; DE F0 23
	and ($FC.b)		; 32 FC
	plb		; AB
	sei		; 78
	bne  52.b		; D0 34
	and ($31.b,S),Y		; 33 31
	inc $F1EF.w,X		; FE EF F1
	jsl $000078.l		; 22 78 00 00
	cop $34.b		; 02 34
	and ($34.b,S),Y		; 33 34
	and ($00.b),Y		; 31 00
	sei		; 78
	and $42.b		; 25 42
	jsl $F2FE10.l		; 22 10 FE F2
	lsr $65.b		; 46 65
	sei		; 78
	bmi  -1.b		; 30 FF
	ora ($31.b,X)		; 01 31
	ora ($44.b,S),Y		; 13 44
	and ($E0.b),Y		; 31 E0
	sei		; 78
	bit $77.b		; 24 77
	adc $51.b		; 65 51
	inc $66F2.w,X		; FE F2 66
	mvp $23,$88		; 44 88 23
	and ($12.b,S),Y		; 33 12
	jsl $012112.l		; 22 12 21 01
	jsl $1F2288.l		; 22 88 22 1F
	sbc $433401.l,X		; FF 01 34 43
	bpl -16.b		; 10 F0
	dey		; 88
	ora ($0F.b)		; 12 0F
	inc $24E1.w		; EE E1 24
	mvp $1F,$22		; 44 22 1F
	sei		; 78
	ldy $22F1.w,X		; BC F1 22
	bpl  20.b		; 10 14
	eor $10.b,S		; 43 10
	sbc $550478.l,X		; FF 78 04 55
	and ($ED.b),Y		; 31 ED
	cmp $01DF.w,X		; DD DF 01
	bit $78.b		; 24 78
	mvn $FC,$20		; 54 20 FC
	tyx		; BB
	cmp $EC4123.l,X		; DF 23 41 EC
	sei		; 78
	lda $F0F0.w,X		; BD F0 F0
	sbc $EECDED.l,X		; FF ED CD EE
	cmp $F178.w,X		; DD 78 F1
	bpl -19.b		; 10 ED
	cmp $CDDC.w		; CD DC CD
	cmp $78F1.w,X		; DD F1 78
	asl $CBCC.w		; 0E CC CB
	txs		; 9A
	dec $0DF0.w,X		; DE F0 0D
	jmp.w [$CA78]		; DC 78 CA
	cpy $ECDE.w		; CC DE EC
	ldy $BACC.w,X		; BC CC BA
	plb		; AB
	dey		; 88
	sbc $DC0F00.l		; EF 00 0F DC
	dec $DEEE.w		; CE EE DE
	sbc $00E078.l		; EF 78 E0 00
	cpx $DEBC.w		; EC BC DE
	cmp $DDDE.w,X		; DD DE DD
	pla		; 68
	cmp $BDCA0D.l,X		; DF 0D CA BD
	sbc $D0BD.w,X		; FD BD D0
	ora ($68.b),Y		; 11 68
	sbc $F0BC.w		; ED BC F0
	beq  35.b		; F0 23
	and ($FC.b)		; 32 FC
	ldy $0078.w,X		; BC 78 00
	beq  35.b		; F0 23
	and ($FD.b)		; 32 FD
	bne  37.b		; D0 25
	adc [$78.b],Y		; 77 78
	rti		; 40

	jmp.w [$25E0]		; DC E0 25
	ror $52.b		; 66 52
	brk $12.b		; 00 12
	sei		; 78
	eor $43.b		; 45 43
	ora ($01.b),Y		; 11 01
	ora ($45.b,S),Y		; 13 45
	adc [$53.b]		; 67 53
	sei		; 78
	jsr $3202.w		; 20 02 32
	and ($22.b)		; 32 22
	eor $21.b,S		; 43 21
	bit $78.b		; 24 78
	mvn $32,$44		; 54 44 32
	bit $33.b		; 24 33
	and ($11.b,S),Y		; 33 11
	bit $78.b		; 24 78
	mvp $43,$44		; 44 44 43
	and ($22.b,S),Y		; 33 22
	and $22.b,S		; 23 22
	jsl $433378.l		; 22 78 33 43
	and ($33.b,S),Y		; 33 33
	jsr $23FF.w		; 20 FF 23
	.db $42, $68		; 42 68
	inc $6626.w,X		; FE 26 66
	eor $10.b,S		; 43 10
	ora ($11.b,X)		; 01 11
	ora ($68.b),Y		; 11 68
	jsl $205434.l		; 22 34 54 20
	brk $10.b		; 00 10
	xba		; EB
	cpy #$68.b		; C0 68
	eor [$50.b]		; 47 50
	sbc ($10.b),Y		; F1 10
	phx		; DA
	ldy $5105.w		; AC 05 51
	sei		; 78
	beq   0.b		; F0 00
	sbc $01CF.w		; ED CF 01
	ora $78FFEE.l		; 0F EE FF 78
	brk $0E.b		; 00 0E
	stp		; DB
	lda $0F01.w,X		; BD 01 0F
	brk $0D.b		; 00 0D
	sei		; 78
	ldy $0FFF.w,X		; BC FF 0F
	cpx $EFDD.w		; EC DD EF
	sbc $EE78EE.l,X		; FF EE 78 EE
	inc $CCED.w		; EE ED CC
	beq  33.b		; F0 21
	ora $FF7800.l		; 0F 00 78 FF
	sbc $CCCC.w		; ED CC CC
	cmp $FD1011.l,X		; DF 11 10 FD
	sei		; 78
	cmp $FFDE.w,X		; DD DE FF
	sbc $BCDB.w		; ED DB BC
	cpy $78EF.w		; CC EF 78
	ora $CEDBEC.l		; 0F EC DB CE
	jsr ($EECD.w,X)		; FC CD EE
	sbc $CD78.w,X		; FD 78 CD
	inc $EFFF.w		; EE FF EF
	brk $0F.b		; 00 0F
	wai		; CB
	lda $D068.w,X		; BD 68 D0
	ora $CD0EEF.l		; 0F EF 0E CD
	sbc ($2F.b),Y		; F1 2F
	ldy $0178.w		; AC 78 01
	ora $13CFCC.l		; 0F CC CF 13
	bpl   1.b		; 10 01
	bpl 104.b		; 10 68
	sbc $01DD.w		; ED DD 01
	cpx $23E1.w		; EC E1 23
	lsr $65.b		; 46 65
	pla		; 68
	ora $1212F1.l,X		; 1F F1 12 12
	lsr $53.b		; 46 53
	and ($11.b,X)		; 21 11
	pla		; 68
	bit $76.b		; 24 76
	eor ($11.b),Y		; 51 11
	bit $53.b,X		; 34 53
	and ($33.b,S),Y		; 33 33
	sei		; 78
	and $34.b,S		; 23 34
	and ($0F.b)		; 32 0F
	beq  18.b		; F0 12
	bit $44.b,X		; 34 44
	sei		; 78
	and ($12.b)		; 32 12
	and $44.b,S		; 23 44
	mvp $22,$32		; 44 32 22
	bit $78.b,X		; 34 78
	eor ($21.b,S),Y		; 53 21
	bit $45.b,X		; 34 45
	eor $44.b,X		; 55 44
	and ($33.b,S),Y		; 33 33
	sei		; 78
	jsl $315445.l		; 22 45 54 31
	and $32.b,S		; 23 32
	jsl $246423.l		; 22 23 64 24
	mvp $55,$55		; 44 55 55
	eor ($21.b,S),Y		; 53 21
	asl $68DD.w		; 0E DD 68
	mvp $42,$45		; 44 45 42
	ora ($21.b)		; 12 21
	ora ($1E.b)		; 12 1E
	sbc ($68.b,X)		; E1 68
	bit $45.b,X		; 34 45
	eor $1F.b,S		; 43 1F
	jmp.w [$02CD]		; DC CD 02
	jsr $FF68.w		; 20 68 FF
	inc $BBED.w		; EE ED BB
	dec $0EEF.w,X		; DE EF 0E
	sbc $EE78.w		; ED 78 EE
	inc $DFCD.w		; EE CD DF
	beq  -2.b		; F0 FE
	wai		; CB
	cmp $FE78.w		; CD 78 FE
	inc $FE0F.w		; EE 0F FE
	cpy $CCDE.w		; CC DE CC
	sbc $DCFE78.l		; EF 78 FE DC
	dec $DCED.w,X		; DE ED DC
	sbc $78DDED.l		; EF ED DD 78
	cmp $EECEED.l,X		; DF ED CE EE
	cmp $DDDE.w		; CD DE DD
	cpy $BF68.w		; CC 68 BF
	xba		; EB
	ldy $DDCD.w		; AC CD DD
	ldy $BCDC.w,X		; BC DC BC
	pla		; 68
	dec $CDED.w,X		; DE ED CD
	cpx #$FC.b		; E0 FC
	txs		; 9A
	cpy #$21.b		; C0 21
	pla		; 68
	cpx $F0CD.w		; EC CD F0
	ora $ADB9.w		; 0D B9 AD
	ora ($20.b)		; 12 20
	pla		; 68
	cmp $DFDD.w,X		; DD DD DF
	inc $FFEE.w,X		; FE EE FF
	sbc $525813.l,X		; FF 13 58 52
	wai		; CB
	cmp $35E1EF.l		; CF EF E1 35
	and ($11.b,X)		; 21 11
	cli		; 58
	ora $654501.l		; 0F 01 45 65
	and ($21.b)		; 32 21
	ora ($0F.b),Y		; 11 0F
	pla		; 68
	ora ($44.b,S),Y		; 13 44
	and ($01.b,X)		; 21 01
	ora ($22.b,S),Y		; 13 22
	jsl $116822.l		; 22 22 68 11
	and ($20.b,S),Y		; 33 20
	ora ($34.b),Y		; 11 34
	rti		; 40

	sbc ($55.b)		; F2 55
	pla		; 68
	.db $42, $14		; 42 14
	eor $23.b,S		; 43 23
	bit $43.b,X		; 34 43
	ora ($35.b),Y		; 11 35
	sei		; 78
	eor $21.b,S		; 43 21
	jsl $122133.l		; 22 33 21 12
	jsl $246822.l		; 22 22 68 24
	adc [$55.b]		; 67 55
	lsr $64.b,X		; 56 64
	and ($44.b,S),Y		; 33 44
	eor $78.b,X		; 55 78
	jsl $213423.l		; 22 23 34 21
	sbc ($24.b),Y		; F1 24
	and $23.b,S		; 23 23
	sei		; 78
	ora ($01.b)		; 12 01
	and $33.b,S		; 23 33
	and ($11.b)		; 32 11
	ora ($11.b),Y		; 11 11
	sei		; 78
	jsl $111121.l		; 22 21 11 11
	jsl $313333.l		; 22 33 33 31
	cli		; 58
	cmp #$C2.b		; C9 C2
	eor $31.b,X		; 55 31
	ora $55.b,S		; 03 55
	rti		; 40

	sbc ($58.b,X)		; E1 58
	lsr $53.b,X		; 56 53
	ora $149CFB.l		; 0F FB 9C 14
	eor ($EC.b)		; 52 EC
	cli		; 58
	dec $2E24.w		; CE 24 2E
	plb		; AB
	sbc ($32.b,X)		; E1 32
	dex		; CA
	wai		; CB
	pla		; 68
	cpy $F0EF.w		; CC EF F0
	inc $FDDF.w,X		; FE DF FD
	tsx		; BA
	cpy $FF78.w		; CC 78 FF
	cpx $EFDE.w		; EC DE EF
	inc $DCDD.w,X		; FE DD DC
	cmp $ED78.w,X		; DD 78 ED
	sbc $DDDC.w		; ED DC DD
	inc $CCDC.w		; EE DC CC
	cmp $CD78.w		; CD 78 CD
	sbc $CDCCEC.l		; EF EC CC CD
	sbc $DDDC.w		; ED DC DD
	sei		; 78
	cmp $CDDC.w,X		; DD DC CD
	cmp $EFEE.w,X		; DD EE EF
	sbc $78CC.w,X		; FD CC 78
	cmp $EFEE.w,X		; DD EE EF
	sbc $DEDEDE.l,X		; FF DE DE DE
	beq 100.b		; F0 64
	cmp $00EF.w,X		; DD EF 00
	ora ($33.b,X)		; 01 33
	ora $58E2DC.l,X		; 1F DC E2 58
	tsb $C9DD.w		; 0C DD C9
	cpy #$45.b		; C0 45
	eor ($1E.b,S),Y		; 53 1E
	wai		; CB
	cli		; 58
	sbc ($46.b,X)		; E1 46
	mvn $43,$45		; 54 45 43
	jsr $250F.w		; 20 0F 25
	pla		; 68
	and ($33.b,S),Y		; 33 33
	mvp $32,$33		; 44 33 32
	jsl $682221.l		; 22 21 22 68
	and ($44.b,S),Y		; 33 44
	eor ($33.b,S),Y		; 53 33
	lsr $64.b,X		; 56 64
	ora ($03.b),Y		; 11 03
	pla		; 68
	eor $45.b,X		; 55 45
	mvn $55,$44		; 54 44 55
	mvn $43,$44		; 54 44 43
	pla		; 68
	eor $64.b		; 45 64
	mvp $55,$44		; 44 44 55
	and ($33.b,S),Y		; 33 33
	eor $68.b		; 45 68
	adc $43.b		; 65 43
	and $44.b,S		; 23 44
	eor $65.b		; 45 65
	mvn $78,$43		; 54 43 78
	ora ($12.b),Y		; 11 12
	bit $43.b,X		; 34 43
	bpl  17.b		; 10 11
	ora ($33.b,S),Y		; 13 33
	pla		; 68
	eor $44.b		; 45 44
	eor $54.b		; 45 54
	eor $32.b,S		; 43 32
	jsl $445833.l		; 22 33 58 44
	lsr $56.b		; 46 56
	eor $34.b,S		; 43 34
	eor $43.b,S		; 43 43
	ora $440358.l		; 0F 58 03 44
	eor ($FD.b,S),Y		; 53 FD
	bne  17.b		; D0 11
	beq  18.b		; F0 12
	cli		; 58
	and ($1E.b)		; 32 1E
	cpy $E0BD.w		; CC BD E0
	asl $BDCB.w		; 0E CB BD
	pla		; 68
	brk $00.b		; 00 00
	sbc $F0BC.w,X		; FD BC F0
	bpl  -3.b		; 10 FD
	cmp $F168.w		; CD 68 F1
	sbc $DFBCDD.l,X		; FF DD BC DF
	sbc $68FEF0.l,X		; FF F0 FE 68
	cmp $FFDE.w,X		; DD DE FF
	beq -18.b		; F0 EE
	dec $EBE0.w,X		; DE E0 EB
	pla		; 68
	ldx $DDEE.w,Y		; BE EE DD
	dec $CCDC.w,X		; DE DC CC
	cpy $78CC.w		; CC CC 78
	inc $FEFF.w		; EE FF FE
	sbc $DEDC.w		; ED DC DE
	inc $68EF.w		; EE EF 68
	ldy $BBBC.w,X		; BC BC BB
	cmp $BAEC.w		; CD EC BA
	sta $78BC.w,Y		; 99 BC 78
	sbc $FFDE0F.l		; EF 0F DE FF
	inc $DDDC.w		; EE DC DD
	inc $1F68.w		; EE 68 1F
	dex		; CA
	tax		; AA
	ldy $EFBD.w		; AC BD EF
	jmp.w [$68B9]		; DC B9 68
	txy		; 9B
	cmp $DCDD.w,X		; DD DD DC
	dec $EDEE.w,X		; DE EE ED
	cpy $9B58.w		; CC 58 9B
	sbc ($1E.b)		; F2 1E
	jmp.w [$20E1]		; DC E1 20
	inc $58EE.w,X		; FE EE 58
	sbc $3611F0.l,X		; FF F0 11 36
	ror $3D.b,X		; 76 3D
	lda $5815.w,X		; BD 15 58
	.db $62, $F0, $14		; 62 F0 14
	ror $64.b		; 66 64
	and ($23.b)		; 32 23
	eor $68.b,S		; 43 68
	ora ($33.b,S),Y		; 13 33
	bit $33.b,X		; 34 33
	mvn $42,$33		; 54 33 42
	bit $78.b,X		; 34 78
	jsl $342233.l		; 22 33 22 34
	and ($22.b,S),Y		; 33 22
	jsl $766833.l		; 22 33 68 76
	adc $56.b,X		; 75 56
	ror $77.b		; 66 77
	eor $55.b,X		; 55 55
	eor $68.b		; 45 68
	lsr $54.b,X		; 56 54
	bit $66.b,X		; 34 66
	ror $54.b		; 66 54
	mvp $68,$44		; 44 44 68
	mvp $44,$54		; 44 54 44
	eor $45.b,S		; 43 45
	eor $33.b,S		; 43 33
	jsl $644668.l		; 22 68 46 64
	eor $32.b,S		; 43 32
	and ($45.b,S),Y		; 33 45
	adc $31.b		; 65 31
	cli		; 58
	ora ($44.b)		; 12 44
	mvn $66,$45		; 54 45 66
	ror $63.b		; 66 63
	brk $58.b		; 00 58
	ora ($21.b),Y		; 11 21
	ora ($22.b,X)		; 01 22
	bit $31.b		; 24 31
	cmp $58E0.w,X		; DD E0 58
	cop $0F.b		; 02 0F
	sbc $DDCDDB.l		; EF DB CD DD
	cmp $CB58FF.l,X		; DF FF 58 CB
	ldy $DCCD.w,X		; BC CD DC
	txs		; 9A
	ldx $BADC.w,Y		; BE DC BA
	pla		; 68
	cpy $EFDD.w		; CC DD EF
	asl $BDDB.w		; 0E DB BD
	jmp.w [$68CD]		; DC CD 68
	jmp.w [$DDCB]		; DC CB DD
	stp		; DB
	plb		; AB
	cmp $CCDC.w		; CD DC CC
	pla		; 68
	wai		; CB
	ldy $BDBB.w,X		; BC BB BD
	wai		; CB
	ldy $CCCC.w,X		; BC CC CC
	pla		; 68
	tyx		; BB
	ldy $DDBC.w,X		; BC BC DD
	cmp $CCCB.w,X		; DD CB CC
	tyx		; BB
	pla		; 68
	dec $DCDD.w,X		; DE DD DC
	ldy $DDDE.w,X		; BC DE DD
	cpy $68CC.w		; CC CC 68
	dec $CBED.w,X		; DE ED CB
	cmp $EDEE.w		; CD EE ED
	cmp $54DD.w,X		; DD DD 54
	ldx $2112.w,Y		; BE 12 21
	ora ($11.b),Y		; 11 11
	ora $58F2DD.l,X		; 1F DD F2 58
	ora $ECF0EF.l		; 0F EF F0 EC
	cpy #$01.b		; C0 01
	ora $EF58DE.l		; 0F DE 58 EF
	sbc $CC1FF1.l,X		; FF F1 1F CC
	cmp $580012.l		; CF 12 00 58
	inc $BEBA.w,X		; FE BA BE
	brk $01.b		; 00 01
	brk $12.b		; 00 12
	ora ($58.b),Y		; 11 58
	bpl  18.b		; 10 12
	and ($34.b)		; 32 34
	and ($22.b,S),Y		; 33 22
	and ($34.b,S),Y		; 33 34
	pla		; 68
	and $33.b,S		; 23 33
	and $33.b,S		; 23 33
	and ($24.b,X)		; 21 24
	eor $45.b,S		; 43 45
	pla		; 68
	eor $11.b,S		; 43 11
	ora ($35.b,S),Y		; 13 35
	mvp $44,$55		; 44 55 44
	eor $68.b,S		; 43 68
	and ($43.b,S),Y		; 33 43
	eor $45.b,S		; 43 45
	ror $66.b		; 66 66
	mvp $68,$32		; 44 32 68
	bit $57.b		; 24 57
	ror $44.b,X		; 76 44
	mvp $55,$33		; 44 33 55
	eor $68.b		; 45 68
	eor $44.b,X		; 55 44
	and ($33.b,S),Y		; 33 33
	mvp $32,$44		; 44 44 32
	and ($68.b,S),Y		; 33 68
	and ($44.b)		; 32 44
	mvp $22,$43		; 44 43 22
	and $34.b,S		; 23 34
	eor $68.b,S		; 43 68
	jsl $443322.l		; 22 22 33 44
	and ($22.b)		; 32 22
	jsl $755833.l		; 22 33 58 75
	and ($FE.b),Y		; 31 FE
	cpx #$24.b		; E0 24
	adc $20.b		; 65 20
	ora $34CF48.l		; 0F 48 CF 34
	bmi -20.b		; 30 EC
	plb		; AB
	ldx $1F11.w,Y		; BE 11 1F
	cli		; 58
	inc $DEED.w,X		; FE ED DE
	jmp.w [$BCBB]		; DC BB BC
	inc $58ED.w		; EE ED 58
	cpx $AABB.w		; EC BB AA
	lda $BADD.w,X		; BD DD BA
	txs		; 9A
	txs		; 9A
	pla		; 68
	sbc $DDDDED.l		; EF ED DD DD
	sbc $DDDD.w		; ED DD DD
	cpy $CC68.w		; CC 68 CC
	cpy $BCCC.w		; CC CC BC
	cmp $BCBA.w,X		; DD BA BC
	tsx		; BA
	pla		; 68
	ldy $CCCB.w,X		; BC CB CC
	tyx		; BB
	cpy $BBBB.w		; CC BB BB
	wai		; CB
	pla		; 68
	tsx		; BA
	tax		; AA
	cmp $BBDC.w		; CD DC BB
	tyx		; BB
	ldy $68DE.w,X		; BC DE 68
	jmp.w [$BACC]		; DC CC BA
	cmp $DDDD.w		; CD DD DD
	cmp $68EF.w		; CD EF 68
	sbc $DDDD.w		; ED DD DD
	cpy $DEDE.w		; CC DE DE
	sbc $DC58FF.l,X		; FF FF 58 DC
	cpy $DDCC.w		; CC CC DD
	inc $ECEF.w		; EE EF EC
	ldy $C048.w,X		; BC 48 C0
	mvp $ED,$20		; 44 20 ED
	cpx #$00.b		; E0 00
	ora ($35.b)		; 12 35
	cli		; 58
	mvp $33,$32		; 44 32 33
	and ($F0.b),Y		; 31 F0
	mvp $44,$43		; 44 43 44
	cli		; 58
	eor $33.b,S		; 43 33
	and ($10.b)		; 32 10
	brk $35.b		; 00 35
	ror $44.b,X		; 76 44
	cli		; 58
	bit $22.b,X		; 34 22
	bit $66.b		; 24 66
	ror $66.b		; 66 66
	mvp $68,$34		; 44 34 68
	and $44.b,S		; 23 44
	and ($44.b,S),Y		; 33 44
	and ($33.b,S),Y		; 33 33
	bit $45.b,X		; 34 45
	pla		; 68
	eor $54.b,X		; 55 54
	jsl $435445.l		; 22 45 54 43
	eor $43.b,S		; 43 43
	pla		; 68
	eor $45.b,S		; 43 45
	mvp $33,$34		; 44 34 33
	bit $33.b,X		; 34 33
	eor $68.b		; 45 68
	and ($44.b,S),Y		; 33 44
	and $33.b,S		; 23 33
	and ($33.b,S),Y		; 33 33
	mvp $68,$22		; 44 22 68
	and ($35.b,S),Y		; 33 35
	eor ($33.b,S),Y		; 53 33
	and ($45.b,S),Y		; 33 45
	eor $22.b,S		; 43 22
	cli		; 58
	eor $55.b		; 45 55
	eor [$63.b],Y		; 57 63
	and $35.b,S		; 23 35
	eor $44.b,X		; 55 44
	cli		; 58
	asl $12F2.w,X		; 1E F2 12
	bpl   2.b		; 10 02
	bit $44.b,X		; 34 44
	and ($48.b),Y		; 31 48
	inc $ABDC.w,X		; FE DC AB
	cmp ($31.b,X)		; C1 31
	asl $33F3.w		; 0E F3 33
	cli		; 58
	ora $CFEDEE.l		; 0F EE ED CF
	ora $CCDCDD.l		; 0F DD DC CC
	cli		; 58
	cmp $FFEF.w		; CD EF FF
	jsr ($BCAA.w,X)		; FC AA BC
	sbc $68CA.w		; ED CA 68
	cmp $EEDD.w,X		; DD DD EE
	inc $CDDC.w		; EE DC CD
	sbc $68DD.w		; ED DD 68
	sbc $DDCB.w		; ED CB DD
	cmp $CEDC.w,X		; DD DC CE
	sbc $68CD.w		; ED CD 68
	cpy $CCCD.w		; CC CD CC
	cmp $EDEE.w,X		; DD EE ED
	cpy $68CC.w		; CC CC 68
	cmp $DDDD.w		; CD DD DD
	cpy $CDCB.w		; CC CB CD
	inc $68DD.w		; EE DD 68
	dec $BBDC.w,X		; DE DC BB
	ldy $CCDD.w,X		; BC DD CC
	cmp $68CC.w,X		; DD CC 68
	cmp $DECC.w		; CD CC DE
	cpx $CCCB.w		; EC CB CC
	sbc $68DC.w		; ED DC 68
	sbc $EDED.w		; ED ED ED
	inc $DCFE.w		; EE FE DC
	cpy $58EE.w		; CC EE 58
	inc $CCDB.w,X		; FE DB CC
	cmp $0FF0.w		; CD F0 0F
	jmp.w [$48DF]		; DC DF 48
	brk $ED.b		; 00 ED
	bne   3.b		; D0 03
	mvp $DF,$0D		; 44 0D DF
	trb $58.b		; 14 58
	and ($33.b,S),Y		; 33 33
	jsl $545633.l		; 22 33 56 54
	and ($02.b)		; 32 02
	pla		; 68
	jsl $214333.l		; 22 33 43 21
	jsl $233323.l		; 22 23 33 23
	pla		; 68
	and $34.b,S		; 23 34
	eor $22.b,S		; 43 22
	and ($33.b)		; 32 33
	and ($33.b)		; 32 33
	cli		; 58
	stz $56.b		; 64 56
	adc [$55.b],Y		; 77 55
	lsr $66.b,X		; 56 66
	ror $66.b		; 66 66
	pla		; 68
	mvp $43,$44		; 44 44 43
	and ($34.b,S),Y		; 33 34
	eor $44.b,S		; 43 44
	mvn $43,$68		; 54 68 43
	mvn $44,$43		; 54 43 44
	eor $35.b,S		; 43 35
	mvn $68,$44		; 54 44 68
	eor $43.b,S		; 43 43
	and $33.b,S		; 23 33
	bit $34.b		; 24 34
	and ($12.b,S),Y		; 33 12
	cli		; 58
	eor $56.b,X		; 55 56
	adc [$65.b]		; 67 65
	lsr $54.b,X		; 56 54
	and ($35.b)		; 32 35
	cli		; 58
	ror $64.b,X		; 76 64
	mvp $45,$44		; 44 44 45
	eor $43.b,X		; 55 43
	bit $58.b		; 24 58
	ror $43.b		; 66 43
	jsl $121121.l		; 22 21 11 12
	and $32.b,S		; 23 32
	pha		; 48
	ora $102100.l,X		; 1F 00 21 10
	xba		; EB
	cpy $EDDE.w		; CC DE ED
	cli		; 58
	inc $CDCB.w		; EE CB CD
	jmp.w [$BBCC]		; DC CC BB
	cpy $68CD.w		; CC CD 68
	inc $DCDD.w,X		; FE DD DC
	dec $DDED.w,X		; DE ED DD
	dec $68ED.w,X		; DE ED 68
	dec $EEDD.w,X		; DE DD EE
	cpy $DDCD.w		; CC CD DD
	cmp $68DC.w,X		; DD DC 68
	cpy $DCCD.w		; CC CD DC
	cmp $CCEC.w		; CD EC CC
	wai		; CB
	ldy $CD68.w,X		; BC 68 CD
	jmp.w [$ECCD]		; DC CD EC
	cpy $CDCC.w		; CC CC CD
	cmp $AA64.w,X		; DD 64 AA
	plb		; AB
	tyx		; BB
	tyx		; BB
	cpy $DECC.w		; CC CC DE
	inc $DD68.w		; EE 68 DD
	cmp $ECEE.w,X		; DD EE EC
	cmp $EDED.w,X		; DD ED ED
	jmp.w [$AB58]		; DC 58 AB
	tyx		; BB
	cmp $BACB.w		; CD CB BA
	tax		; AA
	ldy $58CA.w,X		; BC CA 58
	ldy $DCDC.w,X		; BC DC DC
	cpy $BDCB.w		; CC CB BD
	cpx #$0F.b		; E0 0F
	cli		; 58
	sbc $E0DDFC.l,X		; FF FC DD E0
	ora ($FF.b),Y		; 11 FF
	sbc $1248F0.l		; EF F0 48 12
	jsr $33F0.w		; 20 F0 33
	and ($10.b)		; 32 10
	inc $48F1.w,X		; FE F1 48
	bit $66.b,X		; 34 66
	eor $56.b,X		; 55 56
	eor $34.b,X		; 55 34
	bit $56.b,X		; 34 56
	cli		; 58
	mvp $54,$55		; 44 55 54
	mvp $45,$44		; 44 44 45
	adc [$65.b]		; 67 65
	pla		; 68
	and $32.b,S		; 23 32
	and ($32.b,S),Y		; 33 32
	bit $33.b,X		; 34 33
	bit $32.b,X		; 34 32
	pla		; 68
	and ($43.b,S),Y		; 33 43
	eor $32.b,S		; 43 32
	and ($33.b)		; 32 33
	eor $33.b,S		; 43 33
	pla		; 68
	and ($32.b,S),Y		; 33 32
	and ($43.b,S),Y		; 33 43
	mvp $34,$33		; 44 33 34
	and ($68.b,S),Y		; 33 68
	and ($33.b,S),Y		; 33 33
	eor $33.b,S		; 43 33
	and ($34.b,S),Y		; 33 34
	and ($33.b,S),Y		; 33 33
	cli		; 58
	lsr $76.b,X		; 56 76
	ror $75.b		; 66 75
	mvp $66,$55		; 44 55 66
	stz $58.b		; 64 58
	mvn $56,$55		; 54 55 56
	eor $44.b,X		; 55 44
	and ($34.b,S),Y		; 33 34
	eor $58.b		; 45 58
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($32.b,S),Y		; 33 32
	and ($11.b)		; 32 11
	pha		; 48
	bit $43.b		; 24 43
	bpl  35.b		; 10 23
	jsl $220022.l		; 22 22 00 22
	pha		; 48
	jsl $DEEE20.l		; 22 20 EE DE
	sbc $CCEDFF.l		; EF FF ED CC
	pha		; 48
	cmp $DBDF.w,X		; DD DF DB
	tax		; AA
	ldy $DDCC.w,X		; BC CC DD
	stp		; DB
	cli		; 58
	cmp $CDCB.w,X		; DD CB CD
	dec $DDFE.w,X		; DE FE DD
	cpy $58BC.w		; CC BC 58
	ldy $CCCC.w,X		; BC CC CC
	tyx		; BB
	jmp.w [$BABA]		; DC BA BA
	lda #$68.b		; A9 68
	jmp.w [$DDCC]		; DC CC DD
	cmp $DCDD.w,X		; DD DD DC
	cpy $68DD.w		; CC DD 68
	jmp.w [$CCBB]		; DC BB CC
	cmp $CCDB.w,X		; DD DB CC
	jmp.w [$68DD]		; DC DD 68
	cpy $CCCC.w		; CC CC CC
	cmp $CDDC.w		; CD DC CD
	cpy $68CC.w		; CC CC 68
	cmp $DDDD.w		; CD DD DD
	cmp $DCED.w,X		; DD ED DC
	sbc $68ED.w		; ED ED 68
	jmp.w [$DEDD]		; DC DD DE
	sbc $FEEE.w		; ED EE FE
	inc $58FE.w		; EE FE 58
	tax		; AA
	ldy $DDCC.w,X		; BC CC DD
	sbc $EEEE.w		; ED EE EE
	inc $AB48.w		; EE 48 AB
	cmp $EFEF.w		; CD EF EF
	inc $D0EC.w,X		; FE EC D0
	ora ($58.b),Y		; 11 58
	ora ($10.b),Y		; 11 10
	ora ($23.b),Y		; 11 23
	and ($12.b)		; 32 12
	and $33.b,S		; 23 33
	cli		; 58
	bit $43.b,X		; 34 43
	and $34.b,S		; 23 34
	bit $44.b,X		; 34 44
	bit $44.b,X		; 34 44
	cli		; 58
	mvp $66,$44		; 44 44 66
	eor $44.b,X		; 55 44
	and ($45.b,S),Y		; 33 45
	adc $58.b		; 65 58
	mvn $56,$55		; 54 55 56
	eor $65.b,X		; 55 65
	ror $65.b		; 66 65
	lsr $68.b,X		; 56 68
	and ($43.b,S),Y		; 33 43
	and ($54.b,S),Y		; 33 54
	and ($33.b)		; 32 33
	eor $23.b,S		; 43 23
	pla		; 68
	bit $33.b,X		; 34 33
	bit $43.b,X		; 34 43
	and ($43.b,S),Y		; 33 43
	jsl $565833.l		; 22 33 58 56
	eor [$65.b],Y		; 57 65
	lsr $77.b		; 46 77
	adc $55.b		; 65 55
	eor $58.b,X		; 55 58
	adc [$65.b]		; 67 65
	eor $44.b,X		; 55 44
	eor $66.b		; 45 66
	eor $44.b,S		; 43 44
	cli		; 58
	eor $44.b,S		; 43 44
	bit $54.b,X		; 34 54
	bit $54.b,X		; 34 54
	jsl $445823.l		; 22 23 58 44
	and ($33.b,S),Y		; 33 33
	jsl $113212.l		; 22 12 32 11
	and ($48.b,X)		; 21 48
	jsl $114223.l		; 22 23 42 11
	sbc $FFF0FF.l,X		; FF FF F0 FF
	pha		; 48
	inc $EEDE.w		; EE DE EE
	sbc $CECC.w		; ED CC CE
	sbc $58BB.w,X		; FD BB 58
	cmp $EDEE.w,X		; DD EE ED
	cmp $EEDD.w,X		; DD DD EE
	cmp $58DD.w,X		; DD DD 58
	tyx		; BB
	cmp $DBED.w		; CD ED DB
	tsx		; BA
	cpy $DDCC.w		; CC CC DD
	cli		; 58
	wai		; CB
	plb		; AB
	ldy $BACC.w,X		; BC CC BA
	tyx		; BB
	tyx		; BB
	cmp $DC58.w,X		; DD 58 DC
	tsx		; BA
	tax		; AA
	tyx		; BB
	wai		; CB
	tsx		; BA
	tax		; AA
	ldy $BB58.w,X		; BC 58 BB
	tax		; AA
	ldy $AACA.w		; AC CA AA
	plb		; AB
	tyx		; BB
	tyx		; BB
	cli		; 58
	tax		; AA
	plb		; AB
	plb		; AB
	plb		; AB
	plb		; AB
	ldy $ABBA.w,X		; BC BA AB
	cli		; 58
	tyx		; BB
	tsx		; BA
	ldy $CCCB.w,X		; BC CB CC
	wai		; CB
	wai		; CB
	tsx		; BA
	cli		; 58
	tax		; AA
	tyx		; BB
	ldy $CCCB.w,X		; BC CB CC
	wai		; CB
	wai		; CB
	wai		; CB
	cli		; 58
	cpy $BBDC.w		; CC DC BB
	cpy $DDCD.w		; CC CD DD
	jmp.w [$44DD]		; DC DD 44
	dec $1101.w		; CE 01 11
	bpl  13.b		; 10 0D
	cpy $F2DE.w		; CC DE F2
	sec		; 38
	ora ($DC.b,X)		; 01 DC
	ldy $32F2.w		; AC F2 32
	bmi -15.b		; 30 F1
	ora ($48.b,X)		; 01 48
	jsl $444522.l		; 22 22 45 44
	and $56.b,X		; 35 56
	eor $45.b,X		; 55 45
	cli		; 58
	and $43.b,S		; 23 43
	and ($33.b)		; 32 33
	and ($44.b,S),Y		; 33 44
	and ($33.b,S),Y		; 33 33
	cli		; 58
	bit $55.b,X		; 34 55
	mvp $44,$45		; 44 45 44
	mvp $55,$54		; 44 54 55
	cli		; 58
	adc $55.b		; 65 55
	adc $66.b		; 65 66
	ror $66.b,X		; 76 66
	ror $67.b		; 66 67
	pla		; 68
	and ($34.b,S),Y		; 33 34
	eor $33.b,S		; 43 33
	eor $43.b,S		; 43 43
	eor $43.b,S		; 43 43
	pla		; 68
	and ($43.b,S),Y		; 33 43
	bit $43.b,X		; 34 43
	bit $43.b,X		; 34 43
	bit $54.b,X		; 34 54
	cli		; 58
	adc $66.b		; 65 66
	ror $76.b,X		; 76 76
	ror $65.b		; 66 65
	eor $54.b,X		; 55 54
	cli		; 58
	eor $66.b,X		; 55 66
	mvn $44,$44		; 54 44 44
	eor $44.b,X		; 55 44
	bit $58.b,X		; 34 58
	and ($23.b,S),Y		; 33 23
	and ($33.b,S),Y		; 33 33
	and ($23.b,S),Y		; 33 23
	mvp $48,$43		; 44 43 48
	mvn $43,$53		; 54 53 43
	eor $22.b,S		; 43 22
	jsl $483422.l		; 22 22 34 48
	eor $1E.b,S		; 43 1E
	cmp $FEDE.w,X		; DD DE FE
	cpy $CCDD.w		; CC DD CC
	cli		; 58
	sbc $DCEE.w		; ED EE DC
	jmp.w [$DCDD]		; DC DD DC
	wai		; CB
	cpy $DB58.w		; CC 58 DB
	tyx		; BB
	ldy $CBBB.w,X		; BC BB CB
	tsx		; BA
	tsx		; BA
	ldy $CB58.w,X		; BC 58 CB
	tyx		; BB
	tsx		; BA
	plb		; AB
	cpy $AABB.w		; CC BB AA
	plb		; AB
	pla		; 68
	sbc $EDEE.w		; ED EE ED
	cmp $DDCD.w,X		; DD CD DD
	dec $58DD.w,X		; DE DD 58
	cpy $AAA9.w		; CC A9 AA
	lda #$9A.b		; A9 9A
	tsx		; BA
	lda #$AB.b		; A9 AB
	cli		; 58
	tax		; AA
	tax		; AA
	tax		; AA
	plb		; AB
	tyx		; BB
	plb		; AB
	ldy $58AA.w,X		; BC AA 58
	plb		; AB
	plb		; AB
	cpy $ABBB.w		; CC BB AB
	ldy $CCCC.w,X		; BC CC CC
	cli		; 58
	tyx		; BB
	cmp $CBDD.w		; CD DD CB
	cmp $DDCC.w		; CD CC DD
	cmp $CD48.w		; CD 48 CD
	cpy $CBCC.w		; CC CC CB
	cmp $0FEF.w		; CD EF 0F
	sbc $DD48.w		; ED 48 DD
	cmp $00EF.w,X		; DD EF 00
	ora $F0FF0F.l		; 0F 0F FF F0
	plp		; 28
	pea $FC41.w		; F4 41 FC
	stz $F0F0.w		; 9C F0 F0
	jsr $4801.w		; 20 01 48
	ora ($33.b),Y		; 11 33
	jsl $232301.l		; 22 01 23 23
	and ($43.b)		; 32 43
	pha		; 48
	and ($45.b,S),Y		; 33 45
	and ($34.b)		; 32 34
	eor $45.b		; 45 45
	eor $65.b,X		; 55 65
	cli		; 58
	and ($22.b,S),Y		; 33 22
	and $33.b,S		; 23 33
	and ($34.b,S),Y		; 33 34
	eor $44.b		; 45 44
	cli		; 58
	bit $45.b,X		; 34 45
	bit $55.b,X		; 34 55
	mvp $56,$55		; 44 55 56
	eor $58.b,X		; 55 58
	mvn $56,$45		; 54 45 56
	ror $55.b		; 66 55
	lsr $54.b,X		; 56 54
	eor $58.b		; 45 58
	eor $55.b		; 45 55
	eor $55.b,X		; 55 55
	adc $55.b		; 65 55
	adc $56.b		; 65 56
	cli		; 58
	adc $46.b,X		; 75 46
	adc $55.b		; 65 55
	eor $66.b,X		; 55 66
	ror $55.b		; 66 55
	cli		; 58
	ror $66.b		; 66 66
	ror $65.b		; 66 65
	eor $55.b,X		; 55 55
	eor $55.b,X		; 55 55
	cli		; 58
	eor $54.b,X		; 55 54
	mvp $45,$54		; 44 54 45
	mvn $34,$43		; 54 43 34
	cli		; 58
	.db $42, $33		; 42 33
	and ($23.b,X)		; 21 23
	and ($21.b)		; 32 21
	jsl $434821.l		; 22 21 48 43
	eor $21.b,S		; 43 21
	ora ($1F.b,X)		; 01 1F
	beq  17.b		; F0 11
	ora ($38.b),Y		; 11 38
	cop $F2.b		; 02 F2
	bpl  -2.b		; 10 FE
	sbc $BDCC.w		; ED CC BD
	xba		; EB
	cli		; 58
	sbc $FFE0EE.l,X		; FF EE E0 FF
	dec $DDEE.w,X		; DE EE DD
	cmp $DD58.w		; CD 58 DD
	cmp $BCCD.w		; CD CD BC
	ldy $BACC.w,X		; BC CC BA
	tyx		; BB
	cli		; 58
	plb		; AB
	cpy $9ABA.w		; CC BA 9A
	tax		; AA
	plb		; AB
	tax		; AA
	tax		; AA
	pla		; 68
	jmp.w [$EDDD]		; DC DD ED
	jmp.w [$DCDC]		; DC DC DC
	jmp.w [$68CC]		; DC CC 68
	cmp $CCCC.w,X		; DD CC CC
	cpy $DDCC.w		; CC CC DD
	cpy $68CD.w		; CC CD 68
	cmp $CDCC.w		; CD CC CD
	jmp.w [$DCDD]		; DC DD DC
	dec $58DD.w,X		; DE DD 58
	ldy $BCAB.w,X		; BC AB BC
	tyx		; BB
	cpy $CBCB.w		; CC CB CB
	cpy $CB58.w		; CC 58 CB
	ldy $DDCC.w		; AC CC DD
	jmp.w [$DCDD]		; DC DD DC
	dec $BA48.w,X		; DE 48 BA
	plb		; AB
	ldy $CDDC.w,X		; BC DC CD
	cmp $FFEE.w,X		; DD EE FF
	sec		; 38
	sbc $01DE.w,X		; FD DE 01
	and ($21.b),Y		; 31 21
	cop $F2.b		; 02 F2
	and $48.b		; 25 48
	and ($23.b)		; 32 23
	and ($24.b,X)		; 21 24
	eor ($44.b,S),Y		; 53 44
	mvn $58,$45		; 54 45 58
	and ($34.b,S),Y		; 33 34
	and ($33.b)		; 32 33
	and ($44.b,S),Y		; 33 44
	eor $33.b,S		; 43 33
	cli		; 58
	and ($44.b,S),Y		; 33 44
	eor $44.b,S		; 43 44
	eor $44.b,S		; 43 44
	mvn $58,$44		; 54 44 58
	eor $44.b		; 45 44
	mvp $45,$44		; 44 44 45
	eor $55.b,X		; 55 55
	eor $58.b		; 45 58
	eor $56.b,X		; 55 56
	adc $55.b		; 65 55
	adc $55.b		; 65 55
	adc $55.b		; 65 55
	cli		; 58
	ror $55.b		; 66 55
	lsr $56.b,X		; 56 56
	ror $55.b		; 66 55
	eor $55.b,X		; 55 55
	cli		; 58
	eor $55.b,X		; 55 55
	eor $55.b,X		; 55 55
	eor $55.b,X		; 55 55
	adc $55.b		; 65 55
	cli		; 58
	mvn $54,$34		; 54 34 54
	eor $44.b,S		; 43 44
	eor ($33.b,S),Y		; 53 33
	eor $58.b		; 45 58
	eor $34.b,S		; 43 34
	and ($34.b,S),Y		; 33 34
	and ($23.b,S),Y		; 33 23
	and ($23.b,S),Y		; 33 23
	pha		; 48
	eor $45.b,X		; 55 45
	eor $44.b,S		; 43 44
	mvp $64,$65		; 44 65 64
	and ($48.b)		; 32 48
	eor $34.b,S		; 43 34
	.db $42, $21		; 42 21
	ora ($32.b),Y		; 11 32
	and ($11.b)		; 32 11
	sec		; 38
	and $10.b,S		; 23 10
	ora $EF0001.l,X		; 1F 01 00 EF
	wai		; CB
	tax		; AA
	pha		; 48
	inc $EEEF.w		; EE EF EE
	cmp $CBCC.w		; CD CC CB
	ldy $48BB.w,X		; BC BB 48
	tyx		; BB
	tax		; AA
	tyx		; BB
	tyx		; BB
	ldy $9AA9.w,X		; BC A9 9A
	txs		; 9A
	cli		; 58
	cmp $DDCD.w,X		; DD CD DD
	cmp $CDCC.w		; CD CC CD
	cpy $58CC.w		; CC CC 58
	jmp.w [$DCCB]		; DC CB DC
	cpy $DCDC.w		; CC DC DC
	tsx		; BA
	ldy $CB58.w,X		; BC 58 CB
	tsx		; BA
	tyx		; BB
	tyx		; BB
	tsx		; BA
	tyx		; BB
	tyx		; BB
	tsx		; BA
	cli		; 58
	txs		; 9A
	tax		; AA
	tax		; AA
	tax		; AA
	plb		; AB
	tax		; AA
	plb		; AB
	tax		; AA
	cli		; 58
	tax		; AA
	tsx		; BA
	tyx		; BB
	tyx		; BB
	tax		; AA
	txs		; 9A
	tyx		; BB
	tyx		; BB
	cli		; 58
	tsx		; BA
	tyx		; BB
	tyx		; BB
	tsx		; BA
	tax		; AA
	tyx		; BB
	tyx		; BB
	wai		; CB
	cli		; 58
	ldy $BBCB.w,X		; BC CB BB
	tyx		; BB
	cpy $CDCC.w		; CC CC CD
	cpy $9A48.w		; CC 48 9A
	tax		; AA
	lda #$9B.b		; A9 9B
	cpy $BBDD.w		; CC DD BB
	cmp $BD38.w,X		; DD 38 BD
	nop		; EA
	jmp.w [$01BE]		; DC BE 01
	bpl   1.b		; 10 01
	beq  72.b		; F0 48
	ora ($21.b,X)		; 01 21
	and ($21.b,X)		; 21 21
	jsl $452332.l		; 22 32 23 45
	cli		; 58
	and $23.b,S		; 23 23
	and $23.b,S		; 23 23
	and ($24.b)		; 32 24
	eor $34.b,S		; 43 34
	cli		; 58
	mvp $44,$34		; 44 34 44
	mvp $65,$54		; 44 54 65
	eor $65.b,X		; 55 65
	cli		; 58
	lsr $76.b,X		; 56 76
	adc $66.b		; 65 66
	ror $67.b,X		; 76 67
	adc [$66.b],Y		; 77 66
	cli		; 58
	ror $77.b,X		; 76 77
	ror $66.b,X		; 76 66
	adc [$77.b],Y		; 77 77
	ror $77.b		; 66 77
	cli		; 58
	ror $66.b		; 66 66
	adc [$66.b]		; 67 66
	adc [$66.b],Y		; 77 66
	ror $66.b		; 66 66
	cli		; 58
	ror $65.b		; 66 65
	adc $65.b		; 65 65
	adc $56.b		; 65 56
	eor $55.b,X		; 55 55
	cli		; 58
	mvn $65,$55		; 54 55 65
	mvp $45,$34		; 44 34 45
	bit $34.b,X		; 34 34
	pha		; 48
	adc [$56.b]		; 67 56
	adc [$55.b],Y		; 77 55
	mvp $45,$46		; 44 46 45
	mvp $34,$48		; 44 48 34
	eor $34.b,S		; 43 34
	mvn $33,$43		; 54 43 33
	and ($22.b)		; 32 22
	sec		; 38
	lsr $54.b,X		; 56 54
	ora ($0F.b),Y		; 11 0F
	sbc $EE0FE1.l,X		; FF E1 0F EE
	pha		; 48
	sbc $FEEF.w,X		; FD EF FE
	cmp $CCDD.w,X		; DD DD CC
	ldy $58DD.w,X		; BC DD 58
	inc $DEED.w		; EE ED DE
	sbc $DCDE.w		; ED DE DC
	jmp.w [$58DD]		; DC DD 58
	cpx $DCCC.w		; EC CC DC
	cmp $DDCC.w		; CD CC DD
	wai		; CB
	cpy $CC58.w		; CC 58 CC
	cpy $BCCC.w		; CC CC BC
	cpy $BCBC.w		; CC BC BC
	ldy $BB58.w,X		; BC 58 BB
	plb		; AB
	wai		; CB
	ldy $BCBB.w,X		; BC BB BC
	tsx		; BA
	plb		; AB
	cli		; 58
	tyx		; BB
	tax		; AA
	tyx		; BB
	tyx		; BB
	lda $BBAB.w,Y		; B9 AB BB
	tyx		; BB
	cli		; 58
	tyx		; BB
	tyx		; BB
	tsx		; BA
	tyx		; BB
	wai		; CB
	tsx		; BA
	ldy $58BB.w,X		; BC BB 58
	cpy $BCBB.w		; CC BB BC
	tyx		; BB
	lda $CCCC.w,X		; BD CC CC
	ldy $CC58.w,X		; BC 58 CC
	cmp $CDCC.w		; CD CC CD
	jmp.w [$CCCD]		; DC CD CC
	cmp $CD58.w,X		; DD 58 CD
	cmp $EECD.w,X		; DD CD EE
	cmp $DEDD.w,X		; DD DD DE
	inc $AC34.w		; EE 34 AC
	cop $20.b		; 02 20
	brk $F1.b		; 00 F1
	bit $45.b,X		; 34 45
	eor $38.b,S		; 43 38
	cpy $F0CD.w		; CC CD F0
	ora $00E000.l,X		; 1F 00 E0 00
	mvp $12,$48		; 44 48 12
	ora ($03.b),Y		; 11 03
	ora ($22.b),Y		; 11 22
	and ($53.b,S),Y		; 33 53
	.db $42, $58		; 42 58
	jsl $222322.l		; 22 22 23 22
	and ($32.b)		; 32 32
	and ($43.b)		; 32 43
	cli		; 58
	eor $33.b,S		; 43 33
	eor $34.b,S		; 43 34
	mvp $44,$44		; 44 44 44
	mvn $45,$58		; 54 58 45
	eor $45.b,X		; 55 45
	eor $45.b,X		; 55 45
	eor $55.b,X		; 55 55
	ror $58.b		; 66 58
	eor $66.b,X		; 55 66
	adc $66.b		; 65 66
	adc $55.b		; 65 55
	ror $66.b		; 66 66
	cli		; 58
	ror $65.b		; 66 65
	lsr $65.b,X		; 56 65
	ror $65.b		; 66 65
	eor $66.b,X		; 55 66
	cli		; 58
	ror $65.b		; 66 65
	eor $45.b,X		; 55 45
	lsr $56.b,X		; 56 56
	lsr $65.b,X		; 56 65
	cli		; 58
	eor $54.b,X		; 55 54
	lsr $55.b,X		; 56 55
	mvp $54,$45		; 44 45 54
	mvp $54,$58		; 44 58 54
	mvp $54,$44		; 44 44 54
	and ($44.b,S),Y		; 33 44
	and ($33.b,S),Y		; 33 33
	pha		; 48
	ror $55.b,X		; 76 55
	eor $45.b		; 45 45
	mvp $34,$34		; 44 34 34
	mvp $43,$48		; 44 48 43
	jsl $312231.l		; 22 31 22 31
	bpl  16.b		; 10 10
	brk $48.b		; 00 48
	beq -16.b		; F0 F0
	sbc $FEFEFF.l,X		; FF FF FE FE
	sbc $58EC.w		; ED EC 58
	inc $EEEF.w		; EE EF EE
	cmp $DDED.w,X		; DD ED DD
	jmp.w [$58CD]		; DC CD 58
	cpy $CCCD.w		; CC CD CC
	cpy $CCBB.w		; CC BB CC
	tsx		; BA
	ldy $BA58.w,X		; BC 58 BA
	ldy $BBBA.w,X		; BC BA BB
	tyx		; BB
	tsx		; BA
	plb		; AB
	tax		; AA
	cli		; 58
	plb		; AB
	tax		; AA
	tsx		; BA
	txs		; 9A
	tax		; AA
	tax		; AA
	tax		; AA
	lda #$58.b		; A9 58
	tax		; AA
	lda #$9A.b		; A9 9A
	tsx		; BA
	txs		; 9A
	tax		; AA
	tax		; AA
	tax		; AA
	cli		; 58
	tax		; AA
	tyx		; BB
	tax		; AA
	tsx		; BA
	tyx		; BB
	wai		; CB
	plb		; AB
	tyx		; BB
	cli		; 58
	ldy $ACCB.w,X		; BC CB AC
	cpy $CCBB.w		; CC BB CC
	wai		; CB
	cmp $CC58.w		; CD 58 CC
	cpy $CCCC.w		; CC CC CC
	cpy $DDCD.w		; CC CD DD
	jmp.w [$BB48]		; DC 48 BB
	lda $CBAB.w,Y		; B9 AB CB
	tyx		; BB
	cmp $BBCC.w		; CD CC BB
	mvp $CC,$CC		; 44 CC CC
	cmp $01EF.w		; CD EF 01
	jsl $383322.l		; 22 22 33 38
	sbc ($12.b,X)		; E1 12
	and ($12.b,X)		; 21 12
	and ($66.b,S),Y		; 33 66
	eor $64.b,X		; 55 64
	pha		; 48
	eor $35.b,S		; 43 35
	mvn $34,$44		; 54 44 34
	eor $45.b,X		; 55 45
	ror $58.b		; 66 58
	and ($33.b)		; 32 33
	eor $33.b,S		; 43 33
	eor $34.b,S		; 43 34
	bit $44.b,X		; 34 44
	cli		; 58
	mvp $44,$43		; 44 43 44
	mvp $45,$44		; 44 44 45
	mvn $58,$45		; 54 45 58
	eor $55.b,X		; 55 55
	eor $55.b		; 45 55
	eor $56.b		; 45 56
	eor $55.b,X		; 55 55
	cli		; 58
	eor $55.b,X		; 55 55
	ror $55.b		; 66 55
	eor $56.b,X		; 55 56
	ror $55.b		; 66 55
	cli		; 58
	ror $56.b		; 66 56
	adc $66.b		; 65 66
	adc $55.b		; 65 55
	adc $56.b		; 65 56
	cli		; 58
	adc $55.b		; 65 55
	eor $56.b		; 45 56
	eor $55.b		; 45 55
	eor $43.b,X		; 55 43
	cli		; 58
	eor $44.b,X		; 55 44
	mvp $43,$43		; 44 43 43
	eor $43.b,S		; 43 43
	and ($48.b,S),Y		; 33 48
	ror $66.b		; 66 66
	ror $56.b		; 66 56
	lsr $45.b,X		; 56 45
	lsr $55.b,X		; 56 55
	pha		; 48
	mvn $54,$54		; 54 54 54
	mvn $33,$34		; 54 34 33
	and ($32.b,S),Y		; 33 32
	sec		; 38
	adc $63.b		; 65 63
	and ($11.b,S),Y		; 33 11
	brk $12.b		; 00 12
	asl $48DF.w		; 0E DF 48
	inc $ECFE.w,X		; FE FE EC
	sbc $EDCC.w		; ED CC ED
	cpy $48BC.w		; CC BC 48
	ldy $AABB.w		; AC BB AA
	tsx		; BA
	tax		; AA
	plb		; AB
	tax		; AA
	txs		; 9A
	cli		; 58
	cmp $CCCD.w,X		; DD CD CC
	cmp $DDCC.w,X		; DD CC DD
	cmp $58CC.w		; CD CC 58
	cmp $CCCC.w		; CD CC CC
	ldy $CBDC.w,X		; BC DC CB
	wai		; CB
	dex		; CA
	cli		; 58
	ldy $CBCB.w,X		; BC CB CB
	tsx		; BA
	tsx		; BA
	tsx		; BA
	tyx		; BB
	dex		; CA
	cli		; 58
	tsx		; BA
	tsx		; BA
	tyx		; BB
	tsx		; BA
	tax		; AA
	tyx		; BB
	tsx		; BA
	tyx		; BB
	cli		; 58
	tsx		; BA
	ldy $BCBB.w		; AC BB BC
	plb		; AB
	ldy $BBBB.w,X		; BC BB BB
	cli		; 58
	tyx		; BB
	tyx		; BB
	ldy $ACBB.w,X		; BC BB AC
	tyx		; BB
	tyx		; BB
	wai		; CB
	cli		; 58
	tyx		; BB
	ldy $BCCC.w,X		; BC CC BC
	ldy $CCBC.w,X		; BC BC CC
	cmp $CC58.w		; CD 58 CC
	cmp $DDDD.w,X		; DD DD DD
	cmp $EDDE.w,X		; DD DE ED
	inc $CB48.w		; EE 48 CB
	inc $EEED.w		; EE ED EE
	sbc $FDE0.w		; ED E0 FD
	sbc $FF0038.l,X		; FF 38 00 FF
	beq -31.b		; F0 E1
	bit $22.b		; 24 22
	and ($45.b)		; 32 45
	pha		; 48
	and ($22.b)		; 32 22
	bit $43.b,X		; 34 43
	eor $55.b		; 45 55
	eor $56.b		; 45 56
	cli		; 58
	and $33.b,S		; 23 33
	bit $33.b,X		; 34 33
	mvp $44,$44		; 44 44 44
	eor $58.b,S		; 43 58
	eor $44.b,X		; 55 44
	eor $44.b,X		; 55 44
	lsr $54.b,X		; 56 54
	eor $54.b,X		; 55 54
	cli		; 58
	lsr $55.b,X		; 56 55
	eor $55.b,X		; 55 55
	eor $65.b		; 45 65
	eor $65.b,X		; 55 65
	cli		; 58
	mvn $55,$66		; 54 66 55
	lsr $56.b,X		; 56 56
	eor $56.b,X		; 55 56
	eor $58.b,X		; 55 58
	ror $55.b		; 66 55
	ror $66.b		; 66 66
	eor $66.b,X		; 55 66
	eor $66.b,X		; 55 66
	cli		; 58
	eor $55.b,X		; 55 55
	eor $55.b,X		; 55 55
	eor $45.b		; 45 45
	eor $44.b,X		; 55 44
	cli		; 58
	eor $44.b		; 45 44
	eor $44.b		; 45 44
	bit $34.b,X		; 34 34
	bit $43.b,X		; 34 43
	cli		; 58
	bit $42.b,X		; 34 42
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	jsl $554823.l		; 22 23 48 55
	lsr $54.b		; 46 54
	bit $44.b,X		; 34 44
	and $43.b,X		; 35 43
	and ($38.b,S),Y		; 33 38
	stz $43.b,X		; 74 43
	and $33.b,S		; 23 33
	jsl $DF0F10.l		; 22 10 0F DF
	pha		; 48
	inc $EDFE.w,X		; FE FE ED
	cmp $CCCB.w,X		; DD CB CC
	tyx		; BB
	tyx		; BB
	cli		; 58
	cmp $DDDD.w,X		; DD DD DD
	jmp.w [$CCCD]		; DC CD CC
	cmp $58CC.w		; CD CC 58
	ldy $CDCC.w,X		; BC CC CD
	cpy $CCBC.w		; CC BC CC
	cpy $58CB.w		; CC CB 58
	cpy $BCCB.w		; CC CB BC
	wai		; CB
	ldy $BCBB.w,X		; BC BB BC
	tyx		; BB
	cli		; 58
	tyx		; BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	ldy $ABBB.w		; AC BB AB
	tyx		; BB
	cli		; 58
	plb		; AB
	tyx		; BB
	tyx		; BB
	tsx		; BA
	tsx		; BA
	tyx		; BB
	tyx		; BB
	tyx		; BB
	cli		; 58
	plb		; AB
	wai		; CB
	tyx		; BB
	wai		; CB
	ldy $BCCB.w,X		; BC CB BC
	tyx		; BB
	cli		; 58
	cmp $CCCB.w		; CD CB CC
	wai		; CB
	cpy $CCCC.w		; CC CC CC
	cpy $CD58.w		; CC 58 CD
	jmp.w [$DCCD]		; DC CD DC
	jmp.w [$DCDD]		; DC DD DC
	cmp $BA48.w		; CD 48 BA
	tax		; AA
	dex		; CA
	wai		; CB
	ldy $CCDC.w,X		; BC DC CC
	cmp $CA38.w,X		; DD 38 CA
	wai		; CB
	tyx		; BB
	ldx $0FEE.w,Y		; BE EE 0F
	ora $11380F.l,X		; 1F 0F 38 11
	and $13.b,S		; 23 13
	bit $43.b		; 24 43
	and $44.b,X		; 35 44
	lsr $48.b,X		; 56 48
	and ($23.b)		; 32 23
	and ($34.b,S),Y		; 33 34
	mvp $44,$54		; 44 54 44
	mvn $32,$58		; 54 58 32
	and ($33.b)		; 32 33
	and ($34.b,S),Y		; 33 34
	and ($23.b,S),Y		; 33 23
	mvp $43,$58		; 44 58 43
	eor $44.b,S		; 43 44
	eor $44.b,S		; 43 44
	eor $44.b,S		; 43 44
	mvn $43,$58		; 54 58 43
	mvp $44,$54		; 44 54 44
	eor $45.b,S		; 43 45
	mvp $58,$44		; 44 44 58
	and $54.b,X		; 35 54
	mvp $44,$54		; 44 54 44
	eor $54.b,X		; 55 54
	eor $58.b		; 45 58
	stz $55.b		; 64 55
	mvn $55,$56		; 54 56 55
	eor $54.b,X		; 55 54
	eor $58.b,X		; 55 58
	adc $45.b		; 65 45
	eor $44.b,X		; 55 44
	eor $54.b,X		; 55 54
	mvp $58,$54		; 44 54 58
	mvp $54,$44		; 44 44 54
	bit $44.b,X		; 34 44
	and ($44.b,S),Y		; 33 44
	and ($58.b,S),Y		; 33 58
	mvp $44,$23		; 44 23 44
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($48.b,S),Y		; 33 48
	adc $64.b		; 65 64
	eor $65.b,X		; 55 65
	eor $44.b,X		; 55 44
	mvp $38,$33		; 44 33 38
	ror $65.b		; 66 65
	mvn $33,$32		; 54 32 33
	ora ($02.b),Y		; 11 02
	beq  72.b		; F0 48
	brk $EE.b		; 00 EE
	sbc $DDEEEE.l		; EF EE EE DD
	jmp.w [$48DC]		; DC DC 48
	cmp $CCCB.w,X		; DD CB CC
	tyx		; BB
	cpy $BBBB.w		; CC BB BB
	tyx		; BB
	cli		; 58
	cmp $DDED.w,X		; DD ED DD
	cmp $DDDD.w,X		; DD DD DD
	jmp.w [$58DC]		; DC DC 58
	cpy $CCDD.w		; CC DD CC
	cpy $CBBC.w		; CC BC CB
	wai		; CB
	tyx		; BB
	cli		; 58
	wai		; CB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	tax		; AA
	tyx		; BB
	tyx		; BB
	cli		; 58
	tsx		; BA
	tax		; AA
	tyx		; BB
	plb		; AB
	plb		; AB
	tyx		; BB
	tax		; AA
	plb		; AB
	cli		; 58
	tyx		; BB
	plb		; AB
	tax		; AA
	tyx		; BB
	tax		; AA
	tyx		; BB
	tsx		; BA
	tyx		; BB
	cli		; 58
	tsx		; BA
	tsx		; BA
	tyx		; BB
	tyx		; BB
	tyx		; BB
	ldy $BCBB.w,X		; BC BB BC
	cli		; 58
	tyx		; BB
	ldy $CCCC.w,X		; BC CC CC
	cmp $CDCC.w		; CD CC CD
	sbc $BA44.w		; ED 44 BA
	ldy $CCDD.w,X		; BC DD CC
	cpy $AABB.w		; CC BB AA
	ldy $CC48.w,X		; BC 48 CC
	sbc $EEEE.w		; ED EE EE
	inc $00FF.w		; EE FF 00
	brk $38.b		; 00 38
	ora ($22.b),Y		; 11 22
	ora ($34.b,S),Y		; 13 34
	ror $66.b		; 66 66
	adc [$67.b],Y		; 77 67
	pha		; 48
	bit $54.b,X		; 34 54
	eor $54.b,X		; 55 54
	eor $66.b,X		; 55 66
	ror $65.b		; 66 65
	cli		; 58
	and ($33.b,S),Y		; 33 33
	and ($44.b,S),Y		; 33 44
	and ($34.b)		; 32 34
	eor $44.b,S		; 43 44
	cli		; 58
	and ($44.b,S),Y		; 33 44
	mvp $34,$43		; 44 43 34
	mvp $44,$44		; 44 44 44
	cli		; 58
	mvp $54,$44		; 44 44 54
	mvn $55,$44		; 54 44 55
	eor $54.b,X		; 55 54
	cli		; 58
	mvn $55,$55		; 54 55 55
	eor $55.b,X		; 55 55
	mvn $54,$55		; 54 55 54
	cli		; 58
	mvn $55,$54		; 54 54 55
	mvn $54,$44		; 54 44 54
	mvp $58,$54		; 44 54 58
	mvn $54,$43		; 54 43 54
	mvp $34,$54		; 44 54 34
	mvp $58,$44		; 44 44 58
	and ($44.b,S),Y		; 33 44
	eor $34.b,S		; 43 34
	eor $33.b,S		; 43 33
	eor $32.b,S		; 43 32
	pha		; 48
	adc $65.b		; 65 65
	eor $64.b		; 45 64
	mvp $44,$44		; 44 44 44
	and ($34.b,S),Y		; 33 34
	mvp $20,$43		; 44 43 20
	ora ($12.b,X)		; 01 12
	bpl   0.b		; 10 00
	ora $213328.l		; 0F 28 33 21
	and $10.b,S		; 23 10
	and $CBBCDF.l,X		; 3F DF BC CB
	pha		; 48
	sbc $EDEFDF.l,X		; FF DF EF ED
	dec $DDDC.w,X		; DE DC DD
	cmp $BD48.w,X		; DD 48 BD
	jmp.w [$CCCC]		; DC CC CC
	cpy $CCBB.w		; CC BB CC
	dex		; CA
	pha		; 48
	wai		; CB
	cpy $BCCA.w		; CC CA BC
	tsx		; BA
	ldy $BBBB.w,X		; BC BB BB
	pha		; 48
	plb		; AB
	tsx		; BA
	txy		; 9B
	plb		; AB
	tax		; AA
	lda #$9A.b		; A9 9A
	tax		; AA
	cli		; 58
	cmp $CCDD.w		; CD DD CC
	jmp.w [$DCDC]		; DC DC DC
	cpy $58DC.w		; CC DC 58
	cpy $CCDC.w		; CC DC CC
	cpy $CCDC.w		; CC DC CC
	cpy $58CC.w		; CC CC 58
	cpy $CCCC.w		; CC CC CC
	cpy $BCCC.w		; CC CC BC
	jmp.w [$58CB]		; DC CB 58
	cpy $BBDC.w		; CC DC BB
	cpy $CBCC.w		; CC CC CB
	cpy $58CB.w		; CC CB 58
	tyx		; BB
	cmp $CCCB.w		; CD CB CC
	cpy $CCDC.w		; CC DC CC
	cpy $DD58.w		; CC 58 DD
	jmp.w [$CDCD]		; DC CD CD
	dec $DEDD.w,X		; DE DD DE
	cmp $BD48.w,X		; DD 48 BD
	ldy $CCCB.w,X		; BC CB CC
	cmp $DEDC.w		; CD DC DE
	cmp $BB38.w,X		; DD 38 BB
	cmp $ECCC.w,X		; DD CC EC
	sbc $F1EF.w,X		; FD EF F1
	brk $48.b		; 00 48
	ora ($10.b),Y		; 11 10
	ora ($31.b),Y		; 11 31
	jsl $334232.l		; 22 32 42 33
	pha		; 48
	eor $24.b,S		; 43 24
	mvn $54,$44		; 54 44 54
	mvn $56,$56		; 54 56 56
	cli		; 58
	and ($33.b)		; 32 33
	and ($33.b,S),Y		; 33 33
	bit $33.b,X		; 34 33
	eor $34.b,S		; 43 34
	cli		; 58
	mvp $34,$44		; 44 44 34
	mvp $44,$44		; 44 44 44
	eor $44.b,X		; 55 44
	cli		; 58
	eor $54.b		; 45 54
	lsr $54.b		; 46 54
	lsr $54.b,X		; 56 54
	eor $55.b,X		; 55 55
	cli		; 58
	adc $55.b		; 65 55
	eor $56.b,X		; 55 56
	eor $55.b,X		; 55 55
	eor $65.b,X		; 55 65
	cli		; 58
	mvn $54,$55		; 54 55 54
	eor $54.b,X		; 55 54
	mvn $53,$55		; 54 55 53
	cli		; 58
	eor $54.b		; 45 54
	mvp $44,$44		; 44 44 44
	mvp $44,$34		; 44 34 44
	cli		; 58
	mvp $34,$33		; 44 33 34
	bit $34.b,X		; 34 34
	and $33.b,S		; 23 33
	and ($44.b,S),Y		; 33 44
	adc $44.b		; 65 44
	and ($22.b,S),Y		; 33 22
	bpl  -1.b		; 10 FF
	sbc $1438FE.l		; EF FE 38 14
	and $10.b,S		; 23 10
	sbc ($0F.b),Y		; F1 0F
	dec $EEEF.w,X		; DE EF EE
	pha		; 48
	inc $EDFE.w		; EE FE ED
	sbc $DDDD.w		; ED DD DD
	dec $48CC.w,X		; DE CC 48
	jmp.w [$CCBC]		; DC BC CC
	cpy $BBCB.w		; CC CB BB
	wai		; CB
	tax		; AA
	cli		; 58
	sbc $EDDD.w		; ED DD ED
	jmp.w [$DCDD]		; DC DD DC
	cmp $58DC.w,X		; DD DC 58
	cpy $CCDD.w		; CC DD CC
	cmp $CCCD.w		; CD CD CC
	cmp $58CC.w		; CD CC 58
	cpy $CCCD.w		; CC CD CC
	cpy $CCCD.w		; CC CD CC
	cpy $58CC.w		; CC CC 58
	cpy $CCDC.w		; CC DC CC
	cpy $CDCD.w		; CC CD CD
	cpy $58CD.w		; CC CD 58
	cmp $CDCD.w		; CD CD CD
	cpy $DCDD.w		; CC DD DC
	jmp.w [$48DC]		; DC DC 48
	lda #$A9.b		; A9 A9
	lda #$9A.b		; A9 9A
	lda #$99.b		; A9 99
	tax		; AA
	tax		; AA
	pha		; 48
	lda #$AA.b		; A9 AA
	tax		; AA
	tax		; AA
	plb		; AB
	tsx		; BA
	plb		; AB
	wai		; CB
	pha		; 48
	tyx		; BB
	cpy $CDCC.w		; CC CC CD
	cpy $DDDD.w		; CC DD DD
	inc $2624.w		; EE 24 26
	mvp $11,$52		; 44 52 11
	jsr $DDEE.w		; 20 EE DD
	sbc $CEDC28.l		; EF 28 DC CE
	sbc $F1FFEF.l		; EF EF FF F1
	sbc ($20.b),Y		; F1 20
	plp		; 28
	jsl $301031.l		; 22 31 10 30
	and $43.b,S		; 23 43
	jsl $233844.l		; 22 44 38 23
	and ($32.b),Y		; 31 32
	eor $22.b,S		; 43 22
	and $34.b		; 25 34
	eor $48.b,S		; 43 48
	jsl $332223.l		; 22 23 22 33
	and ($33.b,S),Y		; 33 33
	mvp $48,$33		; 44 33 48
	mvp $44,$54		; 44 54 44
	eor $54.b,X		; 55 54
	lsr $55.b,X		; 56 55
	lsr $58.b,X		; 56 58
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	bit $33.b,X		; 34 33
	mvp $58,$33		; 44 33 58
	mvp $34,$43		; 44 43 34
	mvp $44,$34		; 44 34 44
	bit $44.b,X		; 34 44
	cli		; 58
	mvp $44,$33		; 44 33 44
	eor $43.b,S		; 43 43
	eor $43.b,S		; 43 43
	eor $48.b,S		; 43 48
	adc [$76.b],Y		; 77 76
	eor [$76.b],Y		; 57 76
	adc [$75.b]		; 67 75
	ror $66.b		; 66 66
	pha		; 48
	ror $57.b		; 66 57
	adc $56.b		; 65 56
	adc $56.b		; 65 56
	adc $56.b		; 65 56
	pha		; 48
	eor $55.b,X		; 55 55
	eor $64.b,X		; 55 64
	eor $54.b,X		; 55 54
	mvn $48,$54		; 54 54 48
	eor $45.b,S		; 43 45
	eor $32.b,S		; 43 32
	and ($33.b,S),Y		; 33 33
	jsl $443822.l		; 22 22 38 44
	jsl $112121.l		; 22 21 21 11
	brk $00.b		; 00 00
	sbc $FFFF38.l,X		; FF 38 FF FF
	sbc $EDEE.w		; ED EE ED
	dec $DDDD.w,X		; DE DD DD
	sec		; 38
	wai		; CB
	cpy $CBDC.w		; CC DC CB
	ldy $ABBA.w,X		; BC BA AB
	cmp #$48.b		; C9 48
	cmp $DDCD.w,X		; DD CD DD
	ldy $CBCC.w,X		; BC CC CB
	tyx		; BB
	ldy $AB48.w,X		; BC 48 AB
	tax		; AA
	plb		; AB
	txs		; 9A
	plb		; AB
	sta $99AA.w,Y		; 99 AA 99
	cli		; 58
	cmp $DDCC.w,X		; DD CC DD
	cpy $CCDD.w		; CC DD CC
	cmp $54DC.w,X		; DD DC 54
	txs		; 9A
	tax		; AA
	plb		; AB
	tax		; AA
	plb		; AB
	tsx		; BA
	plb		; AB
	tyx		; BB
	pha		; 48
	tax		; AA
	txy		; 9B
	plb		; AB
	tax		; AA
	plb		; AB
	tsx		; BA
	plb		; AB
	tyx		; BB
	pha		; 48
	tyx		; BB
	tyx		; BB
	tyx		; BB
	tyx		; BB
	cpy $CCBC.w		; CC BC CC
	ldy $CD48.w,X		; BC 48 CD
	cpy $DCCD.w		; CC CD DC
	cpy $CCDE.w		; CC DE CC
	dec $AA38.w,X		; DE 38 AA
	ldy $CDBB.w		; AC BB CD
	ldy $DDCE.w,X		; BC CE DD
	dec $CE28.w,X		; DE 28 CE
	inc $0FEF.w		; EE EF 0F
	cop $10.b		; 02 10
	and ($22.b)		; 32 22
	plp		; 28
	eor $35.b,S		; 43 35
	bit $45.b,X		; 34 45
	mvn $66,$75		; 54 75 66
	adc $38.b		; 65 38
	.db $42, $33		; 42 33
	bit $33.b,X		; 34 33
	and ($43.b,S),Y		; 33 43
	.db $42, $34		; 42 34
	sec		; 38
	mvp $44,$34		; 44 34 44
	mvp $54,$54		; 44 54 54
	eor $65.b		; 45 65
	sec		; 38
	eor $65.b,X		; 55 65
	adc $67.b		; 65 67
	adc $67.b		; 65 67
	ror $76.b		; 66 76
	pha		; 48
	bit $33.b,X		; 34 33
	bit $33.b,X		; 34 33
	eor $33.b,S		; 43 33
	and ($43.b,S),Y		; 33 43
	sec		; 38
	ror $67.b		; 66 67
	ror $67.b		; 66 67
	adc $67.b		; 65 67
	ror $67.b		; 66 67
	sec		; 38
	ror $56.b		; 66 56
	ror $56.b,X		; 76 56
	ror $66.b		; 66 66
	lsr $66.b,X		; 56 66
	sec		; 38
	eor $56.b,X		; 55 56
	stz $55.b		; 64 55
	eor $45.b,X		; 55 45
	mvn $38,$44		; 54 44 38
	mvp $43,$45		; 44 45 43
	mvp $44,$43		; 44 43 44
	and ($44.b)		; 32 44
	sec		; 38
	and ($33.b,S),Y		; 33 33
	bit $32.b,X		; 34 32
	and $33.b,S		; 23 33
	and ($23.b,S),Y		; 33 23
	plp		; 28
	lsr $56.b,X		; 56 56
	lsr $55.b		; 46 55
	eor $45.b,X		; 55 45
	mvp $28,$53		; 44 53 28
	mvp $32,$43		; 44 43 32
	bit $23.b,X		; 34 23
	and ($13.b,X)		; 21 13
	ora ($08.b,X)		; 01 08
	eor ($33.b,S),Y		; 53 33
	ora ($32.b,S),Y		; 13 32
	beq  30.b		; F0 1E
	ora $18BF.w		; 0D BF 18
	sbc $DDFC0D.l		; EF 0D FC DD
	cmp $BCDD.w,X		; DD DD BC
	phx		; DA
	plp		; 28
	dec $DEFC.w,X		; DE FC DE
	sbc $DDCD.w		; ED CD DD
	jmp.w [$28CC]		; DC CC 28
	cpy $CBBC.w		; CC BC CB
	ldy $BABA.w		; AC BA BA
	tyx		; BB
	txs		; 9A
	sec		; 38
	cmp $CDDD.w,X		; DD DD CD
	cmp $CDCD.w,X		; DD CD CD
	jmp.w [$38CD]		; DC CD 38
	cmp $CDDC.w,X		; DD DC CD
	cmp $DDDC.w,X		; DD DC DD
	jmp.w [$28DC]		; DC DC 28
	tsx		; BA
	lda #$AA.b		; A9 AA
	tax		; AA
	txs		; 9A
	plb		; AB
	tax		; AA
	txs		; 9A
	plp		; 28
	tax		; AA
	txs		; 9A
	tsx		; BA
	tax		; AA
	lda #$BA.b		; A9 BA
	tsx		; BA
	lda $AB28.w,Y		; B9 28 AB
	tsx		; BA
	tyx		; BB
	plb		; AB
	tyx		; BB
	tsx		; BA
	tyx		; BB
	wai		; CB
	plp		; 28
	wai		; CB
	tyx		; BB
	cpy $CCCD.w		; CC CD CC
	cmp $DCBD.w,X		; DD BD DC
	trb $9A.b		; 14 9A
	ldy $CDDD.w,X		; BC DD CD
	cmp $EEEE.w		; CD EE EE
	sbc $EFEF04.l		; EF 04 EF EF
	brk $01.b		; 00 01
	ora ($32.b),Y		; 11 32
	and ($34.b)		; 32 34
	php		; 08
	cpx #$FE.b		; E0 FE
	ora $000100.l		; 0F 00 01 00
	ora ($21.b),Y		; 11 21
	clc		; 18
	jsr $1320.w		; 20 20 13
	and ($21.b,X)		; 21 21
	and $23.b,S		; 23 23
	and ($18.b,S),Y		; 33 18
	and ($44.b,S),Y		; 33 44
	and ($45.b,S),Y		; 33 45
	eor $45.b		; 45 45
	lsr $45.b		; 46 45
	clc		; 18
	eor $64.b,X		; 55 64
	adc $54.b		; 65 54
	eor $64.b,X		; 55 64
	stz $64.b		; 64 64
	clc		; 18
	mvn $45,$55		; 54 55 45
	mvn $45,$44		; 54 44 45
	mvp $18,$44		; 44 44 18
	mvp $43,$34		; 44 34 43
	bit $43.b,X		; 34 43
	and ($33.b,S),Y		; 33 33
	mvp $43,$18		; 44 18 43
	and ($33.b)		; 32 33
	and ($43.b,S),Y		; 33 43
	and ($23.b,S),Y		; 33 23
	and ($08.b,S),Y		; 33 08
	and ($76.b,S),Y		; 33 76
	mvp $74,$55		; 44 55 74
	bit $35.b,X		; 34 35
	and $04.b,X		; 35 04
	mvp $43,$44		; 44 44 43
	and $32.b,S		; 23 32
	jsl $041112.l		; 22 12 11 04
	bpl  17.b		; 10 11
	and ($10.b,X)		; 21 10
	bpl  17.b		; 10 11
	brk $10.b		; 00 10
	tsb $00.b		; 04 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F0.b		; 00 F0
	ora $FF000F.l		; 0F 0F 00 FF
	sbc $F004FF.l,X		; FF FF 04 F0
	beq -16.b		; F0 F0
	beq  15.b		; F0 0F
	brk $0F.b		; 00 0F
	brk $04.b		; 00 04
	ora $F00000.l		; 0F 00 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $59.b		; 00 59
	eor $4B.b,X		; 55 4B
	eor $100000.l		; 4F 00 00 10
	bmi   0.b		; 30 00
	brk $19.b		; 00 19
	rti		; 40

	bvs  62.b		; 70 3E
	ldx $4244.w		; AE 44 42
	eor ($54.b)		; 52 54
	pha		; 48
	lsr $4C.b		; 46 4C
	mvn $73,$2E		; 54 2E 73
	adc $00006C.l		; 6F 6C 00 00
	cmp $E0D67C.l		; CF 7C D6 E0
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
	lda ($00.b)		; B2 00
	ora ($EE.b,S),Y		; 13 EE
	ora ($3F.b,X)		; 01 3F
	cmp $0B14.w		; CD 14 0B
	lda ($F3.b)		; B2 F3
	rti		; 40

	dec $2C15.w		; CE 15 2C
	cmp ($62.b,S),Y		; D3 62
	ldy $04B2.w,X		; BC B2 04
	jmp $64A2.w		; 4C A2 64
	lda $4D04.w,Y		; B9 04 4D
	bcc -78.b		; 90 B2
	eor [$E9.b],Y		; 57 E9
	sbc ($5D.b,S),Y		; F3 5D
	lda $F40977.l		; AF 77 09 F4
	lda ($4E.b)		; B2 4E
	dec $1A47.w		; CE 47 1A
	cmp ($2E.b,S),Y		; D3 2E
	cmp $A215.w		; CD 15 A2
	eor #$A5.b		; 49 A5
	ror $179C.w,X		; 7E 9C 17
	adc $B250C5.l,X		; 7F C5 50 B2
	cmp $022003.l		; CF 03 20 02
	asl $0FBF.w,X		; 1E BF 0F
	brk $A6.b		; 00 A6
	asl $CE.b		; 06 CE
	sty $7D.b,X		; 94 7D
	sbc $109976.l		; EF 76 99 10
	lda ($01.b)		; B2 01
	ora $CE4E26.l		; 0F 26 4E CE
	ora $B2F4DC.l		; 0F DC F4 B2
	rti		; 40

	dec $ED20.w		; CE 20 ED
	ora $63.b		; 05 63
	sbc $B611.w,X		; FD 11 B6
	cmp $FE1C36.l,X		; DF 36 1C FE
	rol $34CE.w		; 2E CE 34
	bpl -78.b		; 10 B2
	bpl   1.b		; 10 01
	xba		; EB
	sbc $32.b,S		; E3 32
	bit $31.b,X		; 34 31
	jsr ($C1B2.w,X)		; FC B2 C1
	and ($25.b),Y		; 31 25
	.db $62, $DB, $BC		; 62 DB BC
	inc $C6C1.w,X		; FE C1 C6
	ora ($CF.b),Y		; 11 CF
	and $12F220.l		; 2F 20 F2 12
	cpx $B202.w		; EC 02 B2
	beq   2.b		; F0 02
	adc [$6F.b]		; 67 6F
	cpy $BCBB.w		; CC BB BC
	sbc ($B6.b)		; F2 B6
	ora $1200CF.l,X		; 1F CF 00 12
	and ($11.b)		; 32 11
	xce		; FB
	sbc ($B6.b,X)		; E1 B6
	sbc ($33.b),Y		; F1 33
	jsl $0EAFFB.l		; 22 FB AF 0E
	ora ($01.b,S),Y		; 13 01
	ldx $31.b,Y		; B6 31
	sta $240212.l,X		; 9F 12 02 24
	jsr $E3EB.w		; 20 EB E3
	ldx $FF.b,Y		; B6 FF
	and ($41.b,S),Y		; 33 41
	sbc $0CAE.w		; ED AE 0C
	sbc ($32.b,S),Y		; F3 32
	ldx $E0.b,Y		; B6 E0
	ora $14F0.w,X		; 1D F0 14
	mvp $0E,$F0		; 44 F0 0E
	dec $F1C2.w,X		; DE C2 F1
	bit $55.b		; 24 55
	eor $FD.b,S		; 43 FD
	cmp $EEBD.w		; CD BD EE
	ldx $00.b,Y		; B6 00
	asl $15D2.w,X		; 1E D2 15
	.db $42, $21		; 42 21
	ora $B6CF.w		; 0D CF B6
	ora ($33.b)		; 12 33
	and $0D.b,S		; 23 0D
	sta $FFFE.w,Y		; 99 FE FF
	cop $B6.b		; 02 B6
	brk $2F.b		; 00 2F
	cmp ($34.b),Y		; D1 34
	mvp $E2,$4F		; 44 4F E2
	sbc $01B6.w		; ED B6 01
	.db $42, $40		; 42 40
	beq -86.b		; F0 AA
	lda $B6CD2E.l		; AF 2E CD B6
	trb $2F.b		; 14 2F
	cmp $151075.l,X		; DF 75 10 15
	and $B6DF.w		; 2D DF B6
	and $EF.b		; 25 EF
	and $4B.b,S		; 23 4B
	tyx		; BB
	cmp ($D9.b,S),Y		; D3 D9
	sbc $BAC2.w,X		; FD C2 BA
	stz $EEDE.w,X		; 9E DE EE
	ora ($33.b)		; 12 33
	ora ($43.b,S),Y		; 13 43
	ldx $1E.b,Y		; B6 1E
	and ($11.b),Y		; 31 11
	beq -20.b		; F0 EC
	inc $ADFE.w		; EE FE AD
	ldx $F0.b,Y		; B6 F0
	ora ($22.b)		; 12 22
	ora ($21.b,X)		; 01 21
	and ($1F.b,X)		; 21 1F
	tsb $B6.b		; 04 B6
	bpl  -1.b		; 10 FF
	ora ($11.b)		; 12 11
	lda ($D0.b,X)		; A1 D0
	dec $B6EA.w,X		; DE EA B6
	cmp $001F06.l,X		; DF 06 1F 00
	and ($F0.b,S),Y		; 33 F0
	ora ($2F.b,S),Y		; 13 2F
	ldx $F2.b,Y		; B6 F2
	jsr $31D1.w		; 20 D1 31
	tsb $0FD0.w		; 0C D0 0F
	dex		; CA
.ACCU 16
	rep #$A9		; C2 A9
	stz $DCCD.w		; 9C CD DC
	inc $F101.w		; EE 01 F1
	ora ($B6.b,S),Y		; 13 B6
	sbc $F4122F.l,X		; FF 2F 12 F4
	sbc $100C.w,X		; FD 0C 10
	dec $ADB6.w		; CE B6 AD
	ora ($40.b,X)		; 01 40
	cpx #$03.b		; E0 03
	ora ($22.b),Y		; 11 22
	bpl -74.b		; 10 B6
	cop $1F.b		; 02 1F
	ora $B0FF33.l,X		; 1F 33 FF B0
	rol $B6ED.w		; 2E ED B6
	lda $0E21C1.l,X		; BF C1 21 0E
	ora ($24.b,X)		; 01 24
	ora ($21.b),Y		; 11 21
	ldx $01.b,Y		; B6 01
	ora ($FF.b)		; 12 FF
	bit $1D.b		; 24 1D
	cmp $A6FC10.l		; CF 10 FC A6
	ldy $239C.w		; AC 9C 23
	bit $56D1.w		; 2C D1 56
	adc ($35.b,X)		; 61 35
	ldx $14.b		; A6 14
	sbc $F5.b		; E5 F5
	and ($30.b,X)		; 21 30
	tyx		; BB
	cpy #$2B.b		; C0 2B
	ldx $09.b,Y		; B6 09
	cmp $FE13.w		; CD 13 FE
	cpx #$42.b		; E0 42
	jsl $22A624.l		; 22 24 A6 22
	bpl 115.b		; 10 73
	sbc ($32.b,S),Y		; F3 32
	cmp $0FD0.w,Y		; D9 D0 0F
	ldx $CD.b,Y		; B6 CD
	ldx $1EE0.w,Y		; BE E0 1E
	cmp ($11.b),Y		; D1 11
	bit $24.b,X		; 34 24
	ldx $03.b,Y		; B6 03
	sbc ($22.b,S),Y		; F3 22
	sbc ($13.b),Y		; F1 13
	sbc $11C0.w,X		; FD C0 11
	ldx $EB.b,Y		; B6 EB
	ldx $FEEF.w,Y		; BE EF FE
	beq   0.b		; F0 00
	and $42.b		; 25 42
	ldx $13.b		; A6 13
	lsr $10.b,X		; 56 10
	ora $40.b		; 05 40
	cpy $0CE0.w		; CC E0 0C
	ldx $FE.b,Y		; B6 FE
	xba		; EB
	lda $01FC1F.l,X		; BF 1F FC 01
	mvp $C2,$03		; 44 03 C2
	and $34.b,S		; 23 34
	eor $55.b		; 45 55
	eor $53.b,X		; 55 53
	and ($11.b,X)		; 21 11
	ldx $FD.b,Y		; B6 FD
	jmp.w [$E0EE]		; DC EE E0
	sbc $43240E.l		; EF 0E 24 43
	ldx $02.b,Y		; B6 02
	rti		; 40

	and $E0F213.l,X		; 3F 13 F2 E0
	jsr ($B610.w,X)		; FC 10 B6
	sbc ($BD.b,X)		; E1 BD
	jmp.w [$DE4D]		; DC 4D DE
	brk $21.b		; 00 21
	.db $42, $A6		; 42 A6
	adc $26.b,S		; 63 26
	and ($4E.b)		; 32 4E
	and ($FE.b)		; 32 FE
	ldx $B60E.w,Y		; BE 0E B6
	asl $CEDF.w		; 0E DF CE
	sbc $14EF0D.l,X		; FF 0D EF 14
	and ($B6.b,S),Y		; 33 B6
	sbc ($44.b)		; F2 44
	cpx $D5.b		; E4 D5
	ora ($EF.b,X)		; 01 EF
	ora $0FB6EF.l		; 0F EF B6 0F
	jsr ($01DE.w,X)		; FC DE 01
	jmp.w [$11F1]		; DC F1 11
	jsl $4264A6.l		; 22 A6 64 42
	eor $32.b		; 45 32
	ora $D0EC2E.l,X		; 1F 2E EC D0
	ldx $1D.b,Y		; B6 1D
	phd		; 0B
	inc $FC00.w		; EE 00 FC
	sbc $2340.w,X		; FD 40 23
	ldx $04.b,Y		; B6 04
	ora ($31.b)		; 12 31
	bmi  17.b		; 30 11
	beq  -3.b		; F0 FD
	beq -90.b		; F0 A6
	and $DFB9.w		; 2D B9 DF
	sbc $EEDB.w,X		; FD DB EE
	cmp ($65.b)		; D2 65
.ACCU 16
.INDEX 16
	rep #$F0		; C2 F0
	cop $34.b		; 02 34
	mvn $54,$55		; 54 55 54
	and ($22.b)		; 32 22
.INDEX 16
	rep #$10		; C2 10
	ora $DCDDDD.l		; 0F DD DD DC
	tsx		; BA
	ldy $A6DE.w		; AC DE A6
	and ($36.b,S),Y		; 33 36
	eor $45.b,S		; 43 45
	jsl $DFFEFD.l		; 22 FD FE DF
	ldx $F1.b		; A6 F1
	cmp $F0CD.w,Y		; D9 CD F0
	jsr ($02D9.w,X)		; FC D9 02
	mvp $02,$B6		; 44 B6 02
	ora ($21.b,S),Y		; 13 21
	and ($04.b)		; 32 04
	cmp ($DF.b),Y		; D1 DF
	ora $AFF1A6.l		; 0F A6 F1 AF
	tsx		; BA
	ora $FC.b,S		; 03 FC
	stz $12F2.w,X		; 9E F2 12
	ldx $12.b,Y		; B6 12
	and ($03.b),Y		; 31 03
	.db $42, $1F		; 42 1F
	cop $FD.b		; 02 FD
	cmp $EB30B6.l,X		; DF B6 30 EB
	sbc ($1F.b,X)		; E1 1F
	sbc $FE1E.w,X		; FD 1E FE
	tsb $B6.b		; 04 B6
	and ($00.b,X)		; 21 00
	eor ($11.b)		; 52 11
	ora ($2E.b,S),Y		; 13 2E
	inc $A6F1.w		; EE F1 A6
	cpx $DDEE.w		; EC EE DD
	bne  18.b		; D0 12
	lda $42D1.w,Y		; B9 D1 42
	ldx $10.b		; A6 10
	and $52.b,X		; 35 52
	and $63.b		; 25 63
	asl $DFEE.w		; 0E EE DF
	rep #$00		; C2 00
	ora $EEEEED.l,X		; 1F ED EE EE
	jmp.w [$CDCD]		; DC CD CD
	ldx $15.b		; A6 15
	ora $44.b,S		; 03 44
	bit $42.b,X		; 34 42
	bmi -36.b		; 30 DC
	inc $EFA6.w		; EE A6 EF
	inc $EFDC.w,X		; FE DC EF
	and ($C9.b),Y		; 31 C9
	brk $20.b		; 00 20
	ldx $01.b,Y		; B6 01
	trb $F1.b		; 14 F1
	and $30.b,S		; 23 30
	cop $E1.b		; 02 E1
	stp		; DB
	lda ($10.b)		; B2 10
	and $DCBDBC.l		; 2F BC BD DC
	tsx		; BA
	tax		; AA
	tax		; AA
	ldx $05.b		; A6 05
	bmi  21.b		; 30 15
	eor ($32.b,S),Y		; 53 32
	and ($1C.b)		; 32 1C
	ldy $10A6.w		; AC A6 10
	xba		; EB
	sbc $FD10.w,X		; FD 10 FD
	and $C2F1CD.l		; 2F CD F1 C2
	inc $01FF.w		; EE FF 01
	and ($33.b)		; 32 33
	eor $43.b		; 45 43
	and ($A6.b,X)		; 21 A6
	rol $0FEA.w		; 2E EA 0F
	asl $4DD1.w,X		; 1E D1 4D
	ldy $A614.w,X		; BC 14 A6
	brk $E1.b		; 00 E1
	adc $21.b,X		; 75 21
	ora [$50.b],Y		; 17 50
	xba		; EB
	and $CEA6.w		; 2D A6 CE
	lda $FE.b,S		; A3 FE
	xba		; EB
	.db $62, $FE, $9F		; 62 FE 9F
	and $A6.b		; 25 A6
	lda $135006.l		; AF 06 50 13
	lsr $10.b,X		; 56 10
	sbc ($2B.b,X)		; E1 2B
	lda ($0E.b)		; B2 0E
	beq -20.b		; F0 EC
	ldy $EDF0.w,X		; BC F0 ED
	cpy $C2DC.w		; CC DC C2
	cmp $0FF0.w,X		; DD F0 0F
	ora ($34.b)		; 12 34
	eor $34.b,S		; 43 34
	and ($A6.b),Y		; 31 A6
	wai		; CB
	rti		; 40

	wai		; CB
	dec $5C.b,X		; D6 5C
	sbc $B6AD30.l		; EF 30 AD B6
	sbc ($3F.b)		; F2 3F
	sbc ($34.b),Y		; F1 34
	ora $CD3002.l,X		; 1F 02 30 CD
	ldx $01.b		; A6 01
	xba		; EB
	cmp $04D033.l		; CF 33 D0 04
	ora $A69F.w		; 0D 9F A6
	ora ($1D.b,S),Y		; 13 1D
	and $72.b,S		; 23 72
	and $AE1063.l		; 2F 63 10 AE
	ldx $0C.b		; A6 0C
	lda $1EF1.w,X		; BD F1 1E
	ora ($14.b),Y		; 11 14
	ora $A6C0.w,Y		; 19 C0 A6
	ora ($E0.b),Y		; 11 E0
	ora $42.b,X		; 15 42
	tsb $46.b		; 04 46
	cpx $B6EF.w		; EC EF B6
	trb $E3C1.w		; 1C C1 E3
	sbc $5120.w,X		; FD 20 51
	ldx #$B6F0.w		; A2 F0 B6
	inc $4010.w		; EE 10 40
	brk $33.b		; 00 33
	and $A60000.l		; 2F 00 00 A6
	lda $1ECF.w,Y		; B9 CF 1E
	sbc $E11026.l,X		; FF 26 10 E1
	ora $ADA6.w,X		; 1D A6 AD
	inc $3E.b,X		; F6 3E
	and $55.b,S		; 23 55
	sbc ($20.b,S),Y		; F3 20
	inc A		; 1A
	ldx $CC.b		; A6 CC
	bne -81.b		; D0 AF
	ora ($10.b,S),Y		; 13 10
	bit $01.b,X		; 34 01
	nop		; EA
	ldx $FD.b		; A6 FD
.INDEX 8
	sep #$14		; E2 14
	bpl  84.b		; 10 54
	.db $42, $01		; 42 01
	inc $C9A6.w,X		; FE A6 C9
	bne -35.b		; D0 DD
	pei ($7F.b)		; D4 7F
	brk $66.b		; 00 66
	cmp #$DEB6.w		; C9 B6 DE
	lsr $260F.w		; 4E 0F 26
	asl $6F21.w		; 0E 21 6F
	cmp $FA02B2.l		; CF B2 02 FA
	lda #$CECD.w		; A9 CD CE
	sbc ($41.b,S),Y		; F3 41
	jsl $C0EEB6.l		; 22 B6 EE C0
	and ($1F.b),Y		; 31 1F
	trb $21.b		; 14 21
	ora $ECB63E.l		; 0F 3E B6 EC
	bne  -2.b		; D0 FE
	asl $F541.w,X		; 1E 41 F5
	cop $FD.b		; 02 FD
	ldx $3A.b		; A6 3A
	bcs -44.b		; B0 D4
	and $1E.b,X		; 35 1E
	ror $30.b		; 66 30
	dec $30B2.w,X		; DE B2 30
	nop		; EA
	txs		; 9A
	plb		; AB
	ldx $4401.w,Y		; BE 01 44
	mvp $BB,$A6		; 44 A6 BB
	cmp $D323.w		; CD 23 D3
	lsr $3D.b		; 46 3D
	eor $3E.b		; 45 3E
	ldx $A0.b,Y		; B6 A0
	cpy #$EC.b		; C0 EC
	ora ($04.b),Y		; 11 04
	pea $3E11.w		; F4 11 3E
	ldx $E0.b,Y		; B6 E0
	lda $123F00.l,X		; BF 00 3F 12
	jsl $B20011.l		; 22 11 00 B2
	eor ($DB.b),Y		; 51 DB
	sta $BCA9.w,Y		; 99 A9 BC
	sbc ($35.b)		; F2 35
	ror $B2.b		; 66 B2
	eor ($ED.b),Y		; 51 ED
	ldx $02CD.w,Y		; BE CD 02
	eor $57.b,S		; 43 57
	adc [$B6.b],Y		; 77 B6
	cmp $ED0B.w		; CD 0B ED
	sbc ($10.b,S),Y		; F3 10
	bmi  83.b		; 30 53
	brk $A6.b		; 00 A6
	dec $CEDA.w,X		; DE DA CE
	and $13.b,S		; 23 13
	.db $42, $44		; 42 44
	and ($B6.b,X)		; 21 B6
	cmp $CDFD.w,X		; DD FD CD
	sbc ($12.b)		; F2 12
	ora ($54.b),Y		; 11 54
	brk $A6.b		; 00 A6
	bne -69.b		; D0 BB
	lda $1123.w		; AD 23 11
	adc $50.b,S		; 63 50
	eor $CC0EB6.l		; 4F B6 0E CC
	dec $02F0.w,X		; DE F0 02
	bit $31.b		; 24 31
	and ($A6.b,X)		; 21 A6
	and $AFAA.w,X		; 3D AA AF
	rol $6602.w,X		; 3E 02 66
	ora ($10.b)		; 12 10
	ldx $4B.b,Y		; B6 4B
	stp		; DB
	inc $30FD.w		; EE FD 30
	eor ($42.b,X)		; 41 42
	and ($C2.b),Y		; 31 C2
	eor $20.b,S		; 43 20
	ora $01FFEE.l		; 0F EE FF 01
	jsl $1EB633.l		; 22 33 B6 1E
	wai		; CB
	inc $F2EF.w		; EE EF F2
	eor $21.b,S		; 43 21
	bit $A6.b,X		; 34 A6
	ora $CFAD.w,X		; 1D AD CF
	ldy $5F16.w		; AC 16 5F
	bit $62.b,X		; 34 62
	ldx $FD.b,Y		; B6 FD
	inc $EFCB.w,X		; FE CB EF
	ora ($03.b)		; 12 03
	mvp $A6,$31		; 44 31 A6
	ora ($DF.b,X)		; 01 DF
	sta $20D0.w,Y		; 99 D0 20
	ora $54.b		; 05 54
	and ($B6.b,X)		; 21 B6
	ora $EECDDD.l,X		; 1F DD CD EE
	brk $34.b		; 00 34
	jsl $4DB651.l		; 22 51 B6 4D
	asl $CED0.w		; 0E D0 CE
	ora ($30.b,X)		; 01 30
	tsb $12.b		; 04 12
	ldx $0E.b,Y		; B6 0E
	phd		; 0B
	cpx $E1DF.w		; EC DF E1
	and ($54.b),Y		; 31 54
	and $A6.b,S		; 23 A6
	ora ($19.b)		; 12 19
	cpy $DEDD.w		; CC DD DE
	eor $52.b,S		; 43 52
	rol $B6.b		; 26 B6
	ora $0C09FB.l		; 0F FB 09 0C
	sbc ($03.b)		; F2 03
	.db $42, $71		; 42 71
.INDEX 16
	rep #$55		; C2 55
	mvp $0E,$21		; 44 21 0E
	sbc $33F1FF.l		; EF FF F1 33
	ldx $1E.b,Y		; B6 1E
	sbc $0FCFDB.l,X		; FF DB CF 0F
	ora ($45.b),Y		; 11 45
	eor ($A6.b),Y		; 51 A6
	and ($3E.b)		; 32 3E
	txs		; 9A
	sbc $45E4CD.l		; EF CD E4 45
	bmi -74.b		; 30 B6
	ora ($0D.b),Y		; 11 0D
	lda $EFEE.w,X		; BD EE EF
	tsb $26.b		; 04 26
	and $A6.b,S		; 23 A6
	mvn $9E,$0F		; 54 0F 9E
	cmp $01DC.w		; CD DC 01
	bit $24.b,X		; 34 24
	ldx $10.b,Y		; B6 10
	inc $DEDD.w,X		; FE DD DE
	sbc DMADEST3.w		; ED 31 43
	eor $B6.b,S		; 43 B6
	.db $42, $0E		; 42 0E
	inc $DE0D.w,X		; FE 0D DE
	bpl  62.b		; 10 3E
	bit $B6.b		; 24 B6
	bpl -18.b		; 10 EE
	sbc $D0EC.w		; ED EC D0
	ora ($24.b),Y		; 11 24
	mvn $53,$A6		; 54 A6 53
	bpl -20.b		; 10 EC
	cpy $C0DE.w		; CC DE C0
	ora ($35.b,S),Y		; 13 35
	ldx $1F.b,Y		; B6 1F
	ora $FFCDDE.l		; 0F DE CD FF
	brk $25.b		; 00 25
	and $A6.b,X		; 35 A6
	adc $02.b		; 65 02
	cpy #$CE9D.w		; C0 9D CE
	inc $4510.w		; EE 10 45
	ldx $01.b,Y		; B6 01
	ora $DDFE.w		; 0D FE DD
	bne   0.b		; D0 00
	ora ($56.b,S),Y		; 13 56
	ldx $42.b		; A6 42
	eor $FC.b,S		; 43 FC
	lda $F3BFDD.l		; AF DD BF F3
	bvc -74.b		; 50 B6
	sbc ($00.b,S),Y		; F3 00
	cpy $EDFF.w		; CC FF ED
	cmp ($24.b,S),Y		; D3 24
	trb $B6.b		; 14 B6
	eor $00.b,X		; 55 00
	cpx #$EC0E.w		; E0 0E EC
	brk $0F.b		; 00 0F
	cop $B6.b		; 02 B6
	bmi  -2.b		; 30 FE
	sbc $01EEEC.l,X		; FF EC EE 01
	ora ($55.b,X)		; 01 55
	ldx $51.b,Y		; B6 51
	ora ($02.b)		; 12 02
	ldx $FEE0.w,Y		; BE E0 FE
	cpx #$B622.w		; E0 22 B6
	brk $00.b		; 00 00
	inc $EFCE.w,X		; FE CE EF
	ora $A633F5.l		; 0F F5 33 A6
	adc [$63.b],Y		; 77 63
	asl $FCDD.w		; 0E DD FC
	ldx $02E1.w,Y		; BE E1 02
	ldx $10.b,Y		; B6 10
	brk $EE.b		; 00 EE
	inc $0FEE.w		; EE EE 0F
	ora $17.b,S		; 03 17
.ACCU 16
.INDEX 16
	rep #$34		; C2 34
	lsr $66.b,X		; 56 66
	and ($22.b,S),Y		; 33 22
	ora $A600FF.l,X		; 1F FF 00 A6
	cmp ($11.b),Y		; D1 11
	phx		; DA
	jmp.w [$AFDF]		; DC DF AF
	and $73.b		; 25 73
.ACCU 16
	rep #$23		; C2 23
	lsr $65.b,X		; 56 65
	mvp $10,$32		; 44 32 10
	beq  15.b		; F0 0F
	ldx $02.b		; A6 02
	ora ($AE.b),Y		; 11 AE
	sta ($DB.b),Y		; 91 DB
	lda ($25.b),Y		; B1 25
	ora [$B6.b],Y		; 17 B6
	bit $42.b,X		; 34 42
	brk $10.b		; 00 10
	dec $FFFF.w,X		; DE FF FF
	beq -90.b		; F0 A6
	ora $0D.b,S		; 03 0D
	cpy $BB1D.w		; CC 1D BB
	beq  48.b		; F0 30
	and ($B6.b,S),Y		; 33 B6
	mvn $03,$40		; 54 40 03
	and $1FFD.w		; 2D FD 1F
	inc $A6C2.w,X		; FE C2 A6
	bmi  -7.b		; 30 F9
	and $1F90DB.l		; 2F DB 90 1F
	asl $C247.w		; 0E 47 C2
	ora ($34.b,S),Y		; 13 34
	ror $64.b		; 66 64
	and ($32.b,S),Y		; 33 32
	ora $0EB6F0.l		; 0F F0 B6 0E
	beq  15.b		; F0 0F
	dec $0ED2.w,X		; DE D2 0E
	sbc ($44.b,X)		; E1 44
	ldx $03.b,Y		; B6 03
	and $40.b		; 25 40
	cpx #$EEF2.w		; E0 F2 EE
	cmp $FFC210.l,X		; DF 10 C2 FF
	sbc $CCCBFE.l,X		; FF FE CB CC
	wai		; CB
	cmp $B6EF.w		; CD EF B6
	ora ($36.b,S),Y		; 13 36
	ora $DF2F10.l,X		; 1F 10 2F DF
	sbc ($0C.b,X)		; E1 0C
	ldx $EF.b,Y		; B6 EF
	eor ($AE.b,X)		; 41 AE
	beq  28.b		; F0 1C
	sbc $B6FF42.l		; EF 42 FF B6
	bit $61.b,X		; 34 61
	ora ($21.b),Y		; 11 21
	asl $0FE0.w		; 0E E0 0F
	inc $D1A6.w		; EE A6 D1
	ora $0DBC.w,X		; 1D BC 0D
	jmp.w [$31C3]		; DC C3 31
	cop $C2.b		; 02 C2
	sbc ($34.b),Y		; F1 34
	eor $57.b,X		; 55 57
	eor ($33.b,S),Y		; 53 33
	and ($0F.b)		; 32 0F
	ldx $01.b,Y		; B6 01
	tsb $1F0D.w		; 0C 0D 1F
	dec $1EF3.w		; CE F3 1E
	ora ($B6.b),Y		; 11 B6
	mvp $24,$03		; 44 03 24
	rol $01E1.w,X		; 3E E1 01
	dec $B6F0.w,X		; DE F0 B6
	ora $1FFE.w		; 0D FE 1F
	cpx $10FE.w		; EC FE 10
	brk $12.b		; 00 12
	ldx $31.b,Y		; B6 31
	rti		; 40

	eor ($2F.b,S),Y		; 53 2F
	sbc ($1E.b),Y		; F1 1E
	inc $A600.w,X		; FE 00 A6
	sta $0BEF.w,X		; 9D EF 0B
	cmp $EECE.w		; CD CE EE
	jsl $15A642.l		; 22 42 A6 15
	ror $44.b,X		; 76 44
	eor ($F1.b)		; 52 F1
	inc $CE2D.w		; EE 2D CE
	rep #$00		; C2 00
	inc $DCEE.w,X		; FE EE DC
	tyx		; BB
	plb		; AB
	tyx		; BB
	dec $11B6.w,X		; DE B6 11
	rol $22.b		; 26 22
	cop $20.b		; 02 20
	sbc $B6FDE3.l		; EF E3 FD B6
	dec $CE20.w,X		; DE 20 CE
	cpx #$EF0B.w		; E0 0B EF
	bit $F0.b		; 24 F0
	ldx $22.b,Y		; B6 22
	eor ($05.b),Y		; 51 05
	bit $ED.b		; 24 ED
	and $B6C11F.l,X		; 3F 1F C1 B6
	sbc $E020F9.l,X		; FF F9 20 E0
	bcc  15.b		; 90 0F
	ora $16A632.l		; 0F 32 A6 16
	and $74.b		; 25 74
	stz $00.b,X		; 74 00
.ACCU 16
	rep #$2D		; C2 2D
	sbc $B0A6.w		; ED A6 B0
	cpx $2EAD.w		; EC AD 2E
	txs		; 9A
	lda ($3F.b,X)		; A1 3F
	rol $43B6.w,X		; 3E B6 43
	and ($25.b,X)		; 21 25
	jsl $E0211D.l		; 22 1D 21 E0
	cpx #$19A6.w		; E0 A6 19
	ldy $9B01.w,X		; BC 01 9B
	dec $F1E9.w,X		; DE E9 F1
	eor $A6.b		; 45 A6
	jsl $477564.l		; 22 64 75 47
	ora ($1D.b,X)		; 01 1D
	ora $FEB6C1.l,X		; 1F C1 B6 FE
	jsr ($FE0F.w,X)		; FC 0F FE
	cmp $220EDF.l,X		; DF DF 0E 22
	ldx $06.b,Y		; B6 06
	sbc ($31.b,S),Y		; F3 31
	adc ($11.b,X)		; 61 11
	sbc ($0E.b),Y		; F1 0E
	asl $2DA6.w		; 0E A6 2D
	lda $ECCE.w		; AD CE EC
	xba		; EB
	lda $30D0.w,X		; BD D0 30
	ldx $22.b,Y		; B6 22
	and ($13.b,S),Y		; 33 13
	eor ($4F.b,X)		; 41 4F
	brk $00.b		; 00 00
	sbc $EBEDA6.l,X		; FF A6 ED EB
	lda $E9CEFB.l,X		; BF FB CE E9
	ldy #$A643.w		; A0 43 A6
	ora $66.b,S		; 03 66
	stz $45.b,X		; 74 45
	adc ($FE.b,S),Y		; 73 FE
	brk $FD.b		; 00 FD
	ldx $DE.b		; A6 DE
	inc $0DAC.w		; EE AC 0D
	stp		; DB
	wai		; CB
	inc $B6D2.w,X		; FE D2 B6
	jsl $351333.l		; 22 33 13 35
	ora ($00.b),Y		; 11 00
	rol $B6FD.w		; 2E FD B6
	sbc ($EE.b)		; F2 EE
	cmp $C2DE1F.l		; CF 1F DE C2
	dec $A6E2.w,X		; DE E2 A6
	rol $15.b,X		; 36 15
	adc [$74.b]		; 67 74
	bit $32.b,X		; 34 32
	inc $A6FD.w		; EE FD A6
	trb $CCCE.w		; 1C CE CC
	inc A		; 1A
	ora #$DACF.w		; 09 CF DA
	inc $32B6.w		; EE B6 32
	ora ($33.b)		; 12 33
	adc ($21.b,X)		; 61 21
	bmi  15.b		; 30 0F
	inc $3DA6.w,X		; FE A6 3D
	lda $BBE0.w		; AD E0 BB
	sbc $119CDB.l		; EF DB 9C 11
.ACCU 16
.INDEX 16
	rep #$BB		; C2 BB
	cmp $572402.l		; CF 02 24 57
	ror $66.b,X		; 76 66
	mvn $32,$C2		; 54 C2 32
	ora ($0F.b),Y		; 11 0F
	sbc $BABBED.l		; EF ED BB BA
	lda #$12B6.w		; A9 B6 12
	ora $24.b,S		; 03 24
	eor $14.b,S		; 43 14
	ora ($F0.b)		; 12 F0
	asl $FFA6.w		; 0E A6 FF
	ldy $FBDF.w,X		; BC DF FB
	inc $CCAE.w		; EE AE CC
	xba		; EB
	ldx $10.b,Y		; B6 10
	and $14.b,S		; 23 14
	.db $42, $50		; 42 50
	and ($02.b),Y		; 31 02
	inc $0EA6.w		; EE A6 0E
	cmp $E0BF.w		; CD BF E0
	wai		; CB
	asl A		; 0A
	cmp $B690.w,X		; DD 90 B6
	sbc ($11.b),Y		; F1 11
	and ($44.b,S),Y		; 33 44
	jsl $F11031.l		; 22 31 10 F1
	ldx $EF.b,Y		; B6 EF
	dec $FE0F.w,X		; DE 0F FE
	sbc ($FC.b,X)		; E1 FC
	xce		; FB
	ora $13FEB6.l,X		; 1F B6 FE 13
	and $42.b,S		; 23 42
	eor $01.b		; 45 01
	ora ($0F.b)		; 12 0F
	ldx $AE.b		; A6 AE
	tsb $00BB.w		; 0C BB 00
	sbc $FEAC.w,X		; FD AC FE
	tsx		; BA
	ldx $F0.b,Y		; B6 F0
	ora ($22.b),Y		; 11 22
	eor $24.b		; 45 24
	ora ($20.b)		; 12 20
	ora $DEE1B6.l,X		; 1F B6 E1 DE
	cmp $E1FF1E.l,X		; DF 1E FF E1
	dec $B6ED.w		; CE ED B6
	ora $34F502.l		; 0F 02 F5 34
	and ($23.b,S),Y		; 33 23
	jsr $A600.w		; 20 00 A6
	sbc $F1BEDA.l		; EF DA BE F1
	cpy $CA0E.w		; CC 0E CA
	cmp $EFB6.w		; CD B6 EF
	ora $354322.l,X		; 1F 22 43 35
	bmi  48.b		; 30 30
	jsr $EFB6.w		; 20 B6 EF
	sbc $0F0C.w,X		; FD 0C 0F
	beq  14.b		; F0 0E
	cmp $B60D.w,X		; DD 0D B6
	inc $21F1.w,X		; FE F1 21
	and ($53.b,S),Y		; 33 53
	and ($21.b)		; 32 21
	ora ($A6.b),Y		; 11 A6
	inc $DCBD.w		; EE BD DC
	cmp $ADEFD1.l,X		; DF D1 EF AD
	dex		; CA
	ldx $0D.b,Y		; B6 0D
	beq  18.b		; F0 12
	and ($43.b)		; 32 43
	eor ($F2.b,S),Y		; 53 F2
	bmi -62.b		; 30 C2
	stz $43.b		; 64 43
	jsr $F00F.w		; 20 0F F0
	sbc $CBDD.w,X		; FD DD CB
	ldx $CE.b,Y		; B6 CE
	bpl  31.b		; 10 1F
	and $53.b		; 25 53
	ora ($43.b)		; 12 43
	brk $A6.b		; 00 A6
	cmp ($1B.b)		; D2 1B
	lda #$FE00.w		; A9 00 FE
	lda $FB.b,S		; A3 FB
	lda $F0B6.w,Y		; B9 B6 F0
	cmp $234201.l,X		; DF 01 42 23
	eor ($21.b,S),Y		; 53 21
	ora ($A6.b)		; 12 A6
	rol $EEBC.w,X		; 3E BC EE
	jmp.w [$1FD0]		; DC D0 1F
	wai		; CB
	sbc $DDB6.w		; ED B6 DD
	cpx #$2101.w		; E0 01 21
	eor $32.b		; 45 32
	and ($31.b),Y		; 31 31
	ldx $0F.b,Y		; B6 0F
	asl $FF1B.w		; 0E 1B FF
	ora $FDFEF0.l		; 0F F0 FE FD
	ldx $DE.b,Y		; B6 DE
	sbc $3222F1.l,X		; FF F1 22 32
	eor ($21.b,S),Y		; 53 21
	jsl $DE4EA6.l		; 22 A6 4E DE
	cmp $2DFEBC.l,X		; DF BC FE 2D
	dec $B6ED.w,X		; DE ED B6
	cmp $10FE.w		; CD FE 10
	sbc $15.b,X		; F5 15
	bmi  96.b		; 30 60
	eor ($A6.b,X)		; 41 A6
	sbc ($0E.b),Y		; F1 0E
	xce		; FB
	cpy $CE01.w		; CC 01 CE
	asl $A6EB.w		; 0E EB A6
	plb		; AB
	dec $25EE.w		; CE EE 25
	ror $46.b,X		; 76 46
	ror $42.b		; 66 42
	ldx $03.b		; A6 03
	and $E0CC.w		; 2D CC E0
	sbc $21CF.w		; ED CF 21
	sta $B1B6.w,X		; 9D B6 B1
	inc $14DF.w		; EE DF 14
	jsl $0F4315.l		; 22 15 43 0F
	ldx $34.b,Y		; B6 34
	inc $00EF.w,X		; FE EF 00
	sbc $0EF2.w		; ED F2 0E
	dec $0EB6.w,X		; DE B6 0E
	jmp.w [$11F1]		; DC F1 11
	ora ($54.b),Y		; 11 54
	and ($F3.b)		; 32 F3
	ldx $32.b,Y		; B6 32
	inc $2BF0.w,X		; FE F0 2B
	inc $FD20.w,X		; FE 20 FD
	cpx #$0CB6.w		; E0 B6 0C
	jmp.w [$0F01]		; DC 01 0F
	ora ($62.b,S),Y		; 13 62
	ora ($33.b)		; 12 33
	ldx $30.b		; A6 30
	sbc $C1DB11.l,X		; FF 11 DB C1
	rol $C0CF.w		; 2E CF C0
	ldx $ED.b,Y		; B6 ED
	dec $D100.w		; CE 00 D1
	trb $41.b		; 14 41
	and ($54.b),Y		; 31 54
	rep #$44		; C2 44
	eor $54.b		; 45 54
	and ($22.b),Y		; 31 22
	bpl   0.b		; 10 00
	ora $FFBEB6.l,X		; 1F B6 BE FF
	sbc $32E2.w		; ED E2 32
	ora ($44.b)		; 12 44
	and ($A6.b,X)		; 21 A6
	cop $42.b		; 02 42
	jsr ($0EF0.w,X)		; FC F0 0E
	cmp $B6DB20.l		; CF 20 DB B6
	cpy #$FBED.w		; C0 ED FB
	ora ($10.b)		; 12 10
	and $43.b,S		; 23 43
	and ($A6.b,X)		; 21 A6
	ora ($61.b)		; 12 61
	bcs  17.b		; B0 11
	sbc $11D1.w		; ED D1 11
	tsx		; BA
	ldx $EF.b,Y		; B6 EF
	sbc $11CE.w,X		; FD CE 11
	beq  51.b		; F0 33
	eor ($02.b)		; 52 02
	ldx $23.b,Y		; B6 23
	trb $3E11.w		; 1C 11 3E
	bne -12.b		; D0 F4
	inc $B6D0.w,X		; FE D0 B6
	sbc $0FD0AE.l,X		; FF AE D0 0F
.ACCU 8
	sep #$25		; E2 25
	jsl $52A613.l		; 22 13 A6 52
	sbc $DE0E24.l		; EF 24 0E DE
	and ($EE.b)		; 32 EE
	cmp $DEFCB6.l,X		; DF B6 FC DE
	cpx #$01EE.w		; E0 EE 01
	and ($23.b)		; 32 23
	and ($B2.b)		; 32 B2
	adc [$76.b],Y		; 77 76
	adc [$67.b],Y		; 77 67
	adc $44.b		; 65 44
	stz $21.b		; 64 21
	ldx $EC.b		; A6 EC
	sta $EDDE.w,Y		; 99 DE ED
.ACCU 16
	rep #$66		; C2 66
	and ($77.b,S),Y		; 33 77
	rep #$43		; C2 43
	and ($44.b,S),Y		; 33 44
	and ($24.b,S),Y		; 33 24
	and ($22.b)		; 32 22
	and ($B6.b)		; 32 B6
	lda $0CDCB1.l,X		; BF B1 DC 0C
	and ($E4.b),Y		; 31 E4
	ora [$2F.b]		; 07 2F
	ldx $61.b		; A6 61
	eor ($97.b,X)		; 41 97
	ora ($0C.b)		; 12 0C
	trb $10.b		; 14 10
	ldx $1DB6.w		; AE B6 1D
	stp		; DB
	cmp ($FE.b),Y		; D1 FE
	cpx #$2331.w		; E0 31 23
	trb $A6.b		; 14 A6
	eor $215E.w		; 4D 5E 21
	inc $0E.b		; E6 0E
	rol $0E22.w,X		; 3E 22 0E
	ldx $B0.b,Y		; B6 B0
	sbc $F0DD.w		; ED DD F0
	sbc ($E3.b,X)		; E1 E3
	and ($21.b)		; 32 21
	ldx $73.b		; A6 73
.ACCU 8
.INDEX 8
	sep #$F0		; E2 F0
	bvc -15.b		; 50 F1
	ora $0D.b,X		; 15 0D
	brk $B6.b		; 00 B6
	asl $EFAE.w		; 0E AE EF
	xce		; FB
	brk $22.b		; 00 22
	sbc ($32.b,S),Y		; F3 32
.ACCU 16
.INDEX 16
	rep #$32		; C2 32
	and $13.b,S		; 23 13
	jsl $343342.l		; 22 42 33 34
	and ($B6.b)		; 32 B6
	asl $EEDC.w		; 0E DC EE
	sbc $2211EF.l		; EF EF 11 22
	jsl $2F42A6.l		; 22 A6 42 2F
	cop $13.b		; 02 13
	ora ($30.b,X)		; 01 30
	ror $B6F2.w		; 6E F2 B6
	inc $FCCD.w,X		; FE CD FC
	inc $E1D3.w,X		; FE D3 E1
	bpl  97.b		; 10 61
	ldx $24.b		; A6 24
	cmp [$F0.b]		; C7 F0
	ora $022342.l,X		; 1F 42 23 02
	and $0F32C2.l		; 2F C2 32 0F
	cmp $ABCA.w,X		; DD CA AB
	ldy $F0CD.w,X		; BC CD F0
	ldx $5F.b		; A6 5F
	sbc ($30.b,S),Y		; F3 30
	ora $043152.l		; 0F 52 31 04
	and $DFEEB6.l,X		; 3F B6 EE DF
	dec $0EDE.w		; CE DE 0E
	brk $13.b		; 00 13
	and ($C2.b,X)		; 21 C2
	brk $01.b		; 00 01
	and ($11.b,X)		; 21 11
	and $33.b,S		; 23 33
	bit $55.b,X		; 34 55
	ldx $EF.b,Y		; B6 EF
	sbc $1DDECC.l,X		; FF CC DE 1D
	sbc $A62F12.l		; EF 12 2F A6
	adc ($50.b)		; 72 50
	sbc ($23.b),Y		; F1 23
	ora ($31.b),Y		; 11 31
	.db $62, $12, $B6		; 62 12 B6
	ora $EC0D.w,X		; 1D 0D EC
	dec $FFFE.w,X		; DE FE FF
	ora ($11.b),Y		; 11 11
	ldx $24.b		; A6 24
	.db $42, $EF		; 42 EF
	eor $22.b,S		; 43 22
	tsb $45.b		; 04 45
	brk $C2.b		; 00 C2
	eor $31.b		; 45 31
	asl $CBED.w		; 0E ED CB
	plb		; AB
	wai		; CB
	cmp $46A6.w		; CD A6 46
	cmp ($14.b),Y		; D1 14
	jsr $1714.w		; 20 14 17
	brk $42.b		; 00 42
	ldx $3E.b		; A6 3E
	ldx $AABB.w		; AE BB AA
	cmp $31F2CE.l,X		; DF CE F2 31
	ldx $41.b		; A6 41
	bit $EF.b,X		; 34 EF
	bvc 110.b		; 50 6E
	and $06.b		; 25 06
	asl $20B6.w,X		; 1E B6 20
	ora $EEBF.w		; 0D BF EE
	sbc $101D.w		; ED 1D 10
	ora $A6.b,S		; 03 A6
	ora ($4E.b)		; 12 4E
	rti		; 40

	tsb $15.b		; 04 15
	jsr $3223.w		; 20 23 32
	ldx $F0.b		; A6 F0
	sbc $BEB9.w,X		; FD B9 BE
	ldx $4DEB.w,Y		; BE EB 4D
	bmi -62.b		; 30 C2
	sbc $120FF0.l		; EF F0 0F 12
	ora ($24.b,S),Y		; 13 24
	eor $43.b,S		; 43 43
	rep #$44		; C2 44
	.db $42, $0F		; 42 0F
	sbc $CCDC.w,X		; FD DC CC
	cpy $A6CD.w		; CC CD A6
	eor $10.b,S		; 43 10
	ora $30.b,S		; 03 30
	trb $43.b		; 14 43
	asl $C243.w,X		; 1E 43 C2
	mvp $10,$32		; 44 32 10
	sbc $DCDC.w,X		; FD DC DC
	ldy $A6DD.w,X		; BC DD A6
	eor ($F7.b,X)		; 41 F7
	ldy $02.b,X		; B4 02
	.db $42, $34		; 42 34
	cpx $02.b		; E4 02
	ldx $10.b		; A6 10
	ora $AECC.w		; 0D CC AE
	cpy $E0FE.w		; CC FE E0
	ora $A6.b,S		; 03 A6
	ora ($50.b),Y		; 11 50
	ora $304312.l,X		; 1F 12 43 30
	and ($31.b),Y		; 31 31
	ldx $0F.b,Y		; B6 0F
	ora $EFFF0A.l,X		; 1F 0A FF EF
	cpx #$2FFF.w		; E0 FF 2F
	ldx $14.b		; A6 14
	and ($E0.b)		; 32 E0
	rti		; 40

	and ($34.b)		; 32 34
	jsr $A611.w		; 20 11 A6
	ora ($EF.b)		; 12 EF
	cpy $CDCC.w		; CC CC CD
	cpx #$F2FE.w		; E0 FE F2
	ldx $32.b		; A6 32
	ora ($12.b),Y		; 11 12
	sbc $15.b,S		; E3 15
	ora [$F3.b]		; 07 F3
	sbc ($A6.b),Y		; F1 A6
	ora ($0F.b),Y		; 11 0F
	cpy $AEBF.w		; CC BF AE
	sbc $012D.w		; ED 2D 01
	ldx $14.b		; A6 14
	jsr $F210.w		; 20 10 F2
	bmi  20.b		; 30 14
	eor ($FF.b,S),Y		; 53 FF
	ldx $31.b		; A6 31
	ora $99CEEF.l,X		; 1F EF CE 99
	and $B6B4FD.l		; 2F FD B4 B6
	jsr $511D.w		; 20 1D 51
	ora $41F2.w,X		; 1D F2 41
	ora $0FB622.l,X		; 1F 22 B6 0F
	sbc ($1F.b),Y		; F1 1F
	cpx $EEF0.w		; EC F0 EE
	sbc $F0A610.l,X		; FF 10 A6 F0
	and $3F.b		; 25 3F
	cpx #$1033.w		; E0 33 10
	mvp $A6,$5D		; 44 5D A6
	sbc $DDFC41.l,X		; FF 41 FC DD
	xce		; FB
	lda $96FCF0.l		; AF F0 FC 96
	.db $62, $67, $0F		; 62 67 0F
	adc ($E0.b,X)		; 61 E0
	ror $66.b		; 66 66
	ora ($A6.b)		; 12 A6
	cop $0F.b		; 02 0F
	brk $DB.b		; 00 DB
	cmp $EFCE.w,X		; DD CE EF
	beq -90.b		; F0 A6
	ora ($24.b,X)		; 01 24
	jsr $5E1D.w		; 20 1D 5E
	and ($44.b,X)		; 21 44
	jmp $3EA6.w		; 4C A6 3E
	and ($D1.b),Y		; 31 D1
	ldx #$DDAB.w		; A2 AB DD
	asl $96D1.w,X		; 1E D1 96
	sbc [$7C.b]		; E7 7C
	stz $43.b		; 64 43
	bcc  70.b		; 90 46
	adc ($24.b,S),Y		; 73 24
	ldx $11.b		; A6 11
	ora $9C0E0F.l		; 0F 0F 0E 9C
	jsr ($0E0C.w,X)		; FC 0C 0E
	ldx $23.b		; A6 23
	brk $61.b		; 00 61
	lsr A		; 4A
	jsr $2013.w		; 20 13 20
	and ($A6.b,S),Y		; 33 A6
	rol $300F.w		; 2E 0F 30
	xba		; EB
	jmp.w [$DD0B]		; DC 0B DD
	sbc ($A6.b,S),Y		; F3 A6
	brk $12.b		; 00 12
	eor ($0E.b,S),Y		; 53 0E
	sbc $21.b,S		; E3 21
	beq 116.b		; F0 74
	ldx $F0.b,Y		; B6 F0
	sbc ($10.b),Y		; F1 10
	inc $EE0F.w		; EE 0F EE
	cmp ($10.b,X)		; C1 10
	ldx $EC.b		; A6 EC
	stz $22.b,X		; 74 22
	cmp ($30.b)		; D2 30
	ora $4124.w		; 0D 24 41
	ldx $FF.b		; A6 FF
	and $FE.b,S		; 23 FE
	bne  13.b		; D0 0D
	tax		; AA
	sbc ($FD.b),Y		; F1 FD
	ldx $D1.b		; A6 D1
	stz $0E.b,X		; 74 0E
	bit $3B.b,X		; 34 3B
	beq  69.b		; F0 45
	beq -74.b		; F0 B6
	brk $30.b		; 00 30
	inc $FC02.w,X		; FE 02 FC
	sbc $EE00.w,X		; FD 00 EE
	ldx $F5.b		; A6 F5
	adc $FE5320.l		; 6F 20 53 FE
	sbc ($60.b,X)		; E1 60
	cmp ($B6.b),Y		; D1 B6
	ora ($0F.b,S),Y		; 13 0F
	beq  32.b		; F0 20
	cmp $0BE1.w,X		; DD E1 0B
	cpx #$ACB2.w		; E0 B2 AC
	cpy $43D1.w		; CC D1 43
	ora ($14.b),Y		; 11 14
	jsl $23A613.l		; 22 13 A6 23
	sbc $ED2C12.l		; EF 12 2C ED
	inc $F0BA.w		; EE BA F0
	ldx $01.b		; A6 01
	cop $64.b		; 02 64
	cop $00.b		; 02 00
	ora ($1F.b,X)		; 01 1F
	brk $B2.b		; 00 B2
	bit $32.b		; 24 32
	and ($54.b,S),Y		; 33 54
	and ($00.b,X)		; 21 00
	xce		; FB
	lda #$11B6.w		; A9 B6 11
	cmp ($15.b),Y		; D1 15
	and $E02010.l		; 2F 10 20 E0
	ora ($A6.b,X)		; 01 A6
	phy		; 5A
	cop $32.b		; 02 32
	cpx #$0BF1.w		; E0 F1 0B
	lda $A6FE.w		; AD FE A6
	jmp.w [$5403]		; DC 03 54
	ora ($33.b)		; 12 33
	tsa		; 3B
	ora $A641.w,X		; 1D 41 A6
	jsr ($4E22.w,X)		; FC 22 4E
	ora $AD34.w,X		; 1D 34 AD
	cpy $A619.w		; CC 19 A6
	cmp $5431F3.l,X		; DF F3 31 54
	eor ($FF.b),Y		; 51 FF
	jsr $A6E0.w		; 20 E0 A6
	ora $3FF102.l		; 0F 02 F1 3F
	bpl  -1.b		; 10 FF
	lda $C2DD.w		; AD DD C2
	jmp.w [$EFCD]		; DC CD EF
	beq  35.b		; F0 23
	jsl $B62112.l		; 22 12 21 B6
	sbc $F5E031.l		; EF 31 E0 F5
	ora $BD11EE.l		; 0F EE 11 BD
	ldx $D2.b,Y		; B6 D2
	asl $4401.w,X		; 1E 01 44
	ora ($01.b,X)		; 01 01
	rol $A2F0.w		; 2E F0 A2
	eor $1D.b		; 45 1D
	jsl $742655.l		; 22 55 26 74
	ora $C299.w,Y		; 19 99 C2
	cmp $EEBC.w,X		; DD BC EE
	beq  19.b		; F0 13
	and $22.b,S		; 23 22
	and ($B2.b,X)		; 21 B2
	and ($11.b,X)		; 21 11
	beq  34.b		; F0 22
	and ($22.b,S),Y		; 33 22
	jsr $A6CA.w		; 20 CA A6
	inc $F5EE.w,X		; FE EE F5
	stz $41.b		; 64 41
	adc $EF.b,S		; 63 EF
.ACCU 8
	sep #$A6		; E2 A6
	dec $04FD.w,X		; DE FD 04
	cpy $05.b		; C4 05
	rol $EFAF.w		; 2E AF EF
	ldx $BE.b,Y		; B6 BE
	sbc ($2E.b),Y		; F1 2E
	and $33.b,S		; 23 33
	ora ($10.b,X)		; 01 10
	ora $CFD0A6.l		; 0F A6 D0 CF
	asl $1331.w		; 0E 31 13
	ora ($0A.b),Y		; 11 0A
	cmp $BDA6.w,X		; DD A6 BD
	bcs -13.b		; B0 F3
	.db $62, $57, $16		; 62 57 16
	cpx #$A61B.w		; E0 1B A6
	jmp $E1BF.w		; 4C BF E1
	brk $4F.b		; 00 4F
	adc $A6DDDF.l,X		; 7F DF DD A6
	tax		; AA
	sbc $6407F2.l,X		; FF F2 07 64
	eor ($33.b),Y		; 51 33
	sbc $1CCDA6.l		; EF A6 CD 1C
	cmp $3012F4.l,X		; DF F4 12 30
	and $EDC2BC.l		; 2F BC C2 ED
	cpy $CFDC.w		; CC DC CF
	cop $23.b		; 02 23
	mvp $A6,$43		; 44 43 A6
	lda $03CD0C.l,X		; BF 0C CD 03
	and ($23.b,X)		; 21 23
	jsr $A6AC.w		; 20 AC A6
	cmp $E1CD.w		; CD CD E1
	and ($30.b,S),Y		; 33 30
	ror $54.b		; 66 54
	ora $ED0FA6.l		; 0F A6 0F ED
	lda $E1E3.w		; AD E3 E1
	ora ($63.b,S),Y		; 13 63
	stp		; DB
	ldx $E0.b,Y		; B6 E0
	cpx $40FD.w		; EC FD 40
	cop $33.b		; 02 33
	rti		; 40

	jsr $0FA6.w		; 20 A6 0F
	cpy $EEDD.w		; CC DD EE
	sbc ($25.b),Y		; F1 25
	and ($1D.b),Y		; 31 1D
	ldx $FE.b,Y		; B6 FE
	cmp $1101DF.l,X		; DF DF 01 11
	and $32.b		; 25 32
	ora ($C2.b,X)		; 01 C2
	mvp $F0,$31		; 44 31 F0
	sbc $11F1EE.l,X		; FF EE F1 11
	ora ($A6.b),Y		; 11 A6
	ora #$9C.b		; 09 9C
	sbc $6526FD.l		; EF FD 26 65
	eor $54.b		; 45 54
	ldx $FC.b		; A6 FC
	dec $BDEB.w,X		; DE EB BD
	ora ($3F.b,X)		; 01 3F
	mvp $B6,$31		; 44 31 B6
	dec $EEFE.w,X		; DE FE EE
	beq  32.b		; F0 20
	and ($61.b),Y		; 31 61
	and ($B6.b),Y		; 31 B6
	ora ($FB.b,X)		; 01 FB
	ora $F00D.w		; 0D 0D F0
	cop $30.b		; 02 30
	ora ($A6.b),Y		; 11 A6
	tsb $EC9C.w		; 0C 9C EC
	sbc $672614.l		; EF 14 26 67
	eor ($A6.b)		; 52 A6
	bmi -80.b		; 30 B0
	stz $1CDB.w		; 9C DB 1C
	pea $3E27.w		; F4 27 3E
	ldx $1E.b,Y		; B6 1E
	inc $EFC1.w		; EE C1 EF
	and $4351.w		; 2D 51 43
	and $A6.b,S		; 23 A6
	and $9DDE09.l,X		; 3F 09 DE 9D
	lda $442330.l,X		; BF 30 23 44
.ACCU 16
	rep #$21		; C2 21
	inc $CCED.w,X		; FE ED CC
	cmp $12EF.w		; CD EF 12
	eor $A6.b		; 45 A6
	and $9CF9EE.l,X		; 3F EE F9 9C
	sbc $471C.w,X		; FD 1C 47
	.db $42, $A6		; 42 A6
	inc $CAED.w,X		; FE ED CA
	cmp $671311.l,X		; DF 11 13 67
	adc $A6.b,X		; 75 A6
	and $0D.b,S		; 23 0D
	dex		; CA
	wai		; CB
	dec $53EE.w,X		; DE EE 53
	eor ($B6.b)		; 52 B6
	ora ($EE.b,X)		; 01 EE
	sbc $2F0D.w		; ED 0D 2F
	ora ($23.b)		; 12 23
	adc $1F41B6.l		; 6F B6 41 1F
	cmp $FDFD.w,X		; DD FD FD
	sbc $A60123.l,X		; FF 23 01 A6
	rti		; 40

	inc A		; 1A
	stz $EFEE.w,X		; 9E EE EF
	and ($56.b,S),Y		; 33 56
	lsr $A6.b,X		; 56 A6
	stz $0D.b		; 64 0D
	cmp $BDAB.w,X		; DD AB BD
	sbc $2614.w,X		; FD 14 26
.INDEX 16
	rep #$11		; C2 11
	bpl  -2.b		; 10 FE
	jmp.w [$DECD]		; DC CD DE
	beq  36.b		; F0 24
	ldx $43.b		; A6 43
	ora ($DB.b),Y		; 11 DB
	ldy $DFAD.w		; AC AD DF
	cop $44.b		; 02 44
	ldx $21.b		; A6 21
	ora $ECCD.w		; 0D CD EC
	cpx #$520F.w		; E0 0F 52
	lsr $B6.b,X		; 56 B6
	and ($30.b,S),Y		; 33 30
	asl $BD0E.w		; 0E 0E BD
	asl $23FE.w		; 0E FE 23
	lda ($F1.b)		; B2 F1
	ora ($00.b),Y		; 11 00
	nop		; EA
	tax		; AA
	tyx		; BB
	lda $A614.w,X		; BD 14 A6
	adc ($66.b,X)		; 61 66
	bit $DCAC.w		; 2C AC DC
	tax		; AA
	cmp ($32.b),Y		; D1 32
	ldx $12.b		; A6 12
	eor ($ED.b),Y		; 51 ED
	sta ($DD.b)		; 92 DD
	sbc $B60745.l		; EF 45 07 B6
	bit $40.b		; 24 40
	ora $EEEB1D.l		; 0F 1D EB EE
	asl $A6F1.w,X		; 1E F1 A6
	stz $00.b		; 64 00
	cpx #$AE0C.w		; E0 0C AE
	ora ($0F.b),Y		; 11 0F
	eor [$A6.b],Y		; 57 A6
	adc $33.b,X		; 75 33
	.db $42, $D9		; 42 D9
	lda $BECA.w,X		; BD CA BE
	jsl $334EA6.l		; 22 A6 4E 33
	asl $0DBE.w,X		; 1E BE 0D
	inc DMASRC1B.w		; EE 14 43
.ACCU 16
	rep #$23		; C2 23
	eor $64.b,X		; 55 64
	mvp $FE,$20		; 44 20 FE
	sbc $A6DD.w		; ED DD A6
	and $10.b,X		; 35 10
	beq  14.b		; F0 0E
	cpy $F0F3.w		; CC F3 F0
	and $B6.b,X		; 35 B6
	eor $03.b,S		; 43 03
	ora ($0D.b)		; 12 0D
	sbc $DFFD.w		; ED FD DF
	sbc ($A6.b),Y		; F1 A6
	rti		; 40

	ora ($24.b,X)		; 01 24
	ldy $0C1E.w		; AC 1E 0C
	ora ($47.b,X)		; 01 47
.ACCU 16
	rep #$22		; C2 22
	eor $65.b		; 45 65
	mvp $0E,$32		; 44 32 0E
	cmp $A6DD.w,X		; DD DD A6
	sep #$42		; E2 42
	asl $0FE0.w,X		; 1E E0 0F
	ldy #$41D5.w		; A0 D5 41
	ldx $33.b,Y		; B6 33
	bit $01.b		; 24 01
	sbc ($FE.b,X)		; E1 FE
	stp		; DB
	sbc ($EF.b),Y		; F1 EF
	ldx $E3.b		; A6 E3
	eor ($FE.b,X)		; 41 FE
	ora $FD.b,S		; 03 FD
	lda $C21222.l,X		; BF 22 12 C2
	ora ($45.b,S),Y		; 13 45
	mvn $32,$54		; 54 54 32
	ora $A6DDEE.l		; 0F EE DD A6
	sbc $4D.b,S		; E3 4D
	bpl  63.b		; 10 3F
	jsr ($2FFF.w,X)		; FC FF 2F
	bpl -74.b		; 10 B6
	mvn $21,$20		; 54 20 21
	rol $FFEE.w		; 2E EE FF
	cmp $A6FF.w,X		; DD FF A6
	ora ($0F.b),Y		; 11 0F
	sbc ($3E.b,S),Y		; F3 3E
	sbc $040FE0.l		; EF E0 0F 04
	ldx $43.b,Y		; B6 43
	ora ($02.b,S),Y		; 13 02
	ora $BD00FD.l,X		; 1F FD 00 BD
	sbc ($B2.b,X)		; E1 B2
	dex		; CA
	tsx		; BA
	cmp $0CCDEC.l		; CF EC CD 0C
	plb		; AB
	sbc ($C2.b,X)		; E1 C2
	ora ($34.b)		; 12 34
	eor $43.b,X		; 55 43
	and ($21.b,S),Y		; 33 21
	inc $96EE.w,X		; FE EE 96
	plx		; FA
	pea $D131.w		; F4 31 D1
	cop $09.b		; 02 09
	stx $F4.b,Y		; 96 F4
	ldx $54.b		; A6 54
	and [$63.b]		; 27 63
	ora $2B0F.w,X		; 1D 0F 2B
	tyx		; BB
	cmp $0FFAA6.l		; CF A6 FA 0F
	jsl $2D03EF.l		; 22 EF 03 2D
	dec $C225.w,X		; DE 25 C2
	ora ($23.b,X)		; 01 23
	eor $44.b,X		; 55 44
	mvp $10,$32		; 44 32 10
	ora $01A1B6.l		; 0F B6 A1 01
	asl $2001.w		; 0E 01 20
	inc $1E11.w,X		; FE 11 1E
.ACCU 16
.INDEX 16
	rep #$F1		; C2 F1
	bit $54.b,X		; 34 54
	mvp $32,$53		; 44 53 32
	bpl  -2.b		; 10 FE
	stx $BF.b,Y		; 96 BF
	phk		; 4B
	ldx $FC45.w		; AE 45 FC
	cop $4E.b		; 02 4E
	sty $A6.b,X		; 94 A6
	eor $54.b,X		; 55 54
	and $31.b		; 25 31
	dec $AB20.w		; CE 20 AB
	bcs -90.b		; B0 A6
	bcc  -3.b		; 90 FD
	eor $F4C2.w		; 4D C2 F4
	sbc $1012.w,X		; FD 12 10
	ldx $15.b		; A6 15
	ror $30.b,X		; 76 30
	and ($0E.b)		; 32 0E
	bne  27.b		; D0 1B
	txs		; 9A
	ldx $E2.b		; A6 E2
	sbc $3ED0.w		; ED D0 3E
	dec $1B15.w,X		; DE 15 1B
	bpl -74.b		; 10 B6
	eor ($02.b)		; 52 02
	bit $2D.b		; 24 2D
	asl $C030.w		; 0E 30 C0
	cmp $20FBB6.l,X		; DF B6 FB 20
	beq -33.b		; F0 DF
	and $00121E.l		; 2F 1E 12 00
	ldx $12.b,Y		; B6 12
	.db $42, $12		; 42 12
	ora ($F0.b),Y		; 11 F0
	ora $A6D00E.l		; 0F 0E D0 A6
	lda $3EED.w,X		; BD ED 3E
	ldy #$4ED1.w		; A0 D1 4E
	tsb $B655.w		; 0C 55 B6
	cop $13.b		; 02 13
	eor ($1F.b),Y		; 51 1F
	sbc ($FF.b)		; F2 FF
	cpx #$A6FE.w		; E0 FE A6
	lda $CDE3.w,X		; BD E3 CD
	dec $CF20.w		; CE 20 CF
	bit $0E.b,X		; 34 0E
	ldx $27.b		; A6 27
	adc $05.b,X		; 75 05
	.db $42, $1B		; 42 1B
	sbc ($E0.b),Y		; F1 E0
	ldy $FAA6.w,X		; BC A6 FA
	and $9ED2.w		; 2D D2 9E
	xce		; FB
	ror $13F2.w		; 6E F2 13
	ldx $15.b		; A6 15
	lsr $64.b		; 46 64
	ora ($E1.b)		; 12 E1
	ora $FF0C.w		; 0D 0C FF
	ldx $BC.b		; A6 BC
	sbc $D1CC1D.l		; EF 1D CC D1
	inc CGDATA.w		; EE 22 21
	ldx $16.b		; A6 16
	eor [$52.b]		; 47 52
	rts		; 60

	ora $09CEB5.l		; 0F B5 CE 09
	ldx $2D.b		; A6 2D
	bcs -63.b		; B0 C1
	stp		; DB
	jmp.w [$F201]		; DC 01 F2
	and ($A6.b,X)		; 21 A6
	bit $75.b,X		; 34 75
	and $52.b,X		; 35 52
	sbc $FF00.w,X		; FD 00 FF
	cmp $FEA7.w		; CD A7 FE
	dec $EAEF.w,X		; DE EF EA
	cmp $1FE1.w		; CD E1 1F
	rti		; 40

	.db $42, $45		; 42 45
	brk $54.b		; 00 54
	ora $7C007C.l,X		; 1F 7C 00 7C
	inx		; E8
	adc $7B30.w,Y		; 79 30 7B
	clv		; B8
	adc [$F7.b],Y		; 77 F7
	lsr $35AD.w,X		; 5E AD 35
	cli		; 58
	adc [$B8.b],Y		; 77 B8
	adc ($98.b,S),Y		; 73 98
	adc ($78.b,S),Y		; 73 78
	adc ($58.b,S),Y		; 73 58
	adc ($38.b,S),Y		; 73 38
	adc ($FF.b,S),Y		; 73 FF
	adc $1F7C1F.l,X		; 7F 1F 7C 1F
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
	ora $FFFF7C.l,X		; 1F 7C FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 08FFFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 08FFFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 08FFFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 08FFFF. Skipping.
.ENDS
