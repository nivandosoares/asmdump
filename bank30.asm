.BANK 30 SLOT 0
.ORG $0000

.SECTION "Bank30" FORCE

	sty $00.b		; 84 00
	brk $89.b		; 00 89
	mvn $00,$05		; 54 05 00
	bit #$24.b		; 89 24
	asl A		; 0A
	brk $89.b		; 00 89
	pea $000E.w		; F4 0E 00
	bit #$C4.b		; 89 C4
	ora ($00.b,S),Y		; 13 00
	.db $82, $DC, $14		; 82 DC 14
	brk $83.b		; 00 83
	jmp ($0016.w,X)		; 7C 16 00
	sty $A4.b		; 84 A4
	clc		; 18
	brk $84.b		; 00 84
	cpy $001A.w		; CC 1A 00
	php		; 08
	trb $1C.b		; 14 1C
	brk $08.b		; 00 08
	jmp $08001D.l		; 5C 1D 00 08
	ldy $1E.b		; A4 1E
	brk $89.b		; 00 89
	stz $23.b,X		; 74 23
	brk $8A.b		; 00 8A
	cpy $0028.w		; CC 28 00
	dey		; 88
	trb $2D.b		; 14 2D
	brk $8A.b		; 00 8A
	jmp ($0032.w)		; 6C 32 00
	sty $37D4.w		; 8C D4 37
	brk $8C.b		; 00 8C
	bit $003C.w,X		; 3C 3C 00
	sty $4124.w		; 8C 24 41
	brk $05.b		; 00 05
	pea $0041.w		; F4 41 00
	ora [$F4.b]		; 07 F4
	.db $42, $00		; 42 00
	asl $CC.b		; 06 CC
	eor $00.b,S		; 43 00
	tsb $74.b		; 04 74
	mvp $06,$00		; 44 00 06
	jmp ($0045.w)		; 6C 45 00
	ora $EC.b,S		; 03 EC
	eor $00.b		; 45 00
	ora $BC.b		; 05 BC
	lsr $00.b		; 46 00
	ora [$DC.b]		; 07 DC
	eor [$00.b]		; 47 00
	bit #$AC.b		; 89 AC
	jmp $8300.w		; 4C 00 83
	jmp $004E.w		; 4C 4E 00
	sta $EC.b,S		; 83 EC
	eor $F49000.l		; 4F 00 90 F4
	eor ($00.b)		; 52 00
	sta $24.b,X		; 95 24
	lsr $0200.w,X		; 5E 00 02
	jmp ($005E.w,X)		; 7C 5E 00
	ora ($09.b,X)		; 01 09
	bra  36.b		; 80 24
	brk $EE.b		; 00 EE
	ora ($D6.b,S),Y		; 13 D6
	sbc $D6FFEE.l,X		; FF EE FF D6
	sbc $000200.l,X		; FF 00 02 00
	brk $FE.b		; 00 FE
	sbc $02FFD6.l,X		; FF D6 FF 02
	cop $00.b		; 02 00
	brk $0E.b		; 00 0E
	brk $D6.b		; 00 D6
	sbc $000204.l,X		; FF 04 02 00
	brk $EE.b		; 00 EE
	sbc $06FFE6.l,X		; FF E6 FF 06
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $08FFE6.l,X		; FF E6 FF 08
	cop $00.b		; 02 00
	brk $0E.b		; 00 0E
	brk $E6.b		; 00 E6
	sbc $00020A.l,X		; FF 0A 02 00
	brk $EE.b		; 00 EE
	sbc $0CFFF6.l,X		; FF F6 FF 0C
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $0EFFF6.l,X		; FF F6 FF 0E
	cop $00.b		; 02 00
	brk $0E.b		; 00 0E
	brk $F6.b		; 00 F6
	sbc $000220.l,X		; FF 20 02 00
	brk $00.b		; 00 00
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
	ora ($01.b,X)		; 01 01
	ora $01.b,S		; 03 01
	ora $01.b,S		; 03 01
	ora $01.b,S		; 03 01
	ora [$09.b]		; 07 09
	ora ($00.b,S),Y		; 13 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FC03.w,X		; FE 03 FC
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	tas		; 1B
	cpx $00.b		; E4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $807F80.l,X		; FF 80 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $005FA0.l,X		; 7F A0 5F 00
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
	brk $18.b		; 00 18
	clc		; 18
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $C000.w		; 1C 00 C0
	brk $E0.b		; 00 E0
	clc		; 18
	sed		; F8
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	ora $0513.w		; 0D 13 05
	phd		; 0B
	ora ($07.b,X)		; 01 07
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($07.b,X)		; 01 07
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora $F00FE0.l,X		; 1F E0 0F F0
	ora [$F8.b]		; 07 F8
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	bcs  24.b		; B0 18
	bcs  16.b		; B0 10
	beq  16.b		; F0 10
	cpx #$30.b		; E0 30
	cpx #$60.b		; E0 60
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	clv		; B8
	eor [$B0.b]		; 47 B0
	eor $F00FF0.l		; 4F F0 0F F0
	ora $801FE0.l		; 0F E0 1F 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $000000.l,X		; 7F 00 00 00
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
	sbc $1CFF00.l,X		; FF 00 FF 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $FFFD3F.l,X		; 3F 3F FD FF
	sbc $FDFF.w,X		; FD FF FD
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FFFF.l,X		; FF FF FF 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $817FE3.l,X		; FF E3 7F 81
	adc $FF7FDF.l,X		; 7F DF 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $800080.l,X		; FF 80 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $09FF00.l,X		; FF 00 FF 09
	ora ($09.b,S),Y		; 13 09
	ora ($09.b,S),Y		; 13 09
	and ($09.b,S),Y		; 33 09
	ora ($09.b,S),Y		; 13 09
	ora ($09.b,S),Y		; 13 09
	ora ($09.b,S),Y		; 13 09
	ora ($09.b,S),Y		; 13 09
	and ($1B.b,S),Y		; 33 1B
	cpx $1B.b		; E4 1B
	cpx $3B.b		; E4 3B
	cpy $1B.b		; C4 1B
	cpx $1B.b		; E4 1B
	cpx $1B.b		; E4 1B
	cpx $1B.b		; E4 1B
	cpx $3B.b		; E4 3B
	cpy $A0.b		; C4 A0
	bpl -32.b		; 10 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	bpl -104.b		; 10 98
	php		; 08
	tya		; 98
	php		; 08
	clv		; B8
	tsb $18B8.w		; 0C B8 18
	bcs  79.b		; B0 4F
	cpx #$1F.b		; E0 1F
	cpy #$3F.b		; C0 3F
	bcc 111.b		; 90 6F
	tya		; 98
	adc [$98.b]		; 67 98
	adc [$BC.b]		; 67 BC
	eor $B8.b,S		; 43 B8
	eor [$00.b]		; 47 00
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
	sbc $1CFF00.l,X		; FF 00 FF 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($0E.b,X)		; 01 0E
	tsb $3F.b		; 04 3F
	asl $FF.b,X		; 16 FF
	rti		; 40

	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00F000.l,X		; FF 00 F0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $81.b,S		; 03 81
	ora $E1.b,S		; 03 E1
	ora $59.b,S		; 03 59
	lda $FD17ED.l		; AF ED 17 FD
	sbc $FDFFFD.l,X		; FF FD FF FD
	sbc $03FC03.l,X		; FF 03 FC 03
	jmp ($1C03.w,X)		; 7C 03 1C
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	bra   0.b		; 80 00
	sta ($41.b,X)		; 81 41
	inc $FF7F.w,X		; FE 7F FF
	adc $FF7FF9.l,X		; 7F F9 7F FF
	adc $A87FFF.l,X		; 7F FF 7F A8
	adc $C07F80.l,X		; 7F 80 7F C0
	rol $0080.w,X		; 3E 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	mvn $EA,$78		; 54 78 EA
	pea $F887.w		; F4 87 F8
	ply		; 7A
	sbc $FFFFC8.l,X		; FF C8 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $008300.l,X		; FF 00 83 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $FC9C.w		; 1C 9C FC
	trb $DC3C.w		; 1C 3C DC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($7C1C.w,X)		; FC 1C 7C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($1C1C.w,X)		; FC 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $3C3C.w		; 1C 3C 3C
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($F8F8.w,X)		; FC F8 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F8FC.w,X)		; FC FC F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$80.b		; 09 80
	bit $00.b		; 24 00
	inc $D613.w		; EE 13 D6
	sbc $D6FFEE.l,X		; FF EE FF D6
	sbc $000400.l,X		; FF 00 04 00
	brk $FE.b		; 00 FE
	sbc $02FFD6.l,X		; FF D6 FF 02
	tsb $00.b		; 04 00
	brk $0E.b		; 00 0E
	brk $D6.b		; 00 D6
	sbc $000404.l,X		; FF 04 04 00
	brk $EE.b		; 00 EE
	sbc $06FFE6.l,X		; FF E6 FF 06
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $08FFE6.l,X		; FF E6 FF 08
	tsb $00.b		; 04 00
	brk $0E.b		; 00 0E
	brk $E6.b		; 00 E6
	sbc $00040A.l,X		; FF 0A 04 00
	brk $EE.b		; 00 EE
	sbc $0CFFF6.l,X		; FF F6 FF 0C
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $0EFFF6.l,X		; FF F6 FF 0E
	tsb $00.b		; 04 00
	brk $0E.b		; 00 0E
	brk $F6.b		; 00 F6
	sbc $000420.l,X		; FF 20 04 00
	brk $7F.b		; 00 7F
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	cpy #$E0.b		; C0 E0
	cpx #$F8.b		; E0 F8
	sed		; F8
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($C000.w,X)		; FC 00 C0
	brk $E0.b		; 00 E0
	clc		; 18
	sed		; F8
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	sbc $F3F0F0.l,X		; FF F0 F0 F3
	sbc $F1F2.w,X		; FD F2 F1
	sbc ($FD.b,S),Y		; F3 FD
	sbc ($D1.b)		; F2 D1
	sbc ($8D.b,S),Y		; F3 8D
	sbc ($41.b)		; F2 41
	adc ($0F.b,S),Y		; 73 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	bne  15.b		; D0 0F
	brk $8F.b		; 00 8F
	bra -67.b		; 80 BD
	cop $03.b		; 02 03
	sed		; F8
	eor ($AA.b),Y		; 51 AA
	eor ($FA.b,S),Y		; 53 FA
	eor ($A8.b,S),Y		; 53 A8
	eor ($FA.b),Y		; 51 FA
	eor ($AA.b),Y		; 51 AA
	eor ($F8.b,S),Y		; 53 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$A1.b		; C0 A1
	inc $03.b		; E6 03
	eor [$A0.b]		; 47 A0
	stz $A3.b		; 64 A3
	sep #$03		; E2 03
	cmp [$A0.b]		; C7 A0
	mvp $E6,$A3		; 44 A3 E6
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1C.b		; 00 1C
	stz $DC9C.w		; 9C 9C DC
	jmp.w [$1C1C]		; DC 1C 1C
	jmp.w [$DC9C]		; DC 9C DC
	jmp.w [$1C1C]		; DC 1C 1C
	jmp.w [$DC9C]		; DC 9C DC
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C8FF00.l,X		; FF 00 FF C8
	sbc $6FFFFF.l,X		; FF FF FF 6F
	sbc $1FFF1C.l,X		; FF 1C FF 1F
	adc $3F3F4C.l,X		; 7F 4C 3F 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $00FF3F.l,X		; 3F 3F FF 00
	sbc $F0FF00.l,X		; FF 00 FF F0
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $01FF4C.l,X		; FF 4C FF 01
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $40FF00.l,X		; FF 00 FF 40
	sbc $FCFFF9.l,X		; FF F9 FF FC
	sbc $0DFF1F.l,X		; FF 1F FF 0D
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F7FFC0.l,X		; FF C0 FF F7
	sbc $2FFFFF.l,X		; FF FF FF 2F
	sbc $0000FF.l,X		; FF FF 00 00
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
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F0F0F0.l,X		; FF F0 F0 F0
	sbc $F0F0F0.l,X		; FF F0 F0 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $F00FF0.l		; 0F F0 0F F0
	ora $F00FF0.l		; 0F F0 0F F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	lda $020300.l,X		; BF 00 03 02
	lda $020100.l,X		; BF 00 01 02
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F8FEFF.l,X		; FF FF FE F8
	inc $FEF8.w,X		; FE F8 FE
	sed		; F8
	clv		; B8
	sec		; 38
	lsr $A0.b		; 46 A0
	inc $00.b		; E6 00
	lsr $A0.b		; 46 A0
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	cmp [$38.b]		; C7 38
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FCFC00.l,X		; FF 00 FC FC
	jmp.w [$DC1C]		; DC 1C DC
	trb $1CDC.w		; 1C DC 1C
	trb $DC1C.w		; 1C 1C DC
	trb $1CDC.w		; 1C DC 1C
	jmp.w [$1C1C]		; DC 1C 1C
	jsr ($1CFC.w,X)		; FC FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FEFF.w,X		; FE FF FE
	sbc $D4CFC7.l,X		; FF C7 CF D4
	jmp.w [$3F23]		; DC 23 3F
	cmp [$DF.b]		; C7 DF
	lda ($BF.b,S),Y		; B3 BF
	sbc $FC00FF.l		; EF FF 00 FC
	brk $CC.b		; 00 CC
	bmi -74.b		; 30 B6
	and $A7.b,S		; 23 A7
	cpy #$C0.b		; C0 C0
	jsr $4022.w		; 20 22 40
	.db $42, $00		; 42 00
	phk		; 4B
	cpy $B0F3.w		; CC F3 B0
	sbc ($1C.b,S),Y		; F3 1C
	adc ($20.b,S),Y		; 73 20
	adc ($4C.b,S),Y		; 73 4C
	adc ($00.b,S),Y		; 73 00
	sbc ($C4.b,S),Y		; F3 C4
	sbc ($D0.b,S),Y		; F3 D0
	sbc ($0F.b,S),Y		; F3 0F
	brk $0F.b		; 00 0F
	brk $8F.b		; 00 8F
	bra -113.b		; 80 8F
	bra -113.b		; 80 8F
	bra  15.b		; 80 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	bcc   1.b		; 90 01
	plx		; FA
	ora ($FA.b,X)		; 01 FA
	ora $F8.b,S		; 03 F8
	sbc $5500FF.l,X		; FF FF 00 55
	brk $FF.b		; 00 FF
	brk $55.b		; 00 55
	brk $F7.b		; 00 F7
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $A0.b,S		; 43 A0
	mvp $C6,$AB		; 44 AB C6
	inc A		; 1A
	bra -114.b		; 80 8E
	rti		; 40

	ora $648C00.l,X		; 1F 00 8C 64
	cop $64.b		; 02 64
	phb		; 8B
	sbc $10F700.l,X		; FF 00 F7 10
	sbc [$21.b]		; E7 21
	sbc ($71.b),Y		; F1 71
	cpx #$20.b		; E0 20
	sbc ($73.b,S),Y		; F3 73
	sbc $00F719.l,X		; FF 19 F7 00
	jmp.w [$1C1C]		; DC 1C 1C
	jmp $1C7C1C.l		; 5C 1C 7C 1C
	stz $7C1C.w		; 9C 1C 7C
	trb $1CDC.w		; 1C DC 1C
	jmp ($DC1C.w,X)		; 7C 1C DC
	jsr ($BC1C.w,X)		; FC 1C BC
	stz $9C9C.w		; 9C 9C 9C
	jmp ($9C5C.w,X)		; 7C 5C 9C
	stz $1C3C.w		; 9C 3C 1C
	stz $7C9C.w		; 9C 9C 7C
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	jmp.w [$7CFC]		; DC FC 7C
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($1C1C.w,X)		; FC 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $3C3C.w		; 1C 3C 3C
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($F8F8.w,X)		; FC F8 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F8FC.w,X)		; FC FC F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$80.b		; 09 80
	bit $00.b		; 24 00
	inc $D613.w		; EE 13 D6
	sbc $D6FFEE.l,X		; FF EE FF D6
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $02FFD6.l,X		; FF D6 FF 02
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $D6.b		; 00 D6
	sbc $000004.l,X		; FF 04 00 00
	brk $EE.b		; 00 EE
	sbc $06FFE6.l,X		; FF E6 FF 06
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $08FFE6.l,X		; FF E6 FF 08
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $E6.b		; 00 E6
	sbc $00000A.l,X		; FF 0A 00 00
	brk $EE.b		; 00 EE
	sbc $0CFFF6.l,X		; FF F6 FF 0C
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $0EFFF6.l,X		; FF F6 FF 0E
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $F6.b		; 00 F6
	sbc $000020.l,X		; FF 20 00 00
	brk $00.b		; 00 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	cpy #$00.b		; C0 00
	cpx #$18.b		; E0 18
	sed		; F8
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($C0C0.w,X)		; FC C0 C0
	cpx #$E0.b		; E0 E0
	sed		; F8
	sed		; F8
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	cpx $F014.w		; EC 14 F0
	tsb $05E0.w		; 0C E0 05
	sbc ($DF.b,X)		; E1 DF
	jsr ($F956.w,X)		; FC 56 F9
	and [$F8.b]		; 27 F8
	tyx		; BB
	jsr ($F7EB.w,X)		; FC EB F7
	sbc $F3FFEB.l,X		; FF EB FF F3
	sbc $0000FA.l,X		; FF FA 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sei		; 78
	sbc [$D8.b]		; E7 D8
	adc [$FC.b],Y		; 77 FC
	sbc $36.b,S		; E3 36
	cmp $3EE5.w,X		; DD E5 3E
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $07877F.l,X		; FF 7F 87 07
	ora [$07.b]		; 07 07
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	sed		; F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	and $00003F.l,X		; 3F 3F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $00003F.l,X		; 3F 3F 00 00
	brk $00.b		; 00 00
	and $47BE3F.l,X		; 3F 3F BE 47
	sbc $00FF00.l,X		; FF 00 FF 00
	sta $04FB60.l,X		; 9F 60 FB 04
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $FCFC7F.l,X		; 7F 7F FC FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $24DBFF.l,X		; FF FF DB 24
	sbc $0CF300.l,X		; FF 00 F3 0C
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $0F.b		; 00 0F
	ora $00FFFF.l		; 0F FF FF 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $80FFFF.l,X		; 3F FF FF 80
	adc $FF10EF.l,X		; 7F EF 10 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	ora $CF.b,S		; 03 CF
	bmi  -1.b		; 30 FF
	brk $FF.b		; 00 FF
	sbc $307F7F.l,X		; FF 7F 7F 30
	bmi -64.b		; 30 C0
	cpy #$00.b		; C0 00
	brk $03.b		; 00 03
	ora $3F.b,S		; 03 3F
	and $FFF8F8.l,X		; 3F F8 F8 FF
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FE01.w,X		; FE 01 FE
	ora $FC.b,S		; 03 FC
	brk $FF.b		; 00 FF
	ora ($FC.b,X)		; 01 FC
	brk $F8.b		; 00 F8
	ora #$F2.b		; 09 F2
	sbc $FFFEFF.l,X		; FF FF FE FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FFFCFF.l,X		; FF FF FC FF
	inc $FFFF.w,X		; FE FF FF
	sbc [$FC.b]		; E7 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF3F.l,X		; FF 3F FF 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	jsr ($FF10.w,X)		; FC 10 FF
	adc $FEB5F8.l,X		; 7F F8 B5 FE
	tsx		; BA
	sbc $FC53.w,X		; FD 53 FC
	adc $61FE.w,X		; 7D FE 61
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp [$28.b],Y		; D7 28
	stp		; DB
	rol $2DDA.w,X		; 3E DA 2D
	jmp ($4B9F.w)		; 6C 9F 4B
	ldy $07FA.w,X		; BC FA 07
	and [$CF.b],Y		; 37 CF
	xba		; EB
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	adc $C07F80.l,X		; 7F 80 7F C0
	and $BA58A7.l,X		; 3F A7 58 BA
	eor [$E9.b]		; 47 E9
	ora $A71EF9.l,X		; 1F F9 1E A7
	lsr $7F7F.w,X		; 5E 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FC1C.w,X)		; FC 1C FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $001F1F.l,X		; 3F 1F 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $001F1F.l,X		; 3F 1F 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	jsr ($1CFC.w,X)		; FC FC 1C
	jsr ($DC1C.w,X)		; FC 1C DC
	bit $1CFC.w,X		; 3C FC 1C
	ldy $FC5C.w,X		; BC 5C FC
	bit $FCFC.w,X		; 3C FC FC
	jsr ($1CFC.w,X)		; FC FC 1C
	trb $1C1C.w		; 1C 1C 1C
	bit $FC3C.w,X		; 3C 3C FC
	jsr ($DCDC.w,X)		; FC DC DC
	bit $FC3C.w,X		; 3C 3C FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F8FC.w,X)		; FC FC F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F8FC.w,X)		; FC FC F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$80.b		; 09 80
	bit $00.b		; 24 00
	inc $D613.w		; EE 13 D6
	sbc $D6FFEE.l,X		; FF EE FF D6
	sbc $000600.l,X		; FF 00 06 00
	brk $FE.b		; 00 FE
	sbc $02FFD6.l,X		; FF D6 FF 02
	asl $00.b		; 06 00
	brk $0E.b		; 00 0E
	brk $D6.b		; 00 D6
	sbc $000604.l,X		; FF 04 06 00
	brk $EE.b		; 00 EE
	sbc $06FFE6.l,X		; FF E6 FF 06
	asl $00.b		; 06 00
	brk $FE.b		; 00 FE
	sbc $08FFE6.l,X		; FF E6 FF 08
	asl $00.b		; 06 00
	brk $0E.b		; 00 0E
	brk $E6.b		; 00 E6
	sbc $00060A.l,X		; FF 0A 06 00
	brk $EE.b		; 00 EE
	sbc $0CFFF6.l,X		; FF F6 FF 0C
	asl $00.b		; 06 00
	brk $FE.b		; 00 FE
	sbc $0EFFF6.l,X		; FF F6 FF 0E
	asl $00.b		; 06 00
	brk $0E.b		; 00 0E
	brk $F6.b		; 00 F6
	sbc $000620.l,X		; FF 20 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $E0.b		; 00 E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	lda $1F1FBF.l,X		; BF BF 1F 1F
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $C0C0.w		; 1C C0 C0
	cpx #$E0.b		; E0 E0
	sed		; F8
	sed		; F8
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	adc $6DFF7F.l,X		; 7F 7F FF 6D
	sbc $C5FF62.l,X		; FF 62 FF C5
	sbc $FFFF85.l,X		; FF 85 FF FF
	sbc $F7F7A7.l,X		; FF A7 F7 F7
	bra -128.b		; 80 80
	brk $92.b		; 00 92
	brk $9D.b		; 00 9D
	brk $3A.b		; 00 3A
	brk $7A.b		; 00 7A
	brk $00.b		; 00 00
	brk $58.b		; 00 58
	brk $40.b		; 00 40
	jsr ($FDFC.w,X)		; FC FC FD
	sbc $FFEFF4.l,X		; FF F4 EF FF
	lda $FCFBFE.l,X		; BF FE FB FC
	sbc $BFF9FE.l,X		; FF FE F9 BF
	lda $000303.l,X		; BF 03 03 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	rti		; 40

	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rti		; 40

	cpy #$80.b		; C0 80
	rep #$0B		; C2 0B
	cpy #$02.b		; C0 02
	lda $9680.w		; AD 80 96
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	and $003F00.l,X		; 3F 00 3F 00
	adc $007F00.l,X		; 7F 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FFF7F.l,X		; FF 7F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $FCFC.w		; 1C FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D6.b		; 00 D6
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F3FFFF.l,X		; FF FF FF F3
	sbc ($FF.b,S),Y		; F3 FF
	sbc $3F7F7F.l,X		; FF 7F 7F 3F
	and $FF0000.l,X		; 3F 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EC.b		; 00 EC
	ora $7F7C83.l,X		; 1F 83 7C 7F
	brk $3F.b		; 00 3F
	and $FFFFBF.l,X		; 3F BF FF FF
	sbc $CFFFFF.l,X		; FF FF FF CF
	cmp $FFFFFF.l		; CF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $B3.b		; 00 B3
	jmp ($F10E.w,X)		; 7C 0E F1
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F080FF.l,X		; FF FF 80 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc ($F3.b,S),Y		; F3 F3
	and $FFFF3F.l,X		; 3F 3F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $00FF00.l		; 0F 00 FF 00
	inc $EC01.w,X		; FE 01 EC
	ora $FFFCC3.l,X		; 1F C3 FC FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF7800.l,X		; FF 00 78 FF
	sbc $FF3F3F.l,X		; FF 3F 3F FF
	sbc $F3FEFE.l,X		; FF FE FE F3
	sbc ($BF.b,S),Y		; F3 BF
	lda $FFFFFF.l,X		; BF FF FF FF
	ora [$FF.b]		; 07 FF
	brk $CF.b		; 00 CF
	beq  63.b		; F0 3F
	cpy #$FD.b		; C0 FD
	ora $EC.b,S		; 03 EC
	ora $FFFC43.l,X		; 1F 43 FC FF
	sbc $000000.l,X		; FF 00 00 00
	ora #$00.b		; 09 00
	ora #$00.b		; 09 00
	ora $003D00.l,X		; 1F 00 3D 00
	and $005E00.l,X		; 3F 00 5E 00
	bit $FFFF.w,X		; 3C FF FF
	inc $F6.b,X		; F6 F6
	inc $F6.b,X		; F6 F6
	cpx #$E0.b		; E0 E0
	rep #$C2		; C2 C2
	cpy #$C0.b		; C0 C0
	lda ($A1.b,X)		; A1 A1
	cmp $C3.b,S		; C3 C3
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $70.b		; 00 70
	brk $F8.b		; 00 F8
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $07070F.l		; 0F 0F 07 07
	sta $07078F.l		; 8F 8F 07 07
	ora $BFBF1F.l,X		; 1F 1F BF BF
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
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $FCFC.w		; 1C FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $FFDFFF.l,X		; FF FF DF FF
	sbc $F8FFFB.l,X		; FF FB FF F8
	sbc [$F8.b],Y		; F7 F8
	sbc $C0FFB3.l,X		; FF B3 FF C0
	sbc $000000.l,X		; FF 00 00 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dec $F0FF.w		; CE FF F0
	inc $7FD3.w,X		; FE D3 7F
	rol $FF.b		; 26 FF
	stz $1FFB.w,X		; 9E FB 1F
	sbc ($1F.b,S),Y		; F3 1F
	plx		; FA
	lda $0000FF.l,X		; BF FF 00 00
	ora ($00.b,X)		; 01 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	tsb $89.b		; 04 89
	brk $4A.b		; 00 4A
	bpl  44.b		; 10 2C
	brk $B8.b		; 00 B8
	cpy #$F4.b		; C0 F4
	bit $F0.b		; 24 F0
	jmp.w [$B0E0]		; DC E0 B0
	inc $007F.w,X		; FE 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $003F00.l,X		; 7F 00 3F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	php		; 08
	bit $10.b		; 24 10
	ror A		; 6A
	jsr $50C2.w		; 20 C2 50
	ldy $3FFF.w		; AC FF 3F
	sbc $7FFF3F.l,X		; FF 3F FF 7F
	sbc $53EF67.l,X		; FF 67 EF 53
	xce		; FB
	ora $E3.b		; 05 E3
	ora $03FF.w,X		; 1D FF 03
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	trb $FCFC.w		; 1C FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $001F1F.l,X		; 3F 1F 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $001F1F.l,X		; 3F 1F 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	trb $FCFC.w		; 1C FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($3C1C.w,X)		; FC 1C 3C
	jmp.w [$1CFC]		; DC FC 1C
	jsr ($FC3C.w,X)		; FC 3C FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F8FC.w,X)		; FC FC F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F8FC.w,X)		; FC FC F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $80.b		; 02 80
	php		; 08
	brk $01.b		; 00 01
	ora $0103FB.l,X		; 1F FB 03 01
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $12.b		; 00 12
	brk $FB.b		; 00 FB
	sbc $000002.l,X		; FF 02 00 00
	brk $82.b		; 00 82
	.db $82, $C2, $C2		; 82 C2 C2
.ACCU 8
	sep #$E2		; E2 E2
	sbc ($F2.b)		; F2 F2
	tsx		; BA
	tsx		; BA
	stz $8E9E.w,X		; 9E 9E 8E
	stx $8686.w		; 8E 86 86
	.db $82, $00, $C2		; 82 00 C2
	brk $E2.b		; 00 E2
	brk $F2.b		; 00 F2
	brk $BA.b		; 00 BA
	brk $9E.b		; 00 9E
	brk $8E.b		; 00 8E
	brk $86.b		; 00 86
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	bit $6666.w,X		; 3C 66 66
	ror $66.b		; 66 66
	ror $66.b		; 66 66
	ror $66.b		; 66 66
	ror $66.b		; 66 66
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $6600.w,X		; 3C 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	sei		; 78
	cpy $CCCC.w		; CC CC CC
	cpy $FCFC.w		; CC FC FC
	cpy #$C0.b		; C0 C0
	cpy $C4.b		; C4 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $FC.b		; 00 FC
	brk $C0.b		; 00 C0
	brk $C4.b		; 00 C4
	brk $82.b		; 00 82
	.db $82, $00, $00		; 82 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $82, $00, $00		; 82 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CC.b		; 00 CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	bra  12.b		; 80 0C
	brk $01.b		; 00 01
	rol $03FB.w		; 2E FB 03
	ora ($00.b,X)		; 01 00
	xce		; FB
	sbc $000000.l,X		; FF 00 00 00
	brk $11.b		; 00 11
	brk $FB.b		; 00 FB
	sbc $000002.l,X		; FF 02 00 00
	brk $22.b		; 00 22
	brk $FB.b		; 00 FB
	sbc $000004.l,X		; FF 04 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $C4.b		; 00 C4
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C4.b		; 00 C4
	sei		; 78
	sei		; 78
	cpy $C4.b		; C4 C4
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy $C4.b		; C4 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DB.b		; 00 DB
	brk $E3.b		; 00 E3
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stp		; DB
	stp		; DB
	sbc $E3.b,S		; E3 E3
	cmp $C3.b,S		; C3 C3
	cmp $C3.b,S		; C3 C3
	cmp $C3.b,S		; C3 C3
	cmp $C3.b,S		; C3 C3
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $32.b		; 00 32
	brk $38.b		; 00 38
	brk $1C.b		; 00 1C
	brk $0E.b		; 00 0E
	brk $26.b		; 00 26
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $321C.w		; 1C 1C 32
	and ($38.b)		; 32 38
	sec		; 38
	trb $0E1C.w		; 1C 1C 0E
	asl $2626.w		; 0E 26 26
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	cmp $CCCCCF.l		; CF CF CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $00CC.w		; CC CC 00
	php		; 08
	brk $08.b		; 00 08
	brk $88.b		; 00 88
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	dey		; 88
	dey		; 88
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($C1.b,X)		; C1 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($F3.b,S),Y		; F3 F3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $001C.w		; 1C 1C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $00CC.w		; CC CC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $03.b		; 00 03
	.db $42, $FB		; 42 FB
	ora $01.b		; 05 01
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $11.b		; 00 11
	brk $FB.b		; 00 FB
	sbc $000002.l,X		; FF 02 00 00
	brk $25.b		; 00 25
	brk $FB.b		; 00 FB
	sbc $000004.l,X		; FF 04 00 00
	brk $35.b		; 00 35
	brk $FB.b		; 00 FB
	sbc $000006.l,X		; FF 06 00 00
	brk $78.b		; 00 78
	sei		; 78
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $78CC.w		; CC CC 78
	sei		; 78
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $00CC.w		; CC CC 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	cpy $CCCC.w		; CC CC CC
	cpy $FCFC.w		; CC FC FC
	cpy #$C0.b		; C0 C0
	cpy $C4.b		; C4 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	cpy $CCCC.w		; CC CC CC
	cpy $FCFC.w		; CC FC FC
	cpy #$C0.b		; C0 C0
	cpy $C4.b		; C4 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $F8F8.w		; CC F8 F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	sed		; F8
	sed		; F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	sed		; F8
	sed		; F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	sed		; F8
	sed		; F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sty $7C8C.w		; 8C 8C 7C
	jmp ($CCCC.w,X)		; 7C CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sty $7C8C.w		; 8C 8C 7C
	jmp ($CCCC.w,X)		; 7C CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0C0C.w		; CC 0C 0C
	tsb $7C0C.w		; 0C 0C 7C
	jmp ($CCCC.w,X)		; 7C CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $0CCC.w		; CC CC 0C
	tsb $0C0C.w		; 0C 0C 0C
	jmp ($CC7C.w,X)		; 7C 7C CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $00CC.w		; CC CC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CC.b		; 00 CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $00CC.w		; CC CC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CC.b		; 00 CC
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($007C.w,X)		; 7C 7C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($007C.w,X)		; 7C 7C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	ora ($37.b,X)		; 01 37
	xce		; FB
	ora $01.b,S		; 03 01
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $11.b		; 00 11
	brk $FB.b		; 00 FB
	sbc $000002.l,X		; FF 02 00 00
	brk $21.b		; 00 21
	brk $FB.b		; 00 FB
	sbc $000004.l,X		; FF 04 00 00
	brk $31.b		; 00 31
	brk $FB.b		; 00 FB
	sbc $000006.l,X		; FF 06 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	sed		; F8
	sed		; F8
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $00CC.w		; CC CC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $E300.w,Y		; D9 00 E3
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $E3D9.w,Y		; D9 D9 E3
	sbc $C3.b,S		; E3 C3
	cmp $C3.b,S		; C3 C3
	cmp $C3.b,S		; C3 C3
	cmp $C3.b,S		; C3 C3
	cmp $00.b,S		; C3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($00.b,X)		; E1 00
	and ($00.b)		; 32 00
	and ($00.b),Y		; 31 00
	sbc ($00.b,S),Y		; F3 00
	ora $00.b,S		; 03 00
	ora ($00.b,S),Y		; 13 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	sbc ($32.b,X)		; E1 32
	and ($31.b)		; 32 31
	and ($F3.b),Y		; 31 F3
	sbc ($03.b,S),Y		; F3 03
	ora $13.b,S		; 03 13
	ora ($00.b,S),Y		; 13 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00.b,S		; E3 00
	and ($00.b,S),Y		; 33 00
	sbc ($00.b,S),Y		; F3 00
	and ($00.b,S),Y		; 33 00
	and ($00.b,S),Y		; 33 00
	and ($00.b,S),Y		; 33 00
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	sbc $33.b,S		; E3 33
	and ($F3.b,S),Y		; 33 F3
	sbc ($33.b,S),Y		; F3 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($00.b,S),Y		; 33 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $3300.w,X		; FE 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $33FE.w,X		; FE FE 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($00.b,S),Y		; 33 00
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	and ($00.b,S),Y		; 33 00
	and ($00.b,S),Y		; 33 00
	and ($00.b,S),Y		; 33 00
	and ($00.b,S),Y		; 33 00
	and ($00.b,S),Y		; 33 00
	and ($30.b,S),Y		; 33 30
	bmi   0.b		; 30 00
	brk $33.b		; 00 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	and ($00.b,S),Y		; 33 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	sep #$00		; E2 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   2.b		; 30 02
	cop $02.b		; 02 02
	cop $E2.b		; 02 E2
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($C1.b,X)		; C1 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($E1.b,X)		; E1 E1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($F3.b,S),Y		; F3 F3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $33.b		; 00 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($33.b,S),Y		; 33 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $33.b		; 00 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($33.b,S),Y		; 33 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $08.b		; 00 08
	brk $F7.b		; 00 F7
	ora #$E7.b		; 09 E7
	xce		; FB
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b]		; E7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFE7FF.l,X		; FF FF E7 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc [$FF.b]		; E7 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $0403FF.l		; EF FF 03 04
	brk $00.b		; 00 00
	sbc $FFEFFF.l,X		; FF FF EF FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $0405FF.l		; EF FF 05 04
	brk $00.b		; 00 00
	sbc $F7FF.w,Y		; F9 FF F7
	sbc $000406.l,X		; FF 06 04 00
	brk $01.b		; 00 01
	brk $F7.b		; 00 F7
	sbc $000407.l,X		; FF 07 04 00
	brk $01.b		; 00 01
	ora ($07.b,X)		; 01 07
	tsb $0E.b		; 04 0E
	ora #$1A.b		; 09 1A
	asl $39.b,X		; 16 39
	rol A		; 2A
	adc [$18.b],Y		; 77 18
	eor $3CE020.l		; 4F 20 E0 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	asl $00.b		; 06 00
	pha		; 48
	brk $10.b		; 00 10
	brk $16.b		; 00 16
	ora #$F0.b		; 09 F0
	beq -60.b		; F0 C4
	bit $FE02.w,X		; 3C 02 FE
	ora #$EF.b		; 09 EF
	lda ($4B.b)		; B2 4B
	lda $1EE3.w,X		; BD E3 1E
	cpx #$00.b		; E0 00
	sbc [$00.b]		; E7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $AC.b		; 00 AC
	rti		; 40

	ldx #$40.b		; A2 40
	ora ($E0.b,X)		; 01 E0
	ora $00F2.w		; 0D F2 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	adc $986F90.l,X		; 7F 90 6F 98
	adc ($9C.b,X)		; 61 9C
	adc ($B8.b,X)		; 61 B8
	eor $A8.b,S		; 43 A8
	adc ($0C.b,S),Y		; 73 0C
	and [$55.b]		; 27 55
	trb $0FB0.w		; 1C B0 0F
	tay		; A8
	asl $A6.b		; 06 A6
	brk $A0.b		; 00 A0
	cop $A4.b		; 02 A4
	ora $94.b,S		; 03 94
	ora $54.b,S		; 03 54
	ora $69.b,S		; 03 69
	asl $01.b		; 06 01
	sbc $A3FEE1.l,X		; FF E1 FE A3
	clv		; B8
	adc [$70.b]		; 67 70
	ora $F8.b,S		; 03 F8
	asl $FD.b		; 06 FD
	.db $42, $BC		; 42 BC
	sbc ($07.b),Y		; F1 07
	ora ($1E.b,X)		; 01 1E
	cop $0C.b		; 02 0C
	mvp $80,$08		; 44 08 80
	php		; 08
	tsb $18.b		; 04 18
	ora $F8.b		; 05 F8
	lda ($1C.b,X)		; A1 1C
	cop $0C.b		; 02 0C
	jsr $20C0.w		; 20 C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$A0.b		; C0 A0
	rti		; 40

	rts		; 60

	brk $00.b		; 00 00
	bra  64.b		; 80 40
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $A7.b		; 00 A7
	jsr $5B00.w		; 20 00 5B
	jsr $1B07.w		; 20 07 1B
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	brk $67.b		; 00 67
	brk $38.b		; 00 38
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C2.b		; 00 C2
	plp		; 28
	tsb $90.b		; 04 90
	plp		; 28
	cpy #$B0.b		; C0 B0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $36.b		; 00 36
	brk $EC.b		; 00 EC
	brk $18.b		; 00 18
	brk $70.b		; 00 70
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $F7.b		; 00 F7
	ora #$E7.b		; 09 E7
	xce		; FB
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b]		; E7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFE7FF.l,X		; FF FF E7 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc [$FF.b]		; E7 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $0403FF.l		; EF FF 03 04
	brk $00.b		; 00 00
	sbc $FFEFFF.l,X		; FF FF EF FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $0405FF.l		; EF FF 05 04
	brk $00.b		; 00 00
	sbc $F7FF.w,Y		; F9 FF F7
	sbc $000406.l,X		; FF 06 04 00
	brk $01.b		; 00 01
	brk $F7.b		; 00 F7
	sbc $000407.l,X		; FF 07 04 00
	brk $01.b		; 00 01
	ora ($07.b,X)		; 01 07
	tsb $0E.b		; 04 0E
	ora #$1A.b		; 09 1A
	asl $39.b,X		; 16 39
	pld		; 2B
	stz $1F.b,X		; 74 1F
	lsr $EE23.w		; 4E 23 EE
	and ($00.b,S),Y		; 33 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	brk $48.b		; 00 48
	ora $12.b,S		; 03 12
	ora ($12.b,X)		; 01 12
	ora ($F0.b,X)		; 01 F0
	beq -60.b		; F0 C4
	bit $FE02.w,X		; 3C 02 FE
	ora #$EF.b		; 09 EF
	sbc ($8B.b)		; F2 8B
	adc $3087.w,X		; 7D 87 30
	dec $FF00.w,X		; DE 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	tsb $8200.w		; 0C 00 82
	brk $41.b		; 00 41
	stx $FC03.w		; 8E 03 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rti		; 40

	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9C.b		; 00 9C
	adc $80.b		; 65 80
	adc $906F80.l,X		; 7F 80 6F 90
	adc $BC.b,X		; 75 BC
	eor $AC.b,S		; 43 AC
	adc ($0C.b),Y		; 71 0C
	and ($54.b,X)		; 21 54
	ora $03A0.w,Y		; 19 A0 03
	clv		; B8
	asl $A0.b		; 06 A0
	asl $02AC.w,X		; 1E AC 02
	ldx #$01.b		; A2 01
	sta ($01.b)		; 92 01
	eor ($01.b)		; 52 01
	ror A		; 6A
	ora ($03.b,X)		; 01 03
	jsr ($F8E7.w,X)		; FC E7 F8
	lda [$B8.b]		; A7 B8
	adc $7C.b,S		; 63 7C
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	bit $7D86.w,X		; 3C 86 7D
	eor $04.b,S		; 43 04
	clc		; 18
	brk $08.b		; 00 08
	rti		; 40

	php		; 08
	sty $08.b		; 84 08
	cop $1C.b		; 02 1C
	ora ($EE.b),Y		; 11 EE
	ora $C0.b,S		; 03 C0
	cop $80.b		; 02 80
	jsr $20C0.w		; 20 C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$A0.b		; C0 A0
	rti		; 40

	rts		; 60

	brk $00.b		; 00 00
	bra  64.b		; 80 40
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $A3.b		; 00 A3
	rol $00.b		; 26 00
	tad		; 5B
	jsr $1B07.w		; 20 07 1B
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	tsb $67.b		; 04 67
	brk $38.b		; 00 38
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E2.b		; 00 E2
	php		; 08
	tsb $90.b		; 04 90
	plp		; 28
	cpy #$B0.b		; C0 B0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $16.b		; 00 16
	brk $EC.b		; 00 EC
	brk $18.b		; 00 18
	brk $70.b		; 00 70
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $F7.b		; 00 F7
	ora #$E7.b		; 09 E7
	xce		; FB
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b]		; E7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFE7FF.l,X		; FF FF E7 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc [$FF.b]		; E7 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $0403FF.l		; EF FF 03 04
	brk $00.b		; 00 00
	sbc $FFEFFF.l,X		; FF FF EF FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $0405FF.l		; EF FF 05 04
	brk $00.b		; 00 00
	sbc $F7FF.w,Y		; F9 FF F7
	sbc $000406.l,X		; FF 06 04 00
	brk $01.b		; 00 01
	brk $F7.b		; 00 F7
	sbc $000407.l,X		; FF 07 04 00
	brk $01.b		; 00 01
	ora ($07.b,X)		; 01 07
	tsb $0E.b		; 04 0E
	ora #$1A.b		; 09 1A
	asl $39.b,X		; 16 39
	rol A		; 2A
	adc ($1C.b,S),Y		; 73 1C
	pha		; 48
	and [$EC.b]		; 27 EC
	and [$00.b],Y		; 37 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	brk $4A.b		; 00 4A
	tsb $18.b		; 04 18
	ora [$14.b]		; 07 14
	ora $F0.b,S		; 03 F0
	beq -60.b		; F0 C4
	bit $FE02.w,X		; 3C 02 FE
	ora #$EF.b		; 09 EF
.INDEX 8
	sep #$1B		; E2 1B
	cmp ($3F.b,X)		; C1 3F
	asl $38.b		; 06 38
	asl $F1.b		; 06 F1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	trb $2A00.w		; 1C 00 2A
	bpl  73.b		; 10 49
	bcs   9.b		; B0 09
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9C.b		; 00 9C
	adc $98.b,S		; 63 98
	adc ($90.b,X)		; 61 90
	adc [$80.b]		; 67 80
	adc $AE5DA0.l		; 6F A0 5D AE
	bvs  15.b		; 70 0F
	jsr $1857.w		; 20 57 18
	ldy #$03.b		; A0 03
	ldy $02.b		; A4 02
	tay		; A8
	asl $B0.b		; 06 B0
	asl $11AE.w		; 0E AE 11
	sta ($00.b),Y		; 91 00
	bvc   0.b		; 50 00
	pla		; 68
	brk $07.b		; 00 07
	beq -29.b		; F0 E3
	inc $BFA0.w,X		; FE A0 BF
	rts		; 60

	ror $FB00.w,X		; 7E 00 FB
	asl $1EE1.w		; 0E E1 1E
	rts		; 60

	ora $0003.w,X		; 1D 03 00
	clc		; 18
	cop $0C.b		; 02 0C
	rti		; 40

	ora $0C0F80.l		; 0F 80 0F 0C
	bpl   1.b		; 10 01
	beq  17.b		; F0 11
	cpx #$92.b		; E0 92
	rts		; 60

	jsr $20C0.w		; 20 C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$A0.b		; C0 A0
	rti		; 40

	rts		; 60

	brk $00.b		; 00 00
	bra  64.b		; 80 40
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $A5.b		; 00 A5
	and $00.b,S		; 23 00
	tad		; 5B
	jsr $1B07.w		; 20 07 1B
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	ora ($67.b,X)		; 01 67
	brk $38.b		; 00 38
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A2.b		; 00 A2
	iny		; C8
	tsb $90.b		; 04 90
	plp		; 28
	cpy #$B0.b		; C0 B0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $16.b		; 00 16
	bra -20.b		; 80 EC
	brk $18.b		; 00 18
	brk $70.b		; 00 70
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bra  36.b		; 80 24
	brk $3F.b		; 00 3F
	cmp [$28.b]		; C7 28
	and [$3F.b],Y		; 37 3F
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4F.b		; 00 4F
	brk $28.b		; 00 28
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	brk $28.b		; 00 28
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $6F.b		; 00 6F
	brk $28.b		; 00 28
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $28.b		; 00 28
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	brk $28.b		; 00 28
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $9F.b		; 00 9F
	brk $28.b		; 00 28
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $AF.b		; 00 AF
	brk $28.b		; 00 28
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	brk $28.b		; 00 28
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	jmp ($63FF.w,X)		; 7C FF 63
	sbc [$61.b],Y		; F7 61
	sbc ($60.b,S),Y		; F3 60
	sbc ($60.b),Y		; F1 60
	sbc ($60.b),Y		; F1 60
	sbc ($60.b),Y		; F1 60
	brk $00.b		; 00 00
	jmp ($6300.w,X)		; 7C 00 63
	brk $61.b		; 00 61
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C7.b		; 00 C7
	bra -17.b		; 80 EF
	sta $FF.b,S		; 83 FF
	cpy $FF.b		; C4 FF
	cpy $CFFF.w		; CC FF CF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sta $00.b,S		; 83 00
	cpy $00.b		; C4 00
	cpy $CF00.w		; CC 00 CF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	brk $EF.b		; 00 EF
	sta $FF.b,S		; 83 FF
	lsr $FF.b		; 46 FF
	ror $FF.b		; 66 FF
	sbc $00.b,S		; E3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $83.b		; 00 83
	brk $46.b		; 00 46
	brk $66.b		; 00 66
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	brk $EF.b		; 00 EF
	sta $FF.b,S		; 83 FF
	mvp $0C,$FF		; 44 FF 0C
	sbc $00008F.l,X		; FF 8F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $00.b,S		; 83 00
	mvp $0C,$00		; 44 00 0C
	brk $8F.b		; 00 8F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	brk $EF.b		; 00 EF
	stx $FF.b		; 86 FF
	eor [$FF.b]		; 47 FF
	ror $FF.b		; 66 FF
	inc $00.b		; E6 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	brk $47.b		; 00 47
	brk $66.b		; 00 66
	brk $E6.b		; 00 E6
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	cop $0F.b		; 02 0F
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	cmp $8F06FF.l		; CF FF 06 8F
	asl $0F.b		; 06 0F
	asl $00.b		; 06 00
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $CF.b		; 00 CF
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $C1.b		; 00 C1
	brk $C1.b		; 00 C1
	bra -63.b		; 80 C1
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	sed		; F8
	inc $FECC.w,X		; FE CC FE
	cpy $CCFE.w		; CC FE CC
	inc $FFC8.w,X		; FE C8 FF
	jsr ($C6FF.w,X)		; FC FF C6
	brk $00.b		; 00 00
	sed		; F8
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $C8.b		; 00 C8
	brk $FC.b		; 00 FC
	brk $C6.b		; 00 C6
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	rts		; 60

	beq  96.b		; F0 60
	sbc [$60.b],Y		; F7 60
	sbc $66FF63.l,X		; FF 63 FF 66
	sbc $63FF60.l,X		; FF 60 FF 63
	brk $00.b		; 00 00
	rts		; 60

	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $63.b		; 00 63
	brk $66.b		; 00 66
	brk $60.b		; 00 60
	brk $63.b		; 00 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	cmp $FF.b,S		; C3 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	sbc $00.b,S		; E3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $E3.b		; 00 E3
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	cop $0F.b		; 02 0F
	asl $DF.b		; 06 DF
	asl $FF.b		; 06 FF
	sta $EF46FF.l		; 8F FF 46 EF
	asl $EF.b		; 06 EF
	stx $00.b		; 86 00
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $8F.b		; 00 8F
	brk $46.b		; 00 46
	brk $06.b		; 00 06
	brk $86.b		; 00 86
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -63.b		; 80 C1
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	beq  -8.b		; F0 F8
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	ora $3C183F.l,X		; 1F 3F 18 3C
	clc		; 18
	and $1F3F18.l,X		; 3F 18 3F 1F
	and $183C18.l,X		; 3F 18 3C 18
	brk $00.b		; 00 00
	ora $001800.l,X		; 1F 00 18 00
	clc		; 18
	brk $18.b		; 00 18
	brk $1F.b		; 00 1F
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	asl $33FF.w,X		; 1E FF 33
	sbc $1F7F03.l,X		; FF 03 7F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $3300.w,X		; 1E 00 33
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	trb $32FF.w		; 1C FF 32
	sbc $1CFF30.l,X		; FF 30 FF 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $3200.w		; 1C 00 32
	brk $30.b		; 00 30
	brk $1C.b		; 00 1C
	brk $F3.b		; 00 F3
	rts		; 60

	sbc [$61.b],Y		; F7 61
	sbc $7CFF63.l,X		; FF 63 FF 7C
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $61.b		; 00 61
	brk $63.b		; 00 63
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sty $8CDF.w		; 8C DF 8C
	cmp $038F06.l,X		; DF 06 8F 03
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $8C00.w		; 8C 00 8C
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	stz $FF.b		; 64 FF
	cmp $E7.b,S		; C3 E7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $64.b		; 00 64
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cpy $CCFF.w		; CC FF CC
	sbc $83EFC6.l,X		; FF C6 EF 83
	cmp [$00.b]		; C7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $CC00.w		; CC 00 CC
	brk $C6.b		; 00 C6
	brk $83.b		; 00 83
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	ror $FF.b		; 66 FF
	dec $EF.b		; C6 EF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $66.b		; 00 66
	brk $C6.b		; 00 C6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	asl $0F.b		; 06 0F
	asl $0F.b		; 06 0F
	asl $0F.b		; 06 0F
	ora $07.b,S		; 03 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $C1.b		; 00 C1
	brk $C1.b		; 00 C1
	bra -63.b		; 80 C1
	brk $81.b		; 00 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	dec $EF.b		; C6 EF
	dec $FF.b		; C6 FF
	cpy $FE.b		; C4 FE
	sed		; F8
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	brk $C6.b		; 00 C6
	brk $C4.b		; 00 C4
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	adc $F7.b,S		; 63 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $63.b		; 00 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	rts		; 60

	sbc $64FF60.l,X		; FF 60 FF 64
	sbc $00F7A3.l,X		; FF A3 F7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $60.b		; 00 60
	brk $64.b		; 00 64
	brk $A3.b		; 00 A3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	dec $EF.b		; C6 EF
	dec $EF.b		; C6 EF
	dec $EF.b		; C6 EF
	sta $C7.b,S		; 83 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	brk $C6.b		; 00 C6
	brk $C6.b		; 00 C6
	brk $83.b		; 00 83
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $3C.b		; 00 3C
	clc		; 18
	bit $3F18.w,X		; 3C 18 3F
	clc		; 18
	and $003F1F.l,X		; 3F 1F 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	and ($7F.b,S),Y		; 33 7F
	and ($FF.b,S),Y		; 33 FF
	and ($FF.b,S),Y		; 33 FF
	ora $00BF.w,X		; 1D BF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($00.b,S),Y		; 33 00
	and ($00.b,S),Y		; 33 00
	and ($00.b,S),Y		; 33 00
	ora $0000.w,X		; 1D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	rol $FF.b		; 26 FF
	trb $00BE.w		; 1C BE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	rol $00.b		; 26 00
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	brk $E3.b		; 00 E3
	cmp ($F7.b,X)		; C1 F7
	cmp ($F7.b,X)		; C1 F7
	.db $62, $FF, $62		; 62 FF 62
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	cmp ($00.b,X)		; C1 00
	.db $62, $00, $62		; 62 00 62
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	bit $7E.b,X		; 34 7E
	bit $7E.b,X		; 34 7E
	clc		; 18
	bit $3C18.w,X		; 3C 18 3C
	bpl  -8.b		; 10 F8
	bpl  -8.b		; 10 F8
	rts		; 60

	beq   0.b		; F0 00
	bit $00.b,X		; 34 00
	bit $00.b,X		; 34 00
	clc		; 18
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $10.b		; 00 10
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	bra  40.b		; 80 28
	brk $2F.b		; 00 2F
	wai		; CB
	lsr $65.b,X		; 56 65
	and $005600.l		; 2F 00 56 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $005600.l,X		; 3F 00 56 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	eor ($00.b)		; 52 00
	lsr $00.b,X		; 56 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	.db $62, $00, $56		; 62 00 56
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $72.b		; 00 72
	brk $56.b		; 00 56
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $85.b		; 00 85
	brk $56.b		; 00 56
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $95.b		; 00 95
	brk $56.b		; 00 56
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $A5.b		; 00 A5
	brk $56.b		; 00 56
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $B5.b		; 00 B5
	brk $56.b		; 00 56
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $C5.b		; 00 C5
	brk $56.b		; 00 56
	brk $22.b		; 00 22
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $7F.b		; 00 7F
	asl $317F.w		; 0E 7F 31
	xce		; FB
	jsr $60F1.w		; 20 F1 60
	beq  96.b		; F0 60
	beq  96.b		; F0 60
	beq  96.b		; F0 60
	brk $00.b		; 00 00
	asl $3100.w		; 0E 00 31
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $3C.b		; 00 3C
	brk $BD.b		; 00 BD
	clc		; 18
	sbc $FF80.w,X		; FD 80 FF
	bra  -1.b		; 80 FF
	ora $183F.w,Y		; 19 3F 18
	and $3D18.w,X		; 3D 18 3D
	clc		; 18
	brk $00.b		; 00 00
	clc		; 18
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $19.b		; 00 19
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	rti		; 40

	cpx #$C0.b		; E0 C0
	sbc $F6FFC0.l,X		; FF C0 FF F6
	sbc $C3EFC6.l,X		; FF C6 EF C3
	sbc [$C3.b]		; E7 C3
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F6.b		; 00 F6
	brk $C6.b		; 00 C6
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	php		; 08
	ldy $BC08.w,X		; BC 08 BC
	bpl  -8.b		; 10 F8
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	jmp ($66FF.w,X)		; 7C FF 66
	sbc $66FF66.l,X		; FF 66 FF 66
	sbc $7EFF64.l,X		; FF 64 FF 7E
	sbc $000063.l,X		; FF 63 00 00
	jmp ($6600.w,X)		; 7C 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $64.b		; 00 64
	brk $7E.b		; 00 7E
	brk $63.b		; 00 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	ora $FF197F.l		; 0F 7F 19 FF
	bmi  -7.b		; 30 F9
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $19.b		; 00 19
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9E.b		; 00 9E
	brk $DE.b		; 00 DE
	tsb $8CFE.w		; 0C FE 8C
	inc $FECC.w,X		; FE CC FE
	cpy $0000.w		; CC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $8C00.w		; 0C 00 8C
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	adc [$FF.b]		; 67 FF
	ror $FF.b		; 66 FF
	ror $00.b		; 66 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $66.b		; 00 66
	brk $67.b		; 00 67
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	brk $FB.b		; 00 FB
	cpx #$FF.b		; E0 FF
	and ($FF.b),Y		; 31 FF
	and ($7F.b,S),Y		; 33 7F
	and ($00.b,S),Y		; 33 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $31.b		; 00 31
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	clc		; 18
	bit $FC18.w,X		; 3C 18 FC
	clc		; 18
	jsr ($FCF8.w,X)		; FC F8 FC
	tya		; 98
	jsr ($BC18.w,X)		; FC 18 BC
	clc		; 18
	brk $00.b		; 00 00
	clc		; 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $F8.b		; 00 F8
	brk $98.b		; 00 98
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	sei		; 78
	jsr ($0078.w,X)		; FC 78 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	asl $0F.b		; 06 0F
	asl $0F.b		; 06 0F
	ora [$0F.b]		; 07 0F
	ora [$0F.b]		; 07 0F
	ora $1F.b		; 05 1F
	ora $1F.b		; 05 1F
	php		; 08
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	php		; 08
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	ora $8F.b,S		; 03 8F
	ora [$8F.b]		; 07 8F
	ora [$DF.b]		; 07 DF
	ora [$DF.b]		; 07 DF
	phb		; 8B
	sbc $D1FF8B.l,X		; FF 8B FF D1
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	phb		; 8B
	brk $8B.b		; 00 8B
	brk $D1.b		; 00 D1
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $8F.b		; 00 8F
	brk $9F.b		; 00 9F
	ora [$BF.b]		; 07 BF
	php		; 08
	sbc $9FFF18.l,X		; FF 18 FF 9F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	php		; 08
	brk $18.b		; 00 18
	brk $9F.b		; 00 9F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	brk $CF.b		; 00 CF
	ora $FF.b,S		; 03 FF
	stx $FF.b		; 86 FF
	cpy $CCFE.w		; CC FE CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	stx $00.b		; 86 00
	cpy $CC00.w		; CC 00 CC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	rts		; 60

	sbc $E6FF60.l,X		; FF 60 FF E6
	sbc $66FF66.l,X		; FF 66 FF 66
	sbc $000066.l,X		; FF 66 00 00
	ror $00.b		; 66 00
	rts		; 60

	brk $60.b		; 00 60
	brk $E6.b		; 00 E6
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $F1.b		; 00 F1
	rts		; 60

	xce		; FB
	jsr $317F.w		; 20 7F 31
	adc $001F0E.l,X		; 7F 0E 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $20.b		; 00 20
	brk $31.b		; 00 31
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	clc		; 18
	sbc $FD98.w,X		; FD 98 FD
	tya		; 98
	sbc $3C18.w,X		; FD 18 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $98.b		; 00 98
	brk $98.b		; 00 98
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	cmp ($FB.b,X)		; C1 FB
	cmp ($FB.b,X)		; C1 FB
	bne  -7.b		; D0 F9
	rts		; 60

	sbc ($00.b),Y		; F1 00
	ora [$00.b]		; 07 00
	ora [$03.b]		; 07 03
	ora [$00.b]		; 07 00
	cmp ($00.b,X)		; C1 00
	cmp ($00.b,X)		; C1 00
	bne   0.b		; D0 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	ldy #$F0.b		; A0 F0
	ldy #$F0.b		; A0 F0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	adc $F7.b,S		; 63 F7
	adc $FF.b,S		; 63 FF
	.db $62, $FF, $7C		; 62 FF 7C
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	brk $63.b		; 00 63
	brk $62.b		; 00 62
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	bmi  -1.b		; 30 FF
	bmi  -1.b		; 30 FF
	ora $0F3F.w,Y		; 19 3F 0F
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	ora $0F00.w,Y		; 19 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	cpy $CCFF.w		; CC FF CC
	sbc $07DF8C.l,X		; FF 8C DF 07
	sta $000000.l		; 8F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $CC00.w		; CC 00 CC
	brk $8C.b		; 00 8C
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	inc $FF.b		; E6 FF
	ror $FF.b		; 66 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $E6.b		; 00 E6
	brk $66.b		; 00 66
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	and ($7F.b,S),Y		; 33 7F
	and ($7F.b,S),Y		; 33 7F
	and ($7B.b),Y		; 31 7B
	bmi 121.b		; 30 79
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $31.b		; 00 31
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	clc		; 18
	jsr ($FC18.w,X)		; FC 18 FC
	tya		; 98
	jsr ($FCF8.w,X)		; FC F8 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $98.b		; 00 98
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $1D.b		; 00 1D
	php		; 08
	ora $1C08.w,X		; 1D 08 1C
	php		; 08
	trb $1C08.w		; 1C 08 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	cmp ($FB.b),Y		; D1 FB
	adc ($FB.b),Y		; 71 FB
	adc ($F3.b,X)		; 61 F3
	and ($73.b,X)		; 21 73
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D1.b		; 00 D1
	brk $71.b		; 00 71
	brk $61.b		; 00 61
	brk $21.b		; 00 21
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	tya		; 98
	sbc $8CFF98.l,X		; FF 98 FF 8C
	cmp $00CF87.l,X		; DF 87 CF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $98.b		; 00 98
	brk $8C.b		; 00 8C
	brk $87.b		; 00 87
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	tsb $0CFF.w		; 0C FF 0C
	sbc $83EFC6.l,X		; FF C6 EF 83
	cmp [$00.b]		; C7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0C00.w		; 0C 00 0C
	brk $C6.b		; 00 C6
	brk $83.b		; 00 83
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	inc $FF.b		; E6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $E6.b		; 00 E6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	adc $F7.b,S		; 63 F7
	adc $F7.b,S		; 63 F7
	adc $F7.b,S		; 63 F7
	adc $00.b,S		; 63 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	brk $63.b		; 00 63
	brk $63.b		; 00 63
	brk $63.b		; 00 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and [$FF.b],Y		; 37 FF
	and $31FF.w,Y		; 39 FF 31
	xce		; FB
	and ($00.b),Y		; 31 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	brk $39.b		; 00 39
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	sec		; 38
	inc $FECC.w,X		; FE CC FE
	sty $8CDE.w		; 8C DE 8C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	brk $CC.b		; 00 CC
	brk $8C.b		; 00 8C
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	adc $FF.b,S		; 63 FF
	adc $FF.b,S		; 63 FF
	adc [$FF.b]		; 67 FF
	tsa		; 3B
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00.b,S		; 63 00
	adc $00.b,S		; 63 00
	adc [$00.b]		; 67 00
	tsa		; 3B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	and ($FB.b),Y		; 31 FB
	and ($FB.b),Y		; 31 FB
	and ($FB.b),Y		; 31 FB
	and ($FB.b),Y		; 31 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DE.b		; 00 DE
	sty $8CDE.w		; 8C DE 8C
	dec $DE8C.w,X		; DE 8C DE
	sty $00DE.w		; 8C DE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $8C00.w		; 8C 00 8C
	brk $8C.b		; 00 8C
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	bra  32.b		; 80 20
	brk $47.b		; 00 47
	cmp $84.b,S		; C3 84
	bcc  71.b		; 90 47
	brk $84.b		; 00 84
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $57.b		; 00 57
	brk $84.b		; 00 84
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $69.b		; 00 69
	brk $84.b		; 00 84
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $79.b		; 00 79
	brk $84.b		; 00 84
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $89.b		; 00 89
	brk $84.b		; 00 84
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	brk $84.b		; 00 84
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $A9.b		; 00 A9
	brk $84.b		; 00 84
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $B9.b		; 00 B9
	brk $84.b		; 00 84
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	jmp ($60FE.w,X)		; 7C FE 60
	beq  96.b		; F0 60
	sbc $7CFF60.l,X		; FF 60 FF 7C
	sbc $60F160.l,X		; FF 60 F1 60
	brk $00.b		; 00 00
	jmp ($6000.w,X)		; 7C 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $7C.b		; 00 7C
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	sei		; 78
	sbc $0CFFCC.l,X		; FF CC FF 0C
	sbc $00007C.l,X		; FF 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $CC.b		; 00 CC
	brk $0C.b		; 00 0C
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	adc ($FF.b),Y		; 71 FF
	iny		; C8
	sbc $FDC0.w,X		; FD C0 FD
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $71.b		; 00 71
	brk $C8.b		; 00 C8
	brk $C0.b		; 00 C0
	brk $70.b		; 00 70
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	rti		; 40

	cpx #$C0.b		; E0 C0
	sed		; F8
	cpy #$F8.b		; C0 F8
	beq  -8.b		; F0 F8
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$00.b		; C0 00
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	asl $317F.w		; 0E 7F 31
	xce		; FB
	jsr $60F1.w		; 20 F1 60
	beq  96.b		; F0 60
	beq  96.b		; F0 60
	beq  96.b		; F0 60
	brk $00.b		; 00 00
	asl $3100.w		; 0E 00 31
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -49.b		; 80 CF
	bra -33.b		; 80 DF
	ora [$3F.b]		; 07 3F
	tsb $183F.w		; 0C 3F 18
	bit $0018.w,X		; 3C 18 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $07.b		; 00 07
	brk $0C.b		; 00 0C
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	brk $EF.b		; 00 EF
	sta $FF.b,S		; 83 FF
	dec $FF.b		; C6 FF
	rts		; 60

	sbc $000063.l,X		; FF 63 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $00.b,S		; 83 00
	dec $00.b		; C6 00
	rts		; 60

	brk $63.b		; 00 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	cmp $FF.b,S		; C3 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	sbc $00.b,S		; E3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $E3.b		; 00 E3
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	cop $0F.b		; 02 0F
	asl $DF.b		; 06 DF
	asl $FF.b		; 06 FF
	sta $EF46FF.l		; 8F FF 46 EF
	asl $EF.b		; 06 EF
	stx $00.b		; 86 00
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $8F.b		; 00 8F
	brk $46.b		; 00 46
	brk $06.b		; 00 06
	brk $86.b		; 00 86
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -63.b		; 80 C1
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	beq  -8.b		; F0 F8
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	clc		; 18
	bit $3C18.w,X		; 3C 18 3C
	clc		; 18
	and $1F3F18.l,X		; 3F 18 3F 1F
	and $183C18.l,X		; 3F 18 3C 18
	brk $00.b		; 00 00
	clc		; 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $1F.b		; 00 1F
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	rts		; 60

	beq  96.b		; F0 60
	sbc [$60.b],Y		; F7 60
	sbc $E6FF63.l,X		; FF 63 FF E6
	sbc $63FF60.l,X		; FF 60 FF 63
	brk $00.b		; 00 00
	rts		; 60

	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $63.b		; 00 63
	brk $E6.b		; 00 E6
	brk $60.b		; 00 60
	brk $63.b		; 00 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	dec $FF.b		; C6 FF
	adc [$FF.b]		; 67 FF
	ror $FF.b		; 66 FF
	inc $00.b		; E6 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	brk $67.b		; 00 67
	brk $66.b		; 00 66
	brk $E6.b		; 00 E6
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	cmp [$FF.b]		; C7 FF
	tsb $18BF.w		; 0C BF 18
	and $0018.w,X		; 3D 18 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	brk $0C.b		; 00 0C
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$00.b		; C0 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F1.b		; 00 F1
	rts		; 60

	sbc ($60.b),Y		; F1 60
	sbc $7CFF60.l,X		; FF 60 FF 7C
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	cpy $CCFF.w		; CC FF CC
	sbc $74FFCC.l,X		; FF CC FF 74
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $74.b		; 00 74
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	clc		; 18
	sbc $FD18.w,X		; FD 18 FD
	tya		; 98
	sbc $F870.w,X		; FD 70 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $98.b		; 00 98
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpy #$F8.b		; C0 F8
	cpy #$F8.b		; C0 F8
	bne  -8.b		; D0 F8
	rts		; 60

	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bne   0.b		; D0 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	rts		; 60

	xce		; FB
	jsr $317F.w		; 20 7F 31
	adc $001F0E.l,X		; 7F 0E 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $20.b		; 00 20
	brk $31.b		; 00 31
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	clc		; 18
	sbc $8CFF98.l,X		; FF 98 FF 8C
	cmp $000F07.l,X		; DF 07 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $98.b		; 00 98
	brk $8C.b		; 00 8C
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	dec $EF.b		; C6 EF
	sta $C7.b,S		; 83 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $C6.b		; 00 C6
	brk $83.b		; 00 83
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	rts		; 60

	sbc $64FF60.l,X		; FF 60 FF 64
	sbc $00F7A3.l,X		; FF A3 F7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $60.b		; 00 60
	brk $64.b		; 00 64
	brk $A3.b		; 00 A3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	dec $EF.b		; C6 EF
	dec $EF.b		; C6 EF
	dec $EF.b		; C6 EF
	sta $C7.b,S		; 83 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	brk $C6.b		; 00 C6
	brk $C6.b		; 00 C6
	brk $83.b		; 00 83
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $3C.b		; 00 3C
	clc		; 18
	bit $3C18.w,X		; 3C 18 3C
	clc		; 18
	bit $3C18.w,X		; 3C 18 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	adc $F7.b,S		; 63 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $63.b		; 00 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	ldx $FF.b		; A6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $A6.b		; 00 A6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3D.b		; 00 3D
	clc		; 18
	and $0C3F18.l,X		; 3F 18 3F 0C
	ora $000F07.l,X		; 1F 07 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	bra  40.b		; 80 28
	brk $37.b		; 00 37
	pei ($B2.b)		; D4 B2
	ldx $0037.w,Y		; BE 37 00
	lda ($00.b)		; B2 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor [$00.b]		; 47 00
	lda ($00.b)		; B2 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	eor [$00.b],Y		; 57 00
	lda ($00.b)		; B2 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	adc [$00.b]		; 67 00
	lda ($00.b)		; B2 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	adc [$00.b],Y		; 77 00
	lda ($00.b)		; B2 00
	php		; 08
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	brk $B2.b		; 00 B2
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $97.b		; 00 97
	brk $B2.b		; 00 B2
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $A7.b		; 00 A7
	brk $B2.b		; 00 B2
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $B7.b		; 00 B7
	brk $B2.b		; 00 B2
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	brk $B2.b		; 00 B2
	brk $22.b		; 00 22
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	rts		; 60

	xce		; FB
	rts		; 60

	xce		; FB
	and ($7B.b),Y		; 31 7B
	and ($7F.b),Y		; 31 7F
	and ($7F.b),Y		; 31 7F
	inc A		; 1A
	and $00001A.l,X		; 3F 1A 00 00
	rts		; 60

	brk $60.b		; 00 60
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $1A.b		; 00 1A
	brk $1A.b		; 00 1A
	brk $E3.b		; 00 E3
	brk $E3.b		; 00 E3
	cmp ($F7.b,X)		; C1 F7
	cmp ($F7.b,X)		; C1 F7
.ACCU 8
.INDEX 8
	sep #$F7		; E2 F7
	.db $62, $FF, $62		; 62 FF 62
	sbc $347E34.l,X		; FF 34 7E 34
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	cmp ($00.b,X)		; C1 00
	sep #$00		; E2 00
	.db $62, $00, $62		; 62 00 62
	brk $34.b		; 00 34
	brk $34.b		; 00 34
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $BE.b		; 00 BE
	brk $7F.b		; 00 7F
	trb $22FF.w		; 1C FF 22
	sbc $7FFF63.l,X		; FF 63 FF 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $2200.w		; 1C 00 22
	brk $63.b		; 00 63
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	brk $7F.b		; 00 7F
	trb $32FF.w		; 1C FF 32
	sbc $1CFF30.l,X		; FF 30 FF 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $3200.w		; 1C 00 32
	brk $30.b		; 00 30
	brk $1C.b		; 00 1C
	brk $38.b		; 00 38
	brk $78.b		; 00 78
	bpl 120.b		; 10 78
	bmi  -2.b		; 30 FE
	bmi  -2.b		; 30 FE
	jmp ($30FE.w,X)		; 7C FE 30
	sei		; 78
	bmi 120.b		; 30 78
	bmi   0.b		; 30 00
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $7C.b		; 00 7C
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	ora $0F.b,S		; 03 0F
	cop $0F.b		; 02 0F
	asl $0F.b		; 06 0F
	asl $0F.b		; 06 0F
	asl $0F.b		; 06 0F
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	cpx #$FC.b		; E0 FC
	clc		; 18
	ldy $1D08.w,X		; BC 08 1D
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora ($03.b,X)		; 01 03
	ora ($00.b,X)		; 01 00
	brk $E0.b		; 00 E0
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	sei		; 78
	sbc $86FFCC.l,X		; FF CC FF 86
	cmp $000086.l		; CF 86 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $CC.b		; 00 CC
	brk $86.b		; 00 86
	brk $86.b		; 00 86
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	brk $FF.b		; 00 FF
	bit $66FF.w,X		; 3C FF 66
	sbc $3EFF06.l,X		; FF 06 FF 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $6600.w,X		; 3C 00 66
	brk $06.b		; 00 06
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7D.b		; 00 7D
	brk $FF.b		; 00 FF
	sec		; 38
	sbc $60FE64.l,X		; FF 64 FE 60
	inc $0038.w,X		; FE 38 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $64.b		; 00 64
	brk $60.b		; 00 60
	brk $38.b		; 00 38
	brk $70.b		; 00 70
	brk $F0.b		; 00 F0
	jsr $60F0.w		; 20 F0 60
	jsr ($FC60.w,X)		; FC 60 FC
	sed		; F8
	jsr ($F060.w,X)		; FC 60 F0
	rts		; 60

	beq  96.b		; F0 60
	brk $00.b		; 00 00
	jsr $6000.w		; 20 00 60
	brk $60.b		; 00 60
	brk $F8.b		; 00 F8
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	ora $000F1F.l		; 0F 1F 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($83.b,X)		; 01 83
	ora ($83.b,X)		; 01 83
	ora ($83.b,X)		; 01 83
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $CF.b		; 00 CF
	brk $CF.b		; 00 CF
	stx $CF.b		; 86 CF
	stx $CF.b		; 86 CF
	stx $FF.b		; 86 FF
	stx $FF.b		; 86 FF
	inc $86FF.w,X		; FE FF 86
	cmp $000086.l		; CF 86 00 00
	stx $00.b		; 86 00
	stx $00.b		; 86 00
	stx $00.b		; 86 00
	stx $00.b		; 86 00
	inc $8600.w,X		; FE 00 86
	brk $86.b		; 00 86
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	brk $FF.b		; 00 FF
	bit $66FF.w,X		; 3C FF 66
	sbc $3EFF06.l,X		; FF 06 FF 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $6600.w,X		; 3C 00 66
	brk $06.b		; 00 06
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	jmp ($70FF.w)		; 6C FF 70
	xce		; FB
	adc ($F3.b,X)		; 61 F3
	adc ($00.b,X)		; 61 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6C.b		; 00 6C
	brk $70.b		; 00 70
	brk $61.b		; 00 61
	brk $61.b		; 00 61
	brk $3F.b		; 00 3F
	inc A		; 1A
	and $0C1E0C.l,X		; 3F 0C 1E 0C
	asl $1E0C.w,X		; 1E 0C 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1A.b		; 00 1A
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	bit $7E.b,X		; 34 7E
	clc		; 18
	bit $3C18.w,X		; 3C 18 3C
	clc		; 18
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $34.b		; 00 34
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	rts		; 60

	sbc $33FF60.l,X		; FF 60 FF 33
	adc $003F1E.l,X		; 7F 1E 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $60.b		; 00 60
	brk $33.b		; 00 33
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	rol $FF.b		; 26 FF
	trb $003E.w		; 1C 3E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	rol $00.b		; 26 00
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	bmi 126.b		; 30 7E
	bmi 126.b		; 30 7E
	bit $7E.b,X		; 34 7E
	clc		; 18
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $34.b		; 00 34
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	asl $0F.b		; 06 0F
	cop $07.b		; 02 07
	ora $07.b,S		; 03 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora ($BF.b,X)		; 01 BF
	ora #$FF.b		; 09 FF
	clc		; 18
	sbc $F0E0.w,X		; FD E0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $09.b		; 00 09
	brk $18.b		; 00 18
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	stx $FF.b		; 86 FF
	stx $FF.b		; 86 FF
	cpy $78FE.w		; CC FE 78
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	brk $86.b		; 00 86
	brk $CC.b		; 00 CC
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	dec A		; 3A
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $00.b		; 66 00
	ror $00.b		; 66 00
	ror $00.b		; 66 00
	dec A		; 3A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	tsb $0CFE.w		; 0C FE 0C
	inc $FE4C.w,X		; FE 4C FE
	sec		; 38
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $4C.b		; 00 4C
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	rts		; 60

	jsr ($FC60.w,X)		; FC 60 FC
	pla		; 68
	jsr ($7830.w,X)		; FC 30 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $68.b		; 00 68
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $83.b		; 00 83
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	stx $CF.b		; 86 CF
	stx $CF.b		; 86 CF
	stx $CF.b		; 86 CF
	stx $CF.b		; 86 CF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	brk $86.b		; 00 86
	brk $86.b		; 00 86
	brk $86.b		; 00 86
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	ror $FF.b		; 66 FF
	dec A		; 3A
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $00.b		; 66 00
	ror $00.b		; 66 00
	ror $00.b		; 66 00
	dec A		; 3A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	adc ($F3.b,X)		; 61 F3
	adc ($F3.b,X)		; 61 F3
	rts		; 60

	sbc ($60.b),Y		; F1 60
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc ($00.b,X)		; 61 00
	adc ($00.b,X)		; 61 00
	rts		; 60

	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $1E.b		; 00 1E
	tsb $0C1E.w		; 0C 1E 0C
	inc $FE0C.w,X		; FE 0C FE
	jmp ($CCFF.w,X)		; 7C FF CC
	sbc $8CDF8C.l,X		; FF 8C DF 8C
	brk $00.b		; 00 00
	tsb $0C00.w		; 0C 00 0C
	brk $0C.b		; 00 0C
	brk $7C.b		; 00 7C
	brk $CC.b		; 00 CC
	brk $8C.b		; 00 8C
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	brk $FE.b		; 00 FE
	sec		; 38
	sbc $C6FF44.l,X		; FF 44 FF C6
	sbc $0000FE.l,X		; FF FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	brk $44.b		; 00 44
	brk $C6.b		; 00 C6
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7D.b		; 00 7D
	brk $FF.b		; 00 FF
	sec		; 38
	sbc $60FE64.l,X		; FF 64 FE 60
	inc $0038.w,X		; FE 38 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $64.b		; 00 64
	brk $60.b		; 00 60
	brk $38.b		; 00 38
	brk $70.b		; 00 70
	brk $F0.b		; 00 F0
	jsr $60F0.w		; 20 F0 60
	jsr ($FC60.w,X)		; FC 60 FC
	sed		; F8
	jsr ($F060.w,X)		; FC 60 F0
	rts		; 60

	beq  96.b		; F0 60
	brk $00.b		; 00 00
	jsr $6000.w		; 20 00 60
	brk $60.b		; 00 60
	brk $F8.b		; 00 F8
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $DF.b		; 00 DF
	sty $8CFF.w		; 8C FF 8C
	sbc $7CFECC.l,X		; FF CC FE 7C
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	brk $8C.b		; 00 8C
	brk $CC.b		; 00 CC
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	ror $FF.b		; 66 FF
	bit $007E.w,X		; 3C 7E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	ror $00.b		; 66 00
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	tsb $0CFE.w		; 0C FE 0C
	inc $FE4C.w,X		; FE 4C FE
	sec		; 38
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $4C.b		; 00 4C
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	rts		; 60

	jsr ($FC60.w,X)		; FC 60 FC
	pla		; 68
	jsr ($7830.w,X)		; FC 30 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $68.b		; 00 68
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	bra  40.b		; 80 28
	brk $24.b		; 00 24
	phy		; 5A
	phk		; 4B
	adc ($24.b),Y		; 71 24
	brk $4B.b		; 00 4B
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $34.b		; 00 34
	brk $4B.b		; 00 4B
	brk $02.b		; 00 02
	tsb $00.b		; 04 00
	brk $44.b		; 00 44
	brk $4B.b		; 00 4B
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	brk $54.b		; 00 54
	brk $4B.b		; 00 4B
	brk $06.b		; 00 06
	tsb $00.b		; 04 00
	brk $24.b		; 00 24
	brk $5B.b		; 00 5B
	brk $08.b		; 00 08
	tsb $00.b		; 04 00
	brk $34.b		; 00 34
	brk $5B.b		; 00 5B
	brk $0A.b		; 00 0A
	tsb $00.b		; 04 00
	brk $44.b		; 00 44
	brk $5B.b		; 00 5B
	brk $0C.b		; 00 0C
	tsb $00.b		; 04 00
	brk $54.b		; 00 54
	brk $5B.b		; 00 5B
	brk $0E.b		; 00 0E
	tsb $00.b		; 04 00
	brk $26.b		; 00 26
	brk $6B.b		; 00 6B
	brk $20.b		; 00 20
	tsb $00.b		; 04 00
	brk $36.b		; 00 36
	brk $6B.b		; 00 6B
	brk $22.b		; 00 22
	tsb $00.b		; 04 00
	brk $49.b		; 00 49
	brk $6B.b		; 00 6B
	brk $20.b		; 00 20
	mvp $00,$00		; 44 00 00
	and $6B00.w,Y		; 39 00 6B
	brk $22.b		; 00 22
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FF.b		; C0 FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFFFFF.l,X		; DF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFEFE.l,X		; FF FE FE FE
	inc $06FE.w,X		; FE FE 06
	inc $FEF6.w,X		; FE F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FBF7F7.l,X		; FF F7 F7 FB
	xce		; FB
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp $BEE3.w,X		; DD E3 BE
	cmp $FFFF.w,X		; DD FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $D7FFFF.l,X		; FF FF FF D7
	sbc $38D7D7.l,X		; FF D7 D7 38
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $5DFFFF.l,X		; FF FF FF 5D
	sbc $5DFF5D.l,X		; FF 5D FF 5D
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $77FFFF.l,X		; FF FF FF 77
	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $D7FFFF.l,X		; FF FF FF D7
	sbc $D8F7D7.l,X		; FF D7 F7 D8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF7F7F.l,X		; FF 7F 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F6FEFF.l,X		; FF FF FE F6
	inc $FEF6.w,X		; FE F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFBFF.l,X		; FF FF FB FC
	sbc [$FB.b],Y		; F7 FB
	sbc $F7FFF7.l,X		; FF F7 FF F7
	sbc $FFFFF7.l,X		; FF F7 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	lda $BFDF7F.l,X		; BF 7F DF BF
	sbc [$D8.b],Y		; F7 D8
	sbc $98FFF7.l,X		; FF F7 FF 98
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $D37DFF.l,X		; FF FF 7D D3
	sbc $5DEE4C.l,X		; FF 4C EE 5D
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $38D7FF.l,X		; FF FF D7 38
	sbc $D0FFD7.l,X		; FF D7 FF D0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FEF6.w,X		; FE F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $5F7FDF.l,X		; FF DF 7F 5F
	adc $1F3F5F.l,X		; 7F 5F 3F 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	sbc $BEFFBE.l,X		; FF BE FF BE
	sbc $BEFFBE.l,X		; FF BE FF BE
	ldx $DDDD.w,Y		; BE DD DD
	sbc $FF.b,S		; E3 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FBFFFF.l,X		; FF FF FF FB
	stx $FF.b		; 86 FF
	tyx		; BB
	sbc $BBFFBB.l,X		; FF BB FF BB
	sbc $87FBBB.l,X		; FF BB FB 87
	sbc $BFFFBF.l,X		; FF BF FF BF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF36.w,X		; FD 36 FF
	adc $FF.b,X		; 75 FF
	adc $FF.b,X		; 75 FF
	adc $FF.b,X		; 75 FF
	adc $7D.b,X		; 75 7D
	stx $FF.b,Y		; 96 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DFFFFF.l,X		; FF FF FF DF
	bit $FF.b,X		; 34 FF
	cmp ($FB.b,S),Y		; D3 FB
	cmp [$FF.b],Y		; D7 FF
	cmp [$FF.b],Y		; D7 FF
	cmp [$DF.b],Y		; D7 DF
	and [$FF.b],Y		; 37 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $5BFFFF.l,X		; FF FF FF 5B
	sbc [$FF.b]		; E7 FF
	tad		; 5B
	cmp $7BFF67.l,X		; DF 67 FF 7B
	sbc $67DB5B.l,X		; FF 5B DB 67
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FEF6.w,X		; FE F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FC.b,X		; F6 FC
	pea $F4FC.w		; F4 FC F4
	sed		; F8
	beq  -2.b		; F0 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($F8F8.w,X)		; FC F8 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F7F7F.l,X		; FF 7F 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	ora $00001F.l,X		; 1F 1F 00 00
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	ora $00001F.l,X		; 1F 1F 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $2080.w		; 0C 80 20
	brk $63.b		; 00 63
	sta $714B.w,Y		; 99 4B 71
	adc $00.b,S		; 63 00
	phk		; 4B
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $73.b		; 00 73
	brk $4B.b		; 00 4B
	brk $02.b		; 00 02
	tsb $00.b		; 04 00
	brk $8A.b		; 00 8A
	brk $4B.b		; 00 4B
	brk $00.b		; 00 00
	mvp $00,$00		; 44 00 00
	ply		; 7A
	brk $4B.b		; 00 4B
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	brk $63.b		; 00 63
	brk $5B.b		; 00 5B
	brk $06.b		; 00 06
	tsb $00.b		; 04 00
	brk $73.b		; 00 73
	brk $5B.b		; 00 5B
	brk $08.b		; 00 08
	tsb $00.b		; 04 00
	brk $8A.b		; 00 8A
	brk $5B.b		; 00 5B
	brk $06.b		; 00 06
	mvp $00,$00		; 44 00 00
	ply		; 7A
	brk $5B.b		; 00 5B
	brk $0A.b		; 00 0A
	tsb $00.b		; 04 00
	brk $65.b		; 00 65
	brk $6B.b		; 00 6B
	brk $0C.b		; 00 0C
	tsb $00.b		; 04 00
	brk $75.b		; 00 75
	brk $6B.b		; 00 6B
	brk $0E.b		; 00 0E
	tsb $00.b		; 04 00
	brk $88.b		; 00 88
	brk $6B.b		; 00 6B
	brk $0C.b		; 00 0C
	mvp $00,$00		; 44 00 00
	sei		; 78
	brk $6B.b		; 00 6B
	brk $0E.b		; 00 0E
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FF.b		; C0 FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFFFFF.l,X		; DF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFDFFF.l,X		; FF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFFFFF.l,X		; DF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFBEFF.l,X		; FF FF BE FF
	ldx $BEFF.w,Y		; BE FF BE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $82FFFF.l,X		; FF FF FF 82
	sbc $FFFFEE.l,X		; FF EE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BAFFFF.l,X		; FF FF FF BA
	sbc $C3BEBA.l,X		; FF BA BE C3
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3CDFFF.l,X		; FF FF DF 3C
	sbc $FFFFDE.l		; EF DE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $5DFFFF.l,X		; FF FF FF 5D
	sbc $61DF5D.l,X		; FF 5D DF 61
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1EEFFF.l,X		; FF FF EF 1E
	sbc [$6F.b],Y		; F7 6F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $77FF77.l,X		; FF 77 FF 77
	adc $F7FF87.l,X		; 7F 87 FF F7
	sbc [$8F.b],Y		; F7 8F
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $FFFF5F.l,X		; FF 5F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	brk $00.b		; 00 00
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	ora $00001F.l,X		; 1F 1F 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $86FBFF.l,X		; FF FF FB 86
	sbc $BAFFBA.l,X		; FF BA FF BA
	sbc $86FBBA.l,X		; FF BA FB 86
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C6BBFF.l,X		; FF FF BB C6
	sbc $C2FFBA.l,X		; FF BA FF C2
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $63DD7F.l,X		; FF 7F DD 63
	sbc $61FF5D.l,X		; FF 5D FF 61
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $77FFFF.l,X		; FF FF FF 77
	sbc $77FF77.l,X		; FF 77 FF 77
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $5F7FDF.l,X		; FF DF 7F 5F
	adc $1F3F5F.l,X		; 7F 5F 3F 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $EEFFEE.l,X		; FF EE FF EE
	sbc $EEFFEE.l,X		; FF EE FF EE
	sbc $EEFFEE.l,X		; FF EE FF EE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $EEFFEE.l,X		; FF EE FF EE
	sbc $EEFFEE.l,X		; FF EE FF EE
	sbc $3CDFDE.l		; EF DE DF 3C
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $77FF77.l,X		; FF 77 FF 77
	sbc $77FF77.l,X		; FF 77 FF 77
	sbc [$6F.b],Y		; F7 6F
	sbc $FFFF1E.l		; EF 1E FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $5FFFFF.l,X		; FF FF FF 5F
	sbc $5FFF5F.l,X		; FF 5F FF 5F
	sbc $5FFF5F.l,X		; FF 5F FF 5F
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $2480.w		; 0C 80 24
	brk $A2.b		; 00 A2
	cld		; D8
	phk		; 4B
	adc ($A2.b),Y		; 71 A2
	brk $4B.b		; 00 4B
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $B2.b		; 00 B2
	brk $4B.b		; 00 4B
	brk $02.b		; 00 02
	tsb $00.b		; 04 00
	brk $C9.b		; 00 C9
	brk $4B.b		; 00 4B
	brk $00.b		; 00 00
	mvp $00,$00		; 44 00 00
	lda $4B00.w,Y		; B9 00 4B
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	brk $A2.b		; 00 A2
	brk $5B.b		; 00 5B
	brk $06.b		; 00 06
	tsb $00.b		; 04 00
	brk $B2.b		; 00 B2
	brk $5B.b		; 00 5B
	brk $08.b		; 00 08
	tsb $00.b		; 04 00
	brk $C2.b		; 00 C2
	brk $5B.b		; 00 5B
	brk $0A.b		; 00 0A
	tsb $00.b		; 04 00
	brk $D2.b		; 00 D2
	brk $5B.b		; 00 5B
	brk $0C.b		; 00 0C
	tsb $00.b		; 04 00
	brk $A4.b		; 00 A4
	brk $6B.b		; 00 6B
	brk $0E.b		; 00 0E
	tsb $00.b		; 04 00
	brk $B4.b		; 00 B4
	brk $6B.b		; 00 6B
	brk $20.b		; 00 20
	tsb $00.b		; 04 00
	brk $C7.b		; 00 C7
	brk $6B.b		; 00 6B
	brk $0E.b		; 00 0E
	mvp $00,$00		; 44 00 00
	lda [$00.b],Y		; B7 00
	rtl		; 6B

	brk $20.b		; 00 20
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FF.b		; C0 FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFFFFF.l,X		; DF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFDFFF.l,X		; FF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFDFFF.l,X		; DF FF DF FF
	cmp $FFFFFF.l,X		; DF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFEFD.l,X		; FF FD FE FF
	sbc $FFFF.w,X		; FD FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DDFFFF.l,X		; FF FF FF DD
	sbc $DDFFDD.l,X		; FF DD FF DD
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FDFFF.l,X		; FF FF DF 3F
	sbc $FFFFDF.l,X		; FF DF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $AEFFFF.l,X		; FF FF FF AE
	sbc $B0EFAE.l,X		; FF AE EF B0
	sbc $F1FFFE.l,X		; FF FE FF F1
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BBFFFF.l,X		; FF FF FF BB
	sbc $BBFFBB.l,X		; FF BB FF BB
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F6FEFF.l,X		; FF FF FE F6
	inc $FEF6.w,X		; FE F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F7F7F.l,X		; FF 7F 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	ora $00001F.l,X		; 1F 1F 00 00
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	ora $00001F.l,X		; 1F 1F 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DDFFFF.l,X		; FF FF FF DD
	sbc $DDFFDD.l,X		; FF DD FF DD
	sbc $DDFFC1.l,X		; FF C1 FF DD
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $BFFFFF.l,X		; FF FF FF BF
	sbc $B1EEFF.l,X		; FF FF EE B1
	sbc $AEFFAE.l,X		; FF AE FF AE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DFFFFF.l,X		; FF FF FF DF
	sbc $D8F7FF.l,X		; FF FF F7 D8
	sbc $D7FFD7.l,X		; FF D7 FF D7
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DFFFFF.l,X		; FF FF FF DF
	sbc $C37DDF.l,X		; FF DF 7D C3
	sbc $5DFF5D.l,X		; FF 5D FF 5D
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $DFFFDF.l,X		; FF DF FF DF
	sbc $5F7FDF.l,X		; FF DF 7F 5F
	adc $1F3F5F.l,X		; 7F 5F 3F 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	sbc $FEFDFD.l,X		; FF FD FD FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFDFD.l,X		; FF FD FD FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc [$F8.b],Y		; F7 F8
	sbc $B77F77.l,X		; FF 77 7F B7
	sbc $D7FFD7.l,X		; FF D7 FF D7
	cmp [$38.b],Y		; D7 38
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	eor $FFE3.w,X		; 5D E3 FF
	eor $DDFF.w,X		; 5D FF DD
	sbc $5DFFDD.l,X		; FF DD FF 5D
	eor $FFE3.w,X		; 5D E3 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FBFFFF.l,X		; FF FF FF FB
	jmp $3BFF.w		; 4C FF 3B
	lda $7BFF78.l,X		; BF 78 FF 7B
	sbc $7CFB7B.l,X		; FF 7B FB 7C
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	lda $BFFF7F.l,X		; BF 7F FF BF
	sbc $FFFF3F.l,X		; FF 3F FF FF
	sbc $7FBFBF.l,X		; FF BF BF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FEF6.w,X		; FE F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FE.b,X		; F6 FE
	inc $FC.b,X		; F6 FC
	pea $F4FC.w		; F4 FC F4
	sed		; F8
	beq  -2.b		; F0 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($F8F8.w,X)		; FC F8 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b		; 05 00
	.db $62, $A5, $97		; 62 A5 97
	ply		; 7A
	.db $62, $00, $76		; 62 00 76
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $6A.b		; 00 6A
	brk $76.b		; 00 76
	brk $01.b		; 00 01
	tsb $00.b		; 04 00
	brk $92.b		; 00 92
	brk $76.b		; 00 76
	brk $02.b		; 00 02
	tsb $00.b		; 04 00
	brk $9A.b		; 00 9A
	brk $76.b		; 00 76
	brk $03.b		; 00 03
	tsb $00.b		; 04 00
	brk $A2.b		; 00 A2
	brk $76.b		; 00 76
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $3C.b		; 00 3C
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
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
	brk $70.b		; 00 70
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	brk $8E.b		; 00 8E
	adc ($76.b),Y		; 71 76
	tya		; 98
	sta ($00.b)		; 92 00
	sta ($00.b),Y		; 91 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	txs		; 9A
	brk $91.b		; 00 91
	brk $01.b		; 00 01
	tsb $00.b		; 04 00
	brk $A2.b		; 00 A2
	brk $91.b		; 00 91
	brk $02.b		; 00 02
	tsb $00.b		; 04 00
	brk $8C.b		; 00 8C
	brk $89.b		; 00 89
	brk $03.b		; 00 03
	tsb $00.b		; 04 00
	brk $92.b		; 00 92
	brk $79.b		; 00 79
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	brk $9E.b		; 00 9E
	brk $71.b		; 00 71
	brk $01.b		; 00 01
	mvp $00,$00		; 44 00 00
	stx $00.b,Y		; 96 00
	adc ($00.b),Y		; 71 00
	ora $04.b		; 05 04
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $1C.b		; 00 1C
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $70.b		; 00 70
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
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	brk $94.b		; 00 94
	rtl		; 6B

	phb		; 8B
	sta ($5A.b),Y		; 91 5A
	brk $81.b		; 00 81
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $5A.b		; 00 5A
	brk $90.b		; 00 90
	brk $01.b		; 00 01
	tsb $00.b		; 04 00
	brk $62.b		; 00 62
	brk $82.b		; 00 82
	brk $02.b		; 00 02
	tsb $00.b		; 04 00
	brk $62.b		; 00 62
	brk $8F.b		; 00 8F
	brk $03.b		; 00 03
	tsb $00.b		; 04 00
	brk $6A.b		; 00 6A
	brk $83.b		; 00 83
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	brk $6A.b		; 00 6A
	brk $8E.b		; 00 8E
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FE.b		; 00 FE
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	ora $03FD.w,X		; 1D FD 03
	brk $00.b		; 00 00
	sbc $00FF.w,X		; FD FF 00
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	brk $FD.b		; 00 FD
	sbc $000401.l,X		; FF 01 04 00
	brk $10.b		; 00 10
	brk $FD.b		; 00 FD
	sbc $000402.l,X		; FF 02 04 00
	brk $19.b		; 00 19
	brk $FD.b		; 00 FD
	sbc $000403.l,X		; FF 03 04 00
	brk $F8.b		; 00 F8
	brk $CC.b		; 00 CC
	brk $CD.b		; 00 CD
	brk $F9.b		; 00 F9
	brk $CD.b		; 00 CD
	brk $CD.b		; 00 CD
	brk $F9.b		; 00 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	brk $C0.b		; 00 C0
	brk $83.b		; 00 83
	brk $86.b		; 00 86
	brk $83.b		; 00 83
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $9B.b		; 00 9B
	brk $DE.b		; 00 DE
	brk $DC.b		; 00 DC
	brk $DE.b		; 00 DE
	brk $DB.b		; 00 DB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $D8.b		; 00 D8
	brk $F8.b		; 00 F8
	brk $C0.b		; 00 C0
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	pld		; 2B
	sbc $0003.w,X		; FD 03 00
	brk $FD.b		; 00 FD
	sbc $000400.l,X		; FF 00 04 00
	brk $08.b		; 00 08
	brk $FD.b		; 00 FD
	sbc $000401.l,X		; FF 01 04 00
	brk $10.b		; 00 10
	brk $FD.b		; 00 FD
	sbc $000402.l,X		; FF 02 04 00
	brk $19.b		; 00 19
	brk $FD.b		; 00 FD
	sbc $000403.l,X		; FF 03 04 00
	brk $21.b		; 00 21
	brk $FD.b		; 00 FD
	sbc $000404.l,X		; FF 04 04 00
	brk $29.b		; 00 29
	brk $FD.b		; 00 FD
	sbc $000405.l,X		; FF 05 04 00
	brk $FD.b		; 00 FD
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $31.b		; 00 31
	brk $31.b		; 00 31
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
	brk $E7.b		; 00 E7
	brk $B7.b		; 00 B7
	brk $B6.b		; 00 B6
	brk $B6.b		; 00 B6
	brk $B6.b		; 00 B6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CE.b		; 00 CE
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	brk $63.b		; 00 63
	brk $F7.b		; 00 F7
	brk $63.b		; 00 63
	brk $63.b		; 00 63
	brk $63.b		; 00 63
	brk $31.b		; 00 31
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $18.b		; 00 18
	brk $99.b		; 00 99
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $99.b		; 00 99
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	ora [$FD.b],Y		; 17 FD
	ora $00.b,S		; 03 00
	brk $FD.b		; 00 FD
	sbc $000400.l,X		; FF 00 04 00
	brk $08.b		; 00 08
	brk $FD.b		; 00 FD
	sbc $000401.l,X		; FF 01 04 00
	brk $10.b		; 00 10
	brk $FD.b		; 00 FD
	sbc $000402.l,X		; FF 02 04 00
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $FD.b		; 00 FD
	brk $CD.b		; 00 CD
	brk $CD.b		; 00 CD
	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	brk $B7.b		; 00 B7
	brk $B6.b		; 00 B6
	brk $B6.b		; 00 B6
	brk $E6.b		; 00 E6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DE.b		; 00 DE
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $01.b		; 00 01
	and $FD.b		; 25 FD
	ora $1E.b		; 05 1E
	brk $FD.b		; 00 FD
	sbc $000400.l,X		; FF 00 04 00
	brk $16.b		; 00 16
	brk $FD.b		; 00 FD
	sbc $000401.l,X		; FF 01 04 00
	brk $0E.b		; 00 0E
	brk $FD.b		; 00 FD
	sbc $000402.l,X		; FF 02 04 00
	brk $06.b		; 00 06
	brk $FF.b		; 00 FF
	sbc $000403.l,X		; FF 03 04 00
	brk $FE.b		; 00 FE
	sbc $04FFFD.l,X		; FF FD FF 04
	tsb $00.b		; 04 00
	brk $76.b		; 00 76
	brk $C6.b		; 00 C6
	brk $EF.b		; 00 EF
	brk $C6.b		; 00 C6
	brk $C6.b		; 00 C6
	brk $C6.b		; 00 C6
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $9D.b		; 00 9D
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $F7.b		; 00 F7
	brk $86.b		; 00 86
	brk $E6.b		; 00 E6
	brk $36.b		; 00 36
	brk $E6.b		; 00 E6
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
	brk $6D.b		; 00 6D
	brk $6C.b		; 00 6C
	brk $6C.b		; 00 6C
	brk $79.b		; 00 79
	brk $60.b		; 00 60
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
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $33.b		; 00 33
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	bit $FD.b,X		; 34 FD
	ora $00.b,S		; 03 00
	brk $FD.b		; 00 FD
	sbc $000400.l,X		; FF 00 04 00
	brk $08.b		; 00 08
	brk $FD.b		; 00 FD
	sbc $000401.l,X		; FF 01 04 00
	brk $10.b		; 00 10
	brk $FD.b		; 00 FD
	sbc $000402.l,X		; FF 02 04 00
	brk $18.b		; 00 18
	brk $FD.b		; 00 FD
	sbc $000403.l,X		; FF 03 04 00
	brk $20.b		; 00 20
	brk $FD.b		; 00 FD
	sbc $000404.l,X		; FF 04 04 00
	brk $28.b		; 00 28
	brk $FD.b		; 00 FD
	sbc $000405.l,X		; FF 05 04 00
	brk $30.b		; 00 30
	brk $FD.b		; 00 FD
	sbc $000406.l,X		; FF 06 04 00
	brk $F0.b		; 00 F0
	brk $D8.b		; 00 D8
	brk $CC.b		; 00 CC
	brk $CD.b		; 00 CD
	brk $CD.b		; 00 CD
	brk $D9.b		; 00 D9
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
	brk $E6.b		; 00 E6
	brk $B3.b		; 00 B3
	brk $B3.b		; 00 B3
	brk $B1.b		; 00 B1
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	brk $F3.b		; 00 F3
	brk $F3.b		; 00 F3
	brk $E3.b		; 00 E3
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	brk $6C.b		; 00 6C
	brk $67.b		; 00 67
	brk $61.b		; 00 61
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $BC.b		; 00 BC
	brk $36.b		; 00 36
	brk $36.b		; 00 36
	brk $B6.b		; 00 B6
	brk $36.b		; 00 36
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	brk $06.b		; 00 06
	brk $EF.b		; 00 EF
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $66.b		; 00 66
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	brk $30.b		; 00 30
	brk $78.b		; 00 78
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $18.b		; 00 18
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
	bra  36.b		; 80 24
	brk $2D.b		; 00 2D
	lda $81.b		; A5 81
	sta $81002B.l,X		; 9F 2B 00 81
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $3B.b		; 00 3B
	brk $81.b		; 00 81
	brk $02.b		; 00 02
	tsb $00.b		; 04 00
	brk $4B.b		; 00 4B
	brk $81.b		; 00 81
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	brk $5B.b		; 00 5B
	brk $81.b		; 00 81
	brk $06.b		; 00 06
	tsb $00.b		; 04 00
	brk $83.b		; 00 83
	brk $81.b		; 00 81
	brk $08.b		; 00 08
	tsb $00.b		; 04 00
	brk $93.b		; 00 93
	brk $81.b		; 00 81
	brk $0A.b		; 00 0A
	tsb $00.b		; 04 00
	brk $A3.b		; 00 A3
	brk $81.b		; 00 81
	brk $0C.b		; 00 0C
	tsb $00.b		; 04 00
	brk $78.b		; 00 78
	brk $91.b		; 00 91
	brk $0E.b		; 00 0E
	tsb $00.b		; 04 00
	brk $88.b		; 00 88
	brk $91.b		; 00 91
	brk $20.b		; 00 20
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $CC.b		; 00 CC
	brk $C1.b		; 00 C1
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $C0.b		; 00 C0
	brk $E7.b		; 00 E7
	brk $CD.b		; 00 CD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $B6.b		; 00 B6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	brk $B6.b		; 00 B6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $D8.b		; 00 D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
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
	brk $03.b		; 00 03
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $CC.b		; 00 CC
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	brk $CC.b		; 00 CC
	brk $67.b		; 00 67
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BE.b		; 00 BE
	brk $30.b		; 00 30
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $C1.b		; 00 C1
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B6.b		; 00 B6
	brk $B6.b		; 00 B6
	brk $B6.b		; 00 B6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D9.b		; 00 D9
	brk $D8.b		; 00 D8
	brk $78.b		; 00 78
	brk $18.b		; 00 18
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	brk $03.b		; 00 03
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F8.b		; 00 F8
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $F8.b		; 00 F8
	brk $C0.b		; 00 C0
	brk $C1.b		; 00 C1
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
	brk $E6.b		; 00 E6
	brk $36.b		; 00 36
	brk $F6.b		; 00 F6
	brk $B6.b		; 00 B6
	brk $F3.b		; 00 F3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	brk $D8.b		; 00 D8
	brk $CE.b		; 00 CE
	brk $C3.b		; 00 C3
	brk $DE.b		; 00 DE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $6C.b		; 00 6C
	brk $7C.b		; 00 7C
	brk $60.b		; 00 60
	brk $38.b		; 00 38
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
	bra  12.b		; 80 0C
	brk $03.b		; 00 03
	and #$FB.b		; 29 FB
	ora $01.b,S		; 03 01
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $11.b		; 00 11
	brk $FB.b		; 00 FB
	sbc $000002.l,X		; FF 02 00 00
	brk $21.b		; 00 21
	brk $FB.b		; 00 FB
	sbc $000004.l,X		; FF 04 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $71.b		; 00 71
	adc ($C8.b),Y		; 71 C8
	iny		; C8
	cpx #$E0.b		; E0 E0
	bvs 112.b		; 70 70
	sec		; 38
	sec		; 38
	tya		; 98
	tya		; 98
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc ($71.b),Y		; 71 71
	iny		; C8
	iny		; C8
	cpx #$E0.b		; E0 E0
	bvs 112.b		; 70 70
	sec		; 38
	sec		; 38
	tya		; 98
	tya		; 98
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	sbc $E3.b,S		; E3 E3
	dec $C6.b		; C6 C6
	dec $C6.b		; C6 C6
	cmp [$C7.b]		; C7 C7
	dec $C6.b		; C6 C6
	dec $C6.b		; C6 C6
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	sbc $E3.b,S		; E3 E3
	dec $C6.b		; C6 C6
	dec $C6.b		; C6 C6
	cmp [$C7.b]		; C7 C7
	dec $C6.b		; C6 C6
	dec $C6.b		; C6 C6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dec $C6.b		; C6 C6
	adc [$67.b]		; 67 67
	ror $66.b		; 66 66
	inc $E6.b		; E6 E6
	asl $06.b		; 06 06
	rol $26.b		; 26 26
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dec $C6.b		; C6 C6
	adc [$67.b]		; 67 67
	ror $66.b		; 66 66
	inc $E6.b		; E6 E6
	asl $06.b		; 06 06
	rol $26.b		; 26 26
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $1919CF.l		; CF CF 19 19
	ora $1F19.w,Y		; 19 19 1F
	ora $181818.l,X		; 1F 18 18 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $1919CF.l		; CF CF 19 19
	ora $1F19.w,Y		; 19 19 1F
	ora $181818.l,X		; 1F 18 18 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $99990F.l		; 0F 0F 99 99
	sta $9999.w,Y		; 99 99 99
	sta $1919.w,Y		; 99 19 19
	sta $0099.w,Y		; 99 99 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $999999.l		; 0F 99 99 99
	sta $9999.w,Y		; 99 99 99
	ora $9919.w,Y		; 19 19 99
	sta $0000.w,Y		; 99 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $63.b,S		; 63 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $63.b,S		; 63 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dec $C6.b		; C6 C6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dec $C6.b		; C6 C6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b,S		; 03 80
	tsb $0100.w		; 0C 00 01
	jsl $0103FD.l		; 22 FD 03 01
	brk $FD.b		; 00 FD
	sbc $000000.l,X		; FF 00 00 00
	brk $11.b		; 00 11
	brk $FD.b		; 00 FD
	sbc $000002.l,X		; FF 02 00 00
	brk $21.b		; 00 21
	brk $FD.b		; 00 FD
	sbc $000004.l,X		; FF 04 00 00
	brk $FF.b		; 00 FF
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $C7.b		; 00 C7
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $C7.b		; 00 C7
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $C7.b		; 00 C7
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $CC.b		; 00 CC
	brk $C7.b		; 00 C7
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  20.b		; 80 14
	brk $D4.b		; 00 D4
	plp		; 28
	cpy $D408.w		; CC 08 D4
	sbc $00FFCC.l,X		; FF CC FF 00
	php		; 08
	brk $00.b		; 00 00
	cpx $FF.b		; E4 FF
	cpy $02FF.w		; CC FF 02
	php		; 08
	brk $00.b		; 00 00
	pea $CCFF.w		; F4 FF CC
	sbc $000802.l,X		; FF 02 08 00
	brk $19.b		; 00 19
	brk $CC.b		; 00 CC
	sbc $004800.l,X		; FF 00 48 00
	brk $09.b		; 00 09
	brk $CC.b		; 00 CC
	sbc $000802.l,X		; FF 02 08 00
	brk $F9.b		; 00 F9
	sbc $02FFCC.l,X		; FF CC FF 02
	php		; 08
	brk $00.b		; 00 00
	pei ($FF.b)		; D4 FF
	jmp.w [$04FF]		; DC FF 04
	php		; 08
	brk $00.b		; 00 00
	and [$00.b]		; 27 00
	jmp.w [$04FF]		; DC FF 04
	php		; 08
	brk $00.b		; 00 00
	pei ($FF.b)		; D4 FF
	cpx $04FF.w		; EC FF 04
	php		; 08
	brk $00.b		; 00 00
	and [$00.b]		; 27 00
	cpx $04FF.w		; EC FF 04
	php		; 08
	brk $00.b		; 00 00
	pei ($FF.b)		; D4 FF
	jsr ($06FF.w,X)		; FC FF 06
	php		; 08
	brk $00.b		; 00 00
	cpx $FF.b		; E4 FF
	jsr ($08FF.w,X)		; FC FF 08
	php		; 08
	brk $00.b		; 00 00
	pea $FCFF.w		; F4 FF FC
	sbc $000808.l,X		; FF 08 08 00
	brk $19.b		; 00 19
	brk $FC.b		; 00 FC
	sbc $004806.l,X		; FF 06 48 00
	brk $09.b		; 00 09
	brk $FC.b		; 00 FC
	sbc $000808.l,X		; FF 08 08 00
	brk $F9.b		; 00 F9
	sbc $08FFFC.l,X		; FF FC FF 08
	php		; 08
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b,X		; 15 80
	mvn $1B,$00		; 54 00 1B
	sbc [$16.b]		; E7 16
	and ($1B.b),Y		; 31 1B
	brk $1B.b		; 00 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	brk $2B.b		; 00 2B
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $2B.b		; 00 2B
	brk $1B.b		; 00 1B
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $3B.b		; 00 3B
	brk $1B.b		; 00 1B
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $4B.b		; 00 4B
	brk $1F.b		; 00 1F
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $4B.b		; 00 4B
	brk $2F.b		; 00 2F
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $5B.b		; 00 5B
	brk $1B.b		; 00 1B
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $5B.b		; 00 5B
	brk $2B.b		; 00 2B
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $6B.b		; 00 6B
	brk $1C.b		; 00 1C
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $7B.b		; 00 7B
	brk $1B.b		; 00 1B
	brk $22.b		; 00 22
	brk $00.b		; 00 00
	brk $7B.b		; 00 7B
	brk $2B.b		; 00 2B
	brk $24.b		; 00 24
	brk $00.b		; 00 00
	brk $8B.b		; 00 8B
	brk $19.b		; 00 19
	brk $26.b		; 00 26
	brk $00.b		; 00 00
	brk $8B.b		; 00 8B
	brk $29.b		; 00 29
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	brk $9B.b		; 00 9B
	brk $1A.b		; 00 1A
	brk $2A.b		; 00 2A
	brk $00.b		; 00 00
	brk $9B.b		; 00 9B
	brk $2A.b		; 00 2A
	brk $2C.b		; 00 2C
	brk $00.b		; 00 00
	brk $AB.b		; 00 AB
	brk $1A.b		; 00 1A
	brk $2E.b		; 00 2E
	brk $00.b		; 00 00
	brk $AB.b		; 00 AB
	brk $2A.b		; 00 2A
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $BB.b		; 00 BB
	brk $1F.b		; 00 1F
	brk $42.b		; 00 42
	brk $00.b		; 00 00
	brk $CB.b		; 00 CB
	brk $1F.b		; 00 1F
	brk $44.b		; 00 44
	brk $00.b		; 00 00
	brk $DB.b		; 00 DB
	brk $16.b		; 00 16
	brk $46.b		; 00 46
	brk $00.b		; 00 00
	brk $DB.b		; 00 DB
	brk $26.b		; 00 26
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $07.b,S		; 03 07
	ora [$06.b]		; 07 06
	asl $0D.b		; 06 0D
	tsb $1C1D.w		; 0C 1D 1C
	tas		; 1B
	clc		; 18
	and [$30.b],Y		; 37 30
	brk $03.b		; 00 03
	ora $05.b,S		; 03 05
	ora [$0B.b]		; 07 0B
	asl $0D.b		; 06 0D
	tsb $1C1E.w		; 0C 1E 1C
	rol A		; 2A
	clc		; 18
	bit $30.b,X		; 34 30
	cli		; 58
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	beq  48.b		; F0 30
	ldy $30.b,X		; B4 30
	ldy $6B20.w		; AC 20 6B
	adc $67.b,S		; 63 67
	adc [$00.b]		; 67 00
	brk $00.b		; 00 00
	bcs  48.b		; B0 30
	iny		; C8
	bmi  56.b		; 30 38
	bmi 120.b		; 30 78
	jsr $6371.w		; 20 71 63
	lda $67.b		; A5 67
	xba		; EB
	adc ($73.b,S),Y		; 73 73
	adc $63.b,S		; 63 63
	ror $66.b		; 66 66
	bit $193C.w,X		; 3C 3C 19
	clc		; 18
	ora $00.b,S		; 03 00
	asl $0000.w		; 0E 00 00
	brk $73.b		; 00 73
	lda ($63.b,X)		; A1 63
	ldx $66.b		; A6 66
	lda $5A3C.w		; AD 3C 5A
	clc		; 18
	bit $00.b		; 24 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	cmp ($E3.b,X)		; C1 E3
	sbc $13.b,S		; E3 13
	ora ($00.b,S),Y		; 13 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($C1.b,X)		; C1 C1
	adc $E3.b,S		; 63 E3
	sbc $13.b,X		; F5 13
	lda [$00.b],Y		; B7 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	sty $0C0C.w		; 8C 0C 0C
	tad		; 5B
	clc		; 18
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora ($02.b,X)		; 01 02
	brk $01.b		; 00 01
	brk $8C.b		; 00 8C
	sty $0C96.w		; 8C 96 0C
	stz $AC18.w,X		; 9E 18 AC
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	ldy #$80.b		; A0 80
	rti		; 40

	brk $33.b		; 00 33
	and ($33.b,S),Y		; 33 33
	and ($3B.b,S),Y		; 33 3B
	and ($00.b,S),Y		; 33 00
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	rti		; 40

	brk $B3.b		; 00 B3
	and ($5D.b,S),Y		; 33 5D
	and ($7F.b,S),Y		; 33 7F
	and ($66.b,S),Y		; 33 66
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $3E1C.w		; 1C 1C 3E
	rol $6666.w,X		; 3E 66 66
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	trb $3EAA.w		; 1C AA 3E
	sbc $F766.w,X		; FD 66 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	tsb $3F0C.w		; 0C 0C 3F
	and $6F7171.l,X		; 3F 71 71 6F
	adc $DB.b,S		; 63 DB
	cmp $D7.b,S		; C3 D7
	cmp [$CF.b]		; C7 CF
	cmp $0C0C00.l		; CF 00 0C 0C
	and [$3F.b],Y		; 37 3F
	eor $63BB71.l,X		; 5F 71 BB 63
	sbc ($C3.b),Y		; F1 C3
	adc [$C7.b]		; 67 C7
	dex		; CA
	cmp $000076.l		; CF 76 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($F0.b,S),Y		; F3 F0
	asl $00.b		; 06 00
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	pla		; 68
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
	asl $06.b		; 06 06
	ora $38391F.l,X		; 1F 1F 39 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $9B.b		; 06 9B
	ora $D838AB.l,X		; 1F AB 38 D8
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	asl $7F0E.w		; 0E 0E 7F
	adc $8DCCCC.l,X		; 7F CC CC 8D
	sty $0300.w		; 8C 00 03
	ora $07.b,S		; 03 07
	asl $0B.b		; 06 0B
	asl $0D.b		; 06 0D
	asl $7F75.w		; 0E 75 7F
	sbc $8CFFCC.l,X		; FF CC FF 8C
	dec $0080.w,X		; DE 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $30.b,X		; 36 30
	bmi  48.b		; 30 30
	trb $1F1C.w		; 1C 1C 1F
	ora $0D0707.l,X		; 1F 07 07 0D
	ora $1919.w		; 0D 19 19
	and ($31.b),Y		; 31 31
	bmi 104.b		; 30 68
	bmi 125.b		; 30 7D
	trb $1F3B.w		; 1C 3B 1F
	and $0D0B07.l		; 2F 07 0B 0D
	ora $19.b,X		; 15 19
	and #$31.b		; 29 31
	eor ($D6.b,S),Y		; 53 D6
	dec $CD.b		; C6 CD
	cpy $ECED.w		; CC ED EC
	inc $B7EC.w,X		; FE EC B7
	sta [$BB.b]		; 87 BB
	sta $A0.b,S		; 83 A0
	bra  96.b		; 80 60
	brk $C6.b		; 00 C6
	adc $EC76CC.l		; 6F CC 76 EC
	jmp $8785EC.l		; 5C EC 85 87
	phk		; 4B
	sta $44.b,S		; 83 44
	bra  67.b		; 80 43
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $36.b,X		; F6 36
	ldx $36.b,Y		; B6 36
	adc $E66C.w		; 6D 6C E6
	inc $FF.b		; E6 FF
	sbc [$39.b]		; E7 39
	ora ($F0.b,X)		; 01 F0
	brk $C0.b		; 00 C0
	brk $36.b		; 00 36
	tas		; 1B
	rol $7F.b,X		; 36 7F
	jmp ($E6BE.w)		; 6C BE E6
	adc $01C3E7.l		; 6F E7 C3 01
	dec $00.b		; C6 00
	ora ($00.b,X)		; 01 00
	brk $DB.b		; 00 DB
	clc		; 18
	ldx $30.b,Y		; B6 30
	ldx $30.b,Y		; B6 30
	bvs 112.b		; 70 70
	jmp.w [$8CDC]		; DC DC 8C
	sty $0077.w		; 8C 77 00
	.db $62, $00, $18		; 62 00 18
	bit $5830.w,X		; 3C 30 58
	bmi 120.b		; 30 78
	bvs -68.b		; 70 BC
	jmp.w [$8CEE]		; DC EE 8C
	bvc   0.b		; 50 00
	dey		; 88
	brk $00.b		; 00 00
	ror $6666.w		; 6E 66 66
	ror $56.b		; 66 56
	lsr $6C.b		; 46 6C
	jmp ($7C7D.w)		; 6C 7D 7C
	tsa		; 3B
	sec		; 38
	ora [$00.b]		; 07 00
	asl $6600.w		; 0E 00 66
	lda ($66.b,S),Y		; B3 66
	stp		; DB
	lsr $EF.b		; 46 EF
	jmp ($7CD7.w)		; 6C D7 7C
	inc $5438.w		; EE 38 54
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	cmp $F94C.w		; CD 4C F9
	sed		; F8
	cmp ($C2.b)		; D2 C2
	inc $7CE6.w		; EE E6 7C
	jmp ($3839.w,X)		; 7C 39 38
	ora $000C00.l		; 0F 00 0C 00
	jmp $F86E.w		; 4C 6E F8
	ror $E3C2.w,X		; 7E C2 E3
	inc $75.b		; E6 75
	jmp ($38BE.w,X)		; 7C BE 38
	mvn $30,$00		; 54 00 30
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ply		; 7A
	ply		; 7A
	asl $06.b		; 06 06
	asl $360E.w		; 0E 0E 36
	rol $66.b,X		; 36 66
	ror $CD.b		; 66 CD
	cpy $8C8D.w		; CC 8D 8C
	sta $7A98.w,Y		; 99 98 7A
	sta $0E7F06.l,X		; 9F 06 7F 0E
	ora $665536.l,X		; 1F 36 55 66
	sbc $CC.b		; E5 CC
	lsr $8C.b		; 46 8C
	txs		; 9A
	tya		; 98
	ldy $00.b,X		; B4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	and ($6F.b),Y		; 31 6F
	adc ($6F.b,X)		; 61 6F
	adc $7F.b,S		; 63 7F
	adc [$BE.b]		; 67 BE
	rol $18D9.w,X		; 3E D9 18
	sta [$00.b]		; 87 00
	stx $00.b		; 86 00
	and ($F1.b),Y		; 31 F1
	adc ($A1.b,X)		; 61 A1
	adc $A3.b,S		; 63 A3
	adc [$A6.b]		; 67 A6
	rol $185D.w,X		; 3E 5D 18
	rol $00.b		; 26 00
	clc		; 18
	brk $00.b		; 00 00
	lda $9B8C.w		; AD 8C 9B
	tya		; 98
	tad		; 5B
	clc		; 18
	cli		; 58
	clc		; 18
	tyx		; BB
	tsa		; 3B
	dec $801E.w,X		; DE 1E 80
	brk $07.b		; 00 07
	brk $8C.b		; 00 8C
	phx		; DA
	tya		; 98
	jmp ($BC18.w)		; 6C 18 BC
	clc		; 18
	lda $1E5E3B.l,X		; BF 3B 5E 1E
	and #$00.b		; 29 00
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$E0.b		; C0 E0
	brk $C0.b		; 00 C0
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	ror $E67E.w,X		; 7E 7E E6
	inc $DE.b		; E6 DE
	dec $00.b		; C6 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	ror $BF7E.w		; 6E 7E BF
	inc $7F.b		; E6 7F
	dec $E5.b		; C6 E5
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	asl $06.b		; 06 06
	ora [$07.b]		; 07 07
	and $01003F.l,X		; 3F 3F 00 01
	ora ($02.b,X)		; 01 02
	ora ($03.b,X)		; 01 03
	ora $05.b,S		; 03 05
	ora $06.b,S		; 03 06
	asl $0B.b		; 06 0B
	ora [$0E.b]		; 07 0E
	and $00007F.l,X		; 3F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	eor $43.b,S		; 43 43
	sta $83.b,S		; 83 83
	stx $86.b,Y		; 96 86
	ror $06.b		; 66 06
	adc $0D0C.w		; 6D 0C 0D
	tsb $0100.w		; 0C 00 01
	ora ($42.b,X)		; 01 42
	eor $E5.b,S		; 43 E5
	sta $C7.b,S		; 83 C7
	stx $CB.b		; 86 CB
	asl $8F.b		; 06 8F
	tsb $0C96.w		; 0C 96 0C
	inc $0000.w,X		; FE 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	rts		; 60

	brk $D0.b		; 00 D0
	bpl -80.b		; 10 B0
	bmi -124.b		; 30 84
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	bra  16.b		; 80 10
	sec		; 38
	bmi 104.b		; 30 68
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	ror $1C60.w		; 6E 60 1C
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	cmp ($00.b),Y		; D1 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $63.b		; 00 63
	ora $06.b,S		; 03 06
	asl $0C.b		; 06 0C
	tsb $1818.w		; 0C 18 18
	ora $0F19.w,Y		; 19 19 0F
	ora $000000.l		; 0F 00 00 00
	sta $03.b,S		; 83 03
	ora $06.b		; 05 06
	asl $140C.w		; 0E 0C 14
	clc		; 18
	and #$19.b		; 29 19
	pld		; 2B
	ora $0F0016.l		; 0F 16 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	cmp ($C1.b,X)		; C1 C1
	sbc ($F3.b,S),Y		; F3 F3
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ora ($C3.b,X)		; 01 C3
	cmp ($7B.b,X)		; C1 7B
	sbc ($FD.b,S),Y		; F3 FD
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	bcs -128.b		; B0 80
	bcs -128.b		; B0 80
	ldy #$80.b		; A0 80
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	brk $C0.b		; 00 C0
	cpy #$60.b		; C0 60
	cpy #$E0.b		; C0 E0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra  64.b		; 80 40
	brk $E0.b		; 00 E0
	cpx #$D0.b		; E0 D0
	adc #$60.b		; 69 60
	pla		; 68
	rts		; 60

	cld		; D8
	cpy #$D8.b		; C0 D8
	cpy #$90.b		; C0 90
	bra  48.b		; 80 30
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	bvc  96.b		; 50 60
	bvc -64.b		; 50 C0
	rts		; 60

	cpy #$A0.b		; C0 A0
	bra  64.b		; 80 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $0E.b		; 00 0E
	asl $1F1F.w		; 0E 1F 1F
	adc ($73.b,S),Y		; 73 73
	adc $FF61.w		; 6D 61 FF
	cmp $F2.b,S		; C3 F2
	rep #$C1		; C2 C1
	cpy #$71.b		; C0 71
	bvs  14.b		; 70 0E
	ora $1F.b		; 05 1F
	rol $3B73.w		; 2E 73 3B
	adc ($F3.b,X)		; 61 F3
	cmp $42.b,S		; C3 42
	rep #$C3		; C2 C3
	cpy #$E0.b		; C0 E0
	bvs -96.b		; 70 A0
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	sta ($81.b,X)		; 81 81
	brk $00.b		; 00 00
	jsr $C000.w		; 20 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cop $01.b		; 02 01
	cmp $81.b,S		; C3 81
	sta $00.b,S		; 83 00
	sta ($00.b,X)		; 81 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BD.b		; 00 BD
	sty $BD.b		; 84 BD
	sty $9C9C.w		; 8C 9C 9C
	xce		; FB
	xce		; FB
	adc [$63.b]		; 67 63
	trb $1800.w		; 1C 00 18
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	dec $8C.b		; C6 8C
	dec $FB9C.w		; CE 9C FB
	xce		; FB
	adc [$63.b],Y		; 77 63
	cld		; D8
	brk $63.b		; 00 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	jsr $E000.w		; 20 00 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	rti		; 40

	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0D0C.w		; 0C 0C 0D
	tsb $1C1D.w		; 0C 1D 1C
	tas		; 1B
	clc		; 18
	tsa		; 3B
	sec		; 38
	rol $30.b,X		; 36 30
	asl $10.b,X		; 16 10
	tsb $0C00.w		; 0C 00 0C
	ora $1C1E0C.l,X		; 1F 0C 1E 1C
	rol A		; 2A
	clc		; 18
	bit $5438.w,X		; 3C 38 54
	bmi 120.b		; 30 78
	bpl  56.b		; 10 38
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	xce		; FB
	sed		; F8
	xce		; FB
	sed		; F8
	rol $30.b,X		; 36 30
	ldx $30.b,Y		; B6 30
	adc $6561.w		; 6D 61 65
	adc ($7F.b,X)		; 61 7F
	adc $F87171.l,X		; 7F 71 71 F8
	tsb $FCF8.w		; 0C F8 FC
	bmi -39.b		; 30 D9
	bmi 121.b		; 30 79
	adc ($B2.b,X)		; 61 B2
	adc ($BB.b,X)		; 61 BB
	adc $EB71B3.l,X		; 7F B3 71 EB
	adc $63.b,S		; 63 63
	adc [$67.b]		; 67 67
	dec $C6.b,X		; D6 C6
	cmp $ADCC.w		; CD CC AD
	sty $ACAC.w		; 8C AC AC
	sbc [$E7.b]		; E7 E7
	dey		; 88
	bra  99.b		; 80 63
	lda $67.b,X		; B5 67
	xce		; FB
	dec $6F.b		; C6 6F
	cpy $8CF6.w		; CC F6 8C
	dec $F7AC.w,X		; DE AC F7
	sbc [$59.b]		; E7 59
	bra 103.b		; 80 67
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($13.b,S),Y		; 13 13
	sbc [$37.b],Y		; F7 37
	lda ($32.b)		; B2 32
	ror $76.b,X		; 76 76
	inc $F6.b,X		; F6 F6
	lda $6DA4.w		; AD A4 6D
	stz $E9.b		; 64 E9
	cpx #$13.b		; E0 13
	sbc $1F37.w,X		; FD 37 1F
	and ($7F.b)		; 32 7F
	ror $AF.b,X		; 76 AF
	inc $6D.b,X		; F6 6D
	ldy $F6.b		; A4 F6
	stz $F6.b		; 64 F6
	cpx #$F4.b		; E0 F4
	bcs -80.b		; B0 B0
	bmi  48.b		; 30 30
	bcs  48.b		; B0 30
	pla		; 68
	rts		; 60

	stz $64.b		; 64 64
	sei		; 78
	sei		; 78
	bcs  48.b		; B0 30
	tsb $B000.w		; 0C 00 B0
	pla		; 68
	bmi  -8.b		; 30 F8
	bmi 108.b		; 30 6C
	rts		; 60

	ldy $64.b,X		; B4 64
	jsr ($AC78.w,X)		; FC 78 AC
	bmi  88.b		; 30 58
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $04.b		; 04 04
	asl $070E.w		; 0E 0E 07
	ora [$03.b]		; 07 03
	ora $02.b,S		; 03 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	asl $050E.w		; 0E 0E 05
	ora [$0E.b]		; 07 0E
	ora $01.b,S		; 03 01
	brk $01.b		; 00 01
	sei		; 78
	sec		; 38
	clc		; 18
	clc		; 18
	ora $0D0D.w		; 0D 0D 0D
	ora $393D.w		; 0D 3D 39
	stz $70.b,X		; 74 70
	cmp $3CC0.w		; CD C0 3C
	brk $38.b		; 00 38
	bpl  24.b		; 10 18
	and $1C0D.w		; 2D 0D 1C
	ora $3919.w		; 0D 19 39
	bpl 112.b		; 10 70
	lda #$C0.b		; A9 C0
	ldy #$00.b		; A0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $1C.b		; 00 1C
	trb $7E7E.w		; 1C 7E 7E
.ACCU 8
	sep #$E0		; E2 E0
	dec $B9C0.w,X		; DE C0 B9
	sta ($B1.b,X)		; 81 B1
	sta ($CD.b,X)		; 81 CD
	cmp $1800.w		; CD 00 18
	trb $7E32.w		; 1C 32 7E
	sbc $5DE0.w,X		; FD E0 5D
	cpy #$A1.b		; C0 A1
	sta ($C0.b,X)		; 81 C0
	sta ($CF.b,X)		; 81 CF
	cmp $00FB.w		; CD FB 00
	brk $19.b		; 00 19
	ora $7F7F.w,Y		; 19 7F 7F
.ACCU 8
	sep #$E2		; E2 E2
	dec $B6C6.w,X		; DE C6 B6
	stx $AD.b		; 86 AD
	sty $9CDD.w		; 8C DD 9C
	brk $18.b		; 00 18
	ora $7F34.w,Y		; 19 34 7F
	lda $C677E2.l,X		; BF E2 77 C6
	sbc [$86.b]		; E7 86
	jmp $9E8C.w		; 4C 8C 9E
	stz $00B8.w		; 9C B8 00
	brk $FF.b		; 00 FF
	sbc $393F3F.l,X		; FF 3F 3F 39
	and $30B6.w,Y		; 39 B6 30
	inc $70.b,X		; F6 70
	jmp ($6C60.w)		; 6C 60 6C
	rts		; 60

	brk $F7.b		; 00 F7
	sbc $DF3FE2.l,X		; FF E2 3F DF
	and $3056.w,Y		; 39 56 30
	adc $2870.w,Y		; 79 70 28
	rts		; 60

	bcs  96.b		; B0 60
	bne   0.b		; D0 00
	brk $0E.b		; 00 0E
	asl $9F9F.w		; 0E 9F 9F
	and ($33.b,S),Y		; 33 33
	ldx $26.b		; A6 26
	jmp ($617C.w,X)		; 7C 7C 61
	adc ($7B.b,X)		; 61 7B
	adc ($00.b,S),Y		; 73 00
	asl $9D0E.w		; 0E 0E 9D
	sta $DA337E.l,X		; 9F 7E 33 DA
	rol $75.b		; 26 75
	jmp ($61BA.w,X)		; 7C BA 61
	sbc $B673.w,X		; FD 73 B6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora $05.b,S		; 03 05
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	bne -64.b		; D0 C0
	cld		; D8
	cpy #$D0.b		; C0 D0
	cpy #$B0.b		; C0 B0
	bra -80.b		; 80 B0
	bra   0.b		; 80 00
	cpy #$C0.b		; C0 C0
	rts		; 60

	cpx #$D0.b		; E0 D0
	cpy #$E0.b		; C0 E0
	cpy #$A0.b		; C0 A0
	cpy #$A0.b		; C0 A0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	lsr $06.b		; 46 06
	dec $8D0E.w		; CE 0E 8D
	tsb $0003.w		; 0C 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	asl $09.b		; 06 09
	asl $0C1D.w		; 0E 1D 0C
	asl $0C00.w,X		; 1E 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($33FC.w,X)		; FC FC 33
	bmi  30.b		; 30 1E
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	adc ($30.b),Y		; 71 30
	inx		; E8
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plx		; FA
	sed		; F8
	adc [$60.b]		; 67 60
	asl $1800.w,X		; 1E 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $60.b,X		; F5 60
	bne   0.b		; D0 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cld		; D8
	cpy #$58.b		; C0 58
	rti		; 40

	bmi   0.b		; 30 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$60.b		; C0 60
	rti		; 40

	cpx #$00.b		; E0 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $183E.w,X		; 3E 3E 18
	clc		; 18
	ora [$00.b]		; 07 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $185D.w,X		; 3E 5D 18
	rol $00.b		; 26 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	dec $06.b		; C6 06
	cmp ($00.b,X)		; C1 00
	ora ($00.b,X)		; 01 00
	ora $05.b,S		; 03 05
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	ora [$8A.b]		; 07 8A
	ora [$8E.b]		; 07 8E
	asl $0F.b		; 06 0F
	brk $06.b		; 00 06
	brk $80.b		; 00 80
	ldy #$80.b		; A0 80
	ldy #$80.b		; A0 80
	rts		; 60

	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	cpy #$80.b		; C0 80
	rti		; 40

	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cop $00.b		; 02 00
	jsr ($0604.w,X)		; FC 04 06
	asl A		; 0A
	jsr ($06FF.w,X)		; FC FF 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	php		; 08
	trb $3E1C.w		; 1C 1C 3E
	rol $7F7F.w,X		; 3E 7F 7F
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	clc		; 18
	trb $3E3C.w		; 1C 3C 3E
	ror $FF7F.w,X		; 7E 7F FF
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $0D0604.l,X		; FF 04 06 0D
	sbc $0006FF.l,X		; FF FF 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rts		; 60

	rts		; 60

	bvs 112.b		; 70 70
	jmp ($7878.w,X)		; 7C 78 78
	bvs 112.b		; 70 70
	rts		; 60

	rts		; 60

	rti		; 40

	rti		; 40

	brk $40.b		; 00 40
	cpy #$60.b		; C0 60
	cpx #$70.b		; E0 70
	beq 120.b		; F0 78
	sed		; F8
	bvs -16.b		; 70 F0
	rts		; 60

	cpx #$40.b		; E0 40
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	brk $81.b		; 00 81
	jsr $3CC1.w		; 20 C1 3C
	rol $59.b		; 26 59
	brk $00.b		; 00 00
	sbc [$1C.b]		; E7 1C
	sbc $5EF73D.l		; EF 3D F7 5E
	sta ($20.b,X)		; 81 20
	ora $08CF14.l,X		; 1F 14 CF 08
	asl $FF52.w		; 0E 52 FF
	adc $143D46.l,X		; 7F 46 3D 14
	adc [$04.b],Y		; 77 04
	ora ($FF.b,X)		; 01 FF
	adc $900008.l,X		; 7F 08 00 90
	brk $98.b		; 00 98
	ora ($C3.b,X)		; 01 C3
	brk $C2.b		; 00 C2
	brk $4C.b		; 00 4C
	asl $14.b,X		; 16 14
	eor $14.b,S		; 43 14
	adc [$FF.b],Y		; 77 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $047FFF.l,X		; 7F FF 7F 04
	ora ($FF.b,X)		; 01 FF
	adc $C00080.l,X		; 7F 80 00 C0
	brk $40.b		; 00 40
	ora ($00.b,X)		; 01 00
	brk $E7.b		; 00 E7
	trb $3DEF.w		; 1C EF 3D
	sbc [$5E.b],Y		; F7 5E
	sbc $00187F.l,X		; FF 7F 18 00
	ldy #$56.b		; A0 56
	trb $77.b		; 14 77
	cpx #$01.b		; E0 01
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	tsb $01.b		; 04 01
	sbc $00807F.l,X		; FF 7F 80 00
	cpy #$00.b		; C0 00
	rti		; 40

	ora ($84.b,X)		; 01 84
	bpl  49.b		; 10 31
	lsr $4A.b		; 46 4A
	and #$63.b		; 29 63
	adc ($5A.b,X)		; 61 5A
	rtl		; 6B

	cpy #$01.b		; C0 01
	adc $61.b,S		; 63 61
	pld		; 2B
	ror A		; 6A
	trb $77.b		; 14 77
	cli		; 58
	adc [$9B.b],Y		; 77 9B
	tda		; 7B
	tsb $01.b		; 04 01
	bit $6E.b		; 24 6E
	and ($04.b,X)		; 21 04
	adc $0C.b,S		; 63 0C
	dec $18.b		; C6 18
	php		; 08
	and ($4A.b,X)		; 21 4A
	and #$8C.b		; 29 8C
	and ($CE.b),Y		; 31 CE
	and $4210.w,Y		; 39 10 42
	eor ($4A.b)		; 52 4A
	sty $52.b,X		; 94 52
	sbc [$5E.b],Y		; F7 5E
	and $7B67.w,Y		; 39 67 7B
	adc $FF77BD.l		; 6F BD 77 FF
	adc $000000.l,X		; 7F 00 00 00
	brk $84.b		; 00 84
	bpl  41.b		; 10 29
	and $EF.b		; 25 EF
	and $5294.w,X		; 3D 94 52
	phy		; 5A
	rtl		; 6B

	sbc $00087F.l,X		; FF 7F 08 00
	bpl   0.b		; 10 00
	and [$04.b],Y		; 37 04
	sta $012910.l,X		; 9F 10 29 01
	bpl   2.b		; 10 02
	clc		; 18
	ora $FF.b,S		; 03 FF
	ora $26.b,S		; 03 26
	xce		; FB
	brk $07.b		; 00 07
	asl $04.b		; 06 04
	brk $E1.b		; 00 E1
	bvc  54.b		; 50 36
	phk		; 4B
	rol A		; 2A
	cmp $14.b,S		; C3 14
	tsb $20.b		; 04 20
	and $508B81.l		; 2F 81 8B 50
	eor $C07384.l,X		; 5F 84 73 C0
	.db $82, $92, $49		; 82 92 49
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
	eor #$39.b		; 49 39
	and $32.b,X		; 35 32
	phy		; 5A
	ora ($97.b,X)		; 01 97
	and #$44.b		; 29 44
	stx $A3.b,Y		; 96 A3
	eor ($29.b)		; 52 29
	mvn $8A,$C9		; 54 C9 8A
	adc $42.b,X		; 75 42
	lda $02.b		; A5 02
	nop		; EA
	lda $5A.b		; A5 5A
	lda ($5A.b),Y		; B1 5A
	ldx $AC57.w		; AE 57 AC
	asl $2B.b,X		; 16 2B
	and $9A.b		; 25 9A
	cmp ($03.b),Y		; D1 03
	phk		; 4B
	eor $B2.b,X		; 55 B2
	cmp $B970.w,X		; DD 70 B9
	eor $2E5D.w		; 4D 5D 2E
	bne  52.b		; D0 34
	ldy $5E4E.w,X		; BC 4E 5E
	lda $06EC97.l		; AF 97 EC 06
	phd		; 0B
	ora #$03.b		; 09 03
	jmp $2336.w		; 4C 36 23
	ora $8C.b,X		; 15 8C
	cmp [$64.b]		; C7 64
	and ($59.b)		; 32 59
	pha		; 48
	inc A		; 1A
	adc $B3.b		; 65 B3
	ora $E6AC.w,Y		; 19 AC E6
	tda		; 7B
	eor ($A2.b,X)		; 41 A2
	cmp ($40.b)		; D2 40
	sbc $4D.b,S		; E3 4D
	tay		; A8
	cmp $6B.b,X		; D5 6B
	and $DB.b,X		; 35 DB
	php		; 08
	trb $0948.w		; 1C 48 09
	tas		; 1B
	plp		; 28
	trb $366D.w		; 1C 6D 36
	stp		; DB
	sta $F3D6.w		; 8D D6 F3
	adc $81C0.w,X		; 7D C0 81
	ldy $94.b,X		; B4 94
	sec		; 38
	jmp $23374E.l		; 5C 4E 37 23
	sta $CC.b,X		; 95 CC
	sta ($97.b,X)		; 81 97
	tsa		; 3B
	lda ($D2.b,X)		; A1 D2
	nop		; EA
	adc $BB.b,X		; 75 BB
	ora $E7AE.w,X		; 1D AE E7
	ply		; 7A
	asl $5E.b		; 06 5E
	ora $CD9317.l		; 0F 17 93 CD
	inx		; E8
	sbc $7B.b,X		; F5 7B
	and $08DF.w,X		; 3D DF 08
	inc A		; 1A
	jmp ($9FBE.w,X)		; 7C BE 9F
	adc $F9EBC7.l		; 6F C7 EB F9
	inc $809E.w,X		; FE 9E 80
	ora $1221.w,Y		; 19 21 12
	rol $FB.b		; 26 FB
	brk $0C.b		; 00 0C
	cpy #$04.b		; C0 04
	brk $66.b		; 00 66
	and $9D.b,S		; 23 9D
	sta ($55.b)		; 92 55
	ldy $F0D0.w,X		; BC D0 F0
	and ($0A.b,X)		; 21 0A
	bit $97.b		; 24 97
	ldx $0C12.w		; AE 12 0C
	rts		; 60

	sta $8F.b,S		; 83 8F
	bit $D36E.w		; 2C 6E D3
	sbc $86.b		; E5 86
	jsl $BC8B10.l		; 22 10 8B BC
	lsr $2CB7.w,X		; 5E B7 2C
	tax		; AA
	rol A		; 2A
	jsr $2AC9.w		; 20 C9 2A
	ora [$B0.b],Y		; 17 B0
	cmp $7E42.w,Y		; D9 42 7E
	phy		; 5A
	lda #$E4.b		; A9 E4
	and $64.b,S		; 23 64
	sbc ($89.b),Y		; F1 89
	cmp ($11.b,S),Y		; D3 11
	.db $42, $2C		; 42 2C
	dey		; 88
	sta ($4E.b)		; 92 4E
	cmp $84FC2A.l,X		; DF 2A FC 84
	bit $95.b,X		; 34 95
	php		; 08
	eor ($54.b,X)		; 41 54
	adc $242A.w		; 6D 2A 24
	sta ($CF.b)		; 92 CF
	and $2692.w		; 2D 92 26
	stz $54.b,X		; 74 54
	lsr A		; 4A
	lda $447C.w		; AD 7C 44
	eor $CFB2.w		; 4D B2 CF
	ora [$3E.b],Y		; 17 3E
	eor $8D5897.l,X		; 5F 97 58 8D
	stz $BA.b		; 64 BA
	eor $4F.b		; 45 4F
	bit $D6.b		; 24 D6
	mvn $E8,$74		; 54 74 E8
	sta $2451.w,Y		; 99 51 24
	lda ($5D.b)		; B2 5D
	bit $B3.b,X		; 34 B3
	cmp $2BB2.w,X		; DD B2 2B
	bit $1C5A.w		; 2C 5A 1C
	eor ($00.b,X)		; 41 00
	cop $38.b		; 02 38
	plx		; FA
	sbc $0C7D.w,X		; FD 7D 0C
	sta $7F49.w,X		; 9D 49 7F
	stz $B7.b,X		; 74 B7
	cmp ($D5.b)		; D2 D5
	stz $EF8E.w		; 9C 8E EF
	lda $4992D7.l		; AF D7 92 49
	stz $92.b,X		; 74 92
	phx		; DA
	cld		; D8
	adc ($E1.b,S),Y		; 73 E1
	sta $14.b		; 85 14
	lsr $AD.b,X		; 56 AD
	adc ($B5.b)		; 72 B5
	txs		; 9A
	dec $373E.w,X		; DE 3E 37
	cmp ($EF.b),Y		; D1 EF
	ora $14.b		; 05 14
	lsr $B4.b,X		; 56 B4
	stz $6F6C.w		; 9C 6C 6F
	tda		; 7B
	jsr $3100.w		; 20 00 31
	lda ($B7.b),Y		; B1 B7
	txy		; 9B
	cpy #$00.b		; C0 00
	dec $C6.b		; C6 C6
	dec $006F.w,X		; DE 6F 00
	sty $22.b		; 84 22
	lda $F9.b,X		; B5 F9
	jmp ($2EBD.w,X)		; 7C BD 2E
	sty $08.b,X		; 94 08
	.db $42, $24		; 42 24
	eor ($F2.b),Y		; 51 F2
	sbc $5D7A.w,Y		; F9 7A 5D
	pha		; 48
	jmp $AEF3B5.l		; 5C B5 F3 AE
	adc [$51.b]		; 67 51
	sbc ($69.b,X)		; E1 69
	bit $205C.w,X		; 3C 5C 20
	lda $1469.w,Y		; B9 69 14
	phy		; 5A
	phx		; DA
	eor $1626.w		; 4D 26 16
	tya		; 98
	brk $33.b		; 00 33
	sbc ($F8.b,S),Y		; F3 F8
	trb $0000.w		; 1C 00 00
	cmp $37F0DC.l		; CF DC F0 37
	rti		; 40

	tsb $21.b		; 04 21
	lda $64E4DF.l,X		; BF DF E4 64
	brk $10.b		; 00 10
	stx $FF.b		; 86 FF
	adc $109091.l,X		; 7F 91 90 10
	sta $16.b		; 85 16
	lda $6665.w,X		; BD 65 66
	inc $01.b		; E6 01
	ora $16.b		; 05 16
	clv		; B8
	.db $42, $04		; 42 04
	sbc ($F5.b,S),Y		; F3 F5
	ply		; 7A
	tyx		; BB
	adc $B177.w		; 6D 77 B1
	ldx $B7F5.w,Y		; BE F5 B7
	adc $FD4C.w,X		; 7D 4C FD
	sta $E1.b		; 85 E1
	and $AF9E.w,X		; 3D 9E AF
	phk		; 4B
	eor $BE8D.w,X		; 5D 8D BE
	cmp $FEDD.w		; CD DD FE
	jsr ($56FF.w,X)		; FC FF 56
	sbc ($80.b,S),Y		; F3 80
	brk $18.b		; 00 18
	sec		; 38
	and ($CE.b,S),Y		; 33 CE
	brk $18.b		; 00 18
	sec		; 38
	and ($CE.b,S),Y		; 33 CE
	tsb $20.b		; 04 20
	brk $04.b		; 00 04
	jsr $1B80.w		; 20 80 1B
	rtl		; 6B

	rol $CF56.w,X		; 3E 56 CF
	jsl $F5D9BF.l		; 22 BF D9 F5
	sbc ($EE.b,S),Y		; F3 EE
	adc $90AE.w,X		; 7D AE 90
	lda ($DB.b,S),Y		; B3 DB
	cpx $FAFB.w		; EC FB FA
	sbc $B6D737.l,X		; FF 37 D7 B6
	lda $03C2.w,Y		; B9 C2 03
	dec $E2.b,X		; D6 E2
	sbc $DF5D.w,Y		; F9 5D DF
	eor ($4B.b,S),Y		; 53 4B
	beq 108.b		; F0 6C
	adc ($DD.b)		; 72 DD
	iny		; C8
	sec		; 38
	ldy $EF5E.w,X		; BC 5E EF
	sta $ECD2A5.l		; 8F A5 D2 EC
	ror $20.b,X		; 76 20
	ora $F881DB.l,X		; 1F DB 81 F8
	lda $072E7F.l		; AF 7F 2E 07
	and [$93.b],Y		; 37 93
	stx $B2.b,Y		; 96 B2
	asl $0207.w		; 0E 07 02
	inc $F7.b,X		; F6 F7
	ora $03.b,S		; 03 03
	sta ($C9.b,S),Y		; 93 C9
	brk $FF.b		; 00 FF
	ldy $36EF.w,X		; BC EF 36
	sbc $E6AA71.l		; EF 71 AA E6
	adc ($3B.b,S),Y		; 73 3B
	adc [$C8.b]		; 67 C8
	asl $3A77.w		; 0E 77 3A
	sbc $D5AA49.l		; EF 49 AA D5
	adc ($3D.b,S),Y		; 73 3D
	ldy #$0F.b		; A0 0F
	xba		; EB
	ldx $FF.b		; A6 FF
	sei		; 78
	stz $BF26.w,X		; 9E 26 BF
	sbc #$CF.b		; E9 CF
	cmp ($43.b,S),Y		; D3 43
	nop		; EA
	lda $14.b		; A5 14
	mvn $D3,$A2		; 54 A2 D3
	adc $4CDC.w,X		; 7D DC 4C
	eor $BF7E.w		; 4D 7E BF
	and $2984C9.l,X		; 3F C9 84 29
	.db $42, $2B		; 42 2B
	eor $3EF4EC.l,X		; 5F EC F4 3E
	and $C31F.w		; 2D 1F C3
	eor ($A3.b,S),Y		; 53 A3
	cmp ($F4.b),Y		; D1 F4
	sta $8742F9.l,X		; 9F F9 42 87
	lda ($E8.b,X)		; A1 E8
	pla		; 68
	pea $3E75.w		; F4 75 3E
	sbc $00FA47.l,X		; FF 47 FA 00
	adc $A746FE.l,X		; 7F FE 46 A7
	ora [$EC.b]		; 07 EC
	phx		; DA
	ply		; 7A
	ror $789F.w,X		; 7E 9F 78
	sbc $72E440.l,X		; FF 40 E4 72
	bmi 112.b		; 30 70
	ror $9B.b,X		; 76 9B
	eor $00D24F.l		; 4F 4F D2 00
	jmp.w [$10C2]		; DC C2 10
	txa		; 8A
	pld		; 2B
	xce		; FB
	plx		; FA
	adc ($FB.b),Y		; 71 FB
	dey		; 88
	sty $21.b		; 84 21
	asl A		; 0A
	eor ($45.b),Y		; 51 45
	adc $8C63FB.l,X		; 7F FB 63 8C
	ora $FF79D5.l		; 0F D5 79 FF
	and $DF5E3D.l		; 2F 3D 5E DF
	txy		; 9B
	adc ($B5.b,S),Y		; 73 B5
	sta [$D1.b]		; 87 D1
	trb $71.b		; 14 71
	cmp ($8E.b,S),Y		; D3 8E
	sbc ($D6.b)		; F2 D6
	sbc $267F3B.l		; EF 3B 7F 26
	inc $74.b		; E6 74
	and ($14.b,X)		; 21 14
	eor ($DA.b),Y		; 51 DA
	jsr ($FC89.w,X)		; FC 89 FC
	phb		; 8B
	rol $13BF.w,X		; 3E BF 13
	iny		; C8
	lda $56EF.w		; AD EF 56
	lda ($5B.b,S),Y		; B3 5B
	sta $47.b		; 85 47
	asl A		; 0A
	bit #$E7.b		; 89 E7
	lda ($67.b,S),Y		; B3 67
	bit #$C4.b		; 89 C4
	lda $3469.w		; AD 69 34
	phy		; 5A
	cpx #$06.b		; E0 06
	sta $32.b		; 85 32
	rts		; 60

	ora ($7E.b,X)		; 01 7E
	sta $0030.w,Y		; 99 30 00
	ora $070010.l		; 0F 10 00 07
	dey		; 88
	.db $82, $00, $02		; 82 00 02
	sed		; F8
	brk $06.b		; 00 06
	rts		; 60

	brk $0F.b		; 00 0F
	jmp $AE0700.l		; 5C 00 07 AE
	brk $22.b		; 00 22
	mvp $00,$AE		; 44 AE 00
	jsl $00AE44.l		; 22 44 AE 00
	bit $6B.b		; 24 6B
	txs		; 9A
	beq   1.b		; F0 01
	and $5C.b,S		; 23 5C
	jsr ($542A.w,X)		; FC 2A 54
	ldx #$40.b		; A2 40
	ora ($ED.b,X)		; 01 ED
	lda #$52.b		; A9 52
	brk $0E.b		; 00 0E
	txa		; 8A
	lda ($B2.b)		; B2 B2
	bra   7.b		; 80 07
	jmp ($0300.w)		; 6C 00 03
	and ($7E.b),Y		; 31 7E
	sta $6432.w,Y		; 99 32 64
	cpy #$2F.b		; C0 2F
	cmp ($26.b,S),Y		; D3 26
	jmp $0698.w		; 4C 98 06
	cmp ($61.b),Y		; D1 61
	adc ($61.b,X)		; 61 61
	rts		; 60

	asl $D1.b		; 06 D1
	ldy $58.b,X		; B4 58
	cli		; 58
	cli		; 58
	ora ($6D.b,X)		; 01 6D
	adc $6D6D.w		; 6D 6D 6D
	cmp ($01.b,X)		; C1 01
	adc $6D6D.w		; 6D 6D 6D
	adc $0398.w		; 6D 98 03
	sty $C9.b,X		; 94 C9
	stz $B2.b		; 64 B2
	eor $1C52AC.l,X		; 5F AC 52 1C
	lda [$29.b]		; A7 29
	sta ($C9.b)		; 92 C9
	ror $48C1.w,X		; 7E C1 48
	eor [$57.b],Y		; 57 57
	eor [$57.b],Y		; 57 57
	adc ($55.b)		; 72 55
	sty $0A.b,X		; 94 0A
	nop		; EA
	nop		; EA
	nop		; EA
	sbc $705965.l		; EF 65 59 70
	.db $62, $B1, $58		; 62 B1 58
	ldy $1C57.w		; AC 57 1C
	asl $2B.b		; 06 2B
	ora $8A.b,X		; 15 8A
	cmp $7F.b		; C5 7F
	bra  26.b		; 80 1A
	sta $55.b		; 85 55
	eor $56.b,X		; 55 56
	pla		; 68
	ora $5043.w		; 0D 43 50
	tax		; AA
	tax		; AA
	sbc $5BC0.w,Y		; F9 C0 5B
	tad		; 5B
	tad		; 5B
	tad		; 5B
	adc $E14B04.l,X		; 7F 04 4B E1
	adc $6D6D.w		; 6D 6D 6D
	adc $8998.w		; 6D 98 89
	plb		; AB
	tsb $8B.b		; 04 8B
	lda [$62.b],Y		; B7 62
	tsx		; BA
	pha		; 48
	sta ($20.b),Y		; 91 20
	sta ($76.b),Y		; 91 76
	bne -69.b		; D0 BB
	and $D2.b		; 25 D2
	mvp $75,$82		; 44 82 75
	sta [$F3.b],Y		; 97 F3
	eor $61.b,X		; 55 61
	rol A		; 2A
	tax		; AA
	bit #$D6.b		; 89 D6
	eor $61D433.l,X		; 5F 33 D4 61
	rol A		; 2A
	tax		; AA
	dey		; 88
	jsr $B8D4.w		; 20 D4 B8
	inc $861B.w		; EE 1B 86
	sbc ($88.b,X)		; E1 88
	jsr $B8D4.w		; 20 D4 B8
	inc $863B.w		; EE 3B 86
	sbc ($80.b,X)		; E1 80
	sta $65.b,X		; 95 65
	.db $42, $B2		; 42 B2
	bvs  24.b		; 70 18
	rtl		; 6B

	pld		; 2B
	phb		; 8B
	phb		; 8B
	jsl $D3E974.l		; 22 74 E9 D3
	lda [$4E.b]		; A7 4E
	stz $9D4E.w		; 9C 4E 9D
	dec A		; 3A
	stz $E9.b,X		; 74 E9
	cmp ($80.b,S),Y		; D3 80
	phx		; DA
	lda [$AF.b],Y		; B7 AF
	and $CA94.w		; 2D 94 CA
	ora ($B5.b,X)		; 01 B5
	adc $94A15F.l		; 6F 5F A1 94
	dex		; CA
	ora ($ED.b,X)		; 01 ED
	rol A		; 2A
	tax		; AA
	tax		; AA
	tax		; AA
	bra  -9.b		; 80 F7
	ora $55.b,X		; 15 55
	eor $55.b,X		; 55 55
	rti		; 40

	bvs  86.b		; 70 56
	cmp $128E.w,Y		; D9 8E 12
	cld		; D8
	tsb $B6C5.w		; 0C C5 B6
	adc $84.b,S		; 63 84
	ldx $90.b,Y		; B6 90
	brk $04.b		; 00 04
	bra   0.b		; 80 00
	bmi -128.b		; 30 80
	brk $77.b		; 00 77
	rti		; 40

	brk $38.b		; 00 38
	rts		; 60

	cop $08.b		; 02 08
	sec		; 38
	rts		; 60

	cop $08.b		; 02 08
	and $00.b		; 25 00
	ora $8621.w,X		; 1D 21 86
	brk $3A.b		; 00 3A
	jmp $ACE6.w		; 4C E6 AC
	brk $55.b		; 00 55
	pha		; 48
	cmp $80.b,X		; D5 80
	asl A		; 0A
	lda #$1E.b		; A9 1E
	cli		; 58
	brk $89.b		; 00 89
	ora ($AC.b,S),Y		; 13 AC
	brk $22.b		; 00 22
	mvp $1A,$C2		; 44 C2 1A
	brk $15.b		; 00 15
	lsr $5D.b,X		; 56 5D
	bne -47.b		; D0 D1
	brk $AA.b		; 00 AA
	lda ($E0.b)		; B2 E0
	tay		; A8
	brk $07.b		; 00 07
	bcs -95.b		; B0 A1
	rti		; 40

	brk $82.b		; 00 82
	php		; 08
	jsr $0082.w		; 20 82 00
	.db $82, $08, $20		; 82 08 20
	.db $82, $00, $A6		; 82 00 A6
	sbc $A351.w,Y		; F9 51 A3
	lsr $E9.b		; 46 E9
	.db $82, $9B, $E5		; 82 9B E5
	jmp ($D1A8.w,X)		; 7C A8 D1
	tsx		; BA
	rts		; 60

	sbc $1A.b,X		; F5 1A
	ror $A1.b,X		; 76 A1
	sbc [$9D.b],Y		; F7 9D
.ACCU 16
	rep #$A8		; C2 A8
	and $9D56.w,X		; 3D 56 9D
	jmp.w [$96BB]		; DC BB 96
	sta $03DC.w,X		; 9D DC 03
	stz $A4.b,X		; 74 A4
	ldy $89.b		; A4 89
	ora ($74.b,S),Y		; 13 74
	ora $92D2.w		; 0D D2 92
	sta ($24.b)		; 92 24
	eor $39D0.w		; 4D D0 39
	ldy $F1A6.w		; AC A6 F1
	txs		; 9A
	sbc ($9D.b),Y		; F1 9D
	cpy #$3D.b		; C0 3D
	ldx $53.b,Y		; B6 53
	sei		; 78
	cmp $CD78.w		; CD 78 CD
	sec		; 38
	and [$CC.b],Y		; 37 CC
	stx $F9.b		; 86 F9
	eor $DF90.w,X		; 5D 90 DF
	ora $E1.b,S		; 03 E1
	stz $37.b		; 64 37
	dex		; CA
	cpx $C287.w		; EC 87 C2
	ldy $27.b,X		; B4 27
	bra   0.b		; 80 00
	trb $50.b		; 14 50
	brk $05.b		; 00 05
	trb $00.b		; 14 00
	ora ($08.b,X)		; 01 08
	brk $01.b		; 00 01
	ora $2A.b		; 05 2A
	mvn $DD,$E9		; 54 E9 DD
	eor $5776.w,X		; 5D 76 57
	eor $D8A4.w,X		; 5D A4 D8
	cli		; 58
	tad		; 5B
	adc $47BF.w,X		; 7D BF 47
	sbc $A5.b,S		; E3 A5
	lsr A		; 4A
	stz $EB82.w,X		; 9E 82 EB
	lda ($BA.b,S),Y		; B3 BA
	sty $DD.b		; 84 DD
	ldx $B316.w		; AE 16 B3
	adc $3C3EF8.l		; 6F F8 3E 3C
	sbc ($85.b)		; F2 85
	asl A		; 0A
	asl $BC74.w,X		; 1E 74 BC
	tas		; 1B
	inc $0F2E.w		; EE 2E 0F
	lda $0182.w		; AD 82 01
	bit $D7D7.w		; 2C D7 D7
	cld		; D8
	rol $B9.b,X		; 36 B9
	bit $67B5.w		; 2C B5 67
	stp		; DB
	adc $B9BA.w		; 6D BA B9
	stp		; DB
	inc A		; 1A
	cmp $DF2A.w,X		; DD 2A DF
	rol $596A.w,X		; 3E 6A 59
	bvs -25.b		; 70 E7
	cmp $DB.b,S		; C3 DB
	adc [$B9.b],Y		; 77 B9
	cmp $ADD5.w,Y		; D9 D5 AD
	jmp ($86DE.w,X)		; 7C DE 86
	sta $41.b,S		; 83 41
	php		; 08
	eor $6B.b		; 45 6B
	cmp ($A5.b)		; D2 A5
	lsr $713A.w		; 4E 3A 71
	inx		; E8
	and $D0.b,S		; 23 D0
	eor ($84.b)		; 52 84
	jsl $5414A5.l		; 22 A5 14 54
	ldx #$8F.b		; A2 8F
	bcs -114.b		; B0 8E
	dec $BB.b,X		; D6 BB
	dec $A7B5.w		; CE B5 A7
	sbc #$FF61.w		; E9 61 FF
	adc $0EFE.w,Y		; 79 FE 0E
	eor [$85.b],Y		; 57 85
	ldx $6BEB.w		; AE EB 6B
	lda $3ABF36.l,X		; BF 36 BF 3A
	cpx $F8.b		; E4 F8
	sei		; 78
	adc ($CF.b,S),Y		; 73 CF
	adc [$95.b]		; 67 95
	cpy $D7.b		; C4 D7
	phy		; 5A
	plx		; FA
	inc $0668.w,X		; FE 68 06
	lsr $144D.w		; 4E 4D 14
	adc $502E9A.l,X		; 7F 9A 2E 50
	ora ($93.b,X)		; 01 93
	sta ($45.b,S),Y		; 93 45
	ldy $EC.b		; A4 EC
	lda $BE.b,X		; B5 BE
	inc $8CB7.w,X		; FE B7 8C
	cmp $00.b,S		; C3 00
	rtl		; 6B

	ror $7A.b,X		; 76 7A
	cmp $009A.w,X		; DD 9A 00
	asl $C2.b		; 06 C2
	cmp [$3F.b]		; C7 3F
	cmp $8FFC.w,Y		; D9 FC 8F
	sta $0570.w		; 8D 70 05
	stx $B357.w		; 8E 57 B3
	cmp $3A00A8.l,X		; DF A8 00 3A
	lda $9F0E.w,X		; BD 0E 9F
	tas		; 1B
	cmp [$74.b]		; C7 74
	brk $1D.b		; 00 1D
	tsb $37DE.w		; 0C DE 37
	clc		; 18
	brk $3B.b		; 00 3B
	ora $1B37.w,Y		; 19 37 1B
	txa		; 8A
	sta ($EB.b)		; 92 EB
	ora ($00.b)		; 12 00
	sta ($EB.b)		; 92 EB
	adc ($AC.b),Y		; 71 AC
	stx $50.b,Y		; 96 50
	ora $F9.b,S		; 03 F9
	adc $689A.w,Y		; 79 9A 68
	sei		; 78
	ldy $F9.b,X		; B4 F9
	lda [$57.b],Y		; B7 57
	sta [$9A.b],Y		; 97 9A
	tsa		; 3B
	dec $EECE.w		; CE CE EE
	sbc #$73E6.w		; E9 E6 73
	and ($B9.b,X)		; 21 B9
	lda [$4E.b]		; A7 4E
	nop		; EA
	nop		; EA
	sbc ($D7.b)		; F2 D7
	tyx		; BB
	tyx		; BB
	and $3759.w,Y		; 39 59 37
	ora $D4.b,X		; 15 D4
	plp		; 28
	bvc  12.b		; 50 0C
	stz $A295.w		; 9C 95 A2
	tsx		; BA
	cpy $68.b		; C4 68
	pei ($D1.b)		; D4 D1
	lda #$5883.w		; A9 83 58
	sta $9A1A.w		; 8D 1A 9A
	and $30.b,X		; 35 30
	ora [$C8.b]		; 07 C8
	tay		; A8
	sbc #$00AA.w		; E9 AA 00
	rol $4765.w,X		; 3E 65 47
	eor $1250.w		; 4D 50 12
	lda $65.b		; A5 65
	ldx $0D.b,Y		; B6 0D
	jsl $4A25A0.l		; 22 A0 25 4A
	sbc [$B6.b]		; E7 B6
	phd		; 0B
	sbc $F0.b		; E5 F0
	pld		; 2B
	ora $D98E01.l		; 0F 01 8E D9
	bit $5610.w,X		; 3C 10 56
	tas		; 1B
	rol $3B.b		; 26 3B
	stz $F0.b		; 64 F0
	eor ($7E.b,X)		; 41 7E
	sta ($23.b),Y		; 91 23
	mvp $20,$91		; 44 91 20
	and $6824D2.l		; 2F D2 24 68
	sta ($24.b)		; 92 24
	tsb $C8.b		; 04 C8
	bit $CCF4.w,X		; 3C F4 CC
	ldx $58.b,Y		; B6 58
	and ($DB.b)		; 32 DB
	sta [$9E.b],Y		; 97 9E
	wai		; CB
	adc $B2.b		; 65 B2
	cpy #$1E.b		; C0 1E
	ror A		; 6A
	stz $A9.b		; 64 A9
	rti		; 40

	ora $5432C5.l,X		; 1F C5 32 54
	ldx $56C0.w		; AE C0 56
	lsr $6D.b,X		; 56 6D
	stx $16.b,Y		; 96 16
	asl $01.b,X		; 16 01
	eor $FA59.w,Y		; 59 59 FA
	lsr $16.b,X		; 56 16
	asl $01.b,X		; 16 01
	rti		; 40

	cpx #$AD.b		; E0 AD
	lda ($1C.b,S),Y		; B3 1C
	jsr $3350.w		; 20 50 33
	asl $D9.b,X		; 16 D9
	stx $1113.w		; 8E 13 11
	dec $0380.w,X		; DE 80 03
	ora ($B7.b),Y		; 11 B7
	brk $05.b		; 00 05
	eor [$D2.b]		; 47 D2
	brk $95.b		; 00 95
	rol A		; 2A
	lda $A8.b,S		; A3 A8
	brk $95.b		; 00 95
	pld		; 2B
	and ($96.b,X)		; 21 96
	brk $0D.b		; 00 0D
	sta $9E.b,S		; 83 9E
	brk $0C.b		; 00 0C
	adc [$80.b],Y		; 77 80
	brk $99.b		; 00 99
	and ($1D.b,S),Y		; 33 1D
	sed		; F8
	cpy #$13.b		; C0 13
	rol $48.b		; 26 48
	bcc   0.b		; 90 00
	ora ($24.b)		; 12 24
	brk $06.b		; 00 06
	tad		; 5B
	dec $0600.w		; CE 00 06
	tad		; 5B
	bit $1300.w		; 2C 00 13
	and $09C0.w,Y		; 39 C0 09
	cmp ($A6.b,S),Y		; D3 A6
	jmp ($0940.w,X)		; 7C 40 09
	cmp ($AC.b,S),Y		; D3 AC
	bit $0200.w		; 2C 00 02
	rep #$C0		; C2 C0
	brk $2D.b		; 00 2D
	clv		; B8
	jsr $B600.w		; 20 00 B6
	inc $00.b,X		; F6 00
	ora ($7A.b,X)		; 01 7A
	tay		; A8
	lda $5454.w,X		; BD 54 54
	lsr $F582.w,X		; 5E 82 F5
	eor ($7A.b),Y		; 51 7A
	tay		; A8
	tay		; A8
	sbc $E801.w		; ED 01 E8
	ldy $BA37.w,X		; BC 37 BA
	cmp [$63.b]		; C7 63
	lda $7AD0.w,X		; BD D0 7A
	and $B1EF0D.l		; 2F 0D EF B1
	cld		; D8
	sbc $261374.l		; EF 74 13 26
	jmp $D899.w		; 4C 99 D8
	lda $04.b,S		; A3 04
	cmp #$2693.w		; C9 93 26
	adc $84C6.w,X		; 7D C6 84
	ora $11F3.w,X		; 1D F3 11
	lda [$6B.b],Y		; B7 6B
	cli		; 58
	stx $1BF8.w		; 8E F8 1B
	ror $23.b,X		; 76 23
	ror $B1D6.w		; 6E D6 B1
	asl $3C50.w,X		; 1E 50 3C
	lsr $ED.b,X		; 56 ED
	jsl $008D44.l		; 22 44 8D 00
	and $BB353B.l,X		; 3F 3B 35 BB
	pha		; 48
	sta ($A2.b),Y		; 91 A2
	asl $A9.b		; 06 A9
	adc $C080.w		; 6D 80 C0
	tad		; 5B
	rts		; 60

	ora $31.b,S		; 03 31
	adc $C080.w		; 6D 80 C0
	tad		; 5B
	tad		; 5B
	asl $D5.b		; 06 D5
	lda $9B75.w,X		; BD 75 9B
	ldx $53.b		; A6 53
	ror A		; 6A
	asl $7AB3.w		; 0E B3 7A
	plx		; FA
	txy		; 9B
	ldx $53.b		; A6 53
	inx		; E8
	ora [$C0.b]		; 07 C0
	cpy #$6A.b		; C0 6A
	cmp ($B0.b,S),Y		; D3 B0
	ora [$C0.b],Y		; 17 C0
	xce		; FB
	lsr $DA.b,X		; 56 DA
	ldy $EC.b,X		; B4 EC
	asl $A8.b		; 06 A8
	asl $A4.b,X		; 16 A4
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
	ora $FB267C.l,X		; 1F 7C 26 FB
	brk $07.b		; 00 07
	asl $04.b		; 06 04
	brk $E1.b		; 00 E1
	jmp $4B76.w		; 4C 76 4B
	pld		; 2B
.INDEX 16
	rep #$D4		; C2 D4
	tsb $A2C0.w		; 0C C0 A2
	ora [$FC.b]		; 07 FC
	eor ($7E.b,X)		; 41 7E
	eor ($68.b)		; 52 68
	.db $62, $02, $DA		; 62 02 DA
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
	eor #$E424.w		; 49 24 E4
	pei ($C9.b)		; D4 C9
	bpl  14.b		; 10 0E
	eor $6949.w,Y		; 59 49 69
	ora $4A.b,X		; 15 4A
	lda $62.b,X		; B5 62
	lda $31.b,X		; B5 31
	jmp $C240AF.l		; 5C AF 40 C2
	cmp ($62.b,X)		; C1 62
	lda ($59.b)		; B2 59
	lda $AB16.w		; AD 16 AB
	adc $BA.b		; 65 BA
	sbc ($72.b,X)		; E1 72
	sta ($85.b,X)		; 81 85
	cmp ($ED.b)		; D2 ED
	sei		; 78
	lda $2F5F.w,X		; BD 5F 2F
	cld		; D8
	ora #$16AC.w		; 09 AC 16
	ora ($06.b)		; 12 06
	clc		; 18
	adc #$46CC.w		; 69 CC 46
	pld		; 2B
	ora $C88E.w,Y		; 19 8E C8
	stz $A0.b		; 64 A0
	adc #$CB94.w		; 69 94 CB
	ror $33.b		; 66 33
	eor $F6CC.w,Y		; 59 CC F6
	sta $45.b,S		; 83 45
	ldy $81.b		; A4 81
	stx $9A.b,Y		; 96 9A
	ply		; 7A
	sta $51.b,S		; 83 51
	tax		; AA
	ldx #$D6A4.w		; A2 A4 D6
	rtl		; 6B

	ldy #$B065.w		; A0 65 B0
	cmp $366D.w,Y		; D9 6D 36
	stp		; DB
	sta $F3D6.w		; 8D D6 F3
	adc $4E03.w,X		; 7D 03 4E
	ora [$0B.b]		; 07 0B
	bit #$E4C6.w		; 89 C6 E4
	adc ($B9.b)		; 72 B9
	stz $1AE8.w		; 9C E8 1A
	stz $3A.b,X		; 74 3A
	mvn $1D,$D5		; 54 D5 1D
	lsr $63B7.w		; 4E B7 63
	lda $DC.b,X		; B5 DC
	sta ($97.b,X)		; 81 97
	tda		; 7B
	cmp ($E2.b,X)		; C1 E2
	sbc ($79.b)		; F2 79
	lda $AF1E.w,X		; BD 1E AF
	adc [$BA.b]		; 67 BA
	asl $5F.b		; 06 5F
	ora $EDD397.l		; 0F 97 D3 ED
	sed		; F8
	sbc $3F7F.w,X		; FD 7F 3F
	bne   3.b		; D0 03
	bcc  34.b		; 90 22
	rti		; 40

	rol $FB.b		; 26 FB
	brk $0C.b		; 00 0C
	rts		; 60

	tsb $00.b		; 04 00
	adc $25.b,S		; 63 25
	cmp $5692.w		; CD 92 56
	sta ($32.b)		; 92 32
	rol $16.b		; 26 16
	tsb $48.b		; 04 48
	bvc  30.b		; 50 1E
	eor ($F5.b)		; 52 F5
	sty $3B96.w		; 8C 96 3B
	asl $AA04.w,X		; 1E 04 AA
	lda $2D5D.w,Y		; B9 5D 2D
	ora ($04.b),Y		; 11 04
	cli		; 58
	sei		; 78
	beq  68.b		; F0 44
	cmp $36.b,X		; D5 36
	lda $A9.b		; A5 A9
	adc $CB.b,X		; 75 CB
	sta $45.b		; 85 45
	sta $23.b,X		; 95 23
	lda ($0A.b,X)		; A1 0A
	cmp [$24.b],Y		; D7 24
	ldx $4D.b,Y		; B6 4D
	lda ($D3.b)		; B2 D3
	nop		; EA
	and ($04.b,X)		; 21 04
	inc $21.b		; E6 21
	and ($58.b),Y		; 31 58
	sta $9E0C53.l		; 8F 53 0C 9E
	adc $B41F.w,Y		; 79 1F B4
	iny		; C8
	eor $69DD.w,X		; 5D DD 69
	lsr $D2.b		; 46 D2
	stz $11.b		; 64 11
	lda [$D2.b],Y		; B7 D2
	and #$71BD.w		; 29 BD 71
	bit $ED.b		; 24 ED
	eor $EDFE.w		; 4D FE ED
	and ($65.b)		; 32 65
	sta ($5D.b)		; 92 5D
	adc $92.b,X		; 75 92
	wai		; CB
	rol A		; 2A
	adc $7B9E.w		; 6D 9E 7B
	jmp ($4B97.w)		; 6C 97 4B
	stz $FF.b		; 64 FF
	cpy $DB.b		; C4 DB
	and $F6.b		; 25 F6
	tad		; 5B
	stz $B2.b,X		; 74 B2
	rol $C5.b		; 26 C5
	.db $42, $5B		; 42 5B
	asl $0B.b,X		; 16 0B
	ora ($54.b),Y		; 11 54
	txa		; 8A
	cmp $AC.b,X		; D5 AC
	cli		; 58
	bit $225B.w		; 2C 5B 22
	eor $57.b		; 45 57
	lda $8B1D.w		; AD 1D 8B
	ora ($CF.b,S),Y		; 13 CF
	lda $ECB9.w,Y		; B9 B9 EC
	pea $C4FE.w		; F4 FE C4
	sta $DF4F26.l,X		; 9F 26 4F DF
	sta $D5.b,X		; 95 D5
	cpx #$BEFB.w		; E0 FB BE
	cpx $F8.b		; E4 F8
	sbc [$3B.b],Y		; F7 3B
	adc $B73F.w,X		; 7D 3F B7
	and [$4E.b]		; 27 4E
	eor #$B732.w		; 49 32 B7
	jmp $DCE71E.l		; 5C 1E E7 DC
	inc $80.b,X		; F6 80
	asl A		; 0A
	cmp $BB.b,X		; D5 BB
	ora $D98F.w,X		; 1D 8F D9
	rti		; 40

	ora ($5A.b,X)		; 01 5A
	lda [$63.b],Y		; B7 63
	lda ($45.b),Y		; B1 45
	brk $11.b		; 00 11
	eor $95.b		; 45 95
	sta $B1.b,X		; 95 B1
	lda ($D4.b),Y		; B1 D4
	cld		; D8
	brk $8A.b		; 00 8A
	bit $ADAC.w		; 2C AC AD
	txa		; 8A
	clv		; B8
	eor ($57.b,S),Y		; 53 57
	sta $B9CC.w,X		; 9D CC B9
	cld		; D8
	lda $C2F4FC.l,X		; BF FC F4 C2
	txs		; 9A
	lda $E572.w,Y		; B9 72 E5
	xce		; FB
	plx		; FA
	ply		; 7A
	rts		; 60

	ora [$37.b]		; 07 37
	txy		; 9B
	phb		; 8B
	ora [$C7.b],Y		; 17 C7
	cmp #$3900.w		; C9 00 39
	ldy $58DC.w,X		; BC DC 58
	lda ($72.b)		; B2 72
	.db $42, $2A		; 42 2A
	ldy $E671.w,X		; BC 71 E6
	ror $7E.b		; 66 7E
	bit $DE5E.w		; 2C 5E DE
	bcs  69.b		; B0 45
	eor [$8E.b],Y		; 57 8E
	bit $CCCC.w,X		; 3C CC CC
	cli		; 58
	lda $B5.b,X		; B5 B5
	txa		; 8A
	cmp $88.b,X		; D5 88
	ldx #$45E9.w		; A2 E9 45
	cmp ($8A.b)		; D2 8A
	dec A		; 3A
	lda $225A.w,Y		; B9 5A 22
	rol A		; 2A
	sta ($1D.b,S),Y		; 93 1D
	pla		; 68
	sbc $9E.b,S		; E3 9E
	adc $B6BA.w,X		; 7D BA B6
	lda $E72F43.l,X		; BF 43 2F E7
	cmp $FDFE.w		; CD FE FD
	stx $EFBD.w		; 8E BD EF
	ror $F8F4.w,X		; 7E F4 F8
	inc $FB.b,X		; F6 FB
	dec A		; 3A
	xce		; FB
	and $F37A.w,Y		; 39 7A F3
	adc [$FB.b]		; 67 FB
	inc A		; 1A
	lda [$AA.b],Y		; B7 AA
	cpx #$1405.w		; E0 05 14
	eor $E0B43E.l		; 4F 3E B4 E0
	ora $14.b		; 05 14
	eor $3C8E57.l		; 4F 57 8E 3C
	txa		; 8A
	xce		; FB
	lda #$6F2C.w		; A9 2C 6F
	adc $57.b,S		; 63 57
	tsb $75.b		; 04 75
	plb		; AB
	cmp #$7D25.w		; C9 25 7D
	cpx $1DA0.w		; EC A0 1D
	cpy $7E.b		; C4 7E
	jsr ($669F.w,X)		; FC 9F 66
	pha		; 48
	cmp ($80.b),Y		; D1 80
	stx $2A39.w		; 8E 39 2A
	cpx #$B507.w		; E0 07 B5
	eor [$3B.b]		; 47 3B
	eor $F34243.l		; 4F 43 42 F3
	cpx #$A280.w		; E0 80 A2
	sta $3D3D.w		; 8D 3D 3D
	ora $0300.w		; 0D 00 03
	stp		; DB
	cmp $CE.b		; C5 CE
	sbc ($F2.b,X)		; E1 F2
	sbc ($36.b,S),Y		; F3 36
	ora $3140.w,Y		; 19 40 31
	.db $62, $E1, $F0		; 62 E1 F0
	sbc ($33.b,S),Y		; F3 33
	brk $0F.b		; 00 0F
	cmp $F587.w		; CD 87 F5
	sbc $7B.b,X		; F5 7B
	eor $DCAF.w,X		; 5D AF DC
	sbc ($40.b)		; F2 40
	adc ($C3.b,X)		; 61 C3
	cmp $EA.b,X		; D5 EA
	inc $BB.b,X		; F6 BB
	rti		; 40

	ora [$D0.b]		; 07 D0
	cmp $FDFC.w		; CD FC FD
	cmp $3CF5EF.l,X		; DF EF F5 3C
	cmp [$34.b]		; C7 34
	asl $6E.b		; 06 6E
	adc $F55577.l		; 6F 77 55 F5
	rol A		; 2A
	ldy #$2E07.w		; A0 07 2E
	sta $E8EAFB.l		; 8F FB EA E8
	pla		; 68
	rtl		; 6B

	dec A		; 3A
	ldy #$A328.w		; A0 28 A3
	cmp $AA.b,X		; D5 AA
	inx		; E8
	jmp ($0240.w,X)		; 7C 40 02
	ldy $7B.b,X		; B4 7B
	lda #$1C39.w		; A9 39 1C
	sta $BEE4.w		; 8D E4 BE
	ply		; 7A
	rti		; 40

	eor [$5E.b]		; 47 5E
	eor #$1639.w		; 49 39 16
	sbc $94.b		; E5 94
	ora $D1.b,S		; 03 D1
	lda $FBF2.w,X		; BD F2 FB
	sbc $7B8A.w,X		; FD 8A 7B
	cld		; D8
	sbc $3799.w,X		; FD 99 37
	tda		; 7B
	ldy $DD9D.w,X		; BC 9D DD
	ply		; 7A
	sbc [$B5.b],Y		; F7 B5
	tyx		; BB
	sbc $384EEF.l,X		; FF EF 4E 38
	sbc $92.b,S		; E3 92
	eor $5EDD.w		; 4D DD 5E
	lda $CE7E.w,X		; BD 7E CE
	and $6647A9.l,X		; 3F A9 47 66
	stz $E354.w		; 9C 54 E3
	ldx $74.b		; A6 74
	nop		; EA
	cli		; 58
	sbc ($D1.b),Y		; F1 D1
	eor $35.b		; 45 35
	and $51.b		; 25 51
	rol $04F9.w,X		; 3E F9 04
	brk $07.b		; 00 07
	and ($04.b,X)		; 21 04
	ora $12.b,X		; 15 12
	sbc $2A.b,S		; E3 2A
	and $C6.b		; 25 C6
	mvn $C5,$4B		; 54 4B C5
	mvn $C5,$4B		; 54 4B C5
	brk $11.b		; 00 11
	lda $46.b,S		; A3 46
	brk $23.b		; 00 23
	lsr $8D.b		; 46 8D
	eor ($2C.b),Y		; 51 2C
	sta $44.b		; 85 44
	ldy $252A.w		; AC 2A 25
	adc $51.b,X		; 75 51
	rol $00B0.w		; 2E B0 00
	stz $8072.w		; 9C 72 80
	tsb $E3.b		; 04 E3
	sty $A8.b,X		; 94 A8
	stx $5A.b,Y		; 96 5A
	ldx #$295B.w		; A2 5B 29
	ora $95.b,X		; 15 95
	php		; 08
	and #$2254.w		; 29 54 22
	sta $84.b,S		; 83 84
	sta $6032.w,Y		; 99 32 60
	bpl  91.b		; 10 5B
	jmp $3099.w		; 4C 99 30
	ora $1D27.w		; 0D 27 1D
	ldy $D2.b		; A4 D2
	adc ($C0.b),Y		; 71 C0
	adc #$ED38.w		; 69 38 ED
	rol $93.b		; 26 93
	dex		; CA
	ora ($B0.b,X)		; 01 B0
	lda ($B2.b)		; B2 B2
	lda ($B2.b)		; B2 B2
	ora $EF.b,S		; 03 EF
	ldx $16.b,Y		; B6 16
	lsr $56.b,X		; 56 56
	rti		; 40

	lsr $8D.b		; 46 8D
	inc A		; 1A
	and $60.b,X		; 35 60
	ora ($A3.b),Y		; 11 A3
	lsr $8D.b		; 46 8D
	cli		; 58
	tsb $AB.b		; 04 AB
	ora #$BF52.w		; 09 52 BF
	cpy #$5609.w		; C0 09 56
	ora ($A5.b)		; 12 A5
	adc $671DC0.l,X		; 7F C0 1D 67
	eor $E675.w,Y		; 59 75 E6
	and $01.b		; 25 01
	dec $75.b,X		; D6 75
	sta [$5E.b],Y		; 97 5E
	phb		; 8B
	bit $07.b,X		; 34 07
	bra -95.b		; 80 A1
	.db $42, $85		; 42 85
	brk $3C.b		; 00 3C
	ora [$80.b]		; 07 80
	lda ($42.b,X)		; A1 42
	bra  24.b		; 80 18
	txy		; 9B
	rol $139B.w		; 2E 9B 13
	stz $06.b		; 64 06
	rol $CB.b		; 26 CB
	ldx $C4.b		; A6 C4
	cmp $4100.w,Y		; D9 00 41
	tsb $16.b		; 04 16
	bne  65.b		; D0 41
	ora ($04.b,X)		; 01 04
	bpl  91.b		; 10 5B
	eor ($04.b,X)		; 41 04
	brk $71.b		; 00 71
	txs		; 9A
	lsr $493B.w		; 4E 3B 49
	ldy $03.b		; A4 03
	sty $71D2.w		; 8C D2 71
	phx		; DA
	eor $1F20.w		; 4D 20 1F
	eor #$5AD4.w		; 49 D4 5A
	phy		; 5A
	phy		; 5A
	ora ($F5.b,X)		; 01 F5
	eor $5147.w,X		; 5D 47 51
	adc #$0768.w		; 69 68 07
	jmp.w [$356A]		; DC 6A 35
	inc A		; 1A
	sta $1E40.w		; 8D 40 1E
	tyx		; BB
	eor ($A8.b),Y		; 51 A8
	pei ($6A.b)		; D4 6A
	ora #$2412.w		; 09 12 24
	pha		; 48
	sta ($22.b),Y		; 91 22
	eor ($22.b,X)		; 41 22
	mvp $12,$89		; 44 89 12
	bit $48.b		; 24 48
	ora $B8.b,S		; 03 B8
	eor ($6D.b,X)		; 41 6D
	and ($00.b)		; 32 00
	and $B6A0.w		; 2D A0 B6
	sta $1E00.w,Y		; 99 00 1E
	ora ($59.b,S),Y		; 13 59
	adc $7C7D.w,X		; 7D 7D 7C
	ora [$84.b]		; 07 84
	plx		; FA
	adc $F565.w		; 6D 65 F5
	sbc ($71.b),Y		; F1 71
	adc ($75.b),Y		; 71 75
	cmp [$7A.b],Y		; D7 7A
	ora $2EC4C8.l		; 0F C8 C4 2E
	rol $9D33.w		; 2E 33 9D
	adc [$A4.b],Y		; 77 A4
	pea $709D.w		; F4 9D 70
	asl $0333.w,X		; 1E 33 03
	adc ($4B.b),Y		; 71 4B
	brk $0D.b		; 00 0D
	dec $06.b		; C6 06
.INDEX 8
	sep #$96		; E2 96
	tsb $15.b		; 04 15
	ora ($82.b)		; 12 82
	ldx #$5C.b		; A2 5C
	bvs   0.b		; 70 00
	adc [$E7.b]		; 67 E7
	sbc $0140.w,Y		; F9 40 01
	rol $7E.b,X		; 36 7E
	adc $44A5.w,X		; 7D A5 44
	lda $252A.w		; AD 2A 25
	sbc ($95.b)		; F2 95
	ora ($FA.b)		; 12 FA
	rol A		; 2A
	bit #$2A64.w		; 89 64 2A
	and $90.b		; 25 90
	tay		; A8
	sta [$AC.b],Y		; 97 AC
	brk $23.b		; 00 23
	stx $BFDD.w		; 8E DD BF
	cpx $2300.w		; EC 00 23
	lda $F0C56E.l		; AF 6E C5 F0
	brk $53.b		; 00 53
	eor $00F0.w		; 4D F0 00
	eor ($EB.b)		; 52 EB
	rol A		; 2A
	and $F8.b		; 25 F8
	cmp $12.b,X		; D5 12
	sbc ($95.b),Y		; F1 95
	ora ($DB.b)		; 12 DB
	mvn $28,$62		; 54 62 28
	lda $8F.b,S		; A3 8F
	and $23.b,S		; 23 23
	sta $C2.b		; 85 C2
	cmp $0448.w,X		; DD 48 04
	eor ($47.b),Y		; 51 47
	tad		; 5B
	jsl $C40AB7.l		; 22 B7 0A C4
	txy		; 9B
	sbc $ECE09B.l,X		; FF 9B E0 EC
	xba		; EB
	plx		; FA
	phy		; 5A
	sbc $7D18.w,X		; FD 18 7D
	ror $F47F.w		; 6E 7F F4
	phx		; DA
	pea $7BED.w		; F4 ED 7B
	inc $BC.b,X		; F6 BC
	ora $F85F1B.l,X		; 1F 1B 5F F8
	rtl		; 6B

	cmp $2F0F.w		; CD 0F 2F
	sta $7E6DEE.l,X		; 9F EE 6D 7E
	phb		; 8B
	eor $70.b,X		; 55 70
	pld		; 2B
	cmp [$E2.b],Y		; D7 E2
	adc ($3F.b),Y		; 71 3F
	ror $CC9F.w		; 6E 9F CC
	cmp $F7.b,X		; D5 F7
	ror $80.b,X		; 76 80
	lda $C4895F.l		; AF 5F 89 C4
	cmp ($D3.b,S),Y		; D3 D3
	cmp $D5.b,X		; D5 D5
	phx		; DA
	phx		; DA
	stz $F77B.w,X		; 9E 7B F7
	sbc $973F0D.l,X		; FF 0D 3F 97
	ora [$CE.b]		; 07 CE
	cpx #$F9.b		; E0 F9
	bit $D55F.w,X		; 3C 5F D5
	cmp $F5.b		; C5 F5
	inc $A7.b,X		; F6 A7
	stz $FAFD.w,X		; 9E FD FA
	adc #$83C1.w		; 69 C1 83
	sta $0E.b,S		; 83 0E
	and $EAE2C6.l		; 2F C6 E2 EA
	sbc $016D.w		; ED 6D 01
	lda [$B7.b],Y		; B7 B7
	adc ($E7.b)		; 72 E7
	cmp [$B9.b],Y		; D7 B9
	inx		; E8
	jmp $0367F0.l		; 5C F0 67 03
	adc $A9DCFC.l		; 6F FC DC A9
	and ($CF.b,S),Y		; 33 CF
	sta ($26.b),Y		; 91 26
	jmp $C9BB.w		; 4C BB C9
	jmp ($F858.w)		; 6C 58 F8
	bpl -32.b		; 10 E0
	eor $B9.b,S		; 43 B9
	sta [$C2.b]		; 87 C2
	tyx		; BB
	bit $92.b		; 24 92
	sbc $D8DD65.l		; EF 65 DD D8
	dec $8343.w,X		; DE 43 83
	asl A		; 0A
	lda [$7B.b],Y		; B7 7B
	adc [$BA.b],Y		; 77 BA
	ldx $9C.b		; A6 9C
	sei		; 78
	xce		; FB
	bit $F3.b,X		; 34 F3
	cpx $77F8.w		; EC F8 77
	adc $D3DFD5.l,X		; 7F D5 DF D3
	sta $CCD5.w,X		; 9D D5 CC
	lda [$1E.b]		; A7 1E
	dec A		; 3A
	ror A		; 6A
	dec $76.b,X		; D6 76
	rol $F3D5.w		; 2E D5 F3
	lda ($B3.b,S),Y		; B3 B3
	and ($00.b,S),Y		; 33 00
	txs		; 9A
	.db $62, $51, $34		; 62 51 34
	cpy #$4D.b		; C0 4D
	bmi  19.b		; 30 13
	eor $2695.w		; 4D 95 26
	lsr A		; 4A
	bcs   0.b		; B0 00
	sta ($B8.b)		; 92 B8
	brk $1E.b		; 00 1E
	adc $C97803.l,X		; 7F 03 78 C9
	lsr A		; 4A
	brk $E0.b		; 00 E0
	bvs  19.b		; 70 13
	brk $07.b		; 00 07
	tsa		; 3B
	sta $3DE2.w,X		; 9D E2 3D
	bpl   1.b		; 10 01
	dec $00E7.w		; CE E7 00
	ora ($E9.b,X)		; 01 E9
	sbc $23DE.w,Y		; F9 DE 23
	dec $00.b,X		; D6 00
	asl $EC76.w,X		; 1E 76 EC
	brk $0F.b		; 00 0F
	and $8C71A5.l		; 2F A5 71 8C
	brk $74.b		; 00 74
	lda #$0300.w		; A9 00 03
	lda [$DB.b],Y		; B7 DB
	pei ($9F.b)		; D4 9F
	sbc $3B00AE.l,X		; FF AE 00 3B
	adc $C079FA.l,X		; 7F FA 79 C0
	ora $CD.b,S		; 03 CD
	sta ($CE.b,S),Y		; 93 CE
	lda $9D.b,X		; B5 9D
	tda		; 7B
	sta ($47.b,S),Y		; 93 47
	rol $878F.w		; 2E 8F 87
	sta $929679.l,X		; 9F 79 96 92
	phk		; 4B
	lsr $AF.b,X		; 56 AF
	lsr $AFA2.w,X		; 5E A2 AF
	sta $AA049E.l,X		; 9F 9E 04 AA
	sty $9D.b		; 84 9D
	rep #$08		; C2 08
	and $80A0.w		; 2D A0 80
	and $82A0.w		; 2D A0 82
	phx		; DA
	php		; 08
	cop $84.b		; 02 84
	sbc $2537.w		; ED 37 25
	ldx $A0.b		; A6 A0
	trb $27.b		; 14 27
	adc ($9C.b)		; 72 9C
	stx $9A.b,Y		; 96 9A
	bra  74.b		; 80 4A
	sta $F8.b,X		; 95 F8
	trb $30.b		; 14 30
	plp		; 28
	tsb $A9.b		; 04 A9
	eor $0243D5.l,X		; 5F D5 43 02
	bra  68.b		; 80 44
	bit $1776.w,X		; 3C 76 17
	eor $84.b		; 45 84
	ora ($0F.b),Y		; 11 0F
	ora $D185.w,X		; 1D 85 D1
	adc ($00.b,X)		; 61 00
	adc [$8C.b],Y		; 77 8C
	sbc $C5.b,X		; F5 C5
	cpy #$07.b		; C0 07
	sei		; 78
	sed		; F8
	ldy $C0F5.w		; AC F5 C0
	eor ($04.b,X)		; 41 04
	asl $D0.b,X		; 16 D0
	rti		; 40

	bpl  65.b		; 10 41
	ora $B4.b		; 05 B4
	bpl   5.b		; 10 05
	cmp ($C3.b,X)		; C1 C3
	adc [$2F.b]		; 67 2F
	and $E1E002.l		; 2F 02 E0 E1
	tyx		; BB
	ldx $72.b		; A6 72
	beq   3.b		; F0 03
	sbc $D2322F.l		; EF 2F 32 D2
	brk $3D.b		; 00 3D
	and $E6.b,X		; 35 E6
	phy		; 5A
	rti		; 40

	eor ($A5.b)		; 52 A5
	sta $954A.w		; 8D 4A 95
	jsr $4BA5.w		; 20 A5 4B
	inc A		; 1A
	sta $2A.b,X		; 95 2A
	bvc  64.b		; 50 40
	ora ($06.b,X)		; 01 06
	sbc $0004.w,Y		; F9 04 00
	bpl 111.b		; 10 6F
	stz $9896.w		; 9C 96 98
	cop $31.b		; 02 31
	cmp #$8072.w		; C9 72 80
	ora ($8A.b),Y		; 11 8A
	ora $140068.l,X		; 1F 68 00 14
	and $0060.w,X		; 3D 60 00
	adc ($74.b,X)		; 61 74
	rti		; 40

	ora [$57.b],Y		; 17 57
	cli		; 58
	lsr $02F0.w,X		; 5E F0 02
	nop		; EA
	nop		; EA
.ACCU 8
	sep #$E0		; E2 E0
	cop $24.b		; 02 24
	phk		; 4B
	phb		; 8B
	bra   8.b		; 80 08
	sta ($20.b),Y		; 91 20
	bra   2.b		; 80 02
	stz $C8.b		; 64 C8
	jsr $9900.w		; 20 00 99
	and ($F2.b)		; 32 F2
	beq   2.b		; F0 02
	dex		; CA
	adc $E5.b		; 65 E5
	cpx #$05.b		; E0 05
	sty $CB.b,X		; 94 CB
	cpy $04B0.w		; CC B0 04
	lda #$57.b		; A9 57
	sta $2A0120.l,X		; 9F 20 01 2A
	eor $2E.b,X		; 55 2E
	rts		; 60

	brk $29.b		; 00 29
	ror $40.b,X		; 76 40
	ora ($BF.b,X)		; 01 BF
	ror $B3.b		; 66 B3
	tad		; 5B
	inc $F9.b,X		; F6 F9
	brk $6F.b		; 00 6F
	cmp $D6AC.w,Y		; D9 AC D6
	sbc $40BE.w,X		; FD BE 40
	trb $86B7.w		; 1C B7 86
	cmp ($68.b),Y		; D1 68
	ldy $5A.b,X		; B4 5A
	jsr $B9E5.w		; 20 E5 B9
	sbc $D1A20D.l		; EF 0D A2 D1
	pla		; 68
	sta $98.b,S		; 83 98
	cmp [$73.b],Y		; D7 73
	ora ($35.b,S),Y		; 13 35
	jmp.w [$6DC0]		; DC C0 6D
	lda $DC.b,X		; B5 DC
	cpy $CD.b		; C4 CD
	ror $D8.b,X		; 76 D8
	rol $E5BB.w		; 2E BB E5
	cmp $D5.b,X		; D5 D5
	cmp $D0.b,X		; D5 D0
	eor $CB77.w,X		; 5D 77 CB
	plb		; AB
	plb		; AB
	plb		; AB
	ldy #$F2.b		; A0 F2
	clc		; 18
	eor $1616.w,X		; 5D 16 16
	ora [$40.b],Y		; 17 40
	asl $0B43.w,X		; 1E 43 0B
	ldx #$C2.b		; A2 C2
.ACCU 16
.INDEX 16
	rep #$F7		; C2 F7
	sta ($F7.b,X)		; 81 F7
	lsr $9C.b,X		; 56 9C
	ora $A5.b		; 05 A5
	lda [$F1.b]		; A7 F1
	ora [$9A.b]		; 07 9A
	ldy $E0.b,X		; B4 E0
	and $3F2D.w		; 2D 2D 3F
	bcc  54.b		; 90 36
	inc A		; 1A
	lda $96A5.w		; AD A5 96
	plb		; AB
	rts		; 60

	tas		; 1B
	eor $D256.w		; 4D 56 D2
	wai		; CB
	eor $B0.b,X		; 55 B0
	asl $0383.w		; 0E 83 03
	ora $03.b,S		; 03 03
	ora $A0.b,S		; 03 A0
	ora $06C6.w		; 0D C6 06
	asl $06.b		; 06 06
	asl $E0.b		; 06 E0
	rol A		; 2A
	bcc   0.b		; 90 00
	brk $58.b		; 00 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $58.b,S		; 23 58
	and $FF.b,S		; 23 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $007FFF.l,X		; 7F FF 7F 00
	brk $54.b		; 00 54
	and ($00.b,X)		; 21 00
	adc ($D6.b),Y		; 71 D6
	phy		; 5A
	phy		; 5A
	rtl		; 6B

	asl $0019.w		; 0E 19 00
	cli		; 58
	dec $18.b		; C6 18
	bpl  25.b		; 10 19
	php		; 08
	and ($CE.b,X)		; 21 CE
	and $318C.w,Y		; 39 8C 31
	sty $10.b		; 84 10
	asl $32.b,X		; 16 32
	trb $1F4B.w		; 1C 4B 1F
	brk $00.b		; 00 00
	brk $54.b		; 00 54
	and ($00.b,X)		; 21 00
	adc ($D6.b),Y		; 71 D6
	phy		; 5A
	phy		; 5A
	rtl		; 6B

	asl $0019.w		; 0E 19 00
	cli		; 58
	dec $18.b		; C6 18
	bpl  25.b		; 10 19
	php		; 08
	and ($CE.b,X)		; 21 CE
	and $318C.w,Y		; 39 8C 31
	sty $10.b		; 84 10
	asl $32.b,X		; 16 32
	trb $1F4B.w		; 1C 4B 1F
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $267FFF.l,X		; 7F FF 7F 26
	xce		; FB
	brk $07.b		; 00 07
	asl $04.b		; 06 04
	brk $E1.b		; 00 E1
	lsr $96.b		; 46 96
	tad		; 5B
	ora ($C9.b,S),Y		; 13 C9
	ora ($18.b,S),Y		; 13 18
	cop $C2.b		; 02 C2
	eor ($B8.b,X)		; 41 B8
	bit $D5.b,X		; 34 D5
	pei ($74.b)		; D4 74
	ora $A04B.w,X		; 1D 4B A0
	cpx #$B274.w		; E0 74 B2
	ora ($1F.b,S),Y		; 13 1F
	inc A		; 1A
	sec		; 38
	pla		; 68
	sbc #$BAB7.w		; E9 B7 BA
	mvp $BF,$CA		; 44 CA BF
	and $07.b,S		; 23 07
	cld		; D8
	bcc  90.b		; 90 5A
	ora ($49.b)		; 12 49
	bit $92.b		; 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor ($44.b,X)		; 41 44
	and #$440C.w		; 29 0C 44
	ldx $0B49.w,Y		; BE 49 0B
	eor $41.b		; 45 41
	ldy $74.b,X		; B4 74
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
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9224.w		; 49 24 92
	eor #$9324.w		; 49 24 93
	and $DA98.w,X		; 3D 98 DA
	ldy $00.b,X		; B4 00
	dec $46.b		; C6 46
	bra -93.b		; 80 A3
	rts		; 60

	bne  49.b		; D0 31
	lda ($6C.b),Y		; B1 6C
	txy		; 9B
	sbc ($7F.b,S),Y		; F3 7F
	cli		; 58
	lda ($62.b),Y		; B1 62
	cmp $8B.b		; C5 8B
	asl $2C.b,X		; 16 2C
	cli		; 58
	lda ($62.b),Y		; B1 62
	cmp $8B.b		; C5 8B
	asl $2C.b,X		; 16 2C
	jmp ($039C.w)		; 6C 9C 03
	sta ($68.b,X)		; 81 68
	asl $E0.b,X		; 16 E0
	txy		; 9B
	rol $D1.b,X		; 36 D1
	sty $B5.b,X		; 94 B5
	ror A		; 6A
	cmp $AB.b,X		; D5 AB
	lsr $AD.b,X		; 56 AD
	phy		; 5A
	lda $6A.b,X		; B5 6A
	cmp $AB.b,X		; D5 AB
	lsr $AD.b,X		; 56 AD
	phy		; 5A
	cmp $8EB6.w,Y		; D9 B6 8E
	ora $5BA0.w		; 0D A0 5B
	ror A		; 6A
	sbc ($17.b,X)		; E1 17
	rol $B95C.w		; 2E 5C B9
	adc ($E5.b)		; 72 E5
	wai		; CB
	sta [$2E.b],Y		; 97 2E
	jmp $E572B9.l		; 5C B9 72 E5
	wai		; CB
	sta [$2E.b],Y		; 97 2E
	bvs -82.b		; 70 AE
	ora $B4C3.w,Y		; 19 C3 B4
	phd		; 0B
	adc ($0E.b),Y		; 71 0E
	and $C5.b		; 25 C5
	and $7BBD5E.l		; 2F 5E BD 7B
	jmp ($66CB.w)		; 6C CB 66
	and ($19.b,S),Y		; 33 19
	sty $16C7.w		; 8C C7 16
	wai		; CB
	lsr $7ABD.w,X		; 5E BD 7A
	inc $D9.b,X		; F6 D9
	txs		; 9A
	dec $1868.w		; CE 68 18
	cmp $8E7162.l		; CF 62 71 8E
	and $B7.b,X		; 35 B7
	ror $761B.w		; 6E 1B 76
	sbc $96.b		; E5 96
	sbc $9C.b,S		; E3 9C
	tda		; 7B
	tas		; 1B
	bcc 100.b		; 90 64
	adc ($2E.b)		; 72 2E
	eor #$72B7.w		; 49 B7 72
	ror $CA51.w		; 6E 51 CA
	lda ($59.b,S),Y		; B3 59
	cmp $1903.w		; CD 03 19
	cpx $D34D.w		; EC 4D D3
	stx $60.b,Y		; 96 60
	bne -125.b		; D0 83
	eor $39.b		; 45 39
	ror $5B.b,X		; 76 5B
	tax		; AA
	dec A		; 3A
	plb		; AB
	plb		; AB
	dec A		; 3A
	tyx		; BB
	ldy $CB3A.w		; AC 3A CB
	lda $D629.w		; AD 29 D6
	cmp $D771.w,X		; DD 71 D7
	eor $E7AC.w,Y		; 59 AC E7
	lsr $F775.w,X		; 5E 75 F7
	rts		; 60

	ror $10.b,X		; 76 10
	brk $67.b		; 00 67
	lda ($37.b),Y		; B1 37
	lsr $ECC4.w		; 4E C4 EC
	ror $ECC8.w		; 6E C8 EC
	ldx $CBCC.w		; AE CC CB
	ror $77.b,X		; 76 77
	pla		; 68
	ror $97.b,X		; 76 97
	ror A		; 6A
	ror $B7.b,X		; 76 B7
	jmp ($D776.w)		; 6C 76 D7
	ror $F776.w		; 6E 76 F7
	bvs 119.b		; 70 77
	asl $6B.b,X		; 16 6B
	and $9DDC.w,Y		; 39 DC 9D
	cmp $1DDD.w		; CD DD 1D
	pei ($00.b)		; D4 00
	ora $4EEC.w,Y		; 19 EC 4E
	cpx $EEEE.w		; EC EE EE
	adc ($CC.b,X)		; 61 CC
	tyx		; BB
	cmp $BC.b,S		; C3 BC
	tyx		; BB
	cmp ($BD.b,S),Y		; D3 BD
	tyx		; BB
	sbc $BE.b,S		; E3 BE
	tyx		; BB
	sbc ($BF.b,S),Y		; F3 BF
	ldy $C003.w,X		; BC 03 C0
	ldy $C113.w,X		; BC 13 C1
	ldy $C223.w,X		; BC 23 C2
	lda ($59.b,S),Y		; B3 59
	cmp $EEF00C.l		; CF 0C F0 EE
	adc #$B7CD.w		; 69 CD B7
	adc $76DB.w		; 6D DB 76
	cmp $5AB4.w,X		; DD B4 5A
	and $F1C410.l		; 2F 10 C4 F1
	and $78E3.w		; 2D E3 78
	sbc ($4D.b),Y		; F1 4D
	sbc $78.b,S		; E3 78
	sbc ($6F.b),Y		; F1 6F
	clc		; 18
	sbc ($AF.b),Y		; F1 AF
	trb $EFF1.w		; 1C F1 EF
	jsr $2FF2.w		; 20 F2 2F
	bit $F2.b		; 24 F2
	adc $AFF228.l		; 6F 28 F2 AF
	bit $EDF2.w		; 2C F2 ED
	xba		; EB
	cpy $CB3C.w		; CC 3C CB
	cmp $DB3C.w		; CD 3C DB
	eor $A2.b		; 45 A2
	cmp ($68.b),Y		; D1 68
	ldy $9A.b,X		; B4 9A
	lsr $8971.w		; 4E 71 89
	dec $E3BC.w		; CE BC E3
	dec $F3BC.w		; CE BC F3
	cmp $9E03BD.l		; CF BD 03 9E
	ply		; 7A
	ora [$A2.b],Y		; 17 A2
	ply		; 7A
	and [$A4.b],Y		; 37 A4
	ply		; 7A
	eor [$A6.b],Y		; 57 A6
	ply		; 7A
	adc [$A8.b],Y		; 77 A8
	ply		; 7A
	sta [$AA.b],Y		; 97 AA
	ply		; 7A
	lda [$3E.b],Y		; B7 3E
	dec $07BA.w,X		; DE BA 07
	.db $42, $E8		; 42 E8
	sta $491B.w,X		; 9D 1B 49
	ldy $D2.b		; A4 D2
	adc #$DA34.w		; 69 34 DA
	adc $F5C458.l		; 6F 58 C4 F5
	lda $EFF55C.l		; AF 5C F5 EF
	rts		; 60

	inc $2F.b,X		; F6 2F
	stz $E7.b		; 64 E7
	stz $EDCD.w,X		; 9E CD ED
	asl $EDD5.w,X		; 1E D5 ED
	stz $EEDD.w,X		; 9E DD EE
	asl $EEE5.w,X		; 1E E5 EE
	stz $EFED.w,X		; 9E ED EF
	asl $CFF5.w,X		; 1E F5 CF
	lda [$AE.b],Y		; B7 AE
	sta ($D2.b),Y		; 91 D2
	lda $DFF3.w,X		; BD F3 DF
	ldy $DA.b,X		; B4 DA
	adc $9B36.w		; 6D 36 9B
	eor ($A8.b),Y		; 51 A8
	sed		; F8
	tsb $824F.w		; 0C 4F 82
	sed		; F8
	eor $9DE986.l		; 4F 86 E9 9D
	tsa		; 3B
.ACCU 8
.INDEX 8
	sep #$3E		; E2 3E
	pld		; 2B
	sbc $3E.b,S		; E3 3E
	tsa		; 3B
	cpx $3E.b		; E4 3E
	phk		; 4B
	sbc $3E.b		; E5 3E
	tad		; 5B
	inc $3E.b		; E6 3E
	rtl		; 6B

	sbc [$3E.b]		; E7 3E
	tda		; 7B
	inx		; E8
	rol $E98B.w,X		; 3E 8B E9
	rol $EA9B.w,X		; 3E 9B EA
	rol $EBAB.w,X		; 3E AB EB
	and $1A.b,X		; 35 1A
	sta $A346.w		; 8D 46 A3
	eor $AA.b,X		; 55 AA
	plx		; FA
	sbc $2FFBB0.l		; EF B0 FB 2F
	ldy $FB.b,X		; B4 FB
	adc $AFFBB8.l		; 6F B8 FB AF
	ldy $EFFB.w,X		; BC FB EF
	cpy #$FC.b		; C0 FC
	and $7CF3.w		; 2D F3 7C
	cmp $C4CF37.l,X		; DF 37 CF C4
	jsr ($C86F.w,X)		; FC 6F C8
	jsr ($CCAF.w,X)		; FC AF CC
	jsr ($D0EF.w,X)		; FC EF D0
	sbc $D42F.w,X		; FD 2F D4
	sbc $D86F.w,X		; FD 6F D8
	cmp $6A.b,X		; D5 6A
	lda $5A.b,X		; B5 5A
	lda $B366.w		; AD 66 B3
	inc $BF.b,X		; F6 BF
	adc ($F7.b,S),Y		; 73 F7
	lda $BFF883.l,X		; BF 83 F8 BF
	sta ($F9.b,S),Y		; 93 F9
	lda $BAFAA3.l,X		; BF A3 FA BA
	sta [$52.b]		; 87 52
	cmp [$6B.b],Y		; D7 6B
	lda $DA.b,X		; B5 DA
	sbc $F677.w		; ED 77 F6
	adc $7FF877.l,X		; 7F 77 F8 7F
	sta [$FA.b],Y		; 97 FA
	adc $7FFCB7.l,X		; 7F B7 FC 7F
	cmp [$FE.b],Y		; D7 FE
	adc $356BF2.l,X		; 7F F2 6B 35
	txs		; 9A
	cmp #$24.b		; C9 24
	cld		; D8
	eor $D98C.w		; 4D 8C D9
	eor $6FFA.w		; 4D FA 6F
	sbc ($C9.b)		; F2 C9
	cpy #$4E.b		; C0 4E
	asl $70.b		; 06 70
	eor ($67.b,S),Y		; 53 67
	rol $93.b,X		; 36 93
	rol A		; 2A
	adc $4C.b		; 65 4C
	lda #$95.b		; A9 95
	and $1C9C.w		; 2D 9C 1C
	phx		; DA
	dec $5D12.w		; CE 12 5D
	sec		; 38
	eor $4EC3.w,Y		; 59 C3 4E
	asl $1371.w,X		; 1E 71 13
	bit #$9B.b		; 89 9B
	and #$C5.b		; 29 C5
	eor $5F05.w		; 4D 05 5F
	and $E5CB97.l		; 2F 97 CB E5
	sbc ($6D.b,S),Y		; F3 6D
	and ($E6.b)		; 32 E6
	stz $E2.b		; 64 E2
	inc $6C.b		; E6 6C
	dec $F399.w		; CE 99 F3
	trb $C5.b		; 14 C5
	and ($4C.b),Y		; 31 4C
	eor ($14.b,S),Y		; 53 14
	cmp $31.b		; C5 31
	lsr $7132.w		; 4E 32 71
	lda ($6F.b,S),Y		; B3 6F
	and [$13.b],Y		; 37 13
	adc ($38.b,S),Y		; 73 38
	sbc #$C7.b		; E9 C7
	wai		; CB
	sbc $F2.b		; E5 F2
	sbc $BE7C.w,Y		; F9 7C BE
	eor $73CC31.l,X		; 5F 31 CC 73
	trb $31C7.w		; 1C C7 31
	dec $6442.w		; CE 42 64
	sta $2327.w,Y		; 99 27 23
	and $C929.w,Y		; 39 29 C9
	cpy $2493.w		; CC 93 24
	cmp #$32.b		; C9 32
	jmp $2493.w		; 4C 93 24
	cmp #$32.b		; C9 32
	jmp $9493.w		; 4C 93 94
	stz $DDAC.w		; 9C AC DD
	jmp $2493.w		; 4C 93 24
	sbc $A6.b		; E5 A6
	and $638E.w,Y		; 39 8E 63
	tya		; 98
	inc $39.b		; E6 39
	stx $3061.w		; 8E 61 30
	tya		; 98
	jmp $1326.w		; 4C 26 13
	ora #$84.b		; 09 84
.ACCU 16
	rep #$61		; C2 61
	bmi -104.b		; 30 98
	jmp $1326.w		; 4C 26 13
	ora #$C284.w		; 09 84 C2
	adc ($30.b,X)		; 61 30
	tya		; 98
	jmp $1326.w		; 4C 26 13
	ora #$C284.w		; 09 84 C2
	adc ($30.b,X)		; 61 30
	tya		; 98
	jmp $1326.w		; 4C 26 13
	ora #$C284.w		; 09 84 C2
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
	lda $29.b		; A5 29
	lsr A		; 4A
	pla		; 68
	pha		; 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	rol A		; 2A
	jsr $0000.w		; 20 00 00
	rol A		; 2A
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	phd		; 0B
	cpx #$00.b		; E0 00
	brk $0B.b		; 00 0B
	cpx #$00.b		; E0 00
	brk $0B.b		; 00 0B
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	pld		; 2B
	rti		; 40

	brk $00.b		; 00 00
	pld		; 2B
	rti		; 40

	brk $00.b		; 00 00
	pld		; 2B
	rti		; 40

	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0000.w		; 0C 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	bit $0060.w		; 2C 60 00
	brk $2C.b		; 00 2C
	rts		; 60

	brk $00.b		; 00 00
	bit $0060.w		; 2C 60 00
	brk $2C.b		; 00 2C
	rts		; 60

	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	rol A		; 2A
	jsr $0000.w		; 20 00 00
	rol A		; 2A
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	phd		; 0B
	cpx #$00.b		; E0 00
	brk $0B.b		; 00 0B
	cpx #$00.b		; E0 00
	brk $0B.b		; 00 0B
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	pld		; 2B
	rti		; 40

	brk $00.b		; 00 00
	pld		; 2B
	rti		; 40

	brk $00.b		; 00 00
	pld		; 2B
	rti		; 40

	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	cpx #$00.b		; E0 00
	brk $60.b		; 00 60
	cpx #$00.b		; E0 00
	brk $60.b		; 00 60
	cpx #$00.b		; E0 00
	brk $60.b		; 00 60
	cpx #$00.b		; E0 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	jsr $0000.w		; 20 00 00
	rts		; 60

	jsr $0000.w		; 20 00 00
	rts		; 60

	jsr $0000.w		; 20 00 00
	rts		; 60

	jsr $0000.w		; 20 00 00
	rts		; 60

	brk $00.b		; 00 00
	bit $0060.w		; 2C 60 00
	brk $2C.b		; 00 2C
	rts		; 60

	brk $00.b		; 00 00
	bit $0060.w		; 2C 60 00
	brk $2C.b		; 00 2C
	rts		; 60

	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pld		; 2B
	brk $00.b		; 00 00
	brk $2B.b		; 00 2B
	brk $00.b		; 00 00
	brk $2B.b		; 00 2B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2B.b		; 00 2B
	brk $00.b		; 00 00
	brk $2B.b		; 00 2B
	brk $00.b		; 00 00
	brk $2B.b		; 00 2B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
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
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2C.b		; 00 2C
	brk $00.b		; 00 00
	brk $2C.b		; 00 2C
	brk $00.b		; 00 00
	brk $2C.b		; 00 2C
	brk $00.b		; 00 00
	brk $2C.b		; 00 2C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2A.b		; 00 2A
	brk $00.b		; 00 00
	brk $2A.b		; 00 2A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $0A.b		; 00 0A
	cpx #$00.b		; E0 00
	brk $0A.b		; 00 0A
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	pld		; 2B
	jsr $0000.w		; 20 00 00
	pld		; 2B
	jsr $0000.w		; 20 00 00
	pld		; 2B
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	tsb $00C0.w		; 0C C0 00
	brk $0C.b		; 00 0C
	cpy #$00.b		; C0 00
	brk $0C.b		; 00 0C
	cpy #$00.b		; C0 00
	brk $0C.b		; 00 0C
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol A		; 2A
	brk $00.b		; 00 00
	brk $2A.b		; 00 2A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
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
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
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
	jsr $0000.w		; 20 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2A.b		; 00 2A
	brk $00.b		; 00 00
	brk $2A.b		; 00 2A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $0D.b		; 00 0D
	cpx #$00.b		; E0 00
	brk $0D.b		; 00 0D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $00		; Opcode 00 overrunning bank boundry at 0F7FFE. Skipping.
	.db $00		; Opcode 00 overrunning bank boundry at 0F7FFF. Skipping.
.ENDS
