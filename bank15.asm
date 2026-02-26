.BANK 15 SLOT 0
.ORG $0000

.SECTION "Bank15" FORCE

	cpx #$01.b		; E0 01
	brk $04.b		; 00 04
	pla		; 68
	cop $00.b		; 02 00
	asl $40.b		; 06 40
	ora $00.b,S		; 03 00
	php		; 08
	pla		; 68
	tsb $00.b		; 04 00
	sty $90.b		; 84 90
	asl $00.b		; 06 00
	stx $C8.b		; 86 C8
	ora #$00.b		; 09 00
	dey		; 88
	bpl  13.b		; 10 0D
	brk $8A.b		; 00 8A
	inx		; E8
	bpl   0.b		; 10 00
	sta $1658.w		; 8D 58 16
	brk $04.b		; 00 04
	cpx #$16.b		; E0 16
	brk $04.b		; 00 04
	pla		; 68
	ora [$00.b],Y		; 17 00
	ora #$98.b		; 09 98
	clc		; 18
	brk $84.b		; 00 84
	cpy #$1A.b		; C0 1A
	brk $86.b		; 00 86
	sed		; F8
	ora $8800.w,X		; 1D 00 88
	cpy #$21.b		; C0 21
	brk $8B.b		; 00 8B
	ldy #$27.b		; A0 27
	brk $8C.b		; 00 8C
	dey		; 88
	and $0400.w		; 2D 00 04
	bpl  46.b		; 10 2E
	brk $82.b		; 00 82
	plp		; 28
	and $B00400.l		; 2F 00 04 B0
	and $408100.l		; 2F 00 81 40
	bmi   0.b		; 30 00
	ora $C0.b,S		; 03 C0
	bmi   0.b		; 30 00
	tsb $68.b		; 04 68
	and ($00.b),Y		; 31 00
	php		; 08
	bcc  50.b		; 90 32
	brk $84.b		; 00 84
	clv		; B8
	bit $00.b,X		; 34 00
	stx $70.b		; 86 70
	and [$00.b],Y		; 37 00
	dey		; 88
	sec		; 38
	tsa		; 3B
	brk $8C.b		; 00 8C
	ldy #$40.b		; A0 40
	brk $8C.b		; 00 8C
	php		; 08
	lsr $00.b		; 46 00
	tsb $90.b		; 04 90
	lsr $00.b		; 46 00
	tsb $38.b		; 04 38
	eor [$00.b]		; 47 00
	php		; 08
	bra  72.b		; 80 48
	brk $84.b		; 00 84
	plp		; 28
	lsr A		; 4A
	brk $86.b		; 00 86
	rts		; 60

	eor $8800.w		; 4D 00 88
	tay		; A8
	eor ($00.b),Y		; 51 00
	phb		; 8B
	php		; 08
	eor [$00.b],Y		; 57 00
	sty $5C70.w		; 8C 70 5C
	brk $03.b		; 00 03
	beq  92.b		; F0 5C
	brk $81.b		; 00 81
	bra  93.b		; 80 5D
	brk $04.b		; 00 04
	php		; 08
	lsr $8100.w,X		; 5E 00 81
	tya		; 98
	lsr $0400.w,X		; 5E 00 04
	jsr $005F.w		; 20 5F 00
	ora $B0.b		; 05 B0
	eor $280A00.l,X		; 5F 00 0A 28
	adc ($00.b,X)		; 61 00
	sta $58.b		; 85 58
	adc $00.b,S		; 63 00
	stx $90.b		; 86 90
	ror $00.b		; 66 00
	bit #$60.b		; 89 60
	rtl		; 6B

	brk $8C.b		; 00 8C
	iny		; C8
	bvs   0.b		; 70 00
	stx $76C0.w		; 8E C0 76
	brk $04.b		; 00 04
	pha		; 48
	adc [$00.b],Y		; 77 00
	asl $20.b		; 06 20
	sei		; 78
	brk $0A.b		; 00 0A
	sei		; 78
	adc $8500.w,Y		; 79 00 85
	tay		; A8
	tda		; 7B
	brk $86.b		; 00 86
	brk $00.b		; 00 00
	ora ($8A.b,X)		; 01 8A
	cli		; 58
	tsb $01.b		; 04 01
	sty $08C0.w		; 8C C0 08
	ora ($8E.b,X)		; 01 8E
	clv		; B8
	ora $0401.w		; 0D 01 04
	rti		; 40

	asl $8201.w		; 0E 01 82
	cld		; D8
	asl $0401.w		; 0E 01 04
	rts		; 60

	ora $788201.l		; 0F 01 82 78
	bpl   1.b		; 10 01
	tsb $00.b		; 04 00
	ora ($01.b),Y		; 11 01
	ora $B0.b		; 05 B0
	ora ($01.b),Y		; 11 01
	ora #$E0.b		; 09 E0
	ora ($01.b)		; 12 01
	sty $08.b		; 84 08
	ora $01.b,X		; 15 01
	dey		; 88
	bne  24.b		; D0 18
	ora ($89.b,X)		; 01 89
	jsr $011D.w		; 20 1D 01
	stx $2318.w		; 8E 18 23
	ora ($90.b,X)		; 01 90
	jsr $012A.w		; 20 2A 01
	tsb $A8.b		; 04 A8
	rol A		; 2A
	ora ($04.b,X)		; 01 04
	bvc  43.b		; 50 2B
	ora ($09.b,X)		; 01 09
	bra  44.b		; 80 2C
	ora ($84.b,X)		; 01 84
	plp		; 28
	rol $8801.w		; 2E 01 88
	bvs  49.b		; 70 31
	ora ($89.b,X)		; 01 89
	cpy #$35.b		; C0 35
	ora ($8E.b,X)		; 01 8E
	sec		; 38
	bit $9001.w,X		; 3C 01 90
	cpy #$42.b		; C0 42
	ora ($04.b,X)		; 01 04
	pha		; 48
	eor $01.b,S		; 43 01
	.db $82, $60, $44		; 82 60 44
	ora ($04.b,X)		; 01 04
	inx		; E8
	mvp $81,$01		; 44 01 81
	sei		; 78
	eor $01.b		; 45 01
	cop $D0.b		; 02 D0
	eor $01.b		; 45 01
	cop $28.b		; 02 28
	lsr $01.b		; 46 01
	tsb $D0.b		; 04 D0
	lsr $01.b		; 46 01
	.db $82, $E8, $47		; 82 E8 47
	ora ($83.b,X)		; 01 83
	dey		; 88
	eor #$01.b		; 49 01
	sty $B0.b		; 84 B0
	phk		; 4B
	ora ($86.b,X)		; 01 86
	inx		; E8
	lsr $8701.w		; 4E 01 87
	plp		; 28
	eor ($01.b)		; 52 01
	ora ($58.b,X)		; 01 58
	eor ($01.b)		; 52 01
	cop $B0.b		; 02 B0
	eor ($01.b)		; 52 01
	ora $10.b,S		; 03 10
	eor ($01.b,S),Y		; 53 01
	.db $82, $28, $54		; 82 28 54
	ora ($83.b,X)		; 01 83
	iny		; C8
	eor $01.b,X		; 55 01
	sty $F0.b		; 84 F0
	eor [$01.b],Y		; 57 01
	sta $A0.b		; 85 A0
	phy		; 5A
	ora ($85.b,X)		; 01 85
	bvc  93.b		; 50 5D
	ora ($02.b,X)		; 01 02
	tay		; A8
	eor $8101.w,X		; 5D 01 81
	sec		; 38
	lsr $0101.w,X		; 5E 01 01
	pla		; 68
	lsr $8101.w,X		; 5E 01 81
	sed		; F8
	lsr $0401.w,X		; 5E 01 04
	bra  95.b		; 80 5F
	ora ($84.b,X)		; 01 84
	plp		; 28
	adc ($01.b,X)		; 61 01
	sty $D0.b		; 84 D0
	.db $62, $01, $89		; 62 01 89
	ldy #$66.b		; A0 66
	ora ($8A.b,X)		; 01 8A
	sed		; F8
	ror A		; 6A
	ora ($90.b,X)		; 01 90
	bra 112.b		; 80 70
	ora ($92.b,X)		; 01 92
	brk $00.b		; 00 00
	cop $99.b		; 02 99
	bvc   9.b		; 50 09
	cop $04.b		; 02 04
	clv		; B8
	ora #$02.b		; 09 02
	sta $D8.b,S		; 83 D8
	asl A		; 0A
	cop $84.b		; 02 84
	brk $0C.b		; 00 0C
	cop $88.b		; 02 88
	iny		; C8
	asl $8902.w		; 0E 02 89
	clc		; 18
	ora ($02.b)		; 12 02
	sta $1608.w		; 8D 08 16
	cop $8F.b		; 02 8F
	dey		; 88
	inc A		; 1A
	cop $96.b		; 02 96
	cpy #$21.b		; C0 21
	cop $04.b		; 02 04
	pha		; 48
	jsl $F08402.l		; 22 02 84 F0
	and $02.b,S		; 23 02
	tsb $58.b		; 04 58
	bit $02.b		; 24 02
	sta $04.b,S		; 83 04
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	ora [$F6.b]		; 07 F6
	sbc $F6FFFA.l,X		; FF FA FF F6
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F6.b		; 00 F6
	sbc $000001.l,X		; FF 01 00 00
	brk $FB.b		; 00 FB
	sbc $02FFFE.l,X		; FF FE FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000002.l,X		; FF 02 00 00
	brk $1F.b		; 00 1F
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	rti		; 40

	brk $3F.b		; 00 3F
	pha		; 48
	brk $7F.b		; 00 7F
	brk $5F.b		; 00 5F
	eor $00007F.l,X		; 5F 7F 00 00
	brk $28.b		; 00 28
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	brk $40.b		; 00 40
	and [$00.b],Y		; 37 00
	brk $60.b		; 00 60
	rts		; 60

	adc $00E000.l,X		; 7F 00 E0 00
	bpl   0.b		; 10 00
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	pha		; 48
	brk $F8.b		; 00 F8
	brk $E8.b		; 00 E8
	iny		; C8
	sed		; F8
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	rti		; 40

	sed		; F8
	tsb $F8.b		; 04 F8
	brk $08.b		; 00 08
	bcs   0.b		; B0 00
	brk $38.b		; 00 38
	clc		; 18
	sed		; F8
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
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	brk $F8.b		; 00 F8
	php		; 08
	sbc ($FF.b,S),Y		; F3 FF
	sed		; F8
	sbc $00FFF3.l,X		; FF F3 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $000001.l,X		; FF 01 00 00
	brk $08.b		; 00 08
	brk $F3.b		; 00 F3
	sbc $000002.l,X		; FF 02 00 00
	brk $F8.b		; 00 F8
	sbc $03FFFB.l,X		; FF FB FF 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $000004.l,X		; FF 04 00 00
	brk $01.b		; 00 01
	brk $FB.b		; 00 FB
	sbc $004003.l,X		; FF 03 40 00
	brk $0F.b		; 00 0F
	bpl   4.b		; 10 04
	jsr $31A4.w		; 20 A4 31
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	ora $403F40.l		; 0F 40 3F 40
	sbc $001000.l,X		; FF 00 10 00
	bit $00.b		; 24 00
	asl $7FC0.w		; 0E C0 7F
	brk $7F.b		; 00 7F
	brk $C0.b		; 00 C0
	and [$C0.b],Y		; 37 C0
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	tsb $00.b		; 04 00
	cop $1A.b		; 02 1A
	cpy $00.b		; C4 00
	brk $00.b		; 00 00
	inc $01F8.w,X		; FE F8 01
	inc $FF01.w,X		; FE 01 FF
	brk $04.b		; 00 04
	brk $12.b		; 00 12
	bpl  40.b		; 10 28
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $01.b,X		; F6 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	eor [$7F.b],Y		; 57 7F
	brk $E3.b		; 00 E3
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $68.b		; 00 68
	cpx #$FF.b		; E0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $FF.b,X		; F5 FF
	brk $E3.b		; 00 E3
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	tsb $FFEE.w		; 0C EE FF
	sbc $FF.b,X		; F5 FF
	inc $00FF.w		; EE FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFEE.l,X		; FF EE FF 01
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $EE.b		; 00 EE
	sbc $000002.l,X		; FF 02 00 00
	brk $F5.b		; 00 F5
	sbc $03FFF6.l,X		; FF F6 FF 03
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $04FFF6.l,X		; FF F6 FF 04
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $F6.b		; 00 F6
	sbc $000005.l,X		; FF 05 00 00
	brk $F5.b		; 00 F5
	sbc $06FFFE.l,X		; FF FE FF 06
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $004006.l,X		; FF 06 40 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	clc		; 18
	ora #$00.b		; 09 00
	sta ($1C.b),Y		; 91 1C
	cmp $000000.l,X		; DF 00 00 00
	rti		; 40

	eor $07005F.l,X		; 5F 5F 00 07
	php		; 08
	bpl   0.b		; 10 00
	ora ($00.b),Y		; 11 00
	ora $C0.b,S		; 03 C0
	cpx #$00.b		; E0 00
	and $007F00.l,X		; 3F 00 7F 00
	bit $00C1.w,X		; 3C C1 00
	brk $3C.b		; 00 3C
	brk $81.b		; 00 81
	ora ($81.b,X)		; 01 81
	and $0000FF.l,X		; 3F FF 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $81.b		; 00 81
	ora ($C1.b,X)		; 01 C1
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $900000.l,X		; FF 00 00 90
	dey		; 88
	clc		; 18
	php		; 08
	cmp #$30.b		; C9 30
	xce		; FB
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	plx		; FA
	plx		; FA
	brk $E0.b		; 00 E0
	bpl -120.b		; 10 88
	bra -64.b		; 80 C0
	bra  64.b		; 80 40
	ora $07.b,S		; 03 07
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $3C.b		; 00 3C
	sta $22.b,S		; 83 22
	eor $403F.w,X		; 5D 3F 40
	sbc $604300.l,X		; FF 00 43 60
	ror $7F07.w,X		; 7E 07 7F
	rti		; 40

	sed		; F8
	brk $F0.b		; 00 F0
	brk $BD.b		; 00 BD
	rti		; 40

	cpy #$00.b		; C0 00
	and $F87E00.l,X		; 3F 00 7E F8
	sei		; 78
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $45.b		; 00 45
	tyx		; BB
	jsr ($FF02.w,X)		; FC 02 FF
	brk $C2.b		; 00 C2
	asl $FE.b		; 06 FE
	rts		; 60

	inc $1F02.w,X		; FE 02 1F
	brk $0F.b		; 00 0F
	brk $BD.b		; 00 BD
	cop $03.b		; 02 03
	brk $FC.b		; 00 FC
	brk $7E.b		; 00 7E
	ora $FF011E.l,X		; 1F 1E 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
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
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F1.b		; 00 F1
	bpl -24.b		; 10 E8
	sbc $E8FFF1.l,X		; FF F1 FF E8
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	brk $E8.b		; 00 E8
	sbc $000002.l,X		; FF 02 00 00
	brk $F2.b		; 00 F2
	sbc $04FFF8.l,X		; FF F8 FF 04
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000006.l,X		; FF 06 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	cop $02.b		; 02 02
	tsb $06.b		; 04 06
	tsb $04.b		; 04 04
	brk $AC.b		; 00 AC
	plp		; 28
	sbc $000000.l		; EF 00 00 00
	brk $01.b		; 00 01
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	php		; 08
	brk $23.b		; 00 23
	cpy #$F0.b		; C0 F0
	brk $1F.b		; 00 1F
	brk $F0.b		; 00 F0
	sbc $0300FF.l,X		; FF FF 00 03
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $F3.b		; 00 F3
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $F8.b		; 00 F8
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	sbc $C600FF.l,X		; FF FF 00 C6
	asl $02.b		; 06 02
	brk $0B.b		; 00 0B
	ora #$CF.b		; 09 CF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl $0F.b		; 06 0F
	asl $0F.b		; 06 0F
	ora $000030.l		; 0F 30 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	rti		; 40

	rti		; 40

	jsr $0060.w		; 20 60 00
	jsr $3500.w		; 20 00 35
	trb $F7.b		; 14 F7
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $C4.b		; 00 C4
	ora $0B.b,S		; 03 0B
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	sty $78.b		; 84 78
	ora [$7F.b]		; 07 7F
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $78.b		; 00 78
	brk $FB.b		; 00 FB
	brk $78.b		; 00 78
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	sbc $3F00FF.l,X		; FF FF 00 3F
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
	brk $F9.b		; 00 F9
	tsb $00.b		; 04 00
	sbc $F800FF.l,X		; FF FF 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sty $38.b		; 84 38
	bra  -8.b		; 80 F8
	brk $FC.b		; 00 FC
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $78.b		; 00 78
	brk $7C.b		; 00 7C
	brk $78.b		; 00 78
	tsb $F8.b		; 04 F8
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2F.b		; 00 2F
	jsr $202F.w		; 20 2F 20
	rts		; 60

	rti		; 40

	bvc 111.b		; 50 6F
	and $7F0030.l,X		; 3F 30 00 7F
	sbc $725B03.l,X		; FF 03 5B 72
	and $403000.l,X		; 3F 00 30 40
	bvc  47.b		; 50 2F
	eor $307020.l,X		; 5F 20 70 30
	adc $000100.l,X		; 7F 00 01 00
	adc $FF3C.w,X		; 7D 3C FF
	brk $FF.b		; 00 FF
	adc $8700FF.l,X		; 7F FF 00 87
	adc $0000FF.l,X		; 7F FF 00 00
	sbc $3F0000.l,X		; FF 00 00 3F
	rti		; 40

	sbc $00FF00.l,X		; FF 00 FF 00
	brk $7F.b		; 00 7F
	adc $000000.l,X		; 7F 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	bra   0.b		; 80 00
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $FEE100.l,X		; FF 00 E1 FE
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ora ($00.b,X)		; 01 00
	pea $F404.w		; F4 04 F4
	tsb $06.b		; 04 06
	cop $0A.b		; 02 0A
	inc $FC.b,X		; F6 FC
	tsb $FE00.w		; 0C 00 FE
	sbc $4EDAC0.l,X		; FF C0 DA 4E
	jsr ($0C00.w,X)		; FC 00 0C
	cop $0A.b		; 02 0A
	pea $04FA.w		; F4 FA 04
	asl $FE0C.w		; 0E 0C FE
	brk $80.b		; 00 80
	brk $BE.b		; 00 BE
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $80.b		; 06 80
	clc		; 18
	brk $ED.b		; 00 ED
	trb $E2.b		; 14 E2
	sbc $E2FFED.l,X		; FF ED FF E2
	sbc $000000.l,X		; FF 00 00 00
	brk $FD.b		; 00 FD
	sbc $02FFE2.l,X		; FF E2 FF 02
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $E2.b		; 00 E2
	sbc $000004.l,X		; FF 04 00 00
	brk $ED.b		; 00 ED
	sbc $06FFF2.l,X		; FF F2 FF 06
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $08FFF2.l,X		; FF F2 FF 08
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $F2.b		; 00 F2
	sbc $00000A.l,X		; FF 0A 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $03.b		; 00 03
	cop $E2.b		; 02 E2
	ora $F7.b,S		; 03 F7
	cpx $00.b		; E4 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	cpx #$F8.b		; E0 F8
	brk $3E.b		; 00 3E
	and $80807F.l,X		; 3F 7F 80 80
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $1E.b		; 00 1E
	brk $1E.b		; 00 1E
	cpy #$FF.b		; C0 FF
	brk $3F.b		; 00 3F
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $1E.b		; 00 1E
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	sbc $7E00FF.l,X		; FF FF 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF08F7.l,X		; FF F7 08 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	jsr ($01FE.w,X)		; FC FE 01
	ora ($00.b,X)		; 01 00
	sec		; 38
	sec		; 38
	sec		; 38
	php		; 08
	jmp $4B584C.l		; 5C 4C 58 4B
	sbc $03FC00.l,X		; FF 00 FC 03
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sei		; 78
	sec		; 38
	pla		; 68
	plp		; 28
	jsr ($FC7C.w,X)		; FC 7C FC
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	rti		; 40

	cpy #$40.b		; C0 40
	cpy #$00.b		; C0 00
	eor [$80.b]		; 47 80
	sbc $000027.l		; EF 27 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2000.w		; 20 00 20
	ora [$1F.b]		; 07 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $2D.b		; 00 2D
	sec		; 38
	and $0038.w		; 2D 38 00
	ora $1F001F.l,X		; 1F 1F 00 1F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	adc $207F3F.l,X		; 7F 3F 7F 20
	rti		; 40

	eor $205F20.l,X		; 5F 20 5F 20
	brk $FF.b		; 00 FF
	sbc $C0C000.l,X		; FF 00 C0 C0
	cmp $9FDF80.l,X		; DF 80 DF 9F
	and $00FF80.l,X		; 3F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	rti		; 40

	and $600060.l,X		; 3F 60 00 60
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0300FF.l,X		; FF FF 00 03
	ora $F3.b,S		; 03 F3
	ora #$FB.b		; 09 FB
	sbc $01FC.w,Y		; F9 FC 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	cop $FC.b		; 02 FC
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr ($00FF.w,X)		; FC FF 00
	sbc $1CB400.l,X		; FF 00 B4 1C
	ldy $1C.b,X		; B4 1C
	brk $F8.b		; 00 F8
	sed		; F8
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	inc $FEFC.w,X		; FE FC FE
	tsb $02.b		; 04 02
	plx		; FA
	tsb $FA.b		; 04 FA
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
	brk $E1.b		; 00 E1
	cpx #$00.b		; E0 00
	brk $37.b		; 00 37
	jsr $3720.w		; 20 20 37
	and [$10.b]		; 27 10
	rts		; 60

	bvc  72.b		; 50 48
	adc [$3F.b],Y		; 77 3F
	sec		; 38
	asl $1F00.w,X		; 1E 00 1F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	rts		; 60

	cli		; 58
	and [$5F.b]		; 27 5F
	jsr $3878.w		; 20 78 38
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $003F00.l,X		; FF 00 3F 00
	bmi -49.b		; 30 CF
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FC000.l,X		; FF 00 C0 1F
	brk $DF.b		; 00 DF
	cmp $000000.l,X		; DF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ror $FFFF.w,X		; 7E FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FC00FF.l,X		; FF FF 00 FC
	brk $0C.b		; 00 0C
	sbc ($FF.b,S),Y		; F3 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	sed		; F8
	brk $FB.b		; 00 FB
	xce		; FB
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	ora [$00.b]		; 07 00
	brk $EC.b		; 00 EC
	tsb $04.b		; 04 04
	cpx $08E4.w		; EC E4 08
	asl $0A.b		; 06 0A
	ora ($EE.b)		; 12 EE
	jsr ($781C.w,X)		; FC 1C 78
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	asl $1A.b		; 06 1A
	cpx $FA.b		; E4 FA
	tsb $1E.b		; 04 1E
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
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $003E00.l,X		; 7F 00 3E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $00.b,S		; 83 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc ($00.b,X)		; E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $7E00.w,X		; FE 00 7E
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
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
	brk $08.b		; 00 08
	bra  24.b		; 80 18
	brk $E9.b		; 00 E9
	clc		; 18
	cmp $EAFF.w,X		; DD FF EA
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	sbc $004000.l,X		; FF 00 40 00
	brk $E9.b		; 00 E9
	sbc $04FFE0.l,X		; FF E0 FF 04
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $06FFE0.l,X		; FF E0 FF 06
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $E0.b		; 00 E0
	sbc $000008.l,X		; FF 08 00 00
	brk $F1.b		; 00 F1
	sbc $0AFFD0.l,X		; FF D0 FF 0A
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $D0.b		; 00 D0
	sbc $00400A.l,X		; FF 0A 40 00
	brk $00.b		; 00 00
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $0A.b		; 00 0A
	bit $3C0A.w,X		; 3C 0A 3C
	and $1F0000.l,X		; 3F 00 00 1F
	and $007F20.l,X		; 3F 20 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsa		; 3B
	tda		; 7B
	tsa		; 3B
	tda		; 7B
	and $402040.l,X		; 3F 40 20 40
	adc $FF0000.l,X		; 7F 00 00 FF
	sbc $40E000.l,X		; FF 00 E0 40
	cmp $47D740.l,X		; DF 40 D7 47
	adc ($60.b,S),Y		; 73 60
	ora $00FFE0.l		; 0F E0 FF 00
	sbc $000000.l,X		; FF 00 00 00
	jsr $BF1F.w		; 20 1F BF
	bra -72.b		; 80 B8
	bra -100.b		; 80 9C
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($71.b,X)		; 01 71
	ora ($FB.b,X)		; 01 FB
	sbc ($FB.b)		; F2 FB
	php		; 08
	bvs 112.b		; 70 70
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	cop $70.b		; 02 70
	jsr ($F400.w,X)		; FC 00 F4
	brk $0F.b		; 00 0F
	brk $60.b		; 00 60
	bra  64.b		; 80 40
	brk $83.b		; 00 83
	bra -121.b		; 80 87
	brk $87.b		; 00 87
	bvs  -1.b		; 70 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $87.b		; 00 87
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E1.b		; 00 E1
	ora ($03.b,X)		; 01 03
	ora $03.b,S		; 03 03
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	plx		; FA
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $06.b,S		; 03 06
	cop $07.b		; 02 07
	ora $07.b,S		; 03 07
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $C6.b		; 00 C6
	cmp ($E2.b,X)		; C1 E2
	cpx #$61.b		; E0 61
	and ($61.b,X)		; 21 61
	jsr $0EE1.w		; 20 E1 0E
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	cmp ($C0.b,X)		; C1 C0
	sbc ($E0.b,X)		; E1 E0
	bcs -96.b		; B0 A0
	beq -32.b		; F0 E0
	bvs  64.b		; 70 40
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	sbc $800000.l,X		; FF 00 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	stx $DF80.w		; 8E 80 DF
	eor $0E10DF.l		; 4F DF 10 0E
	asl $0080.w		; 0E 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $40.b		; 00 40
	asl $003F.w		; 0E 3F 00
	and $00F000.l		; 2F 00 F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $007F20.l,X		; 3F 20 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $003F00.l,X		; 7F 00 3F 00
	adc $000000.l,X		; 7F 00 00 00
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
	sbc $000000.l,X		; FF 00 00 00
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
	sbc $000000.l,X		; FF 00 00 00
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
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($10.b,S),Y		; 13 10
	tas		; 1B
	bpl  16.b		; 10 10
	tas		; 1B
	ora ($08.b,S),Y		; 13 08
	bmi  40.b		; 30 28
	and [$3B.b]		; 27 3B
	ora [$1C.b],Y		; 17 1C
	ora $001C1C.l		; 0F 1C 1C 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $136C30.l		; 0F 30 6C 13
	adc $1C7C10.l		; 6F 10 7C 1C
	jmp ($FF1C.w,X)		; 7C 1C FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0F00FF.l,X		; FF FF 00 0F
	brk $F8.b		; 00 F8
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	ora [$00.b]		; 07 00
	sbc [$F0.b],Y		; F7 F0
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	ora [$FF.b]		; 07 FF
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00001F.l,X		; FF 1F 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	cpx #$FF.b		; E0 FF
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000F8.l,X		; FF F8 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $F000FF.l,X		; FF FF 00 F0
	brk $1F.b		; 00 1F
	ora $FF00FF.l		; 0F FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	cpx #$00.b		; E0 00
	sbc $00E00F.l		; EF 0F E0 00
	brk $00.b		; 00 00
	brk $C8.b		; 00 C8
	php		; 08
	cld		; D8
	php		; 08
	php		; 08
	cld		; D8
	iny		; C8
	bpl  12.b		; 10 0C
	trb $E4.b		; 14 E4
	jmp.w [$38E8]		; DC E8 38
	beq  56.b		; F0 38
	sec		; 38
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	tsb $C836.w		; 0C 36 C8
	inc $08.b,X		; F6 08
	rol $3E38.w,X		; 3E 38 3E
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00200F.l,X		; 1F 0F 20 00
	bmi -64.b		; 30 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $601F30.l		; 0F 30 1F 60
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$FF.b		; C0 FF
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	asl A		; 0A
	bra  28.b		; 80 1C
	brk $E7.b		; 00 E7
	inc A		; 1A
	phx		; DA
	sbc $DAFFE7.l,X		; FF E7 FF DA
	sbc $000000.l,X		; FF 00 00 00
	brk $F7.b		; 00 F7
	sbc $02FFDA.l,X		; FF DA FF 02
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $DA.b		; 00 DA
	sbc $000004.l,X		; FF 04 00 00
	brk $17.b		; 00 17
	brk $DA.b		; 00 DA
	sbc $000006.l,X		; FF 06 00 00
	brk $E8.b		; 00 E8
	sbc $08FFEA.l,X		; FF EA FF 08
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $0AFFEA.l,X		; FF EA FF 0A
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $EA.b		; 00 EA
	sbc $004008.l,X		; FF 08 40 00
	brk $FA.b		; 00 FA
	sbc $0AFFEA.l,X		; FF EA FF 0A
	rti		; 40

	brk $00.b		; 00 00
	sbc #$FF.b		; E9 FF
	plx		; FA
	sbc $00000C.l,X		; FF 0C 00 00
	brk $09.b		; 00 09
	brk $FA.b		; 00 FA
	sbc $00400C.l,X		; FF 0C 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $02.b		; 00 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	ora [$10.b]		; 07 10
	brk $1F.b		; 00 1F
	bmi -80.b		; 30 B0
	cpx #$60.b		; E0 60
	rti		; 40

	sbc ($80.b,X)		; E1 80
	cmp ($80.b,X)		; C1 80
	cmp $00.b,S		; C3 00
	ora [$18.b]		; 07 18
	ora $402030.l		; 0F 30 20 40
	cpy #$00.b		; C0 00
	sta $00.b,S		; 83 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	sbc $000300.l,X		; FF 00 03 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	inc $0000.w,X		; FE 00 00
	sbc $000000.l,X		; FF 00 00 00
	sei		; 78
	sei		; 78
	dey		; 88
	php		; 08
	cld		; D8
	dey		; 88
	tya		; 98
	dey		; 88
	inc $FF01.w,X		; FE 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sei		; 78
	sed		; F8
	sei		; 78
	ldy $FCA8.w		; AC A8 FC
	sed		; F8
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	bne 112.b		; D0 70
	rts		; 60

	jsr $1878.w		; 20 78 18
	bmi  16.b		; 30 10
	bit $04.b,X		; 34 04
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	rti		; 40

	jsr $0030.w		; 20 30 00
	bpl   0.b		; 10 00
	php		; 08
	brk $08.b		; 00 08
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $44.b		; 00 44
	bvs  79.b		; 70 4F
	adc ($4C.b,S),Y		; 73 4C
	adc ($2F.b,S),Y		; 73 2F
	sec		; 38
	ora $00FF38.l,X		; 1F 38 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cld		; D8
	and $DB.b,S		; 23 DB
	jsr $20DB.w		; 20 DB 20
	sed		; F8
	sec		; 38
	sed		; F8
	sec		; 38
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	jsr ($0EF8.w,X)		; FC F8 0E
	sbc ($FF.b),Y		; F1 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	bmi   0.b		; 30 00
	xce		; FB
	sed		; F8
	ora $FB.b,S		; 03 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $100000.l,X		; FF 00 00 10
	ora $0000FF.l		; 0F FF 00 00
	brk $07.b		; 00 07
	sbc $FF07EB.l,X		; FF EB 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $F8.b		; 00 F8
	sbc $FFF8F5.l,X		; FF F5 F8 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

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
	bit #$09.b		; 89 09
	adc $F971.w,X		; 7D 71 F9
	php		; 08
	ply		; 7A
	bvs   3.b		; 70 03
	brk $1B.b		; 00 1B
	bpl   2.b		; 10 02
	ora #$13.b		; 09 13
	php		; 08
	asl A		; 0A
	beq 126.b		; F0 7E
	bra -10.b		; 80 F6
	brk $0D.b		; 00 0D
	brk $0C.b		; 00 0C
	brk $1D.b		; 00 1D
	brk $0D.b		; 00 0D
	bpl  12.b		; 10 0C
	bmi -125.b		; 30 83
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $7C01FF.l,X		; FF FF 01 7C
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $F1.b		; 00 F1
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0EFFFF.l,X		; FF FF FF 0E
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F1.b		; 00 F1
	brk $BF.b		; 00 BF
	rti		; 40

	sbc $00FC00.l,X		; FF 00 FC 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $000EFF.l,X		; FF FF 0E 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $07F8FF.l,X		; FF FF F8 07
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $19.b		; 00 19
	ora #$FB.b		; 09 FB
	php		; 08
	sbc $0501.w,Y		; F9 01 05
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $04.b		; 00 04
	sbc $01FC.w,Y		; F9 FC 01
	sbc $00.b		; E5 00
	ora [$00.b]		; 07 00
	asl $00.b		; 06 00
	xce		; FB
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $03.b		; 00 03
	brk $10.b		; 00 10
	brk $E0.b		; 00 E0
	cpx #$F0.b		; E0 F0
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	beq -32.b		; F0 E0
	bpl -16.b		; 10 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
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
	brk $34.b		; 00 34
	rol $3E28.w,X		; 3E 28 3E
	and $3F2020.l,X		; 3F 20 20 3F
	ora $001F00.l,X		; 1F 00 1F 00
	adc $007F00.l,X		; 7F 00 7F 00
	and $3D5D.w,X		; 3D 5D 3D
	eor $403F.w,X		; 5D 3F 40
	jsr $5F40.w		; 20 40 5F
	jsr $205F.w		; 20 5F 20
	brk $00.b		; 00 00
	jsr $7F20.w		; 20 20 7F
	jsr $22FB.w		; 20 FB 22
	lda $0721.w,Y		; B9 21 07
	cpx #$40.b		; E0 40
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $E0.b		; 00 E0
	brk $DF.b		; 00 DF
	cpy #$DC.b		; C0 DC
	cpy #$DE.b		; C0 DE
	brk $1F.b		; 00 1F
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	bra  40.b		; 80 28
	brk $E0.b		; 00 E0
	jsr $FFD1.w		; 20 D1 FF
	cpx #$FF.b		; E0 FF
	cmp ($FF.b),Y		; D1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	cmp ($FF.b),Y		; D1 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($FF.b),Y		; D1 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	cmp ($FF.b),Y		; D1 FF
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cmp ($FF.b),Y		; D1 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	sbc ($FF.b,X)		; E1 FF
	php		; 08
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $0AFFE1.l,X		; FF E1 FF 0A
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $E1.b		; 00 E1
	sbc $00000C.l,X		; FF 0C 00 00
	brk $FF.b		; 00 FF
	sbc $0AFFE1.l,X		; FF E1 FF 0A
	rti		; 40

	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	sbc ($FF.b),Y		; F1 FF
	asl $0000.w		; 0E 00 00
	brk $F3.b		; 00 F3
	sbc $20FFF1.l,X		; FF F1 FF 20
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $F1.b		; 00 F1
	sbc $000022.l,X		; FF 22 00 00
	brk $FE.b		; 00 FE
	sbc $20FFF1.l,X		; FF F1 FF 20
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
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	ora $06.b,S		; 03 06
	ora [$1C.b],Y		; 17 1C
	asl $0C18.w		; 0E 18 0C
	php		; 08
	trb $0010.w		; 1C 10 00
	ora ($00.b,X)		; 01 00
	ora $01.b,S		; 03 01
	asl $04.b		; 06 04
	php		; 08
	clc		; 18
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	adc $FF0000.l,X		; 7F 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	sbc $FF807F.l,X		; FF 7F 80 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	sec		; 38
	jmp ($447C.w,X)		; 7C 7C 44
	mvp $FF,$00		; 44 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	sec		; 38
	inc $FE7C.w,X		; FE 7C FE
	jmp ($0000.w,X)		; 7C 00 00
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	sbc $00F000.l,X		; FF 00 F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $0000FE.l,X		; FF FE 00 00
	sbc $000000.l,X		; FF 00 00 00
	bvs 112.b		; 70 70
	sed		; F8
	sed		; F8
	dey		; 88
	dey		; 88
	brk $FF.b		; 00 FF
	inc $FF01.w,X		; FE 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	bvs  -4.b		; 70 FC
	sed		; F8
	jsr ($13F8.w,X)		; FC F8 13
	bpl  59.b		; 10 3B
	bmi  18.b		; 30 12
	ora $1833.w,Y		; 19 33 18
	ora ($28.b,S),Y		; 13 28
	eor ($68.b)		; 52 68
	eor [$79.b]		; 47 79
	lsr $79.b		; 46 79
	trb $3D00.w		; 1C 00 3D
	brk $1D.b		; 00 1D
	jsr $601C.w		; 20 1C 60
	ora $CC70.w		; 0D 70 CC
	and ($CD.b),Y		; 31 CD
	bmi -51.b		; 30 CD
	bmi  -1.b		; 30 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	inc $FC03.w,X		; FE 03 FC
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	inc $0000.w,X		; FE 00 00
	inc $00FE.w,X		; FE FE 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	adc $FF0000.l,X		; 7F 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	adc $003FC0.l,X		; 7F C0 3F 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	adc $7F007F.l,X		; 7F 7F 00 7F
	brk $C8.b		; 00 C8
	php		; 08
	jmp.w [$480C]		; DC 0C 48
	tya		; 98
	cpy $C818.w		; CC 18 C8
	trb $4A.b		; 14 4A
	asl $E2.b,X		; 16 E2
	stz $9E62.w,X		; 9E 62 9E
	sec		; 38
	brk $BC.b		; 00 BC
	brk $B8.b		; 00 B8
	tsb $38.b		; 04 38
	asl $B0.b		; 06 B0
	asl $8C33.w		; 0E 33 8C
	lda ($0C.b,S),Y		; B3 0C
	lda ($0C.b,S),Y		; B3 0C
	eor $7F7E.w,Y		; 59 7E 7F
	rti		; 40

	rti		; 40

	eor $3F203F.l,X		; 5F 3F 20 3F
	jsr $203F.w		; 20 3F 20
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $7FBD.w,X		; 7D BD 7F
	bra  96.b		; 80 60
	bra -65.b		; 80 BF
	rti		; 40

	lda $40BF40.l,X		; BF 40 BF 40
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	ror $10.b,X		; 76 10
	dec $0118.w,X		; DE 18 01
	sed		; F8
	ldy #$3F.b		; A0 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00F000.l,X		; FF 00 F0 00
	sbc $00E7E0.l		; EF E0 E7 00
	ora [$00.b]		; 07 00
	cpy #$00.b		; C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $4640.w,X		; 3C 40 46
	stx $7E.b		; 86 7E
	jmp ($02FE.w,X)		; 7C FE 02
	jmp ($007C.w,X)		; 7C 7C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($F806.w,X)		; 7C 06 F8
	adc $00FD80.l,X		; 7F 80 FD 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	clc		; 18
	bpl  56.b		; 10 38
	jsr $2F30.w		; 20 30 2F
	bvs  64.b		; 70 40
	adc $007F40.l,X		; 7F 40 7F 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rts		; 60

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $8F.b		; 00 8F
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	bra  63.b		; 80 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $C0.b		; 00 C0
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	and $FF0087.l,X		; 3F 87 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $00F0.w,X		; FE F0 00
	adc $00FF80.l,X		; 7F 80 FF 00
	brk $00.b		; 00 00
	inc $0100.w,X		; FE 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $EE.b		; 00 EE
	dec $CE.b		; C6 CE
	dec $DE.b		; C6 DE
	mvp $00,$FE		; 44 FE 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp [$D6.b],Y		; D7 D6
	sbc $6CEFFE.l,X		; FF FE EF 6C
	ora ($00.b,X)		; 01 00
	ror $0000.w,X		; 7E 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	jsr ($00E1.w,X)		; FC E1 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	jsr ($0300.w,X)		; FC 00 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $DC.b		; 00 DC
	sty $8C9C.w		; 8C 9C 8C
	ldy $FC89.w,X		; BC 89 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $AE.b		; 00 AE
	ldy $FCFE.w		; AC FE FC
	dec $03D8.w,X		; DE D8 03
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $17.b		; 00 17
	bit $3C2F.w,X		; 3C 2F 3C
	brk $3F.b		; 00 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3F2800.l,X		; FF 00 28 3F
	and ($3F.b)		; 32 3F
	jsr ($FC3C.w,X)		; FC 3C FC
	bit $007F.w,X		; 3C 7F 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	rol $3E5E.w,X		; 3E 5E 3E
	lsr $00FF.w,X		; 5E FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $9B0A.w,X		; FE 0A 9B
	php		; 08
	tas		; 1B
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	asl $01.b		; 06 01
	sbc [$F0.b],Y		; F7 F0
	sbc [$F0.b],Y		; F7 F0
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $403F00.l,X		; FF 00 3F 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $008000.l,X		; FF 00 80 00
	eor $00FF3F.l,X		; 5F 3F FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $10DF50.l,X		; 7F 50 DF 10
	cld		; D8
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $600000.l,X		; FF 00 00 60
	bra -17.b		; 80 EF
	ora $E80FEF.l		; 0F EF 0F E8
	bit $3CF4.w,X		; 3C F4 3C
	brk $FC.b		; 00 FC
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FC2C00.l,X		; FF 00 2C FC
	jmp $3FFC.w		; 4C FC 3F
	bit $3C3F.w,X		; 3C 3F 3C
	inc $FF00.w,X		; FE 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $7C.b		; 00 7C
	ply		; 7A
	jmp ($FF7A.w,X)		; 7C 7A FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	sbc $403FFF.l,X		; FF FF 3F 40
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $001F00.l,X		; FF 00 1F 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror A		; 6A
	php		; 08
	tda		; 7B
	clc		; 18
	bra  31.b		; 80 1F
	ora $FC.b		; 05 FC
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000F00.l,X		; FF 00 0F 00
	sbc [$07.b],Y		; F7 07
	sbc [$00.b]		; E7 00
	cpx #$00.b		; E0 00
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $7E.b,X		; 16 7E
	inc $0202.w,X		; FE 02 02
	plx		; FA
	jsr ($FC04.w,X)		; FC 04 FC
	tsb $FC.b		; 04 FC
	tsb $FF.b		; 04 FF
	brk $FF.b		; 00 FF
	brk $BE.b		; 00 BE
	lda $01FE.w,X		; BD FE 01
	asl $01.b		; 06 01
	sbc $FD02.w,X		; FD 02 FD
	cop $FD.b		; 02 FD
	cop $00.b		; 02 00
	brk $02.b		; 00 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	asl $F6.b		; 06 F6
	sbc $F6FFFA.l,X		; FF FA FF F6
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F6.b		; 00 F6
	sbc $000001.l,X		; FF 01 00 00
	brk $FA.b		; 00 FA
	sbc $02FFFE.l,X		; FF FE FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000002.l,X		; FF 02 00 00
	brk $3F.b		; 00 3F
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	bra   7.b		; 80 07
	sbc $FFFF7F.l,X		; FF 7F FF FF
	brk $6D.b		; 00 6D
	php		; 08
	sbc $000000.l,X		; FF 00 00 00
	rti		; 40

	brk $00.b		; 00 00
	sbc $FF0007.l,X		; FF 07 00 FF
	cpx #$00.b		; E0 00
	brk $7F.b		; 00 7F
	sta [$00.b],Y		; 97 00
	brk $E0.b		; 00 E0
	brk $B0.b		; 00 B0
	brk $00.b		; 00 00
	php		; 08
	brk $F8.b		; 00 F8
	beq  -8.b		; F0 F8
	sed		; F8
	brk $F0.b		; 00 F0
	bra  -8.b		; 80 F8
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	sed		; F8
	brk $00.b		; 00 00
	sed		; F8
	sec		; 38
	brk $00.b		; 00 00
	beq   8.b		; F0 08
	brk $00.b		; 00 00
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
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	sbc $F307.w,Y		; F9 07 F3
	sbc $F3FFF9.l,X		; FF F9 FF F3
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $004000.l,X		; FF 00 40 00
	brk $F9.b		; 00 F9
	sbc $01FFFB.l,X		; FF FB FF 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $FB.b		; 00 FB
	sbc $000002.l,X		; FF 02 00 00
	brk $3F.b		; 00 3F
	brk $6E.b		; 00 6E
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $FFF377.l,X		; FF 77 F3 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	sbc $FB0000.l,X		; FF 00 00 FB
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	jsr ($EC04.w,X)		; FC 04 EC
	cpx $FF.b		; E4 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tas		; 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $7E40.w,X		; 7E 40 7E
	ror $00FE.w,X		; 7E FE 00
	asl $0E00.w		; 0E 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $07.b		; 00 07
	brk $F4.b		; 00 F4
	tsb $FFEE.w		; 0C EE FF
	pea $EEFF.w		; F4 FF EE
	sbc $000000.l,X		; FF 00 00 00
	brk $FC.b		; 00 FC
	sbc $01FFEE.l,X		; FF EE FF 01
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $EE.b		; 00 EE
	sbc $000002.l,X		; FF 02 00 00
	brk $FD.b		; 00 FD
	sbc $01FFEE.l,X		; FF EE FF 01
	rti		; 40

	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	inc $FF.b,X		; F6 FF
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	sbc $F6FF.w,X		; FD FF F6
	sbc $000004.l,X		; FF 04 00 00
	brk $05.b		; 00 05
	brk $F6.b		; 00 F6
	sbc $000005.l,X		; FF 05 00 00
	brk $F5.b		; 00 F5
	sbc $06FFFE.l,X		; FF FE FF 06
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $FE.b		; 00 FE
	sbc $000006.l,X		; FF 06 00 00
	brk $07.b		; 00 07
	brk $0C.b		; 00 0C
	brk $1D.b		; 00 1D
	brk $1F.b		; 00 1F
	brk $BF.b		; 00 BF
	cpy #$FF.b		; C0 FF
	sbc $1E3F40.l,X		; FF 40 3F 1E
	ror $0004.w,X		; 7E 04 00
	php		; 08
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	rti		; 40

	and $004000.l,X		; 3F 00 40 00
	adc $00FF7F.l,X		; 7F 7F FF 00
	trb $C100.w		; 1C 00 C1
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $77FF00.l,X		; FF 00 FF 77
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $30.b		; 00 30
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FD.b		; 00 FD
	ora $FF.b,S		; 03 FF
	sbc $78FC02.l,X		; FF 02 FC 78
	ror $0020.w,X		; 7E 20 00
	bpl   0.b		; 10 00
	php		; 08
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	cop $FC.b		; 02 FC
	brk $02.b		; 00 02
	brk $FE.b		; 00 FE
	inc $FFFF.w,X		; FE FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $01FF7F.l,X		; 7F 7F FF 01
	xce		; FB
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $7F0000.l,X		; FF 00 00 7F
	bra   1.b		; 80 01
	brk $FF.b		; 00 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sta $83.b,S		; 83 83
	sta $83.b,S		; 83 83
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $830000.l,X		; FF 00 00 83
	brk $FF.b		; 00 FF
	jmp ($7CFF.w,X)		; 7C FF 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FEFE.w,X		; FE FE FE
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	jsr ($00FE.w,X)		; FC FE 00
	inc $FE00.w,X		; FE 00 FE
	brk $3E.b		; 00 3E
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	inc $0000.w,X		; FE 00 00
	jsr ($0002.w,X)		; FC 02 00
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
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
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F1.b		; 00 F1
	ora $F1FFE8.l		; 0F E8 FF F1
	sbc $00FFE8.l,X		; FF E8 FF 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $E8.b		; 00 E8
	sbc $000002.l,X		; FF 02 00 00
	brk $F2.b		; 00 F2
	sbc $04FFF8.l,X		; FF F8 FF 04
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000006.l,X		; FF 06 00 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $1C.b		; 00 1C
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	cpy #$FF.b		; C0 FF
	sbc $040003.l,X		; FF 03 00 04
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	cpy #$3F.b		; C0 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $1F.b		; 00 1F
	brk $1E.b		; 00 1E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $70.b		; 00 70
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	asl $FE.b		; 06 FE
	inc $0080.w,X		; FE 80 00
	rti		; 40

	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	asl $F8.b		; 06 F8
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	bvs  16.b		; 70 10
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $000FEF.l		; 0F EF 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	bvs  64.b		; 70 40
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	bra -65.b		; 80 BF
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $0F6F00.l,X		; 3F 00 6F 0F
	adc $7F7F7F.l		; 6F 7F 7F 7F
	brk $FF.b		; 00 FF
	brk $5F.b		; 00 5F
	jsr $7F7F.w		; 20 7F 7F
	and $001040.l,X		; 3F 40 10 00
	adc $007F6F.l,X		; 7F 6F 7F 00
	adc $000000.l,X		; 7F 00 00 00
	brk $7F.b		; 00 7F
	adc $FFFF00.l,X		; 7F 00 FF FF
	brk $9F.b		; 00 9F
	sta $FFFF9F.l,X		; 9F 9F FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FF00.l,X		; FF 00 FF F0
	sbc $006000.l,X		; FF 00 60 00
	sbc $00FFC0.l,X		; FF C0 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	beq   0.b		; F0 00
	sbc $F300FF.l,X		; FF FF 00 F3
	sbc ($F3.b,S),Y		; F3 F3
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF1F.l,X		; FF 1F FF 00
	tsb $FF00.w		; 0C 00 FF
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F8001F.l,X		; FF 1F 00 F8
	sed		; F8
	brk $EC.b		; 00 EC
	cpx #$EC.b		; E0 EC
	jsr ($FCFC.w,X)		; FC FC FC
	brk $FE.b		; 00 FE
	brk $F4.b		; 00 F4
	php		; 08
	jsr ($F8FC.w,X)		; FC FC F8
	tsb $10.b		; 04 10
	brk $FC.b		; 00 FC
	cpx $00FC.w		; EC FC 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $80.b		; 06 80
	clc		; 18
	brk $EE.b		; 00 EE
	ora ($E2.b,S),Y		; 13 E2
	sbc $E2FFEE.l,X		; FF EE FF E2
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $02FFE2.l,X		; FF E2 FF 02
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $E2.b		; 00 E2
	sbc $000004.l,X		; FF 04 00 00
	brk $EE.b		; 00 EE
	sbc $06FFF2.l,X		; FF F2 FF 06
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $08FFF2.l,X		; FF F2 FF 08
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $F2.b		; 00 F2
	sbc $00000A.l,X		; FF 0A 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	brk $70.b		; 00 70
	adc $020001.l		; 6F 01 00 02
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	brk $3E.b		; 00 3E
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	lda $0100FE.l,X		; BF FE 00 01
	brk $01.b		; 00 01
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
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $38.b		; 00 38
	cld		; D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	brk $40.b		; 00 40
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	jsr $3F3F.w		; 20 3F 3F
	and $7F7F00.l,X		; 3F 00 7F 7F
	adc $007F7F.l,X		; 7F 7F 7F 00
	adc $00007F.l,X		; 7F 7F 00 00
	brk $7F.b		; 00 7F
	and $403F40.l,X		; 3F 40 3F 40
	brk $00.b		; 00 00
	adc $000000.l,X		; 7F 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FEFF00.l,X		; FF 00 FF FE
	inc $FE0F.w,X		; FE 0F FE
	sbc ($5E.b,X)		; E1 5E
	asl $00FF.w		; 0E FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	inc $FF00.w,X		; FE 00 FF
	brk $01.b		; 00 01
	brk $EF.b		; 00 EF
	cpx #$E0.b		; E0 E0
	cpx #$FF.b		; E0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FD.b,X)		; 01 FD
	ora $01.b,S		; 03 01
	cop $01.b		; 02 01
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0001.l,X		; FF 01 00 FF
	jsr ($FCFE.w,X)		; FC FE FC
	sbc $0000FC.l,X		; FF FC 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $3FFFC0.l,X		; FF C0 FF 3F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $E0.b		; 00 E0
	bpl -16.b		; 10 F0
	beq -16.b		; F0 F0
	brk $F8.b		; 00 F8
	beq  -8.b		; F0 F8
	sed		; F8
	sed		; F8
	brk $F8.b		; 00 F8
	sed		; F8
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	brk $00.b		; 00 00
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
	brk $80.b		; 00 80
	cpx #$5F.b		; E0 5F
	eor $003F3F.l,X		; 5F 3F 3F 00
	and $0F2F0F.l,X		; 3F 0F 2F 0F
	and $7F7F7F.l		; 2F 7F 7F 7F
	brk $00.b		; 00 00
	adc $3F201F.l,X		; 7F 1F 20 3F
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	adc $7F6F3F.l		; 6F 3F 6F 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $EFE3E3.l,X		; FF E3 E3 EF
	xba		; EB
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	xce		; FB
	jsr ($FCF3.w,X)		; FC F3 FC
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	cmp $FFFFCF.l		; CF CF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	ora $5FDF1F.l,X		; 1F 1F DF 5F
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	adc $FF3FFF.l,X		; 7F FF 3F FF
	sbc $00FF00.l,X		; FF 00 FF 00
	tsb $1C.b		; 04 1C
	inx		; E8
	inx		; E8
	beq -16.b		; F0 F0
	brk $F0.b		; 00 F0
	bra -80.b		; 80 B0
	bra -80.b		; 80 B0
	beq -16.b		; F0 F0
	sed		; F8
	brk $00.b		; 00 00
	sed		; F8
	cpx #$10.b		; E0 10
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	beq -72.b		; F0 B8
	beq -72.b		; F0 B8
	beq   8.b		; F0 08
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
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
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
	brk $00.b		; 00 00
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
	brk $E9.b		; 00 E9
	ora [$DD.b],Y		; 17 DD
	sbc $DDFFE9.l,X		; FF E9 FF DD
	sbc $000000.l,X		; FF 00 00 00
	brk $F9.b		; 00 F9
	sbc $02FFDD.l,X		; FF DD FF 02
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $DD.b		; 00 DD
	sbc $000004.l,X		; FF 04 00 00
	brk $EA.b		; 00 EA
	sbc $06FFED.l,X		; FF ED FF 06
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $08FFED.l,X		; FF ED FF 08
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $ED.b		; 00 ED
	sbc $00000A.l,X		; FF 0A 00 00
	brk $EA.b		; 00 EA
	sbc $0CFFFD.l,X		; FF FD FF 0C
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $FD.b		; 00 FD
	sbc $00000C.l,X		; FF 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $E0.b		; 00 E0
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $C7.b		; 00 C7
	brk $C7.b		; 00 C7
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
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
	brk $80.b		; 00 80
	brk $C3.b		; 00 C3
	brk $C3.b		; 00 C3
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $06.b		; 00 06
	brk $C6.b		; 00 C6
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $00.b		; 00 00
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $FF007F.l,X		; 3F 7F 00 FF
	brk $FF.b		; 00 FF
	brk $5F.b		; 00 5F
	jsr $7F7F.w		; 20 7F 7F
	adc $7F0000.l,X		; 7F 00 00 7F
	and $007F40.l,X		; 3F 40 7F 00
	adc $00007F.l,X		; 7F 7F 00 00
	brk $FF.b		; 00 FF
	adc $807F80.l,X		; 7F 80 7F 80
	ora [$08.b]		; 07 08
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	xce		; FB
	ora [$00.b]		; 07 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $7F.b		; 00 7F
	adc $FFFFFF.l,X		; 7F FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$FF.b		; C0 FF
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $BF00C0.l,X		; FF C0 00 BF
	and $FFF1F6.l,X		; 3F F6 F1 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $F00FFE.l,X		; 1F FE 0F F0
	ora $FF00FF.l		; 0F FF 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $EF001F.l,X		; FF 1F 00 EF
	cpx #$00.b		; E0 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$F0.b		; E0 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $D0.b		; 00 D0
	jsr $F0F0.w		; 20 F0 F0
	beq   0.b		; F0 00
	brk $F0.b		; 00 F0
	cpx #$10.b		; E0 10
	beq   0.b		; F0 00
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	beq   8.b		; F0 08
	beq   8.b		; F0 08
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $73.b,X		; 74 73
	sta $7070F0.l		; 8F F0 70 70
	ora $0F0F0F.l		; 0F 0F 0F 0F
	brk $0F.b		; 00 0F
	ora ($1D.b,X)		; 01 1D
	ora ($1D.b,X)		; 01 1D
	tsb $00.b		; 04 00
	ora $0F0070.l		; 0F 70 00 0F
	ora $100F00.l		; 0F 00 0F 10
	brk $10.b		; 00 10
	ora $3D1F3D.l,X		; 1F 3D 1F 3D
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	jsr ($FEFC.w,X)		; FC FC FE
	inc $0000.w,X		; FE 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FFFDFF.l,X		; FF FF FD FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	bit $7F3C.w,X		; 3C 3C 7F
	and $FF0000.l,X		; 3F 00 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	rti		; 40

	lda $FE0140.l,X		; BF 40 01 FE
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	sei		; 78
	sei		; 78
	inc $00FA.w,X		; FE FA 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	ora [$F9.b]		; 07 F9
	ora [$80.b]		; 07 80
	adc $0000FF.l,X		; 7F FF 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $5CFFFF.l,X		; FF FF FF 5C
	stz $1EE2.w		; 9C E2 1E
	trb $E01C.w		; 1C 1C E0
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	bvs   0.b		; 70 00
	bvs  64.b		; 70 40
	brk $E0.b		; 00 E0
	trb $E000.w		; 1C 00 E0
	cpx #$00.b		; E0 00
	cpx #$10.b		; E0 10
	brk $10.b		; 00 10
	beq 120.b		; F0 78
	beq 120.b		; F0 78
	adc $3FFF00.l,X		; 7F 00 FF 3F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FCFF03.l,X		; FF 03 FF FC
	sta [$81.b]		; 87 81
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $00C000.l,X		; FF 00 C0 00
	bra   0.b		; 80 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	sbc $547C.w,X		; FD 7C 54
	mvn $7C,$7C		; 54 7C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$80.b		; C0 80
	cpy #$00.b		; C0 00
	bra -128.b		; 80 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	lda $3F3F3F.l,X		; BF 3F 3F 3F
	sbc $00003F.l,X		; FF 3F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001F0E.l,X		; 1F 0E 1F 00
	ora $00FF0F.l		; 0F 0F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E0E0E0.l		; EF E0 E0 E0
	sbc $0000E0.l,X		; FF E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $000F00.l,X		; 1F 00 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	sed		; F8
	beq  -8.b		; F0 F8
	sed		; F8
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  44.b		; 80 2C
	brk $E6.b		; 00 E6
	tas		; 1B
	cmp [$FF.b],Y		; D7 FF
	sbc [$FF.b]		; E7 FF
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	beq  -1.b		; F0 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	beq  -1.b		; F0 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	ora [$00.b],Y		; 17 00
	beq  -1.b		; F0 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	inc $FF.b		; E6 FF
	cpx #$FF.b		; E0 FF
	php		; 08
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $0AFFE0.l,X		; FF E0 FF 0A
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $E0.b		; 00 E0
	sbc $00000C.l,X		; FF 0C 00 00
	brk $16.b		; 00 16
	brk $E0.b		; 00 E0
	sbc $00000E.l,X		; FF 0E 00 00
	brk $EB.b		; 00 EB
	sbc $20FFD0.l,X		; FF D0 FF 20
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $22FFD0.l,X		; FF D0 FF 22
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $D0.b		; 00 D0
	sbc $000024.l,X		; FF 24 00 00
	brk $4F.b		; 00 4F
	bmi 127.b		; 30 7F
	adc $7F007F.l,X		; 7F 7F 00 7F
	brk $FF.b		; 00 FF
	adc $FF0000.l,X		; 7F 00 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $7F807F.l,X		; FF 7F 80 7F
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF01FE.l,X		; FF FE 01 FF
	brk $FF.b		; 00 FF
	inc $0000.w,X		; FE 00 00
	cmp $C0.b,S		; C3 C0
	cmp [$00.b],Y		; D7 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $3EFE00.l,X		; FF 00 FE 3E
	rol A		; 2A
	rol A		; 2A
	sbc $F0FF00.l,X		; FF 00 FF F0
	sbc [$E8.b],Y		; F7 E8
	beq -24.b		; F0 E8
	beq   8.b		; F0 08
	php		; 08
	brk $F0.b		; 00 F0
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	sbc $EF00F0.l,X		; FF F0 00 EF
	ora [$EF.b]		; 07 EF
	ora [$0F.b]		; 07 0F
	ora [$F7.b]		; 07 F7
	ora [$FF.b]		; 07 FF
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FD.b,X)		; 01 FD
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FE0001.l,X		; FF 01 00 FE
	jsr ($FCFE.w,X)		; FC FE FC
	inc $FDFC.w,X		; FE FC FD
	jsr ($FCFF.w,X)		; FC FF FC
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $E0FFF0.l		; EF F0 FF E0
	sbc $00000F.l,X		; FF 0F 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	inc $FF01.w,X		; FE 01 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra -64.b		; 80 C0
	cpy #$C0.b		; C0 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	cpy #$00.b		; C0 00
	brk $E0.b		; 00 E0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	cpx #$C0.b		; E0 C0
	jsr $20C0.w		; 20 C0 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
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
	ora [$00.b]		; 07 00
	jmp ($8F7B.w,X)		; 7C 7B 8F
	beq -128.b		; F0 80
	beq 111.b		; F0 6F
	adc $001F1F.l		; 6F 1F 1F 00
	ora $043B03.l,X		; 1F 03 3B 04
	brk $04.b		; 00 04
	brk $0F.b		; 00 0F
	bvs   0.b		; 70 00
	adc $1F100F.l,X		; 7F 0F 10 1F
	jsr $2000.w		; 20 00 20
	and $00FF7B.l,X		; 3F 7B FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	inc $00FF.w,X		; FE FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $1F00FF.l,X		; 1F FF 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $00E000.l,X		; 1F 00 E0 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $E70800.l,X		; FF 00 08 E7
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FF.b		; C0 FF
	ora $C3.b,S		; 03 C3
	bpl  16.b		; 10 10
	clc		; 18
	clc		; 18
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$00.b		; C0 00
	and $00FF03.l,X		; 3F 03 FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	inc $0080.w,X		; FE 80 00
	sed		; F8
	sei		; 78
	cpy $3C.b		; C4 3C
	tsb $3C.b		; 04 3C
	clv		; B8
	clv		; B8
	cpy #$C0.b		; C0 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$38.b		; C0 38
	brk $F8.b		; 00 F8
	bra  64.b		; 80 40
	cpy #$20.b		; C0 20
	brk $20.b		; 00 20
	cpx #$F0.b		; E0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	beq   0.b		; F0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	rol $003E.w,X		; 3E 3E 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
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
	brk $03.b		; 00 03
	tsa		; 3B
	ora $3B.b,S		; 03 3B
	brk $00.b		; 00 00
	and $007F3F.l,X		; 3F 3F 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7B3F00.l,X		; FF 00 3F 7B
	and $7F007B.l,X		; 3F 7B 00 7F
	and $007F40.l,X		; 3F 40 7F 00
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	inc $FFFE.w,X		; FE FE FF
	sbc $FF0201.l,X		; FF 01 02 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFE.l,X		; FF FE FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $1F.b		; 00 1F
	ora $DF1F3F.l,X		; 1F 3F 1F DF
	ora $FFFFFF.l,X		; 1F FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	cpx #$DF.b		; E0 DF
	cpx #$1F.b		; E0 1F
	cpx #$FF.b		; E0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $8F.b		; 00 8F
	sta $FFFFFF.l		; 8F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $C3.b		; 00 C3
	cmp $F3.b,S		; C3 F3
	cmp ($CC.b,S),Y		; D3 CC
	bne  -1.b		; D0 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	and $C03FCF.l,X		; 3F CF 3F C0
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $FF00FE.l,X		; FF FE 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	beq   0.b		; F0 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $E0.b		; 00 E0
	beq -32.b		; F0 E0
	beq   0.b		; F0 00
	beq -32.b		; F0 E0
	bpl -16.b		; 10 F0
	brk $F0.b		; 00 F0
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
	brk $07.b		; 00 07
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
	brk $FF.b		; 00 FF
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
	brk $FF.b		; 00 FF
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	ora $1E.b,S		; 03 1E
	asl $3C.b		; 06 3C
	tsb $0C3C.w		; 0C 3C 0C
	sei		; 78
	clc		; 18
	sei		; 78
	clc		; 18
	sbc $00081F.l,X		; FF 1F 08 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	jsr $2000.w		; 20 00 20
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $1C0000.l,X		; FF 00 00 1C
	trb $3E3E.w		; 1C 3E 3E
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	asl $06.b		; 06 06
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sta [$87.b]		; 87 87
	sta [$87.b]		; 87 87
	ora $0F0F0F.l		; 0F 0F 0F 0F
	sbc $0000FC.l,X		; FF FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FCFF00.l,X		; FF 00 FF FC
	ora [$02.b]		; 07 02
	sbc [$E3.b]		; E7 E3
	sbc $C1F9E3.l		; EF E3 F9 C1
	sbc $FF31.w,Y		; F9 31 FF
	sbc $000001.l,X		; FF 01 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	bra -32.b		; 80 E0
	bra -16.b		; 80 F0
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $0C.b		; 00 0C
	bra  44.b		; 80 2C
	brk $E2.b		; 00 E2
	ora $E2FFD1.l,X		; 1F D1 FF E2
	sbc $00FFD1.l,X		; FF D1 FF 00
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $02FFD1.l,X		; FF D1 FF 02
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $D1.b		; 00 D1
	sbc $000004.l,X		; FF 04 00 00
	brk $12.b		; 00 12
	brk $D1.b		; 00 D1
	sbc $000006.l,X		; FF 06 00 00
	brk $E3.b		; 00 E3
	sbc $08FFE1.l,X		; FF E1 FF 08
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $0AFFE1.l,X		; FF E1 FF 0A
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $E1.b		; 00 E1
	sbc $004008.l,X		; FF 08 40 00
	brk $FF.b		; 00 FF
	sbc $0CFFE1.l,X		; FF E1 FF 0C
	brk $00.b		; 00 00
	brk $E4.b		; 00 E4
	sbc $0EFFF1.l,X		; FF F1 FF 0E
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $20FFF1.l,X		; FF F1 FF 20
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F1.b		; 00 F1
	sbc $000022.l,X		; FF 22 00 00
	brk $14.b		; 00 14
	brk $F1.b		; 00 F1
	sbc $000024.l,X		; FF 24 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	ora [$3F.b]		; 07 3F
	ora $780C3C.l		; 0F 3C 0C 78
	clc		; 18
	sei		; 78
	clc		; 18
	sed		; F8
	sec		; 38
	ora [$00.b]		; 07 00
	clc		; 18
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $3C.b		; 00 3C
	bit $3C3C.w,X		; 3C 3C 3C
	ror $FF7E.w,X		; 7E 7E FF
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
	sbc $03FFFF.l,X		; FF FF FF 03
	ora $0F.b,S		; 03 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $0000FF.l		; 0F FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $C0.b		; 00 C0
	cpy #$C1.b		; C0 C1
	cmp ($C1.b,X)		; C1 C1
	cmp ($FF.b,X)		; C1 FF
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
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sed		; F8
	sbc $FFF8.w,Y		; F9 F8 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	bra -16.b		; 80 F0
	rti		; 40

	beq  64.b		; F0 40
	sed		; F8
	rts		; 60

	sed		; F8
	rts		; 60

	jmp ($8070.w,X)		; 7C 70 80
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $08.b		; 00 08
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $001F1F.l		; 0F 1F 1F 00
	ora $013D01.l,X		; 1F 01 3D 01
	and $3D01.w,X		; 3D 01 3D
	brk $00.b		; 00 00
	and $100F3F.l,X		; 3F 3F 0F 10
	ora $200020.l,X		; 1F 20 00 20
	and $7D3F7D.l,X		; 3F 7D 3F 7D
	and $7F007D.l,X		; 3F 7D 00 7F
	and $FFFF40.l,X		; 3F 40 FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF03FF.l,X		; FF FF 03 FF
	bra -125.b		; 80 83
	cmp $C3.b,S		; C3 C3
	cmp [$C3.b]		; C7 C3
	tda		; 7B
	sta $FF.b,S		; 83 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	bra -69.b		; 80 BB
	pea $F4BB.w		; F4 BB F4
	ora $FC.b,S		; 03 FC
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	beq -16.b		; F0 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	ora $FFFF0F.l		; 0F 0F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FF.b		; C0 FF
	ora ($C1.b,X)		; 01 C1
	cmp ($C1.b,X)		; C1 C1
	sbc #$C9.b		; E9 C9
	dec $C8.b,X		; D6 C8
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00C000.l,X		; FF 00 C0 00
	and $2FDF01.l,X		; 3F 01 DF 2F
	cmp [$2F.b],Y		; D7 2F
	cpy #$3F.b		; C0 3F
	sbc $007F00.l,X		; FF 00 7F 00
	adc $7FFF00.l,X		; 7F 00 FF 7F
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $800080.l,X		; 7F 80 00 80
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	cpx $E0.b		; E4 E0
	sbc $FF00.w		; ED 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $1F1616.l,X		; 1F 16 16 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $7A.b		; 00 7A
	adc $F887.w,Y		; 79 87 F8
	bra  -8.b		; 80 F8
	sbc [$F7.b],Y		; F7 F7
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	ora [$78.b]		; 07 78
	brk $7F.b		; 00 7F
	ora [$08.b]		; 07 08
	beq  48.b		; F0 30
	beq 112.b		; F0 70
	sbc $00FF7F.l,X		; FF 7F FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $0080FF.l,X		; FF FF 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $030300.l,X		; FF 00 03 03
	ora $03.b,S		; 03 03
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $F8FF00.l,X		; FF 00 FF F8
	sbc $FFE4.w,X		; FD E4 FF
	sta $2000FF.l,X		; 9F FF 00 20
	sta $0000FF.l,X		; 9F FF 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	rts		; 60

	rts		; 60

	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $303C00.l,X		; FF 00 3C 30
	rol $FE38.w,X		; 3E 38 FE
	sed		; F8
	sbc $FE0100.l,X		; FF 00 01 FE
	sbc $000000.l,X		; FF 00 00 00
	sbc $0004FF.l,X		; FF FF 04 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sty $7C.b		; 84 7C
	tsb $7C.b		; 04 7C
	ldy $00BC.w,X		; BC BC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sei		; 78
	brk $F8.b		; 00 F8
	bra  64.b		; 80 40
	and $007F3F.l,X		; 3F 3F 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $182700.l,X		; FF 00 27 18
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $007F40.l,X		; 3F 40 7F 00
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	and $403F40.l,X		; 3F 40 3F 40
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $007F00.l,X		; FF 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00F800.l,X		; FF 00 F8 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
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
	ldx $FE7D.w,Y		; BE 7D FE
	and $81FE.w,X		; 3D FE 81
	ora ($00.b,X)		; 01 00
	jsr ($FF3C.w,X)		; FC 3C FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $7D.b		; 00 7D
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	brk $BF.b		; 00 BF
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	and $1F2F1F.l		; 2F 1F 2F 1F
	jsr $0020.w		; 20 20 00
	ora $00FF0F.l		; 0F 0F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0EFC0.l		; EF C0 EF C0
	cpx #$C0.b		; E0 C0
	cmp $C0FFC0.l,X		; DF C0 FF C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00007F.l,X		; FF 7F 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $008000.l,X		; FF 00 80 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bra  64.b		; 80 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	sbc $000700.l,X		; FF 00 07 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
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
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	plx		; FA
	ora [$F6.b]		; 07 F6
	sbc $F6FFFA.l,X		; FF FA FF F6
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F6.b		; 00 F6
	sbc $000001.l,X		; FF 01 00 00
	brk $FB.b		; 00 FB
	sbc $02FFFE.l,X		; FF FE FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000002.l,X		; FF 02 00 00
	brk $1F.b		; 00 1F
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	rti		; 40

	brk $3F.b		; 00 3F
	pha		; 48
	brk $7F.b		; 00 7F
	brk $5F.b		; 00 5F
	eor $00007F.l,X		; 5F 7F 00 00
	brk $28.b		; 00 28
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	brk $40.b		; 00 40
	and [$00.b],Y		; 37 00
	brk $60.b		; 00 60
	rts		; 60

	adc $00E000.l,X		; 7F 00 E0 00
	bpl   0.b		; 10 00
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	pha		; 48
	brk $F8.b		; 00 F8
	brk $E8.b		; 00 E8
	iny		; C8
	sed		; F8
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	rti		; 40

	sed		; F8
	tsb $F8.b		; 04 F8
	brk $08.b		; 00 08
	bcs   0.b		; B0 00
	brk $38.b		; 00 38
	clc		; 18
	sed		; F8
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
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $F8.b		; 00 F8
	php		; 08
	sbc ($FF.b,S),Y		; F3 FF
	sed		; F8
	sbc $00FFF3.l,X		; FF F3 FF 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $F3.b		; 00 F3
	sbc $000002.l,X		; FF 02 00 00
	brk $0F.b		; 00 0F
	bpl   4.b		; 10 04
	jsr $31A4.w		; 20 A4 31
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	ora $403F40.l		; 0F 40 3F 40
	sbc $001000.l,X		; FF 00 10 00
	bit $00.b		; 24 00
	asl $7FC0.w		; 0E C0 7F
	brk $7F.b		; 00 7F
	brk $C0.b		; 00 C0
	and [$C0.b],Y		; 37 C0
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	tsb $00.b		; 04 00
	cop $1A.b		; 02 1A
	cpy $00.b		; C4 00
	brk $00.b		; 00 00
	inc $01F8.w,X		; FE F8 01
	inc $FF01.w,X		; FE 01 FF
	brk $04.b		; 00 04
	brk $12.b		; 00 12
	bpl  40.b		; 10 28
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $01.b,X		; F6 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	eor [$7F.b],Y		; 57 7F
	brk $E3.b		; 00 E3
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $68.b		; 00 68
	cpx #$FF.b		; E0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $FF.b,X		; F5 FF
	brk $E3.b		; 00 E3
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	ora $FF.b,S		; 03 FF
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
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	asl $F6.b		; 06 F6
	sbc $F6FFFA.l,X		; FF FA FF F6
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F6.b		; 00 F6
	sbc $000001.l,X		; FF 01 00 00
	brk $FA.b		; 00 FA
	sbc $02FFFE.l,X		; FF FE FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000002.l,X		; FF 02 00 00
	brk $3F.b		; 00 3F
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	bra   7.b		; 80 07
	sbc $FFFF7F.l,X		; FF 7F FF FF
	brk $6D.b		; 00 6D
	php		; 08
	sbc $000000.l,X		; FF 00 00 00
	rti		; 40

	brk $00.b		; 00 00
	sbc $FF0007.l,X		; FF 07 00 FF
	cpx #$00.b		; E0 00
	brk $7F.b		; 00 7F
	sta [$00.b],Y		; 97 00
	brk $E0.b		; 00 E0
	brk $B0.b		; 00 B0
	brk $00.b		; 00 00
	php		; 08
	brk $F8.b		; 00 F8
	beq  -8.b		; F0 F8
	sed		; F8
	brk $F0.b		; 00 F0
	bra  -8.b		; 80 F8
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	sed		; F8
	brk $00.b		; 00 00
	sed		; F8
	sec		; 38
	brk $00.b		; 00 00
	beq   8.b		; F0 08
	brk $00.b		; 00 00
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
	ora ($80.b,X)		; 01 80
	tsb $00.b		; 04 00
	sbc $F307.w,Y		; F9 07 F3
	sbc $F3FFF9.l,X		; FF F9 FF F3
	sbc $000000.l,X		; FF 00 00 00
	brk $3F.b		; 00 3F
	brk $6E.b		; 00 6E
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $FFF377.l,X		; FF 77 F3 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	sbc $FB0000.l,X		; FF 00 00 FB
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	sed		; F8
	brk $EC.b		; 00 EC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	inc $9EDC.w,X		; FE DC 9E
	inc $FE00.w,X		; FE 00 FE
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	inc $0000.w,X		; FE 00 00
	ldx $FE7E.w,Y		; BE 7E FE
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	tsb $EC.b		; 04 EC
	cpx $FF.b		; E4 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tas		; 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $7E40.w,X		; 7E 40 7E
	ror $00FE.w,X		; 7E FE 00
	asl $0E00.w		; 0E 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	asl $F7.b		; 06 F7
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000001.l,X		; FF 01 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	pha		; 48
	and $8F3A.w,X		; 3D 3A 8F
	bra  45.b		; 80 2D
	cpx #$FF.b		; E0 FF
	ora $DF00FF.l		; 0F FF 00 DF
	brk $40.b		; 00 40
	bra  40.b		; 80 28
	cli		; 58
	rti		; 40

	brk $7F.b		; 00 7F
	cop $00.b		; 02 00
	sbc $FFF0F0.l,X		; FF F0 F0 FF
	sbc $40DFDF.l,X		; FF DF DF 40
	cpy #$C0.b		; C0 C0
	bcs -16.b		; B0 F0
	cpx #$88.b		; E0 88
	php		; 08
	tay		; A8
	bmi  -8.b		; 30 F8
	bra  -8.b		; 80 F8
	brk $D0.b		; 00 D0
	php		; 08
	bpl   8.b		; 10 08
	bra -16.b		; 80 F0
	bpl  16.b		; 10 10
	beq   0.b		; F0 00
	php		; 08
	sed		; F8
	sei		; 78
	sei		; 78
	sed		; F8
	sed		; F8
	bne -40.b		; D0 D8
	bpl  24.b		; 10 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $0400.w,X		; FE 00 04
	brk $04.b		; 00 04
	brk $F9.b		; 00 F9
	ora [$F4.b]		; 07 F4
	sbc $F4FFF9.l,X		; FF F9 FF F4
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	brk $F4.b		; 00 F4
	sbc $000001.l,X		; FF 01 00 00
	brk $F9.b		; 00 F9
	sbc $02FFFC.l,X		; FF FC FF 02
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	sbc $000003.l,X		; FF 03 00 00
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $5C.b		; 00 5C
	tay		; A8
	and ($3D.b)		; 32 3D
	bra 120.b		; 80 78
	ldy #$68.b		; A0 68
	ora [$F8.b]		; 07 F8
	bra 127.b		; 80 7F
	ora $0F3000.l,X		; 1F 00 30 0F
	cli		; 58
	ldy $0040.w		; AC 40 00
	sta [$00.b]		; 87 00
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	sbc $00F0FF.l,X		; FF FF F0 00
	sed		; F8
	brk $3E.b		; 00 3E
	jsr $7898.w		; 20 98 78
	cop $3C.b		; 02 3C
	asl A		; 0A
	bit $3EC0.w		; 2C C0 3E
	cop $FC.b		; 02 FC
	beq   0.b		; F0 00
	clc		; 18
	cpx #$2E.b		; E0 2E
	rol $04.b,X		; 36 04
	brk $C2.b		; 00 C2
	brk $02.b		; 00 02
	jsr ($FE00.w,X)		; FC 00 FE
	inc $FCFE.w,X		; FE FE FC
	brk $DF.b		; 00 DF
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	jsr ($FFDF.w,X)		; FC DF FF
	cpy #$C0.b		; C0 C0
	rti		; 40

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	brk $F6.b		; 00 F6
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ror $F6F6.w,X		; 7E F6 F6
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	phd		; 0B
	inc $F5FF.w		; EE FF F5
	sbc $00FFEE.l,X		; FF EE FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFEE.l,X		; FF EE FF 01
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $EE.b		; 00 EE
	sbc $000002.l,X		; FF 02 00 00
	brk $F5.b		; 00 F5
	sbc $03FFF6.l,X		; FF F6 FF 03
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $04FFF6.l,X		; FF F6 FF 04
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $F6.b		; 00 F6
	sbc $000005.l,X		; FF 05 00 00
	brk $F5.b		; 00 F5
	sbc $06FFFE.l,X		; FF FE FF 06
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $FE.b		; 00 FE
	sbc $000006.l,X		; FF 06 00 00
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $13.b		; 00 13
	php		; 08
	ora ($CF.b,S),Y		; 13 CF
	bmi -57.b		; 30 C7
	and $010D.w		; 2D 0D 01
	eor $0F4041.l,X		; 5F 41 40 0F
	brk $18.b		; 00 18
	ora [$10.b]		; 07 10
	phd		; 0B
	ora ($CF.b,S),Y		; 13 CF
	and [$C0.b],Y		; 37 C0
	and ($20.b)		; 32 20
	jsr $3F00.w		; 20 00 3F
	brk $FF.b		; 00 FF
	brk $C7.b		; 00 C7
	sec		; 38
	ora ($00.b,X)		; 01 00
	ora $01.b,S		; 03 01
	brk $FF.b		; 00 FF
	adc $FF93.w		; 6D 93 FF
	sbc $FF00FF.l		; EF FF 00 FF
	brk $00.b		; 00 00
	sbc $010100.l,X		; FF 00 01 01
	ora $01.b,S		; 03 01
	sbc $000000.l,X		; FF 00 00 00
	bpl  -1.b		; 10 FF
	bpl -32.b		; 10 E0
	brk $F0.b		; 00 F0
	brk $90.b		; 00 90
	jsr $E690.w		; 20 90 E6
	clc		; 18
	dec $E8.b		; C6 E8
	cpx #$00.b		; E0 00
	pea $0404.w		; F4 04 04
	cpx #$00.b		; E0 00
	bmi -64.b		; 30 C0
	bpl -96.b		; 10 A0
	bcc -26.b		; 90 E6
	cli		; 58
	dec $18.b		; C6 18
	php		; 08
	php		; 08
	brk $F8.b		; 00 F8
	brk $CA.b		; 00 CA
	pld		; 2B
	phb		; 8B
	rol A		; 2A
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$3F.b		; C0 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$00.b],Y		; F7 00
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	inc $FF01.w,X		; FE 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F7FFFF.l,X		; FF FF FF F7
	sbc [$C6.b],Y		; F7 C6
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $C7.b		; 00 C7
	brk $00.b		; 00 00
	sbc $FF38FF.l,X		; FF FF 38 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $EEFFEE.l,X		; FF EE FF EE
	sbc $FFFF01.l,X		; FF 01 FF FF
	sbc $FFC7C7.l,X		; FF C7 C7 FF
	sbc $56FFFF.l,X		; FF FF FF 56
	cli		; 58
	eor ($58.b)		; 52 58
	inc $FE00.w,X		; FE 00 FE
	brk $06.b		; 00 06
	sed		; F8
	inc $FE00.w,X		; FE 00 FE
	brk $DE.b		; 00 DE
	brk $02.b		; 00 02
	jsr ($FE02.w,X)		; FC 02 FE
	inc $FE00.w,X		; FE 00 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $DEDE.w,X		; FE DE DE
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	sbc ($0F.b),Y		; F1 0F
	sbc #$FF.b		; E9 FF
	sbc ($FF.b),Y		; F1 FF
	sbc #$FF.b		; E9 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc #$FF.b		; E9 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	sbc $04FF.w,Y		; F9 FF 04
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $F9.b		; 00 F9
	sbc $000006.l,X		; FF 06 00 00
	brk $03.b		; 00 03
	cop $05.b		; 02 05
	tsb $04.b		; 04 04
	asl $0E.b		; 06 0E
	php		; 08
	ora $4C3A68.l		; 0F 68 3A 4C
	bpl  15.b		; 10 0F
	bmi  15.b		; 30 0F
	ora ($00.b,X)		; 01 00
	cop $01.b		; 02 01
	brk $02.b		; 00 02
	asl $02.b		; 06 02
	ora $63.b		; 05 63
	bmi 102.b		; 30 66
	bpl  15.b		; 10 0F
	bmi  16.b		; 30 10
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	rts		; 60

	brk $60.b		; 00 60
	rts		; 60

	cpx #$20.b		; E0 20
	asl $C4E1.w		; 0E E1 C4
	xce		; FB
	sbc $FF0300.l,X		; FF 00 03 FF
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	cpx #$E0.b		; E0 E0
	bpl -32.b		; 10 E0
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	tsb $1E00.w		; 0C 00 1E
	php		; 08
	ora $0C0E0C.l,X		; 1F 0C 0E 0C
	cpx #$0F.b		; E0 0F
	lsr $BF.b		; 46 BF
	sbc $FF8000.l,X		; FF 00 80 FF
	tsb $1E0C.w		; 0C 0C 1E
	asl $1F1F.w,X		; 1E 1F 1F
	cop $02.b		; 02 02
	bpl  15.b		; 10 0F
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rti		; 40

	rti		; 40

	rti		; 40

	cpy #$A0.b		; C0 A0
	jsr $24A8.w		; 20 A8 24
	clv		; B8
	stz $10.b		; 64 10
	cpx #$18.b		; E0 18
	cpx #$00.b		; E0 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	bra  72.b		; 80 48
	sty $CC18.w		; 8C 18 CC
	bpl -32.b		; 10 E0
	clc		; 18
	bpl  -1.b		; 10 FF
	brk $F3.b		; 00 F3
	brk $7F.b		; 00 7F
	brk $79.b		; 00 79
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $38.b		; 00 38
	rti		; 40

	brk $00.b		; 00 00
	sbc $FFF3FF.l,X		; FF FF F3 FF
	adc $79797F.l,X		; 7F 7F 79 79
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sec		; 38
	sei		; 78
	brk $00.b		; 00 00
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFAFA.l,X		; FF FA FA FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	cpy #$3F.b		; C0 3F
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFBFBF.l,X		; FF BF BF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $3E.b		; 00 3E
	brk $FC.b		; 00 FC
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $38.b		; 00 38
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	inc $FE3E.w,X		; FE 3E FE
	jsr ($3CFC.w,X)		; FC FC 3C
	bit $3C3C.w,X		; 3C 3C 3C
	bit $383C.w,X		; 3C 3C 38
	bit $0000.w,X		; 3C 00 00
	and ($2D.b)		; 32 2D
	rts		; 60

	jsr $007F.w		; 20 7F 00
	cmp $891F.w		; CD 1F 89
	tas		; 1B
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00101F.l,X		; FF 1F 10 00
	eor $3F7F00.l,X		; 5F 00 7F 3F
	cpy #$7F.b		; C0 7F
	bra 127.b		; 80 7F
	sbc $FFFF00.l,X		; FF 00 FF FF
	cpx #$00.b		; E0 00
	rol $7FBE.w,X		; 3E BE 7F
	brk $F9.b		; 00 F9
	ora ($BF.b,X)		; 01 BF
	cpy #$3F.b		; C0 3F
	rti		; 40

	sbc $01F900.l,X		; FF 00 F9 01
	sbc $0140FF.l,X		; FF FF 40 01
	sbc $FFE001.l,X		; FF 01 E0 FF
	asl $1EFF.w,X		; 1E FF 1E
	sbc $E03FDE.l,X		; FF DE 3F E0
	sbc $F80000.l,X		; FF 00 00 F8
	xce		; FB
	jsr ($3700.w,X)		; FC 00 37
	php		; 08
	xce		; FB
	ora [$FA.b]		; 07 FA
	asl $FF.b		; 06 FF
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	sbc $FF0004.l,X		; FF 04 00 FF
	brk $07.b		; 00 07
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $0FF8F7.l,X		; FF F7 F8 0F
	sbc $980000.l,X		; FF 00 00 98
	pla		; 68
	tsb $FC08.w		; 0C 08 FC
	brk $66.b		; 00 66
	beq  66.b		; F0 42
	bne  -2.b		; D0 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	beq  16.b		; F0 10
	brk $F4.b		; 00 F4
	brk $FC.b		; 00 FC
	sed		; F8
	asl $FC.b		; 06 FC
	cop $FC.b		; 02 FC
	inc $FE00.w,X		; FE 00 FE
	inc $000E.w,X		; FE 0E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $80.b		; 06 80
	trb $00.b		; 14 00
	inc $E413.w		; EE 13 E4
	sbc $E4FFEE.l,X		; FF EE FF E4
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $02FFE4.l,X		; FF E4 FF 02
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $E4.b		; 00 E4
	sbc $000004.l,X		; FF 04 00 00
	brk $EE.b		; 00 EE
	sbc $06FFF4.l,X		; FF F4 FF 06
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $08FFF4.l,X		; FF F4 FF 08
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F4.b		; 00 F4
	sbc $004006.l,X		; FF 06 40 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	ora ($03.b,X)		; 01 03
	ora ($06.b,X)		; 01 06
	ora $06.b,S		; 03 06
	ora $06.b,S		; 03 06
	ora $0C.b,S		; 03 0C
	sbc $0C.b		; E5 0C
	sbc ($01.b),Y		; F1 01
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	ora ($04.b,X)		; 01 04
	ora ($04.b,X)		; 01 04
	ora ($0A.b,X)		; 01 0A
	sbc ($0E.b,X)		; E1 0E
	sbc $FF.b,X		; F5 FF
	sbc $7FFF00.l,X		; FF 00 FF 7F
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	clv		; B8
	bcc 120.b		; 90 78
	tay		; A8
	sei		; 78
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $B8.b		; 00 B8
	bpl  -8.b		; 10 F8
	plp		; 28
	sed		; F8
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sta [$78.b]		; 87 78
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	inc $03FC.w,X		; FE FC 03
	inc $06FB.w,X		; FE FB 06
	phd		; 0B
	cmp $C5.b		; C5 C5
	xba		; EB
	cmp $FB.b		; C5 FB
	cpy $EA.b		; C4 EA
	brk $FE.b		; 00 FE
	cop $00.b		; 02 00
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	cop $CC.b		; 02 CC
	cpy #$EE.b		; C0 EE
	cpy #$FE.b		; C0 FE
	ora ($2E.b,X)		; 01 2E
	ora ($FE.b,X)		; 01 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$9C.b		; C0 9C
	cpy #$3C.b		; C0 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	trb $BCC0.w		; 1C C0 BC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ply		; 7A
	cop $7F.b		; 02 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $78FFFF.l,X		; FF FF FF 78
	adc $FB7F7F.l,X		; 7F 7F 7F FB
	tsb $F6.b		; 04 F6
	php		; 08
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc ($0F.b,S),Y		; F3 0F
	sed		; F8
	sbc [$FF.b],Y		; F7 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $DFFFFF.l,X		; FF FF FF DF
	brk $79.b		; 00 79
	sei		; 78
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $4CB300.l,X		; FF 00 B3 4C
	phk		; 4B
	ldy $FF.b,X		; B4 FF
	brk $CF.b		; 00 CF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $4F.b,S		; 03 4F
	sbc $FFFFB7.l,X		; FF B7 FF FF
	sbc $BF807F.l,X		; FF 7F 80 BF
	rti		; 40

	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF01.w,X		; FD 01 FF
	brk $3F.b		; 00 3F
	cpy #$7F.b		; C0 7F
	lda $00FFFF.l,X		; BF FF FF 00
	brk $FF.b		; 00 FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	sbc $1BFFFF.l,X		; FF FF FF 1B
	ora $3C.b,S		; 03 3C
	ora [$39.b]		; 07 39
	asl $70.b		; 06 70
	jsr $007F.w		; 20 7F 00
	cpx #$19.b		; E0 19
	inc $37.b		; E6 37
	ldx $37.b		; A6 37
	trb $3808.w		; 1C 08 38
	php		; 08
	sec		; 38
	bpl  95.b		; 10 5F
	bpl 127.b		; 10 7F
	bpl -64.b		; 10 C0
	adc $807F80.l,X		; 7F 80 7F 80
	adc $30DCDB.l,X		; 7F DB DC 30
	sbc $1F6F8F.l,X		; FF 8F 6F 1F
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	tya		; 98
	adc $706F70.l		; 6F 70 6F 70
	jsr $0000.w		; 20 00 00
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$00.b]		; 07 00
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $CC30CF.l,X		; FF CF 30 CC
	ora $EF.b,S		; 03 EF
	cmp $FF00FF.l		; CF FF 00 FF
	brk $79.b		; 00 79
	sei		; 78
	cmp $00DF00.l,X		; DF 00 DF 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	brk $30.b		; 00 30
	sbc $FFFF30.l,X		; FF 30 FF FF
	brk $FF.b		; 00 FF
	cmp $FFCFFF.l		; CF FF CF FF
	adc $DF10EF.l		; 6F EF 10 DF
	inc $F9.b		; E6 F9
	cpy #$00.b		; C0 00
	sbc $668000.l,X		; FF 00 80 66
	cmp $D93B.w,Y		; D9 3B D9
	tsa		; 3B
	bpl   0.b		; 10 00
	jsr $0000.w		; 20 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra   0.b		; 80 00
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $F00060.l,X		; FF 60 00 F0
	bra 112.b		; 80 70
	bra  56.b		; 80 38
	bpl  -8.b		; 10 F8
	brk $1C.b		; 00 1C
	rts		; 60

	stz $94B0.w		; 9C B0 94
	bcs -32.b		; B0 E0
	rti		; 40

	bvs  64.b		; 70 40
	bvs  32.b		; 70 20
	inx		; E8
	jsr $20F8.w		; 20 F8 20
	tsb $04F8.w		; 0C F8 04
	sed		; F8
	tsb $F8.b		; 04 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($7C00.w,X)		; 7C 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	jmp ($7C7C.w,X)		; 7C 7C 7C
	jmp ($7C7C.w,X)		; 7C 7C 7C
	jmp ($0000.w,X)		; 7C 00 00
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
	ora $00001F.l,X		; 1F 1F 00 00
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
	sbc $0000FF.l,X		; FF FF 00 00
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
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	bra  28.b		; 80 1C
	brk $EA.b		; 00 EA
	ora [$DE.b],Y		; 17 DE
	sbc $F0FFEA.l,X		; FF EA FF F0
	sbc $000000.l,X		; FF 00 00 00
	brk $FA.b		; 00 FA
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $F0.b		; 00 F0
	sbc $000004.l,X		; FF 04 00 00
	brk $EA.b		; 00 EA
	sbc $06FFE0.l,X		; FF E0 FF 06
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $08FFE0.l,X		; FF E0 FF 08
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $E0.b		; 00 E0
	sbc $00000A.l,X		; FF 0A 00 00
	brk $F3.b		; 00 F3
	sbc $0CFFD0.l,X		; FF D0 FF 0C
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0CFFD0.l,X		; FF D0 FF 0C
	rti		; 40

	brk $00.b		; 00 00
	sbc #$05.b		; E9 05
	inx		; E8
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $C0.b		; 00 C0
	and $FF7FC0.l,X		; 3F C0 7F FF
	brk $FF.b		; 00 FF
	sbc $E0FFFF.l,X		; FF FF FF E0
	brk $FF.b		; 00 FF
	sbc $99FFFF.l,X		; FF FF FF 99
	txs		; 9A
	ora ($66.b,X)		; 01 66
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FF01.w,X		; FE 01 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $FDFFFF.l,X		; FF FF FF FD
	brk $FD.b		; 00 FD
	brk $79.b		; 00 79
	sty $C0.b		; 84 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $EC00FF.l,X		; FF FF 00 EC
	ora ($FC.b,S),Y		; 13 FC
	sbc $78FFFC.l,X		; FF FC FF 78
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	cpx #$F3.b		; E0 F3
	sbc $FE01FE.l,X		; FF FE 01 FE
	ora ($FB.b,X)		; 01 FB
	tsb $0F.b		; 04 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $5F00FF.l,X		; FF FF 00 5F
	ldy #$FC.b		; A0 FC
	sbc $F9FFFC.l,X		; FF FC FF F9
	inc $FF03.w,X		; FE 03 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFBF1F.l,X		; FF 1F BF FF
	ror $66.b		; 66 66
	brk $99.b		; 00 99
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	jmp $805C80.l		; 5C 80 5C 80
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $9C.b		; 00 9C
	cpx #$FC.b		; E0 FC
	brk $FC.b		; 00 FC
	brk $0C.b		; 00 0C
	sed		; F8
	tsb $FCF8.w		; 0C F8 FC
	brk $FC.b		; 00 FC
	jsr ($FCFC.w,X)		; FC FC FC
	trb $FC00.w		; 1C 00 FC
	jsr ($FCFC.w,X)		; FC FC FC
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	tad		; 5B
	and $3B.b,S		; 23 3B
	eor $5E.b,S		; 43 5E
	jsl $00030C.l		; 22 0C 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $58.b		; 00 58
	sei		; 78
	clc		; 18
	sei		; 78
	eor $0C78.w,X		; 5D 78 0C
	ora $DF.b,S		; 03 DF
	cpx #$BF.b		; E0 BF
	cpy #$A0.b		; C0 A0
	cpy #$20.b		; C0 20
	cmp [$42.b]		; C7 42
	lda [$45.b]		; A7 45
	lda [$47.b],Y		; B7 47
	lda $00FF00.l		; AF 00 FF 00
	and $007F00.l,X		; 3F 00 7F 00
	rts		; 60

	brk $E7.b		; 00 E7
	cop $E7.b		; 02 E7
	ora $F7.b		; 05 F7
	ora [$E8.b]		; 07 E8
	brk $FF.b		; 00 FF
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	ora [$02.b]		; 07 02
	ora $050F07.l		; 0F 07 0F 05
	ora $300707.l		; 0F 07 07 30
	sbc ($00.b,S),Y		; F3 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$02.b]		; 07 02
	ora $050F07.l		; 0F 07 0F 05
	ora $0C0000.l		; 0F 00 00 0C
	ora $EC.b,S		; 03 EC
	trb $0EF6.w		; 1C F6 0E
	asl $0E.b,X		; 16 0E
	ora $9F.b,S		; 03 9F
	phd		; 0B
	lda [$0B.b],Y		; B7 0B
	sbc [$09.b],Y		; F7 09
	sta $01.b,X		; 95 01
	inc $F000.w,X		; FE 00 F0
	brk $F8.b		; 00 F8
	brk $18.b		; 00 18
	brk $9C.b		; 00 9C
	brk $BC.b		; 00 BC
	brk $FC.b		; 00 FC
	cop $9C.b		; 02 9C
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	bmi  72.b		; 30 48
	bra 120.b		; 80 78
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	jsr $8078.w		; 20 78 80
	sei		; 78
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
	brk $00.b		; 00 00
	sbc $027E00.l,X		; FF 00 7E 02
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc [$08.b],Y		; 77 08
	asl $28.b,X		; 16 28
	sbc $7F7CFF.l,X		; FF FF 7C 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc [$7F.b],Y		; 77 7F
	asl $3E.b,X		; 16 3E
	sbc $007F00.l,X		; FF 00 7F 00
	sbc $001F00.l,X		; FF 00 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF7FFF.l,X		; FF FF 7F FF
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	xba		; EB
	trb $FF.b		; 14 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	ldy #$FF.b		; A0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	tsb $FF.b		; 04 FF
	brk $E3.b		; 00 E3
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $03E3E3.l,X		; FF E3 E3 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $01.b,S		; 03 01
	ora ($FC.b,X)		; 01 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	jsr ($F8F8.w,X)		; FC F8 F8
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
	beq -16.b		; F0 F0
	tsb $1C00.w		; 0C 00 1C
	ora ($1C.b,X)		; 01 1C
	ora $38.b,S		; 03 38
	ora $38.b,S		; 03 38
	brk $7F.b		; 00 7F
	brk $78.b		; 00 78
	asl $E9.b		; 06 E9
	ora $0F.b		; 05 0F
	tsb $1E.b		; 04 1E
	tsb $1C.b		; 04 1C
	php		; 08
	bit $3F08.w,X		; 3C 08 3F
	php		; 08
	adc $3F601F.l,X		; 7F 1F 60 3F
	cpx #$3F.b		; E0 3F
	inc $F7.b,X		; F6 F7
	asl A		; 0A
	xce		; FB
	adc $9D.b		; 65 9D
	tsb $FC.b		; 04 FC
	ora $00.b,S		; 03 00
	inc $0001.w,X		; FE 01 00
	adc [$99.b]		; 67 99
	txs		; 9A
	php		; 08
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0CC33C.l,X		; FF 3C C3 0C
	sbc ($FE.b,S),Y		; F3 FE
	jsr ($0203.w,X)		; FC 03 02
	sbc $C03F00.l,X		; FF 00 3F C0
	cmp [$07.b]		; C7 07
	tda		; 7B
	sty $00.b		; 84 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FC.b,S		; 03 FC
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
	sbc $78FF00.l,X		; FF 00 FF 78
	sbc $C10FF1.l,X		; FF F1 0F C1
	and $00FEFE.l,X		; 3F FE FE 00
	brk $FF.b		; 00 FF
	brk $F1.b		; 00 F1
	asl $838C.w		; 0E 8C 83
	plx		; FA
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	sbc $F8FF00.l,X		; FF 00 FF F8
	sbc $40BCBC.l,X		; FF BC BC 40
	ror $E798.w,X		; 7E 98 E7
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	sbc $990000.l,X		; FF 00 00 99
	ror $66.b		; 66 66
	eor $00.b,S		; 43 00
	sta ($00.b,X)		; 81 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	sed		; F8
	brk $78.b		; 00 78
	bra  92.b		; 80 5C
	bra -64.b		; 80 C0
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	rti		; 40

	beq  64.b		; F0 40
	beq  64.b		; F0 40
	sed		; F8
	cpx #$18.b		; E0 18
	beq  28.b		; F0 1C
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $00FFC0.l,X		; 7F C0 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $28800C.l,X		; FF 0C 80 28
	brk $E6.b		; 00 E6
	tas		; 1B
	cmp $E6FF.w,Y		; D9 FF E6
	sbc $00FFD9.l,X		; FF D9 FF 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $02FFD9.l,X		; FF D9 FF 02
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $D9.b		; 00 D9
	sbc $000004.l,X		; FF 04 00 00
	brk $16.b		; 00 16
	brk $D9.b		; 00 D9
	sbc $000006.l,X		; FF 06 00 00
	brk $E7.b		; 00 E7
	sbc $08FFE9.l,X		; FF E9 FF 08
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $0AFFE9.l,X		; FF E9 FF 0A
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $E9.b		; 00 E9
	sbc $00000C.l,X		; FF 0C 00 00
	brk $17.b		; 00 17
	brk $E9.b		; 00 E9
	sbc $00000E.l,X		; FF 0E 00 00
	brk $E8.b		; 00 E8
	sbc $20FFF9.l,X		; FF F9 FF 20
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $22FFF9.l,X		; FF F9 FF 22
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $F9.b		; 00 F9
	sbc $004020.l,X		; FF 20 40 00
	brk $FA.b		; 00 FA
	sbc $22FFF9.l,X		; FF F9 FF 22
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $09.b		; 00 09
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $09.b		; 00 09
	sei		; 78
	ora $173800.l,X		; 1F 00 38 17
	adc [$28.b],Y		; 77 28
	sbc $50E830.l		; EF 30 E8 50
	inx		; E8
	bvc -64.b		; 50 C0
	clv		; B8
	bne -84.b		; D0 AC
	ora $072800.l,X		; 1F 00 28 07
	bvc  15.b		; 50 0F
	cpy #$1F.b		; C0 1F
	ldy #$18.b		; A0 18
	ldy #$18.b		; A0 18
	rti		; 40

	sec		; 38
	rti		; 40

	bit $00FF.w,X		; 3C FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	bvs 112.b		; 70 70
	jsr $FF70.w		; 20 70 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	bvs 112.b		; 70 70
	bvs  32.b		; 70 20
	bvs  -1.b		; 70 FF
	brk $00.b		; 00 00
	sbc $0330CF.l,X		; FF CF 30 03
	jsr ($FC00.w,X)		; FC 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	mvp $38,$38		; 44 38 38
	jmp ($7C10.w,X)		; 7C 10 7C
	sec		; 38
	jmp ($00FF.w,X)		; 7C FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7C.b		; 00 7C
	sec		; 38
	jmp ($7C10.w,X)		; 7C 10 7C
	sec		; 38
	jmp ($00E0.w,X)		; 7C E0 00
	beq  32.b		; F0 20
	clv		; B8
	bvc -36.b		; 50 DC
	bmi  92.b		; 30 5C
	plp		; 28
	lsr $0E28.w,X		; 5E 28 0E
	stz $2E.b,X		; 74 2E
	pei ($E0.b)		; D4 E0
	brk $D0.b		; 00 D0
	brk $28.b		; 00 28
	cpy #$0C.b		; C0 0C
	cpx #$14.b		; E0 14
	rts		; 60

	asl $60.b,X		; 16 60
	asl A		; 0A
	bvs  10.b		; 70 0A
	beq   0.b		; F0 00
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
	sec		; 38
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $EA.b		; 00 EA
	tsb $E1.b		; 04 E1
	ora $E1.b		; 05 E1
	ora $EA.b		; 05 EA
	tsb $FF.b		; 04 FF
	brk $3F.b		; 00 3F
	php		; 08
	adc $3F7F08.l,X		; 7F 08 7F 3F
	cpx #$7F.b		; E0 7F
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	sbc $000100.l,X		; FF 00 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	eor ($21.b)		; 52 21
	sty $8CAD.w		; 8C AD 8C
	lda $2152.w		; AD 52 21
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $807080.l,X		; 7F 80 70 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bvs  -1.b		; 70 FF
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $00FFFF.l,X		; 7F FF FF 00
	sbc $F0F000.l,X		; FF 00 F0 F0
	adc $00BF80.l,X		; 7F 80 BF 00
	lda $00BF00.l,X		; BF 00 BF 00
	and $60FF80.l,X		; 3F 80 FF 60
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF9FFF.l,X		; 1F FF 9F FF
	sta $FF9FFF.l,X		; 9F FF 9F FF
	ora $00F0FF.l,X		; 1F FF F0 00
	cmp $00FF20.l,X		; DF 20 FF 00
	pea $F308.w		; F4 08 F3
	phd		; 0B
	sbc ($0B.b,S),Y		; F3 0B
	pea $FF08.w		; F4 08 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	cpx #$1F.b		; E0 1F
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $01F0EF.l,X		; FF EF F0 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $A7.b		; 00 A7
	rti		; 40

	inc A		; 1A
	cli		; 58
	inc A		; 1A
	cli		; 58
	lda [$40.b]		; A7 40
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $FFFF01.l,X		; FF 01 FF FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	cop $FF.b		; 02 FF
	sbc $00C000.l,X		; FF 00 C0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	beq   0.b		; F0 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	cpx #$80.b		; E0 80
	bvs -64.b		; 70 C0
	bmi -32.b		; 30 E0
	bmi -32.b		; 30 E0
	bmi -32.b		; 30 E0
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
	and $1FC1.w,Y		; 39 C1 1F
	sbc ($02.b,X)		; E1 02
	adc $0106.w,X		; 7D 06 01
	asl $00.b		; 06 00
	asl $0E00.w		; 0E 00 0E
	ora ($1C.b,X)		; 01 1C
	ora ($18.b,X)		; 01 18
	sed		; F8
	asl $02FC.w		; 0E FC 02
	adc $0106.w,X		; 7D 06 01
	ora [$02.b]		; 07 02
	ora $040E02.l		; 0F 02 0E 04
	asl $D004.w,X		; 1E 04 D0
	ldx $90.b		; A6 90
	adc [$BA.b]		; 67 BA
	eor $00.b		; 45 00
	sbc $727D7D.l,X		; FF 7D 7D 72
	stx $E719.w		; 8E 19 E7
	ora ($FF.b,X)		; 01 FF
	rti		; 40

	rol $80.b,X		; 36 80
	adc [$80.b],Y		; 77 80
	adc $82FF00.l,X		; 7F 00 FF 82
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	bvs 112.b		; 70 70
	bvs  32.b		; 70 20
	sbc $C7E707.l,X		; FF 07 E7 C7
	sed		; F8
	bra  -1.b		; 80 FF
	adc $00007F.l,X		; 7F 7F 00 00
	bvc 112.b		; 50 70
	bvs   0.b		; 70 00
	jsr $18DF.w		; 20 DF 18
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $CF33CF.l,X		; FF CF 33 CF
	bmi  72.b		; 30 48
	sta [$EF.b]		; 87 EF
	cmp $002030.l		; CF 30 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	bmi -49.b		; 30 CF
	bmi  40.b		; 30 28
	and $7F7C.w,Y		; 39 7C 7F
	ora $80FE.w,Y		; 19 FE 80
	sta $007E8E.l,X		; 9F 8E 7E 00
	sbc $FBFA.w,X		; FD FA FB
	asl $07.b		; 06 07
	plp		; 28
	and $0300.w,Y		; 39 00 03
	brk $E7.b		; 00 E7
	rts		; 60

	ora $020001.l,X		; 1F 01 00 02
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	brk $2E.b		; 00 2E
	stx $2F.b,Y		; 96 2F
	sta ($77.b)		; 92 77
	dey		; 88
	ora $FC.b,S		; 03 FC
	sbc ($F0.b),Y		; F1 F0
	and $61C4.w,Y		; 39 C4 61
	stz $FE00.w,X		; 9E 00 FE
	php		; 08
	bcs  13.b		; B0 0D
	bcs   7.b		; B0 07
	plx		; FA
	ora $FE.b,S		; 03 FE
	ora $010301.l		; 0F 01 03 01
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	bvc  44.b		; 50 2C
	ldy #$5C.b		; A0 5C
	brk $F8.b		; 00 F8
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	rti		; 40

	jmp ($FC80.w,X)		; 7C 80 FC
	brk $F8.b		; 00 F8
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$80.b		; C0 80
	cpx #$80.b		; E0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc [$3F.b]		; E7 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FC00.l,X		; FF 00 FC 00
	jsr ($FF00.w,X)		; FC 00 FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	cpy #$DF.b		; C0 DF
	cpy #$FF.b		; C0 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FF00F8.l,X		; FF F8 00 FF
	brk $FF.b		; 00 FF
	sbc $F800FF.l,X		; FF FF 00 F8
	ora [$FA.b]		; 07 FA
	ora $FA.b		; 05 FA
	ora $F9.b		; 05 F9
	asl $80.b		; 06 80
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $FDFFFF.l,X		; FF FF FF FD
	sbc $FEFFFD.l,X		; FF FD FF FE
	sbc $FFF0F0.l,X		; FF F0 F0 FF
	brk $FF.b		; 00 FF
	sbc $0300FF.l,X		; FF FF 00 03
	jsr ($748B.w,X)		; FC 8B 74
	rtl		; 6B

	sty $13.b,X		; 94 13
	cpx $FF00.w		; EC 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc [$FF.b],Y		; 77 FF
	sta [$FF.b],Y		; 97 FF
	sbc $00FFFF.l		; EF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF1F00.l,X		; FF 00 1F FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFE00.l,X		; FF 00 FE FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $30B300.l,X		; FF 00 B3 30
	lda ($30.b,S),Y		; B3 30
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF83FF.l,X		; FF FF 83 FF
	sta $FF.b,S		; 83 FF
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq -128.b		; F0 80
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpx #$00.b		; E0 00
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	bvs   0.b		; 70 00
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ror $0000.w,X		; 7E 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7EFFFF.l,X		; FF FF FF 7E
	ror $0000.w,X		; 7E 00 00
	sbc $001F00.l,X		; FF 00 1F 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	ora ($01.b,X)		; 01 01
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
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $2880.w		; 0C 80 28
	brk $E3.b		; 00 E3
	ora $E3FFD3.l,X		; 1F D3 FF E3
	sbc $00FFD3.l,X		; FF D3 FF 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $02FFD3.l,X		; FF D3 FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $D3.b		; 00 D3
	sbc $000004.l,X		; FF 04 00 00
	brk $13.b		; 00 13
	brk $D3.b		; 00 D3
	sbc $000006.l,X		; FF 06 00 00
	brk $E3.b		; 00 E3
	sbc $08FFE3.l,X		; FF E3 FF 08
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $0AFFE3.l,X		; FF E3 FF 0A
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $E3.b		; 00 E3
	sbc $00000C.l,X		; FF 0C 00 00
	brk $13.b		; 00 13
	brk $E3.b		; 00 E3
	sbc $00000E.l,X		; FF 0E 00 00
	brk $E3.b		; 00 E3
	sbc $20FFF3.l,X		; FF F3 FF 20
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $22FFF3.l,X		; FF F3 FF 22
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $F3.b		; 00 F3
	sbc $004020.l,X		; FF 20 40 00
	brk $FF.b		; 00 FF
	sbc $22FFF3.l,X		; FF F3 FF 22
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
	ora [$00.b]		; 07 00
	tsb $1D07.w		; 0C 07 1D
	asl A		; 0A
	and ($14.b,S),Y		; 33 14
	adc ($3C.b)		; 72 3C
	stz $28.b		; 64 28
	pea $E028.w		; F4 28 E0
	jmp ($0007.w,X)		; 7C 07 00
	php		; 08
	ora $14.b,S		; 03 14
	ora $28.b,S		; 03 28
	ora [$40.b]		; 07 40
	asl $0C50.w		; 0E 50 0C
	bne  12.b		; D0 0C
	bra  28.b		; 80 1C
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	trb $001C.w		; 1C 1C 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	trb $1C1C.w		; 1C 1C 1C
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $E006.w,Y		; F9 06 E0
	ora $001F00.l,X		; 1F 00 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $001F00.l,X		; FF 00 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	sta $00.b,S		; 83 00
	ora [$03.b]		; 07 03
	ora [$01.b]		; 07 01
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $008300.l,X		; FF 00 83 00
	ora [$03.b]		; 07 03
	ora [$01.b]		; 07 01
	ora [$FE.b]		; 07 FE
	beq   3.b		; F0 03
	inc $05FB.w,X		; FE FB 05
	jsr ($0402.w,X)		; FC 02 04
	sta $02.b,S		; 83 02
	cmp ($82.b,X)		; C1 82
	cmp ($00.b,X)		; C1 00
	cmp $0E.b,S		; C3 0E
	brk $01.b		; 00 01
	jsr ($FC02.w,X)		; FC 02 FC
	ora ($FE.b,X)		; 01 FE
	brk $87.b		; 00 87
	brk $C3.b		; 00 C3
	bra -61.b		; 80 C3
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	cpx #$80.b		; E0 80
	rts		; 60

	rti		; 40

	beq  64.b		; F0 40
	bvs -32.b		; 70 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $60.b		; 00 60
	brk $A0.b		; 00 A0
	brk $B0.b		; 00 B0
	brk $10.b		; 00 10
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
	brk $1E.b		; 00 1E
	ora #$16.b		; 09 16
	ora #$34.b		; 09 34
	ora #$3C.b		; 09 3C
	clc		; 18
	adc $007F00.l,X		; 7F 00 7F 00
	jmp ($E403.w,X)		; 7C 03 E4
	cop $16.b		; 02 16
	cop $16.b		; 02 16
	tsb $36.b		; 04 36
	tsb $27.b		; 04 27
	tsb $7F.b		; 04 7F
	tsb $7F.b		; 04 7F
	ora $E03F60.l,X		; 1F 60 3F E0
	and $0CC738.l,X		; 3F 38 C7 0C
	sbc ($00.b,S),Y		; F3 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	trb $EBE3.w		; 1C E3 EB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	ldy #$BF.b		; A0 BF
	eor $C040DF.l,X		; 5F DF 40 C0
	and $10EF00.l,X		; 3F 00 EF 10
	sbc ($1E.b,X)		; E1 1E
	asl $9370.w		; 0E 70 93
	ldy $0040.w		; AC 40 00
	jsr $3F00.w		; 20 00 3F
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	ora $00FFE0.l,X		; 1F E0 FF 00
	sbc $19FF03.l,X		; FF 03 FF 19
	cpx #$FD.b		; E0 FD
	sbc $0406.w,Y		; F9 06 04
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1F1F00.l,X		; FF 00 1F 1F
	inc $09.b,X		; F6 09
	asl $00.b		; 06 00
	brk $06.b		; 00 06
	sbc $FF06.w,Y		; F9 06 FF
	asl $FF.b		; 06 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FFF0.l,X		; FF F0 FF 80
	adc $00FFFF.l,X		; 7F FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora [$87.b]		; 07 87
	bra  -4.b		; 80 FC
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $51FFFC.l,X		; FF FC FF 51
	dec $BCA3.w,X		; DE A3 BC
	jsr $C03F.w		; 20 3F C0
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	sbc $9C.b,S		; E3 9C
	eor $0020.w,X		; 5D 20 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0639C7.l,X		; FF C7 39 06
	sbc $F902.w,Y		; F9 02 F9
	ora $01.b,S		; 03 01
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $8C.b,S		; 03 8C
	bvs 116.b		; 70 74
	asl $04.b		; 06 04
	asl $02.b		; 06 02
	asl $02.b		; 06 02
	inc $FF02.w,X		; FE 02 FF
	cop $FF.b		; 02 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $800080.l,X		; FF 80 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -32.b		; 80 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	bra  96.b		; 80 60
	cpy #$70.b		; C0 70
	cpy #$00.b		; C0 00
	brk $09.b		; 00 09
	bvs 125.b		; 70 7D
	bra 127.b		; 80 7F
	bra   3.b		; 80 03
	jmp ($0007.w,X)		; 7C 07 00
	ora [$01.b]		; 07 01
	ora $000001.l		; 0F 01 00 00
	ora #$78.b		; 09 78
	eor $6FFC.w,X		; 5D FC 6F
	inc $7F03.w,X		; FE 03 7F
	ora [$01.b]		; 07 01
	asl $02.b		; 06 02
	asl $C802.w		; 0E 02 C8
	mvn $56,$C8		; 54 C8 56
	cpx #$DB.b		; E0 DB
	bra -65.b		; 80 BF
	cmp $BFC0B0.l		; CF B0 C0 BF
	sbc $FF00FF.l,X		; FF FF 00 FF
	ldy #$1C.b		; A0 1C
	ldy #$1E.b		; A0 1E
	jsr $401B.w		; 20 1B 40
	and $403F40.l,X		; 3F 40 3F 40
	and $000000.l,X		; 3F 00 00 00
	brk $08.b		; 00 08
	trb $1C1C.w		; 1C 1C 1C
	trb $1C.b		; 14 1C
	rol $38BE.w,X		; 3E BE 38
	sbc $70F901.l,X		; FF 01 F9 70
	adc $08BFA0.l,X		; 7F A0 BF 08
	trb $1C1C.w		; 1C 1C 1C
	trb $1C.b		; 14 1C
	rol $3880.w,X		; 3E 80 38
	cmp [$06.b]		; C7 06
	sed		; F8
	bra   0.b		; 80 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F0C6F9.l,X		; FF F9 C6 F0
	ora $00CF30.l		; 0F 30 CF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora [$02.b]		; 07 02
	ora $03.b,S		; 03 03
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	sbc $F039F8.l,X		; FF F8 39 F0
	ora $033FC0.l		; 0F C0 3F 03
	ora [$02.b]		; 07 02
	ora $03.b,S		; 03 03
	ora $07.b,S		; 03 07
	ora [$01.b]		; 07 01
	sbc $000106.l,X		; FF 06 01 00
	brk $00.b		; 00 00
	brk $81.b		; 00 81
	rep #$81		; C2 81
	stx $80.b		; 86 80
	sta $DF00.w		; 8D 00 DF
	ora $FF00F0.l		; 0F F0 00 FF
	sbc $DF50EF.l		; EF EF 50 DF
	bra -61.b		; 80 C3
	bra -121.b		; 80 87
	bra -115.b		; 80 8D
	cpy #$DF.b		; C0 DF
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	bpl   0.b		; 10 00
	jsr $3000.w		; 20 00 30
	ldy #$38.b		; A0 38
	ldy #$79.b		; A0 79
	bcs -97.b		; B0 9F
	bvc -68.b		; 50 BC
	eor ($3E.b,S),Y		; 53 3E
	bne  -2.b		; D0 FE
	sed		; F8
	ora $8050F8.l		; 0F F8 50 80
	cli		; 58
	bra  73.b		; 80 49
	sta ($2F.b,X)		; 81 2F
	cmp $2C.b,S		; C3 2C
	wai		; CB
	rol $06C8.w		; 2E C8 06
	tsb $07.b		; 04 07
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	beq -96.b		; F0 A0
	cli		; 58
	rti		; 40

	clv		; B8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	bra  -8.b		; 80 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $02.b		; C4 02
	cpy $02.b		; C4 02
	cpy $03.b		; C4 03
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc ($1F.b,S),Y		; F3 1F
	cpy #$7F.b		; C0 7F
	cpy #$7F.b		; C0 7F
	cpy #$7F.b		; C0 7F
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpx #$00.b		; E0 00
	sbc $EB.b,S		; E3 EB
	cmp $CB.b,S		; C3 CB
	brk $1C.b		; 00 1C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sta [$A8.b],Y		; 97 A8
	ora $681720.l,X		; 1F 20 17 68
	sbc ($0C.b,S),Y		; F3 0C
	inc $FF10.w		; EE 10 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $E3FF07.l,X		; FF 07 FF E3
	ora $FFEFF0.l,X		; 1F F0 EF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $F2.b		; 00 F2
	ora #$1F.b		; 09 1F
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FF.b		; 00 FF
	sbc $F9FFF9.l,X		; FF F9 FF F9
	sbc $F0FFF9.l,X		; FF F9 FF F0
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $FE.b		; 00 FE
	ora ($FC.b,X)		; 01 FC
	ora $87.b,S		; 03 87
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $9C.b		; 00 9C
	eor $5998.w,X		; 5D 98 59
	bra  99.b		; 80 63
	sbc $807F00.l,X		; FF 00 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $7FFF80.l,X		; 7F 80 FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	bvs 116.b		; 70 74
	rts		; 60

	stz $00.b		; 64 00
	sty $00FF.w		; 8C FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFC00.l,X		; FF 00 FC FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq -128.b		; F0 80
	bmi -32.b		; 30 E0
	bmi -32.b		; 30 E0
	bmi -32.b		; 30 E0
	beq   0.b		; F0 00
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	bvs   0.b		; 70 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ror $7E00.w,X		; 7E 00 7E
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	rti		; 40

	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ror $7E7F.w,X		; 7E 7F 7E
	adc $3F7F7F.l,X		; 7F 7F 7F 3F
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $6F.b		; 00 6F
	rts		; 60

	adc $00FF60.l		; 6F 60 FF 00
	cmp $00.b,S		; C3 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FF0FFF.l		; 0F FF 0F FF
	sbc $C3C3FF.l,X		; FF FF C3 C3
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F8000.l,X		; FF 00 80 7F
	lda #$56.b		; A9 56
	ldx $59.b		; A6 59
	bcc 111.b		; 90 6F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFD6FF.l,X		; FF FF D6 FF
	cmp $EFFF.w,Y		; D9 FF EF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	rti		; 40

	and $502F50.l		; 2F 50 2F 50
	pld		; 2B
	mvn $35,$0A		; 54 0A 35
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $7F2F7F.l,X		; 3F 7F 2F 7F
	and $7F2B7F.l		; 2F 7F 2B 7F
	asl A		; 0A
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	and $000000.l,X		; 3F 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $02FFFF.l,X		; FF FF FF 02
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $7F.b		; 00 7F
	ora $006060.l,X		; 1F 60 60 00
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra -33.b		; 80 DF
	brk $3F.b		; 00 3F
	brk $68.b		; 00 68
	php		; 08
	rts		; 60

	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	sbc $DFFF7F.l,X		; FF 7F FF DF
	cmp $200000.l,X		; DF 00 00 20
	bra -16.b		; 80 F0
	cpy #$30.b		; C0 30
	bmi   8.b		; 30 08
	brk $F0.b		; 00 F0
	php		; 08
	cpx #$18.b		; E0 18
	bne   8.b		; D0 08
	cpx #$00.b		; E0 00
	bmi -128.b		; 30 80
	bmi   0.b		; 30 00
	sed		; F8
	php		; 08
	sed		; F8
	brk $00.b		; 00 00
	sed		; F8
	cpx #$F8.b		; E0 F8
	bne -40.b		; D0 D8
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F9.b		; 00 F9
	php		; 08
	pea $F9FF.w		; F4 FF F9
	sbc $00FFF4.l,X		; FF F4 FF 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $F4.b		; 00 F4
	sbc $000001.l,X		; FF 01 00 00
	brk $F9.b		; 00 F9
	sbc $02FFFC.l,X		; FF FC FF 02
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	sbc $000003.l,X		; FF 03 00 00
	brk $3F.b		; 00 3F
	brk $0C.b		; 00 0C
	brk $60.b		; 00 60
	ora $1C007F.l,X		; 1F 7F 00 1C
	ora [$70.b]		; 07 70
	adc [$80.b],Y		; 77 80
	brk $00.b		; 00 00
	sbc $2C003F.l,X		; FF 3F 00 2C
	tsb $9F7F.w		; 0C 7F 9F
	adc $FBEB00.l,X		; 7F 00 EB FB
	sed		; F8
	dey		; 88
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	sed		; F8
	brk $08.b		; 00 08
	rts		; 60

	tsb $FCF0.w		; 0C F0 FC
	brk $70.b		; 00 70
	cpy #$1C.b		; C0 1C
	jmp.w [$0002]		; DC 02 00
	brk $FE.b		; 00 FE
	sed		; F8
	brk $08.b		; 00 08
	rts		; 60

	jsr ($FCF1.w,X)		; FC F1 FC
	brk $AE.b		; 00 AE
	ldx $223E.w,Y		; BE 3E 22
	cop $FC.b		; 02 FC
	brk $FE.b		; 00 FE
	adc $40BF80.l,X		; 7F 80 BF 40
	cpy #$00.b		; C0 00
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C0FFBF.l,X		; FF BF FF C0
	cpy #$40.b		; C0 40
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	cop $FC.b		; 02 FC
	cop $06.b		; 02 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FEFC.w,X		; FE FC FE
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $F5.b		; 00 F5
	phd		; 0B
	inc $F5FF.w		; EE FF F5
	sbc $00FFEE.l,X		; FF EE FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFEE.l,X		; FF EE FF 01
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $EE.b		; 00 EE
	sbc $000002.l,X		; FF 02 00 00
	brk $F5.b		; 00 F5
	sbc $03FFF6.l,X		; FF F6 FF 03
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $04FFF6.l,X		; FF F6 FF 04
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $F6.b		; 00 F6
	sbc $000005.l,X		; FF 05 00 00
	brk $F5.b		; 00 F5
	sbc $06FFFE.l,X		; FF FE FF 06
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $FE.b		; 00 FE
	sbc $000007.l,X		; FF 07 00 00
	brk $07.b		; 00 07
	brk $10.b		; 00 10
	ora $350811.l		; 0F 11 08 35
	pha		; 48
	jsr $1F5F.w		; 20 5F 1F
	jsr $030F.w		; 20 0F 03
	adc $000F7D.l,X		; 7F 7D 0F 00
	bpl  15.b		; 10 0F
	ora ($09.b),Y		; 11 09
	and $4D.b,X		; 35 4D
	and $001F5F.l,X		; 3F 5F 1F 00
	stz $7C.b,X		; 74 7C
	inc $FF82.w,X		; FE 82 FF
	brk $00.b		; 00 00
	sbc $800380.l,X		; FF 80 03 80
	ora $00.b,S		; 03 00
	sbc $0110EF.l,X		; FF EF 10 01
	sbc $FFFF41.l,X		; FF 41 FF FF
	brk $00.b		; 00 00
	sbc $808380.l,X		; FF 80 83 80
	sta $FF.b,S		; 83 FF
	sbc $FE00EF.l,X		; FF EF 00 FE
	brk $BE.b		; 00 BE
	bit $00E0.w,X		; 3C E0 00
	bpl -32.b		; 10 E0
	bpl  32.b		; 10 20
	clc		; 18
	stz $08.b		; 64 08
	pea $08F0.w		; F4 F0 08
	cpx #$80.b		; E0 80
	jsr ($E07C.w,X)		; FC 7C E0
	brk $10.b		; 00 10
	cpx #$10.b		; E0 10
	jsr $6418.w		; 20 18 64
	sed		; F8
	pea $00F0.w		; F4 F0 00
	jmp $82FE7C.l		; 5C 7C FE 82
	ror $817D.w,X		; 7E 7D 81
	brk $E0.b		; 00 E0
	rts		; 60

	brk $FF.b		; 00 FF
	adc $E01F80.l,X		; 7F 80 1F E0
	sta $807760.l,X		; 9F 60 77 80
	inc $FF82.w,X		; FE 82 FF
	ora ($00.b,X)		; 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $9FFF1F.l,X		; FF 1F FF 9F
	sbc $00F777.l,X		; FF 77 F7 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $027CFC.l,X		; FF FC 7C 02
	brk $0E.b		; 00 0E
	tsb $FE00.w		; 0C 00 FE
	jsr ($F802.w,X)		; FC 02 F8
	asl $FA.b		; 06 FA
	tsb $DE.b		; 04 DE
	brk $FE.b		; 00 FE
	.db $82, $FE, $00		; 82 FE 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	sed		; F8
	inc $FEFA.w,X		; FE FA FE
	dec $70DE.w,X		; DE DE 70
	bra -16.b		; 80 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	beq -16.b		; F0 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $A0.b		; 00 A0
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq -96.b		; F0 A0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	bra  12.b		; 80 0C
	brk $F1.b		; 00 F1
	ora $F1FFE9.l		; 0F E9 FF F1
	sbc $00FFE9.l,X		; FF E9 FF 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $E9.b		; 00 E9
	sbc $000002.l,X		; FF 02 00 00
	brk $F1.b		; 00 F1
	sbc $04FFF9.l,X		; FF F9 FF 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $004004.l,X		; FF 04 40 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $04.b		; 00 04
	cop $0C.b		; 02 0C
	cop $0D.b		; 02 0D
	bvs  24.b		; 70 18
	adc [$18.b]		; 67 18
	ora [$2F.b]		; 07 2F
	bpl   3.b		; 10 03
	brk $07.b		; 00 07
	ora ($04.b,X)		; 01 04
	cop $0C.b		; 02 0C
	cop $0D.b		; 02 0D
	adc ($1F.b),Y		; 71 1F
	adc [$17.b]		; 67 17
	brk $2F.b		; 00 2F
	tsb $FF.b		; 04 FF
	brk $FF.b		; 00 FF
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	sbc $707070.l,X		; FF 70 70 70
	bvs 112.b		; 70 70
	bvs  -1.b		; 70 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	trb $1C00.w		; 1C 00 1C
	brk $1D.b		; 00 1D
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($00.b,X)		; 01 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	brk $1D.b		; 00 1D
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	cpy #$00.b		; C0 00
	rti		; 40

	bra  32.b		; 80 20
	bra   0.b		; 80 00
	trb $CC30.w		; 1C 30 CC
	bmi -64.b		; 30 C0
	inx		; E8
	bpl -128.b		; 10 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	trb $CCF0.w		; 1C F0 CC
	bne   0.b		; D0 00
	inx		; E8
	rti		; 40

	brk $FF.b		; 00 FF
	ora $304FE0.l,X		; 1F E0 4F 30
	adc $7800.w,Y		; 79 00 78
	brk $78.b		; 00 78
	brk $38.b		; 00 38
	rti		; 40

	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $7F4FFF.l,X		; 1F FF 4F 7F
	adc $7879.w,Y		; 79 79 78
	sei		; 78
	sei		; 78
	sei		; 78
	sec		; 38
	sei		; 78
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	adc $7FFF00.l,X		; 7F 00 FF 7F
	clv		; B8
	sec		; 38
	brk $FF.b		; 00 FF
	adc $3F3D80.l,X		; 7F 80 3D 3F
	adc $407F40.l,X		; 7F 40 7F 40
	adc $00807F.l,X		; 7F 7F 80 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$FF.b		; E0 FF
	sbc $7F007F.l		; EF 7F 00 7F
	cpy #$00.b		; C0 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $001F00.l,X		; FF 00 1F 00
	bcc -128.b		; 90 80
	bcc -128.b		; 90 80
	sbc $0000C0.l,X		; FF C0 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FDEFFE.l		; 0F FE EF FD
	ora ($FD.b,X)		; 01 FD
	ora [$00.b]		; 07 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $01F100.l,X		; FF 00 F1 01
	ora ($02.b,S),Y		; 13 02
	ora ($02.b,S),Y		; 13 02
	sbc $000007.l,X		; FF 07 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	jsr ($FE00.w,X)		; FC 00 FE
	jsr ($1C1E.w,X)		; FC 1E 1C
	brk $FE.b		; 00 FE
	jsr ($7802.w,X)		; FC 02 78
	sed		; F8
	jsr ($FC04.w,X)		; FC 04 FC
	tsb $FC.b		; 04 FC
	jsr ($0002.w,X)		; FC 02 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $80.b		; 06 80
	clc		; 18
	brk $EE.b		; 00 EE
	ora ($E4.b,S),Y		; 13 E4
	sbc $E4FFEE.l,X		; FF EE FF E4
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $02FFE4.l,X		; FF E4 FF 02
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $E4.b		; 00 E4
	sbc $000004.l,X		; FF 04 00 00
	brk $EE.b		; 00 EE
	sbc $06FFF4.l,X		; FF F4 FF 06
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $08FFF4.l,X		; FF F4 FF 08
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $F4.b		; 00 F4
	sbc $00000A.l,X		; FF 0A 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	ora $46.b,S		; 03 46
	and $1E.b,S		; 23 1E
	sta $08.b		; 85 08
	adc [$01.b],Y		; 77 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora ($07.b,X)		; 01 07
	ora ($04.b,X)		; 01 04
	ora ($44.b,X)		; 01 44
	and ($1A.b,X)		; 21 1A
	sbc ($08.b),Y		; F1 08
	bvs  -1.b		; 70 FF
	brk $FF.b		; 00 FF
	brk $0C.b		; 00 0C
	brk $1E.b		; 00 1E
	brk $9E.b		; 00 9E
	brk $DE.b		; 00 DE
	brk $21.b		; 00 21
	dec $FF00.w,X		; DE 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	tsb $1E0C.w		; 0C 0C 1E
	asl $9E9E.w,X		; 1E 9E 9E
	dec $3FDE.w,X		; DE DE 3F
	inc $0000.w,X		; FE 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sbc $FF0001.l,X		; FF 01 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sbc $000000.l,X		; FF 00 00 00
	inc $FF00.w,X		; FE 00 FF
	brk $03.b		; 00 03
	cpy #$03.b		; C0 03
	cpy #$01.b		; C0 01
	cmp [$01.b]		; C7 01
	cmp $00FEE1.l		; CF E1 FE 00
	sbc $FF00FE.l,X		; FF FE 00 FF
	jsr ($C203.w,X)		; FC 03 C2
	ora $C2.b,S		; 03 C2
	brk $C6.b		; 00 C6
	brk $CE.b		; 00 CE
	sbc ($1E.b),Y		; F1 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  24.b		; 80 18
	cpx #$84.b		; E0 84
	rti		; 40

	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  24.b		; 80 18
	rts		; 60

	bit $3840.w,X		; 3C 40 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $14.b,X		; 94 14
	adc $00FF80.l,X		; 7F 80 FF 00
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	ora $700FF0.l		; 0F F0 0F 70
	adc $FF0000.l,X		; 7F 00 00 FF
	brk $FF.b		; 00 FF
	sbc $DF00FF.l,X		; FF FF 00 DF
	brk $FF.b		; 00 FF
	ora $7F0FFF.l		; 0F FF 0F 7F
	adc $00007F.l,X		; 7F 7F 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0101FF.l,X		; FF FF 01 01
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $606CFF.l,X		; FF FF 6C 60
	beq  12.b		; F0 0C
	jsr ($0000.w,X)		; FC 00 00
	trb $FC00.w		; 1C 00 FC
	cpy #$3C.b		; C0 3C
	iny		; C8
	bmi  -8.b		; 30 F8
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	jsr ($00FC.w,X)		; FC FC 00
	cpx $FC00.w		; EC 00 FC
	cpy #$FC.b		; C0 FC
	iny		; C8
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
	ora [$08.b],Y		; 17 08
	and $000000.l,X		; 3F 00 00 00
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	and $00C03F.l,X		; 3F 3F C0 00
	sbc $02177F.l,X		; FF 7F 17 02
	and $3F3E3F.l,X		; 3F 3F 3E 3F
	adc $607F60.l,X		; 7F 60 7F 60
	adc $00FF40.l,X		; 7F 40 FF 00
	bra   0.b		; 80 00
	sbc $1FDF00.l,X		; FF 00 DF 1F
	jsr ($FDBF.w,X)		; FC BF FD
	cmp $D0DFFC.l,X		; DF FC DF D0
	cmp $FF000F.l		; CF 0F 00 FF
	sbc $E000FF.l,X		; FF FF 00 E0
	bra  67.b		; 80 43
	cpy #$E2.b		; C0 E2
	jsr $20E2.w		; 20 E2 20
	beq  48.b		; F0 30
	sbc $00000F.l,X		; FF 0F 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	cop $FF.b		; 02 FF
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FCFD00.l,X		; FF 00 FD FC
	cmp $00FC.w		; CD FC 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $EF.b		; 00 EF
	cpx #$FC.b		; E0 FC
	pea $EFFF.w		; F4 FF EF
	sbc $CF2FEF.l,X		; FF EF 2F CF
	cpy #$00.b		; C0 00
	sbc $00FFFF.l,X		; FF FF FF 00
	ora $0F0907.l,X		; 1F 07 09 0F
	ora $101F10.l,X		; 1F 10 1F 10
	and $C0FF30.l,X		; 3F 30 FF C0
	brk $00.b		; 00 00
	ldy #$40.b		; A0 40
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	beq -16.b		; F0 F0
	tsb $F400.w		; 0C 00 F4
	beq -96.b		; F0 A0
	brk $F0.b		; 00 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	bpl  -8.b		; 10 F8
	clc		; 18
	sed		; F8
	php		; 08
	jsr ($0C00.w,X)		; FC 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	brk $5C.b		; 00 5C
	jsr $304C.w		; 20 4C 30
	tsb $0070.w		; 0C 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	jmp ($7C5C.w,X)		; 7C 5C 7C
	jmp $0C7C.w		; 4C 7C 0C
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$18.b]		; 07 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$1F.b]		; 07 1F
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
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($40.b,X)		; 81 40
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($C1.b,X)		; 81 C1
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   8.b		; F0 08
	cpx #$18.b		; E0 18
	cpy #$38.b		; C0 38
	cpy #$30.b		; C0 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  -8.b		; F0 F8
	cpx #$F8.b		; E0 F8
	cpy #$F8.b		; C0 F8
	cpy #$F0.b		; C0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  32.b		; 80 20
	brk $E9.b		; 00 E9
	asl $DE.b,X		; 16 DE
	sbc $DEFFE9.l,X		; FF E9 FF DE
	sbc $000000.l,X		; FF 00 00 00
	brk $F9.b		; 00 F9
	sbc $02FFDE.l,X		; FF DE FF 02
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $DE.b		; 00 DE
	sbc $000004.l,X		; FF 04 00 00
	brk $E9.b		; 00 E9
	sbc $06FFEE.l,X		; FF EE FF 06
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $08FFEE.l,X		; FF EE FF 08
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $EE.b		; 00 EE
	sbc $00000A.l,X		; FF 0A 00 00
	brk $EA.b		; 00 EA
	sbc $0CFFFE.l,X		; FF FE FF 0C
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $FE.b		; 00 FE
	sbc $00000E.l,X		; FF 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	ora ($03.b,X)		; 01 03
	ora ($13.b,X)		; 01 13
	adc ($8B.b,X)		; 61 8B
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $12.b		; 00 12
	bvs -118.b		; 70 8A
	sed		; F8
	and $5FE000.l,X		; 3F 00 E0 5F
	cpy #$A0.b		; C0 A0
	sta $C0.b,S		; 83 C0
	sta [$40.b]		; 87 40
	sta [$40.b]		; 87 40
	sbc ($00.b,S),Y		; F3 00
	cmp $007F0E.l,X		; DF 0E 7F 00
	ldy #$1F.b		; A0 1F
	rti		; 40

	jsr $4303.w		; 20 03 43
	sta [$47.b]		; 87 47
	sta [$47.b]		; 87 47
	sbc ($73.b,S),Y		; F3 73
	cmp ($51.b),Y		; D1 51
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$40.b		; C0 40
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $0E.b		; 00 0E
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	ora ($1F.b),Y		; 11 1F
	sed		; F8
	brk $1C.b		; 00 1C
	inx		; E8
	asl $0614.w		; 0E 14 06
	tsb $0A07.w		; 0C 07 0A
	ora [$0A.b]		; 07 0A
	ora [$3A.b]		; 07 3A
	ora [$6A.b]		; 07 6A
	sed		; F8
	brk $14.b		; 00 14
	cpx #$0A.b		; E0 0A
	bpl   2.b		; 10 02
	php		; 08
	ora $08.b		; 05 08
	ora $08.b		; 05 08
	ora $38.b		; 05 38
	sta $E8.b		; 85 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $44.b		; 00 44
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $7C.b		; 00 7C
	ora $007F1F.l,X		; 1F 1F 7F 00
	lda $60DF3F.l,X		; BF 3F DF 60
	sbc $C03F2F.l		; EF 2F 3F C0
	sbc $FF0000.l,X		; FF 00 00 FF
	adc $7F7F60.l,X		; 7F 60 7F 7F
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C000FF.l,X		; FF FF 00 C0
	pea $FEF3.w		; F4 F3 FE
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF0CFC.l,X		; FF FC 0C FF
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	rti		; 40

	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF0001.l,X		; FF 01 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF0008.l,X		; FF 08 00 FF
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $BF0000.l,X		; FF 00 00 BF
	and $FF00FF.l,X		; 3F FF 00 FF
	sbc $0300FF.l,X		; FF FF 00 03
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFC0FF.l,X		; FF FF C0 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $E00000.l,X		; FF 00 00 E0
	cpx #$F8.b		; E0 F8
	brk $F0.b		; 00 F0
	beq -56.b		; F0 C8
	sec		; 38
	jmp.w [$E0D0]		; DC D0 E0
	trb $04F8.w		; 1C F8 04
	brk $FC.b		; 00 FC
	sed		; F8
	clc		; 18
	sed		; F8
	sed		; F8
	tsb $0400.w		; 0C 00 04
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	sed		; F8
	jsr ($1C00.w,X)		; FC 00 1C
	ror $2C90.w		; 6E 90 2C
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6E.b		; 00 6E
	inc $7C2C.w,X		; FE 2C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $1A.b		; E4 1A
	jsr $005C.w		; 20 5C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E4.b		; 00 E4
	inc $7C20.w,X		; FE 20 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $070E03.l,X		; 7F 03 0E 07
	ora $1B06.w		; 0D 06 1B
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $7C1F1F.l,X		; 1F 1F 1F 7C
	sei		; 78
	php		; 08
	brk $09.b		; 00 09
	brk $1B.b		; 00 1B
	brk $1F.b		; 00 1F
	ora $3F3F3F.l,X		; 1F 3F 3F 3F
	jsr $607F.w		; 20 7F 60
	sta $FF0077.l		; 8F 77 00 FF
	sbc $00F000.l,X		; FF 00 F0 00
	and [$27.b],Y		; 37 27
	ora $F3F707.l		; 0F 07 F7 F3
	sbc [$F3.b],Y		; F7 F3
	dey		; 88
	sei		; 78
	brk $00.b		; 00 00
	sbc $80FF80.l,X		; FF 80 FF 80
	tya		; 98
	beq -120.b		; F0 88
	sed		; F8
	jsr ($FC0C.w,X)		; FC 0C FC
	tsb $C0FF.w		; 0C FF C0
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	bra  -1.b		; 80 FF
	ldy #$FF.b		; A0 FF
	ldy #$F3.b		; A0 F3
	ldy #$FF.b		; A0 FF
	and $000000.l,X		; 3F 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $1F5F00.l,X		; 7F 00 5F 1F
	eor ($1F.b,S),Y		; 53 1F
	eor $00F01F.l,X		; 5F 1F F0 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	ora [$FF.b]		; 07 FF
	ora [$FF.b],Y		; 17 FF
	ora [$BF.b],Y		; 17 BF
	ora [$7F.b],Y		; 17 7F
	sbc $00000F.l,X		; FF 0F 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	brk $E8.b		; 00 E8
	cpx #$A8.b		; E0 A8
	cpx #$68.b		; E0 68
	cpx #$07.b		; E0 07
	tda		; 7B
	ora ($FF.b,X)		; 01 FF
	inc $7F01.w,X		; FE 01 7F
	brk $B0.b		; 00 B0
	bcc -64.b		; 90 C0
	bra -65.b		; 80 BF
	and $843FBF.l,X		; 3F BF 3F 84
	sed		; F8
	brk $00.b		; 00 00
	inc $FF04.w,X		; FE 04 FF
	tsb $67.b		; 04 67
	and $FF7F47.l,X		; 3F 47 7F FF
	cpy #$FF.b		; C0 FF
	cpy #$F8.b		; C0 F8
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$E0.b		; C0 E0
	cpx #$F8.b		; E0 F8
	sei		; 78
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	cpx #$F0.b		; E0 F0
	beq -16.b		; F0 F0
	bmi  -8.b		; 30 F8
	clc		; 18
	brk $E0.b		; 00 E0
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	adc $1C.b,S		; 63 1C
	adc $403F00.l,X		; 7F 00 3F 40
	and $403F40.l,X		; 3F 40 3F 40
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	adc $7F.b,S		; 63 7F
	adc $7F3F7F.l,X		; 7F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $00001F.l,X		; 1F 1F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00.b,S		; E3 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E3.b,S		; E3 E3
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	brk $3C.b		; 00 3C
	brk $FC.b		; 00 FC
	bra 124.b		; 80 7C
	sec		; 38
	cpy #$F8.b		; C0 F8
	brk $F0.b		; 00 F0
	php		; 08
	bne  40.b		; D0 28
	bne  40.b		; D0 28
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	bra  -4.b		; 80 FC
	sec		; 38
	sed		; F8
	sed		; F8
	sed		; F8
	beq  -8.b		; F0 F8
	bne  -8.b		; D0 F8
	bne  -8.b		; D0 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	bra  40.b		; 80 28
	brk $E6.b		; 00 E6
	tas		; 1B
	cmp $E6FF.w,Y		; D9 FF E6
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $F0.b		; 00 F0
	sbc $000004.l,X		; FF 04 00 00
	brk $FB.b		; 00 FB
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	sbc $06FFE0.l,X		; FF E0 FF 06
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $08FFE0.l,X		; FF E0 FF 08
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $E0.b		; 00 E0
	sbc $00000A.l,X		; FF 0A 00 00
	brk $16.b		; 00 16
	brk $E0.b		; 00 E0
	sbc $00000C.l,X		; FF 0C 00 00
	brk $ED.b		; 00 ED
	sbc $0EFFD0.l,X		; FF D0 FF 0E
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $20FFD0.l,X		; FF D0 FF 20
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $D0.b		; 00 D0
	sbc $000022.l,X		; FF 22 00 00
	brk $EE.b		; 00 EE
	rol $00FF.w		; 2E FF 00
	sbc $3FC000.l,X		; FF 00 C0 3F
	cpx #$10.b		; E0 10
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	cpy #$FF.b		; C0 FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpx #$EF.b		; E0 EF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $8080FF.l,X		; FF FF 80 80
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0101FF.l,X		; FF FF 01 01
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7477FF.l,X		; FF FF 77 74
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FC.b,S		; 03 FC
	ora [$08.b]		; 07 08
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $FF.b,S		; 03 FF
	sbc $0303FF.l,X		; FF FF 03 03
	ora [$F7.b]		; 07 F7
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7800FF.l,X		; FF FF 00 78
	brk $85.b		; 00 85
	ora [$81.b]		; 07 81
	cop $7D.b		; 02 7D
	ora [$00.b]		; 07 00
	ora [$02.b]		; 07 02
	ora $000000.l,X		; 1F 00 00 00
	ora ($78.b,X)		; 01 78
	brk $F4.b		; 00 F4
	asl $FC.b		; 06 FC
	cop $7C.b		; 02 7C
	asl $00.b		; 06 00
	ora $00.b		; 05 00
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	cpy $C4A0.w		; CC A0 C4
	lda $42.b,S		; A3 42
	and $3EC1.w,X		; 3D C1 3E
	bra 127.b		; 80 7F
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $4C09.w		; 0D 09 4C
	bit $2747.w		; 2C 47 27
	cmp $3F.b,S		; C3 3F
	brk $00.b		; 00 00
	sbc $40FF80.l,X		; FF 80 FF 40
	sbc $FCE6F8.l,X		; FF F8 E6 FC
	sed		; F8
	brk $70.b		; 00 70
	dey		; 88
	ora $FC.b,S		; 03 FC
	cmp ($3E.b,X)		; C1 3E
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	beq  -1.b		; F0 FF
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sbc $0000FC.l,X		; FF FC 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	sbc $FB0400.l,X		; FF 00 04 FB
	brk $FF.b		; 00 FF
	sta $FFFF70.l		; 8F 70 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $008F00.l,X		; FF 00 8F 00
	brk $00.b		; 00 00
	sbc $007000.l,X		; FF 00 70 00
	sbc $FD8E.w,X		; FD 8E FD
	inc $E31C.w,X		; FE 1C E3
	brk $FF.b		; 00 FF
	sbc $FCFC00.l,X		; FF 00 FC FC
	adc $7070FE.l,X		; 7F FE 70 70
	sbc $03FF73.l,X		; FF 73 FF 03
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $00.b,S		; 03 00
	sta ($01.b,X)		; 81 01
	plx		; FA
	php		; 08
	tsx		; BA
	tsb $04F7.w		; 0C F7 04
	tas		; 1B
	cpx $0D.b		; E4 0D
	sbc ($FD.b)		; F2 FD
	ora $FF.b,S		; 03 FF
	brk $80.b		; 00 80
	bra -10.b		; 80 F6
	cpx #$B2.b		; E0 B2
	ldy #$FB.b		; A0 FB
	cpx #$03.b		; E0 03
	brk $F9.b		; 00 F9
	php		; 08
	jsr ($FF10.w,X)		; FC 10 FF
	sbc $00FF3F.l,X		; FF 3F FF 00
	sei		; 78
	bra   4.b		; 80 04
	bra   4.b		; 80 04
	sed		; F8
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	bra  -4.b		; 80 FC
	bra  -4.b		; 80 FC
	sed		; F8
	sed		; F8
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $003F00.l,X		; 7F 00 3F 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $3F3F7F.l,X		; 7F 7F 3F 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sta [$00.b]		; 87 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta [$87.b]		; 87 87
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc ($00.b),Y		; F1 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc ($F1.b),Y		; F1 F1
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FCFC.w,X		; FE FC FC
	brk $00.b		; 00 00
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $007F1F.l,X		; 1F 1F 7F 00
	cpx #$00.b		; E0 00
	lda $70CF3F.l,X		; BF 3F CF 70
	and $303F3F.l,X		; 3F 3F 3F 30
	adc $607F70.l,X		; 7F 70 7F 60
	adc $00FF7F.l,X		; 7F 7F FF 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	ora $01.b,S		; 03 01
	sbc $FDFC.w,X		; FD FC FD
	jsr ($FCFC.w,X)		; FC FC FC
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
.ACCU 8
.INDEX 8
	sep #$FE		; E2 FE
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $FFFF03.l,X		; FF 03 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	pea $F4FF.w		; F4 FF F4
	inc $FEF0.w,X		; FE F0 FE
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $030B00.l,X		; FF 00 0B 03
	asl A		; 0A
	ora $0A.b,S		; 03 0A
	ora $8B.b,S		; 03 8B
	sta $FF.b,S		; 83 FF
	bra  -1.b		; 80 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	sbc $00BB01.l,X		; FF 01 BB 00
	wai		; CB
	brk $77.b		; 00 77
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FEFE00.l,X		; FF 00 FE FE
	tsx		; BA
	inc $FECA.w,X		; FE CA FE
	ror $FE.b,X		; 76 FE
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $7DFC.w,X		; 7E FC 7D
	sbc $F97D.w,Y		; F9 7D F9
	ora #$F1.b		; 09 F1
	ora $00F000.l,X		; 1F 00 F0 00
	sbc $00FFFF.l,X		; FF FF FF 00
	.db $82, $03, $87		; 82 03 87
	asl $87.b		; 06 87
	asl $8F.b		; 06 8F
	asl $1FFF.w		; 0E FF 1F
	sbc $0000F0.l,X		; FF F0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	and $00FFFF.l,X		; 3F FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	beq   0.b		; F0 00
	sec		; 38
	brk $E8.b		; 00 E8
	cpx #$98.b		; E0 98
	bvs -32.b		; 70 E0
	cpx #$E0.b		; E0 E0
	rts		; 60

	beq 112.b		; F0 70
	beq  48.b		; F0 30
	beq -16.b		; F0 F0
	sed		; F8
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0C.b		; 00 0C
	ora $28.b,S		; 03 28
	tsb $10.b		; 04 10
	php		; 08
	bvs  40.b		; 70 28
	bpl   8.b		; 10 08
	cpx $50.b		; E4 50
	brk $00.b		; 00 00
	ora $031C00.l		; 0F 00 1C 03
	sec		; 38
	tsb $30.b		; 04 30
	php		; 08
	bvc   8.b		; 50 08
	bvs   8.b		; 70 08
	ldy $14.b		; A4 14
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sec		; 38
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $380000.l,X		; FF 00 00 38
	sec		; 38
	jmp ($FC7C.w,X)		; 7C 7C FC
	jsr ($FCFC.w,X)		; FC FC FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sec		; 38
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $380000.l,X		; FF 00 00 38
	sec		; 38
	jmp ($7C7C.w,X)		; 7C 7C 7C
	jmp ($7C7C.w,X)		; 7C 7C 7C
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	plp		; 28
	cpy #$0C.b		; C0 0C
	jsr $0014.w		; 20 14 00
	asl $1208.w,X		; 1E 08 12
	brk $3F.b		; 00 3F
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	brk $38.b		; 00 38
	cpy #$1C.b		; C0 1C
	jsr $001C.w		; 20 1C 00
	asl $00.b,X		; 16 00
	asl $3B00.w,X		; 1E 00 3B
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
	brk $0C.b		; 00 0C
	bra  40.b		; 80 28
	brk $E1.b		; 00 E1
	asl $FFD3.w,X		; 1E D3 FF
	sbc ($FF.b,X)		; E1 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	cmp ($FF.b,S),Y		; D3 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cmp ($FF.b,S),Y		; D3 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	cmp ($FF.b,S),Y		; D3 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	sbc $FF.b,S		; E3 FF
	php		; 08
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $0AFFE3.l,X		; FF E3 FF 0A
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $E3.b		; 00 E3
	sbc $00000C.l,X		; FF 0C 00 00
	brk $12.b		; 00 12
	brk $E3.b		; 00 E3
	sbc $00000E.l,X		; FF 0E 00 00
	brk $E2.b		; 00 E2
	sbc $20FFF3.l,X		; FF F3 FF 20
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $22FFF3.l,X		; FF F3 FF 22
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $F3.b		; 00 F3
	sbc $004020.l,X		; FF 20 40 00
	brk $FE.b		; 00 FE
	sbc $22FFF3.l,X		; FF F3 FF 22
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
	tsb $00.b		; 04 00
	phd		; 0B
	brk $16.b		; 00 16
	ora ($14.b,X)		; 01 14
	cop $28.b		; 02 28
	tsb $38.b		; 04 38
	trb $48.b		; 14 48
	tsb $48.b		; 04 48
	bit $07.b		; 24 07
	brk $0F.b		; 00 0F
	brk $1E.b		; 00 1E
	ora ($1C.b,X)		; 01 1C
	cop $38.b		; 02 38
	tsb $28.b		; 04 28
	tsb $78.b		; 04 78
	tsb $58.b		; 04 58
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0F0000.l,X		; FF 00 00 0F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0F0000.l,X		; FF 00 00 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $003F3F.l,X		; 3F 3F 3F 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $0100.w,X		; FE 00 01
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($FE.b,X)		; 01 FE
	brk $01.b		; 00 01
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	bra   0.b		; 80 00
	rti		; 40

	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $50.b		; 00 50
	bra 112.b		; 80 70
	ldy #$48.b		; A0 48
	bra  72.b		; 80 48
	bcc -128.b		; 90 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	bra  80.b		; 80 50
	bra 120.b		; 80 78
	bra 104.b		; 80 68
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
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $1F0F0F.l		; 0F 0F 0F 1F
	ora $7F1F1F.l,X		; 1F 1F 1F 7F
	brk $1F.b		; 00 1F
	ora $3F1F1F.l,X		; 1F 1F 1F 3F
	and $7F303F.l,X		; 3F 3F 30 7F
	bvs 127.b		; 70 7F
	rts		; 60

	adc $7F7F60.l,X		; 7F 60 7F 7F
	inc $0E00.w,X		; FE 00 0E
	tsb $0607.w		; 0C 07 06
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FFFE.w,X		; FE FE FF
	brk $FF.b		; 00 FF
	jsr ($FEE3.w,X)		; FC E3 FE
	sbc ($FF.b,X)		; E1 FF
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	jsr ($FDFF.w,X)		; FC FF FD
	sbc $FC7FFD.l,X		; FF FD 7F FC
	adc $403F40.l,X		; 7F 40 3F 40
	and $8000E0.l,X		; 3F E0 00 80
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $82.b		; 00 82
	bra -126.b		; 80 82
	bra -62.b		; 80 C2
	cpy #$C0.b		; C0 C0
	cpy #$FF.b		; C0 FF
	cpx #$FF.b		; E0 FF
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $00D680.l,X		; FF 80 D6 00
	cmp $EF00.w,Y		; D9 00 EF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F7F00.l,X		; FF 00 7F 7F
	lsr $7F.b,X		; 56 7F
	eor $6F7F.w,Y		; 59 7F 6F
	adc $FF0000.l,X		; 7F 00 00 FF
	brk $FF.b		; 00 FF
	sbc $1BFF03.l,X		; FF 03 FF 1B
	sbc $03BF1B.l,X		; FF 1B BF 03
	lda $00FF80.l,X		; BF 80 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FC.b		; 00 FC
	brk $E4.b		; 00 E4
	cpx #$A4.b		; E0 A4
	cpx #$A4.b		; E0 A4
	cpx #$64.b		; E0 64
	cpx #$00.b		; E0 00
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	cpx #$F7.b		; E0 F7
	sbc ($F9.b,S),Y		; F3 F9
	sbc ($F7.b),Y		; F1 F7
	sbc [$F7.b]		; E7 F7
	sbc [$27.b]		; E7 27
	cmp [$27.b]		; C7 27
	cmp [$7F.b]		; C7 7F
	brk $1F.b		; 00 1F
	ora $0C.b,S		; 03 0C
	ora [$08.b]		; 07 08
	ora $1F181F.l		; 0F 1F 18 1F
	clc		; 18
	and $383F38.l,X		; 3F 38 3F 38
	sbc $00FF7F.l,X		; FF 7F FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0080FF.l,X		; FF FF 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpx #$00.b		; E0 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	cpx #$60.b		; E0 60
	cpx #$60.b		; E0 60
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	tsb $80.b		; 04 80
	ora $80.b,S		; 03 80
	ora ($7E.b,X)		; 01 7E
	ora $00.b,S		; 03 00
	ora $01.b,S		; 03 01
	asl $01.b		; 06 01
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	tsb $FC.b		; 04 FC
	ora $FE.b,S		; 03 FE
	ora ($7E.b,X)		; 01 7E
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	asl $00.b		; 06 00
	adc ($28.b)		; 72 28
	lda ($28.b,S),Y		; B3 28
	lda ($68.b),Y		; B1 68
	bne  79.b		; D0 4F
	bcs  79.b		; B0 4F
	rts		; 60

	sta $FF807F.l,X		; 9F 7F 80 FF
	bra  82.b		; 80 52
	asl A		; 0A
	cmp ($0B.b,S),Y		; D3 0B
	sta ($09.b),Y		; 91 09
	bcs  15.b		; B0 0F
	bra   0.b		; 80 00
	and $107F20.l,X		; 3F 20 7F 10
	adc $003F10.l,X		; 7F 10 3F 00
	ora $718E00.l,X		; 1F 00 8E 71
	cpy #$3F.b		; C0 3F
	sec		; 38
	cmp [$00.b]		; C7 00
	sbc $8000FF.l,X		; FF FF 00 80
	brk $3F.b		; 00 3F
	and $FF1F1F.l,X		; 3F 1F 1F FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  63.b		; 80 3F
	cpy #$10.b		; C0 10
	sbc $FCFF00.l		; EF 00 FF FC
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  -1.b		; 80 FF
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora $04.b,S		; 03 04
	ora [$FF.b]		; 07 FF
	ora [$20.b]		; 07 20
	cmp $FFFF00.l,X		; DF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $04.b,S		; 03 04
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc ($00.b,X)		; E1 00
	cmp $30.b,S		; C3 30
	inc $FFF0.w,X		; FE F0 FF
	bvs -113.b		; 70 8F
	brk $FF.b		; 00 FF
	sbc $000700.l,X		; FF 00 07 00
	brk $E1.b		; 00 E1
	brk $C3.b		; 00 C3
	sec		; 38
	dec $0FF8.w		; CE F8 0F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $D03800.l,X		; FF 00 38 D0
	bit $50.b,X		; 34 50
	bit $58.b,X		; 34 58
	and $C936C8.l		; 2F C8 36 C9
	tas		; 1B
	cpx $FB.b		; E4 FB
	asl $FD.b		; 06 FD
	asl $28.b		; 06 28
	cpy #$2C.b		; C0 2C
	rti		; 40

	bit $40.b		; 24 40
	and [$C1.b],Y		; 37 C1
	asl $01.b		; 06 01
	sbc ($10.b,S),Y		; F3 10
	sbc $F920.w,Y		; F9 20 F9
	jsr $0000.w		; 20 00 00
	brk $78.b		; 00 78
	bra   4.b		; 80 04
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	bra  -4.b		; 80 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	lda $70CF3F.l,X		; BF 3F CF 70
	cpy $3F0C.w		; CC 0C 3F
	cpy #$00.b		; C0 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $C000FF.l,X		; FF FF 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	sbc $8000FF.l,X		; FF FF 00 80
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $001FFF.l,X		; FF FF 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0080FF.l,X		; FF FF 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $2E00FF.l,X		; FF FF 00 2E
	rol $00FF.w		; 2E FF 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	bvs   0.b		; 70 00
	bne -64.b		; D0 C0
	bmi -32.b		; 30 E0
	bvs  64.b		; 70 40
	cpy #$30.b		; C0 30
	brk $F0.b		; 00 F0
	beq   0.b		; F0 00
	brk $F0.b		; 00 F0
	beq   0.b		; F0 00
	bmi   0.b		; 30 00
	bpl   0.b		; 10 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	beq -16.b		; F0 F0
	brk $30.b		; 00 30
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	eor $3C.b,S		; 43 3C
	adc ($0E.b),Y		; 71 0E
	adc $403F00.l,X		; 7F 00 3F 40
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	eor $7F.b,S		; 43 7F
	adc ($7F.b),Y		; 71 7F
	adc $7F3F7F.l,X		; 7F 7F 3F 7F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00C300.l,X		; FF 00 C3 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C3C3FF.l,X		; FF FF C3 C3
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $502F40.l,X		; 3F 40 2F 50
	and $542B50.l		; 2F 50 2B 54
	asl A		; 0A
	and $00.b,X		; 35 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	adc $2F7F2F.l,X		; 7F 2F 7F 2F
	adc $0A7F2B.l,X		; 7F 2B 7F 0A
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	and $000000.l,X		; 3F 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	asl $F7.b		; 06 F7
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000001.l,X		; FF 01 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	pha		; 48
	and $8F3A.w,X		; 3D 3A 8F
	bra  45.b		; 80 2D
	cpx #$FF.b		; E0 FF
	ora $DF00FF.l		; 0F FF 00 DF
	brk $40.b		; 00 40
	bra  40.b		; 80 28
	cli		; 58
	rti		; 40

	brk $7F.b		; 00 7F
	cop $00.b		; 02 00
	sbc $FFF0F0.l,X		; FF F0 F0 FF
	sbc $40DFDF.l,X		; FF DF DF 40
	cpy #$C0.b		; C0 C0
	bcs -16.b		; B0 F0
	cpx #$88.b		; E0 88
	php		; 08
	tay		; A8
	bmi  -8.b		; 30 F8
	bra  -8.b		; 80 F8
	brk $D0.b		; 00 D0
	php		; 08
	bpl   8.b		; 10 08
	bra -16.b		; 80 F0
	bpl  16.b		; 10 10
	beq   0.b		; F0 00
	php		; 08
	sed		; F8
	sei		; 78
	sei		; 78
	sed		; F8
	sed		; F8
	bne -40.b		; D0 D8
	bpl  24.b		; 10 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $0100.w,X		; FE 00 01
	bra   4.b		; 80 04
	brk $F9.b		; 00 F9
	ora [$F4.b]		; 07 F4
	sbc $F4FFF9.l,X		; FF F9 FF F4
	sbc $000000.l,X		; FF 00 00 00
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $5C.b		; 00 5C
	tay		; A8
	and ($3D.b)		; 32 3D
	bra 120.b		; 80 78
	ldy #$68.b		; A0 68
	ora [$F8.b]		; 07 F8
	bra 127.b		; 80 7F
	ora $0F3000.l,X		; 1F 00 30 0F
	cli		; 58
	ldy $0040.w		; AC 40 00
	sta [$00.b]		; 87 00
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	sbc $00F0FF.l,X		; FF FF F0 00
	sed		; F8
	brk $3E.b		; 00 3E
	jsr $7898.w		; 20 98 78
	cop $3C.b		; 02 3C
	asl A		; 0A
	bit $3EC0.w		; 2C C0 3E
	cop $FC.b		; 02 FC
	beq   0.b		; F0 00
	clc		; 18
	cpx #$2E.b		; E0 2E
	rol $04.b,X		; 36 04
	brk $C2.b		; 00 C2
	brk $02.b		; 00 02
	jsr ($FE00.w,X)		; FC 00 FE
	inc $FCFE.w,X		; FE FE FC
	brk $DF.b		; 00 DF
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	jsr ($FFDF.w,X)		; FC DF FF
	cpy #$C0.b		; C0 C0
	rti		; 40

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	brk $F6.b		; 00 F6
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ror $F6F6.w,X		; 7E F6 F6
	asl $06.b		; 06 06
	asl $06.b		; 06 06
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
	brk $FF.b		; 00 FF
	sbc $02FFFF.l,X		; FF FF FF 02
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $7F.b		; 00 7F
	ora $006060.l,X		; 1F 60 60 00
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra -33.b		; 80 DF
	brk $3F.b		; 00 3F
	brk $68.b		; 00 68
	php		; 08
	rts		; 60

	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	sbc $DFFF7F.l,X		; FF 7F FF DF
	cmp $200000.l,X		; DF 00 00 20
	bra -16.b		; 80 F0
	cpy #$30.b		; C0 30
	bmi   8.b		; 30 08
	brk $F0.b		; 00 F0
	php		; 08
	cpx #$18.b		; E0 18
	bne   8.b		; D0 08
	cpx #$00.b		; E0 00
	bmi -128.b		; 30 80
	bmi   0.b		; 30 00
	sed		; F8
	php		; 08
	sed		; F8
	brk $00.b		; 00 00
	sed		; F8
	cpx #$F8.b		; E0 F8
	bne -40.b		; D0 D8
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	bra   4.b		; 80 04
	brk $F9.b		; 00 F9
	php		; 08
	pea $F9FF.w		; F4 FF F9
	sbc $00FFF4.l,X		; FF F4 FF 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $0C.b		; 00 0C
	brk $60.b		; 00 60
	ora $1C007F.l,X		; 1F 7F 00 1C
	ora [$70.b]		; 07 70
	adc [$80.b],Y		; 77 80
	brk $00.b		; 00 00
	sbc $2C003F.l,X		; FF 3F 00 2C
	tsb $9F7F.w		; 0C 7F 9F
	adc $FBEB00.l,X		; 7F 00 EB FB
	sed		; F8
	dey		; 88
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	sed		; F8
	brk $08.b		; 00 08
	rts		; 60

	tsb $FCF0.w		; 0C F0 FC
	brk $70.b		; 00 70
	cpy #$1C.b		; C0 1C
	jmp.w [$0002]		; DC 02 00
	brk $FE.b		; 00 FE
	sed		; F8
	brk $08.b		; 00 08
	rts		; 60

	jsr ($FCF1.w,X)		; FC F1 FC
	brk $AE.b		; 00 AE
	ldx $223E.w,Y		; BE 3E 22
	cop $FC.b		; 02 FC
	brk $FE.b		; 00 FE
	adc $40BF80.l,X		; 7F 80 BF 40
	cpy #$00.b		; C0 00
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C0FFBF.l,X		; FF BF FF C0
	cpy #$40.b		; C0 40
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	cop $FC.b		; 02 FC
	cop $06.b		; 02 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FEFC.w,X		; FE FC FE
	asl $06.b		; 06 06
	asl $06.b		; 06 06
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
	cpx #$E0.b		; E0 E0
	rti		; 40

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
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	sed		; F8
	ora #$F4.b		; 09 F4
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $000001.l,X		; FF 01 00 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $004000.l,X		; FF 00 40 00
	brk $F9.b		; 00 F9
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $F0.b		; 00 F0
	sbc $004002.l,X		; FF 02 40 00
	brk $03.b		; 00 03
	sty $4D.b		; 84 4D
	ldx $FC.b,Y		; B6 FC
	jsr ($0000.w,X)		; FC 00 00
	sbc $FB0400.l,X		; FF 00 04 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	pha		; 48
	bit $03.b,X		; 34 03
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $06.b		; 00 06
	brk $EF.b		; 00 EF
	sbc $F0E0E0.l		; EF E0 E0 F0
	php		; 08
	cpx $0F1B.w		; EC 1B 0F
	ora $FF0000.l		; 0F 00 00 FF
	brk $08.b		; 00 08
	sbc [$00.b],Y		; F7 00
	brk $00.b		; 00 00
	brk $C7.b		; 00 C7
	cmp [$C4.b]		; C7 C4
	phd		; 0B
	beq  -1.b		; F0 FF
	sbc $0000FF.l,X		; FF FF 00 00
	clc		; 18
	brk $FD.b		; 00 FD
	sbc $0101.w,X		; FD 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	bit $106C.w		; 2C 6C 10
	stz $877F.w		; 9C 7F 87
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2C.b		; 00 2C
	jmp $7F5C.w		; 4C 5C 7F
	sei		; 78
	asl A		; 0A
	brk $09.b		; 00 09
	brk $F3.b		; 00 F3
	ora $FFEF.w		; 0D EF FF
	pea $EFFF.w		; F4 FF EF
	sbc $000000.l,X		; FF 00 00 00
	brk $FC.b		; 00 FC
	sbc $01FFEF.l,X		; FF EF FF 01
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $EF.b		; 00 EF
	sbc $000002.l,X		; FF 02 00 00
	brk $0C.b		; 00 0C
	brk $EF.b		; 00 EF
	sbc $000003.l,X		; FF 03 00 00
	brk $F3.b		; 00 F3
	sbc $04FFF7.l,X		; FF F7 FF 04
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $05FFF7.l,X		; FF F7 FF 05
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F7.b		; 00 F7
	sbc $000006.l,X		; FF 06 00 00
	brk $0B.b		; 00 0B
	brk $F7.b		; 00 F7
	sbc $000007.l,X		; FF 07 00 00
	brk $F4.b		; 00 F4
	sbc $08FFFF.l,X		; FF FF FF 08
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $FF.b		; 00 FF
	sbc $000008.l,X		; FF 08 00 00
	brk $0F.b		; 00 0F
	brk $10.b		; 00 10
	ora [$18.b]		; 07 18
	tsb $0B20.w		; 0C 20 0B
	ora ($7E.b,X)		; 01 7E
	adc $810000.l,X		; 7F 00 00 81
	adc $0083.w,X		; 7D 83 00
	brk $0F.b		; 00 0F
	php		; 08
	ora $09.b		; 05 09
	tas		; 1B
	ora ($00.b),Y		; 11 00
	brk $07.b		; 00 07
	ora [$7E.b]		; 07 7E
	ror $017E.w,X		; 7E 7E 01
	sbc $E30000.l,X		; FF 00 00 E3
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sbc $3EFF1C.l,X		; FF 1C FF 3E
	sbc $A25D00.l,X		; FF 00 5D A2
	brk $00.b		; 00 00
	sbc $80801C.l,X		; FF 1C 80 80
	bra -128.b		; 80 80
	adc $C1FF63.l,X		; 7F 63 FF C1
	trb $3E1C.w		; 1C 1C 3E
	brk $F8.b		; 00 F8
	brk $04.b		; 00 04
	beq  12.b		; F0 0C
	clc		; 18
	asl $EC.b		; 06 EC
	cpx #$1F.b		; E0 1F
	sbc $608000.l,X		; FF 00 80 60
	ora $0000A0.l,X		; 1F A0 00 00
	sed		; F8
	php		; 08
	bne   8.b		; D0 08
	inx		; E8
	cpy $80.b		; C4 80
	bra -16.b		; 80 F0
	beq  31.b		; F0 1F
	ora $00407F.l,X		; 1F 7F 40 00
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
	brk $02.b		; 00 02
	sbc $BF7F.w,X		; FD 7F BF
	brk $00.b		; 00 00
	cpy #$FF.b		; C0 FF
	and $7F00C0.l,X		; 3F C0 00 7F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	cop $3D.b		; 02 3D
	brk $3F.b		; 00 3F
	sbc $C03FFF.l,X		; FF FF 3F C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	sei		; 78
	sei		; 78
	sta $C0C020.l,X		; 9F 20 C0 C0
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	cpx #$00.b		; E0 00
	bra 127.b		; 80 7F
	ora $0000E0.l,X		; 1F E0 00 00
	cpy #$40.b		; C0 40
	and $EFEFFF.l,X		; 3F FF EF EF
	sbc $1F1F00.l,X		; FF 00 1F 1F
	ldy #$40.b		; A0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	sta [$3F.b],Y		; 97 3F
	and $000000.l,X		; 3F 00 00 00
	sbc $1000FF.l,X		; FF FF 00 10
	sbc $00FF00.l		; EF 00 FF 00
	brk $68.b		; 00 68
	eor [$C0.b],Y		; 57 C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	jsr $0000.w		; 20 00 00
	ora $03.b,S		; 03 03
	rti		; 40

	cpx #$C0.b		; E0 C0
	cpx #$00.b		; E0 00
	brk $60.b		; 00 60
	cpx #$80.b		; E0 80
	rts		; 60

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpx #$E0.b		; E0 E0
	bra  96.b		; 80 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	bpl   0.b		; 10 00
	beq  17.b		; F0 11
	nop		; EA
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $000002.l,X		; FF 02 00 00
	brk $02.b		; 00 02
	brk $F0.b		; 00 F0
	sbc $004000.l,X		; FF 00 40 00
	brk $F3.b		; 00 F3
	sbc $04FFE0.l,X		; FF E0 FF 04
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $E0.b		; 00 E0
	sbc $000006.l,X		; FF 06 00 00
	brk $0F.b		; 00 0F
	bmi  47.b		; 30 2F
	bpl   0.b		; 10 00
	adc $107F3F.l,X		; 7F 3F 7F 10
	sbc $7FEF50.l		; EF 50 EF 7F
	sbc $0F807F.l,X		; FF 7F 80 0F
	ora $000101.l		; 0F 01 01 00
	brk $00.b		; 00 00
	and $102F10.l,X		; 3F 10 2F 10
	adc $3F7F00.l		; 6F 00 7F 3F
	and $FF3FFF.l,X		; 3F FF 3F FF
	ora [$7F.b]		; 07 7F
	bra -49.b		; 80 CF
	beq -89.b		; F0 A7
	sed		; F8
	lda $CC.b,S		; A3 CC
	beq -16.b		; F0 F0
	sed		; F8
	ora [$FF.b]		; 07 FF
	cpy #$FF.b		; C0 FF
	sed		; F8
	ora $03.b,S		; 03 03
	brk $C0.b		; 00 C0
	ora $E0.b,S		; 03 E0
	bmi -48.b		; 30 D0
	ora $F8F8FF.l		; 0F FF F8 F8
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $03FCC0.l,X		; FF C0 FC 03
	sbc $F107.w,Y		; F9 07 F1
	tsb $0303.w		; 0C 03 03
	ora [$F8.b]		; 07 F8
	sbc $07FF00.l,X		; FF 00 FF 07
	beq  48.b		; F0 30
	brk $00.b		; 00 00
	beq   1.b		; F0 01
	ora $02.b,S		; 03 02
	jsr ($07FF.w,X)		; FC FF 07
	ora [$FC.b]		; 07 FC
	ora $FD.b,S		; 03 FD
	cop $80.b		; 02 80
	adc $42FFFF.l,X		; 7F FF FF 42
	sbc $FD42.w,X		; FD 42 FD
	sbc $00FFFF.l,X		; FF FF FF 00
	jsr ($E0FC.w,X)		; FC FC E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	sbc $02FD02.l,X		; FF 02 FD 02
	sbc $FF00.w,X		; FD 00 FF
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
	cpy #$FF.b		; C0 FF
	and $7100C0.l,X		; 3F C0 00 71
	brk $31.b		; 00 31
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C03FFF.l,X		; FF FF 3F C0
	brk $00.b		; 00 00
	asl $4E0E.w		; 0E 0E 4E
	lsr $7F7F.w		; 4E 7F 7F
	jmp ($3C7C.w,X)		; 7C 7C 3C
	bit $0000.w,X		; 3C 00 00
	brk $FF.b		; 00 FF
	jsr ($7400.w,X)		; FC 00 74
	dey		; 88
	mvn $00,$AB		; 54 AB 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0300FF.l,X		; FF FF 00 03
	ora $73.b,S		; 03 73
	ora $50.b,S		; 03 50
	jsr $FFFF.w		; 20 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $040B00.l		; 0F 00 0B 04
	asl A		; 0A
	sbc $00.b,X		; F5 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $F000FF.l,X		; FF FF 00 F0
	beq -13.b		; F0 F3
	beq   2.b		; F0 02
	ora ($FF.b,X)		; 01 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $8000FF.l,X		; FF FF 00 80
	adc $80.b,S		; 63 80
	adc $00.b,S		; 63 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $9C.b		; 00 9C
	trb $1C9C.w		; 1C 9C 1C
	sbc $0F0FFF.l,X		; FF FF 0F 0F
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	ora $071000.l		; 0F 00 10 07
	jsr $5008.w		; 20 08 50
	trb $6720.w		; 1C 20 67
	and $0000BF.l,X		; 3F BF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $111908.l		; 0F 08 19 11
	and $0731.w		; 2D 31 07
	jsr $7F40.w		; 20 40 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $CFCF00.l,X		; FF 00 CF CF
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FE0000.l,X		; FF 00 00 FE
	brk $01.b		; 00 01
	brk $13.b		; 00 13
	brk $3E.b		; 00 3E
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003901.l,X		; FF 01 39 00
	tsa		; 3B
	bpl  62.b		; 10 3E
	bmi   0.b		; 30 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	bra  64.b		; 80 40
	rts		; 60

	cpy #$D0.b		; C0 D0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rti		; 40

	cpy #$00.b		; C0 00
	rti		; 40

	jsr $06E0.w		; 20 E0 06
	bra  24.b		; 80 18
	brk $EC.b		; 00 EC
	asl $E4.b,X		; 16 E4
	sbc $E4FFEC.l,X		; FF EC FF E4
	sbc $000000.l,X		; FF 00 00 00
	brk $FC.b		; 00 FC
	sbc $02FFE4.l,X		; FF E4 FF 02
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $E4.b		; 00 E4
	sbc $000004.l,X		; FF 04 00 00
	brk $EC.b		; 00 EC
	sbc $06FFF4.l,X		; FF F4 FF 06
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $08FFF4.l,X		; FF F4 FF 08
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $F4.b		; 00 F4
	sbc $00000A.l,X		; FF 0A 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $05.b		; 00 05
	ora ($09.b,X)		; 01 09
	ora $09.b		; 05 09
	ora $00.b		; 05 00
	ora $000000.l,X		; 1F 00 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	sbc $80E080.l,X		; FF 80 E0 80
	cpy #$80.b		; C0 80
	sbc [$00.b]		; E7 00
	lda [$05.b],Y		; B7 05
	sta $00F00F.l,X		; 9F 0F F0 00
	brk $3F.b		; 00 3F
	rti		; 40

	rts		; 60

	bra  71.b		; 80 47
	sta [$6F.b]		; 87 6F
	txa		; 8A
	lda $079A0F.l,X		; BF 0F 9A 07
	ora ($01.b,X)		; 01 01
	sbc $E00000.l,X		; FF 00 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00001F.l,X		; FF 1F 00 00
	sbc $1F1F1F.l,X		; FF 1F 1F 1F
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	sbc $00FFE0.l,X		; FF E0 FF 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $39.b		; 00 39
	brk $13.b		; 00 13
	inc $0001.w,X		; FE 01 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $38.b		; 00 38
	brk $7C.b		; 00 7C
	bpl 125.b		; 10 7D
	sec		; 38
	tda		; 7B
	bpl -16.b		; 10 F0
	beq -64.b		; F0 C0
	brk $A0.b		; 00 A0
	cpy #$50.b		; C0 50
	cpy #$48.b		; C0 48
	cpy #$68.b		; C0 68
	cpx #$24.b		; E0 24
	tay		; A8
	bit $28.b		; 24 28
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	ldy #$60.b		; A0 60
	bcs 112.b		; B0 70
	bcc 112.b		; 90 70
	bcc  48.b		; 90 30
	bpl  48.b		; 10 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $000080.l,X		; 7F 80 00 00
	brk $00.b		; 00 00
	cpy #$FF.b		; C0 FF
	adc $FF0080.l,X		; 7F 80 00 FF
	brk $7F.b		; 00 7F
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $0000C0.l,X		; 3F C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $00FF4F.l		; 4F 4F FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	cop $FD.b		; 02 FD
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora ($0C.b)		; 12 0C
	bra -128.b		; 80 80
	sbc ($1E.b,X)		; E1 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $008000.l,X		; FF 00 80 00
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra -128.b		; 80 80
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $3F4000.l,X		; FF 00 40 3F
	.db $42, $BD		; 42 BD
	rti		; 40

	lda $FF4040.l,X		; BF 40 40 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  18.b		; 80 12
	tsb $0000.w		; 0C 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $83.b		; 00 83
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($807C.w,X)		; 7C 7C 80
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	bra  64.b		; 80 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	jsr $00E0.w		; 20 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  23.b		; 80 17
	plp		; 28
	ora [$28.b],Y		; 17 28
	brk $7F.b		; 00 7F
	brk $40.b		; 00 40
	ora $F70870.l		; 0F 70 08 F7
	pha		; 48
	sbc [$7F.b],Y		; F7 7F
	sbc $000303.l,X		; FF 03 03 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $08300F.l,X		; 3F 0F 30 08
	and [$08.b],Y		; 37 08
	adc [$00.b],Y		; 77 00
	adc $FF01FF.l,X		; 7F FF 01 FF
	brk $0F.b		; 00 0F
	beq   3.b		; F0 03
	tsb $3AE9.w		; 0C E9 3A
	bit $FF.b		; 24 FF
	bit $FEF1.w		; 2C F1 FE
	inc $FEFF.w,X		; FE FF FE
	adc $00007F.l,X		; 7F 7F 00 00
	beq -16.b		; F0 F0
	pei ($2C.b)		; D4 2C
	php		; 08
	pea $F20E.w		; F4 0E F2
	ora ($FF.b,X)		; 01 FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $00FF0E.l,X		; FF 0E FF 00
	dec $FF31.w		; CE 31 FF
	brk $3F.b		; 00 3F
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	adc ($1E.b),Y		; 71 1E
	asl $3140.w,X		; 1E 40 31
	and $000000.l,X		; 3F 00 00 00
	sbc $F0FFFF.l,X		; FF FF FF F0
	sbc $01FEC0.l,X		; FF C0 FE 01
	sed		; F8
	asl $72.b		; 06 72
	phb		; 8B
	cpx $1F.b		; E4 1F
	stx $71.b		; 86 71
	ora $0FFF0F.l		; 0F 0F FF 0F
	sbc $80803F.l,X		; FF 3F 80 80
	ora ($01.b,X)		; 01 01
	eor $86.b		; 45 86
	.db $82, $05, $0E		; 82 05 0E
	ora #$F0.b		; 09 F0
	sbc $FA05FA.l,X		; FF FA 05 FA
	ora $00.b		; 05 00
	sbc $FC0000.l,X		; FF 00 00 FC
	sta $84.b,S		; 83 84
	xce		; FB
	sty $FB.b		; 84 FB
	sbc $F8F8FF.l,X		; FF FF F8 F8
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	sbc $837CFF.l,X		; FF FF 7C 83
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	adc $7E7E7F.l,X		; 7F 7F 7E 7E
	ror $3C7E.w,X		; 7E 7E 3C
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $9F9FFF.l,X		; FF FF 9F 9F
	ora $0F0F1F.l,X		; 1F 1F 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$80.b		; 09 80
	bit $00.b		; 24 00
	sbc [$19.b]		; E7 19
	cmp $FFE7FF.l,X		; DF FF E7 FF
	cmp $0000FF.l,X		; DF FF 00 00
	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	sbc $0002FF.l		; EF FF 02 00
	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	sbc $0004FF.l,X		; FF FF 04 00
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	cmp $0006FF.l,X		; DF FF 06 00
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $0008FF.l		; EF FF 08 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	cmp $000AFF.l,X		; DF FF 0A 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $000CFF.l		; EF FF 0C 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $000EFF.l,X		; FF FF 0E 00
	brk $00.b		; 00 00
	ora [$00.b],Y		; 17 00
	xba		; EB
	sbc $000020.l,X		; FF 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($03.b,X)		; 01 03
	ora $03.b,S		; 03 03
	ora $07.b,S		; 03 07
	ora [$3F.b]		; 07 3F
	brk $60.b		; 00 60
	bpl -64.b		; 10 C0
	and $4070E0.l		; 2F E0 70 40
	beq  96.b		; F0 60
	sei		; 78
	bcc -100.b		; 90 9C
	bit #$8F.b		; 89 8F
	ora $6F6F1F.l,X		; 1F 1F 6F 6F
	cmp $E090D0.l,X		; DF D0 90 E0
	and ($41.b),Y		; 31 41
	sta $0DE1.w,Y		; 99 E1 0D
	sta ($06.b),Y		; 91 06
	bit #$24.b		; 89 24
	tda		; 7B
	bit $7B.b		; 24 7B
	and $403F7F.l,X		; 3F 7F 3F 40
	and $0000C0.l,X		; 3F C0 00 00
	rts		; 60

	adc $047F60.l,X		; 7F 60 7F 04
	tsa		; 3B
	tsb $3B.b		; 04 3B
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	ora $FFFF1F.l,X		; 1F 1F FF FF
	sta $E09FE0.l,X		; 9F E0 9F E0
	tsb $0DF7.w		; 0C F7 0D
	inc $FF.b,X		; F6 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $09FF00.l,X		; FF 00 FF 09
	inc $09.b,X		; F6 09
	inc $00.b,X		; F6 00
	sbc $FF0000.l,X		; FF 00 00 FF
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
	brk $0F.b		; 00 0F
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $E0.b		; 00 E0
	clv		; B8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E0E000.l,X		; FF 00 E0 E0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	rti		; 40

	cpx #$FF.b		; E0 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpx #$E1.b		; E0 E1
	cpx #$03.b		; E0 03
	brk $03.b		; 00 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	brk $8F.b		; 00 8F
	bcs   7.b		; B0 07
	clv		; B8
	bra -128.b		; 80 80
	inc $F801.w,X		; FE 01 F8
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	sbc $40FF00.l,X		; FF 00 FF 40
	cpy #$C0.b		; C0 C0
	rti		; 40

	adc $0000FF.l,X		; 7F FF 00 00
	beq -16.b		; F0 F0
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $01FE00.l,X		; FF 00 FE 01
	jsr ($0003.w,X)		; FC 03 00
	brk $0F.b		; 00 0F
	beq   3.b		; F0 03
	jsr ($0002.w,X)		; FC 02 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	ora ($01.b,X)		; 01 01
	sbc $FFFD.w,X		; FD FD FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	sbc $000100.l,X		; FF 00 01 00
	cmp ($C0.b,X)		; C1 C0
	sbc $01.b,S		; E3 01
	sbc [$02.b]		; E7 02
	dec $FFFF.w		; CE FF FF
	sbc $01FEFF.l,X		; FF FF FE 01
	sbc ($00.b,X)		; E1 00
	sbc ($C0.b),Y		; F1 C0
	and ($E0.b,S),Y		; 33 E0
	inc $E1.b,X		; F6 E1
	jsr ($80C2.w,X)		; FC C2 80
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	bra -16.b		; 80 F0
	cpy #$50.b		; C0 50
	cpy #$D8.b		; C0 D8
	cpy #$28.b		; C0 28
	jsr $202C.w		; 20 2C 20
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	rts		; 60

	rts		; 60

	bmi -16.b		; 30 F0
	bcs 112.b		; B0 70
	sec		; 38
	sed		; F8
	clc		; 18
	sec		; 38
	trb $263C.w		; 1C 3C 26
	and $2D16.w,X		; 3D 16 2D
	and $00FF3F.l,X		; 3F 3F FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cmp ($ED.b)		; D2 ED
	sbc ($CD.b)		; F2 CD
	cpy #$FF.b		; C0 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	rol $003E.w,X		; 3E 3E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $040B.w		; 0D 0B 04
	phd		; 0B
	trb $1B.b		; 14 1B
	tsb $00.b		; 04 00
	and $1F2000.l,X		; 3F 00 20 1F
	adc $027B04.l,X		; 7F 04 7B 02
	ora $03.b,S		; 03 03
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $041F00.l,X		; 1F 00 1F 04
	tas		; 1B
	sbc $03FFFF.l,X		; FF FF FF 03
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FC.b,S		; 03 FC
	brk $03.b		; 00 03
	jsr ($0DFC.w,X)		; FC FC 0D
	sbc [$00.b],Y		; F7 00
	sbc $FFFCFF.l,X		; FF FF FC FF
	sbc $001F1F.l,X		; FF 1F 1F 00
	brk $FC.b		; 00 FC
	jsr ($FF03.w,X)		; FC 03 FF
	php		; 08
	sbc [$1F.b],Y		; F7 1F
	rts		; 60

	brk $3F.b		; 00 3F
	brk $3C.b		; 00 3C
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	clc		; 18
	clc		; 18
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $00FF1F.l,X		; 1F 1F FF 00
	brk $FF.b		; 00 FF
	cop $1D.b		; 02 1D
	cop $1D.b		; 02 1D
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $E1.b		; E6 E1
	inc $E1.b		; E6 E1
	brk $00.b		; 00 00
	sbc $C0C0FF.l,X		; FF FF C0 C0
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1FFF7F.l,X		; FF 7F FF 1F
	sbc $00FF01.l,X		; FF 01 FF 00
	adc $601F80.l,X		; 7F 80 1F 60
	brk $FF.b		; 00 FF
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $1E1FE0.l,X		; FF E0 1F 1E
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	sta [$80.b]		; 87 80
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFF0.l,X		; FF F0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	jsr ($F800.w,X)		; FC 00 F8
	brk $08.b		; 00 08
	beq -120.b		; F0 88
	bvs -120.b		; 70 88
	adc [$0F.b],Y		; 77 0F
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$C7.b]		; 07 C7
	ora [$C0.b]		; 07 C0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	sbc $01FE.w,X		; FD FE 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $00FFC0.l,X		; FF C0 FF 00
	beq  15.b		; F0 0F
	cpy #$30.b		; C0 30
	sta [$47.b]		; 87 47
	asl $9D.b,X		; 16 9D
	brk $FF.b		; 00 FF
	sbc $3FFF07.l,X		; FF 07 FF 3F
	inc $00FE.w,X		; FE FE 00
	brk $0F.b		; 00 0F
	ora $623F38.l		; 0F 38 3F 62
	adc $F6F0.w,X		; 7D F0 F6
	plx		; FA
	tsb $FA.b		; 04 FA
	ora $FB.b		; 05 FB
	tsb $00.b		; 04 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $08FB04.l,X		; FF 04 FB 08
	sed		; F8
	sed		; F8
	sed		; F8
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	tsb $FB.b		; 04 FB
	sbc $FF0000.l,X		; FF 00 00 FF
	plp		; 28
	cmp [$28.b],Y		; D7 28
	cmp [$00.b],Y		; D7 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6C.b		; 00 6C
	bpl 108.b		; 10 6C
	bpl   0.b		; 10 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000700.l,X		; FF 00 07 00
	ora [$00.b]		; 07 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	ora $03.b,S		; 03 03
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra  64.b		; 80 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  96.b		; 80 60
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpx #$E0.b		; E0 E0
	jsr $20E0.w		; 20 E0 20
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
	brk $0C.b		; 00 0C
	bra  40.b		; 80 28
	brk $E4.b		; 00 E4
	asl $FFDA.w,X		; 1E DA FF
	sbc $FF.b		; E5 FF
	phx		; DA
	sbc $000000.l,X		; FF 00 00 00
	brk $F5.b		; 00 F5
	sbc $02FFDA.l,X		; FF DA FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $DA.b		; 00 DA
	sbc $000004.l,X		; FF 04 00 00
	brk $15.b		; 00 15
	brk $DA.b		; 00 DA
	sbc $000006.l,X		; FF 06 00 00
	brk $E4.b		; 00 E4
	sbc $08FFEA.l,X		; FF EA FF 08
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $0AFFEA.l,X		; FF EA FF 0A
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $EA.b		; 00 EA
	sbc $00000C.l,X		; FF 0C 00 00
	brk $14.b		; 00 14
	brk $EA.b		; 00 EA
	sbc $00000E.l,X		; FF 0E 00 00
	brk $E6.b		; 00 E6
	sbc $20FFFA.l,X		; FF FA FF 20
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $22FFFA.l,X		; FF FA FF 22
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $FA.b		; 00 FA
	sbc $004020.l,X		; FF 20 40 00
	brk $FC.b		; 00 FC
	sbc $22FFFA.l,X		; FF FA FF 22
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $01.b		; 02 01
	clc		; 18
	rol $00.b		; 26 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($02.b,X)		; 01 02
	cop $01.b		; 02 01
	ora ($0F.b,X)		; 01 0F
	brk $38.b		; 00 38
	brk $64.b		; 00 64
	ora [$D8.b],Y		; 17 D8
	trb $38B0.w		; 1C B0 38
	jsr $50B8.w		; 20 B8 50
	jmp ($CEC8.w,X)		; 7C C8 CE
	ora $3F3F0F.l		; 0F 0F 3F 3F
	rtl		; 6B

	jmp ($F8E4.w)		; 6C E4 F8
	iny		; C8
	beq  88.b		; F0 58
	rts		; 60

	lda $07D1.w		; AD D1 07
	cmp #$FF.b		; C9 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	jsr $7000.w		; 20 00 70
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $707000.l,X		; FF 00 70 70
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3E3E3E.l,X		; FF 3E 3E 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	asl A		; 0A
	asl $0E00.w		; 0E 00 0E
	tsb $0E.b		; 04 0E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000E00.l,X		; FF 00 0E 00
	ora $0E1506.l,X		; 1F 06 15 0E
	and $0E3B0E.l,X		; 3F 0E 3B 0E
	sed		; F8
	brk $06.b		; 00 06
	php		; 08
	ora ($F4.b,S),Y		; 13 F4
	ora $061C.w		; 0D 1C 06
	asl $1E02.w		; 0E 02 1E
	ora #$3B.b		; 09 3B
	ora ($71.b),Y		; 11 71
	sed		; F8
	sed		; F8
	inc $F6.b,X		; F6 F6
	xba		; EB
	tas		; 1B
	ora ($0F.b,S),Y		; 13 0F
	ora #$07.b		; 09 07
	sta $B203.w,X		; 9D 03 B2
	ora #$E0.b		; 09 E0
	ora ($00.b),Y		; 11 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra  32.b		; 80 20
	rti		; 40

	sty $00B2.w		; 8C B2 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$40.b		; C0 40
	rti		; 40

	ldy #$A0.b		; A0 A0
	rti		; 40

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
	brk $1F.b		; 00 1F
	adc $12700F.l,X		; 7F 0F 70 12
	sbc $ED32.w		; ED 32 ED
	and $BF7FE0.l,X		; 3F E0 7F BF
	adc $C03F80.l,X		; 7F 80 3F C0
	brk $1F.b		; 00 1F
	ora $0D1200.l,X		; 1F 00 12 0D
	ora ($2D.b)		; 12 2D
	ora $3F0020.l,X		; 1F 20 00 3F
	brk $00.b		; 00 00
	ora $FFFE1F.l,X		; 1F 1F FE FF
	inc $0203.w,X		; FE 03 02
	sbc $FFFF02.l,X		; FF 02 FF FF
	cop $FF.b		; 02 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $01.b		; 00 01
	inc $02FD.w,X		; FE FD 02
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0002.w,X		; FD 02 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $47B08F.l,X		; FF 8F B0 47
	cld		; D8
	and $EC.b,S		; 23 EC
	rts		; 60

	sta [$F8.b],Y		; 97 F8
	ora #$F8.b		; 09 F8
	sed		; F8
	sbc $01FE00.l,X		; FF 00 FE 01
	rti		; 40

	cpy #$A1.b		; C0 A1
	rts		; 60

	bvc -80.b		; 50 B0
	sei		; 78
	dey		; 88
	inc $0E.b,X		; F6 0E
	ora [$FF.b]		; 07 FF
	ora $03.b,S		; 03 03
	jsr ($FFFC.w,X)		; FC FC FF
	brk $9E.b		; 00 9E
	adc ($FF.b,X)		; 61 FF
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	sbc $C00000.l,X		; FF 00 00 C0
	and $00FF00.l,X		; 3F 00 FF 00
	brk $80.b		; 00 80
	adc ($7F.b,X)		; 61 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FC.b		; 00 FC
	ora $78.b,S		; 03 78
	stx $F1.b		; 86 F1
	ora $7A81.w		; 0D 81 7A
	ora [$E4.b]		; 07 E4
	ora [$07.b]		; 07 07
	sbc $E01F00.l,X		; FF 00 1F E0
	brk $00.b		; 00 00
	adc ($81.b,X)		; 61 81
	.db $82, $03, $07		; 82 03 07
	tsb $1B.b		; 04 1B
	trb $FFF8.w		; 1C F8 FF
	bmi  48.b		; 30 30
	ora $7F5F0F.l		; 0F 0F 5F 7F
	sta $FF10F0.l,X		; 9F F0 10 FF
	bcc 127.b		; 90 7F
	sbc $FFFF10.l,X		; FF 10 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ldy #$DF.b		; A0 DF
	adc $7F8090.l		; 6F 90 80 7F
	bra 127.b		; 80 7F
	sbc $FF0010.l		; EF 10 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $0901.w,X		; FE 01 09
	inc $09.b,X		; F6 09
	inc $FF.b,X		; F6 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $0900FF.l,X		; FF FF 00 09
	inc $09.b,X		; F6 09
	inc $FF.b,X		; F6 FF
	brk $00.b		; 00 00
	sbc $FE0000.l,X		; FF 00 00 FE
	inc $C000.w,X		; FE 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $0142.w,X		; 3C 42 01
	and $0F00.w,X		; 3D 00 0F
	phd		; 0B
	trb $1B.b		; 14 1B
	bit $3B.b		; 24 3B
	mvp $7F,$00		; 44 00 7F
	brk $C0.b		; 00 C0
	and $023D.w,X		; 3D 3D 02
	ora $00.b,S		; 03 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $FFC784.l,X		; 3F 84 C7 FF
	sbc $FFFE01.l,X		; FF 01 FE FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $0100.w,X		; FE 00 01
	eor $84.b,S		; 43 84
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0F0FFF.l,X		; FF FF 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $DEFE.w,X		; FE FE DE
	inc $FFFF.w,X		; FE FF FF
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $00FF03.l,X		; FF 03 FF 00
	sbc $807F00.l,X		; FF 00 7F 80
	jsr $0070.w		; 20 70 00
	sbc $FF0F0F.l,X		; FF 0F 0F FF
	bra  -1.b		; 80 FF
	jsr ($0F0F.w,X)		; FC 0F 0F
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3CFFFF.l,X		; FF FF FF 3C
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3C3CC3.l,X		; FF C3 3C 3C
	brk $04.b		; 00 04
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $C0FFFE.l,X		; FF FE FF C0
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $3F01.w,X		; FE 01 3F
	tsb $00.b		; 04 00
	sbc $FFF0F0.l,X		; FF F0 F0 FF
	ora ($FF.b,X)		; 01 FF
	and $80E0E0.l,X		; 3F E0 E0 80
	bra   0.b		; 80 00
	brk $20.b		; 00 20
	adc ($FF.b,X)		; 61 FF
	sbc $FF7F80.l,X		; FF 80 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $C18000.l,X		; 7F 00 80 C1
	jsr $FF00.w		; 20 00 FF
	brk $00.b		; 00 00
	sbc $F0F0FF.l,X		; FF FF F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $A19E7F.l,X		; 7F 7F 9E A1
	cpy #$FE.b		; C0 FE
	brk $F8.b		; 00 F8
	inx		; E8
	trb $EC.b		; 14 EC
	ora ($EE.b)		; 12 EE
	ora ($00.b),Y		; 11 00
	sbc $5E0100.l,X		; FF 00 01 5E
	dec $C000.w,X		; DE 00 C0
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $00FE.w,X		; FE FE 00
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
	brk $F0.b		; 00 F0
	sbc $3FFFF0.l,X		; FF F0 FF 3F
	cpy #$0F.b		; C0 0F
	beq   0.b		; F0 00
	adc $007E00.l,X		; 7F 00 7E 00
	asl $FFFF.w		; 0E FF FF
	ora $F00FF0.l		; 0F F0 0F F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	and ($31.b),Y		; 31 31
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F9F8.w,Y		; F9 F8 F9
	sed		; F8
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($FE.b,X)		; 01 FE
	sbc ($0E.b),Y		; F1 0E
	sta ($6E.b),Y		; 91 6E
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $98.b		; 00 98
	rts		; 60

	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $003F00.l,X		; FF 00 3F 00
	jsr $231F.w		; 20 1F 23
	trb $DD22.w		; 1C 22 DD
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cmp [$C0.b]		; C7 C0
	asl $01.b		; 06 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	cpy #$38.b		; C0 38
	rti		; 40

	clv		; B8
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$07.b]		; E7 07
	adc [$87.b]		; 67 87
	brk $00.b		; 00 00
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $03FC00.l,X		; FF 00 FC 03
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $1C.b		; 00 1C
	sbc $01FEFF.l,X		; FF FF FE 01
	inc $0001.w,X		; FE 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$E3.b		; E0 E3
	sbc $00.b,S		; E3 00
	brk $E0.b		; 00 E0
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq  -1.b		; F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $808F8F.l,X		; FF 8F 8F 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	sed		; F8
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
	sbc $000000.l,X		; FF 00 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $2C80.w		; 0E 80 2C
	brk $DF.b		; 00 DF
	jsl $E2FFD4.l		; 22 D4 FF E2
	sbc $00FFD4.l,X		; FF D4 FF 00
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $02FFD4.l,X		; FF D4 FF 02
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $D4.b		; 00 D4
	sbc $000004.l,X		; FF 04 00 00
	brk $12.b		; 00 12
	brk $D4.b		; 00 D4
	sbc $000006.l,X		; FF 06 00 00
	brk $DF.b		; 00 DF
	sbc $08FFE4.l,X		; FF E4 FF 08
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	sbc $0AFFE4.l,X		; FF E4 FF 0A
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0CFFE4.l,X		; FF E4 FF 0C
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	brk $E4.b		; 00 E4
	sbc $004008.l,X		; FF 08 40 00
	brk $03.b		; 00 03
	brk $E4.b		; 00 E4
	sbc $00000E.l,X		; FF 0E 00 00
	brk $E0.b		; 00 E0
	sbc $20FFF4.l,X		; FF F4 FF 20
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $22FFF4.l,X		; FF F4 FF 22
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $000024.l,X		; FF 24 00 00
	brk $12.b		; 00 12
	brk $F4.b		; 00 F4
	sbc $004020.l,X		; FF 20 40 00
	brk $02.b		; 00 02
	brk $F4.b		; 00 F4
	sbc $004022.l,X		; FF 22 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	brk $1C.b		; 00 1C
	ora $30.b,S		; 03 30
	php		; 08
	stz $17.b		; 64 17
	cld		; D8
	trb $38B0.w		; 1C B0 38
	jsr $70B8.w		; 20 B8 70
	jmp ($0303.w,X)		; 7C 03 03
	tsb $370C.w		; 0C 0C 37
	and [$6B.b],Y		; 37 6B
	jmp ($F8E4.w)		; 6C E4 F8
	iny		; C8
	beq  88.b		; F0 58
	rts		; 60

	sty $FFF0.w		; 8C F0 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	trb $1C14.w		; 1C 14 1C
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	trb $3E1C.w		; 1C 1C 3E
	rol $3E3E.w,X		; 3E 3E 3E
	rtl		; 6B

	adc $0000FF.l,X		; 7F FF 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $0100FF.l,X		; FF FF 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	rts		; 60

	brk $F0.b		; 00 F0
	ldy #$F0.b		; A0 F0
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	beq   0.b		; F0 00
	sed		; F8
	rts		; 60

	jsr ($5CF0.w,X)		; FC F0 5C
	beq -128.b		; F0 80
	brk $E0.b		; 00 E0
	brk $30.b		; 00 30
	rti		; 40

	tya		; 98
	ldy #$6C.b		; A0 6C
	cpx #$36.b		; E0 36
	bvs  19.b		; 70 13
	stz $3B.b,X		; 74 3B
	sed		; F8
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	bcs -80.b		; B0 B0
	cli		; 58
	cld		; D8
	stz $4E7C.w		; 9C 7C 4E
	rol $1A6A.w,X		; 3E 6A 1A
	cmp [$3F.b]		; C7 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0011.w		; 0E 11 00
	ora $0F3000.l,X		; 1F 00 30 0F
	and $093807.l,X		; 3F 07 38 09
	ror $19.b,X		; 76 19
	ror $19.b,X		; 76 19
	ror $00.b,X		; 76 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $0F0F00.l		; 0F 00 0F 0F
	brk $09.b		; 00 09
	asl $09.b		; 06 09
	asl $09.b,X		; 16 09
	asl $FF.b,X		; 16 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1F00FF.l,X		; FF FF 00 1F
	cpx #$03.b		; E0 03
	trb $F7D0.w		; 1C D0 F7
	iny		; C8
	tda		; 7B
	cpy $7D.b		; C4 7D
	dex		; CA
	ror $CC.b,X		; 76 CC
	adc ($00.b)		; 72 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$28.b		; E0 28
	cld		; D8
	ldy $4C.b,X		; B4 4C
	txa		; 8A
	ror $8D.b,X		; 76 8D
	adc ($8F.b,S),Y		; 73 8F
	adc ($FF.b),Y		; 71 FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7C.b		; 00 7C
	sta $3F.b,S		; 83 3F
	cpy #$1F.b		; C0 1F
	cpx #$07.b		; E0 07
	sei		; 78
	adc $0F0F7C.l,X		; 7F 7C 0F 0F
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	trb $0703.w		; 1C 03 07
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  -1.b		; 80 FF
	jsr ($F0FF.w,X)		; FC FF F0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc ($0C.b,S),Y		; F3 0C
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FF01.w,X		; FE 01 FF
	ora $FF.b,S		; 03 FF
	ora $00F8F8.l		; 0F F8 F8 00
	brk $03.b		; 00 03
	tsb $00FE.w		; 0C FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($F003.w,X)		; FC 03 F0
	asl $1DE1.w		; 0E E1 1D
.ACCU 16
.INDEX 16
	rep #$3B		; C2 3B
	sta $76.b		; 85 76
	ora $E4.b,S		; 03 E4
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($82.b,X)		; 01 82
	ora $05.b,S		; 03 05
	asl $0B.b		; 06 0B
	tsb $181F.w		; 0C 1F 18
	sbc $00FFC0.l,X		; FF C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rol $FCC1.w,X		; 3E C1 FC
	ora $F8.b,S		; 03 F8
	ora [$E0.b]		; 07 E0
	asl $3CFC.w,X		; 1E FC 3C
	beq -16.b		; F0 F0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	sec		; 38
	cpy #$00E0.w		; C0 E0 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	sbc $07F800.l,X		; FF 00 F8 07
	cpy #$0B38.w		; C0 38 0B
	sbc $23DE13.l		; EF 13 DE 23
	ldx $6E53.w,Y		; BE 53 6E
	and ($4E.b,S),Y		; 33 4E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	trb $1B.b		; 14 1B
	and $5132.w		; 2D 32 51
	ror $CEB1.w		; 6E B1 CE
	sbc ($8E.b),Y		; F1 8E
	ror $11.b		; 66 11
	stz $CA.b,X		; 74 CA
	stz $BA.b,X		; 74 BA
	ora ($7D.b,X)		; 01 7D
	brk $1F.b		; 00 1F
	ora [$28.b],Y		; 17 28
	and [$48.b],Y		; 37 48
	and [$48.b],Y		; 37 48
	cop $02.b		; 02 02
	adc $35.b,X		; 75 35
	adc $45.b,X		; 75 45
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	pha		; 48
	ror $C7C4.w		; 6E C4 C7
	.db $82, $C3, $FF		; 82 C3 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $A6.b		; 00 A6
	iny		; C8
	ora $C4.b,S		; 03 C4
	eor ($82.b,X)		; 41 82
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $1C000F.l		; 0F 0F 00 1C
	brk $14.b		; 00 14
	adc [$FF.b],Y		; 77 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $07FF3F.l,X		; FF 3F FF 07
	sbc $7F7F00.l,X		; FF 00 7F 7F
	adc $3E887F.l,X		; 7F 7F 88 3E
	brk $FF.b		; 00 FF
	ora [$07.b]		; 07 07
	sbc $F8FFC0.l,X		; FF C0 FF F8
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	sbc $1FFFFF.l,X		; FF FF FF 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E0FFFF.l,X		; FF FF FF E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0007FC.l,X		; FF FC 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	sbc $00FF1F.l,X		; FF 1F FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	brk $F1.b		; 00 F1
	rti		; 40

	sbc ($01.b,S),Y		; F3 01
	adc [$FF.b]		; 67 FF
	sbc $FF03FC.l,X		; FF FC 03 FF
	beq  -1.b		; F0 FF
	bra  -1.b		; 80 FF
	brk $FD.b		; 00 FD
	beq -65.b		; F0 BF
	beq  -2.b		; F0 FE
	adc ($00.b,X)		; 61 00
	sbc $FF8080.l,X		; FF 80 80 FF
	ora $FF7FFF.l		; 0F FF 7F FF
	sbc $8CDA49.l,X		; FF 49 DA 8C
	sta $0D04.w		; 8D 04 0D
	inc $00FE.w,X		; FE FE 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $95.b		; 00 95
	eor $8E02.w		; 4D 02 8E
	asl A		; 0A
	asl $01.b		; 06 01
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $C0FEFE.l,X		; FF FE FE C0
	cpy #$209C.w		; C0 9C 20
	ldy $BC46.w,X		; BC 46 BC
	phy		; 5A
	brk $FC.b		; 00 FC
	brk $E0.b		; 00 E0
	ldy #$B050.w		; A0 50 B0
	pha		; 48
	bcs  72.b		; B0 48
	brk $00.b		; 00 00
	ldy $BCB8.w,X		; BC B8 BC
	ldy $00.b		; A4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	bvs  63.b		; 70 3F
	eor $1F403F.l,X		; 5F 3F 40 1F
	cpx #$8000.w		; E0 00 80
	brk $00.b		; 00 00
	sei		; 78
	adc $0F7F78.l,X		; 7F 78 7F 0F
	bpl   0.b		; 10 00
	ora $0F0000.l,X		; 1F 00 00 0F
	ora $FF7F7F.l		; 0F 7F 7F FF
	sbc $87F887.l,X		; FF 87 F8 87
	sed		; F8
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $41FF00.l,X		; FF 00 FF 41
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ldx $0041.w,Y		; BE 41 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	ora $FC0000.l,X		; 1F 00 00 FC
	ora $E0.b,S		; 03 E0
	ora $000800.l,X		; 1F 00 08 00
	brk $00.b		; 00 00
	sbc $E0FF00.l,X		; FF 00 FF E0
	cpx #$FFFF.w		; E0 FF FF
	bmi  48.b		; 30 30
	cpy #$F7C0.w		; C0 C0 F7
	sbc [$FF.b],Y		; F7 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $030000.l,X		; FF 00 00 03
	jsr ($FF00.w,X)		; FC 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	inc $FFFE.w,X		; FE FE FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $0F.b		; 00 0F
	dey		; 88
	ora $00FF0F.l		; 0F 0F FF 00
	adc $000080.l,X		; 7F 80 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc [$78.b],Y		; 77 78
	beq  -1.b		; F0 FF
	cpy #$3FC0.w		; C0 C0 3F
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sed		; F8
	brk $00.b		; 00 00
	and $F807C0.l,X		; 3F C0 07 F8
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$07.b]		; 07 07
	sbc $0C0CFF.l,X		; FF FF 0C 0C
	ora $03.b,S		; 03 03
	sbc $FFFFEF.l		; EF EF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF82.l,X		; FF 82 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $0082.w,X		; 7D 82 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $3F.b		; 00 3F
	cpy #$F00F.w		; C0 0F F0
	brk $7F.b		; 00 7F
	brk $7E.b		; 00 7E
	brk $3F.b		; 00 3F
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	and ($31.b),Y		; 31 31
	bit $3F3C.w,X		; 3C 3C 3F
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $00.b		; 00 00
	sbc $000300.l,X		; FF 00 03 00
	sbc $000300.l,X		; FF 00 03 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($0000.w,X)		; FC 00 00
	jsr ($00FC.w,X)		; FC FC 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $26C13E.l,X		; FF 3E C1 26
	cmp $CD32.w,Y		; D9 32 CD
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $186700.l,X		; 7F 00 67 18
	adc ($0C.b,S),Y		; 73 0C
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	cpx #$2000.w		; E0 00 20
	cpy #$C020.w		; C0 20 C0
	jsr $20DF.w		; 20 DF 20
	cmp $00C03F.l,X		; DF 3F C0 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0100FF.l,X		; FF FF 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	inc $FE01.w,X		; FE 01 FE
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $E619E0.l,X		; 1F E0 19 E6
	ora ($EC.b,S),Y		; 13 EC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $063900.l,X		; 3F 00 39 06
	and ($0C.b,S),Y		; 33 0C
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	sbc ($F1.b),Y		; F1 F1
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
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
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	brk $F8.b		; 00 F8
	php		; 08
	pea $F8FF.w		; F4 FF F8
	sbc $00FFF4.l,X		; FF F4 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $000001.l,X		; FF 01 00 00
	brk $08.b		; 00 08
	brk $F4.b		; 00 F4
	sbc $000002.l,X		; FF 02 00 00
	brk $F8.b		; 00 F8
	sbc $03FFFC.l,X		; FF FC FF 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $000004.l,X		; FF 04 00 00
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	sbc $004003.l,X		; FF 03 40 00
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
	asl A		; 0A
	brk $08.b		; 00 08
	brk $F4.b		; 00 F4
	tsb $FFEF.w		; 0C EF FF
	pea $EFFF.w		; F4 FF EF
	sbc $000000.l,X		; FF 00 00 00
	brk $FC.b		; 00 FC
	sbc $01FFEF.l,X		; FF EF FF 01
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $EF.b		; 00 EF
	sbc $000002.l,X		; FF 02 00 00
	brk $0C.b		; 00 0C
	brk $EF.b		; 00 EF
	sbc $000003.l,X		; FF 03 00 00
	brk $F4.b		; 00 F4
	sbc $04FFF7.l,X		; FF F7 FF 04
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $05FFF7.l,X		; FF F7 FF 05
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $F7.b		; 00 F7
	sbc $000006.l,X		; FF 06 00 00
	brk $FD.b		; 00 FD
	sbc $05FFF7.l,X		; FF F7 FF 05
	rti		; 40

	brk $00.b		; 00 00
	pea $FFFF.w		; F4 FF FF
	sbc $000007.l,X		; FF 07 00 00
	brk $0A.b		; 00 0A
	brk $FF.b		; 00 FF
	sbc $000007.l,X		; FF 07 00 00
	brk $0F.b		; 00 0F
	brk $18.b		; 00 18
	brk $30.b		; 00 30
	brk $2C.b		; 00 2C
	tsb $607F.w		; 0C 7F 60
	adc $000000.l,X		; 7F 00 00 00
	sbc $0F0F88.l,X		; FF 88 0F 0F
	ora $38391F.l,X		; 1F 1F 39 38
	and ($3C.b),Y		; 31 3C
	rts		; 60

	brk $1F.b		; 00 1F
	ora $01FFFF.l,X		; 1F FF FF 01
	ror $FF.b,X		; 76 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $BE.b		; 00 BE
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $C101C1.l,X		; FF C1 01 C1
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	sbc $C1FFFF.l,X		; FF FF FF C1
	rol $00F8.w,X		; 3E F8 00
	tsb $0600.w		; 0C 00 06
	brk $1A.b		; 00 1A
	clc		; 18
	sbc $00FF03.l,X		; FF 03 FF 00
	brk $00.b		; 00 00
	sbc $F8F808.l,X		; FF 08 F8 F8
	jsr ($CEFC.w,X)		; FC FC CE
	dec $DEC6.w		; CE C6 DE
	ora $00.b,S		; 03 00
	jsr ($FFFC.w,X)		; FC FC FF
	sbc $0037C0.l,X		; FF C0 37 00
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
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $FE.b		; 00 FE
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	brk $7F.b		; 00 7F
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $007F7F.l,X		; FF 7F 7F 00
	brk $FF.b		; 00 FF
	sbc $3EE0E0.l,X		; FF E0 E0 3E
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $C1.b		; 00 C1
	rol $C1FF.w,X		; 3E FF C1
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	adc $00FFFF.l,X		; 7F FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $0001.w,X		; FE 01 00
	sbc $000000.l,X		; FF 00 00 00
	brk $80.b		; 00 80
	brk $FE.b		; 00 FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FCFCFF.l,X		; FF FF FC FC
	brk $00.b		; 00 00
	sbc $0707FF.l,X		; FF FF 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	bra  16.b		; 80 10
	brk $F0.b		; 00 F0
	bpl -22.b		; 10 EA
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $000002.l,X		; FF 02 00 00
	brk $01.b		; 00 01
	brk $F0.b		; 00 F0
	sbc $004000.l,X		; FF 00 40 00
	brk $F2.b		; 00 F2
	sbc $04FFE0.l,X		; FF E0 FF 04
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $E0.b		; 00 E0
	sbc $000006.l,X		; FF 06 00 00
	brk $3F.b		; 00 3F
	and $00403F.l,X		; 3F 3F 40 00
	eor $FD7D7D.l,X		; 5F 7D 7D FD
	bra  -3.b		; 80 FD
	sbc $00FF.w,X		; FD FF 00
	and $003FC0.l,X		; 3F C0 3F 00
	ora $20200F.l		; 0F 0F 20 20
	.db $82, $82, $02		; 82 82 02
	adc $7F0202.l,X		; 7F 02 02 7F
	adc $FF0000.l,X		; 7F 00 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $B388B0.l,X		; FF B0 88 B3
	phd		; 0B
	sta $BB.b,S		; 83 BB
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $7F0000.l,X		; FF 00 00 7F
	eor [$7C.b]		; 47 7C
	cmp [$7C.b]		; C7 7C
	eor [$FF.b]		; 47 FF
	jsr ($0000.w,X)		; FC 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $7F.b		; 00 7F
	asl $08.b		; 06 08
	inc $E8.b		; E6 E8
	cpx #$EFEE.w		; E0 EE EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF8080.l,X		; FF 80 80 FF
	sbc ($1F.b),Y		; F1 1F
	sbc ($1F.b),Y		; F1 1F
	sbc ($FF.b),Y		; F1 FF
	ora $FE0000.l,X		; 1F 00 00 FE
	inc $01FE.w,X		; FE FE 01
	brk $FD.b		; 00 FD
	cmp $00DFDF.l,X		; DF DF DF 00
	cmp $00FFDF.l,X		; DF DF FF 00
	inc $FE01.w,X		; FE 01 FE
	brk $F8.b		; 00 F8
	sed		; F8
	cop $02.b		; 02 02
	jsr $2020.w		; 20 20 20
	sbc $FF2020.l,X		; FF 20 20 FF
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
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	and $7F0000.l,X		; 3F 00 00 7F
	adc $7C7C7C.l,X		; 7F 7C 7C 7C
	jmp ($7878.w,X)		; 7C 78 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $00FE.w,X		; FE FE 00
	brk $FF.b		; 00 FF
	sbc $1F1F1F.l,X		; FF 1F 1F 1F
	ora $000F0F.l,X		; 1F 0F 0F 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $1C.b		; 00 1C
	tsb $38.b		; 04 38
	php		; 08
	pla		; 68
	php		; 08
	mvn $DF,$14		; 54 14 DF
	sta $000000.l,X		; 9F 00 00 00
	brk $0F.b		; 00 0F
	ora $301F1B.l		; 0F 1B 1F 30
	sec		; 38
	adc ($78.b),Y		; 71 78
	adc ($74.b,X)		; 61 74
	cpx #$007F.w		; E0 7F 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($FF.b,X)		; 01 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $18FFFE.l,X		; FF FE FF 18
	clc		; 18
	bit $3C3C.w,X		; 3C 3C 3C
	and $FF00.w,X		; 3D 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	bra -80.b		; 80 B0
	bra  80.b		; 80 50
	rti		; 40

	cld		; D8
	iny		; C8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$60C0.w		; C0 C0 60
	cpx #$F070.w		; E0 70 F0
	bmi 112.b		; 30 70
	sec		; 38
	beq   6.b		; F0 06
	bra  20.b		; 80 14
	brk $EB.b		; 00 EB
	ora $E4.b,X		; 15 E4
	sbc $E4FFEB.l,X		; FF EB FF E4
	sbc $000000.l,X		; FF 00 00 00
	brk $FB.b		; 00 FB
	sbc $02FFE4.l,X		; FF E4 FF 02
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $E4.b		; 00 E4
	sbc $000004.l,X		; FF 04 00 00
	brk $EB.b		; 00 EB
	sbc $06FFF4.l,X		; FF F4 FF 06
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $08FFF4.l,X		; FF F4 FF 08
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $F4.b		; 00 F4
	sbc $004006.l,X		; FF 06 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	cop $06.b		; 02 06
	tsb $0C.b		; 04 0C
	tsb $080C.w		; 0C 0C 08
	ora $00000C.l,X		; 1F 0C 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $01.b,S		; 03 01
	ora [$03.b]		; 07 03
	ora $070F03.l		; 0F 03 0F 07
	tsb $7F00.w		; 0C 00 7F
	adc $E0C0C0.l,X		; 7F C0 C0 E0
	rts		; 60

	brk $00.b		; 00 00
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$A0A0.w		; E0 A0 A0
	sbc $007F00.l,X		; FF 00 7F 00
	sbc $E0873F.l,X		; FF 3F 87 E0
	sta $C00F80.l		; 8F 80 0F C0
	ora $A01FE0.l		; 0F E0 1F A0
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$0000.w		; C0 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $3E1C1C.l,X		; FF 1C 1C 3E
	rol $3E3E.w,X		; 3E 3E 3E
	rol $7F3E.w,X		; 3E 3E 7F
	adc $C00000.l,X		; 7F 00 00 C0
	cpy #$6060.w		; C0 60 60
	beq -48.b		; F0 D0
	clc		; 18
	php		; 08
	jmp ($F664.w)		; 6C 64 F6
	inc $B6.b,X		; F6 B6
	lda ($FF.b)		; B2 FF
	asl $C0.b		; 06 C0
	brk $E0.b		; 00 E0
	bra  48.b		; 80 30
	cpx #$3038.w		; E0 38 30
	trb $0E78.w		; 1C 78 0E
	sed		; F8
	asl A		; 0A
	clv		; B8
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $0000C0.l,X		; 3F C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $403F80.l,X		; 7F 80 3F 40
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $00FF3F.l,X		; 3F 3F FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $031FFF.l,X		; FF FF 1F 03
	ora $3F0030.l		; 0F 30 00 3F
	brk $00.b		; 00 00
	and $407F00.l,X		; 3F 00 7F 40
	adc $807F7F.l,X		; 7F 7F 7F 80
	ora $03030C.l		; 0F 0C 03 03
	brk $00.b		; 00 00
	adc $7F407F.l,X		; 7F 7F 40 7F
	bra -65.b		; 80 BF
	bra -128.b		; 80 80
	and $FFFF3F.l,X		; 3F 3F FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	adc [$00.b],Y		; 77 00
	adc [$00.b],Y		; 77 00
	bvs 119.b		; 70 77
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $F88FFF.l,X		; FF FF 8F F8
	sta $888FF8.l		; 8F F8 8F 88
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FB0000.l,X		; FF 00 00 FB
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	and $BF3FBF.l,X		; 3F BF 3F BF
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $0404FF.l,X		; FF FF 04 04
	sbc $40FFFF.l,X		; FF FF FF 40
	cpy #$C07F.w		; C0 7F C0
	adc $FFC0FF.l,X		; 7F FF C0 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $1D0000.l,X		; FF 00 00 1D
	ldy #$A09D.w		; A0 9D A0
	sta ($BD.b,X)		; 81 BD
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $43FEFF.l,X		; FF FF FE 43
	ror $7EC3.w,X		; 7E C3 7E
.ACCU 16
.INDEX 16
	rep #$FF		; C2 FF
	adc $FEF8FF.l,X		; 7F FF F8 FE
	ora ($00.b,X)		; 01 00
	sbc $DF0000.l,X		; FF 00 00 DF
	brk $DF.b		; 00 DF
	brk $DF.b		; 00 DF
	cmp $FE00FF.l,X		; DF FF 00 FE
	asl $F8.b		; 06 F8
	sed		; F8
	brk $00.b		; 00 00
	sbc $FF20FF.l,X		; FF FF 20 FF
	jsr $20FF.w		; 20 FF 20
	jsr $FFFF.w		; 20 FF FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$C040.w		; C0 40 C0
	cpy #$20C0.w		; C0 C0 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$40C0.w		; C0 C0 40
	cpy #$A020.w		; C0 20 A0
	jsr $8020.w		; 20 20 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $003F3F.l,X		; 3F 3F 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $4C0A4F.l,X		; FF 4F 0A 4C
	brk $00.b		; 00 00
	adc $0C.b,S		; 63 0C
	lda $14.b		; A5 14
	php		; 08
	and ($6B.b,X)		; 21 6B
	and $39CE.w		; 2D CE 39
	and ($46.b),Y		; 31 46
	adc ($4E.b,S),Y		; 73 4E
	dec $5A.b,X		; D6 5A
	and $9C67.w,Y		; 39 67 9C
	adc ($FF.b,S),Y		; 73 FF
	adc $FF025F.l,X		; 7F 5F 02 FF
	brk $57.b		; 00 57
	brk $AD.b		; 00 AD
	eor $0006.w		; 4D 06 00
	ora $3300.w		; 0D 00 33
	tsb $7A.b		; 04 7A
	tsb $253B.w		; 0C 3B 25
	trb $FE42.w		; 1C 42 FE
	lsr $7FFF.w,X		; 5E FF 7F
	eor ($4A.b)		; 52 4A
	sty $C631.w		; 8C 31 C6
	clc		; 18
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	ora #$DA00.w		; 09 00 DA
	clc		; 18
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	ora $621F62.l,X		; 1F 62 1F 62
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 07FFFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 07FFFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 07FFFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 07FFFF. Skipping.
.ENDS
