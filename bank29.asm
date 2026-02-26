.BANK 29 SLOT 0
.ORG $0000

.SECTION "Bank29" FORCE

	cli		; 58
	ora ($00.b,X)		; 01 00
	ora $B8.b,S		; 03 B8
	ora ($00.b,X)		; 01 00
	ora $18.b,S		; 03 18
	cop $00.b		; 02 00
	cop $70.b		; 02 70
	cop $00.b		; 02 00
	cop $C8.b		; 02 C8
	cop $00.b		; 02 00
	ora ($F8.b,X)		; 01 F8
	cop $00.b		; 02 00
	sty $A0.b		; 84 A0
	tsb $00.b		; 04 00
	sta $C0.b,S		; 83 C0
	ora $00.b		; 05 00
	ora $50.b		; 05 50
	asl $00.b		; 06 00
	ora $B0.b,S		; 03 B0
	asl $00.b		; 06 00
	cop $08.b		; 02 08
	ora [$00.b]		; 07 00
	sty $B0.b		; 84 B0
	php		; 08
	brk $83.b		; 00 83
	bne   9.b		; D0 09
	brk $05.b		; 00 05
	rts		; 60

	asl A		; 0A
	brk $03.b		; 00 03
	cpy #$0A.b		; C0 0A
	brk $02.b		; 00 02
	clc		; 18
	phd		; 0B
	brk $84.b		; 00 84
	cpy #$0C.b		; C0 0C
	brk $83.b		; 00 83
	cpx #$0D.b		; E0 0D
	brk $07.b		; 00 07
	ldy #$0E.b		; A0 0E
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	brk $02.b		; 00 02
	cli		; 58
	ora $008400.l		; 0F 00 84 00
	ora ($00.b),Y		; 11 00
	sta $20.b,S		; 83 20
	ora ($00.b)		; 12 00
	ora [$E0.b]		; 07 E0
	ora ($00.b)		; 12 00
	ora $40.b,S		; 03 40
	ora ($00.b,S),Y		; 13 00
	cop $98.b		; 02 98
	ora ($00.b,S),Y		; 13 00
	sta $C8.b		; 85 C8
	ora $00.b,X		; 15 00
	sta $E8.b,S		; 83 E8
	asl $00.b,X		; 16 00
	asl $A0.b		; 06 A0
	ora [$00.b],Y		; 17 00
	ora $00.b,S		; 03 00
	clc		; 18
	brk $02.b		; 00 02
	cli		; 58
	clc		; 18
	brk $85.b		; 00 85
	dey		; 88
	inc A		; 1A
	brk $83.b		; 00 83
	tay		; A8
	tas		; 1B
	brk $06.b		; 00 06
	rts		; 60

	trb $0300.w		; 1C 00 03
	cpy #$1C.b		; C0 1C
	brk $02.b		; 00 02
	clc		; 18
	ora $8500.w,X		; 1D 00 85
	pha		; 48
	ora $688300.l,X		; 1F 00 83 68
	jsr $0600.w		; 20 00 06
	jsr $0021.w		; 20 21 00
	ora $80.b,S		; 03 80
	and ($00.b,X)		; 21 00
	cop $D8.b		; 02 D8
	and ($00.b,X)		; 21 00
	lda $78.b,S		; A3 78
	and $B89700.l		; 2F 00 97 B8
	and $8D00.w,Y		; 39 00 8D
	tay		; A8
	rti		; 40

	brk $0F.b		; 00 0F
	inx		; E8
	.db $42, $00		; 42 00
	asl $E0.b		; 06 E0
	eor $00.b,S		; 43 00
	stx $98.b		; 86 98
	lsr $00.b		; 46 00
	sta $C8.b		; 85 C8
	pha		; 48
	brk $08.b		; 00 08
	bcs  73.b		; B0 49
	brk $03.b		; 00 03
	bpl  74.b		; 10 4A
	brk $02.b		; 00 02
	pla		; 68
	lsr A		; 4A
	brk $83.b		; 00 83
	php		; 08
	jmp $0400.w		; 4C 00 04
	bcs  76.b		; B0 4C
	brk $03.b		; 00 03
	bmi  77.b		; 30 4D
	brk $02.b		; 00 02
	dey		; 88
	eor $0100.w		; 4D 00 01
	clv		; B8
	eor $8200.w		; 4D 00 82
	bne  78.b		; D0 4E
	brk $02.b		; 00 02
	plp		; 28
	eor $800200.l		; 4F 00 02 80
	eor $B00100.l		; 4F 00 01 B0
	eor $E00100.l		; 4F 00 01 E0
	eor $708100.l		; 4F 00 81 70
	bvc   0.b		; 50 00
	ora ($A0.b,X)		; 01 A0
	bvc   0.b		; 50 00
	ora ($D0.b,X)		; 01 D0
	bvc   0.b		; 50 00
	ora ($00.b,X)		; 01 00
	eor ($00.b),Y		; 51 00
	ora ($30.b,X)		; 01 30
	eor ($00.b),Y		; 51 00
	sty $D8.b		; 84 D8
	eor ($00.b)		; 52 00
	sta $78.b,S		; 83 78
	mvn $05,$00		; 54 00 05
	php		; 08
	eor $00.b,X		; 55 00
	ora $48.b,S		; 03 48
	eor $00.b,X		; 55 00
	cop $80.b		; 02 80
	eor $00.b,X		; 55 00
	dey		; 88
	pha		; 48
	eor $9900.w,Y		; 59 00 99
	clc		; 18
	ror $00.b		; 66 00
	sty $C0.b		; 84 C0
	adc [$00.b]		; 67 00
	sty $68.b		; 84 68
	adc #$00.b		; 69 00
	sta [$28.b]		; 87 28
	adc $0100.w		; 6D 00 01
	cli		; 58
	adc $0100.w		; 6D 00 01
	dey		; 88
	adc $0100.w		; 6D 00 01
	clv		; B8
	adc $0100.w		; 6D 00 01
	inx		; E8
	adc $0100.w		; 6D 00 01
	clc		; 18
	ror $0100.w		; 6E 00 01
	pha		; 48
	ror $0100.w		; 6E 00 01
	sei		; 78
	ror $0100.w		; 6E 00 01
	tay		; A8
	ror $0100.w		; 6E 00 01
	cld		; D8
	ror $0100.w		; 6E 00 01
	php		; 08
	adc $038600.l		; 6F 00 86 03
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	ora ($E9.b,X)		; 01 E9
	brk $FF.b		; 00 FF
	sbc $00FFE9.l,X		; FF E9 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFF1.l,X		; FF F1 FF 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FFF9.l,X		; FF F9 FF 01
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -32.b		; 80 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$80.b		; E0 80
	cpx #$03.b		; E0 03
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	ora ($EE.b,X)		; 01 EE
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $E9.b		; 00 E9
	sbc $000001.l,X		; FF 01 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	cpy #$02.b		; C0 02
	brk $02.b		; 00 02
	brk $07.b		; 00 07
	brk $F3.b		; 00 F3
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $000001.l,X		; FF 01 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
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
	brk $04.b		; 00 04
	bra  12.b		; 80 0C
	brk $F9.b		; 00 F9
	php		; 08
	cmp #$00.b		; C9 00
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($FF.b,X)		; E1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $D1FF.w,Y		; F9 FF D1
	sbc $000002.l,X		; FF 02 00 00
	brk $F9.b		; 00 F9
	sbc $04FFC1.l,X		; FF C1 FF 04
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
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
	brk $81.b		; 00 81
	ror $7C83.w,X		; 7E 83 7C
	sta [$78.b]		; 87 78
	sta [$78.b]		; 87 78
	stx $79.b		; 86 79
	bra 127.b		; 80 7F
	sbc $000000.l,X		; FF 00 00 00
	sbc $7CFF7E.l,X		; FF 7E FF 7C
	sbc $78FF78.l,X		; FF 78 FF 78
	sbc $7FFF79.l,X		; FF 79 FF 7F
	sbc $010000.l,X		; FF 00 00 01
	sbc ($1E.b,X)		; E1 1E
	cmp ($3E.b,X)		; C1 3E
	sta ($7E.b,X)		; 81 7E
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	sbc $000000.l,X		; FF 00 00 00
	sbc $3EFF1E.l,X		; FF 1E FF 3E
	sbc $FEFF7E.l,X		; FF 7E FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $800000.l,X		; FF 00 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	sbc $7F8000.l,X		; FF 00 80 7F
	stx $79.b		; 86 79
	sta [$78.b]		; 87 78
	sta [$78.b]		; 87 78
	sta $7C.b,S		; 83 7C
	sta ($7E.b,X)		; 81 7E
	bra 127.b		; 80 7F
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $78FF79.l,X		; FF 79 FF 78
	sbc $7CFF78.l,X		; FF 78 FF 7C
	sbc $7FFF7E.l,X		; FF 7E FF 7F
	sbc $FE0100.l,X		; FF 00 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	sta ($7E.b,X)		; 81 7E
	cmp ($3E.b,X)		; C1 3E
	sbc ($1E.b,X)		; E1 1E
	sbc ($0E.b),Y		; F1 0E
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $3EFF7E.l,X		; FF 7E FF 3E
	sbc $0EFF1E.l,X		; FF 1E FF 0E
	ora $80.b,S		; 03 80
	php		; 08
	brk $FB.b		; 00 FB
	ora $D5.b		; 05 D5
	brk $FB.b		; 00 FB
	sbc $00FFD5.l,X		; FF D5 FF 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $02FFE5.l,X		; FF E5 FF 02
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $9C6798.l,X		; 7F 98 67 9C
	adc $8E.b,S		; 63 8E
	adc ($87.b),Y		; 71 87
	sei		; 78
	sta $7C.b,S		; 83 7C
	sta [$78.b]		; 87 78
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $63FF67.l,X		; FF 67 FF 63
	sbc $78FF71.l,X		; FF 71 FF 78
	sbc $78FF7C.l,X		; FF 7C FF 78
	cpx #$00.b		; E0 00
	jsr $20C0.w		; 20 C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$A0.b		; C0 A0
	rti		; 40

	jsr $E0C0.w		; 20 C0 E0
	brk $E0.b		; 00 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	rti		; 40

	cpx #$C0.b		; E0 C0
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $06.b		; 04 06
	tsb $06.b		; 04 06
	tsb $06.b		; 04 06
	tsb $06.b		; 04 06
	tsb $06.b		; 04 06
	tsb $06.b		; 04 06
	tsb $06.b		; 04 06
	tsb $06.b		; 04 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stx $9C71.w		; 8E 71 9C
	adc $98.b,S		; 63 98
	adc [$80.b]		; 67 80
	adc $0000FF.l,X		; 7F FF 00 00
	brk $04.b		; 00 04
	tsb $04.b		; 04 04
	tsb $FF.b		; 04 FF
	adc ($FF.b),Y		; 71 FF
	adc $FF.b,S		; 63 FF
	adc [$FF.b]		; 67 FF
	adc $0000FF.l,X		; 7F FF 00 00
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $20.b		; 06 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$E0.b		; C0 E0
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
	brk $04.b		; 00 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
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
	brk $05.b		; 00 05
	brk $03.b		; 00 03
	brk $FD.b		; 00 FD
	tsb $E0.b		; 04 E0
	brk $FD.b		; 00 FD
	sbc $00FFE0.l,X		; FF E0 FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFE8.l,X		; FF E8 FF 01
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF9.l,X		; FF F9 FF 02
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $81.b		; 00 81
	ror $4EB1.w,X		; 7E B1 4E
	sta $8D66.w,Y		; 99 66 8D
	adc ($8D.b)		; 72 8D
	adc ($99.b)		; 72 99
	ror $B1.b		; 66 B1
	lsr $00FF.w		; 4E FF 00
	sbc $4EFF7E.l,X		; FF 7E FF 4E
	sbc $72FF66.l,X		; FF 66 FF 72
	sbc $66FF72.l,X		; FF 72 FF 66
	sbc $7E814E.l,X		; FF 4E 81 7E
	sbc $000000.l,X		; FF 00 00 00
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	sbc $00FF7E.l,X		; FF 7E FF 00
	brk $18.b		; 00 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	inc $EB02.w,X		; FE 02 EB
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $01FFE9.l,X		; FF E9 FF 01
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $A8.b		; 00 A8
	bvc -104.b		; 50 98
	rts		; 60

	tay		; A8
	bvc  -8.b		; 50 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	bvc  -8.b		; 50 F8
	rts		; 60

	sed		; F8
	bvc  -8.b		; 50 F8
	brk $00.b		; 00 00
	jsr $0002.w		; 20 02 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	inc $00.b,X		; F6 00
	sbc $FFF6FF.l,X		; FF FF F6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $01FF.w,X		; FE FF 01
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	ldy #$20.b		; A0 20
	cpy #$40.b		; C0 40
	ldy #$40.b		; A0 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	cpx #$A0.b		; E0 A0
	cpx #$C0.b		; E0 C0
	cpx #$A0.b		; E0 A0
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	tsb $80.b		; 04 80
	tsb $F900.w		; 0C 00 F9
	php		; 08
	cmp #$00.b		; C9 00
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($FF.b,X)		; E1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $D1FF.w,Y		; F9 FF D1
	sbc $000002.l,X		; FF 02 00 00
	brk $F9.b		; 00 F9
	sbc $04FFC1.l,X		; FF C1 FF 04
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
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
	brk $87.b		; 00 87
	sei		; 78
	sta [$78.b]		; 87 78
	sta [$78.b]		; 87 78
	stx $79.b		; 86 79
	sty $7B.b		; 84 7B
	bra 127.b		; 80 7F
	sbc $000000.l,X		; FF 00 00 00
	sbc $78FF78.l,X		; FF 78 FF 78
	sbc $79FF78.l,X		; FF 78 FF 79
	sbc $7FFF7B.l,X		; FF 7B FF 7F
	sbc $010000.l,X		; FF 00 00 01
	cmp ($3E.b,X)		; C1 3E
	sta ($7E.b,X)		; 81 7E
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	sbc $000000.l,X		; FF 00 00 00
	sbc $7EFF3E.l,X		; FF 3E FF 7E
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $800000.l,X		; FF 00 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	sbc $7F8000.l,X		; FF 00 80 7F
	sty $7B.b		; 84 7B
	stx $79.b		; 86 79
	sta [$78.b]		; 87 78
	sta [$78.b]		; 87 78
	sta [$78.b]		; 87 78
	sta [$78.b]		; 87 78
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $79FF7B.l,X		; FF 7B FF 79
	sbc $78FF78.l,X		; FF 78 FF 78
	sbc $78FF78.l,X		; FF 78 FF 78
	sbc $FE0100.l,X		; FF 00 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	sta ($7E.b,X)		; 81 7E
	cmp ($3E.b,X)		; C1 3E
	sbc ($1E.b,X)		; E1 1E
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $7EFFFE.l,X		; FF FE FF 7E
	sbc $1EFF3E.l,X		; FF 3E FF 1E
	ora $80.b,S		; 03 80
	php		; 08
	brk $FB.b		; 00 FB
	ora $D4.b		; 05 D4
	sbc $D4FFFB.l,X		; FF FB FF D4
	sbc $000000.l,X		; FF 00 00 00
	brk $FB.b		; 00 FB
	sbc $02FFE4.l,X		; FF E4 FF 02
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $986F90.l,X		; 7F 90 6F 98
	adc [$9C.b]		; 67 9C
	adc $9E.b,S		; 63 9E
	adc ($9F.b,X)		; 61 9F
	rts		; 60

	stz $FF61.w,X		; 9E 61 FF
	brk $FF.b		; 00 FF
	adc $FF6FFF.l,X		; 7F FF 6F FF
	adc [$FF.b]		; 67 FF
	adc $FF.b,S		; 63 FF
	adc ($FF.b,X)		; 61 FF
	rts		; 60

	sbc $00E061.l,X		; FF 61 E0 00
	jsr $20C0.w		; 20 C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$E0.b		; C0 E0
	brk $E0.b		; 00 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$04.b		; C0 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
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
	brk $9C.b		; 00 9C
	adc $98.b,S		; 63 98
	adc [$90.b]		; 67 90
	adc $FF7F80.l		; 6F 80 7F FF
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	tsb $04.b		; 04 04
	tsb $FF.b		; 04 FF
	adc $FF.b,S		; 63 FF
	adc [$FF.b]		; 67 FF
	adc $FF7FFF.l		; 6F FF 7F FF
	brk $00.b		; 00 00
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $20.b		; 06 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$20.b		; C0 20
	cpy #$E0.b		; C0 E0
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
	brk $04.b		; 00 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	tsb $04.b		; 04 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	asl $04.b		; 06 04
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
	brk $05.b		; 00 05
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	ora $DF.b,S		; 03 DF
	sbc $DFFFFC.l,X		; FF FC FF DF
	sbc $000000.l,X		; FF 00 00 00
	brk $FC.b		; 00 FC
	sbc $01FFE7.l,X		; FF E7 FF 01
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFEF.l,X		; FF EF FF 02
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFF8.l,X		; FF F8 FF 02
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $81.b		; 00 81
	ror $5EA1.w,X		; 7E A1 5E
	lda ($4E.b),Y		; B1 4E
	lda $BD46.w,Y		; B9 46 BD
	.db $42, $B9		; 42 B9
	lsr $B1.b		; 46 B1
	lsr $00FF.w		; 4E FF 00
	sbc $5EFF7E.l,X		; FF 7E FF 5E
	sbc $46FF4E.l,X		; FF 4E FF 46
	sbc $46FF42.l,X		; FF 42 FF 46
	sbc $5EA14E.l,X		; FF 4E A1 5E
	sbc $000000.l,X		; FF 00 00 00
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	sbc $00FF5E.l,X		; FF 5E FF 00
	brk $18.b		; 00 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	inc $EB02.w,X		; FE 02 EB
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $01FFE9.l,X		; FF E9 FF 01
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $A8.b		; 00 A8
	bvc -72.b		; 50 B8
	rti		; 40

	tay		; A8
	bvc  -8.b		; 50 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	bvc  -8.b		; 50 F8
	rti		; 40

	sed		; F8
	bvc  -8.b		; 50 F8
	brk $00.b		; 00 00
	jsr $0002.w		; 20 02 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	inc $00.b,X		; F6 00
	sbc $FFF6FF.l,X		; FF FF F6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $01FF.w,X		; FE FF 01
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	ldy #$60.b		; A0 60
	bra  64.b		; 80 40
	ldy #$40.b		; A0 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	cpx #$A0.b		; E0 A0
	cpx #$80.b		; E0 80
	cpx #$A0.b		; E0 A0
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	tsb $80.b		; 04 80
	tsb $F900.w		; 0C 00 F9
	php		; 08
	cmp #$00.b		; C9 00
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($FF.b,X)		; E1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $D1FF.w,Y		; F9 FF D1
	sbc $000002.l,X		; FF 02 00 00
	brk $F9.b		; 00 F9
	sbc $04FFC1.l,X		; FF C1 FF 04
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
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
	brk $BE.b		; 00 BE
	eor ($BC.b,X)		; 41 BC
	eor $B8.b,S		; 43 B8
	eor [$B0.b]		; 47 B0
	eor $805FA0.l		; 4F A0 5F 80
	adc $0000FF.l,X		; 7F FF 00 00
	brk $FF.b		; 00 FF
	eor ($FF.b,X)		; 41 FF
	eor $FF.b,S		; 43 FF
	eor [$FF.b]		; 47 FF
	eor $FF5FFF.l		; 4F FF 5F FF
	adc $0000FF.l,X		; 7F FF 00 00
	ora ($7D.b,X)		; 01 7D
	.db $82, $79, $86		; 82 79 86
	adc ($8E.b),Y		; 71 8E
	adc ($9E.b,X)		; 61 9E
	eor ($BE.b,X)		; 41 BE
	ora ($FE.b,X)		; 01 FE
	sbc $000000.l,X		; FF 00 00 00
	sbc $86FF82.l,X		; FF 82 FF 86
	sbc $9EFF8E.l,X		; FF 8E FF 9E
	sbc $FEFFBE.l,X		; FF BE FF FE
	sbc $800000.l,X		; FF 00 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	sbc $7F8000.l,X		; FF 00 80 7F
	ldy #$5F.b		; A0 5F
	bcs  79.b		; B0 4F
	clv		; B8
	eor [$BC.b]		; 47 BC
	eor $BE.b,S		; 43 BE
	eor ($BF.b,X)		; 41 BF
	rti		; 40

	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $4FFF5F.l,X		; FF 5F FF 4F
	sbc $43FF47.l,X		; FF 47 FF 43
	sbc $40FF41.l,X		; FF 41 FF 40
	sbc $FE0100.l,X		; FF 00 01 FE
	eor ($BE.b,X)		; 41 BE
	adc ($9E.b,X)		; 61 9E
	adc ($8E.b),Y		; 71 8E
	adc $7D86.w,Y		; 79 86 7D
	.db $82, $7F, $80		; 82 7F 80
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $9EFFBE.l,X		; FF BE FF 9E
	sbc $86FF8E.l,X		; FF 8E FF 86
	sbc $80FF82.l,X		; FF 82 FF 80
	ora $80.b,S		; 03 80
	php		; 08
	brk $FA.b		; 00 FA
	asl $D5.b		; 06 D5
	brk $FA.b		; 00 FA
	sbc $00FFD5.l,X		; FF D5 FF 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFE5.l,X		; FF E5 FF 02
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $B15EA1.l,X		; 7F A1 5E B1
	lsr $46B9.w		; 4E B9 46
	lda $BF42.w,X		; BD 42 BF
	rti		; 40

	lda $FF42.w,X		; BD 42 FF
	brk $FF.b		; 00 FF
	adc $FF5EFF.l,X		; 7F FF 5E FF
	lsr $46FF.w		; 4E FF 46
	sbc $40FF42.l,X		; FF 42 FF 40
	sbc $00F842.l,X		; FF 42 F8 00
	php		; 08
	beq   8.b		; F0 08
	beq -120.b		; F0 88
	bvs -56.b		; 70 C8
	bmi -24.b		; 30 E8
	bpl  -8.b		; 10 F8
	brk $E8.b		; 00 E8
	bpl  -8.b		; 10 F8
	brk $F8.b		; 00 F8
	beq  -8.b		; F0 F8
	beq  -8.b		; F0 F8
	bvs  -8.b		; 70 F8
	bmi  -8.b		; 30 F8
	bpl  -8.b		; 10 F8
	brk $F8.b		; 00 F8
	bpl   2.b		; 10 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
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
	brk $B9.b		; 00 B9
	lsr $B1.b		; 46 B1
	lsr $5EA1.w		; 4E A1 5E
	bra 127.b		; 80 7F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	sbc $4EFF46.l,X		; FF 46 FF 4E
	sbc $7FFF5E.l,X		; FF 5E FF 7F
	sbc $030000.l,X		; FF 00 00 03
	brk $03.b		; 00 03
	cop $03.b		; 02 03
	iny		; C8
	bmi -120.b		; 30 88
	bvs   8.b		; 70 08
	beq   8.b		; F0 08
	beq  -8.b		; F0 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	bmi  -8.b		; 30 F8
	bvs  -8.b		; 70 F8
	beq  -8.b		; F0 F8
	beq  -8.b		; F0 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
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
	brk $07.b		; 00 07
	brk $04.b		; 00 04
	brk $FD.b		; 00 FD
	ora $E0.b		; 05 E0
	brk $FD.b		; 00 FD
	sbc $00FFE0.l,X		; FF E0 FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFE8.l,X		; FF E8 FF 01
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF9.l,X		; FF F9 FF 02
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $E0.b		; 00 E0
	sbc $000003.l,X		; FF 03 00 00
	brk $05.b		; 00 05
	brk $E2.b		; 00 E2
	sbc $000003.l,X		; FF 03 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	adc $B65BA4.l,X		; 7F A4 5B B6
	eor #$B6.b		; 49 B6
	eor #$B6.b		; 49 B6
	eor #$B6.b		; 49 B6
	eor #$A4.b		; 49 A4
	tad		; 5B
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $49FF5B.l,X		; FF 5B FF 49
	sbc $49FF49.l,X		; FF 49 FF 49
	sbc $5BFF49.l,X		; FF 49 FF 5B
	bra 127.b		; 80 7F
	sbc $101000.l,X		; FF 00 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	sbc $00FF7F.l,X		; FF 7F FF 00
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bpl  24.b		; 10 18
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	inc $EB02.w,X		; FE 02 EB
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $FE.b		; 00 FE
	sbc $01FFE9.l,X		; FF E9 FF 01
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	bvc -88.b		; 50 A8
	bvc -88.b		; 50 A8
	bvc -88.b		; 50 A8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	sed		; F8
	tay		; A8
	sed		; F8
	tay		; A8
	sed		; F8
	tay		; A8
	sed		; F8
	sed		; F8
	brk $20.b		; 00 20
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	inc $00.b,X		; F6 00
	sbc $FFF6FF.l,X		; FF FF F6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $01FF.w,X		; FE FF 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	ldy #$A0.b		; A0 A0
	ldy #$A0.b		; A0 A0
	ldy #$A0.b		; A0 A0
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	tsb $80.b		; 04 80
	tsb $F900.w		; 0C 00 F9
	ora [$C9.b]		; 07 C9
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	sbc $000000.l,X		; FF 00 00 00
	brk $F9.b		; 00 F9
	sbc $02FFD1.l,X		; FF D1 FF 02
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $04FFC1.l,X		; FF C1 FF 04
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $8FFFFF.l,X		; FF FF FF 8F
	sta $8F8F8F.l		; 8F 8F 8F 8F
	sta $8F8F8F.l		; 8F 8F 8F 8F
	sta $8F8F8F.l		; 8F 8F 8F 8F
	sta $FE9F9F.l		; 8F 9F 9F FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	ldx #$A2.b		; A2 A2
	ldx #$A2.b		; A2 A2
	ldx #$A2.b		; A2 A2
	ldx #$A2.b		; A2 A2
	ldx #$A2.b		; A2 A2
	ldx #$A2.b		; A2 A2
	ldx #$A2.b		; A2 A2
	sbc ($F2.b)		; F2 F2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	bra -128.b		; 80 80
	sbc $0100FF.l,X		; FF FF 00 01
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	inc $FEFE.w,X		; FE FE FE
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	inc $00FE.w,X		; FE FE 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $878080.l,X		; FF 80 80 87
	sta [$8F.b]		; 87 8F
	sta $888888.l		; 8F 88 88 88
	dey		; 88
	dey		; 88
	dey		; 88
	sta $FEFE8F.l		; 8F 8F FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $0202.w,X		; FE 02 02
	cop $02.b		; 02 02
	.db $82, $82, $C2		; 82 82 C2
.ACCU 16
	rep #$A2		; C2 A2
	ldx #$A2.b		; A2 A2
	ldx #$A2.b		; A2 A2
	ldx #$03.b		; A2 03
	bra   8.b		; 80 08
	brk $FA.b		; 00 FA
	ora $D5.b		; 05 D5
	brk $FA.b		; 00 FA
	sbc $00FFD5.l,X		; FF D5 FF 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFE5.l,X		; FF E5 FF 02
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $848080.l,X		; FF 80 80 84
	sty $8E.b		; 84 8E
	stx $8B8B.w		; 8E 8B 8B
	txa		; 8A
	txa		; 8A
	stx $8E8E.w		; 8E 8E 8E
	stx $F0F0.w		; 8E F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bcc -112.b		; 90 90
	bcc -112.b		; 90 90
	bcc -112.b		; 90 90
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	stx $8E8E.w		; 8E 8E 8E
	stx $8E8E.w		; 8E 8E 8E
	stx $9F8E.w		; 8E 8E 9F
	sta $FF8080.l,X		; 9F 80 80 FF
	sbc $F00300.l,X		; FF 00 03 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq   0.b		; F0 00
	brk $90.b		; 00 90
	bcc -112.b		; 90 90
	bcc -112.b		; 90 90
	bcc -112.b		; 90 90
	bcc -48.b		; 90 D0
	bne  16.b		; D0 10
	bpl -16.b		; 10 F0
	beq   0.b		; F0 00
	brk $02.b		; 00 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
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
	brk $07.b		; 00 07
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	tsb $E0.b		; 04 E0
	brk $FC.b		; 00 FC
	sbc $00FFE0.l,X		; FF E0 FF 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $01FFE8.l,X		; FF E8 FF 01
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFF9.l,X		; FF F9 FF 02
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $E0.b		; 00 E0
	sbc $000003.l,X		; FF 03 00 00
	brk $04.b		; 00 04
	brk $E3.b		; 00 E3
	sbc $000003.l,X		; FF 03 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $908080.l,X		; FF 80 80 90
	bcc -84.b		; 90 AC
	ldy $AAAA.w		; AC AA AA
	tsx		; BA
	tsx		; BA
	tsx		; BA
	tsx		; BA
	tsx		; BA
	tsx		; BA
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	ldx $80BE.w,Y		; BE BE 80
	bra  -1.b		; 80 FF
	sbc $080C00.l,X		; FF 00 0C 08
	tsb $0C08.w		; 0C 08 0C
	php		; 08
	tsb $0C08.w		; 0C 08 0C
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	tsb $0C08.w		; 0C 08 0C
	php		; 08
	tsb $0C08.w		; 0C 08 0C
	php		; 08
	tsb $0C08.w		; 0C 08 0C
	php		; 08
	tsb $0C08.w		; 0C 08 0C
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	inc $EB02.w,X		; FE 02 EB
	brk $FE.b		; 00 FE
	sbc $00FFEB.l,X		; FF EB FF 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $01FFF3.l,X		; FF F3 FF 01
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $01FFF9.l,X		; FF F9 FF 01
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
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
	jsr $5020.w		; 20 20 50
	bvc 112.b		; 50 70
	bvs 112.b		; 70 70
	bvs 112.b		; 70 70
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	inc $00.b,X		; F6 00
	sbc $FFF6FF.l,X		; FF FF F6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $01FF.w,X		; FE FF 01
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$40.b		; E0 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	ora $80.b		; 05 80
	bpl   0.b		; 10 00
	sed		; F8
	php		; 08
	cmp #$F800.w		; C9 00 F8
	sbc $00FFC9.l,X		; FF C9 FF 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $00FFC9.l,X		; FF C9 FF 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $02FF.w,Y		; D9 FF 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E9.b		; 00 E9
	sbc $000004.l,X		; FF 04 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $000006.l,X		; FF 06 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$06.b]		; 07 06
	ora #$1807.w		; 09 07 18
	ora $3C.b,S		; 03 3C
	ora $7C.b,S		; 03 7C
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora $181F09.l		; 0F 09 1F 18
	and $7C7F3C.l,X		; 3F 3C 7F 7C
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	bmi -56.b		; 30 C8
	bvs -116.b		; 70 8C
	rts		; 60

	stz $9F60.w,X		; 9E 60 9F
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	beq -16.b		; F0 F0
	sed		; F8
	iny		; C8
	jsr ($FE8C.w,X)		; FC 8C FE
	stz $9FFF.w,X		; 9E FF 9F
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FC.b,S		; 03 FC
	ora $7C.b,S		; 03 7C
	ora $3C.b,S		; 03 3C
	ora [$18.b]		; 07 18
	asl $09.b		; 06 09
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	sbc $7C7FFC.l,X		; FF FC 7F 7C
	and $181F3C.l,X		; 3F 3C 1F 18
	ora $070709.l		; 0F 09 07 07
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	rts		; 60

	sta $609F60.l,X		; 9F 60 9F 60
	stz $8C70.w,X		; 9E 70 8C
	bmi -56.b		; 30 C8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	sbc $9FFF9F.l,X		; FF 9F FF 9F
	inc $FC9E.w,X		; FE 9E FC
	sty $C8F8.w		; 8C F8 C8
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	php		; 08
	brk $FA.b		; 00 FA
	asl $D5.b		; 06 D5
	brk $FA.b		; 00 FA
	sbc $00FFD5.l,X		; FF D5 FF 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFE5.l,X		; FF E5 FF 02
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora [$00.b]		; 07 00
	ora $05120D.l		; 0F 0D 12 05
	dec A		; 3A
	ora $7A.b		; 05 7A
	ora $FA.b		; 05 FA
	ora $7A.b		; 05 7A
	cop $02.b		; 02 02
	ora [$07.b]		; 07 07
	ora $121F0F.l		; 0F 0F 1F 12
	and $7A7F3A.l,X		; 3F 3A 7F 7A
	sbc $7A7FFA.l,X		; FF FA 7F 7A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$40.b		; C0 40
	cpx #$E0.b		; E0 E0
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3A.b		; 05 3A
	ora $0012.w		; 0D 12 00
	ora $000700.l		; 0F 00 07 00
	cop $00.b		; 02 00
	brk $02.b		; 00 02
	cop $02.b		; 02 02
	cop $3F.b		; 02 3F
	dec A		; 3A
	ora $0F0F12.l,X		; 1F 12 0F 0F
	ora [$07.b]		; 07 07
	cop $03.b		; 02 03
	brk $03.b		; 00 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $E0.b		; 00 E0
	bra  64.b		; 80 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	cpy #$40.b		; C0 40
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	jsr ($E004.w,X)		; FC 04 E0
	brk $FC.b		; 00 FC
	sbc $00FFE0.l,X		; FF E0 FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $00FFE0.l,X		; FF E0 FF 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inx		; E8
	sbc $000001.l,X		; FF 01 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $000002.l,X		; FF 02 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $000002.l,X		; FF 02 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $1C.b		; 00 1C
	rol $08.b,X		; 36 08
	trb $6B.b		; 14 6B
	trb $EB.b		; 14 EB
	trb $6B.b		; 14 6B
	rol $08.b,X		; 36 08
	brk $1C.b		; 00 1C
	php		; 08
	php		; 08
	trb $3E1C.w		; 1C 1C 3E
	php		; 08
	adc $EBFF6B.l,X		; 7F 6B FF EB
	adc $083E6B.l,X		; 7F 6B 3E 08
	trb $001C.w		; 1C 1C 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $FE.b		; 00 FE
	ora $EB.b,S		; 03 EB
	brk $FE.b		; 00 FE
	sbc $00FFEB.l,X		; FF EB FF 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $01FFF3.l,X		; FF F3 FF 01
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $01FFF9.l,X		; FF F9 FF 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	pha		; 48
	bmi -52.b		; 30 CC
	bmi -52.b		; 30 CC
	bmi  72.b		; 30 48
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	jsr $3020.w		; 20 20 30
	bmi 120.b		; 30 78
	pha		; 48
	jsr ($FCCC.w,X)		; FC CC FC
	cpy $4878.w		; CC 78 48
	bmi  48.b		; 30 30
	brk $30.b		; 00 30
	jsr $2030.w		; 20 30 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2030.w		; 20 30 20
	bmi  32.b		; 30 20
	bmi  32.b		; 30 20
	bmi  32.b		; 30 20
	bmi  32.b		; 30 20
	bmi  32.b		; 30 20
	bmi  32.b		; 30 20
	bmi   2.b		; 30 02
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	ora ($F6.b,X)		; 01 F6
	brk $FF.b		; 00 FF
	sbc $00FFF6.l,X		; FF F6 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $000001.l,X		; FF 01 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	ldy #$00.b		; A0 00
	rti		; 40

	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	cpx #$A0.b		; E0 A0
	rti		; 40

	rti		; 40

	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	ora $80.b		; 05 80
	bpl   0.b		; 10 00
	sed		; F8
	php		; 08
	cmp #$F800.w		; C9 00 F8
	sbc $00FFC9.l,X		; FF C9 FF 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $00FFC9.l,X		; FF C9 FF 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $02FF.w,Y		; D9 FF 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E9.b		; 00 E9
	sbc $000004.l,X		; FF 04 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $000006.l,X		; FF 06 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $03.b,S		; 03 03
	tsb $06.b		; 04 06
	ora #$1A05.w		; 09 05 1A
	ora $3A.b		; 05 3A
	ora $7A.b		; 05 7A
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora [$04.b]		; 07 04
	ora $1A1F09.l		; 0F 09 1F 1A
	and $7A7F3A.l,X		; 3F 3A 7F 7A
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	cpx #$10.b		; E0 10
	bmi -56.b		; 30 C8
	bne  44.b		; D0 2C
	bne  46.b		; D0 2E
	bne  47.b		; D0 2F
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	beq  16.b		; F0 10
	sed		; F8
	iny		; C8
	jsr ($FE2C.w,X)		; FC 2C FE
	rol $2FFF.w		; 2E FF 2F
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FA.b		; 05 FA
	ora $7A.b		; 05 7A
	ora $3A.b		; 05 3A
	ora $1A.b		; 05 1A
	ora [$08.b]		; 07 08
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	sbc $7A7FFA.l,X		; FF FA 7F 7A
	and $1A1F3A.l,X		; 3F 3A 1F 1A
	ora $070708.l		; 0F 08 07 07
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	bne  47.b		; D0 2F
	bne  47.b		; D0 2F
	bne  46.b		; D0 2E
	bne  44.b		; D0 2C
	beq   8.b		; F0 08
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	sbc $2FFF2F.l,X		; FF 2F FF 2F
	inc $FC2E.w,X		; FE 2E FC
	bit $08F8.w		; 2C F8 08
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	php		; 08
	brk $FA.b		; 00 FA
	asl $D5.b		; 06 D5
	brk $FA.b		; 00 FA
	sbc $00FFD5.l,X		; FF D5 FF 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFE5.l,X		; FF E5 FF 02
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora [$07.b]		; 07 07
	php		; 08
	ora $0A12.w		; 0D 12 0A
	and $0A.b,X		; 35 0A
	adc $0A.b,X		; 75 0A
	sbc $0A.b,X		; F5 0A
	adc $02.b,X		; 75 02
	cop $07.b		; 02 07
	ora [$0F.b]		; 07 0F
	php		; 08
	ora $353F12.l,X		; 1F 12 3F 35
	adc $F5FF75.l,X		; 7F 75 FF F5
	adc $000075.l,X		; 7F 75 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	bra  96.b		; 80 60
	bra 112.b		; 80 70
	bra 120.b		; 80 78
	bra 112.b		; 80 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$40.b		; C0 40
	cpx #$60.b		; E0 60
	beq 112.b		; F0 70
	sed		; F8
	sei		; 78
	beq 112.b		; F0 70
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	and $0F.b,X		; 35 0F
	bpl   0.b		; 10 00
	ora $000700.l		; 0F 00 07 00
	cop $00.b		; 02 00
	brk $02.b		; 00 02
	cop $02.b		; 02 02
	cop $3F.b		; 02 3F
	and $1F.b,X		; 35 1F
	bpl  15.b		; 10 0F
	ora $020707.l		; 0F 07 07 02
	ora $00.b,S		; 03 00
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $80.b,S		; 03 80
	rts		; 60

	bra  64.b		; 80 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$60.b		; E0 60
	cpy #$40.b		; C0 40
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	jsr ($E004.w,X)		; FC 04 E0
	brk $FC.b		; 00 FC
	sbc $00FFE0.l,X		; FF E0 FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $00FFE0.l,X		; FF E0 FF 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inx		; E8
	sbc $000001.l,X		; FF 01 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $000002.l,X		; FF 02 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $000002.l,X		; FF 02 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $1C.b		; 00 1C
	trb $3622.w		; 1C 22 36
	eor #$D52A.w		; 49 2A D5
	rol A		; 2A
	eor $3E.b,X		; 55 3E
	brk $00.b		; 00 00
	trb $0808.w		; 1C 08 08
	trb $3E1C.w		; 1C 1C 3E
	jsl $FF497F.l		; 22 7F 49 FF
	cmp $7F.b,X		; D5 7F
	eor $3E.b,X		; 55 3E
	brk $1C.b		; 00 1C
	trb $8000.w		; 1C 00 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	sbc $EB02.w,X		; FD 02 EB
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $FD.b		; 00 FD
	sbc $01FFE9.l,X		; FF E9 FF 01
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	pha		; 48
	bmi -52.b		; 30 CC
	bmi -52.b		; 30 CC
	bmi  72.b		; 30 48
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	sei		; 78
	pha		; 48
	jsr ($FCCC.w,X)		; FC CC FC
	cpy $4878.w		; CC 78 48
	bmi  48.b		; 30 30
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	inc $00.b,X		; F6 00
	sbc $FFF6FF.l,X		; FF FF F6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $01FF.w,X		; FE FF 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	ldy #$00.b		; A0 00
	rti		; 40

	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	cpx #$A0.b		; E0 A0
	rti		; 40

	rti		; 40

	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	ora $80.b		; 05 80
	bpl   0.b		; 10 00
	sed		; F8
	php		; 08
	cmp #$0000.w		; C9 00 00
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	sbc $000000.l,X		; FF 00 00 00
	brk $F8.b		; 00 F8
	sbc $02FFD1.l,X		; FF D1 FF 02
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $D1.b		; 00 D1
	sbc $000004.l,X		; FF 04 00 00
	brk $F9.b		; 00 F9
	sbc $06FFC1.l,X		; FF C1 FF 06
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
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
	brk $01.b		; 00 01
	inc $7C03.w,X		; FE 03 7C
	ora $3C.b,S		; 03 3C
	ora $1C.b,S		; 03 1C
	ora ($0E.b,X)		; 01 0E
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	sbc $7C7FFE.l,X		; FF FE 7F 7C
	and $1C1F3C.l,X		; 3F 3C 1F 1C
	ora $07070E.l		; 0F 0E 07 07
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	cpx #$1F.b		; E0 1F
	cpy #$3F.b		; C0 3F
	bra 126.b		; 80 7E
	cpy #$3C.b		; C0 3C
	cpx #$18.b		; E0 18
	cpy #$30.b		; C0 30
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	inc $FC7E.w,X		; FE 7E FC
	bit $18F8.w,X		; 3C F8 18
	beq  48.b		; F0 30
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	ora ($06.b,X)		; 01 06
	ora $0C.b,S		; 03 0C
	ora [$18.b]		; 07 18
	ora $7C0330.l		; 0F 30 03 7C
	ora ($FE.b,X)		; 01 FE
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora [$06.b]		; 07 06
	ora $181F0C.l		; 0F 0C 1F 18
	and $7C7F30.l,X		; 3F 30 7F 7C
	sbc $0000FE.l,X		; FF FE 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	bra  96.b		; 80 60
	cpy #$30.b		; C0 30
	cpx #$18.b		; E0 18
	bra 124.b		; 80 7C
	cpy #$3E.b		; C0 3E
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpx #$60.b		; E0 60
	beq  48.b		; F0 30
	sed		; F8
	clc		; 18
	jsr ($FE7C.w,X)		; FC 7C FE
	rol $8003.w,X		; 3E 03 80
	php		; 08
	brk $FA.b		; 00 FA
	asl $D5.b		; 06 D5
	brk $FA.b		; 00 FA
	sbc $00FFD5.l,X		; FF D5 FF 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFE5.l,X		; FF E5 FF 02
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	ora $07.b		; 05 07
	php		; 08
	ora $390610.l		; 0F 10 06 39
	ora $7C.b,S		; 03 7C
	ora $FC.b,S		; 03 FC
	ora [$78.b]		; 07 78
	cop $02.b		; 02 02
	ora [$05.b]		; 07 05
	ora $101F08.l		; 0F 08 1F 10
	and $7C7F39.l,X		; 3F 39 7F 7C
	sbc $787FFC.l,X		; FF FC 7F 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	bra 120.b		; 80 78
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$40.b		; C0 40
	cpx #$E0.b		; E0 E0
	beq -16.b		; F0 F0
	sed		; F8
	sei		; 78
	beq -16.b		; F0 F0
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0731.w		; 0E 31 07
	clc		; 18
	cop $0D.b		; 02 0D
	brk $07.b		; 00 07
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	and $181F31.l,X		; 3F 31 1F 18
	ora $07070D.l		; 0F 0D 07 07
	cop $03.b		; 02 03
	brk $03.b		; 00 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	jsr ($E004.w,X)		; FC 04 E0
	brk $FC.b		; 00 FC
	sbc $00FFE0.l,X		; FF E0 FF 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $01FFE8.l,X		; FF E8 FF 01
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFF9.l,X		; FF F9 FF 02
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $E4.b		; 00 E4
	sbc $000003.l,X		; FF 03 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	trb $1C.b		; 14 1C
	jsl $0C6718.l		; 22 18 67 0C
	sbc ($1C.b,S),Y		; F3 1C
	adc $18.b,S		; 63 18
	rol $0C.b		; 26 0C
	bpl   8.b		; 10 08
	php		; 08
	trb $3E14.w		; 1C 14 3E
	jsl $FF677F.l		; 22 7F 67 FF
	sbc ($7F.b,S),Y		; F3 7F
	adc $3E.b,S		; 63 3E
	rol $1C.b		; 26 1C
	bpl   0.b		; 10 00
	php		; 08
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	brk $08.b		; 00 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	brk $80.b		; 00 80
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
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	sbc $EB02.w,X		; FD 02 EB
	brk $FD.b		; 00 FD
	sbc $00FFEB.l,X		; FF EB FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFF3.l,X		; FF F3 FF 01
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFF9.l,X		; FF F9 FF 01
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	jsr $4830.w		; 20 30 48
	bpl -20.b		; 10 EC
	jsr $30DC.w		; 20 DC 30
	pha		; 48
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	bmi  32.b		; 30 20
	sei		; 78
	pha		; 48
	jsr ($FCEC.w,X)		; FC EC FC
	jmp.w [$4878]		; DC 78 48
	bmi  48.b		; 30 30
	brk $10.b		; 00 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	inc $00.b,X		; F6 00
	sbc $FFF6FF.l,X		; FF FF F6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $01FF.w,X		; FE FF 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	ldy #$00.b		; A0 00
	rti		; 40

	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	cpx #$A0.b		; E0 A0
	rti		; 40

	rti		; 40

	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	and $80.b,S		; 23 80
	stz $00.b		; 64 00
	sbc ($73.b)		; F2 73
	lda [$00.b],Y		; B7 00
	sbc ($FF.b)		; F2 FF
	sbc ($FF.b),Y		; F1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc ($FF.b),Y		; F1 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	ora ($00.b)		; 12 00
	sbc ($FF.b),Y		; F1 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	jsl $FFF100.l		; 22 00 F1 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	and ($00.b)		; 32 00
	sbc ($FF.b),Y		; F1 FF
	php		; 08
	brk $00.b		; 00 00
	brk $64.b		; 00 64
	brk $F1.b		; 00 F1
	sbc $00000A.l,X		; FF 0A 00 00
	brk $54.b		; 00 54
	brk $F1.b		; 00 F1
	sbc $00000C.l,X		; FF 0C 00 00
	brk $44.b		; 00 44
	brk $F1.b		; 00 F1
	sbc $000008.l,X		; FF 08 00 00
	brk $34.b		; 00 34
	brk $F1.b		; 00 F1
	sbc $000008.l,X		; FF 08 00 00
	brk $11.b		; 00 11
	brk $E1.b		; 00 E1
	sbc $00000E.l,X		; FF 0E 00 00
	brk $21.b		; 00 21
	brk $E1.b		; 00 E1
	sbc $000020.l,X		; FF 20 00 00
	brk $31.b		; 00 31
	brk $E1.b		; 00 E1
	sbc $000022.l,X		; FF 22 00 00
	brk $41.b		; 00 41
	brk $E1.b		; 00 E1
	sbc $000024.l,X		; FF 24 00 00
	brk $51.b		; 00 51
	brk $E1.b		; 00 E1
	sbc $000026.l,X		; FF 26 00 00
	brk $61.b		; 00 61
	brk $E1.b		; 00 E1
	sbc $000028.l,X		; FF 28 00 00
	brk $11.b		; 00 11
	brk $D1.b		; 00 D1
	sbc $00002A.l,X		; FF 2A 00 00
	brk $21.b		; 00 21
	brk $D1.b		; 00 D1
	sbc $00002C.l,X		; FF 2C 00 00
	brk $31.b		; 00 31
	brk $D1.b		; 00 D1
	sbc $00002E.l,X		; FF 2E 00 00
	brk $41.b		; 00 41
	brk $D1.b		; 00 D1
	sbc $000024.l,X		; FF 24 00 00
	brk $51.b		; 00 51
	brk $D1.b		; 00 D1
	sbc $000040.l,X		; FF 40 00 00
	brk $61.b		; 00 61
	brk $D1.b		; 00 D1
	sbc $000042.l,X		; FF 42 00 00
	brk $09.b		; 00 09
	brk $C1.b		; 00 C1
	sbc $000044.l,X		; FF 44 00 00
	brk $19.b		; 00 19
	brk $C1.b		; 00 C1
	sbc $000046.l,X		; FF 46 00 00
	brk $29.b		; 00 29
	brk $C1.b		; 00 C1
	sbc $000048.l,X		; FF 48 00 00
	brk $39.b		; 00 39
	brk $C1.b		; 00 C1
	sbc $00004A.l,X		; FF 4A 00 00
	brk $49.b		; 00 49
	brk $C1.b		; 00 C1
	sbc $00004A.l,X		; FF 4A 00 00
	brk $59.b		; 00 59
	brk $C1.b		; 00 C1
	sbc $00004A.l,X		; FF 4A 00 00
	brk $69.b		; 00 69
	brk $C1.b		; 00 C1
	sbc $00004C.l,X		; FF 4C 00 00
	brk $09.b		; 00 09
	brk $B1.b		; 00 B1
	sbc $00004E.l,X		; FF 4E 00 00
	brk $19.b		; 00 19
	brk $B1.b		; 00 B1
	sbc $000060.l,X		; FF 60 00 00
	brk $29.b		; 00 29
	brk $B1.b		; 00 B1
	sbc $000060.l,X		; FF 60 00 00
	brk $39.b		; 00 39
	brk $B1.b		; 00 B1
	sbc $000060.l,X		; FF 60 00 00
	brk $62.b		; 00 62
	brk $B1.b		; 00 B1
	sbc $000060.l,X		; FF 60 00 00
	brk $52.b		; 00 52
	brk $B1.b		; 00 B1
	sbc $000060.l,X		; FF 60 00 00
	brk $42.b		; 00 42
	brk $B1.b		; 00 B1
	sbc $000060.l,X		; FF 60 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $007F7F.l,X		; FF 7F 7F 00
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
	sbc $00FFFF.l,X		; FF FF FF 00
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
	sbc $01FFFF.l,X		; FF FF FF 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($7F.b,X)		; 01 7F
	ora ($8F.b,X)		; 01 8F
	adc ($C7.b),Y		; 71 C7
	and $0100.w,Y		; 39 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ror $8E7F.w,X		; 7E 7F 8E
	sbc $FFFFC6.l,X		; FF C6 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FCFF00.l,X		; FF 00 FF FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cmp ($3F.b,X)		; C1 3F
	cmp ($3F.b,X)		; C1 3F
	cmp ($3F.b,X)		; C1 3F
	cmp ($3F.b,X)		; C1 3F
	cmp ($3F.b,X)		; C1 3F
	cmp ($3F.b,X)		; C1 3F
	cmp ($3F.b,X)		; C1 3F
	cmp ($3F.b,X)		; C1 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	cpx #$60.b		; E0 60
	cpx #$60.b		; E0 60
	cpx #$60.b		; E0 60
	cpx #$60.b		; E0 60
	cpx #$60.b		; E0 60
	cpx #$60.b		; E0 60
	cpx #$60.b		; E0 60
	cpx #$FF.b		; E0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $07FFC0.l,X		; FF C0 FF 07
	ora [$3F.b]		; 07 3F
	and $FFC7FF.l,X		; 3F FF C7 FF
	cmp [$FF.b]		; C7 FF
	cmp [$FF.b]		; C7 FF
	cmp [$FF.b]		; C7 FF
	cmp [$FF.b]		; C7 FF
	cmp [$00.b]		; C7 00
	sbc $F8C738.l,X		; FF 38 C7 F8
	and $F83FF8.l,X		; 3F F8 3F F8
	and $F83FF8.l,X		; 3F F8 3F F8
	and $C23FF8.l,X		; 3F F8 3F C2
	rep #$CE		; C2 CE
	dec $FEFE.w		; CE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FE03.w,X		; FE 03 FE
	ora $CE3FF2.l		; 0F F2 3F CE
	and $CE3FCE.l,X		; 3F CE 3F CE
	and $CE3FCE.l,X		; 3F CE 3F CE
	and $001FCE.l,X		; 3F CE 1F 00
	ora $000300.l		; 0F 00 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0F0F1F.l,X		; 1F 1F 0F 0F
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $001F00.l,X		; 7F 00 1F 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $1F1F7F.l,X		; 7F 7F 1F 1F
	ora [$07.b]		; 07 07
	ora ($01.b,X)		; 01 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc ($0E.b),Y		; F1 0E
	sed		; F8
	ora [$FE.b]		; 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F1.b		; 00 F1
	sbc $FEFFF8.l,X		; FF F8 FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E0FFFF.l,X		; FF FF FF E0
	ora $1F8778.l,X		; 1F 78 87 1F
	cpx #$87.b		; E0 87
	sei		; 78
	cmp ($3E.b,X)		; C1 3E
	beq  15.b		; F0 0F
	jsr ($FF03.w,X)		; FC 03 FF
	brk $E0.b		; 00 E0
	cpx #$78.b		; E0 78
	sed		; F8
	ora $FF87FF.l,X		; 1F FF 87 FF
	cmp ($FF.b,X)		; C1 FF
	beq  -1.b		; F0 FF
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $FCFCFC.l,X		; FF FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $E01F80.l,X		; 7F 80 1F E0
	ora [$F8.b]		; 07 F8
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	ora [$FC.b]		; 07 FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $FF1FFF.l,X		; 7F FF 1F FF
	ora [$FF.b]		; 07 FF
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	and $FF00.w,Y		; 39 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C1.b		; 00 C1
	and $F93FC1.l,X		; 3F C1 3F F9
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $6060FF.l,X		; FF FF 60 60
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E06000.l,X		; FF 00 60 E0
	rts		; 60

	cpx #$60.b		; E0 60
	cpx #$FF.b		; E0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp [$FF.b]		; C7 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $003FF8.l,X		; FF F8 3F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FEFEFE.l,X		; FF FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $CE3F.w,X		; FE 3F CE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0C0C0.l,X		; FF C0 C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C7.b		; C0 C7
	cpy #$C7.b		; C0 C7
	cpy #$C7.b		; C0 C7
	cpy #$C7.b		; C0 C7
	sbc $FFC0FF.l,X		; FF FF C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	sbc $010101.l,X		; FF 01 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($0F.b,X)		; 01 0F
	ora ($0F.b,X)		; 01 0F
	ora ($0F.b,X)		; 01 0F
	ora ($0F.b,X)		; 01 0F
	sbc $FF01FF.l,X		; FF FF 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $00FFF8.l,X		; FF F8 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0CFF00.l,X		; FF 00 FF 0C
	sty $8C0C.w		; 8C 0C 8C
	tsb $0C8C.w		; 0C 8C 0C
	sty $8C0C.w		; 8C 0C 8C
	tsb $0C8C.w		; 0C 8C 0C
	sty $8C0C.w		; 8C 0C 8C
	tsb $0CFC.w		; 0C FC 0C
	jsr ($FC0C.w,X)		; FC 0C FC
	tsb $0CFC.w		; 0C FC 0C
	jsr ($FC0C.w,X)		; FC 0C FC
	tsb $0CFC.w		; 0C FC 0C
	jsr ($C000.w,X)		; FC 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $1FFF9F.l,X		; 7F 9F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0C0FF.l,X		; FF FF C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	sbc $FFC0FF.l,X		; FF FF C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	sbc $0101FF.l,X		; FF FF 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	sbc $FF01FF.l,X		; FF FF 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$C7.b		; C0 C7
	cpy #$C7.b		; C0 C7
	cpy #$C7.b		; C0 C7
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FFFFC0.l,X		; FF C0 FF FF
	sbc $FFC0FF.l,X		; FF FF C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0F01FF.l,X		; FF FF 01 0F
	ora ($0F.b,X)		; 01 0F
	ora ($0F.b,X)		; 01 0F
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $FFFF01.l,X		; FF 01 FF FF
	sbc $FF01FF.l,X		; FF FF 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF8FF.l,X		; FF FF F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0C8C0C.l,X		; FF 0C 8C 0C
	sty $8C0C.w		; 8C 0C 8C
	tsb $0C8C.w		; 0C 8C 0C
	sty $8C0C.w		; 8C 0C 8C
	tsb $0C8C.w		; 0C 8C 0C
	sty $FC0C.w		; 8C 0C FC
	tsb $0CFC.w		; 0C FC 0C
	jsr ($FC0C.w,X)		; FC 0C FC
	tsb $0CFC.w		; 0C FC 0C
	jsr ($FC0C.w,X)		; FC 0C FC
	tsb $00FC.w		; 0C FC 00
	cpy #$00.b		; C0 00
	cpy #$FF.b		; C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000707.l,X		; FF 07 07 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $02FF00.l,X		; FF 00 FF 02
	and $FE3F02.l,X		; 3F 02 3F FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	rep #$C2		; C2 C2
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	ora $FE.b,S		; 03 FE
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$1F.b		; E0 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C7.b		; C0 C7
	cpy #$C7.b		; C0 C7
	cpy #$C7.b		; C0 C7
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FFC0C0.l,X		; FF C0 C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0101FF.l,X		; FF FF 01 01
	ora ($01.b,X)		; 01 01
	ora ($0F.b,X)		; 01 0F
	ora ($0F.b,X)		; 01 0F
	ora ($0F.b,X)		; 01 0F
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $FF0101.l,X		; FF 01 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	sbc $FFF8FF.l,X		; FF FF F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FCFF00.l,X		; FF 00 FF FC
	jsr ($0C0C.w,X)		; FC 0C 0C
	tsb $0C0C.w		; 0C 0C 0C
	tsb $0C0C.w		; 0C 0C 0C
	tsb $0C0C.w		; 0C 0C 0C
	tsb $0C0C.w		; 0C 0C 0C
	jsr ($0CFC.w,X)		; FC FC 0C
	jsr ($FC0C.w,X)		; FC 0C FC
	tsb $0CFC.w		; 0C FC 0C
	jsr ($FC0C.w,X)		; FC 0C FC
	tsb $0CFC.w		; 0C FC 0C
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cop $3D.b		; 02 3D
	cop $3D.b		; 02 3D
	cop $3D.b		; 02 3D
	cop $3D.b		; 02 3D
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora $E01FE0.l,X		; 1F E0 1F E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FFFC.w,X)		; FC FC FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $007F01.l		; 0F 01 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $FF7F01.l		; 0F 01 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $00FFF8.l,X		; FF F8 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0CFF00.l,X		; FF 00 FF 0C
	sty $8C0C.w		; 8C 0C 8C
	tsb $0C8C.w		; 0C 8C 0C
	sty $8C0C.w		; 8C 0C 8C
	tsb $0C8C.w		; 0C 8C 0C
	sty $8C0C.w		; 8C 0C 8C
	tsb $0CFC.w		; 0C FC 0C
	jsr ($FC0C.w,X)		; FC 0C FC
	tsb $0CFC.w		; 0C FC 0C
	jsr ($FC0C.w,X)		; FC 0C FC
	tsb $0CFC.w		; 0C FC 0C
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
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3D.b		; 02 3D
	cop $3D.b		; 02 3D
	cop $3D.b		; 02 3D
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
	cop $3F.b		; 02 3F
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora $E01FE0.l,X		; 1F E0 1F E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
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
	ora $00.b,S		; 03 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000300.l,X		; FF 00 03 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $000000.l,X		; FF 00 00 00
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $17FFFF.l,X		; FF FF FF 17
	bra  76.b		; 80 4C
	brk $F5.b		; 00 F5
	jmp $0700C6.l		; 5C C6 00 07
	brk $C6.b		; 00 C6
	sbc $000000.l,X		; FF 00 00 00
	brk $17.b		; 00 17
	brk $C6.b		; 00 C6
	sbc $000002.l,X		; FF 02 00 00
	brk $27.b		; 00 27
	brk $C6.b		; 00 C6
	sbc $000004.l,X		; FF 04 00 00
	brk $37.b		; 00 37
	brk $C6.b		; 00 C6
	sbc $000004.l,X		; FF 04 00 00
	brk $47.b		; 00 47
	brk $C6.b		; 00 C6
	sbc $000004.l,X		; FF 04 00 00
	brk $57.b		; 00 57
	brk $C6.b		; 00 C6
	sbc $000006.l,X		; FF 06 00 00
	brk $49.b		; 00 49
	brk $D6.b		; 00 D6
	sbc $000008.l,X		; FF 08 00 00
	brk $39.b		; 00 39
	brk $D6.b		; 00 D6
	sbc $008004.l,X		; FF 04 80 00
	brk $29.b		; 00 29
	brk $D6.b		; 00 D6
	sbc $00000A.l,X		; FF 0A 00 00
	brk $19.b		; 00 19
	brk $D6.b		; 00 D6
	sbc $00000C.l,X		; FF 0C 00 00
	brk $09.b		; 00 09
	brk $D6.b		; 00 D6
	sbc $00000E.l,X		; FF 0E 00 00
	brk $0E.b		; 00 0E
	brk $E6.b		; 00 E6
	sbc $000020.l,X		; FF 20 00 00
	brk $1E.b		; 00 1E
	brk $E6.b		; 00 E6
	sbc $000022.l,X		; FF 22 00 00
	brk $2E.b		; 00 2E
	brk $E6.b		; 00 E6
	sbc $000024.l,X		; FF 24 00 00
	brk $3E.b		; 00 3E
	brk $E6.b		; 00 E6
	sbc $000026.l,X		; FF 26 00 00
	brk $4E.b		; 00 4E
	brk $E6.b		; 00 E6
	sbc $000028.l,X		; FF 28 00 00
	brk $F5.b		; 00 F5
	sbc $2AFFF6.l,X		; FF F6 FF 2A
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $F6.b		; 00 F6
	sbc $00002C.l,X		; FF 2C 00 00
	brk $15.b		; 00 15
	brk $F6.b		; 00 F6
	sbc $00002E.l,X		; FF 2E 00 00
	brk $25.b		; 00 25
	brk $F6.b		; 00 F6
	sbc $000040.l,X		; FF 40 00 00
	brk $35.b		; 00 35
	brk $F6.b		; 00 F6
	sbc $000040.l,X		; FF 40 00 00
	brk $45.b		; 00 45
	brk $F6.b		; 00 F6
	sbc $000042.l,X		; FF 42 00 00
	brk $55.b		; 00 55
	brk $F6.b		; 00 F6
	sbc $000044.l,X		; FF 44 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	and $0FFF0F.l,X		; 3F 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	and $0FFF0F.l,X		; 3F 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8FFFF.l,X		; FF FF FF F8
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $BF7FFF.l,X		; 3F FF 7F BF
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	and $C03FC0.l,X		; 3F C0 3F C0
	and $C03FC0.l,X		; 3F C0 3F C0
	and $FF7FC0.l,X		; 3F C0 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $0100FF.l		; 0F FF 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $0100FF.l		; 0F FF 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF20FF.l,X		; FF FF 20 FF
	jsr $20FF.w		; 20 FF 20
	sbc $20FF20.l,X		; FF 20 FF 20
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $20FFFF.l,X		; FF FF FF 20
	cmp $20DF20.l,X		; DF 20 DF 20
	cmp $20DF20.l,X		; DF 20 DF 20
	cmp $FFFFFF.l,X		; DF FF FF FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq  -1.b		; F0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
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
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($F1.b,X)		; 01 F1
	ora ($F1.b,X)		; 01 F1
	ora ($F1.b,X)		; 01 F1
	ora ($F1.b,X)		; 01 F1
	ora ($F1.b,X)		; 01 F1
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $FF1FFF.l,X		; 1F FF 1F FF
	sbc $FF1F1F.l,X		; FF 1F 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	sbc $F080FF.l,X		; FF FF 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	beq -113.b		; F0 8F
	beq -113.b		; F0 8F
	beq -113.b		; F0 8F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0700FF.l,X		; FF FF 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0F0FFF.l,X		; FF FF 0F 0F
	adc $8FFF7F.l,X		; 7F 7F FF 8F
	sbc $8FFF8F.l,X		; FF 8F FF 8F
	sbc $8FFF8F.l,X		; FF 8F FF 8F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bvs -113.b		; 70 8F
	beq 127.b		; F0 7F
	beq 127.b		; F0 7F
	beq 127.b		; F0 7F
	beq 127.b		; F0 7F
	beq 127.b		; F0 7F
	beq -16.b		; F0 F0
	bpl  16.b		; 10 10
	bvs 112.b		; 70 70
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	asl $1EF1.w,X		; 1E F1 1E
	sbc ($7E.b),Y		; F1 7E
	sta ($FE.b),Y		; 91 FE
	adc ($FE.b),Y		; 71 FE
	adc ($FE.b),Y		; 71 FE
	adc ($FE.b),Y		; 71 FE
	adc ($FE.b),Y		; 71 FE
	adc ($1F.b),Y		; 71 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FFFF1F.l,X		; FF 1F FF FF
	cpx #$FF.b		; E0 FF
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	sbc $E0.b,S		; E3 E0
	sbc $E0.b,S		; E3 E0
	sbc $FF.b,S		; E3 FF
	sbc $E0FFFF.l,X		; FF FF FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $FFFFE0.l,X		; FF E0 FF FF
	ora $FF.b,S		; 03 FF
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $031F03.l,X		; 1F 03 1F 03
	ora $FFFFFF.l,X		; 1F FF FF FF
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $00FE00.l,X		; FF 00 FE 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
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
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $E020.w		; 20 20 E0
	jsr $20E0.w		; 20 E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $1F7F7F.l,X		; FF 7F 7F 1F
	ora $010707.l,X		; 1F 07 07 01
	ora ($00.b,X)		; 01 00
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $0F.b		; 00 0F
	brk $E3.b		; 00 E3
	trb $0FF0.w		; 1C F0 0F
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora $F0FFE3.l		; 0F E3 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	adc $FF7F7F.l,X		; 7F 7F 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $1F8778.l,X		; 7F 78 87 1F
	cpx #$87.b		; E0 87
	sei		; 78
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	sei		; 78
	sed		; F8
	ora $FF87FF.l,X		; 1F FF 87 FF
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
	sbc $F80F00.l,X		; FF 00 0F F8
	ora $F80FF8.l		; 0F F8 0F F8
	ora $F80FF8.l		; 0F F8 0F F8
	ora $F80FF8.l		; 0F F8 0F F8
	sbc $030FFF.l,X		; FF FF 0F 03
	ora $030F03.l		; 0F 03 0F 03
	ora $030F03.l		; 0F 03 0F 03
	ora $03CF03.l		; 0F 03 CF 03
	sbc $FF0F00.l,X		; FF 00 0F FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $FFCFFF.l		; 0F FF CF FF
	sbc $8FFFFF.l,X		; FF FF FF 8F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FF0FF.l,X		; FF FF F0 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	inc $1E71.w,X		; FE 71 1E
	sbc ($1E.b),Y		; F1 1E
	sbc ($1E.b),Y		; F1 1E
	sbc ($1E.b),Y		; F1 1E
	sbc ($1E.b),Y		; F1 1E
	sbc ($1E.b),Y		; F1 1E
	sbc ($1E.b),Y		; F1 1E
	sbc ($1F.b),Y		; F1 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $E0FF1F.l,X		; FF 1F FF E0
	sbc $E0.b,S		; E3 E0
	sbc $FF.b,S		; E3 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $031F03.l,X		; FF 03 1F 03
	ora $FF03FF.l,X		; 1F FF 03 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $00FE00.l,X		; FF 00 FE 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
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
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $E020.w		; 20 20 E0
	jsr $20E0.w		; 20 E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
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
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0F3F3F.l,X		; FF 3F 3F 0F
	ora $000000.l		; 0F 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	asl $07F8.w,X		; 1E F8 07
	inc $0001.w,X		; FE 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	sbc $FEFFF8.l,X		; FF F8 FF FE
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  31.b		; 80 1F
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $1FFF7F.l,X		; FF 7F FF 1F
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
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
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FE00FF.l,X		; FF FF 00 FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $10FFFF.l,X		; FF FF FF 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  -1.b		; 10 FF
	brk $10.b		; 00 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  -1.b		; F0 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	bra  52.b		; 80 34
	brk $F8.b		; 00 F8
	mvp $00,$D5		; 44 D5 00
	ora $00.b		; 05 00
	cmp $FF.b,X		; D5 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,X		; 15 00
	cmp $FF.b,X		; D5 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	and $00.b		; 25 00
	cmp $FF.b,X		; D5 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	and $00.b,X		; 35 00
	cmp $FF.b,X		; D5 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	asl A		; 0A
	brk $E5.b		; 00 E5
	sbc $000008.l,X		; FF 08 00 00
	brk $1A.b		; 00 1A
	brk $E5.b		; 00 E5
	sbc $00000A.l,X		; FF 0A 00 00
	brk $2A.b		; 00 2A
	brk $E5.b		; 00 E5
	sbc $00000C.l,X		; FF 0C 00 00
	brk $3A.b		; 00 3A
	brk $E5.b		; 00 E5
	sbc $00000E.l,X		; FF 0E 00 00
	brk $F8.b		; 00 F8
	sbc $20FFF5.l,X		; FF F5 FF 20
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $F5.b		; 00 F5
	sbc $000022.l,X		; FF 22 00 00
	brk $18.b		; 00 18
	brk $F5.b		; 00 F5
	sbc $000024.l,X		; FF 24 00 00
	brk $28.b		; 00 28
	brk $F5.b		; 00 F5
	sbc $000026.l,X		; FF 26 00 00
	brk $38.b		; 00 38
	brk $F5.b		; 00 F5
	sbc $000028.l,X		; FF 28 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000100.l,X		; FF 00 01 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFEFE.l,X		; FF FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $00FE.w,X		; FE FE 00
	sta $00.b,S		; 83 00
	sta $00.b,S		; 83 00
	sta $00.b,S		; 83 00
	sta $00.b,S		; 83 00
	sta $FF.b,S		; 83 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $008300.l,X		; FF 00 83 00
	sta $00.b,S		; 83 00
	sta $00.b,S		; 83 00
	sta $00.b,S		; 83 00
	sta $00.b,S		; 83 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $83E083.l,X		; FF 83 E0 83
	cpx #$83.b		; E0 83
	cpx #$83.b		; E0 83
	cpx #$83.b		; E0 83
	cpx #$83.b		; E0 83
	bra -125.b		; 80 83
	bra -125.b		; 80 83
	bra -125.b		; 80 83
	sbc $83FF83.l,X		; FF 83 FF 83
	sbc $83FF83.l,X		; FF 83 FF 83
	sbc $E39FE3.l,X		; FF E3 9F E3
	sta $F09FE3.l,X		; 9F E3 9F F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	sbc ($F0.b,S),Y		; F3 F0
	sbc ($FF.b,S),Y		; F3 FF
	beq -16.b		; F0 F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $0FFFFF.l,X		; FF FF FF 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $0F3F0F.l		; 0F 0F 3F 0F
	and $0F0FFF.l,X		; 3F FF 0F 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FFFC.w,X)		; FC FC FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $01FFFC.l,X		; FF FC FF 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	sbc $F901.w,Y		; F9 01 F9
	ora ($F9.b,X)		; 01 F9
	ora ($F9.b,X)		; 01 F9
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	tsb $1B.b		; 04 1B
	tsb $1B.b		; 04 1B
	tsb $1B.b		; 04 1B
	tsb $1B.b		; 04 1B
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	tsb $1F.b		; 04 1F
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora $F807F7.l		; 0F F7 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F8F8FF.l,X		; FF FF F8 F8
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
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	sed		; F8
	trb $7D1C.w		; 1C 1C 7D
	adc $9FFF.w,X		; 7D FF 9F
	sbc $9FFF9F.l,X		; FF 9F FF 9F
	sbc $FFFF9F.l,X		; FF 9F FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	adc ($9E.b,X)		; 61 9E
	sbc $7D.b,S		; E3 7D
	sbc $7D.b,S		; E3 7D
	sbc $7D.b,S		; E3 7D
	sbc $7D.b,S		; E3 7D
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sta $80.b,S		; 83 80
	sta $80.b,S		; 83 80
	sta $80.b,S		; 83 80
	sta $80.b,S		; 83 80
	sta $80.b,S		; 83 80
	sta $80.b,S		; 83 80
	sta $80.b,S		; 83 80
	sta $80.b,S		; 83 80
	sbc $9F.b,S		; E3 9F
	sbc $9F.b,S		; E3 9F
	sbc $9F.b,S		; E3 9F
	sbc $9F.b,S		; E3 9F
	sbc $9F.b,S		; E3 9F
	sbc $9F.b,S		; E3 9F
	sbc $9F.b,S		; E3 9F
	sbc $9F.b,S		; E3 9F
	sbc $F0F0F0.l,X		; FF F0 F0 F0
	beq -16.b		; F0 F0
	beq -13.b		; F0 F3
	beq -13.b		; F0 F3
	beq -13.b		; F0 F3
	beq -13.b		; F0 F3
	sbc $FFFFF0.l,X		; FF F0 FF FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $3F0F3F.l		; 0F 3F 0F 3F
	ora $3F0F3F.l		; 0F 3F 0F 3F
	sbc $FFFF0F.l,X		; FF 0F FF FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $FF0FFF.l		; 0F FF 0F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFCFF.l,X		; FF FF FC FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $01FFFC.l,X		; FF FC FF 01
	sbc $F901.w,Y		; F9 01 F9
	ora ($F9.b,X)		; 01 F9
	ora ($F9.b,X)		; 01 F9
	ora ($F9.b,X)		; 01 F9
	ora ($F9.b,X)		; 01 F9
	ora ($F9.b,X)		; 01 F9
	ora ($F9.b,X)		; 01 F9
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	jsr ($FE03.w,X)		; FC 03 FE
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $FC.b,S		; 03 FC
	sbc $3FFFFE.l,X		; FF FE FF 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $00C739.l,X		; 3F 39 C7 00
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $C0FFC0.l,X		; 3F C0 FF C0
	sbc $E0F938.l,X		; FF 38 F9 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$38.b		; E0 38
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc [$38.b]		; E7 38
	sbc [$FF.b]		; E7 FF
	bit $3FFF.w,X		; 3C FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF03.l,X		; FF 03 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
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
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	cpy #$1F.b		; C0 1F
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $030F0F.l,X		; 1F 0F 0F 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	adc ($E3.b),Y		; 71 E3
	trb $07F8.w		; 1C F8 07
	inc $0001.w,X		; FE 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8E.b		; 00 8E
	sbc $F8FFE3.l,X		; FF E3 FF F8
	sbc $00FFFE.l,X		; FF FE FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	cpx #$FF.b		; E0 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	sbc [$FF.b]		; E7 FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $00FF.w,X		; FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	cpy #$F8.b		; C0 F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000E00.l		; 0F 00 0E 00
	jsr ($EA24.w,X)		; FC 24 EA
	brk $03.b		; 00 03
	brk $EA.b		; 00 EA
	sbc $000000.l,X		; FF 00 00 00
	brk $0B.b		; 00 0B
	brk $EA.b		; 00 EA
	sbc $000001.l,X		; FF 01 00 00
	brk $13.b		; 00 13
	brk $EA.b		; 00 EA
	sbc $000002.l,X		; FF 02 00 00
	brk $1C.b		; 00 1C
	brk $EA.b		; 00 EA
	sbc $000003.l,X		; FF 03 00 00
	brk $14.b		; 00 14
	brk $EA.b		; 00 EA
	sbc $000002.l,X		; FF 02 00 00
	brk $06.b		; 00 06
	brk $F2.b		; 00 F2
	sbc $000004.l,X		; FF 04 00 00
	brk $0E.b		; 00 0E
	brk $F2.b		; 00 F2
	sbc $000005.l,X		; FF 05 00 00
	brk $16.b		; 00 16
	brk $F2.b		; 00 F2
	sbc $000006.l,X		; FF 06 00 00
	brk $1E.b		; 00 1E
	brk $F2.b		; 00 F2
	sbc $000007.l,X		; FF 07 00 00
	brk $FC.b		; 00 FC
	sbc $08FFFA.l,X		; FF FA FF 08
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $FA.b		; 00 FA
	sbc $000009.l,X		; FF 09 00 00
	brk $0C.b		; 00 0C
	brk $FA.b		; 00 FA
	sbc $00000A.l,X		; FF 0A 00 00
	brk $14.b		; 00 14
	brk $FA.b		; 00 FA
	sbc $00000B.l,X		; FF 0B 00 00
	brk $1C.b		; 00 1C
	brk $FA.b		; 00 FA
	sbc $00000C.l,X		; FF 0C 00 00
	brk $24.b		; 00 24
	brk $FA.b		; 00 FA
	sbc $00000D.l,X		; FF 0D 00 00
	brk $07.b		; 00 07
	and $07FF07.l,X		; 3F 07 FF 07
	sbc $00FF07.l,X		; FF 07 FF 00
	ora ($00.b),Y		; 11 00
	ora ($00.b),Y		; 11 00
	ora ($00.b),Y		; 11 00
	ora ($07.b),Y		; 11 07
	and $07FF07.l,X		; 3F 07 FF 07
	sbc $00FF07.l,X		; FF 07 FF 00
	ora ($00.b),Y		; 11 00
	ora ($00.b),Y		; 11 00
	ora ($00.b),Y		; 11 00
	ora ($FF.b),Y		; 11 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $87FFFF.l,X		; FF FF FF 87
	sbc $87FF87.l,X		; FF 87 FF 87
	sbc $FFFF87.l,X		; FF 87 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $87FFFF.l,X		; FF FF FF 87
	sei		; 78
	sta [$78.b]		; 87 78
	sta [$F8.b]		; 87 F8
	sta [$FF.b]		; 87 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FFFE.w,X		; FE FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	brk $FE.b		; 00 FE
	asl $FE.b		; 06 FE
	asl $FE.b		; 06 FE
	inc $8E04.w,X		; FE 04 8E
	tsb $8E.b		; 04 8E
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	ldy $FC.b,X		; B4 FC
	ldy $04.b,X		; B4 04
	sta $068F04.l		; 8F 04 8F 06
	sbc $FD06.w,X		; FD 06 FD
	asl $FD.b		; 06 FD
	dec $CE35.w		; CE 35 CE
	adc $7DCE.w,X		; 7D CE 7D
	sei		; 78
	sec		; 38
	sei		; 78
	sec		; 38
	sei		; 78
	dec A		; 3A
	adc $387F38.l,X		; 7F 38 7F 38
	sei		; 78
	sec		; 38
	sei		; 78
	dec A		; 3A
	sei		; 78
	dec A		; 3A
	sei		; 78
	sbc $78FF78.l,X		; FF 78 FF 78
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $78FF78.l,X		; FF 78 FF 78
	sbc $7CFF78.l,X		; FF 78 FF 7C
	jmp ($7C7C.w,X)		; 7C 7C 7C
	jmp ($FCFF.w,X)		; 7C FF FC
	adc $7C7FFC.l,X		; 7F FC 7F 7C
	adc $7CFF7C.l,X		; 7F 7C FF 7C
	sbc $7CFF7C.l,X		; FF 7C FF 7C
	sbc $FCFF7C.l,X		; FF 7C FF FC
	sbc $7CFFFC.l,X		; FF FC FF 7C
	sbc $7CFF7C.l,X		; FF 7C FF 7C
	sbc $181818.l,X		; FF 18 18 18
	clc		; 18
	clc		; 18
	cld		; D8
	clc		; 18
	cld		; D8
	clc		; 18
	cld		; D8
	clc		; 18
	cld		; D8
	clc		; 18
	cld		; D8
	clc		; 18
	cld		; D8
	clc		; 18
	sed		; F8
	clc		; 18
	sed		; F8
	clc		; 18
	sed		; F8
	clc		; 18
	sed		; F8
	clc		; 18
	sed		; F8
	clc		; 18
	sed		; F8
	clc		; 18
	sed		; F8
	clc		; 18
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	inc $3F01.w,X		; FE 01 3F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($FE.b,X)		; 01 FE
	sbc $0F3F3F.l,X		; FF 3F 3F 0F
	ora $3F0000.l		; 0F 00 00 3F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	and $373FFF.l,X		; 3F FF 3F 37
	cmp $E3708F.l		; CF 8F 70 E3
	trb $0000.w		; 1C 00 00
	ora ($3F.b,X)		; 01 3F
	ora ($3F.b,X)		; 01 3F
	ora ($3F.b,X)		; 01 3F
	cmp ($FF.b,X)		; C1 FF
	and ($F7.b),Y		; 31 F7
	sta $FFE3FF.l		; 8F FF E3 FF
	brk $00.b		; 00 00
	ora $0F1F0E.l,X		; 1F 0E 1F 0F
	ora $0F1F0F.l,X		; 1F 0F 1F 0F
	eor $00FF0F.l,X		; 5F 0F FF 00
	sbc $000000.l,X		; FF 00 00 00
	sta $7F9F7F.l,X		; 9F 7F 9F 7F
	sta $7F9F7F.l,X		; 9F 7F 9F 7F
	cmp $FFFF7F.l,X		; DF 7F FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFF1F.l,X		; FF 1F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	asl $F6.b		; 06 F6
	asl $F6.b		; 06 F6
	asl $F6.b		; 06 F6
	asl $F6.b		; 06 F6
	asl $F6.b		; 06 F6
	inc $FF00.w,X		; FE 00 FF
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	inc $FE06.w,X		; FE 06 FE
	asl $FE.b		; 06 FE
	asl $FE.b		; 06 FE
	asl $FE.b		; 06 FE
	inc $FFFE.w,X		; FE FE FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	ora $F6.b,X		; 15 F6
	brk $05.b		; 00 05
	brk $F6.b		; 00 F6
	sbc $000000.l,X		; FF 00 00 00
	brk $0D.b		; 00 0D
	brk $F6.b		; 00 F6
	sbc $000001.l,X		; FF 01 00 00
	brk $15.b		; 00 15
	brk $F6.b		; 00 F6
	sbc $000002.l,X		; FF 02 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $000003.l,X		; FF 03 00 00
	brk $08.b		; 00 08
	brk $FE.b		; 00 FE
	sbc $000004.l,X		; FF 04 00 00
	brk $10.b		; 00 10
	brk $FE.b		; 00 FE
	sbc $000005.l,X		; FF 05 00 00
	brk $1F.b		; 00 1F
	sbc $09FF1F.l,X		; FF 1F FF 09
	eor $0B4F09.l		; 4F 09 4F 0B
	eor $7D7B.w		; 4D 7B 7D
	tda		; 7B
	adc $7D7B.w,X		; 7D 7B 7D
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora #$0946.w		; 09 46 09
	lsr $0B.b		; 46 0B
	eor $0B7F0B.l		; 4F 0B 7F 0B
	adc $FF7F0B.l,X		; 7F 0B 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $39FFFF.l,X		; FF FF FF 39
	and $7F39.w,Y		; 39 39 7F
	and $393F.w,Y		; 39 3F 39
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	ora ($39.b,X)		; 01 39
	sbc $39FF39.l,X		; FF 39 FF 39
	sbc $80FF39.l,X		; FF 39 FF 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $03.b,S		; 03 03
	ora $FE.b,S		; 03 FE
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $FE.b,S		; 03 FE
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	sbc $7FEFDF.l		; EF DF EF 7F
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	sbc $7FFF5F.l,X		; FF 5F FF 7F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C8.b		; 00 C8
	sed		; F8
	iny		; C8
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C8.b		; 00 C8
	sed		; F8
	iny		; C8
	sed		; F8
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $80.b		; 06 80
	trb $00.b		; 14 00
	pea $C10A.w		; F4 0A C1
	brk $F4.b		; 00 F4
	sbc $00FFC1.l,X		; FF C1 FF 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $C1.b		; 00 C1
	sbc $000002.l,X		; FF 02 00 00
	brk $F5.b		; 00 F5
	sbc $04FFD1.l,X		; FF D1 FF 04
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $D1.b		; 00 D1
	sbc $000006.l,X		; FF 06 00 00
	brk $FF.b		; 00 FF
	sbc $08FFE1.l,X		; FF E1 FF 08
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $08FFF1.l,X		; FF F1 FF 08
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $FF7F7F.l,X		; 3F 7F 7F FF
	sbc $03FFFF.l,X		; FF FF FF 03
	ora $04.b,S		; 03 04
	ora [$08.b]		; 07 08
	ora $201F10.l		; 0F 10 1F 20
	and $807F40.l,X		; 3F 40 7F 80
	sbc $FFFF8C.l,X		; FF 8C FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FFE6.l,X		; FF E6 FF 80
	bra -64.b		; 80 C0
	cpy #$E0.b		; C0 E0
	cpx #$F0.b		; E0 F0
	beq  -8.b		; F0 F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FEFE.w,X		; FE FE FE
	bra -128.b		; 80 80
	rti		; 40

	cpy #$20.b		; C0 20
	cpx #$10.b		; E0 10
	beq   8.b		; F0 08
	sed		; F8
	tsb $FC.b		; 04 FC
	cop $FE.b		; 02 FE
	adc ($FE.b)		; 72 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	and $1F1F3F.l,X		; 3F 3F 1F 1F
	ora $07070F.l		; 0F 0F 07 07
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	bra  -1.b		; 80 FF
	rti		; 40

	adc $103F20.l,X		; 7F 20 3F 10
	ora $040F08.l,X		; 1F 08 0F 04
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	inc $3000.w,X		; FE 00 30
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	inc $00FE.w,X		; FE FE 00
	sec		; 38
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	sed		; F8
	bpl -16.b		; 10 F0
	jsr $40E0.w		; 20 E0 40
	cpy #$80.b		; C0 80
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
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpx #$C0.b		; E0 C0
	cpx #$C0.b		; E0 C0
	cpx #$C0.b		; E0 C0
	cpx #$C0.b		; E0 C0
	cpx #$C0.b		; E0 C0
	cpx #$C0.b		; E0 C0
	cpx #$C0.b		; E0 C0
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
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $92FFFF.l,X		; FF FF FF 92
	sbc $88FF90.l,X		; FF 90 FF 88
	sbc $82FF84.l,X		; FF 84 FF 82
	sbc $8CFF92.l,X		; FF 92 FF 8C
	sbc $FFFF80.l,X		; FF 80 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $49FFFF.l,X		; FF FF FF 49
	sbc $49FF49.l,X		; FF 49 FF 49
	sbc $49FF49.l,X		; FF 49 FF 49
	sbc $46FF49.l,X		; FF 49 FF 46
	sbc $FEFF00.l,X		; FF 00 FF FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	lsr A		; 4A
	inc $FE4A.w,X		; FE 4A FE
	lsr A		; 4A
	inc $FE72.w,X		; FE 72 FE
	.db $42, $FE		; 42 FE
	.db $42, $FE		; 42 FE
	.db $42, $FE		; 42 FE
	cop $FE.b		; 02 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	brk $38.b		; 00 38
	bmi  56.b		; 30 38
	bmi  56.b		; 30 38
	bmi  56.b		; 30 38
	bmi  56.b		; 30 38
	bmi  56.b		; 30 38
	bmi  56.b		; 30 38
	bmi  56.b		; 30 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bpl   0.b		; 10 00
	inc $08.b,X		; F6 08
	dec $00.b		; C6 00
	inc $FF.b,X		; F6 FF
	sbc ($FF.b),Y		; F1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	sbc ($FF.b,X)		; E1 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	cmp ($FF.b),Y		; D1 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	cmp ($FF.b,X)		; C1 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	cmp #$06FF.w		; C9 FF 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  -1.b		; 70 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3F7F7F.l,X		; FF 7F 7F 3F
	and $0F1F1F.l,X		; 3F 1F 1F 0F
	ora $A90707.l		; 0F 07 07 A9
	sbc $80FF91.l,X		; FF 91 FF 80
	sbc $207F40.l,X		; FF 40 7F 20
	and $081F10.l,X		; 3F 10 1F 08
	ora $FF0707.l		; 0F 07 07 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	inc $FCFC.w,X		; FE FC FC
	rol A		; 2A
	sbc $00FF12.l,X		; FF 12 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $02FF01.l,X		; FF 01 FF 02
	inc $FCFC.w,X		; FE FC FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	ora $1F1F0F.l		; 0F 0F 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	php		; 08
	ora $001F10.l		; 0F 10 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($FEFE.w,X)		; FC FE FE
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($02FC.w,X)		; FC FC 02
	inc $FF01.w,X		; FE 01 FF
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	bra -128.b		; 80 80
	rti		; 40

	cpy #$20.b		; C0 20
	cpx #$20.b		; E0 20
	cpx #$A0.b		; E0 A0
	cpx #$A0.b		; E0 A0
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
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
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
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
	rts		; 60

	brk $60.b		; 00 60
	brk $60.b		; 00 60
	rts		; 60

	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  96.b		; 70 60
	bvs  63.b		; 70 3F
	and $FF7F7F.l,X		; 3F 7F 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $20FFFF.l,X		; FF FF FF 20
	and $807F40.l,X		; 3F 40 7F 80
	sbc $A9FF93.l,X		; FF 93 FF A9
	sbc $91FFA1.l,X		; FF A1 FF 91
	sbc $FFFF89.l,X		; FF 89 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $2AFF93.l,X		; FF 93 FF 2A
	sbc $2BFF2A.l,X		; FF 2A FF 2B
	sbc $E0FF2A.l,X		; FF 2A FF E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$C0.b		; E0 C0
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$40.b		; E0 40
	cpy #$80.b		; C0 80
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
	brk $08.b		; 00 08
	brk $05.b		; 00 05
	brk $FA.b		; 00 FA
	php		; 08
	cmp $00.b,X		; D5 00
	plx		; FA
	sbc $00FFD5.l,X		; FF D5 FF 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $01FFDD.l,X		; FF DD FF 01
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFE5.l,X		; FF E5 FF 02
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFF9.l,X		; FF F9 FF 02
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $02FFE9.l,X		; FF E9 FF 02
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $D5.b		; 00 D5
	sbc $000003.l,X		; FF 03 00 00
	brk $02.b		; 00 02
	brk $DD.b		; 00 DD
	sbc $000004.l,X		; FF 04 00 00
	brk $0F.b		; 00 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $FF7F7F.l,X		; 3F 7F 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	ora $201F10.l		; 0F 10 1F 20
	and $807F40.l,X		; 3F 40 7F 80
	sbc $A5FF9E.l,X		; FF 9E FF A5
	sbc $FFFFB5.l,X		; FF B5 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3F7F7F.l,X		; FF 7F 7F 3F
	and $0F1F1F.l,X		; 3F 1F 1F 0F
	ora $950002.l		; 0F 02 00 95
	sbc $80FFA4.l,X		; FF A4 FF 80
	sbc $207F40.l,X		; FF 40 7F 20
	and $0F1F10.l,X		; 3F 10 1F 0F
	ora $020302.l		; 0F 02 03 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	ora $E0.b,S		; 03 E0
	cpx #$F0.b		; E0 F0
	beq  -8.b		; F0 F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $E0E0.w,X		; FE E0 E0
	bpl -16.b		; 10 F0
	php		; 08
	sed		; F8
	tsb $FC.b		; 04 FC
	cop $FE.b		; 02 FE
	txs		; 9A
	inc $FE56.w,X		; FE 56 FE
	phy		; 5A
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FCFC.w,X		; FE FC FC
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	eor ($FE.b)		; 52 FE
	sta ($FE.b)		; 92 FE
	cop $FE.b		; 02 FE
	tsb $FC.b		; 04 FC
	php		; 08
	sed		; F8
	bpl -16.b		; 10 F0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	sbc $E904.w,X		; FD 04 E9
	brk $FD.b		; 00 FD
	sbc $00FFE9.l,X		; FF E9 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000001.l,X		; FF 01 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $000001.l,X		; FF 01 00 00
	brk $3C.b		; 00 3C
	bit $7E7E.w,X		; 3C 7E 7E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ror $3C7E.w,X		; 7E 7E 3C
	bit $3C00.w,X		; 3C 00 3C
	brk $7E.b		; 00 7E
	ror $5EFF.w,X		; 7E FF 5E
	sbc $5CFF5C.l,X		; FF 5C FF 5C
	sbc $007E00.l,X		; FF 00 7E 00
	bit $0080.w,X		; 3C 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	sbc $00F502.l,X		; FF 02 F5 00
	sbc $FFF5FF.l,X		; FF FF F5 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01FF.w,X		; FD FF 01
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	rts		; 60

	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	rts		; 60

	rts		; 60

	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	beq  96.b		; F0 60
	beq   0.b		; F0 00
	rts		; 60

	rti		; 40

	rts		; 60

	rti		; 40

	rts		; 60

	rti		; 40

	rts		; 60

	rti		; 40

	rts		; 60

	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b,S		; 03 80
	tsb $F800.w		; 0C 00 F8
	sbc $F8FFDA.l,X		; FF DA FF F8
	sbc $00FFDA.l,X		; FF DA FF 00
	tsb $0000.w		; 0C 00 00
	xce		; FB
	sbc $02FFEA.l,X		; FF EA FF 02
	tsb $0000.w		; 0C 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000C04.l,X		; FF 04 0C 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $30.b		; 00 30
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
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $20.b		; 00 20
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $10.b		; 00 10
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
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FB.b		; 00 FB
	sbc $FBFEE2.l,X		; FF E2 FE FB
	sbc $00FFE2.l,X		; FF E2 FF 00
	tsb $0000.w		; 0C 00 00
	inc $EAFF.w,X		; FE FF EA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FD.b		; 00 FD
	sbc $02FFF2.l,X		; FF F2 FF 02
	tsb $0000.w		; 0C 00 00
	inc $FAFF.w,X		; FE FF FA
	sbc $000C03.l,X		; FF 03 0C 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	sbc $FBFFEA.l,X		; FF EA FF FB
	sbc $00FFEA.l,X		; FF EA FF 00
	tsb $0000.w		; 0C 00 00
	jsr ($F2FF.w,X)		; FC FF F2
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FD.b		; 00 FD
	sbc $02FFFA.l,X		; FF FA FF 02
	tsb $0000.w		; 0C 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	sbc $FDFFF1.l,X		; FF F1 FF FD
	sbc $00FFF1.l,X		; FF F1 FF 00
	tsb $0000.w		; 0C 00 00
	sbc $F9FF.w,X		; FD FF F9
	sbc $000C01.l,X		; FF 01 0C 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	sbc $FDFFF8.l,X		; FF F8 FF FD
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $0000.w		; 0C 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $F8.b		; 00 F8
	php		; 08
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $000C00.l,X		; FF 00 0C 00
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	sbc $000C02.l,X		; FF 02 0C 00
	brk $01.b		; 00 01
	ora ($07.b,X)		; 01 07
	ora [$06.b]		; 07 06
	ora [$0C.b]		; 07 0C
	tsb $3730.w		; 0C 30 37
	beq  -2.b		; F0 FE
	cpy #$D9.b		; C0 D9
	bra  -9.b		; 80 F7
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	asl $00.b		; 06 00
	tsb $3003.w		; 0C 03 30
	php		; 08
	beq   1.b		; F0 01
	cpy #$26.b		; C0 26
	bra   8.b		; 80 08
	bra -128.b		; 80 80
	tya		; 98
	sed		; F8
	clc		; 18
	sed		; F8
	brk $44.b		; 00 44
	brk $9C.b		; 00 9C
	ora $FF.b,S		; 03 FF
	ora [$D7.b]		; 07 D7
	clc		; 18
	clc		; 18
	bra   0.b		; 80 00
	tya		; 98
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	clv		; B8
	brk $60.b		; 00 60
	ora $00.b,S		; 03 00
	ora [$28.b]		; 07 28
	clc		; 18
	inc $00.b		; E6 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F9.b		; 00 F9
	asl $FA.b		; 06 FA
	sbc $FAFFF9.l,X		; FF F9 FF FA
	sbc $000C00.l,X		; FF 00 0C 00
	brk $01.b		; 00 01
	brk $FA.b		; 00 FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $0E.b		; 00 0E
	ora $180F0C.l		; 0F 0C 0F 18
	ora $FFE0.w,Y		; 19 E0 FF
	cpy #$F3.b		; C0 F3
	bra -20.b		; 80 EC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0C00.w		; 0E 00 0C
	brk $18.b		; 00 18
	asl $E0.b		; 06 E0
	brk $C0.b		; 00 C0
	tsb $1380.w		; 0C 80 13
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	cpy #$40.b		; C0 40
	cpy #$00.b		; C0 00
	jsr $F818.w		; 20 18 F8
	bit $407C.w,X		; 3C 7C 40
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	cpy #$18.b		; C0 18
	brk $3C.b		; 00 3C
	bra  64.b		; 80 40
	bcs   0.b		; B0 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	ora $FC.b,S		; 03 FC
	sbc $FCFFFB.l,X		; FF FB FF FC
	sbc $000C00.l,X		; FF 00 0C 00
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	sbc $000C01.l,X		; FF 01 0C 00
	brk $1A.b		; 00 1A
	asl $2520.w,X		; 1E 20 25
	cpy #$FF.b		; C0 FF
	cop $D2.b		; 02 D2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc A		; 1A
	brk $20.b		; 00 20
	inc A		; 1A
	cpy #$00.b		; C0 00
	cop $2D.b		; 02 2D
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
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jsr ($FD01.w,X)		; FC 01 FD
	sbc $FDFFFC.l,X		; FF FC FF FD
	sbc $000C00.l,X		; FF 00 0C 00
	brk $28.b		; 00 28
	sec		; 38
	cpy #$FC.b		; C0 FC
	dey		; 88
	inx		; E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	brk $C0.b		; 00 C0
	brk $88.b		; 00 88
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $00FFFF.l,X		; FF FF FF 00
	tsb $0000.w		; 0C 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($80.b,X)		; 01 80
	tsb $00.b		; 04 00
	inc $FF.b,X		; F6 FF
	sbc $FF.b,X		; F5 FF
	inc $FF.b,X		; F6 FF
	sbc $FF.b,X		; F5 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	brk $12.b		; 00 12
	brk $06.b		; 00 06
	brk $24.b		; 00 24
	brk $19.b		; 00 19
	ora ($00.b,X)		; 01 00
	rol $00.b		; 26 00
	ora ($00.b)		; 12 00
	ora ($00.b,S),Y		; 13 00
	tas		; 1B
	brk $0E.b		; 00 0E
	brk $64.b		; 00 64
	brk $9D.b		; 00 9D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	brk $3F.b		; 00 3F
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pld		; 2B
	brk $3F.b		; 00 3F
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	sbc $F9FFF8.l,X		; FF F8 FF F9
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $28.b		; 00 28
	brk $18.b		; 00 18
	brk $50.b		; 00 50
	brk $0C.b		; 00 0C
	brk $7C.b		; 00 7C
	brk $08.b		; 00 08
	cli		; 58
	brk $28.b		; 00 28
	brk $2C.b		; 00 2C
	brk $1A.b		; 00 1A
	brk $D0.b		; 00 D0
	brk $4C.b		; 00 4C
	brk $7C.b		; 00 7C
	brk $08.b		; 00 08
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	inc $FEFA.w,X		; FE FA FE
	sbc $FAFF.w,X		; FD FF FA
	sbc $000C00.l,X		; FF 00 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $A0.b		; 00 A0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $A0.b		; 00 A0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	sbc $FDFEFD.l,X		; FF FD FE FD
	sbc $00FFFD.l,X		; FF FD FF 00
	tsb $0000.w		; 0C 00 00
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	sbc $FFFEFF.l,X		; FF FF FE FF
	sbc $00FFFE.l,X		; FF FE FF 00
	tsb $0000.w		; 0C 00 00
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
	tsb $80.b		; 04 80
	tsb $E400.w		; 0C 00 E4
	trb $02FF.w		; 1C FF 02
	cpx $FF.b		; E4 FF
	sbc $0C00FF.l,X		; FF FF 00 0C
	brk $00.b		; 00 00
	pea $FFFF.w		; F4 FF FF
	sbc $000C02.l,X		; FF 02 0C 00
	brk $04.b		; 00 04
	brk $FF.b		; 00 FF
	sbc $000C02.l,X		; FF 02 0C 00
	brk $14.b		; 00 14
	brk $FF.b		; 00 FF
	sbc $000C04.l,X		; FF 04 0C 00
	brk $1F.b		; 00 1F
	ora $3FFFFF.l,X		; 1F FF FF 3F
	and $000707.l,X		; 3F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	and $07013F.l,X		; 3F 3F 01 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	inc $F8F8.w,X		; FE F8 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FEFF00.l,X		; FF 00 FF FE
	inc $F8E0.w,X		; FE E0 F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $EA.b		; 00 EA
	asl $00.b,X		; 16 00
	cop $EA.b		; 02 EA
	sbc $000000.l,X		; FF 00 00 00
	tsb $0000.w		; 0C 00 00
	plx		; FA
	sbc $020000.l,X		; FF 00 00 02
	tsb $0000.w		; 0C 00 00
	asl A		; 0A
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	tsb $0000.w		; 0C 00 00
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $077F7F.l,X		; FF 7F 7F 07
	ora $000000.l		; 0F 00 00 00
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
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	beq -16.b		; F0 F0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $EF.b		; 00 EF
	bpl   0.b		; 10 00
	ora ($EF.b,X)		; 01 EF
	sbc $000000.l,X		; FF 00 00 00
	tsb $0000.w		; 0C 00 00
	sbc [$FF.b],Y		; F7 FF
	brk $00.b		; 00 00
	ora ($0C.b,X)		; 01 0C
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	ora ($0C.b,X)		; 01 0C
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	ora ($0C.b,X)		; 01 0C
	brk $00.b		; 00 00
	ora $000000.l		; 0F 00 00 00
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $001F7F.l,X		; FF 7F 1F 00
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
	sbc $00FFFF.l,X		; FF FF FF 00
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
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	sbc [$08.b],Y		; F7 08
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	xce		; FB
	ora $00.b,S		; 03 00
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	tsb $0000.w		; 0C 00 00
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	tsb $0000.w		; 0C 00 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	php		; 08
	bra  28.b		; 80 1C
	brk $E2.b		; 00 E2
	asl $01EC.w,X		; 1E EC 01
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	sbc ($FF.b)		; F2 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	sbc ($FF.b)		; F2 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc ($FF.b)		; F2 FF
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	ora ($00.b)		; 12 00
	sbc ($FF.b)		; F2 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	php		; 08
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $0AFFE2.l,X		; FF E2 FF 0A
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $E2.b		; 00 E2
	sbc $00000A.l,X		; FF 0A 00 00
	brk $12.b		; 00 12
	brk $E2.b		; 00 E2
	sbc $00000C.l,X		; FF 0C 00 00
	brk $06.b		; 00 06
	bra   6.b		; 80 06
	bra   6.b		; 80 06
	bra   6.b		; 80 06
	bra   6.b		; 80 06
	bra   7.b		; 80 07
	bra   7.b		; 80 07
	bra   6.b		; 80 06
	bra   6.b		; 80 06
	sbc $06FF06.l,X		; FF 06 FF 06
	sbc $06FF06.l,X		; FF 06 FF 06
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $18FF06.l,X		; FF 06 FF 18
	php		; 08
	clc		; 18
	brk $19.b		; 00 19
	ora ($1B.b,X)		; 01 1B
	asl A		; 0A
	tsa		; 3B
	php		; 08
	sbc ($00.b,S),Y		; F3 00
	sbc $60.b,S		; E3 60
	ora $00.b,S		; 03 00
	clc		; 18
	sbc [$18.b],Y		; F7 18
	sbc $1BFE19.l,X		; FF 19 FE 1B
	sbc $3B.b,X		; F5 3B
	sbc [$F3.b],Y		; F7 F3
	sbc $039FE3.l,X		; FF E3 9F 03
	sbc $000000.l,X		; FF 00 00 00
	brk $FB.b		; 00 FB
	php		; 08
	sbc $1900.w,Y		; F9 00 19
	ldy #$19.b		; A0 19
	brk $19.b		; 00 19
	brk $19.b		; 00 19
	brk $00.b		; 00 00
	sbc $FBFF00.l,X		; FF 00 FF FB
	sbc [$F9.b],Y		; F7 F9
	sbc $19FF19.l,X		; FF 19 FF 19
	sbc $19FF19.l,X		; FF 19 FF 19
	sbc $000000.l,X		; FF 00 00 00
	brk $9C.b		; 00 9C
	sty $8C.b		; 84 8C
	brk $8C.b		; 00 8C
	brk $8C.b		; 00 8C
	brk $8C.b		; 00 8C
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	sbc $9CFF00.l,X		; FF 00 FF 9C
	tda		; 7B
	sty $8CFF.w		; 8C FF 8C
	sbc $8CFF8C.l,X		; FF 8C FF 8C
	sbc $00FF8C.l,X		; FF 8C FF 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	mvp $82,$FE		; 44 FE 82
	dec $20.b		; C6 20
	cpx #$90.b		; E0 90
	bvs   8.b		; 70 08
	bit $0024.w,X		; 3C 24 00
	sbc $7CFF00.l,X		; FF 00 FF 7C
	tyx		; BB
	inc $C67D.w,X		; FE 7D C6
	sbc $707FE0.l,X		; FF E0 7F 70
	sbc $00DB3C.l,X		; FF 3C DB 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	jsl $63417F.l		; 22 7F 41 63
	trb $63.b		; 14 63
	brk $63.b		; 00 63
	brk $7F.b		; 00 7F
	ora ($00.b,X)		; 01 00
	sbc $3EFF00.l,X		; FF 00 FF 3E
	cmp $BE7F.w,X		; DD 7F BE
	adc $FF.b,S		; 63 FF
	adc $FF.b,S		; 63 FF
	adc $FF.b,S		; 63 FF
	adc $0001FE.l,X		; 7F FE 01 00
	ora ($00.b,X)		; 01 00
	ora $203F10.l,X		; 1F 10 3F 20
	and ($0A.b),Y		; 31 0A
	and ($00.b),Y		; 31 00
	and ($00.b),Y		; 31 00
	and ($00.b),Y		; 31 00
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora $DF3FEF.l,X		; 1F EF 3F DF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	asl $80.b		; 06 80
	asl $80.b		; 06 80
	asl $88.b		; 06 88
	ora $800080.l		; 0F 80 00 80
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	asl $FF.b		; 06 FF
	ora $FF00FF.l		; 0F FF 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $02.b,S		; 03 02
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora $FD.b,S		; 03 FD
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora $1900.w,Y		; 19 00 19
	jsr $A019.w		; 20 19 A0
	sbc $EC05.w,Y		; F9 05 EC
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $19FF.w,Y		; 19 FF 19
	sbc $F9FF19.l,X		; FF 19 FF F9
	inc $F7EC.w,X		; FE EC F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sty $8C00.w		; 8C 00 8C
	bpl -116.b		; 10 8C
	bvc  -4.b		; 50 FC
	cop $F6.b		; 02 F6
	sty $00.b,X		; 94 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $8CFF8C.l,X		; FF 8C FF 8C
	sbc $FCFF8C.l,X		; FF 8C FF FC
	sbc $006BF6.l,X		; FF F6 6B 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $0E.b		; 00 0E
	bpl -58.b		; 10 C6
	brk $C6.b		; 00 C6
	rol A		; 2A
	inc $7C82.w,X		; FE 82 7C
	jmp ($0000.w)		; 6C 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	asl $C6FF.w		; 0E FF C6
	sbc $FEFDC6.l,X		; FF C6 FD FE
	adc $937C.w,X		; 7D 7C 93
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ror $6006.w,X		; 7E 06 60
	brk $63.b		; 00 63
	trb $7F.b		; 14 7F
	eor ($3E.b,X)		; 41 3E
	jsl $000000.l		; 22 00 00 00
	brk $00.b		; 00 00
	sbc $60F97E.l,X		; FF 7E F9 60
	sbc $7FFF63.l,X		; FF 63 FF 7F
	ldx $DD3E.w,Y		; BE 3E DD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	and ($00.b),Y		; 31 00
	and ($00.b),Y		; 31 00
	and ($0A.b),Y		; 31 0A
	and $121E20.l,X		; 3F 20 1E 12
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and ($FF.b),Y		; 31 FF
	and $ED1EDF.l,X		; 3F DF 1E ED
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	bra  72.b		; 80 48
	cpy #$88.b		; C0 88
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	cpy #$70.b		; C0 70
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	ora $800780.l,X		; 1F 80 07 80
	asl $80.b		; 06 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF07FF.l,X		; 1F FF 07 FF
	asl $FF.b		; 06 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$60.b		; E0 60
	beq   0.b		; F0 00
	sec		; 38
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$9F.b		; E0 9F
	beq  -1.b		; F0 FF
	sec		; 38
	sbc [$00.b],Y		; F7 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF03.l,X		; FF 03 FF 01
	sbc $00FF01.l,X		; FF 01 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	bra -120.b		; 80 88
	bra   8.b		; 80 08
	bra   8.b		; 80 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	bra 112.b		; 80 70
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	ora $6080.w,Y		; 19 80 60
	brk $CD.b		; 00 CD
	and ($E7.b)		; 32 E7
	ora [$CD.b],Y		; 17 CD
	sbc $00FFE7.l,X		; FF E7 FF 00
	brk $00.b		; 00 00
	brk $DD.b		; 00 DD
	sbc $02FFE7.l,X		; FF E7 FF 02
	brk $00.b		; 00 00
	brk $ED.b		; 00 ED
	sbc $04FFE7.l,X		; FF E7 FF 04
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $06FFE7.l,X		; FF E7 FF 06
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $E7.b		; 00 E7
	sbc $000008.l,X		; FF 08 00 00
	brk $1F.b		; 00 1F
	brk $E7.b		; 00 E7
	sbc $00000A.l,X		; FF 0A 00 00
	brk $2F.b		; 00 2F
	brk $E7.b		; 00 E7
	sbc $00000C.l,X		; FF 0C 00 00
	brk $CD.b		; 00 CD
	sbc $0EFFF7.l,X		; FF F7 FF 0E
	brk $00.b		; 00 00
	brk $DD.b		; 00 DD
	sbc $20FFF7.l,X		; FF F7 FF 20
	brk $00.b		; 00 00
	brk $ED.b		; 00 ED
	sbc $22FFF7.l,X		; FF F7 FF 22
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $24FFF7.l,X		; FF F7 FF 24
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $F7.b		; 00 F7
	sbc $000026.l,X		; FF 26 00 00
	brk $1D.b		; 00 1D
	brk $F7.b		; 00 F7
	sbc $000028.l,X		; FF 28 00 00
	brk $2D.b		; 00 2D
	brk $F7.b		; 00 F7
	sbc $00002A.l,X		; FF 2A 00 00
	brk $D2.b		; 00 D2
	sbc $2C0007.l,X		; FF 07 00 2C
	brk $00.b		; 00 00
	brk $E2.b		; 00 E2
	sbc $2E0007.l,X		; FF 07 00 2E
	brk $00.b		; 00 00
	brk $F2.b		; 00 F2
	sbc $400007.l,X		; FF 07 00 40
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $07.b		; 00 07
	brk $42.b		; 00 42
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	brk $07.b		; 00 07
	brk $44.b		; 00 44
	brk $00.b		; 00 00
	brk $22.b		; 00 22
	brk $07.b		; 00 07
	brk $46.b		; 00 46
	brk $00.b		; 00 00
	brk $D9.b		; 00 D9
	sbc $480017.l,X		; FF 17 00 48
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $4A0017.l,X		; FF 17 00 4A
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $17.b		; 00 17
	brk $4C.b		; 00 4C
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $17.b		; 00 17
	brk $4E.b		; 00 4E
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $17.b		; 00 17
	brk $4C.b		; 00 4C
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $1C.b		; 00 1C
	brk $30.b		; 00 30
	brk $60.b		; 00 60
	brk $41.b		; 00 41
	brk $C1.b		; 00 C1
	brk $83.b		; 00 83
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	ora $3F.b,S		; 03 3F
	ora $7F1F7F.l		; 0F 7F 1F 7F
	rol $3EFF.w,X		; 3E FF 3E
	sbc $00FF7C.l,X		; FF 7C FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $00E000.l,X		; 3F 00 E0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	cpx #$00.b		; E0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $001900.l,X		; FF 00 19 00
	ora ($00.b,X)		; 01 00
	cmp ($00.b,X)		; C1 00
	adc ($00.b),Y		; 71 00
	ora $0900.w,Y		; 19 00 09
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FF.b		; E6 FF
	inc $3EFF.w,X		; FE FF 3E
	adc $061F0E.l,X		; 7F 0E 1F 06
	ora $000F06.l		; 0F 06 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $01.b,S		; 03 01
	ora [$01.b]		; 07 01
	ora [$03.b]		; 07 03
	sbc $008100.l,X		; FF 00 81 00
	sta ($00.b,X)		; 81 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	sec		; 38
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ror $7EFF.w,X		; 7E FF 7E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $EFFFEF.l,X		; FF EF FF EF
	sbc $0000C7.l,X		; FF C7 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	cpy #$FF.b		; C0 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	and $800080.l,X		; 3F 80 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	cpy #$F0.b		; C0 F0
	cpy #$F0.b		; C0 F0
	cpx #$03.b		; E0 03
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora ($07.b,X)		; 01 07
	ora ($07.b,X)		; 01 07
	ora $0F.b,S		; 03 0F
	ora $0F.b,S		; 03 0F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora $0100FF.l		; 0F FF 00 01
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FEFF.w,X		; FE FF FE
	sbc $F8FCF8.l,X		; FF F8 FC F8
	jsr ($FCF8.w,X)		; FC F8 FC
	sed		; F8
	jsr ($FFF8.w,X)		; FC F8 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C1.b		; 00 C1
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	rol $3E7F.w,X		; 3E 7F 3E
	adc $3E7F3E.l,X		; 7F 3E 7F 3E
	adc $00FF3E.l,X		; 7F 3E FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000100.l,X		; FF 00 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	beq  96.b		; F0 60
	beq  96.b		; F0 60
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
	sta $00.b,S		; 83 00
	cmp ($00.b,X)		; C1 00
	eor ($00.b,X)		; 41 00
	rts		; 60

	brk $30.b		; 00 30
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	jmp ($3EFF.w,X)		; 7C FF 3E
	adc $1F7F3E.l,X		; 7F 3E 7F 1F
	and $031F0F.l,X		; 3F 0F 1F 03
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc ($00.b,X)		; E1 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc ($00.b,X)		; E1 00
	sbc $FFFFC0.l,X		; FF C0 FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	.db $82, $00, $82		; 82 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $FE.b		; 00 FE
	jmp ($7CFE.w,X)		; 7C FE 7C
	inc $FE7C.w,X		; FE 7C FE
	jmp ($7CFE.w,X)		; 7C FE 7C
	inc $FE7C.w,X		; FE 7C FE
	jmp ($7CFE.w,X)		; 7C FE 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$03.b]		; 07 03
	ora [$03.b]		; 07 03
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $3EFFFF.l,X		; FF FF FF 3E
	tsb $0800.w		; 0C 00 08
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $B0.b		; 00 B0
	brk $A0.b		; 00 A0
	brk $E0.b		; 00 E0
	brk $C3.b		; 00 C3
	brk $0F.b		; 00 0F
	ora $0F.b,S		; 03 0F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora $BF0FBF.l		; 0F BF 0F BF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	bit $0028.w,X		; 3C 28 00
	jmp ($4400.w)		; 6C 00 44
	brk $C6.b		; 00 C6
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	cmp [$EF.b]		; C7 EF
	sta $C7.b,S		; 83 C7
	sta $C7.b,S		; 83 C7
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	brk $04.b		; 00 04
	brk $06.b		; 00 06
	brk $02.b		; 00 02
	brk $F0.b		; 00 F0
	cpy #$F0.b		; C0 F0
	cpx #$F8.b		; E0 F8
	cpx #$F8.b		; E0 F8
	beq  -4.b		; F0 FC
	beq  -4.b		; F0 FC
	sed		; F8
	inc $FEF8.w,X		; FE F8 FE
	jsr ($0042.w,X)		; FC 42 00
	eor $00.b,S		; 43 00
	eor $00.b,S		; 43 00
	eor $00.b,S		; 43 00
	.db $42, $00		; 42 00
	.db $42, $00		; 42 00
	.db $42, $00		; 42 00
	.db $42, $00		; 42 00
	adc $3C7F3D.l,X		; 7F 3D 7F 3C
	adc $3C7F3C.l,X		; 7F 3C 7F 3C
	ror $7E3C.w,X		; 7E 3C 7E
	bit $3C7E.w,X		; 3C 7E 3C
	ror $183C.w,X		; 7E 3C 18
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	brk $84.b		; 00 84
	brk $86.b		; 00 86
	brk $C2.b		; 00 C2
	brk $43.b		; 00 43
	brk $61.b		; 00 61
	brk $F8.b		; 00 F8
	cpx #$F8.b		; E0 F8
	beq  -4.b		; F0 FC
	beq  -4.b		; F0 FC
	sei		; 78
	inc $FE78.w,X		; FE 78 FE
	bit $3C7F.w,X		; 3C 7F 3C
	adc $00301E.l,X		; 7F 1E 30 00
	jsr $6000.w		; 20 00 60
	brk $43.b		; 00 43
	brk $C3.b		; 00 C3
	brk $87.b		; 00 87
	brk $85.b		; 00 85
	brk $0D.b		; 00 0D
	brk $3F.b		; 00 3F
	ora $7F1F3F.l		; 0F 3F 1F 7F
	ora $FF3C7F.l,X		; 1F 7F 3C FF
	bit $78FF.w,X		; 3C FF 78
	sbc $FD78.w,X		; FD 78 FD
	beq   4.b		; F0 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	sed		; F8
	jsr ($41F8.w,X)		; FC F8 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $7F.b		; 00 7F
	rol $3E7F.w,X		; 3E 7F 3E
	adc $3F7F3E.l,X		; 7F 3E 7F 3F
	adc $3E7F3F.l,X		; 7F 3F 7F 3E
	adc $3E7F3E.l,X		; 7F 3E 7F 3E
	asl $1200.w,X		; 1E 00 12
	brk $F2.b		; 00 F2
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $F2.b		; 00 F2
	brk $12.b		; 00 12
	brk $1E.b		; 00 1E
	brk $1E.b		; 00 1E
	brk $1E.b		; 00 1E
	tsb $0CFE.w		; 0C FE 0C
	inc $FEFC.w,X		; FE FC FE
	jsr ($0CFE.w,X)		; FC FE 0C
	asl $1E0C.w,X		; 1E 0C 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora ($07.b,X)		; 01 07
	ora ($00.b,X)		; 01 00
	brk $0F.b		; 00 0F
	brk $38.b		; 00 38
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $03.b		; 00 03
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $3F.b		; 00 3F
	ora [$FF.b]		; 07 FF
	ora $FF7FFF.l,X		; 1F FF 7F FF
	jsr ($F8FE.w,X)		; FC FE F8
	jsr ($41F8.w,X)		; FC F8 41
	brk $41.b		; 00 41
	brk $C1.b		; 00 C1
	brk $83.b		; 00 83
	brk $03.b		; 00 03
	brk $06.b		; 00 06
	brk $0E.b		; 00 0E
	brk $FB.b		; 00 FB
	brk $7F.b		; 00 7F
	rol $3E7F.w,X		; 3E 7F 3E
	sbc $7CFF3E.l,X		; FF 3E FF 7C
	sbc $F9FFFC.l,X		; FF FC FF F9
	sbc $00FBF1.l,X		; FF F1 FB 00
	rep #$00		; C2 00
	stx $00.b		; 86 00
	sty $00.b		; 84 00
	tsb $0C00.w		; 0C 00 0C
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	bit $78FE.w,X		; 3C FE 78
	jsr ($FC78.w,X)		; FC 78 FC
	beq  -4.b		; F0 FC
	beq  -4.b		; F0 FC
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr ($7EFF.w,X)		; FC FF 7E
	sbc $3FFF7E.l,X		; FF 7E FF 3F
	sbc $7FFF3F.l,X		; FF 3F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	beq   0.b		; F0 00
	rts		; 60

	brk $60.b		; 00 60
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	ora $9F0F1F.l		; 0F 1F 0F 9F
	ora $FF0F9F.l		; 0F 9F 0F FF
	ora $FF9FFF.l		; 0F FF 9F FF
	sta $8800FF.l,X		; 9F FF 00 88
	brk $8C.b		; 00 8C
	brk $84.b		; 00 84
	brk $86.b		; 00 86
	brk $C2.b		; 00 C2
	brk $43.b		; 00 43
	brk $41.b		; 00 41
	brk $C1.b		; 00 C1
	brk $8F.b		; 00 8F
	ora [$8F.b]		; 07 8F
	ora $87.b,S		; 03 87
	ora $87.b,S		; 03 87
	ora ($C3.b,X)		; 01 C3
	ora ($C3.b,X)		; 01 C3
	bra -63.b		; 80 C1
	bra -63.b		; 80 C1
	brk $42.b		; 00 42
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $09.b		; 00 09
	brk $19.b		; 00 19
	brk $11.b		; 00 11
	brk $F1.b		; 00 F1
	brk $FE.b		; 00 FE
	ldy $F8FE.w,X		; BC FE F8
	jsr ($FCF8.w,X)		; FC F8 FC
	beq  -7.b		; F0 F9
	beq  -7.b		; F0 F9
	cpx #$F1.b		; E0 F1
	cpx #$F1.b		; E0 F1
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	rol $3E7F.w,X		; 3E 7F 3E
	adc $3E7F3E.l,X		; 7F 3E 7F 3E
	sbc $FFFF3E.l,X		; FF 3E FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	beq   0.b		; F0 00
	rts		; 60

	brk $60.b		; 00 60
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	ora $1F0F1F.l		; 0F 1F 0F 1F
	ora $FF0F1F.l		; 0F 1F 0F FF
	ora $FF9FFF.l		; 0F FF 9F FF
	sta $4000FF.l,X		; 9F FF 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $3C.b		; 00 3C
	brk $24.b		; 00 24
	brk $64.b		; 00 64
	brk $44.b		; 00 44
	brk $C4.b		; 00 C4
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	clc		; 18
	jmp ($7C18.w,X)		; 7C 18 7C
	sec		; 38
	jsr ($FC38.w,X)		; FC 38 FC
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $FF.b		; 00 FF
	ror $7EFF.w,X		; 7E FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
	sbc $7EFF7E.l,X		; FF 7E FF 7E
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
	brk $00.b		; 00 00
	rts		; 60

	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $7F.b		; 00 7F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $601F3F.l,X		; 1F 3F 1F 60
	brk $70.b		; 00 70
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $58.b		; 00 58
	brk $48.b		; 00 48
	brk $48.b		; 00 48
	brk $4C.b		; 00 4C
	brk $FF.b		; 00 FF
	sta $DF8FFF.l,X		; 9F FF 8F DF
	sta $DF8FDF.l		; 8F DF 8F DF
	sta [$CF.b]		; 87 CF
	sta [$CF.b]		; 87 CF
	sta [$CF.b]		; 87 CF
	sta $00.b,S		; 83 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $9C.b		; 00 9C
	brk $06.b		; 00 06
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FFFF.w,X		; FE FF FF
	sbc $039F0F.l,X		; FF 0F 9F 03
	ora [$01.b]		; 07 01
	ora $01.b,S		; 03 01
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	cpy $00.b		; C4 00
	stz $00.b,X		; 74 00
	asl $0E00.w,X		; 1E 00 0E
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $C7.b		; 00 C7
	ora $F7.b,S		; 03 F7
	sta $FF.b,S		; 83 FF
	sbc ($FF.b,X)		; E1 FF
	sbc ($FF.b),Y		; F1 FF
	sed		; F8
	sbc $0000F8.l,X		; FF F8 00 00
	jsr ($0400.w,X)		; FC 00 04
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	beq  -8.b		; F0 F8
	beq  -4.b		; F0 FC
	beq  -4.b		; F0 FC
	sed		; F8
	brk $00.b		; 00 00
	ora $001000.l,X		; 1F 00 10 00
	bpl   0.b		; 10 00
	clc		; 18
	brk $08.b		; 00 08
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	ora $1F0F1F.l		; 0F 1F 0F 1F
	ora [$0F.b]		; 07 0F
	ora [$1F.b]		; 07 1F
	ora [$1F.b]		; 07 1F
	ora $FF0000.l		; 0F 00 00 FF
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $7C.b		; 00 7C
	brk $44.b		; 00 44
	brk $C4.b		; 00 C4
	brk $84.b		; 00 84
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc [$FF.b]		; E7 FF
	sbc [$FF.b]		; E7 FF
	sta $C7.b,S		; 83 C7
	sta $C7.b,S		; 83 C7
	ora $87.b,S		; 03 87
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpx #$F0.b		; E0 F0
	cpx #$F0.b		; E0 F0
	cpx #$F0.b		; E0 F0
	cpx #$00.b		; E0 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $F1.b		; 00 F1
	brk $11.b		; 00 11
	brk $19.b		; 00 19
	brk $09.b		; 00 09
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FEFF.w,X		; FE FF FE
	sbc $0E1F0E.l,X		; FF 0E 1F 0E
	ora $060F06.l,X		; 1F 06 0F 06
	brk $00.b		; 00 00
	sbc $008000.l,X		; FF 00 80 00
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	ora $3F1F3F.l,X		; 1F 3F 1F 3F
	ora $001F3F.l,X		; 1F 3F 1F 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $83.b		; 00 83
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora ($83.b,X)		; 01 83
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $3C.b		; 00 3C
	brk $06.b		; 00 06
	brk $02.b		; 00 02
	brk $83.b		; 00 83
	brk $C1.b		; 00 C1
	brk $41.b		; 00 41
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $FC.b		; 00 FC
	cpy #$FE.b		; C0 FE
	sed		; F8
	inc $FFFC.w,X		; FE FC FF
	jmp ($3EFF.w,X)		; 7C FF 3E
	adc $00003E.l,X		; 7F 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($00.b,X)		; 81 00
	sta ($00.b,X)		; 81 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	ror $7EFF.w,X		; 7E FF 7E
	sbc $3F7F3F.l,X		; FF 3F 7F 3F
	adc $0F3F1F.l,X		; 7F 1F 3F 0F
	ora $000703.l,X		; 1F 03 07 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	adc ($00.b,S),Y		; 73 00
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $F3.b		; 00 F3
	bra  -1.b		; 80 FF
	sbc ($FF.b,X)		; E1 FF
	sbc $20FFFF.l,X		; FF FF FF 20
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $81.b		; 00 81
	brk $03.b		; 00 03
	brk $0E.b		; 00 0E
	brk $38.b		; 00 38
	brk $3F.b		; 00 3F
	ora $7F1F7F.l,X		; 1F 7F 1F 7F
	and $FF3FFF.l,X		; 3F FF 3F FF
	ror $FCFF.w,X		; 7E FF FC
	inc $F8F0.w,X		; FE F0 F8
	cpy #$44.b		; C0 44
	brk $44.b		; 00 44
	brk $C6.b		; 00 C6
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $C7.b		; 00 C7
	sta $C7.b,S		; 83 C7
	sta $C7.b,S		; 83 C7
	ora ($83.b,X)		; 01 83
	ora ($83.b,X)		; 01 83
	ora ($03.b,X)		; 01 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $82.b		; 00 82
	brk $C6.b		; 00 C6
	brk $44.b		; 00 44
	brk $44.b		; 00 44
	brk $6C.b		; 00 6C
	brk $28.b		; 00 28
	brk $28.b		; 00 28
	brk $38.b		; 00 38
	brk $83.b		; 00 83
	ora ($C7.b,X)		; 01 C7
	ora ($C7.b,X)		; 01 C7
	sta $C7.b,S		; 83 C7
	sta $EF.b,S		; 83 EF
	sta $EF.b,S		; 83 EF
	cmp [$EF.b]		; C7 EF
	cmp [$FF.b]		; C7 FF
	cmp [$10.b]		; C7 10
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	cpx #$F0.b		; E0 F0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $83.b		; 00 83
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $83.b		; 00 83
	brk $82.b		; 00 82
	brk $FE.b		; 00 FE
	jmp ($7CFE.w,X)		; 7C FE 7C
	inc $FF7C.w,X		; FE 7C FF
	jmp ($7FFF.w,X)		; 7C FF 7F
	sbc $7CFF7F.l,X		; FF 7F FF 7C
	inc $017C.w,X		; FE 7C 01
	brk $3C.b		; 00 3C
	brk $24.b		; 00 24
	brk $E4.b		; 00 E4
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $E4.b		; 00 E4
	brk $24.b		; 00 24
	brk $01.b		; 00 01
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	clc		; 18
	jsr ($FC18.w,X)		; FC 18 FC
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	clc		; 18
	bit $E418.w,X		; 3C 18 E4
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $E7.b		; 00 E7
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	ora $10.b,S		; 03 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $1C.b		; 00 1C
	brk $F0.b		; 00 F0
	cpx #$F0.b		; E0 F0
	cpx #$F0.b		; E0 F0
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc [$FF.b]		; E7 FF
	sbc $08.b,S		; E3 08
	brk $18.b		; 00 18
	brk $70.b		; 00 70
	brk $C0.b		; 00 C0
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $38.b		; 00 38
	brk $30.b		; 00 30
	brk $0F.b		; 00 0F
	ora [$1F.b]		; 07 1F
	ora [$7F.b]		; 07 7F
	ora $FF3FFF.l		; 0F FF 3F FF
	inc $F0FF.w,X		; FE FF F0
	sed		; F8
	cpy #$F0.b		; C0 F0
	cpy #$20.b		; C0 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	bra -64.b		; 80 C0
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
	brk $F0.b		; 00 F0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
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
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $11.b		; 00 11
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FF.b		; 00 FF
	sbc $FFEFFF.l		; EF FF EF FF
	inc $FEFF.w		; EE FF FE
	sbc $FCFFFE.l,X		; FF FE FF FC
	inc $FEFC.w,X		; FE FC FE
	jsr ($0080.w,X)		; FC 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	.db $82, $00, $82		; 82 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $83.b		; 00 83
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	jmp ($7CFE.w,X)		; 7C FE 7C
	inc $FE7C.w,X		; FE 7C FE
	jmp ($7CFE.w,X)		; 7C FE 7C
	sbc $FFFF7C.l,X		; FF 7C FF FF
	sbc $003CFF.l,X		; FF FF 3C 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $04FFFF.l,X		; FF FF FF 04
	brk $E4.b		; 00 E4
	brk $24.b		; 00 24
	brk $24.b		; 00 24
	brk $24.b		; 00 24
	brk $3C.b		; 00 3C
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $07.b		; 00 07
	ora $E7.b,S		; 03 E7
	ora $E7.b,S		; 03 E7
	cmp $E7.b,S		; C3 E7
	cmp $E7.b,S		; C3 E7
	cmp $FF.b,S		; C3 FF
	cmp $FF.b,S		; C3 FF
	cmp $16CFFF.l		; CF FF CF 16
	brk $13.b		; 00 13
	brk $11.b		; 00 11
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $1C.b		; 00 1C
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F7.b		; 00 F7
	sbc ($F3.b,X)		; E1 F3
	cpx #$F1.b		; E0 F1
	cpx #$F0.b		; E0 F0
	cpx #$F0.b		; E0 F0
	cpx #$FC.b		; E0 FC
	cpx #$FC.b		; E0 FC
	sed		; F8
	jsr ($18F8.w,X)		; FC F8 18
	brk $0C.b		; 00 0C
	brk $86.b		; 00 86
	brk $C3.b		; 00 C3
	brk $61.b		; 00 61
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $F8.b		; 00 F8
	cpx #$FC.b		; E0 FC
	beq  -2.b		; F0 FE
	sei		; 78
	sbc $1E7F3C.l,X		; FF 3C 7F 1E
	and $1F3F0F.l,X		; 3F 0F 3F 1F
	and $00001F.l,X		; 3F 1F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $F000.w		; 0C 00 F0
	bpl -10.b		; 10 F6
	asl A		; 0A
	beq  -1.b		; F0 FF
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $000002.l,X		; FF 02 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sbc $008002.l,X		; FF 02 80 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $3F8000.l,X		; FF 00 80 3F
	bra  63.b		; 80 3F
	bra  63.b		; 80 3F
	bra  63.b		; 80 3F
	bra  63.b		; 80 3F
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	adc $3F7F3F.l,X		; 7F 3F 7F 3F
	adc $3F7F3F.l,X		; 7F 3F 7F 3F
	adc $007F3F.l,X		; 7F 3F 7F 00
	adc $00FF00.l,X		; 7F 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000600.l,X		; FF 00 06 00
	ora $00.b		; 05 00
	tsb $00.b		; 04 00
	tsb $01.b		; 04 01
	tsb $01.b		; 04 01
	tsb $01.b		; 04 01
	jsr ($0001.w,X)		; FC 01 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	bra  16.b		; 80 10
	cpy #$08.b		; C0 08
	cpx #$04.b		; E0 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	bra -32.b		; 80 E0
	cpy #$F0.b		; C0 F0
	cpx #$F8.b		; E0 F8
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000100.l,X		; FF 00 01 00
	ora ($FC.b,X)		; 01 FC
	ora ($04.b,X)		; 01 04
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF01FF.l,X		; FF FF 01 FF
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	beq   2.b		; F0 02
	sed		; F8
	ora ($FC.b,X)		; 01 FC
	brk $F8.b		; 00 F8
	ora ($F0.b,X)		; 01 F0
	cop $E0.b		; 02 E0
	tsb $C0.b		; 04 C0
	php		; 08
	bra  16.b		; 80 10
	beq  -4.b		; F0 FC
	sed		; F8
	inc $FFFC.w,X		; FE FC FF
	sed		; F8
	inc $FCF0.w,X		; FE F0 FC
	cpx #$F8.b		; E0 F8
	cpy #$F0.b		; C0 F0
	bra -32.b		; 80 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $F400.w		; 0C 00 F4
	tsb $0CF4.w		; 0C F4 0C
	pea $F4FF.w		; F4 FF F4
	sbc $000000.l,X		; FF 00 00 00
	brk $04.b		; 00 04
	brk $F4.b		; 00 F4
	sbc $000002.l,X		; FF 02 00 00
	brk $F4.b		; 00 F4
	sbc $040004.l,X		; FF 04 00 04
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $040004.l,X		; FF 04 00 04
	rti		; 40

	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$01.b]		; 07 01
	ora $071F03.l		; 0F 03 1F 07
	and $1F7F0F.l,X		; 3F 0F 7F 1F
	sbc $7FFF3F.l,X		; FF 3F FF 7F
	ora $00.b,S		; 03 00
	ora [$01.b]		; 07 01
	asl $1C03.w		; 0E 03 1C
	ora [$38.b]		; 07 38
	ora $E01F70.l		; 0F 70 1F E0
	and $FF7FC0.l,X		; 3F C0 7F FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F000E0.l,X		; FF E0 00 F0
	cpy #$F8.b		; C0 F8
	cpx #$FC.b		; E0 FC
	beq  -2.b		; F0 FE
	sed		; F8
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $00E0FF.l,X		; FF FF E0 00
	beq -64.b		; F0 C0
	sec		; 38
	cpx #$1C.b		; E0 1C
	beq  14.b		; F0 0E
	sed		; F8
	ora [$FC.b]		; 07 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
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
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	sbc $3FFF7F.l,X		; FF 7F FF 3F
	adc $0F3F1F.l,X		; 7F 1F 3F 0F
	ora $030F07.l,X		; 1F 07 0F 03
	ora [$01.b]		; 07 01
	ora $00.b,S		; 03 00
	cpy #$7F.b		; C0 7F
	cpx #$3F.b		; E0 3F
	bvs  31.b		; 70 1F
	sec		; 38
	ora $0E071C.l		; 0F 1C 07 0E
	ora $07.b,S		; 03 07
	ora ($03.b,X)		; 01 03
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $C67FFF.l,X		; 7F FF 7F C6
	adc $C87FC9.l,X		; 7F C9 7F C8
	adc $C27FC4.l,X		; 7F C4 7F C2
	adc $C97FC1.l,X		; 7F C1 7F C9
	adc $FF7FC6.l,X		; 7F C6 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $73FFFF.l,X		; FF FF FF 73
	sbc $24FF24.l,X		; FF 24 FF 24
	sbc $24FF24.l,X		; FF 24 FF 24
	sbc $24FF24.l,X		; FF 24 FF 24
	sbc $FFFF23.l,X		; FF 23 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $39FFFF.l,X		; FF FF FF 39
	sbc $A5FFA5.l,X		; FF A5 FF A5
	sbc $B9FFA5.l,X		; FF A5 FF B9
	sbc $A1FFA1.l,X		; FF A1 FF A1
	sbc $80FF21.l,X		; FF 21 FF 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $01.b		; 00 01
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
	brk $07.b		; 00 07
	bra  28.b		; 80 1C
	brk $CD.b		; 00 CD
	bit $F1.b,X		; 34 F1
	sbc $F1FFCD.l,X		; FF CD FF F1
	sbc $000000.l,X		; FF 00 00 00
	brk $DD.b		; 00 DD
	sbc $02FFF1.l,X		; FF F1 FF 02
	brk $00.b		; 00 00
	brk $ED.b		; 00 ED
	sbc $04FFF1.l,X		; FF F1 FF 04
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $06FFF1.l,X		; FF F1 FF 06
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $F1.b		; 00 F1
	sbc $000008.l,X		; FF 08 00 00
	brk $1D.b		; 00 1D
	brk $F1.b		; 00 F1
	sbc $00000A.l,X		; FF 0A 00 00
	brk $2D.b		; 00 2D
	brk $F1.b		; 00 F1
	sbc $00000C.l,X		; FF 0C 00 00
	brk $00.b		; 00 00
	sbc $40807F.l,X		; FF 7F 80 40
	lda $40BF40.l,X		; BF 40 BF 40
	lda $40BF40.l,X		; BF 40 BF 40
	lda $00BF40.l,X		; BF 40 BF 00
	sbc $40FF7F.l,X		; FF 7F FF 40
	sbc $40FE40.l,X		; FF 40 FE 40
	jsr ($FC40.w,X)		; FC 40 FC
	rti		; 40

	jsr ($FC40.w,X)		; FC 40 FC
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $0F.b		; 00 0F
	brk $67.b		; 00 67
	brk $7F.b		; 00 7F
	brk $7E.b		; 00 7E
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $63.b		; 00 63
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $0E.b		; 00 0E
	brk $1E.b		; 00 1E
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $27.b		; 00 27
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $38.b		; 00 38
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $18.b		; 00 18
	brk $78.b		; 00 78
	brk $30.b		; 00 30
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $63.b		; 00 63
	brk $E3.b		; 00 E3
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $0201.w,X		; FE 01 02
	sbc $FD02.w,X		; FD 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	brk $FF.b		; 00 FF
	inc $02FF.w,X		; FE FF 02
	sbc $02FF02.l,X		; FF 02 FF 02
	sbc $02FF02.l,X		; FF 02 FF 02
	sbc $00FF02.l,X		; FF 02 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	lda $40BF40.l,X		; BF 40 BF 40
	lda $40BF40.l,X		; BF 40 BF 40
	lda $00807F.l,X		; BF 7F 80 00
	sbc $400000.l,X		; FF 00 00 40
	jsr ($FC40.w,X)		; FC 40 FC
	rti		; 40

	jsr ($FE40.w,X)		; FC 40 FE
	rti		; 40

	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $000000.l,X		; FF 00 00 00
	ror $7E00.w,X		; 7E 00 7E
	brk $66.b		; 00 66
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $23.b		; 00 23
	brk $23.b		; 00 23
	brk $23.b		; 00 23
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $87.b		; 00 87
	brk $47.b		; 00 47
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $38.b		; 00 38
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $FC.b		; 00 FC
	brk $9C.b		; 00 9C
	brk $3C.b		; 00 3C
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $7C.b		; 00 7C
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E3.b		; 00 E3
	brk $63.b		; 00 63
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	inc $0001.w,X		; FE 01 00
	sbc $020000.l,X		; FF 00 00 02
	sbc $02FF02.l,X		; FF 02 FF 02
	sbc $02FF02.l,X		; FF 02 FF 02
	sbc $00FFFE.l,X		; FF FE FF 00
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $F8.b		; 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $70.b		; 00 70
	bvs -40.b		; 70 D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	bvs 112.b		; 70 70
	bvs 112.b		; 70 70
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	bvs 112.b		; 70 70
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FFF801.l,X		; FF 01 F8 FF
	sbc $FFF8FF.l,X		; FF FF F8 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	cpx #$E0.b		; E0 E0
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	cpx #$E0.b		; E0 E0
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $F802.w,X		; FE 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $70.b		; 00 70
	bvs -104.b		; 70 98
	tya		; 98
	clc		; 18
	clc		; 18
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	rts		; 60

	rts		; 60

	cpy #$C0.b		; C0 C0
	sed		; F8
	sed		; F8
	bvs 112.b		; 70 70
	tya		; 98
	tya		; 98
	clc		; 18
	clc		; 18
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	rts		; 60

	rts		; 60

	cpy #$C0.b		; C0 C0
	sed		; F8
	sed		; F8
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $F802.w,X		; FE 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	bpl  16.b		; 10 10
	jsr $7020.w		; 20 20 70
	bvs  24.b		; 70 18
	clc		; 18
	clc		; 18
	clc		; 18
	tya		; 98
	tya		; 98
	bvs 112.b		; 70 70
	sed		; F8
	sed		; F8
	bpl  16.b		; 10 10
	jsr $7020.w		; 20 20 70
	bvs  24.b		; 70 18
	clc		; 18
	clc		; 18
	clc		; 18
	tya		; 98
	tya		; 98
	bvs 112.b		; 70 70
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $F802.w,X		; FD 02 F8
	sbc $F8FFFD.l,X		; FF FD FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $18.b		; 00 18
	clc		; 18
	sec		; 38
	sec		; 38
	cli		; 58
	cli		; 58
	tya		; 98
	tya		; 98
	jsr ($18FC.w,X)		; FC FC 18
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	sec		; 38
	sec		; 38
	cli		; 58
	cli		; 58
	tya		; 98
	tya		; 98
	jsr ($18FC.w,X)		; FC FC 18
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $F802.w,X		; FE 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	beq -16.b		; F0 F0
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	tya		; 98
	tya		; 98
	bvs 112.b		; 70 70
	sed		; F8
	sed		; F8
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	beq -16.b		; F0 F0
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	tya		; 98
	tya		; 98
	bvs 112.b		; 70 70
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $F802.w,X		; FE 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $30.b		; 00 30
	bmi  96.b		; 30 60
	rts		; 60

	cpy #$C0.b		; C0 C0
	beq -16.b		; F0 F0
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	bvs 112.b		; 70 70
	bmi  48.b		; 30 30
	rts		; 60

	rts		; 60

	cpy #$C0.b		; C0 C0
	beq -16.b		; F0 F0
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	bvs 112.b		; 70 70
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $F802.w,X		; FE 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	sed		; F8
	sed		; F8
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	bmi  48.b		; 30 30
	bmi  48.b		; 30 30
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $F802.w,X		; FE 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $70.b		; 00 70
	bvs -40.b		; 70 D8
	cld		; D8
	cld		; D8
	cld		; D8
	bvs 112.b		; 70 70
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	bvs 112.b		; 70 70
	bvs 112.b		; 70 70
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	bvs 112.b		; 70 70
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	bvs 112.b		; 70 70
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $F802.w,X		; FE 02 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000000.l,X		; FF 00 00 00
	brk $70.b		; 00 70
	bvs -40.b		; 70 D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	sei		; 78
	sei		; 78
	clc		; 18
	clc		; 18
	bmi  48.b		; 30 30
	rts		; 60

	rts		; 60

	bvs 112.b		; 70 70
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	cld		; D8
	sei		; 78
	sei		; 78
	clc		; 18
	clc		; 18
	bmi  48.b		; 30 30
	rts		; 60

	rts		; 60

	asl $80.b		; 06 80
	clc		; 18
	brk $01.b		; 00 01
	bpl   0.b		; 10 00
	eor $000001.l,X		; 5F 01 00 00
	brk $00.b		; 00 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	bpl   0.b		; 10 00
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	jsr $0400.w		; 20 00 04
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	bmi   0.b		; 30 00
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	rti		; 40

	brk $08.b		; 00 08
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	bvc   0.b		; 50 00
	asl A		; 0A
	asl $0000.w		; 0E 00 00
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
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
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sed		; F8
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	jsr ($F8FC.w,X)		; FC FC F8
	sed		; F8
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
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
	brk $FE.b		; 00 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FFFE.w,X		; FE FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FFFE.w,X		; FE FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
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
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
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
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FCFC.w,X		; FE FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	inc $FEFE.w,X		; FE FE FE
	inc $FFFE.w,X		; FE FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFEFE.l,X		; FF FE FE FE
	inc $FEFE.w,X		; FE FE FE
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FFFF.w,X		; FE FF FF
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FFFF.w,X		; FE FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $00		; Opcode 00 overrunning bank boundry at 0EFFFE. Skipping.
	.db $00		; Opcode 00 overrunning bank boundry at 0EFFFF. Skipping.
.ENDS
