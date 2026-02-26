.BANK 5 SLOT 0
.ORG $0000

.SECTION "Bank5" FORCE

	sed		; F8
	brk $00.b		; 00 00
	tsb $80.b		; 04 80
	ora ($00.b,X)		; 01 00
	ora $50.b		; 05 50
	cop $00.b		; 02 00
	phd		; 0B
	bcs   3.b		; B0 03
	brk $86.b		; 00 86
	pla		; 68
	asl $00.b		; 06 00
	sta [$28.b]		; 87 28
	asl A		; 0A
	brk $8A.b		; 00 8A
	bra  15.b		; 80 0F
	brk $8C.b		; 00 8C
	inx		; E8
	trb $00.b		; 14 00
	bcc -16.b		; 90 F0
	tas		; 1B
	brk $04.b		; 00 04
	sei		; 78
	trb $8200.w		; 1C 00 82
	bcc  29.b		; 90 1D
	brk $02.b		; 00 02
	iny		; C8
	ora $0200.w,X		; 1D 00 02
	brk $1E.b		; 00 1E
	brk $02.b		; 00 02
	sec		; 38
	asl $0200.w,X		; 1E 00 02
	bvs  30.b		; 70 1E
	brk $05.b		; 00 05
	cpx #$001E.w		; E0 1E 00
	tsb $48.b		; 04 48
	ora $B00400.l,X		; 1F 00 04 B0
	ora $180400.l,X		; 1F 00 04 18
	jsr $0200.w		; 20 00 02
	bvc  32.b		; 50 20
	brk $02.b		; 00 02
	dey		; 88
	jsr $0200.w		; 20 00 02
	cpy #$0020.w		; C0 20 00
	cop $18.b		; 02 18
	and ($00.b,X)		; 21 00
	cop $70.b		; 02 70
	and ($00.b,X)		; 21 00
	ora $F0.b,S		; 03 F0
	and ($00.b,X)		; 21 00
	tsb $78.b		; 04 78
	jsl $200400.l		; 22 00 04 20
	and $00.b,S		; 23 00
	ora $F0.b		; 05 F0
	and $00.b,S		; 23 00
	asl $E8.b		; 06 E8
	bit $00.b		; 24 00
	cop $40.b		; 02 40
	and $00.b		; 25 00
	tsb $E8.b		; 04 E8
	and $00.b		; 25 00
	cop $40.b		; 02 40
	rol $00.b		; 26 00
	cop $98.b		; 02 98
	rol $00.b		; 26 00
	cop $F0.b		; 02 F0
	rol $00.b		; 26 00
	ora $70.b,S		; 03 70
	and [$00.b]		; 27 00
	tsb $F8.b		; 04 F8
	and [$00.b]		; 27 00
	tsb $A0.b		; 04 A0
	plp		; 28
	brk $05.b		; 00 05
	bvs  41.b		; 70 29
	brk $06.b		; 00 06
	pla		; 68
	rol A		; 2A
	brk $02.b		; 00 02
	cpy #$002A.w		; C0 2A 00
	tsb $68.b		; 04 68
	pld		; 2B
	brk $82.b		; 00 82
	bra  44.b		; 80 2C
	brk $84.b		; 00 84
	tay		; A8
	rol $0700.w		; 2E 00 07
	iny		; C8
	and $788500.l		; 2F 00 85 78
	and ($00.b)		; 32 00
	sta $28.b		; 85 28
	and $00.b,X		; 35 00
	sta $D8.b		; 85 D8
	and [$00.b],Y		; 37 00
	sta $88.b		; 85 88
	dec A		; 3A
	brk $85.b		; 00 85
	sec		; 38
	and $8500.w,X		; 3D 00 85
	inx		; E8
	and $208600.l,X		; 3F 00 86 20
	eor $00.b,S		; 43 00
	sty $4988.w		; 8C 88 49
	brk $94.b		; 00 94
	bmi  84.b		; 30 54
	brk $01.b		; 00 01
	rts		; 60

	mvn $01,$00		; 54 00 01
	bcc  84.b		; 90 54
	brk $01.b		; 00 01
	cpy #$0054.w		; C0 54 00
	ora ($F0.b,X)		; 01 F0
	mvn $01,$00		; 54 00 01
	jsr $0055.w		; 20 55 00
	ora ($50.b,X)		; 01 50
	eor $00.b,X		; 55 00
	ora ($80.b,X)		; 01 80
	eor $00.b,X		; 55 00
	ora ($B0.b,X)		; 01 B0
	eor $00.b,X		; 55 00
	ora ($E0.b,X)		; 01 E0
	eor $00.b,X		; 55 00
	ora ($04.b,X)		; 01 04
	brk $03.b		; 00 03
	brk $F9.b		; 00 F9
	ora $F6.b		; 05 F6
	sbc $F6FFF9.l,X		; FF F9 FF F6
	sbc $000200.l,X		; FF 00 02 00
	brk $01.b		; 00 01
	brk $F6.b		; 00 F6
	sbc $000201.l,X		; FF 01 02 00
	brk $F9.b		; 00 F9
	sbc $02FFFE.l,X		; FF FE FF 02
	cop $00.b		; 02 00
	brk $04.b		; 00 04
	brk $FE.b		; 00 FE
	sbc $000202.l,X		; FF 02 02 00
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	eor $FFBFFF.l,X		; 5F FF BF FF
	cpy #$FFFF.w		; C0 FF FF
	ora $00FFFF.l,X		; 1F FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	ora $BFBF4F.l,X		; 1F 4F BF BF
	cpy #$FF00.w		; C0 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $C8FF00.l,X		; FF 00 FF C8
	php		; 08
	sed		; F8
	cld		; D8
	sed		; F8
	sed		; F8
	sed		; F8
	php		; 08
	sed		; F8
	sed		; F8
	cpy #$F8F8.w		; C0 F8 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	php		; 08
	bne -104.b		; D0 98
	sed		; F8
	inx		; E8
	php		; 08
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	sed		; F8
	brk $F8.b		; 00 F8
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	sbc [$08.b],Y		; F7 08
	pea $F7FF.w		; F4 FF F7
	sbc $00FFF8.l,X		; FF F8 FF 00
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $01FFF8.l,X		; FF F8 FF 01
	cop $00.b		; 02 00
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	sbc $000202.l,X		; FF 02 02 00
	brk $F8.b		; 00 F8
	sbc $03FFF0.l,X		; FF F0 FF 03
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $000204.l,X		; FF 04 02 00
	brk $FF.b		; 00 FF
	rti		; 40

	ora [$F0.b]		; 07 F0
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	cpx #$E000.w		; E0 00 E0
	brk $D8.b		; 00 D8
	brk $FF.b		; 00 FF
	tsb $00FF.w		; 0C FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	sbc $03F800.l,X		; FF 00 F8 03
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	asl $00.b		; 06 00
	sbc $00FF0C.l,X		; FF 0C FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	cpy #$0080.w		; C0 80 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	cpy #$8040.w		; C0 40 80
	cpy #$C000.w		; C0 00 C0
	brk $80.b		; 00 80
	rti		; 40

	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0F3F00.l		; 0F 00 3F 0F
	adc $40FF3F.l,X		; 7F 3F FF 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3F3F0F.l		; 0F 0F 3F 3F
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	ora ($FD.b,X)		; 01 FD
	sbc ($FF.b),Y		; F1 FF
	sbc $02FF.w,X		; FD FF 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	beq -15.b		; F0 F1
	jsr ($02FD.w,X)		; FC FD 02
	ora ($0B.b,X)		; 01 0B
	brk $08.b		; 00 08
	brk $F3.b		; 00 F3
	phd		; 0B
	cpx $F3FF.w		; EC FF F3
	sbc $00FFF8.l,X		; FF F8 FF 00
	cop $00.b		; 02 00
	brk $FB.b		; 00 FB
	sbc $01FFF8.l,X		; FF F8 FF 01
	cop $00.b		; 02 00
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	sbc $004200.l,X		; FF 00 42 00
	brk $FC.b		; 00 FC
	sbc $01FFF8.l,X		; FF F8 FF 01
	cop $00.b		; 02 00
	brk $F3.b		; 00 F3
	sbc $02FFF0.l,X		; FF F0 FF 02
	cop $00.b		; 02 00
	brk $FB.b		; 00 FB
	sbc $03FFF0.l,X		; FF F0 FF 03
	cop $00.b		; 02 00
	brk $04.b		; 00 04
	brk $F0.b		; 00 F0
	sbc $000204.l,X		; FF 04 02 00
	brk $FC.b		; 00 FC
	sbc $03FFF0.l,X		; FF F0 FF 03
	.db $42, $00		; 42 00
	brk $F7.b		; 00 F7
	sbc $05FFE8.l,X		; FF E8 FF 05
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $06FFE8.l,X		; FF E8 FF 06
	cop $00.b		; 02 00
	brk $07.b		; 00 07
	brk $E8.b		; 00 E8
	sbc $000207.l,X		; FF 07 02 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $F000F3.l,X		; 7F F3 00 F0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc ($00.b,S),Y		; F3 00
	beq   0.b		; F0 00
	beq  -1.b		; F0 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $1F.b		; 00 1F
	ora [$1F.b]		; 07 1F
	adc $7D1FFF.l		; 6F FF 1F 7D
	txs		; 9A
	sbc $60FF30.l,X		; FF 30 FF 60
	sbc $FC0080.l,X		; FF 80 00 FC
	ora [$07.b]		; 07 07
	ora $1F1F6F.l		; 0F 6F 1F 1F
	sei		; 78
	brk $F0.b		; 00 F0
	brk $EA.b		; 00 EA
	brk $80.b		; 00 80
	adc $FF03FF.l,X		; 7F FF 03 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FC80FF.l,X		; FF FF 80 FC
	cpx $F8.b		; E4 F8
	plx		; FA
	sbc $59BEF8.l,X		; FF F8 BE 59
	sbc $06FF0C.l,X		; FF 0C FF 06
	sbc $3F0001.l,X		; FF 01 00 3F
	cpx #$FCE4.w		; E0 E4 FC
	inc $F8FC.w,X		; FE FC F8
	inc A		; 1A
	tsb $0D.b		; 04 0D
	cop $57.b		; 02 57
	brk $01.b		; 00 01
	inc $C0FF.w,X		; FE FF C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1FFF00.l,X		; 3F 00 FF 1F
	brk $00.b		; 00 00
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
	inc $FF00.w,X		; FE 00 FF
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	jsr $2020.w		; 20 20 20
	jsr $A020.w		; 20 20 A0
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	asl $80.b		; 06 80
	trb $00.b		; 14 00
	sbc $FFE510.l		; EF 10 E5 FF
	sbc $FFE5FF.l		; EF FF E5 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	sbc $FFE5FF.l,X		; FF FF E5 FF
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	ora $FFE500.l		; 0F 00 E5 FF
	tsb $02.b		; 04 02
	brk $00.b		; 00 00
	sbc $FFF5FF.l		; EF FF F5 FF
	asl $02.b		; 06 02
	brk $00.b		; 00 00
	sbc $FFF5FF.l,X		; FF FF F5 FF
	php		; 08
	cop $00.b		; 02 00
	brk $01.b		; 00 01
	brk $F5.b		; 00 F5
	sbc $004206.l,X		; FF 06 42 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	ora ($0F.b,X)		; 01 0F
	adc $00.b,S		; 63 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	adc [$00.b]		; 67 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $040404.l,X		; FF 04 04 04
	tsb $04.b		; 04 04
	tsb $84.b		; 04 84
	tsb $E4.b		; 04 E4
	tsb $F4.b		; 04 F4
	tsb $FC.b		; 04 FC
	cpx $FC.b		; E4 FC
	sbc ($00.b),Y		; F1 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	cpx $E0.b		; E4 E0
	pea $F9F0.w		; F4 F0 F9
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
	bra 127.b		; 80 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $81.b		; 00 81
	sbc $3F4000.l,X		; FF 00 40 3F
	jmp ($FF00.w,X)		; 7C 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF7E.l,X		; FF 7E FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	jmp ($003F.w,X)		; 7C 3F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $F0FF00.l,X		; FF 00 FF F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $03FF00.l,X		; FF 00 FF 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	sbc $FF0000.l,X		; FF 00 00 FF
	cmp $C0FF00.l		; CF 00 FF C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FF.b		; 00 FF
	brk $CF.b		; 00 CF
	sbc $00FF07.l,X		; FF 07 FF 00
	rol $3F0D.w,X		; 3E 0D 3F
	bit $107F.w,X		; 3C 7F 10
	adc $407F50.l,X		; 7F 50 7F 40
	bra 127.b		; 80 7F
	ora $0F1007.l		; 0F 07 10 0F
	bit $3C10.w		; 2C 10 3C
	brk $5C.b		; 00 5C
	jsr $205B.w		; 20 5B 20
	rti		; 40

	and $FF00FF.l,X		; 3F FF 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	ora $00FFFF.l		; 0F FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $FFF0FF.l,X		; FF FF F0 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr ($FFFF.w,X)		; FC FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	sbc $F0FF03.l,X		; FF 03 FF F0
	sbc $EC1F00.l,X		; FF 00 1F EC
	sbc $02FF0F.l,X		; FF 0F FF 02
	sbc $00FF02.l,X		; FF 02 FF 00
	brk $3F.b		; 00 3F
	pea $02F8.w		; F4 F8 02
	jsr ($020D.w,X)		; FC 0D 02
	ora $014E00.l		; 0F 00 4E 01
	ror $01.b,X		; 76 01
	brk $FF.b		; 00 FF
	sbc $00C0C0.l,X		; FF C0 C0 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($7C00.w,X)		; 7C 00 7C
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000F00.l		; 0F 00 0F 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$80.b]		; 07 80
	trb $EB00.w		; 1C 00 EB
	ora $DF.b,X		; 15 DF
	sbc $F0FFEB.l,X		; FF EB FF F0
	sbc $000200.l,X		; FF 00 02 00
	brk $FB.b		; 00 FB
	sbc $02FFF0.l,X		; FF F0 FF 02
	cop $00.b		; 02 00
	brk $0B.b		; 00 0B
	brk $F0.b		; 00 F0
	sbc $000204.l,X		; FF 04 02 00
	brk $EC.b		; 00 EC
	sbc $06FFE0.l,X		; FF E0 FF 06
	cop $00.b		; 02 00
	brk $FC.b		; 00 FC
	sbc $08FFE0.l,X		; FF E0 FF 08
	cop $00.b		; 02 00
	brk $0C.b		; 00 0C
	brk $E0.b		; 00 E0
	sbc $00020A.l,X		; FF 0A 02 00
	brk $10.b		; 00 10
	brk $D0.b		; 00 D0
	sbc $00020C.l,X		; FF 0C 02 00
	brk $7F.b		; 00 7F
	rti		; 40

	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1F4000.l,X		; FF 00 40 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $D81F00.l,X		; FF 00 1F D8
	ora $FFFFD9.l,X		; 1F D9 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc [$3E.b]		; E7 3E
	sbc [$3E.b]		; E7 3E
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $FFFFF3.l,X		; FF F3 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	jsr ($FC0F.w,X)		; FC 0F FC
	ora $0000FF.l		; 0F FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	adc $FF7F00.l,X		; 7F 00 7F FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF80FF.l,X		; FF FF 80 FF
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpy #$E000.w		; C0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$18.b]		; 07 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $7FFF01.l,X		; FF 01 FF 7F
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($7F.b,X)		; 01 7F
	adc $FFFFFF.l,X		; 7F FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	cpy #$FFFF.w		; C0 FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$FFFF.w		; C0 FF FF
	sbc $08FFFF.l,X		; FF FF FF 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	dey		; 88
	php		; 08
	iny		; C8
	php		; 08
	inx		; E8
	php		; 08
	beq -122.b		; F0 86
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $88.b		; 00 88
	dey		; 88
	dec $0000.w		; CE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $3F4000.l,X		; FF 00 40 3F
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $FF7F00.l,X		; 7F 00 7F FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	brk $C0.b		; 00 C0
	sbc $FF0000.l,X		; FF 00 00 FF
	sta $001F00.l,X		; 9F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $FF3F00.l,X		; 1F 00 3F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $60.b		; 00 60
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	cpx #$C000.w		; E0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	adc [$09.b],Y		; 77 09
	sta $008F03.l		; 8F 03 8F 00
	ror $7F0F.w,X		; 7E 0F 7F
	trb $38FF.w		; 1C FF 38
	sbc $70FF30.l,X		; FF 30 FF 70
	ora ($0B.b,X)		; 01 0B
	adc ($77.b,S),Y		; 73 77
	bvs 119.b		; 70 77
	asl $5C00.w		; 0E 00 5C
	jsr $8078.w		; 20 78 80
	tyx		; BB
	rti		; 40

	ror $FF80.w,X		; 7E 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	bne  -1.b		; D0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00002F.l,X		; FF 2F 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	phd		; 0B
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	pea $0000.w		; F4 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $F3.b		; 00 F3
	cpy $FC.b		; C4 FC
	cpx #$00FC.w		; E0 FC 00
	adc $18FF90.l,X		; 7F 90 FF 18
	sbc $0CFF28.l,X		; FF 28 FF 0C
	sbc $ECC80D.l,X		; FF 0D C8 EC
	sbc $FB.b,S		; E3 FB
	ora $FB.b,S		; 03 FB
	trb $08.b		; 14 08
	inc A		; 1A
	ora $28.b		; 05 28
	ora [$AD.b]		; 07 AD
	cop $5D.b		; 02 5D
	cop $80.b		; 02 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
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
	brk $0A.b		; 00 0A
	bra  40.b		; 80 28
	brk $E8.b		; 00 E8
	inc A		; 1A
	cmp $E8FF.w,Y		; D9 FF E8
	sbc $00FFDF.l,X		; FF DF FF 00
	cop $00.b		; 02 00
	brk $E8.b		; 00 E8
	sbc $02FFEF.l,X		; FF EF FF 02
	cop $00.b		; 02 00
	brk $E8.b		; 00 E8
	sbc $04FFFF.l,X		; FF FF FF 04
	cop $00.b		; 02 00
	brk $F8.b		; 00 F8
	sbc $06FFDE.l,X		; FF DE FF 06
	cop $00.b		; 02 00
	brk $F8.b		; 00 F8
	sbc $08FFEE.l,X		; FF EE FF 08
	cop $00.b		; 02 00
	brk $08.b		; 00 08
	brk $D9.b		; 00 D9
	sbc $00020A.l,X		; FF 0A 02 00
	brk $08.b		; 00 08
	brk $E9.b		; 00 E9
	sbc $00020C.l,X		; FF 0C 02 00
	brk $08.b		; 00 08
	brk $F9.b		; 00 F9
	sbc $00020E.l,X		; FF 0E 02 00
	brk $18.b		; 00 18
	brk $E5.b		; 00 E5
	sbc $000220.l,X		; FF 20 02 00
	brk $18.b		; 00 18
	brk $F5.b		; 00 F5
	sbc $000222.l,X		; FF 22 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	trb $01.b		; 14 01
	rol A		; 2A
	ora ($36.b,X)		; 01 36
	ora [$F8.b]		; 07 F8
	ora [$80.b]		; 07 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	trb $3E14.w		; 1C 14 3E
	php		; 08
	rol $0100.w,X		; 3E 00 01
	sei		; 78
	adc $001F.w,Y		; 79 1F 00
	adc $0FFF00.l,X		; 7F 00 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $0000FE.l,X		; FF FE 00 00
	brk $0F.b		; 00 0F
	ora $7F1F3F.l		; 0F 3F 1F 7F
	and $FF7F7F.l,X		; 3F 7F 7F FF
	adc $FFFEFF.l,X		; 7F FF FE FF
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	phd		; 0B
	plx		; FA
	ora $F4.b		; 05 F4
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $0FF500.l,X		; FF 00 F5 0F
	xce		; FB
	ora $0000FF.l		; 0F FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00003E.l,X		; FF 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $0000.w,X		; 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF80FF.l,X		; FF FF 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $0808.w,X		; FE 08 08
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
	dey		; 88
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $17F400.l,X		; FF 00 F4 17
	inx		; E8
	phb		; 8B
	pea $0097.w		; F4 97 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $EB.b		; 00 EB
	jmp ($7CF7.w,X)		; 7C F7 7C
	xba		; EB
	jmp ($3CFF.w,X)		; 7C FF 3C
	sbc $0DFF1A.l,X		; FF 1A FF 0D
	sbc $3DFE0D.l,X		; FF 0D FE 3D
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and $041B00.l,X		; 3F 00 1B 04
	eor $FD02.w,X		; 5D 02 FD
	cop $3C.b		; 02 3C
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $E000FE.l,X		; FF FE 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FE00.l,X		; FF 00 FE 00
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $003F00.l,X		; 7F 00 3F 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	ora $021FF0.l		; 0F F0 1F 02
	ora $161F0B.l,X		; 1F 0B 1F 16
	and $2C7F0C.l,X		; 3F 0C 7F 2C
	adc $7F802F.l,X		; 7F 2F 80 7F
	tsb $03.b		; 04 03
	ora ($04.b)		; 12 04
	tas		; 1B
	tsb $16.b		; 04 16
	php		; 08
	rol $6F10.w		; 2E 10 6F
	bpl 111.b		; 10 6F
	bpl  -1.b		; 10 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	sta $FF00FF.l,X		; 9F FF 00 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $05.b		; 00 05
	pea $FF00.w		; F4 00 FF
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	tay		; A8
	brk $58.b		; 00 58
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	ora $FFC000.l		; 0F 00 C0 FF
	brk $00.b		; 00 00
	sbc $7F007F.l,X		; FF 7F 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	and $0000FF.l,X		; 3F FF 00 00
	sbc $01003F.l,X		; FF 3F 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $003F00.l,X		; FF 00 3F 00
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF007F.l,X		; FF 7F 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	jsr ($FEFF.w,X)		; FC FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	and $2E0140.l,X		; 3F 40 01 2E
	jsr ($FEFF.w,X)		; FC FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	sbc $D03F80.l,X		; FF 80 3F D0
	brk $C8.b		; 00 C8
	php		; 08
	cpx #$E00A.w		; E0 0A E0
	ora $E0.b,X		; 15 E0
	txy		; 9B
	sed		; F8
	sta [$F8.b]		; 87 F8
	cpy $FC.b		; C4 FC
	ora $FE.b,S		; 03 FE
	clc		; 18
	brk $08.b		; 00 08
	tsb $8E.b		; 04 8E
	asl A		; 0A
	sta $80DF84.l,X		; 9F 84 DF 80
	cpx #$E3C3.w		; E0 C3 E3
	brk $F0.b		; 00 F0
	inc A		; 1A
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
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
	cpx #$2000.w		; E0 00 20
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	cpy #$00C0.w		; C0 C0 00
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
	cpy #$00C0.w		; C0 C0 00
	brk $C0.b		; 00 C0
	cpy #$0000.w		; C0 00 00
	cpy #$0080.w		; C0 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	bra   0.b		; 80 00
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra -64.b		; 80 C0
	cpy #$00C0.w		; C0 C0 00
	cpy #$C000.w		; C0 00 C0
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
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
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $FFD3.w,X		; 1D D3 FF
	sbc $FF.b,S		; E3 FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	cmp ($FF.b,S),Y		; D3 FF
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cmp ($FF.b,S),Y		; D3 FF
	tsb $02.b		; 04 02
	brk $00.b		; 00 00
	ora ($00.b,S),Y		; 13 00
	cmp ($FF.b,S),Y		; D3 FF
	asl $02.b		; 06 02
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	sbc $FF.b,S		; E3 FF
	php		; 08
	cop $00.b		; 02 00
	brk $F3.b		; 00 F3
	sbc $0AFFE3.l,X		; FF E3 FF 0A
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $E3.b		; 00 E3
	sbc $00020C.l,X		; FF 0C 02 00
	brk $13.b		; 00 13
	brk $E3.b		; 00 E3
	sbc $00020E.l,X		; FF 0E 02 00
	brk $E3.b		; 00 E3
	sbc $20FFF3.l,X		; FF F3 FF 20
	cop $00.b		; 02 00
	brk $F3.b		; 00 F3
	sbc $22FFF3.l,X		; FF F3 FF 22
	cop $00.b		; 02 00
	brk $0D.b		; 00 0D
	brk $F3.b		; 00 F3
	sbc $004220.l,X		; FF 20 42 00
	brk $FD.b		; 00 FD
	sbc $22FFF3.l,X		; FF F3 FF 22
	.db $42, $00		; 42 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
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
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
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
	brk $00.b		; 00 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	sed		; F8
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
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
	brk $07.b		; 00 07
	rti		; 40

	ora [$39.b]		; 07 39
	ora $0B1F01.l		; 0F 01 1F 0B
	and $163F1A.l,X		; 3F 1A 3F 16
	adc $377F36.l,X		; 7F 36 7F 37
	dec A		; 3A
	and $0005.w,Y		; 39 05 00
	ora #$1B02.w		; 09 02 1B
	tsb $3A.b		; 04 3A
	tsb $37.b		; 04 37
	php		; 08
	adc [$08.b],Y		; 77 08
	adc [$08.b],Y		; 77 08
	sbc $AEF000.l,X		; FF 00 F0 AE
	sed		; F8
	eor [$FF.b]		; 47 FF
	rti		; 40

	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	brk $FF.b		; 00 FF
	lda ($00.b,X)		; A1 00
	rti		; 40

	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $6A.b		; 00 6A
	brk $B6.b		; 00 B6
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	bmi   0.b		; 30 00
	bpl   0.b		; 10 00
	ldy #$00FF.w		; A0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $00EFC0.l		; 2F C0 EF 00
	eor $000000.l,X		; 5F 00 00 00
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
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	bra   1.b		; 80 01
	asl $BC03.w,X		; 1E 03 BC
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7F8000.l,X		; FF 00 80 7F
	cpx #$4000.w		; E0 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1A.b		; 00 1A
	brk $15.b		; 00 15
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	sbc $FE.b,S		; E3 FE
	bmi  -1.b		; 30 FF
	dec A		; 3A
	sbc $1DFF5B.l,X		; FF 5B FF 1D
	sbc $7DFF1D.l,X		; FF 1D FF 7D
	phd		; 0B
	sbc $E4.b,S		; E3 E4
	bpl  50.b		; 10 32
	php		; 08
	tsa		; 3B
	tsb $5B.b		; 04 5B
	tsb $BD.b		; 04 BD
	cop $FD.b		; 02 FD
	cop $7D.b		; 02 7D
	cop $00.b		; 02 00
	rti		; 40

	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$C080.w		; C0 80 C0
	bra -64.b		; 80 C0
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $3614.w		; 1C 14 36
	asl A		; 0A
	pld		; 2B
	brk $7D.b		; 00 7D
	ora $80.b,S		; 03 80
	ora $80.b,S		; 03 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	php		; 08
	rol A		; 2A
	trb $35.b		; 14 35
	cop $03.b		; 02 03
	adc $7C7C.w,X		; 7D 7C 7C
	jmp ($0807.w,X)		; 7C 07 08
	ora $073F03.l,X		; 1F 03 3F 07
	and $9F7F4F.l,X		; 3F 4F 7F 9F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $03007F.l,X		; FF 7F 00 03
	ora $0F.b,S		; 03 0F
	ora [$1F.b]		; 07 1F
	ora $7F1F3F.l		; 0F 3F 1F 7F
	and $FF3F7F.l,X		; 3F 7F 3F FF
	adc $07FFFF.l,X		; 7F FF FF 07
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF07C0.l,X		; FF C0 07 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FFFF.w		; C0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFF800.l,X		; FF 00 F8 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	jsr ($FF02.w,X)		; FC 02 FF
	sed		; F8
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	brk $F8.b		; 00 F8
	sed		; F8
	inc $FFFC.w,X		; FE FC FF
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $10FF7F.l,X		; FF 7F FF 10
	bpl  16.b		; 10 10
	bpl -112.b		; 10 90
	asl $1B8A.w,X		; 1E 8A 1B
	sty $75.b,X		; 94 75
	iny		; C8
	and $F890E8.l		; 2F E8 90 F8
	bra   0.b		; 80 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	asl $9504.w,X		; 1E 04 95
	asl A		; 0A
	plb		; AB
	bpl -16.b		; 10 F0
	lda [$D7.b]		; A7 D7
	sta [$C7.b],Y		; 97 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$307F.w		; C0 7F 30
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bvs  15.b		; 70 0F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FE0200.l,X		; FF 00 02 FE
	ora ($FD.b,X)		; 01 FD
	cop $FE.b		; 02 FE
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FE03.w,X		; FD 03 FE
	ora $FD.b,S		; 03 FD
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sta $FF0F7F.l		; 8F 7F 0F FF
	bra  -1.b		; 80 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFF07F.l,X		; FF 7F F0 FF
	beq 127.b		; F0 7F
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $00FF03.l,X		; FF 03 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $2FA000.l,X		; FF 00 A0 2F
	bne  95.b		; D0 5F
	ldy #$FF2F.w		; A0 2F FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $AFF0DF.l,X		; FF DF F0 AF
	beq -33.b		; F0 DF
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0001FF.l,X		; FF FF 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $00FF.w,X		; FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$4080.w		; C0 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra -64.b		; 80 C0
	cpy #$00C0.w		; C0 C0 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	sbc $C00000.l,X		; FF 00 00 C0
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	adc $007F00.l,X		; 7F 00 7F 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	sbc $1F0000.l,X		; FF 00 00 1F
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00.b,S		; E3 00
	cpx #$0000.w		; E0 00 00
	sbc $E0FF00.l,X		; FF 00 FF E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00.b,S		; E3 00
	cpx #$FF00.w		; E0 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $003F00.l,X		; FF 00 3F 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl -128.b		; 10 80
	bit $00.b,X		; 34 00
	cmp $FFCC22.l,X		; DF 22 CC FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	cpy $00FF.w		; CC FF 00
	cop $00.b		; 02 00
	brk $F2.b		; 00 F2
	sbc $02FFCC.l,X		; FF CC FF 02
	cop $00.b		; 02 00
	brk $10.b		; 00 10
	brk $CC.b		; 00 CC
	sbc $000204.l,X		; FF 04 02 00
	brk $00.b		; 00 00
	brk $CC.b		; 00 CC
	sbc $004202.l,X		; FF 02 42 00
	brk $DF.b		; 00 DF
	sbc $06FFDC.l,X		; FF DC FF 06
	cop $00.b		; 02 00
	brk $EF.b		; 00 EF
	sbc $08FFDC.l,X		; FF DC FF 08
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $0AFFDC.l,X		; FF DC FF 0A
	cop $00.b		; 02 00
	brk $0F.b		; 00 0F
	brk $DC.b		; 00 DC
	sbc $00020C.l,X		; FF 0C 02 00
	brk $1F.b		; 00 1F
	brk $DC.b		; 00 DC
	sbc $00020E.l,X		; FF 0E 02 00
	brk $DF.b		; 00 DF
	sbc $20FFEC.l,X		; FF EC FF 20
	cop $00.b		; 02 00
	brk $EF.b		; 00 EF
	sbc $22FFEC.l,X		; FF EC FF 22
	cop $00.b		; 02 00
	brk $FF.b		; 00 FF
	sbc $24FFEC.l,X		; FF EC FF 24
	cop $00.b		; 02 00
	brk $13.b		; 00 13
	brk $EC.b		; 00 EC
	sbc $004220.l,X		; FF 20 42 00
	brk $03.b		; 00 03
	brk $EC.b		; 00 EC
	sbc $000226.l,X		; FF 26 02 00
	brk $E1.b		; 00 E1
	sbc $28FFFC.l,X		; FF FC FF 28
	cop $00.b		; 02 00
	brk $11.b		; 00 11
	brk $FC.b		; 00 FC
	sbc $004228.l,X		; FF 28 42 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	cop $3E.b		; 02 3E
	ora ($C0.b,X)		; 01 C0
	ora ($80.b,X)		; 01 80
	ora $60.b,S		; 03 60
	ora $1C.b,S		; 03 1C
	ora [$00.b]		; 07 00
	ora $050F02.l		; 0F 02 0F 05
	ora ($01.b,X)		; 01 01
	rol $7E3E.w,X		; 3E 3E 7E
	ror $1C1D.w,X		; 7E 1D 1C
	cop $00.b		; 02 00
	tsb $01.b		; 04 01
	asl $0D01.w		; 0E 01 0D
	cop $3F.b		; 02 3F
	eor $FF8F7F.l		; 4F 7F 8F FF
	ora $FC00FF.l,X		; 1F FF 00 FC
	rtl		; 6B

	inc $FFD1.w,X		; FE D1 FF
	cpx #$FF.b		; E0 FF
	bne -113.b		; D0 8F
	cmp $9FBF4F.l,X		; DF 4F BF 9F
	and $687F00.l,X		; 3F 00 7F 68
	bra -48.b		; 80 D0
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	jsr ($0002.w,X)		; FC 02 00
	rep #$00		; C2 00
	pea $00FF.w		; F4 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFF8FF.l,X		; FF FF F8 FF
	ora ($FC.b,X)		; 01 FC
	and $0B00.w,X		; 3D 00 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora ($03.b,X)		; 01 03
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	sbc $FB03F8.l,X		; FF F8 03 FB
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0300FF.l,X		; FF FF 00 03
	and $F807.w,X		; 3D 07 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	cmp ($00.b,X)		; C1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $27.b		; C4 27
	inx		; E8
	bpl 120.b		; 10 78
	bra  -4.b		; 80 FC
	brk $FC.b		; 00 FC
	adc $FE.b,S		; 63 FE
	bcs  -1.b		; B0 FF
	stz $FF.b,X		; 74 FF
	tsx		; BA
	clc		; 18
	clv		; B8
	and [$D7.b]		; 27 D7
	ora [$C7.b],Y		; 17 C7
	phd		; 0B
	sbc $64.b,S		; E3 64
	bpl -78.b		; 10 B2
	php		; 08
	adc [$08.b],Y		; 77 08
	tyx		; BB
	tsb $00.b		; 04 00
	cpy #$00.b		; C0 00
	bmi   0.b		; 30 00
	bpl   0.b		; 10 00
	rts		; 60

	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
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
	brk $38.b		; 00 38
	brk $44.b		; 00 44
	bpl -110.b		; 10 92
	sec		; 38
	tyx		; BB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	sec		; 38
	jmp ($EE6C.w,X)		; 7C 6C EE
	mvp $00,$D6		; 44 D6 00
	brk $07.b		; 00 07
	php		; 08
	ora $073F10.l		; 0F 10 3F 07
	adc $9F7F0F.l,X		; 7F 0F 7F 9F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$1F.b]		; 07 1F
	ora $7F1F3F.l		; 0F 3F 1F 7F
	and $FF3F7F.l,X		; 3F 7F 3F FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	cpx #$10.b		; E0 10
	beq   8.b		; F0 08
	jsr ($FEE0.w,X)		; FC E0 FE
	beq  -2.b		; F0 FE
	sbc $FCFF.w,Y		; F9 FF FC
	sbc $0000FC.l,X		; FF FC 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$F8.b		; E0 F8
	beq  -4.b		; F0 FC
	sed		; F8
	inc $FEFC.w,X		; FE FC FE
	jsr ($20FF.w,X)		; FC FF 20
	jsr $2020.w		; 20 20 20
	jsr $2020.w		; 20 20 20
	jsr $3C20.w		; 20 20 3C
	brk $22.b		; 00 22
	php		; 08
	eor #$1C.b		; 49 1C
	cmp $2000.w,X		; DD 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $3C.b		; 00 3C
	trb $363E.w		; 1C 3E 36
	adc [$22.b],Y		; 77 22
	rtl		; 6B

	ora $0B1F0D.l,X		; 1F 0D 1F 0B
	and $1B371B.l,X		; 3F 1B 37 1B
	and $3F4010.l,X		; 3F 10 40 3F
	rti		; 40

	and $1D3F40.l,X		; 3F 40 3F 1D
	cop $1B.b		; 02 1B
	tsb $3B.b		; 04 3B
	tsb $33.b		; 04 33
	tsb $30.b		; 04 30
	ora [$7F.b]		; 07 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	ldy #$FF.b		; A0 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	cpx #$FF.b		; E0 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $DA00A0.l,X		; FF A0 00 DA
	brk $ED.b		; 00 ED
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $2F.b		; 00 2F
	tay		; A8
	eor [$D1.b],Y		; 57 D1
	and $0000A8.l		; 2F A8 00 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $AF7ED7.l,X		; FF D7 7E AF
	ror $7FD7.w,X		; 7E D7 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	sbc $F0FE.w,Y		; F9 FE F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $07FE07.l,X		; FF 07 FE 07
	sbc $00FF0F.l,X		; FF 0F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ldy #$BF.b		; A0 BF
	rti		; 40

	eor $00BFA0.l,X		; 5F A0 BF 00
	brk $35.b		; 00 35
	brk $2B.b		; 00 2B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $BFE05F.l,X		; FF 5F E0 BF
	cpx #$5F.b		; E0 5F
	cpx #$FF.b		; E0 FF
	tad		; 5B
	sbc $1DFF1D.l,X		; FF 1D FF 1D
	inc $FF7D.w,X		; FE 7D FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $BD045B.l,X		; FF 5B 04 BD
	cop $7D.b		; 02 7D
	cop $7C.b		; 02 7C
	cop $00.b		; 02 00
	inc $00FF.w,X		; FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	cpy #$80.b		; C0 80
	jsr $20C0.w		; 20 C0 20
	cpy #$20.b		; C0 20
	cpy #$80.b		; C0 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	and $7F7F7F.l,X		; 3F 7F 7F 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $7F00FF.l,X		; FF FF 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $57FF00.l,X		; FF 00 FF 57
	bne  -1.b		; D0 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $AF00FF.l,X		; FF FF 00 AF
	adc $0000FF.l,X		; 7F FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora ($FF.b,X)		; 01 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FE00FF.l,X		; FF FF 00 FE
	ora $0000FF.l		; 0F FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F4FF00.l,X		; FF 00 FF F4
	ora $FF.b,X		; 15 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $EB00FF.l,X		; FF FF 00 EB
	inc $00FF.w,X		; FE FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $A05F80.l,X		; 7F 80 5F A0
	eor $205FA0.l,X		; 5F A0 5F 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $7F.b		; 00 7F
	adc $7F0000.l,X		; 7F 00 00 7F
	bmi  15.b		; 30 0F
	and $003F00.l,X		; 3F 00 3F 00
	ora $FF1F20.l,X		; 1F 20 1F FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00F800.l,X		; FF 00 F8 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	cmp $010210.l		; CF 10 02 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	cop $01.b		; 02 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $609F00.l,X		; FF 00 9F 60
	brk $00.b		; 00 00
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
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $04F800.l,X		; FF 00 F8 04
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
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
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc ($08.b,S),Y		; F3 08
	bra  64.b		; 80 40
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
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
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	sbc $F505.w,Y		; F9 05 F5
	sbc $F5FFF9.l,X		; FF F9 FF F5
	sbc $000200.l,X		; FF 00 02 00
	brk $01.b		; 00 01
	brk $F5.b		; 00 F5
	sbc $000201.l,X		; FF 01 02 00
	brk $F9.b		; 00 F9
	sbc $02FFFD.l,X		; FF FD FF 02
	cop $00.b		; 02 00
	brk $FE.b		; 00 FE
	sbc $02FFFD.l,X		; FF FD FF 02
	.db $42, $00		; 42 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $F020A0.l,X		; 1F A0 20 F0
	cmp $F090E0.l,X		; DF E0 90 F0
	pha		; 48
	sbc [$00.b]		; E7 00
	sbc $004000.l,X		; FF 00 40 00
	eor $80E000.l,X		; 5F 00 E0 80
	bne   0.b		; D0 00
	sta $702700.l		; 8F 00 27 70
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	cli		; 58
	bcc 120.b		; 90 78
	inx		; E8
	sec		; 38
	pha		; 48
	sei		; 78
	bcc  56.b		; 90 38
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $D8.b		; 00 D8
	dey		; 88
	pla		; 68
	brk $88.b		; 00 88
	brk $20.b		; 00 20
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	sed		; F8
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $80.b		; 02 80
	php		; 08
	brk $F7.b		; 00 F7
	ora #$F2.b		; 09 F2
	sbc $F2FFF7.l,X		; FF F7 FF F2
	sbc $000200.l,X		; FF 00 02 00
	brk $07.b		; 00 07
	brk $F2.b		; 00 F2
	sbc $000202.l,X		; FF 02 02 00
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	eor $005040.l		; 4F 40 50 00
	rol $7859.w,X		; 3E 59 78
	adc [$F8.b],Y		; 77 F8
	sbc [$BC.b]		; E7 BC
	lda ($00.b,S),Y		; B3 00
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rts		; 60

	rts		; 60

	clc		; 18
	brk $70.b		; 00 70
	brk $E0.b		; 00 E0
	brk $CC.b		; 00 CC
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	inc $0100.w,X		; FE 00 01
	brk $0F.b		; 00 0F
	sbc ($03.b,S),Y		; F3 03
	sbc $FC03.w,X		; FD 03 FC
	sbc [$19.b]		; E7 19
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	asl $07.b		; 06 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	ldy #$A0.b		; A0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	rts		; 60

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
	brk $79.b		; 00 79
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	sbc $E0FF00.l,X		; FF 00 FF E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00E000.l,X		; FF 00 E0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx #$E0.b		; E0 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
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
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	inc $F5FF.w,X		; FE FF F5
	sbc $FBFF.w,Y		; F9 FF FB
	sbc $000000.l,X		; FF 00 00 00
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	inc $F2FF.w,X		; FE FF F2
	sbc [$FF.b],Y		; F7 FF
	sbc $00FF.w,Y		; F9 FF 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $F9.b		; 00 F9
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	inc $ECFF.w,X		; FE FF EC
	sbc ($FF.b,S),Y		; F3 FF
	sbc [$FF.b],Y		; F7 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	sbc [$FF.b],Y		; F7 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $F0.b		; 00 F0
	ora $F0E6FE.l		; 0F FE E6 F0
	sbc $00FFF4.l,X		; FF F4 FF 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $F4.b		; 00 F4
	sbc $000000.l,X		; FF 00 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	cop $00.b		; 02 00
	cpx $FE14.w		; EC 14 FE
	cpx #$EC.b		; E0 EC
	sbc $00FFF1.l,X		; FF F1 FF 00
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $01FFF1.l,X		; FF F1 FF 01
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $F1.b		; 00 F1
	sbc $004001.l,X		; FF 01 40 00
	brk $0C.b		; 00 0C
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $14.b		; 00 14
	brk $F1.b		; 00 F1
	sbc $000001.l,X		; FF 01 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $E8.b		; 00 E8
	ora [$FD.b],Y		; 17 FD
	stp		; DB
	inx		; E8
	sbc $00FFEE.l,X		; FF EE FF 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $01FFEE.l,X		; FF EE FF 01
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $EE.b		; 00 EE
	sbc $000000.l,X		; FF 00 00 00
	brk $15.b		; 00 15
	brk $EE.b		; 00 EE
	sbc $000001.l,X		; FF 01 00 00
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
	brk $E0.b		; 00 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $E4.b		; 00 E4
	tas		; 1B
	sbc $E4D5.w,X		; FD D5 E4
	sbc $00FFEC.l,X		; FF EC FF 00
	brk $00.b		; 00 00
	brk $EC.b		; 00 EC
	sbc $01FFEC.l,X		; FF EC FF 01
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $EC.b		; 00 EC
	sbc $000000.l,X		; FF 00 00 00
	brk $17.b		; 00 17
	brk $EC.b		; 00 EC
	sbc $000001.l,X		; FF 01 00 00
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
	brk $F8.b		; 00 F8
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
	tsb $00.b		; 04 00
	cop $00.b		; 02 00
	sbc ($20.b,X)		; E1 20
	jsr ($E1CF.w,X)		; FC CF E1
	sbc $00FFE9.l,X		; FF E9 FF 00
	brk $00.b		; 00 00
	brk $E9.b		; 00 E9
	sbc $01FFE9.l,X		; FF E9 FF 01
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	brk $E9.b		; 00 E9
	sbc $000000.l,X		; FF 00 00 00
	brk $1A.b		; 00 1A
	brk $E9.b		; 00 E9
	sbc $000001.l,X		; FF 01 00 00
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
	brk $FE.b		; 00 FE
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora $FE.b,S		; 03 FE
	sbc $FFF9F5.l,X		; FF F5 F9 FF
	xce		; FB
	sbc $000000.l,X		; FF 00 00 00
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	inc $F5FF.w,X		; FE FF F5
	sbc $FBFF.w,Y		; F9 FF FB
	sbc $000000.l,X		; FF 00 00 00
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $FB.b		; 00 FB
	ora $FF.b,S		; 03 FF
	sbc $FB.b,X		; F5 FB
	sbc $00FFF5.l,X		; FF F5 FF 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $00FFF5.l,X		; FF F5 FF 00
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
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FA.b		; 00 FA
	ora $FE.b		; 05 FE
	sbc ($FA.b,S),Y		; F3 FA
	sbc $00FFF2.l,X		; FF F2 FF 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $F2.b		; 00 F2
	sbc $000001.l,X		; FF 01 00 00
	brk $E0.b		; 00 E0
	ora $000040.l,X		; 1F 40 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	ora $000040.l		; 0F 40 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  32.b		; 80 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	ora [$FD.b]		; 07 FD
	inc $FFF8.w		; EE F8 FF
	cpx $00FF.w		; EC FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EC.b		; 00 EC
	sbc $000001.l,X		; FF 01 00 00
	brk $F0.b		; 00 F0
	ora $006000.l		; 0F 00 60 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $07.b		; 06 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $06.b		; 00 06
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $0000E0.l,X		; 7F E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sbc $0A.b,X		; F5 0A
	jsr ($F5E8.w,X)		; FC E8 F5
	sbc $00FFE5.l,X		; FF E5 FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFE5.l,X		; FF E5 FF 01
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $E5.b		; 00 E5
	sbc $000002.l,X		; FF 02 00 00
	brk $7C.b		; 00 7C
	sta $7C.b,S		; 83 7C
	sta $00.b,S		; 83 00
	clc		; 18
	jsr $0010.w		; 20 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $20.b		; 00 20
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
	brk $86.b		; 00 86
	inc $FE86.w,X		; FE 86 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $60.b		; 00 60
	bpl  32.b		; 10 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $F2.b		; 00 F2
	ora $E3FB.w		; 0D FB E3
	sbc ($FF.b)		; F2 FF
	cmp $0000FF.l,X		; DF FF 00 00
	brk $00.b		; 00 00
	plx		; FA
	sbc $01FFDF.l,X		; FF DF FF 01
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $DF.b		; 00 DF
	sbc $000002.l,X		; FF 02 00 00
	brk $FE.b		; 00 FE
	sbc $01FFDF.l,X		; FF DF FF 01
	rti		; 40

	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	adc $FF0080.l,X		; 7F 80 00 FF
	brk $0C.b		; 00 0C
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 121.b		; 70 79
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $30.b		; 00 30
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F0.b		; 00 F0
	ora $F0DEFA.l		; 0F FA DE F0
	sbc $00FFD9.l,X		; FF D9 FF 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $01FFD9.l,X		; FF D9 FF 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D9.b		; 00 D9
	sbc $000002.l,X		; FF 02 00 00
	brk $08.b		; 00 08
	brk $D9.b		; 00 D9
	sbc $000003.l,X		; FF 03 00 00
	brk $00.b		; 00 00
	adc $7F807F.l,X		; 7F 7F 80 7F
	bra   0.b		; 80 00
	adc $000C00.l,X		; 7F 00 0C 00
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
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $3C3E.w,X		; 3C 3E 3C
	rol $0000.w,X		; 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $3D7C.w,X		; 3D 7C 3D
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	brk $30.b		; 00 30
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $EE.b		; 00 EE
	ora ($F9.b)		; 12 F9
	cmp $FFEE.w,Y		; D9 EE FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	cmp ($FF.b,S),Y		; D3 FF
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	inc $D3FF.w,X		; FE FF D3
	sbc $000002.l,X		; FF 02 00 00
	brk $06.b		; 00 06
	brk $D3.b		; 00 D3
	sbc $000003.l,X		; FF 03 00 00
	brk $0E.b		; 00 0E
	brk $D3.b		; 00 D3
	sbc $000004.l,X		; FF 04 00 00
	brk $00.b		; 00 00
	adc $7F807F.l,X		; 7F 7F 80 7F
	bra   0.b		; 80 00
	adc $000600.l,X		; 7F 00 06 00
	tsb $1800.w		; 0C 00 18
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
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	ora [$D7.b]		; 07 D7
	ora [$D7.b]		; 07 D7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $80BF80.l,X		; BF 80 BF 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	cpx $F715.w		; EC 15 F7
	pei ($EC.b)		; D4 EC
	sbc $00FFCD.l,X		; FF CD FF 00
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $01FFCD.l,X		; FF CD FF 01
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFCC.l,X		; FF CC FF 02
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $CD.b		; 00 CD
	sbc $000003.l,X		; FF 03 00 00
	brk $0C.b		; 00 0C
	brk $CD.b		; 00 CD
	sbc $000004.l,X		; FF 04 00 00
	brk $14.b		; 00 14
	brk $CD.b		; 00 CD
	sbc $000005.l,X		; FF 05 00 00
	brk $00.b		; 00 00
	adc $7F807F.l,X		; 7F 7F 80 7F
	bra   0.b		; 80 00
	adc $000300.l,X		; 7F 00 03 00
	asl $00.b		; 06 00
	tsb $0C00.w		; 0C 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$EA.b		; C0 EA
	cpy #$EA.b		; C0 EA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	xce		; FB
	sed		; F8
	xce		; FB
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $30.b		; 00 30
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
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
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	xce		; FB
	ora $FC.b,S		; 03 FC
	sed		; F8
	xce		; FB
	sbc $00FFF5.l,X		; FF F5 FF 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F5.b		; 00 F5
	sbc $000001.l,X		; FF 01 00 00
	brk $03.b		; 00 03
	trb $1C03.w		; 1C 03 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	pea $F414.w		; F4 14 F4
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $60.b		; 00 60
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
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $FA.b		; 00 FA
	asl $FC.b		; 06 FC
	sbc $FA.b,X		; F5 FA
	sbc $00FFF2.l,X		; FF F2 FF 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $F2.b		; 00 F2
	sbc $000001.l,X		; FF 01 00 00
	brk $FC.b		; 00 FC
	sbc $02FFFA.l,X		; FF FA FF 02
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $FA.b		; 00 FA
	sbc $000003.l,X		; FF 03 00 00
	brk $04.b		; 00 04
	phb		; 8B
	tsb $8B.b		; 04 8B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7909.w,Y		; 79 09 79
	ora #$00.b		; 09 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $70.b		; 00 70
	dey		; 88
	bvs -120.b		; 70 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

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
	brk $FB.b		; 00 FB
	ora $FE.b,S		; 03 FE
	inc $FB.b,X		; F6 FB
	sbc $00FFF5.l,X		; FF F5 FF 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F5.b		; 00 F5
	sbc $000001.l,X		; FF 01 00 00
	brk $63.b		; 00 63
	sbc $00FF63.l,X		; FF 63 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
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
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FA.b		; 00 FA
	ora $FE.b		; 05 FE
	sbc ($FA.b,S),Y		; F3 FA
	sbc $00FFF2.l,X		; FF F2 FF 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $F2.b		; 00 F2
	sbc $000001.l,X		; FF 01 00 00
	brk $E0.b		; 00 E0
	sbc $00FFE0.l,X		; FF E0 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	ora $000F09.l		; 0F 09 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	beq 112.b		; F0 70
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	ora [$FD.b]		; 07 FD
	inc $FFF8.w		; EE F8 FF
	cpx $00FF.w		; EC FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EC.b		; 00 EC
	sbc $000001.l,X		; FF 01 00 00
	brk $F0.b		; 00 F0
	sbc $00FFF0.l,X		; FF F0 FF 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $07.b		; 06 07
	asl $07.b		; 06 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF0FFF.l		; 0F FF 0F FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	sbc $00EF60.l		; EF 60 EF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $F5.b		; 00 F5
	asl A		; 0A
	jsr ($F5E8.w,X)		; FC E8 F5
	sbc $00FFE5.l,X		; FF E5 FF 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $01FFE5.l,X		; FF E5 FF 01
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $E5.b		; 00 E5
	sbc $000002.l,X		; FF 02 00 00
	brk $7C.b		; 00 7C
	sbc $00FF7C.l,X		; FF 7C FF 00
	clc		; 18
	jsr $0010.w		; 20 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $20.b		; 00 20
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
	brk $86.b		; 00 86
	inc $FE86.w,X		; FE 86 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	jsr ($FCF8.w,X)		; FC F8 FC
	brk $60.b		; 00 60
	bpl  32.b		; 10 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	sbc ($0D.b)		; F2 0D
	xce		; FB
	sbc $F2.b,S		; E3 F2
	sbc $00FFDF.l,X		; FF DF FF 00
	brk $00.b		; 00 00
	brk $FA.b		; 00 FA
	sbc $01FFDF.l,X		; FF DF FF 01
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $DF.b		; 00 DF
	sbc $000002.l,X		; FF 02 00 00
	brk $FE.b		; 00 FE
	sbc $01FFDF.l,X		; FF DF FF 01
	rti		; 40

	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	brk $0C.b		; 00 0C
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 121.b		; 70 79
	bvs 121.b		; 70 79
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	inc $FEFF.w,X		; FE FF FE
	sbc $003000.l,X		; FF 00 30 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	beq  15.b		; F0 0F
	plx		; FA
	dec $FFF0.w,X		; DE F0 FF
	cmp $00FF.w,Y		; D9 FF 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $01FFD9.l,X		; FF D9 FF 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D9.b		; 00 D9
	sbc $000002.l,X		; FF 02 00 00
	brk $08.b		; 00 08
	brk $D9.b		; 00 D9
	sbc $000003.l,X		; FF 03 00 00
	brk $00.b		; 00 00
	adc $7FFF7F.l,X		; 7F 7F FF 7F
	sbc $007F00.l,X		; FF 00 7F 00
	tsb $1800.w		; 0C 00 18
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $3C3E.w,X		; 3C 3E 3C
	rol $0000.w,X		; 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $3C7D.w,X		; 3C 7D 3C
	adc $0000.w,X		; 7D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $FEFF.w,X		; FE FF FE
	sbc $00FE00.l,X		; FF 00 FE 00
	bmi   0.b		; 30 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	inc $F912.w		; EE 12 F9
	cmp $FFEE.w,Y		; D9 EE FF
	cmp ($FF.b,S),Y		; D3 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	cmp ($FF.b,S),Y		; D3 FF
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	inc $D3FF.w,X		; FE FF D3
	sbc $000002.l,X		; FF 02 00 00
	brk $06.b		; 00 06
	brk $D3.b		; 00 D3
	sbc $000003.l,X		; FF 03 00 00
	brk $0E.b		; 00 0E
	brk $D3.b		; 00 D3
	sbc $000004.l,X		; FF 04 00 00
	brk $00.b		; 00 00
	adc $7FFF7F.l,X		; 7F 7F FF 7F
	sbc $007F00.l,X		; FF 00 7F 00
	asl $00.b		; 06 00
	tsb $1800.w		; 0C 00 18
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
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	ora [$D7.b]		; 07 D7
	ora [$D7.b]		; 07 D7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -65.b		; 80 BF
	bra -65.b		; 80 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq  -8.b		; F0 F8
	beq  -8.b		; F0 F8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	cpx $F715.w		; EC 15 F7
	pei ($EC.b)		; D4 EC
	sbc $00FFCD.l,X		; FF CD FF 00
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc $01FFCD.l,X		; FF CD FF 01
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	sbc $02FFCC.l,X		; FF CC FF 02
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $CD.b		; 00 CD
	sbc $000003.l,X		; FF 03 00 00
	brk $0C.b		; 00 0C
	brk $CD.b		; 00 CD
	sbc $000004.l,X		; FF 04 00 00
	brk $14.b		; 00 14
	brk $CD.b		; 00 CD
	sbc $000005.l,X		; FF 05 00 00
	brk $00.b		; 00 00
	adc $7FFF7F.l,X		; 7F 7F FF 7F
	sbc $007F00.l,X		; FF 00 7F 00
	ora $00.b,S		; 03 00
	asl $08.b		; 06 08
	tsb $08.b		; 04 08
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $FF00.w		; 0C 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$EA.b		; C0 EA
	cpy #$EA.b		; C0 EA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	xce		; FB
	sed		; F8
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $30.b		; 00 30
	brk $18.b		; 00 18
	tsb $08.b		; 04 08
	tsb $08.b		; 04 08
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
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
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	xce		; FB
	ora $FC.b,S		; 03 FC
	sed		; F8
	xce		; FB
	sbc $00FFF5.l,X		; FF F5 FF 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F5.b		; 00 F5
	sbc $000001.l,X		; FF 01 00 00
	brk $E3.b		; 00 E3
	jsr ($FCE3.w,X)		; FC E3 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $60.b,S		; 63 60
	adc $60.b,S		; 63 60
	trb $F7.b		; 14 F7
	trb $F7.b		; 14 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	brk $63.b		; 00 63
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	plx		; FA
	asl $FC.b		; 06 FC
	sbc $FA.b,X		; F5 FA
	sbc $00FFF2.l,X		; FF F2 FF 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $F2.b		; 00 F2
	sbc $000001.l,X		; FF 01 00 00
	brk $FC.b		; 00 FC
	sbc $02FFFA.l,X		; FF FA FF 02
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $FA.b		; 00 FA
	sbc $000003.l,X		; FF 03 00 00
	brk $74.b		; 00 74
	sbc $00FF74.l,X		; FF 74 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	adc $7909.w,Y		; 79 09 79
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs  -8.b		; 70 F8
	bvs  -8.b		; 70 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($C1.b,X)		; C1 C1
	cmp ($C1.b,X)		; C1 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cop $80.b		; 02 80
	php		; 08
	brk $D6.b		; 00 D6
	cpx $D5.b		; E4 D5
	sbc ($D6.b,S),Y		; F3 D6
	sbc $00FFD5.l,X		; FF D5 FF 00
	asl A		; 0A
	brk $00.b		; 00 00
	dec $FF.b,X		; D6 FF
	sbc $FF.b		; E5 FF
	cop $0A.b		; 02 0A
	brk $00.b		; 00 00
	and $002000.l,X		; 3F 00 20 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	php		; 08
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $FB.b		; 00 FB
	brk $F8.b		; 00 F8
	ora $7A.b,S		; 03 7A
	ora [$78.b]		; 07 78
	brk $78.b		; 00 78
	ora ($78.b,X)		; 01 78
	brk $7B.b		; 00 7B
	brk $7B.b		; 00 7B
	brk $87.b		; 00 87
	brk $87.b		; 00 87
	brk $40.b		; 00 40
	sta [$40.b]		; 87 40
	ora [$45.b]		; 07 45
	cop $47.b		; 02 47
	brk $47.b		; 00 47
	brk $47.b		; 00 47
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	rti		; 40

	ldy #$C0.b		; A0 C0
	bra -64.b		; 80 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $3F.b		; 00 3F
	brk $72.b		; 00 72
	tsb $FB.b		; 04 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	tsb $008F.w		; 0C 8F 00
	sta [$00.b]		; 87 00
	sta [$00.b]		; 87 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	inc $A000.w,X		; FE 00 A0
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $3B.b		; 00 3B
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $0E.b		; 00 0E
	brk $1F.b		; 00 1F
	brk $08.b		; 00 08
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	rti		; 40

	and $00.b,S		; 23 00
	and $00.b,S		; 23 00
	ora ($20.b),Y		; 11 20
	bpl   0.b		; 10 00
	ora $040300.l		; 0F 00 03 04
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $CC.b		; 00 CC
	cpx $D5.b		; E4 D5
	sbc ($CC.b,S),Y		; F3 CC
	sbc $00FFD5.l,X		; FF D5 FF 00
	asl A		; 0A
	brk $00.b		; 00 00
	jmp.w [$D5FF]		; DC FF D5
	sbc $000A02.l,X		; FF 02 0A 00
	brk $CC.b		; 00 CC
	sbc $04FFE5.l,X		; FF E5 FF 04
	asl A		; 0A
	brk $00.b		; 00 00
	jmp.w [$E5FF]		; DC FF E5
	sbc $000A06.l,X		; FF 06 0A 00
	brk $12.b		; 00 12
	ora #$20.b		; 09 20
	brk $00.b		; 00 00
	jsr $0020.w		; 20 20 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $09.b		; 00 09
	tsb $00.b		; 04 00
	brk $20.b		; 00 20
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
	brk $F0.b		; 00 F0
	brk $08.b		; 00 08
	bpl  24.b		; 10 18
	brk $04.b		; 00 04
	php		; 08
	tsb $0200.w		; 0C 00 02
	tsb $06.b		; 04 06
	brk $01.b		; 00 01
	cop $00.b		; 02 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	bpl   8.b		; 10 08
	brk $00.b		; 00 00
	php		; 08
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
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
	sbc $103F10.l,X		; FF 10 3F 10
	adc [$00.b],Y		; 77 00
	adc $087F08.l,X		; 7F 08 7F 08
	tda		; 7B
	brk $1F.b		; 00 1F
	tsb $1F.b		; 04 1F
	bit $8F.b		; 24 8F
	brk $4F.b		; 00 4F
	bra  79.b		; 80 4F
	brk $47.b		; 00 47
	brk $47.b		; 00 47
	brk $47.b		; 00 47
	brk $23.b		; 00 23
	rti		; 40

	and $00.b,S		; 23 00
	adc [$00.b],Y		; 77 00
	cmp [$60.b],Y		; D7 60
	sbc $9A7FE7.l,X		; FF E7 7F 9A
	adc $000040.l,X		; 7F 40 00 00
	adc [$00.b],Y		; 77 00
	adc [$00.b],Y		; 77 00
	sbc $807F00.l,X		; FF 00 7F 80
	sta [$78.b]		; 87 78
	sta $00FF60.l,X		; 9F 60 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007000.l,X		; FF 00 70 00
	bvs   0.b		; 70 00
	sed		; F8
	sed		; F8
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	jsr ($F800.w,X)		; FC 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
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
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $3F.b		; 00 3F
	brk $72.b		; 00 72
	php		; 08
	sbc $00EF00.l,X		; FF 00 EF 00
	sbc $000000.l		; EF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$08.b],Y		; 17 08
	sta $009F00.l,X		; 9F 00 9F 00
	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00EE00.l,X		; FF 00 EE 00
	adc [$00.b],Y		; 77 00
	adc [$00.b],Y		; 77 00
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $00.b,S		; 03 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	sbc $00EE00.l,X		; FF 00 EE 00
	ror $00.b,X		; 76 00
	stz $00.b,X		; 74 00
	stz $00.b,X		; 74 00
	brk $02.b		; 00 02
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	sbc $00FE00.l,X		; FF 00 FE 00
	inc $FC00.w,X		; FE 00 FC
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
	brk $1D.b		; 00 1D
	jsr $020F.w		; 20 0F 02
	asl $0700.w,X		; 1E 00 07
	brk $0B.b		; 00 0B
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $23.b		; 00 23
	brk $11.b		; 00 11
	jsr $0011.w		; 20 11 00
	php		; 08
	bpl  12.b		; 10 0C
	brk $03.b		; 00 03
	tsb $01.b		; 04 01
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	brk $77.b		; 00 77
	brk $77.b		; 00 77
	brk $D7.b		; 00 D7
	cpy #$FF.b		; C0 FF
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	brk $70.b		; 00 70
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $D6.b		; 00 D6
	sbc $DF.b,S		; E3 DF
	sbc $DFFFD7.l,X		; FF D7 FF DF
	sbc $000800.l,X		; FF 00 08 00
	brk $DF.b		; 00 DF
	sbc $01FFDF.l,X		; FF DF FF 01
	php		; 08
	brk $00.b		; 00 00
	cmp $E7FF.w,X		; DD FF E7
	sbc $000802.l,X		; FF 02 08 00
	brk $DA.b		; 00 DA
	sbc $03FFEF.l,X		; FF EF FF 03
	php		; 08
	brk $00.b		; 00 00
	dec $FF.b,X		; D6 FF
	sbc [$FF.b],Y		; F7 FF
	tsb $08.b		; 04 08
	brk $00.b		; 00 00
	dec $F7FF.w,X		; DE FF F7
	sbc $000805.l,X		; FF 05 08 00
	brk $D6.b		; 00 D6
	sbc $06FFFF.l,X		; FF FF FF 06
	php		; 08
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	jsr ($1E00.w,X)		; FC 00 1E
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	clc		; 18
	inc $1FFE.w,X		; FE FE 1F
	ora $000303.l,X		; 1F 03 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	beq -16.b		; F0 F0
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
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	jsr $0038.w		; 20 38 00
	sec		; 38
	rti		; 40

	sei		; 78
	brk $78.b		; 00 78
	bra  -8.b		; 80 F8
	tsb $F8.b		; 04 F8
	tsb $00F0.w		; 0C F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	ora $211E01.l,X		; 1F 01 1E 21
	rol $3C03.w,X		; 3E 03 3C
	ora $3C.b,S		; 03 3C
	jsr $7C3C.w		; 20 3C 7C
	brk $7E.b		; 00 7E
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	bit $0000.w,X		; 3C 00 00
	brk $80.b		; 00 80
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	stz $0060.w,X		; 9E 60 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	cpy $CADE.w		; CC DE CA
	sbc $CAFFCC.l,X		; FF CC FF CA
	sbc $000800.l,X		; FF 00 08 00
	brk $CC.b		; 00 CC
	sbc $02FFDA.l,X		; FF DA FF 02
	php		; 08
	brk $00.b		; 00 00
	cpy $EAFF.w		; CC FF EA
	sbc $000804.l,X		; FF 04 08 00
	brk $CC.b		; 00 CC
	sbc $06FFFA.l,X		; FF FA FF 06
	php		; 08
	brk $00.b		; 00 00
	jmp.w [$D5FF]		; DC FF D5
	sbc $000808.l,X		; FF 08 08 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($0F.b,X)		; 01 0F
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cop $01.b		; 02 01
	ora ($E0.b,X)		; 01 E0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq  -2.b		; F0 FE
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	php		; 08
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$30.b		; C0 30
	cpy #$30.b		; C0 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	adc $707F10.l,X		; 7F 10 7F 70
	lda $30BF30.l,X		; BF 30 BF 30
	lda $70F730.l,X		; BF 30 F7 70
	tay		; A8
	sec		; 38
	sbc $00EF24.l,X		; FF 24 EF 00
	sta $E0CFE0.l		; 8F E0 CF E0
	cmp $E0CFE0.l		; CF E0 CF E0
	sta $F0D7E0.l		; 8F E0 D7 F0
	cpy #$E0.b		; C0 E0
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FD01.l,X		; FF 01 FD 01
	cop $03.b		; 02 03
	sbc $00FE44.l,X		; FF 44 FE 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FD.b		; 00 FD
	ora ($00.b,X)		; 01 00
	brk $12.b		; 00 12
	ora $021F12.l,X		; 1F 12 1F 02
	ora $020F02.l		; 0F 02 0F 02
	ora $000F02.l		; 0F 02 0F 00
	ora $000D00.l		; 0F 00 0D 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $49.b		; 00 49
	lda $48BF49.l,X		; BF 49 BF 48
	ldx $BE48.w,Y		; BE 48 BE
	pha		; 48
	ldx $BE48.w,Y		; BE 48 BE
	pha		; 48
	ldx $BE48.w,Y		; BE 48 BE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $09.b		; 04 09
	ora [$00.b]		; 07 00
	asl $0B.b		; 06 0B
	asl $0001.w		; 0E 01 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora #$00.b		; 09 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	ldx $50.b,Y		; B6 50
	ldx $74.b,Y		; B6 74
	.db $82, $FC, $00		; 82 FC 00
	cpy $DE32.w		; CC 32 DE
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	jsl $002000.l		; 22 00 20 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpy #$A0.b		; C0 A0
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $20.b		; 00 20
	cpx #$60.b		; E0 60
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
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $3C.b		; 00 3C
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $30.b		; 00 30
	bmi   0.b		; 30 00
	brk $F2.b		; 00 F2
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	beq  -8.b		; F0 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	bit $70.b,X		; 34 70
	and $200F50.l		; 2F 50 0F 20
	and $083F20.l,X		; 3F 20 3F 08
	ora $021F06.l,X		; 1F 06 1F 02
	ora $40E0C0.l,X		; 1F C0 E0 40
	rts		; 60

	rts		; 60

	rts		; 60

	rti		; 40

	rts		; 60

	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FE0144.l,X		; FF 44 01 FE
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tsb $FF.b		; 04 FF
	cli		; 58
	lda $000000.l,X		; BF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0D00.w		; 0D 00 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	pha		; 48
	ldx $BE58.w,Y		; BE 58 BE
	bvc -74.b		; 50 B6
	bvc -74.b		; 50 B6
	bvc -74.b		; 50 B6
	bvc -74.b		; 50 B6
	bvc -74.b		; 50 B6
	bvc -74.b		; 50 B6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -96.b		; 80 A0
	bra -32.b		; 80 E0
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	cpx #$60.b		; E0 60
	cpx #$20.b		; E0 20
	cpx #$40.b		; E0 40
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
	brk $05.b		; 00 05
	bra  20.b		; 80 14
	brk $C7.b		; 00 C7
	cld		; D8
	cmp #$FF.b		; C9 FF
	cmp $FFF0FF.l		; CF FF F0 FF
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	dec $E0FF.w		; CE FF E0
	sbc $000802.l,X		; FF 02 08 00
	brk $C7.b		; 00 C7
	sbc $04FFD0.l,X		; FF D0 FF 04
	php		; 08
	brk $00.b		; 00 00
	cmp [$FF.b],Y		; D7 FF
	bne  -1.b		; D0 FF
	asl $08.b		; 06 08
	brk $00.b		; 00 00
	cmp $C0FF.w		; CD FF C0
	sbc $000808.l,X		; FF 08 08 00
	brk $E2.b		; 00 E2
	rol $3F61.w,X		; 3E 61 3F
	rti		; 40

	asl $1F31.w,X		; 1E 31 1F
	bmi  31.b		; 30 1F
	bpl  31.b		; 10 1F
	brk $0F.b		; 00 0F
	clc		; 18
	ora $000000.l		; 0F 00 00 00
	brk $21.b		; 00 21
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
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	cmp ($FF.b,X)		; C1 FF
	cmp ($03.b,X)		; C1 03
	adc $7D01.w,X		; 7D 01 7D
	cop $78.b		; 02 78
	ora $79.b,S		; 03 79
	ora ($7D.b,X)		; 01 7D
	ora ($3D.b,X)		; 01 3D
	rep #$43		; C2 43
	rep #$43		; C2 43
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	ora [$07.b]		; 07 07
	asl $07.b		; 06 07
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	rti		; 40

	cpy #$00.b		; C0 00
	bra  64.b		; 80 40
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $64.b		; 00 64
	brk $08.b		; 00 08
	php		; 08
	ora ($12.b)		; 12 12
	ora [$03.b]		; 07 03
	ora $1D01.w		; 0D 01 1D
	ora ($34.b,X)		; 01 34
	brk $2E.b		; 00 2E
	brk $B8.b		; 00 B8
	clv		; B8
	stz $78.b,X		; 74 78
	jmp ($3870.w)		; 6C 70 38
	brk $7A.b		; 00 7A
	brk $7A.b		; 00 7A
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $100F08.l		; 0F 08 0F 10
	ora [$3C.b]		; 07 3C
	ora [$00.b]		; 07 00
	ora $0F.b,S		; 03 0F
	brk $3F.b		; 00 3F
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra -64.b		; 80 C0
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
	and $003F00.l,X		; 3F 00 3F 00
	and $613F60.l,X		; 3F 60 3F 61
	and $413E60.l,X		; 3F 60 3E 41
	ora $001F71.l,X		; 1F 71 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	bra -128.b		; 80 80
	bra   0.b		; 80 00
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
	brk $80.b		; 00 80
	bra -32.b		; 80 E0
	brk $3C.b		; 00 3C
	tsb $1E.b		; 04 1E
	bpl   6.b		; 10 06
	tsb $03.b		; 04 03
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	mvp $30,$20		; 44 20 30
	ora ($05.b,X)		; 01 05
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ror $6E00.w		; 6E 00 6E
	brk $7B.b		; 00 7B
	cop $7B.b		; 02 7B
	cop $7B.b		; 02 7B
	cop $7B.b		; 02 7B
	ora $7B.b,S		; 03 7B
	ora $07.b,S		; 03 07
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	asl $0EFD.w		; 0E FD 0E
	sbc $FC0E.w,X		; FD 0E FC
	ora $FC0FFC.l		; 0F FC 0F FC
	ora [$80.b]		; 07 80
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	ora $FF1F00.l,X		; 1F 00 1F FF
	brk $0F.b		; 00 0F
	brk $1B.b		; 00 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($0C.b,S),Y		; 13 0C
	ora ($00.b,S),Y		; 13 00
	brk $10.b		; 00 10
	bpl   4.b		; 10 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
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
	brk $05.b		; 00 05
	bra  20.b		; 80 14
	brk $C3.b		; 00 C3
	dec $CC.b,X		; D6 CC
	ora ($C7.b,X)		; 01 C7
	sbc $00FFCC.l,X		; FF CC FF 00
	php		; 08
	brk $00.b		; 00 00
	cmp [$FF.b]		; C7 FF
	jmp.w [$02FF]		; DC FF 02
	php		; 08
	brk $00.b		; 00 00
	cmp [$FF.b]		; C7 FF
	cpx $04FF.w		; EC FF 04
	php		; 08
	brk $00.b		; 00 00
	cmp [$FF.b]		; C7 FF
	jsr ($06FF.w,X)		; FC FF 06
	php		; 08
	brk $00.b		; 00 00
	lda [$FF.b],Y		; B7 FF
	cld		; D8
	sbc $000808.l,X		; FF 08 08 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$3F.b]		; 07 3F
	brk $07.b		; 00 07
	brk $0E.b		; 00 0E
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	tsb $03.b		; 04 03
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	php		; 08
	ora #$09.b		; 09 09
	ora [$07.b]		; 07 07
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	sed		; F8
	brk $E0.b		; 00 E0
	jsr $20E0.w		; 20 E0 20
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	ply		; 7A
	eor ($FB.b,X)		; 41 FB
	cpy #$FB.b		; C0 FB
	cpy #$E7.b		; C0 E7
	cpx #$FF.b		; E0 FF
	brk $FE.b		; 00 FE
	ora ($E0.b,X)		; 01 E0
	brk $77.b		; 00 77
	ora $3F00BF.l		; 0F BF 00 3F
	bra  63.b		; 80 3F
	bra -33.b		; 80 DF
	rti		; 40

	ora [$00.b]		; 07 00
	sta $001F80.l		; 8F 80 1F 00
	ora $0A.b,S		; 03 0A
	and $0F74.w		; 2D 74 0F
	adc [$5E.b],Y		; 77 5E
	asl $66.b		; 06 66
	asl $7E.b		; 06 7E
	asl $77.b		; 06 77
	ora [$0E.b]		; 07 0E
	asl A		; 0A
	cmp $00FBE2.l,X		; DF E2 FB 00
	tay		; A8
	eor ($F9.b,S),Y		; 53 F9
	ora $F9.b,S		; 03 F9
	ora $F9.b,S		; 03 F9
	ora $F8.b,S		; 03 F8
	ora $F1.b,S		; 03 F1
	ora $81.b,S		; 03 81
	lda $10.b,S		; A3 10
	ror $10.b,X		; 76 10
	rol $10.b,X		; 36 10
	rol $10.b,X		; 36 10
	rol $10.b,X		; 36 10
	rol $10.b,X		; 36 10
	rol $10.b,X		; 36 10
	rol $18.b,X		; 36 18
	rol $0008.w,X		; 3E 08 00
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	jmp.w [$D840]		; DC 40 D8
	rti		; 40

	cld		; D8
	rti		; 40

	cld		; D8
	rti		; 40

	cld		; D8
	rti		; 40

	cld		; D8
	rts		; 60

	sed		; F8
	rts		; 60

	sed		; F8
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	and [$10.b],Y		; 37 10
	and [$10.b],Y		; 37 10
	and [$1F.b],Y		; 37 1F
	brk $1F.b		; 00 1F
	bmi  62.b		; 30 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cld		; D8
	beq   0.b		; F0 00
	bvs -120.b		; 70 88
	sei		; 78
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dey		; 88
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $01.b,S		; 03 01
	cop $00.b		; 02 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	cop $03.b		; 02 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	tsb $04.b		; 04 04
	asl A		; 0A
	cop $74.b		; 02 74
	brk $FA.b		; 00 FA
	ora ($FF.b,X)		; 01 FF
	brk $BF.b		; 00 BF
	brk $43.b		; 00 43
	rti		; 40

	asl $07.b		; 06 07
	phd		; 0B
	ora [$1D.b]		; 07 1D
	ora $9F.b,S		; 03 9F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	rti		; 40

	ldy #$80.b		; A0 80
	jmp $3F00.w		; 4C 00 3F
	brk $7F.b		; 00 7F
	brk $7B.b		; 00 7B
	brk $05.b		; 00 05
	stz $40.b,X		; 74 40
	cpy #$A0.b		; C0 A0
	cpy #$70.b		; C0 70
	bra -14.b		; 80 F2
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AB.b		; 00 AB
	bvc 115.b		; 50 73
	phd		; 0B
	mvp $40,$2E		; 44 2E 40
	rol $5F00.w		; 2E 00 5F
	brk $7E.b		; 00 7E
	bpl 119.b		; 10 77
	bpl 119.b		; 10 77
	bpl 118.b		; 10 76
	ora [$0A.b]		; 07 0A
	ora ($00.b),Y		; 11 00
	ora ($00.b),Y		; 11 00
	jsr $0100.w		; 20 00 01
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $9F.b		; 00 9F
	ldx #$47.b		; A2 47
	nop		; EA
	ora $E8.b		; 05 E8
	ora $F4.b,S		; 03 F4
	cop $FC.b		; 02 FC
	eor $DD.b,S		; 43 DD
	brk $FC.b		; 00 FC
	rti		; 40

	jmp.w [$A3C1]		; DC C1 A3
	ora ($03.b),Y		; 11 03
	ora ($03.b,S),Y		; 13 03
	phd		; 0B
	ora $03.b,S		; 03 03
	ora $22.b,S		; 03 22
	ora $02.b,S		; 03 02
	cop $20.b		; 02 20
	brk $18.b		; 00 18
	and $103710.l,X		; 3F 10 37 10
	and [$10.b],Y		; 37 10
	and [$10.b],Y		; 37 10
	and [$10.b],Y		; 37 10
	and [$10.b],Y		; 37 10
	and [$10.b],Y		; 37 10
	and [$00.b],Y		; 37 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $40.b		; 00 40
	cld		; D8
	rti		; 40

	cld		; D8
	rti		; 40

	cld		; D8
	rti		; 40

	cld		; D8
	rti		; 40

	cld		; D8
	rti		; 40

	cld		; D8
	rti		; 40

	cld		; D8
	rti		; 40

	cld		; D8
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	php		; 08
	tsb $04.b		; 04 04
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $030C.w		; 0C 0C 03
	ora [$01.b]		; 07 01
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	bra  20.b		; 80 14
	brk $C6.b		; 00 C6
	cmp $01CD.w,Y		; D9 CD 01
	dec $FF.b		; C6 FF
	cmp $00FF.w		; CD FF 00
	php		; 08
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	cmp $02FF.w,X		; DD FF 02
	php		; 08
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	sbc $04FF.w		; ED FF 04
	php		; 08
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	sbc $06FF.w,X		; FD FF 06
	php		; 08
	brk $00.b		; 00 00
	dec $FF.b,X		; D6 FF
	cld		; D8
	sbc $000808.l,X		; FF 08 08 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($0F.b,X)		; 01 0F
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $02.b		; 00 02
	cop $02.b		; 02 02
	cop $01.b		; 02 01
	ora ($E0.b,X)		; 01 E0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq  -2.b		; F0 FE
	brk $F8.b		; 00 F8
	php		; 08
	clv		; B8
	php		; 08
	bvs  48.b		; 70 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$30.b		; C0 30
	cpy #$30.b		; C0 30
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	rti		; 40

	pha		; 48
	cpy #$F0.b		; C0 F0
	lsr $FE10.w,X		; 5E 10 FE
	bmi  -2.b		; 30 FE
	bmi -16.b		; 30 F0
	bpl -33.b		; 10 DF
	bpl -10.b		; 10 F6
	bit $FF.b,X		; 34 FF
	and $EF807D.l,X		; 3F 7D 80 EF
	brk $0F.b		; 00 0F
	cpx #$8F.b		; E0 8F
	cpx #$CF.b		; E0 CF
	cpx #$EF.b		; E0 EF
	sbc $8F.b,S		; E3 8F
	sbc $0F.b,S		; E3 0F
	cpx $92.b		; E4 92
	sta ($8A.b)		; 92 8A
	jmp $D71CC2.l		; 5C C2 1C D7
	ora ($FF.b,X)		; 01 FF
	brk $3C.b		; 00 3C
	jsr $C3DF.w		; 20 DF C3
	ora $03.b,S		; 03 03
	pea $FFFB.w		; F4 FB FF
	brk $EB.b		; 00 EB
	trb $FE.b		; 14 FE
	ora ($FF.b,X)		; 01 FF
	sbc $BCFFCB.l,X		; FF CB FF BC
	eor $FC.b,S		; 43 FC
	brk $E0.b		; 00 E0
	tay		; A8
	tsb $1D.b		; 04 1D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	asl $0F.b		; 06 0F
	asl $0F.b		; 06 0F
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B6.b		; 00 B6
	brk $B6.b		; 00 B6
	brk $B6.b		; 00 B6
	brk $B6.b		; 00 B6
	php		; 08
	ldx $08.b		; A6 08
	tsx		; BA
	php		; 08
	ldx $BE08.w,Y		; BE 08 BE
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $18.b		; 00 18
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora $0D04.w		; 0D 04 0D
	ora [$00.b]		; 07 00
	ora [$18.b]		; 07 18
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $1F83.w,X		; 3C 83 1F
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
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
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	bpl -16.b		; 10 F0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	bpl 112.b		; 10 70
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
	brk $01.b		; 00 01
	ora ($02.b,X)		; 01 02
	brk $1D.b		; 00 1D
	brk $7E.b		; 00 7E
	brk $7F.b		; 00 7F
	brk $6F.b		; 00 6F
	brk $50.b		; 00 50
	bpl   1.b		; 10 01
	ora ($02.b,X)		; 01 02
	ora ($07.b,X)		; 01 07
	brk $27.b		; 00 27
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	brk $60.b		; 00 60
	rts		; 60

	bpl  16.b		; 10 10
	tay		; A8
	ldy #$13.b		; A0 13
	brk $8F.b		; 00 8F
	rti		; 40

	cmp $00DE00.l,X		; DF 00 DE 00
.INDEX 16
	rep #$1C		; C2 1C
	bcc -16.b		; 90 F0
	inx		; E8
	beq  92.b		; F0 5C
	cpx #$00FC.w		; E0 FC 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $14EB00.l,X		; FF 00 EB 14
	ply		; 7A
	sei		; 78
	ora ($0B.b),Y		; 11 0B
	bpl  11.b		; 10 0B
	brk $17.b		; 00 17
	brk $1F.b		; 00 1F
	tsb $1D.b		; 04 1D
	tsb $1D.b		; 04 1D
	tsb $1D.b		; 04 1D
	ora $7C.b		; 05 7C
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	php		; 08
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $E7.b		; 00 E7
	inx		; E8
	ora ($BA.b),Y		; 11 BA
	ora ($BA.b,X)		; 01 BA
	brk $FD.b		; 00 FD
	brk $BF.b		; 00 BF
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $B7.b		; 00 B7
	beq -88.b		; F0 A8
	mvp $44,$00		; 44 00 44
	brk $02.b		; 00 02
	brk $40.b		; 00 40
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	ora $0D04.w		; 0D 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	php		; 08
	ldx $BE08.w,Y		; BE 08 BE
	php		; 08
	ldx $BE08.w,Y		; BE 08 BE
	php		; 08
	ldx $BE08.w,Y		; BE 08 BE
	bit $7E80.w,X		; 3C 80 7E
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
	brk $E0.b		; 00 E0
	brk $30.b		; 00 30
	bmi -32.b		; 30 E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bne -16.b		; D0 F0
	cpy #$00F0.w		; C0 F0 00
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
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	dec $DA.b		; C6 DA
	cmp $FFC904.l		; CF 04 C9 FF
	sbc $FF.b,X		; F5 FF
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	sbc $FF.b		; E5 FF
	cop $08.b		; 02 08
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	cmp $FF.b,X		; D5 FF
	tsb $08.b		; 04 08
	brk $00.b		; 00 00
	dec $FF.b,X		; D6 FF
	cmp $FF.b,X		; D5 FF
	asl $08.b		; 06 08
	brk $00.b		; 00 00
	dex		; CA
	sbc $08FFC5.l,X		; FF C5 FF 08
	php		; 08
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	jsr $223C.w		; 20 3C 22
	bit $3C22.w,X		; 3C 22 3C
	ora ($1C.b)		; 12 1C
	ora ($1C.b)		; 12 1C
	ora ($1C.b)		; 12 1C
	asl A		; 0A
	tsb $00C1.w		; 0C C1 00
	eor ($00.b,X)		; 41 00
	eor ($00.b,X)		; 41 00
	eor ($00.b,X)		; 41 00
	adc ($00.b,X)		; 61 00
	and ($00.b,X)		; 21 00
	and ($00.b,X)		; 21 00
	ora ($00.b),Y		; 11 00
	bra -16.b		; 80 F0
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	rti		; 40

	bvs  64.b		; 70 40
	bvs  64.b		; 70 40
	bvs  64.b		; 70 40
	bvs -64.b		; 70 C0
	beq   0.b		; F0 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	ror $807D.w		; 6E 7D 80
	ply		; 7A
	sei		; 78
	ora ($0B.b),Y		; 11 0B
	bpl  11.b		; 10 0B
	brk $17.b		; 00 17
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	sta $8282F4.l,X		; 9F F4 82 82
	ora $7C.b		; 05 7C
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $F4.b,S		; 03 F4
	xce		; FB
	sbc [$E8.b]		; E7 E8
	ora ($BA.b),Y		; 11 BA
	ora ($BA.b,X)		; 01 BA
	brk $FD.b		; 00 FD
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	jsr ($E000.w,X)		; FC 00 E0
	tay		; A8
	beq -88.b		; F0 A8
	mvp $44,$00		; 44 00 44
	brk $02.b		; 00 02
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($02.b,X)		; 01 02
	brk $1D.b		; 00 1D
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $02.b		; 00 02
	cop $01.b		; 02 01
	ora ($01.b,X)		; 01 01
	ora ($02.b,X)		; 01 02
	ora ($07.b,X)		; 01 07
	brk $27.b		; 00 27
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $B8.b		; 00 B8
	php		; 08
	bvs  48.b		; 70 30
	rts		; 60

	rts		; 60

	bpl  16.b		; 10 10
	tay		; A8
	ldy #$0013.w		; A0 13 00
	adc $00FF00.l,X		; 7F 00 FF 00
	rti		; 40

	pha		; 48
	cpy #$90F0.w		; C0 F0 90
	beq -24.b		; F0 E8
	beq  92.b		; F0 5C
	cpx #$00FC.w		; E0 FC 00
	sta [$FF.b]		; 87 FF
	adc $0000FF.l,X		; 7F FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bne  16.b		; D0 10
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$F8F0.w		; E0 F0 F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	asl $0600.w		; 0E 00 06
	asl $3E20.w,X		; 1E 20 3E
	cpx #$01F8.w		; E0 F8 01
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	ora ($00.b),Y		; 11 00
	ora $0100.w,Y		; 19 00 01
	jsr $E021.w		; 20 21 E0
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	cpy #$C0F0.w		; C0 F0 C0
	beq -64.b		; F0 C0
	beq -40.b		; F0 D8
	cpx #$C03C.w		; E0 3C C0
	jmp ($F080.w,X)		; 7C 80 F0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $C000.w		; 20 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  31.b		; 10 1F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	php		; 08
	ora $000700.l		; 0F 00 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	sbc $00BF40.l,X		; FF 40 BF 00
	ldx $3E80.w,Y		; BE 80 3E
	bra  62.b		; 80 3E
	brk $3E.b		; 00 3E
	jsr $203E.w		; 20 3E 20
	ldx $0000.w,Y		; BE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $115100.l		; 6F 00 51 11
	eor $313F11.l,X		; 5F 11 3F 31
	lda $31F031.l,X		; BF 31 F0 31
	cmp $30BF10.l,X		; DF 10 BF 30
	sbc $00EF00.l,X		; FF 00 EF 00
	sbc $E0CF00.l		; EF 00 CF E0
	cmp $E1CEE1.l		; CF E1 CE E1
	sbc $E0CFE0.l		; EF E0 CF E0
	cmp $F21C.w,X		; DD 1C F2
	bit $FCFA.w,X		; 3C FA FC
	sbc ($FC.b)		; F2 FC
	inc $E0F0.w,X		; FE F0 E0
	beq -34.b		; F0 DE
	brk $DE.b		; 00 DE
	brk $E2.b		; 00 E2
	sbc $FFC4FB.l,X		; FF FB C4 FF
	php		; 08
	xce		; FB
	tsb $FF.b		; 04 FF
	bpl -17.b		; 10 EF
	bpl  -1.b		; 10 FF
	brk $FF.b		; 00 FF
	brk $D0.b		; 00 D0
	bpl -64.b		; 10 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $20F0.w		; 20 F0 20
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
	brk $0E.b		; 00 0E
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	ora $FF1F00.l,X		; 1F 00 1F FF
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($0C.b,S),Y		; 13 0C
	ora ($00.b,S),Y		; 13 00
	brk $20.b		; 00 20
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$8000.w		; E0 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   5.b		; 80 05
	bra  20.b		; 80 14
	brk $C6.b		; 00 C6
	jmp.w [$05D1]		; DC D1 05
	cmp #$FF.b		; C9 FF
	inc $FF.b,X		; F6 FF
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	inc $FF.b		; E6 FF
	cop $08.b		; 02 08
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	dec $FF.b,X		; D6 FF
	tsb $08.b		; 04 08
	brk $00.b		; 00 00
	dec $FF.b,X		; D6 FF
	dec $FF.b,X		; D6 FF
	asl $08.b		; 06 08
	brk $00.b		; 00 00
	dex		; CA
	sbc $08FFC6.l,X		; FF C6 FF 08
	php		; 08
	brk $00.b		; 00 00
	ora $3D.b		; 05 3D
	brk $3C.b		; 00 3C
	jsr $203C.w		; 20 3C 20
	bit $1C02.w,X		; 3C 02 1C
	ora ($1C.b)		; 12 1C
	ora ($1C.b)		; 12 1C
	cop $0C.b		; 02 0C
	cpy #$C100.w		; C0 00 C1
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $21.b		; 00 21
	brk $21.b		; 00 21
	brk $21.b		; 00 21
	brk $11.b		; 00 11
	brk $00.b		; 00 00
	beq -128.b		; F0 80
	beq   0.b		; F0 00
	bvs   0.b		; 70 00
	bvs  64.b		; 70 40
	bvs  64.b		; 70 40
	bvs  64.b		; 70 40
	bvs  64.b		; 70 40
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $BF.b		; 00 BF
	bmi 126.b		; 30 7E
	ror $807D.w		; 6E 7D 80
	ply		; 7A
	sei		; 78
	ora ($0B.b),Y		; 11 0B
	bpl  11.b		; 10 0B
	brk $17.b		; 00 17
	brk $1F.b		; 00 1F
	cmp $F49FE0.l		; CF E0 9F F4
	stx $058E.w		; 8E 8E 05
	jmp ($0004.w,X)		; 7C 04 00
	tsb $00.b		; 04 00
	php		; 08
	brk $00.b		; 00 00
	brk $DE.b		; 00 DE
	brk $03.b		; 00 03
	ora $F4.b,S		; 03 F4
	xce		; FB
	sbc [$E8.b]		; E7 E8
	ora ($BA.b),Y		; 11 BA
	ora ($BA.b,X)		; 01 BA
	brk $FD.b		; 00 FD
	brk $BF.b		; 00 BF
	sbc $00FC00.l,X		; FF 00 FC 00
	cpx #$F0A8.w		; E0 A8 F0
	tay		; A8
	mvp $44,$00		; 44 00 44
	brk $02.b		; 00 02
	brk $40.b		; 00 40
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($03.b,X)		; 01 03
	ora ($1D.b,X)		; 01 1D
	ora ($7F.b,X)		; 01 7F
	ora ($02.b,X)		; 01 02
	cop $02.b		; 02 02
	cop $01.b		; 02 01
	ora ($01.b,X)		; 01 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $27.b		; 00 27
	brk $1F.b		; 00 1F
	ora ($F8.b,X)		; 01 F8
	php		; 08
	tay		; A8
	brk $77.b		; 00 77
	tsb $F7.b		; 04 F7
	stx $EE.b		; 86 EE
	dec $FEFF.w		; CE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	brk $08.b		; 00 08
	stz $7C.b,X		; 74 7C
	xba		; EB
	sbc $DF79EE.l,X		; FF EE 79 DF
	bmi  -1.b		; 30 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $72.b		; 00 72
	.db $42, $04		; 42 04
	tsb $18.b		; 04 18
	clc		; 18
	bcs  48.b		; B0 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $FC.b		; 84 FC
	cop $FE.b		; 02 FE
	sty $F87E.w		; 8C 7E F8
	jmp ($78E0.w,X)		; 7C E0 78
	cpy #$0030.w		; C0 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	trb $0E.b		; 14 0E
	bpl  30.b		; 10 1E
	bvs 124.b		; 70 7C
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($09.b,X)		; 01 09
	brk $01.b		; 00 01
	bpl  17.b		; 10 11
	bvs   1.b		; 70 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($C0.b,X)		; 01 C0
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	beq   0.b		; F0 00
	jsr ($E01C.w,X)		; FC 1C E0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($E000.w,X)		; FC 00 E0
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	bpl  31.b		; 10 1F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	php		; 08
	ora $000700.l		; 0F 00 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	sbc $40FF00.l,X		; FF 00 FF 40
	lda $80BE00.l,X		; BF 00 BE 80
	rol $3E80.w,X		; 3E 80 3E
	brk $3E.b		; 00 3E
	jsr $003E.w		; 20 3E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	ora ($6F.b,X)		; 01 6F
	brk $50.b		; 00 50
	bpl  94.b		; 10 5E
	bpl  62.b		; 10 3E
	bmi -66.b		; 30 BE
	bmi -15.b		; 30 F1
	bmi -33.b		; 30 DF
	bpl  -1.b		; 10 FF
	ora ($FF.b,X)		; 01 FF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $CF.b		; 00 CF
	cpx #$E0CF.w		; E0 CF E0
	cmp $E0EFE0.l		; CF E0 EF E0
	sbc $FCFFFE.l,X		; FF FE FF FC
	jsr ($CAFC.w,X)		; FC FC CA
	trb $1CC2.w		; 1C C2 1C
	dec $D000.w		; CE 00 D0
	brk $DE.b		; 00 DE
	brk $FF.b		; 00 FF
	cop $FF.b		; 02 FF
	sty $FF.b		; 84 FF
	sty $FF.b		; 84 FF
	php		; 08
	xba		; EB
	trb $FF.b		; 14 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
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
	brk $0E.b		; 00 0E
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	ora $FF1F00.l,X		; 1F 00 1F FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($0C.b,S),Y		; 13 0C
	ora ($00.b,S),Y		; 13 00
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
	brk $06.b		; 00 06
	bra  24.b		; 80 18
	brk $C5.b		; 00 C5
	cmp $07CC.w,X		; DD CC 07
	cmp $FF.b		; C5 FF
	cpy $00FF.w		; CC FF 00
	php		; 08
	brk $00.b		; 00 00
	cmp $FF.b,X		; D5 FF
	cpy $02FF.w		; CC FF 02
	php		; 08
	brk $00.b		; 00 00
	cmp $FF.b		; C5 FF
	jmp.w [$04FF]		; DC FF 04
	php		; 08
	brk $00.b		; 00 00
	cmp $FF.b,X		; D5 FF
	jmp.w [$06FF]		; DC FF 06
	php		; 08
	brk $00.b		; 00 00
	iny		; C8
	sbc $08FFEC.l,X		; FF EC FF 08
	php		; 08
	brk $00.b		; 00 00
	cpy $FCFF.w		; CC FF FC
	sbc $00080A.l,X		; FF 0A 08 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $70.b		; 00 70
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	sed		; F8
	brk $F8.b		; 00 F8
	sbc $04FC00.l,X		; FF 00 FC 04
	jsr ($BB00.w,X)		; FC 00 BB
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	tya		; 98
	rts		; 60

	tya		; 98
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	asl A		; 0A
	rol $FFEC.w,X		; 3E EC FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $73.b		; 00 73
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
	brk $50.b		; 00 50
	bpl  95.b		; 10 5F
	bpl  63.b		; 10 3F
	bmi -65.b		; 30 BF
	bmi -16.b		; 30 F0
	bmi -33.b		; 30 DF
	bpl -65.b		; 10 BF
	bmi -65.b		; 30 BF
	bmi -17.b		; 30 EF
	brk $EF.b		; 00 EF
	brk $CF.b		; 00 CF
	cpx #$E0CF.w		; E0 CF E0
	cmp $E0EFE0.l		; CF E0 EF E0
	cmp $E0CFE0.l		; CF E0 CF E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $0E.b		; 65 0E
	adc ($0E.b,X)		; 61 0E
	inx		; E8
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	sta ($FF.b,X)		; 81 FF
	sta ($FF.b,X)		; 81 FF
	tsb $F5.b		; 04 F5
	asl A		; 0A
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sbc $007E01.l,X		; FF 01 7E 00
	ror $7E40.w,X		; 7E 40 7E
	.db $42, $7C		; 42 7C
	cop $3C.b		; 02 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FC.b		; 00 FC
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
	eor ($63.b)		; 52 63
	lsr $67.b,X		; 56 67
	ror $07.b,X		; 76 07
	ror $07.b,X		; 76 07
	inc $07.b,X		; F6 07
	adc [$06.b],Y		; 77 06
	ora $180706.l,X		; 1F 06 07 18
	sty $8800.w		; 8C 00 88
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	asl $7F00.w,X		; 1E 00 7F
	brk $7F.b		; 00 7F
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $27.b		; 00 27
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	cmp [$FF.b]		; C7 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF38DF.l,X		; FF DF 38 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sta ($FF.b,X)		; 81 FF
	sta ($FF.b,X)		; 81 FF
	brk $1C.b		; 00 1C
	bpl -63.b		; 10 C1
	ora ($C1.b,X)		; 01 C1
	ora ($C6.b,X)		; 01 C6
	asl $EC.b		; 06 EC
	tsb $00F0.w		; 0C F0 00
	beq   0.b		; F0 00
	brk $FF.b		; 00 FF
	sbc $1F.b,S		; E3 1F
	inc $FE1F.w,X		; FE 1F FE
	ora $F01EF8.l,X		; 1F F8 1E F0
	tsb $00FC.w		; 0C FC 00
	sed		; F8
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
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	asl $C03E.w		; 0E 3E C0
	sei		; 78
	adc $140D10.l,X		; 7F 10 0D 14
	ora $1B00.w		; 0D 00 1B
	brk $17.b		; 00 17
	brk $1F.b		; 00 1F
	stz $FF94.w,X		; 9E 94 FF
	sbc $027900.l,X		; FF 00 79 02
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	adc $FDFE.w,Y		; 79 FE FD
	ror $887D.w,X		; 7E 7D 88
	cmp $DD01.w,X		; DD 01 DD
	brk $FE.b		; 00 FE
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	ror $7848.w,X		; 7E 48 78
	iny		; C8
	sed		; F8
	pha		; 48
	jsl $002200.l		; 22 00 22 00
	ora ($00.b,X)		; 01 00
	jsr $0000.w		; 20 00 00
	brk $C0.b		; 00 C0
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	brk $3E.b		; 00 3E
	jsr $103E.w		; 20 3E 10
	asl $1E10.w,X		; 1E 10 1E
	php		; 08
	asl $0E09.w		; 0E 09 0E
	ora #$0E.b		; 09 0E
	cpy #$4000.w		; C0 00 40
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $80.b		; 00 80
	jsr ($FC80.w,X)		; FC 80 FC
	cpy #$40F8.w		; C0 F8 40
	sei		; 78
	jsr $2038.w		; 20 38 20
	sec		; 38
	jsr $2038.w		; 20 38 20
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $13.b		; 00 13
	tsb $001F.w		; 0C 1F 00
	ora $110E00.l,X		; 1F 00 0E 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $3080.w		; 0C 80 30
	brk $C3.b		; 00 C3
	sbc $C6.b,S		; E3 C6
	ora [$C3.b]		; 07 C3
	sbc $00FFC6.l,X		; FF C6 FF 00
	php		; 08
	brk $00.b		; 00 00
	cmp $FF.b,S		; C3 FF
	dec $FF.b,X		; D6 FF
	cop $08.b		; 02 08
	brk $00.b		; 00 00
	cmp $FF.b,S		; C3 FF
	inc $FF.b		; E6 FF
	tsb $08.b		; 04 08
	brk $00.b		; 00 00
	cmp $FF.b,S		; C3 FF
	inc $FF.b,X		; F6 FF
	asl $08.b		; 06 08
	brk $00.b		; 00 00
	cmp $FF.b,S		; C3 FF
	asl $00.b		; 06 00
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	cmp ($FF.b,S),Y		; D3 FF
	dex		; CA
	sbc $00080A.l,X		; FF 0A 08 00
	brk $D3.b		; 00 D3
	sbc $0CFFDA.l,X		; FF DA FF 0C
	php		; 08
	brk $00.b		; 00 00
	cmp ($FF.b,S),Y		; D3 FF
	nop		; EA
	sbc $00080E.l,X		; FF 0E 08 00
	brk $D3.b		; 00 D3
	sbc $20FFFA.l,X		; FF FA FF 20
	php		; 08
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	bne  -1.b		; D0 FF
	jsl $000008.l		; 22 08 00 00
	sbc $FF.b,S		; E3 FF
	cpx #$24FF.w		; E0 FF 24
	php		; 08
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	beq  -1.b		; F0 FF
	rol $08.b		; 26 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	asl $1F00.w		; 0E 00 1F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	ora $FF2E00.l,X		; 1F 00 2E FF
	tsb $3F.b		; 04 3F
	tsb $27.b		; 04 27
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($3F.b,S),Y		; 13 3F
	tsa		; 3B
	ora ($3F.b),Y		; 11 3F
	and $3F.b,S		; 23 3F
	inc A		; 1A
	and $ABFFF7.l,X		; 3F F7 FF AB
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $ACFFD6.l,X		; FF D6 FF AC
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $AB08F7.l,X		; FF F7 08 AB
	mvn $00,$FF		; 54 FF 00
	brk $FF.b		; 00 FF
	dec $29.b,X		; D6 29
	ldy $FF53.w		; AC 53 FF
	brk $00.b		; 00 00
	sbc $AEFD5D.l,X		; FF 5D FD AE
	inc $FCFC.w,X		; FE FC FC
	brk $FF.b		; 00 FF
	dec $BCFE.w,X		; DE FE BC
	jsr ($FFFF.w,X)		; FC FF FF
	brk $FF.b		; 00 FF
	eor $50AFA0.l,X		; 5F A0 AF 50
	sbc $FF0000.l,X		; FF 00 00 FF
	cmp $40BF20.l,X		; DF 20 BF 40
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	xce		; FB
	xce		; FB
	sbc ($F3.b,S),Y		; F3 F3
	xce		; FB
	xce		; FB
	sbc [$F7.b],Y		; F7 F7
	sbc [$F7.b],Y		; F7 F7
	cpy #$FFFF.w		; C0 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $3BB3B3.l,X		; FF B3 B3 3B
	tsa		; 3B
	sbc [$F7.b],Y		; F7 F7
	dec A		; 3A
	dec A		; 3A
	and ($32.b)		; 32 32
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	plb		; AB
	sbc $FFFF96.l,X		; FF 96 FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $AB.b		; 00 AB
	mvn $69,$96		; 54 96 69
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jmp ($F8FC.w,X)		; 7C FC F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $C7.b		; 00 C7
	xce		; FB
	cmp [$FB.b]		; C7 FB
	cmp [$FB.b]		; C7 FB
	cmp [$FB.b]		; C7 FB
	adc $07F880.l,X		; 7F 80 F8 07
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
	ora $080700.l		; 0F 00 07 08
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	tay		; A8
	eor [$47.b],Y		; 57 47
	pea $6444.w		; F4 44 64
	eor [$4E.b]		; 47 4E
	jmp $7CE7F7.l		; 5C F7 E7 7C
	adc [$F3.b]		; 67 F3
	adc ($90.b,S),Y		; 73 90
	clv		; B8
	tay		; A8
	sbc $9BFF0B.l,X		; FF 0B FF 9B
	sbc $18FFB2.l,X		; FF B2 FF 18
	sbc $17FF90.l,X		; FF 90 FF 17
	sbc $000000.l		; EF 00 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	bra -16.b		; 80 F0
	brk $7F.b		; 00 7F
	sbc $00FFD0.l,X		; FF D0 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra  48.b		; 80 30
	beq   8.b		; F0 08
	sed		; F8
	adc $2FD0FF.l,X		; 7F FF D0 2F
	cmp $D5.b,X		; D5 D5
	mvp $7F,$44		; 44 44 7F
	adc $76FF00.l,X		; 7F 00 FF 76
	sbc $FFFF5D.l,X		; FF 5D FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $5D8976.l,X		; FF 76 89 5D
	ldx #$00FF.w		; A2 FF 00
	brk $FF.b		; 00 FF
	sbc ($F1.b),Y		; F1 F1
	adc $65.b		; 65 65
	sbc $FF00FF.l,X		; FF FF 00 FF
	cmp $B7FF.w,X		; DD FF B7
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $B722DD.l,X		; FF DD 22 B7
	pha		; 48
	sbc $FF0000.l,X		; FF 00 00 FF
	xce		; FB
	sbc $488F8A.l,X		; FF 8A 8F 48
	eor $F8FF3A.l		; 4F 3A FF F8
	sbc $38FFFB.l,X		; FF FB FF 38
	sbc $FBFFFF.l,X		; FF FF FF FB
	tsb $FA.b		; 04 FA
	ora $F8.b		; 05 F8
	ora [$3A.b]		; 07 3A
	cmp $F8.b		; C5 F8
	ora [$FB.b]		; 07 FB
	tsb $38.b		; 04 38
	cmp [$FF.b]		; C7 FF
	brk $FE.b		; 00 FE
	sbc $55FFFE.l,X		; FF FE FF 55
	sbc $55FFFE.l,X		; FF FE FF 55
	sbc $00FFFE.l,X		; FF FE FF 00
	sbc $FEFFFF.l,X		; FF FF FF FE
	ora ($FE.b,X)		; 01 FE
	ora ($55.b,X)		; 01 55
	tax		; AA
	inc $5501.w,X		; FE 01 55
	tax		; AA
	inc $0001.w,X		; FE 01 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $03.b		; 00 03
	ora $FF.b,S		; 03 FF
	sbc $AAFFAA.l,X		; FF AA FF AA
	sbc $FFFFDB.l,X		; FF DB FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $24.b		; 00 24
	and $AAE2FF.l,X		; 3F FF E2 AA
	eor $AA.b,X		; 55 AA
	eor $DB.b,X		; 55 DB
	bit $FF.b		; 24 FF
	brk $00.b		; 00 00
	sbc $141C0E.l,X		; FF 0E 1C 14
	ora $DD.b		; 05 DD
	cpy $95.b		; C4 95
	pei ($81.b)		; D4 81
	cpx $61.b		; E4 61
	sbc $FEFC.w,X		; FD FC FE
	brk $FF.b		; 00 FF
	and ($3F.b),Y		; 31 3F
	tsa		; 3B
	and $B3FFF3.l,X		; 3F F3 FF B3
	adc $637F9B.l		; 6F 9B 7F 63
	ldx $1FFD.w,Y		; BE FD 1F
	brk $FF.b		; 00 FF
	xce		; FB
	sbc $DBFF6C.l,X		; FF 6C FF DB
	sbc $BEFF00.l,X		; FF 00 FF BE
	inc $F515.w,X		; FE 15 F5
	tyx		; BB
	xce		; FB
	brk $FF.b		; 00 FF
	xce		; FB
	tsb $6C.b		; 04 6C
	sta ($DB.b,S),Y		; 93 DB
	bit $00.b		; 24 00
	sbc $1F40BF.l,X		; FF BF 40 1F
	cpx #$40BF.w		; E0 BF 40
	brk $FF.b		; 00 FF
	sbc [$F7.b],Y		; F7 F7
	cmp $FFFFCF.l		; CF CF FF FF
	brk $FF.b		; 00 FF
	adc $FF7FFF.l,X		; 7F FF 7F FF
	adc $FF00FF.l,X		; 7F FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	adc $807F80.l,X		; 7F 80 7F 80
	adc $FF0080.l,X		; 7F 80 00 FF
	xce		; FB
	sbc $C0F4F4.l,X		; FF F4 F4 C0
	sbc $A5FFFF.l,X		; FF FF FF A5
	sbc $FFFF92.l,X		; FF 92 FF FF
	sbc $FBFFFF.l,X		; FF FF FF FB
	tsb $FF.b		; 04 FF
	brk $C0.b		; 00 C0
	and $A500FF.l,X		; 3F FF 00 A5
	phy		; 5A
	sta ($6D.b)		; 92 6D
	sbc $00FF00.l,X		; FF 00 FF 00
	lda [$FF.b],Y		; B7 FF
	cpy $00CC.w		; CC CC 00
	sbc $7EFFFF.l,X		; FF FF FF 7E
	inc $FC7C.w,X		; FE 7C FC
	sed		; F8
	sbc $B7FEFE.l,X		; FF FE FE B7
	pha		; 48
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $807F00.l,X		; FF 00 7F 80
	adc $07F880.l,X		; 7F 80 F8 07
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp [$FB.b]		; C7 FB
	sbc $C73E07.l,X		; FF 07 3E C7
	ror $6687.w,X		; 7E 87 66
	sta $0924CB.l,X		; 9F CB 24 09
	asl $0F.b		; 06 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$8000.w		; C0 00 80
	brk $98.b		; 00 98
	brk $24.b		; 00 24
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $67.b,S		; C3 67
	ora [$3F.b]		; 07 3F
	and $FF007F.l,X		; 3F 7F 00 FF
	mvn $01,$54		; 54 54 01
	ora ($54.b,X)		; 01 54
	mvn $FF,$00		; 54 00 FF
	tas		; 1B
	inc $FC47.w,X		; FE 47 FC
	lda $FF00F8.l,X		; BF F8 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	asl A		; 0A
	sbc $FFFF52.l,X		; FF 52 FF FF
	sbc $54FF00.l,X		; FF 00 FF 54
	mvn $51,$51		; 54 51 51
	pei ($D4.b)		; D4 D4
	brk $FF.b		; 00 FF
	asl A		; 0A
	sbc $52.b,X		; F5 52
	lda $00FF.w		; AD FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	plx		; FA
	sbc $FBFFF8.l,X		; FF F8 FF FB
	sbc $F8FF02.l,X		; FF 02 FF F8
	sbc $FAFFFB.l,X		; FF FB FF FA
	sbc $FAFFF8.l,X		; FF F8 FF FA
	ora $F8.b		; 05 F8
	ora [$FB.b]		; 07 FB
	tsb $02.b		; 04 02
	sbc $07F8.w,X		; FD F8 07
	xce		; FB
	tsb $FA.b		; 04 FA
	ora $F8.b		; 05 F8
	ora [$FE.b]		; 07 FE
	sbc $FEFF55.l,X		; FF 55 FF FE
	sbc $55FFFE.l,X		; FF FE FF 55
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFF55.l,X		; FF 55 FF FE
	ora ($55.b,X)		; 01 55
	tax		; AA
	inc $FE01.w,X		; FE 01 FE
	ora ($55.b,X)		; 01 55
	tax		; AA
	inc $FE01.w,X		; FE 01 FE
	ora ($55.b,X)		; 01 55
	tax		; AA
	inc $F6.b,X		; F6 F6
	eor #$49.b		; 49 49
	brk $FF.b		; 00 FF
	inc $F6.b,X		; F6 F6
	eor #$49.b		; 49 49
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	tyx		; BB
	tyx		; BB
	cmp $C5.b		; C5 C5
	brk $FF.b		; 00 FF
	tyx		; BB
	tyx		; BB
	cpy $C4.b		; C4 C4
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	bra  -8.b		; 80 F8
	bra -16.b		; 80 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
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
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
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
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
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
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra  64.b		; 80 40
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
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
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
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
	bra -128.b		; 80 80
	bra   0.b		; 80 00
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
	trb $80.b		; 14 80
	bvc   0.b		; 50 00
	ldy $F3.b,X		; B4 F3
	cpy #$B40E.w		; C0 0E B4
	sbc $00FFC0.l,X		; FF C0 FF 00
	php		; 08
	brk $00.b		; 00 00
	cpy $FF.b		; C4 FF
	cpy #$02FF.w		; C0 FF 02
	php		; 08
	brk $00.b		; 00 00
	pei ($FF.b)		; D4 FF
	cpy #$04FF.w		; C0 FF 04
	php		; 08
	brk $00.b		; 00 00
	cpx $FF.b		; E4 FF
	cpy #$06FF.w		; C0 FF 06
	php		; 08
	brk $00.b		; 00 00
	ldy $FF.b,X		; B4 FF
	bne  -1.b		; D0 FF
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	cpy $FF.b		; C4 FF
	bne  -1.b		; D0 FF
	asl A		; 0A
	php		; 08
	brk $00.b		; 00 00
	pei ($FF.b)		; D4 FF
	bne  -1.b		; D0 FF
	tsb $0008.w		; 0C 08 00
	brk $E4.b		; 00 E4
	sbc $0EFFD0.l,X		; FF D0 FF 0E
	php		; 08
	brk $00.b		; 00 00
	ldy $FF.b,X		; B4 FF
	cpx #$20FF.w		; E0 FF 20
	php		; 08
	brk $00.b		; 00 00
	cpy $FF.b		; C4 FF
	cpx #$22FF.w		; E0 FF 22
	php		; 08
	brk $00.b		; 00 00
	pei ($FF.b)		; D4 FF
	cpx #$24FF.w		; E0 FF 24
	php		; 08
	brk $00.b		; 00 00
	cpx $FF.b		; E4 FF
	cpx #$26FF.w		; E0 FF 26
	php		; 08
	brk $00.b		; 00 00
	ldy $FF.b,X		; B4 FF
	beq  -1.b		; F0 FF
	plp		; 28
	php		; 08
	brk $00.b		; 00 00
	cpy $FF.b		; C4 FF
	beq  -1.b		; F0 FF
	rol A		; 2A
	php		; 08
	brk $00.b		; 00 00
	pei ($FF.b)		; D4 FF
	beq  -1.b		; F0 FF
	bit $0008.w		; 2C 08 00
	brk $E4.b		; 00 E4
	sbc $2EFFF0.l,X		; FF F0 FF 2E
	php		; 08
	brk $00.b		; 00 00
	ldy $FF.b,X		; B4 FF
	brk $00.b		; 00 00
	rti		; 40

	php		; 08
	brk $00.b		; 00 00
	cpy $FF.b		; C4 FF
	brk $00.b		; 00 00
	.db $42, $08		; 42 08
	brk $00.b		; 00 00
	pei ($FF.b)		; D4 FF
	brk $00.b		; 00 00
	mvp $00,$08		; 44 08 00
	brk $E4.b		; 00 E4
	sbc $460000.l,X		; FF 00 00 46
	php		; 08
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	tsx		; BA
	sbc $D6FFBA.l,X		; FF BA FF D6
	sbc $EEFFD6.l,X		; FF D6 FF EE
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $BA.b		; 00 BA
	eor $BA.b		; 45 BA
	eor $D6.b		; 45 D6
	adc $29D6.w		; 6D D6 29
	inc $FF39.w		; EE 39 FF
	brk $FF.b		; 00 FF
	sbc $CDFFFF.l,X		; FF FF FF CD
	sbc $B5FFB5.l,X		; FF B5 FF B5
	sbc $CCFFB5.l,X		; FF B5 FF CC
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $CD.b		; 00 CD
	ply		; 7A
	lda $4A.b,X		; B5 4A
	lda $4A.b,X		; B5 4A
	lda $4A.b,X		; B5 4A
	cpy $FF7B.w		; CC 7B FF
	brk $FF.b		; 00 FF
	sbc $E6FFFF.l,X		; FF FF FF E6
	sbc $DBFFDB.l,X		; FF DB FF DB
	sbc $5BFFC3.l,X		; FF C3 FF 5B
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $E6.b		; 00 E6
	and $24DB.w,X		; 3D DB 24
	stp		; DB
	bit $C3.b		; 24 C3
	bit $A45B.w,X		; 3C 5B A4
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF2CFF.l,X		; FF FF 2C FF
	rtl		; 6B

	sbc $6BFF6B.l,X		; FF 6B FF 6B
	sbc $FFFF6C.l,X		; FF 6C FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $2C.b		; 00 2C
	cmp [$6B.b],Y		; D7 6B
	sty $6B.b,X		; 94 6B
	sty $6B.b,X		; 94 6B
	sty $6C.b,X		; 94 6C
	sta [$FF.b],Y		; 97 FF
	brk $FF.b		; 00 FF
	sbc $DBFFFF.l,X		; FF FF FF DB
	sbc $4BFF4B.l,X		; FF 4B FF 4B
	sbc $DBFF53.l,X		; FF 53 FF DB
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $DB.b		; 00 DB
	ldy $4B.b,X		; B4 4B
	ldy $4B.b,X		; B4 4B
	ldy $53.b,X		; B4 53
	ldy $ACDB.w		; AC DB AC
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF16FF.l,X		; FF FF 16 FF
	lda $FF.b,X		; B5 FF
	lda $FF.b,X		; B5 FF
	lda $FF.b,X		; B5 FF
	ldx $FF.b,Y		; B6 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $EB1600.l,X		; FF 00 16 EB
	lda $4A.b,X		; B5 4A
	lda $4A.b,X		; B5 4A
	lda $4A.b,X		; B5 4A
	ldx $4B.b,Y		; B6 4B
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF2DFF.l,X		; FF FF 2D FF
	xba		; EB
	sbc $EBFFE7.l,X		; FF E7 FF EB
	sbc $FFFF2D.l,X		; FF 2D FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $2D.b		; 00 2D
	cmp ($EB.b)		; D2 EB
	trb $E7.b		; 14 E7
	clc		; 18
	xba		; EB
	trb $2D.b		; 14 2D
	cmp ($FF.b)		; D2 FF
	brk $FF.b		; 00 FF
	sbc $11FFFF.l,X		; FF FF FF 11
	sbc $1BFF7B.l,X		; FF 7B FF 1B
	sbc $1BFF7B.l,X		; FF 7B FF 1B
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $11.b		; 00 11
	inc $847B.w		; EE 7B 84
	tas		; 1B
	cpx $7B.b		; E4 7B
	sty $1B.b		; 84 1B
	cpx $FF.b		; E4 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $AAFFDC.l,X		; FF DC FF AA
	sbc $FFFFAA.l,X		; FF AA FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $DC.b		; 00 DC
	and $AA.b,S		; 23 AA
	eor $AA.b,X		; 55 AA
	eor $FF.b,X		; 55 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $B3FFD5.l,X		; FF D5 FF B3
	sbc $FFFFAC.l,X		; FF AC FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $D5.b		; 00 D5
	rol A		; 2A
	lda ($4C.b,S),Y		; B3 4C
	ldy $FF53.w		; AC 53 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7DFE5E.l,X		; FF 5E FE 7D
	sbc $FEDE.w,X		; FD DE FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $807FA2.l,X		; 5F A2 7F 80
	cmp $00FF22.l,X		; DF 22 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	eor $54544F.l		; 4F 4F 54 54
	eor $DFDF4F.l		; 4F 4F DF DF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF08.l,X		; FF 08 FF 00
	sbc $00FF08.l,X		; FF 08 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $ABABFF.l,X		; FF FF AB AB
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	stp		; DB
	stp		; DB
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF51.l,X		; FF 51 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $3C3CFF.l,X		; FF FF 3C 3C
	inc $FDFE.w,X		; FE FE FD
	sbc $3C3C.w,X		; FD 3C 3C
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $A9A9FF.l,X		; FF FF A9 A9
	lda $8DAD.w		; AD AD 8D
	sta $ADAD.w		; 8D AD AD
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta ($FF.b)		; 92 FF
	dec $FF.b,X		; D6 FF
	cmp ($FF.b)		; D2 FF
	stx $FF.b,Y		; 96 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sta ($6D.b)		; 92 6D
	dec $69.b,X		; D6 69
	cmp ($6D.b)		; D2 6D
	stx $69.b,Y		; 96 69
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	lsr A		; 4A
	sbc $58FFC8.l,X		; FF C8 FF 58
	sbc $FFFFCA.l,X		; FF CA FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $4A.b		; 00 4A
	lda $C8.b,X		; B5 C8
	and [$58.b],Y		; 37 58
	lda [$CA.b]		; A7 CA
	and $FF.b,X		; 35 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $B3FF93.l,X		; FF 93 FF B3
	sbc $93FF97.l,X		; FF 97 FF 93
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $93.b		; 00 93
	jmp ($4CB3.w)		; 6C B3 4C
	sta [$68.b],Y		; 97 68
	sta ($6C.b,S),Y		; 93 6C
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $F0F0FF.l,X		; FF FF F0 F0
	adc [$F7.b],Y		; 77 F7
	beq -16.b		; F0 F0
	ror $F0FE.w,X		; 7E FE F0
	beq  -1.b		; F0 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $84FFFF.l,X		; FF FF FF 84
	sty $B5.b		; 84 B5
	lda $84.b,X		; B5 84
	sty $BD.b		; 84 BD
	lda $BCBC.w,X		; BD BC BC
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $4444FF.l,X		; FF FF 44 44
	cmp $45DD.w,X		; DD DD 45
	eor $DD.b		; 45 DD
	cmp $4444.w,X		; DD 44 44
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $6B6BFF.l,X		; FF FF 6B 6B
	lda #$A9.b		; A9 A9
	tax		; AA
	tax		; AA
	plb		; AB
	plb		; AB
	rtl		; 6B

	rtl		; 6B

	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $40FF00.l,X		; FF 00 FF 40
	sbc $02FF00.l,X		; FF 00 FF 02
	sbc $40FF01.l,X		; FF 01 FF 40
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $6363FF.l,X		; FF FF 63 63
	eor $53535F.l,X		; 5F 5F 53 53
	tad		; 5B
	tad		; 5B
	adc $63.b,S		; 63 63
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $20FF00.l,X		; FF 00 FF 20
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $20FF00.l,X		; FF 00 FF 20
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	txa		; 8A
	sbc $96FFA9.l,X		; FF A9 FF 96
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $8A.b		; 00 8A
	adc $A9.b,X		; 75 A9
	lsr $96.b,X		; 56 96
	adc #$FF.b		; 69 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $67FFAD.l,X		; FF AD FF 67
	sbc $FFFF9D.l,X		; FF 9D FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $AD.b		; 00 AD
	eor ($67.b)		; 52 67
	tya		; 98
	sta $FF62.w,X		; 9D 62 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C1D6D6.l,X		; FF D6 D6 C1
	cmp ($B5.b,X)		; C1 B5
	lda $EF.b,X		; B5 EF
	sbc $00FFFF.l		; EF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $7BBFBB.l,X		; FF BB BF 7B
	adc $6FBFBB.l,X		; 7F BB BF 6F
	adc $00FFFF.l		; 6F FF FF 00
	sbc $FB04FB.l,X		; FF FB 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FF.b		; 04 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $2FFFFF.l,X		; FF FF FF 2F
	sbc $A2FF6B.l,X		; FF 6B FF A2
	sbc $78FFFF.l,X		; FF FF FF 78
	adc $00FFFB.l,X		; 7F FB FF 00
	sbc $2F00FF.l,X		; FF FF 00 2F
	bne 107.b		; D0 6B
	sty $A2.b,X		; 94 A2
	cmp $00FF.w,X		; DD FF 00
	sed		; F8
	ora [$FB.b]		; 07 FB
	tsb $00.b		; 04 00
	sbc $77FFFF.l,X		; FF FF FF 77
	sbc $C7FF37.l,X		; FF 37 FF C7
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $7700FF.l,X		; FF FF 00 77
	dey		; 88
	and [$E8.b],Y		; 37 E8
	cmp [$B8.b]		; C7 B8
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFDAFF.l,X		; FF FF DA FF
	tay		; A8
	sbc $FFFFAA.l,X		; FF AA FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $DA.b		; 00 DA
	adc $A8.b,X		; 75 A8
	eor [$AA.b],Y		; 57 AA
	eor $FF.b,X		; 55 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $ABFFFF.l,X		; FF FF FF AB
	sbc $ABFFB3.l,X		; FF B3 FF AB
	sbc $00FFFF.l,X		; FF FF FF 00
	jsr ($BBBB.w,X)		; FC BB BB
	brk $FF.b		; 00 FF
	sbc $54AB00.l,X		; FF 00 AB 54
	lda ($5C.b,S),Y		; B3 5C
	plb		; AB
	mvn $00,$FF		; 54 FF 00
	ora $FC.b,S		; 03 FC
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF57FF.l,X		; FF FF 57 FF
	lda [$FF.b],Y		; B7 FF
	sbc $ACFD.w,X		; FD FD AC
	jsr ($FE56.w,X)		; FC 56 FE
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $A85700.l,X		; FF 00 57 A8
	lda [$48.b],Y		; B7 48
	sbc $50AF00.l,X		; FF 00 AF 50
	eor [$A8.b],Y		; 57 A8
	sbc $FF0000.l,X		; FF 00 00 FF
	inc $EEFF.w,X		; FE FF EE
	sbc $BEDFDE.l		; EF DE DF BE
	lda $FE7F7E.l,X		; BF 7E 7F FE
	sbc $00FFFE.l,X		; FF FE FF 00
	sbc $FE01FE.l,X		; FF FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($00.b,X)		; 01 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $03FFFB.l,X		; FF FB FF 03
	jsr ($04FB.w,X)		; FC FB 04
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $8D.b		; 04 8D
	sbc $76FF55.l,X		; FF 55 FF 76
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $55FF8E.l,X		; FF 8E FF 55
	sbc $8DFF76.l,X		; FF 76 FF 8D
	adc ($55.b)		; 72 55
	tax		; AA
	ror $89.b,X		; 76 89
	sbc $00FF00.l,X		; FF 00 FF 00
	stx $5571.w		; 8E 71 55
	tax		; AA
	ror $89.b,X		; 76 89
	adc $FF57FF.l		; 6F FF 57 FF
	cmp $FF.b,X		; D5 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $FFD7FF.l		; 6F FF D7 FF
	eor $FF.b,X		; 55 FF
	adc $A85790.l		; 6F 90 57 A8
	cmp $2A.b,X		; D5 2A
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $28D790.l		; 6F 90 D7 28
	eor $AA.b,X		; 55 AA
	cmp ($D7.b,X)		; C1 D7
	cmp $E7.b		; C5 E7
	eor ($CB.b,X)		; 41 CB
	cmp $BFDD.w,X		; DD DD BF
	lda $DDFFC1.l,X		; BF C1 FF DD
	sbc $E9FF41.l,X		; FF 41 FF E9
	asl $DD.b,X		; 16 DD
	jsl $FF8A75.l		; 22 75 8A FF
	brk $FF.b		; 00 FF
	brk $C1.b		; 00 C1
	rol $22DD.w,X		; 3E DD 22
	eor ($BE.b,X)		; 41 BE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFC0FF.l,X		; FF FF C0 FF
	sbc $FBFBFF.l,X		; FF FF FB FB
	inc $F6.b,X		; F6 F6
	sbc ($F2.b)		; F2 F2
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3FC000.l,X		; FF 00 C0 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	lda $3333BF.l,X		; BF BF 33 33
	lda #$A9.b		; A9 A9
	and #$29.b		; 29 29
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FEFF.w,X		; FE FF FE
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $BFFFFF.l,X		; FF FF FF BF
	lda $85AFAF.l,X		; BF AF AF 85
	sta $FE.b		; 85 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	sbc $FBFFA8.l,X		; FF A8 FF FB
	sbc $EFFF00.l,X		; FF 00 FF EF
	sbc $AFBFBF.l,X		; FF BF BF AF
	lda $AA8585.l		; AF 85 85 AA
	eor $A8.b,X		; 55 A8
	eor [$FB.b],Y		; 57 FB
	tsb $00.b		; 04 00
	sbc $FF10EF.l,X		; FF EF 10 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AB.b		; 00 AB
	sbc $FBFFAB.l,X		; FF AB FF FB
	sbc $FBFF7B.l,X		; FF 7B FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $ABFFFB.l,X		; FF FB FF AB
	mvn $54,$AB		; 54 AB 54
	xce		; FB
	tsb $7B.b		; 04 7B
	sty $FB.b		; 84 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $55.b		; 04 55
	sbc $FFFFAC.l,X		; FF AC FF FF
	sbc $1BFFFF.l,X		; FF FF FF 1B
	sbc $75FF35.l,X		; FF 35 FF 75
	sbc $55FFFF.l,X		; FF FF FF 55
	tax		; AA
	ldy $FF53.w		; AC 53 FF
	brk $FF.b		; 00 FF
	brk $1B.b		; 00 1B
	cpx $35.b		; E4 35
	dex		; CA
	adc $8A.b,X		; 75 8A
	sbc $FFD700.l,X		; FF 00 D7 FF
	eor $FF.b,X		; 55 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	lda $FF5FFF.l,X		; BF FF 5F FF
	eor $FF.b,X		; 55 FF
	sbc $28D7FF.l,X		; FF FF D7 28
	eor $AA.b,X		; 55 AA
	sbc $00FF00.l,X		; FF 00 FF 00
	lda $A05F40.l,X		; BF 40 5F A0
	eor $AA.b,X		; 55 AA
	sbc $FFDD00.l,X		; FF 00 DD FF
	eor ($FF.b,X)		; 41 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cmp ($FF.b,X)		; C1 FF
	cmp $41FF.w,X		; DD FF 41
	sbc $DDFFFF.l,X		; FF FF FF DD
	jsl $FFBE41.l		; 22 41 BE FF
	brk $FF.b		; 00 FF
	brk $C1.b		; 00 C1
	rol $22DD.w,X		; 3E DD 22
	eor ($BE.b,X)		; 41 BE
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $00FF.w,X		; FE FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($00.b,X)		; 01 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF08.l,X		; FF 08 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	sbc [$03.b],Y		; F7 03
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $BBFFBB.l,X		; FF BB FF BB
	sbc $03FF8B.l,X		; FF 8B FF 03
	jsr ($04FB.w,X)		; FC FB 04
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $BB.b		; 04 BB
	mvp $44,$BB		; 44 BB 44
	phb		; 8B
	stz $FF.b,X		; 74 FF
	sbc $91FFFF.l,X		; FF FF FF 91
	sbc $9BFF7B.l,X		; FF 7B FF 9B
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFF75.l,X		; FF 75 FF FF
	brk $FF.b		; 00 FF
	brk $91.b		; 00 91
	ror $847B.w		; 6E 7B 84
	txy		; 9B
	stz $FF.b		; 64 FF
	brk $FF.b		; 00 FF
	brk $75.b		; 00 75
	txa		; 8A
	sbc $FFFFFF.l,X		; FF FF FF FF
	lda $FF5FFF.l,X		; BF FF 5F FF
	eor $FF.b,X		; 55 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l		; EF FF FF 00
	sbc $40BF00.l,X		; FF 00 BF 40
	eor $AA55A0.l,X		; 5F A0 55 AA
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF10.l		; EF 10 FF FF
	sbc $FFC1FF.l,X		; FF FF C1 FF
	cmp $41FF.w,X		; DD FF 41
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFC1.l,X		; FF C1 FF FF
	brk $FF.b		; 00 FF
	brk $C1.b		; 00 C1
	rol $22DD.w,X		; 3E DD 22
	eor ($BE.b,X)		; 41 BE
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp ($3E.b,X)		; C1 3E
	cpy #$FFFF.w		; C0 FF FF
	sbc $E3F5F5.l,X		; FF F5 F5 E3
	sbc $F4.b,S		; E3 F4
	pea $F9C0.w		; F4 C0 F9
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FF3F.w		; C0 3F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C6.b		; 00 C6
	and $00FF.w,Y		; 39 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $F7F7FF.l,X		; FF FF F7 F7
	mvn $4B,$54		; 54 54 4B
	phk		; 4B
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	dec $D6.b,X		; D6 D6
	eor #$49.b		; 49 49
	brk $FF.b		; 00 FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	dec $D6.b,X		; D6 D6
	eor #$49.b		; 49 49
	brk $FF.b		; 00 FF
	sbc $07F9.w,Y		; F9 F9 07
	ora [$00.b]		; 07 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $7B.b		; 00 7B
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FBFFFB.l,X		; FF FB FF FB
	sbc $FFFF78.l,X		; FF 78 FF FF
	sbc $7B7F7F.l,X		; FF 7F 7F 7B
	sty $FB.b		; 84 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $78.b		; 04 78
	sta [$FF.b]		; 87 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $77FF79.l,X		; FF 79 FF 77
	sbc $FFFF19.l,X		; FF 19 FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $79.b		; 00 79
	stx $77.b		; 86 77
	dey		; 88
	ora $FFE6.w,Y		; 19 E6 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $5FFFBF.l,X		; FF BF FF 5F
	sbc $FFFF55.l,X		; FF 55 FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFEFEF.l,X		; FF EF EF FF
	brk $BF.b		; 00 BF
	rti		; 40

	eor $AA55A0.l,X		; 5F A0 55 AA
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFC1FF.l,X		; FF FF C1 FF
	cmp $41FF.w,X		; DD FF 41
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C100FF.l,X		; FF FF 00 C1
	rol $22DD.w,X		; 3E DD 22
	eor ($BE.b,X)		; 41 BE
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF92FF.l,X		; FF FF 92 FF
	dec $FF.b,X		; D6 FF
	cmp ($FF.b)		; D2 FF
	stx $FF.b,Y		; 96 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sta ($6D.b)		; 92 6D
	dec $69.b,X		; D6 69
	cmp ($6D.b)		; D2 6D
	stx $69.b,Y		; 96 69
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	eor ($FF.b)		; 52 FF
	dec $FF.b,X		; D6 FF
	lsr $FF.b,X		; 56 FF
	cmp ($FF.b)		; D2 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	eor ($AD.b)		; 52 AD
	dec $29.b,X		; D6 29
	lsr $A9.b,X		; 56 A9
	cmp ($2D.b)		; D2 2D
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	eor $FF57FF.l		; 4F FF 57 FF
	cmp $FF57FF.l		; CF FF 57 FF
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $4F.b		; 00 4F
	clv		; B8
	eor [$A8.b],Y		; 57 A8
	cmp $A85738.l		; CF 38 57 A8
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	brk $CF.b		; 00 CF
	cmp $DBEDED.l		; CF ED ED DB
	stp		; DB
	bra -128.b		; 80 80
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $B9B9FF.l,X		; FF FF B9 B9
	ora $15.b,X		; 15 15
.ACCU 8
	sep #$E2		; E2 E2
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3D3DFF.l,X		; FF FF 3D 3D
	tad		; 5B
	tad		; 5B
	rol $26.b		; 26 26
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $1515DF.l,X		; DF DF 15 15
	ldy $42AC.w		; AC AC 42
	.db $42, $FF		; 42 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $5F.b		; 00 5F
	eor $8D1717.l,X		; 5F 17 17 8D
	sta $5353.w		; 8D 53 53
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sty $FF.b,X		; 94 FF
	lda $FF.b,X		; B5 FF
	pei ($FF.b)		; D4 FF
	sty $FF.b,X		; 94 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sty $6B.b,X		; 94 6B
	lda $4A.b,X		; B5 4A
	pei ($6B.b)		; D4 6B
	sty $6B.b,X		; 94 6B
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	lda #$FF.b		; A9 FF
	bit #$FF.b		; 89 FF
	phb		; 8B
	sbc $FFFFA9.l,X		; FF A9 FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $A9.b		; 00 A9
	lsr $89.b,X		; 56 89
	ror $8B.b,X		; 76 8B
	stz $A9.b,X		; 74 A9
	lsr $FF.b,X		; 56 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $F8FF3F.l,X		; FF 3F FF F8
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	cpy #$C03F.w		; C0 3F C0
	and $C03FC0.l,X		; 3F C0 3F C0
	sed		; F8
	ora [$00.b]		; 07 00
	brk $DF.b		; 00 DF
	cmp $7AAFAF.l,X		; DF AF AF 7A
	ply		; 7A
	ror $76.b,X		; 76 76
	dey		; 88
	dey		; 88
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	xce		; FB
	xce		; FB
	sbc [$F7.b],Y		; F7 F7
	cpx $E4.b		; E4 E4
	rtl		; 6B

	rtl		; 6B

	ldy $FFAC.w		; AC AC FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $87FFFF.l,X		; FF FF FF 87
	sta [$6D.b]		; 87 6D
	adc $DEDE.w		; 6D DE DE
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $DBDBEF.l		; EF EF DB DB
	cmp [$D7.b],Y		; D7 D7
	stx $748E.w		; 8E 8E 74
	stz $FF.b,X		; 74 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	adc $57BBBB.l,X		; 7F BB BB 57
	eor [$FF.b],Y		; 57 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $010000.l,X		; FF 00 00 01
	brk $01.b		; 00 01
	brk $BF.b		; 00 BF
	cmp $EB.b,S		; C3 EB
	sbc ($BF.b),Y		; F1 BF
	sbc $00FFEB.l,X		; FF EB FF 00
	php		; 08
	brk $00.b		; 00 00
	pha		; 48
	pha		; 48
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	bcc -112.b		; 90 90
	brk $00.b		; 00 00
	sei		; 78
	pha		; 48
	iny		; C8
	bra -120.b		; 80 88
	brk $88.b		; 00 88
	brk $88.b		; 00 88
	brk $98.b		; 00 98
	php		; 08
	beq -112.b		; F0 90
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cpy $C1.b		; C4 C1
	xba		; EB
	sbc ($BF.b),Y		; F1 BF
	sbc $00FFEB.l,X		; FF EB FF 00
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	jsr $0040.w		; 20 40 00
	cpx #$0000.w		; E0 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $BF.b		; 00 BF
	cmp $EB.b,S		; C3 EB
	sbc ($BF.b),Y		; F1 BF
	sbc $00FFEB.l,X		; FF EB FF 00
	php		; 08
	brk $00.b		; 00 00
	pha		; 48
	pha		; 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	pha		; 48
	pha		; 48
	brk $08.b		; 00 08
	brk $18.b		; 00 18
	php		; 08
	bmi  16.b		; 30 10
	rti		; 40

	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $BF.b		; 00 BF
	cmp $EB.b,S		; C3 EB
	sbc ($BF.b),Y		; F1 BF
	sbc $00FFEB.l,X		; FF EB FF 00
	php		; 08
	brk $00.b		; 00 00
	pha		; 48
	pha		; 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dey		; 88
	dey		; 88
	brk $00.b		; 00 00
	sei		; 78
	pha		; 48
	pha		; 48
	brk $08.b		; 00 08
	brk $30.b		; 00 30
	brk $08.b		; 00 08
	brk $88.b		; 00 88
	brk $F8.b		; 00 F8
	dey		; 88
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	lda $F1EBC4.l,X		; BF C4 EB F1
	lda $FFEBFF.l,X		; BF FF EB FF
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	plp		; 28
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2400.w		; 20 00 24
	brk $6C.b		; 00 6C
	plp		; 28
	pha		; 48
	brk $FC.b		; 00 FC
	bra  16.b		; 80 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $BF.b		; 00 BF
	cmp $EB.b,S		; C3 EB
	sbc ($BF.b),Y		; F1 BF
	sbc $00FFEB.l,X		; FF EB FF 00
	php		; 08
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	dey		; 88
	dey		; 88
	brk $00.b		; 00 00
	sei		; 78
	rti		; 40

	rti		; 40

	brk $70.b		; 00 70
	bpl  24.b		; 10 18
	php		; 08
	php		; 08
	brk $98.b		; 00 98
	bpl  -8.b		; 10 F8
	dey		; 88
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	lda $F1EBC3.l,X		; BF C3 EB F1
	lda $FFEBFF.l,X		; BF FF EB FF
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dey		; 88
	dey		; 88
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	dey		; 88
	dey		; 88
	brk $00.b		; 00 00
	sec		; 38
	brk $40.b		; 00 40
	brk $F8.b		; 00 F8
	dey		; 88
	tya		; 98
	bpl -120.b		; 10 88
	brk $98.b		; 00 98
	bpl  -8.b		; 10 F8
	dey		; 88
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	lda $F1EBC4.l,X		; BF C4 EB F1
	lda $FFEBFF.l,X		; BF FF EB FF
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	tsb $04.b		; 04 04
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($C400.w,X)		; 7C 00 C4
	rti		; 40

	tsb $1804.w		; 0C 04 18
	php		; 08
	bpl   0.b		; 10 00
	bmi  16.b		; 30 10
	jsr $0000.w		; 20 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $BF.b		; 00 BF
	cmp $EB.b,S		; C3 EB
	sbc ($BF.b),Y		; F1 BF
	sbc $00FFEB.l,X		; FF EB FF 00
	php		; 08
	brk $00.b		; 00 00
	pha		; 48
	pha		; 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tay		; A8
	tay		; A8
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	dey		; 88
	dey		; 88
	brk $00.b		; 00 00
	sei		; 78
	pha		; 48
	pha		; 48
	brk $30.b		; 00 30
	brk $F8.b		; 00 F8
	tay		; A8
	dey		; 88
	brk $98.b		; 00 98
	bpl  -8.b		; 10 F8
	dey		; 88
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	lda $F1EBC3.l,X		; BF C3 EB F1
	lda $FFEBFF.l,X		; BF FF EB FF
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	dey		; 88
	dey		; 88
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	dey		; 88
	dey		; 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	dey		; 88
	iny		; C8
	rti		; 40

	dey		; 88
	brk $C8.b		; 00 C8
	rti		; 40

	sed		; F8
	dey		; 88
	bpl   0.b		; 10 00
	cpx #$0000.w		; E0 00 00
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	sty $40.b		; 84 40
	cop $00.b		; 02 00
	sta $F0.b		; 85 F0
	tsb $00.b		; 04 00
	stx $28.b		; 86 28
	php		; 08
	brk $88.b		; 00 88
	beq  11.b		; F0 0B
	brk $88.b		; 00 88
	clv		; B8
	ora $048800.l		; 0F 00 88 04
	bra  16.b		; 80 10
	brk $E3.b		; 00 E3
	jsl $E3F3F9.l		; 22 F9 F3 E3
	sbc $00FFF9.l,X		; FF F9 FF 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	sbc $02FFF9.l,X		; FF F9 FF 02
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	brk $F9.b		; 00 F9
	sbc $000004.l,X		; FF 04 00 00
	brk $19.b		; 00 19
	brk $F9.b		; 00 F9
	sbc $000006.l,X		; FF 06 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E2.b		; 00 E2
	brk $F7.b		; 00 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $6A.b		; 00 6A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $78.b		; 00 78
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $57.b		; 00 57
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $9B.b		; 00 9B
	brk $F7.b		; 00 F7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $DF.b		; 00 DF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $22.b,S		; E3 22
	inc $E3FF.w		; EE FF E3
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	sbc $000004.l,X		; FF 04 00 00
	brk $13.b		; 00 13
	brk $F0.b		; 00 F0
	sbc $000006.l,X		; FF 06 00 00
	brk $E3.b		; 00 E3
	sbc $08FFE0.l,X		; FF E0 FF 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($1C00.w,X)		; FC 00 1C
	brk $B8.b		; 00 B8
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $F0.b		; 00 F0
	brk $D0.b		; 00 D0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $18.b		; 00 18
	brk $FE.b		; 00 FE
	brk $DF.b		; 00 DF
	brk $E7.b		; 00 E7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $97.b		; 00 97
	brk $F7.b		; 00 F7
	brk $38.b		; 00 38
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $9F.b		; 00 9F
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
	brk $30.b		; 00 30
	brk $F0.b		; 00 F0
	brk $60.b		; 00 60
	brk $71.b		; 00 71
	brk $FE.b		; 00 FE
	brk $9E.b		; 00 9E
	brk $10.b		; 00 10
	brk $1C.b		; 00 1C
	brk $78.b		; 00 78
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $F3.b		; 00 F3
	brk $FF.b		; 00 FF
	brk $9F.b		; 00 9F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $78.b		; 00 78
	brk $24.b		; 00 24
	brk $87.b		; 00 87
	brk $CF.b		; 00 CF
	brk $77.b		; 00 77
	brk $46.b		; 00 46
	brk $38.b		; 00 38
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $01.b		; 00 01
	brk $A1.b		; 00 A1
	brk $F3.b		; 00 F3
	brk $CB.b		; 00 CB
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $1E.b		; 00 1E
	brk $9F.b		; 00 9F
	brk $CD.b		; 00 CD
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $BC.b		; 00 BC
	brk $B4.b		; 00 B4
	brk $F9.b		; 00 F9
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $3C.b		; 00 3C
	brk $BF.b		; 00 BF
	brk $FE.b		; 00 FE
	brk $BE.b		; 00 BE
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $5E.b		; 00 5E
	brk $81.b		; 00 81
	brk $D9.b		; 00 D9
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C3.b		; 00 C3
	brk $C2.b		; 00 C2
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $C3.b		; 00 C3
	brk $C7.b		; 00 C7
	brk $1A.b		; 00 1A
	brk $C0.b		; 00 C0
	brk $E7.b		; 00 E7
	brk $E2.b		; 00 E2
	brk $E1.b		; 00 E1
	brk $F3.b		; 00 F3
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $8E.b		; 00 8E
	brk $C0.b		; 00 C0
	brk $42.b		; 00 42
	brk $39.b		; 00 39
	brk $1C.b		; 00 1C
	brk $0D.b		; 00 0D
	brk $1E.b		; 00 1E
	brk $9F.b		; 00 9F
	brk $DF.b		; 00 DF
	brk $EF.b		; 00 EF
	brk $FE.b		; 00 FE
	brk $BF.b		; 00 BF
	brk $BF.b		; 00 BF
	brk $67.b		; 00 67
	brk $6F.b		; 00 6F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $47.b		; 00 47
	brk $8F.b		; 00 8F
	brk $8F.b		; 00 8F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
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
	asl $80.b		; 06 80
	clc		; 18
	brk $E3.b		; 00 E3
	jsl $E3FFED.l		; 22 ED FF E3
	sbc $00FFF0.l,X		; FF F0 FF 00
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $02FFF0.l,X		; FF F0 FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	sbc $000004.l,X		; FF 04 00 00
	brk $13.b		; 00 13
	brk $F0.b		; 00 F0
	sbc $000006.l,X		; FF 06 00 00
	brk $E3.b		; 00 E3
	sbc $08FFE0.l,X		; FF E0 FF 08
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	brk $E0.b		; 00 E0
	sbc $00000A.l,X		; FF 0A 00 00
	brk $00.b		; 00 00
	sbc $00C200.l,X		; FF 00 C2 00
	sbc ($00.b),Y		; F1 00
	jsr ($FE00.w,X)		; FC 00 FE
	brk $E3.b		; 00 E3
	brk $E0.b		; 00 E0
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $7C.b		; 00 7C
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $3C.b		; 00 3C
	brk $79.b		; 00 79
	brk $61.b		; 00 61
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $E1.b		; 00 E1
	brk $0F.b		; 00 0F
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $F1.b		; 00 F1
	brk $F1.b		; 00 F1
	brk $F3.b		; 00 F3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $3C.b		; 00 3C
	brk $8E.b		; 00 8E
	brk $27.b		; 00 27
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $7E.b		; 00 7E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $0E.b		; 00 0E
	brk $01.b		; 00 01
	brk $80.b		; 00 80
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $CD.b		; 00 CD
	brk $E3.b		; 00 E3
	brk $FB.b		; 00 FB
	brk $1F.b		; 00 1F
	brk $37.b		; 00 37
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $E1.b		; 00 E1
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	brk $DF.b		; 00 DF
	brk $F9.b		; 00 F9
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $87.b		; 00 87
	brk $97.b		; 00 97
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $BF.b		; 00 BF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $35.b		; 00 35
	brk $2F.b		; 00 2F
	brk $7B.b		; 00 7B
	brk $73.b		; 00 73
	brk $F8.b		; 00 F8
	brk $E3.b		; 00 E3
	brk $CF.b		; 00 CF
	brk $7B.b		; 00 7B
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	brk $F3.b		; 00 F3
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0C.b		; 00 0C
	brk $6F.b		; 00 6F
	brk $FF.b		; 00 FF
	brk $A9.b		; 00 A9
	brk $E1.b		; 00 E1
	brk $37.b		; 00 37
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F9.b		; 00 F9
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $D1.b		; 00 D1
	brk $84.b		; 00 84
	brk $03.b		; 00 03
	brk $8E.b		; 00 8E
	brk $AF.b		; 00 AF
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $F3.b		; 00 F3
	brk $EF.b		; 00 EF
	brk $DF.b		; 00 DF
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F5.b		; 00 F5
	brk $74.b		; 00 74
	brk $F8.b		; 00 F8
	brk $39.b		; 00 39
	brk $93.b		; 00 93
	brk $C0.b		; 00 C0
	brk $E3.b		; 00 E3
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F3.b		; 00 F3
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	brk $E1.b		; 00 E1
	brk $E3.b		; 00 E3
	brk $E3.b		; 00 E3
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $9F.b		; 00 9F
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $C3.b		; 00 C3
	brk $9F.b		; 00 9F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $F1.b		; 00 F1
	brk $E7.b		; 00 E7
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F3.b		; 00 F3
	brk $F7.b		; 00 F7
	brk $C7.b		; 00 C7
	brk $BF.b		; 00 BF
	brk $BF.b		; 00 BF
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $82.b		; 00 82
	brk $CF.b		; 00 CF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	brk $FF.b		; 00 FF
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
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	php		; 08
	bra  28.b		; 80 1C
	brk $E3.b		; 00 E3
	jsl $13FFED.l		; 22 ED FF 13
	brk $ED.b		; 00 ED
	sbc $000000.l,X		; FF 00 00 00
	brk $13.b		; 00 13
	brk $FD.b		; 00 FD
	sbc $000002.l,X		; FF 02 00 00
	brk $03.b		; 00 03
	brk $ED.b		; 00 ED
	sbc $000004.l,X		; FF 04 00 00
	brk $03.b		; 00 03
	brk $FD.b		; 00 FD
	sbc $000006.l,X		; FF 06 00 00
	brk $F3.b		; 00 F3
	sbc $08FFF0.l,X		; FF F0 FF 08
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $02FFE0.l,X		; FF E0 FF 02
	bra   0.b		; 80 00
	brk $E3.b		; 00 E3
	sbc $0AFFED.l,X		; FF ED FF 0A
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	sbc $0CFFFD.l,X		; FF FD FF 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $007F00.l,X		; FF 00 7F 00
	ora $00DF00.l,X		; 1F 00 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sei		; 78
	brk $FD.b		; 00 FD
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
	brk $E7.b		; 00 E7
	brk $2F.b		; 00 2F
	brk $0F.b		; 00 0F
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $9F.b		; 00 9F
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $C7.b		; 00 C7
	brk $9F.b		; 00 9F
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
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $C4.b		; 00 C4
	brk $E1.b		; 00 E1
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F3.b		; 00 F3
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
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
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $9F.b		; 00 9F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $87.b		; 00 87
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C1.b		; 00 C1
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FB.b		; 00 FB
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
	brk $C7.b		; 00 C7
	brk $F3.b		; 00 F3
	brk $F4.b		; 00 F4
	brk $12.b		; 00 12
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $F4.b		; 00 F4
	brk $7D.b		; 00 7D
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
	brk $CF.b		; 00 CF
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
	brk $FF.b		; 00 FF
	brk $F1.b		; 00 F1
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
	brk $EB.b		; 00 EB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $B9.b		; 00 B9
	brk $C3.b		; 00 C3
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
	brk $1F.b		; 00 1F
	brk $77.b		; 00 77
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C7.b		; 00 C7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7D.b		; 00 7D
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $EF.b		; 00 EF
	brk $8F.b		; 00 8F
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	brk $F9.b		; 00 F9
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
	brk $F3.b		; 00 F3
	brk $87.b		; 00 87
	brk $B3.b		; 00 B3
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	brk $DC.b		; 00 DC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C7.b		; 00 C7
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $F9.b		; 00 F9
	brk $EF.b		; 00 EF
	brk $0F.b		; 00 0F
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
	brk $4F.b		; 00 4F
	brk $E7.b		; 00 E7
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $87.b		; 00 87
	brk $F3.b		; 00 F3
	brk $F8.b		; 00 F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  28.b		; 80 1C
	brk $E3.b		; 00 E3
	jsl $E3FFED.l		; 22 ED FF E3
	sbc $00FFED.l,X		; FF ED FF 00
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	sbc $02FFFD.l,X		; FF FD FF 02
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $04FFED.l,X		; FF ED FF 04
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $06FFFD.l,X		; FF FD FF 06
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $ED.b		; 00 ED
	sbc $000008.l,X		; FF 08 00 00
	brk $03.b		; 00 03
	brk $FD.b		; 00 FD
	sbc $00000A.l,X		; FF 0A 00 00
	brk $13.b		; 00 13
	brk $F0.b		; 00 F0
	sbc $00000C.l,X		; FF 0C 00 00
	brk $13.b		; 00 13
	brk $E0.b		; 00 E0
	sbc $008006.l,X		; FF 06 80 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FE00.w,Y		; F9 00 FE
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $71.b		; 00 71
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
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
	brk $F1.b		; 00 F1
	brk $3C.b		; 00 3C
	brk $FF.b		; 00 FF
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
	brk $9F.b		; 00 9F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $F7.b		; 00 F7
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E3.b		; 00 E3
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $87.b		; 00 87
	brk $F7.b		; 00 F7
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
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $FE.b		; 00 FE
	brk $F3.b		; 00 F3
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
	brk $F3.b		; 00 F3
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
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
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BD.b		; 00 BD
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $8E.b		; 00 8E
	brk $77.b		; 00 77
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $7F.b		; 00 7F
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $3F.b		; 00 3F
	brk $9F.b		; 00 9F
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
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $31.b		; 00 31
	brk $BC.b		; 00 BC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	brk $9C.b		; 00 9C
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $C3.b		; 00 C3
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
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
	brk $E8.b		; 00 E8
	brk $C7.b		; 00 C7
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $7F.b		; 00 7F
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	brk $9F.b		; 00 9F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	php		; 08
	bra  24.b		; 80 18
	brk $E3.b		; 00 E3
	jsl $E3FFED.l		; 22 ED FF E3
	sbc $00FFED.l,X		; FF ED FF 00
	brk $00.b		; 00 00
	brk $E3.b		; 00 E3
	sbc $02FFFD.l,X		; FF FD FF 02
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $04FFED.l,X		; FF ED FF 04
	brk $00.b		; 00 00
	brk $F3.b		; 00 F3
	sbc $02FFFD.l,X		; FF FD FF 02
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $ED.b		; 00 ED
	sbc $000006.l,X		; FF 06 00 00
	brk $03.b		; 00 03
	brk $FD.b		; 00 FD
	sbc $000008.l,X		; FF 08 00 00
	brk $13.b		; 00 13
	brk $F0.b		; 00 F0
	sbc $00000A.l,X		; FF 0A 00 00
	brk $13.b		; 00 13
	brk $E0.b		; 00 E0
	sbc $008002.l,X		; FF 02 80 00
	brk $00.b		; 00 00
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00BF00.l,X		; FF 00 BF 00
	ora $00F500.l,X		; 1F 00 F5 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sta $007F00.l,X		; 9F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $00FD00.l		; CF 00 FD 00
	jsr ($8E00.w,X)		; FC 00 8E
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E3.b		; 00 E3
	brk $C7.b		; 00 C7
	brk $DC.b		; 00 DC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F9.b		; 00 F9
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E8.b		; 00 E8
	brk $E7.b		; 00 E7
	brk $78.b		; 00 78
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
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $7B.b		; 00 7B
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	brk $F3.b		; 00 F3
	brk $F9.b		; 00 F9
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $E1.b		; 00 E1
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
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
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FA.b		; 00 FA
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
	brk $17.b		; 00 17
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
	brk $87.b		; 00 87
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E3.b		; 00 E3
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	brk $EF.b		; 00 EF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	brk $9F.b		; 00 9F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F1.b		; 00 F1
	brk $E7.b		; 00 E7
	brk $7F.b		; 00 7F
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
	brk $C3.b		; 00 C3
	brk $9F.b		; 00 9F
	brk $3E.b		; 00 3E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $37.b		; 00 37
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
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
	brk $C0.b		; 00 C0
	brk $8F.b		; 00 8F
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DE.b		; 00 DE
	brk $FD.b		; 00 FD
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $3E.b		; 00 3E
	brk $F8.b		; 00 F8
	brk $E1.b		; 00 E1
	brk $DF.b		; 00 DF
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
	brk $DF.b		; 00 DF
	brk $1F.b		; 00 1F
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
	and $25.b,X		; 35 25
	and ($04.b,X)		; 21 04
	brk $20.b		; 00 20
	adc $2C.b,S		; 63 2C
	sbc [$40.b]		; E7 40
	lda $9455.w		; AD 55 94
	ror A		; 6A
	lda $367F.w,X		; BD 7F 36
	rol $53.b,X		; 36 53
	ora ($29.b),Y		; 11 29
	and $6C.b		; 25 6C
	brk $F2.b		; 00 F2
	tsb $25D4.w		; 0C D4 25
	sta $4E7304.l		; 8F 04 73 4E
	bmi   5.b		; 30 05
	brk $00.b		; 00 00
	and ($04.b,X)		; 21 04
	sty $10.b		; 84 10
	dec $18.b		; C6 18
	lsr A		; 4A
	and #$8C.b		; 29 8C
	and ($CE.b),Y		; 31 CE
	and $4210.w,Y		; 39 10 42
	eor ($4A.b)		; 52 4A
	dec $5A.b,X		; D6 5A
	and $9C67.w,Y		; 39 67 9C
	adc ($FF.b,S),Y		; 73 FF
	adc $000000.l,X		; 7F 00 00 00
	brk $42.b		; 00 42
	xce		; FB
	brk $07.b		; 00 07
	asl $B4.b		; 06 B4
	brk $07.b		; 00 07
	asl $E9.b		; 06 E9
	jsl $0000EA.l		; 22 EA 00 00
	xba		; EB
	nop		; EA
	nop		; EA
	cpx $3300.w		; EC 00 33
	sbc $ECEC.w		; ED EC EC
	inc $EBEB.w		; EE EB EB
	sbc $F0EDED.l		; EF ED ED F0
	inc $F1EE.w		; EE EE F1
	brk $18.b		; 00 18
	sbc ($EF.b)		; F2 EF
	sbc $0448F3.l		; EF F3 48 04
	pea $F0F0.w		; F4 F0 F0
	sbc $F1.b,X		; F5 F1
	sbc ($F6.b),Y		; F1 F6
	brk $43.b		; 00 43
	sbc [$32.b],Y		; F7 32
	sbc ($F8.b)		; F2 F8
	brk $25.b		; 00 25
	sbc $F6F6.w,Y		; F9 F6 F6
	plx		; FA
	sbc [$EC.b],Y		; F7 EC
	xce		; FB
	inc $FCEB.w		; EE EB FC
	sed		; F8
	sed		; F8
	sbc $3400.w,X		; FD 00 34
	inc $F5F5.w,X		; FE F5 F5
	sbc $01F3F3.l,X		; FF F3 F3 01
	plx		; FA
	sbc $EA02.w,X		; FD 02 EA
	brk $05.b		; 00 05
	sbc $06F9.w,Y		; F9 F9 06
	tsb $F0.b		; 04 F0
	ora [$32.b]		; 07 32
	rti		; 40

	ora #$F2.b		; 09 F2
	sbc $000A.w		; ED 0A 00
	ora ($0B.b,X)		; 01 0B
	ora [$FB.b]		; 07 FB
	tsb $FCFC.w		; 0C FC FC
	ora $0009.w		; 0D 09 00
	asl $000A.w		; 0E 0A 00
	ora $200B0D.l		; 0F 0D 0B 20
	brk $1C.b		; 00 1C
	brk $08.b		; 00 08
	ora $F4.b,S		; 03 F4
	pea $F4F4.w		; F4 F4 F4
	pea $EAF0.w		; F4 F0 EA
	sbc #$01.b		; E9 01
	brk $E9.b		; 00 E9
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	sbc #$05.b		; E9 05
	brk $E9.b		; 00 E9
	asl $00.b		; 06 00
	sbc #$07.b		; E9 07
	pea $02EB.w		; F4 EB 02
	php		; 08
	brk $E9.b		; 00 E9
	ora #$00.b		; 09 00
	sbc #$0A.b		; E9 0A
	brk $E9.b		; 00 E9
	phd		; 0B
	brk $E9.b		; 00 E9
	tsb $E900.w		; 0C 00 E9
	ora $E900.w		; 0D 00 E9
	asl $EBF4.w		; 0E F4 EB
	brk $E9.b		; 00 E9
	ora $001000.l		; 0F 00 10 00
	ora ($00.b),Y		; 11 00
	ora ($00.b)		; 12 00
	ora ($00.b,S),Y		; 13 00
	trb $00.b		; 14 00
	ora $00.b,X		; 15 00
	asl $F4.b,X		; 16 F4
	cop $17.b		; 02 17
	inc $1900.w,X		; FE 00 19
	brk $1A.b		; 00 1A
	brk $1B.b		; 00 1B
	brk $1C.b		; 00 1C
	brk $1D.b		; 00 1D
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $20.b		; 00 20
	brk $21.b		; 00 21
	brk $22.b		; 00 22
	brk $23.b		; 00 23
	inc $00F1.w,X		; FE F1 00
	ora [$40.b],Y		; 17 40
	beq -21.b		; F0 EB
	bit $0C.b		; 24 0C
	brk $26.b		; 00 26
	brk $27.b		; 00 27
	brk $28.b		; 00 28
	brk $29.b		; 00 29
	brk $2A.b		; 00 2A
	brk $2B.b		; 00 2B
	brk $2C.b		; 00 2C
	brk $2D.b		; 00 2D
	brk $2E.b		; 00 2E
	brk $2F.b		; 00 2F
	brk $30.b		; 00 30
	tsb $00F8.w		; 0C F8 00
	bit $40.b		; 24 40
	beq -21.b		; F0 EB
	ora [$FE.b],Y		; 17 FE
	inc $00F1.w,X		; FE F1 00
	and ($FE.b),Y		; 31 FE
	inc $00F5.w,X		; FE F5 00
	ora [$40.b],Y		; 17 40
	beq -21.b		; F0 EB
	ora ($0D.b,X)		; 01 0D
	ora [$F0.b]		; 07 F0
	nop		; EA
	and $0A.b,X		; 35 0A
	ora $0036EA.l		; 0F EA 36 00
	and [$00.b],Y		; 37 00
	sec		; 38
	asl A		; 0A
	ora $0039EA.l		; 0F EA 39 00
	dec A		; 3A
	cop $01.b		; 02 01
	ora $3C003B.l		; 0F 3B 00 3C
	brk $3D.b		; 00 3D
	cop $01.b		; 02 01
	ora $3F003E.l		; 0F 3E 00 3F
	xba		; EB
	asl A		; 0A
	ora $410040.l		; 0F 40 00 41
	xba		; EB
	brk $42.b		; 00 42
	ora $05.b		; 05 05
	inc $00.b,X		; F6 00
	mvp $05,$05		; 44 05 05
	sbc $4200.w,Y		; F9 00 42
	rti		; 40

	xce		; FB
	eor $00.b		; 45 00
	lsr $00.b		; 46 00
	eor [$02.b]		; 47 02
	ora ($00.b,X)		; 01 00
	sbc $4A0449.l,X		; FF 49 04 4A
	tsb $4B.b		; 04 4B
	tsb $4C.b		; 04 4C
	tsb $FF.b		; 04 FF
	sbc $FB044D.l,X		; FF 4D 04 FB
	nop		; EA
	lsr $4F00.w		; 4E 00 4F
	brk $50.b		; 00 50
	asl $51F3.w		; 0E F3 51
	tsb $52.b		; 04 52
	tsb $53.b		; 04 53
	tsb $54.b		; 04 54
	tsb $55.b		; 04 55
	tsb $56.b		; 04 56
	tsb $FF.b		; 04 FF
	sbc ($4D.b,S),Y		; F3 4D
	tsb $FB.b		; 04 FB
	nop		; EA
	eor [$00.b],Y		; 57 00
	cli		; 58
	brk $59.b		; 00 59
	asl $5AF3.w		; 0E F3 5A
	tsb $5B.b		; 04 5B
	tsb $F3.b		; 04 F3
	jmp $045D04.l		; 5C 04 5D 04
	lsr $5F04.w,X		; 5E 04 5F
	tsb $60.b		; 04 60
	tsb $61.b		; 04 61
	tsb $4D.b		; 04 4D
	asl $62.b		; 06 62
	brk $63.b		; 00 63
	asl $64F3.w		; 0E F3 64
	tsb $65.b		; 04 65
	tsb $F3.b		; 04 F3
	ror $04.b		; 66 04
	adc [$04.b]		; 67 04
	pla		; 68
	tsb $69.b		; 04 69
	tsb $6A.b		; 04 6A
	tsb $6B.b		; 04 6B
	tsb $4D.b		; 04 4D
	asl $6C.b		; 06 6C
	brk $6D.b		; 00 6D
	asl $6EF3.w		; 0E F3 6E
	tsb $6F.b		; 04 6F
	tsb $70.b		; 04 70
	tsb $71.b		; 04 71
	tsb $72.b		; 04 72
	tsb $73.b		; 04 73
	tsb $74.b		; 04 74
	tsb $75.b		; 04 75
	tsb $76.b		; 04 76
	tsb $4D.b		; 04 4D
	asl $EA.b		; 06 EA
	jmp ($770E.w)		; 6C 0E 77
	tsb $78.b		; 04 78
	tsb $79.b		; 04 79
	tsb $7A.b		; 04 7A
	tsb $7B.b		; 04 7B
	tsb $7C.b		; 04 7C
	tsb $7D.b		; 04 7D
	tsb $7E.b		; 04 7E
	tsb $7F.b		; 04 7F
	tsb $80.b		; 04 80
	tsb $81.b		; 04 81
	asl $EB.b		; 06 EB
	ora ($00.b,X)		; 01 00
	sbc $830482.l,X		; FF 82 04 83
	tsb $84.b		; 04 84
	tsb $85.b		; 04 85
	tsb $86.b		; 04 86
	tsb $87.b		; 04 87
	tsb $88.b		; 04 88
	tsb $88.b		; 04 88
	tsb $89.b		; 04 89
	asl $EB.b		; 06 EB
	bit $0C.b		; 24 0C
	tsb $00F8.w		; 0C F8 00
	txa		; 8A
	brk $8B.b		; 00 8B
	tsb $8C.b		; 04 8C
	tsb $8D.b		; 04 8D
	tsb $8E.b		; 04 8E
	tsb $8F.b		; 04 8F
	tsb $90.b		; 04 90
	tsb $91.b		; 04 91
	tsb $92.b		; 04 92
	tsb $93.b		; 04 93
	tsb $94.b		; 04 94
	tsb $95.b		; 04 95
	asl $FB.b		; 06 FB
	stx $00.b,Y		; 96 00
	sta [$00.b],Y		; 97 00
	tya		; 98
	brk $99.b		; 00 99
	brk $9A.b		; 00 9A
	brk $9B.b		; 00 9B
	brk $9C.b		; 00 9C
	brk $9D.b		; 00 9D
	brk $9E.b		; 00 9E
	brk $9F.b		; 00 9F
	brk $A0.b		; 00 A0
	brk $A1.b		; 00 A1
	brk $A2.b		; 00 A2
	brk $A3.b		; 00 A3
	brk $A4.b		; 00 A4
	brk $A5.b		; 00 A5
	brk $A6.b		; 00 A6
	brk $A7.b		; 00 A7
	brk $A8.b		; 00 A8
	beq  -5.b		; F0 FB
	cop $A9.b		; 02 A9
	brk $AA.b		; 00 AA
	brk $AB.b		; 00 AB
	brk $AC.b		; 00 AC
	brk $AD.b		; 00 AD
	brk $AE.b		; 00 AE
	brk $AF.b		; 00 AF
	brk $B0.b		; 00 B0
	brk $B1.b		; 00 B1
	brk $B2.b		; 00 B2
	brk $B3.b		; 00 B3
	brk $B4.b		; 00 B4
	brk $B5.b		; 00 B5
	brk $B6.b		; 00 B6
	brk $B7.b		; 00 B7
	brk $B8.b		; 00 B8
	brk $B9.b		; 00 B9
	brk $BA.b		; 00 BA
	brk $BB.b		; 00 BB
	brk $BC.b		; 00 BC
	brk $BD.b		; 00 BD
	beq  -5.b		; F0 FB
	brk $BE.b		; 00 BE
	brk $BF.b		; 00 BF
	brk $C0.b		; 00 C0
	brk $C1.b		; 00 C1
	brk $C2.b		; 00 C2
	brk $C3.b		; 00 C3
	brk $C4.b		; 00 C4
	brk $C5.b		; 00 C5
	brk $C6.b		; 00 C6
	brk $6C.b		; 00 6C
	cpy #$C7EA.w		; C0 EA C7
	brk $C8.b		; 00 C8
	brk $C9.b		; 00 C9
	brk $CA.b		; 00 CA
	brk $CB.b		; 00 CB
	brk $CC.b		; 00 CC
	brk $CD.b		; 00 CD
	pea $CE00.w		; F4 00 CE
	brk $CF.b		; 00 CF
	brk $D0.b		; 00 D0
	brk $D1.b		; 00 D1
	brk $D2.b		; 00 D2
	brk $D3.b		; 00 D3
	brk $D4.b		; 00 D4
	brk $D5.b		; 00 D5
	brk $D6.b		; 00 D6
	brk $D7.b		; 00 D7
	brk $D8.b		; 00 D8
	brk $D9.b		; 00 D9
	xba		; EB
	brk $DA.b		; 00 DA
	brk $DB.b		; 00 DB
	pea $02EB.w		; F4 EB 02
	jmp.w [$DD00]		; DC 00 DD
	brk $DE.b		; 00 DE
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $E1.b		; 00 E1
	brk $E2.b		; 00 E2
	brk $E3.b		; 00 E3
	brk $E4.b		; 00 E4
	brk $E5.b		; 00 E5
	brk $E6.b		; 00 E6
	brk $E7.b		; 00 E7
	brk $E8.b		; 00 E8
	sbc #$00.b		; E9 00
	brk $42.b		; 00 42
	xce		; FB
	brk $1D.b		; 00 1D
	jsr $00A8.w		; 20 A8 00
	ora $1520.w,X		; 1D 20 15
	eor ($53.b)		; 52 53
	brk $00.b		; 00 00
	.db $62, $00, $FF		; 62 00 FF
	adc [$53.b]		; 67 53
	eor ($B2.b,S),Y		; 53 B2
	sbc $62B3FF.l,X		; FF FF B3 62
	.db $62, $BD, $67		; 62 BD 67
	adc [$D2.b]		; 67 D2
	lda ($B2.b)		; B2 B2
	cmp $B3.b,X		; D5 B3
	lda ($2B.b,S),Y		; B3 2B
	cmp ($D2.b)		; D2 D2
	eor $0053.w		; 4D 53 00
	lsr $B3.b,X		; 56 B3
	.db $62, $65, $BD		; 62 65 BD
	adc [$69.b]		; 67 69
	bra 127.b		; 80 7F
	ror A		; 6A
	sbc $FF6ED5.l,X		; FF D5 6E FF
	bra 119.b		; 80 77
	cop $FD.b		; 02 FD
	adc $0100.w,Y		; 79 00 01
	tda		; 7B
	adc #$69.b		; 69 69
	sty $BD.b,X		; 94 BD
	lda $FE95.w,X		; BD 95 FE
	ora $96.b,S		; 03 96
	ror A		; 6A
	lsr $9A.b,X		; 56 9A
	brk $03.b		; 00 03
	ldx $FF.b		; A6 FF
	.db $62, $AC, $6E		; 62 AC 6E
	ror $77B5.w		; 6E B5 77
	adc [$DD.b],Y		; 77 DD
	sta $95.b,X		; 95 95
	dec $2B2B.w,X		; DE 2B 2B
	sbc #$65.b		; E9 65
	eor $FFEA.w		; 4D EA FF
	inc $80F5.w,X		; FE F5 80
	brk $22.b		; 00 22
	lda $254D.w,X		; BD 4D 25
	brk $0F.b		; 00 0F
	rol A		; 2A
	sed		; F8
	sbc $EAEA2D.l,X		; FF 2D EA EA
	tsa		; 3B
	lda $4C53.w,X		; BD 53 4C
	brk $07.b		; 00 07
	eor ($E0.b),Y		; 51 E0
	sbc $4D6757.l,X		; FF 57 67 4D
	jmp $66B2D2.l		; 5C D2 B2 66
	sbc $006F56.l,X		; FF 56 6F 00
	ora $01017D.l,X		; 1F 7D 01 01
	sta ($7B.b,S),Y		; 93 7B
	tda		; 7B
	sta $B3D5.w,Y		; 99 D5 B3
	txy		; 9B
	ror A		; 6A
	.db $62, $9C, $AC		; 62 9C AC
	ldy $B59D.w		; AC 9D B5
	lda $A5.b,X		; B5 A5
	cmp $AADD.w,X		; DD DD AA
	ora $FF.b,S		; 03 FF
	plb		; AB
	cpy #$AE00.w		; C0 00 AE
	beq  -1.b		; F0 FF
	lda ($00.b),Y		; B1 00
	adc $B649B8.l,X		; 7F B8 49 B6
	tsx		; BA
	ror A		; 6A
	lda ($BC.b,S),Y		; B3 BC
	jsr ($C8FF.w,X)		; FC FF C8
	stx $00.b,Y		; 96 00
	dex		; CA
	ora $00CBFF.l		; 0F FF CB 00
	cop $CC.b		; 02 CC
	brk $20.b		; 00 20
	pei ($1F.b)		; D4 1F
	sbc $EF10D6.l,X		; FF D6 10 EF
.ACCU 8
	sep #$2B		; E2 2B
	lda ($E5.b)		; B2 E5
	eor ($51.b),Y		; 51 51
	ora $A656.w,X		; 1D 56 A6
	and $65.b,S		; 23 65
	eor ($2C.b,S),Y		; 53 2C
	bra -128.b		; 80 80
	and $BC.b,X		; 35 BC
	rol A		; 2A
	bit $FF7F.w,X		; 3C 7F FF
	eor $00.b		; 45 00
	and $D22B4E.l,X		; 3F 4E 2B D2
	cli		; 58
	cpx #$591F.w		; E0 1F 59
	ora [$FF.b]		; 07 FF
	tad		; 5B
	brk $FE.b		; 00 FE
	eor $0065.w,X		; 5D 65 00
	lsr $FF66.w,X		; 5E 66 FF
	rtl		; 6B

	brk $05.b		; 00 05
	jmp ($FF3F.w)		; 6C 3F FF
	adc ($00.b)		; 72 00
	php		; 08
	adc $C1.b,X		; 75 C1
	sbc $900085.l,X		; FF 85 00 90
	txa		; 8A
	brk $F0.b		; 00 F0
	sta ($00.b),Y		; 91 00
	tsb $94.b		; 04 94
	sty $23.b,X		; 94 23
	ora ($07.b,X)		; 01 07
	sty $65.b,X		; 94 65
	and $18.b		; 25 18
	sed		; F8
	sty $3B.b,X		; 94 3B
	tsb $D01F.w		; 0C 1F D0
	beq -108.b		; F0 94
	tsa		; 3B
	phd		; 0B
	adc $94C040.l,X		; 7F 40 C0 94
	lda $0301.w,X		; BD 01 03
.ACCU 16
.INDEX 16
	rep #$FE		; C2 FE
	bit $BD94.w		; 2C 94 BD
	ora ($07.b,X)		; 01 07
	bra  -4.b		; 80 FC
	sty $3B.b,X		; 94 3B
	tsb $401F.w		; 0C 1F 40
	beq -108.b		; F0 94
	sty $BD.b,X		; 94 BD
	cop $03.b		; 02 03
	ora $15.b		; 05 15
	eor $23.b		; 45 23
	ora $BA.b,X		; 15 BA
	jsl $520701.l		; 22 01 07 52
	eor ($2C.b)		; 52 2C
	adc $15.b		; 65 15
	ldy $0822.w		; AC 22 08
	tsb $7646.w		; 0C 46 76
	adc $03.b		; 65 03
	brk $88.b		; 00 88
	jsl $403D20.l		; 22 20 3D 40
	cld		; D8
	adc $02.b		; 65 02
	cpy $0822.w		; CC 22 08
	ror $E040.w,X		; 7E 40 E0
	adc $01.b		; 65 01
	jsl $EF017D.l		; 22 7D 01 EF
	brk $80.b		; 00 80
	adc $10.b		; 65 10
	eor $FC80.w,X		; 5D 80 FC
	sty $94.b,X		; 94 94
	sty $65.b,X		; 94 65
	ora [$22.b]		; 07 22
	adc $3131.w,X		; 7D 31 31
	and $15.b,S		; 23 15
	lsr $FC00.w		; 4E 00 FC
	lda $039A.w,X		; BD 9A 03
	ora $4E.b,X		; 15 4E
	ora $4E.b,X		; 15 4E
	bcc -112.b		; 90 90
	adc $15.b		; 65 15
	lda ($00.b),Y		; B1 00
	rts		; 60

	jsl $402828.l		; 22 28 28 40
	rti		; 40

	tsa		; 3B
	ora [$00.b]		; 07 00
	cmp [$00.b],Y		; D7 00
	ldy #$6BBD.w		; A0 BD 6B
	ora $05.b		; 05 05
	ora $65.b		; 05 65
	asl A		; 0A
	brk $FA.b		; 00 FA
	jsl $101818.l		; 22 18 18 10
	bpl 101.b		; 10 65
	and [$00.b]		; 27 00
	cpx $7A22.w		; EC 22 7A
	ply		; 7A
	bpl  80.b		; 10 50
	adc $05.b		; 65 05
	brk $A8.b		; 00 A8
	adc $CC.b		; 65 CC
	jsr $C023.w		; 20 23 C0
	sbc #$B280.w		; E9 80 B2
	bra -100.b		; 80 9C
	ldy $9393.w		; AC 93 93
	.db $62, $BA, $53		; 62 BA 53
	ror A		; 6A
	cmp $6A.b,X		; D5 6A
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	eor ($6A.b,S),Y		; 53 6A
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	lda ($66.b,S),Y		; B3 66
	eor ($10.b),Y		; 51 10
	sbc $D5E4AA.l,X		; FF AA E4 D5
	cli		; 58
	dec $03.b,X		; D6 03
	jsr ($1BE4.w,X)		; FC E4 1B
	.db $62, $66, $30		; 62 66 30
	sbc $11FF10.l,X		; FF 10 FF 11
	sbc $30D592.l,X		; FF 92 D5 30
	cmp $EE11D6.l		; CF D6 11 EE
	sta ($6D.b)		; 92 6D
	.db $62, $9B, $8C		; 62 9B 8C
	sbc $8C9952.l,X		; FF 52 99 8C
	adc ($52.b,S),Y		; 73 52
	lda $6662.w		; AD 62 66
	rti		; 40

	sbc $E1FF41.l,X		; FF 41 FF E1
	sbc $40D541.l,X		; FF 41 D5 40
	lda $E1BE41.l,X		; BF 41 BE E1
	asl $BE41.w,X		; 1E 41 BE
	.db $62, $66, $51		; 62 66 51
	bpl  -1.b		; 10 FF
	ora ($FF.b,S),Y		; 13 FF
	ora ($D5.b)		; 12 D5
	cli		; 58
	dec $13.b,X		; D6 13
	cpx $ED12.w		; EC 12 ED
	.db $62, $9B, $8E		; 62 9B 8E
	sbc $8E9949.l,X		; FF 49 99 8E
	adc ($B8.b),Y		; 71 B8
	.db $62, $9B, $31		; 62 9B 31
	sbc $319949.l,X		; FF 49 99 31
	dec $62B8.w		; CE B8 62
	txy		; 9B
	dec $FF.b		; C6 FF
	and #$C699.w		; 29 99 C6
	and $1529.w,Y		; 39 29 15
	dec $62.b,X		; D6 62
	txy		; 9B
	and $24FF.w,Y		; 39 FF 24
	sta $C639.w,Y		; 99 39 C6
	bit $DB.b		; 24 DB
	.db $62, $66, $80		; 62 66 80
	ror $C0FF.w		; 6E FF C0
	ror $7BD5.w		; 6E D5 7B
	cpy #$693F.w		; C0 3F 69
	stz $6EAC.w		; 9C AC 6E
	lda ($93.b)		; B2 93
	tda		; 7B
	adc #$D56A.w		; 69 6A D5
	stx $66.b,Y		; 96 66
	ora ($6A.b,X)		; 01 6A
	sbc $FE01B3.l,X		; FF B3 01 FE
	cmp $A6.b,X		; D5 A6
	ora [$FF.b],Y		; 17 FF
	trb $FF.b		; 14 FF
	trb $FF.b		; 14 FF
	sbc $5E.b,S		; E3 5E
	ora [$E8.b],Y		; 17 E8
	trb $EB.b		; 14 EB
	trb $EB.b		; 14 EB
	sbc $1C.b,S		; E3 1C
	ora $9315.w,X		; 1D 15 93
	sbc $92FF12.l,X		; FF 12 FF 92
	sbc $155E11.l,X		; FF 11 5E 15
	sta ($15.b,S),Y		; 93 15
	jmp ($ED12.w)		; 6C 12 ED
	sta ($6D.b)		; 92 6D
	ora ($EE.b),Y		; 11 EE
	ora $FFD0.w,X		; 1D D0 FF
	bpl  -1.b		; 10 FF
	eor ($FF.b)		; 52 FF
	sty $D05E.w		; 8C 5E D0
	and $AD52D6.l		; 2F D6 52 AD
	sty $1D73.w		; 8C 73 1D
	eor ($FF.b,X)		; 41 FF
	eor ($FF.b,X)		; 41 FF
	eor ($FF.b,X)		; 41 FF
	jsr $415E.w		; 20 5E 41
	ldx $BE41.w,Y		; BE 41 BE
	eor ($BE.b,X)		; 41 BE
	jsr $1DDF.w		; 20 DF 1D
	ora ($FF.b)		; 12 FF
	ora ($FF.b)		; 12 FF
	ora ($FF.b)		; 12 FF
	sbc $FF.b,S		; E3 FF
	cop $FF.b		; 02 FF
	cop $A6.b		; 02 A6
	sbc $12ED12.l,X		; FF 12 ED 12
	sbc $ED12.w		; ED 12 ED
	sbc $1C.b,S		; E3 1C
	lda $62.b,X		; B5 62
	ldx $49.b		; A6 49
	sbc $49FF49.l,X		; FF 49 FF 49
	sbc $08FF8E.l,X		; FF 8E FF 08
	sbc $FFA608.l,X		; FF 08 A6 FF
	clv		; B8
	clv		; B8
	clv		; B8
	stx $0871.w		; 8E 71 08
	sbc [$08.b],Y		; F7 08
	sbc [$62.b],Y		; F7 62
	ldx $49.b		; A6 49
	sbc $49FF49.l,X		; FF 49 FF 49
	sbc $B85E31.l,X		; FF 31 5E B8
	clv		; B8
	clv		; B8
	and ($CE.b),Y		; 31 CE
	ora $FF2F.w,X		; 1D 2F FF
	plp		; 28
	sbc $26FF29.l,X		; FF 29 FF 26
	lsr $D02F.w,X		; 5E 2F D0
	plp		; 28
	cmp [$29.b],Y		; D7 29
	ora $D6.b,X		; 15 D6
	rol $D9.b		; 26 D9
	ora $FF24.w,X		; 1D 24 FF
	bit $FF.b		; 24 FF
	bit $FF.b		; 24 FF
	bit $5E.b		; 24 5E
	bit $DB.b		; 24 DB
	bit $DB.b		; 24 DB
	bit $DB.b		; 24 DB
	bit $DB.b		; 24 DB
	ora $AC80.w,X		; 1D 80 AC
	sbc $7B5E40.l,X		; FF 40 5E 7B
	adc #$BF40.w		; 69 40 BF
	lsr $FF.b,X		; 56 FF
	eor ($FF.b,S),Y		; 53 FF
	lda $DD.b		; A5 DD
	sta $62.b,X		; 95 62
	sta $77B5.w,X		; 9D B5 77
	stz $939C.w		; 9C 9C 93
	sta ($96.b,S),Y		; 93 96
	eor ($96.b,S),Y		; 53 96
	lda $A5.b		; A5 A5
	sta $679D.w,X		; 9D 9D 67
	adc $259A.w,Y		; 79 9A 25
	brk $1C.b		; 00 1C
	plp		; 28
	ora $79.b,X		; 15 79
	rts		; 60

	sbc [$94.b]		; E7 94
	and $7D.b,S		; 23 7D
	sty $79.b,X		; 94 79
	jmp $0E02.w		; 4C 02 0E
	bpl  28.b		; 10 1C
	php		; 08
	sec		; 38
	rti		; 40

	adc ($01.b),Y		; 71 01
	sbc $01.b,S		; E3 01
	cmp [$94.b]		; C7 94
	cop $CE.b		; 02 CE
	bra  21.b		; 80 15
	stz $3800.w		; 9C 00 38
	bmi 112.b		; 30 70
	brk $E0.b		; 00 E0
	brk $AB.b		; 00 AB
	bra -108.b		; 80 94
	eor $0103.w		; 4D 03 01
	ora [$0C.b]		; 07 0C
	ora $100E0A.l		; 0F 0A 0E 10
	trb $00.b		; 14 00
	trb $1101.w		; 1C 01 11
	brk $31.b		; 00 31
	lda $4D08.w,X		; BD 08 4D
	plp		; 28
	eor $8E80.w		; 4D 80 8E
	tsb $1C.b		; 04 1C
	sec		; 38
	sec		; 38
	pla		; 68
	sei		; 78
	brk $70.b		; 00 70
	brk $E0.b		; 00 E0
	cpy #$40E0.w		; C0 E0 40
	cpy #$2294.w		; C0 94 22
	ora ($53.b,X)		; 01 53
	cop $03.b		; 02 03
	adc $03.b		; 65 03
	adc [$63.b]		; 67 63
	adc ($63.b,X)		; 61 63
	rti		; 40

	adc $81.b,S		; 63 81
	sta [$40.b]		; 87 40
	eor [$05.b]		; 47 05
	cmp $02.b		; C5 02
	stx $8600.w		; 8E 00 86
	bpl  77.b		; 10 4D
	sbc $40.b,X		; F5 40
	brk $F5.b		; 00 F5
	cop $4D.b		; 02 4D
	php		; 08
	brk $C0.b		; 00 C0
	plb		; AB
	bra  83.b		; 80 53
	bit $8065.w		; 2C 65 80
	adc $02.b		; 65 02
	adc $0301.w,X		; 7D 01 03
	asl $07.b		; 06 07
	ora ($07.b,X)		; 01 07
	ora ($07.b,X)		; 01 07
	tsb $04.b		; 04 04
	adc $CB01.w,X		; 7D 01 CB
	sta ($57.b),Y		; 91 57
	ora $00.b,S		; 03 00
	asl $00.b		; 06 00
	stx $86.b		; 86 86
	bit $1C04.w		; 2C 04 1C
	brk $18.b		; 00 18
	php		; 08
	clc		; 18
	tsb $18.b		; 04 18
	tsb $140C.w		; 0C 0C 14
	trb $08.b		; 14 08
	brk $1E.b		; 00 1E
	eor $9104.w		; 4D 04 91
	sta ($00.b),Y		; 91 00
	bpl 114.b		; 10 72
	wai		; CB
	cop $91.b		; 02 91
	adc $0606.w,Y		; 79 06 06
	ora ($03.b,X)		; 01 03
	cop $02.b		; 02 02
	ora $06.b		; 05 06
	cop $6B.b		; 02 6B
	txs		; 9A
	brk $06.b		; 00 06
	adc $6B91.w,Y		; 79 91 6B
	adc $004C.w,Y		; 79 4C 00
	clc		; 18
	clc		; 18
	trb $720C.w		; 1C 0C 72
	tsb $1E0C.w		; 0C 0C 1E
	tsb $16.b		; 04 16
	asl $53.b,X		; 16 53
	tsb $0408.w		; 0C 08 04
	brk $10.b		; 00 10
	brk $14.b		; 00 14
	brk $12.b		; 00 12
	brk $1A.b		; 00 1A
	adc ($25.b)		; 72 25
	jmp $8062.w		; 4C 62 80
	stz $B26E.w		; 9C 6E B2
	bra  -1.b		; 80 FF
	sta ($7B.b,S),Y		; 93 7B
	sbc $BA6900.l,X		; FF 00 69 BA
	stx $FF.b,Y		; 96 FF
	eor ($FF.b,S),Y		; 53 FF
	lda $DD.b		; A5 DD
	lda ($02.b)		; B2 02
	sbc $FFB59D.l,X		; FF 9D B5 FF
	brk $77.b		; 00 77
	tsb $CB.b		; 04 CB
	cop $02.b		; 02 02
	txs		; 9A
	ora $03.b,S		; 03 03
	ora $7D.b,S		; 03 7D
	eor ($01.b,S),Y		; 53 01
	jmp $9A79.w		; 4C 79 9A
	eor [$01.b],Y		; 57 01
	adc $8F00.w,Y		; 79 00 8F
	ora $85.b,X		; 15 85
	sty $828C.w		; 8C 8C 82
	.db $82, $2C, $01		; 82 2C 01
	brk $C2.b		; 00 C2
	brk $C0.b		; 00 C0
	rti		; 40

	ldy #$0A80.w		; A0 80 0A
	txs		; 9A
	rtl		; 6B

	jmp $C300.w		; 4C 00 C3
	brk $C3.b		; 00 C3
	brk $A1.b		; 00 A1
	brk $61.b		; 00 61
	eor $2CF5.w		; 4D F5 2C
	rti		; 40

	rti		; 40

	eor ($90.b,S),Y		; 53 90
	sta $00.b		; 85 00
	ldy #$5320.w		; A0 20 53
	bra  77.b		; 80 4D
	sbc $E0.b,X		; F5 E0
	txa		; 8A
	txa		; 8A
	brk $D8.b		; 00 D8
	.db $62, $DE, $DE		; 62 DE DE
	pld		; 2B
	sed		; F8
	jsr ($C0E3.w,X)		; FC E3 C0
	lda $2BFA05.l,X		; BF 05 FA 2B
	rol A		; 2A
	cpx #$A66E.w		; E0 6E A6
	cmp ($FF.b)		; D2 FF
	cpx #$FF62.w		; E0 62 FF
	txs		; 9A
	jsr ($FE01.w,X)		; FC 01 FE
	mvn $AB,$15		; 54 15 AB
	cmp ($E0.b)		; D2 E0
	txy		; 9B
	cmp ($FF.b)		; D2 FF
	ora $97.b,S		; 03 97
	pla		; 68
	ora #$58F6.w		; 09 F6 58
	ora $5C.b,X		; 15 5C
	lda $2F.b,S		; A3 2F
	bne -46.b		; D0 D2
	ora $9B.b,S		; 03 9B
	jmp $1F3CFF.l		; 5C FF 3C 1F
	cmp $D72F2F.l,X		; DF 2F 2F D7
	ora [$EB.b],Y		; 17 EB
	jmp $CAD43C.l		; 5C 3C D4 CA
	eor $2D03.w,Y		; 59 03 2D
	and $2D2D.w		; 2D 2D 2D
	dec $D0FF.w,X		; DE FF D0
	cpy #$B0B0.w		; C0 B0 B0
	sed		; F8
	tya		; 98
	php		; 08
	php		; 08
	trb $00.b		; 14 00
	ora $2A.b,X		; 15 2A
	php		; 08
	bmi   0.b		; 30 00
	ora ($01.b,S),Y		; 13 01
	bmi   0.b		; 30 00
	rti		; 40

	brk $60.b		; 00 60
	brk $70.b		; 00 70
	brk $7C.b		; 00 7C
	brk $36.b		; 00 36
	brk $3E.b		; 00 3E
	brk $1E.b		; 00 1E
	brk $74.b		; 00 74
	bpl  74.b		; 10 4A
	brk $0C.b		; 00 0C
	brk $2F.b		; 00 2F
	brk $06.b		; 00 06
	brk $16.b		; 00 16
	brk $09.b		; 00 09
	jmp $EC00.w		; 4C 00 EC
	brk $7E.b		; 00 7E
	lda ($45.b),Y		; B1 45
	adc $4C256F.l		; 6F 6F 25 4C
	eor [$F5.b],Y		; 57 F5
	cpy #$204D.w		; C0 4D 20
	brk $98.b		; 00 98
	eor [$F5.b],Y		; 57 F5
	plb		; AB
	cpx #$008A.w		; E0 8A 00
	sed		; F8
	tad		; 5B
	sbc $F135BC.l,X		; FF BC 35 F1
	inc $FEF1.w,X		; FE F1 FE
	sbc [$F8.b],Y		; F7 F8
	sbc $FC.b,S		; E3 FC
	inc $BCFF.w,X		; FE FF BC
	and $AE.b,X		; 35 AE
	ldx $51AE.w		; AE AE 51
	ora $2B.b,X		; 15 2B
	ora $D4.b,X		; 15 D4
	eor $43BFA0.l,X		; 5F A0 BF 43
	sbc $0FCACA.l,X		; FF CA CA 0F
	lda $4FBF4F.l,X		; BF 4F BF 4F
	lda ($AA.b,S),Y		; B3 AA
	dex		; CA
	dex		; CA
	dex		; CA
	dex		; CA
	ora $7C62B2.l		; 0F B2 62 7C
	lsr $7C62.w		; 4E 62 7C
	lsr $05FF.w		; 4E FF 05
	plx		; FA
.ACCU 16
.INDEX 16
	rep #$3D		; C2 3D
	sbc ($EE.b),Y		; F1 EE
	sed		; F8
	sbc [$FC.b],Y		; F7 FC
	xce		; FB
	jsr ($FDEA.w,X)		; FC EA FD
	inc $B3FF.w,X		; FE FF B3
	eor ($AE.b),Y		; 51 AE
	rol A		; 2A
	ldy $EAFC.w,X		; BC FC EA
	sbc $C2718F.l,X		; FF 8F 71 C2
	and $15E1.w,X		; 3D E1 15
	lsr $A778.w,X		; 5E 78 A7
	jsr ($7E1B.w,X)		; FC 1B 7E
	ora $9D.b,X		; 15 9D
	lda $3F4C15.l,X		; BF 15 4C 3F
	dec $A601.w		; CE 01 A6
	rti		; 40

	sbc $18FF20.l,X		; FF 20 FF 18
	sbc $0CFF1C.l,X		; FF 1C FF 0C
	sbc $7FD20E.l,X		; FF 0E D2 7F
	adc $1FFFBF.l,X		; 7F BF FF 1F
	eor $C33FA7.l,X		; 5F A7 3F C3
	and $E817D1.l		; 2F D1 17 E8
	lda ($3C.b)		; B2 3C
	jmp ($59D4.w)		; 6C D4 59
	tax		; AA
	ora ($A6.b,X)		; 01 A6
	asl $04.b		; 06 04
	ora [$79.b]		; 07 79
	rtl		; 6B

	tsb $03.b		; 04 03
	eor [$1B.b],Y		; 57 1B
	and $4C.b		; 25 4C
	txs		; 9A
	txs		; 9A
	txs		; 9A
	adc $034D.w,Y		; 79 4D 03
	adc $4000.w,Y		; 79 00 40
	brk $40.b		; 00 40
	cpy $4000.w		; CC 00 40
	brk $50.b		; 00 50
	brk $7C.b		; 00 7C
	txs		; 9A
	brk $81.b		; 00 81
	brk $AB.b		; 00 AB
	plb		; AB
	cpx #$008A.w		; E0 8A 00
	sed		; F8
	brk $FC.b		; 00 FC
	brk $15.b		; 00 15
	jmp ($005B.w)		; 6C 5B 00
	sbc $6F2E00.l		; EF 00 2E 6F
	adc $009A25.l		; 6F 25 9A 00
	jsr ($625B.w,X)		; FC 5B 62
	lda ($45.b),Y		; B1 45
	adc $009A25.l		; 6F 25 9A 00
	sbc [$F8.b]		; E7 F8
	sbc [$F8.b]		; E7 F8
	sbc $F9C7F0.l		; EF F0 C7 F9
	cmp $F9C7F1.l		; CF F1 C7 F9
	cmp $F9C7F1.l		; CF F1 C7 F9
	sbc $51.b		; E5 51
	adc $75.b,X		; 75 75
	adc $75.b,X		; 75 75
	adc $3F.b,X		; 75 3F
	cmp [$1F.b]		; C7 1F
	sbc [$3F.b]		; E7 3F
	cmp [$1F.b]		; C7 1F
	sbc [$3F.b]		; E7 3F
	cmp [$0F.b]		; C7 0F
	sbc ($AF.b,S),Y		; F3 AF
	cmp ($97.b,S),Y		; D3 97
	xba		; EB
	eor $5959.w,Y		; 59 59 59
	eor $AA59.w,Y		; 59 59 AA
	sta $FF.b,S		; 83 FF
	sta $EA.b,S		; 83 EA
	pld		; 2B
	jmp $5C2BEA.l		; 5C EA 2B 5C
	sbc $5F4FBF.l,X		; FF BF 4F 5F
	lda [$1F.b]		; A7 1F
	sbc [$0D.b]		; E7 0D
	ora $F5.b,X		; 15 F5
	ora $55EF.w,Y		; 19 EF 55
	lda [$A4.b],Y		; B7 A4
	adc $CA7C01.l,X		; 7F 01 7C CA
	eor $0659.w,Y		; 59 59 06
	jsr ($488A.w,X)		; FC 8A 48
	sbc $80.b,X		; F5 80
	sta $00.b,S		; 83 00
	sta $1571.w		; 8D 71 15
	nop		; EA
	sta $68DFD7.l,X		; 9F D7 DF 68
	sbc $1EF8D9.l,X		; FF D9 F8 1E
	cmp ($63.b,X)		; C1 63
	trb $4BB4.w		; 1C B4 4B
	cop $FC.b		; 02 FC
	bra -16.b		; 80 F0
	ldy #$5380.w		; A0 80 53
	ora [$45.b]		; 07 45
	brk $FC.b		; 00 FC
	ora $15.b,S		; 03 15
	cpy $7F33.w		; CC 33 7F
	and $54F397.l,X		; 3F 97 F3 54
	ror $F2FF.w		; 6E FF F2
	ora $01.b,S		; 03 01
	inc $03FC.w,X		; FE FC 03
	adc [$BF.b],Y		; 77 BF
	adc $67030F.l,X		; 7F 0F 03 67
	jsr ($9A62.w,X)		; FC 62 9A
	jsr ($FC03.w,X)		; FC 03 FC
	cmp ($37.b)		; D2 37
	ora $6F.b,X		; 15 6F
	ora $5D.b,X		; 15 5D
	xce		; FB
	ora [$FE.b],Y		; 17 FE
	asl A		; 0A
	rol $9F76.w,X		; 3E 76 9F
	ora ($EF.b,S),Y		; 13 EF
	cmp ($9F.b)		; D2 9F
	ora [$07.b]		; 07 07
	adc $C100.w,X		; 7D 00 C1
	brk $E0.b		; 00 E0
	txa		; 8A
	.db $62, $5C, $FF		; 62 5C FF
	bit $7FBF.w,X		; 3C BF 7F
	lda $9FBFBF.l,X		; BF BF BF 9F
	pld		; 2B
	sbc $7F3F3C.l,X		; FF 3C 3F 7F
	and $A81F7F.l,X		; 3F 7F 1F A8
	brk $61.b		; 00 61
	eor $00.b		; 45 00
	trb $00.b		; 14 00
	asl $00.b		; 06 00
	phd		; 0B
	txs		; 9A
	adc $B15B.w,Y		; 79 5B B1
	eor $6F.b		; 45 6F
	and $25.b		; 25 25
	jmp $799A.w		; 4C 9A 79
	eor $60AB.w		; 4D AB 60
	txa		; 8A
	brk $D8.b		; 00 D8
	brk $DC.b		; 00 DC
	brk $9E.b		; 00 9E
	adc $AB4D.w,Y		; 79 4D AB
	cpx #$008A.w		; E0 8A 00
	sed		; F8
	brk $FC.b		; 00 FC
	tad		; 5B
	brk $CF.b		; 00 CF
	sbc ($E7.b),Y		; F1 E7
	sed		; F8
	sbc $FC.b,S		; E3 FC
	sbc [$F8.b]		; E7 F8
	sbc $FC.b,S		; E3 FC
	sbc ($FE.b),Y		; F1 FE
	sbc ($FC.b,S),Y		; F3 FC
	sbc ($FE.b),Y		; F1 FE
	adc $E5.b,X		; 75 E5
	sbc $AE.b		; E5 AE
	ldx $8FAE.w		; AE AE 8F
	sbc ($8F.b,S),Y		; F3 8F
	sbc ($97.b,S),Y		; F3 97
	xba		; EB
	sta $1597F3.l		; 8F F3 97 15
	rtl		; 6B

	sta $15DF73.l		; 8F 73 DF 15
	and $EF.b,S		; 23 EF
	ora ($83.b,S),Y		; 13 83
	sbc $83FF83.l,X		; FF 83 FF 83
	sbc $AAFF83.l,X		; FF 83 FF AA
	tax		; AA
	tax		; AA
	ora $B2.b,S		; 03 B2
	inc $FEFE.w,X		; FE FE FE
	inc $FDFD.w,X		; FE FD FD
	sbc $F9FBF8.l,X		; FF F8 FB F9
	sbc [$F1.b],Y		; F7 F1
	inc $EEF3.w,X		; FE F3 EE
	and $FCFE.w		; 2D FE FC
	jsr ($FCFC.w,X)		; FC FC FC
	sed		; F8
	sed		; F8
	beq -15.b		; F0 F1
	beq -15.b		; F0 F1
	cpx #$F847.w		; E0 47 F8
	ora $1D.b,X		; 15 1D
	sbc ($16.b)		; F2 16
	cmp #$9768.w		; C9 68 97
	bvc  47.b		; 50 2F
	ldy #$C05F.w		; A0 5F C0
	and $07BE41.l,X		; 3F 41 BE 07
	brk $0E.b		; 00 0E
	ora ($3A.b,X)		; 01 3A
	ora $70.b		; 05 70
	ora $3FC058.l		; 0F 58 C0 3F
	adc #$3FC0.w		; 69 C0 3F
	jsr $69DF.w		; 20 DF 69
	lda ($03.b,S),Y		; B3 03
	jsr ($F10F.w,X)		; FC 0F F1
	ror $FA87.w,X		; 7E 87 FA
	and $D56958.l,X		; 3F 58 69 D5
	lsr $0C.b,X		; 56 0C
	sbc ($3E.b,S),Y		; F3 3E
	adc $0C.b,X		; 75 0C
	cmp [$7E.b]		; C7 7E
	stp		; DB
	inc $2D15.w,X		; FE 15 2D
	sbc $D5FED3.l,X		; FF D3 FE D5
	lsr $5B.b,X		; 56 5B
	rti		; 40

	lda [$15.b],Y		; B7 15
	jsl $CF18D7.l		; 22 D7 18 CF
	bmi  -1.b		; 30 FF
	cpx #$585F.w		; E0 5F 58
	cmp ($3F.b,X)		; C1 3F
	sbc $1F.b,S		; E3 1F
	sei		; 78
	bra  56.b		; 80 38
	cpy #$AB30.w		; C0 30 AB
	plb		; AB
	sbc $80.b,X		; F5 80
	adc [$1F.b]		; 67 1F
	cmp $5F9FBF.l,X		; DF BF 9F 5F
	lda $CFBF0F.l,X		; BF 0F BF CF
	lda $2F9FAF.l,X		; BF AF 9F 2F
	eor $3F3FCF.l,X		; 5F CF 3F 3F
	ora $7F1F7F.l,X		; 1F 7F 1F 7F
	ora $7F0F7F.l,X		; 1F 7F 0F 7F
	ora $CACA7F.l		; 0F 7F CA CA
	ora $01E901.l		; 0F 01 E9 01
	sbc #$00FE.w		; E9 FE 00
	sbc [$B1.b],Y		; F7 B1
	brk $1A.b		; 00 1A
	and $00.b		; 25 00
	phd		; 0B
	jmp $B353.w		; 4C 53 B3
	lda ($45.b),Y		; B1 45
	adc $9A4C25.l		; 6F 25 4C 9A
	brk $2A.b		; 00 2A
	rol A		; 2A
	ldy $E135.w,X		; BC 35 E1
	inc $FDC2.w,X		; FE C2 FD
	ora $FA.b		; 05 FA
	rol A		; 2A
	rol A		; 2A
	ldy $5135.w,X		; BC 35 51
	cpy #$EFA6.w		; C0 A6 EF
	ora ($FF.b,S),Y		; 13 FF
	ora $7F.b,S		; 03 7F
	sta $BF.b,S		; 83 BF
	eor $5F.b,S		; 43 5F
	lda ($2F.b,X)		; A1 2F
	bne -117.b		; D0 8B
	stz $15.b,X		; 74 15
	sbc $3A.b		; E5 3A
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	ora ($FF.b,X)		; 01 FF
	lda ($20.b,S),Y		; B3 20
	lsr $D43C.w		; 4E 3C D4
	ora $D43CE2.l		; 0F E2 3C D4
	dex		; CA
	sbc ($FC.b,X)		; E1 FC
	cpx #$DD15.w		; E0 15 DD
	cmp #$CDF6.w		; C9 F6 CD
	sbc ($C4.b)		; F2 C4
	tyx		; BB
	ora $DE.b,X		; 15 DE
	lda ($D9.b,X)		; A1 D9
	inc $C7.b		; E6 C7
	sed		; F8
	sbc $E0.b,S		; E3 E0
	sbc $C0.b,S		; E3 C0
	cmp ($C0.b,X)		; C1 C0
	cmp ($C1.b,X)		; C1 C1
	cpy #$C080.w		; C0 80 C0
	bra -64.b		; 80 C0
	cpy #$C0C0.w		; C0 C0 C0
	sta [$78.b]		; 87 78
	sta $738E73.l		; 8F 73 8E 73
	asl $8773.w		; 0E 73 87
	and $19E7.w,Y		; 39 E7 19
	sta $7215.w		; 8D 15 72
	xce		; FB
	tsb $62.b		; 04 62
	tda		; 7B
	adc #$BFC0.w		; 69 C0 BF
	rts		; 60

	adc $530D0D.l,X		; 7F 0D 0D 53
	cmp $FF.b		; C5 FF
	phy		; 5A
	sbc $D1FFAD.l,X		; FF AD FF D1
	sbc $9FFC4B.l,X		; FF 4B FC 9F
	cpx #$18E7.w		; E0 E7 18
	lda $D546.w,Y		; B9 46 D5
	ora ($FD.b,X)		; 01 FD
	tsb $C0EC.w		; 0C EC C0
	cpy #$1553.w		; C0 53 15
	adc $F19EFC.l		; 6F FC 9E F1
	sbc $AAFCC0.l,X		; FF C0 FC AA
	brk $15.b		; 00 15
	txy		; 9B
	stz $C4.b		; 64 C4
	and $02EB0A.l,X		; 3F 0A EB 02
	inc $F808.w,X		; FE 08 F8
	bmi -16.b		; 30 F0
	ldy #$2CA0.w		; A0 A0 2C
	eor $1407.w		; 4D 07 14
	ora $15BF44.l,X		; 1F 44 BF 15
	dex		; CA
	and [$1E.b],Y		; 37 1E
	sbc $1540B6.l,X		; FF B6 40 15
	wai		; CB
	sei		; 78
	ldy $15.b		; A4 15
	adc $F633.w,X		; 7D 33 F6
	ora #$9AE6.w		; 09 E6 9A
	jmp $0F4C.w		; 4C 4C 0F
	ora $020F07.l		; 0F 07 0F 02
	ora $188708.l		; 0F 08 87 18
	cmp [$2F.b]		; C7 2F
	eor $FF8FCA.l,X		; 5F CA 8F FF
	eor $0FCF9F.l,X		; 5F 9F CF 0F
	sta $0FCF1F.l,X		; 9F 1F CF 0F
	sta $3F0FD4.l,X		; 9F D4 0F 3F
	cmp $1FEF1F.l		; CF 1F EF 1F
	sbc $1FF70F.l		; EF 0F F7 1F
	sbc [$0F.b]		; E7 0F
	sbc [$1F.b],Y		; F7 1F
	sbc $C5AEBC.l		; EF BC AE C5
	plx		; FA
	adc [$1B.b],Y		; 77 1B
	cpx $CF.b		; E4 CF
	bmi 127.b		; 30 7F
	sta $FF.b,S		; 83 FF
	ora $C0AEBC.l,X		; 1F BC AE C0
	ror $AA.b		; 66 AA
	pei ($17.b)		; D4 17
	inx		; E8
	eor $837FB0.l		; 4F B0 7F 83
	adc $3FFF8F.l,X		; 7F 8F FF 3F
	jmp $CAAAB3.l		; 5C B3 AA CA
	and $F1FF5C.l,X		; 3F 5C FF F1
	ror $EAF8.w,X		; 7E F8 EA
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	bvs  -1.b		; 70 FF
	sed		; F8
	nop		; EA
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	adc $41BF87.l,X		; 7F 87 BF 41
	ora $57.b,X		; 15 57
	lda #$0B.b		; A9 0B
	pea $FAC5.w		; F4 C5 FA
	sbc $FC.b,S		; E3 FC
	cpx $FB.b		; E4 FB
	sbc ($FC.b,S),Y		; F3 FC
	eor $FF01.w,Y		; 59 01 FF
	ora ($A6.b,X)		; 01 A6
	cpy #$FF.b		; C0 FF
	sbc $AE.b		; E5 AE
	sbc [$D8.b]		; E7 D8
	cpx #$DF.b		; E0 DF
	sed		; F8
	nop		; EA
	lda ($7F.b)		; B2 7F
	inc $FF3E.w,X		; FE 3E FF
	and $E09F7F.l,X		; 3F 7F 9F E0
	cpy #$E0.b		; C0 E0
	cpy #$E0.b		; C0 E0
	cpx #$F0.b		; E0 F0
	beq 120.b		; F0 78
	sed		; F8
	and $3EFC.w,X		; 3D FC 3E
	inc $7FD4.w,X		; FE D4 7F
	bra  47.b		; 80 2F
	bne  98.b		; D0 62
	ldx $FF.b,Y		; B6 FF
	ora $CA.b,X		; 15 CA
	sed		; F8
	sbc ($F0.b)		; F2 F0
	tyx		; BB
	ora $B8.b,X		; 15 B8
	eor [$48.b]		; 47 48
	lda $0707.w,X		; BD 07 07
	ora $0F440F.l		; 0F 0F 44 0F
	bcs  15.b		; B0 0F
	rol $5FD1.w		; 2E D1 5F
	lda $15.b,S		; A3 15
	adc $FF.b,X		; 75 FF
	cmp $68FF.w		; CD FF 68
	adc $553E1E.l,X		; 7F 1E 3E 55
	ora $75.b,X		; 15 75
	asl $672E.w		; 0E 2E 67
	adc $809A.w,Y		; 79 9A 80
	cmp ($C1.b,X)		; C1 C1
	cpx #$15.b		; E0 15
	txa		; 8A
	cpx #$11.b		; E0 11
	cpx #$D3.b		; E0 D3
	cmp $29.b,S		; C3 29
	brk $76.b		; 00 76
	brk $3E.b		; 00 3E
	brk $DA.b		; 00 DA
	cpx #$3D.b		; E0 3D
	cpy #$64.b		; C0 64
	bra  48.b		; 80 30
	brk $15.b		; 00 15
	bit $FE7F.w,X		; 3C 7F FE
	sbc $56512A.l,X		; FF 2A 51 56
	adc #$26.b		; 69 26
	sbc ($05.b,X)		; E1 05
	ora ($8F.b),Y		; 11 8F
	ora $1F0F0F.l,X		; 1F 0F 0F 1F
	ora $301F1E.l,X		; 1F 1E 1F 30
	and $1F7F40.l,X		; 3F 40 7F 1F
	cpy #$0F.b		; C0 0F
	sbc ($03.b),Y		; F1 03
	sbc ($07.b,S),Y		; F3 07
	sbc [$1F.b],Y		; F7 1F
	sbc $DF3FD4.l		; EF D4 3F DF
	adc $1FDFBF.l,X		; 7F BF DF 1F
	jmp $1F5651.l		; 5C 51 56 1F
	pld		; 2B
	jmp $FF2D2D.l		; 5C 2D 2D FF
	asl $02FF.w,X		; 1E FF 02
	sbc $02FF02.l,X		; FF 02 FF 02
	dec $EAD2.w,X		; DE D2 EA
	sbc $FFF32A.l,X		; FF 2A F3 FF
	sbc [$FF.b]		; E7 FF
	sbc $FF.b,S		; E3 FF
	beq -34.b		; F0 DE
	sbc $FEC1AE.l,X		; FF AE C1 FE
	clc		; 18
	sbc $2AFEF9.l,X		; FF F9 FE 2A
	sbc ($FE.b),Y		; F1 FE
	sbc ($FC.b,S),Y		; F3 FC
	sbc ($FE.b,X)		; E1 FE
	ldx $2A2A.w		; AE 2A 2A
	rol A		; 2A
	rol A		; 2A
	ldx $51AE.w		; AE AE 51
	cli		; 58
	rts		; 60

	sta $6CD4FF.l,X		; 9F FF D4 6C
	jmp ($3C6C.w)		; 6C 6C 3C
	adc $D4D4D4.l,X		; 7F D4 D4 D4
	jmp ($6C6C.w)		; 6C 6C 6C
	bit $0A3C.w,X		; 3C 3C 0A
	cpy #$F4.b		; C0 F4
	beq  -8.b		; F0 F8
	beq  -7.b		; F0 F9
	sbc $F02B.w,Y		; F9 2B F0
	cmp $F9AEAE.l		; CF AE AE F9
	inc $152B.w,X		; FE 2B 15
	cli		; 58
	clc		; 18
	and ($21.b,X)		; 21 21
	adc $35B27F.l,X		; 7F 7F B2 35
	sbc $07.b		; E5 07
	cpx #$3F.b		; E0 3F
	cmp ($7F.b,X)		; C1 7F
	lda $2B7FFF.l,X		; BF FF 7F 2B
	mvn $E0,$01		; 54 01 E0
	sbc [$C0.b]		; E7 C0
	txy		; 9B
	sta ($7F.b,X)		; 81 7F
	sbc [$4E.b]		; E7 4E
	ror A		; 6A
	cmp $DE.b,X		; D5 DE
	lda ($02.b,S),Y		; B3 02
	sbc $06FF02.l,X		; FF 02 FF 06
	sbc $1EFF0E.l,X		; FF 0E FF 1E
	sbc $FFDE3E.l,X		; FF 3E DE FF
	lda $DD.b		; A5 DD
	sta $B2.b,X		; 95 B2
	sta $77B5.w,X		; 9D B5 77
	ldx $4E.b		; A6 4E
	ldx $DE.b		; A6 DE
	lsr $A6FE.w		; 4E FE A6
	dec $BC2A.w,X		; DE 2A BC
	and $51.b,X		; 35 51
	sta ($FE.b,X)		; 81 FE
	asl $62F1.w		; 0E F1 62
	jmp $6EE035.l		; 5C 35 E0 6E
	lda ($FF.b)		; B2 FF
	eor [$F8.b]		; 47 F8
	phd		; 0B
	pea $1517.w		; F4 17 15
	sbc #$15.b		; E9 15
	bit $D8D3.w		; 2C D3 D8
	and [$BF.b]		; 27 BF
	rti		; 40

	adc $C06280.l,X		; 7F 80 62 C0
	ror $01FF.w		; 6E FF 01
	sbc $B359AA.l,X		; FF AA 59 B3
.ACCU 8
	sep #$AA		; E2 AA
	adc #$F8.b		; 69 F8
	ora [$62.b]		; 07 62
.ACCU 8
.INDEX 8
	sep #$3C		; E2 3C
	ora [$4E.b]		; 07 4E
	sbc $1F817F.l,X		; FF 7F 81 1F
	cpx #$62.b		; E0 62
	sep #$81		; E2 81
	sbc $FFB2E0.l,X		; FF E0 B2 FF
	cpy #$9C.b		; C0 9C
	sbc $F07FC0.l,X		; FF C0 7F F0
	ora $3CE262.l		; 0F 62 E2 3C
	ora $01BAB2.l		; 0F B2 BA 01
	ldx $DE.b		; A6 DE
	cmp $01.b,X		; D5 01
	sbc $A6B21F.l,X		; FF 1F B2 A6
	dec $AA62.w,X		; DE 62 AA
	dex		; CA
	and $DEA65C.l,X		; 3F 5C A6 DE
	inc $2D2D.w,X		; FE 2D 2D
	and $DEA6.w		; 2D A6 DE
	sty $01.b,X		; 94 01
	sbc #$04.b		; E9 04
	cpy $1000.w		; CC 00 10
	txs		; 9A
	lda $B162.w,X		; BD 62 B1
	adc $57794C.l		; 6F 4C 79 57
	and [$00.b],Y		; 37 00
	eor ($00.b,X)		; 41 00
	.db $42, $72		; 42 72
	brk $82.b		; 00 82
	brk $48.b		; 00 48
	wai		; CB
	adc ($D5.b)		; 72 D5
	.db $62, $B1, $6F		; 62 B1 6F
	adc $8900CC.l		; 6F CC 00 89
	sta $CB.b		; 85 CB
	brk $4A.b		; 00 4A
	txs		; 9A
	txs		; 9A
	brk $86.b		; 00 86
	cmp $D5.b,X		; D5 D5
	eor $15F5.w		; 4D F5 15
	jmp ($00CC.w)		; 6C CC 00
	bra  77.b		; 80 4D
	ldy #$00.b		; A0 00
	sbc $F500.w		; ED 00 F5
	beq  91.b		; F0 5B
	cmp $62.b,X		; D5 62
	lda $F500.w,X		; BD 00 F5
	php		; 08
	brk $13.b		; 00 13
	brk $44.b		; 00 44
	eor [$AB.b],Y		; 57 AB
	sed		; F8
	lsr $E9.b,X		; 56 E9
	dey		; 88
	eor $5BF0.w,X		; 5D F0 5B
	wai		; CB
	sbc #$1F.b		; E9 1F
	adc $06E9.w,Y		; 79 E9 06
	adc $B3.b		; 65 B3
	adc $72045D.l		; 6F 5D 04 72
	tsa		; 3B
	cmp $4C.b,X		; D5 4C
	lda $1500.w,X		; BD 00 15
	eor ($00.b),Y		; 51 00
	ora $99.b,X		; 15 99
	rtl		; 6B

	adc $A100.w,Y		; 79 00 A1
	adc ($79.b)		; 72 79
	sta $7925.w,Y		; 99 25 79
	sta $00.b		; 85 00
	lda #$00.b		; A9 00
	bpl -123.b		; 10 85
	brk $28.b		; 00 28
	brk $18.b		; 00 18
	adc ($79.b)		; 72 79
	cmp $D5.b,X		; D5 D5
	wai		; CB
	eor $000A.w		; 4D 0A 00
	lsr $CB.b		; 46 CB
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $54.b		; 00 54
	cmp $D5.b,X		; D5 D5
	cpy $A800.w		; CC 00 A8
	brk $60.b		; 00 60
	brk $C3.b		; 00 C3
	sta $6B.b		; 85 6B
	brk $4F.b		; 00 4F
	brk $4A.b		; 00 4A
	cmp $D5.b,X		; D5 D5
	eor $5815.w		; 4D 15 58
	eor $795A.w		; 4D 5A 79
	brk $09.b		; 00 09
	brk $E0.b		; 00 E0
	rtl		; 6B

	brk $F5.b		; 00 F5
	sed		; F8
	sta $0067.w,Y		; 99 67 00
	rti		; 40

	cpy $4800.w		; CC 00 48
	brk $A0.b		; 00 A0
	brk $46.b		; 00 46
	php		; 08
	ora $AE.b,X		; 15 AE
	adc [$00.b]		; 67 00
	plb		; AB
	inc $22D5.w,X		; FE D5 22
	tyx		; BB
	brk $0B.b		; 00 0B
	brk $A7.b		; 00 A7
	php		; 08
	lda $56E0.w,X		; BD E0 56
	eor $4C15.w,X		; 5D 15 4C
	brk $14.b		; 00 14
	bra  59.b		; 80 3B
	bra -77.b		; 80 B3
	sbc #$20.b		; E9 20
	sbc #$F8.b		; E9 F8
	wai		; CB
	sbc #$07.b		; E9 07
	adc $105D.w,Y		; 79 5D 10
	sta $20.b		; 85 20
	adc ($4C.b,X)		; 61 4C
	wai		; CB
	adc [$53.b]		; 67 53
	lda ($B1.b,S),Y		; B3 B1
	and $9A.b		; 25 9A
	eor [$49.b],Y		; 57 49
	brk $F5.b		; 00 F5
	ora $9D.b,X		; 15 9D
	brk $14.b		; 00 14
	brk $E1.b		; 00 E1
	brk $14.b		; 00 14
	adc ($09.b,X)		; 61 09
	cop $CB.b		; 02 CB
	ror A		; 6A
	lda ($6F.b),Y		; B1 6F
	jmp $BB00.w		; 4C 00 BB
	brk $A2.b		; 00 A2
	cpy $0F40.w		; CC 40 0F
	bmi -123.b		; 30 85
	ora ($84.b)		; 12 84
	inx		; E8
	asl $15.b		; 06 15
	eor $C802.w,Y		; 59 02 C8
	ldx #$00.b		; A2 00
	asl A		; 0A
	brk $06.b		; 00 06
	brk $88.b		; 00 88
	eor ($41.b,S),Y		; 53 41
	ora $65.b,X		; 15 65
	sta ($15.b)		; 92 15
	pei ($08.b)		; D4 08
	inc $C810.w		; EE 10 C8
	sbc $F5.b,X		; F5 F5
	cmp ($00.b,X)		; C1 00
	bpl   0.b		; 10 00
	ldy $CB.b,X		; B4 CB
	php		; 08
	ldy $02.b,X		; B4 02
	bra  32.b		; 80 20
	cpx #$00.b		; E0 00
	jsr ($5799.w,X)		; FC 99 57
	sbc $15.b,X		; F5 15
	jsl $208D00.l		; 22 00 8D 20
	and ($0C.b,X)		; 21 0C
	eor ($24.b,X)		; 41 24
	adc [$F5.b]		; 67 F5
	beq  91.b		; F0 5B
	lsr $5D.b,X		; 56 5D
	bit $08.b,X		; 34 08
	ora $20.b,S		; 03 20
	tsa		; 3B
	plb		; AB
	jsr ($E962.w,X)		; FC 62 E9
	bra -23.b		; 80 E9
	plb		; AB
	ora $0FE9.w		; 0D E9 0F
	sbc #$A9.b		; E9 A9
	rti		; 40

	eor ($04.b)		; 52 04
	tsb $02.b		; 04 02
	tsa		; 3B
	ldx $4C.b		; A6 4C
	jsl $0440A3.l		; 22 A3 40 04
	bra  36.b		; 80 24
	bcc  59.b		; 90 3B
	sbc $7945B3.l,X		; FF B3 45 79
	eor [$43.b],Y		; 57 43
	brk $36.b		; 00 36
	rti		; 40

	phk		; 4B
	rtl		; 6B

	clc		; 18
	ora $99.b,X		; 15 99
	jsr $0902.w		; 20 02 09
	adc [$6A.b]		; 67 6A
	adc $9E0067.l		; 6F 67 00 9E
	brk $8E.b		; 00 8E
	brk $34.b		; 00 34
	brk $24.b		; 00 24
	brk $E7.b		; 00 E7
	brk $39.b		; 00 39
	.db $42, $15		; 42 15
	and $15.b,X		; 35 15
	txa		; 8A
	ora ($0E.b,X)		; 01 0E
	tsx		; BA
	and $00.b		; 25 00
	eor #$02.b		; 49 02
	ora $91.b,X		; 15 91
	brk $81.b		; 00 81
	bpl -48.b		; 10 D0
	asl $5F.b		; 06 5F
	brk $19.b		; 00 19
	bit $15.b		; 24 15
	and $19C2.w		; 2D C2 19
	inc $C8.b		; E6 C8
	rts		; 60

	php		; 08
	phb		; 8B
	brk $34.b		; 00 34
	php		; 08
	ora $72.b,X		; 15 72
	ora #$15.b		; 09 15
	lda ($08.b),Y		; B1 08
	dec A		; 3A
	mvp $A5,$15		; 44 15 A5
	brk $30.b		; 00 30
	eor $C8.b,S		; 43 C8
	rol $00.b		; 26 00
	ldy #$1C.b		; A0 1C
	tsb $02.b		; 04 02
	bvc -124.b		; 50 84
	eor $821E79.l,X		; 5F 79 1E 82
	ora $3C.b,X		; 15 3C
	ldx #$41.b		; A2 41
	stx $4D.b,Y		; 96 4D
	cpy #$06.b		; C0 06
	ply		; 7A
	bra   8.b		; 80 08
	ora ($80.b,X)		; 01 80
	ora $C0.b		; 05 C0
	ora $35.b,X		; 15 35
	asl A		; 0A
	bvc -80.b		; 50 B0
	eor $F5.b,S		; 43 F5
	inc $6799.w,X		; FE 99 67
	brk $C0.b		; 00 C0
	bpl -96.b		; 10 A0
	phy		; 5A
	phk		; 4B
	tsb $38.b		; 04 38
	lsr $00.b		; 46 00
	ora $AE.b,X		; 15 AE
	php		; 08
	ora $67.b,S		; 03 67
	beq -43.b		; F0 D5
	.db $62, $BD, $CC		; 62 BD CC
	phx		; DA
	asl $E0.b,X		; 16 E0
	bit #$12.b		; 89 12
	asl A		; 0A
	stz $67.b,X		; 74 67
	eor ($F5.b,S),Y		; 53 F5
	inc $2256.w,X		; FE 56 22
	rti		; 40

	brk $82.b		; 00 82
	ora $69.b,X		; 15 69
	lda $F83B50.l		; AF 50 3B F8
	lda ($00.b,S),Y		; B3 00
	lda $1412.w		; AD 12 14
	asl A		; 0A
	jmp $BD01.w		; 4C 01 BD
	.db $62, $45, $4C		; 62 45 4C
	adc $00BD.w,Y		; 79 BD 00
	lda #$42.b		; A9 42
	cpx $08.b		; E4 08
	cmp #$12.b		; C9 12
	ora $34.b,S		; 03 34
	bit $08.b,X		; 34 08
	sta ($79.b),Y		; 91 79
	eor ($66.b,S),Y		; 53 66
	lda ($25.b),Y		; B1 25
	adc $164D.w,Y		; 79 4D 16
	and #$D9.b		; 29 D9
	tsb $12.b		; 04 12
	ora $2C.b,X		; 15 2C
	tsb $7161.w		; 0C 61 71
	php		; 08
	inx		; E8
	cop $81.b		; 02 81
	rol $08.b,X		; 36 08
	ora ($BA.b,S),Y		; 13 BA
	eor $00.b		; 45 00
	mvp $84,$11		; 44 11 84
	plp		; 28
	ora $96.b,X		; 15 96
	pha		; 48
	sbc ($08.b,X)		; E1 08
	brk $15.b		; 00 15
	ror A		; 6A
	ldx #$15.b		; A2 15
	jmp $68F409.l		; 5C 09 F4 68
	ora [$C8.b]		; 07 C8
	adc ($08.b),Y		; 71 08
	sty $02.b		; 84 02
	bra 104.b		; 80 68
	php		; 08
	inc $15.b,X		; F6 15
	and $4A.b,X		; 35 4A
	pha		; 48
	ora $95.b,X		; 15 95
	ldx #$15.b		; A2 15
	eor $4D15.w,X		; 5D 15 4D
	and ($C8.b)		; 32 C8
	tsb $48.b		; 04 48
	dey		; 88
	cop $14.b		; 02 14
	.db $42, $15		; 42 15
	sta $0A.b		; 85 0A
	and $19.b		; 25 19
	ldx #$A7.b		; A2 A7
	bvc -66.b		; 50 BE
	eor ($FC.b,X)		; 41 FC
	cmp $56.b,X		; D5 56
	adc [$80.b]		; 67 80
	bpl   8.b		; 10 08
	phk		; 4B
	bmi -59.b		; 30 C5
	bpl  21.b		; 10 15
	plb		; AB
	rti		; 40

	and ($98.b,X)		; 21 98
	ora $91.b,X		; 15 91
	mvp $F5,$53		; 44 53 F5
	sed		; F8
	cmp $62.b,X		; D5 62
	eor [$F5.b],Y		; 57 F5
	cpy #$08.b		; C0 08
	ora $AA.b,X		; 15 AA
	ora ($09.b,X)		; 01 09
	stz $F1.b		; 64 F1
	php		; 08
	adc [$53.b]		; 67 53
	sbc $F8.b,X		; F5 F8
	lsr $23.b,X		; 56 23
	tay		; A8
	plp		; 28
	bne 101.b		; D0 65
	sed		; F8
	.db $62, $00, $18		; 62 00 18
	sbc $04.b,S		; E3 04
	ora $65.b,S		; 03 65
	sbc $065D25.l,X		; FF 25 5D 06
	adc ($15.b),Y		; 71 15
	and $08.b		; 25 08
	tas		; 1B
	bit $02.b		; 24 02
	ora ($BD.b,X)		; 01 BD
	ldx $B1.b		; A6 B1
	txs		; 9A
	lda $F600.w,X		; BD 00 F6
	ora #$07.b		; 09 07
	cpx #$14.b		; E0 14
	ora $CB.b,X		; 15 CB
	ora $66.b,X		; 15 66
	bit #$09.b		; 89 09
	rol $79.b,X		; 36 79
	adc [$66.b]		; 67 66
	eor $79.b		; 45 79
	adc [$85.b]		; 67 85
	adc $24.b,S		; 63 24
	ora $5B.b,X		; 15 5B
	sbc ($0C.b,S),Y		; F3 0C
	ora $45.b,X		; 15 45
	ora $9A.b,X		; 15 9A
	eor ($AD.b)		; 52 AD
	sta $7C.b,S		; 83 7C
	ora ($0E.b,X)		; 01 0E
	eor ($9B.b,S),Y		; 53 9B
	and $4D.b		; 25 4D
	ora $6615.w,Y		; 19 15 66
	plx		; FA
	ora $36.b		; 05 36
	cmp #$8D.b		; C9 8D
	ora $72.b,X		; 15 72
	bit #$76.b		; 89 76
	dec A		; 3A
	cmp $70.b		; C5 70
	sta $552A15.l		; 8F 15 2A 55
	tsx		; BA
	lda ($CC.b),Y		; B1 CC
	bne   2.b		; D0 02
	cpx $6897.w		; EC 97 68
	and [$15.b],Y		; 37 15
	iny		; C8
	inc $19.b		; E6 19
	cmp $4732.w		; CD 32 47
	ora $B8.b,X		; 15 B8
	adc #$C8.b		; 69 C8
	php		; 08
	lda [$DC.b],Y		; B7 DC
	ora $23.b,X		; 15 23
	brk $27.b		; 00 27
	phb		; 8B
	stz $92.b,X		; 74 92
	adc $E215.w		; 6D 15 E2
	ora $1D.b,X		; 15 1D
	ldy #$5F.b		; A0 5F
	rti		; 40

	lda $049A96.l,X		; BF 96 9A 04
	and $07.b,S		; 23 07
	sbc #$3D.b		; E9 3D
	.db $42, $61		; 42 61
	stx $110C.w		; 8E 0C 11
	cop $01.b		; 02 01
	lda $6FA6.w,X		; BD A6 6F
	txs		; 9A
	lda $EB91.w,X		; BD 91 EB
	cld		; D8
	and [$89.b]		; 27 89
	ror $06.b,X		; 76 06
	sbc $1F60.w,Y		; F9 60 1F
	ora ($0E.b,X)		; 01 0E
	ora ($53.b,X)		; 01 53
	cmp $B1.b,X		; D5 B1
	and $79.b		; 25 79
	eor $13C0.w		; 4D C0 13
	asl $2EA1.w		; 0E A1 2E
	cmp ($97.b),Y		; D1 97
	jsr $27D8.w		; 20 D8 27
	.db $82, $15, $7D		; 82 15 7D
	dec $15.b,X		; D6 15
	and $1A.b		; 25 1A
	tsx		; BA
	eor $00.b		; 45 00
	rol $15.b		; 26 15
	eor $A41A.w,Y		; 59 1A A4
	eor $15.b,S		; 43 15
	ldy $5B15.w,X		; BC 15 5B
	ldy $55.b		; A4 55
	ora $AA.b,X		; 15 AA
	jmp ($0C83.w,X)		; 7C 83 0C
	sbc ($15.b,S),Y		; F3 15
	bit $C8D3.w		; 2C D3 C8
	bra  51.b		; 80 33
	sta $0542.w		; 8D 42 05
	plx		; FA
	sta ($7C.b,X)		; 81 7C
	cmp $15.b,S		; C3 15
	bit $155A.w,X		; 3C 5A 15
	lda $15.b		; A5 15
	stz $1C63.w		; 9C 63 1C
	sbc $C8.b,S		; E3 C8
	dey		; 88
	ora $75.b,X		; 15 75
	phd		; 0B
	pea $F807.w		; F4 07 F8
	ora $5E.b,X		; 15 5E
	lda ($24.b,X)		; A1 24
	ora $5B.b,X		; 15 5B
	ora $FC.b,S		; 03 FC
	ora $6E.b,X		; 15 6E
	ora $91.b,X		; 15 91
	ora $A6.b,X		; 15 A6
	ora $59.b,X		; 15 59
	stx $53.b,Y		; 96 53
	pea $DA05.w		; F4 05 DA
	cmp $08.b		; C5 08
	eor $15.b,S		; 43 15
	ldy $D10E.w,X		; BC 0E D1
	beq  15.b		; F0 0F
	inx		; E8
	ora [$4A.b],Y		; 17 4A
	ora $B5.b,X		; 15 B5
	jsr ($56D5.w,X)		; FC D5 56
	adc [$C0.b]		; 67 C0
	ora $8A.b,X		; 15 8A
	stz $87.b		; 64 87
	sec		; 38
	cpy #$27.b		; C0 27
	ora $1D.b,X		; 15 1D
	ora $E2.b,X		; 15 E2
	ora $E5.b,X		; 15 E5
	inc A		; 1A
	ora $53E6.w,Y		; 19 E6 53
	plb		; AB
	inc $62D5.w,X		; FE D5 62
	lda $10E0.w,X		; BD E0 10
	ora $6B.b,X		; 15 6B
	cmp $32.b		; C5 32
	tas		; 1B
	cpx #$46.b		; E0 46
	lda $5367.w,Y		; B9 67 53
	cpx #$D5.b		; E0 D5
	jsl $A21060.l		; 22 60 10 A2
	ora $5D.b,X		; 15 5D
	asl $3BF1.w		; 0E F1 3B
	beq -77.b		; F0 B3
	eor $08F5.w,X		; 5D F5 08
	beq 101.b		; F0 65
	sbc $F8.b,X		; F5 F8
	brk $11.b		; 00 11
	inc $1708.w		; EE 08 17
	adc $FF.b		; 65 FF
	adc $8F705D.l		; 6F 5D 70 8F
	jsr $69DF.w		; 20 DF 69
	txs		; 9A
	lda $B3FF.w,X		; BD FF B3
	txs		; 9A
	tsa		; 3B
	ora [$79.b]		; 07 79
	adc $07.b		; 65 07
	adc $645D.w,Y		; 79 5D 64
	ora $9B.b,X		; 15 9B
	adc [$01.b],Y		; 77 01
	asl $0102.w,X		; 1E 02 01
	lda $6FA6.w,X		; BD A6 6F
	txs		; 9A
	lda $D100.w,X		; BD 00 D1
	rol $13EC.w		; 2E EC 13
	eor ($AD.b)		; 52 AD
	.db $62, $15, $51		; 62 15 51
	rol $0708.w		; 2E 08 07
	adc [$66.b]		; 67 66
	lda ($25.b),Y		; B1 25
	adc [$00.b]		; 67 00
	ora $CC.b,X		; 15 CC
	and ($38.b,S),Y		; 33 38
	cmp [$62.b]		; C7 62
	lda #$15.b		; A9 15
	lsr $01.b,X		; 56 01
	inc $8F70.w,X		; FE 70 8F
	jsr $25DF.w		; 20 DF 25
	tsx		; BA
	and $00.b		; 25 00
	lda ($15.b,X)		; A1 15
	lsr $738C.w,X		; 5E 8C 73
	adc [$C0.b],Y		; 77 C0
	and $EB1462.l,X		; 3F 62 14 EB
	.db $62, $20, $DF		; 62 20 DF
	iny		; C8
	asl $F9.b		; 06 F9
	adc [$62.b],Y		; 77 62
	php		; 08
	sbc [$B3.b],Y		; F7 B3
	sty $15.b		; 84 15
	tda		; 7B
	.db $62, $C8, $30		; 62 C8 30
	cmp $A8E41B.l		; CF 1B E4 A8
	ora $57.b,X		; 15 57
	sta ($6D.b)		; 92 6D
	adc ($8C.b,S),Y		; 73 8C
	phb		; 8B
	stz $08.b,X		; 74 08
	sbc [$B9.b],Y		; F7 B9
	lsr $C8.b		; 46 C8
	ora $23.b,X		; 15 23
	jmp.w [$7E81]		; DC 81 7E
	jmp ($6283.w,X)		; 7C 83 62
	and ($CD.b)		; 32 CD
	asl $F9.b		; 06 F9
	ora $C8.b,X		; 15 C8
	and [$36.b],Y		; 37 36
	cmp #$C8.b		; C9 C8
	cmp $FA0530.l		; CF 30 05 FA
	dey		; 88
	ora $77.b,X		; 15 77
	sbc ($0E.b),Y		; F1 0E
	adc $0592.w		; 6D 92 05
	plx		; FA
	dec $40.b,X		; D6 40
	lda $4080C8.l,X		; BF C8 80 40
	trb $07E0.w		; 1C E0 07
	sed		; F8
	dec A		; 3A
	cmp $7A.b		; C5 7A
	ora $85.b,X		; 15 85
	ora $6B.b,X		; 15 6B
	ora $94.b,X		; 15 94
	jsr $40DF.w		; 20 DF 40
	lda $99FCAB.l,X		; BF AB FC 99
	adc [$53.b]		; 67 53
	cpx #$0C.b		; E0 0C
	sbc ($A7.b)		; F2 A7
	ora $58.b,X		; 15 58
	bcs  79.b		; B0 4F
	ora $45.b,X		; 15 45
	ora $BA.b,X		; 15 BA
	tsb $FB.b		; 04 FB
	adc [$E0.b]		; 67 E0
	tad		; 5B
	cmp $BD.b,X		; D5 BD
	cpy $15DC.w		; CC DC 15
	tsa		; 3B
	cpy $D6.b		; C4 D6
	ldy #$5F.b		; A0 5F
	lda $56FC.w,X		; BD FC 56
	jsl $C410E0.l		; 22 E0 10 C4
	ora $3B.b,X		; 15 3B
	tsb $FB.b		; 04 FB
	tsa		; 3B
	beq -77.b		; F0 B3
	ora $00.b,X		; 15 00
	brk $00.b		; 00 00
	brk $A5.b		; 00 A5
	brk $29.b		; 00 29
	ora ($AD.b,X)		; 01 AD
	ora ($52.b,X)		; 01 52
	cop $D6.b		; 02 D6
	cop $7B.b		; 02 7B
	ora $23.b,S		; 03 23
	clc		; 18
	cmp [$30.b]		; C7 30
	rol A		; 2A
	and $55F0.w,X		; 3D F0 55
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $6E247F.l,X		; FF 7F 24 6E
	sbc $035A03.l,X		; FF 03 5A 03
	sty $02.b,X		; 94 02
	sbc $014A01.l		; EF 01 4A 01
	lda $00.b		; A5 00
	brk $00.b		; 00 00
	sty $10.b		; 84 10
	lsr A		; 4A
	and #$EF.b		; 29 EF
	and $5294.w,X		; 3D 94 52
	phy		; 5A
	rtl		; 6B

	sbc $18237F.l,X		; FF 7F 23 18
	rol A		; 2A
	and $6E24.w,X		; 3D 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	bit $6E.b		; 24 6E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 02FFFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 02FFFF. Skipping.
.ENDS
