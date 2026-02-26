.BANK 24 SLOT 0
.ORG $0000

.SECTION "Bank24" FORCE

	pla		; 68
	ora ($00.b,X)		; 01 00
	ora $E8.b,S		; 03 E8
	ora ($00.b,X)		; 01 00
	tsb $70.b		; 04 70
	cop $00.b		; 02 00
	asl $48.b		; 06 48
	ora $00.b,S		; 03 00
	phd		; 0B
	tay		; A8
	tsb $00.b		; 04 00
	sta $D8.b		; 85 D8
	asl $00.b		; 06 00
	stx $10.b		; 86 10
	ora #$8C00.w		; 09 00 8C
	sei		; 78
	ora $8B00.w		; 0D 00 8B
	cld		; D8
	ora ($00.b),Y		; 11 00
	cop $30.b		; 02 30
	ora ($00.b)		; 12 00
	tsb $B8.b		; 04 B8
	ora ($00.b)		; 12 00
	cop $F0.b		; 02 F0
	ora ($00.b)		; 12 00
	cop $28.b		; 02 28
	ora ($00.b,S),Y		; 13 00
	cop $60.b		; 02 60
	ora ($00.b,S),Y		; 13 00
	cop $98.b		; 02 98
	ora ($00.b,S),Y		; 13 00
	cop $D0.b		; 02 D0
	ora ($00.b,S),Y		; 13 00
	cop $08.b		; 02 08
	trb $00.b		; 14 00
	cop $60.b		; 02 60
	trb $00.b		; 14 00
	cop $B8.b		; 02 B8
	trb $00.b		; 14 00
	cop $F0.b		; 02 F0
	trb $00.b		; 14 00
	cop $28.b		; 02 28
	ora $00.b,X		; 15 00
	ora ($58.b,X)		; 01 58
	ora $00.b,X		; 15 00
	ora ($88.b,X)		; 01 88
	ora $00.b,X		; 15 00
	ora ($B8.b,X)		; 01 B8
	ora $00.b,X		; 15 00
	ora ($E8.b,X)		; 01 E8
	ora $00.b,X		; 15 00
	ora ($18.b,X)		; 01 18
	asl $00.b,X		; 16 00
	ora ($48.b,X)		; 01 48
	asl $00.b,X		; 16 00
	ora ($78.b,X)		; 01 78
	asl $00.b,X		; 16 00
	ora ($A8.b,X)		; 01 A8
	asl $00.b,X		; 16 00
	ora ($D8.b,X)		; 01 D8
	asl $00.b,X		; 16 00
	ora ($08.b,X)		; 01 08
	ora [$00.b],Y		; 17 00
	ora ($38.b,X)		; 01 38
	ora [$00.b],Y		; 17 00
	ora ($68.b,X)		; 01 68
	ora [$00.b],Y		; 17 00
	ora ($98.b,X)		; 01 98
	ora [$00.b],Y		; 17 00
	ora ($C8.b,X)		; 01 C8
	ora [$00.b],Y		; 17 00
	ora ($F8.b,X)		; 01 F8
	ora [$00.b],Y		; 17 00
	ora ($28.b,X)		; 01 28
	clc		; 18
	brk $01.b		; 00 01
	cli		; 58
	clc		; 18
	brk $01.b		; 00 01
	dey		; 88
	clc		; 18
	brk $01.b		; 00 01
	clv		; B8
	clc		; 18
	brk $01.b		; 00 01
	inx		; E8
	clc		; 18
	brk $02.b		; 00 02
	rti		; 40

	ora $0400.w,Y		; 19 00 04
	iny		; C8
	ora $0600.w,Y		; 19 00 06
	ldy #$001A.w		; A0 1A 00
	phd		; 0B
	brk $1C.b		; 00 1C
	brk $85.b		; 00 85
	bmi  30.b		; 30 1E
	brk $86.b		; 00 86
	inx		; E8
	jsr $8C00.w		; 20 00 8C
	bne  37.b		; D0 25
	brk $8C.b		; 00 8C
	clv		; B8
	rol A		; 2A
	brk $03.b		; 00 03
	sec		; 38
	pld		; 2B
	brk $04.b		; 00 04
	cpy #$002B.w		; C0 2B 00
	tsb $68.b		; 04 68
	bit $0700.w		; 2C 00 07
	dey		; 88
	and $0A00.w		; 2D 00 0A
	jsr $002F.w		; 20 2F 00
	trb $48.b		; 14 48
	and ($00.b)		; 32 00
	bit #$3718.w		; 89 18 37
	brk $8C.b		; 00 8C
	bra  61.b		; 80 3D
	brk $93.b		; 00 93
	ldy #$0047.w		; A0 47 00
	sta [$E0.b],Y		; 97 E0
	eor ($00.b,S),Y		; 53 00
	ora $90.b		; 05 90
	mvn $06,$00		; 54 00 06
	dey		; 88
	eor $00.b,X		; 55 00
	tsb $30.b		; 04 30
	lsr $00.b,X		; 56 00
	ora [$50.b]		; 07 50
	eor [$00.b],Y		; 57 00
	asl A		; 0A
	inx		; E8
	cli		; 58
	brk $13.b		; 00 13
	tay		; A8
	tad		; 5B
	brk $8A.b		; 00 8A
	brk $61.b		; 00 61
	brk $8D.b		; 00 8D
	beq 103.b		; F0 67
	brk $91.b		; 00 91
	brk $71.b		; 00 71
	brk $96.b		; 00 96
	clv		; B8
	jmp ($0400.w,X)		; 7C 00 04
	rts		; 60

	adc $0700.w,X		; 7D 00 07
	bra 126.b		; 80 7E
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	ora ($06.b,X)		; 01 06
	sed		; F8
	brk $01.b		; 00 01
	asl A		; 0A
	bcc   2.b		; 90 02
	ora ($14.b,X)		; 01 14
	clv		; B8
	ora $01.b		; 05 01
	dey		; 88
	brk $0A.b		; 00 0A
	ora ($8C.b,X)		; 01 8C
	pla		; 68
	bpl   1.b		; 10 01
	sta ($88.b,S),Y		; 93 88
	inc A		; 1A
	ora ($96.b,X)		; 01 96
	rti		; 40

	rol $01.b		; 26 01
	tsb $E8.b		; 04 E8
	rol $01.b		; 26 01
	ora [$08.b]		; 07 08
	plp		; 28
	ora ($02.b,X)		; 01 02
	rts		; 60

	plp		; 28
	ora ($04.b,X)		; 01 04
	php		; 08
	and #$0601.w		; 29 01 06
	brk $2A.b		; 00 2A
	ora ($0C.b,X)		; 01 0C
	tay		; A8
	pld		; 2B
	ora ($85.b,X)		; 01 85
	cli		; 58
	rol $8601.w		; 2E 01 86
	bcc  49.b		; 90 31
	ora ($8A.b,X)		; 01 8A
	inx		; E8
	rol $01.b,X		; 36 01
	phb		; 8B
	iny		; C8
	bit $0201.w,X		; 3C 01 02
	jsr $013D.w		; 20 3D 01
	tsb $03.b		; 04 03
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	ora $F7.b		; 05 F7
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000401.l,X		; FF 01 04 00
	brk $FD.b		; 00 FD
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $20.b		; 00 20
	bpl   0.b		; 10 00
	adc $00A000.l,X		; 7F 00 A0 00
	cmp $108000.l,X		; DF 00 80 10
	brk $00.b		; 00 00
	sbc $20E000.l,X		; FF 00 E0 20
	bpl   0.b		; 10 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	sbc $90007F.l,X		; FF 7F 00 90
	adc $00FF00.l		; 6F 00 FF 00
	cpx #$0040.w		; E0 40 00
	brk $E0.b		; 00 E0
	bpl  80.b		; 10 50
	brk $B0.b		; 00 B0
	brk $10.b		; 00 10
	bra   0.b		; 80 00
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	rti		; 40

	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	beq -32.b		; F0 E0
	brk $90.b		; 00 90
	rts		; 60

	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
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
	brk $FC.b		; 00 FC
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	asl $F6.b		; 06 F6
	sbc $F6FFF8.l,X		; FF F8 FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $000401.l,X		; FF 01 04 00
	brk $F8.b		; 00 F8
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $02FFFE.l,X		; FF FE FF 02
	mvp $00,$00		; 44 00 00
	ora $083000.l,X		; 1F 00 30 08
	brk $7F.b		; 00 7F
	bpl -96.b		; 10 A0
	brk $DF.b		; 00 DF
	jsr ($0080.w,X)		; FC 80 00
	bra   8.b		; 80 08
	brk $1F.b		; 00 1F
	brk $30.b		; 00 30
	php		; 08
	brk $00.b		; 00 00
	adc $FF0000.l,X		; 7F 00 00 FF
	jmp ($7F03.w,X)		; 7C 03 7F
	brk $88.b		; 00 88
	adc [$F0.b],Y		; 77 F0
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	jsr ($0A12.w,X)		; FC 12 0A
	brk $F6.b		; 00 F6
	ror $0002.w,X		; 7E 02 00
	cop $20.b		; 02 20
	brk $F0.b		; 00 F0
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	inc $807C.w,X		; FE 7C 80
	jsr ($2200.w,X)		; FC 00 22
	jmp.w [$FF00]		; DC 00 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	ora $00.b		; 05 00
	sbc [$09.b],Y		; F7 09
	sbc ($FF.b,S),Y		; F3 FF
	sbc [$FF.b],Y		; F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFF3FF.l,X		; FF FF F3 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc ($FF.b,S),Y		; F3 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	xce		; FB
	sbc $000403.l,X		; FF 03 04 00
	brk $FF.b		; 00 FF
	sbc $04FFFB.l,X		; FF FB FF 04
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	sbc $004403.l,X		; FF 03 44 00
	brk $08.b		; 00 08
	bpl  16.b		; 10 10
	asl $17.b		; 06 17
	jsr $7F00.w		; 20 00 7F
	bpl -89.b		; 10 A7
	brk $FF.b		; 00 FF
	ora $7FF2.w		; 0D F2 7F
	sbc $18001F.l,X		; FF 1F 00 18
	asl $3F.b		; 06 3F
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	ora [$00.b]		; 07 00
	brk $7F.b		; 00 7F
	sbc $020001.l		; EF 01 00 02
	ora ($01.b,X)		; 01 01
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	sbc $00FC01.l,X		; FF 01 FC 00
	sbc $FFA956.l,X		; FF 56 A9 FF
	sbc $0300FF.l,X		; FF FF 00 03
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	jsr ($0000.w,X)		; FC 00 00
	sbc $00F0FE.l,X		; FF FE F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $A0.b		; 00 A0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	cpy #$00E0.w		; C0 E0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpx #$0000.w		; E0 00 00
	ora ($80.b,X)		; 01 80
	brk $80.b		; 00 80
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F0000.l,X		; 7F 00 00 7F
	cop $FD.b		; 02 FD
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $08.b		; 00 08
	brk $F3.b		; 00 F3
	ora $FFED.w		; 0D ED FF
	sbc ($FF.b,S),Y		; F3 FF
	sed		; F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F8.b		; 00 F8
	sbc $004400.l,X		; FF 00 44 00
	brk $FE.b		; 00 FE
	sbc $01FFF8.l,X		; FF F8 FF 01
	mvp $00,$00		; 44 00 00
	sbc ($FF.b,S),Y		; F3 FF
	beq  -1.b		; F0 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	xce		; FB
	sbc $03FFF0.l,X		; FF F0 FF 03
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F0.b		; 00 F0
	sbc $004402.l,X		; FF 02 44 00
	brk $FE.b		; 00 FE
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $05FFE8.l,X		; FF E8 FF 05
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $06FFE8.l,X		; FF E8 FF 06
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $E8.b		; 00 E8
	sbc $000407.l,X		; FF 07 04 00
	brk $7F.b		; 00 7F
	cpy #$C07F.w		; C0 7F C0
	lda $FF00FF.l,X		; BF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	and $003F00.l,X		; 3F 00 3F 00
	adc $3FC000.l,X		; 7F 00 C0 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $09.b		; 04 09
	tsb $08.b		; 04 08
	adc $D8D47F.l,X		; 7F 7F D4 D8
	cpx #$3FEF.w		; E0 EF 3F
	and $46BD46.l,X		; 3F 46 BD 46
	lda $000F.w,X		; BD 0F 00
	ora $000000.l		; 0F 00 00 00
	rol $1F01.w,X		; 3E 01 1F
	brk $C0.b		; 00 C0
	brk $7B.b		; 00 7B
	xce		; FB
	tda		; 7B
	xce		; FB
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $FD02FF.l,X		; FF FF 02 FD
	.db $82, $7D, $E0		; 82 7D E0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $10FFFF.l,X		; FF FF FF 10
	sbc $07EE11.l		; EF 11 EE 07
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	bpl -64.b		; 10 C0
	sty $0000.w		; 8C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $007000.l,X		; 3F 00 70 00
	cpx #$000C.w		; E0 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $05.b		; 00 05
	bra  16.b		; 80 10
	brk $EF.b		; 00 EF
	ora ($E8.b),Y		; 11 E8
	sbc $F0FFEF.l,X		; FF EF FF F0
	sbc $000400.l,X		; FF 00 04 00
	brk $FF.b		; 00 FF
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $F0.b		; 00 F0
	sbc $004400.l,X		; FF 00 44 00
	brk $F1.b		; 00 F1
	sbc $04FFE0.l,X		; FF E0 FF 04
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $E0.b		; 00 E0
	sbc $000406.l,X		; FF 06 04 00
	brk $2C.b		; 00 2C
	ror $DE59.w		; 6E 59 DE
	bvc -33.b		; 50 DF
	brk $FF.b		; 00 FF
	cpx #$E09F.w		; E0 9F E0
	sta $9FBF7F.l,X		; 9F 7F BF 9F
	cpx #$001F.w		; E0 1F 00
	and $002000.l,X		; 3F 00 20 00
	brk $FF.b		; 00 FF
	adc $7C7F7C.l,X		; 7F 7C 7F 7C
	brk $80.b		; 00 80
	sta $400000.l,X		; 9F 00 00 40
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	lda $B146.w,Y		; B9 46 B1
	lsr $FFFF.w		; 4E FF FF
	sbc $7F8008.l,X		; FF 08 80 7F
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $00FF00.l		; 0F 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc ($0C.b,S),Y		; F3 0C
	sta ($6E.b),Y		; 91 6E
	sbc $02FFFF.l,X		; FF FF FF 02
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FF00.w,X		; FE 00 FF
	brk $06.b		; 00 06
	lsr $0F33.w		; 4E 33 0F
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	ldy #$A05F.w		; A0 5F A0
	eor $FFFFFF.l,X		; 5F FF FF FF
	brk $3F.b		; 00 3F
	cpy #$00FF.w		; C0 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $E7FFE7.l,X		; FF E7 FF E7
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sta $BF205F.l,X		; 9F 5F 20 BF
	rti		; 40

	rts		; 60

	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $78.b		; 00 78
	ora $003F80.l,X		; 1F 80 3F 00
	rts		; 60

	ora $003FC0.l,X		; 1F C0 3F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($FC00.w,X)		; FC 00 FC
	ora $FFFF08.l		; 0F 08 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	rts		; 60

	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $60FF00.l,X		; FF 00 FF 60
	sta $00FF00.l,X		; 9F 00 FF 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	cop $FF.b		; 02 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $C0.b		; 00 C0
	and $000300.l,X		; 3F 00 03 00
	ora [$00.b]		; 07 00
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	and $00FF00.l,X		; 3F 00 FF 00
	ora [$00.b]		; 07 00
	ora [$02.b]		; 07 02
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	php		; 08
	tsb $08.b		; 04 08
	trb $18.b		; 14 18
	ora $18.b,X		; 15 18
	bit $38.b,X		; 34 38
	adc $0003FF.l,X		; 7F FF 03 00
	ora [$00.b]		; 07 00
	asl $0E00.w		; 0E 00 0E
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	cpx #$FF00.w		; E0 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00FF.w		; 0E FF 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	asl $FF00.w		; 0E 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	jsr $2040.w		; 20 40 20
	bvc  48.b		; 50 30
	bvc  48.b		; 50 30
	cli		; 58
	sec		; 38
	jsr ($80FE.w,X)		; FC FE 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	bra  16.b		; 80 10
	brk $EB.b		; 00 EB
	asl $E2.b,X		; 16 E2
	sbc $E2FFEB.l,X		; FF EB FF E2
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $02FFE2.l,X		; FF E2 FF 02
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $E2.b		; 00 E2
	sbc $004400.l,X		; FF 00 44 00
	brk $EB.b		; 00 EB
	sbc $04FFF2.l,X		; FF F2 FF 04
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $06FFF2.l,X		; FF F2 FF 06
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F2.b		; 00 F2
	sbc $004404.l,X		; FF 04 44 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($02.b,X)		; 01 02
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	ora $408040.l		; 0F 40 80 40
	sta [$40.b]		; 87 40
	sta $C000CF.l		; 8F CF 00 C0
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	asl $1F00.w		; 0E 00 1F
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $0E.b		; 00 0E
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $DFA000.l,X		; FF 00 A0 DF
	bra -64.b		; 80 C0
	sta $E04FE0.l		; 8F E0 4F E0
	rti		; 40

	cpx #$AFCF.w		; E0 CF AF
	bcc  80.b		; 90 50
	jsr $3FAF.w		; 20 AF 3F
	adc $1F003F.l,X		; 7F 3F 00 1F
	brk $1F.b		; 00 1F
	bra  31.b		; 80 1F
	bra  31.b		; 80 1F
	brk $30.b		; 00 30
	ora $3E1F60.l		; 0F 60 1F 3E
	sta ($00.b,X)		; 81 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $1E0000.l,X		; FF 00 00 1E
	sbc ($FF.b,S),Y		; F3 FF
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $50E11E.l,X		; FF 1E E1 50
	lda $FFFFFF.l		; AF FF FF FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $A7FF00.l,X		; FF 00 FF A7
	cli		; 58
	beq -16.b		; F0 F0
	sbc $10FF10.l,X		; FF 10 FF 10
	beq  16.b		; F0 10
	sbc $0000FF.l,X		; FF FF 00 00
	ora [$FC.b]		; 07 FC
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	brk $1F.b		; 00 1F
	tsb $3E3C.w		; 0C 3C 3E
	adc $6CFE29.l,X		; 7F 29 FE 6C
	xce		; FB
	bvs  -1.b		; 70 FF
	brk $FF.b		; 00 FF
	ldy #$00DF.w		; A0 DF 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $007F3F.l,X		; FF 3F 7F 00
	sbc $C00000.l,X		; FF 00 00 C0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00413E.l,X		; FF 3E 41 00
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	ora $FF00FF.l		; 0F FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003FFF.l,X		; FF FF 3F 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $002BD4.l,X		; FF D4 2B 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0048B7.l,X		; FF B7 48 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	bvs   0.b		; 70 00
	sbc $00FE00.l,X		; FF 00 FE 00
	inc $FE00.w,X		; FE 00 FE
	.db $82, $FE, $00		; 82 FE 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $00FE00.l,X		; FF 00 FE 00
	inc $7C82.w,X		; FE 82 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($0C.b)		; 12 0C
	asl $00F3.w,X		; 1E F3 00
	and $001F00.l,X		; 3F 00 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	sbc $E11E.w		; ED 1E E1
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $03.b		; 04 03
	ora [$FC.b]		; 07 FC
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $FB.b		; 04 FB
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $2080.w		; 0C 80 20
	brk $E7.b		; 00 E7
	ora $FFDC.w,Y		; 19 DC FF
	sbc [$FF.b]		; E7 FF
	jmp.w [$00FF]		; DC FF 00
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $02FFDC.l,X		; FF DC FF 02
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $DC.b		; 00 DC
	sbc $004400.l,X		; FF 00 44 00
	brk $FA.b		; 00 FA
	sbc $02FFDC.l,X		; FF DC FF 02
	mvp $00,$00		; 44 00 00
	sbc [$FF.b]		; E7 FF
	cpx $04FF.w		; EC FF 04
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $06FFEC.l,X		; FF EC FF 06
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $EC.b		; 00 EC
	sbc $000408.l,X		; FF 08 04 00
	brk $17.b		; 00 17
	brk $EC.b		; 00 EC
	sbc $00040A.l,X		; FF 0A 04 00
	brk $E7.b		; 00 E7
	sbc $0CFFFC.l,X		; FF FC FF 0C
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $0EFFFC.l,X		; FF FC FF 0E
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $FC.b		; 00 FC
	sbc $00440C.l,X		; FF 0C 44 00
	brk $FA.b		; 00 FA
	sbc $0EFFFC.l,X		; FF FC FF 0E
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
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $1C.b		; 00 1C
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	eor ($B0.b,X)		; 41 B0
	cmp ($B0.b,X)		; C1 B0
	cmp $1F.b,S		; C3 1F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $7E.b		; 00 7E
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	ora ($FD.b,X)		; 01 FD
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$F000.w		; E0 00 F0
	brk $F8.b		; 00 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	beq   0.b		; F0 00
	sed		; F8
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $B0CFB0.l,X		; FF B0 CF B0
	cmp $1FCFB0.l		; CF B0 CF 1F
	sbc $47F047.l,X		; FF 47 F0 47
	beq  -1.b		; F0 FF
	brk $00.b		; 00 00
	sbc $3F7F3F.l,X		; FF 3F 7F 3F
	adc $007F3F.l,X		; 7F 3F 7F 00
	bra -113.b		; 80 8F
	brk $0F.b		; 00 0F
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	sbc $5CF22D.l,X		; FF 2D F2 5C
	sbc ($2D.b,S),Y		; F3 2D
	sbc ($FF.b)		; F2 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $AF8FDF.l,X		; FF DF 8F AF
	sta $008FDF.l		; 8F DF 8F 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $35FF00.l,X		; FF 00 FF 35
	dex		; CA
	bra 127.b		; 80 7F
	sbc $20FFFF.l,X		; FF FF FF 20
	sbc $00FF20.l,X		; FF 20 FF 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $003FFF.l,X		; FF FF 3F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $61F2.w		; 0D F2 61
	stz $F20D.w,X		; 9E 0D F2
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	asl $F9.b		; 06 F9
	sta $E91671.l		; 8F 71 16 E9
	sbc $80FFFF.l,X		; FF FF FF 80
	sbc $00FF80.l,X		; FF 80 FF 00
	brk $FF.b		; 00 FF
	sbc $FEFEFE.l,X		; FF FE FE FE
	sbc $0080FE.l,X		; FF FE 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sta ($FE.b,X)		; 81 FE
	eor ($FE.b,X)		; 41 FE
	sta ($FE.b,X)		; 81 FE
	sbc $01FCFF.l,X		; FF FF FC 01
	jsr ($FF01.w,X)		; FC 01 FF
	brk $00.b		; 00 00
	sbc $BF3F7F.l,X		; FF 7F 3F BF
	and $003F7F.l,X		; 3F 7F 3F 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$60A0.w		; E0 A0 60
	ldy #$A060.w		; A0 60 A0
	rts		; 60

	brk $E0.b		; 00 E0
	rti		; 40

	cpx #$E040.w		; E0 40 E0
	cpx #$0000.w		; E0 00 00
	cpx #$C080.w		; E0 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $20.b		; 00 20
	jsr $0000.w		; 20 00 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
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
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $0F.b		; 00 0F
	asl $3E.b		; 06 3E
	clc		; 18
	ply		; 7A
	bmi 116.b		; 30 74
	bmi  -5.b		; 30 FB
	sei		; 78
	sbc $010001.l,X		; FF 01 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	ora ($0C.b,X)		; 01 0C
	ora $03.b,S		; 03 03
	tsb $00.b		; 04 00
	brk $B3.b		; 00 B3
	cpy #$C030.w		; C0 30 C0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr $30C2.w		; 20 C2 30
	cmp ($FC.b,X)		; C1 FC
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	beq -64.b		; F0 C0
	lda [$CF.b]		; A7 CF
	and $005F90.l		; 2F 90 5F 00
	ldy #$7F20.w		; A0 20 7F
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	sta $001F00.l		; 8F 00 1F 00
	ora $0F3000.l,X		; 1F 00 30 0F
	rts		; 60

	ora $001FE0.l,X		; 1F E0 1F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc [$07.b],Y		; F7 07
	tsb $04.b		; 04 04
	wai		; CB
	ora [$1C.b]		; 07 1C
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ora [$F8.b]		; 07 F8
	tsb $FB.b		; 04 FB
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	and $FF0020.l,X		; 3F 20 00 FF
	sbc $BF00FF.l,X		; FF FF 00 BF
	bra -128.b		; 80 80
	bra  79.b		; 80 4F
	bra -32.b		; 80 E0
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra -128.b		; 80 80
	brk $FF.b		; 00 FF
	sbc $BD00FF.l,X		; FF FF 00 BD
	bit $2424.w,X		; 3C 24 24
	phy		; 5A
	bit $00E7.w,X		; 3C E7 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $24C33C.l,X		; FF 3C C3 24
	stp		; DB
	bit $00C3.w,X		; 3C C3 00
	sbc $000100.l,X		; FF 00 01 00
	jsr ($FEFE.w,X)		; FC FE FE
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	cpx #$A060.w		; E0 60 A0
	rts		; 60

	bra  32.b		; 80 20
	rti		; 40

	brk $A0.b		; 00 A0
	bra -64.b		; 80 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  32.b		; 80 20
	brk $E3.b		; 00 E3
	asl $FFD6.w,X		; 1E D6 FF
	sbc $FF.b,S		; E3 FF
	beq  -1.b		; F0 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	beq  -1.b		; F0 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	ora $FFF000.l		; 0F 00 F0 FF
	brk $44.b		; 00 44
	brk $00.b		; 00 00
	sbc $FFF0FF.l,X		; FF FF F0 FF
	cop $44.b		; 02 44
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	cpx #$04FF.w		; E0 FF 04
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $06FFE0.l,X		; FF E0 FF 06
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	brk $E0.b		; 00 E0
	sbc $004404.l,X		; FF 04 44 00
	brk $FF.b		; 00 FF
	sbc $08FFE0.l,X		; FF E0 FF 08
	tsb $00.b		; 04 00
	brk $EB.b		; 00 EB
	sbc $0AFFD0.l,X		; FF D0 FF 0A
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $0CFFD0.l,X		; FF D0 FF 0C
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $D0.b		; 00 D0
	sbc $00040E.l,X		; FF 0E 04 00
	brk $D3.b		; 00 D3
	inx		; E8
	eor ($E8.b,S),Y		; 53 E8
	bne -24.b		; D0 E8
	bcc -21.b		; 90 EB
	sta [$E7.b],Y		; 97 E7
	jsr $48C8.w		; 20 C8 48
	sta $87B010.l,X		; 9F 10 B0 87
	brk $07.b		; 00 07
	bra   7.b		; 80 07
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $18.b		; 00 18
	ora [$38.b]		; 07 38
	ora [$70.b]		; 07 70
	ora $FF00FF.l		; 0F FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $0000.w,X		; FD 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $04FF04.l,X		; FF 04 FF 04
	ora [$04.b]		; 07 04
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $E8.b		; 00 E8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	cpx #$FF1F.w		; E0 1F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	ora ($05.b,X)		; 01 05
	ora ($03.b,X)		; 01 03
	ora $335C1D.l		; 0F 1D 5C 33
	and ($65.b),Y		; 31 65
	adc $64.b,S		; 63 64
	sbc [$00.b]		; E7 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	brk $10.b		; 00 10
	brk $63.b		; 00 63
	brk $4F.b		; 00 4F
	brk $9D.b		; 00 9D
	brk $18.b		; 00 18
	brk $3F.b		; 00 3F
	cpy #$C03C.w		; C0 3C C0
	sbc $0000FF.l,X		; FF FF 00 00
	stz $9EE3.w		; 9C E3 9E
	sbc ($3F.b,X)		; E1 3F
	cpy #$7F00.w		; C0 00 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $01FE00.l,X		; FF 00 FE 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	bra  -1.b		; 80 FF
	bra   0.b		; 80 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	bra 127.b		; 80 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	ora ($FF.b,X)		; 01 FF
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ora ($FE.b,X)		; 01 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora $08.b,S		; 03 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $000000.l		; 0F 00 00 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	jsr ($0001.w,X)		; FC 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
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
	brk $20.b		; 00 20
	adc $00E000.l,X		; 7F 00 E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $E03F00.l,X		; 7F 00 3F E0
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	xce		; FB
	brk $06.b		; 00 06
	brk $FF.b		; 00 FF
	brk $C3.b		; 00 C3
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C3.b		; 00 C3
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $FB.b		; 00 FB
	brk $EC.b		; 00 EC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl -17.b		; 10 EF
	cpx #$001F.w		; E0 1F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $62.b		; 00 62
	sbc $00.b,S		; E3 00
	brk $00.b		; 00 00
	sbc $B8C7B8.l,X		; FF B8 C7 B8
	cmp [$B8.b]		; C7 B8
	cmp [$8F.b]		; C7 8F
	cpx #$DF6F.w		; E0 6F DF
	trb $FF00.w		; 1C 00 FF
	brk $00.b		; 00 00
	sbc $3F7F3F.l,X		; FF 3F 7F 3F
	adc $1F7F3F.l,X		; 7F 3F 7F 1F
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $1FE81F.l,X		; FF 1F E8 1F
	pea $E81F.w		; F4 1F E8
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc [$E3.b],Y		; F7 E3
	xba		; EB
	sbc $F7.b,S		; E3 F7
	sbc $FF.b,S		; E3 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $46FF00.l,X		; FF 00 FF 46
	lda $8F70.w,Y		; B9 70 8F
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	bcs  79.b		; B0 4F
	bit #$B476.w		; 89 76 B4
	phk		; 4B
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	php		; 08
	sbc [$9B.b],Y		; F7 9B
	stz $48.b		; 64 48
	lda [$FF.b],Y		; B7 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $018F70.l,X		; FF 70 8F 01
	inc $8D72.w,X		; FE 72 8D
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	cpx #$0700.w		; E0 00 07
	brk $16.b		; 00 16
	ora #$120C.w		; 09 0C 12
	bit $0810.w		; 2C 10 08
	bit $58.b,X		; 34 58
	bit $19.b		; 24 19
	adc $9C.b		; 65 9C
	adc $0F.b,S		; 63 0F
	brk $1F.b		; 00 1F
	brk $1E.b		; 00 1E
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $7C.b		; 00 7C
	brk $7D.b		; 00 7D
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	bit $FE82.w,X		; 3C 82 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
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
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora [$08.b]		; 07 08
	ora $FF0F00.l		; 0F 00 0F FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $FE.b		; 00 FE
	brk $06.b		; 00 06
	sbc $0403.w,Y		; F9 03 04
	ora $00.b,S		; 03 00
	ora ($02.b,X)		; 01 02
	ora ($F2.b),Y		; 11 F2
	ora #$03FA.w		; 09 FA 03
	jsr ($00FF.w,X)		; FC FF 00
	sbc $000700.l,X		; FF 00 07 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sbc ($00.b,S),Y		; F3 00
	xce		; FB
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	cpy #$40A0.w		; C0 A0 40
	bra  96.b		; 80 60
	bcc  96.b		; 90 60
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	tsb $F9.b		; 04 F9
	sbc $F9FFFB.l,X		; FF FB FF F9
	sbc $000400.l,X		; FF 00 04 00
	brk $03.b		; 00 03
	brk $F9.b		; 00 F9
	sbc $000401.l,X		; FF 01 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $BF00FF.l,X		; FF FF 00 BF
	and $008080.l,X		; 3F 80 80 00
	cpy #$0000.w		; C0 00 00
	and $334000.l,X		; 3F 00 40 33
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$FF00.w		; C0 00 FF
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$4000.w		; C0 00 40
	brk $C0.b		; 00 C0
	rti		; 40

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	sbc $F606.w,Y		; F9 06 F6
	sbc $F6FFF9.l,X		; FF F9 FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $01.b		; 00 01
	brk $F6.b		; 00 F6
	sbc $000401.l,X		; FF 01 04 00
	brk $F9.b		; 00 F9
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000402.l,X		; FF 02 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $2FA01F.l,X		; 3F 1F A0 2F
	sbc $DFAF80.l,X		; FF 80 AF DF
	cmp $20001F.l,X		; DF 1F 00 20
	ora $7F1820.l,X		; 1F 20 18 7F
	brk $FF.b		; 00 FF
	brk $90.b		; 00 90
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	beq -32.b		; F0 E0
	trb $C8.b		; 14 C8
	jsr ($DC14.w,X)		; FC 14 DC
	cpx $E0EC.w		; EC EC E0
	brk $10.b		; 00 10
	cpx #$6010.w		; E0 10 60
	sed		; F8
	brk $FC.b		; 00 FC
	brk $24.b		; 00 24
	brk $E4.b		; 00 E4
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
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
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	asl $FD.b		; 06 FD
	inc $FBF9.w,X		; FE F9 FB
	sbc $00FFFA.l,X		; FF FA FF 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	phd		; 0B
	plx		; FA
	inc $F9F7.w,X		; FE F7 F9
	sbc $00FFF9.l,X		; FF F9 FF 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F9.b		; 00 F9
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora #$F8F8.w		; 09 F8 F8
	sbc $FFF8.w,Y		; F9 F8 FF
	sed		; F8
	sbc $000000.l,X		; FF 00 00 00
	brk $06.b		; 00 06
	brk $F8.b		; 00 F8
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora ($F5.b)		; 12 F5
	inc $F7.b,X		; F6 F7
	sbc $FF.b,X		; F5 FF
	inc $FF.b,X		; F6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$F600.w		; 09 00 F6
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	cpx #$E0E0.w		; E0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora $F0.b,X		; 15 F0
	inc $F2E9.w,X		; FE E9 F2
	sbc $00FFF4.l,X		; FF F4 FF 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $F4.b		; 00 F4
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	cpx #$E0E0.w		; E0 E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	inc $FE13.w		; EE 13 FE
	sbc $EE.b,S		; E3 EE
	sbc $00FFF1.l,X		; FF F1 FF 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	sed		; F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	asl $FDEB.w,X		; 1E EB FD
	dec $FFEB.w,X		; DE EB FF
	inc $00FF.w		; EE FF 00
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	brk $EE.b		; 00 EE
	sbc $000001.l,X		; FF 01 00 00
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
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	inx		; E8
	inc A		; 1A
	sbc $E8D8.w,X		; FD D8 E8
	sbc $00FFEB.l,X		; FF EB FF 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	brk $EB.b		; 00 EB
	sbc $000001.l,X		; FF 01 00 00
	brk $FC.b		; 00 FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00FC.w,X)		; FC FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FEFE.w,X		; FE FE FE
	inc $FEFE.w,X		; FE FE FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora [$FE.b]		; 07 FE
	xce		; FB
	jsr ($FFFB.w,X)		; FC FB FF
	xce		; FB
	sbc $000000.l,X		; FF 00 00 00
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora $FC.b		; 05 FC
	plx		; FA
	xce		; FB
	plx		; FA
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	brk $FA.b		; 00 FA
	sbc $000400.l,X		; FF 00 04 00
	brk $00.b		; 00 00
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	php		; 08
	xce		; FB
	xce		; FB
	jsr ($FFFB.w,X)		; FC FB FF
	xce		; FB
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $F8.b		; 05 F8
	inc $F8F7.w,X		; FE F7 F8
	sbc $00FFF9.l,X		; FF F9 FF 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	phd		; 0B
	inc $F8.b,X		; F6 F8
	sbc $FFF7.w,Y		; F9 F7 FF
	sed		; F8
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	asl $F1.b,X		; 16 F1
	inc $F7.b,X		; F6 F7
	sbc ($FF.b,S),Y		; F3 FF
	inc $FF.b,X		; F6 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $FEEC.w,Y		; 19 EC FE
	sbc #$FFF0.w		; E9 F0 FF
	pea $00FF.w		; F4 FF 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	trb $FEE7.w		; 1C E7 FE
	sbc $EC.b,S		; E3 EC
	sbc $00FFF1.l,X		; FF F1 FF 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	and [$E2.b]		; 27 E2
	sbc $E9DE.w,X		; FD DE E9
	sbc $00FFEE.l,X		; FF EE FF 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	and #$FDDE.w		; 29 DE FD
	cld		; D8
	sbc $FF.b		; E5 FF
	xba		; EB
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora #$FBFC.w		; 09 FC FB
	jsr ($FFFB.w,X)		; FC FB FF
	xce		; FB
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$FA.b]		; 07 FA
	inc $F9F7.w,X		; FE F7 F9
	sbc $00FFFB.l,X		; FF FB FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	php		; 08
	xce		; FB
	inc $03F9.w,X		; FE F9 03
	brk $FA.b		; 00 FA
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $FEF8.w		; 0D F8 FE
	sbc [$05.b],Y		; F7 05
	brk $F9.b		; 00 F9
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	phd		; 0B
	inc $F8.b,X		; F6 F8
	sbc $0008.w,Y		; F9 08 00
	sed		; F8
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	asl $F1.b,X		; 16 F1
	inc $F7.b,X		; F6 F7
	tsb $F600.w		; 0C 00 F6
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $FEEC.w,Y		; 19 EC FE
	sbc #$000F.w		; E9 0F 00
	pea $00FF.w		; F4 FF 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	trb $FEE7.w		; 1C E7 FE
	sbc $14.b,S		; E3 14
	brk $F1.b		; 00 F1
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	and [$E2.b]		; 27 E2
	sbc $16DE.w,X		; FD DE 16
	brk $EE.b		; 00 EE
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	and #$FDDE.w		; 29 DE FD
	cld		; D8
	inc A		; 1A
	brk $EB.b		; 00 EB
	sbc $000000.l,X		; FF 00 00 00
	brk $E0.b		; 00 E0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora #$FBFC.w		; 09 FC FB
	jsr ($0003.w,X)		; FC 03 00
	xce		; FB
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora [$FA.b]		; 07 FA
	inc $05F7.w,X		; FE F7 05
	brk $FB.b		; 00 FB
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	xce		; FB
	tsb $F9.b		; 04 F9
	sbc $F9FFFB.l,X		; FF FB FF F9
	sbc $000400.l,X		; FF 00 04 00
	brk $03.b		; 00 03
	brk $F9.b		; 00 F9
	sbc $000401.l,X		; FF 01 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $BF00FF.l,X		; FF FF 00 BF
	and $008080.l,X		; 3F 80 80 00
	cpy #$0000.w		; C0 00 00
	and $334000.l,X		; 3F 00 40 33
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$FF00.w		; C0 00 FF
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$4000.w		; C0 00 40
	brk $C0.b		; 00 C0
	rti		; 40

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	sbc $F606.w,Y		; F9 06 F6
	sbc $F6FFF9.l,X		; FF F9 FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $01.b		; 00 01
	brk $F6.b		; 00 F6
	sbc $000401.l,X		; FF 01 04 00
	brk $F9.b		; 00 F9
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000402.l,X		; FF 02 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $2FA01F.l,X		; 3F 1F A0 2F
	sbc $DFAF80.l,X		; FF 80 AF DF
	cmp $20001F.l,X		; DF 1F 00 20
	ora $7F1820.l,X		; 1F 20 18 7F
	brk $FF.b		; 00 FF
	brk $90.b		; 00 90
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	beq -32.b		; F0 E0
	trb $C8.b		; 14 C8
	jsr ($DC14.w,X)		; FC 14 DC
	cpx $E0EC.w		; EC EC E0
	brk $10.b		; 00 10
	cpx #$6010.w		; E0 10 60
	sed		; F8
	brk $FC.b		; 00 FC
	brk $24.b		; 00 24
	brk $E4.b		; 00 E4
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
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
	asl $00.b		; 06 00
	ora $00.b		; 05 00
	sbc [$09.b],Y		; F7 09
	sbc ($FF.b,S),Y		; F3 FF
	sbc [$FF.b],Y		; F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFF3FF.l,X		; FF FF F3 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc ($FF.b,S),Y		; F3 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	xce		; FB
	sbc $000403.l,X		; FF 03 04 00
	brk $FF.b		; 00 FF
	sbc $04FFFB.l,X		; FF FB FF 04
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	sbc $004403.l,X		; FF 03 44 00
	brk $07.b		; 00 07
	ora $101808.l		; 0F 08 18 10
	bpl  16.b		; 10 10
	bmi  47.b		; 30 2F
	bvc  64.b		; 50 40
	dey		; 88
	and $E7.b,S		; 23 E7
	cli		; 58
	sbc $100008.l,X		; FF 08 00 10
	ora [$00.b]		; 07 00
	tsb $0E20.w		; 0C 20 0E
	adc $00FF00.l,X		; 7F 00 FF 00
	stz $9700.w		; 9C 00 97
	brk $FC.b		; 00 FC
	inc $0302.w,X		; FE 02 03
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	inc $0001.w,X		; FE 01 00
	cop $F8.b		; 02 F8
	sbc $FF03.w,X		; FD 03 FF
	cop $00.b		; 02 00
	ora ($FC.b,X)		; 01 FC
	brk $06.b		; 00 06
	brk $0E.b		; 00 0E
	sbc $00FF00.l,X		; FF 00 FF 00
	asl $00.b		; 06 00
	jsr ($0040.w,X)		; FC 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rti		; 40

	rti		; 40

	jsr $A080.w		; 20 80 A0
	rti		; 40

	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	lda $E6DF80.l,X		; BF 80 DF E6
	sbc [$00.b]		; E7 00
	cpx #$E000.w		; E0 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq 112.b		; F0 70
	sbc $00F800.l,X		; FF 00 F8 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tsb $00FC.w		; 0C FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($FF.b,X)		; 01 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $08.b		; 00 08
	brk $F3.b		; 00 F3
	ora $FFED.w		; 0D ED FF
	sbc ($FF.b,S),Y		; F3 FF
	sed		; F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F8.b		; 00 F8
	sbc $004400.l,X		; FF 00 44 00
	brk $FE.b		; 00 FE
	sbc $01FFF8.l,X		; FF F8 FF 01
	mvp $00,$00		; 44 00 00
	sbc ($FF.b,S),Y		; F3 FF
	beq  -1.b		; F0 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	xce		; FB
	sbc $03FFF0.l,X		; FF F0 FF 03
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	sbc $000404.l,X		; FF 04 04 00
	brk $0B.b		; 00 0B
	brk $F0.b		; 00 F0
	sbc $000405.l,X		; FF 05 04 00
	brk $F7.b		; 00 F7
	sbc $06FFE8.l,X		; FF E8 FF 06
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $07FFE8.l,X		; FF E8 FF 07
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $E8.b		; 00 E8
	sbc $004406.l,X		; FF 06 44 00
	brk $D1.b		; 00 D1
	ror $BEC1.w,X		; 7E C1 BE
	adc [$58.b]		; 67 58
	adc $601CBF.l,X		; 7F BF 1C 60
	cmp [$F8.b]		; C7 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	sta ($00.b),Y		; 91 00
	cmp ($00.b,X)		; C1 00
	sbc $00FF38.l,X		; FF 38 FF 00
	adc $00FF80.l,X		; 7F 80 FF 00
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF1F.l,X		; FF 1F FF FF
	brk $00.b		; 00 00
	sbc $3F0000.l,X		; FF 00 00 3F
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	clc		; 18
	php		; 08
	bpl  24.b		; 10 18
	clc		; 18
	bpl  15.b		; 10 0F
	plp		; 28
	jmp $1794.w		; 4C 94 17
	plb		; AB
	tyx		; BB
	eor $105DBB.l,X		; 5F BB 5D 10
	ora $08.b		; 05 08
	ora [$08.b]		; 07 08
	ora [$3F.b]		; 07 3F
	brk $EF.b		; 00 EF
	brk $D6.b		; 00 D6
	brk $A2.b		; 00 A2
	brk $AB.b		; 00 AB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00F5F1.l,X		; FF F1 F5 00
	xce		; FB
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	asl $0E0E.w		; 0E 0E 0E
	asl $0406.w		; 0E 06 04
	adc $26.b,S		; 63 26
	ror $52.b,X		; 76 52
	inc $0602.w,X		; FE 02 06
	ora $FD.b		; 05 FD
	plx		; FA
	xce		; FB
	sbc $03F71B.l,X		; FF 1B F7 03
	pla		; 68
	adc $98.b		; 65 98
	stz $88.b,X		; 74 88
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $0800.w		; 0D 00 08
	brk $1A.b		; 00 1A
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	jsr $A000.w		; 20 00 A0
	ldy #$A040.w		; A0 40 A0
	rti		; 40

	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$6000.w		; E0 00 60
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	and $8040C0.l,X		; 3F C0 40 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	and $004000.l,X		; 3F 00 40 00
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
	sbc $050000.l,X		; FF 00 00 05
	bra  16.b		; 80 10
	brk $EF.b		; 00 EF
	ora ($E7.b),Y		; 11 E7
	sbc $F0FFEF.l,X		; FF EF FF F0
	sbc $000400.l,X		; FF 00 04 00
	brk $FF.b		; 00 FF
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $F0.b		; 00 F0
	sbc $004400.l,X		; FF 00 44 00
	brk $F2.b		; 00 F2
	sbc $04FFE0.l,X		; FF E0 FF 04
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $E0.b		; 00 E0
	sbc $000406.l,X		; FF 06 04 00
	brk $00.b		; 00 00
	and ($3C.b)		; 32 3C
	eor $137E.w		; 4D 7E 13
	eor $BD57AC.l,X		; 5F AC 57 BD
	ror $6CA1.w,X		; 7E A1 6C
	tyx		; BB
	bvs  31.b		; 70 1F
	and $007300.l,X		; 3F 00 73 00
	adc ($00.b,X)		; 61 00
	cpy $00.b		; C4 00
	rep #$00		; C2 00
	cmp ($00.b)		; D2 00
	cpy $6000.w		; CC 00 60
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $7F.b		; 00 7F
	sbc $80FF7F.l,X		; FF 7F FF 80
	adc $3FFF80.l,X		; 7F 80 FF 3F
	cpy #$00FF.w		; C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	brk $7F.b		; 00 7F
	brk $40.b		; 00 40
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr ($0000.w,X)		; FC 00 00
	sbc $5F1FFF.l,X		; FF FF 1F 5F
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$00FF.w		; E0 FF 00
	brk $00.b		; 00 00
	cpx #$0709.w		; E0 09 07
	asl $0F.b,X		; 16 0F
	ora $E6DF.w,Y		; 19 DF E6
	cmp $2FF7.w,X		; DD F7 2F
	bne  38.b		; D0 26
	xce		; FB
	sta ($7F.b,X)		; 81 7F
	sbc $00F900.l,X		; FF 00 F9 00
	beq   0.b		; F0 00
	bit $00.b		; 24 00
	plp		; 28
	brk $49.b		; 00 49
	brk $C6.b		; 00 C6
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $2F0F11.l,X		; BF 11 0F 2F
	ora $3000BF.l,X		; 1F BF 00 30
	cmp $00F770.l		; CF 70 F7 00
	ror $7E00.w,X		; 7E 00 7E
	lda $9E7F40.l,X		; BF 40 7F 9E
	and $40BFC0.l,X		; 3F C0 BF 40
	sbc $0FF000.l,X		; FF 00 F0 0F
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
	ora [$C7.b]		; 07 C7
	sbc $FFFF04.l,X		; FF 04 FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	jsr ($FFFC.w,X)		; FC FC FF
	tsb $FF.b		; 04 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	sbc ($1E.b),Y		; F1 1E
	inc $FFFF.w,X		; FE FF FF
	brk $01.b		; 00 01
	inc $FD01.w,X		; FE 01 FD
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	sbc $0FFF00.l,X		; FF 00 FF 0F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FE0100.l,X		; FF 00 01 FE
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	tsb $1008.w		; 0C 08 10
	ora ($30.b,S),Y		; 13 30
	bpl  38.b		; 10 26
	rol $20.b		; 26 20
	bit $20.b		; 24 20
	bit $6C60.w		; 2C 60 6C
	cmp $0304E0.l,X		; DF E0 04 03
	ora $0C.b,S		; 03 0C
	jsr $010C.w		; 20 0C 01
	clc		; 18
	ora $18.b,S		; 03 18
	phd		; 0B
	bpl   3.b		; 10 03
	bpl -65.b		; 10 BF
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc [$00.b]		; E7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0200FF.l,X		; 1F FF 00 02
	sbc $18E7.w,X		; FD E7 18
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	and $FF3FC0.l,X		; 3F C0 3F FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	rol $0000.w,X		; 3E 00 00
	ora ($0D.b,X)		; 01 0D
	tsb $001F.w		; 0C 1F 00
	ora $FFFF00.l,X		; 1F 00 FF FF
	brk $01.b		; 00 01
	inc $C13E.w,X		; FE 3E C1
	brk $01.b		; 00 01
	brk $0C.b		; 00 0C
	tsb $0C1E.w		; 0C 1E 0C
	sbc ($00.b)		; F2 00
	sbc $8000FF.l,X		; FF FF 00 80
	bra  64.b		; 80 40
	rti		; 40

	rts		; 60

	rti		; 40

	jsr $2A20.w		; 20 20 2A
	rol $26.b		; 26 26
	ldy $B63A.w		; AC 3A B6
	cld		; D8
	sec		; 38
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	jsr $0080.w		; 20 80 00
	cpy #$C00E.w		; C0 0E C0
	.db $82, $40, $0E		; 82 40 0E
	cpy #$00E8.w		; C0 E8 00
	asl $80.b		; 06 80
	trb $00.b		; 14 00
	xba		; EB
	asl $E1.b,X		; 16 E1
	sbc $E1FFEB.l,X		; FF EB FF E1
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $02FFE1.l,X		; FF E1 FF 02
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $E1.b		; 00 E1
	sbc $000404.l,X		; FF 04 04 00
	brk $EB.b		; 00 EB
	sbc $06FFF1.l,X		; FF F1 FF 06
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $08FFF1.l,X		; FF F1 FF 08
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F1.b		; 00 F1
	sbc $004406.l,X		; FF 06 44 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($03.b,X)		; 01 03
	ora $02.b,S		; 03 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($7F.b,X)		; 01 7F
	adc $80C0FF.l,X		; 7F FF C0 80
	sta $000000.l		; 8F 00 00 00
	brk $10.b		; 00 10
	bpl  16.b		; 10 10
	bmi  16.b		; 30 10
	bmi   0.b		; 30 00
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	bvs   0.b		; 70 00
	sbc $0EE000.l,X		; FF 00 E0 0E
	rts		; 60

	ora $400F40.l		; 0F 40 0F 40
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FA.b		; 00 FA
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $05FA00.l,X		; FF 00 FA 05
	ora [$F8.b]		; 07 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra 127.b		; 80 7F
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	ora $07.b,S		; 03 07
	cop $17.b		; 02 17
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	phd		; 0B
	ora [$1A.b]		; 07 1A
	sbc $E0.b		; E5 E0
	cpx #$30F0.w		; E0 F0 30
	clc		; 18
	clc		; 18
	php		; 08
	php		; 08
	tsb $040C.w		; 0C 0C 04
	sty $05.b		; 84 05
	dec $06.b		; C6 06
	cmp $00.b		; C5 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpx #$F000.w		; E0 00 F0
	brk $70.b		; 00 70
	brk $E8.b		; 00 E8
	ora $E8.b,S		; 03 E8
	cop $E8.b		; 02 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $6A.b		; 00 6A
	lda ($61.b,S),Y		; B3 61
	lda $BE63.w,Y		; B9 63 BE
	stz $9B.b,X		; 74 9B
	plp		; 28
	eor $A88000.l		; 4F 00 80 A8
	ora [$FF.b]		; 07 FF
	bra -52.b		; 80 CC
	brk $CE.b		; 00 CE
	brk $CD.b		; 00 CD
	brk $E7.b		; 00 E7
	brk $70.b		; 00 70
	bra -128.b		; 80 80
	adc $BF0FFF.l,X		; 7F FF 0F BF
	rti		; 40

	ora $5F189F.l,X		; 1F 9F 18 5F
	clc		; 18
	cmp $0FCF0F.l,X		; DF 0F CF 0F
	inx		; E8
	brk $08.b		; 00 08
	eor $00FFC0.l,X		; 5F C0 FF 00
	bvs   0.b		; 70 00
	bcs   0.b		; B0 00
	bcs   0.b		; B0 00
	and $001800.l,X		; 3F 00 18 00
	ora $80FFF0.l		; 0F F0 FF 80
	sbc $FFF900.l,X		; FF 00 F9 FF
	brk $F9.b		; 00 F9
	brk $F9.b		; 00 F9
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $80FF7F.l,X		; FF 7F FF 80
	sbc $060680.l,X		; FF 80 06 06
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	beq -31.b		; F0 E1
	sbc $10FF10.l,X		; FF 10 FF 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000100.l,X		; FF 00 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $060600.l,X		; FF 00 06 06
	asl $06.b		; 06 06
	ora [$06.b]		; 07 06
	ora ($1F.b,X)		; 01 1F
	brk $20.b		; 00 20
	tsb $544C.w		; 0C 4C 54
	txy		; 9B
	pla		; 68
	lda ($00.b,S),Y		; B3 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $73.b		; 00 73
	brk $E4.b		; 00 E4
	brk $CC.b		; 00 CC
	brk $10.b		; 00 10
	bvs  16.b		; 70 10
	bvs  -1.b		; 70 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	rti		; 40

	and $BF3F3F.l,X		; 3F 3F 3F BF
	ora $800F00.l		; 0F 00 0F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$6000.w		; E0 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $80FFFF.l,X		; FF FF FF 80
	adc $FF7F80.l,X		; 7F 80 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora [$00.b]		; 07 00
	cmp $FF00FF.l		; CF FF 00 FF
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	brk $FF.b		; 00 FF
	sbc $1BFFFF.l,X		; FF FF FF 1B
	inc $10.b		; E6 10
	sbc $FF00FF.l		; EF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	dec $07.b		; C6 07
	cmp [$FF.b]		; C7 FF
	ora [$F8.b]		; 07 F8
	ora $231010.l		; 0F 10 10 23
	and $C2.b,S		; 23 C2
	cmp $DCC1.w		; CD C1 DC
	ora $E8.b,S		; 03 E8
	ora ($F8.b,X)		; 01 F8
	sbc $FF00.w,Y		; F9 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $72.b		; 00 72
	brk $63.b		; 00 63
	brk $80.b		; 00 80
	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	ldy #$6090.w		; A0 90 60
	bne -64.b		; D0 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	brk $30.b		; 00 30
	brk $F0.b		; 00 F0
	bra -65.b		; 80 BF
	brk $38.b		; 00 38
	sta [$3F.b]		; 87 3F
	sbc $006768.l,X		; FF 68 67 00
	adc $007F00.l,X		; 7F 00 7F 00
	brk $B0.b		; 00 B0
	eor $FF00FF.l		; 4F FF 00 FF
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	ora $007F00.l,X		; 1F 00 7F 00
	adc $000000.l,X		; 7F 00 00 00
	rti		; 40

	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	rti		; 40

	lda $FF00FF.l,X		; BF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $008000.l,X		; FF 00 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $007F00.l,X		; FF 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00E000.l,X		; FF 00 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00E000.l,X		; FF 00 E0 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	bra  36.b		; 80 24
	brk $E7.b		; 00 E7
	inc A		; 1A
	stp		; DB
	sbc $DBFFE9.l,X		; FF E9 FF DB
	sbc $000400.l,X		; FF 00 04 00
	brk $F9.b		; 00 F9
	sbc $02FFDB.l,X		; FF DB FF 02
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $DB.b		; 00 DB
	sbc $000404.l,X		; FF 04 04 00
	brk $19.b		; 00 19
	brk $DB.b		; 00 DB
	sbc $000406.l,X		; FF 06 04 00
	brk $E7.b		; 00 E7
	sbc $08FFEB.l,X		; FF EB FF 08
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $0AFFEB.l,X		; FF EB FF 0A
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $EB.b		; 00 EB
	sbc $004408.l,X		; FF 08 44 00
	brk $FB.b		; 00 FB
	sbc $0CFFEB.l,X		; FF EB FF 0C
	tsb $00.b		; 04 00
	brk $E8.b		; 00 E8
	sbc $0EFFFB.l,X		; FF FB FF 0E
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $20FFFB.l,X		; FF FB FF 20
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $FB.b		; 00 FB
	sbc $00440E.l,X		; FF 0E 44 00
	brk $FA.b		; 00 FA
	sbc $20FFFB.l,X		; FF FB FF 20
	mvp $00,$00		; 44 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	and $C0FF3F.l,X		; 3F 3F FF C0
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	bpl  48.b		; 10 30
	brk $00.b		; 00 00
	and $7F8000.l,X		; 3F 00 80 7F
	ora $E000F0.l		; 0F F0 00 E0
	brk $60.b		; 00 60
	ora [$60.b]		; 07 60
	ora $FFFF40.l		; 0F 40 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FC.b		; 00 FC
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	jsr ($0303.w,X)		; FC 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sta $00E000.l,X		; 9F 00 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $E0609F.l,X		; FF 9F 60 E0
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $F8.b		; 00 F8
	sed		; F8
	inc $0106.w,X		; FE 06 01
	ora ($00.b,X)		; 01 00
	sbc $0000.w,Y		; F9 00 00
	brk $30.b		; 00 30
	brk $7C.b		; 00 7C
	jsr $007C.w		; 20 7C 00
	brk $F8.b		; 00 F8
	brk $02.b		; 00 02
	jsr ($06F9.w,X)		; FC F9 06
	brk $07.b		; 00 07
	brk $36.b		; 00 36
	sty $7A.b		; 84 7A
	ldy #$007A.w		; A0 7A 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$C040.w		; C0 40 C0
	rti		; 40

	cpy #$F36D.w		; C0 6D F3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $145E.w,Y		; 19 5E 14
	cli		; 58
	phk		; 4B
	ora $63.b,S		; 03 63
	sty $63.b		; 84 63
	stx $8F61.w		; 8E 61 8F
	jmp ($7F8F.w,X)		; 7C 8F 7F
	sta [$60.b]		; 87 60
	brk $63.b		; 00 63
	brk $74.b		; 00 74
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $F3.b		; 00 F3
	brk $20.b		; 00 20
	dey		; 88
	lda $53.b,S		; A3 53
	sta ($C7.b,S),Y		; 93 C7
	sta $C369.w,Y		; 99 69 C3
	and #$CF6D.w		; 29 6D CF
	cpy #$807D.w		; C0 7D 80
	jsr ($106F.w,X)		; FC 6F 10
	ldy $08.b,X		; B4 08
	stz $08.b,X		; 74 08
	inc A		; 1A
	tsb $1A.b		; 04 1A
	tsb $96.b		; 04 96
	brk $E4.b		; 00 E4
	cop $C4.b		; 02 C4
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $9FFFFF.l,X		; FF FF FF 9F
	sbc $00FF9F.l,X		; FF 9F FF 00
	cmp $0000FF.l,X		; DF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	rts		; 60

	brk $60.b		; 00 60
	jsr $0060.w		; 20 60 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $F9FFFF.l,X		; FF FF FF F9
	sbc $00FFF9.l,X		; FF F9 FF 00
	sbc $00FF.w,X		; FD FF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	cop $06.b		; 02 06
	brk $06.b		; 00 06
	cop $06.b		; 02 06
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $F97AFF.l		; 0F FF 7A F9
	cpy #$003F.w		; C0 3F 00
	sbc $007F00.l,X		; FF 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $008000.l,X		; FF 00 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	asl $04.b		; 06 04
	asl $0C.b		; 06 0C
	asl $0E0C.w		; 0E 0C 0E
	ora $021E.w,X		; 1D 1E 02
	and ($12.b)		; 32 12
	eor $B43D.w,Y		; 59 3D B4
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	ora ($00.b,S),Y		; 13 00
	rol $6701.w,X		; 3E 01 67
	brk $C3.b		; 00 C3
	brk $10.b		; 00 10
	bmi  16.b		; 30 10
	bmi  16.b		; 30 10
	bvs  16.b		; 70 10
	bvs  -1.b		; 70 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	brk $0F.b		; 00 0F
	rti		; 40

	ora $800FC0.l		; 0F C0 0F 80
	ora $00FF80.l		; 0F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $000080.l,X		; 7F 80 00 00
	brk $40.b		; 00 40
	brk $03.b		; 00 03
	brk $1C.b		; 00 1C
	sta $00FF70.l		; 8F 70 FF 00
	sbc $7F0040.l,X		; FF 40 00 7F
	bra   0.b		; 80 00
	cpy #$C03F.w		; C0 3F C0
	and $8F3FC0.l,X		; 3F C0 3F 8F
	bvs  -1.b		; 70 FF
	brk $C0.b		; 00 C0
	and $0000FF.l,X		; 3F FF 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc $F10300.l,X		; FF 00 03 F1
	asl $00FF.w		; 0E FF 00
	sbc $FE0002.l,X		; FF 02 00 FE
	ora ($00.b,X)		; 01 00
	ora $FC.b,S		; 03 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc ($0E.b),Y		; F1 0E
	sbc $FC0300.l,X		; FF 00 03 FC
	sbc $7C3000.l,X		; FF 00 30 7C
	bpl  -2.b		; 10 FE
	brk $FE.b		; 00 FE
	brk $C6.b		; 00 C6
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000200.l,X		; FF 00 02 00
	bcs 126.b		; B0 7E
	ora ($FD.b)		; 12 FD
	brk $FF.b		; 00 FF
	brk $F9.b		; 00 F9
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FE00.l,X		; FF 00 FE 01
	and $35EC.w,X		; 3D EC 35
	pla		; 68
	and $6C2C73.l		; 2F 73 2C 6C
	ldy $406C.w		; AC 6C 40
	jmp $9A48.w		; 4C 48 9A
	ldy $D32D.w,X		; BC 2D D3
	brk $53.b		; 00 53
	bra  95.b		; 80 5F
	brk $4C.b		; 00 4C
	bra -52.b		; 80 CC
	brk $7C.b		; 00 7C
	bra -26.b		; 80 E6
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	bra -128.b		; 80 80
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
	brk $32.b		; 00 32
	eor $0000.w		; 4D 00 00
	tsb $5C8B.w		; 0C 8B 5C
	phd		; 0B
	trb $5884.w		; 1C 84 58
	brk $1F.b		; 00 1F
	bra  28.b		; 80 1C
	and $70.b,S		; 23 70
	bra -128.b		; 80 80
	adc $3F07FF.l,X		; 7F FF 07 3F
	cmp [$FC.b]		; C7 FC
	ora $38.b,S		; 03 38
	cmp [$FF.b]		; C7 FF
	brk $7F.b		; 00 7F
	brk $05.b		; 00 05
	jsr ($0200.w,X)		; FC 00 02
	and ($D0.b),Y		; 31 D0
	and $1010D0.l,X		; 3F D0 10 10
	brk $10.b		; 00 10
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $02.b		; 00 02
	ora $FC.b,S		; 03 FC
	sbc $E0FFE0.l,X		; FF E0 FF E0
	bpl -17.b		; 10 EF
	bpl -17.b		; 10 EF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0F1F00.l,X		; FF 00 1F 0F
	beq  31.b		; F0 1F
	sbc $000010.l,X		; FF 10 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0F800.l,X		; FF 00 F8 F0
	ora $08FFF8.l		; 0F F8 FF 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
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
	tsb $2480.w		; 0C 80 24
	brk $E3.b		; 00 E3
	jsr $FFD5.w		; 20 D5 FF
	inx		; E8
	sbc $00FFD5.l,X		; FF D5 FF 00
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $02FFD5.l,X		; FF D5 FF 02
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	brk $D5.b		; 00 D5
	sbc $000404.l,X		; FF 04 04 00
	brk $18.b		; 00 18
	brk $D5.b		; 00 D5
	sbc $000406.l,X		; FF 06 04 00
	brk $E3.b		; 00 E3
	sbc $08FFE5.l,X		; FF E5 FF 08
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $0AFFE5.l,X		; FF E5 FF 0A
	tsb $00.b		; 04 00
	brk $11.b		; 00 11
	brk $E5.b		; 00 E5
	sbc $004408.l,X		; FF 08 44 00
	brk $01.b		; 00 01
	brk $E5.b		; 00 E5
	sbc $00040C.l,X		; FF 0C 04 00
	brk $E3.b		; 00 E3
	sbc $0EFFF5.l,X		; FF F5 FF 0E
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $20FFF5.l,X		; FF F5 FF 20
	tsb $00.b		; 04 00
	brk $11.b		; 00 11
	brk $F5.b		; 00 F5
	sbc $00440E.l,X		; FF 0E 44 00
	brk $01.b		; 00 01
	brk $F5.b		; 00 F5
	sbc $004420.l,X		; FF 20 44 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $02.b,S		; 03 02
	cop $06.b		; 02 06
	asl $07.b		; 06 07
	ora [$05.b]		; 07 05
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $03.b		; 00 03
	brk $3F.b		; 00 3F
	and $80C0DF.l,X		; 3F DF C0 80
	bra   0.b		; 80 00
	sta $000000.l		; 8F 00 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	sec		; 38
	brk $00.b		; 00 00
	and $3F4000.l,X		; 3F 00 40 3F
	sta $FF0070.l		; 8F 70 00 FF
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	ora [$40.b]		; 07 40
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $33.b		; 00 33
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	and ($CC.b,S),Y		; 33 CC
	jsr ($FC03.w,X)		; FC 03 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $000000.l,X		; FF 00 00 00
	ora $18.b,S		; 03 18
	ora [$E0.b]		; 07 E0
	cpx #$38B8.w		; E0 B8 38
	php		; 08
	php		; 08
	tsb $8C.b		; 04 8C
	tsb $04.b		; 04 04
	asl $06.b		; 06 06
	cop $06.b		; 02 06
	.db $42, $C6		; 42 C6
	brk $00.b		; 00 00
	cpy #$1000.w		; C0 00 10
	cpx #$7088.w		; E0 88 70
	brk $F8.b		; 00 F8
	brk $78.b		; 00 78
	tsb $70.b		; 04 70
	tsb $B0.b		; 04 B0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $0B.b		; 02 0B
	ora [$1E.b]		; 07 1E
	ora [$37.b]		; 07 37
	tsb $2A2F.w		; 0C 2F 2A
	jmp $4125.w		; 4C 25 41
	and ($42.b),Y		; 31 42
	and ($C7.b),Y		; 31 C7
	tsb $1800.w		; 0C 00 18
	brk $38.b		; 00 38
	brk $30.b		; 00 30
	brk $71.b		; 00 71
	brk $7A.b		; 00 7A
	brk $7C.b		; 00 7C
	brk $FC.b		; 00 FC
	brk $A7.b		; 00 A7
	bcc  84.b		; 90 54
	cpy #$68B2.w		; C0 B2 68
	pha		; 48
	ldx #$1429.w		; A2 29 14
	cpx $F1.b		; E4 F1
	cpx $1A.b		; E4 1A
	beq  10.b		; F0 0A
	adc [$08.b],Y		; 77 08
	and [$08.b],Y		; 37 08
	tas		; 1B
	tsb $1B.b		; 04 1B
	tsb $ED.b		; 04 ED
	cop $1D.b		; 02 1D
	cop $06.b		; 02 06
	ora ($C6.b,X)		; 01 C6
	ora ($FD.b,X)		; 01 FD
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $FFFF3F.l,X		; 7F 3F FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $F8FFFF.l,X		; FF FF FF F8
	xce		; FB
	sed		; F8
	xce		; FB
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora $07.b		; 05 07
	asl $07.b		; 06 07
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FF1FDF.l,X		; 1F DF 1F FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	rts		; 60

	cpx #$E0A0.w		; E0 A0 E0
	lda $8000C0.l,X		; BF C0 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFCFE.l,X		; FF FE FC FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	adc $824CC0.l		; 6F C0 4C 82
	jmp ($4FC0.w)		; 6C C0 4F
	bra  14.b		; 80 0E
	eor ($03.b),Y		; 51 03
	adc $3A7E1E.l,X		; 7F 1E 7E 3A
	and $20DF.w,Y		; 39 DF 20
	inc $DC01.w,X		; FE 01 DC
	and $FF.b,S		; 23 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7E.b		; 00 7E
	ora ($38.b,X)		; 01 38
	ora [$FF.b]		; 07 FF
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	tsb $FF.b		; 04 FF
	brk $00.b		; 00 00
	sbc $40FFFF.l,X		; FF FF FF 40
	and $FFFF00.l,X		; 3F 00 FF FF
	brk $04.b		; 00 04
	xce		; FB
	tsb $FB.b		; 04 FB
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	tsb $080E.w		; 0C 0E 08
	asl $0E0A.w		; 0E 0A 0E
	clc		; 18
	trb $1C18.w		; 1C 18 1C
	clc		; 18
	trb $1C1B.w		; 1C 1B 1C
	ora $C4.b		; 05 C4
	cop $00.b		; 02 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	tsb $01.b		; 04 01
	tsb $03.b		; 04 03
	ora [$00.b]		; 07 00
	sbc $1002.w,X		; FD 02 10
	bmi  16.b		; 30 10
	bmi  16.b		; 30 10
	bmi  16.b		; 30 10
	bvs  16.b		; 70 10
	bvs  16.b		; 70 10
	bvs  -1.b		; 70 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	rti		; 40

	ora $C00F40.l		; 0F 40 0F C0
	ora $800F80.l		; 0F 80 0F 80
	ora $00FF80.l		; 0F 80 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	sbc [$18.b]		; E7 18
	sbc $00C000.l,X		; FF 00 C0 00
	cpy #$E000.w		; C0 00 E0
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora $E71FE0.l,X		; 1F E0 1F E7
	clc		; 18
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	inc $FF01.w,X		; FE 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FEFF00.l,X		; FF 00 FF FE
	ora ($FF.b,X)		; 01 FF
	brk $02.b		; 00 02
	ora [$07.b]		; 07 07
	ora [$05.b]		; 07 05
	eor [$03.b]		; 47 03
	ora $00EF00.l		; 0F 00 EF 00
	jmp ($C03F.w,X)		; 7C 3F C0
	sbc $073A00.l,X		; FF 00 3A 07
	and $877D07.l,X		; 3F 07 7D 87
	adc ($8F.b,S),Y		; 73 8F
	bpl -17.b		; 10 EF
	brk $FF.b		; 00 FF
	and $00FFC0.l,X		; 3F C0 FF 00
	ora $E7.b,S		; 03 E7
	ora ($E7.b,X)		; 01 E7
	ora ($E3.b,X)		; 01 E3
	ora ($F3.b,X)		; 01 F3
	ora ($F3.b,X)		; 01 F3
	ora ($33.b,X)		; 01 33
	sbc $FA03.w,X		; FD 03 FA
	cop $04.b		; 02 04
	bne   6.b		; D0 06
	bne   2.b		; D0 02
	jmp.w [$E802]		; DC 02 E8
	cop $F8.b		; 02 F8
	cop $CC.b		; 02 CC
	inc $FB00.w,X		; FE 00 FB
	tsb $34.b		; 04 34
	jmp $3274.w		; 4C 74 32
	lsr $20.b,X		; 56 20
	nop		; EA
	ldx $BC.b		; A6 BC
	cpy $B0B0.w		; CC B0 B0
	bcs -80.b		; B0 B0
	brk $30.b		; 00 30
	jmp ($4E00.w,X)		; 7C 00 4E
	brk $4E.b		; 00 4E
	brk $5E.b		; 00 5E
	brk $7C.b		; 00 7C
	brk $30.b		; 00 30
	brk $30.b		; 00 30
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
	brk $30.b		; 00 30
	cmp [$37.b]		; C7 37
	cpy $3E.b		; C4 3E
	cmp [$3F.b]		; C7 3F
	cmp $19.b,S		; C3 19
	ror $00.b		; 66 00
	rti		; 40

	asl $85.b		; 06 85
	lsr $FF85.w		; 4E 85 FF
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	brk $F9.b		; 00 F9
	brk $78.b		; 00 78
	bra -64.b		; 80 C0
	and $FF03FF.l,X		; 3F FF 03 FF
	ora $DA.b,S		; 03 DA
	sbc ($19.b,S),Y		; F3 19
.ACCU 8
.INDEX 8
	sep #$B1		; E2 B1
	eor $00FFE1.l,X		; 5F E1 FF 00
	sbc $0C0000.l,X		; FF 00 00 0C
	pea $F40D.w		; F4 0D F4
	sbc $00.b		; E5 00
	sbc $00.b,X		; F5 00
	sed		; F8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFF8FF.l,X		; FF FF F8 FF
	sed		; F8
	cpy #$FF.b		; C0 FF
	brk $3F.b		; 00 3F
	adc $800020.l,X		; 7F 20 00 80
	sta $400180.l,X		; 9F 80 01 40
	and $01FF01.l,X		; 3F 01 FF 01
	bra   0.b		; 80 00
	rti		; 40

	bra  64.b		; 80 40
	bra -128.b		; 80 80
	adc $7F4020.l,X		; 7F 20 40 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	inc $FE04.w,X		; FE 04 FE
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $070500.l,X		; FF 00 05 07
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $9F0000.l,X		; FF 00 00 9F
	jsr $FFBF.w		; 20 BF FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $60.b		; 00 60
	cpx #$C0.b		; E0 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	sbc $FEFC00.l,X		; FF 00 FC FE
	tsb $00.b		; 04 00
	ora ($F9.b,X)		; 01 F9
	ora ($80.b,X)		; 01 80
	cop $FC.b		; 02 FC
	bra  -1.b		; 80 FF
	bra   1.b		; 80 01
	brk $02.b		; 00 02
	ora ($02.b,X)		; 01 02
	ora ($01.b,X)		; 01 01
	inc $0204.w,X		; FE 04 02
	inc $FF01.w,X		; FE 01 FF
	brk $FF.b		; 00 FF
	brk $30.b		; 00 30
	ora $001F00.l		; 0F 00 1F 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $001F00.l,X		; 3F 00 1F 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	ora $F7.b		; 05 F7
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000401.l,X		; FF 01 04 00
	brk $FD.b		; 00 FD
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $20.b		; 00 20
	bpl   0.b		; 10 00
	adc $00A000.l,X		; 7F 00 A0 00
	cmp $108000.l,X		; DF 00 80 10
	brk $00.b		; 00 00
	sbc $20E000.l,X		; FF 00 E0 20
	bpl   0.b		; 10 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	sbc $90007F.l,X		; FF 7F 00 90
	adc $00FF00.l		; 6F 00 FF 00
	cpx #$40.b		; E0 40
	brk $00.b		; 00 00
	cpx #$10.b		; E0 10
	bvc   0.b		; 50 00
	bcs   0.b		; B0 00
	bpl -128.b		; 10 80
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	bvs  64.b		; 70 40
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	beq -32.b		; F0 E0
	brk $90.b		; 00 90
	rts		; 60

	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
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
	brk $FC.b		; 00 FC
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	asl $F6.b		; 06 F6
	sbc $F6FFF8.l,X		; FF F8 FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $000401.l,X		; FF 01 04 00
	brk $F8.b		; 00 F8
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $02FFFE.l,X		; FF FE FF 02
	mvp $00,$00		; 44 00 00
	ora $083000.l,X		; 1F 00 30 08
	brk $7F.b		; 00 7F
	bpl -96.b		; 10 A0
	brk $DF.b		; 00 DF
	jsr ($0080.w,X)		; FC 80 00
	bra   8.b		; 80 08
	brk $1F.b		; 00 1F
	brk $30.b		; 00 30
	php		; 08
	brk $00.b		; 00 00
	adc $FF0000.l,X		; 7F 00 00 FF
	jmp ($7F03.w,X)		; 7C 03 7F
	brk $88.b		; 00 88
	adc [$F0.b],Y		; 77 F0
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	jsr ($0A12.w,X)		; FC 12 0A
	brk $F6.b		; 00 F6
	ror $0002.w,X		; 7E 02 00
	cop $20.b		; 02 20
	brk $F0.b		; 00 F0
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	inc $807C.w,X		; FE 7C 80
	jsr ($2200.w,X)		; FC 00 22
	jmp.w [$FF00]		; DC 00 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sbc $0C.b,X		; F5 0C
	sbc [$FF.b],Y		; F7 FF
	sbc $FF.b,X		; F5 FF
	sbc [$FF.b],Y		; F7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $F7FF.w,X		; FD FF F7
	sbc $000401.l,X		; FF 01 04 00
	brk $05.b		; 00 05
	brk $F7.b		; 00 F7
	sbc $000402.l,X		; FF 02 04 00
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	sbc $000403.l,X		; FF 03 04 00
	brk $03.b		; 00 03
	ora $0E.b,S		; 03 0E
	asl $FFFF.w		; 0E FF FF
	ora $0C19.w,Y		; 19 19 0C
	stz $3E96.w		; 9C 96 3E
	mvp $00,$6F		; 44 6F 00
	bpl   0.b		; 10 00
	brk $02.b		; 00 02
	brk $07.b		; 00 07
	brk $E6.b		; 00 E6
	brk $E3.b		; 00 E3
	bpl  81.b		; 10 51
	tay		; A8
	bpl  40.b		; 10 28
	brk $10.b		; 00 10
	sbc $2C2CFD.l,X		; FF FD 2C 2C
	sbc $EFEFFF.l,X		; FF FF EF EF
	inx		; E8
	sbc $010F0B.l		; EF 0B 0F 01
	inc $13.b,X		; F6 13
	and [$03.b],Y		; 37 03
	brk $24.b		; 00 24
	brk $FB.b		; 00 FB
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	ora $F3.b,S		; 03 F3
	tsb $0B.b		; 04 0B
	tsb $11.b		; 04 11
	bit $00.b		; 24 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$BE.b		; C0 BE
	rep #$81		; C2 81
	sbc $7FB102.l,X		; FF 02 B1 7F
	sbc $008C00.l,X		; FF 00 8C 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $3C.b		; 00 3C
	brk $1C.b		; 00 1C
	brk $7F.b		; 00 7F
	lda ($00.b),Y		; B1 00
	bra   0.b		; 80 00
	sty $C000.w		; 8C 00 C0
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
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	sbc ($11.b)		; F2 11
	sbc $FF.b,X		; F5 FF
	sbc ($FF.b)		; F2 FF
	sed		; F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FA.b		; 00 FA
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000402.l,X		; FF 02 04 00
	brk $0A.b		; 00 0A
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $F7.b		; 00 F7
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $05FFF0.l,X		; FF F0 FF 05
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F0.b		; 00 F0
	sbc $000406.l,X		; FF 06 04 00
	brk $FF.b		; 00 FF
	sbc $812E02.l,X		; FF 02 2E 81
	ora ($0C.b,S),Y		; 13 0C
	lda #$A4.b		; A9 A4
	tsa		; 3B
	adc #$77.b		; 69 77
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc ($00.b),Y		; F1 00
	cpx #$8C.b		; E0 8C
	cpy $4C12.w		; CC 12 4C
	sta ($0C.b)		; 92 0C
	ora ($02.b)		; 12 02
	tsb $0000.w		; 0C 00 00
	sbc $3E7FFF.l,X		; FF FF 7F 3E
	adc $9EBF3E.l,X		; 7F 3E BF 9E
	lda $FF0080.l,X		; BF 80 00 FF
	ora ($07.b,X)		; 01 07
	brk $00.b		; 00 00
	cmp $00C100.l,X		; DF 00 C1 00
	cmp ($00.b,X)		; C1 00
	adc ($00.b,X)		; 61 00
	adc $000000.l,X		; 7F 00 00 00
	ora ($06.b,X)		; 01 06
	brk $00.b		; 00 00
.ACCU 8
	sep #$EE		; E2 EE
	ora $FC.b,S		; 03 FC
	bra  71.b		; 80 47
	bmi -103.b		; 30 99
	clc		; 18
	bcs  51.b		; B0 33
	tsa		; 3B
	brk $7C.b		; 00 7C
	php		; 08
	sec		; 38
	ldx #$0C.b		; A2 0C
	ora $00.b,S		; 03 00
	bra  56.b		; 80 38
	and ($4C.b)		; 32 4C
	pld		; 2B
	mvp $4C,$A0		; 44 A0 4C
	bpl 108.b		; 10 6C
	php		; 08
	bmi   0.b		; 30 00
	brk $F8.b		; 00 F8
	sec		; 38
	stz $0085.w,X		; 9E 85 00
	sbc $FFC106.l,X		; FF 06 C1 FF
	sbc $003800.l,X		; FF 00 38 00
	brk $00.b		; 00 00
	brk $C4.b		; 00 C4
	brk $78.b		; 00 78
	brk $7E.b		; 00 7E
	brk $FF.b		; 00 FF
	cmp ($00.b,X)		; C1 00
	brk $00.b		; 00 00
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3E3E0F.l		; 0F 0F 3E 3E
	pea $00F4.w		; F4 F4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $B1B1.w,X		; FE B1 B1
	tya		; 98
	tya		; 98
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($00.b),Y		; 91 00
	dey		; 88
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
	brk $80.b		; 00 80
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $EE.b		; 00 EE
	clc		; 18
	sbc ($FF.b,S),Y		; F3 FF
	inc $F6FF.w		; EE FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $EE.b		; 00 EE
	sbc $01FFFE.l,X		; FF FE FF 01
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $03FFFB.l,X		; FF FB FF 03
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $04FFF3.l,X		; FF F3 FF 04
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $05FFFB.l,X		; FF FB FF 05
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F3.b		; 00 F3
	sbc $000406.l,X		; FF 06 04 00
	brk $06.b		; 00 06
	brk $FB.b		; 00 FB
	sbc $000407.l,X		; FF 07 04 00
	brk $0E.b		; 00 0E
	brk $F7.b		; 00 F7
	sbc $000408.l,X		; FF 08 04 00
	brk $16.b		; 00 16
	brk $F8.b		; 00 F8
	sbc $000409.l,X		; FF 09 04 00
	brk $40.b		; 00 40
	adc ($38.b)		; 72 38
	and $CC3FC0.l,X		; 3F C0 3F CC
	cpy $1612.w		; CC 12 16
	ora ($1D.b),Y		; 11 1D
	.db $62, $6C, $02		; 62 6C 02
	asl $000F.w		; 0E 0F 00
	cpy #$00.b		; C0 00
	jsr ($F4C0.w,X)		; FC C0 F4
	ora $E2.b,S		; 03 E2
	ora $08E6.w		; 0D E6 08
	sta [$08.b],Y		; 97 08
	cop $0D.b		; 02 0D
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
	brk $00.b		; 00 00
	ora $0F.b,S		; 03 0F
	sty $50BC.w		; 8C BC 50
	bmi  61.b		; 30 3D
	sbc $A0E440.l,X		; FF 40 E4 A0
	pea $A410.w		; F4 10 A4
	ora $003F00.l		; 0F 00 3F 00
	jmp ($F000.w,X)		; 7C 00 F0
	brk $02.b		; 00 02
	brk $3F.b		; 00 3F
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	cpy #$90.b		; C0 90
	sbc [$A7.b]		; E7 A7
	sbc [$3F.b]		; E7 3F
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9F.b		; 00 9F
	rti		; 40

	tya		; 98
	rti		; 40

	and $8000C0.l,X		; 3F C0 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$F7.b],Y		; F7 F7
	rol A		; 2A
	rol A		; 2A
	and $3D.b,X		; 35 3D
	sed		; F8
	sed		; F8
	brk $04.b		; 00 04
	ora ($04.b,X)		; 01 04
	ora $07.b,S		; 03 07
	sbc $00FF00.l,X		; FF 00 FF 00
	rol $F700.w		; 2E 00 F7
	php		; 08
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0200.w,X		; FD 00 02
	plx		; FA
	inc $FAFE.w,X		; FE FE FA
	ora $00.b,S		; 03 00
	and ($00.b),Y		; 31 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	ora ($00.b,X)		; 01 00
	ora ($FC.b,X)		; 01 FC
	ora ($00.b,X)		; 01 00
	and ($00.b),Y		; 31 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq   8.b		; F0 08
	php		; 08
	tsb $010C.w		; 0C 0C 01
	ror $F3.b,X		; 76 F3
	jsr ($9695.w,X)		; FC 95 96
	eor $00F0DF.l		; 4F DF F0 00
	sed		; F8
	brk $0C.b		; 00 0C
	brk $0E.b		; 00 0E
	brk $8F.b		; 00 8F
	brk $00.b		; 00 00
	brk $98.b		; 00 98
	rts		; 60

	pha		; 48
	bcs  32.b		; B0 20
	brk $97.b		; 00 97
	lda [$07.b]		; A7 07
	sta $00F860.l		; 8F 60 F8 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	sta $404890.l,X		; 9F 90 48 40
	clv		; B8
	rts		; 60

	tya		; 98
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	sbc $8301.w,X		; FD 01 83
	rti		; 40

	adc $7F00BF.l,X		; 7F BF 00 7F
	sbc $C0FFFF.l,X		; FF FF FF C0
	brk $1E.b		; 00 1E
	jsr ($FE00.w,X)		; FC 00 FE
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	beq  31.b		; F0 1F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	asl $8080.w,X		; 1E 80 80
	rts		; 60

	bra  96.b		; 80 60
	brk $00.b		; 00 00
	cpx #$C0.b		; E0 C0
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	rts		; 60

	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $00.b		; 14 00
	trb $00.b		; 14 00
	inc $23.b		; E6 23
	cpx $E6FF.w		; EC FF E6
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $00.b		; 04 00
	brk $EE.b		; 00 EE
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $02FFF8.l,X		; FF F8 FF 02
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $03FFF8.l,X		; FF F8 FF 03
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F8.b		; 00 F8
	sbc $000404.l,X		; FF 04 04 00
	brk $0E.b		; 00 0E
	brk $F8.b		; 00 F8
	sbc $000405.l,X		; FF 05 04 00
	brk $16.b		; 00 16
	brk $F8.b		; 00 F8
	sbc $000406.l,X		; FF 06 04 00
	brk $1E.b		; 00 1E
	brk $F8.b		; 00 F8
	sbc $000407.l,X		; FF 07 04 00
	brk $E6.b		; 00 E6
	sbc $08FFF0.l,X		; FF F0 FF 08
	tsb $00.b		; 04 00
	brk $EE.b		; 00 EE
	sbc $09FFF0.l,X		; FF F0 FF 09
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $0AFFF0.l,X		; FF F0 FF 0A
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $0BFFF0.l,X		; FF F0 FF 0B
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $F0.b		; 00 F0
	sbc $00040C.l,X		; FF 0C 04 00
	brk $0E.b		; 00 0E
	brk $F0.b		; 00 F0
	sbc $00040D.l,X		; FF 0D 04 00
	brk $16.b		; 00 16
	brk $F0.b		; 00 F0
	sbc $00040E.l,X		; FF 0E 04 00
	brk $1E.b		; 00 1E
	brk $F0.b		; 00 F0
	sbc $00040F.l,X		; FF 0F 04 00
	brk $F3.b		; 00 F3
	sbc $10FFE8.l,X		; FF E8 FF 10
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $11FFE8.l,X		; FF E8 FF 11
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $E8.b		; 00 E8
	sbc $000412.l,X		; FF 12 04 00
	brk $0B.b		; 00 0B
	brk $E8.b		; 00 E8
	sbc $000413.l,X		; FF 13 04 00
	brk $02.b		; 00 02
	cmp [$06.b]		; C7 06
	asl $C2.b		; 06 C2
	mvp $7D,$76		; 44 76 7D
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	ora ($FA.b,X)		; 01 FA
	ora ($B8.b,X)		; 01 B8
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $45.b		; 00 45
	eor $0EAF3F.l		; 4F 3F AF 0E
	ror A		; 6A
	plb		; AB
	lda $03CC53.l,X		; BF 53 CC 03
	tya		; 98
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	rti		; 40

	clv		; B8
	jmp.w [$6900]		; DC 00 69
	sty $D8.b,X		; 94 D8
	tsb $D3.b		; 04 D3
	bit $F803.w		; 2C 03 F8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	adc $006F00.l		; 6F 00 6F 00
	bmi   0.b		; 30 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $10EF10.l		; EF 10 EF 10
	beq  15.b		; F0 0F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plx		; FA
	brk $FA.b		; 00 FA
	brk $02.b		; 00 02
	ora ($FE.b,X)		; 01 FE
	sbc $FC01FC.l,X		; FF FC 01 FC
	brk $48.b		; 00 48
	sei		; 78
	brk $00.b		; 00 00
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $02.b		; 04 02
	jsr ($0000.w,X)		; FC 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $48.b		; 00 48
	bmi   0.b		; 30 00
	brk $88.b		; 00 88
	cmp $24E706.l,X		; DF 06 E7 24
	sbc $02.b,X		; F5 02
	xba		; EB
	bpl -13.b		; 10 F3
	sty $01FF.w		; 8C FF 01
	and $1E1F02.l,X		; 3F 02 1F 1E
	adc ($AA.b,X)		; 61 AA
	eor ($34.b),Y		; 51 34
	wai		; CB
	rol $32D1.w		; 2E D1 32
	cmp $639C.w		; CD 9C 63
	ora ($3E.b,X)		; 01 3E
	cop $1D.b		; 02 1D
	and $00BD.w,X		; 3D BD 00
	bra  62.b		; 80 3E
	ror $FE3E.w,X		; 7E 3E FE
	and $00FD.w,X		; 3D FD 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $C2.b		; 00 C2
	brk $80.b		; 00 80
	adc $418041.l,X		; 7F 41 80 41
	bra  66.b		; 80 42
	bra   0.b		; 80 00
	sbc $008000.l,X		; FF 00 80 00
	brk $6F.b		; 00 6F
	adc $8F1F00.l,X		; 7F 00 1F 8F
	sbc $FFC0FF.l,X		; FF FF C0 FF
	bra   0.b		; 80 00
	ora $001E00.l		; 0F 00 1E 00
	brk $90.b		; 00 90
	brk $1F.b		; 00 1F
	cpx #$70.b		; E0 70
	bvs  15.b		; 70 0F
	bmi 127.b		; 30 7F
	brk $00.b		; 00 00
	sbc $003E00.l,X		; FF 00 3E 00
	brk $C8.b		; 00 C8
	beq   0.b		; F0 00
	cpx #$E0.b		; E0 E0
	cpx $04F4.w		; EC F4 04
	cpy #$30.b		; C0 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $00.b		; 24 00
	cpx #$1C.b		; E0 1C
	trb $E40C.w		; 1C 0C E4
	clc		; 18
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $1030.w		; 20 30 10
	ora $C30400.l,X		; 1F 00 04 C3
	phd		; 0B
.ACCU 16
.INDEX 16
	rep #$3F		; C2 3F
	ora $C7.b		; 05 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $00E000.l		; 4F 00 E0 00
	sbc $C0FC00.l,X		; FF 00 FC C0
	bit $F9C0.w,X		; 3C C0 F9
	brk $08.b		; 00 08
	asl A		; 0A
	ora ($17.b,S),Y		; 13 17
	bra  67.b		; 80 43
	ora $0E06FF.l		; 0F FF 06 0E
	sta $FE97FD.l,X		; 9F FD 97 FE
	xce		; FB
	adc $0F0006.l		; 6F 06 00 0F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	brk $01.b		; 00 01
	cop $90.b		; 02 90
	adc ($68.b,X)		; 61 68
	bcc   4.b		; 90 04
	trb $C0.b		; 14 C0
	jmp.w [$DC00]		; DC 00 DC
	sbc $0000EF.l		; EF EF 00 00
	cmp ($1C.b,S),Y		; D3 1C
	cmp $00EF00.l,X		; DF 00 EF 00
	and ($00.b,S),Y		; 33 00
	sbc ($00.b,S),Y		; F3 00
	sbc ($00.b,S),Y		; F3 00
	brk $10.b		; 00 10
	cmp $20DF20.l,X		; DF 20 DF 20
	cmp $10EF20.l,X		; DF 20 EF 10
	rep #$C6		; C2 C6
	txa		; 8A
	txa		; 8A
	cpx #$FCEF.w		; E0 EF FC
	sbc $0303.w,X		; FD 03 03
	xce		; FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $CA.b		; 00 CA
	cop $96.b		; 02 96
	cop $F1.b		; 02 F1
	tsb $0200.w		; 0C 00 02
	sed		; F8
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $00.b		; 04 00
	brk $80.b		; 00 80
	bra -57.b		; 80 C7
	cmp [$01.b]		; C7 01
	sbc $81F0EF.l,X		; FF EF F0 81
	and $00.b,S		; 23 00
	jmp $00E31C.l		; 5C 1C E3 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DC.b		; 00 DC
	brk $81.b		; 00 81
	rol $225D.w,X		; 3E 5D 22
	rti		; 40

	cpy #$6020.w		; C0 20 60
	beq -16.b		; F0 F0
	brk $70.b		; 00 70
	brk $F0.b		; 00 F0
	sbc $FD6BF0.l,X		; FF F0 6B FD
	and $807E.w,Y		; 39 7E 80
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $81.b		; 00 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	bit $2F4B.w,X		; 3C 4B 2F
	ora #$4205.w		; 09 05 42
	cmp ($C0.b,X)		; C1 C0
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $C2.b		; 00 C2
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	brk $BF.b		; 00 BF
	tsb $20.b		; 04 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  16.b		; 80 10
	cpx #$98F8.w		; E0 F8 98
	clc		; 18
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $C4.b		; 00 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$25.b]		; 07 25
	and $C0.b,S		; 23 C0
	phx		; DA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $003E00.l,X		; 1F 00 3E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $FFFF3F.l,X		; 3F 3F FF FF
	sbc $0DFD.w,Y		; F9 FD 0D
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $C0FF80.l,X		; FF 80 FF C0
	cpy #$E020.w		; C0 20 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00C000.l,X		; 7F 00 C0 00
	jsr $00C0.w		; 20 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$6020.w		; C0 20 60
	bpl  48.b		; 10 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $20.b		; 00 20
	brk $09.b		; 00 09
	bra  36.b		; 80 24
	brk $DF.b		; 00 DF
	and $FFE7.w		; 2D E7 FF
	cmp $FFEBFF.l,X		; DF FF EB FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	cmp $FFFBFF.l,X		; DF FF FB FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc $FFE7FF.l		; EF FF E7 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	sbc $FFF7FF.l		; EF FF F7 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	sbc $FFE7FF.l,X		; FF FF E7 FF
	php		; 08
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $0AFFF7.l,X		; FF F7 FF 0A
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	brk $E7.b		; 00 E7
	sbc $00040C.l,X		; FF 0C 04 00
	brk $0F.b		; 00 0F
	brk $F7.b		; 00 F7
	sbc $00040E.l,X		; FF 0E 04 00
	brk $1F.b		; 00 1F
	brk $EF.b		; 00 EF
	sbc $000420.l,X		; FF 20 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	trb $3E20.w		; 1C 20 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $63.b		; 00 63
	brk $C0.b		; 00 C0
	ora ($FD.b,X)		; 01 FD
	cop $FB.b		; 02 FB
	tsb $C0.b		; 04 C0
	sbc $010100.l,X		; FF 00 01 01
	ora $02.b,S		; 03 02
	asl $28.b		; 06 28
	clc		; 18
	brk $FF.b		; 00 FF
	ora ($03.b,X)		; 01 03
	and $3D.b		; 25 3D
	cop $66.b		; 02 66
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc $000000.l,X		; FF 00 00 00
	jsr ($C200.w,X)		; FC 00 C2
	brk $A5.b		; 00 A5
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
	bpl -13.b		; 10 F3
	tya		; 98
	inc $7D40.w		; EE 40 7D
	and ($3F.b,X)		; 21 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi -49.b		; 30 CF
	tya		; 98
	adc [$40.b]		; 67 40
	and $001E21.l,X		; 3F 21 1E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora [$0B.b]		; 07 0B
	clc		; 18
	jsr $806C.w		; 20 6C 80
	ldy #$8606.w		; A0 06 86
	inc $00FE.w,X		; FE FE 00
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $6100.w,X		; 1D 00 61
	brk $87.b		; 00 87
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	adc $7F8080.l,X		; 7F 80 80 7F
	sbc $038101.l,X		; FF 01 81 03
	sta ($51.b,S),Y		; 93 51
	sbc ($51.b),Y		; F1 51
	beq  81.b		; F0 51
	sbc ($00.b),Y		; F1 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $81.b		; 00 81
	brk $8F.b		; 00 8F
	brk $CF.b		; 00 CF
	brk $CF.b		; 00 CF
	brk $CF.b		; 00 CF
	brk $97.b		; 00 97
	bvc -109.b		; 50 93
	bvc -74.b		; 50 B6
	bmi -96.b		; 30 A0
	eor $7FC03F.l,X		; 5F 3F C0 7F
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $2F.b		; 00 2F
	bra  47.b		; 80 2F
	bra  79.b		; 80 4F
	bra  96.b		; 80 60
	bra 127.b		; 80 7F
	bra  63.b		; 80 3F
	cpy #$0080.w		; C0 80 00
	brk $00.b		; 00 00
	lda $008000.l,X		; BF 00 80 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	lda $7F8040.l,X		; BF 40 80 7F
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $3F31FF.l,X		; FF FF 31 3F
	sta $FFD1DF.l		; 8F DF D1 FF
.INDEX 16
	rep #$9F		; C2 9F
	ora ($0F.b,X)		; 01 0F
	php		; 08
	ora $00CFC0.l		; 0F C0 CF 00
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $E9.b		; 00 E9
	asl $D6.b		; 06 D6
	ora $3B.b,S		; 03 3B
	ora ($35.b,X)		; 01 35
	brk $F6.b		; 00 F6
	php		; 08
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rts		; 60

	sbc ($00.b,X)		; E1 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	bra  -3.b		; 80 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $01FE.w,X		; FE FE 01
	inc $0801.w,X		; FE 01 08
	sed		; F8
	brk $00.b		; 00 00
	sbc $0102.w,X		; FD 02 01
	inc $00FF.w,X		; FE FF 00
	ora ($00.b,X)		; 01 00
	inc $FF00.w,X		; FE 00 FF
	brk $08.b		; 00 08
	beq   0.b		; F0 00
	brk $01.b		; 00 01
	sbc $0C.b		; E5 0C
	sbc ($8C.b),Y		; F1 8C
	sbc $6503.w,Y		; F9 03 65
	tsb $077C.w		; 0C 7C 07
	adc ($03.b,S),Y		; 73 03
	bit $1F00.w,X		; 3C 00 1F
	lsr $38.b		; 46 38
	ora $1D62.w,X		; 1D 62 1D
	.db $62, $86, $78		; 62 86 78
	sty $0773.w		; 8C 73 07
	sei		; 78
	ora [$38.b]		; 07 38
	brk $1F.b		; 00 1F
	bra -128.b		; 80 80
	cpx #$70E0.w		; E0 E0 70
	bvs  56.b		; 70 38
	sec		; 38
	trb $061C.w		; 1C 1C 06
	asl $01.b		; 06 01
	adc $00FF31.l,X		; 7F 31 FF 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $18.b		; 00 18
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	ror $000E.w,X		; 7E 0E 00
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
	rti		; 40

	bcs -56.b		; B0 C8
	sei		; 78
	pha		; 48
	sei		; 78
	rti		; 40

	beq -128.b		; F0 80
	sed		; F8
	brk $F0.b		; 00 F0
	brk $B0.b		; 00 B0
	brk $60.b		; 00 60
	cpy #$C73F.w		; C0 3F C7
	bmi -57.b		; 30 C7
	bmi -49.b		; 30 CF
	bmi -113.b		; 30 8F
	bvs -128.b		; 70 80
	adc $00F000.l,X		; 7F 00 F0 00
	cpx #$0000.w		; E0 00 00
	brk $03.b		; 00 03
	ora $02.b,S		; 03 02
	ora [$07.b]		; 07 07
	ora $00000C.l		; 0F 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $01FC03.l,X		; FF 03 FC 01
	sed		; F8
	brk $F3.b		; 00 F3
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	ora ($81.b,X)		; 01 81
	ora ($80.b,X)		; 01 80
	cop $83.b		; 02 83
	cop $83.b		; 02 83
	cop $23.b		; 02 23
	rts		; 60

	and $0E.b,X		; 35 0E
	and $C0FEC0.l,X		; 3F C0 FE C0
	inc $FC00.w,X		; FE 00 FC
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($1E.b,X)		; 01 1E
	ora ($32.b,X)		; 01 32
	ora ($80.b,X)		; 01 80
	sbc $916E18.l,X		; FF 18 6E 91
	ply		; 7A
	cop $83.b		; 02 83
	brk $EB.b		; 00 EB
	mvn $14,$F5		; 54 F5 14
	cmp $8316.w		; CD 16 83
	.db $42, $3C		; 42 3C
	clc		; 18
	sbc [$38.b]		; E7 38
	cmp [$0A.b]		; C7 0A
	sbc $7E.b,X		; F5 7E
	sta ($74.b,X)		; 81 74
	phb		; 8B
	cli		; 58
	lda $16.b,S		; A3 16
	sbc #$0000.w		; E9 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $80FF.w,X		; 1E FF 80
	bra  78.b		; 80 4E
	cpy #$501E.w		; C0 1E 50
	rol $28.b,X		; 36 28
	ora $908FA8.l		; 0F A8 8F 90
	ora [$50.b]		; 07 50
	brk $00.b		; 00 00
	ror $3E01.w,X		; 7E 01 3E
	ora ($9E.b,X)		; 01 9E
	and ($CE.b,X)		; 21 CE
	ora ($5F.b),Y		; 11 5F
	brk $6F.b		; 00 6F
	brk $2F.b		; 00 2F
	bra   0.b		; 80 00
	adc $6F0000.l,X		; 7F 00 00 6F
	beq -97.b		; F0 9F
	rts		; 60

	sbc $007F00.l,X		; FF 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	brk $80.b		; 00 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $807F80.l,X		; 7F 80 7F 80
	adc $000080.l,X		; 7F 80 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($01.b,X)		; 01 01
	jsr ($FD00.w,X)		; FC 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	asl $FC.b		; 06 FC
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $07.b		; 02 07
	sbc $00FEC1.l,X		; FF C1 FE 00
	ora $8018C8.l		; 0F C8 18 80
	and $435F80.l		; 2F 80 5F 43
	adc [$0A.b],Y		; 77 0A
	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	sbc [$00.b]		; E7 00
	bne  15.b		; D0 0F
	ldy #$871F.w		; A0 1F 87
	sec		; 38
	lsr A		; 4A
	and $00.b,X		; 35 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	inc $04FC.w,X		; FE FC 04
	ora [$F8.b]		; 07 F8
	ldy $5FFF.w,X		; BC FF 5F
	sbc $00F828.l,X		; FF 28 F8 00
	sed		; F8
	bpl 104.b		; 10 68
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	ora [$C0.b]		; 07 C0
	sta [$60.b]		; 87 60
	ora [$E0.b],Y		; 17 E0
.ACCU 16
.INDEX 16
	rep #$3A		; C2 3A
	tsb $03.b		; 04 03
	rts		; 60

	bne -40.b		; D0 D8
	jsr $CABE.w		; 20 BE CA
	jmp $150963.l		; 5C 63 09 15
	ora [$03.b]		; 07 03
	sbc $FF00.w,X		; FD 00 FF
	brk $1F.b		; 00 1F
	brk $37.b		; 00 37
	brk $11.b		; 00 11
	brk $8B.b		; 00 8B
	brk $E6.b		; 00 E6
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp $897C.w		; 4C 7C 89
	adc $060F12.l		; 6F 12 0F 06
	ora ($7A.b,X)		; 01 7A
	sed		; F8
	brk $7F.b		; 00 7F
	sta $00F8BF.l,X		; 9F BF F8 00
	sta $00.b,S		; 83 00
	beq   0.b		; F0 00
	jsr ($FF00.w,X)		; FC 00 FF
	tsb $0607.w		; 0C 07 06
	sbc $006000.l,X		; FF 00 60 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -48.b		; F0 D0
	plp		; 28
	bne -52.b		; D0 CC
	ldy $7088.w,X		; BC 88 70
	tsb $F8.b		; 04 F8
	plx		; FA
	cpy #$0000.w		; C0 00 00
	bra   0.b		; 80 00
	jsr $3000.w		; 20 00 30
	brk $10.b		; 00 10
	brk $CE.b		; 00 CE
	brk $E2.b		; 00 E2
	brk $36.b		; 00 36
	brk $00.b		; 00 00
	ora $DFFF17.l		; 0F 17 FF DF
	ora $FFFFFF.l,X		; 1F FF FF FF
	brk $00.b		; 00 00
	and $00FE00.l,X		; 3F 00 FE 00
	sec		; 38
	ora $C0E8F0.l		; 0F F0 E8 C0
	ora $0000E0.l,X		; 1F E0 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FE.b		; 00 FE
	brk $7C.b		; 00 7C
	brk $E0.b		; 00 E0
	bne  -2.b		; D0 FE
	sed		; F8
	sbc ($FE.b)		; F2 FE
	jsr ($18E8.w,X)		; FC E8 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$2E1E.w		; E0 1E 2E
	tsb $0CF2.w		; 0C F2 0C
	brk $02.b		; 00 02
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	bra  48.b		; 80 30
	brk $D7.b		; 00 D7
	and [$E1.b],Y		; 37 E1
	sbc $E1FFD7.l,X		; FF D7 FF E1
	sbc $000400.l,X		; FF 00 04 00
	brk $E7.b		; 00 E7
	sbc $02FFE1.l,X		; FF E1 FF 02
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $04FFE1.l,X		; FF E1 FF 04
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $E1.b		; 00 E1
	sbc $000406.l,X		; FF 06 04 00
	brk $17.b		; 00 17
	brk $E1.b		; 00 E1
	sbc $000408.l,X		; FF 08 04 00
	brk $27.b		; 00 27
	brk $E1.b		; 00 E1
	sbc $00040A.l,X		; FF 0A 04 00
	brk $D8.b		; 00 D8
	sbc $0CFFF1.l,X		; FF F1 FF 0C
	tsb $00.b		; 04 00
	brk $E8.b		; 00 E8
	sbc $0EFFF1.l,X		; FF F1 FF 0E
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $20FFF1.l,X		; FF F1 FF 20
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	brk $F1.b		; 00 F1
	sbc $000422.l,X		; FF 22 04 00
	brk $18.b		; 00 18
	brk $F1.b		; 00 F1
	sbc $000424.l,X		; FF 24 04 00
	brk $28.b		; 00 28
	brk $F1.b		; 00 F1
	sbc $000426.l,X		; FF 26 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $06.b,S		; 03 06
	asl $1918.w		; 0E 18 19
	jsr $4326.w		; 20 26 43
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $1E.b		; 00 1E
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	ora ($08.b,X)		; 01 08
	clc		; 18
	ror $E1.b		; 66 E1
	brk $18.b		; 00 18
	brk $60.b		; 00 60
	brk $80.b		; 00 80
	tas		; 1B
	tas		; 1B
	xce		; FB
	xce		; FB
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $00FC00.l,X		; 1F 00 FC 00
	cpx $00.b		; E4 00
	sty $00.b		; 84 00
	ora $00FF00.l,X		; 1F 00 FF 00
	adc $0000FF.l,X		; 7F FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	eor [$C7.b]		; 47 C7
	eor [$C6.b]		; 47 C6
	jsl $0000E2.l		; 22 E2 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	and $003F00.l,X		; 3F 00 3F 00
	asl $FF00.w,X		; 1E 00 FF
	sbc $171F18.l,X		; FF 18 1F 17
	cmp $E8F9D1.l,X		; DF D1 F9 E8
	sbc $0497C1.l		; EF C1 97 04
	ora $000B00.l		; 0F 00 0B 00
	brk $E3.b		; 00 E3
	brk $E7.b		; 00 E7
	brk $E1.b		; 00 E1
	brk $F0.b		; 00 F0
	ora $DB.b,S		; 03 DB
	ora ($19.b,X)		; 01 19
	brk $1D.b		; 00 1D
	brk $FF.b		; 00 FF
	sbc $F8FFFF.l,X		; FF FF FF F8
	sed		; F8
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$E060.w		; C0 60 E0
	cpx #$F0E0.w		; E0 E0 F0
	beq   0.b		; F0 00
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	bra -32.b		; 80 E0
	bra -16.b		; 80 F0
	bra -120.b		; 80 88
	sed		; F8
	pea $0AFC.w		; F4 FC 0A
	asl $0705.w		; 0E 05 07
	cop $03.b		; 02 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	cpy #$E0A0.w		; C0 A0 E0
	bvc 112.b		; 50 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$6000.w		; C0 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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

	brk $00.b		; 00 00
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	ora ($01.b,X)		; 01 01
	sta ($83.b,X)		; 81 83
	sbc ($62.b,X)		; E1 62
	sbc $00FF80.l,X		; FF 80 FF 00
	rol $3E80.w,X		; 3E 80 3E
	bra  62.b		; 80 3E
	bra  -2.b		; 80 FE
	brk $7C.b		; 00 7C
	brk $9D.b		; 00 9D
	brk $00.b		; 00 00
	cmp $16BE87.l,X		; DF 87 BE 16
	ldy $10.b,X		; B4 10
	bvc  16.b		; 50 10
	.db $62, $39, $65		; 62 39 65
	clv		; B8
	adc $85.b,X		; 75 85
	adc $40.b,S		; 63 40
	and $96700F.l,X		; 3F 0F 70 96
	adc #$ED12.w		; 69 12 ED
	and $C23CC0.l,X		; 3F C0 3C C2
	bit $2EC2.w,X		; 3C C2 2E
	bne   6.b		; D0 06
	pea $EA80.w		; F4 80 EA
	ora ($29.b,X)		; 01 29
	stz $B5.b		; 64 B5
	sbc ($55.b,X)		; E1 55
	sbc $55.b		; E5 55
	adc #$6D55.w		; 69 55 6D
	eor $3A.b,X		; 55 3A
	cmp ($05.b,X)		; C1 05
	bvs  14.b		; 70 0E
	beq -30.b		; F0 E2
	clc		; 18
.INDEX 8
	sep #$18		; E2 18
.INDEX 8
	sep #$18		; E2 18
	.db $62, $98, $62		; 62 98 62
	tya		; 98
	xce		; FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $7D.b		; 00 7D
	brk $7D.b		; 00 7D
	brk $7D.b		; 00 7D
	brk $7E.b		; 00 7E
	brk $30.b		; 00 30
	brk $FB.b		; 00 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FD.b		; 04 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FE.b		; 02 FE
	ora ($FF.b,X)		; 01 FF
	brk $08.b		; 00 08
	ora $603C30.l		; 0F 30 3C 60
	adc $001F1F.l,X		; 7F 1F 1F 00
	brk $00.b		; 00 00
	ora $60.b,S		; 03 60
	jsr $2060.w		; 20 60 20
	bpl   0.b		; 10 00
	eor $00.b,S		; 43 00
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	inc $0301.w,X		; FE 01 03
	jsr ($407F.w,X)		; FC 7F 40
	and $FF0040.l,X		; 3F 40 00 FF
	ora $03.b		; 05 03
	brk $BF.b		; 00 BF
	adc $00007F.l,X		; 7F 7F 00 00
	ora ($E7.b,X)		; 01 E7
	asl $0019.w		; 0E 19 00
	and $FF0000.l,X		; 3F 00 00 FF
	brk $00.b		; 00 00
	rti		; 40

	brk $80.b		; 00 80
	sbc $00F800.l,X		; FF 00 F8 00
	sbc [$00.b]		; E7 00
	cld		; D8
	ora [$0B.b]		; 07 0B
	ora $000704.l		; 0F 04 07 00
	sbc $26FF1F.l,X		; FF 1F FF 26
	rol $CF0A.w,X		; 3E 0A CF
	cmp [$34.b]		; C7 34
	brk $FA.b		; 00 FA
	sbc [$00.b],Y		; F7 00
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $33.b		; 00 33
	brk $CA.b		; 00 CA
	ora ($34.b,X)		; 01 34
	cmp ($FB.b,X)		; C1 FB
	xce		; FB
	ora $FB.b,S		; 03 FB
	jsr ($FBFD.w,X)		; FC FD FB
	xce		; FB
	brk $00.b		; 00 00
	xce		; FB
	brk $78.b		; 00 78
	sta ($BB.b,X)		; 81 BB
	rti		; 40

	sbc $00FF00.l,X		; FF 00 FF 00
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	xce		; FB
	tsb $F8.b		; 04 F8
	ora [$FB.b]		; 07 FB
	tsb $7B.b		; 04 7B
	sty $23.b		; 84 23
	sbc $23.b,S		; E3 23
	sbc $00.b,S		; E3 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	bra  63.b		; 80 3F
	bra  -1.b		; 80 FF
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	rti		; 40

	sbc $00FF00.l,X		; FF 00 FF 00
	nop		; EA
	sbc $00EFE0.l		; EF E0 EF 00
	jsr ($FEFC.w,X)		; FC FC FE
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $F4.b		; 00 F4
	brk $F2.b		; 00 F2
	tsb $0300.w		; 0C 00 03
	brk $01.b		; 00 01
	inc $FE01.w,X		; FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($78.b,X)		; 01 78
	sed		; F8
	clv		; B8
	sed		; F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $FCFF.w,X		; FE FF FC
	ora [$F9.b]		; 07 F9
	ora $F81BF0.l		; 0F F0 1B F8
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $E4.b		; 00 E4
	ora $00.b,S		; 03 00
	bit $3F00.w,X		; 3C 00 3F
	adc $FF03FF.l,X		; 7F FF 03 FF
	sbc $FF0F00.l,X		; FF 00 0F FF
	ora ($1F.b,S),Y		; 13 1F
	ora ($FF.b,X)		; 01 FF
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	tsb $F8.b		; 04 F8
	plp		; 28
	sed		; F8
	brk $FC.b		; 00 FC
	inx		; E8
	sbc [$87.b]		; E7 87
	sei		; 78
	tsb $FC.b		; 04 FC
	ora $F8FFE0.l,X		; 1F E0 FF F8
	sbc ($FF.b)		; F2 FF
	bmi -64.b		; 30 C0
	beq   0.b		; F0 00
	ora $00FF00.l,X		; 1F 00 FF 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl -32.b		; 10 E0
	beq  15.b		; F0 0F
	asl $01.b		; 06 01
	cpy #$60.b		; C0 60
	cpx #$10.b		; E0 10
	stz $AC.b,X		; 74 AC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $00BF00.l,X		; FF 00 BF 00
	cmp $00DB00.l		; CF 00 DB 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi -16.b		; 30 F0
	and [$FF.b]		; 27 FF
	cpy $3F.b		; C4 3F
	ora $0207.w,Y		; 19 07 02
	ora #$0000.w		; 09 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	ora $00C000.l		; 0F 00 C0 00
	sed		; F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	pei ($FC.b)		; D4 FC
	dec $28.b,X		; D6 28
	sbc $000047.l,X		; FF 47 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	php		; 08
	brk $0C.b		; 00 0C
	brk $88.b		; 00 88
	brk $3E.b		; 00 3E
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $21.b		; 00 21
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9D.b		; 00 9D
	bvc  12.b		; 50 0C
	jmp ($764F.w)		; 6C 4F 76
	jsr $113F.w		; 20 3F 11
	ora $000704.l,X		; 1F 04 07 00
	brk $00.b		; 00 00
	brk $1D.b		; 00 1D
	sep #$0C		; E2 0C
	adc ($4F.b,S),Y		; 73 4F
	bmi  32.b		; 30 20
	ora $040E11.l,X		; 1F 11 0E 04
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $4D.b		; 00 4D
	sta $83.b,X		; 95 83
	bit $FB05.w,X		; 3C 05 FB
	pha		; 48
	sed		; F8
	bcc -16.b		; 90 F0
	rti		; 40

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $C2.b		; 00 C2
	sec		; 38
	sta $78.b,S		; 83 78
	sty $78.b		; 84 78
	pha		; 48
	bcs -112.b		; B0 90
	rts		; 60

	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $000000.l,X		; FF 00 00 00
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
	sbc $FD00FF.l,X		; FF FF 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $03.b		; 02 03
	jsr ($00FF.w,X)		; FC FF 00
	bne 127.b		; D0 7F
	sta ($5E.b,X)		; 81 5E
	ora ($7B.b,X)		; 01 7B
	brk $7C.b		; 00 7C
	bra -11.b		; 80 F5
	rti		; 40

	inc $FE44.w,X		; FE 44 FE
	ora $FC.b		; 05 FC
	bra  15.b		; 80 0F
	lda ($0E.b),Y		; B1 0E
	lda $1C.b,S		; A3 1C
	sty $3B.b		; 84 3B
	ora $3A.b		; 05 3A
	ora $300F30.l		; 0F 30 0F 30
	eor $0132.w		; 4D 32 01
	xce		; FB
	cpy #$3F.b		; C0 3F
	bra -33.b		; 80 DF
	sta ($06.b),Y		; 91 06
	sei		; 78
	eor [$48.b],Y		; 57 48
	cmp $086F68.l,X		; DF 68 6F 08
	adc $E2F804.l		; 6F 04 F8 E2
	trb $2ED0.w		; 1C D0 2E
	sta ($6E.b),Y		; 91 6E
	clv		; B8
	ora [$B8.b]		; 07 B8
	ora [$48.b]		; 07 48
	sta [$48.b],Y		; 97 48
	sta [$F3.b],Y		; 97 F3
	inc $0705.w,X		; FE 05 07
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	adc $FF7FE1.l,X		; 7F E1 7F FF
	brk $00.b		; 00 00
	sed		; F8
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	sbc $20007F.l,X		; FF 7F 00 20
	asl $0000.w,X		; 1E 00 00
	eor [$BF.b],Y		; 57 BF
	eor ($AB.b),Y		; 51 AB
	ror $3F4E.w		; 6E 4E 3F
	and $000000.l		; 2F 00 00 00
	ora $9F1F1F.l,X		; 1F 1F 1F 9F
	tya		; 98
	iny		; C8
	brk $6E.b		; 00 6E
	brk $91.b		; 00 91
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $E01FFF.l,X		; FF FF 1F E0
	brk $60.b		; 00 60
	ora [$82.b]		; 07 82
	bit #$FF00.w		; 89 00 FF
	sbc $FF3FFF.l,X		; FF FF 3F FF
	bmi  63.b		; 30 3F
	and $FFFFF0.l		; 2F F0 FF FF
	lda $187F3F.l,X		; BF 3F 7F 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	ora $80DFC0.l		; 0F C0 DF 80
	brk $00.b		; 00 00
	and $79C7C0.l,X		; 3F C0 C7 79
	eor $DCC231.l		; 4F 31 C2 DC
	cpx $F8.b		; E4 F8
	bpl -16.b		; 10 F0
	beq  31.b		; F0 1F
	sbc ($F0.b),Y		; F1 F0
	sbc $8AF0.w,X		; FD F0 8A
	brk $E0.b		; 00 E0
	brk $31.b		; 00 31
	brk $13.b		; 00 13
	brk $E0.b		; 00 E0
	ora $0F07EF.l		; 0F EF 07 0F
	brk $F1.b		; 00 F1
	asl $FF00.w		; 0E 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	tsb $07.b		; 04 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	tsb $03.b		; 04 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $FE01.w,X		; FE 01 FE
	sbc $00FC04.l,X		; FF 04 FC 00
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	inc $0000.w,X		; FE 00 00
	brk $04.b		; 00 04
	sed		; F8
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $F3.b		; 06 F3
	ora $FF.b,S		; 03 FF
	eor $7B.b,S		; 43 7B
	jsr $103F.w		; 20 3F 10
	ora $000F08.l,X		; 1F 08 0F 00
	ora $00.b,S		; 03 00
	brk $07.b		; 00 07
	sei		; 78
	ora [$78.b]		; 07 78
	cmp $3C.b,S		; C3 3C
	and ($1E.b,X)		; 21 1E
	bpl  15.b		; 10 0F
	php		; 08
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	brk $E8.b		; 00 E8
	eor $801710.l		; 4F 10 17 80
	sta $097F80.l,X		; 9F 80 7F 09
	sbc $08FE32.l,X		; FF 32 FE 08
	sed		; F8
	brk $00.b		; 00 00
	ldy #$17.b		; A0 17
	brk $EF.b		; 00 EF
	bcc 111.b		; 90 6F
	cpx #$1F.b		; E0 1F
	ora #$32F6.w		; 09 F6 32
	cpy $F008.w		; CC 08 F0
	brk $00.b		; 00 00
	adc $FF7FFF.l,X		; 7F FF 7F FF
	jsr $0060.w		; 20 60 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9F.b		; 00 9F
	sta $7F787F.l,X		; 9F 7F 78 7F
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $87.b		; 00 87
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $C300FF.l,X		; FF FF 00 C3
	and $00FE00.l,X		; 3F 00 FE 00
	jsr ($F000.w,X)		; FC 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1CE4FF.l,X		; FF FF E4 1C
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	jsr ($C000.w,X)		; FC 00 C0
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($80.b,S),Y		; 13 80
	jmp $CF00.w		; 4C 00 CF
	.db $42, $DC		; 42 DC
	brk $CF.b		; 00 CF
	sbc $00FFE6.l,X		; FF E6 FF 00
	tsb $00.b		; 04 00
	brk $CF.b		; 00 CF
	sbc $02FFF6.l,X		; FF F6 FF 02
	tsb $00.b		; 04 00
	brk $DF.b		; 00 DF
	sbc $04FFDE.l,X		; FF DE FF 04
	tsb $00.b		; 04 00
	brk $DF.b		; 00 DF
	sbc $06FFEE.l,X		; FF EE FF 06
	tsb $00.b		; 04 00
	brk $DF.b		; 00 DF
	sbc $08FFFE.l,X		; FF FE FF 08
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $0AFFDC.l,X		; FF DC FF 0A
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $0CFFEC.l,X		; FF EC FF 0C
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $0EFFFC.l,X		; FF FC FF 0E
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $20FFDC.l,X		; FF DC FF 20
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $22FFEC.l,X		; FF EC FF 22
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $24FFFC.l,X		; FF FC FF 24
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	brk $DC.b		; 00 DC
	sbc $000426.l,X		; FF 26 04 00
	brk $0F.b		; 00 0F
	brk $EC.b		; 00 EC
	sbc $000428.l,X		; FF 28 04 00
	brk $0F.b		; 00 0F
	brk $FC.b		; 00 FC
	sbc $00042A.l,X		; FF 2A 04 00
	brk $1F.b		; 00 1F
	brk $E4.b		; 00 E4
	sbc $00042C.l,X		; FF 2C 04 00
	brk $1F.b		; 00 1F
	brk $F4.b		; 00 F4
	sbc $00042E.l,X		; FF 2E 04 00
	brk $2F.b		; 00 2F
	brk $E8.b		; 00 E8
	sbc $000440.l,X		; FF 40 04 00
	brk $2F.b		; 00 2F
	brk $F8.b		; 00 F8
	sbc $000442.l,X		; FF 42 04 00
	brk $3F.b		; 00 3F
	brk $ED.b		; 00 ED
	sbc $000444.l,X		; FF 44 04 00
	brk $04.b		; 00 04
	ora [$39.b]		; 07 39
	and $0F3F30.l,X		; 3F 30 3F 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	bpl   8.b		; 10 08
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00E0FF.l,X		; FF FF E0 00
	sbc $000001.l,X		; FF 01 00 00
	sbc $00DFDF.l		; EF DF DF 00
	jsr $8000.w		; 20 00 80
	ora $FF.b,S		; 03 FF
	php		; 08
	ora $0000.w		; 0D 00 00
	sbc $100000.l,X		; FF 00 00 10
	brk $20.b		; 00 20
	lda $00FF40.l,X		; BF 40 FF 00
	jsr ($F300.w,X)		; FC 00 F3
	brk $A0.b		; 00 A0
	rts		; 60

	cli		; 58
	sec		; 38
	and [$0F.b],Y		; 37 0F
	tsb $0003.w		; 0C 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9F.b		; 00 9F
	brk $47.b		; 00 47
	brk $30.b		; 00 30
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	phk		; 4B
	bpl  76.b		; 10 4C
	lda ($CD.b),Y		; B1 CD
	ora ($EE.b)		; 12 EE
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	lda $1C.b,S		; A3 1C
	ldy #$1F.b		; A0 1F
	and ($1E.b,X)		; 21 1E
	jsl $0E011D.l		; 22 1D 01 0E
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	cop $06.b		; 02 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $010000.l		; 0F 00 00 01
	asl $0E.b		; 06 0E
	clc		; 18
	sec		; 38
	rts		; 60

	sbc $80.b,S		; E3 80
	tya		; 98
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	lda $0000FF.l,X		; BF FF 00 00
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	ora $007800.l,X		; 1F 00 78 00
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	adc $F10800.l,X		; 7F 00 08 F1
	brk $FD.b		; 00 FD
	bvs -114.b		; 70 8E
	iny		; C8
	inc $64.b,X		; F6 64
	ora ($46.b,X)		; 01 46
	ora $771A.w		; 0D 1A 77
	txa		; 8A
	ora ($02.b,S),Y		; 13 02
	jsr ($FE00.w,X)		; FC 00 FE
	adc ($8E.b),Y		; 71 8E
	jsr ($6403.w,X)		; FC 03 64
	txy		; 9B
	ror $EE91.w		; 6E 91 EE
	ora ($9A.b,X)		; 01 9A
	adc $37.b		; 65 37
	sec		; 38
	ora ($9A.b),Y		; 11 9A
	tas		; 1B
	stz $480B.w		; 9C 0B 48
	and $05EC.w		; 2D EC 05
	bit $04.b		; 24 04
	cpx $06.b		; E4 06
	ldx $C3.b		; A6 C3
	tsb $046B.w		; 0C 6B 04
	adc [$00.b]		; 67 00
	lda [$00.b],Y		; B7 00
	sta ($00.b,S),Y		; 93 00
	tad		; 5B
	bra  91.b		; 80 5B
	bra  25.b		; 80 19
	cpy #$04.b		; C0 04
	sbc $00FE00.l,X		; FF 00 FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	xce		; FB
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$03.b]		; 07 03
	and $77E060.l,X		; 3F 60 E0 77
	ora $00C000.l		; 0F 00 C0 00
	bra   1.b		; 80 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $B0.b		; 00 B0
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $01.b		; 00 01
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	sbc $030000.l,X		; FF 00 00 03
	ora $8F.b,S		; 03 8F
	sta $008F8F.l		; 8F 8F 8F 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $DF.b		; 00 DF
	brk $D0.b		; 00 D0
	asl $DF.b		; 06 DF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $EF.b		; 00 EF
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $D2.b		; 00 D2
	and $20DF.w		; 2D DF 20
	cmp $10EF20.l,X		; DF 20 EF 10
	sbc $10EF10.l		; EF 10 EF 10
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc $00FF80.l,X		; FF 80 FF 00
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
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $030200.l,X		; FF 00 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $010200.l,X		; FF 00 02 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	beq  16.b		; F0 10
	cpy #$00.b		; C0 00
	cpy #$20.b		; C0 20
	cpy #$00.b		; C0 00
	cpx #$F0.b		; E0 F0
	cpx #$10.b		; E0 10
	ora $E0FFE0.l,X		; 1F E0 FF E0
	sbc $00FFE0.l,X		; FF E0 FF 00
	ora $00FFC0.l,X		; 1F C0 FF 00
	sbc $E00F00.l		; EF 00 0F E0
	bpl  25.b		; 10 19
	php		; 08
	ora $103320.l,X		; 1F 20 33 10
	and $42.b,X		; 35 42
	ror $42.b,X		; 76 42
	ror $6902.w		; 6E 02 69
	and $68.b,S		; 23 68
	cpx $03.b		; E4 03
	cpx $03.b		; E4 03
	iny		; C8
	ora [$C1.b]		; 07 C1
	asl $0D92.w		; 0E 92 0D
	.db $82, $1D, $83		; 82 1D 83
	trb $1C83.w		; 1C 83 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
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
	brk $E0.b		; 00 E0
	ldy #$60.b		; A0 60
	brk $FF.b		; 00 FF
	sbc $FF.b,S		; E3 FF
	ora #$020F.w		; 09 0F 02
	ora $F0.b,S		; 03 F0
	sed		; F8
	tsb $1FFE.w		; 0C FE 1F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $07.b		; 00 07
	brk $F1.b		; 00 F1
	brk $9F.b		; 00 9F
	sbc $0F7F40.l,X		; FF 40 7F 0F
	sbc $FCFFFF.l,X		; FF FF FF FC
	jsr ($E0E3.w,X)		; FC E3 E0
	sbc $646FF8.l		; EF F8 6F 64
	adc $00BF00.l,X		; 7F 00 BF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $001F00.l,X		; 1F 00 1F 00
	sta [$18.b]		; 87 18
	ora ($1B.b)		; 12 1B
	cop $63.b		; 02 63
	eor ($99.b)		; 52 99
	stx $5D.b		; 86 5D
	iny		; C8
	cmp $F0.b		; C5 F0
	tda		; 7B
	adc ($9F.b,X)		; 61 9F
	cop $FF.b		; 02 FF
	txs		; 9A
	adc $F2.b		; 65 F2
	ora $05EA.w		; 0D EA 05
	dec $CC21.w,X		; DE 21 CC
	and ($F8.b,S),Y		; 33 F8
	ora [$71.b]		; 07 71
	stx $FD02.w		; 8E 02 FD
	lsr $A6.b		; 46 A6
	lsr $86.b		; 46 86
	eor $AF50AF.l		; 4F AF 50 AF
	eor $BF67A0.l,X		; 5F A0 67 BF
	and $E020C0.l,X		; 3F C0 20 E0
	ora $39C0.w,Y		; 19 C0 39
	cpy #$30.b		; C0 30
	cpy #$30.b		; C0 30
	cpy #$3F.b		; C0 3F
	cpy #$20.b		; C0 20
	cpy #$1F.b		; C0 1F
	cpx #$20.b		; E0 20
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
	brk $CD.b		; 00 CD
	cmp $CCCFCC.l		; CF CC CF CC
	cmp $C0CF0C.l		; CF 0C CF C0
	sbc $00DFDF.l		; EF DF DF 00
	brk $DF.b		; 00 DF
	ora $FC00FC.l		; 0F FC 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	jsr $20DF.w		; 20 DF 20
	cmp $868720.l,X		; DF 20 87 86
	dec $C4.b		; C6 C4
	cmp [$C7.b]		; C7 C7
	cmp [$C7.b]		; C7 C7
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	adc $007F80.l,X		; 7F 80 7F 00
	rol $3F00.w,X		; 3E 00 3F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $7B.b		; 00 7B
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $FB08F7.l,X		; FF F7 08 FB
	tsb $F8.b		; 04 F8
	ora [$FF.b]		; 07 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	brk $FC.b		; 00 FC
	sbc $60FFF3.l,X		; FF F3 FF 60
	adc [$97.b],Y		; 77 97
	sta $E8ECC0.l,X		; 9F C0 EC E8
	cmp $8097C1.l		; CF C1 97 80
	phd		; 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $00EF00.l		; 8F 00 EF 00
	pea $F400.w		; F4 00 F4
	ora $DB.b,S		; 03 DB
	ora ($9D.b,X)		; 01 9D
	brk $00.b		; 00 00
	sbc $7F7F00.l,X		; FF 00 7F 7F
	sbc $E0C0C0.l,X		; FF C0 C0 E0
	cpx #$30.b		; E0 30
	beq -72.b		; F0 B8
	sed		; F8
	jmp.w [$00DC]		; DC DC 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $30.b		; 00 30
	cpy #$B8.b		; C0 B8
	cpy #$DC.b		; C0 DC
	cpy #$FF.b		; C0 FF
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
	brk $7E.b		; 00 7E
	brk $7C.b		; 00 7C
	ora ($79.b,X)		; 01 79
	ora [$72.b]		; 07 72
	asl $70.b		; 06 70
	ora $60.b		; 05 60
	phd		; 0B
	rti		; 40

	ora $7F1F40.l		; 0F 40 1F 7F
	bra 126.b		; 80 7E
	bra 120.b		; 80 78
	bra 121.b		; 80 79
	bra 122.b		; 80 7A
	sta ($74.b,X)		; 81 74
	sta $74.b,S		; 83 74
	sta $60.b,S		; 83 60
	sta [$FF.b]		; 87 FF
	brk $02.b		; 00 02
	inc $FC04.w,X		; FE 04 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FC0200.l,X		; FF 00 02 FC
	tsb $F8.b		; 04 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sty $07.b		; 84 07
	cop $03.b		; 02 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $03.b		; C4 03
	cop $01.b		; 02 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($FE.b,X)		; 01 FE
	ora ($FF.b,X)		; 01 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	inc $FF00.w,X		; FE 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0.b		; C0 E0
	beq  80.b		; F0 50
	sei		; 78
	plp		; 28
	bit $0E0C.w,X		; 3C 0C 0E
	asl $07.b		; 06 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rts		; 60

	brk $30.b		; 00 30
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $00C343.l,X		; FF 43 C3 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $599D3E.l,X		; FF 3E 9D 59
	jsr ($505C.w,X)		; FC 5C 50
	brk $00.b		; 00 00
	bit $8000.w,X		; 3C 00 80
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $7DC03F.l,X		; FF 3F C0 7D
	.db $82, $5C, $A3		; 82 5C A3
	beq  -1.b		; F0 FF
	adc $BF3FFF.l,X		; 7F FF 3F BF
	ora $E000DF.l		; 0F DF 00 E0
	php		; 08
	sei		; 78
	brk $F4.b		; 00 F4
	dey		; 88
	bit $00.b,X		; 34 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	bra  63.b		; 80 3F
	cpy #$17.b		; C0 17
	cpx #$8B.b		; E0 8B
	bvs -117.b		; 70 8B
	bvs  30.b		; 70 1E
	lda $FF00.w,X		; BD 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	jsr $003F.w		; 20 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	cpy #$00.b		; C0 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $001F20.l,X		; 7F 20 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($FC24.w,X)		; 7C 24 FC
	pha		; 48
	sed		; F8
	bcc -16.b		; 90 F0
	jsr $00E0.w		; 20 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $48D824.l,X		; FF 24 D8 48
	bcs -112.b		; B0 90
	rts		; 60

	jsr $00C0.w		; 20 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpx #$10.b		; E0 10
	cpx #$40.b		; E0 40
	and $00C03F.l,X		; 3F 3F C0 00
	brk $CC.b		; 00 CC
	tsa		; 3B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bne   0.b		; D0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000300.l,X		; FF 00 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cli		; 58
	tya		; 98
	bra 115.b		; 80 73
	bvs  14.b		; 70 0E
	.db $82, $01, $00		; 82 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFF87.l,X		; FF 87 FF FF
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	sbc $0100FF.l,X		; FF FF 00 01
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	sei		; 78
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc $000000.l,X		; FF 00 00 00
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	ora $181F18.l,X		; 1F 18 1F 18
	and $787F3F.l,X		; 3F 3F 7F 78
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $0FFF1F.l,X		; FF 1F FF 0F
	cpx #$07.b		; E0 07
	cpx #$07.b		; E0 07
	cpy #$00.b		; C0 00
	sta [$00.b]		; 87 00
	sbc $050000.l,X		; FF 00 00 05
	tsb $06.b		; 04 06
	cpx $E6.b		; E4 E6
	cpx #$E7.b		; E0 E7
	brk $FE.b		; 00 FE
	inc $00FF.w,X		; FE FF 00
	brk $FF.b		; 00 FF
	brk $1E.b		; 00 1E
	brk $1B.b		; 00 1B
	brk $FB.b		; 00 FB
	brk $F9.b		; 00 F9
	asl $00.b		; 06 00
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0E.b		; 00 0E
	dec $C787.w		; CE 87 C7
	and $7F0FFF.l,X		; 3F FF 0F 7F
	bra  -1.b		; 80 FF
	brk $7F.b		; 00 7F
	sei		; 78
	adc $8E0000.l,X		; 7F 00 00 8E
	rti		; 40

	eor [$00.b]		; 47 00
	adc $10AF00.l,X		; 7F 00 AF 10
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	pha		; 48
	ora $C01740.l,X		; 1F 40 17 C0
	and [$10.b],Y		; 37 10
	and $40EFC0.l,X		; 3F C0 EF 40
	sbc $982F80.l		; EF 80 2F 98
	cmp $688760.l,X		; DF 60 87 68
	sta [$C8.b]		; 87 C8
	ora [$C8.b]		; 07 C8
	ora [$10.b]		; 07 10
	ora $D00F10.l		; 0F 10 0F D0
	ora $000738.l		; 0F 38 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sta $C0.b,S		; 83 C0
	cmp [$1F.b]		; C7 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	ora $C0.b,S		; 03 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	sbc ($01.b,S),Y		; F3 01
	sta $FFFF00.l		; 8F 00 FF FF
	sbc $02F778.l,X		; FF 78 F7 02
	inc $F00F.w,X		; FE 0F F0
	cop $00.b		; 02 00
	brk $F3.b		; 00 F3
	ora ($8E.b,X)		; 01 8E
	ora $000000.l		; 0F 00 00 00
	ora $000100.l		; 0F 00 01 00
	brk $00.b		; 00 00
	asl $85.b,X		; 16 85
	eor ($AC.b,X)		; 41 AC
	sbc $92.b,S		; E3 92
	cpy #$D2.b		; C0 D2
	ora ($8F.b)		; 12 8F
	tax		; AA
	and ($61.b,X)		; 21 61
	adc ($38.b),Y		; 71 38
	sed		; F8
	txy		; 9B
	rts		; 60

	sbc $0CF100.l,X		; FF 00 F1 0C
	cmp ($2C.b),Y		; D1 2C
	sta $BF60.w,X		; 9D 60 BF
	rti		; 40

	adc ($8E.b),Y		; 71 8E
	adc $8086.w,Y		; 79 86 80
	bcs  68.b		; B0 44
	lda ($45.b)		; B2 45
	tsa		; 3B
	eor $3B.b,S		; 43 3B
	ora $3B.b,S		; 03 3B
	ora ($3D.b,X)		; 01 3D
	sta ($BF.b,X)		; 81 BF
	brk $FC.b		; 00 FC
	bra 127.b		; 80 7F
	cmp $38.b		; C5 38
	mvp $40,$B8		; 44 B8 40
	ldy $BC41.w,X		; BC 41 BC
	cop $FC.b		; 02 FC
	cop $7C.b		; 02 7C
	sta ($7E.b,X)		; 81 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $BB.b		; 05 BB
	cpy $F5.b		; C4 F5
	plx		; FA
	plx		; FA
	sbc $3E3D.w,X		; FD 3D 3E
	asl $07.b		; 06 07
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	cpy #$00.b		; C0 00
	sed		; F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	cpy #$E8.b		; C0 E8
	tya		; 98
	lda [$5F.b],Y		; B7 5F
	and ($C7.b,S),Y		; 33 C7
	dec $39.b		; C6 39
	lda $6F5FCE.l		; AF CE 5F 6F
	adc $003F00.l,X		; 7F 00 3F 00
	eor [$00.b],Y		; 57 00
	dey		; 88
	brk $8C.b		; 00 8C
	brk $3F.b		; 00 3F
	brk $11.b		; 00 11
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
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000300.l,X		; FF 00 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq -100.b		; F0 9C
	jsr ($DF18.w,X)		; FC 18 DF
.ACCU 16
.INDEX 16
	rep #$3B		; C2 3B
	sec		; 38
	asl $07.b		; 06 07
	brk $C1.b		; 00 C1
	dec $F8.b		; C6 F8
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $E0.b		; 00 E0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tsb $063F.w		; 0C 3F 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FA.b,X		; F6 FA
	rtl		; 6B

	sbc $B24D.w,X		; FD 4D B2
	and $86A7.w,Y		; 39 A7 86
	adc #$0000.w		; 69 00 00
	brk $00.b		; 00 00
	cpx #$0400.w		; E0 00 04
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $C2.b		; 00 C2
	brk $F3.b		; 00 F3
	brk $BF.b		; 00 BF
	rti		; 40

	sbc $00FFFF.l,X		; FF FF FF 00
	cpx #$001F.w		; E0 1F 00
	ora $00FF00.l,X		; 1F 00 FF 00
	inc $7800.w,X		; FE 00 78
	and $0000C0.l,X		; 3F C0 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	sbc $FFFF00.l,X		; FF 00 FF FF
	jsr ($F003.w,X)		; FC 03 F0
	beq   0.b		; F0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	ora $00C000.l		; 0F 00 C0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	cpx #$20E0.w		; E0 E0 20
	ldy #$6020.w		; A0 20 60
	ldy #$8040.w		; A0 40 80
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $D0.b		; 00 D0
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $70.b		; 00 70
	brk $00.b		; 00 00
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
	brk $F8.b		; 00 F8
	jsr ($FF00.w,X)		; FC 00 FF
	adc $7FBFFF.l,X		; 7F FF BF 7F
	clc		; 18
	ora $37F837.l,X		; 1F 37 F8 37
	sbc $073FFF.l,X		; FF FF 3F 07
	ora [$FF.b]		; 07 FF
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $07.b		; 00 07
	cpx #$C0CF.w		; E0 CF C0
	iny		; C8
	cpy #$C03F.w		; C0 3F C0
	and #$0017.w		; 29 17 00
	sbc $FAF5F0.l,X		; FF F0 F5 FA
	sbc $FE00.w,X		; FD 00 FE
	sed		; F8
	tsb $F0.b		; 04 F0
	pea $FEFF.w		; F4 FF FE
	sed		; F8
	brk $FC.b		; 00 FC
	brk $0E.b		; 00 0E
	brk $06.b		; 00 06
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $0F.b		; 00 0F
	brk $FE.b		; 00 FE
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
	beq   0.b		; F0 00
	beq -96.b		; F0 A0
	bpl -80.b		; 10 B0
	bpl -16.b		; 10 F0
	cpx #$8080.w		; E0 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq -32.b		; F0 E0
	beq -32.b		; F0 E0
	bmi -64.b		; 30 C0
	bmi -64.b		; 30 C0
	jsr $8010.w		; 20 10 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  92.b		; 80 5C
	brk $C7.b		; 00 C7
	jmp $00D6.w		; 4C D6 00
	iny		; C8
	sbc $00FFF1.l,X		; FF F1 FF 00
	tsb $00.b		; 04 00
	brk $D8.b		; 00 D8
	sbc $02FFF1.l,X		; FF F1 FF 02
	tsb $00.b		; 04 00
	brk $E8.b		; 00 E8
	sbc $04FFF1.l,X		; FF F1 FF 04
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $06FFF1.l,X		; FF F1 FF 06
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	brk $F1.b		; 00 F1
	sbc $000408.l,X		; FF 08 04 00
	brk $18.b		; 00 18
	brk $F1.b		; 00 F1
	sbc $00040A.l,X		; FF 0A 04 00
	brk $28.b		; 00 28
	brk $F1.b		; 00 F1
	sbc $00040C.l,X		; FF 0C 04 00
	brk $38.b		; 00 38
	brk $F1.b		; 00 F1
	sbc $00040E.l,X		; FF 0E 04 00
	brk $48.b		; 00 48
	brk $F1.b		; 00 F1
	sbc $000420.l,X		; FF 20 04 00
	brk $C7.b		; 00 C7
	sbc $22FFE1.l,X		; FF E1 FF 22
	tsb $00.b		; 04 00
	brk $D7.b		; 00 D7
	sbc $24FFE1.l,X		; FF E1 FF 24
	tsb $00.b		; 04 00
	brk $E7.b		; 00 E7
	sbc $26FFE1.l,X		; FF E1 FF 26
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $28FFE1.l,X		; FF E1 FF 28
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $E1.b		; 00 E1
	sbc $00042A.l,X		; FF 2A 04 00
	brk $17.b		; 00 17
	brk $E1.b		; 00 E1
	sbc $00042C.l,X		; FF 2C 04 00
	brk $27.b		; 00 27
	brk $E1.b		; 00 E1
	sbc $00042E.l,X		; FF 2E 04 00
	brk $37.b		; 00 37
	brk $E1.b		; 00 E1
	sbc $000440.l,X		; FF 40 04 00
	brk $47.b		; 00 47
	brk $E1.b		; 00 E1
	sbc $000442.l,X		; FF 42 04 00
	brk $DF.b		; 00 DF
	sbc $44FFD1.l,X		; FF D1 FF 44
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $46FFD1.l,X		; FF D1 FF 46
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $48FFD1.l,X		; FF D1 FF 48
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	brk $D1.b		; 00 D1
	sbc $00044A.l,X		; FF 4A 04 00
	brk $1F.b		; 00 1F
	brk $D1.b		; 00 D1
	sbc $00044C.l,X		; FF 4C 04 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	bpl -128.b		; 10 80
	brk $E0.b		; 00 E0
	bpl -64.b		; 10 C0
	brk $58.b		; 00 58
	sec		; 38
	and [$0F.b],Y		; 37 0F
	tsb $FF03.w		; 0C 03 FF
	brk $0F.b		; 00 0F
	cpx #$00FF.w		; E0 FF 00
	ora $00FFE0.l		; 0F E0 FF 00
	eor [$00.b]		; 47 00
	bmi   0.b		; 30 00
	tsb $2000.w		; 0C 00 20
	rol $10.b,X		; 36 10
	and $11.b,X		; 35 11
	and $01.b,X		; 35 01
	and $09.b		; 25 09
	and $18.b		; 25 18
	and [$C8.b]		; 27 C8
	inc $08.b,X		; F6 08
	sbc [$C0.b],Y		; F7 C0
	ora $C10EC1.l		; 0F C1 0E C1
	asl $0ED1.w		; 0E D1 0E
	cmp ($0E.b),Y		; D1 0E
	cmp ($0E.b),Y		; D1 0E
	bpl  15.b		; 10 0F
	bpl  15.b		; 10 0F
	bcc -127.b		; 90 81
	sta $5C.b		; 85 5C
	sbc $06.b,S		; E3 06
	stx $C7.b		; 86 C7
	ldy #$0286.w		; A0 86 02
	inc A		; 1A
	lsr $65.b,X		; 56 65
	ldx #$9995.w		; A2 95 99
	ror $FB.b		; 66 FB
	brk $E5.b		; 00 E5
	clc		; 18
	sbc $18.b		; E5 18
	ldy $59.b		; A4 59
	bit $7BC1.w,X		; 3C C1 7B
	bra -73.b		; 80 B7
	pha		; 48
	cmp ($AD.b,X)		; C1 AD
	.db $42, $FE		; 42 FE
	rti		; 40

	ror $48.b,X		; 76 48
	ror $49.b,X		; 76 49
	adc ($49.b,S),Y		; 73 49
	adc ($49.b,S),Y		; 73 49
	and [$C9.b],Y		; 37 C9
	ldx $C2.b,Y		; B6 C2
	bmi -55.b		; 30 C9
	bmi  65.b		; 30 41
	clv		; B8
	eor ($B8.b,X)		; 41 B8
	mvp $44,$B8		; 44 B8 44
	clv		; B8
	mvp $C5,$B8		; 44 B8 C5
	sec		; 38
	ora $808F80.l,X		; 1F 80 8F 80
	sta [$80.b]		; 87 80
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	asl $BF00.w		; 0E 00 BF
	lda $7FFF00.l,X		; BF 00 FF 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	brk $BF.b		; 00 BF
	brk $DF.b		; 00 DF
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $BFFF00.l,X		; FF 00 FF BF
	rti		; 40

	lda $20DF40.l,X		; BF 40 DF 20
	cmp $1FE020.l,X		; DF 20 E0 1F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	rts		; 60

	phd		; 0B
	pla		; 68
	ora $400760.l		; 0F 60 07 40
	ora [$C0.b],Y		; 17 C0
	ora $C01F00.l,X		; 1F 00 1F C0
	cmp $74DF40.l,X		; DF 40 DF 74
	sta $74.b,S		; 83 74
	sta $78.b,S		; 83 78
	sta [$68.b]		; 87 68
	sta [$E8.b]		; 87 E8
	ora [$E8.b]		; 07 E8
	ora [$20.b]		; 07 20
	ora $070F20.l		; 0F 20 0F 07
	cpx $05.b		; E4 05
	lda #$F310.w		; A9 10 F3
	sec		; 38
	pea $F434.w		; F4 34 F4
	plp		; 28
	cpx $04.b		; E4 04
	sbc $32.b,S		; E3 32
	tya		; 98
	and [$D8.b]		; 27 D8
	rol $7FD0.w		; 2E D0 7F
	bra 124.b		; 80 7C
	sta $7C.b,S		; 83 7C
	sta $6C.b,S		; 83 6C
	sta ($6F.b,S),Y		; 93 6F
	bcc  63.b		; 90 3F
	cpy #$2630.w		; C0 30 26
	beq -89.b		; F0 A7
	clv		; B8
	lda [$58.b],Y		; B7 58
	cmp [$D8.b],Y		; D7 D8
	cmp [$18.b],Y		; D7 18
	cmp [$50.b],Y		; D7 50
	eor [$C0.b],Y		; 57 C0
	sta [$30.b],Y		; 97 30
	cmp $780F70.l		; CF 70 0F 78
	ora [$98.b]		; 07 98
	and [$98.b]		; 27 98
	and [$98.b]		; 27 98
	and [$98.b]		; 27 98
	and [$50.b]		; 27 50
	and $0040C0.l		; 2F C0 40 00
	bra   0.b		; 80 00
	cpy #$FF3F.w		; C0 3F FF
	and $FF7FF8.l,X		; 3F F8 7F FF
	adc $BF3FF8.l,X		; 7F F8 3F BF
	lda $FF0000.l,X		; BF 00 00 FF
	and $800080.l,X		; 3F 80 00 80
	clc		; 18
	sta [$00.b]		; 87 00
	bra  24.b		; 80 18
	sta [$40.b]		; 87 40
	bra   1.b		; 80 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($F0.b,X)		; 01 F0
	beq -16.b		; F0 F0
	bpl  -8.b		; 10 F8
	sed		; F8
	sed		; F8
	php		; 08
	sbc $FEF9.w,Y		; F9 F9 FE
	brk $00.b		; 00 00
	sbc $0F00FF.l,X		; FF FF 00 0F
	brk $0F.b		; 00 0F
	cpx #$0007.w		; E0 07 00
	ora [$F0.b]		; 07 F0
	asl $00.b		; 06 00
	jsr ($007D.w,X)		; FC 7D 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FEE0FF.l,X		; FF FF E0 FE
	sbc ($FF.b,X)		; E1 FF
	sbc $000003.l,X		; FF 03 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $000000.l,X		; 7F 00 00 00
	ora $001F00.l,X		; 1F 00 1F 00
	brk $7F.b		; 00 7F
	sbc $6F3F30.l,X		; FF 30 3F 6F
	beq 103.b		; F0 67
	sbc [$FF.b],Y		; F7 FF
	sbc $7F7F7F.l,X		; FF 7F 7F 7F
	brk $FF.b		; 00 FF
	sbc $0F0080.l,X		; FF 80 00 0F
	cpy #$009F.w		; C0 9F 00
	tya		; 98
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	brk $FD.b		; 00 FD
	plx		; FA
	cop $FF.b		; 02 FF
	xce		; FB
	ora [$F3.b]		; 07 F3
	sbc [$FE.b],Y		; F7 FE
	inc $FFFF.w,X		; FE FF FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	ora [$00.b]		; 07 00
	sbc $FC00.w,X		; FD 00 FC
	brk $0C.b		; 00 0C
	brk $01.b		; 00 01
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
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	bvs  62.b		; 70 3E
	sta $E718.w,X		; 9D 18 E7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	cop $1F.b		; 02 1F
	brk $00.b		; 00 00
	adc ($8E.b),Y		; 71 8E
	and $E11EC0.l,X		; 3F C0 1E E1
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	cop $1D.b		; 02 1D
	brk $00.b		; 00 00
	ora #$1EB6.w		; 09 B6 1E
	adc $17.b,X		; 75 17
	phx		; DA
	cop $FE.b		; 02 FE
	mvp $88,$FC		; 44 FC 88
	sed		; F8
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sta $78.b		; 85 78
	asl $E8.b,X		; 16 E8
	ora ($EC.b,S),Y		; 13 EC
	jsl $B844DC.l		; 22 DC 44 B8
	dey		; 88
	bvs   0.b		; 70 00
	cpy #$0000.w		; C0 00 00
	sbc $FF7F00.l,X		; FF 00 7F FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0F0800.l,X		; FF 00 08 0F
	tsb $07.b		; 04 07
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $070800.l,X		; FF 00 08 07
	tsb $03.b		; 04 03
	cop $01.b		; 02 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF0100.l,X		; FF 00 01 FF
	cop $FE.b		; 02 FE
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FE0100.l,X		; FF 00 01 FE
	cop $FC.b		; 02 FC
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  63.b		; 80 3F
	sty $84EF.w		; 8C EF 84
	and [$02.b]		; 27 02
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	ora $E4031C.l		; 0F 1C 03 E4
	ora $02.b,S		; 03 02
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	jsr ($DE1E.w,X)		; FC 1E DE
	ora $F007E7.l		; 0F E7 07 F0
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	rti		; 40

	adc $3C1F00.l,X		; 7F 00 1F 3C
	cmp $1E.b,S		; C3 1E
	sbc ($0F.b,X)		; E1 0F
	beq   7.b		; F0 07
	sed		; F8
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	and $201F00.l,X		; 3F 00 1F 20
	and [$21.b],Y		; 37 21
	rol $8EC0.w		; 2E C0 8E
	brk $9D.b		; 00 9D
	tsb $F9.b		; 04 F9
	ora #$32F3.w		; 09 F3 32
	dec $48.b		; C6 48
	cld		; D8
	bmi -49.b		; 30 CF
	ora ($DE.b,X)		; 01 DE
	cpy #$803F.w		; C0 3F 80
	adc $09FB04.l,X		; 7F 04 FB 09
	inc $32.b,X		; F6 32
	cpy $B048.w		; CC 48 B0
	and $A0005F.l,X		; 3F 5F 00 A0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	bra  63.b		; 80 3F
	cpy #$FF00.w		; C0 00 FF
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($F3.b,S),Y		; F3 F3
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $FF00.w		; 0C 00 FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cpx #$00FF.w		; E0 FF 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora $00FF00.l,X		; 1F 00 FF 00
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	sbc $7F8100.l,X		; FF 00 81 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	jsr ($F003.w,X)		; FC 03 F0
	beq   0.b		; F0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	ora $00C000.l		; 0F 00 C0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $68.b		; 00 68
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	sed		; F8
	brk $78.b		; 00 78
	bpl   8.b		; 10 08
	beq   8.b		; F0 08
	sed		; F8
	php		; 08
	sed		; F8
	beq  24.b		; F0 18
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	bvs  -8.b		; 70 F8
	bvs  -8.b		; 70 F8
	brk $18.b		; 00 18
	cpx #$E018.w		; E0 18 E0
	bpl   8.b		; 10 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	trb $381F.w		; 1C 1F 38
	and $000707.l,X		; 3F 07 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $008080.l,X		; FF 80 80 00
	sbc $F7F3.w,Y		; F9 F3 F7
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $060000.l,X		; 7F 00 00 06
	tsb $08.b		; 04 08
	sbc $20DF10.l		; EF 10 DF 20
	lda $010140.l,X		; BF 40 01 01
	brk $FC.b		; 00 FC
	bit $0C.b,X		; 34 0C
	brk $FF.b		; 00 FF
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0B.b		; 00 0B
	ora $040F09.l		; 0F 09 0F 04
	ora [$00.b]		; 07 00
	sbc $9FFF7F.l,X		; FF 7F FF 9F
	sbc $063F2F.l,X		; FF 2F 3F 06
	asl $00F7.w,X		; 1E F7 00
	sbc [$00.b],Y		; F7 00
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E1.b		; 00 E1
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $80E0E0.l,X		; FF E0 E0 80
	bra  63.b		; 80 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $31.b		; 00 31
	adc $317F31.l,X		; 7F 31 7F 31
	adc $7FBF00.l,X		; 7F 00 BF 7F
	adc $000000.l,X		; 7F 00 00 00
	brk $3E.b		; 00 3E
	adc $F000F0.l,X		; 7F F0 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	rti		; 40

	brk $80.b		; 00 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $040680.l,X		; 7F 80 06 04
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $030000.l,X		; FF 00 00 03
	cpx #$E0E3.w		; E0 E3 E0
	sbc $00.b,S		; E3 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $1D.b		; 00 1D
	cop $FC.b		; 02 FC
	ora $FC.b,S		; 03 FC
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	adc ($07.b,S),Y		; 73 07
	lda $00DF17.l,X		; BF 17 DF 00
	and $3EBF00.l,X		; 3F 00 BF 3E
	and $803F3F.l,X		; 3F 3F 3F 80
	brk $A3.b		; 00 A3
	brk $D7.b		; 00 D7
	php		; 08
	adc $C00080.l		; 6F 80 00 C0
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	lda $000040.l,X		; BF 40 00 00
	bra -128.b		; 80 80
	cpy #$03C0.w		; C0 C0 03
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $18F8F7.l,X		; FF F7 F8 18
	ora $800000.l,X		; 1F 00 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	ora $007800.l,X		; 1F 00 78 00
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $001F00.l,X		; FF 00 1F 00
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	tsb $00EF.w		; 0C EF 00
	sbc $41F9FA.l,X		; FF FA F9 41
	rol $F030.w,X		; 3E 30 F0
	ora ($FF.b,X)		; 01 FF
	sbc $380400.l,X		; FF 00 04 38
	asl $7CE0.w		; 0E E0 7C
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $0100FF.l,X		; FF FF 00 01
	brk $80.b		; 00 80
	bra 114.b		; 80 72
	cpx $0000.w		; EC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs 112.b		; 70 70
	eor ($87.b,X)		; 41 87
	sbc $19.b		; E5 19
	sec		; 38
	asl $06.b		; 06 06
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0020.w		; C0 20 00
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
	brk $78.b		; 00 78
	php		; 08
	sei		; 78
	php		; 08
	sei		; 78
	php		; 08
	sei		; 78
	php		; 08
	bvs 112.b		; 70 70
	rti		; 40

	brk $60.b		; 00 60
	bpl   0.b		; 10 00
	sbc $0F707F.l,X		; FF 7F 70 0F
	bvs 127.b		; 70 7F
	bvs 127.b		; 70 7F
	bvs  15.b		; 70 0F
	brk $7F.b		; 00 7F
	brk $0F.b		; 00 0F
	rts		; 60

	brk $7F.b		; 00 7F
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	cop $07.b		; 02 07
	brk $04.b		; 00 04
	tsb $000D.w		; 0C 0D 00
	ora #$0D00.w		; 09 00 0D
	adc $00FE80.l,X		; 7F 80 FE 00
	sbc $F900.w,X		; FD 00 F9
	brk $FA.b		; 00 FA
	ora ($F0.b,X)		; 01 F0
	ora $F4.b,S		; 03 F4
	ora $F4.b,S		; 03 F4
	ora $7F.b,S		; 03 7F
	sbc $00BE00.l,X		; FF 00 BE 00
	lda $0E7F00.l,X		; BF 00 7F 0E
	sbc ($0F.b),Y		; F1 0F
	dec $BE18.w,X		; DE 18 BE
	jmp $80C0.w		; 4C C0 80
	brk $7F.b		; 00 7F
	brk $80.b		; 00 80
	adc $0EFF00.l,X		; 7F 00 FF 0E
	sbc ($1F.b),Y		; F1 1F
	cpx #$C13E.w		; E0 3E C1
	jmp $13B3.w		; 4C B3 13
	asl $CFC9.w,X		; 1E C9 CF
	bit #$021B.w		; 89 1B 02
	stp		; DB
	tsb $ED.b		; 04 ED
	ora ($FD.b,X)		; 01 FD
	.db $82, $66, $40		; 82 66 40
	asl $00E1.w,X		; 1E E1 00
	bmi   0.b		; 30 00
	bit $C0.b		; 24 C0
	tsb $E0.b		; 04 E0
	ora ($E0.b)		; 12 E0
	sta ($60.b)		; 92 60
	cmp #$4930.w		; C9 30 49
	bcs 127.b		; B0 7F
	cpy #$207F.w		; C0 7F 20
	sta $B0EFD0.l		; 8F D0 EF B0
	cmp $C05FE0.l,X		; DF E0 5F C0
	eor $C08FC0.l,X		; 5F C0 8F C0
	sbc $C03F00.l,X		; FF 00 3F C0
	ora $007F60.l,X		; 1F 60 7F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	adc $1C4145.l,X		; 7F 45 41 1C
	adc $007F00.l,X		; 7F 00 7F 00
	lda $00BF00.l,X		; BF 00 BF 00
	lda $00DF00.l,X		; BF 00 DF 00
	eor #$7FB2.w		; 49 B2 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra -65.b		; 80 BF
	rti		; 40

	lda $40BF40.l,X		; BF 40 BF 40
	cmp $00FF20.l,X		; DF 20 FF 00
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
	sbc $00BF00.l,X		; FF 00 BF 00
	ldy $BD00.w,X		; BC 00 BD
	ora ($BA.b,X)		; 01 BA
	ora $B8.b,S		; 03 B8
	ora $BC.b,S		; 03 BC
	asl $B8.b		; 06 B8
	asl $B2.b		; 06 B2
	ora [$BF.b]		; 07 BF
	rti		; 40

	lda $40BE40.l,X		; BF 40 BE 40
	ldy $BC40.w,X		; BC 40 BC
	rti		; 40

	lda $B940.w,Y		; B9 40 B9
	rti		; 40

	lda $2040.w,Y		; B9 40 20
	and $40F090.l,X		; 3F 90 F0 40
	cmp $00BF80.l,X		; DF 80 BF 00
	adc $07F803.l,X		; 7F 03 F8 07
	sbc ($0F.b,S),Y		; F3 0F
	sbc [$C0.b]		; E7 C0
	brk $0F.b		; 00 0F
	brk $20.b		; 00 20
	ora $803F40.l,X		; 1F 40 3F 80
	adc $077C83.l,X		; 7F 83 7C 07
	sed		; F8
	ora $FF1FF0.l		; 0F F0 1F FF
	tas		; 1B
	ora $01CB00.l,X		; 1F 00 CB 01
	sbc $00.b,X		; F5 00
	inc $1FC0.w,X		; FE C0 1F
	cpx #$10CE.w		; E0 CE 10
	cmp [$00.b]		; C7 00
	brk $E0.b		; 00 E0
	brk $0C.b		; 00 0C
	beq   6.b		; F0 06
	sed		; F8
	ora $FC.b,S		; 03 FC
	cmp ($3E.b,X)		; C1 3E
	cpx #$D01F.w		; E0 1F D0
	and $FEF807.l		; 2F 07 F8 FE
	sbc $7EFFFC.l,X		; FF FC FF 7E
	sbc $008181.l,X		; FF 81 81 00
	rti		; 40

	cpy #$0040.w		; C0 40 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $BF00.w,X		; 7E 00 BF
	brk $BF.b		; 00 BF
	brk $5F.b		; 00 5F
	bra -82.b		; 80 AE
	eor [$EF.b],Y		; 57 EF
	ora ($57.b)		; 12 57
	xba		; EB
	rtl		; 6B

	pea $FA35.w		; F4 35 FA
	tas		; 1B
	jmp ($0E0F.w,X)		; 7C 0F 0E
	ora $03.b,S		; 03 03
	ora $1C00.w,Y		; 19 00 1C
	brk $0C.b		; 00 0C
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $81.b		; 00 81
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	bvs -33.b		; 70 DF
	adc $D02FC5.l		; 6F C5 2F D0
	and [$1C.b],Y		; 37 1C
	cmp $3FBE.w,X		; DD BE 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $003000.l		; 4F 00 30 00
	sec		; 38
	brk $2E.b		; 00 2E
	brk $E3.b		; 00 E3
	brk $41.b		; 00 41
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq  28.b		; F0 1C
	jsr ($FFE3.w,X)		; FC E3 FF
	cli		; 58
	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	dec $FB.b		; C6 FB
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	sec		; 38
	brk $03.b		; 00 03
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80FF0F.l,X		; 1F 0F FF 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	sbc $00FFFF.l,X		; FF FF FF 00
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
	brk $FF.b		; 00 FF
	sbc $04FFF8.l,X		; FF F8 FF 04
	and $000000.l,X		; 3F 00 00 00
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
	brk $C0.b		; 00 C0
	sbc $3FFF00.l,X		; FF 00 FF 3F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
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
	cpx #$F800.w		; E0 00 F8
	inx		; E8
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$F000.w		; E0 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	and [$3B.b],Y		; 37 3B
	ora $03.b		; 05 03
	tsb $81.b		; 04 81
	.db $82, $FC, $FE		; 82 FC FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00F8FF.l,X		; FF FF F8 00
	inc $FF00.w,X		; FE 00 FF
	tsb $067F.w		; 0C 7F 06
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	bit $AEFF.w,X		; 3C FF AE
	cmp $7A95.w,Y		; D9 95 7A
	dex		; CA
	and $15.b,X		; 35 15
	asl A		; 0A
	asl A		; 0A
	sbc $01.b		; E5 01
	sbc $03F9FA.l,X		; FF FA F9 03
	brk $03.b		; 00 03
	brk $E1.b		; 00 E1
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $1E.b		; 00 1E
	brk $FE.b		; 00 FE
	brk $07.b		; 00 07
	brk $C0.b		; 00 C0
	rti		; 40

	bvs -112.b		; 70 90
	sei		; 78
	inx		; E8
	tay		; A8
	cli		; 58
	pla		; 68
	cld		; D8
	sed		; F8
	php		; 08
	php		; 08
	sed		; F8
	bra -16.b		; 80 F0
	bra   0.b		; 80 00
	cpy #$8000.w		; C0 00 80
	brk $C0.b		; 00 C0
	brk $34.b		; 00 34
	brk $04.b		; 00 04
	brk $04.b		; 00 04
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
	ora $09.b,S		; 03 09
	ora $001918.l		; 0F 18 19 00
	and [$20.b]		; 27 20
	jmp ($8F83.w)		; 6C 83 8F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora $001C00.l,X		; 1F 00 1C 00
	adc $3C0400.l,X		; 7F 00 04 3C
	and ($E0.b,X)		; 21 E0
	rti		; 40

	cmp [$00.b]		; C7 00
	trb $C000.w		; 1C 00 C0
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	sbc $0003FF.l,X		; FF FF 03 00
	ora $003F00.l,X		; 1F 00 3F 00
	jsr ($C000.w,X)		; FC 00 C0
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	ora $007F9F.l,X		; 1F 9F 7F 00
	rti		; 40

	brk $40.b		; 00 40
	ora $47.b,S		; 03 47
	ora $47.b,S		; 03 47
	tsa		; 3B
	adc $FF7F31.l,X		; 7F 31 7F FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sbc $01FFFF.l,X		; FF FF FF 01
	ora ($03.b,X)		; 01 03
	ora $0F.b,S		; 03 0F
	ora $0E0E0F.l		; 0F 0F 0E 0E
	asl $0406.w		; 0E 06 04
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	brk $0B.b		; 00 0B
	cmp $C4FF8B.l,X		; DF 8B FF C4
	cpx $F7E0.w		; EC E0 F7
	cpy #$028B.w		; C0 8B 02
	ora $000500.l		; 0F 00 05 00
	cop $E7.b		; 02 E7
	brk $E7.b		; 00 E7
	brk $F0.b		; 00 F0
	brk $FA.b		; 00 FA
	ora ($CD.b,X)		; 01 CD
	brk $0C.b		; 00 0C
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	sbc $78F0F0.l,X		; FF F0 F0 78
	sei		; 78
	clc		; 18
	sed		; F8
	cpy $64FC.w		; CC FC 64
	pea $F646.w		; F4 46 F6
	and [$F7.b]		; 27 F7
	sbc $00F000.l,X		; FF 00 F0 00
	sei		; 78
	brk $18.b		; 00 18
	cpx #$F0CC.w		; E0 CC F0
	cpx $70.b		; E4 70
	dec $60.b		; C6 60
	adc [$20.b]		; 67 20
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $1E.b		; 14 1E
	asl A		; 0A
	ora $020705.l		; 0F 05 07 02
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E080.w		; C0 80 E0
	rti		; 40

	bvs  32.b		; 70 20
	sec		; 38
	bpl  28.b		; 10 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$6000.w		; C0 00 60
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $04.b		; 00 04
	brk $F4.b		; 00 F4
	phd		; 0B
	sbc [$FF.b],Y		; F7 FF
	pea $F7FF.w		; F4 FF F7
	sbc $000400.l,X		; FF 00 04 00
	brk $FC.b		; 00 FC
	sbc $01FFF7.l,X		; FF F7 FF 01
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	brk $F7.b		; 00 F7
	sbc $000402.l,X		; FF 02 04 00
	brk $F8.b		; 00 F8
	sbc $03FFFF.l,X		; FF FF FF 03
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $03FFFF.l,X		; FF FF FF 03
	mvp $00,$00		; 44 00 00
	ora ($01.b,X)		; 01 01
	ora [$07.b]		; 07 07
	bra   3.b		; 80 03
	bmi  79.b		; 30 4F
	sbc $FF0100.l,X		; FF 00 01 FF
	brk $80.b		; 00 80
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FE00.w,X)		; FC 00 FE
	brk $FF.b		; 00 FF
	sbc $8100FE.l,X		; FF FE 00 81
	ror $1F00.w,X		; 7E 00 1F
	sbc $FC34FF.l,X		; FF FF 34 FC
	bvs  -8.b		; 70 F8
	php		; 08
	jsr ($66E5.w,X)		; FC E5 66
	ror $7F.b		; 66 7F
	dex		; CA
	ldy $10.b,X		; B4 10
	sbc $C80000.l		; EF 00 00 C8
	brk $9C.b		; 00 9C
	brk $07.b		; 00 07
	brk $9B.b		; 00 9B
	bra  37.b		; 80 25
	tya		; 98
	phk		; 4B
	bit $10.b,X		; 34 10
	sbc $000000.l		; EF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	rol $EF08.w		; 2E 08 EF
	inc A		; 1A
	ora $8680.w,X		; 1D 80 86
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $FE.b		; 00 FE
	brk $F1.b		; 00 F1
	asl $F0.b		; 06 F0
	ora [$E2.b]		; 07 E2
	ora $80.b		; 05 80
	asl $00.b		; 06 00
	cmp ($00.b,X)		; C1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $F1.b		; 00 F1
	bpl -10.b		; 10 F6
	sbc $F8FFF1.l,X		; FF F1 FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $F9.b		; 00 F9
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $F8.b		; 00 F8
	sbc $000402.l,X		; FF 02 04 00
	brk $09.b		; 00 09
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $F8.b		; 00 F8
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $000405.l,X		; FF 05 04 00
	brk $81.b		; 00 81
	brk $38.b		; 00 38
	eor [$FF.b]		; 47 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $008000.l,X		; FF 00 80 00
	ora $FE0600.l		; 0F 00 06 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $80.b		; 00 80
	adc $000F00.l,X		; 7F 00 0F 00
	asl $9E.b		; 06 9E
	adc $FCB946.l,X		; 7F 46 B9 FC
	trb $3BFC.w		; 1C FC 3B
	eor $3A9F.w,X		; 5D 9F 3A
	ora $01.b,X		; 15 01
	sbc $230300.l,X		; FF 00 03 23
	brk $80.b		; 00 80
	brk $E3.b		; 00 E3
	cpx #$0384.w		; E0 84 03
	sta $22.b		; 85 22
	lsr A		; 4A
	sta $01.b		; 85 01
	inc $0300.w,X		; FE 00 03
	brk $82.b		; 00 82
	bra -63.b		; 80 C1
	eor $A07F60.l,X		; 5F 60 7F A0
	rts		; 60

	sbc $04C0A0.l,X		; FF A0 C0 04
	jsr ($8000.w,X)		; FC 00 80
	cmp $00.b,S		; C3 00
	adc $00BF00.l,X		; 7F 00 BF 00
	eor $805F80.l,X		; 5F 80 5F 80
	lda $F80440.l,X		; BF 40 04 F8
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs -68.b		; 70 BC
	bvs -66.b		; 70 BE
	jsr $64B6.w		; 20 B6 64
	ror $0C00.w,X		; 7E 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $C300.w,X		; FE 00 C3
	tsb $0AD5.w		; 0C D5 0A
	cmp #$8516.w		; C9 16 85
	inc A		; 1A
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $FFE33F.l,X		; 3F 3F E3 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq  32.b		; F0 20
	sep #$00		; E2 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $C3.b		; 00 C3
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F3.b		; 00 F3
	asl $FFF7.w		; 0E F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	sed		; F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF7.l,X		; FF F7 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $FA.b		; 00 FA
	sbc $000403.l,X		; FF 03 04 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
	cmp $67.b,S		; C3 67
	sbc [$C8.b]		; E7 C8
	pld		; 2B
	ora ($17.b),Y		; 11 17
	eor ($0F.b,X)		; 41 0F
	ora $07.b,S		; 03 07
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	and $001800.l,X		; 3F 00 18 00
	pea $EBC3.w		; F4 C3 EB
	tsb $7B.b		; 04 7B
	tsb $03.b		; 04 03
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	brk $DF.b		; 00 DF
	cmp $BF1010.l,X		; DF 10 10 BF
	sta $3F607F.l,X		; 9F 7F 60 3F
	lda $00E000.l,X		; BF 00 E0 00
	lda $FF00FF.l,X		; BF FF 00 FF
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $BF.b		; 00 BF
	brk $5F.b		; 00 5F
	bra  95.b		; 80 5F
	bra  63.b		; 80 3F
	bra  64.b		; 80 40
	rti		; 40

	jsr $FF20.w		; 20 20 FF
	lda $D246E0.l,X		; BF E0 46 D2
	cmp $063F32.l,X		; DF 32 3F 06
	sbc $C00600.l,X		; FF 00 06 C0
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $F9.b		; 00 F9
	asl $E6.b		; 06 E6
	ora #$09C6.w		; 09 C6 09
	inc $09.b,X		; F6 09
	brk $06.b		; 00 06
	rti		; 40

	bra -32.b		; 80 E0
	cpy #$F0E0.w		; C0 E0 F0
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
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
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	sbc $FFF612.l		; EF 12 F6 FF
	sbc $FFF8FF.l		; EF FF F8 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sed		; F8
	sbc $000401.l,X		; FF 01 04 00
	brk $FF.b		; 00 FF
	sbc $02FFF8.l,X		; FF F8 FF 02
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $0F.b		; 00 0F
	brk $F8.b		; 00 F8
	sbc $000404.l,X		; FF 04 04 00
	brk $F6.b		; 00 F6
	sbc $05FFF0.l,X		; FF F0 FF 05
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $06FFF0.l,X		; FF F0 FF 06
	tsb $00.b		; 04 00
	brk $C1.b		; 00 C1
	cmp ($63.b,X)		; C1 63
	sbc ($C4.b,S),Y		; F3 C4
	and $08.b		; 25 08
	wai		; CB
	ora #$410B.w		; 09 0B 41
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora ($3F.b,X)		; 01 3F
	brk $1C.b		; 00 1C
	brk $FA.b		; 00 FA
	cmp ($F4.b,X)		; C1 F4
	ora $F5.b,S		; 03 F5
	cop $7D.b		; 02 7D
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	ora ($C2.b,X)		; 01 C2
.ACCU 16
	rep #$EF		; C2 EF
	xba		; EB
	ora $EC8FDC.l,X		; 1F DC 8F EC
	eor $FC48EF.l		; 4F EF 48 FC
	bra -17.b		; 80 EF
	brk $C0.b		; 00 C0
	cpy $00.b		; C4 00
	trb $2F00.w		; 1C 00 2F
	cpy #$6097.w		; C0 97 60
	cmp ($20.b,S),Y		; D3 20
	cmp ($20.b,S),Y		; D3 20
	sta $C00060.l		; 8F 60 00 C0
	ora $05.b		; 05 05
	sbc $02FFFD.l,X		; FF FD FF 02
	inc $FE02.w,X		; FE 02 FE
	inc $0101.w,X		; FE 01 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	cop $00.b		; 02 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	inc $41FF.w,X		; FE FF 41
	adc $FC90.w,Y		; 79 90 FC
	plb		; AB
	sbc $10FCA8.l,X		; FF A8 FC 10
	jsr ($3800.w,X)		; FC 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stx $38.b		; 86 38
	ora ($6C.b,S),Y		; 13 6C
	tsa		; 3B
	mvp $44,$3B		; 44 3B 44
	bcc 108.b		; 90 6C
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$E080.w		; E0 80 E0
	cpy #$F0C0.w		; C0 C0 F0
	bmi  32.b		; 30 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcs  48.b		; B0 30
	bne   0.b		; D0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001D.w,X		; 1D 1D 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $0000.w,X		; FD 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $EB.b		; 00 EB
	clc		; 18
	sbc ($FF.b,S),Y		; F3 FF
	xba		; EB
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $01FFF3.l,X		; FF F3 FF 01
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $02FFFB.l,X		; FF FB FF 02
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $03FFF3.l,X		; FF F3 FF 03
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $04FFFB.l,X		; FF FB FF 04
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F3.b		; 00 F3
	sbc $000405.l,X		; FF 05 04 00
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	sbc $000406.l,X		; FF 06 04 00
	brk $0B.b		; 00 0B
	brk $F7.b		; 00 F7
	sbc $000407.l,X		; FF 07 04 00
	brk $0B.b		; 00 0B
	brk $FF.b		; 00 FF
	sbc $000408.l,X		; FF 08 04 00
	brk $13.b		; 00 13
	brk $F7.b		; 00 F7
	sbc $000409.l,X		; FF 09 04 00
	brk $9F.b		; 00 9F
	sta ($FE.b,X)		; 81 FE
	adc $782767.l,X		; 7F 67 27 78
	tya		; 98
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	adc $008200.l,X		; 7F 00 82 00
	jmp.w [$FF00]		; DC 00 FF
	cpx #$00FE.w		; E0 FE 00
	rol $7EC0.w,X		; 3E C0 7E
	brk $1E.b		; 00 1E
	brk $01.b		; 00 01
	ora ($0F.b,X)		; 01 0F
	ora $FF7878.l		; 0F 78 78 FF
	ora $F2FC0D.l		; 0F 0D FC F2
	inc $BB81.w,X		; FE 81 BB
	plp		; 28
	cmp [$02.b]		; C7 02
	brk $13.b		; 00 13
	brk $88.b		; 00 88
	tsb $FF.b		; 04 FF
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	jmp ($44BA.w,X)		; 7C BA 44
	mvp $40,$7C		; 44 7C 40
	dec $20.b,X		; D6 20
	inc $7C00.w		; EE 00 7C
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $AA.b,X		; 55 AA
	eor $BA.b		; 45 BA
	plp		; 28
	cmp [$00.b],Y		; D7 00
	jmp ($3800.w,X)		; 7C 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $5040FF.l,X		; FF FF 40 50
	bvc  80.b		; 50 50
	lda $3F3FBF.l,X		; BF BF 3F 3F
	adc $40FF50.l,X		; 7F 50 FF 40
	sbc $0000A0.l,X		; FF A0 00 00
	brk $BF.b		; 00 BF
	bpl  48.b		; 10 30
	sbc $00C000.l,X		; FF 00 C0 00
	eor $00FFA0.l		; 4F A0 FF 00
	adc $A0BF00.l,X		; 7F 00 BF A0
	sta $BFBF9F.l,X		; 9F 9F BF BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $007F00.l,X		; 7F 00 7F 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpx #$7060.w		; E0 60 70
	bmi  56.b		; 30 38
	inc $EE.b		; E6 EE
	sbc $08FFFF.l,X		; FF FF FF 08
	sbc $08FE08.l,X		; FF 08 FE 08
	brk $00.b		; 00 00
	jsr $1080.w		; 20 80 10
	brk $E0.b		; 00 E0
	bpl  16.b		; 10 10
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora #$F5F5.w		; 09 F5 F5
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FA.b		; 00 FA
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sbc $A33EA6.l,X		; FF A6 3E A3
	xba		; EB
	eor $E3.b,X		; 55 E3
	jsl $EB20FF.l		; 22 FF 20 EB
	bcc  -9.b		; 90 F7
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	jsl $225D1C.l		; 22 1C 5D 22
	rol A		; 2A
	eor $A2.b,X		; 55 A2
	eor $6B94.w,X		; 5D 94 6B
	brk $3E.b		; 00 3E
	brk $1C.b		; 00 1C
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
	brk $80.b		; 00 80
	bcc -16.b		; 90 F0
	plp		; 28
	bmi  20.b		; 30 14
	clc		; 18
	beq  -4.b		; F0 FC
	bit $20.b		; 24 20
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$E000.w		; C0 00 E0
	brk $FC.b		; 00 FC
	tsb $00FC.w		; 0C FC 00
	jsr ($0000.w,X)		; FC 00 00
	brk $13.b		; 00 13
	brk $11.b		; 00 11
	brk $E2.b		; 00 E2
	jsl $E2FFEE.l		; 22 EE FF E2
	sbc $00FFEE.l,X		; FF EE FF 00
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $01FFEE.l,X		; FF EE FF 01
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $02FFEE.l,X		; FF EE FF 02
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $03FFEE.l,X		; FF EE FF 03
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $EE.b		; 00 EE
	sbc $000404.l,X		; FF 04 04 00
	brk $0A.b		; 00 0A
	brk $EE.b		; 00 EE
	sbc $000405.l,X		; FF 05 04 00
	brk $12.b		; 00 12
	brk $EE.b		; 00 EE
	sbc $000406.l,X		; FF 06 04 00
	brk $1A.b		; 00 1A
	brk $EE.b		; 00 EE
	sbc $000407.l,X		; FF 07 04 00
	brk $E2.b		; 00 E2
	sbc $08FFF6.l,X		; FF F6 FF 08
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $09FFF6.l,X		; FF F6 FF 09
	tsb $00.b		; 04 00
	brk $F2.b		; 00 F2
	sbc $0AFFF6.l,X		; FF F6 FF 0A
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $0BFFF6.l,X		; FF F6 FF 0B
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $F6.b		; 00 F6
	sbc $00040C.l,X		; FF 0C 04 00
	brk $1B.b		; 00 1B
	brk $F6.b		; 00 F6
	sbc $00040D.l,X		; FF 0D 04 00
	brk $13.b		; 00 13
	brk $F6.b		; 00 F6
	sbc $00040E.l,X		; FF 0E 04 00
	brk $0B.b		; 00 0B
	brk $F6.b		; 00 F6
	sbc $00040F.l,X		; FF 0F 04 00
	brk $03.b		; 00 03
	brk $F6.b		; 00 F6
	sbc $00040C.l,X		; FF 0C 04 00
	brk $EE.b		; 00 EE
	sbc $10FFFE.l,X		; FF FE FF 10
	tsb $00.b		; 04 00
	brk $13.b		; 00 13
	brk $FE.b		; 00 FE
	sbc $000410.l,X		; FF 10 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	xce		; FB
	lda $3FDF7F.l,X		; BF 7F DF 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	bra   0.b		; 80 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora $1F.b,S		; 03 1F
	and $8020DF.l,X		; 3F DF 20 80
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $40.b		; 00 40
	jsr $20DF.w		; 20 DF 20
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $03.b		; 00 03
	asl $1E.b		; 06 1E
	adc $C078.w,Y		; 79 78 C0
	cpy #$C0C0.w		; C0 C0 C0
	plx		; FA
	ora $07.b,S		; 03 07
	xce		; FB
	asl $04FE.w,X		; 1E FE 04
	brk $23.b		; 00 23
	brk $89.b		; 00 89
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $7F.b		; 00 7F
	sbc $C00000.l,X		; FF 00 00 C0
	cld		; D8
	clc		; 18
	sed		; F8
	dey		; 88
	inx		; E8
	ora $3F3FFF.l		; 0F FF 3F 3F
	lda $00001C.l,X		; BF 1C 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	tya		; 98
	sec		; 38
	php		; 08
	plp		; 28
	ora $408030.l		; 0F 30 80 40
	lda $F0E040.l,X		; BF 40 E0 F0
	bmi  60.b		; 30 3C
	trb $0E1E.w		; 1C 1E 0E
	ora $FF0707.l		; 0F 07 07 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $14.b		; 00 14
	brk $0A.b		; 00 0A
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	beq -104.b		; F0 98
	dey		; 88
	adc $00BE7F.l,X		; 7F 7F BE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  16.b		; 80 10
	sei		; 78
	tsb $00.b		; 04 00
	bra -65.b		; 80 BF
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F43FF.l,X		; FF FF 43 7F
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
	cpx #$FCE0.w		; E0 E0 FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	sta $009070.l,X		; 9F 70 90 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	ora $E00000.l,X		; 1F 00 00 E0
	sbc $FFE0FF.l,X		; FF FF E0 FF
	brk $1F.b		; 00 1F
	cpx #$E01F.w		; E0 1F E0
	adc $001F00.l,X		; 7F 00 1F 00
	brk $00.b		; 00 00
	php		; 08
	ora $00.b		; 05 00
	ora $002E22.l,X		; 1F 22 2E 00
	and $425240.l,X		; 3F 40 52 42
	lsr $00.b,X		; 56 00
	lda $1F03.w,X		; BD 03 1F
	jsr ($F003.w,X)		; FC 03 F0
	ora $E51CC3.l		; 0F C3 1C E5
	inc A		; 1A
	sta $3C.b,S		; 83 3C
	.db $82, $3D, $84		; 82 3D 84
	tda		; 7B
	ora $1C.b,S		; 03 1C
	bit $7D.b		; 24 7D
	bpl -20.b		; 10 EC
	phb		; 8B
	sbc $01FF03.l		; EF 03 FF 01
	sta [$81.b],Y		; 97 81
	cmp [$07.b],Y		; D7 07
	adc [$80.b],Y		; 77 80
	beq  65.b		; F0 41
	.db $82, $11, $E2		; 82 11 E2
	bra 112.b		; 80 70
	pha		; 48
	bcs -128.b		; B0 80
	sei		; 78
	bra 120.b		; 80 78
	rti		; 40

	clv		; B8
	sta [$70.b]		; 87 70
	cmp [$00.b],Y		; D7 00
	eor $80EF00.l,X		; 5F 00 EF 80
	lda $C0F780.l		; AF 80 F7 C0
	bcs -16.b		; B0 F0
	sbc $0000FF.l,X		; FF FF 00 00
	cmp $20DF20.l,X		; DF 20 DF 20
	adc $106F10.l		; 6F 10 6F 10
	and [$08.b],Y		; 37 08
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $707A00.l,X		; FF 00 7A 70
	phd		; 0B
	tsb $0407.w		; 0C 07 04
	bra -128.b		; 80 80
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	asl $7001.w		; 0E 01 70
	brk $84.b		; 00 84
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $80.b		; 00 80
	adc $4F837F.l,X		; 7F 7F 83 4F
	bcs 127.b		; B0 7F
	bra 112.b		; 80 70
	bra   0.b		; 80 00
	cpy $00.b		; C4 00
	adc $EE28.w,X		; 7D 28 EE
	brk $FF.b		; 00 FF
	brk $29.b		; 00 29
	plp		; 28
	adc $D700.w		; 6D 00 D7
	sec		; 38
	sbc $013847.l,X		; FF 47 38 01
	inc $C738.w,X		; FE 38 C7
	mvn $38,$AB		; 54 AB 38
	cmp [$28.b]		; C7 28
	cmp [$44.b],Y		; D7 44
	tyx		; BB
	sec		; 38
	cmp [$7A.b]		; C7 7A
	ora $74.b,S		; 03 74
	ora [$7C.b]		; 07 7C
	tsb $0F68.w		; 0C 68 0F
	pla		; 68
	ora #$F9F8.w		; 09 F8 F9
	beq  -7.b		; F0 F9
	brk $01.b		; 00 01
	jmp ($7980.w,X)		; 7C 80 79
	bra 114.b		; 80 72
	sta ($72.b,X)		; 81 72
	sta ($74.b,X)		; 81 74
	sta $04.b,S		; 83 04
	ora $04.b,S		; 03 04
	ora $FC.b,S		; 03 FC
	ora $00.b,S		; 03 00
	inc $7C00.w,X		; FE 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	bra  40.b		; 80 28
	brk $D9.b		; 00 D9
	and $FFE8.w		; 2D E8 FF
	cmp $F0FF.w,Y		; D9 FF F0
	sbc $000400.l,X		; FF 00 04 00
	brk $E9.b		; 00 E9
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $F0.b		; 00 F0
	sbc $000406.l,X		; FF 06 04 00
	brk $19.b		; 00 19
	brk $F0.b		; 00 F0
	sbc $000408.l,X		; FF 08 04 00
	brk $29.b		; 00 29
	brk $F0.b		; 00 F0
	sbc $00040A.l,X		; FF 0A 04 00
	brk $D9.b		; 00 D9
	sbc $0CFFE0.l,X		; FF E0 FF 0C
	tsb $00.b		; 04 00
	brk $E9.b		; 00 E9
	sbc $0EFFE0.l,X		; FF E0 FF 0E
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $20FFE0.l,X		; FF E0 FF 20
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $E0.b		; 00 E0
	sbc $000422.l,X		; FF 22 04 00
	brk $BF.b		; 00 BF
	adc $00BF40.l,X		; 7F 40 BF 00
	sbc $788878.l,X		; FF 78 88 78
	dey		; 88
	sed		; F8
	sed		; F8
	beq   8.b		; F0 08
	sed		; F8
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $FFF0FF.l,X		; FF FF F0 FF
	beq   7.b		; F0 07
	brk $17.b		; 00 17
	cpx #$F00F.w		; E0 0F F0
	pea $0FFF.w		; F4 FF 0F
	sed		; F8
	ora $0000FF.l,X		; 1F FF 00 00
	cop $03.b		; 02 03
	brk $03.b		; 00 03
	brk $05.b		; 00 05
	brk $03.b		; 00 03
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $E0.b		; 00 E0
	sbc $00FD00.l,X		; FF 00 FD 00
	inc $F801.w,X		; FE 01 F8
	ora $FC.b,S		; 03 FC
	ora $00.b,S		; 03 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00DD00.l,X		; FF 00 DD 00
	sbc $2AC11C.l,X		; FF 1C C1 2A
	tax		; AA
	eor $FF.b,X		; 55 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor ($3E.b,X)		; 41 3E
	brk $FF.b		; 00 FF
	trb $2AE3.w		; 1C E3 2A
	cmp $5D.b,X		; D5 5D
	ldx #$E71B.w		; A2 1B E7
	sbc $791C.w		; ED 1C 79
	ldy $5A78.w,X		; BC 78 5A
	sei		; 78
	rol A		; 2A
	bit $07D6.w		; 2C D6 07
	cmp $00F307.l		; CF 07 F3 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $83.b		; 00 83
	tsb $43.b		; 04 43
	sty $23.b		; 84 23
	cpy #$E010.w		; C0 10 E0
	clc		; 18
	cpx #$B08F.w		; E0 8F B0
	stz $BF00.w,X		; 9E 00 BF
	asl $D3.b		; 06 D3
	brk $DF.b		; 00 DF
	brk $DF.b		; 00 DF
	brk $6F.b		; 00 6F
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	rti		; 40

	lda $58A340.l,X		; BF 40 A3 58
	cmp $20DF20.l,X		; DF 20 DF 20
	cmp $10EF20.l,X		; DF 20 EF 10
	sbc $00FF10.l		; EF 10 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $06F900.l,X		; FF 00 F9 06
	brk $00.b		; 00 00
	sbc $FD00.w,X		; FD 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FF.b		; 02 FF
	brk $01.b		; 00 01
	ora ($F3.b,X)		; 01 F3
	ora $EE.b,S		; 03 EE
	ora $B41FDA.l		; 0F DA 1F B4
	and $683FB0.l,X		; 3F B0 3F 68
	tda		; 7B
	brk $00.b		; 00 00
	inc $FC00.w,X		; FE 00 FC
	brk $F0.b		; 00 F0
	brk $E1.b		; 00 E1
	brk $C2.b		; 00 C2
	ora ($C4.b,X)		; 01 C4
	ora $80.b,S		; 03 80
	ora [$FE.b]		; 07 FE
	ror $FF80.w,X		; 7E 80 FF
	sbc $7D00FF.l,X		; FF FF 00 7D
	brk $FF.b		; 00 FF
	sec		; 38
	sta $54.b,S		; 83 54
	eor $AA.b,X		; 55 AA
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	rol $FF00.w,X		; 3E 00 FF
	sec		; 38
	cmp [$54.b]		; C7 54
	plb		; AB
	tsx		; BA
	eor $00.b		; 45 00
	brk $7E.b		; 00 7E
	inc $FF01.w,X		; FE 01 FF
	stz $419F.w,X		; 9E 9F 41
	eor ($60.b,X)		; 41 60
	cpx #$F010.w		; E0 10 F0
	jsr $00E0.w		; 20 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $3E.b		; 00 3E
	bra  95.b		; 80 5F
	bra  47.b		; 80 2F
	cpy #$DF20.w		; C0 20 DF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	ldy #$90E0.w		; A0 E0 90
	bcs -64.b		; B0 C0
	bvc  96.b		; 50 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dey		; 88
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   8.b		; F0 08
	rti		; 40

	bra  16.b		; 80 10
	jsr $0F00.w		; 20 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$E0.b],Y		; 17 E0
	sbc $003F00.l,X		; FF 00 3F 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $0B.b		; 00 0B
	brk $1F.b		; 00 1F
	bpl  -9.b		; 10 F7
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F003.w,X)		; FC 03 F0
	ora [$E8.b]		; 07 E8
	ora [$F0.b]		; 07 F0
	ora $010100.l		; 0F 00 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A2.b		; 00 A2
	ldx $00.b,Y		; B6 00
	tax		; AA
	cmp ($B6.b,X)		; C1 B6
	eor $BE.b,X		; 55 BE
	jsl $FF1CAA.l		; 22 AA 1C FF
	bra  -1.b		; 80 FF
	eor ($7F.b,X)		; 41 7F
	ldx $9441.w,Y		; BE 41 94
	rtl		; 6B

	stz $7763.w		; 9C 63 77
	dey		; 88
	jsl $E31CDD.l		; 22 DD 1C E3
	bra 127.b		; 80 7F
	eor ($3E.b,X)		; 41 3E
	phb		; 8B
	sbc [$0B.b]		; E7 0B
	sbc $00F783.l		; EF 83 F7 00
	pea $C000.w		; F4 00 C0
	rti		; 40

	cpy #$8080.w		; C0 80 80
	brk $00.b		; 00 00
	dey		; 88
	bvs -120.b		; 70 88
	bvs -128.b		; 70 80
	sei		; 78
	ora $F8.b,S		; 03 F8
	ora [$C0.b]		; 07 C0
	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	brk $B8.b		; 00 B8
	bra   0.b		; 80 00
	brk $7F.b		; 00 7F
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	php		; 08
	sei		; 78
	ora [$FF.b]		; 07 FF
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	cop $03.b		; 02 03
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc ($7F.b,X)		; 61 7F
	cli		; 58
	adc $D0FFC1.l,X		; 7F C1 FF D0
	sbc $001F10.l,X		; FF 10 1F 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $89.b		; 00 89
	asl $89.b		; 06 89
	asl $11.b		; 06 11
	asl $0F10.w		; 0E 10 0F
	beq  15.b		; F0 0F
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	eor $6D.b		; 45 6D
	brk $55.b		; 00 55
	sta $6D.b,S		; 83 6D
	tax		; AA
	adc $5544.w,X		; 7D 44 55
	sec		; 38
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $827D.w,X		; FE 7D 82
	and #$39D6.w		; 29 D6 39
	dec $EE.b		; C6 EE
	ora ($44.b),Y		; 11 44
	tyx		; BB
	sec		; 38
	cmp [$00.b]		; C7 00
	sbc $10FE00.l,X		; FF 00 FE 10
	bne   0.b		; D0 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	asl $00C1.w		; 0E C1 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	cpx #$E718.w		; E0 18 E7
	clc		; 18
	sbc [$1F.b]		; E7 1F
	cpx #$E01F.w		; E0 1F E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	bmi   8.b		; 30 08
	bra   8.b		; 80 08
	bra   0.b		; 80 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	bmi 120.b		; 30 78
	brk $78.b		; 00 78
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
	brk $F8.b		; 00 F8
	sed		; F8
	jmp ($00FD.w,X)		; 7C FD 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora [$FB.b]		; 07 FB
	cpy $00.b		; C4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $08.b		; 00 08
	tsb $FB.b		; 04 FB
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $1F.b,S		; 03 1F
	ora $FEFEFE.l,X		; 1F FE FE FE
	inc $00FF.w,X		; FE FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	tsb INIDSP.w		; 0C 00 21
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	ora $1F.b,S		; 03 1F
	ora $E2FFFE.l,X		; 1F FE FF E2
	sbc $82.b,S		; E3 82
	sta $01.b,S		; 83 01
	ora ($01.b,X)		; 01 01
	ora ($C7.b,X)		; 01 C7
	tsb $04.b		; 04 04
	brk $20.b		; 00 20
	brk $0D.b		; 00 0D
	brk $61.b		; 00 61
	brk $81.b		; 00 81
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $80.b		; 00 80
	tya		; 98
	bcc -72.b		; 90 B8
	cli		; 58
	inx		; E8
	rti		; 40

	sed		; F8
	ora $000080.l,X		; 1F 80 00 00
	sbc $000000.l,X		; FF 00 00 00
	rti		; 40

	clc		; 18
	bvc  56.b		; 50 38
	tya		; 98
	plp		; 28
	dey		; 88
	bmi  63.b		; 30 3F
	rti		; 40

	inc $F8FE.w,X		; FE FE F8
	sbc $020704.l,X		; FF 04 07 02
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E040.w		; C0 40 E0
	jsr $90F0.w		; 20 F0 90
	sed		; F8
	pha		; 48
	adc $0026A1.l,X		; 7F A1 26 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	brk $D0.b		; 00 D0
	brk $68.b		; 00 68
	ora $C1.b,S		; 03 C1
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	ora $3480.w		; 0D 80 34
	brk $CF.b		; 00 CF
	and [$E2.b],Y		; 37 E2
	sbc $EAFFCF.l,X		; FF CF FF EA
	sbc $000400.l,X		; FF 00 04 00
	brk $CF.b		; 00 CF
	sbc $02FFFA.l,X		; FF FA FF 02
	tsb $00.b		; 04 00
	brk $DF.b		; 00 DF
	sbc $04FFE4.l,X		; FF E4 FF 04
	tsb $00.b		; 04 00
	brk $DF.b		; 00 DF
	sbc $06FFF4.l,X		; FF F4 FF 06
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $08FFE2.l,X		; FF E2 FF 08
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $0AFFF2.l,X		; FF F2 FF 0A
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $0CFFE2.l,X		; FF E2 FF 0C
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $0EFFF2.l,X		; FF F2 FF 0E
	tsb $00.b		; 04 00
	brk $0F.b		; 00 0F
	brk $E7.b		; 00 E7
	sbc $000420.l,X		; FF 20 04 00
	brk $0F.b		; 00 0F
	brk $F7.b		; 00 F7
	sbc $000422.l,X		; FF 22 04 00
	brk $1F.b		; 00 1F
	brk $EC.b		; 00 EC
	sbc $000424.l,X		; FF 24 04 00
	brk $1F.b		; 00 1F
	brk $FC.b		; 00 FC
	sbc $000426.l,X		; FF 26 04 00
	brk $2F.b		; 00 2F
	brk $EE.b		; 00 EE
	sbc $000428.l,X		; FF 28 04 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	sbc $5FBF5F.l,X		; FF 5F BF 5F
	lda $00D020.l,X		; BF 20 D0 00
	adc $3E423E.l,X		; 7F 3E 42 3E
	.db $42, $FF		; 42 FF
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $EF.b		; 00 EF
	brk $00.b		; 00 00
	adc $7F7C7F.l,X		; 7F 7F 7C 7F
	jmp ($4040.w,X)		; 7C 40 40
	sbc $FFFFBC.l,X		; FF BC FF FF
	inc $01FF.w,X		; FE FF 01
	ora $03.b,S		; 03 03
	sbc $000000.l,X		; FF 00 00 00
	brk $C3.b		; 00 C3
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($FC.b,X)		; 01 FC
	cop $00.b		; 02 00
	jsr ($00FF.w,X)		; FC FF 00
	sbc $030000.l,X		; FF 00 00 03
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
	ora ($FF.b,X)		; 01 FF
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
	ora ($01.b,X)		; 01 01
	and $40BF7F.l,X		; 3F 7F BF 40
	lda $000040.l,X		; BF 40 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	asl $0000.w,X		; 1E 00 00
	rti		; 40

	lda $40BF40.l,X		; BF 40 BF 40
	brk $00.b		; 00 00
	cop $03.b		; 02 03
	ora #$670F.w		; 09 0F 67
	adc $F0FC9C.l,X		; 7F 9C FC F0
	beq  -1.b		; F0 FF
	ora $0100FF.l		; 0F FF 00 01
	brk $0C.b		; 00 0C
	brk $30.b		; 00 30
	brk $83.b		; 00 83
	brk $0C.b		; 00 0C
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $46.b		; 00 46
	jmp $0DFAC5.l		; 5C C5 FA 0D
	clv		; B8
	stx $82F4.w		; 8E F4 82
	sed		; F8
	tsb $057B.w		; 0C 7B 05
	xce		; FB
	jsl $39863A.l		; 22 3A 86 39
	mvp $0D,$3B		; 44 3B 0D
	adc ($0F.b)		; 72 0F
	bvs -119.b		; 70 89
	ror $0D.b,X		; 76 0D
	sbc ($07.b)		; F2 07
	sed		; F8
	jsl $474C1D.l		; 22 1D 4C 47
	mvn $46,$AB		; 54 AB 46
	eor ($06.b,S),Y		; 53 06
	eor $AF04.w		; 4D 04 AF
	lsr $5B.b		; 46 5B
	ldy $BB.b,X		; B4 BB
	inx		; E8
	phd		; 0B
	jmp $E4B3.w		; 4C B3 E4
	tas		; 1B
	inc $09.b,X		; F6 09
	asl $B6E1.w,X		; 1E E1 B6
	eor #$09F6.w		; 49 F6 09
	ldy $0843.w,X		; BC 43 08
	sbc [$00.b],Y		; F7 00
	ora $21.b,S		; 03 21
	and $7E7F0F.l,X		; 3F 0F 7F 7E
	xce		; FB
	dec $C3.b		; C6 C3
	ora $01.b,S		; 03 01
	ora $01.b,S		; 03 01
	brk $00.b		; 00 00
	tsb $4000.w		; 0C 00 40
	brk $81.b		; 00 81
	brk $3D.b		; 00 3D
	brk $C5.b		; 00 C5
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	sbc $C0FFFF.l,X		; FF FF FF C0
	cpy #$0C00.w		; C0 00 0C
	cpy $DE.b		; C4 DE
	php		; 08
	jmp.w [$DE0E]		; DC 0E DE
	ldy $00FC.w		; AC FC 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	tsb $1E04.w		; 0C 04 1E
	tay		; A8
	trb $1EAE.w		; 1C AE 1E
	jmp $3A1C.w		; 4C 1C 3A
	rol $9F2F.w,X		; 3E 2F 9F
	and [$BF.b]		; 27 BF
	ora [$CF.b]		; 07 CF
	ora $F707CF.l		; 0F CF 07 F7
	ora [$E7.b]		; 07 E7
	tsb $E7.b		; 04 E7
	eor $80.b		; 45 80
	jsr $20C0.w		; 20 C0 20
	cpy #$E010.w		; C0 10 E0
	bpl -32.b		; 10 E0
	clc		; 18
	cpx #$F008.w		; E0 08 F0
	php		; 08
	beq -17.b		; F0 EF
	brk $77.b		; 00 77
	brk $77.b		; 00 77
	brk $BB.b		; 00 BB
	bra -69.b		; 80 BB
	bra  -4.b		; 80 FC
	cpy #$FF3F.w		; C0 3F FF
	bra -128.b		; 80 80
	sbc $08F710.l		; EF 10 F7 08
	sbc [$08.b],Y		; F7 08
	tda		; 7B
	tsb $7B.b		; 04 7B
	tsb $3C.b		; 04 3C
	ora $00.b,S		; 03 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	sbc $03FEFF.l,X		; FF FF FE 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -96.b		; 80 A0
	beq -48.b		; F0 D0
	sei		; 78
	inx		; E8
	ldy $5F74.w,X		; BC 74 5F
	tsa		; 3B
	and $0E371D.l		; 2F 1D 37 0E
	rtl		; 6B

	brk $00.b		; 00 00
	jsr $9000.w		; 20 00 90
	brk $C8.b		; 00 C8
	brk $64.b		; 00 64
	brk $33.b		; 00 33
	brk $19.b		; 00 19
	jsr $600C.w		; 20 0C 60
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	sbc $423E00.l,X		; FF 00 3E 42
	brk $00.b		; 00 00
	jmp ($0002.w,X)		; 7C 02 00
	brk $7C.b		; 00 7C
	cop $00.b		; 02 00
	rti		; 40

	brk $20.b		; 00 20
	php		; 08
	bpl 127.b		; 10 7F
	jmp ($007F.w,X)		; 7C 7F 00
	ora ($7C.b,X)		; 01 7C
	adc $7C0100.l,X		; 7F 00 01 7C
	adc $003F00.l,X		; 7F 00 3F 00
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $08FFFF.l,X		; FF FF FF 08
	asl $3720.w		; 0E 20 37
	eor ($6E.b,X)		; 41 6E
	cop $7F.b		; 02 7F
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($01.b)		; F2 01
	cpy #$800F.w		; C0 0F 80
	ora $001CA3.l,X		; 1F A3 1C 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $FFFC.w,X		; FD FC FF
	ora $71.b,S		; 03 71
	brk $FE.b		; 00 FE
	bpl  15.b		; 10 0F
	inx		; E8
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	ora [$10.b]		; 07 10
	ora $0E09.w,X		; 1D 09 0E
	tsb $07.b		; 04 07
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($0E.b),Y		; 11 0E
	php		; 08
	ora [$04.b]		; 07 04
	ora $01.b,S		; 03 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	ora [$12.b],Y		; 17 12
	asl $FC04.w		; 0E 04 FC
	bpl -16.b		; 10 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($0E.b),Y		; F1 0E
	cop $FC.b		; 02 FC
	tsb $F8.b		; 04 F8
	bpl -32.b		; 10 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $98FE.w,X		; FE FE 98
	ora $64E71B.l,X		; 1F 1B E7 64
	stz $FCFF.w		; 9C FF FC
	sbc ($70.b),Y		; F1 70
	sbc ($B0.b),Y		; F1 B0
	phx		; DA
	adc ($FF.b)		; 72 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $0B.b		; 00 0B
	tsb $03.b		; 04 03
	tsb $0489.w		; 0C 89 04
	ora $C00F5F.l,X		; 1F 5F 0F C0
	cmp [$D8.b]		; C7 D8
	ora $0FDF1F.l,X		; 1F 1F DF 0F
	cmp $00D900.l,X		; DF 00 D9 00
	sbc $20DF00.l		; EF 00 DF 20
	ora $200020.l,X		; 1F 20 00 20
	cpy #$DF20.w		; C0 20 DF
	jsr $2DD2.w		; 20 D2 2D
	cmp $10EF20.l,X		; DF 20 EF 10
	ora [$E7.b]		; 07 E7
	brk $E0.b		; 00 E0
	php		; 08
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FF807F.l,X		; FF 7F 80 FF
	bra  -1.b		; 80 FF
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
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
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
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
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
	bra -128.b		; 80 80
	cpy #$FCC0.w		; C0 C0 FC
	jmp ($87F7.w,X)		; 7C F7 87
	ora ($C7.b),Y		; 11 C7
	plp		; 28
	sbc [$F7.b],Y		; F7 F7
	sbc [$00.b],Y		; F7 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$7C0C.w		; C0 0C 7C
	ora $8F.b,S		; 03 8F
	rts		; 60

	brk $10.b		; 00 10
	brk $08.b		; 00 08
	sbc [$08.b],Y		; F7 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	inc $F901.w,X		; FE 01 F9
	inc $01F8.w,X		; FE F8 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $0D00.w,X		; FE 00 0D
	ora ($FD.b,X)		; 01 FD
	sbc $0404.w,X		; FD 04 04
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $02F0.w		; 0E F0 02
	brk $FB.b		; 00 FB
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
	sta $FE80.w,X		; 9D 80 FE
	lda $FE.b,S		; A3 FE
	adc ($7E.b,X)		; 61 7E
	rts		; 60

	ror $C704.w,X		; 7E 04 C7
	cop $03.b		; 02 03
	ora ($01.b,X)		; 01 01
	and $1C.b,S		; 23 1C
	jsl $1C231D.l		; 22 1D 23 1C
	lda ($1E.b,X)		; A1 1E
	ldy #$C41F.w		; A0 1F C4
	and $02.b,S		; 23 02
	ora ($01.b,X)		; 01 01
	brk $FF.b		; 00 FF
	sbc $000FF3.l,X		; FF F3 0F 00
	sbc $00FFFF.l,X		; FF FF FF 00
	cpy $00.b		; C4 00
	inc $8344.w,X		; FE 44 83
	tsx		; BA
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $47.b		; 00 47
	sec		; 38
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	inc $8001.w,X		; FE 01 80
	bra  -2.b		; 80 FE
	inc $837F.w,X		; FE 7F 83
	sta $FC.b,S		; 83 FC
	and [$27.b]		; 27 27
	bpl -112.b		; 10 90
	php		; 08
	dey		; 88
	bit $E4.b		; 24 E4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cld		; D8
	brk $EF.b		; 00 EF
	brk $37.b		; 00 37
	cpy #$C03B.w		; C0 3B C0
	sec		; 38
	eor $44.b		; 45 44
	sta $01.b,S		; 83 01
	sbc $007C44.l,X		; FF 44 7C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	sta $00.b,S		; 83 00
	sbc $44FE01.l,X		; FF 01 FE 44
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	cpy #$8080.w		; C0 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq -80.b		; F0 B0
	sei		; 78
	inc $C0.b,X		; F6 C0
	ora $0512.w,Y		; 19 12 05
	php		; 08
	asl A		; 0A
	tsb $0500.w		; 0C 00 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $E4.b		; 00 E4
	brk $F2.b		; 00 F2
	brk $F1.b		; 00 F1
	brk $FA.b		; 00 FA
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  -9.b		; 80 F7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F6.b		; 00 F6
	brk $F6.b		; 00 F6
	brk $F7.b		; 00 F7
	php		; 08
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc [$07.b],Y		; F7 07
	cmp $3ABC1E.l,X		; DF 1E BC 3A
	sed		; F8
	adc ($78.b,S),Y		; 73 78
	adc $E1FFE1.l		; 6F E1 FF E1
	dec $FED3.w,X		; DE D3 FE
	sed		; F8
	brk $E0.b		; 00 E0
	brk $C2.b		; 00 C2
	ora ($80.b,X)		; 01 80
	ora [$88.b]		; 07 88
	ora [$01.b]		; 07 01
	asl $0E11.w		; 0E 11 0E
	ora ($0C.b,S),Y		; 13 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($11.b,S),Y		; 93 11
	eor $AA.b,X		; 55 AA
	eor ($14.b),Y		; 51 14
	sta ($13.b,X)		; 81 13
	sta ($2B.b,X)		; 81 2B
	ora ($D6.b),Y		; 11 D6
	adc $BAEE.w		; 6D EE BA
	.db $82, $93, $6C		; 82 93 6C
	and $7DC6.w,Y		; 39 C6 7D
	.db $82, $C7, $38		; 82 C7 38
	adc $7D92.w		; 6D 92 7D
	.db $82, $EF, $10		; 82 EF 10
	.db $82, $7D, $14		; 82 7D 14
	pea $E400.w		; F4 00 E4
	bra -32.b		; 80 E0
	dey		; 88
	sei		; 78
	brk $F8.b		; 00 F8
	dey		; 88
	sed		; F8
	php		; 08
	sed		; F8
	php		; 08
	sed		; F8
	tas		; 1B
	cpx #$F30C.w		; E0 0C F3
	sta $738C70.l		; 8F 70 8C 73
	sta $738C70.l		; 8F 70 8C 73
	ora $F00FF0.l		; 0F F0 0F F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	clc		; 18
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	ora $3C.b,S		; 03 3C
	cpy #$00FF.w		; C0 FF 00
	and $00FFC0.l,X		; 3F C0 FF 00
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	bra  68.b		; 80 44
	brk $C6.b		; 00 C6
	.db $42, $DD		; 42 DD
	sbc $E7FFC6.l,X		; FF C6 FF E7
	sbc $000400.l,X		; FF 00 04 00
	brk $C6.b		; 00 C6
	sbc $02FFF7.l,X		; FF F7 FF 02
	tsb $00.b		; 04 00
	brk $D6.b		; 00 D6
	sbc $04FFE2.l,X		; FF E2 FF 04
	tsb $00.b		; 04 00
	brk $D6.b		; 00 D6
	sbc $06FFF2.l,X		; FF F2 FF 06
	tsb $00.b		; 04 00
	brk $E6.b		; 00 E6
	sbc $08FFDD.l,X		; FF DD FF 08
	tsb $00.b		; 04 00
	brk $E6.b		; 00 E6
	sbc $0AFFED.l,X		; FF ED FF 0A
	tsb $00.b		; 04 00
	brk $E6.b		; 00 E6
	sbc $0CFFFD.l,X		; FF FD FF 0C
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $0EFFDD.l,X		; FF DD FF 0E
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $20FFED.l,X		; FF ED FF 20
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $DD.b		; 00 DD
	sbc $000422.l,X		; FF 22 04 00
	brk $06.b		; 00 06
	brk $ED.b		; 00 ED
	sbc $000424.l,X		; FF 24 04 00
	brk $16.b		; 00 16
	brk $E5.b		; 00 E5
	sbc $000426.l,X		; FF 26 04 00
	brk $16.b		; 00 16
	brk $F5.b		; 00 F5
	sbc $000428.l,X		; FF 28 04 00
	brk $26.b		; 00 26
	brk $E9.b		; 00 E9
	sbc $00042A.l,X		; FF 2A 04 00
	brk $26.b		; 00 26
	brk $F9.b		; 00 F9
	sbc $00042C.l,X		; FF 2C 04 00
	brk $36.b		; 00 36
	brk $EA.b		; 00 EA
	sbc $00042E.l,X		; FF 2E 04 00
	brk $36.b		; 00 36
	brk $FA.b		; 00 FA
	sbc $000440.l,X		; FF 40 04 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	lda $4FBF5F.l,X		; BF 5F BF 4F
	lda $00C830.l,X		; BF 30 C8 00
	adc $3F413F.l,X		; 7F 3F 41 3F
	eor ($FF.b,X)		; 41 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F7.b		; 00 F7
	brk $00.b		; 00 00
	adc $7F7E7F.l,X		; 7F 7F 7E 7F
	ror $3010.w,X		; 7E 10 30
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	bpl  32.b		; 10 20
	tsb $18.b		; 04 18
	ora $04.b,S		; 03 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $001F00.l,X		; 3F 00 1F 00
	ora [$00.b]		; 07 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	ora $003F0F.l		; 0F 0F 3F 00
	cpy #$D0F0.w		; C0 F0 D0
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	brk $08.b		; 00 08
	brk $30.b		; 00 30
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	bmi   0.b		; 30 00
	jsr $0101.w		; 20 01 01
	asl $07.b		; 06 07
	tsa		; 3B
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $180002.l,X		; FF 02 00 18
	brk $C1.b		; 00 C1
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($20.b,S),Y		; 13 20
	and $003710.l,X		; 3F 10 37 00
	and [$00.b]		; 27 00
	and $005F50.l,X		; 3F 50 5F 00
	adc $E82FE0.l		; 6F E0 2F E8
	ora [$C8.b]		; 07 C8
	ora [$C0.b]		; 07 C0
	ora $D00FD0.l		; 0F D0 0F D0
	ora $A00FB0.l		; 0F B0 0F A0
	ora $761FE0.l,X		; 1F E0 1F 76
	sta [$20.b],Y		; 97 20
	sbc $521048.l		; EF 48 10 52
	sbc $D5.b		; E5 D5
	.db $62, $50, $E5		; 62 50 E5
	iny		; C8
	bcs  71.b		; B0 47
	ora $C837.w,X		; 1D 37 C8
	adc [$98.b]		; 67 98
	eor $02FDB0.l		; 4F B0 FD 02
	sed		; F8
	ora [$CD.b]		; 07 CD
	and ($CF.b)		; 32 CF
	bmi  95.b		; 30 5F
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora #$270F.w		; 09 0F 27
	and $78FE9E.l,X		; 3F 9E FE 78
	sed		; F8
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $30.b		; 00 30
	brk $C1.b		; 00 C1
	brk $0E.b		; 00 0E
	brk $38.b		; 00 38
	brk $E0.b		; 00 E0
	brk $07.b		; 00 07
	ora [$20.b]		; 07 20
	and $FCFF3F.l,X		; 3F 3F FF FC
	inc $C6C4.w,X		; FE C4 C6
	cop $03.b		; 02 03
	asl $03.b		; 06 03
	asl $03.b		; 06 03
	sec		; 38
	brk $C0.b		; 00 C0
	brk $03.b		; 00 03
	brk $3A.b		; 00 3A
	brk $C2.b		; 00 C2
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $0D.b		; 00 0D
	dec $F104.w		; CE 04 F1
	ora $F9.b,S		; 03 F9
	bra 124.b		; 80 7C
	ldy #$705E.w		; A0 5E 70
	lsr $BF20.w		; 4E 20 BF
	bcc 103.b		; 90 67
	beq   0.b		; F0 00
	asl $F8.b		; 06 F8
	cop $FC.b		; 02 FC
	ora ($FE.b,X)		; 01 FE
	cpy #$603F.w		; C0 3F 60
	sta $90CF30.l,X		; 9F 30 CF 90
	adc $C5E0C3.l		; 6F C3 E0 C5
	mvp $86,$66		; 44 66 86
	inc $AE.b		; E6 AE
	sbc $BF9F5F.l,X		; FF 5F 9F BF
	adc $7F6F2F.l,X		; 7F 2F 6F 7F
	and [$18.b]		; 27 18
	ora $38.b,S		; 03 38
	and ($18.b,X)		; 21 18
	ora #$8010.w		; 09 10 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	bra   8.b		; 80 08
	sed		; F8
	bpl -16.b		; 10 F0
	rti		; 40

	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	beq  16.b		; F0 10
	cpx #$8040.w		; E0 40 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	jmp $4CDC.w		; 4C DC 4C
	jmp.w [$DE5E]		; DC 5E DE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $1C.b		; 00 1C
	bit $2C14.w		; 2C 14 2C
	trb $1E3E.w		; 1C 3E 1E
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
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
	and $413F41.l,X		; 3F 41 3F 41
	ror $0001.w,X		; 7E 01 00
	rti		; 40

	ror $0001.w,X		; 7E 01 00
	rti		; 40

	jmp ($0002.w,X)		; 7C 02 00
	rti		; 40

	adc $7E7F7E.l,X		; 7F 7E 7F 7E
	brk $7E.b		; 00 7E
	adc $7E0000.l,X		; 7F 00 00 7E
	adc $7C0100.l,X		; 7F 00 01 7C
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
	brk $00.b		; 00 00
	bcc  -1.b		; 90 FF
	rti		; 40

	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $040302.l,X		; FF 02 03 04
	asl $08.b		; 06 08
	ora $001F10.l		; 0F 10 1F 00
	rts		; 60

	brk $80.b		; 00 80
	brk $80.b		; 00 80
	sbc $00FC00.l,X		; FF 00 FC 00
	sed		; F8
	ora ($F2.b,X)		; 01 F2
	ora ($E4.b,X)		; 01 E4
	ora $00.b,S		; 03 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FFC7.l,X		; FF C7 FF 00
	lda $08FF00.l,X		; BF 00 FF 08
	sbc [$2F.b],Y		; F7 2F
	cmp [$00.b],Y		; D7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	brk $80.b		; 00 80
	adc $07FF00.l,X		; 7F 00 FF 07
	sed		; F8
	ora $0302E0.l,X		; 1F E0 02 03
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $01.b		; 02 01
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	phx		; DA
	dec A		; 3A
	inx		; E8
	ora $FF80E0.l		; 0F E0 80 FF
	rti		; 40

	adc $001F10.l,X		; 7F 10 1F 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	cmp [$38.b]		; C7 38
	cmp [$0F.b]		; C7 0F
	beq -128.b		; F0 80
	adc $103F40.l,X		; 7F 40 3F 10
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$7FFF.w		; E0 FF 7F
	rol $003F.w,X		; 3E 3F 00
	sbc $0FFE01.l,X		; FF 01 FE 0F
	sbc $00FDF3.l,X		; FF F3 FD 00
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora ($FC.b,X)		; 01 FC
	jsr ($E718.w,X)		; FC 18 E7
	adc [$8F.b],Y		; 77 8F
	cld		; D8
	sec		; 38
	sbc $D0C3F8.l,X		; FF F8 C3 D0
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	and [$08.b],Y		; 37 08
	bvc  63.b		; 50 3F
	cli		; 58
	and [$10.b],Y		; 37 10
	and $306F98.l,X		; 3F 98 6F 30
	sbc [$E0.b]		; E7 E0
	cmp $84BCE0.l,X		; DF E0 BC 84
	bit $07F8.w,X		; 3C F8 07
	sed		; F8
	ora [$98.b]		; 07 98
	adc [$98.b]		; 67 98
	adc [$F0.b]		; 67 F0
	ora $E01FE0.l		; 0F E0 1F E0
	trb $7884.w		; 1C 84 78
	ora $9F0F9F.l		; 0F 9F 0F 9F
	ora $DF0CDF.l		; 0F DF 0C DF
	ora ($DE.b)		; 12 DE
	bpl -48.b		; 10 D0
	brk $20.b		; 00 20
	jsr $203F.w		; 20 3F 20
	cpy #$C020.w		; C0 20 C0
	jsr $20C0.w		; 20 C0 20
	cpy #$C021.w		; C0 21 C0
	and $003FC0.l		; 2F C0 3F 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $FC.b		; 24 FC
	jsr $1FFC.w		; 20 FC 1F
	ora $878738.l,X		; 1F 38 87 87
	clv		; B8
	and $1FAF3F.l,X		; 3F 3F AF 1F
	lda $148C11.l,X		; BF 11 8C 14
	bra  28.b		; 80 1C
	cmp $400020.l,X		; DF 20 00 40
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	lda $4CB240.l,X		; BF 40 B2 4C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF80.l,X		; FF 80 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $807F00.l,X		; FF 00 7F 80
	bne   7.b		; D0 07
	cmp $00DF00.l,X		; DF 00 DF 00
	sbc $00EF00.l		; EF 00 EF 00
	sbc $007700.l		; EF 00 77 00
	adc [$00.b],Y		; 77 00
	cmp $20DF20.l,X		; DF 20 DF 20
	cmp $10EF20.l,X		; DF 20 EF 10
	sbc $10EF10.l		; EF 10 EF 10
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $F8.b		; 00 F8
	iny		; C8
	inc $DDC4.w,X		; FE C4 DD
	jsl $17112E.l		; 22 2E 11 17
	php		; 08
	phd		; 0B
	tsb $05.b		; 04 05
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	php		; 08
	brk $E4.b		; 00 E4
	brk $32.b		; 00 32
	brk $19.b		; 00 19
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	bra -80.b		; 80 B0
	rti		; 40

	iny		; C8
	jsr $00E6.w		; 20 E6 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
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
	brk $00.b		; 00 00
	cpx #$F040.w		; E0 40 F0
	rti		; 40

	clc		; 18
	brk $E0.b		; 00 E0
	and $7F7FC0.l,X		; 3F C0 7F 7F
	adc $007F00.l,X		; 7F 00 7F 00
	brk $E0.b		; 00 E0
	rti		; 40

	bmi -64.b		; 30 C0
	sec		; 38
	ora $000000.l,X		; 1F 00 00 00
	brk $80.b		; 00 80
	adc $807F80.l,X		; 7F 80 7F 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E303.w,X		; FD 03 E3
	jsr ($07E4.w,X)		; FC E4 07
	cmp $00001F.l,X		; DF 1F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $E0.b		; 00 E0
	brk $67.b		; 00 67
	asl $EE.b		; 06 EE
	ora $14EFEE.l		; 0F EE EF 14
	ora [$09.b],Y		; 17 09
	phd		; 0B
	ora $05.b		; 05 05
	cop $02.b		; 02 02
	brk $FF.b		; 00 FF
	sei		; 78
	bra -16.b		; 80 F0
	brk $10.b		; 00 10
	brk $E8.b		; 00 E8
	brk $F4.b		; 00 F4
	brk $FA.b		; 00 FA
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $05.b		; 00 05
	ldx $F68D.w,Y		; BE 8D F6
	ora $7E.b		; 05 7E
	tsb $04FB.w		; 0C FB 04
	sbc ($03.b),Y		; F1 03
	sbc $FE03.w,X		; FD 03 FE
	bpl  30.b		; 10 1E
	sta $708F70.l		; 8F 70 8F 70
	tsb $0CF3.w		; 0C F3 0C
	sbc ($05.b,S),Y		; F3 05
	plx		; FA
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	bpl  15.b		; 10 0F
	sbc $0FF3FF.l,X		; FF FF F3 0F
	ora $FFFFF0.l		; 0F F0 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	dey		; 88
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	sbc $70FF00.l,X		; FF 00 FF 70
	sta $FF8080.l		; 8F 80 80 FF
	sbc $FE01FF.l,X		; FF FF 01 FE
	sbc $30E0E0.l,X		; FF E0 E0 30
	bmi   8.b		; 30 08
	cld		; D8
	tsb $EC.b		; 04 EC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $C02F00.l,X		; 1F 00 2F C0
	ora [$E0.b],Y		; 17 E0
	phd		; 0B
	beq 115.b		; F0 73
	dec $AD8E.w,X		; DE 8E AD
	ldx $F88B.w		; AE 8B F8
	ora $00.b,S		; 03 00
	sbc $80FE02.l,X		; FF 02 FE 80
	beq   0.b		; F0 00
	brk $FF.b		; 00 FF
	brk $8E.b		; 00 8E
	adc ($8E.b),Y		; 71 8E
	adc ($F8.b),Y		; 71 F8
	ora [$00.b]		; 07 00
	sbc $80FC02.l,X		; FF 02 FC 80
	sei		; 78
	brk $00.b		; 00 00
	ora ($7E.b,X)		; 01 7E
	ora ($FE.b,X)		; 01 FE
	ora ($C2.b,X)		; 01 C2
	rti		; 40

	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora $E0.b,S		; 03 E0
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  -8.b		; 80 F8
	sed		; F8
	jsr ($3D1C.w,X)		; FC 1C 3D
	bit $0E.b		; 24 0E
	tsb $0607.w		; 0C 07 06
	ora $02.b,S		; 03 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	rep #$00		; C2 00
	sbc ($00.b),Y		; F1 00
	sed		; F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	bra  32.b		; 80 20
	rti		; 40

	bcs   0.b		; B0 00
	bvc -128.b		; 50 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $30.b		; 00 30
	brk $BB.b		; 00 BB
	bra -68.b		; 80 BC
	bra 127.b		; 80 7F
	sbc $008080.l,X		; FF 80 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7C047B.l,X		; FF 7B 04 7C
	ora $00.b,S		; 03 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	ora $00.b		; 05 00
	tsb $FFFF.w		; 0C FF FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($04.b,X)		; 01 04
	brk $0C.b		; 00 0C
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bpl 113.b		; 10 71
	sta $8F81BF.l		; 8F BF 81 8F
	brk $FD.b		; 00 FD
	jsr ($FF02.w,X)		; FC 02 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $90.b		; 00 90
	brk $CF.b		; 00 CF
	brk $80.b		; 00 80
	bvs   0.b		; 70 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7E.b		; 00 7E
	brk $7C.b		; 00 7C
	brk $79.b		; 00 79
	ora ($7B.b,X)		; 01 7B
	ora $7F.b,S		; 03 7F
	ora [$77.b]		; 07 77
	ora [$67.b]		; 07 67
	ora [$7F.b]		; 07 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra 126.b		; 80 7E
	bra 124.b		; 80 7C
	bra 120.b		; 80 78
	bra 120.b		; 80 78
	bra 120.b		; 80 78
	bra  60.b		; 80 3C
	tsa		; 3B
	beq -21.b		; F0 EB
	cpx #$C0DB.w		; E0 DB C0
	lda [$82.b],Y		; B7 82
	cmp $7987.w,X		; DD 87 79
	jsl $7144BE.l		; 22 BE 44 71
	cpy #$0400.w		; C0 00 04
	ora $08.b,S		; 03 08
	ora [$10.b]		; 07 10
	ora $231E21.l		; 0F 21 1E 23
	trb $1966.w		; 1C 66 19
	cpy $3B.b		; C4 3B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $07.b		; 04 07
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $03.b		; 04 03
	cop $01.b		; 02 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plx		; FA
	adc $67.b,X		; 75 67
	stz $02.b,X		; 74 02
	xce		; FB
	bit #$2506.w		; 89 06 25
	eor ($55.b,S),Y		; 53 55
	and $01.b,S		; 23 01
	eor ($89.b,S),Y		; 53 89
	asl $FC.b		; 06 FC
	ora $76.b,S		; 03 76
	bit #$8C73.w		; 89 73 8C
	sbc $DF06.w,Y		; F9 06 DF
	jsr $708F.w		; 20 8F 70
	cmp $F926.w,Y		; D9 26 F9
	asl $06.b		; 06 06
	inc $02.b,X		; F6 02
	plx		; FA
	brk $F8.b		; 00 F8
	ora ($7B.b,X)		; 01 7B
	ora ($FF.b,X)		; 01 FF
	sta ($7E.b,X)		; 81 7E
	ora ($FE.b,X)		; 01 FE
	sta ($FE.b,X)		; 81 FE
	ora $F8.b		; 05 F8
	ora ($FC.b,X)		; 01 FC
	brk $FF.b		; 00 FF
	cop $FC.b		; 02 FC
	.db $82, $7C, $83		; 82 7C 83
	jmp ($7C83.w,X)		; 7C 83 7C
	sta $7C.b,S		; 83 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	asl $04.b		; 06 04
	cop $02.b		; 02 02
	asl $04.b		; 06 04
	cop $02.b		; 02 02
	inc $0000.w,X		; FE 00 00
	sbc $8300FF.l,X		; FF FF 00 83
	sei		; 78
	sbc $8100.w,Y		; F9 00 81
	jmp ($00F9.w,X)		; 7C F9 00
	sta ($7C.b,X)		; 81 7C
	brk $B0.b		; 00 B0
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	php		; 08
	cpx #$6018.w		; E0 18 60
	clc		; 18
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	php		; 08
	pha		; 48
	brk $00.b		; 00 00
	sed		; F8
	sei		; 78
	bvs 120.b		; 70 78
	rts		; 60

	tya		; 98
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $07.b		; 00 07
	brk $F0.b		; 00 F0
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00F800.l,X		; FF 00 F8 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $16.b		; 00 16
	bra  88.b		; 80 58
	brk $BD.b		; 00 BD
	jmp $FFD7.w		; 4C D7 FF
	ldx $F0FF.w,Y		; BE FF F0
	sbc $000400.l,X		; FF 00 04 00
	brk $CE.b		; 00 CE
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $DE.b		; 00 DE
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $EE.b		; 00 EE
	sbc $06FFF0.l,X		; FF F0 FF 06
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $08FFF0.l,X		; FF F0 FF 08
	tsb $00.b		; 04 00
	brk $0E.b		; 00 0E
	brk $F0.b		; 00 F0
	sbc $00040A.l,X		; FF 0A 04 00
	brk $1E.b		; 00 1E
	brk $F0.b		; 00 F0
	sbc $00040C.l,X		; FF 0C 04 00
	brk $2E.b		; 00 2E
	brk $F0.b		; 00 F0
	sbc $00040E.l,X		; FF 0E 04 00
	brk $3E.b		; 00 3E
	brk $F0.b		; 00 F0
	sbc $000420.l,X		; FF 20 04 00
	brk $BD.b		; 00 BD
	sbc $22FFE0.l,X		; FF E0 FF 22
	tsb $00.b		; 04 00
	brk $CD.b		; 00 CD
	sbc $24FFE0.l,X		; FF E0 FF 24
	tsb $00.b		; 04 00
	brk $DD.b		; 00 DD
	sbc $26FFE0.l,X		; FF E0 FF 26
	tsb $00.b		; 04 00
	brk $ED.b		; 00 ED
	sbc $28FFE0.l,X		; FF E0 FF 28
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $2AFFE0.l,X		; FF E0 FF 2A
	tsb $00.b		; 04 00
	brk $0D.b		; 00 0D
	brk $E0.b		; 00 E0
	sbc $00042C.l,X		; FF 2C 04 00
	brk $1D.b		; 00 1D
	brk $E0.b		; 00 E0
	sbc $00042E.l,X		; FF 2E 04 00
	brk $2D.b		; 00 2D
	brk $E0.b		; 00 E0
	sbc $000440.l,X		; FF 40 04 00
	brk $3D.b		; 00 3D
	brk $E0.b		; 00 E0
	sbc $000442.l,X		; FF 42 04 00
	brk $D7.b		; 00 D7
	sbc $44FFD0.l,X		; FF D0 FF 44
	tsb $00.b		; 04 00
	brk $E7.b		; 00 E7
	sbc $46FFD0.l,X		; FF D0 FF 46
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $48FFD0.l,X		; FF D0 FF 48
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $D0.b		; 00 D0
	sbc $00044A.l,X		; FF 4A 04 00
	brk $FE.b		; 00 FE
	ora ($00.b,X)		; 01 00
	bra  -2.b		; 80 FE
	ora ($00.b,X)		; 01 00
	bra  -2.b		; 80 FE
	ora ($40.b,X)		; 01 40
	bra  32.b		; 80 20
	rti		; 40

	tsb $0030.w		; 0C 30 00
	inc $00FF.w,X		; FE FF 00
	brk $FE.b		; 00 FE
	sbc $FE0000.l,X		; FF 00 00 FE
	sbc $007F00.l,X		; FF 00 7F 00
	and $000000.l,X		; 3F 00 00 00
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
	cop $02.b		; 02 02
	brk $07.b		; 00 07
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	tsb $000F.w		; 0C 0F 00
	ora $001F1C.l		; 0F 1C 1F 00
	tas		; 1B
	jsr ($FA01.w,X)		; FC 01 FA
	ora ($F8.b,X)		; 01 F8
	ora $F8.b,S		; 03 F8
	ora $F0.b,S		; 03 F0
	ora $F4.b,S		; 03 F4
	ora $E4.b,S		; 03 E4
	ora $E8.b,S		; 03 E8
	ora [$04.b]		; 07 04
	xce		; FB
	php		; 08
	sbc $0AF319.l,X		; FF 19 F3 0A
	inc $EC1A.w,X		; FE 1A EC
	clc		; 18
	cpx $FC0B.w		; EC 0B FC
	clc		; 18
	sbc ($04.b,S),Y		; F3 04
	xce		; FB
	php		; 08
	sbc [$19.b],Y		; F7 19
	inc $1F.b		; E6 1F
	cpx #$E01F.w		; E0 1F E0
	ora $19E6.w,Y		; 19 E6 19
	inc $18.b		; E6 18
	sbc [$73.b]		; E7 73
	ror $01.b,X		; 76 01
	sbc $23068C.l,X		; FF 8C 06 23
	eor ($D8.b,S),Y		; 53 D8
	and $88.b,S		; 23 88
	and ($06.b,X)		; 21 06
	eor ($00.b),Y		; 51 00
	stx $8C73.w		; 8E 73 8C
	adc ($8E.b),Y		; 71 8E
	jsr ($DF03.w,X)		; FC 03 DF
	jsr $708F.w		; 20 8F 70
	sty $DC73.w		; 8C 73 DC
	and $F8.b,S		; 23 F8
	ora [$04.b]		; 07 04
	sbc $83.b,X		; F5 83
	sbc $7AC2.w,Y		; F9 C2 7A
	sta ($FC.b,X)		; 81 FC
	cpy #$C1BD.w		; C0 BD C1
	lda $FE80.w,X		; BD 80 FE
	cpy #$067E.w		; C0 7E 06
	sed		; F8
	.db $82, $7C, $C3		; 82 7C C3
	bit $3EC1.w,X		; 3C C1 3E
	cmp ($3E.b,X)		; C1 3E
	cmp ($3E.b,X)		; C1 3E
	cpy #$C03F.w		; C0 3F C0
	and $7EFC7D.l,X		; 3F 7D FC 7E
	inc $FE3E.w,X		; FE 3E FE
	lda $7F3FFF.l,X		; BF FF 3F 7F
	and $7F3C7F.l,X		; 3F 7F 3C 7F
	jsl $00037E.l		; 22 7E 03 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	sta ($00.b,X)		; 81 00
	cmp $00EF00.l,X		; DF 00 EF 00
	sbc [$00.b],Y		; F7 00
	tda		; 7B
	brk $7C.b		; 00 7C
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	sbc $DF0000.l,X		; FF 00 00 DF
	jsr $10EF.w		; 20 EF 10
	sbc [$08.b],Y		; F7 08
	xce		; FB
	tsb $FC.b		; 04 FC
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $0E.b		; 00 0E
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	jsr ($0606.w,X)		; FC 06 06
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	ora $00FFF0.l		; 0F F0 FF 00
	ora $00.b,S		; 03 00
	sbc $B800.w,Y		; F9 00 B8
	and $707E70.l,X		; 3F 70 7E 70
	adc $E07D60.l,X		; 7F 60 7D E0
	sbc $E0FFE4.l,X		; FF E4 FF E0
	xce		; FB
	rts		; 60

	adc $8200C1.l,X		; 7F C1 00 82
	ora ($82.b,X)		; 01 82
	ora ($84.b,X)		; 01 84
	ora $04.b,S		; 03 04
	ora $04.b,S		; 03 04
	ora $08.b,S		; 03 08
	ora [$88.b]		; 07 88
	ora [$08.b]		; 07 08
	inc $10.b,X		; F6 10
	sbc $14E633.l,X		; FF 33 E6 14
	jsr ($D835.w,X)		; FC 35 D8
	and ($D8.b),Y		; 31 D8
	asl $F8.b,X		; 16 F8
	bmi -25.b		; 30 E7
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $3FCC33.l		; EF 33 CC 3F
	cpy #$C03F.w		; C0 3F C0
	and ($CC.b,S),Y		; 33 CC
	and ($CC.b,S),Y		; 33 CC
	and ($CE.b),Y		; 31 CE
	inc $ED.b		; E6 ED
	ora $FF.b,S		; 03 FF
	ora $470C.w,Y		; 19 0C 47
	lda [$B1.b]		; A7 B1
	eor [$11.b]		; 47 11
	eor $0D.b,S		; 43 0D
	lda $01.b,S		; A3 01
	trb $19E6.w		; 1C E6 19
	sbc $1C.b,S		; E3 1C
	sbc $BF06.w,Y		; F9 06 BF
	rti		; 40

	ora $E619E0.l,X		; 1F E0 19 E6
	lda $F146.w,Y		; B9 46 F1
	asl $FB01.w		; 0E 01 FB
	brk $FC.b		; 00 FC
	sta $FF.b,S		; 83 FF
	ora ($FD.b,X)		; 01 FD
	sta ($7D.b,X)		; 81 7D
	sta ($7D.b,X)		; 81 7D
	ora ($FD.b,X)		; 01 FD
	sta ($FD.b,X)		; 81 FD
	cop $FC.b		; 02 FC
	brk $FF.b		; 00 FF
	.db $82, $7C, $80		; 82 7C 80
	ror $7E80.w,X		; 7E 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	bra 126.b		; 80 7E
	ora $0C.b,S		; 03 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sed		; F8
	phd		; 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	sbc [$83.b]		; E7 83
	sbc $7C05.w,Y		; F9 05 7C
	eor ($7D.b,X)		; 41 7D
	ora ($1E.b,X)		; 01 1E
	bpl  31.b		; 10 1F
	php		; 08
	ora $0F0302.l		; 0F 02 03 0F
	beq -121.b		; F0 87
	sei		; 78
	ora [$78.b]		; 07 78
	eor ($3E.b,X)		; 41 3E
	brk $3F.b		; 00 3F
	bpl  15.b		; 10 0F
	php		; 08
	ora [$02.b]		; 07 02
	ora ($23.b,X)		; 01 23
	cmp $8D7406.l,X		; DF 06 74 8D
	bit #$0574.w		; 89 74 05
	sty $0003.w		; 8C 03 00
	sbc $02FF00.l,X		; FF 00 FF 02
	inc $00FF.w,X		; FE FF 00
	ora [$F8.b]		; 07 F8
	sta $03FC70.l		; 8F 70 FC 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $FC.b		; 02 FC
	bra  62.b		; 80 3E
	bra  -2.b		; 80 FE
	brk $F0.b		; 00 F0
	bpl -16.b		; 10 F0
	brk $C0.b		; 00 C0
	rti		; 40

	cpy #$8080.w		; C0 80 80
	brk $00.b		; 00 00
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	brk $F0.b		; 00 F0
	bpl -32.b		; 10 E0
	brk $E0.b		; 00 E0
	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $4C.b		; 00 4C
	jmp ($0000.w,X)		; 7C 00 00
	brk $80.b		; 00 80
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $00.b,S		; 83 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	and $489F80.l,X		; 3F 80 9F 48
	eor $00F000.l		; 4F 00 F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C8.b		; 00 C8
	ora [$68.b]		; 07 68
	ora [$B8.b]		; 07 B8
	ora [$F0.b]		; 07 F0
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $06CF.w		; 1C CF 06
	sbc ($0B.b)		; F2 0B
	sbc $3A02.w,Y		; F9 02 3A
	ora $3C.b,S		; 03 3C
	brk $3F.b		; 00 3F
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	ora $F10EE0.l,X		; 1F E0 0E F1
	ora $7C03F0.l		; 0F F0 03 7C
	brk $3F.b		; 00 3F
	jsr $001F.w		; 20 1F 00
	ora $470300.l		; 0F 00 03 47
	ldx $E90D.w,Y		; BE 0D E9
	inc A		; 1A
	ora ($E8.b,S),Y		; 13 E8
	phd		; 0B
	clc		; 18
	ora [$00.b]		; 07 00
	sbc $00FC00.l,X		; FF 00 FC 00
	beq  -1.b		; F0 FF
	brk $0F.b		; 00 0F
	beq  30.b		; F0 1E
	sbc ($F8.b,X)		; E1 F8
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $F800.w,X		; FE 00 F8
	ora ($7D.b,X)		; 01 7D
	ora ($FD.b,X)		; 01 FD
	ora ($FC.b,X)		; 01 FC
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	ora ($FE.b,X)		; 01 FE
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	brk $02.b		; 00 02
	ora $02.b,S		; 03 02
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sbc $FF0000.l,X		; FF 00 00 FF
	sta $00.b,S		; 83 00
	sta ($7C.b,X)		; 81 7C
	jsr ($8000.w,X)		; FC 00 80
	ror $00FE.w,X		; 7E FE 00
	bra 126.b		; 80 7E
	rti		; 40

	jmp ($0000.w)		; 6C 00 00
	cop $3C.b		; 02 3C
	cop $38.b		; 02 38
	asl $18.b		; 06 18
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	sta ($00.b)		; 92 00
	brk $FE.b		; 00 FE
	dec $DE1C.w,X		; DE 1C DE
	clc		; 18
	inc $00.b		; E6 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	sbc $4FFF1F.l,X		; FF 1F FF 4F
	lda $00DF20.l,X		; BF 20 DF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	trb $FFFF.w		; 1C FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($06.b,X)		; 01 06
	ora ($F8.b,X)		; 01 F8
	inc $FFFA.w,X		; FE FA FF
	sbc ($FF.b)		; F2 FF
	ora [$FC.b]		; 07 FC
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $01.b		; 06 01
	rol $0101.w,X		; 3E 01 01
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	tsb $1800.w		; 0C 00 18
	and $FFFF3F.l,X		; 3F 3F FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00C000.l,X		; FF 00 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $F8FC.w,X		; BC FC F8
	sed		; F8
	sbc $03FFFF.l,X		; FF FF FF 03
	ora ($01.b,X)		; 01 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000C00.l,X		; FF 00 0C 00
	clc		; 18
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FFF8.l,X		; FF F8 FF 00
	sbc $F9F807.l,X		; FF 07 F8 F9
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora $02.b,S		; 03 02
	ora $06.b,S		; 03 06
	ora $F8.b,S		; 03 F8
	sed		; F8
	brk $FF.b		; 00 FF
	cmp $F0303F.l,X		; DF 3F 30 F0
	sbc $0004E0.l		; EF E0 04 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora $001F00.l		; 0F 00 1F 00
	lsr $06FE.w		; 4E FE 06
	inc $FE00.w,X		; FE 00 FE
	and $87383F.l,X		; 3F 3F 38 87
	sta [$B8.b]		; 87 B8
	and $009F3F.l,X		; 3F 3F 9F 00
	asl $0E3E.w		; 0E 3E 0E
	rol $00.b,X		; 36 00
	rol $00FF.w,X		; 3E FF 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	lda $000040.l,X		; BF 40 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $FF.b,S		; 03 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7A.b		; 00 7A
	ror $B73D.w		; 6E 3D B7
	stz $F91B.w,X		; 9E 1B F9
	sed		; F8
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	adc ($00.b)		; 72 00
	and $9C80.w,Y		; 39 80 9C
	brk $F9.b		; 00 F9
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	rts		; 60

	brk $1F.b		; 00 1F
	sty $85.b		; 84 85
	asl $00FA.w,X		; 1E FA 00
	ora $FB34C3.l		; 0F C3 34 FB
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	sty $01.b		; 84 01
	asl $01.b		; 06 01
	brk $F0.b		; 00 F0
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	xce		; FB
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$0000.w		; C0 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($0F.b,S),Y		; F3 0F
	cmp $7F7FF0.l		; CF F0 7F 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $02.b		; 00 02
	asl $03.b		; 06 03
	brk $F8.b		; 00 F8
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	cop $C0.b		; 02 C0
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F800.w,X		; FE 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	inx		; E8
	brk $7F.b		; 00 7F
	and $403F40.l,X		; 3F 40 3F 40
	and $403F40.l,X		; 3F 40 3F 40
	adc $00007F.l,X		; 7F 7F 00 00
	sbc [$00.b],Y		; F7 00
	brk $7F.b		; 00 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	brk $00.b		; 00 00
	adc $000000.l,X		; 7F 00 00 00
	brk $FF.b		; 00 FF
	sbc $8080FF.l,X		; FF FF 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $00FF00.l,X		; 7F 00 FF 00
	php		; 08
	and $FFFF1F.l,X		; 3F 1F FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($C0.b,X)		; 01 C0
	bmi   0.b		; 30 00
	cpx #$00FF.w		; E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	sbc $FCFFFF.l,X		; FF FF FF FC
	sbc $807B40.l,X		; FF 40 7B 80
	sbc $00DF00.l		; EF 00 DF 00
	lda $00FE01.l,X		; BF 01 FE 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	brk $88.b		; 00 88
	ora [$20.b]		; 07 20
	ora $803F40.l,X		; 1F 40 3F 80
	adc $007E81.l,X		; 7F 81 7E 00
	sbc $F8FFFF.l,X		; FF FF FF F8
	plx		; FA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	mvp $7C,$83		; 44 83 7C
	ora ($FF.b,X)		; 01 FF
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	xce		; FB
	tsb $00.b		; 04 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF837C.l,X		; FF 7C 83 FF
	brk $7F.b		; 00 7F
	lda $33FFCF.l,X		; BF CF FF 33
	and $148F29.l,X		; 3F 29 8F 14
	cmp [$0A.b]		; C7 0A
	sbc ($04.b,S),Y		; F3 04
	sbc ($03.b),Y		; F1 03
	sbc $0000.w,Y		; F9 00 00
	brk $00.b		; 00 00
	cpy #$3000.w		; C0 00 30
	cpy #$E018.w		; C0 18 E0
	tsb $06F0.w		; 0C F0 06
	sed		; F8
	cop $FC.b		; 02 FC
	sbc $B097E0.l		; EF E0 97 B0
	sta [$C0.b],Y		; 97 C0
	phb		; 8B
	dey		; 88
	cmp $CD9C.w		; CD 9C CD
	cpy $FE7F.w		; CC 7F FE
	ror $1FFE.w,X		; 7E FE 1F
	brk $6F.b		; 00 6F
	brk $5F.b		; 00 5F
	jsr $7007.w		; 20 07 70
	eor ($20.b,S),Y		; 53 20
	ora ($20.b,S),Y		; 13 20
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	lda $10BF1F.l		; AF 1F BF 10
	bcs   7.b		; B0 07
	lda $00DF00.l,X		; BF 00 DF 00
	cmp $00DF00.l,X		; DF 00 DF 00
	sbc $40BF00.l		; EF 00 BF 40
	lda ($4E.b),Y		; B1 4E
	lda $40BF40.l,X		; BF 40 BF 40
	cmp $20DF20.l,X		; DF 20 DF 20
	cmp $10EF20.l,X		; DF 20 EF 10
	lda $C0FFC0.l,X		; BF C0 FF C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	xce		; FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	brk $FB.b		; 00 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FF.b		; 04 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	ora ($FB.b,X)		; 01 FB
	ora $F7.b,S		; 03 F7
	ora [$EF.b]		; 07 EF
	ora $DC1FFE.l		; 0F FE 1F DC
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $90.b		; 00 90
	ora $F03F3F.l,X		; 1F 3F 3F F0
	inc $FDC0.w,X		; FE C0 FD
	bra  -9.b		; 80 F7
	brk $FF.b		; 00 FF
	brk $DE.b		; 00 DE
	ora $BC.b,S		; 03 BC
	cpx #$C000.w		; E0 00 C0
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	ora $10.b,S		; 03 10
	ora $401F20.l		; 0F 20 1F 40
	and $007C83.l,X		; 3F 83 7C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $9F1FE3.l,X		; FF E3 1F 9F
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
	bra -128.b		; 80 80
	sbc $3FCFFF.l,X		; FF FF CF 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$FEC0.w		; C0 C0 FE
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($007F.w,X)		; 7C 7F 00
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
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	dey		; 88
	ora [$F8.b]		; 07 F8
	ora $FE.b,S		; 03 FE
	sbc $0000.w,Y		; F9 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	ora [$FE.b]		; 07 FE
	ora ($3F.b,X)		; 01 3F
	cpy #$FFC0.w		; C0 C0 FF
	adc ($71.b),Y		; 71 71
	bit $06BC.w		; 2C BC 06
	inc $F703.w		; EE 03 F7
	ora ($FB.b,X)		; 01 FB
	ora $FB.b,S		; 03 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stx $3300.w		; 8E 00 33
	cpy #$F009.w		; C0 09 F0
	tsb $F8.b		; 04 F8
	cop $FC.b		; 02 FC
	cop $FC.b		; 02 FC
	adc $0FF7FF.l,X		; 7F FF F7 0F
	dec $0BF1.w		; CE F1 0B
	tsb $0101.w		; 0C 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rti		; 40

	bvs   0.b		; 70 00
	dey		; 88
	bvc -60.b		; 50 C4
	tay		; A8
	ldx #$D2D4.w		; A2 D4 D2
	inx		; E8
	lsr A		; 4A
	stz $00.b,X		; 74 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $24.b		; 00 24
	brk $12.b		; 00 12
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $82.b		; 00 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($0F.b,X)		; 01 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($06.b,X)		; 01 06
	ora [$3F.b]		; 07 3F
	and $7CFFDF.l,X		; 3F DF FF 7C
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	clc		; 18
	brk $C0.b		; 00 C0
	brk $07.b		; 00 07
	brk $1C.b		; 00 1C
	brk $03.b		; 00 03
	ora $08.b,S		; 03 08
	ora $9F3F03.l		; 0F 03 3F 9F
	sbc $F0FEFE.l,X		; FF FE FE F0
	beq -128.b		; F0 80
	bra   0.b		; 80 00
	brk $0C.b		; 00 0C
	brk $30.b		; 00 30
	brk $C0.b		; 00 C0
	brk $03.b		; 00 03
	brk $1E.b		; 00 1E
	brk $F0.b		; 00 F0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	sbc $FEFF7F.l,X		; FF 7F FF FE
	inc $B0A0.w,X		; FE A0 B0
	rts		; 60

	bmi  17.b		; 30 11
	ora $311F31.l,X		; 1F 31 1F 31
	ora $070000.l,X		; 1F 00 00 07
	brk $1E.b		; 00 1E
	brk $D0.b		; 00 D0
	brk $50.b		; 00 50
	brk $28.b		; 00 28
	brk $28.b		; 00 28
	brk $28.b		; 00 28
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sec		; 38
	jsr ($F830.w,X)		; FC 30 F8
	jmp ($00FC.w,X)		; 7C FC 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sec		; 38
	jmp.w [$F830]		; DC 30 F8
	jmp ($FFFC.w,X)		; 7C FC FF
	sbc $00FFFF.l,X		; FF FF FF 00
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
	brk $F0.b		; 00 F0
	jsr ($DFFC.w,X)		; FC FC DF
	plx		; FA
	inc $373D.w		; EE 3D 37
	asl $0F1B.w,X		; 1E 1B 0F
	ora $0607.w		; 0D 07 06
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	cpx $00.b		; E4 00
	sbc ($00.b)		; F2 00
	and $1C00.w,Y		; 39 00 1C
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	bra -80.b		; 80 B0
	rti		; 40

	iny		; C8
	ldy #$D0E4.w		; A0 E4 D0
	adc ($00.b)		; 72 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $90.b		; 00 90
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F3.b		; 00 F3
	asl $FFF7.w		; 0E F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	sed		; F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $01FFF7.l,X		; FF F7 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $FA.b		; 00 FA
	sbc $000403.l,X		; FF 03 04 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
	cmp $67.b,S		; C3 67
	sbc [$C8.b]		; E7 C8
	pld		; 2B
	ora ($17.b),Y		; 11 17
	eor ($0F.b,X)		; 41 0F
	ora $07.b,S		; 03 07
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	and $001800.l,X		; 3F 00 18 00
	pea $EBC3.w		; F4 C3 EB
	tsb $7B.b		; 04 7B
	tsb $03.b		; 04 03
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	brk $DF.b		; 00 DF
	cmp $BF1010.l,X		; DF 10 10 BF
	sta $3F607F.l,X		; 9F 7F 60 3F
	lda $00E000.l,X		; BF 00 E0 00
	lda $FF00FF.l,X		; BF FF 00 FF
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $BF.b		; 00 BF
	brk $5F.b		; 00 5F
	bra  95.b		; 80 5F
	bra  63.b		; 80 3F
	bra  64.b		; 80 40
	rti		; 40

	jsr $FF20.w		; 20 20 FF
	lda $D246E0.l,X		; BF E0 46 D2
	cmp $063F32.l,X		; DF 32 3F 06
	sbc $C00600.l,X		; FF 00 06 C0
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $F9.b		; 00 F9
	asl $E6.b		; 06 E6
	ora #$09C6.w		; 09 C6 09
	inc $09.b,X		; F6 09
	brk $06.b		; 00 06
	rti		; 40

	bra -32.b		; 80 E0
	cpy #$F0E0.w		; C0 E0 F0
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
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
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	sbc $FFF612.l		; EF 12 F6 FF
	sbc $FFF8FF.l		; EF FF F8 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sed		; F8
	sbc $000401.l,X		; FF 01 04 00
	brk $FF.b		; 00 FF
	sbc $02FFF8.l,X		; FF F8 FF 02
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	sbc $000403.l,X		; FF 03 04 00
	brk $0F.b		; 00 0F
	brk $F8.b		; 00 F8
	sbc $000404.l,X		; FF 04 04 00
	brk $F6.b		; 00 F6
	sbc $05FFF0.l,X		; FF F0 FF 05
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $06FFF0.l,X		; FF F0 FF 06
	tsb $00.b		; 04 00
	brk $C1.b		; 00 C1
	cmp ($63.b,X)		; C1 63
	sbc ($C4.b,S),Y		; F3 C4
	and $08.b		; 25 08
	wai		; CB
	ora #$410B.w		; 09 0B 41
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	ora ($3F.b,X)		; 01 3F
	brk $1C.b		; 00 1C
	brk $FA.b		; 00 FA
	cmp ($F4.b,X)		; C1 F4
	ora $F5.b,S		; 03 F5
	cop $7D.b		; 02 7D
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	ora ($C2.b,X)		; 01 C2
.ACCU 16
	rep #$EF		; C2 EF
	xba		; EB
	ora $EC8FDC.l,X		; 1F DC 8F EC
	eor $FC48EF.l		; 4F EF 48 FC
	bra -17.b		; 80 EF
	brk $C0.b		; 00 C0
	cpy $00.b		; C4 00
	trb $2F00.w		; 1C 00 2F
	cpy #$6097.w		; C0 97 60
	cmp ($20.b,S),Y		; D3 20
	cmp ($20.b,S),Y		; D3 20
	sta $C00060.l		; 8F 60 00 C0
	ora $05.b		; 05 05
	sbc $02FFFD.l,X		; FF FD FF 02
	inc $FE02.w,X		; FE 02 FE
	inc $0101.w,X		; FE 01 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	cop $00.b		; 02 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	inc $41FF.w,X		; FE FF 41
	adc $FC90.w,Y		; 79 90 FC
	plb		; AB
	sbc $10FCA8.l,X		; FF A8 FC 10
	jsr ($3800.w,X)		; FC 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stx $38.b		; 86 38
	ora ($6C.b,S),Y		; 13 6C
	tsa		; 3B
	mvp $44,$3B		; 44 3B 44
	bcc 108.b		; 90 6C
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$E080.w		; E0 80 E0
	cpy #$F0C0.w		; C0 C0 F0
	bmi  32.b		; 30 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcs  48.b		; B0 30
	bne   0.b		; D0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001D.w,X		; 1D 1D 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $0000.w,X		; FD 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $05.b		; 00 05
	brk $04.b		; 00 04
	brk $F4.b		; 00 F4
	phd		; 0B
	sbc [$FF.b],Y		; F7 FF
	pea $F7FF.w		; F4 FF F7
	sbc $000400.l,X		; FF 00 04 00
	brk $FC.b		; 00 FC
	sbc $01FFF7.l,X		; FF F7 FF 01
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	brk $F7.b		; 00 F7
	sbc $000402.l,X		; FF 02 04 00
	brk $F8.b		; 00 F8
	sbc $03FFFF.l,X		; FF FF FF 03
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $03FFFF.l,X		; FF FF FF 03
	mvp $00,$00		; 44 00 00
	ora ($01.b,X)		; 01 01
	ora [$07.b]		; 07 07
	bra   3.b		; 80 03
	bmi  79.b		; 30 4F
	sbc $FF0100.l,X		; FF 00 01 FF
	brk $80.b		; 00 80
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FE00.w,X)		; FC 00 FE
	brk $FF.b		; 00 FF
	sbc $8100FE.l,X		; FF FE 00 81
	ror $1F00.w,X		; 7E 00 1F
	sbc $FC34FF.l,X		; FF FF 34 FC
	bvs  -8.b		; 70 F8
	php		; 08
	jsr ($66E5.w,X)		; FC E5 66
	ror $7F.b		; 66 7F
	dex		; CA
	ldy $10.b,X		; B4 10
	sbc $C80000.l		; EF 00 00 C8
	brk $9C.b		; 00 9C
	brk $07.b		; 00 07
	brk $9B.b		; 00 9B
	bra  37.b		; 80 25
	tya		; 98
	phk		; 4B
	bit $10.b,X		; 34 10
	sbc $000000.l		; EF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	rol $EF08.w		; 2E 08 EF
	inc A		; 1A
	ora $8680.w,X		; 1D 80 86
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $FE.b		; 00 FE
	brk $F1.b		; 00 F1
	asl $F0.b		; 06 F0
	ora [$E2.b]		; 07 E2
	ora $80.b		; 05 80
	asl $00.b		; 06 00
	cmp ($00.b,X)		; C1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 0C7FFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0C7FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0C7FFF. Skipping.
.ENDS
