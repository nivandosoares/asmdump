.BANK 16 SLOT 0
.ORG $0000

.SECTION "Bank16" FORCE

	asl A		; 0A
	bra  32.b		; 80 20
	brk $E8.b		; 00 E8
	clc		; 18
	dec $E8FF.w,X		; DE FF E8
	sbc $00FFDE.l,X		; FF DE FF 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $02FFDE.l,X		; FF DE FF 02
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $DE.b		; 00 DE
	sbc $000004.l,X		; FF 04 00 00
	brk $18.b		; 00 18
	brk $DE.b		; 00 DE
	sbc $000006.l,X		; FF 06 00 00
	brk $E8.b		; 00 E8
	sbc $08FFEE.l,X		; FF EE FF 08
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $0AFFEE.l,X		; FF EE FF 0A
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $EE.b		; 00 EE
	sbc $004008.l,X		; FF 08 40 00
	brk $F9.b		; 00 F9
	sbc $0CFFEE.l,X		; FF EE FF 0C
	brk $00.b		; 00 00
	brk $E9.b		; 00 E9
	sbc $0EFFFE.l,X		; FF FE FF 0E
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $FE.b		; 00 FE
	sbc $00000E.l,X		; FF 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	cop $06.b		; 02 06
	tsb $0C.b		; 04 0C
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $01.b,S		; 03 01
	ora [$03.b]		; 07 03
	ora $0F0F03.l		; 0F 03 0F 0F
	sec		; 38
	bmi  96.b		; 30 60
	rti		; 40

	cld		; D8
	tya		; 98
	bcs  48.b		; B0 30
	rts		; 60

	rts		; 60

	cpx #$B0E0.w		; E0 E0 B0
	bcs  15.b		; B0 0F
	brk $3F.b		; 00 3F
	ora $E33F7F.l		; 0F 7F 3F E3
	sei		; 78
	cmp [$F0.b]		; C7 F0
	sta [$E0.b]		; 87 E0
	ora [$E0.b]		; 07 E0
	ora [$B0.b]		; 07 B0
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00C0FF.l,X		; FF FF C0 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	ora ($03.b,X)		; 01 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $F8.b,S		; 03 F8
	sed		; F8
	asl $0306.w		; 0E 06 03
	ora ($0D.b,X)		; 01 0D
	tsb $0606.w		; 0C 06 06
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	asl $06.b		; 06 06
	sed		; F8
	brk $F6.b		; 00 F6
	beq  -1.b		; F0 FF
	inc $CFC3.w,X		; FE C3 CF
	sbc ($E7.b,X)		; E1 E7
	beq -13.b		; F0 F3
	beq -13.b		; F0 F3
	beq -10.b		; F0 F6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$6040.w		; C0 40 60
	jsr $90B0.w		; 20 B0 90
	tya		; 98
	tya		; 98
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E080.w		; C0 80 E0
	cpy #$E070.w		; C0 70 E0
	sei		; 78
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $807FFF.l,X		; FF FF 7F 80
	adc $E01F80.l,X		; 7F 80 1F E0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	and $00003F.l,X		; 3F 3F 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	lda $BD00.w,X		; BD 00 BD
	brk $BC.b		; 00 BC
	lda $00FF.w,X		; BD FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	eor $FE.b,S		; 43 FE
	eor $FE.b,S		; 43 FE
	eor $42.b,S		; 43 42
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	cmp [$2F.b]		; C7 2F
	cmp [$2F.b]		; C7 2F
	ora [$EF.b]		; 07 EF
	sbc $00FF00.l		; EF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sed		; F8
	ora [$F8.b],Y		; 17 F8
	ora [$F8.b],Y		; 17 F8
	ora [$FF.b],Y		; 17 FF
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $F300FF.l,X		; FF FF 00 F3
	sed		; F8
	sbc ($F8.b,S),Y		; F3 F8
	beq  -5.b		; F0 FB
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0FF40F.l,X		; FF 0F F4 0F
	pea $F40F.w		; F4 0F F4
	sbc $000007.l,X		; FF 07 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sta $5F8F5F.l		; 8F 5F 8F 5F
	ora $00DFDF.l		; 0F DF DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	beq  47.b		; F0 2F
	beq  47.b		; F0 2F
	beq  47.b		; F0 2F
	sbc $0000E0.l,X		; FF E0 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc [$F0.b]		; E7 F0
	sbc [$F0.b]		; E7 F0
	cpx #$F7F7.w		; E0 F7 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1FE81F.l,X		; FF 1F E8 1F
	inx		; E8
	ora $0FFFE8.l,X		; 1F E8 FF 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7E7EFF.l,X		; FF FF 7E 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1D09.w		; 0D 09 1D
	ora $1F1F.w,Y		; 19 1F 1F
	ora $201F23.l,X		; 1F 23 1F 20
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	adc $070E7F.l,X		; 7F 7F 0E 07
	asl $1F07.w,X		; 1E 07 1F
	brk $1F.b		; 00 1F
	trb $0303.w		; 1C 03 03
	bpl  16.b		; 10 10
	adc $80807F.l,X		; 7F 7F 80 80
	bcc -112.b		; 90 90
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ldy $0FBD.w,X		; BC BD 0F
	bcc   0.b		; 90 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $004243.l,X		; FF 43 42 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $000000.l,X		; FF 00 00 00
	cpx #$00F0.w		; E0 F0 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $1FFFFF.l,X		; FF FF FF 1F
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora [$07.b]		; 07 07
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $8080FF.l,X		; FF FF 80 80
	sbc $FCFFFF.l,X		; FF FF FF FC
	tsb $FF0C.w		; 0C 0C FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $1E0000.l,X		; FF 00 00 1E
	dec $FCF0.w,X		; DE F0 FC
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $21E1FF.l,X		; FF FF E1 21
	cld		; D8
	iny		; C8
	jmp.w [$FCCC]		; DC CC FC
	jsr ($E2FC.w,X)		; FC FC E2
	jsr ($0002.w,X)		; FC 02 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $3CF038.l,X		; FF 38 F0 3C
	beq  -4.b		; F0 FC
	brk $FC.b		; 00 FC
	trb $E0E0.w		; 1C E0 E0
	brk $00.b		; 00 00
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
	and $601FC0.l,X		; 3F C0 1F 60
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0F0FFF.l,X		; FF FF 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $2080.w		; 0C 80 20
	brk $E4.b		; 00 E4
	trb $FFD9.w		; 1C D9 FF
	sbc $FF.b		; E5 FF
	cmp $00FF.w,Y		; D9 FF 00
	brk $00.b		; 00 00
	brk $F5.b		; 00 F5
	sbc $02FFD9.l,X		; FF D9 FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $D9.b		; 00 D9
	sbc $000004.l,X		; FF 04 00 00
	brk $15.b		; 00 15
	brk $D9.b		; 00 D9
	sbc $000006.l,X		; FF 06 00 00
	brk $E4.b		; 00 E4
	sbc $08FFE9.l,X		; FF E9 FF 08
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $0AFFE9.l,X		; FF E9 FF 0A
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $E9.b		; 00 E9
	sbc $004008.l,X		; FF 08 40 00
	brk $FD.b		; 00 FD
	sbc $0AFFE9.l,X		; FF E9 FF 0A
	rti		; 40

	brk $00.b		; 00 00
	sbc $FF.b		; E5 FF
	sbc $0CFF.w,Y		; F9 FF 0C
	brk $00.b		; 00 00
	brk $F5.b		; 00 F5
	sbc $0EFFF9.l,X		; FF F9 FF 0E
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $F9.b		; 00 F9
	sbc $00400C.l,X		; FF 0C 40 00
	brk $FC.b		; 00 FC
	sbc $0EFFF9.l,X		; FF F9 FF 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	asl $0E.b		; 06 0E
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	ora ($0D.b,X)		; 01 0D
	ora #$0F0F.w		; 09 0F 0F
	bit $7038.w,X		; 3C 38 70
	rts		; 60

	inx		; E8
	iny		; C8
	cld		; D8
	tya		; 98
	bcs  48.b		; B0 30
	jsr $7820.w		; 20 20 78
	sei		; 78
	ora $073F00.l		; 0F 00 3F 07
	adc $38F11F.l,X		; 7F 1F F1 38
	sbc $78.b,S		; E3 78
	cmp $F0.b,S		; C3 F0
	cmp $E0.b,S		; C3 E0
	sta $F8.b,S		; 83 F8
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00F0FF.l,X		; FF FF F0 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
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
	brk $FF.b		; 00 FF
	sbc $1EFFFF.l,X		; FF FF FF 1E
	asl $3F3F.w,X		; 1E 3F 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $E0E03F.l,X		; 3F 3F E0 E0
	sei		; 78
	sec		; 38
	trb $6E0C.w		; 1C 0C 6E
	ror $37.b		; 66 37
	and ($1B.b,S),Y		; 33 1B
	ora $0809.w,Y		; 19 09 08
	bit $E03C.w,X		; 3C 3C E0
	brk $B8.b		; 00 B8
	bra  -4.b		; 80 FC
	beq  30.b		; F0 1E
	sei		; 78
	ora $1E073C.l		; 0F 3C 07 1E
	sta [$8F.b]		; 87 8F
	sta $BF.b,S		; 83 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $407F7F.l,X		; 7F 7F 7F 40
	adc $7F7F40.l,X		; 7F 40 7F 7F
	brk $00.b		; 00 00
	adc $807F80.l,X		; 7F 80 7F 80
	adc $00007F.l,X		; 7F 7F 00 00
	brk $3F.b		; 00 3F
	bra -65.b		; 80 BF
	bra -128.b		; 80 80
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00EFEF.l		; EF EF EF 00
	sbc $EFEF00.l		; EF 00 EF EF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1010FF.l,X		; FF FF 10 10
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bpl  16.b		; 10 10
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	sei		; 78
	ora $78.b		; 05 78
	ora $00.b		; 05 00
	adc $0100.w,X		; 7D 00 01
	sbc $FF00.w,X		; FD 00 FF
	brk $FF.b		; 00 FF
	sbc $FF83FF.l,X		; FF FF 83 FF
	.db $82, $FF, $82		; 82 FF 82
	sbc $FEFF82.l,X		; FF 82 FF FE
	sbc $0000FE.l,X		; FF FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $1C0C.w		; 0C 0C 1C
	php		; 08
	ora $3F19.w,X		; 1D 19 3F
	trb $1F3F.w		; 1C 3F 1F
	ora $EC0360.l,X		; 1F 60 03 EC
	brk $EF.b		; 00 EF
	ora $171F03.l		; 0F 03 1F 17
	asl $1C07.w,X		; 1E 07 1C
	brk $3F.b		; 00 3F
	jsr $0303.w		; 20 03 03
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	cld		; D8
	cld		; D8
	iny		; C8
	iny		; C8
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $D8.b,S		; 03 D8
	ora [$C8.b]		; 07 C8
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sed		; F8
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $EF00FF.l,X		; FF FF 00 EF
	brk $00.b		; 00 00
	sbc $000000.l		; EF 00 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $101010.l,X		; FF 10 10 10
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $7F3F3F.l,X		; FF 3F 3F 7F
	adc $00FF00.l,X		; 7F 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $76.b		; 00 76
	ror $66.b,X		; 76 66
	ror $FF.b		; 66 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $81F781.l,X		; FF 81 F7 81
	sbc [$00.b]		; E7 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	rts		; 60

	beq  32.b		; F0 20
	beq  48.b		; F0 30
	sed		; F8
	bvs  -8.b		; 70 F8
	beq -16.b		; F0 F0
	tsb $6E80.w		; 0C 80 6E
	brk $EE.b		; 00 EE
	cpx #$7080.w		; E0 80 70
	bvc 112.b		; 50 70
	rti		; 40

	beq -128.b		; F0 80
	sed		; F8
	php		; 08
	bra -128.b		; 80 80
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0000E0.l,X		; 1F E0 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	adc $807F80.l,X		; 7F 80 7F 80
	and $7F0040.l,X		; 3F 40 00 7F
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
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
	brk $00.b		; 00 00
	asl $2480.w		; 0E 80 24
	brk $E0.b		; 00 E0
	and ($D4.b,X)		; 21 D4
	sbc $D4FFE3.l,X		; FF E3 FF D4
	sbc $000000.l,X		; FF 00 00 00
	brk $F3.b		; 00 F3
	sbc $02FFD4.l,X		; FF D4 FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $D4.b		; 00 D4
	sbc $000004.l,X		; FF 04 00 00
	brk $13.b		; 00 13
	brk $D4.b		; 00 D4
	sbc $000006.l,X		; FF 06 00 00
	brk $E0.b		; 00 E0
	sbc $08FFE4.l,X		; FF E4 FF 08
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $0AFFE4.l,X		; FF E4 FF 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E4.b		; 00 E4
	sbc $00000C.l,X		; FF 0C 00 00
	brk $12.b		; 00 12
	brk $E4.b		; 00 E4
	sbc $004008.l,X		; FF 08 40 00
	brk $02.b		; 00 02
	brk $E4.b		; 00 E4
	sbc $00400A.l,X		; FF 0A 40 00
	brk $E0.b		; 00 E0
	sbc $0EFFF4.l,X		; FF F4 FF 0E
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $20FFF4.l,X		; FF F4 FF 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $000020.l,X		; FF 20 00 00
	brk $12.b		; 00 12
	brk $F4.b		; 00 F4
	sbc $00400E.l,X		; FF 0E 40 00
	brk $02.b		; 00 02
	brk $F4.b		; 00 F4
	sbc $000020.l,X		; FF 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	asl $0E.b		; 06 0E
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$01.b]		; 07 01
	ora $070703.l		; 0F 03 07 07
	rol $7038.w,X		; 3E 38 70
	rts		; 60

	cpx $D8CC.w		; EC CC D8
	tya		; 98
	bcs  48.b		; B0 30
	jsr $7020.w		; 20 20 70
	bvs   7.b		; 70 07
	brk $3B.b		; 00 3B
	ora $7F.b,S		; 03 7F
	ora $E13CF0.l,X		; 1F F0 3C E1
	sei		; 78
	cmp ($F0.b,X)		; C1 F0
	cmp ($E0.b,X)		; C1 E0
	sta ($F0.b,X)		; 81 F0
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FCFF.l,X		; FF FF FC 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
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
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	ora ($03.b,X)		; 01 03
	ora $03.b,S		; 03 03
	ora $07.b,S		; 03 07
	ora [$07.b]		; 07 07
	ora [$FE.b]		; 07 FE
	inc $0107.w,X		; FE 07 01
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FD00.w,X		; FE 00 FD
	jsr ($FFFF.w,X)		; FC FF FF
	cpx #$F0E3.w		; E0 E3 F0
	sbc ($F0.b),Y		; F1 F0
	beq  -8.b		; F0 F8
	sed		; F8
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	cpy #$E0C0.w		; C0 C0 E0
	rts		; 60

	bvs  48.b		; 70 30
	clv		; B8
	tya		; 98
	jmp.w [$4ECC]		; DC CC 4E
	lsr $E7.b		; 46 E7
	sbc $00.b,S		; E3 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	bra -16.b		; 80 F0
	cpy #$E078.w		; C0 78 E0
	bit $3EF0.w,X		; 3C F0 3E
	sei		; 78
	ora $0000FC.l,X		; 1F FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3B.b		; 00 3B
	brk $3B.b		; 00 3B
	brk $00.b		; 00 00
	and $203F3F.l,X		; 3F 3F 3F 20
	adc $407F40.l,X		; 7F 40 7F 40
	adc $04047F.l,X		; 7F 7F 04 04
	tsb $04.b		; 04 04
	and $40403F.l,X		; 3F 3F 40 40
	rti		; 40

	eor $80BF80.l,X		; 5F 80 BF 80
	lda $FF8080.l,X		; BF 80 80 FF
	brk $00.b		; 00 00
	sbc $FB0000.l,X		; FF 00 00 FB
	xce		; FB
	xce		; FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0404FF.l,X		; FF FF 04 04
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	tsb $04.b		; 04 04
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	cpx #$EFEF.w		; E0 EF EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $E0.b		; 00 E0
	sbc $000000.l		; EF 00 00 00
	brk $FF.b		; 00 FF
	sbc $1F101F.l,X		; FF 1F 10 1F
	beq  31.b		; F0 1F
	beq  31.b		; F0 1F
	beq  31.b		; F0 1F
	bpl  -1.b		; 10 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	cpy #$5F80.w		; C0 80 5F
	sta $5F8F5F.l		; 8F 5F 8F 5F
	ora $0000DF.l		; 0F DF 00 00
	brk $00.b		; 00 00
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $2FF020.l,X		; FF 20 F0 2F
	beq  47.b		; F0 2F
	beq  47.b		; F0 2F
	and $3F0000.l,X		; 3F 00 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	jsr ($FCFE.w,X)		; FC FE FC
	inc $FEFC.w,X		; FE FC FE
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$FFFF.w		; C0 FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	ora $FD.b,S		; 03 FD
	ora $FD.b,S		; 03 FD
	ora $FD.b,S		; 03 FD
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	ora ($FD.b,X)		; 01 FD
	adc $7D80.w,X		; 7D 80 7D
	bra 125.b		; 80 7D
	bra   1.b		; 80 01
	sbc $0000.w,X		; FD 00 00
	brk $00.b		; 00 00
	sbc $02FEFF.l,X		; FF FF FE 02
	inc $FE03.w,X		; FE 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	cop $7F.b		; 02 7F
	bra  63.b		; 80 3F
	cpy #$601F.w		; C0 1F 60
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $07071F.l,X		; 1F 1F 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $00FF3F.l,X		; 3F 3F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	beq -16.b		; F0 F0
	asl $1C08.w		; 0E 08 1C
	clc		; 18
	trb $3D10.w		; 1C 10 3D
	and ($3F.b),Y		; 31 3F
	sec		; 38
	adc $877F3F.l,X		; 7F 3F 7F 87
	and $050DC0.l,X		; 3F C0 0D 05
	ora $0B1B07.l,X		; 1F 07 1B 0B
	dec A		; 3A
	phd		; 0B
	bit $7F04.w,X		; 3C 04 7F
	rti		; 40

	and $070738.l,X		; 3F 38 07 07
	sei		; 78
	sei		; 78
	jmp.w [$CCDC]		; DC DC CC
	cpy $FFFF.w		; CC FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sta ($F8.b,X)		; 81 F8
	ora ($DC.b,X)		; 01 DC
	ora $CC.b,S		; 03 CC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FE00.l,X		; FF 00 FE 00
	inc $FF00.w,X		; FE 00 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$0F.b]		; 07 0F
	ora $00FF00.l		; 0F 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $030101.l,X		; FF 01 01 03
	ora $03.b,S		; 03 03
	ora $FF.b,S		; 03 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $F8.b		; 00 F8
	sbc $FBF8.w,Y		; F9 F8 FB
	jsr ($00FF.w,X)		; FC FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $B3E1E7.l,X		; FF E7 E1 B3
	lda ($33.b),Y		; B1 33
	bmi  -5.b		; 30 FB
	sed		; F8
	sbc $FFFF01.l,X		; FF 01 FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	tas		; 1B
	plx		; FA
	ora $3D0DBE.l		; 0F BE 0D 3D
	ora $FD.b		; 05 FD
	ora $02.b,S		; 03 02
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $00FE.w,X		; FE FE 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpx #$E0C0.w		; E0 C0 E0
	bpl -64.b		; 10 C0
	bmi   0.b		; 30 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	jsr $C0C0.w		; 20 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $C03F80.l,X		; 7F 80 3F C0
	ora $0000F0.l		; 0F F0 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora $00DF1F.l		; 0F 1F DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	beq -17.b		; F0 EF
	sbc $0000E0.l,X		; FF E0 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	jsr ($FEFE.w,X)		; FC FE FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $030000.l,X		; FF 00 00 03
	sbc $01FF.w,X		; FD FF 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	asl $F7.b		; 06 F7
	sbc $F7FFFA.l,X		; FF FA FF F7
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F7.b		; 00 F7
	sbc $000001.l,X		; FF 01 00 00
	brk $FA.b		; 00 FA
	sbc $02FFFF.l,X		; FF FF FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $FF.b		; 00 FF
	sbc $000002.l,X		; FF 02 00 00
	brk $00.b		; 00 00
	and $7F5810.l,X		; 3F 10 58 7F
	sta [$F7.b]		; 87 F7
	sed		; F8
	sed		; F8
	ora $000000.l		; 0F 00 00 00
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	clc		; 18
	and $F00038.l,X		; 3F 38 00 F0
	beq   8.b		; F0 08
	sbc $0707FF.l,X		; FF FF 07 07
	sbc $E000FF.l,X		; FF FF 00 E0
	rti		; 40

	bne -16.b		; D0 F0
	php		; 08
	clv		; B8
	sec		; 38
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	cpx #$40E0.w		; E0 E0 40
	sei		; 78
	sed		; F8
	bra  -8.b		; 80 F8
	sed		; F8
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
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	bra   4.b		; 80 04
	brk $F8.b		; 00 F8
	ora #$FFF4.w		; 09 F4 FF
	sed		; F8
	sbc $00FFF4.l,X		; FF F4 FF 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $00FFF4.l,X		; FF F4 FF 00
	rti		; 40

	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	asl $36.b,X		; 16 36
	php		; 08
	lsr $433F.w		; 4E 3F 43
	ora $84.b,S		; 03 84
	eor $FCB6.w		; 4D B6 FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $16.b		; 00 16
	rol $2E.b		; 26 2E
	and $78783C.l,X		; 3F 3C 78 78
	pha		; 48
	bit $03.b,X		; 34 03
	sbc $00FFFF.l,X		; FF FF FF 00
	inc $1B1A.w,X		; FE 1A 1B
	tsb $1C.b		; 04 1C
	sbc $08F0F0.l,X		; FF F0 F0 08
	cpx $0F1B.w		; EC 1B 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	inc A		; 1A
	ora $FF1D.w,Y		; 19 1D FF
	ora $C4C7C7.l		; 0F C7 C7 C4
	phd		; 0B
	beq  -1.b		; F0 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	tsb $FB.b		; 04 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	sbc $E0E0EF.l		; EF EF E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F70800.l,X		; FF 00 08 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $FD.b		; 00 FD
	sbc $0101.w,X		; FD 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	plx		; FA
	asl $F7.b		; 06 F7
	sbc $F7FFFA.l,X		; FF FA FF F7
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F7.b		; 00 F7
	sbc $000001.l,X		; FF 01 00 00
	brk $FA.b		; 00 FA
	sbc $02FFFF.l,X		; FF FF FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $FF.b		; 00 FF
	sbc $000002.l,X		; FF 02 00 00
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	brk $FF.b		; 00 FF
	adc $00E8E0.l,X		; 7F E0 E8 00
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	ora [$FF.b],Y		; 17 FF
	sed		; F8
	brk $00.b		; 00 00
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpx #$1000.w		; E0 00 10
	brk $F0.b		; 00 F0
	sed		; F8
	sec		; 38
	clv		; B8
	brk $00.b		; 00 00
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$00F0.w		; C0 F0 00
	cpy #$F840.w		; C0 40 F8
	sed		; F8
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $F8.b		; 00 F8
	php		; 08
	pea $F8FF.w		; F4 FF F8
	sbc $00FFF4.l,X		; FF F4 FF 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $F4.b		; 00 F4
	sbc $000002.l,X		; FF 02 00 00
	brk $3F.b		; 00 3F
	brk $60.b		; 00 60
	jsr $3070.w		; 20 70 30
	adc $0000BF.l,X		; 7F BF 00 00
	sbc $FF8B.w,X		; FD 8B FF
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $0C604C.l,X		; 3F 4C 60 0C
	bmi 127.b		; 30 7F
	rti		; 40

	sbc $7106FF.l,X		; FF FF 06 71
	sbc $FFFFFE.l,X		; FF FE FF FF
	inc $0300.w,X		; FE 00 03
	cop $07.b		; 02 07
	asl $FF.b		; 06 FF
	inc $0000.w,X		; FE 00 00
	cmp $00FFE8.l,X		; DF E8 FF 00
	brk $00.b		; 00 00
	inc $19FE.w,X		; FE FE 19
	tas		; 1B
	clc		; 18
	asl $01FF.w,X		; 1E FF 01
	sbc $C730FF.l,X		; FF FF 30 C7
	sbc $FFFF3F.l,X		; FF 3F FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
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
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
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
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	xce		; FB
	asl $F4.b		; 06 F4
	sbc $F4FFFB.l,X		; FF FB FF F4
	sbc $000000.l,X		; FF 00 00 00
	brk $03.b		; 00 03
	brk $F4.b		; 00 F4
	sbc $000001.l,X		; FF 01 00 00
	brk $FB.b		; 00 FB
	sbc $02FFFC.l,X		; FF FC FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $02FFFC.l,X		; FF FC FF 02
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $007040.l,X		; 7F 40 70 00
	lda $80003F.l,X		; BF 3F 00 80
	and $001F7D.l,X		; 3F 7D 1F 00
	bra -128.b		; 80 80
	adc $008000.l,X		; 7F 00 80 00
	bcc  16.b		; 90 10
	cpy #$8000.w		; C0 00 80
	adc $FF807F.l,X		; 7F 7F 80 FF
	sbc $00007F.l,X		; FF 7F 00 00
	brk $A0.b		; 00 A0
	rts		; 60

	cpx #$F000.w		; E0 00 F0
	cpx #$1000.w		; E0 00 10
	cpx #$80E0.w		; E0 E0 80
	brk $10.b		; 00 10
	bpl -32.b		; 10 E0
	brk $50.b		; 00 50
	rti		; 40

	bcc -128.b		; 90 80
	bpl   0.b		; 10 00
	bpl -32.b		; 10 E0
	cpx #$F010.w		; E0 10 F0
	beq -32.b		; F0 E0
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	ora $C000C0.l,X		; 1F C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	php		; 08
	beq  -1.b		; F0 FF
	sed		; F8
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $000001.l,X		; FF 01 00 00
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	sbc $000002.l,X		; FF 02 00 00
	brk $F9.b		; 00 F9
	sbc $03FFF8.l,X		; FF F8 FF 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $004003.l,X		; FF 03 40 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $5C.b		; 00 5C
	jsr $007C.w		; 20 7C 00
	cpy #$083F.w		; C0 3F 08
	and [$00.b],Y		; 37 00
	brk $7F.b		; 00 7F
	adc $60003F.l,X		; 7F 3F 00 60
	brk $4C.b		; 00 4C
	tsb $0C4C.w		; 0C 4C 0C
	rti		; 40

	brk $3F.b		; 00 3F
	rti		; 40

	brk $7F.b		; 00 7F
	adc $000000.l,X		; 7F 00 00 00
	inc $0700.w,X		; FE 00 07
	clc		; 18
	ora $FE0100.l,X		; 1F 00 01 FE
	ora $01F7.w		; 0D F7 01
	ora ($FF.b,X)		; 01 FF
	adc $0300FE.l,X		; 7F FE 00 03
	brk $09.b		; 00 09
	clc		; 18
	ora $0118.w,Y		; 19 18 01
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $80FF.w,X		; FE FF 80
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
	ora $E01E00.l,X		; 1F 00 1E E0
	brk $00.b		; 00 00
	sbc $3FF000.l,X		; FF 00 F0 3F
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$E000.w		; C0 00 E0
	cpx #$FFFF.w		; E0 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$0700.w		; 09 00 07
	brk $F5.b		; 00 F5
	tsb $FFE9.w		; 0C E9 FF
	sbc $FF.b,X		; F5 FF
	sbc #$00FF.w		; E9 FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFE9.l,X		; FF E9 FF 01
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $E9.b		; 00 E9
	sbc $000002.l,X		; FF 02 00 00
	brk $F6.b		; 00 F6
	sbc $03FFF1.l,X		; FF F1 FF 03
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $04FFF1.l,X		; FF F1 FF 04
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F1.b		; 00 F1
	sbc $004003.l,X		; FF 03 40 00
	brk $F6.b		; 00 F6
	sbc $05FFF9.l,X		; FF F9 FF 05
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $06FFF9.l,X		; FF F9 FF 06
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F9.b		; 00 F9
	sbc $004005.l,X		; FF 05 40 00
	brk $07.b		; 00 07
	tsb $180F.w		; 0C 0F 18
	trb $1F10.w		; 1C 10 1F
	bmi  31.b		; 30 1F
	bmi -32.b		; 30 E0
	jsr $00FF.w		; 20 FF 00
	and $000330.l		; 2F 30 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $002000.l,X		; 1F 00 20 00
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	bra   1.b		; 80 01
	bra   1.b		; 80 01
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	bit $813C.w,X		; 3C 3C 81
	sta ($81.b,X)		; 81 81
	sta ($FF.b,X)		; 81 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	bmi -16.b		; 30 F0
	clc		; 18
	sec		; 38
	iny		; C8
	sec		; 38
	cpy $4CB8.w		; CC B8 4C
	ora [$04.b]		; 07 04
	sbc $0CF400.l,X		; FF 00 F4 0C
	cpy #$0000.w		; C0 00 00
	brk $C0.b		; 00 C0
	cpy #$E060.w		; C0 60 E0
	cpx #$F860.w		; E0 60 F8
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	sbc $E08181.l,X		; FF 81 81 E0
	ldy #$00FF.w		; A0 FF 00
	adc $000870.l,X		; 7F 70 08 00
	ora [$F8.b]		; 07 F8
	sbc $007F00.l,X		; FF 00 7F 00
	sta ($7E.b,X)		; 81 7E
	ldy #$005F.w		; A0 5F 00
	brk $88.b		; 00 88
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	ora ($FF.b,X)		; 01 FF
	ply		; 7A
	ply		; 7A
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $857A00.l,X		; FF 00 7A 85
	bpl  -1.b		; 10 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($FF1F.w,X)		; FC 1F FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  16.b		; 80 10
	brk $F0.b		; 00 F0
	ora $F0FFE2.l		; 0F E2 FF F0
	sbc $00FFE2.l,X		; FF E2 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E2.b		; 00 E2
	sbc $000002.l,X		; FF 02 00 00
	brk $F1.b		; 00 F1
	sbc $04FFF2.l,X		; FF F2 FF 04
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $F2.b		; 00 F2
	sbc $000006.l,X		; FF 06 00 00
	brk $03.b		; 00 03
	cop $06.b		; 02 06
	ora $07.b		; 05 07
	brk $0F.b		; 00 0F
	php		; 08
	ora $080F00.l		; 0F 00 0F 08
	ora $18F018.l		; 0F 18 F0 18
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0F.b		; 00 0F
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($0303.w,X)		; FC 03 03
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	sbc $000100.l,X		; FF 00 01 00
	sbc $00E000.l,X		; FF 00 E0 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $05.b		; 00 05
	asl $0001.w		; 0E 01 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $05E7E7.l,X		; 1F E7 E7 05
	ora [$07.b]		; 07 07
	ora [$0F.b]		; 07 0F
	ora $C000FF.l		; 0F FF 00 C0
	rti		; 40

	rts		; 60

	ldy #$00E0.w		; A0 E0 00
	beq  16.b		; F0 10
	beq   0.b		; F0 00
	beq  16.b		; F0 10
	beq  24.b		; F0 18
	ora $008018.l		; 0F 18 80 00
	rti		; 40

	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $90.b		; 00 90
	bra -112.b		; 80 90
	bra -112.b		; 80 90
	bra -16.b		; 80 F0
	brk $3D.b		; 00 3D
	bit $0092.w		; 2C 92 00
	ror $FFEE.w,X		; 7E EE FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	eor $423FC0.l,X		; 5F C0 3F 42
	jmp ($6F6F.w)		; 6C 6F 6F
	sbc $0000EF.l		; EF EF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $000000.l,X		; 3F 00 00 00
	sbc $000002.l,X		; FF 02 00 00
	sbc $FF00.w,X		; FD 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	cop $FF.b		; 02 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $FD.b		; 00 FD
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0103FC.l,X		; FF FC 03 01
	ora ($FF.b,X)		; 01 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	bne  36.b		; D0 24
	brk $F8.b		; 00 F8
	jmp.w [$00FC]		; DC FC 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $0C.b		; 00 0C
	inx		; E8
	tsb $08F0.w		; 0C F0 08
	cld		; D8
	cld		; D8
	cld		; D8
	jmp.w [$00DC]		; DC DC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	clc		; 18
	ora $371E17.l,X		; 1F 17 1E 37
	pld		; 2B
	ora $28.b,S		; 03 28
	jsr $203C.w		; 20 3C 20
	rol $3F36.w,X		; 3E 36 3F
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $17.b		; 00 17
	brk $23.b		; 00 23
	trb $20.b		; 14 20
	ora [$20.b],Y		; 17 20
	ora [$36.b],Y		; 17 36
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $D07B84.l,X		; FF 84 7B D0
	sbc $013737.l,X		; FF 37 37 01
	brk $FE.b		; 00 FE
	inc $00FF.w,X		; FE FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and [$C8.b],Y		; 37 C8
	ora ($FF.b,X)		; 01 FF
	sbc $000001.l,X		; FF 01 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	and ($DE.b,X)		; 21 DE
	phk		; 4B
	sbc $00ECEC.l,X		; FF EC EC 00
	brk $FF.b		; 00 FF
	adc $0000FF.l,X		; 7F FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EC.b		; 00 EC
	ora ($80.b,S),Y		; 13 80
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	clc		; 18
	sed		; F8
	inx		; E8
	sei		; 78
	cpx $C0D4.w		; EC D4 C0
	trb $04.b		; 14 04
	bit $7C04.w,X		; 3C 04 7C
	jmp ($00FC.w)		; 6C FC 00
	php		; 08
	brk $08.b		; 00 08
	brk $E8.b		; 00 E8
	brk $C4.b		; 00 C4
	plp		; 28
	tsb $E8.b		; 04 E8
	tsb $E8.b		; 04 E8
	jmp ($0080.w)		; 6C 80 00
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	jsr ($00FF.w,X)		; FC FF 00
	sbc $000000.l,X		; FF 00 00 00
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
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $7C.b		; 00 7C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
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
	bra  28.b		; 80 1C
	brk $ED.b		; 00 ED
	trb $DB.b		; 14 DB
	sbc $F0FFEF.l,X		; FF EF FF F0
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	sbc $004000.l,X		; FF 00 40 00
	brk $ED.b		; 00 ED
	sbc $04FFE0.l,X		; FF E0 FF 04
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $06FFE0.l,X		; FF E0 FF 06
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $E0.b		; 00 E0
	sbc $000008.l,X		; FF 08 00 00
	brk $F2.b		; 00 F2
	sbc $0AFFD0.l,X		; FF D0 FF 0A
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $D0.b		; 00 D0
	sbc $00000C.l,X		; FF 0C 00 00
	brk $91.b		; 00 91
	brk $6F.b		; 00 6F
	sbc $80FF00.l,X		; FF 00 FF 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $6F.b		; 00 6F
	adc $FFFFFF.l		; 6F FF FF FF
	sbc $00007F.l,X		; FF 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9F.b		; 00 9F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $EF.b		; 00 EF
	ora $000F00.l		; 0F 00 0F 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	cop $01.b		; 02 01
	asl $05.b		; 06 05
	asl $03.b		; 06 03
	tsb $0CF8.w		; 0C F8 0C
	tyx		; BB
	tsb $0FF8.w		; 0C F8 0F
	ora $041A.w,X		; 1D 1A 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $07.b		; 00 07
	brk $68.b		; 00 68
	rts		; 60

	php		; 08
	brk $1B.b		; 00 1B
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $3E00FF.l,X		; FF FF 00 3E
	rol $3E3E.w,X		; 3E 3E 3E
	rol $7E3E.w,X		; 3E 3E 7E
	ror $00FF.w,X		; 7E FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $241B00.l,X		; FF 00 1B 24
	ora $34.b,S		; 03 34
	ora ($24.b,S),Y		; 13 24
	adc $000000.l,X		; 7F 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $262600.l,X		; FF 00 26 26
	rol $3E36.w		; 2E 36 3E
	rol $7E.b		; 26 7E
	ror $00FF.w,X		; 7E FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $40E000.l,X		; FF 00 E0 40
	bra 112.b		; 80 70
	bcs 112.b		; B0 70
	cpy #$1F30.w		; C0 30 1F
	bmi  -3.b		; 30 FD
	bpl  31.b		; 10 1F
	beq -72.b		; F0 B8
	cli		; 58
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $E0.b		; 00 E0
	brk $16.b		; 00 16
	asl $10.b		; 06 10
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora [$FE.b]		; 07 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	sbc $FF3F3F.l,X		; FF 3F 3F FF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $3F.b		; 00 3F
	inc $C0C7.w,X		; FE C7 C0
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1D.b		; 00 1D
	tas		; 1B
	ora $11.b,X		; 15 11
	trb $10.b		; 14 10
	trb $30.b		; 14 30
	ora $1B241B.l,X		; 1F 1B 24 1B
	and $3B3F3B.l,X		; 3F 3B 3F 3B
	tas		; 1B
	brk $11.b		; 00 11
	asl A		; 0A
	bpl  11.b		; 10 0B
	bpl  11.b		; 10 0B
	tsa		; 3B
	brk $3B.b		; 00 3B
	brk $20.b		; 00 20
	tas		; 1B
	jsr $201B.w		; 20 1B 20
	cmp $06FFFA.l,X		; DF FA FF 06
	asl $00.b		; 06 00
	brk $3F.b		; 00 3F
	and $C0FF00.l,X		; 3F 00 FF C0
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	sbc $FF00.w,Y		; F9 00 FF
	and $00FFC0.l,X		; 3F C0 FF 00
	adc $C040FF.l,X		; 7F FF 40 C0
	sta ($7E.b,X)		; 81 7E
	cmp $FF.b,S		; C3 FF
	sbc $0000FF.l,X		; FF FF 00 00
	ror A		; 6A
	.db $62, $10, $E3		; 62 10 E3
	bit $FF3C.w,X		; 3C 3C FF
	clc		; 18
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ror $FF99.w,X		; 7E 99 FF
	brk $C3.b		; 00 C3
	sbc $051800.l,X		; FF 00 18 05
	xce		; FB
	eor $E0E0FF.l,X		; 5F FF E0 E0
	brk $00.b		; 00 00
	sbc $00FD.w,X		; FD FD 00
	sbc $FF0103.l,X		; FF 03 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	ora $FDFF00.l,X		; 1F 00 FF FD
	cop $FF.b		; 02 FF
	brk $FE.b		; 00 FE
	sbc $B80302.l,X		; FF 02 03 B8
	cld		; D8
	tay		; A8
	dey		; 88
	plp		; 28
	php		; 08
	plp		; 28
	tsb $D8F8.w		; 0C F8 D8
	bit $D8.b		; 24 D8
	jsr ($FCDC.w,X)		; FC DC FC
	jmp.w [$00D8]		; DC D8 00
	dey		; 88
	bvc   8.b		; 50 08
	bne   8.b		; D0 08
	bne -36.b		; D0 DC
	brk $DC.b		; 00 DC
	brk $04.b		; 00 04
	cld		; D8
	tsb $D8.b		; 04 D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	clc		; 18
	ora [$08.b]		; 07 08
	sec		; 38
	rts		; 60

	clc		; 18
	jsr $8078.w		; 20 78 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	bmi   0.b		; 30 00
	ora [$07.b]		; 07 07
	rti		; 40

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq   0.b		; F0 00
	brk $0F.b		; 00 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $C70303.l,X		; 3F 03 03 C7
	cmp [$00.b]		; C7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	rts		; 60

	bra  64.b		; 80 40
	bvs  24.b		; 70 18
	rts		; 60

	bpl 120.b		; 10 78
	sty $00.b		; 84 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $30.b		; 00 30
	brk $80.b		; 00 80
	bra   8.b		; 80 08
	brk $88.b		; 00 88
	bra   9.b		; 80 09
	bra  32.b		; 80 20
	brk $E9.b		; 00 E9
	clc		; 18
	pei ($FF.b)		; D4 FF
	sbc #$D4FF.w		; E9 FF D4
	sbc $000000.l,X		; FF 00 00 00
	brk $F9.b		; 00 F9
	sbc $02FFD4.l,X		; FF D4 FF 02
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $D4.b		; 00 D4
	sbc $000004.l,X		; FF 04 00 00
	brk $EC.b		; 00 EC
	sbc $06FFE4.l,X		; FF E4 FF 06
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $08FFE4.l,X		; FF E4 FF 08
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $E4.b		; 00 E4
	sbc $00000A.l,X		; FF 0A 00 00
	brk $EC.b		; 00 EC
	sbc $0CFFF4.l,X		; FF F4 FF 0C
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $0EFFF4.l,X		; FF F4 FF 0E
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $F4.b		; 00 F4
	sbc $00400C.l,X		; FF 0C 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	cop $03.b		; 02 03
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $30.b		; 00 30
	bmi  63.b		; 30 3F
	brk $CF.b		; 00 CF
	bcc -16.b		; 90 F0
	brk $F0.b		; 00 F0
	bra -16.b		; 80 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	brk $60.b		; 00 60
	brk $8F.b		; 00 8F
	ora $000000.l		; 0F 00 00 00
	brk $0F.b		; 00 0F
	ora $000F0F.l		; 0F 0F 0F 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$E000.w		; E0 00 E0
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $E10000.l,X		; 1F 00 00 E1
	sbc ($03.b,X)		; E1 03
	ora $03.b,S		; 03 03
	ora $0C.b,S		; 03 0C
	tsb $00FC.w		; 0C FC 00
	sbc ($09.b,S),Y		; F3 09
	ora $C10F00.l		; 0F 00 0F C1
	ora $30CFE0.l,X		; 1F E0 CF 30
	ora $00F0B0.l		; 0F B0 F0 00
	inc $0600.w,X		; FE 00 06
	brk $F1.b		; 00 F1
	beq -64.b		; F0 C0
	cpy #$F0F0.w		; C0 F0 F0
	bmi  48.b		; 30 30
	bvs -80.b		; 70 B0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	cpy #$0080.w		; C0 80 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	brk $40.b		; 00 40
	brk $77.b		; 00 77
	adc [$7B.b]		; 67 7B
	and $78.b,S		; 23 78
	rts		; 60

	sei		; 78
	cpx #$A8B4.w		; E0 B4 A8
	inc $6E.b,X		; F6 6E
	sbc $EFFF80.l,X		; FF 80 FF EF
	and $046B00.l		; 2F 00 6B 04
	pla		; 68
	ora [$68.b]		; 07 68
	ora [$28.b]		; 07 28
	eor [$EE.b]		; 47 EE
	ora ($80.b,X)		; 01 80
	brk $80.b		; 00 80
	adc $F2FFC0.l		; 6F C0 FF F2
	sbc $000E0E.l,X		; FF 0E 0E 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $8000FF.l,X		; 7F FF 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0E.b		; 00 0E
	sbc ($00.b),Y		; F1 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	sbc $81FF00.l,X		; FF 00 FF 81
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $08.b		; 00 08
	brk $75.b		; 00 75
	adc ($FF.b),Y		; 71 FF
	brk $3E.b		; 00 3E
	rol $00FF.w,X		; 3E FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	tsb $7FFF.w		; 0C FF 7F
	dey		; 88
	brk $00.b		; 00 00
	cmp ($FF.b,X)		; C1 FF
	ora $FF.b		; 05 FF
	sta [$FF.b]		; 87 FF
	clv		; B8
	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00FF7F.l,X		; 7F 7F FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	clv		; B8
	eor [$00.b]		; 47 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	sbc $F7F97B.l,X		; FF 7B F9 F7
	sbc ($07.b),Y		; F1 07
	ora ($07.b,X)		; 01 07
	ora ($0A.b,X)		; 01 0A
	tsb $BDBB.w		; 0C BB BD
	sbc $3D7F00.l,X		; FF 00 7F 3D
	sbc $F500.w,X		; FD 00 F5
	php		; 08
	ora $F8.b		; 05 F8
	ora $F8.b		; 05 F8
	tsb $BDF1.w		; 0C F1 BD
	rti		; 40

	brk $00.b		; 00 00
	cpy #$80FD.w		; C0 FD 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$C080.w		; C0 80 C0
	rti		; 40

	cpy #$00C0.w		; C0 C0 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	bra  -1.b		; 80 FF
	brk $C0.b		; 00 C0
	cmp $FF3FC0.l		; CF C0 3F FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $F0F00F.l,X		; FF 0F F0 F0
	sbc $FF0F8F.l,X		; FF 8F 0F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0303FC.l,X		; FF FC 03 03
	sbc $FFFCFC.l,X		; FF FC FC FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	cop $03.b		; 02 03
	asl $01.b		; 06 01
	asl $FC.b		; 06 FC
	asl $99.b		; 06 99
	tsb $F8.b		; 04 F8
	ora $0E.b		; 05 0E
	tsb $06.b		; 04 06
	tsb $0002.w		; 0C 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	ror $70.b,X		; 76 70
	asl $00.b		; 06 00
	ora $0500.w		; 0D 00 05
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $C87F7F.l,X		; FF 7F 7F C8
	sbc [$0F.b],Y		; F7 0F
	ora $1F0F0F.l		; 0F 0F 0F 1F
	ora $0000FF.l,X		; 1F FF 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $98FFFF.l,X		; FF FF FF 98
	adc [$C0.b]		; 67 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$FFC0.w		; C0 C0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $02.b,S		; 03 02
	ora ($03.b,X)		; 01 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $12FFFF.l,X		; FF FF FF 12
	sbc $0303.w		; ED 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $B00F00.l,X		; FF 00 0F B0
	ora $00FF60.l,X		; 1F 60 FF 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	inc $26FE.w,X		; FE FE 26
	cmp $F8B070.l,X		; DF 70 B0 F8
	sed		; F8
	sed		; F8
	sed		; F8
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc $40C000.l,X		; FF 00 C0 40
	cpy #$8060.w		; C0 60 80
	rts		; 60

	and $209960.l,X		; 3F 60 99 20
	ora $2060A0.l,X		; 1F A0 60 20
	rts		; 60

	bmi  64.b		; 30 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $6E.b		; 00 6E
	asl $0060.w		; 0E 60 00
	ldy #$A000.w		; A0 00 A0
	brk $FF.b		; 00 FF
	sbc $FF0090.l		; EF 90 00 FF
	bra 111.b		; 80 6F
	sbc $8000FF.l,X		; FF FF 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $806F6F.l		; 6F 6F 6F 80
	bra  -1.b		; 80 FF
	sbc $7F0000.l,X		; FF 00 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $BF.b		; 00 BF
	brk $BF.b		; 00 BF
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	bra  -1.b		; 80 FF
	sbc $FF4040.l,X		; FF 40 40 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	php		; 08
	brk $00.b		; 00 00
	sbc [$00.b],Y		; F7 00
	sbc [$00.b],Y		; F7 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $08.b		; 00 08
	sbc $0808FF.l,X		; FF FF 08 08
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00423D.l,X		; FF 3D 42 00
	adc $7F7D00.l,X		; 7F 00 7D 7F
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	adc $FDFD.w,X		; 7D FD FD
	bra -128.b		; 80 80
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$40C0.w		; C0 C0 40
	brk $C0.b		; 00 C0
	rti		; 40

	bra -64.b		; 80 C0
	cpy #$4000.w		; C0 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra -128.b		; 80 80
	bra  64.b		; 80 40
	rti		; 40

	cpy #$00C0.w		; C0 C0 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	bra  44.b		; 80 2C
	brk $E5.b		; 00 E5
	tas		; 1B
	cmp $E5FF.w		; CD FF E5
	sbc $00FFCD.l,X		; FF CD FF 00
	brk $00.b		; 00 00
	brk $F5.b		; 00 F5
	sbc $02FFCD.l,X		; FF CD FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $CD.b		; 00 CD
	sbc $000004.l,X		; FF 04 00 00
	brk $15.b		; 00 15
	brk $CD.b		; 00 CD
	sbc $000006.l,X		; FF 06 00 00
	brk $E7.b		; 00 E7
	sbc $08FFDD.l,X		; FF DD FF 08
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $0AFFDD.l,X		; FF DD FF 0A
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $DD.b		; 00 DD
	sbc $00000C.l,X		; FF 0C 00 00
	brk $17.b		; 00 17
	brk $DD.b		; 00 DD
	sbc $00000E.l,X		; FF 0E 00 00
	brk $E7.b		; 00 E7
	sbc $20FFED.l,X		; FF ED FF 20
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $22FFED.l,X		; FF ED FF 22
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $ED.b		; 00 ED
	sbc $004020.l,X		; FF 20 40 00
	brk $FA.b		; 00 FA
	sbc $22FFED.l,X		; FF ED FF 22
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	sbc $24FFFD.l,X		; FF FD FF 24
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $FD.b		; 00 FD
	sbc $004024.l,X		; FF 24 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $1C.b		; 00 1C
	trb $202F.w		; 1C 2F 20
	mvn $2F,$47		; 54 47 2F
	bmi -36.b		; 30 DC
	ldy #$407C.w		; A0 7C 40
	ldy $FF40.w,X		; BC 40 FF
	bra   3.b		; 80 03
	brk $1F.b		; 00 1F
	brk $38.b		; 00 38
	brk $40.b		; 00 40
	brk $43.b		; 00 43
	ora $80.b,S		; 03 80
	brk $80.b		; 00 80
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $F0.b		; 00 F0
	beq   0.b		; F0 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $FF1A05.l		; 0F 05 1A FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0F0707.l,X		; FF 07 07 0F
	ora $701A18.l		; 0F 18 1A 70
	bvs -24.b		; 70 E8
	php		; 08
	mvn $E8,$C4		; 54 C4 E8
	clc		; 18
	rol $0A.b,X		; 36 0A
	bit $7B04.w,X		; 3C 04 7B
	sta $3F.b		; 85 3F
	rep #$80		; C2 80
	brk $F0.b		; 00 F0
	brk $38.b		; 00 38
	brk $04.b		; 00 04
	brk $C4.b		; 00 C4
	cpy #$0002.w		; C0 02 00
	rep #$C0		; C2 C0
	cmp ($C0.b,X)		; C1 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1D09.w,Y		; 19 09 1D
	inc A		; 1A
	ora $3F3B.w,X		; 1D 3B 3F
	and ($34.b,S),Y		; 33 34
	bpl  56.b		; 10 38
	bmi  60.b		; 30 3C
	bvs 107.b		; 70 6B
	ror $1E.b		; 66 1E
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $1B.b		; 00 1B
	brk $38.b		; 00 38
	ora $34.b,S		; 03 34
	ora $34.b,S		; 03 34
	ora $26.b,S		; 03 26
	ora ($FF.b),Y		; 11 FF
	sbc $C800FF.l,X		; FF FF 00 C8
	sbc [$F9.b],Y		; F7 F9
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $4C.b		; 00 4C
	lda ($00.b,S),Y		; B3 00
	sbc $EFFF2A.l,X		; FF 2A FF EF
	sbc $000000.l		; EF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	bpl   0.b		; 10 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0600FF.l,X		; FF FF 00 06
	sbc $FF00.w,Y		; F9 00 FF
	asl A		; 0A
	sbc $40FEFE.l,X		; FF FE FE 40
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($A0.b,X)		; 01 A0
	sbc $FFFFE0.l,X		; FF E0 FF FF
	sbc $4200FF.l,X		; FF FF 00 42
	lda $FF12.w,X		; BD 12 FF
	ora $E0E0FF.l,X		; 1F FF E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$001F.w		; E0 1F 00
	sbc $F3FF00.l,X		; FF 00 FF F3
	sbc ($F7.b)		; F2 F7
	phd		; 0B
	adc [$FB.b],Y		; 77 FB
	sbc $E1E5F9.l,X		; FF F9 E5 E1
	ora $01.b,S		; 03 01
	ora [$01.b]		; 07 01
	inc A		; 1A
	tsb $000F.w		; 0C 0F 00
	xce		; FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $E3.b		; 00 E3
	clc		; 18
	ora $F8.b		; 05 F8
	ora $F8.b		; 05 F8
	tsb $00F1.w		; 0C F1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	cpy #$C0C0.w		; C0 C0 C0
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
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($03.b,X)		; 01 03
	brk $03.b		; 00 03
	inc $9E03.w,X		; FE 03 9E
	cop $FE.b		; 02 FE
	ora $01.b,S		; 03 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $7B.b		; 00 7B
	sei		; 78
	cop $00.b		; 02 00
	adc $807F80.l,X		; 7F 80 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $F8F8F8.l,X		; FF F8 F8 F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $1E.b		; 00 1E
	tsb $1A.b		; 04 1A
	bpl   9.b		; 10 09
	ora $000000.l,X		; 1F 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $1B1E.w,Y		; 19 1E 1B
	asl $1A1D.w,X		; 1E 1D 1A
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	bit $3DC3.w,X		; 3C C3 3D
	cmp $3F.b,S		; C3 3F
	cmp ($7F.b,X)		; C1 7F
	sta ($FE.b,X)		; 81 FE
	ora ($00.b,X)		; 01 00
	ora ($FE.b,X)		; 01 FE
	brk $00.b		; 00 00
	sbc $C1C0C1.l,X		; FF C1 C0 C1
	cpy #$C0C1.w		; C0 C1 C0
	sbc ($E0.b,X)		; E1 E0
	sbc ($E0.b,X)		; E1 E0
	sbc $000100.l,X		; FF 00 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	inc $F280.w,X		; FE 80 F2
	bra  -2.b		; 80 FE
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	bit $0080.w,X		; 3C 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	and [$48.b],Y		; 37 48
	and [$7F.b],Y		; 37 7F
	rti		; 40

	adc $575F77.l,X		; 7F 77 5F 57
	iny		; C8
	brk $7F.b		; 00 7F
	cpy #$F73F.w		; C0 3F F7
	adc [$00.b],Y		; 77 00
	adc [$00.b],Y		; 77 00
	rti		; 40

	brk $40.b		; 00 40
	and [$60.b],Y		; 37 60
	and [$37.b],Y		; 37 37
	and [$C0.b],Y		; 37 C0
	cpy #$F7F7.w		; C0 F7 F7
	cmp $FF00CF.l		; CF CF 00 FF
	sbc $E0E000.l,X		; FF 00 E0 E0
	sbc $0010E0.l		; EF E0 10 00
	sbc [$00.b],Y		; F7 00
	sbc [$F0.b],Y		; F7 F0
	cmp $00FF30.l		; CF 30 FF 00
	brk $00.b		; 00 00
	ora $F010FF.l,X		; 1F FF 10 F0
	sbc $0808FF.l,X		; FF FF 08 08
	sbc $F7F7FF.l,X		; FF FF F7 F7
	brk $FF.b		; 00 FF
	sbc $010100.l,X		; FF 00 01 01
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$08.b],Y		; F7 08
	sbc $000000.l,X		; FF 00 00 00
	inc $00FF.w,X		; FE FF 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $400DAD.l,X		; FF AD 0D 40
	sta $F000FF.l		; 8F FF 00 F0
	beq  -1.b		; F0 FF
	rti		; 40

	brk $00.b		; 00 00
	lda $00BF00.l,X		; BF 00 BF 00
	sbc $FF42.w,X		; FD 42 FF
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	sbc $FF4000.l,X		; FF 00 40 FF
	sbc $FF4040.l,X		; FF 40 40 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FE.b		; 00 FE
	brk $01.b		; 00 01
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0101.l,X		; FF 01 01 FF
	sbc $FF0202.l,X		; FF 02 02 FF
	sbc $027D7B.l,X		; FF 7B 7D 02
	sbc $00FF.w,X		; FD FF 00
	sbc $FDFFFD.l,X		; FF FD FF FD
	cop $00.b		; 02 00
	sbc $FDFF00.l,X		; FF 00 FF FD
	adc $FD80.w,X		; 7D 80 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FD00.w,X		; FD 00 FD
	sbc $00FD.w,X		; FD FD 00
	brk $FD.b		; 00 FD
	sbc $80C0.w,X		; FD C0 80
	rti		; 40

	bra -64.b		; 80 C0
	rti		; 40

	cpy #$40C0.w		; C0 C0 40
	rti		; 40

	rts		; 60

	brk $C0.b		; 00 C0
	rts		; 60

	bra -32.b		; 80 E0
	cpy #$C000.w		; C0 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	bra -64.b		; 80 C0
	bra -128.b		; 80 80
	bra  96.b		; 80 60
	rts		; 60

	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc [$FF.b],Y		; F7 FF
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	adc [$FF.b]		; 67 FF
	brk $F7.b		; 00 F7
	sbc [$00.b],Y		; F7 00
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $FF01FF.l,X		; 1F FF 01 FF
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
	brk $03.b		; 00 03
	jsr ($FFFC.w,X)		; FC FC FF
	sbc $03.b,S		; E3 03
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bra  52.b		; 80 34
	brk $E0.b		; 00 E0
	jsr $FFC6.w		; 20 C6 FF
	sbc $FF.b,S		; E3 FF
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	beq  -1.b		; F0 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	ora $F000.w		; 0D 00 F0
	sbc $004000.l,X		; FF 00 40 00
	brk $FD.b		; 00 FD
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	sbc $04FFE0.l,X		; FF E0 FF 04
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $06FFE0.l,X		; FF E0 FF 06
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $E0.b		; 00 E0
	sbc $004004.l,X		; FF 04 40 00
	brk $FD.b		; 00 FD
	sbc $08FFE0.l,X		; FF E0 FF 08
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	sbc $0AFFD0.l,X		; FF D0 FF 0A
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $0CFFD0.l,X		; FF D0 FF 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D0.b		; 00 D0
	sbc $00000E.l,X		; FF 0E 00 00
	brk $10.b		; 00 10
	brk $D0.b		; 00 D0
	sbc $000020.l,X		; FF 20 00 00
	brk $20.b		; 00 20
	brk $D0.b		; 00 D0
	sbc $000022.l,X		; FF 22 00 00
	brk $E9.b		; 00 E9
	sbc $24FFC0.l,X		; FF C0 FF 24
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $26FFC0.l,X		; FF C0 FF 26
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $C0.b		; 00 C0
	sbc $000028.l,X		; FF 28 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	adc $FF.b,S		; 63 FF
	brk $E0.b		; 00 E0
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $F0FFFF.l,X		; FF FF FF F0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $36.b		; 00 36
	bvs 109.b		; 70 6D
	adc $7D.b,S		; 63 7D
	tsa		; 3B
	mvp $7F,$3B		; 44 3B 7F
	rti		; 40

	adc $5B5F7B.l,X		; 7F 7B 5F 5B
	jmp $3208.w		; 4C 08 32
	ora #$1823.w		; 09 23 18
	tda		; 7B
	brk $7B.b		; 00 7B
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	tsa		; 3B
	rts		; 60

	tsa		; 3B
	and ($3B.b,S),Y		; 33 3B
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc [$E7.b]		; E7 E7
	brk $FF.b		; 00 FF
	sbc $F0F800.l,X		; FF 00 F8 F0
	xce		; FB
	beq  27.b		; F0 1B
	bpl   0.b		; 10 00
	sbc $E7FF00.l,X		; FF 00 FF E7
	clc		; 18
	sbc $000000.l,X		; FF 00 00 00
	ora $FC0CFF.l		; 0F FF 0C FC
	sbc $0000FF.l		; EF FF 00 00
	brk $00.b		; 00 00
	inc $00FE.w,X		; FE FE 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FEFF00.l,X		; FF 00 FF FE
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $0C0000.l,X		; FF 00 00 0C
	tsb $F6.b		; 04 F6
	beq  12.b		; F0 0C
	beq  -1.b		; F0 FF
	brk $3F.b		; 00 3F
	and $FB0CFF.l,X		; 3F FF 0C FB
	php		; 08
	brk $FF.b		; 00 FF
	asl A		; 0A
	sbc $FF0CFF.l,X		; FF FF 0C FF
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	sbc $F70C00.l,X		; FF 00 0C F7
	sbc $300000.l,X		; FF 00 00 30
	bpl -37.b		; 10 DB
	cmp $30.b,S		; C3 30
	cmp $FF.b,S		; C3 FF
	brk $FC.b		; 00 FC
	jsr ($30FF.w,X)		; FC FF 30
	sbc $FF0020.l		; EF 20 00 FF
	plp		; 28
	sbc $FF30FF.l,X		; FF FF 30 FF
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	sbc $DF3000.l,X		; FF 00 30 DF
	sbc $000000.l,X		; FF 00 00 00
	brk $7F.b		; 00 7F
	adc $FFFF00.l,X		; 7F 00 FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($7F.b,X)		; 01 7F
	ora ($DF.b,X)		; 01 DF
	ora ($CF.b,X)		; 01 CF
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	rts		; 60

	and $1F3C.w,X		; 3D 3C 1F
	cpx #$C07F.w		; E0 7F C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	lda $C080C0.l,X		; BF C0 80 C0
	sbc $C0BFC0.l,X		; FF C0 BF C0
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C1.b		; 00 C1
	ora ($FF.b,X)		; 01 FF
	brk $BF.b		; 00 BF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	brk $7B.b		; 00 7B
	bpl 107.b		; 10 6B
	cmp ($26.b,X)		; C1 26
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc [$7B.b]		; 67 7B
	adc $6B777B.l		; 6F 7B 77 6B
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $008000.l,X		; FF 00 80 00
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
	cpy $00.b		; C4 00
	adc $F73BC0.l,X		; 7F C0 3B F7
	php		; 08
	sbc [$FF.b],Y		; F7 FF
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	clc		; 18
	tsa		; 3B
	tsa		; 3B
	cpy #$F7C0.w		; C0 C0 F7
	sbc [$F7.b],Y		; F7 F7
	sbc [$00.b],Y		; F7 00
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $27.b		; 00 27
	and [$08.b]		; 27 08
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	sed		; F8
	tsb $F8.b		; 04 F8
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0202FF.l,X		; FF FF 02 02
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc ($00.b,S),Y		; F3 00
	sbc ($00.b,S),Y		; F3 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0C0CFF.l,X		; FF FF 0C 0C
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	cmp $00CF00.l		; CF 00 CF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3030FF.l,X		; FF FF 30 30
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $017FFF.l,X		; FF FF 7F 01
	ora $01.b,S		; 03 01
	ora $03.b,S		; 03 03
	ora $07.b,S		; 03 07
	ora [$07.b]		; 07 07
	asl $02.b		; 06 02
	asl $02.b		; 06 02
	asl $06.b		; 06 06
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	asl $01.b		; 06 01
	asl $01.b		; 06 01
	asl $01.b		; 06 01
	brk $7F.b		; 00 7F
	ora $20DF1F.l,X		; 1F 1F DF 20
	jmp.w [$FF3F]		; DC 3F FF
	and $C00F4F.l,X		; 3F 4F 0F C0
	rti		; 40

	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rts		; 60

	bra  63.b		; 80 3F
	bra  63.b		; 80 3F
	bra  63.b		; 80 3F
	bra -113.b		; 80 8F
	bmi   0.b		; 30 00
	and $003F40.l,X		; 3F 40 3F 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $42.b		; 00 42
	lda $FF48.w,X		; BD 48 FF
	sbc $7FFF.w,Y		; F9 FF 7F
	adc $000707.l,X		; 7F 07 07 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra   7.b		; 80 07
	sed		; F8
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	bmi -49.b		; 30 CF
	brk $FF.b		; 00 FF
	plp		; 28
	sbc $BFFFFF.l,X		; FF FF FF BF
	lda $000000.l,X		; BF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	rti		; 40

	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	tsb $00F3.w		; 0C F3 00
	sbc $FFFF14.l,X		; FF 14 FF FF
	sbc $00FDFD.l,X		; FF FD FD 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	cop $00.b		; 02 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $42.b		; 00 42
	lda $FF12.w,X		; BD 12 FF
	sta $FEFEFF.l,X		; 9F FF FE FE
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($E0.b,X)		; 01 E0
	ora $FF03FC.l,X		; 1F FC 03 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FE.b,X)		; 01 FE
	ora ($00.b,X)		; 01 00
	ora ($FF.b,X)		; 01 FF
	ora ($FE.b,X)		; 01 FE
	ora ($81.b,X)		; 01 81
	bra -127.b		; 80 81
	bra -127.b		; 80 81
	bra -63.b		; 80 C1
	cpy #$C0C1.w		; C0 C1 C0
	sbc $00FE00.l,X		; FF 00 FE 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	sbc $C0FDC0.l,X		; FF C0 FD C0
	sbc $00C0.w,Y		; F9 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $83.b		; 00 83
	ora $5E.b,S		; 03 5E
	asl $0000.w,X		; 1E 00 00
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
	ora ($01.b,X)		; 01 01
	asl $000E.w		; 0E 0E 00
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
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $E0.b		; 00 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sed		; F8
	sed		; F8
	xce		; FB
	tsb $3B.b		; 04 3B
	jsr ($FCFF.w,X)		; FC FF FC
	sbc ($F0.b)		; F2 F0
	ora $02.b,S		; 03 02
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	asl $01.b		; 06 01
	jsr ($FC01.w,X)		; FC 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($F1.b,X)		; 01 F1
	tsb $FC00.w		; 0C 00 FC
	cop $FC.b		; 02 FC
	adc $80C040.l,X		; 7F 40 C0 80
	cpy #$C0C0.w		; C0 C0 C0
	cpx #$E0E0.w		; E0 E0 E0
	rts		; 60

	rti		; 40

	rts		; 60

	rti		; 40

	rts		; 60

	rts		; 60

	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
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
	brk $17.b		; 00 17
	bpl  41.b		; 10 29
	jsl $7F101F.l		; 22 1F 10 7F
	rti		; 40

	and $807F20.l,X		; 3F 20 7F 80
	adc $40FF40.l,X		; 7F 40 FF 40
	ora $001C00.l		; 0F 00 1C 00
	jsr $2000.w		; 20 00 20
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FC.b		; 00 FC
	jsr ($FEFE.w,X)		; FC FE FE
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $001F00.l,X		; FF 00 1F 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpx #$00E0.w		; E0 E0 00
	brk $1F.b		; 00 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $F00000.l		; 0F 00 00 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sec		; 38
	ora $7C.b,S		; 03 7C
	sta $74.b,S		; 83 74
	and #$FFD6.w		; 29 D6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $3838.w,X		; FE 38 38
	ror $CF7E.w,X		; 7E 7E CF
	sbc [$C7.b],Y		; F7 C7
	cmp [$D0.b],Y		; D7 D0
	bpl  40.b		; 10 28
	dey		; 88
	beq  16.b		; F0 10
	jsr ($F804.w,X)		; FC 04 F8
	php		; 08
	jsr ($FC02.w,X)		; FC 02 FC
	tsb $FE.b		; 04 FE
	tsb $E0.b		; 04 E0
	brk $70.b		; 00 70
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	asl $F4.b		; 06 F4
	sbc $F4FFFA.l,X		; FF FA FF F4
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F4.b		; 00 F4
	sbc $000001.l,X		; FF 01 00 00
	brk $FA.b		; 00 FA
	sbc $02FFFC.l,X		; FF FC FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $02FFFC.l,X		; FF FC FF 02
	rti		; 40

	brk $00.b		; 00 00
	adc $80BF7F.l,X		; 7F 7F BF 80
	bra -40.b		; 80 D8
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	brk $87.b		; 00 87
	sbc $007F7F.l,X		; FF 7F 7F 00
	cpy #$8000.w		; C0 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $F880FF.l,X		; FF FF 80 F8
	bra   0.b		; 80 00
	brk $F0.b		; 00 F0
	beq -24.b		; F0 E8
	php		; 08
	clc		; 18
	iny		; C8
	clc		; 18
	inx		; E8
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	sed		; F8
	beq -16.b		; F0 F0
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	beq  -8.b		; F0 F8
	php		; 08
	sed		; F8
	php		; 08
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F9.b		; 00 F9
	ora [$F0.b]		; 07 F0
	sbc $F0FFF9.l,X		; FF F9 FF F0
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	brk $F0.b		; 00 F0
	sbc $000001.l,X		; FF 01 00 00
	brk $F9.b		; 00 F9
	sbc $02FFF8.l,X		; FF F8 FF 02
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $F8.b		; 00 F8
	sbc $000003.l,X		; FF 03 00 00
	brk $00.b		; 00 00
	and $40702F.l,X		; 3F 2F 70 40
	jmp ($AC80.w)		; 6C 80 AC
	cpy #$BFFF.w		; C0 FF BF
	lda $008000.l,X		; BF 00 80 00
	sta $3F.b,S		; 83 3F
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	adc $0080FC.l,X		; 7F FC 80 00
	sed		; F8
	inx		; E8
	trb $6404.w		; 1C 04 64
	cop $76.b		; 02 76
	cop $FE.b		; 02 FE
	plx		; FA
	plx		; FA
	brk $00.b		; 00 00
	brk $82.b		; 00 82
	sed		; F8
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	inc $027E.w,X		; FE 7E 02
	sta $87.b,S		; 83 87
	sed		; F8
	jsr ($FF00.w,X)		; FC 00 FF
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$F800.w		; C0 00 F8
	bra -125.b		; 80 83
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $82.b		; 00 82
.ACCU 16
.INDEX 16
	rep #$3E		; C2 3E
	ror $FC02.w,X		; 7E 02 FC
	inc $FE00.w,X		; FE 00 FE
	jsr ($00FE.w,X)		; FC FE 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	rol $8202.w,X		; 3E 02 82
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	phd		; 0B
	sbc #$F5FF.w		; E9 FF F5
	sbc $00FFE9.l,X		; FF E9 FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFE9.l,X		; FF E9 FF 01
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $E9.b		; 00 E9
	sbc $004000.l,X		; FF 00 40 00
	brk $F5.b		; 00 F5
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $03FFF1.l,X		; FF F1 FF 03
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $F1.b		; 00 F1
	sbc $000004.l,X		; FF 04 00 00
	brk $F5.b		; 00 F5
	sbc $05FFF9.l,X		; FF F9 FF 05
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $06FFF9.l,X		; FF F9 FF 06
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F9.b		; 00 F9
	sbc $004005.l,X		; FF 05 40 00
	brk $10.b		; 00 10
	bpl  31.b		; 10 1F
	brk $60.b		; 00 60
	sei		; 78
	jsr $6019.w		; 20 19 60
	eor $5F60.w,Y		; 59 60 5F
	ldy #$BFDF.w		; A0 DF BF
	cpy #$0F10.w		; C0 10 0F
	bpl  32.b		; 10 20
	rts		; 60

	brk $20.b		; 00 20
	rti		; 40

	rti		; 40

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	sta $00.b,S		; 83 00
	sta $00.b,S		; 83 00
	cmp [$00.b]		; C7 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cpx #$8080.w		; E0 80 80
	and $C10100.l,X		; 3F 00 01 C1
	bra -63.b		; 80 C1
	bra -63.b		; 80 C1
	and $7F80FF.l,X		; 3F FF 80 7F
	sbc $7F8000.l,X		; FF 00 80 7F
	sbc $80BE00.l,X		; FF 00 BE 80
	ldx $BE80.w,Y		; BE 80 BE
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	sbc $003900.l,X		; FF 00 39 00
	ora ($EF.b,X)		; 01 EF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $C6.b		; 00 C6
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	asl $0202.w		; 0E 02 02
	sed		; F8
	brk $00.b		; 00 00
	asl $02.b		; 06 02
	asl $02.b		; 06 02
	asl $F8.b		; 06 F8
	inc $FA04.w,X		; FE 04 FA
	inc $0200.w,X		; FE 00 02
	jsr ($00FE.w,X)		; FC FE 00
	plx		; FA
	cop $FA.b		; 02 FA
	cop $FA.b		; 02 FA
	cop $02.b		; 02 02
	cop $00.b		; 02 00
	brk $80.b		; 00 80
	adc $FF04FF.l,X		; 7F FF 04 FF
	adc $FF04FF.l,X		; 7F FF 04 FF
	brk $E0.b		; 00 E0
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
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  12.b		; 80 0C
	brk $F1.b		; 00 F1
	ora $F1FFE2.l		; 0F E2 FF F1
	sbc $00FFE2.l,X		; FF E2 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E2.b		; 00 E2
	sbc $004000.l,X		; FF 00 40 00
	brk $F1.b		; 00 F1
	sbc $02FFF2.l,X		; FF F2 FF 02
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $F2.b		; 00 F2
	sbc $000004.l,X		; FF 04 00 00
	brk $02.b		; 00 02
	asl $03.b		; 06 03
	asl $0F.b		; 06 0F
	php		; 08
	plp		; 28
	rol $10.b,X		; 36 10
	asl $0C10.w		; 0E 10 0C
	bvc  76.b		; 50 4C
	bvs  77.b		; 70 4D
	asl $01.b		; 06 01
	tsb $08.b		; 04 08
	brk $10.b		; 00 10
	bmi   0.b		; 30 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	rti		; 40

	jsr $0060.w		; 20 60 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	and $00.b,S		; 23 00
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$FFDF.w		; E0 DF FF
	sbc $4FB01F.l,X		; FF 1F B0 4F
	bne  47.b		; D0 2F
	inc $FF00.w,X		; FE 00 FF
	ora ($DF.b,X)		; 01 DF
	cpy #$C0DF.w		; C0 DF C0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl   1.b		; 10 01
	ora ($00.b,X)		; 01 00
	brk $20.b		; 00 20
	and [$20.b]		; 27 20
	jsr $FFE0.w		; 20 E0 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	bra 127.b		; 80 7F
	sbc $40FF40.l,X		; FF 40 FF 40
	cld		; D8
	brk $DF.b		; 00 DF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	iny		; C8
	php		; 08
	php		; 08
	ora $FFFFFF.l		; 0F FF FF FF
	brk $FF.b		; 00 FF
	cop $FD.b		; 02 FD
	xce		; FB
	ora ($FF.b,X)		; 01 FF
	ora $37.b		; 05 37
	brk $F7.b		; 00 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cop $04.b		; 02 04
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	asl $0E06.w		; 0E 06 0E
	inc $FE.b,X		; F6 FE
	inc $1AF0.w,X		; FE F0 1A
	cpx $16.b		; E4 16
	inx		; E8
	inc $FE00.w,X		; FE 00 FE
	brk $F6.b		; 00 F6
	asl $F6.b		; 06 F6
	asl $06.b		; 06 06
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	eor $5F4F50.l		; 4F 50 4F 5F
	rts		; 60

	eor $400048.l		; 4F 48 00 40
	brk $3F.b		; 00 3F
	brk $E0.b		; 00 E0
	cpy #$60E0.w		; C0 E0 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $4F.b		; 00 4F
	bmi  64.b		; 30 40
	and $DF00FF.l,X		; 3F FF 00 DF
	cpy #$C0DF.w		; C0 DF C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	jsr $201F.w		; 20 1F 20
	and [$00.b]		; 27 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $D8.b		; 00 D8
	brk $7F.b		; 00 7F
	adc $7F017F.l,X		; 7F 7F 01 7F
	brk $78.b		; 00 78
	brk $78.b		; 00 78
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
	brk $FF.b		; 00 FF
	adc $FF40FF.l,X		; 7F FF 40 FF
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
	brk $FF.b		; 00 FF
	sbc $05FF.w,X		; FD FF 05
	sbc $000002.l,X		; FF 02 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FCFC.w,X)		; FC FC FC
	brk $FC.b		; 00 FC
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
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
	brk $08.b		; 00 08
	bra  24.b		; 80 18
	brk $EE.b		; 00 EE
	ora ($DB.b,S),Y		; 13 DB
	sbc $F0FFEE.l,X		; FF EE FF F0
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $F0.b		; 00 F0
	sbc $000004.l,X		; FF 04 00 00
	brk $EE.b		; 00 EE
	sbc $06FFE0.l,X		; FF E0 FF 06
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $08FFE0.l,X		; FF E0 FF 08
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $E0.b		; 00 E0
	sbc $004006.l,X		; FF 06 40 00
	brk $F1.b		; 00 F1
	sbc $0AFFD0.l,X		; FF D0 FF 0A
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $D0.b		; 00 D0
	sbc $00400A.l,X		; FF 0A 40 00
	brk $C0.b		; 00 C0
	cpx #$E3C3.w		; E0 C3 E3
	ora $1FFFFF.l,X		; 1F FF FF 1F
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$E0FC.w		; E0 FC E0
	cpx #$20E0.w		; E0 E0 20
	jsr $3030.w		; 20 30 30
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $08.b		; 04 08
	cmp [$CC.b]		; C7 CC
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	lda $50FF10.l,X		; BF 10 FF 50
	sbc [$00.b],Y		; F7 00
	and ($00.b,S),Y		; 33 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $4020.w		; 20 20 40
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFCF00.l,X		; FF 00 CF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	sta $FFFFCF.l		; 8F CF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $EF.b		; 00 EF
	cmp $28FF08.l,X		; DF 08 FF 28
	lda $003000.l,X		; BF 00 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	jsr $0020.w		; 20 20 00
	brk $0C.b		; 00 0C
	trb $1C0C.w		; 1C 0C 1C
	cpx #$FCFC.w		; E0 FC FC
	cpx #$807C.w		; E0 7C 80
	jmp ($FC80.w,X)		; 7C 80 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	trb $1CFC.w		; 1C FC 1C
	trb $101C.w		; 1C 1C 10
	bpl  48.b		; 10 30
	bmi  96.b		; 30 60
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
	plp		; 28
	and [$38.b],Y		; 37 38
	and [$28.b]		; 27 28
	and [$08.b]		; 27 08
	ora [$18.b],Y		; 17 18
	ora [$18.b]		; 07 18
	ora [$18.b]		; 07 18
	eor [$1F.b]		; 47 1F
	rti		; 40

	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	rti		; 40

	jsr $2040.w		; 20 40 20
	tsb $0000.w		; 0C 00 00
	asl $1E00.w,X		; 1E 00 1E
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	ora $00.b,S		; 03 00
	sbc $00.b,S		; E3 00
	sbc $00.b,S		; E3 00
	sbc ($00.b,S),Y		; F3 00
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	sbc $7F7F00.l,X		; FF 00 7F 7F
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007C00.l,X		; 7F 00 7C 00
	jmp ($7800.w,X)		; 7C 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	bvc  -1.b		; 50 FF
	cmp $FF50FF.l,X		; DF FF 50 FF
	jsr $00C0.w		; 20 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
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
	sbc $EFFF28.l,X		; FF 28 FF EF
	sbc $10FF28.l,X		; FF 28 FF 10
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F800.w,X)		; FC 00 F8
	sed		; F8
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	lsr $04.b,X		; 56 04
	eor [$20.b]		; 47 20
	rts		; 60

	brk $1F.b		; 00 1F
	ora $E0C0E0.l,X		; 1F E0 C0 E0
	cpy #$C0E0.w		; C0 E0 C0
	cpx #$2058.w		; E0 58 20
	eor [$38.b]		; 47 38
	rts		; 60

	ora $1F00FF.l,X		; 1F FF 00 1F
	brk $FF.b		; 00 FF
	cpx #$E0FF.w		; E0 FF E0
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $0F0800.l,X		; FF 00 08 0F
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	beq   0.b		; F0 00
	sbc [$00.b],Y		; F7 00
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sbc $03FC01.l,X		; FF 01 FC 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $C04000.l,X		; FF 00 40 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	and $00BF00.l,X		; 3F 00 BF 00
	lda $000000.l,X		; BF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	ora ($12.b),Y		; 11 12
	adc $A09F60.l		; 6F 60 9F A0
	jsr $0018.w		; 20 18 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	ora $70201C.l		; 0F 1C 20 70
	brk $80.b		; 00 80
	rti		; 40

	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bra  32.b		; 80 20
	brk $E9.b		; 00 E9
	ora [$D4.b],Y		; 17 D4
	sbc $D4FFEB.l,X		; FF EB FF D4
	sbc $000000.l,X		; FF 00 00 00
	brk $FB.b		; 00 FB
	sbc $02FFD4.l,X		; FF D4 FF 02
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $D4.b		; 00 D4
	sbc $004000.l,X		; FF 00 40 00
	brk $E9.b		; 00 E9
	sbc $04FFE4.l,X		; FF E4 FF 04
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $06FFE4.l,X		; FF E4 FF 06
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $E4.b		; 00 E4
	sbc $000008.l,X		; FF 08 00 00
	brk $EA.b		; 00 EA
	sbc $0AFFF4.l,X		; FF F4 FF 0A
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $0CFFF4.l,X		; FF F4 FF 0C
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $F4.b		; 00 F4
	sbc $00000E.l,X		; FF 0E 00 00
	brk $00.b		; 00 00
	ora $02.b,S		; 03 02
	asl $02.b		; 06 02
	asl A		; 0A
	ora [$16.b]		; 07 16
	ora [$10.b],Y		; 17 10
	tsb $2423.w		; 0C 23 24
	and ($3C.b,S),Y		; 33 3C
	and $03.b,S		; 23 03
	brk $06.b		; 00 06
	ora ($0B.b,X)		; 01 0B
	tsb $14.b		; 04 14
	php		; 08
	trb $08.b		; 14 08
	plp		; 28
	bpl  56.b		; 10 38
	brk $30.b		; 00 30
	brk $80.b		; 00 80
	bra   6.b		; 80 06
	adc [$FF.b]		; 67 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	bra   3.b		; 80 03
	bra   0.b		; 80 00
	sta [$80.b]		; 87 80
	adc $008078.l,X		; 7F 78 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	inc $00FF.w,X		; FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	tsb $0000.w		; 0C 00 00
	asl $FF00.w,X		; 1E 00 FF
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  52.b		; 10 34
	bpl  48.b		; 10 30
	brk $30.b		; 00 30
	ora $70071F.l		; 0F 1F 07 70
	brk $78.b		; 00 78
	bvs 120.b		; 70 78
	bvs 120.b		; 70 78
	and [$08.b],Y		; 37 08
	bmi  15.b		; 30 0F
	bmi  15.b		; 30 0F
	and $000F00.l,X		; 3F 00 0F 00
	adc [$70.b],Y		; 77 70
	adc [$70.b],Y		; 77 70
	adc [$70.b],Y		; 77 70
	sbc $0000E0.l,X		; FF E0 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F8000.l,X		; FF 00 80 7F
	bra  -1.b		; 80 FF
	php		; 08
	sta $000000.l		; 8F 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $FF01.w,X		; FE 01 FF
	bpl -15.b		; 10 F1
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	asl $FF00.w		; 0E 00 FF
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $00FF.w,X		; FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $2C0800.l,X		; FF 00 08 2C
	php		; 08
	tsb $1C10.w		; 0C 10 1C
	cpx #$E0F8.w		; E0 F8 E0
	trb $1C00.w		; 1C 00 1C
	tsb $0C1C.w		; 0C 1C 0C
	trb $10EC.w		; 1C EC 10
	tsb $1CF0.w		; 0C F0 1C
	cpx #$00FC.w		; E0 FC 00
	cpx #$FC00.w		; E0 00 FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($FF1C.w,X)		; FC 1C FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	cop $FF.b		; 02 FF
	ora ($FF.b)		; 12 FF
	ora ($FF.b)		; 12 FF
	ora ($FF.b)		; 12 FF
	sbc ($FF.b,S),Y		; F3 FF
	ora ($FF.b)		; 12 FF
	ora ($FF.b)		; 12 FF
	tsb $1010.w		; 0C 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FF00.w,X		; FE 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $FF01FF.l,X		; FF FF 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	jsr $20FF.w		; 20 FF 20
	sbc $20FF20.l,X		; FF 20 FF 20
	sbc $20FF3F.l,X		; FF 3F FF 20
	sbc $C0FF20.l,X		; FF 20 FF C0
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
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	sed		; F8
	cpy #$F838.w		; C0 38 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2C.b		; 00 2C
	adc $7C.b,S		; 63 7C
	adc ($58.b,S),Y		; 73 58
	eor [$58.b]		; 47 58
	eor [$58.b]		; 47 58
	eor [$58.b]		; 47 58
	eor [$5F.b]		; 47 5F
	cpy #$C04F.w		; C0 4F C0
	bvs   0.b		; 70 00
	rts		; 60

	brk $40.b		; 00 40
	jsr $2040.w		; 20 40 20
	rti		; 40

	jsr $2040.w		; 20 40 20
	cpy #$D020.w		; C0 20 D0
	jsr $8F00.w		; 20 00 8F
	brk $8F.b		; 00 8F
	brk $9F.b		; 00 9F
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 120.b		; 70 78
	brk $78.b		; 00 78
	bvs 120.b		; 70 78
	adc [$7F.b],Y		; 77 7F
	sta [$7F.b]		; 87 7F
	sbc $FE03.w,X		; FD 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $77.b		; 00 77
	bvs 119.b		; 70 77
	bvs 119.b		; 70 77
	bvs 112.b		; 70 70
	bvs 112.b		; 70 70
	bvs  16.b		; 70 10
	bpl  24.b		; 10 18
	clc		; 18
	tsb $000C.w		; 0C 0C 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$00FF.w		; C0 FF 00
	sbc $FF02FB.l,X		; FF FB 02 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	tsb $08.b		; 04 08
	sta $088F08.l		; 8F 08 8F 08
	sta $FEFE80.l		; 8F 80 FE FE
	sbc $00FFBF.l,X		; FF BF FF 00
	sbc $7000FF.l,X		; FF FF 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	sbc ($10.b),Y		; F1 10
	sbc ($10.b),Y		; F1 10
	sbc ($81.b),Y		; F1 81
	sbc $FDFF7F.l,X		; FF 7F FF FD
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $00FF03.l,X		; FF 03 FF 00
	sbc $FF20BF.l,X		; FF BF 20 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	tsb $001C.w		; 0C 1C 00
	trb $1C0C.w		; 1C 0C 1C
	cpx $E2FC.w		; EC FC E2
	jsr ($C0BE.w,X)		; FC BE C0
	ror $FE80.w,X		; 7E 80 FE
	brk $FC.b		; 00 FC
	trb $1CFC.w		; 1C FC 1C
	jsr ($1C1C.w,X)		; FC 1C 1C
	trb $1C1C.w		; 1C 1C 1C
	php		; 08
	php		; 08
	clc		; 18
	clc		; 18
	bmi  48.b		; 30 30
	sbc $00FC00.l,X		; FF 00 FC 00
	jsr ($7C00.w,X)		; FC 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
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
	brk $0E.b		; 00 0E
	bra  48.b		; 80 30
	brk $E6.b		; 00 E6
	inc A		; 1A
	cmp $E8FF.w		; CD FF E8
	sbc $00FFCD.l,X		; FF CD FF 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $02FFCD.l,X		; FF CD FF 02
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $CD.b		; 00 CD
	sbc $004000.l,X		; FF 00 40 00
	brk $F9.b		; 00 F9
	sbc $04FFCD.l,X		; FF CD FF 04
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	sbc $06FFDD.l,X		; FF DD FF 06
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $08FFDD.l,X		; FF DD FF 08
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $DD.b		; 00 DD
	sbc $00000A.l,X		; FF 0A 00 00
	brk $16.b		; 00 16
	brk $DD.b		; 00 DD
	sbc $00000C.l,X		; FF 0C 00 00
	brk $E6.b		; 00 E6
	sbc $0EFFED.l,X		; FF ED FF 0E
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $20FFED.l,X		; FF ED FF 20
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $ED.b		; 00 ED
	sbc $000022.l,X		; FF 22 00 00
	brk $16.b		; 00 16
	brk $ED.b		; 00 ED
	sbc $000024.l,X		; FF 24 00 00
	brk $E7.b		; 00 E7
	sbc $26FFFD.l,X		; FF FD FF 26
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	brk $FD.b		; 00 FD
	sbc $000026.l,X		; FF 26 00 00
	brk $00.b		; 00 00
	ora $02.b,S		; 03 02
	asl $02.b		; 06 02
	phd		; 0B
	ora $14.b		; 05 14
	and $202F2C.l		; 2F 2C 2F 20
	trb $5803.w		; 1C 03 58
	adc [$03.b]		; 67 03
	brk $06.b		; 00 06
	ora ($0B.b,X)		; 01 0B
	tsb $16.b		; 04 16
	php		; 08
	plp		; 28
	bpl  40.b		; 10 28
	bpl  16.b		; 10 10
	jsr $0060.w		; 20 60 00
	bra -128.b		; 80 80
	ora [$67.b]		; 07 67
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $80.b		; 00 80
	ora ($80.b,X)		; 01 80
	bra 127.b		; 80 7F
	sei		; 78
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $87.b		; 00 87
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2C.b		; 00 2C
	adc $2F.b,S		; 63 2F
	rts		; 60

	and [$60.b]		; 27 60
	and ($61.b,X)		; 21 61
	jsr $1060.w		; 20 60 10
	bvs  15.b		; 70 0F
	and $600F00.l,X		; 3F 00 0F 60
	bpl  96.b		; 10 60
	bpl 104.b		; 10 68
	bpl  97.b		; 10 61
	asl $1F60.w,X		; 1E 60 1F
	bvs  15.b		; 70 0F
	adc $00FF00.l,X		; 7F 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sta $0000E0.l,X		; 9F E0 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FE0100.l,X		; FF 00 01 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	pea $000C.w		; F4 0C 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $00FF00.l		; 0F 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	ora $00.b,S		; 03 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	beq  -1.b		; F0 FF
	brk $A0.b		; 00 A0
	bmi -96.b		; 30 A0
	bmi  32.b		; 30 20
	bmi  32.b		; 30 20
	bmi  32.b		; 30 20
	bmi  64.b		; 30 40
	bvs -128.b		; 70 80
	bcs   0.b		; B0 00
	brk $30.b		; 00 30
	rti		; 40

	bmi  64.b		; 30 40
	bcs  64.b		; B0 40
	bmi -64.b		; 30 C0
	bmi -64.b		; 30 C0
	bvs -128.b		; 70 80
	beq   0.b		; F0 00
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
	brk $07.b		; 00 07
	sbc $DC07FB.l,X		; FF FB 07 DC
	and $DE.b,S		; 23 DE
	and ($FB.b,X)		; 21 FB
	tsb $F6.b		; 04 F6
	ora #$00FF.w		; 09 FF 00
	sbc $F0F000.l,X		; FF 00 F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	clc		; 18
	clc		; 18
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$00FF.w		; C0 FF 00
	sbc $0500FF.l,X		; FF FF 00 05
	sed		; F8
	xce		; FB
	brk $FF.b		; 00 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$04.b]		; 07 04
	tsb $00.b		; 04 00
	brk $78.b		; 00 78
	eor [$78.b]		; 47 78
	eor [$F8.b]		; 47 F8
	cmp [$F8.b]		; C7 F8
	cmp [$B0.b]		; C7 B0
	sta $B08FB0.l		; 8F B0 8F B0
	sta $608FB0.l		; 8F B0 8F 60
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	brk $83.b		; 00 83
	brk $87.b		; 00 87
	brk $87.b		; 00 87
	brk $87.b		; 00 87
	brk $BF.b		; 00 BF
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	beq -32.b		; F0 E0
	sed		; F8
	cpx #$E0F8.w		; E0 F8 E0
	sed		; F8
	cpx #$00F8.w		; E0 F8 00
	sed		; F8
	cpx #$E7F8.w		; E0 F8 E7
	sbc $F7000F.l,X		; FF 0F 00 F7
	beq  -9.b		; F0 F7
	beq  -9.b		; F0 F7
	beq  -9.b		; F0 F7
	beq  -9.b		; F0 F7
	beq  -9.b		; F0 F7
	beq -16.b		; F0 F0
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	adc $226322.l,X		; 7F 22 63 22
	adc $22.b,S		; 63 22
	adc $22.b,S		; 63 22
	eor $1A.b,S		; 43 1A
	.db $42, $E0		; 42 E0
	sbc $8000FF.l,X		; FF FF 00 80
	brk $9C.b		; 00 9C
	brk $9C.b		; 00 9C
	brk $9C.b		; 00 9C
	brk $BC.b		; 00 BC
	brk $BD.b		; 00 BD
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $02FE02.l,X		; FF 02 FE 02
	inc $FE02.w,X		; FE 02 FE
	cop $FE.b		; 02 FE
	cop $02.b		; 02 02
	bpl -33.b		; 10 DF
	sbc $000000.l,X		; FF 00 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $0000.w,X		; FD 00 00
	jsr $00FF.w		; 20 FF 00
	bpl -16.b		; 10 F0
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	jsr $C010.w		; 20 10 C0
	bpl  31.b		; 10 1F
	sbc $0F00FF.l,X		; FF FF 00 0F
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($FE.b,X)		; 01 FE
	sbc $FE00FF.l,X		; FF FF 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sei		; 78
	sed		; F8
	sei		; 78
	sed		; F8
	sei		; 78
	sed		; F8
	sei		; 78
	sed		; F8
	brk $F8.b		; 00 F8
	sei		; 78
	sed		; F8
	sei		; 78
	sed		; F8
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
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
	sbc $007F00.l,X		; FF 00 7F 00
	adc $601F7F.l,X		; 7F 7F 1F 60
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $04FF04.l,X		; FF 04 FF 04
	sbc $04FFFC.l,X		; FF FC FF 04
	sbc $03FF04.l,X		; FF 04 FF 03
	brk $00.b		; 00 00
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
	adc $FF00FF.l		; 6F FF 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $FFFFFF.l		; CF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	bne  -1.b		; D0 FF
	brk $FF.b		; 00 FF
	sbc $F00D00.l,X		; FF 00 0D F0
	xce		; FB
	brk $FF.b		; 00 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $000404.l		; 0F 04 04 00
	brk $FE.b		; 00 FE
	sbc $13FEFD.l,X		; FF FD FE 13
	jsr ($F807.w,X)		; FC 07 F8
	sbc $FC0300.l,X		; FF 00 03 FC
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	brk $D8.b		; 00 D8
	jsr $20D8.w		; 20 D8 20
	sed		; F8
	brk $78.b		; 00 78
	bra  -8.b		; 80 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

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
	brk $FE.b		; 00 FE
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	sbc $FF80FF.l,X		; FF FF 80 FF
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
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
	sbc $FF00FF.l,X		; FF FF 00 FF
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
	brk $FF.b		; 00 FF
	tsb $FF.b		; 04 FF
	tsb $FF.b		; 04 FF
	jsr ($04FF.w,X)		; FC FF 04
	sbc $03FF04.l,X		; FF 04 FF 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $80FFFF.l,X		; FF FF FF 80
	sbc $00FF80.l,X		; FF 80 FF 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	beq -128.b		; F0 80
	bvs -16.b		; 70 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  48.b		; 80 30
	brk $E2.b		; 00 E2
	ora $E2FFC5.l,X		; 1F C5 FF E2
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $F0.b		; 00 F0
	sbc $000004.l,X		; FF 04 00 00
	brk $12.b		; 00 12
	brk $F0.b		; 00 F0
	sbc $000006.l,X		; FF 06 00 00
	brk $E2.b		; 00 E2
	sbc $08FFE0.l,X		; FF E0 FF 08
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $0AFFE0.l,X		; FF E0 FF 0A
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $E0.b		; 00 E0
	sbc $00000C.l,X		; FF 0C 00 00
	brk $12.b		; 00 12
	brk $E0.b		; 00 E0
	sbc $00000E.l,X		; FF 0E 00 00
	brk $E4.b		; 00 E4
	sbc $20FFD0.l,X		; FF D0 FF 20
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $22FFD0.l,X		; FF D0 FF 22
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $D0.b		; 00 D0
	sbc $004020.l,X		; FF 20 40 00
	brk $FE.b		; 00 FE
	sbc $22FFD0.l,X		; FF D0 FF 22
	rti		; 40

	brk $00.b		; 00 00
	inc $FF.b		; E6 FF
	cpy #$24FF.w		; C0 FF 24
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $26FFC0.l,X		; FF C0 FF 26
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $C0.b		; 00 C0
	sbc $004024.l,X		; FF 24 40 00
	brk $FC.b		; 00 FC
	sbc $26FFC0.l,X		; FF C0 FF 26
	rti		; 40

	brk $00.b		; 00 00
	xce		; FB
	tsb $7F.b		; 04 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	and $03003F.l,X		; 3F 3F 00 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $81.b		; 00 81
	ror $00FE.w,X		; 7E FE 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FFFF.l,X		; FF FF FF 01
	sta ($81.b,X)		; 81 81
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	ora $FF10FF.l,X		; 1F FF 10 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	ora $E010FF.l,X		; 1F FF 10 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $DFC3.w		; 2C C3 DF
	cop $FF.b		; 02 FF
	jsl $FF22FF.l		; 22 FF 22 FF
	jsl $FF22FF.l		; 22 FF 22 FF
	sbc $FF.b,S		; E3 FF
	jsl $203C3C.l		; 22 3C 3C 20
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$F8.b]		; 07 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $070700.l,X		; FF 00 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($F880.w,X)		; 7C 80 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	beq -128.b		; F0 80
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$03.b]		; 07 03
	sei		; 78
	brk $7C.b		; 00 7C
	bvs 124.b		; 70 7C
	bvs 124.b		; 70 7C
	bvs 124.b		; 70 7C
	bvs 124.b		; 70 7C
	brk $7C.b		; 00 7C
	adc $000700.l,X		; 7F 00 07 00
	tda		; 7B
	sei		; 78
	tda		; 7B
	sei		; 78
	tda		; 7B
	sei		; 78
	tda		; 7B
	sei		; 78
	tda		; 7B
	sei		; 78
	tda		; 7B
	sei		; 78
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $030400.l,X		; FF 00 04 03
	php		; 08
	ora $040C04.l		; 0F 04 0C 04
	tsb $0C04.w		; 0C 04 0C
	tsb $08.b		; 04 08
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00F000.l,X		; FF 00 F0 00
	sbc ($00.b,S),Y		; F3 00
	sbc ($00.b,S),Y		; F3 00
	sbc ($00.b,S),Y		; F3 00
	sbc [$00.b],Y		; F7 00
	brk $FF.b		; 00 FF
	sbc $9F0000.l,X		; FF 00 00 9F
	brk $FF.b		; 00 FF
	jsr $203F.w		; 20 3F 20
	and $203F20.l,X		; 3F 20 3F 20
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $9F.b		; 00 9F
	rts		; 60

	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $10FF00.l,X		; FF 00 FF 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	sbc $8000FF.l,X		; FF FF 00 80
	brk $40.b		; 00 40
	cpy #$C080.w		; C0 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra  64.b		; 80 40
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $003F00.l,X		; FF 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $00BF00.l,X		; 3F 00 BF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $C0.b		; 00 C0
	brk $78.b		; 00 78
	brk $F8.b		; 00 F8
	sec		; 38
	sed		; F8
	sec		; 38
	sed		; F8
	sec		; 38
	sed		; F8
	sec		; 38
	sed		; F8
	brk $F8.b		; 00 F8
	sed		; F8
	brk $80.b		; 00 80
	brk $78.b		; 00 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $001F00.l,X		; 3F 00 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$C000.w		; C0 00 C0
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
	brk $FF.b		; 00 FF
	bpl  -1.b		; 10 FF
	bpl  -1.b		; 10 FF
	cpx #$0080.w		; E0 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $22FF22.l,X		; FF 22 FF 22
	sbc $00071C.l,X		; FF 1C 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	jmp ($7C70.w,X)		; 7C 70 7C
	adc ($7F.b,S),Y		; 73 7F
	sta $7F.b,S		; 83 7F
	sbc $11EE03.l,X		; FF 03 EE 11
	sbc $02FD10.l		; EF 10 FD 02
	tda		; 7B
	sei		; 78
	tda		; 7B
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	tsb $000C.w		; 0C 0C 00
	brk $3F.b		; 00 3F
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $F0FFFF.l,X		; FF FF FF F0
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	tsb $8F88.w		; 0C 88 8F
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $0DFFFF.l,X		; FF FF FF 0D
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $F7.b		; 00 F7
	brk $73.b		; 00 73
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	jsr $FF00.w		; 20 00 FF
	ora ($FD.b,X)		; 01 FD
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $DF00FF.l,X		; FF FF 00 DF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	bpl   0.b		; 10 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C747.w		; C0 47 C7
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFC0FF.l,X		; FF FF C0 FF
	brk $FF.b		; 00 FF
	sbc $00BF00.l,X		; FF 00 BF 00
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq  -1.b		; F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FE3D.l,X		; FF 3D FE 03
	jsr ($01FE.w,X)		; FC FE 01
	sbc $000F00.l,X		; FF 00 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	sed		; F8
	sec		; 38
	sed		; F8
	sec		; 38
	sed		; F8
	tsb $F8.b		; 04 F8
	jsr ($DC00.w,X)		; FC 00 DC
	jsr $20DC.w		; 20 DC 20
	jsr ($7800.w,X)		; FC 00 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	cpy #$2EC0.w		; C0 C0 2E
	and ($6E.b,X)		; 21 6E
	adc ($6E.b,X)		; 61 6E
	adc ($4C.b,X)		; 61 4C
	eor ($5C.b,S),Y		; 53 5C
	eor $5C.b,S		; 43 5C
	eor $4C.b,S		; 43 4C
	eor $4C.b,S		; 43 4C
	eor $28.b,S		; 43 28
	bpl  96.b		; 10 60
	bpl  96.b		; 10 60
	bpl  80.b		; 10 50
	jsr $2050.w		; 20 50 20
	bvc  32.b		; 50 20
	bvc  32.b		; 50 20
	bvc  32.b		; 50 20
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E3.b		; 00 E3
	brk $E7.b		; 00 E7
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	cop $06.b		; 02 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	asl $01.b		; 06 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $C0C07F.l,X		; 1F 7F C0 C0
	ora $33.b,S		; 03 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $3FC000.l,X		; 7F 00 C0 3F
	bit $00C0.w,X		; 3C C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $C00000.l,X		; FF 00 00 C0
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $4C0000.l,X		; FF 00 00 4C
	cmp $4F.b,S		; C3 4F
	cpy #$D047.w		; C0 47 D0
	rti		; 40

	iny		; C8
	eor ($C1.b,X)		; 41 C1
	rti		; 40

	cpy #$E020.w		; C0 20 E0
	ora $20D07F.l,X		; 1F 7F D0 20
	bne  32.b		; D0 20
	cld		; D8
	jsr $30CF.w		; 20 CF 30
	cmp ($3E.b,X)		; C1 3E
	cpy #$E03F.w		; C0 3F E0
	ora $0000FF.l,X		; 1F FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	cpx #$807F.w		; E0 7F 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $0B.b		; 02 0B
	ora $14.b		; 05 14
	and $202F2C.l		; 2F 2C 2F 20
	jmp $5C53.w		; 4C 53 5C
	eor $98.b,S		; 43 98
	lda [$B8.b]		; A7 B8
	sta [$0B.b]		; 87 0B
	tsb $16.b		; 04 16
	php		; 08
	plp		; 28
	bpl  40.b		; 10 28
	bpl  80.b		; 10 50
	jsr $2050.w		; 20 50 20
	ldy #$A040.w		; A0 40 A0
	rti		; 40

	adc $00FF40.l,X		; 7F 40 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C1.b		; 00 C1
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$0000.w		; E0 00 00
	beq   0.b		; F0 00
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
	brk $30.b		; 00 30
	brk $FC.b		; 00 FC
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
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	asl $F4.b		; 06 F4
	sbc $F4FFFB.l,X		; FF FB FF F4
	sbc $000000.l,X		; FF 00 00 00
	brk $03.b		; 00 03
	brk $F4.b		; 00 F4
	sbc $000001.l,X		; FF 01 00 00
	brk $FB.b		; 00 FB
	sbc $02FFFC.l,X		; FF FC FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $02FFFC.l,X		; FF FC FF 02
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $007040.l,X		; 7F 40 70 00
	lda $80003F.l,X		; BF 3F 00 80
	and $001F7D.l,X		; 3F 7D 1F 00
	bra -128.b		; 80 80
	adc $008000.l,X		; 7F 00 80 00
	bcc  16.b		; 90 10
	cpy #$8000.w		; C0 00 80
	adc $FF807F.l,X		; 7F 7F 80 FF
	sbc $00007F.l,X		; FF 7F 00 00
	brk $A0.b		; 00 A0
	rts		; 60

	cpx #$F000.w		; E0 00 F0
	cpx #$1000.w		; E0 00 10
	cpx #$80E0.w		; E0 E0 80
	brk $10.b		; 00 10
	bpl -32.b		; 10 E0
	brk $50.b		; 00 50
	rti		; 40

	bcc -128.b		; 90 80
	bpl   0.b		; 10 00
	bpl -32.b		; 10 E0
	cpx #$F010.w		; E0 10 F0
	beq -32.b		; F0 E0
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	ora $C000C0.l,X		; 1F C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $F8.b		; 00 F8
	php		; 08
	beq  -1.b		; F0 FF
	sed		; F8
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	sbc $000002.l,X		; FF 02 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $5C.b		; 00 5C
	jsr $007C.w		; 20 7C 00
	cpy #$083F.w		; C0 3F 08
	and [$00.b],Y		; 37 00
	brk $7F.b		; 00 7F
	adc $60003F.l,X		; 7F 3F 00 60
	brk $4C.b		; 00 4C
	tsb $0C4C.w		; 0C 4C 0C
	rti		; 40

	brk $3F.b		; 00 3F
	rti		; 40

	brk $7F.b		; 00 7F
	adc $000000.l,X		; 7F 00 00 00
	inc $0700.w,X		; FE 00 07
	clc		; 18
	ora $FE0100.l,X		; 1F 00 01 FE
	ora $01F7.w		; 0D F7 01
	ora ($FF.b,X)		; 01 FF
	adc $0300FE.l,X		; 7F FE 00 03
	brk $09.b		; 00 09
	clc		; 18
	ora $0118.w,Y		; 19 18 01
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $80FF.w,X		; FE FF 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $700F00.l		; 0F 00 0F 70
	brk $00.b		; 00 00
	adc $1F7800.l,X		; 7F 00 78 1F
	adc $006000.l,X		; 7F 00 60 00
	rts		; 60

	brk $70.b		; 00 70
	bvs 127.b		; 70 7F
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $78.b		; 00 78
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	jsr ($00FF.w,X)		; FC FF 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora [$07.b]		; 07 07
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	plx		; FA
	asl $F4.b		; 06 F4
	sbc $F4FFFA.l,X		; FF FA FF F4
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F4.b		; 00 F4
	sbc $000001.l,X		; FF 01 00 00
	brk $FA.b		; 00 FA
	sbc $02FFFC.l,X		; FF FC FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $02FFFC.l,X		; FF FC FF 02
	rti		; 40

	brk $00.b		; 00 00
	adc $80BF7F.l,X		; 7F 7F BF 80
	bra -40.b		; 80 D8
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	brk $87.b		; 00 87
	sbc $007F7F.l,X		; FF 7F 7F 00
	cpy #$8000.w		; C0 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $F880FF.l,X		; FF FF 80 F8
	bra   0.b		; 80 00
	brk $F0.b		; 00 F0
	beq -24.b		; F0 E8
	php		; 08
	clc		; 18
	iny		; C8
	clc		; 18
	inx		; E8
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	sed		; F8
	beq -16.b		; F0 F0
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	beq  -8.b		; F0 F8
	php		; 08
	sed		; F8
	php		; 08
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra   4.b		; 80 04
	brk $F9.b		; 00 F9
	ora [$F0.b]		; 07 F0
	sbc $F0FFF9.l,X		; FF F9 FF F0
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	and $40702F.l,X		; 3F 2F 70 40
	jmp ($AC80.w)		; 6C 80 AC
	cpy #$BFFF.w		; C0 FF BF
	lda $008000.l,X		; BF 00 80 00
	sta $3F.b,S		; 83 3F
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	adc $0080FC.l,X		; 7F FC 80 00
	sed		; F8
	inx		; E8
	trb $6404.w		; 1C 04 64
	cop $76.b		; 02 76
	cop $FE.b		; 02 FE
	plx		; FA
	plx		; FA
	brk $00.b		; 00 00
	brk $82.b		; 00 82
	sed		; F8
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	inc $027E.w,X		; FE 7E 02
	sta $87.b,S		; 83 87
	sed		; F8
	jsr ($FF00.w,X)		; FC 00 FF
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$F800.w		; C0 00 F8
	bra -125.b		; 80 83
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $82.b		; 00 82
.ACCU 16
.INDEX 16
	rep #$3E		; C2 3E
	ror $FC02.w,X		; 7E 02 FC
	inc $FE00.w,X		; FE 00 FE
	jsr ($00FE.w,X)		; FC FE 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	rol $8202.w,X		; 3E 02 82
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FE.b		; 00 FE
	cop $F7.b		; 02 F7
	sbc $F7FFFE.l,X		; FF FE FF F7
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000001.l,X		; FF 01 00 00
	brk $20.b		; 00 20
	jsr $50F8.w		; 20 F8 50
	bvs  32.b		; 70 20
	rti		; 40

	rti		; 40

	sed		; F8
	brk $20.b		; 00 20
	jsr $0020.w		; 20 20 00
	jsr $2000.w		; 20 00 20
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	jsr $1060.w		; 20 60 10
	jsr $7000.w		; 20 00 70
	brk $50.b		; 00 50
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
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FD.b		; 00 FD
	tsb $F4.b		; 04 F4
	sbc $F4FFFD.l,X		; FF FD FF F4
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $01FFFC.l,X		; FF FC FF 01
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl   0.b		; 10 00
	ora ($FE.b),Y		; 11 FE
	jmp ($1038.w)		; 6C 38 10
	bpl   0.b		; 10 00
	bpl 108.b		; 10 6C
	bpl 124.b		; 10 7C
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	bpl  17.b		; 10 11
	jmp ($0000.w)		; 6C 00 00
	bpl  56.b		; 10 38
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	bpl  64.b		; 10 40
	ldy #$A040.w		; A0 40 A0
	rti		; 40

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FB.b		; 00 FB
	asl $ED.b		; 06 ED
	sbc $EDFFFB.l,X		; FF FB FF ED
	sbc $000000.l,X		; FF 00 00 00
	brk $03.b		; 00 03
	brk $ED.b		; 00 ED
	sbc $000001.l,X		; FF 01 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF5.l,X		; FF F5 FF 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $000003.l,X		; FF 03 00 00
	brk $06.b		; 00 06
	asl $04.b		; 06 04
	cop $00.b		; 02 00
	ora $3F37F8.l		; 0F F8 37 3F
	ora $0F161F.l		; 0F 1F 16 0F
	ora $1919.w,Y		; 19 19 19
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $06.b		; 06 06
	bmi   0.b		; 30 00
	ora #$1006.w		; 09 06 10
	asl $09.b,X		; 16 09
	brk $16.b		; 00 16
	ora #$0000.w		; 09 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	beq -64.b		; F0 C0
	cpy #$8000.w		; C0 00 80
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi -64.b		; 30 C0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	.db $62, $E7, $7E		; 62 E7 7E
	cmp $3C.b,S		; C3 3C
	cmp $3C.b,S		; C3 3C
	clc		; 18
	ror $7E.b		; 66 7E
	bit $3C.b		; 24 3C
	ror $18.b		; 66 18
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	clc		; 18
	phy		; 5A
	bit $5A.b		; 24 5A
	bit $42.b		; 24 42
	bit $00.b		; 24 00
	bit $42.b		; 24 42
	bit $00.b		; 24 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $FA.b		; 00 FA
	php		; 08
	sbc [$FF.b]		; E7 FF
	plx		; FA
	sbc $00FFE7.l,X		; FF E7 FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF7.l,X		; FF F7 FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora [$07.b]		; 07 07
	ora [$02.b]		; 07 02
	ora $80.b		; 05 80
	adc [$6A.b]		; 67 6A
	tsb $3D.b		; 04 3D
	php		; 08
	tsb $1807.w		; 0C 07 18
	trb $04.b		; 14 04
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	adc $10.b,S		; 63 10
	ora ($0A.b),Y		; 11 0A
	brk $04.b		; 00 04
	ora $13.b,S		; 03 13
	ora [$00.b],Y		; 17 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   2.b		; 80 02
	stz $8058.w		; 9C 58 80
	bvs  64.b		; 70 40
	cpy #$6080.w		; C0 80 60
	ldy #$0080.w		; A0 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	jsr $C020.w		; 20 20 C0
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	ldy #$2499.w		; A0 99 24
	lda $3C24.w,X		; BD 24 3C
	sbc [$3C.b]		; E7 3C
	brk $3C.b		; 00 3C
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $42.b		; 00 42
	bit $42.b		; 24 42
	bit $C3.b		; 24 C3
	bit $24.b		; 24 24
	brk $24.b		; 00 24
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	phd		; 0B
	php		; 08
	clc		; 18
	and [$14.b],Y		; 37 14
	rol $38.b,X		; 36 38
	and [$10.b],Y		; 37 10
	and [$00.b],Y		; 37 00
	and [$00.b],Y		; 37 00
	ora ($04.b,S),Y		; 13 04
	tsb $03.b		; 04 03
	phd		; 0B
	tsb $2C.b		; 04 2C
	php		; 08
	and ($04.b,X)		; 21 04
	tas		; 1B
	tsb $08.b		; 04 08
	ora [$08.b]		; 07 08
	tsb $08.b		; 04 08
	tsb $C0.b		; 04 C0
	brk $40.b		; 00 40
	rts		; 60

	bcc -96.b		; 90 A0
	beq 112.b		; F0 70
	bcs  32.b		; B0 20
	bcs   0.b		; B0 00
	bcs   0.b		; B0 00
	jsr $8080.w		; 20 80 80
	brk $40.b		; 00 40
	bra -48.b		; 80 D0
	rti		; 40

	bpl -128.b		; 10 80
	rts		; 60

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  24.b		; 80 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F8.b		; 00 F8
	asl A		; 0A
	sbc ($FF.b,X)		; E1 FF
	sed		; F8
	sbc $00FFE1.l,X		; FF E1 FF 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $E1.b		; 00 E1
	sbc $000002.l,X		; FF 02 00 00
	brk $FA.b		; 00 FA
	sbc $04FFF1.l,X		; FF F1 FF 04
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($80.b,X)		; 01 80
	adc ($E4.b,X)		; 61 E4
	ora ($3D.b,S),Y		; 13 3D
	tsb $0E.b		; 04 0E
	cop $01.b		; 02 01
	cop $02.b		; 02 02
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	rts		; 60

	php		; 08
	clc		; 18
	asl $02.b		; 06 02
	ora $00.b,S		; 03 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $10.b		; 00 10
	brk $E0.b		; 00 E0
	brk $E1.b		; 00 E1
	ora $EFE2.w,Y		; 19 E2 EF
	php		; 08
	trb $20D0.w		; 1C D0 20
	bpl  16.b		; 10 10
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	cpx #$C1C0.w		; E0 C0 C1
	tsb $06.b		; 04 06
	clc		; 18
	bpl  48.b		; 10 30
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$6328.w		; E0 28 63
	tsb $086F.w		; 0C 6F 08
	and $002708.l		; 2F 08 27 00
	and [$00.b]		; 27 00
	adc [$00.b]		; 67 00
	ora [$70.b]		; 07 70
	and ($0F.b,S),Y		; 33 0F
	bpl  12.b		; 10 0C
	ora [$08.b],Y		; 17 08
	ora [$08.b],Y		; 17 08
	trb $1C08.w		; 1C 08 1C
	php		; 08
	trb $7C08.w		; 1C 08 7C
	php		; 08
	trb $1850.w		; 1C 50 18
	cpy #$40D8.w		; C0 D8 40
	bne  64.b		; D0 40
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	tya		; 98
	brk $80.b		; 00 80
	sec		; 38
	bmi -64.b		; 30 C0
	jsr $A0C0.w		; 20 C0 A0
	rti		; 40

	ldy #$E040.w		; A0 40 E0
	rti		; 40

	cpx #$E040.w		; E0 40 E0
	rti		; 40

	sed		; F8
	rti		; 40

	asl $01.b		; 06 01
	asl $0309.w		; 0E 09 03
	tsb $03.b		; 04 03
	asl $1E07.w		; 0E 07 1E
	ora $3B18.w,Y		; 19 18 3B
	trb $0A39.w		; 1C 39 0A
	cop $01.b		; 02 01
	php		; 08
	ora #$0003.w		; 09 03 00
	ora $00.b,S		; 03 00
	ora $04.b,S		; 03 04
	ora $06.b,X		; 15 06
	ora ($02.b),Y		; 11 02
	ora $D802.w		; 0D 02 D8
	cpx #$E4DC.w		; E0 DC E4
	bmi   8.b		; 30 08
	beq  28.b		; F0 1C
	sed		; F8
	asl $06E6.w,X		; 1E E6 06
	and [$0E.b],Y		; 37 0E
	and [$14.b]		; 27 14
	brk $E0.b		; 00 E0
	tsb $E4.b		; 04 E4
	beq -64.b		; F0 C0
	bmi   0.b		; 30 00
	bmi   8.b		; 30 08
	rol A		; 2A
	clc		; 18
.INDEX 8
	sep #$10		; E2 10
	cpx $00D0.w		; EC D0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F6.b		; 00 F6
	tsb $FFDB.w		; 0C DB FF
	inc $FF.b,X		; F6 FF
	stp		; DB
	sbc $000000.l,X		; FF 00 00 00
	brk $06.b		; 00 06
	brk $DB.b		; 00 DB
	sbc $000002.l,X		; FF 02 00 00
	brk $F9.b		; 00 F9
	sbc $04FFEB.l,X		; FF EB FF 04
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $06FFFB.l,X		; FF FB FF 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	bcs -13.b		; B0 F3
	php		; 08
	adc $0004.w,X		; 7D 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bmi   4.b		; 30 04
	tsb $0206.w		; 0C 06 02
	beq  40.b		; F0 28
	sed		; F8
	bvs  -8.b		; 70 F8
	clv		; B8
	pha		; 48
	bcs   0.b		; B0 00
	bvs   0.b		; 70 00
	sed		; F8
	.db $42, $9C		; 42 9C
	ora ($25.b,X)		; 01 25
	cli		; 58
	bra -120.b		; 80 88
	brk $20.b		; 00 20
	rti		; 40

	sei		; 78
	jsr $7070.w		; 20 70 70
	bvs 112.b		; 70 70
	ora ($21.b,X)		; 01 21
	stp		; DB
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $10.b		; 00 10
	ror $8078.w		; 6E 78 80
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	asl $0060.w		; 0E 60 00
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
	brk $C3.b		; 00 C3
	rts		; 60

	inc $CA78.w,X		; FE 78 CA
	adc $4EC8.w		; 6D C8 4E
	cpx $08.b		; E4 08
	adc [$08.b]		; 67 08
	adc $082F08.l		; 6F 08 2F 08
	clc		; 18
	trb $0401.w		; 1C 01 04
	bvc  39.b		; 50 27
	adc ($07.b),Y		; 71 07
	ora [$0B.b],Y		; 17 0B
	trb $08.b		; 14 08
	ora $08.b,X		; 15 08
	ora $08.b,X		; 15 08
	sty $0E.b		; 84 0E
	jsr ($A63E.w,X)		; FC 3E A6
	jmp ($E426.w)		; 6C 26 E4
	lsr $CC20.w		; 4E 20 CC
	jsr $20EC.w		; 20 EC 20
	inx		; E8
	jsr $7030.w		; 20 30 70
	brk $40.b		; 00 40
	trb $C8.b		; 14 C8
	trb $D0C0.w		; 1C C0 D0
	ldy #$50.b		; A0 50
	jsr $2050.w		; 20 50 20
	bvc  32.b		; 50 20
	sed		; F8
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $50.b		; 00 50
	jsr $0070.w		; 20 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dey		; 88
	brk $00.b		; 00 00
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
	brk $1E.b		; 00 1E
	cop $03.b		; 02 03
	ora ($03.b,X)		; 01 03
	brk $0D.b		; 00 0D
	asl $01.b		; 06 01
	cop $00.b		; 02 00
	ora [$03.b]		; 07 03
	ora $030C08.l		; 0F 08 0C 03
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	brk $0C.b		; 00 0C
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $03.b,S		; 03 03
	ora $22.b,S		; 03 22
	ldx $7674.w		; AE 74 76
	sed		; F8
	adc [$F9.b],Y		; 77 F9
	stx $FC50.w		; 8E 50 FC
	plb		; AB
	rol $07.b		; 26 07
	cmp $DE88.w,Y		; D9 88 DE
	bit $04.b		; 24 04
	bvs   4.b		; 70 04
	sed		; F8
	ora ($F9.b,X)		; 01 F9
	tay		; A8
	bvs -120.b		; 70 88
	jsr $8856.w		; 20 56 88
	ldx $C006.w		; AE 06 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $27.b		; 00 27
	brk $27.b		; 00 27
	brk $67.b		; 00 67
	brk $07.b		; 00 07
	rts		; 60

	ora [$08.b],Y		; 17 08
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	trb $1C08.w		; 1C 08 1C
	php		; 08
	trb $6C08.w		; 1C 08 6C
	php		; 08
	tsb $0400.w		; 0C 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $C8.b		; 00 C8
	brk $C8.b		; 00 C8
	brk $CC.b		; 00 CC
	brk $C0.b		; 00 C0
	tsb $20D0.w		; 0C D0 20
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bvs  32.b		; 70 20
	bvs  32.b		; 70 20
	bvs  32.b		; 70 20
	jmp ($6030.w,X)		; 7C 30 60
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	bra  24.b		; 80 18
	brk $F3.b		; 00 F3
	asl $FFD5.w		; 0E D5 FF
	sbc ($FF.b,S),Y		; F3 FF
	cmp $FF.b,X		; D5 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cmp $FF.b,X		; D5 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $FF.b		; E5 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $FF.b		; E5 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	sed		; F8
	sbc $08FFF5.l,X		; FF F5 FF 08
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $F5.b		; 00 F5
	sbc $00000A.l,X		; FF 0A 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $0202.w,X		; BC 02 02
	rol $3F1F.w		; 2E 1F 3F
	ora $00372F.l,X		; 1F 2F 37 00
	and $002619.l,X		; 3F 19 26 00
	asl $3F00.w,X		; 1E 00 3F
	iny		; C8
	and ($11.b,S),Y		; 33 11
	jsr $0020.w		; 20 20 00
	trb $08.b		; 14 08
	brk $00.b		; 00 00
	ora $1F1E04.l,X		; 1F 04 1E 1F
	asl $000E.w		; 0E 0E 00
	tsb $80.b		; 04 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $07.b		; 00 07
	bra 119.b		; 80 77
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b]		; 07 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	bra  96.b		; 80 60
	bra -32.b		; 80 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	cpx #$70.b		; E0 70
	bra   0.b		; 80 00
	brk $0D.b		; 00 0D
	trb $3E0F.w		; 1C 0F 3E
	and ($12.b,S),Y		; 33 12
	adc ($30.b),Y		; 71 30
	adc [$3C.b],Y		; 77 3C
	sbc $06.b		; E5 06
	cpx $06.b		; E4 06
	adc ($05.b)		; 72 05
	ora $0302.w		; 0D 02 03
	tsb $0C2F.w		; 0C 2F 0C
	and $210E.w		; 2D 0E 21
	cop $19.b		; 02 19
	cop $18.b		; 02 18
	ora $1A.b,S		; 03 1A
	ora $56.b		; 05 56
	ora [$5E.b]		; 07 5E
	ora $F009B8.l		; 0F B8 09 F0
	ora ($BD.b,X)		; 01 BD
	ora [$14.b]		; 07 14
	ldy $AC04.w		; AC 04 AC
	ora #$B614.w		; 09 14 B6
	php		; 08
	clv		; B8
	asl $5E.b		; 06 5E
	asl $16.b		; 06 16
	asl $0850.w		; 0E 50 08
	eor ($E8.b,S),Y		; 53 E8
	eor $F8.b,S		; 43 F8
	xba		; EB
	pea $0000.w		; F4 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	and [$C0.b]		; 27 C0
	ora [$08.b]		; 07 08
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	dex		; CA
	php		; 08
	ora ($08.b)		; 12 08
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	beq   3.b		; F0 03
	beq   8.b		; F0 08
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	and #$2408.w		; 29 08 24
	php		; 08
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
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
	ora ($07.b,X)		; 01 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	tsa		; 3B
	ldx $92.b,Y		; B6 92
	cpy #$44.b		; C0 44
	sbc $2E.b,X		; F5 2E
	inc $6E1F.w		; EE 1F 6E
	ora $3F8A71.l,X		; 1F 71 8A 3F
	cpx $84.b		; E4 84
	sty $DB.b		; 84 DB
	rti		; 40

	tda		; 7B
	bit $20.b		; 24 20
	asl $1F20.w		; 0E 20 1F
	brk $1F.b		; 00 1F
	and $0E.b,X		; 35 0E
	and ($04.b),Y		; 31 04
	eor $20BC90.l,X		; 5F 90 BC 20
	sei		; 78
	rti		; 40

	cpx #$80.b		; E0 80
	cpx #$00.b		; E0 00
	cld		; D8
	bpl -64.b		; 10 C0
	jsr $F080.w		; 20 80 F0
	bmi  32.b		; 30 20
	rts		; 60

	rti		; 40

	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	clc		; 18
	clc		; 18
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
	adc ($05.b)		; 72 05
	adc ($04.b,S),Y		; 73 04
	adc [$04.b],Y		; 77 04
	and [$14.b]		; 27 14
	and $10.b,S		; 23 10
	and $10.b,S		; 23 10
	adc ($00.b,S),Y		; 73 00
	adc ($00.b,S),Y		; 73 00
	clc		; 18
	ora $19.b		; 05 19
	tsb $19.b		; 04 19
	tsb $19.b		; 04 19
	tsb $1D.b		; 04 1D
	tsb $1D.b		; 04 1D
	tsb $0D.b		; 04 0D
	tsb $05.b		; 04 05
	tsb $69.b		; 04 69
	sty $F9.b,X		; 94 F9
	tsb $FD.b		; 04 FD
	tsb $FC.b		; 04 FC
	ora $F8.b		; 05 F8
	ora ($F8.b,X)		; 01 F8
	ora ($F9.b,X)		; 01 F9
	brk $F9.b		; 00 F9
	brk $83.b		; 00 83
	trb $13.b		; 14 13
	tsb $53.b		; 04 53
	tsb $53.b		; 04 53
	tsb $17.b		; 04 17
	tsb $17.b		; 04 17
	tsb $16.b		; 04 16
	tsb $14.b		; 04 14
	tsb $C0.b		; 04 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
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
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra -64.b		; 80 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  24.b		; 80 18
	brk $F2.b		; 00 F2
	bpl -49.b		; 10 CF
	sbc $CFFFF2.l,X		; FF F2 FF CF
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $CF.b		; 00 CF
	sbc $000002.l,X		; FF 02 00 00
	brk $F6.b		; 00 F6
	sbc $04FFDF.l,X		; FF DF FF 04
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $DF.b		; 00 DF
	sbc $000006.l,X		; FF 06 00 00
	brk $F7.b		; 00 F7
	sbc $08FFEF.l,X		; FF EF FF 08
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $08FFEF.l,X		; FF EF FF 08
	rti		; 40

	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	asl A		; 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	ora [$17.b]		; 07 17
	ora $170F1F.l		; 0F 1F 0F 17
	tas		; 1B
	brk $1F.b		; 00 1F
	tsb $0013.w		; 0C 13 00
	ora $041C00.l		; 0F 00 1C 04
	php		; 08
	php		; 08
	bpl  16.b		; 10 10
	brk $0A.b		; 00 0A
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	cop $0F.b		; 02 0F
	ora $C00704.l		; 0F 04 07 C0
	bra -32.b		; 80 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpx #$00.b		; E0 00
	cpx #$C0.b		; E0 C0
	jsr $8000.w		; 20 00 80
	brk $E0.b		; 00 E0
	rti		; 40

	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2C.b		; 00 2C
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	trb $101F.w		; 1C 1F 10
	ora $04.b,S		; 03 04
	ora ($1F.b,X)		; 01 1F
	asl $1E.b		; 06 1E
	ora $19393F.l		; 0F 3F 39 19
	bvs  56.b		; 70 38
	tda		; 7B
	rol $181F.w,X		; 3E 1F 18
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	asl $01.b		; 06 01
	ora ($0E.b,X)		; 01 0E
	and [$0E.b]		; 27 0E
	rol $07.b		; 26 07
	jsr $0301.w		; 20 01 03
	sty $87.b		; 84 87
	pha		; 48
	inc $AD33.w,X		; FE 33 AD
	ora ($AF.b,X)		; 01 AF
	ora $D6.b,S		; 03 D6
	cop $FC.b		; 02 FC
	brk $CF.b		; 00 CF
	ora ($7B.b,X)		; 01 7B
	jsr ($78B6.w,X)		; FC B6 78
	stx $30.b		; 86 30
	cmp $02.b,X		; D5 02
	pei ($03.b)		; D4 03
	lda $8503.w		; AD 03 85
	ora $B4.b,S		; 03 B4
	cop $E0.b		; 02 E0
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$80.b		; E0 80
	cpx #$C0.b		; E0 C0
	beq 112.b		; F0 70
	rts		; 60

	sec		; 38
	bvs 120.b		; 70 78
	beq -32.b		; F0 E0
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	bra -48.b		; 80 D0
	bra -112.b		; 80 90
	bra  16.b		; 80 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	trb $23.b		; 14 23
	bpl  35.b		; 10 23
	bpl 115.b		; 10 73
	brk $F3.b		; 00 F3
	brk $03.b		; 00 03
	beq   3.b		; F0 03
	tsb $01.b		; 04 01
	brk $19.b		; 00 19
	tsb $1D.b		; 04 1D
	tsb $1D.b		; 04 1D
	tsb $0D.b		; 04 0D
	tsb $05.b		; 04 05
	tsb $E5.b		; 04 E5
	tsb $09.b		; 04 09
	tsb $01.b		; 04 01
	brk $FE.b		; 00 FE
	cop $FC.b		; 02 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	cop $F8.b		; 02 F8
	brk $09.b		; 00 09
	cop $0B.b		; 02 0B
	cop $0B.b		; 02 0B
	cop $0B.b		; 02 0B
	cop $0A.b		; 02 0A
	cop $0A.b		; 02 0A
	cop $09.b		; 02 09
	cop $08.b		; 02 08
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
	brk $31.b		; 00 31
	brk $FC.b		; 00 FC
	cop $3F.b		; 02 3F
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	pha		; 48
	ora ($03.b,X)		; 01 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	cpx #$1B.b		; E0 1B
	cpx $18.b		; E4 18
	ldy #$9C.b		; A0 9C
	stp		; DB
	pha		; 48
	cpx #$23.b		; E0 23
	tda		; 7B
	ora [$77.b],Y		; 17 77
	ora $038FB7.l		; 0F B7 8F 03
	ora [$00.b]		; 07 00
	ora $C3.b,S		; 03 C3
	eor $6C.b,S		; 43 6C
	jsr $133C.w		; 20 3C 13
	bpl   7.b		; 10 07
	bpl  15.b		; 10 0F
	bra -113.b		; 80 8F
	asl $9D60.w,X		; 1E 60 9D
	rts		; 60

	ora [$E4.b],Y		; 17 E4
	lda $101F88.l		; AF 88 1F 10
	sei		; 78
	ldy #$B8.b		; A0 B8
	cpy #$B6.b		; C0 B6
	cpy $00.b		; C4 00
	bra   2.b		; 80 02
	cop $0C.b		; 02 0C
	php		; 08
	cld		; D8
	bpl -16.b		; 10 F0
	jsr $8020.w		; 20 20 80
	jsr $06C0.w		; 20 C0 06
	dec $FC.b		; C6 FC
	cpy #$FC.b		; C0 FC
	brk $F0.b		; 00 F0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CE.b		; 00 CE
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	rol $1BF2.w		; 2E F2 1B
	sbc ($13.b)		; F2 13
	adc $7902.w,Y		; 79 02 79
	cop $39.b		; 02 39
	cop $3B.b		; 02 3B
	cop $13.b		; 02 13
	asl A		; 0A
	bmi   5.b		; 30 05
	trb $09.b		; 14 09
	trb $0D01.w		; 1C 01 0D
	cop $0C.b		; 02 0C
	cop $0C.b		; 02 0C
	cop $0C.b		; 02 0C
	cop $0C.b		; 02 0C
	cop $FF.b		; 02 FF
	ora ($85.b,X)		; 01 85
	phk		; 4B
	ora ($4B.b,X)		; 01 4B
	cop $85.b		; 02 85
	and ($CD.b)		; 32 CD
	inc $FF01.w,X		; FE 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($84.b,X)		; 01 84
	cop $B4.b		; 02 B4
	ply		; 7A
	bmi  -2.b		; 30 FE
	ply		; 7A
	sbc $8548.w,X		; FD 48 85
	sty $01.b		; 84 01
	ldy $01.b,X		; B4 01
	ldy $01.b,X		; B4 01
	bit $3CD0.w,X		; 3C D0 3C
	rts		; 60

	bit $7820.w,X		; 3C 20 78
	brk $78.b		; 00 78
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $20.b		; 00 20
	rti		; 40

	bmi -128.b		; 30 80
	ldy #$40.b		; A0 40
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $90.b		; 00 90
	rts		; 60

	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $F8.b		; 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $70.b		; 00 70
	brk $88.b		; 00 88
	bvc  80.b		; 50 50
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	jsr $0020.w		; 20 20 00
	jsr $2000.w		; 20 00 20
	brk $00.b		; 00 00
	bvc 112.b		; 50 70
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $50.b		; 00 50
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	sbc $F504.w,X		; FD 04 F5
	sbc $F5FFFD.l,X		; FF FD FF F5
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $000001.l,X		; FF 01 00 00
	brk $08.b		; 00 08
	bpl -61.b		; 10 C3
	bit $42.b		; 24 42
	brk $00.b		; 00 00
	.db $42, $24		; 42 24
	clc		; 18
	bit $3C00.w,X		; 3C 00 3C
	clc		; 18
	bit $0000.w,X		; 3C 00 00
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $7E.b		; 00 7E
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $24.b		; 00 24
	clc		; 18
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	jsr ($F005.w,X)		; FC 05 F0
	sbc $F0FFFC.l,X		; FF FC FF F0
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $00FFF0.l,X		; FF F0 FF 00
	rti		; 40

	brk $00.b		; 00 00
	inc $F8FF.w,X		; FE FF F8
	sbc $000001.l,X		; FF 01 00 00
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	ora ($C0.b)		; 12 C0
	bra  51.b		; 80 33
	brk $61.b		; 00 61
	ora ($12.b)		; 12 12
	brk $0C.b		; 00 0C
	brk $21.b		; 00 21
	tsb $0000.w		; 0C 00 00
	ora ($00.b)		; 12 00
	lda $005E00.l,X		; BF 00 5E 00
	asl $1E00.w,X		; 1E 00 1E
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $30.b		; 00 30
	pha		; 48
	cpy $7830.w		; CC 30 78
	brk $30.b		; 00 30
	pha		; 48
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	cpy $3000.w		; CC 00 30
	brk $00.b		; 00 00
	bmi  72.b		; 30 48
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $FA.b		; 00 FA
	ora [$E9.b]		; 07 E9
	sbc $E9FFFA.l,X		; FF FA FF E9
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $02FFF9.l,X		; FF F9 FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	tsb $01.b		; 04 01
	asl $07.b		; 06 07
	ora [$E0.b]		; 07 E0
	brk $48.b		; 00 48
	tsb $34.b		; 04 34
	tsb $30.b		; 04 30
	brk $0F.b		; 00 0F
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $5F.b		; 00 5F
	bra  55.b		; 80 37
	brk $2F.b		; 00 2F
	brk $0B.b		; 00 0B
	tsb $0B.b		; 04 0B
	tsb $00.b		; 04 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	bra  28.b		; 80 1C
	brk $58.b		; 00 58
	bra -80.b		; 80 B0
	bra -80.b		; 80 B0
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $E8.b		; 00 E8
	brk $A0.b		; 00 A0
	brk $D0.b		; 00 D0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra 120.b		; 80 78
	sty $FC.b		; 84 FC
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $84.b		; 00 84
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
	ora $10.b,S		; 03 10
	ora ($0A.b),Y		; 11 0A
	tas		; 1B
	tsb $08.b		; 04 08
	cop $0C.b		; 02 0C
	brk $04.b		; 00 04
	ora $090C.w,X		; 1D 0C 09
	tsb $09.b		; 04 09
	tas		; 1B
	tsb $0C.b		; 04 0C
	ora $04.b,S		; 03 04
	brk $17.b		; 00 17
	brk $10.b		; 00 10
	ora $1E.b,S		; 03 1E
	ora [$02.b]		; 07 02
	phd		; 0B
	asl A		; 0A
	ora $00.b,S		; 03 00
	jsr $4020.w		; 20 20 40
	rts		; 60

	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	ldy #$C0.b		; A0 C0
	rti		; 40

	bra  64.b		; 80 40
	rts		; 60

	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	brk $20.b		; 00 20
	brk $E0.b		; 00 E0
	bra   0.b		; 80 00
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F8.b		; 00 F8
	php		; 08
	sbc $FF.b,S		; E3 FF
	sed		; F8
	sbc $00FFE3.l,X		; FF E3 FF 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $E3.b		; 00 E3
	sbc $000002.l,X		; FF 02 00 00
	brk $FB.b		; 00 FB
	sbc $04FFF3.l,X		; FF F3 FF 04
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	brk $C1.b		; 00 C1
	bit #$0470.w		; 89 70 04
	.db $62, $00, $1A		; 62 00 1A
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $AE.b		; 00 AE
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $37.b		; 00 37
	brk $2D.b		; 00 2D
	cop $E0.b		; 02 E0
	brk $C0.b		; 00 C0
	jsr $00E0.w		; 20 E0 00
	cmp ($C8.b,X)		; C1 C8
	ora [$10.b]		; 07 10
	and $00.b,S		; 23 00
	bit $0400.w		; 2C 00 04
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	dec A		; 3A
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $F6.b		; 00 F6
	brk $DA.b		; 00 DA
	jsr $0000.w		; 20 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00753F.l		; EF 3F 75 00
	bit $11.b		; 24 11
	ora ($20.b),Y		; 11 20
	ora ($2E.b),Y		; 11 2E
	ora $000E00.l,X		; 1F 00 0E 00
	asl $2100.w		; 0E 00 21
	and $2E0E0E.l,X		; 3F 0E 0E 2E
	ora $311F2E.l,X		; 1F 2E 1F 31
	asl $0020.w		; 0E 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $07.b		; 00 07
	brk $09.b		; 00 09
	brk $14.b		; 00 14
	brk $19.b		; 00 19
	brk $0D.b		; 00 0D
	ora ($04.b,X)		; 01 04
	brk $16.b		; 00 16
	ora #$0205.w		; 09 05 02
	ora $02.b		; 05 02
	ora $02.b		; 05 02
	asl $0C01.w		; 0E 01 0C
	cop $13.b		; 02 13
	brk $1A.b		; 00 1A
	ora ($08.b,X)		; 01 08
	ora ($20.b,X)		; 01 20
	brk $F0.b		; 00 F0
	brk $C8.b		; 00 C8
	jsr $1004.w		; 20 04 10
	cpy $5800.w		; CC 00 58
	rti		; 40

	bcc   0.b		; 90 00
	ldy $C8.b,X		; B4 C8
	bne  32.b		; D0 20
	bne  32.b		; D0 20
	beq   0.b		; F0 00
	sec		; 38
	cpy #$18.b		; C0 18
	jsr $8064.w		; 20 64 80
	bit $08C0.w		; 2C C0 08
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  16.b		; 80 10
	brk $F7.b		; 00 F7
	ora #$FFDE.w		; 09 DE FF
	sbc [$FF.b],Y		; F7 FF
	dec $00FF.w,X		; DE FF 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $DE.b		; 00 DE
	sbc $000002.l,X		; FF 02 00 00
	brk $FA.b		; 00 FA
	sbc $04FFEE.l,X		; FF EE FF 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $000006.l,X		; FF 06 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	brk $C1.b		; 00 C1
	ora ($F0.b,X)		; 01 F0
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	ora ($20.b,X)		; 01 20
	ora ($04.b,X)		; 01 04
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cpy #$00E7.w		; C0 E7 00
	ora $001F00.l		; 0F 00 1F 00
	and $086800.l,X		; 3F 00 68 08
	beq   0.b		; F0 00
	sed		; F8
	brk $F8.b		; 00 F8
	sed		; F8
	rts		; 60

	stz $00.b		; 64 00
	php		; 08
	cop $08.b		; 02 08
	cop $08.b		; 02 08
	tya		; 98
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $9E.b		; 00 9E
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	brk $20.b		; 00 20
	bpl  88.b		; 10 58
	ora $5F.b,S		; 03 5F
	and $78.b,S		; 23 78
	trb $043B.w		; 1C 3B 04
	pld		; 2B
	trb $38.b		; 14 38
	tsb $7B.b		; 04 7B
	ora [$CC.b],Y		; 17 CC
	ora ($20.b,S),Y		; 13 20
	ora [$20.b]		; 07 20
	ora [$3B.b]		; 07 3B
	ora $130703.l,X		; 1F 03 07 13
	ora [$03.b]		; 07 03
	ora [$00.b],Y		; 17 00
	ora [$10.b],Y		; 17 10
	brk $78.b		; 00 78
	bra 120.b		; 80 78
	bra 120.b		; 80 78
	cpx #$8070.w		; E0 70 80
	bvc -96.b		; 50 A0
	bvs -128.b		; 70 80
	sei		; 78
	ldy #$20CC.w		; A0 CC 20
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bvs -32.b		; 70 E0
	brk $80.b		; 00 80
	jsr $0080.w		; 20 80 00
	ldy #$A000.w		; A0 00 A0
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1A.b		; 00 1A
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $05.b		; 00 05
	ora #$0306.w		; 09 06 03
	and $00.b,X		; 35 00
	tas		; 1B
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $1E.b		; 00 1E
	ora ($19.b,X)		; 01 19
	cop $09.b		; 02 09
	brk $04.b		; 00 04
	brk $94.b		; 00 94
	brk $6C.b		; 00 6C
	brk $60.b		; 00 60
	php		; 08
	dey		; 88
	bvs  96.b		; 70 60
	sta ($F2.b),Y		; 91 F2
	php		; 08
	ror $90.b		; 66 90
	rtl		; 6B

	bcc 108.b		; 90 6C
	bcc 108.b		; 90 6C
	bcc 110.b		; 90 6E
	bcc  -1.b		; 90 FF
	brk $17.b		; 00 17
	dey		; 88
	ora #$8004.w		; 09 04 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $1C.b		; 00 1C
	and $07.b,S		; 23 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $30.b		; 00 30
	phd		; 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$8010.w		; E0 10 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $30.b		; 00 30
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	sbc $0A.b,X		; F5 0A
	cld		; D8
	sbc $D8FFF5.l,X		; FF F5 FF D8
	sbc $000000.l,X		; FF 00 00 00
	brk $05.b		; 00 05
	brk $D8.b		; 00 D8
	sbc $000002.l,X		; FF 02 00 00
	brk $F8.b		; 00 F8
	sbc $04FFE8.l,X		; FF E8 FF 04
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $E8.b		; 00 E8
	sbc $000006.l,X		; FF 06 00 00
	brk $FE.b		; 00 FE
	sbc $08FFF8.l,X		; FF F8 FF 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	cmp ($38.b,X)		; C1 38
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cpy #$00C3.w		; C0 C3 00
	ora [$00.b]		; 07 00
	ora $00FE00.l		; 0F 00 FE 00
	tsx		; BA
	.db $82, $0C, $70		; 82 0C 70
	inc $7C00.w,X		; FE 00 7C
	jmp ($3938.w,X)		; 7C 38 39
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	dec $00.b		; C6 00
	.db $82, $00, $00		; 82 00 00
	brk $83.b		; 00 83
	brk $C7.b		; 00 C7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $38.b		; 00 38
	brk $98.b		; 00 98
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
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
	brk $01.b		; 00 01
	ora ($14.b),Y		; 11 14
	and [$1B.b]		; 27 1B
	tsb $0911.w		; 0C 11 09
	jmp ($6E01.w)		; 6C 01 6E
	ora ($7D.b),Y		; 11 7D
	ora $7E0E3C.l		; 0F 3C 0E 7E
	ora ($F9.b,X)		; 01 F9
	asl $E4.b		; 06 E4
	php		; 08
	sbc [$08.b]		; E7 08
	bpl   3.b		; 10 03
	bpl   3.b		; 10 03
	trb $1D0B.w		; 1C 0B 1D
	ora $C28640.l		; 0F 40 86 C2
	and ($E6.b,X)		; 21 E6
	bpl  70.b		; 10 46
	rti		; 40

	and $9DE0.w,X		; 3D E0 9D
.INDEX 8
	sep #$DF		; E2 DF
	sed		; F8
	asl $3F38.w,X		; 1E 38 3F
	cpy #$2F.b		; C0 2F
	bpl  17.b		; 10 11
	php		; 08
	adc ($88.b),Y		; 71 88
	jsl $E002C0.l		; 22 C0 02 E0
	trb $DCF0.w		; 1C F0 DC
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
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0E.b		; 00 0E
	brk $0C.b		; 00 0C
	brk $0A.b		; 00 0A
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $1D.b		; 00 1D
	brk $1B.b		; 00 1B
	brk $15.b		; 00 15
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	.db $82, $C6, $82		; 82 C6 82
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	mvp $BF,$00		; 44 00 BF
	tsb $3C.b		; 04 3C
	stx $C6.b		; 86 C6
	sec		; 38
	sbc $00FF00.l,X		; FF 00 FF 00
	lda $40BF40.l,X		; BF 40 BF 40
	tyx		; BB
	mvp $40,$BF		; 44 BF 40
	lda $00FF40.l,X		; BF 40 FF 00
	cpy #$00.b		; C0 00
	bvs   0.b		; 70 00
	beq   0.b		; F0 00
	bvc   0.b		; 50 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $B8.b		; 00 B8
	brk $18.b		; 00 18
	brk $A8.b		; 00 A8
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
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
	brk $3D.b		; 00 3D
	cop $35.b		; 02 35
	inc A		; 1A
	tsb $3D12.w		; 0C 12 3D
	phd		; 0B
	asl $1711.w		; 0E 11 17
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	ora ($09.b,S),Y		; 13 09
	ora ($11.b,S),Y		; 13 11
	phd		; 0B
	brk $0B.b		; 00 0B
	clc		; 18
	ora $18.b		; 05 18
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $9E.b		; 00 9E
	jsr $2C96.w		; 20 96 2C
	clc		; 18
	bit $DE.b		; 24 DE
	inx		; E8
	sec		; 38
	cpy $F4.b		; C4 F4
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	cpx $C8.b		; E4 C8
	cpx $C4.b		; E4 C4
	inx		; E8
	brk $E8.b		; 00 E8
	tsb $0CD0.w		; 0C D0 0C
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  20.b		; 80 14
	brk $F3.b		; 00 F3
	tsb $FFD2.w		; 0C D2 FF
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b)		; D2 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cmp ($FF.b)		; D2 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	sed		; F8
	sbc $04FFE2.l,X		; FF E2 FF 04
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $E2.b		; 00 E2
	sbc $000006.l,X		; FF 06 00 00
	brk $FA.b		; 00 FA
	sbc $08FFF2.l,X		; FF F2 FF 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $F4.b		; 00 F4
	cpx #$2C.b		; E0 2C
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	sbc $3300.w,Y		; F9 00 33
	brk $1F.b		; 00 1F
	bpl  63.b		; 10 3F
	brk $3E.b		; 00 3E
	jsr $3C01.w		; 20 01 3C
	ora $3F3F20.l,X		; 1F 20 3F 3F
	ora $00004F.l		; 0F 4F 00 00
	bpl   0.b		; 10 00
	brk $20.b		; 00 20
	and ($00.b,X)		; 21 00
	ora $00.b,S		; 03 00
	jsr $C000.w		; 20 00 C0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	rti		; 40

	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	cpy #$C0.b		; C0 C0
	brk $20.b		; 00 20
	ora $00.b,S		; 03 00
	bra   0.b		; 80 00
	brk $40.b		; 00 40
	rti		; 40

	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $30.b		; 00 30
	brk $FB.b		; 00 FB
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $0D.b		; 00 0D
	brk $01.b		; 00 01
	tsb $06.b		; 04 06
	ora ($01.b,X)		; 01 01
	and ($24.b),Y		; 31 24
	eor [$3B.b]		; 47 3B
	tsb $0931.w		; 0C 31 09
	trb $1D00.w		; 1C 00 1D
	cop $3D.b		; 02 3D
	cop $7F.b		; 02 7F
	brk $7E.b		; 00 7E
	ora ($F9.b,X)		; 01 F9
	asl $C4.b		; 06 C4
	php		; 08
	cmp [$08.b]		; C7 08
	ror $01.b		; 66 01
	cpx $E000.w		; EC 00 E0
	php		; 08
	clc		; 18
	cpx #$60.b		; E0 60
	sta $C1.b,S		; 83 C1
	jsr $08F3.w		; 20 F3 08
	and $20.b,S		; 23 20
	dec $EE00.w		; CE 00 EE
	bpl -17.b		; 10 EF
	bpl  -1.b		; 10 FF
	brk $1F.b		; 00 1F
	cpx #$27.b		; E0 27
	clc		; 18
	php		; 08
	tsb $38.b		; 04 38
	cpy $19.b		; C4 19
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	brk $F7.b		; 00 F7
	and $5F4738.l		; 2F 38 47 5F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	and $601760.l		; 2F 60 17 60
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	bne 112.b		; D0 70
	dey		; 88
	inx		; E8
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	bne  24.b		; D0 18
	ldy #$18.b		; A0 18
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $1800.w		; 1C 00 18
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	brk $0E.b		; 00 0E
	brk $0D.b		; 00 0D
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2080.w		; 20 80 20
	bra  32.b		; 80 20
	bmi  32.b		; 30 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	sta $00FF00.l,X		; 9F 00 FF 00
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $10EF00.l,X		; FF 00 EF 10
	sbc $10EF10.l		; EF 10 EF 10
	sbc $400310.l		; EF 10 03 40
	ora ($40.b),Y		; 11 40
	clc		; 18
	rti		; 40

	dec $0640.w		; CE 40 06
	brk $0A.b		; 00 0A
	brk $80.b		; 00 80
	brk $90.b		; 00 90
	brk $FC.b		; 00 FC
	brk $EE.b		; 00 EE
	brk $EF.b		; 00 EF
	brk $F7.b		; 00 F7
	brk $7B.b		; 00 7B
	bra 117.b		; 80 75
	bra 112.b		; 80 70
	bra 112.b		; 80 70
	bra -128.b		; 80 80
	brk $80.b		; 00 80
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
	brk $5C.b		; 00 5C
	ora ($5E.b,X)		; 01 5E
	and ($7D.b,X)		; 21 7D
	ora $3C0E3C.l		; 0F 3C 0E 3C
	cop $34.b		; 02 34
	inc A		; 1A
	clc		; 18
	cop $0C.b		; 02 0C
	ora ($20.b)		; 12 20
	ora $20.b,S		; 03 20
	ora $1C.b,S		; 03 1C
	phd		; 0B
	ora $010F.w,X		; 1D 0F 01
	ora ($09.b,S),Y		; 13 09
	ora ($15.b,S),Y		; 13 15
	phd		; 0B
	ora ($0B.b),Y		; 11 0B
	asl $DEE0.w		; 0E E0 DE
	sbc ($EF.b,X)		; E1 EF
	jsr ($1C0F.w,X)		; FC 0F 1C
	cmp $16CB10.l		; CF 10 CB 16
	dec $10.b		; C6 10
	tsb $0112.w		; 0C 12 01
	beq   1.b		; F0 01
	beq  14.b		; F0 0E
	sed		; F8
	inc $E0FC.w		; EE FC E0
	sbc ($E4.b)		; F2 E4
	sbc ($EA.b)		; F2 EA
	pea $F4E2.w		; F4 E2 F4
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000F00.l		; 0F 00 0F 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
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
	cpy #$00.b		; C0 00
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
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	inc $F702.w,X		; FE 02 F7
	sbc $F7FFFE.l,X		; FF FE FF F7
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000001.l,X		; FF 01 00 00
	brk $20.b		; 00 20
	jsr $50F8.w		; 20 F8 50
	bvs  32.b		; 70 20
	rti		; 40

	rti		; 40

	sed		; F8
	brk $20.b		; 00 20
	jsr $0020.w		; 20 20 00
	jsr $2000.w		; 20 00 20
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	jsr $1060.w		; 20 60 10
	jsr $7000.w		; 20 00 70
	brk $50.b		; 00 50
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
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	bra   4.b		; 80 04
	brk $FD.b		; 00 FD
	tsb $F4.b		; 04 F4
	sbc $F4FFFD.l,X		; FF FD FF F4
	sbc $000000.l,X		; FF 00 00 00
	brk $10.b		; 00 10
	bpl   0.b		; 10 00
	ora ($FE.b),Y		; 11 FE
	jmp ($1038.w)		; 6C 38 10
	bpl   0.b		; 10 00
	bpl 108.b		; 10 6C
	bpl 124.b		; 10 7C
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	bpl  17.b		; 10 11
	jmp ($0000.w)		; 6C 00 00
	bpl  56.b		; 10 38
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	plp		; 28
	bpl  40.b		; 10 28
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FE.b		; 00 FE
	cop $F8.b		; 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $70.b		; 00 70
	brk $88.b		; 00 88
	bvc  80.b		; 50 50
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	jsr $0020.w		; 20 20 00
	jsr $2000.w		; 20 00 20
	brk $00.b		; 00 00
	bvc 112.b		; 50 70
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $50.b		; 00 50
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	ora ($80.b,X)		; 01 80
	tsb $00.b		; 04 00
	sbc $F504.w,X		; FD 04 F5
	sbc $F5FFFD.l,X		; FF FD FF F5
	sbc $000000.l,X		; FF 00 00 00
	brk $08.b		; 00 08
	bpl -61.b		; 10 C3
	bit $42.b		; 24 42
	brk $00.b		; 00 00
	.db $42, $24		; 42 24
	clc		; 18
	bit $3C00.w,X		; 3C 00 3C
	clc		; 18
	bit $0000.w,X		; 3C 00 00
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $7E.b		; 00 7E
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $24.b		; 00 24
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $18.b		; 00 18
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
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
	tsb $80.b		; 04 80
	tsb $F100.w		; 0C 00 F1
	bpl -30.b		; 10 E2
	sbc $E2FFF1.l,X		; FF F1 FF E2
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	brk $E2.b		; 00 E2
	sbc $000002.l,X		; FF 02 00 00
	brk $F3.b		; 00 F3
	sbc $04FFF2.l,X		; FF F2 FF 04
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $04FFF2.l,X		; FF F2 FF 04
	rti		; 40

	brk $00.b		; 00 00
	brk $10.b		; 00 10
	ora $10.b,S		; 03 10
	brk $1F.b		; 00 1F
	eor $502F10.l		; 4F 10 2F 50
	and $102F50.l		; 2F 50 2F 10
	rti		; 40

	bpl   0.b		; 10 00
	bpl   3.b		; 10 03
	bpl  15.b		; 10 0F
	bpl  16.b		; 10 10
	cmp [$10.b]		; C7 10
	sbc [$10.b]		; E7 10
	sbc [$10.b]		; E7 10
	and [$1F.b]		; 27 1F
	rti		; 40

	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $01FD03.l,X		; FF 03 FD 01
	sbc $07F803.l,X		; FF 03 F8 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $7F.b		; 00 7F
	ora ($7F.b,X)		; 01 7F
	ora $7F.b,S		; 03 7F
	brk $7F.b		; 00 7F
	sbc $080000.l,X		; FF 00 00 08
	cpy #$08.b		; C0 08
	brk $F8.b		; 00 F8
	sbc ($08.b)		; F2 08
	pea $F40A.w		; F4 0A F4
	asl A		; 0A
	stz $88.b,X		; 74 88
	cop $08.b		; 02 08
	brk $08.b		; 00 08
	cpy #$08.b		; C0 08
	beq   8.b		; F0 08
	php		; 08
	sbc $08.b,S		; E3 08
	sbc [$08.b]		; E7 08
	sbc [$08.b]		; E7 08
	cpx $F8.b		; E4 F8
	cop $01.b		; 02 01
	rti		; 40

	ora ($40.b,X)		; 01 40
	ora $54.b,X		; 15 54
	ora ($40.b,X)		; 01 40
	brk $7F.b		; 00 7F
	ora ($7E.b,X)		; 01 7E
	brk $00.b		; 00 00
	sei		; 78
	bra   0.b		; 80 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $7F7F00.l,X		; 7F 00 7F 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7C.b		; 00 7C
	sta $00.b,S		; 83 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  64.b		; 80 40
	trb $1F0F.w		; 1C 0F 1F
	brk $10.b		; 00 10
	brk $1F.b		; 00 1F
	brk $10.b		; 00 10
	brk $1F.b		; 00 1F
	brk $10.b		; 00 10
	brk $1F.b		; 00 1F
	trb $0043.w		; 1C 43 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $FF0700.l,X		; 1F 00 07 FF
	sbc $400040.l,X		; FF 40 00 40
	lda $400040.l,X		; BF 40 00 40
	lda $5C0040.l,X		; BF 40 00 5C
	stz $F807.w		; 9C 07 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	sbc $0002FF.l,X		; FF FF 02 00
	cop $FD.b		; 02 FD
	cop $00.b		; 02 00
	cop $FD.b		; 02 FD
	cop $00.b		; 02 00
	dec A		; 3A
	and $1FE0.w,Y		; 39 E0 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $38.b		; 02 38
	beq  -8.b		; F0 F8
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	sec		; 38
	rep #$00		; C2 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	jmp ($0083.w,X)		; 7C 83 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $007F00.l,X		; 7F 00 7F 00
	and $000000.l,X		; 3F 00 00 00
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bra  28.b		; 80 1C
	brk $ED.b		; 00 ED
	trb $D9.b		; 14 D9
	sbc $D9FFED.l,X		; FF ED FF D9
	sbc $000000.l,X		; FF 00 00 00
	brk $FD.b		; 00 FD
	sbc $02FFD9.l,X		; FF D9 FF 02
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $D9.b		; 00 D9
	sbc $000004.l,X		; FF 04 00 00
	brk $EF.b		; 00 EF
	sbc $06FFE9.l,X		; FF E9 FF 06
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $08FFE9.l,X		; FF E9 FF 08
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $E9.b		; 00 E9
	sbc $004006.l,X		; FF 06 40 00
	brk $EF.b		; 00 EF
	sbc $0AFFF9.l,X		; FF F9 FF 0A
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0CFFF9.l,X		; FF F9 FF 0C
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F9.b		; 00 F9
	sbc $00400A.l,X		; FF 0A 40 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl   3.b		; 10 03
	bpl   0.b		; 10 00
	ora $A71887.l,X		; 1F 87 18 A7
	cli		; 58
	lda [$58.b]		; A7 58
	lda [$58.b]		; A7 58
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	ora $10.b,S		; 03 10
	ora $970810.l		; 0F 10 08 97
	php		; 08
	sbc [$08.b],Y		; F7 08
	sbc [$10.b],Y		; F7 10
	sbc $000000.l		; EF 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FE.b		; 00 FE
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $7E007E.l,X		; FF 7E 00 7E
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc [$00.b]		; E7 00
	sbc [$00.b]		; E7 00
	sbc [$00.b]		; E7 00
	sbc [$00.b]		; E7 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF08FF.l,X		; FF FF 08 FF
	trb $1C7F.w		; 1C 7F 1C
	lda [$14.b],Y		; B7 14
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	trb $14FF.w		; 1C FF 14
	sbc $000800.l,X		; FF 00 08 00
	php		; 08
	cpy #$08.b		; C0 08
	brk $F8.b		; 00 F8
	sbc ($18.b,X)		; E1 18
	sbc $1A.b		; E5 1A
	sbc $1A.b		; E5 1A
	sbc $1A.b		; E5 1A
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	cpy #$08.b		; C0 08
	beq   8.b		; F0 08
	bpl -23.b		; 10 E9
	bpl -17.b		; 10 EF
	bpl -17.b		; 10 EF
	php		; 08
	sbc [$00.b],Y		; F7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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

	jsr $205F.w		; 20 5F 20
	rti		; 40

	jsr $205F.w		; 20 5F 20
	rti		; 40

	jsr $205F.w		; 20 5F 20
	rti		; 40

	rti		; 40

	brk $40.b		; 00 40
	and $007F00.l,X		; 3F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $403F40.l,X		; 7F 40 3F 40
	brk $40.b		; 00 40
	lda $4D0040.l,X		; BF 40 00 4D
	sta $0D40.w		; 8D 40 0D
	rti		; 40

	bra  64.b		; 80 40
	and $000040.l,X		; 3F 40 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rts		; 60

	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	txy		; 9B
	txy		; 9B
	brk $9B.b		; 00 9B
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr $2000.w		; 20 00 20
	cmp $200020.l,X		; DF 20 00 20
	ora $200020.l,X		; 1F 20 00 20
	ora $20C020.l,X		; 1F 20 C0 20
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $001D00.l,X		; 7F 00 1D 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpx #$00.b		; E0 00
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
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007B00.l,X		; FF 00 7B 00
	brk $A7.b		; 00 A7
	cli		; 58
	eor $10CF10.l		; 4F 10 CF 10
	rti		; 40

	asl $1F0F.w,X		; 1E 0F 1F
	brk $0F.b		; 00 0F
	brk $10.b		; 00 10
	brk $1F.b		; 00 1F
	bpl -17.b		; 10 EF
	bpl  64.b		; 10 40
	asl $1EC1.w,X		; 1E C1 1E
	eor ($1F.b,X)		; 41 1F
	brk $10.b		; 00 10
	ora $100F10.l		; 0F 10 0F 10
	ora $F700FB.l		; 0F FB 00 F7
	brk $EF.b		; 00 EF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $10FF00.l,X		; FF 00 FF 10
	brk $10.b		; 00 10
	sbc $00FF00.l		; EF 00 FF 00
	php		; 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ror $FF00.w,X		; 7E 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $001800.l,X		; FF 00 18 00
	sbc $00E700.l,X		; FF 00 E7 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $EF1CC3.l,X		; FF C3 1C EF
	brk $F7.b		; 00 F7
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $08FF00.l,X		; FF 00 FF 08
	brk $08.b		; 00 08
	sbc [$00.b],Y		; F7 00
	sbc $001000.l,X		; FF 00 10 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F21AE5.l,X		; FF E5 1A F2
	php		; 08
	sbc ($08.b,S),Y		; F3 08
	cop $78.b		; 02 78
	beq  -8.b		; F0 F8
	brk $F0.b		; 00 F0
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	php		; 08
	sbc [$08.b],Y		; F7 08
	cop $78.b		; 02 78
	sta $78.b,S		; 83 78
	.db $82, $F8, $00		; 82 F8 00
	php		; 08
	beq   8.b		; F0 08
	beq   8.b		; F0 08
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
	brk $1B.b		; 00 1B
	tad		; 5B
	brk $40.b		; 00 40
	and $7F007F.l,X		; 3F 7F 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	ror $4081.w,X		; 7E 81 40
	and $403F40.l,X		; 3F 40 3F 40
	and $7F007F.l,X		; 3F 7F 00 7F
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $7E.b		; 00 7E
	bra  64.b		; 80 40
	and $FF0040.l,X		; 3F 40 00 FF
	sbc $3FFF00.l,X		; FF 00 FF 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00F807.l,X		; FF 07 F8 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	sbc $FF6000.l,X		; FF 00 60 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0001FE.l,X		; FF FE 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $2D.b		; 00 2D
	cmp $0020.w		; CD 20 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $000700.l,X		; FF 00 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	bra  32.b		; 80 20
	brk $E8.b		; 00 E8
	ora $FFD0.w,Y		; 19 D0 FF
	inx		; E8
	sbc $00FFD0.l,X		; FF D0 FF 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $02FFD0.l,X		; FF D0 FF 02
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $D0.b		; 00 D0
	sbc $000004.l,X		; FF 04 00 00
	brk $18.b		; 00 18
	brk $D0.b		; 00 D0
	sbc $000006.l,X		; FF 06 00 00
	brk $EB.b		; 00 EB
	sbc $08FFE0.l,X		; FF E0 FF 08
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $0AFFE0.l,X		; FF E0 FF 0A
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $E0.b		; 00 E0
	sbc $004008.l,X		; FF 08 40 00
	brk $EA.b		; 00 EA
	sbc $0CFFF0.l,X		; FF F0 FF 0C
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $0EFFF0.l,X		; FF F0 FF 0E
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	sbc $00400C.l,X		; FF 0C 40 00
	brk $04.b		; 00 04
	php		; 08
	tsb $08.b		; 04 08
	tsb $08.b		; 04 08
	tsb $0B.b		; 04 0B
	brk $0F.b		; 00 0F
	sta $0C.b,S		; 83 0C
	sbc $0C.b,S		; E3 0C
	sta $6C.b,S		; 83 6C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	ora $0C.b,S		; 03 0C
	ora [$08.b]		; 07 08
	tsb $89.b		; 04 89
	tsb $E9.b		; 04 E9
	tsb $E9.b		; 04 E9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc [$00.b],Y		; F7 00
	sbc [$00.b],Y		; F7 00
	sbc [$00.b],Y		; F7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3B0000.l,X		; FF 00 00 3B
	brk $3B.b		; 00 3B
	brk $3B.b		; 00 3B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $3CFF18.l,X		; FF 18 FF 3C
	sbc $00003C.l,X		; FF 3C 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	bit $FF.b		; 24 FF
	php		; 08
	tsb $08.b		; 04 08
	tsb $C8.b		; 04 C8
	tsb $08.b		; 04 08
	pea $FC00.w		; F4 00 FC
	beq  12.b		; F0 0C
	sbc ($0C.b),Y		; F1 0C
	sbc ($0D.b)		; F2 0D
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	cpy #$0C.b		; C0 0C
	beq  12.b		; F0 0C
	sed		; F8
	tsb $08.b		; 04 08
	cpx $08.b		; E4 08
	sbc $08.b		; E5 08
	sbc [$00.b]		; E7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
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
	brk $3F.b		; 00 3F
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	jsr $20C0.w		; 20 C0 20
	cmp $C0C020.l,X		; DF 20 C0 C0
	and $C03FC0.l,X		; 3F C0 3F C0
	and $C03FC0.l,X		; 3F C0 3F C0
	and $807F00.l,X		; 3F 00 7F 80
	adc $007F80.l,X		; 7F 80 7F 00
	sbc $100010.l,X		; FF 10 00 10
	sbc $100010.l		; EF 10 00 10
	sbc $100010.l		; EF 10 00 10
	sbc $000010.l		; EF 10 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000600.l,X		; FF 00 06 00
	sbc $000600.l,X		; FF 00 06 00
	sbc $000600.l,X		; FF 00 06 00
	sbc $000000.l,X		; FF 00 00 00
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
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $7F3F40.l,X		; 7F 40 3F 7F
	brk $7F.b		; 00 7F
	brk $60.b		; 00 60
	ora $7F0000.l,X		; 1F 00 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF07.l,X		; FF 07 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $003FC0.l,X		; 7F C0 3F 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FCFF00.l,X		; FF 00 FF FC
	ora $FC.b,S		; 03 FC
	ora $00.b,S		; 03 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $83.b		; 00 83
	jmp ($6C83.w)		; 6C 83 6C
	sta $6C.b,S		; 83 6C
	and $0C.b,S		; 23 0C
	eor [$08.b],Y		; 57 08
	sbc [$08.b]		; E7 08
	rti		; 40

	ora $041F07.l,X		; 1F 07 1F 04
	sbc #$E508.w		; E9 08 E5
	php		; 08
	sbc $08.b		; E5 08
	and $08.b		; 25 08
	bvs  15.b		; 70 0F
	cpx #$1F.b		; E0 1F
	rti		; 40

	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $0000.w,X		; FD 00 00
	bra  -1.b		; 80 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $800100.l,X		; FF 00 01 80
	adc $FF7F80.l,X		; 7F 80 7F FF
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $00FFFF.l		; 0F FF FF 00
	sbc $00EF00.l,X		; FF 00 EF 00
	cmp $00BF00.l,X		; DF 00 BF 00
	brk $0F.b		; 00 0F
	beq  15.b		; F0 0F
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr ($FFFF.w,X)		; FC FF FF
	brk $3B.b		; 00 3B
	brk $39.b		; 00 39
	brk $3B.b		; 00 3B
	brk $3B.b		; 00 3B
	brk $00.b		; 00 00
	jsr ($FC03.w,X)		; FC 03 FC
	ora $FF.b,S		; 03 FF
	brk $E7.b		; 00 E7
	bit $FF.b		; 24 FF
	bit $18FF.w,X		; 3C FF 18
	sta ($3E.b,X)		; 81 3E
	cmp $00EF00.l,X		; DF 00 EF 00
	brk $00.b		; 00 00
	sbc $FF24FF.l,X		; FF FF 24 FF
	bit $18FF.w,X		; 3C FF 18
	sbc $007F00.l,X		; FF 00 7F 00
	jsr $FF00.w		; 20 00 FF
	brk $FF.b		; 00 FF
	sbc $0DF200.l,X		; FF 00 F2 0D
	plx		; FA
	ora $FA.b		; 05 FA
	ora $FB.b		; 05 FB
	tsb $FA.b		; 04 FA
	tsb $F9.b		; 04 F9
	tsb $00.b		; 04 00
	ror $FEF8.w,X		; 7E F8 FE
	php		; 08
	sbc [$04.b]		; E7 04
	sbc $04.b,S		; E3 04
	sbc $04.b,S		; E3 04
	sbc $04.b,S		; E3 04
	ora $7C.b,S		; 03 7C
	sta ($7E.b,X)		; 81 7E
	bra  -2.b		; 80 FE
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
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
	brk $A0.b		; 00 A0
	cmp $20C020.l,X		; DF 20 C0 20
	cmp $00C020.l,X		; DF 20 C0 00
	cpy #$0D.b		; C0 0D
	cmp $CD0D.w		; CD 0D CD
	brk $C0.b		; 00 C0
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	ora ($E3.b,S),Y		; 13 E3
	bpl  11.b		; 10 0B
	bpl -32.b		; 10 E0
	bpl   0.b		; 10 00
	bpl  15.b		; 10 0F
	bne -64.b		; D0 C0
	bne -49.b		; D0 CF
	bpl   0.b		; 10 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sta $0099.w,Y		; 99 99 00
	lda #$0000.w		; A9 00 00
	brk $00.b		; 00 00
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
	stz $009C.w		; 9C 9C 00
	eor $0000.w,X		; 5D 00 00
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
	brk $00.b		; 00 00
	jsr $2040.w		; 20 40 20
	rti		; 40

	jsr $2040.w		; 20 40 20
	rti		; 40

	jsr $2000.w		; 20 00 20
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	and $003F00.l,X		; 3F 00 3F 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $010000.l,X		; FF 00 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	bpl -128.b		; 10 80
	plp		; 28
	brk $E3.b		; 00 E3
	asl $FFC8.w,X		; 1E C8 FF
	sbc $FF.b,S		; E3 FF
	iny		; C8
	sbc $000000.l,X		; FF 00 00 00
	brk $F3.b		; 00 F3
	sbc $02FFC8.l,X		; FF C8 FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $C8.b		; 00 C8
	sbc $000004.l,X		; FF 04 00 00
	brk $13.b		; 00 13
	brk $C8.b		; 00 C8
	sbc $000006.l,X		; FF 06 00 00
	brk $E5.b		; 00 E5
	sbc $08FFD8.l,X		; FF D8 FF 08
	brk $00.b		; 00 00
	brk $F5.b		; 00 F5
	sbc $0AFFD8.l,X		; FF D8 FF 0A
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $D8.b		; 00 D8
	sbc $004008.l,X		; FF 08 40 00
	brk $FD.b		; 00 FD
	sbc $0AFFD8.l,X		; FF D8 FF 0A
	rti		; 40

	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	inx		; E8
	sbc $00000C.l,X		; FF 0C 00 00
	brk $F7.b		; 00 F7
	sbc $0EFFE8.l,X		; FF E8 FF 0E
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $E8.b		; 00 E8
	sbc $00400C.l,X		; FF 0C 40 00
	brk $FB.b		; 00 FB
	sbc $0EFFE8.l,X		; FF E8 FF 0E
	rti		; 40

	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	sed		; F8
	sbc $000020.l,X		; FF 20 00 00
	brk $F7.b		; 00 F7
	sbc $22FFF8.l,X		; FF F8 FF 22
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $F8.b		; 00 F8
	sbc $004020.l,X		; FF 20 40 00
	brk $FB.b		; 00 FB
	sbc $22FFF8.l,X		; FF F8 FF 22
	rti		; 40

	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	rti		; 40

	ora $48.b,S		; 03 48
	and ($00.b,S),Y		; 33 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $01.b,S		; 03 01
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	.db $42, $01		; 42 01
	plx		; FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF0000.l,X		; 1F 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00BF00.l,X		; FF 00 BF 00
	lda $000000.l,X		; BF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $F9.b		; 00 F9
	brk $F9.b		; 00 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00EF00.l,X		; FF 00 EF 00
	sbc $000000.l		; EF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $30FF00.l,X		; FF 00 FF 30
	sbc $000078.l,X		; FF 78 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tsb $02.b		; 04 02
	tsb $02.b		; 04 02
	cpy $02.b		; C4 02
	tsb $FA.b		; 04 FA
	brk $FE.b		; 00 FE
	sed		; F8
	asl $F8.b		; 06 F8
	asl $F9.b		; 06 F9
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	asl $C0.b		; 06 C0
	asl $F8.b		; 06 F8
	asl $FC.b		; 06 FC
	cop $04.b		; 02 04
	cop $04.b		; 02 04
	sbc ($04.b)		; F2 04
	sbc ($00.b,S),Y		; F3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $F000.w		; 20 00 F0
	cpy #$1F.b		; C0 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	brk $18.b		; 00 18
	brk $1F.b		; 00 1F
	brk $18.b		; 00 18
	ora $001FC0.l,X		; 1F C0 1F 00
	brk $07.b		; 00 07
	clc		; 18
	ora [$18.b]		; 07 18
	ora [$18.b]		; 07 18
	ora [$18.b]		; 07 18
	ora [$18.b]		; 07 18
	ora [$00.b]		; 07 00
	bra  -1.b		; 80 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $800000.l,X		; FF 00 00 80
	adc $0000FF.l,X		; 7F FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FF.b,S		; 03 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $807F80.l,X		; FF 80 7F 80
	brk $80.b		; 00 80
	adc $030080.l,X		; 7F 80 00 03
	jsr ($00FF.w,X)		; FC FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $18.b		; 00 18
	brk $FF.b		; 00 FF
	brk $18.b		; 00 18
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bpl 111.b		; 10 6F
	jsr $0740.w		; 20 40 07
	adc [$07.b]		; 67 07
	adc [$00.b]		; 67 00
	rts		; 60

	brk $7F.b		; 00 7F
	ora $7F007F.l,X		; 1F 7F 00 7F
	rti		; 40

	and $601F60.l,X		; 3F 60 1F 60
	ora $601F60.l,X		; 1F 60 1F 60
	ora $601F60.l,X		; 1F 60 1F 60
	ora $02007F.l,X		; 1F 7F 00 02
	jsr ($0102.w,X)		; FC 02 01
	adc ($70.b)		; 72 70
	adc ($71.b)		; 72 71
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $600000.l,X		; FF 00 00 60
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $334800.l,X		; FF 00 48 33
	pha		; 48
	and ($48.b,S),Y		; 33 48
	and ($48.b,S),Y		; 33 48
	and ($48.b,S),Y		; 33 48
	and ($35.b,S),Y		; 33 35
	cop $70.b		; 02 70
	cop $51.b		; 02 51
	jsl $01FA01.l		; 22 01 FA 01
	plx		; FA
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $34.b		; 02 34
	ora $70.b,S		; 03 70
	ora $70.b,S		; 03 70
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $7F0000.l,X		; FF 00 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	sbc $1FE000.l,X		; FF 00 E0 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FD00.l,X		; FF 00 FD 00
	xce		; FB
	brk $EF.b		; 00 EF
	brk $10.b		; 00 10
	brk $DF.b		; 00 DF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $10.b		; 00 10
	sbc $FF0000.l		; EF 00 00 FF
	lda $00BF00.l,X		; BF 00 BF 00
	lda $00BF00.l,X		; BF 00 BF 00
	lda $00FF00.l,X		; BF 00 FF 00
	brk $00.b		; 00 00
	sbc $F90000.l,X		; FF 00 00 F9
	brk $79.b		; 00 79
	brk $F9.b		; 00 F9
	brk $F9.b		; 00 F9
	brk $F9.b		; 00 F9
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00EF00.l		; EF 00 EF 00
	xba		; EB
	brk $ED.b		; 00 ED
	brk $EE.b		; 00 EE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00F700.l,X		; FF 00 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $F0.b		; 00 F0
	ora $EF78FF.l		; 0F FF 78 EF
	pla		; 68
	cmp $30FF58.l,X		; DF 58 FF 30
	sta [$78.b]		; 87 78
	lda $004000.l,X		; BF 00 40 00
	cmp $FF4800.l,X		; DF 00 48 FF
	pla		; 68
	sbc $30FF58.l,X		; FF 58 FF 30
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	lda $FF0000.l,X		; BF 00 00 FF
	sbc $F906.w,Y		; F9 06 F9
	asl $F5.b		; 06 F5
	asl A		; 0A
	sbc $0A.b,X		; F5 0A
	sbc $0A.b,X		; F5 0A
	jsr ($0002.w,X)		; FC 02 00
	cop $FC.b		; 02 FC
	cop $04.b		; 02 04
	sbc ($04.b,S),Y		; F3 04
	sbc ($02.b,S),Y		; F3 02
	sbc $F902.w,Y		; F9 02 F9
	cop $F9.b		; 02 F9
	cop $00.b		; 02 00
	inc $7E00.w,X		; FE 00 7E
	bra  32.b		; 80 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$C0.b		; C0 C0
	brk $E0.b		; 00 E0
	brk $A0.b		; 00 A0
	rti		; 40

	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	tsb $1B.b		; 04 1B
	tsb $08.b		; 04 08
	tsb $1B.b		; 04 1B
	tsb $18.b		; 04 18
	trb $1B.b		; 14 1B
	tsb $18.b		; 04 18
	tsb $1B.b		; 04 1B
	tsb $18.b		; 04 18
	brk $0F.b		; 00 0F
	bpl  15.b		; 10 0F
	bpl  15.b		; 10 0F
	bpl  15.b		; 10 0F
	brk $0F.b		; 00 0F
	bpl  15.b		; 10 0F
	bpl  15.b		; 10 0F
	bpl  15.b		; 10 0F
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
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	stz $801C.w		; 9C 1C 80
	trb $0080.w		; 1C 80 00
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $18.b		; 00 18
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc [$E7.b]		; E7 E7
	brk $A5.b		; 00 A5
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
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	rti		; 40

	and $7F807F.l,X		; 3F 7F 80 7F
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra 127.b		; 80 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	sbc $FF01.w,X		; FD 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$00.b		; C0 00
	cpy #$3F.b		; C0 3F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	inc $FF00.w,X		; FE 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	ora $FF00C0.l,X		; 1F C0 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $1FFF00.l,X		; FF 00 FF 1F
	brk $1F.b		; 00 1F
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$1F.b		; C0 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $20.b		; 00 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	rti		; 40

	jsr $2040.w		; 20 40 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $00BF00.l,X		; FF 00 BF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	bra  52.b		; 80 34
	brk $DE.b		; 00 DE
	and $C0.b,S		; 23 C0
	sbc $C0FFDE.l,X		; FF DE FF C0
	sbc $000000.l,X		; FF 00 00 00
	brk $EE.b		; 00 EE
	sbc $02FFC0.l,X		; FF C0 FF 02
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $04FFC0.l,X		; FF C0 FF 04
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $C0.b		; 00 C0
	sbc $000006.l,X		; FF 06 00 00
	brk $1E.b		; 00 1E
	brk $C0.b		; 00 C0
	sbc $000008.l,X		; FF 08 00 00
	brk $DF.b		; 00 DF
	sbc $0AFFD0.l,X		; FF D0 FF 0A
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	sbc $0CFFD0.l,X		; FF D0 FF 0C
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0EFFD0.l,X		; FF D0 FF 0E
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	brk $D0.b		; 00 D0
	sbc $000020.l,X		; FF 20 00 00
	brk $03.b		; 00 03
	brk $D0.b		; 00 D0
	sbc $00400C.l,X		; FF 0C 40 00
	brk $E4.b		; 00 E4
	sbc $22FFE0.l,X		; FF E0 FF 22
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $24FFE0.l,X		; FF E0 FF 24
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $E0.b		; 00 E0
	sbc $004022.l,X		; FF 22 40 00
	brk $FE.b		; 00 FE
	sbc $24FFE0.l,X		; FF E0 FF 24
	rti		; 40

	brk $00.b		; 00 00
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	beq  -1.b		; F0 FF
	rol $00.b		; 26 00
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	beq  -1.b		; F0 FF
	plp		; 28
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $F0.b		; 00 F0
	sbc $004026.l,X		; FF 26 40 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $004028.l,X		; FF 28 40 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($40.b,X)		; 01 40
	ora ($58.b,X)		; 01 58
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	eor ($00.b,X)		; 41 00
	sbc $0080.w,Y		; F9 80 00
	bra   0.b		; 80 00
	sta [$00.b]		; 87 00
	bra  63.b		; 80 3F
	brk $FF.b		; 00 FF
	adc $807F80.l,X		; 7F 80 7F 80
	adc $800080.l,X		; 7F 80 00 80
	brk $80.b		; 00 80
	ora [$80.b]		; 07 80
	and $00FF80.l,X		; 3F 80 FF 00
	bra   0.b		; 80 00
	bra  31.b		; 80 1F
	bra  31.b		; 80 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FB00.l,X		; FF 00 FB 00
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $00CF00.l		; CF 00 CF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	cpx #$FF.b		; E0 FF
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $02FF00.l,X		; FF 00 FF 02
	ora ($02.b,X)		; 01 02
	ora ($C2.b,X)		; 01 C2
	ora ($02.b,X)		; 01 02
	sbc $FF00.w,Y		; F9 00 FF
	jsr ($FC03.w,X)		; FC 03 FC
	ora $FC.b,S		; 03 FC
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $C0.b,S		; 03 C0
	ora $F8.b,S		; 03 F8
	ora $FE.b,S		; 03 FE
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	sbc ($02.b),Y		; F1 02
	sbc ($00.b),Y		; F1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $68.b		; 00 68
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   2.b		; F0 02
	lda ($42.b),Y		; B1 42
	rts		; 60

	ora [$01.b]		; 07 01
	ora [$01.b]		; 07 01
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	asl $00.b		; 06 00
	ora [$03.b]		; 07 03
	beq   3.b		; F0 03
	beq   7.b		; F0 07
	rts		; 60

	ora [$00.b]		; 07 00
	brk $01.b		; 00 01
	asl $01.b		; 06 01
	asl $01.b		; 06 01
	asl $01.b		; 06 01
	brk $00.b		; 00 00
	sbc $F00000.l,X		; FF 00 00 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0FF000.l,X		; FF 00 F0 0F
	beq  15.b		; F0 0F
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tsb $04.b		; 04 04
	sbc [$00.b]		; E7 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	php		; 08
	brk $08.b		; 00 08
	sbc [$F3.b],Y		; F7 F3
	php		; 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $1F0000.l,X		; FF 00 00 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $E01F00.l,X		; FF 00 1F E0
	ora $00FFE0.l,X		; 1F E0 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $02.b		; 02 02
	inc $0000.w,X		; FE 00 00
	bra  -1.b		; 80 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $010001.l,X		; FF 01 00 01
	inc $01FC.w,X		; FE FC 01
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	mvp $44,$19		; 44 19 44
	ora $1944.w,Y		; 19 44 19
	mvp $44,$19		; 44 19 44
	ora $1944.w,Y		; 19 44 19
	tsb $3201.w		; 0C 01 32
	ora ($00.b,X)		; 01 00
	sbc $FD00.w,X		; FD 00 FD
	brk $FD.b		; 00 FD
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($0C.b,X)		; 01 0C
	ora ($3A.b,X)		; 01 3A
	adc $807F80.l,X		; 7F 80 7F 80
	adc $40BF80.l,X		; 7F 80 BF 40
	lda $40BF40.l,X		; BF 40 BF 40
	lda $00FF40.l,X		; BF 40 FF 00
	bra  31.b		; 80 1F
	bra  31.b		; 80 1F
	bra  31.b		; 80 1F
	brk $5F.b		; 00 5F
	brk $5F.b		; 00 5F
	brk $5F.b		; 00 5F
	brk $5F.b		; 00 5F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FD00.w,X		; FE 00 FD
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FB0200.l,X		; FF 00 02 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $DB.b		; 00 DB
	brk $BB.b		; 00 BB
	brk $7B.b		; 00 7B
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cmp $00CF00.l		; CF 00 CF 00
	cmp $00CF00.l		; CF 00 CF 00
	cmp $00CF00.l		; CF 00 CF 00
	cmp $7F0000.l		; CF 00 00 7F
	ora ($7F.b,X)		; 01 7F
	ora ($7F.b,X)		; 01 7F
	ora ($6F.b,X)		; 01 6F
	ora ($77.b,X)		; 01 77
	brk $7A.b		; 00 7A
	ora ($78.b,X)		; 01 78
	asl $FF.b		; 06 FF
	brk $00.b		; 00 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $00FF01.l,X		; FF 01 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	beq  -1.b		; F0 FF
	beq  95.b		; F0 5F
	bvc -65.b		; 50 BF
	bcs  -1.b		; B0 FF
	cpx #$0F.b		; E0 0F
	beq   1.b		; F0 01
	inc $00FF.w,X		; FE FF 00
	brk $FF.b		; 00 FF
	bpl  -1.b		; 10 FF
	bvc  -1.b		; 50 FF
	bcs  -1.b		; B0 FF
	cpx #$FF.b		; E0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr ($FC03.w,X)		; FC 03 FC
	ora $FC.b,S		; 03 FC
	ora $FA.b,S		; 03 FA
	ora $FA.b		; 05 FA
	ora $FA.b		; 05 FA
	ora $FA.b		; 05 FA
	ora $FE.b		; 05 FE
	ora ($02.b,X)		; 01 02
	sbc ($02.b),Y		; F1 02
	sbc ($02.b),Y		; F1 02
	sbc ($01.b),Y		; F1 01
	pea $F401.w		; F4 01 F4
	ora ($F4.b,X)		; 01 F4
	ora ($F4.b,X)		; 01 F4
	ora ($00.b,X)		; 01 00
	dey		; 88
	rts		; 60

	dey		; 88
	rts		; 60

	dey		; 88
	rts		; 60

	dey		; 88
	rts		; 60

	dey		; 88
	rts		; 60

	dey		; 88
	rts		; 60

	cpy #$00.b		; C0 00
	bmi   0.b		; 30 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	cop $05.b		; 02 05
	cop $00.b		; 02 00
	cop $05.b		; 02 05
	cop $04.b		; 02 04
	cop $05.b		; 02 05
	asl $01.b		; 06 01
	asl $01.b		; 06 01
	asl $01.b		; 06 01
	brk $03.b		; 00 03
	tsb $03.b		; 04 03
	tsb $03.b		; 04 03
	tsb $03.b		; 04 03
	tsb $03.b		; 04 03
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
	php		; 08
	brk $08.b		; 00 08
	sbc [$08.b],Y		; F7 08
	brk $08.b		; 00 08
	sbc [$08.b],Y		; F7 08
	brk $08.b		; 00 08
	sbc [$08.b],Y		; F7 08
	brk $08.b		; 00 08
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rts		; 60

	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	brk $FF.b		; 00 FF
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
	ora ($00.b,X)		; 01 00
	ora ($FE.b,X)		; 01 FE
	ora ($00.b,X)		; 01 00
	ora ($FE.b,X)		; 01 FE
	ora ($00.b,X)		; 01 00
	ora ($FE.b,X)		; 01 FE
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
	brk $00.b		; 00 00
	sbc $0F0000.l,X		; FF 00 00 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $F00F00.l,X		; FF 00 0F F0
	ora $00FFF0.l		; 0F F0 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $02CD00.l		; 0F 00 CD 02
	asl $E0.b		; 06 E0
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	cpy #$0F.b		; C0 0F
	cpy #$0F.b		; C0 0F
	cpx #$06.b		; E0 06
	cpx #$00.b		; E0 00
	brk $80.b		; 00 80
	rts		; 60

	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra -64.b		; 80 C0
	bra  64.b		; 80 40
	lda $408040.l,X		; BF 40 80 40
	lda $408040.l,X		; BF 40 80 40
	lda $0F8040.l,X		; BF 40 80 0F
	cmp $807F00.l		; CF 00 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $C03FC0.l,X		; 7F C0 3F C0
	and $010001.l,X		; 3F 01 00 01
	inc $0001.w,X		; FE 01 00
	ora ($FE.b,X)		; 01 FE
	ora ($00.b,X)		; 01 00
	ora ($FE.b,X)		; 01 FE
	ora ($00.b,X)		; 01 00
	adc ($70.b),Y		; 71 70
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bit $003C.w,X		; 3C 3C 00
	bit $0000.w,X		; 3C 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
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
	adc ($61.b,X)		; 61 61
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $FF.b		; 00 FF
	brk $0C.b		; 00 0C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	jsr $3F1F.w		; 20 1F 3F
	rti		; 40

	and $403F40.l,X		; 3F 40 3F 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	bpl  96.b		; 10 60
	brk $00.b		; 00 00
	and $403F00.l,X		; 3F 00 3F 40
	and $C03FC0.l,X		; 3F C0 3F C0
	and $403F40.l,X		; 3F 40 3F 40
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq   0.b		; F0 00
	beq  15.b		; F0 0F
	sed		; F8
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora [$F0.b]		; 07 F0
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $030003.l,X		; FF 03 00 03
	jsr ($F807.w,X)		; FC 07 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F80700.l,X		; FF 00 07 F8
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
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
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	rti		; 40

	ldy #$40.b		; A0 40
	brk $40.b		; 00 40
	ldy #$40.b		; A0 40
	jsr $A040.w		; 20 40 A0
	rts		; 60

	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra   0.b		; 80 00
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$0F.b		; C0 0F
	cmp $00C000.l		; CF 00 C0 00
	sbc $00FF3F.l,X		; FF 3F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	and $C03FC0.l,X		; 3F C0 3F C0
	and $003FC0.l,X		; 3F C0 3F 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $71.b		; 00 71
	bvs   1.b		; 70 01
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $0C.b		; 00 0C
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $601000.l,X		; FF 00 10 60
	bpl  32.b		; 10 20
	bpl  32.b		; 10 20
	bpl  32.b		; 10 20
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $07.b		; 00 07
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
	brk $EF.b		; 00 EF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 087FFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 087FFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 087FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 087FFF. Skipping.
.ENDS
