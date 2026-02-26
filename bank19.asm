.BANK 19 SLOT 0
.ORG $0000

.SECTION "Bank19" FORCE

	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	plx		; FA
	asl $FA.b		; 06 FA
	ora $FA.b,S		; 03 FA
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	plx		; FA
	sbc $000E01.l,X		; FF 01 0E 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	asl $0000.w		; 0E 00 00
	trb $1C1C.w		; 1C 1C 1C
	trb $4E4E.w		; 1C 4E 4E
	phx		; DA
	phx		; DA
	ora $1E100F.l		; 0F 0F 10 1E
	bra -10.b		; 80 F6
	brk $2A.b		; 00 2A
	trb $1C20.w		; 1C 20 1C
	rts		; 60

	lsr $DA30.w		; 4E 30 DA
	and $0F.b		; 25 0F
	beq  30.b		; F0 1E
	sbc ($F6.b,X)		; E1 F6
	ora ($2A.b,X)		; 01 2A
	ora ($20.b,X)		; 01 20
	jsr $7070.w		; 20 70 70
	bvs 112.b		; 70 70
	jsr $3820.w		; 20 20 38
	sec		; 38
	sei		; 78
	sei		; 78
	bmi  48.b		; 30 30
	jsr $2020.w		; 20 20 20
	cpy #$70.b		; C0 70
	bra 112.b		; 80 70
	bra  32.b		; 80 20
	bne  56.b		; D0 38
	cpy #$78.b		; C0 78
	bra  48.b		; 80 30
	iny		; C8
	jsr $00D8.w		; 20 D8 00
	sei		; 78
	brk $C4.b		; 00 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $C4.b		; 00 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	ora $FD.b,S		; 03 FD
	cop $FC.b		; 02 FC
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	lsr $56.b,X		; 56 56
	sta ($92.b)		; 92 92
	tas		; 1B
	tas		; 1B
	.db $82, $F2, $00		; 82 F2 00
	ora $00.b,S		; 03 00
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lsr $20.b,X		; 56 20
	sta ($64.b)		; 92 64
	tas		; 1B
	cpx $F2.b		; E4 F2
	ora $0C03.w		; 0D 03 0C
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $FE.b		; 00 FE
	sbc $00FFFF.l,X		; FF FF FF 00
	asl $0000.w		; 0E 00 00
	rti		; 40

	rti		; 40

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	ldy #$C0.b		; A0 C0
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	asl $F6.b		; 06 F6
	brk $FB.b		; 00 FB
	sbc $00FFF9.l,X		; FF F9 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc $01FF.w,Y		; F9 FF 01
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	tsb $40.b		; 04 40
	tsb $20.b		; 04 20
	lda $10.b		; A5 10
	eor $98.b		; 45 98
	eor [$28.b],Y		; 57 28
	dec A		; 3A
	ora $0E.b		; 05 0E
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	mvp $24,$00		; 44 00 24
	brk $B5.b		; 00 B5
	brk $DD.b		; 00 DD
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $0E.b		; 00 0E
	bpl  32.b		; 10 20
	brk $20.b		; 00 20
	jsr $C040.w		; 20 40 C0
	brk $90.b		; 00 90
	brk $20.b		; 00 20
	rti		; 40

	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	jsr $6000.w		; 20 00 60
	brk $C0.b		; 00 C0
	brk $90.b		; 00 90
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jsr ($F903.w,X)		; FC 03 F9
	brk $FC.b		; 00 FC
	sbc $00FFF9.l,X		; FF F9 FF 00
	asl $0000.w		; 0E 00 00
	brk $08.b		; 00 08
	php		; 08
	brk $08.b		; 00 08
	rti		; 40

	php		; 08
	ora ($8F.b,X)		; 01 8F
	jsr $116C.w		; 20 6C 11
	and ($0E.b),Y		; 31 0E
	clc		; 18
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $48.b		; 00 48
	brk $09.b		; 00 09
	brk $AF.b		; 00 AF
	brk $7D.b		; 00 7D
	brk $3F.b		; 00 3F
	brk $18.b		; 00 18
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $FB03.w,X		; FE 03 FB
	brk $FE.b		; 00 FE
	sbc $00FFFB.l,X		; FF FB FF 00
	asl $0000.w		; 0E 00 00
	brk $20.b		; 00 20
	brk $24.b		; 00 24
	bit $00.b		; 24 00
	tay		; A8
	rti		; 40

	bvc  40.b		; 50 28
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $24.b		; 00 24
	brk $24.b		; 00 24
	brk $E8.b		; 00 E8
	brk $78.b		; 00 78
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	tsb $FF.b		; 04 FF
	sbc $FF00.w,X		; FD 00 FF
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $FD.b		; 06 FD
	ora ($FE.b,X)		; 01 FE
	ora [$80.b]		; 07 80
	trb $EC00.w		; 1C 00 EC
	ora ($E0.b,S),Y		; 13 E0
	ora $EF.b,S		; 03 EF
	sbc $00FFF4.l,X		; FF F4 FF 00
	asl $0000.w		; 0E 00 00
	sbc $FFF4FF.l,X		; FF FF F4 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	ora $FFF400.l		; 0F 00 F4 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	cpx $E4FF.w		; EC FF E4
	sbc $000E06.l,X		; FF 06 0E 00
	brk $FC.b		; 00 FC
	sbc $08FFE4.l,X		; FF E4 FF 08
	asl $0000.w		; 0E 00 00
	tsb $E400.w		; 0C 00 E4
	sbc $000E0A.l,X		; FF 0A 0E 00
	brk $FB.b		; 00 FB
	sbc $0CFFD4.l,X		; FF D4 FF 0C
	asl $0000.w		; 0E 00 00
	ora ($23.b),Y		; 11 23
	and #$60.b		; 29 60
	bcc  48.b		; 90 30
	bit $D8.b		; 24 D8
	tas		; 1B
	pla		; 68
	ora $0E.b,S		; 03 0E
	ora ($02.b,X)		; 01 02
	bpl  16.b		; 10 10
	cpy #$00.b		; C0 00
	bpl   0.b		; 10 00
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9A.b		; 00 9A
	bpl -39.b		; 10 D9
	bcs -64.b		; B0 C0
	jsr $1C64.w		; 20 64 1C
	bit $5604.w		; 2C 04 56
	cop $4D.b		; 02 4D
	lda #$4E.b		; A9 4E
	sei		; 78
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	asl $0200.w,X		; 1E 00 02
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	cpx #$20.b		; E0 20
	.db $42, $C0		; 42 C0
	tsb $C0.b		; 04 C0
	ora $0368.w,X		; 1D 68 03
	sbc ($0A.b),Y		; F1 0A
	cpy #$0E.b		; C0 0E
	rts		; 60

	ora $0001.w,X		; 1D 01 00
	ora ($00.b,X)		; 01 00
	ora $40.b,S		; 03 40
	cop $40.b		; 02 40
	tsb $60.b		; 04 60
	tsb $00.b		; 04 00
	bpl  64.b		; 10 40
	bra  64.b		; 80 40
	clc		; 18
	and $38.b,S		; 23 38
	asl $45.b		; 06 45
	clv		; B8
	sep #$08		; E2 08
	ora [$B8.b]		; 07 B8
	php		; 08
	ora [$90.b]		; 07 90
	cpx $C220.w		; EC 20 C2
	bra  16.b		; 80 10
	cpy #$30.b		; C0 30
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$20.b		; C0 20
	bcc  96.b		; 90 60
	rts		; 60

	bra -128.b		; 80 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	asl A		; 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $47.b		; 00 47
	bra   1.b		; 80 01
	rti		; 40

	jsr $80A0.w		; 20 A0 80
	trb $20.b		; 14 20
	ora ($04.b)		; 12 04
	adc $0316.w,Y		; 79 16 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	brk $50.b		; 00 50
	brk $48.b		; 00 48
	brk $68.b		; 00 68
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	php		; 08
	tsb $08.b		; 04 08
	bit $0C81.w		; 2C 81 0C
	dey		; 88
	jmp $196DCB.l		; 5C CB 6D 19
	lsr $1B.b		; 46 1B
	and $E026.w,X		; 3D 26 E0
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	rti		; 40

	bpl  64.b		; 10 40
	bcs -128.b		; B0 80
	jsr $B080.w		; 20 80 B0
	cpy #$68.b		; C0 68
	bra  48.b		; 80 30
	php		; 08
	rts		; 60

	bpl  32.b		; 10 20
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $40.b		; 00 40
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
	jsr $4040.w		; 20 40 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $0302.w		; 0C 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	bmi   0.b		; 30 00
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora [$1C.b]		; 07 1C
	phb		; 8B
	asl $8E.b		; 06 8E
	beq   3.b		; F0 03
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
	brk $C0.b		; 00 C0
	rol $EF.b,X		; 36 EF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	ora $00FE00.l,X		; 1F 00 FE 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	ora $00FE60.l,X		; 1F 60 FE 00
	dec $18.b		; C6 18
	brk $38.b		; 00 38
	jsr $00C0.w		; 20 C0 00
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
	brk $04.b		; 00 04
	ora ($08.b,X)		; 01 08
	php		; 08
	cop $00.b		; 02 00
	and $26.b		; 25 26
	and ($23.b)		; 32 23
	ora $0011.w,Y		; 19 11 00
	clc		; 18
	tsb $3800.w		; 0C 00 38
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $20.b		; 00 20
	brk $75.b		; 00 75
	eor $1B.b,S		; 43 1B
	bpl  14.b		; 10 0E
	dey		; 88
	and ($A0.b,X)		; 21 A0
	phk		; 4B
	plp		; 28
	adc [$D6.b]		; 67 D6
	and $C9.b,S		; 23 C9
	and ($62.b),Y		; 31 62
	brk $00.b		; 00 00
	jsr $2000.w		; 20 00 20
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $3A.b		; 00 3A
	trb $DB.b		; 14 DB
	sty $2E.b		; 84 2E
	cpy #$68.b		; C0 68
	rti		; 40

	tas		; 1B
	adc ($CA.b,X)		; 61 CA
	bmi -56.b		; 30 C8
	ora ($ED.b,S),Y		; 13 ED
	lsr $0000.w,X		; 5E 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	tsb $02.b		; 04 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$20.b		; C0 20
	ora ($00.b,X)		; 01 00
	ror A		; 6A
	cmp ($97.b,X)		; C1 97
	dey		; 88
	trb $CA.b		; 14 CA
	jsr $4092.w		; 20 92 40
	lda [$1C.b]		; A7 1C
	sta $14.b,S		; 83 14
	brk $EE.b		; 00 EE
	brk $10.b		; 00 10
	jsr $0020.w		; 20 20 00
	jsr $4004.w		; 20 04 40
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	.db $82, $20, $83		; 82 20 83
	rep #$04		; C2 04
	cop $24.b		; 02 24
	bit $48.b		; 24 48
	ora $C8.b		; 05 C8
	lsr A		; 4A
	bra -116.b		; 80 8C
	and ($00.b,S),Y		; 33 00
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
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $04.b		; 02 04
	lsr $C4.b		; 46 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $4000.w		; 0C 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bmi   0.b		; 30 00
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	beq  14.b		; F0 0E
	sbc [$02.b]		; E7 02
	beq  -1.b		; F0 FF
	sbc [$FF.b]		; E7 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	sbc [$FF.b],Y		; F7 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc [$FF.b],Y		; F7 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	cop $02.b		; 02 02
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	brk $30.b		; 00 30
	cop $08.b		; 02 08
	brk $08.b		; 00 08
	ora $0C.b		; 05 0C
	sty $21.b,X		; 94 21
	ora ($00.b,X)		; 01 00
	php		; 08
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $86.b		; 00 86
	brk $82.b		; 00 82
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $82.b		; 00 82
	tsb $84.b		; 04 84
	brk $9C.b		; 00 9C
	bmi -120.b		; 30 88
	bpl -100.b		; 10 9C
	bvs -52.b		; 70 CC
	.db $62, $00, $00		; 62 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
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
	bpl  32.b		; 10 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($42.b,S),Y		; 13 42
	ora #$F0.b		; 09 F0
	bit $50.b,X		; 34 50
	ora $1C.b		; 05 1C
	ora ($06.b,X)		; 01 06
	trb $18.b		; 14 18
	asl $04.b		; 06 04
	cop $03.b		; 02 03
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	brk $4A.b		; 00 4A
	cpy #$A4.b		; C0 A4
	adc ($A2.b,X)		; 61 A2
	jsr $1077.w		; 20 77 10
	bit $3C88.w		; 2C 88 3C
	adc $1E.b,S		; 63 1E
	bmi  55.b		; 30 37
	cpy #$20.b		; C0 20
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	cop $08.b		; 02 08
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	ora ($1C.b,X)		; 01 1C
	sep #$81		; E2 81
	rol $22.b,X		; 36 22
	sta ($10.b,X)		; 81 10
	cmp $E04219.l,X		; DF 19 42 E0
	asl $E4.b		; 06 E4
	clc		; 18
	sec		; 38
	tsb $00.b		; 04 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	bcs -128.b		; B0 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
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
	brk $11.b		; 00 11
	clc		; 18
	ora ($01.b,X)		; 01 01
	bpl  18.b		; 10 12
	php		; 08
	cop $45.b		; 02 45
	pha		; 48
	adc #$4F.b		; 69 4F
	brk $31.b		; 00 31
	php		; 08
	ora ($00.b,X)		; 01 00
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $30.b		; 00 30
	brk $C3.b		; 00 C3
	lda ($A3.b)		; B2 A3
	ora ($72.b),Y		; 11 72
	jmp $0406.w		; 4C 06 04
	eor ($46.b),Y		; 51 46
	bit $8EB3.w,X		; 3C B3 8E
	ora $94.b,X		; 15 94
	ora ($00.b),Y		; 11 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $A8.b		; 00 A8
	cpy $50.b		; C4 50
	dey		; 88
	dex		; CA
	bpl  21.b		; 10 15
	ora ($65.b)		; 12 65
	and ($48.b)		; 32 48
	trb $A7.b		; 14 A7
	bne 112.b		; D0 70
	sta ($00.b,X)		; 81 00
	brk $05.b		; 00 05
	brk $24.b		; 00 24
	php		; 08
	pla		; 68
	brk $88.b		; 00 88
	ora ($80.b,X)		; 01 80
	rti		; 40

	php		; 08
	brk $0C.b		; 00 0C
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	.db $42, $62		; 42 62
	sty $82.b		; 84 82
	trb $14.b		; 14 14
	plp		; 28
	tsb $68.b		; 04 68
	jmp $8892.w		; 4C 92 88
	bit $00.b,X		; 34 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
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
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	asl $01.b		; 06 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	ora ($02.b,X)		; 01 02
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00C000.l,X		; FF 00 C0 00
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
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b,S		; 03 80
	tsb $F400.w		; 0C 00 F4
	asl A		; 0A
	sbc $F401.w		; ED 01 F4
	sbc $00FFF2.l,X		; FF F2 FF 00
	asl $0000.w		; 0E 00 00
	tsb $00.b		; 04 00
	sbc ($FF.b)		; F2 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sed		; F8
	sbc $04FFE2.l,X		; FF E2 FF 04
	asl $0000.w		; 0E 00 00
	jsl $332601.l		; 22 01 26 33
	cop $02.b		; 02 02
	bpl   8.b		; 10 08
	eor $1F.b,X		; 55 1F
	rts		; 60

	jmp $0412.w		; 4C 12 04
	eor ($11.b)		; 52 11
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	rts		; 60

	brk $02.b		; 00 02
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $89.b		; 00 89
	trb $3D.b		; 14 3D
	tay		; A8
	pei ($48.b)		; D4 48
	jsl $B2C102.l		; 22 02 C1 B2
	cpy #$17.b		; C0 17
	stx $98.b		; 86 98
	bpl   2.b		; 10 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b		; 05 00
	php		; 08
	brk $00.b		; 00 00
	brk $41.b		; 00 41
	brk $C1.b		; 00 C1
	brk $08.b		; 00 08
	bcc  16.b		; 90 10
	brk $28.b		; 00 28
	cop $62.b		; 02 62
	dey		; 88
	brk $14.b		; 00 14
	asl $60.b,X		; 16 60
	bit $58.b		; 24 58
	sty $0060.w		; 8C 60 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bvs   4.b		; 70 04
	tsb $1110.w		; 0C 10 11
	asl $04.b		; 06 04
	cop $03.b		; 02 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $50.b		; 00 50
	cmp [$D9.b]		; C7 D9
	tsb $48.b		; 04 48
	sta [$3F.b]		; 87 3F
	rti		; 40

	eor $001880.l,X		; 5F 80 18 00
	clc		; 18
	ora [$00.b]		; 07 00
	inc $0000.w,X		; FE 00 00
	jsl $001000.l		; 22 00 10 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	ora [$08.b]		; 07 08
	inc $D000.w,X		; FE 00 D0
	jsr $1820.w		; 20 20 18
	rti		; 40

	bcc   0.b		; 90 00
	rts		; 60

	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	jsr ($0000.w,X)		; FC 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $00.b		; 04 00
	cli		; 58
	.db $82, $04, $81		; 82 04 81
	sty $00.b		; 84 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $62.b		; 00 62
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $88.b		; 00 88
	brk $80.b		; 00 80
	brk $B0.b		; 00 B0
	rts		; 60

	bcs  96.b		; B0 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sed		; F8
	asl $F5.b		; 06 F5
	ora ($F8.b,X)		; 01 F8
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	plx		; FA
	sbc $02FFFD.l,X		; FF FD FF 02
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	sbc $03FF.w,X		; FD FF 03
	asl $0000.w		; 0E 00 00
	brk $14.b		; 00 14
	bpl   0.b		; 10 00
	lsr $01.b		; 46 01
	ora ($15.b),Y		; 11 15
	cop $02.b		; 02 02
	stx $B5.b,Y		; 96 B5
	asl $15.b		; 06 15
	ora #$64.b		; 09 64
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	clc		; 18
	brk $40.b		; 00 40
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $40.b		; 00 40
	brk $02.b		; 00 02
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	rti		; 40

	ldy $80.b		; A4 80
	cpy #$08.b		; C0 08
	bvs  70.b		; 70 46
	.db $82, $68, $C0		; 82 68 C0
	asl $30.b,X		; 16 30
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra  32.b		; 80 20
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	iny		; C8
	cpy $0F93.w		; CC 93 0F
	bmi   4.b		; 30 04
	brk $00.b		; 00 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi -96.b		; 30 A0
	brk $40.b		; 00 40
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	cop $FA.b		; 02 FA
	brk $FC.b		; 00 FC
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	brk $60.b		; 00 60
	ldx #$10.b		; A2 10
	tsb $280A.w		; 0C 0A 28
	ror $70.b,X		; 76 70
	.db $42, $1C		; 42 1C
	jsr $3800.w		; 20 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bra  36.b		; 80 24
	brk $EE.b		; 00 EE
	ora ($D4.b,S),Y		; 13 D4
	asl $FC.b		; 06 FC
	sbc $00FFD4.l,X		; FF D4 FF 00
	asl $0000.w		; 0E 00 00
	inc $E4FF.w		; EE FF E4
	sbc $000E02.l,X		; FF 02 0E 00
	brk $FE.b		; 00 FE
	sbc $04FFE4.l,X		; FF E4 FF 04
	asl $0000.w		; 0E 00 00
	asl $E400.w		; 0E 00 E4
	sbc $000E06.l,X		; FF 06 0E 00
	brk $EF.b		; 00 EF
	sbc $08FFF4.l,X		; FF F4 FF 08
	asl $0000.w		; 0E 00 00
	sbc $FFF4FF.l,X		; FF FF F4 FF
	asl A		; 0A
	asl $0000.w		; 0E 00 00
	ora $FFF400.l		; 0F 00 F4 FF
	tsb $000E.w		; 0C 0E 00
	brk $F1.b		; 00 F1
	sbc $0E0004.l,X		; FF 04 00 0E
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	tsb $00.b		; 04 00
	jsr $000E.w		; 20 0E 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	bra -128.b		; 80 80
	rts		; 60

	brk $40.b		; 00 40
	rti		; 40

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	rts		; 60

	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rti		; 40

	brk $80.b		; 00 80
	php		; 08
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
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $0E.b		; 00 0E
	brk $10.b		; 00 10
	brk $03.b		; 00 03
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
	brk $40.b		; 00 40
	lda ($50.b),Y		; B1 50
	and $01EA14.l		; 2F 14 EA 01
	inc $1001.w,X		; FE 01 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $0800.w		; 1C 00 08
	rti		; 40

	brk $70.b		; 00 70
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	bra   1.b		; 80 01
	tsb $81.b		; 04 81
	dey		; 88
	ora ($B0.b),Y		; 11 B0
	ora ($E0.b,X)		; 01 E0
	ora ($EC.b,X)		; 01 EC
	ora ($80.b)		; 12 80
	cop $F0.b		; 02 F0
	ora $088004.l		; 0F 04 80 08
	sty $00.b		; 84 00
	dey		; 88
	brk $B0.b		; 00 B0
	brk $E0.b		; 00 E0
	ora ($FC.b,X)		; 01 FC
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	ora ($5E.b,X)		; 01 5E
	bvc -81.b		; 50 AF
	brk $02.b		; 00 02
	tsb $0023.w		; 0C 23 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	jmp $100000.l		; 5C 00 00 10
	rol $0000.w		; 2E 00 00
	brk $30.b		; 00 30
	brk $70.b		; 00 70
	jsr $00DC.w		; 20 DC 00
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	jsr $2010.w		; 20 10 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cop $4D.b		; 02 4D
	clc		; 18
	cpx $00.b		; E4 00
	php		; 08
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	rti		; 40

	and $010318.l		; 2F 18 03 01
	brk $15.b		; 00 15
	php		; 08
	ldy #$50.b		; A0 50
	brk $26.b		; 00 26
	brk $24.b		; 00 24
	bra   1.b		; 80 01
	bcc  65.b		; 90 41
	brk $19.b		; 00 19
	cop $01.b		; 02 01
	cop $1D.b		; 02 1D
	cop $A0.b		; 02 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	stx $C031.w		; 8E 31 C0
	bit $6C93.w,X		; 3C 93 6C
	bpl   0.b		; 10 00
	txs		; 9A
	rti		; 40

	bne  15.b		; D0 0F
	cli		; 58
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	stx $D800.w		; 8E 00 D8
	brk $9F.b		; 00 9F
	cpx BG2VOFS.w		; EC 10 21
	txs		; 9A
	brk $D8.b		; 00 D8
	brk $D8.b		; 00 D8
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	ora $02F070.l		; 0F 70 F0 02
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	brk $08.b		; 00 08
	and #$52.b		; 29 52
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx $00.b		; E4 00
	sty $29.b		; 84 29
	jsr $4058.w		; 20 58 40
	bmi -64.b		; 30 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  32.b		; 80 20
	bcc -128.b		; 90 80
	rti		; 40

	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	rti		; 40

	brk $70.b		; 00 70
	brk $40.b		; 00 40
	jsr $8000.w		; 20 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003E00.l,X		; FF 00 3E 00
	pha		; 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003E00.l,X		; FF 00 3E 00
	pha		; 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $40.b		; 26 40
	eor ($22.b,X)		; 41 22
	jsr $2141.w		; 20 41 21
	rti		; 40

	brk $60.b		; 00 60
	brk $20.b		; 00 20
	jsr $2000.w		; 20 00 20
	ora ($00.b,X)		; 01 00
	rol $00.b		; 26 00
	eor $00.b,S		; 43 00
	and ($00.b,X)		; 21 00
	adc ($00.b,X)		; 61 00
	rts		; 60

	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	clc		; 18
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	clc		; 18
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	jsr $8000.w		; 20 00 80
	rts		; 60

	bra  96.b		; 80 60
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora ($FE.b,X)		; 01 FE
	brk $10.b		; 00 10
	brk $10.b		; 00 10
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
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	asl $B071.w		; 0E 71 B0
	eor $000600.l		; 4F 00 06 00
	bpl   0.b		; 10 00
	asl $0400.w		; 0E 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $F8.b		; 00 F8
	clc		; 18
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cop $00.b		; 02 00
	rep #$80		; C2 80
	adc ($80.b)		; 72 80
	tda		; 7B
	cpy $03.b		; C4 03
	sty $48.b		; 84 48
	rti		; 40

	bcc   0.b		; 90 00
	bne   0.b		; D0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	bra   4.b		; 80 04
	bra  24.b		; 80 18
	cpy $32.b		; C4 32
	sty $01.b		; 84 01
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	ora [$00.b],Y		; 17 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	inc $0100.w,X		; FE 00 01
	brk $04.b		; 00 04
	brk $64.b		; 00 64
	pla		; 68
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $18.b		; 00 18
	brk $20.b		; 00 20
	cld		; D8
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	jsr $00D8.w		; 20 D8 00
	rti		; 40

	brk $48.b		; 00 48
	brk $E0.b		; 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $DE.b		; 00 DE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $DE.b		; 00 DE
	bpl -128.b		; 10 80
	bcc   0.b		; 90 00
	bcs   0.b		; B0 00
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	bcs   0.b		; B0 00
	stx $00.b,Y		; 96 00
	brk $90.b		; 00 90
	brk $90.b		; 00 90
	brk $B0.b		; 00 B0
	brk $90.b		; 00 90
	brk $90.b		; 00 90
	brk $90.b		; 00 90
	brk $B0.b		; 00 B0
	brk $96.b		; 00 96
	brk $30.b		; 00 30
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pei ($00.b)		; D4 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D4.b		; 00 D4
	brk $00.b		; 00 00
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00A700.l,X		; FF 00 A7 00
	ora ($00.b),Y		; 11 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $A7.b		; 00 A7
	brk $11.b		; 00 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $82, $00, $40		; 82 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $82, $00, $40		; 82 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc ($0F.b),Y		; F1 0F
	cmp $F204.w,X		; DD 04 F2
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	sbc $FF.b,X		; F5 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	sbc $FF.b		; E5 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc $FF.b		; E5 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sbc $D5FF.w,X		; FD FF D5
	sbc $000E08.l,X		; FF 08 0E 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $E810.w		; 20 10 E8
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	tsb $B9.b		; 04 B9
	ror $19.b		; 66 19
	ora $4902.w		; 0D 02 49
	jsr $9007.w		; 20 07 90
	ora $84.b,S		; 03 84
	ora ($84.b,X)		; 01 84
	brk $0C.b		; 00 0C
	rti		; 40

	tsb $6F00.w		; 0C 00 6F
	bpl  13.b		; 10 0D
	asl $69.b,X		; 16 69
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $05.b		; 00 05
	brk $18.b		; 00 18
	cpx #$12.b		; E0 12
	ora ($CE.b,X)		; 01 CE
	rol $00C0.w,X		; 3E C0 00
	brk $00.b		; 00 00
	cpx #$84.b		; E0 84
	asl A		; 0A
	brk $06.b		; 00 06
	asl $00.b		; 06 00
	brk $E0.b		; 00 E0
	brk $81.b		; 00 81
	brk $FE.b		; 00 FE
	cpy #$00.b		; C0 00
	ora $1180.w,X		; 1D 80 11
	sty $00.b		; 84 00
	brk $00.b		; 00 00
	plp		; 28
	brk $18.b		; 00 18
	cpx #$00.b		; E0 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bpl  40.b		; 10 28
	rts		; 60

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $08.b		; 04 08
	brk $0C.b		; 00 0C
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	ora $C8.b		; 05 C8
	eor [$B8.b]		; 47 B8
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	jsr $0005.w		; 20 05 00
	cmp [$40.b]		; C7 40
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	jsr $7000.w		; 20 00 70
	brk $10.b		; 00 10
	rti		; 40

	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	tas		; 1B
	brk $40.b		; 00 40
	jsr $0010.w		; 20 10 00
	bpl   0.b		; 10 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $7E.b		; 00 7E
	rti		; 40

	ldy #$00.b		; A0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bit $0000.w		; 2C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	bit $0000.w		; 2C 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	adc $00.b,X		; 75 00
	sbc $003C00.l,X		; FF 00 3C 00
	bvc   0.b		; 50 00
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $75.b		; 00 75
	brk $FF.b		; 00 FF
	brk $3C.b		; 00 3C
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	brk $FC.b		; 00 FC
	brk $9A.b		; 00 9A
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	brk $FC.b		; 00 FC
	brk $9A.b		; 00 9A
	brk $48.b		; 00 48
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
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	ora $FC.b,S		; 03 FC
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $57.b		; 00 57
	ldy #$0C.b		; A0 0C
	beq  54.b		; F0 36
	iny		; C8
	cpy #$3E.b		; C0 3E
	tsb $13.b		; 04 13
	asl $30.b		; 06 30
	tsb $12.b		; 04 12
	cop $04.b		; 02 04
	brk $77.b		; 00 77
	brk $1C.b		; 00 1C
	brk $36.b		; 00 36
	brk $E0.b		; 00 E0
	rts		; 60

	tsb $00.b		; 04 00
	asl $01.b		; 06 01
	tsb $00.b		; 04 00
	asl $CA.b		; 06 CA
	and $00.b		; 25 00
	jsr $2200.w		; 20 00 22
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	rti		; 40

	and $008040.l,X		; 3F 40 80 00
	brk $10.b		; 00 10
	wai		; CB
	brk $00.b		; 00 00
	ora $0100.w		; 0D 00 01
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rti		; 40

	jsr $1040.w		; 20 40 10
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	bra   0.b		; 80 00
	jsr ($F000.w,X)		; FC 00 F0
	brk $10.b		; 00 10
	brk $90.b		; 00 90
	brk $7C.b		; 00 7C
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	cpy #$48.b		; C0 48
	bra  64.b		; 80 40
	sty $00.b		; 84 00
	rti		; 40

	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $10.b		; 00 10
	brk $48.b		; 00 48
	brk $44.b		; 00 44
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	sbc $0B.b,X		; F5 0B
	sbc [$03.b]		; E7 03
	sbc $FF.b,X		; F5 FF
	sbc [$FF.b]		; E7 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc [$FF.b]		; E7 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	sbc [$FF.b],Y		; F7 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	sbc [$FF.b],Y		; F7 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	rti		; 40

	brk $00.b		; 00 00
	brk $09.b		; 00 09
	rti		; 40

	ora ($40.b,X)		; 01 40
	brk $40.b		; 00 40
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rti		; 40

	brk $00.b		; 00 00
	ora #$00.b		; 09 00
	ora ($00.b,X)		; 01 00
	rti		; 40

	tsb $02.b		; 04 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $01.b		; 04 01
	brk $00.b		; 00 00
	bpl -82.b		; 10 AE
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $02.b		; 00 02
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	rti		; 40

	jmp $5792.w		; 4C 92 57
	plp		; 28
	mvn $31,$20		; 54 20 31
	rti		; 40

	bpl  65.b		; 10 41
	bvc   0.b		; 50 00
	tsb $40.b		; 04 40
	brk $40.b		; 00 40
	brk $4C.b		; 00 4C
	bra  95.b		; 80 5F
	.db $82, $54, $02		; 82 54 02
	adc ($00.b),Y		; 71 00
	bvc   0.b		; 50 00
	bvc   0.b		; 50 00
	bpl   8.b		; 10 08
	tsb $00.b		; 04 00
	dey		; 88
	bra   0.b		; 80 00
	brk $10.b		; 00 10
	bmi -128.b		; 30 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   8.b		; 80 08
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	php		; 08
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $13.b		; 00 13
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	asl $00F1.w		; 0E F1 00
	jsr $0100.w		; 20 00 01
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	php		; 08
	cop $30.b		; 02 30
	cmp $40.b,S		; C3 40
	sty $70.b		; 84 70
	asl $E400.w		; 0E 00 E4
	brk $3E.b		; 00 3E
	jsr $0087.w		; 20 87 00
	brk $80.b		; 00 80
	php		; 08
	brk $30.b		; 00 30
	brk $C0.b		; 00 C0
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	jsr $0000.w		; 20 00 00
	brk $2C.b		; 00 2C
	brk $F0.b		; 00 F0
	brk $20.b		; 00 20
	mvp $00,$20		; 44 20 00
	sec		; 38
	brk $80.b		; 00 80
	brk $E8.b		; 00 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	bra 100.b		; 80 64
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
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $DE.b		; 00 DE
	brk $C2.b		; 00 C2
	brk $88.b		; 00 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	bvc   0.b		; 50 00
	dec $C200.w,X		; DE 00 C2
	brk $88.b		; 00 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $EF07.w,Y		; F9 07 EF
	cop $F9.b		; 02 F9
	sbc $00FFFB.l,X		; FF FB FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	xce		; FB
	sbc $000E01.l,X		; FF 01 0E 00
	brk $F9.b		; 00 F9
	sbc $02FFF3.l,X		; FF F3 FF 02
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	sbc ($FF.b,S),Y		; F3 FF
	ora $0E.b,S		; 03 0E
	brk $00.b		; 00 00
	sbc $FFEBFF.l,X		; FF FF EB FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	cop $01.b		; 02 01
	ora ($E8.b,X)		; 01 E8
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $000000.l		; 6F 00 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	cpy #$12.b		; C0 12
	bvs -120.b		; 70 88
	brk $C6.b		; 00 C6
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $00.b		; E4 00
	jsr $0000.w		; 20 00 00
	cpy #$00.b		; C0 00
	beq  32.b		; F0 20
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $00.b		; E4 00
	jsr $0200.w		; 20 00 02
	cop $00.b		; 02 00
	brk $02.b		; 00 02
	phd		; 0B
	bit $02.b		; 24 02
	bit $E618.w,X		; 3C 18 E6
	cop $04.b		; 02 04
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $0B.b		; 00 0B
	brk $06.b		; 00 06
	brk $18.b		; 00 18
	brk $02.b		; 00 02
	jsr $4002.w		; 20 02 40
	brk $00.b		; 00 00
	cpy #$80.b		; C0 80
	rti		; 40

	php		; 08
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	tsb $7480.w		; 0C 80 74
	brk $04.b		; 00 04
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $80.b		; 00 80
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $48.b		; 00 48
	bra -128.b		; 80 80
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	brk $A0.b		; 00 A0
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FA03.w,X		; FD 03 FA
	sbc $FAFFFD.l,X		; FF FD FF FA
	sbc $000E00.l,X		; FF 00 0E 00
	brk $00.b		; 00 00
	php		; 08
	bpl  44.b		; 10 2C
	rti		; 40

	ldx #$00.b		; A2 00
	cop $0C.b		; 02 0C
	bpl   0.b		; 10 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   4.b		; 10 04
	rti		; 40

	php		; 08
	brk $00.b		; 00 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $80.b		; 06 80
	clc		; 18
	brk $F6.b		; 00 F6
	ora #$D6.b		; 09 D6
	ora $F8.b		; 05 F8
	sbc $00FFD6.l,X		; FF D6 FF 00
	asl $0000.w		; 0E 00 00
	php		; 08
	brk $D6.b		; 00 D6
	sbc $000E02.l,X		; FF 02 0E 00
	brk $F6.b		; 00 F6
	sbc $04FFE6.l,X		; FF E6 FF 04
	asl $0000.w		; 0E 00 00
	asl $00.b		; 06 00
	inc $FF.b		; E6 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sed		; F8
	sbc $08FFF6.l,X		; FF F6 FF 08
	asl $0000.w		; 0E 00 00
	php		; 08
	brk $F6.b		; 00 F6
	sbc $000E0A.l,X		; FF 0A 0E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $03.b,S		; 03 03
	ora ($13.b,X)		; 01 13
	ora ($3B.b,X)		; 01 3B
	ora ($3B.b),Y		; 11 3B
	ora ($00.b),Y		; 11 00
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
	cpy #$00.b		; C0 00
	cpx #$80.b		; E0 80
	bvs -96.b		; 70 A0
	bvc -72.b		; 50 B8
	rti		; 40

	lda ($40.b,S),Y		; B3 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rtl		; 6B

	bmi 105.b		; 30 69
	bmi 105.b		; 30 69
	bmi -23.b		; 30 E9
	bmi 105.b		; 30 69
	bmi 105.b		; 30 69
	bmi -23.b		; 30 E9
	bmi 105.b		; 30 69
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6D.b		; 00 6D
	bne 109.b		; D0 6D
	bne 109.b		; D0 6D
	bne 110.b		; D0 6E
	cmp ($6D.b),Y		; D1 6D
	cmp ($6B.b,S),Y		; D3 6B
	cmp [$2B.b],Y		; D7 2B
	stx $6F.b,Y		; 96 6F
	bne   0.b		; D0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	bra  96.b		; 80 60
	cpy #$E0.b		; C0 E0
	cpy #$F0.b		; C0 F0
	bra -32.b		; 80 E0
	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
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
	brk $05.b		; 00 05
	ora $0D.b,S		; 03 0D
	ora $05.b,S		; 03 05
	ora $05.b,S		; 03 05
	ora $05.b,S		; 03 05
	ora $05.b,S		; 03 05
	ora $04.b,S		; 03 04
	cop $05.b		; 02 05
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	rti		; 40

	bcs  64.b		; B0 40
	bcs  64.b		; B0 40
	bcs  64.b		; B0 40
	bcs  64.b		; B0 40
	bcs  64.b		; B0 40
	clv		; B8
	rti		; 40

	bcs  64.b		; B0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($3B.b),Y		; 11 3B
	ora ($7A.b),Y		; 11 7A
	bpl  43.b		; 10 2B
	ora ($3B.b,X)		; 01 3B
	ora ($3F.b),Y		; 11 3F
	ora ($23.b),Y		; 11 23
	ora $07D9.w,X		; 1D D9 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $43.b,X		; B5 43
	lda $43.b,X		; B5 43
	lda $43.b,X		; B5 43
	lda $43.b,X		; B5 43
	lda $43.b,X		; B5 43
	lda $43.b,X		; B5 43
	lda $B543.w,X		; BD 43 B5
	eor $00.b,S		; 43 00
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
	brk $4D.b		; 00 4D
	bpl 103.b		; 10 67
	sec		; 38
	adc ($1D.b)		; 72 1D
	sec		; 38
	ora $0F071C.l		; 0F 1C 07 0F
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6F.b		; 00 6F
	bne 108.b		; D0 6C
	bne 108.b		; D0 6C
	bne 108.b		; D0 6C
	bne  44.b		; D0 2C
	bcc 110.b		; 90 6E
	bne 108.b		; D0 6C
	bne 108.b		; D0 6C
	bne   0.b		; D0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $05.b,S		; 03 05
	ora $05.b,S		; 03 05
	ora $05.b,S		; 03 05
	tas		; 1B
	brk $BF.b		; 00 BF
	brk $07.b		; 00 07
	brk $11.b		; 00 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $BF.b		; 00 BF
	brk $07.b		; 00 07
	brk $11.b		; 00 11
	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	rti		; 40

	bcs  64.b		; B0 40
	bcs  64.b		; B0 40
	bcs  76.b		; B0 4C
	bra 116.b		; 80 74
	brk $FA.b		; 00 FA
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $3400.w		; 0C 00 34
	brk $FA.b		; 00 FA
	brk $20.b		; 00 20
	brk $40.b		; 00 40
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
	brk $03.b		; 00 03
	bra  12.b		; 80 0C
	brk $F8.b		; 00 F8
	asl $DF.b		; 06 DF
	tsb $F8.b		; 04 F8
	sbc $00FFDF.l,X		; FF DF FF 00
	asl $0000.w		; 0E 00 00
	sed		; F8
	sbc $02FFEF.l,X		; FF EF FF 02
	asl $0000.w		; 0E 00 00
	xce		; FB
	sbc $04FFFF.l,X		; FF FF FF 04
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	cop $03.b		; 02 03
	ora ($00.b,S),Y		; 13 00
	tas		; 1B
	bpl  27.b		; 10 1B
	bpl  59.b		; 10 3B
	bpl  59.b		; 10 3B
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
	bra   0.b		; 80 00
	cpy #$40.b		; C0 40
	ldy #$60.b		; A0 60
	bra 108.b		; 80 6C
	bra 118.b		; 80 76
	sty $8C76.w		; 8C 76 8C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $62.b		; C5 62
	cmp $62.b		; C5 62
	cmp $62.b		; C5 62
	cmp $E962.w,X		; DD 62 E9
	rol $61.b,X		; 36 61
	asl $1E31.w,X		; 1E 31 1E
	ora $02.b		; 05 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp $A05CB0.l		; 5C B0 5C A0
	ror $6080.w,X		; 7E 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
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
	brk $2B.b		; 00 2B
	trb $2B.b		; 14 2B
	trb $2B.b		; 14 2B
	pei ($00.b)		; D4 00
	and $008200.l,X		; 3F 00 82 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $3F.b		; 00 3F
	brk $82.b		; 00 82
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $1B.b		; 00 1B
	bpl  31.b		; 10 1F
	bpl 121.b		; 10 79
	asl $CD.b		; 06 CD
	.db $62, $C5, $62		; 62 C5 62
	cmp $62.b		; C5 62
	cmp $62.b		; C5 62
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $8C.b,X		; 76 8C
	ror $8C.b,X		; 76 8C
	ror $8C.b,X		; 76 8C
	ror $8C.b,X		; 76 8C
	adc ($88.b)		; 72 88
	ror $8C.b,X		; 76 8C
	ror $7E8C.w,X		; 7E 8C 7E
	tya		; 98
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $02.b		; 05 02
	ora $02.b		; 05 02
	ora $0502.w		; 0D 02 05
	cop $05.b		; 02 05
	cop $05.b		; 02 05
	cop $05.b		; 02 05
	cop $0D.b		; 02 0D
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
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
	tsb $E7.b		; 04 E7
	cop $FA.b		; 02 FA
	sbc $00FFE7.l,X		; FF E7 FF 00
	asl $0000.w		; 0E 00 00
	xce		; FB
	sbc $02FFF7.l,X		; FF F7 FF 02
	asl $0000.w		; 0E 00 00
	tsb $00.b		; 04 00
	php		; 08
	asl $032C.w		; 0E 2C 03
	and $7D22.w,X		; 3D 22 7D
	jsl $1D227D.l		; 22 7D 22 1D
	cop $3D.b		; 02 3D
	jsl $000000.l		; 22 00 00 00
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
	brk $E0.b		; 00 E0
	rti		; 40

	cpx #$40.b		; E0 40
	cpx #$40.b		; E0 40
	cpx #$40.b		; E0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dex		; CA
	stz $0A.b,X		; 74 0A
	trb $0A.b		; 14 0A
	trb $2A.b		; 14 2A
	trb $0A.b		; 14 0A
	trb $0A.b		; 14 0A
	trb $0A.b		; 14 0A
	trb $2A.b		; 14 2A
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $75.b		; 00 75
	asl A		; 0A
	sta $4A.b,X		; 95 4A
	sta $4A.b		; 85 4A
	sta $4A.b		; 85 4A
	sty $4B.b		; 84 4B
	sta $4A.b		; 85 4A
	lda $4A.b,X		; B5 4A
	eor $3A.b		; 45 3A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$40.b		; E0 40
	ldy #$00.b		; A0 00
	cpx #$40.b		; E0 40
	cpx #$80.b		; E0 80
	cpy #$80.b		; C0 80
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	trb $0A.b		; 14 0A
	adc $00.b,X		; 75 00
	asl $0400.w,X		; 1E 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc ($00.b,X)		; 61 00
	asl $0400.w,X		; 1E 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FC.b		; 00 FC
	cop $F0.b		; 02 F0
	ora ($FC.b,X)		; 01 FC
	sbc $00FFF0.l,X		; FF F0 FF 00
	asl $0000.w		; 0E 00 00
	sbc $00FF.w,X		; FD FF 00
	brk $02.b		; 00 02
	asl $0000.w		; 0E 00 00
	bpl  16.b		; 10 10
	bvc   8.b		; 50 08
	cli		; 58
	rti		; 40

	lsr $5E40.w,X		; 5E 40 5E
	rti		; 40

	dec $BE20.w,X		; DE 20 BE
	bra -66.b		; 80 BE
	sty $00.b		; 84 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	dey		; 88
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BE.b		; 00 BE
	bra  -8.b		; 80 F8
	bra  88.b		; 80 58
	rts		; 60

	sec		; 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $38.b		; 00 38
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $F8.b		; 00 F8
	sbc $F8FFFE.l,X		; FF FE FF F8
	sbc $000E00.l,X		; FF 00 0E 00
	brk $80.b		; 00 80
	rti		; 40

	ldy #$E0.b		; A0 E0
	brk $40.b		; 00 40
	jsr $0040.w		; 20 40 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $05.b		; 00 05
	bra  20.b		; 80 14
	brk $F7.b		; 00 F7
	ora #$D3.b		; 09 D3
	cop $F7.b		; 02 F7
	sbc $00FFD3.l,X		; FF D3 FF 00
	asl $0000.w		; 0E 00 00
	ora [$00.b]		; 07 00
	cmp ($FF.b,S),Y		; D3 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $FF.b,S		; E3 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $FF.b,S		; E3 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sbc $F3FF.w,Y		; F9 FF F3
	sbc $000E08.l,X		; FF 08 0E 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora ($03.b,X)		; 01 03
	ora ($07.b,X)		; 01 07
	ora ($03.b,X)		; 01 03
	brk $03.b		; 00 03
	ora ($33.b,X)		; 01 33
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  96.b		; 80 60
	brk $50.b		; 00 50
	jsr $20D8.w		; 20 D8 20
	bvc  32.b		; 50 20
	cli		; 58
	jsr $2051.w		; 20 51 20
	bne  35.b		; D0 23
	rti		; 40

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
	brk $5B.b		; 00 5B
	ora ($5B.b),Y		; 11 5B
	ora ($5B.b),Y		; 11 5B
	ora ($7B.b),Y		; 11 7B
	ora ($DB.b),Y		; 11 DB
	ora ($5B.b),Y		; 11 5B
	ora ($5B.b),Y		; 11 5B
	bpl  91.b		; 10 5B
	ora ($20.b),Y		; 11 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $21.b		; 00 21
	brk $20.b		; 00 20
	brk $56.b		; 00 56
	jsl $562256.l		; 22 56 22 56
	jsl $D62256.l		; 22 56 22 D6
	jsl $572256.l		; 22 56 22 57
	jsl $812256.l		; 22 56 22 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $81.b		; 00 81
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  96.b		; 80 60
	bra  64.b		; 80 40
	bra  64.b		; 80 40
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
	brk $3D.b		; 00 3D
	tsb $2D.b		; 04 2D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $1D.b		; 04 1D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $02.b		; 04 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $40.b		; 00 40
	bra -64.b		; 80 C0
	brk $60.b		; 00 60
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7B.b		; 00 7B
	ora ($5B.b),Y		; 11 5B
	ora ($5B.b),Y		; 11 5B
	ora ($5B.b,X)		; 01 5B
	ora ($7B.b),Y		; 11 7B
	ora ($5B.b),Y		; 11 5B
	ora ($DB.b),Y		; 11 DB
	ora ($5B.b),Y		; 11 5B
	ora ($20.b),Y		; 11 20
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $56.b		; 00 56
	and $56.b,S		; 23 56
	jsl $562257.l		; 22 57 22 56
	jsl $562256.l		; 22 56 22 56
	jsl $562256.l		; 22 56 22 56
	jsr $0080.w		; 20 80 00
	sta ($00.b,X)		; 81 00
	sta ($00.b,X)		; 81 00
	cmp ($00.b,X)		; C1 00
	sta ($00.b,X)		; 81 00
	sta ($00.b,X)		; 81 00
	sta ($00.b,X)		; 81 00
	sta $00.b,S		; 83 00
	cpy #$00.b		; C0 00
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  96.b		; 80 60
	bra  64.b		; 80 40
	bra  96.b		; 80 60
	bra  64.b		; 80 40
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
	brk $5B.b		; 00 5B
	ora ($5B.b),Y		; 11 5B
	ora ($FB.b),Y		; 11 FB
	ora ($5B.b),Y		; 11 5B
	ora ($DB.b),Y		; 11 DB
	ora ($6F.b),Y		; 11 6F
	and ($37.b,X)		; 21 37
	ora $3F.b,X		; 15 3F
	ora $0020.w		; 0D 20 00
	jsr $2000.w		; 20 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $56.b		; 00 56
	jsl $5C225E.l		; 22 5E 22 5C
	bit $58.b		; 24 58
	and #$D8.b		; 29 D8
	pld		; 2B
	eor ($2C.b,S),Y		; 53 2C
	eor $5020.w,X		; 5D 20 50
	jsr $0081.w		; 20 81 00
	sta ($00.b,X)		; 81 00
	sta $00.b,S		; 83 00
	stx $00.b		; 86 00
	sty $00.b		; 84 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra -128.b		; 80 80
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
	brk $0D.b		; 00 0D
	tsb $0F.b		; 04 0F
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	tsb $0D.b		; 04 0D
	jsr $F807.w		; 20 07 F8
	brk $37.b		; 00 37
	brk $41.b		; 00 41
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	jsl $00F800.l		; 22 00 F8 00
	and [$00.b],Y		; 37 00
	eor ($00.b,X)		; 41 00
	rti		; 40

	bra  96.b		; 80 60
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	ldy #$80.b		; A0 80
	pla		; 68
	brk $C0.b		; 00 C0
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $6800.w		; 20 00 68
	brk $C0.b		; 00 C0
	brk $10.b		; 00 10
	brk $03.b		; 00 03
	bra  12.b		; 80 0C
	brk $F9.b		; 00 F9
	ora [$DD.b]		; 07 DD
	cop $F9.b		; 02 F9
	sbc $00FFDD.l,X		; FF DD FF 00
	asl $0000.w		; 0E 00 00
	sbc $EDFF.w,Y		; F9 FF ED
	sbc $000E02.l,X		; FF 02 0E 00
	brk $FB.b		; 00 FB
	sbc $04FFFD.l,X		; FF FD FF 04
	asl $0000.w		; 0E 00 00
	ora $02.b,S		; 03 02
	ora [$02.b]		; 07 02
	ora [$02.b]		; 07 02
	ora [$00.b]		; 07 00
	ora [$02.b]		; 07 02
	and [$02.b]		; 27 02
	adc [$02.b],Y		; 77 02
	eor [$02.b],Y		; 57 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2000.w		; 20 00 20
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  72.b		; 80 48
	bra  64.b		; 80 40
	stz $9856.w		; 9C 56 98
	phy		; 5A
	sty $00.b,X		; 94 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	brk $57.b		; 00 57
	cop $57.b		; 02 57
	brk $57.b		; 00 57
	cop $57.b		; 02 57
	cop $F7.b		; 02 F7
	cop $57.b		; 02 57
	cop $7F.b		; 02 7F
	jsl $200A2F.l		; 22 2F 0A 20
	brk $22.b		; 00 22
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $52.b		; 00 52
	sty $5A.b,X		; 94 5A
	sty $52.b,X		; 94 52
	sty $72.b,X		; 94 72
	sty $62.b,X		; 94 62
	sty $64.b		; 84 64
	tay		; A8
	cli		; 58
	ldy #$68.b		; A0 68
	bra   8.b		; 80 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $18.b		; 00 18
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1D.b		; 00 1D
	asl A		; 0A
	ora $1D0A.w,X		; 1D 0A 1D
	.db $42, $0E		; 42 0E
	sbc ($00.b),Y		; F1 00
	adc $000400.l		; 6F 00 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $F1.b		; 00 F1
	brk $6F.b		; 00 6F
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
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
	brk $57.b		; 00 57
	cop $77.b		; 02 77
	cop $57.b		; 02 57
	cop $57.b		; 02 57
	cop $57.b		; 02 57
	cop $57.b		; 02 57
	cop $57.b		; 02 57
	cop $D7.b		; 02 D7
	cop $21.b		; 02 21
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $52.b		; 00 52
	sty $52.b,X		; 94 52
	sty $52.b,X		; 94 52
	sty $52.b,X		; 94 52
	sty $52.b		; 84 52
	sty $52.b,X		; 94 52
	sty $52.b,X		; 94 52
	sty $52.b,X		; 94 52
	sty $08.b,X		; 94 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $3F.b		; 00 3F
	inc A		; 1A
	ora $020702.l,X		; 1F 02 07 02
	ora [$02.b]		; 07 02
	ora [$02.b]		; 07 02
	ora $020702.l		; 0F 02 07 02
	ora [$02.b]		; 07 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	bra  64.b		; 80 40
	bra  96.b		; 80 60
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
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
	brk $02.b		; 00 02
	bra   8.b		; 80 08
	brk $FB.b		; 00 FB
	ora $E6.b		; 05 E6
	ora ($FB.b,X)		; 01 FB
	sbc $00FFE6.l,X		; FF E6 FF 00
	asl $0000.w		; 0E 00 00
	jsr ($F6FF.w,X)		; FC FF F6
	sbc $000E02.l,X		; FF 02 0E 00
	brk $0E.b		; 00 0E
	php		; 08
	ora $0D0A.w		; 0D 0A 0D
	cop $0C.b		; 02 0C
	asl A		; 0A
	jmp ($2C0A.w)		; 6C 0A 2C
	asl A		; 0A
	bit $2C0A.w		; 2C 0A 2C
	asl A		; 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $44.b		; 00 44
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	bra -96.b		; 80 A0
	cpy #$A0.b		; C0 A0
	cpy #$A0.b		; C0 A0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	stx $BA.b,Y		; 96 BA
	bit $78.b,X		; 34 78
	trb $1A.b		; 14 1A
	trb $18.b		; 14 18
	trb $38.b		; 14 38
	trb $18.b		; 14 18
	trb $1A.b		; 14 1A
	trb $00.b		; 14 00
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
	brk $2C.b		; 00 2C
	asl A		; 0A
	bit $2C0A.w		; 2C 0A 2C
	asl A		; 0A
	ldy $2C0A.w		; AC 0A 2C
	cop $2C.b		; 02 2C
	asl A		; 0A
	and $2D0A.w		; 2D 0A 2D
	phd		; 0B
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $48.b		; 00 48
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	rti		; 40

	ldy #$C0.b		; A0 C0
	ldy #$C0.b		; A0 C0
	ldy #$C0.b		; A0 C0
	ldy #$C0.b		; A0 C0
	ldy #$C0.b		; A0 C0
	ldy #$C0.b		; A0 C0
	rti		; 40

	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $18.b		; 00 18
	trb $18.b		; 14 18
	lsr $00.b		; 46 00
	jmp ($0800.w,X)		; 7C 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $42, $00		; 42 00
	jmp ($0800.w,X)		; 7C 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FD.b		; 00 FD
	ora $EF.b,S		; 03 EF
	ora ($FD.b,X)		; 01 FD
	sbc $00FFEF.l,X		; FF EF FF 00
	asl $0000.w		; 0E 00 00
	inc $FFFF.w,X		; FE FF FF
	sbc $000E02.l,X		; FF 02 0E 00
	brk $30.b		; 00 30
	brk $38.b		; 00 38
	brk $30.b		; 00 30
	tsb $F6.b		; 04 F6
	tsb $F6.b		; 04 F6
	tsb $F6.b		; 04 F6
	brk $F6.b		; 00 F6
	tsb $F6.b		; 04 F6
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	cld		; D8
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cld		; D8
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
	brk $F6.b		; 00 F6
	tsb $FE.b		; 04 FE
	tsb $F8.b		; 04 F8
	php		; 08
	sec		; 38
	brk $70.b		; 00 70
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $04.b		; 00 04
	ora ($F9.b,X)		; 01 F9
	brk $FF.b		; 00 FF
	sbc $00FFF9.l,X		; FF F9 FF 00
	asl $0000.w		; 0E 00 00
	brk $40.b		; 00 40
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra -64.b		; 80 C0
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
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sbc $F608.w,Y		; F9 08 F6
	cop $F9.b		; 02 F9
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	inc $FF.b,X		; F6 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	plx		; FA
	sbc $02FFFE.l,X		; FF FE FF 02
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	inc $03FF.w,X		; FE FF 03
	tsb $0000.w		; 0C 00 00
	ora $02.b		; 05 02
	asl A		; 0A
	tsb $08.b		; 04 08
	tsb $CD.b		; 04 CD
	brk $77.b		; 00 77
	php		; 08
	bit $D812.w		; 2C 12 D8
	rol $BE.b		; 26 BE
	eor ($04.b,X)		; 41 04
	tsb $08.b		; 04 08
	php		; 08
	php		; 08
	php		; 08
	cmp #$C9.b		; C9 C9
	and ($32.b)		; 32 32
	tsb $480C.w		; 0C 0C 48
	pha		; 48
	ldy $B4.b,X		; B4 B4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	bra  48.b		; 80 30
	brk $80.b		; 00 80
	rts		; 60

	plp		; 28
	cpy #$1D.b		; C0 1D
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	php		; 08
	jsr $8020.w		; 20 20 80
	bra   0.b		; 80 00
	brk $11.b		; 00 11
	ora ($1B.b),Y		; 11 1B
	sty $EA.b		; 84 EA
	tsb $37.b		; 04 37
	php		; 08
	asl $0061.w,X		; 1E 61 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl   8.b		; 10 08
	php		; 08
	cop $02.b		; 02 02
	adc ($61.b,X)		; 61 61
	and $00003F.l,X		; 3F 3F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	xce		; FB
	tsb $F8.b		; 04 F8
	ora ($FB.b,X)		; 01 FB
	sbc $00FFF8.l,X		; FF F8 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sed		; F8
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FC.b		; 00 FC
	sbc $020000.l,X		; FF 00 00 02
	tsb $0000.w		; 0C 00 00
	php		; 08
	bpl   0.b		; 10 00
	bpl -108.b		; 10 94
	brk $50.b		; 00 50
	pld		; 2B
	lda ($5A.b,X)		; A1 5A
	sei		; 78
	sty $F7.b		; 84 F7
	php		; 08
	rol $0010.w		; 2E 10 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	sty $10.b		; 84 10
	bpl -128.b		; 10 80
	bra 112.b		; 80 70
	bvs  18.b		; 70 12
	ora ($04.b)		; 12 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	cpy $00.b		; C4 00
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $C4.b		; C4 C4
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jsr ($FA02.w,X)		; FC 02 FA
	brk $FC.b		; 00 FC
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	brk $20.b		; 00 20
	lda ($08.b)		; B2 08
	plp		; 28
	mvp $98,$62		; 44 62 98
	pea $3000.w		; F4 00 30
	pha		; 48
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($92.b)		; 92 92
	plp		; 28
	plp		; 28
	rts		; 60

	rts		; 60

	jsr $4820.w		; 20 20 48
	pha		; 48
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $FC02.w,X		; FE 02 FC
	brk $FE.b		; 00 FE
	sbc $00FFFC.l,X		; FF FC FF 00
	tsb $0000.w		; 0C 00 00
	brk $40.b		; 00 40
	cpy #$10.b		; C0 10
	iny		; C8
	jsr $4020.w		; 20 20 40
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	cpy #$C0.b		; C0 C0
	jsr $6020.w		; 20 20 60
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	inc $FFFF.w,X		; FE FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	asl $0000.w		; 0E 00 00
	rti		; 40

	bra   0.b		; 80 00
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
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	ora [$F6.b]		; 07 F6
	cop $F8.b		; 02 F8
	sbc $00FFF6.l,X		; FF F6 FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	sed		; F8
	sbc $02FFFE.l,X		; FF FE FF 02
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	inc $03FF.w,X		; FE FF 03
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $0C.b		; 00 0C
	php		; 08
	ora $3F03.w,X		; 1D 03 3F
	asl $223E.w		; 0E 3E 22
	adc $07F920.l,X		; 7F 20 F9 07
	ora [$0F.b]		; 07 0F
	ora ($0F.b,X)		; 01 0F
	ora $1F.b,S		; 03 1F
	cop $3F.b		; 02 3F
	brk $3F.b		; 00 3F
	ora ($7F.b,X)		; 01 7F
	brk $FF.b		; 00 FF
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $60.b		; 00 60
	bra -104.b		; 80 98
	brk $D0.b		; 00 D0
	brk $3C.b		; 00 3C
	brk $A0.b		; 00 A0
	cpx #$E0.b		; E0 E0
	beq  48.b		; F0 30
	beq -80.b		; F0 B0
	sed		; F8
	tya		; 98
	jsr ($FE64.w,X)		; FC 64 FE
	rol $C2FE.w		; 2E FE C2
	inc $0C5E.w,X		; FE 5E 0C
	jsr ($F010.w,X)		; FC 10 F0
	bpl 126.b		; 10 7E
	brk $0D.b		; 00 0D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0FFF03.l,X		; FF 03 FF 0F
	adc $121F01.l,X		; 7F 01 1F 12
	adc [$77.b],Y		; 77 77
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4C.b		; 00 4C
	brk $C8.b		; 00 C8
	brk $74.b		; 00 74
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FFB2.w,X		; FE B2 FF
	and [$FE.b],Y		; 37 FE
	txa		; 8A
	sbc $FB5D.w,X		; FD 5D FB
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	plx		; FA
	tsb $F8.b		; 04 F8
	ora ($FA.b,X)		; 01 FA
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	plx		; FA
	sbc $000E01.l,X		; FF 01 0E 00
	brk $FD.b		; 00 FD
	sbc $02FFF2.l,X		; FF F2 FF 02
	asl $0000.w		; 0E 00 00
	brk $37.b		; 00 37
	clc		; 18
	ply		; 7A
	pha		; 48
	sbc $E540.w,X		; FD 40 E5
	jsr $20E2.w		; 20 E2 20
	xce		; FB
	brk $15.b		; 00 15
	brk $00.b		; 00 00
	and $057F08.l,X		; 3F 08 7F 05
	sbc $1AFF02.l,X		; FF 02 FF 1A
	sbc $04FF1D.l,X		; FF 1D FF 04
	and $FFFF2A.l,X		; 3F 2A FF FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpx #$60.b		; E0 60
	cpx #$20.b		; E0 20
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$20.b		; E0 20
	cpy #$C0.b		; C0 C0
	ldy #$A0.b		; A0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D0.b		; 00 D0
	brk $90.b		; 00 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FC2C.w,X)		; FC 2C FC
	jmp ($0001.w)		; 6C 01 00
	ora ($00.b,X)		; 01 00
	jsr ($FA03.w,X)		; FC 03 FA
	brk $FC.b		; 00 FC
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	brk $28.b		; 00 28
	brk $74.b		; 00 74
	jsr $0068.w		; 20 68 00
	jmp.w [$CA40]		; DC 40 CA
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $7E14.w,X		; 3C 14 7E
	asl A		; 0A
	adc $23FF17.l,X		; 7F 17 FF 23
	sbc $427E35.l,X		; FF 35 7E 42
	sbc $0000FF.l,X		; FF FF 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FC01.w,X		; FD 01 FC
	brk $FD.b		; 00 FD
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	brk $40.b		; 00 40
	rti		; 40

	cpy #$80.b		; C0 80
	bcs   0.b		; B0 00
	cld		; D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs  48.b		; 70 30
	sed		; F8
	sec		; 38
	sed		; F8
	pha		; 48
	sed		; F8
	jsr $F0F0.w		; 20 F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	inc $FFFF.w,X		; FE FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	asl $0000.w		; 0E 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sbc $F807.w,Y		; F9 07 F8
	tsb $F9.b		; 04 F9
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	sbc $01FF.w,X		; FD FF 01
	asl $0000.w		; 0E 00 00
	inc $F5FF.w,X		; FE FF F5
	sbc $000E02.l,X		; FF 02 0E 00
	brk $00.b		; 00 00
	tda		; 7B
	sec		; 38
	adc $7E4C.w,Y		; 79 4C 7E
	plp		; 28
	jsr ($FA08.w,X)		; FC 08 FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $067F04.l,X		; 7F 04 7F 06
	adc $03FF01.l,X		; 7F 01 FF 03
	sbc $3F3F05.l,X		; FF 05 3F 3F
	ora $15.b,X		; 15 15
	asl $A00E.w		; 0E 0E A0
	beq   0.b		; F0 00
	jsr $9000.w		; 20 00 90
	ldy #$A0.b		; A0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	php		; 08
	sed		; F8
	cld		; D8
	sed		; F8
	pla		; 68
	sed		; F8
	cli		; 58
	jsr ($EEFC.w,X)		; FC FC EE
	inc $9A9A.w		; EE 9A 9A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	bpl 120.b		; 10 78
	phy		; 5A
	inc $F838.w,X		; FE 38 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	bit $7E04.w,X		; 3C 04 7E
	asl $FF.b		; 06 FF
	ora ($FF.b,X)		; 01 FF
	ora [$03.b]		; 07 03
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	tsb $F9.b		; 04 F9
	ora $FA.b,S		; 03 FA
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	jsr ($01FF.w,X)		; FC FF 01
	asl $0000.w		; 0E 00 00
	sbc $FFF4FF.l,X		; FF FF F4 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	ora [$0F.b]		; 07 0F
	cop $77.b		; 02 77
	bmi 112.b		; 30 70
	cli		; 58
	ror $FA32.w,X		; 7E 32 FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $087F00.l		; 0F 00 7F 08
	adc $017F0F.l,X		; 7F 0F 7F 01
	sbc $3F3F05.l,X		; FF 05 3F 3F
	asl A		; 0A
	asl A		; 0A
	trb $001C.w		; 1C 1C 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	rti		; 40

	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	cpy #$C0.b		; C0 C0
	cpy #$40.b		; C0 40
	cpx #$E0.b		; E0 E0
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	rti		; 40

	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	rts		; 60

	bvs  16.b		; 70 10
	beq  16.b		; F0 10
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jsr ($FB03.w,X)		; FC 03 FB
	cop $FC.b		; 02 FC
	sbc $00FFFB.l,X		; FF FB FF 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	asl $1E.b,X		; 16 1E
	brk $7E.b		; 00 7E
	jsr $6072.w		; 20 72 60
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	tsb $1E.b		; 04 1E
	cop $1E.b		; 02 1E
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
	tsb $1EFE.w		; 0C FE 1E
	adc $307D.w,X		; 7D 7D 30
	bmi   1.b		; 30 01
	brk $01.b		; 00 01
	brk $FD.b		; 00 FD
	ora ($FD.b,X)		; 01 FD
	ora ($FD.b,X)		; 01 FD
	sbc $00FFFD.l,X		; FF FD FF 00
	asl $0000.w		; 0E 00 00
	brk $10.b		; 00 10
	bmi  48.b		; 30 30
	rti		; 40

	cpy #$40.b		; C0 40
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $38.b		; 00 38
	php		; 08
	sed		; F8
	sec		; 38
	sed		; F8
	sec		; 38
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $FF00.w		; 0D 00 FF
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	asl $0000.w		; 0E 00 00
	rti		; 40

	rti		; 40

	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	xce		; FB
	ora [$F6.b]		; 07 F6
	ora ($FB.b,X)		; 01 FB
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	inc $FF.b,X		; F6 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	sbc $FEFF.w,X		; FD FF FE
	sbc $000E02.l,X		; FF 02 0E 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000E03.l,X		; FF 03 0E 00
	brk $02.b		; 00 02
	cop $04.b		; 02 04
	tsb $05.b		; 04 05
	tsb $64.b		; 04 64
	stz $19.b		; 64 19
	ora $0606.w,Y		; 19 06 06
	and [$36.b],Y		; 37 36
	xce		; FB
	phx		; DA
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	rol $26.b		; 26 26
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	rti		; 40

	brk $C0.b		; 00 C0
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
	brk $BA.b		; 00 BA
	bpl -54.b		; 10 CA
	php		; 08
	ror $BD00.w		; 6E 00 BD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	ora $F8.b,S		; 03 F8
	brk $FC.b		; 00 FC
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $0000.w		; 0C 00 00
	sbc $00FF.w,X		; FD FF 00
	brk $01.b		; 00 01
	asl $0000.w		; 0E 00 00
	bpl  16.b		; 10 10
	trb $10.b		; 14 10
	cmp ($D2.b)		; D2 D2
	inc A		; 1A
	clc		; 18
	ror $EE78.w,X		; 7E 78 EE
	tay		; A8
	pla		; 68
	php		; 08
	and $0C00.w		; 2D 00 0C
	tsb $0808.w		; 0C 08 08
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldx $0000.w,Y		; BE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FD.b		; 00 FD
	ora $FA.b,S		; 03 FA
	brk $FD.b		; 00 FD
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	jsr $A820.w		; 20 20 A8
	tay		; A8
	plp		; 28
	jsr $6070.w		; 20 70 60
	plp		; 28
	jsr $005C.w		; 20 5C 00
	rol $00.b,X		; 36 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $01.b		; 02 01
	jsr ($FEFF.w,X)		; FC FF FE
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	rts		; 60

	rti		; 40

	rti		; 40

	rti		; 40

	cpy #$40.b		; C0 40
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	inc $FFFF.w,X		; FE FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	asl $0000.w		; 0E 00 00
	bra -128.b		; 80 80
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
	ora [$80.b]		; 07 80
	trb $EB00.w		; 1C 00 EB
	ora ($D6.b)		; 12 D6
	ora $03.b		; 05 03
	brk $DC.b		; 00 DC
	sbc $000E00.l,X		; FF 00 0E 00
	brk $03.b		; 00 03
	brk $EC.b		; 00 EC
	sbc $000E02.l,X		; FF 02 0E 00
	brk $03.b		; 00 03
	brk $FE.b		; 00 FE
	sbc $000E04.l,X		; FF 04 0E 00
	brk $F3.b		; 00 F3
	sbc $06FFD6.l,X		; FF D6 FF 06
	asl $0000.w		; 0E 00 00
	sbc ($FF.b,S),Y		; F3 FF
	inc $FF.b		; E6 FF
	php		; 08
	asl $0000.w		; 0E 00 00
	sbc ($FF.b,S),Y		; F3 FF
	inc $FF.b,X		; F6 FF
	asl A		; 0A
	asl $0000.w		; 0E 00 00
	sbc $FF.b,S		; E3 FF
	nop		; EA
	sbc $000E0C.l,X		; FF 0C 0E 00
	brk $08.b		; 00 08
	php		; 08
	php		; 08
	php		; 08
	bit $167C.w,X		; 3C 7C 16
	inc $E808.w,X		; FE 08 E8
	brk $80.b		; 00 80
	asl A		; 0A
	ror $50F0.w,X		; 7E F0 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tad		; 5B
	jsr ($E7E7.w,X)		; FC E7 E7
	cpy #$C0.b		; C0 C0
	cpx #$BE.b		; E0 BE
	ora $7FD8E0.l,X		; 1F E0 D8 7F
	jmp ($1B03.w,X)		; 7C 03 1B
	sbc $03.b,X		; F5 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	cpx #$80.b		; E0 80
	rti		; 40

	cpx #$E0.b		; E0 E0
	bit $30.b,X		; 34 30
	asl $6410.w		; 0E 10 64
	tya		; 98
	rts		; 60

	beq  -8.b		; F0 F8
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $E060.w		; 20 60 E0
	rti		; 40

	cpx #$C0.b		; E0 C0
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $F07272.l,X		; 3F 72 72 F0
	beq  -4.b		; F0 FC
	jsr ($E0E0.w,X)		; FC E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcc -112.b		; 90 90
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
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $04.b		; 00 04
	inc A		; 1A
	asl $0606.w		; 0E 06 06
	asl $03.b		; 06 03
	tsb $03.b		; 04 03
	bit $2407.w		; 2C 07 24
	ora $64.b,S		; 03 64
	.db $42, $00		; 42 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $30.b		; 00 30
	ora $007910.l,X		; 1F 10 79 00
	ora $00.b,S		; 03 00
	brk $4C.b		; 00 4C
	sbc ($B1.b),Y		; F1 B1
	stx $73A1.w		; 8E A1 73
	lsr $CE.b		; 46 CE
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	jsr ($C708.w,X)		; FC 08 C7
	bmi  47.b		; 30 2F
	rti		; 40

	inc $E2.b,X		; F6 E2
	cpx $FF.b		; E4 FF
	eor ($42.b,X)		; 41 42
	cmp $003F00.l		; CF 00 3F 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	tsb $1E.b		; 04 1E
	adc $FE.b,S		; 63 FE
	rol $79.b		; 26 79
	dey		; 88
	and ($00.b,S),Y		; 33 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	clc		; 18
	brk $71.b		; 00 71
	brk $33.b		; 00 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $98.b		; 00 98
	inc $FF70.w,X		; FE 70 FF
	eor $A67B.w,X		; 5D 7B A6
	inx		; E8
	stx $88.b		; 86 88
	asl $08.b		; 06 08
	asl $08.b		; 06 08
	asl $19.b		; 06 19
	rti		; 40

	brk $00.b		; 00 00
	brk $04.b		; 00 04
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
	brk $1E.b		; 00 1E
	ora ($1C.b),Y		; 11 1C
	ora $003808.l		; 0F 08 38 00
	ora ($20.b,X)		; 01 20
	brk $FC.b		; 00 FC
	mvp $0C,$1F		; 44 1F 0C
	asl $0F.b		; 06 0F
	tsb $1000.w		; 0C 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $B8.b		; 00 B8
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $CE.b		; 00 CE
	phd		; 0B
	eor $FD.b,S		; 43 FD
	trb $0873.w		; 1C 73 08
	adc $1C08.w,Y		; 79 08 1C
	brk $00.b		; 00 00
	and $3FE000.l,X		; 3F 00 E0 3F
	tsb $00.b		; 04 00
	cop $00.b		; 02 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	bra -16.b		; 80 F0
	cpy #$00.b		; C0 00
	bra  16.b		; 80 10
	cpx #$20.b		; E0 20
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $70.b		; 00 70
	ldx $EF0C.w		; AE 0C EF
	cmp [$37.b]		; C7 37
	eor ($E9.b),Y		; 51 E9
	and $3EEE.w,Y		; 39 EE 3E
	and $4345.w,Y		; 39 45 43
	brk $02.b		; 00 02
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	php		; 08
	bne   6.b		; D0 06
	beq  36.b		; F0 24
	tsa		; 3B
	plx		; FA
	inc A		; 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dey		; 88
	brk $06.b		; 00 06
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	ora ($07.b,X)		; 01 07
	ora [$00.b]		; 07 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	ora $00.b,S		; 03 00
	ora ($1F.b,X)		; 01 1F
	tsb $03.b		; 04 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $A4.b		; 00 A4
.INDEX 16
	rep #$D8		; C2 D8
	stz $54.b		; 64 54
	sbc ($10.b,X)		; E1 10
	and $970C12.l		; 2F 12 0C 97
	asl A		; 0A
	cmp ($EC.b,S),Y		; D3 EC
	tax		; AA
	stz $04.b,X		; 74 04
	brk $88.b		; 00 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $85.b		; 00 85
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	asl $0D05.w,X		; 1E 05 0D
	ora $01F100.l		; 0F 00 F1 01
	sbc $7B8380.l,X		; FF 80 83 7B
	asl $C3.b		; 06 C3
	bit $0007.w,X		; 3C 07 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	eor $20FF.w,Y		; 59 FF 20
	cpy $03.b		; C4 03
	adc $F68F00.l,X		; 7F 00 8F F6
	jmp $58FCA5.l		; 5C A5 FC 58
	and ($7E.b,X)		; 21 7E
	jsl $00C000.l		; 22 00 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $58.b		; 00 58
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
	brk $0F.b		; 00 0F
	ora $007373.l		; 0F 73 73 00
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	brk $06.b		; 00 06
	eor $653E.w,X		; 5D 3E 65
	tyx		; BB
	lda ($3B.b,X)		; A1 3B
	lda ($3A.b,X)		; A1 3A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	brk $08.b		; 00 08
	brk $4C.b		; 00 4C
	brk $44.b		; 00 44
	brk $C5.b		; 00 C5
	cpy $7F.b		; C4 7F
	adc $1F7E7E.l,X		; 7F 7E 7E 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0F.b,S		; 03 0F
	brk $14.b		; 00 14
	ora $1A147C.l,X		; 1F 7C 14 1A
	asl A		; 0A
	bpl   0.b		; 10 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pla		; 68
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	bra  20.b		; 80 14
	brk $F0.b		; 00 F0
	asl $04DF.w		; 0E DF 04
	beq  -1.b		; F0 FF
	sbc $FF.b,X		; F5 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	sbc $FF.b		; E5 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF.b		; E5 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sbc $D5FF.w,X		; FD FF D5
	sbc $000E08.l,X		; FF 08 0E 00
	brk $1E.b		; 00 1E
	ora ($20.b,X)		; 01 20
	and $3820F0.l,X		; 3F F0 20 38
	clc		; 18
	ora $0C.b,S		; 03 0C
	ora ($02.b,X)		; 01 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bne   0.b		; D0 00
	jsr $0000.w		; 20 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $15.b		; 00 15
	phx		; DA
	and $37E215.l,X		; 3F 15 E2 37
	ora $F52F.w,Y		; 19 2F F5
	and [$CA.b],Y		; 37 CA
	lsr $0898.w		; 4E 98 08
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	asl A		; 0A
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $90.b		; 00 90
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	lda $1B8C.w,X		; BD 8C 1B
	and $DB.b,S		; 23 DB
	ora ($CD.b),Y		; 11 CD
	ldx $CF7B.w		; AE 7B CF
	asl $00C1.w		; 0E C1 00
	cpy #$0200.w		; C0 00 02
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	brk $C1.b		; 00 C1
	brk $C1.b		; 00 C1
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	cpy #$0000.w		; C0 00 00
	brk $C0.b		; 00 C0
	dey		; 88
	cpx #$1A94.w		; E0 94 1A
	ply		; 7A
	txa		; 8A
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pha		; 48
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
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1A.b		; 00 1A
	tsb $3E35.w		; 0C 35 3E
	ora ($02.b,X)		; 01 02
	ora ($00.b),Y		; 11 00
	ora #$10.b		; 09 10
	plx		; FA
	and [$80.b]		; 27 80
	sbc $10CC80.l,X		; FF 80 CC 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	eor $003A82.l		; 4F 82 3A 00
	beq  66.b		; F0 42
	sta $4044FC.l		; 8F FC 44 40
	sta $028C47.l,X		; 9F 47 8C 02
	inc $0080.w		; EE 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clv		; B8
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	cpx #$C000.w		; E0 00 C0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $05.b		; 00 05
	ora $06.b,S		; 03 06
	phd		; 0B
	asl A		; 0A
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	stz $079C.w		; 9C 9C 07
	ora [$17.b]		; 07 17
	ora [$01.b],Y		; 17 01
	ora ($C0.b,X)		; 01 C0
	jsr $A8C0.w		; 20 C0 A8
	iny		; C8
	clv		; B8
	rts		; 60

	sec		; 38
	rti		; 40

	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $AC.b		; 00 AC
	sty $FCFC.w		; 8C FC FC
	cmp $F8F8DF.l,X		; DF DF F8 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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

	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $3227.w,Y		; 39 27 32
	asl $7112.w,X		; 1E 12 71
	ora ($07.b,X)		; 01 07
	beq -128.b		; F0 80
	bit $0B10.w,X		; 3C 10 0B
	trb $0000.w		; 1C 00 00
	bpl   0.b		; 10 00
	jsr $0200.w		; 20 00 02
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora ($6E.b)		; 12 6E
	stx $748F.w		; 8E 8F 74
	tsb $9C.b		; 04 9C
	bmi 115.b		; 30 73
	and $007C62.l		; 2F 62 7C 00
	sta [$00.b]		; 87 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	dey		; 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	sbc [$4F.b]		; E7 4F
	bra  -8.b		; 80 F8
	and $19FF46.l		; 2F 46 FF 19
	sbc $1FF8.w,Y		; F9 F8 1F
	sta [$78.b]		; 87 78
	inc $0F.b,X		; F6 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bra   0.b		; 80 00
	rti		; 40

	bra -128.b		; 80 80
	bvs -64.b		; 70 C0
	ldy #$1014.w		; A0 14 10
	stx $3400.w		; 8E 00 34
	iny		; C8
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	rti		; 40

	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $28.b		; 00 28
	clc		; 18
	clc		; 18
	clc		; 18
	clc		; 18
	tsb $1C50.w		; 0C 50 1C
	bvc  12.b		; 50 0C
	bne -120.b		; D0 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
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
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	pea $E70A.w		; F4 0A E7
	cop $F4.b		; 02 F4
	sbc $00FFE7.l,X		; FF E7 FF 00
	asl $0000.w		; 0E 00 00
	tsb $00.b		; 04 00
	sbc [$FF.b]		; E7 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	sbc [$FF.b],Y		; F7 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc [$FF.b],Y		; F7 FF
	asl $0E.b		; 06 0E
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   8.b		; 10 08
	php		; 08
	tsb $28.b		; 04 28
	tsb $0428.w		; 0C 28 04
	sbc #$41.b		; E9 41
	tya		; 98
	sbc [$10.b]		; E7 10
	rol $805F.w		; 2E 5F 80
	bpl   0.b		; 10 00
	php		; 08
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $88.b		; 00 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4F.b		; 00 4F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$8080.w		; C0 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc ($0D.b),Y		; 71 0D
	sta $F9.b,S		; 83 F9
	sbc ($62.b,X)		; E1 62
	ora $100C23.l,X		; 1F 23 0C 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	tsb $00.b		; 04 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	dec $27F2.w,X		; DE F2 27
	ldy $F2.b		; A4 F2
	tsa		; 3B
	adc $10C3D3.l		; 6F D3 C3 10
	brk $10.b		; 00 10
	plp		; 28
	adc ($5E.b)		; 72 5E
	and ($00.b,X)		; 21 00
	cpy #$0000.w		; C0 00 00
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	cpy #$8000.w		; C0 00 80
	iny		; C8
	cpx #$9C50.w		; E0 50 9C
	ldy $004C.w,X		; BC 4C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
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
	brk $03.b		; 00 03
	ora ($02.b,X)		; 01 02
	asl $00.b		; 06 00
	brk $75.b		; 00 75
	lsr $6628.w		; 4E 28 66
	ora $0D.b		; 05 0D
	sbc ($81.b,X)		; E1 81
	asl $0230.w,X		; 1E 30 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	tsa		; 3B
	brk $4D.b		; 00 4D
	bmi -84.b		; 30 AC
	adc ($68.b,X)		; 61 68
	brk $CF.b		; 00 CF
	sta $BF.b,S		; 83 BF
	adc $013E23.l,X		; 7F 23 3E 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $38.b		; 00 38
	beq -128.b		; F0 80
	clv		; B8
	dey		; 88
	cpy #$00E0.w		; C0 E0 00
	ldy #$60D8.w		; A0 D8 60
	bvs   8.b		; 70 08
	iny		; C8
	tya		; 98
	cpx $08.b		; E4 08
	brk $00.b		; 00 00
	brk $08.b		; 00 08
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
	brk $0D.b		; 00 0D
	ora $0101.w		; 0D 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inx		; E8
	dec $0460.w		; CE 60 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	txs		; 9A
	sta ($77.b)		; 92 77
	adc [$3E.b],Y		; 77 3E
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
	jsr $8020.w		; 20 20 80
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
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $F8.b		; 00 F8
	asl $F0.b		; 06 F0
	cop $F9.b		; 02 F9
	sbc $00FFF0.l,X		; FF F0 FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	beq  -1.b		; F0 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	sed		; F8
	sbc $02FFF8.l,X		; FF F8 FF 02
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sed		; F8
	sbc $000E03.l,X		; FF 03 0E 00
	brk $FE.b		; 00 FE
	sbc $040000.l,X		; FF 00 00 04
	asl $0000.w		; 0E 00 00
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	tsb $05.b		; 04 05
	asl $0B0C.w		; 0E 0C 0B
	brk $19.b		; 00 19
	asl $00.b		; 06 00
	and $B5.b,X		; 35 B5
	stz $00.b		; 64 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rts		; 60

	clc		; 18
	beq   0.b		; F0 00
	cli		; 58
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	dec $C3.b,X		; D6 C3
	php		; 08
	ora ($60.b,S),Y		; 13 60
	ora [$77.b]		; 07 77
	eor $43.b		; 45 43
	clc		; 18
	asl A		; 0A
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	rep #$00		; C2 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$C6FC.w		; A0 FC C6
	stz $E6.b,X		; 74 E6
	sec		; 38
	jsr $5050.w		; 20 50 50
	clv		; B8
	ldy $8020.w,X		; BC 20 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $20.b		; 00 20
	brk $08.b		; 00 08
	brk $90.b		; 00 90
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	sed		; F8
	bvs 112.b		; 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $F902.w,X		; FD 02 F9
	brk $FC.b		; 00 FC
	sbc $00FFF9.l,X		; FF F9 FF 00
	asl $0000.w		; 0E 00 00
	bmi  40.b		; 30 28
	jsl $A4981C.l		; 22 1C 98 A4
	ldy $88.b		; A4 88
	sty $3C.b		; 84 3C
	brk $00.b		; 00 00
	bpl   8.b		; 10 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	sbc ($0D.b)		; F2 0D
	jmp.w [$F205]		; DC 05 F2
	sbc $00FFF6.l,X		; FF F6 FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	inc $FF.b,X		; F6 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	inc $FF.b		; E6 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	inc $FF.b		; E6 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sed		; F8
	sbc $08FFD6.l,X		; FF D6 FF 08
	asl $0000.w		; 0E 00 00
	adc $007F00.l,X		; 7F 00 7F 00
	ora $00.b,S		; 03 00
	rol $1FC3.w,X		; 3E C3 1F
	and $1F.b		; 25 1F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $47.b		; 00 47
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $12.b		; 00 12
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	and $FF06F9.l,X		; 3F F9 06 FF
	brk $01.b		; 00 01
	asl $1A.b		; 06 1A
	inc $DE.b		; E6 DE
	and [$F7.b]		; 27 F7
	brk $77.b		; 00 77
	brk $C0.b		; 00 C0
	brk $61.b		; 00 61
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	sed		; F8
	inc $F800.w,X		; FE 00 F8
	ora ($CC.b,X)		; 01 CC
	ora $0FF80F.l,X		; 1F 0F F8 0F
	cpy #$00BC.w		; C0 BC 00
	clv		; B8
	brk $02.b		; 00 02
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$6080.w		; C0 80 60
	bcs   0.b		; B0 00
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
	sec		; 38
	brk $1E.b		; 00 1E
	rts		; 60

	bit $1F.b		; 24 1F
	ora $000706.l,X		; 1F 06 07 00
	tsa		; 3B
	brk $7D.b		; 00 7D
	ora [$1E.b]		; 07 1E
	ora $20.b,S		; 03 20
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	brk $01.b		; 00 01
	brk $38.b		; 00 38
	brk $68.b		; 00 68
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $3B.b		; 00 3B
	tsb $32.b		; 04 32
	asl $E7.b		; 06 E7
	rol $DF.b,X		; 36 DF
	jsr $00CF.w		; 20 CF 00
	tya		; 98
	asl $78.b		; 06 78
	sta [$DC.b]		; 87 DC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $1F.b		; 00 1F
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
	brk $C6.b		; 00 C6
	ora ($18.b,X)		; 01 18
	ora [$C0.b]		; 07 C0
	bit $8078.w,X		; 3C 78 80
	rts		; 60

	ora $FF7803.l		; 0F 03 78 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C6.b		; 00 C6
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	rts		; 60

	rts		; 60

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	trb $0B.b		; 14 0B
	phd		; 0B
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	cop $04.b		; 02 04
	cop $04.b		; 02 04
	cop $04.b		; 02 04
	ora [$0C.b]		; 07 0C
	ora $000030.l		; 0F 30 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	sbc $407FF0.l,X		; FF F0 7F 40
	sbc $3E3EFF.l,X		; FF FF 3E 3E
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
	brk $DD.b		; 00 DD
	cmp $3AFA.w,X		; DD FA 3A
	cpx #$80E0.w		; E0 E0 80
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
	brk $03.b		; 00 03
	brk $06.b		; 00 06
	bmi   7.b		; 30 07
	asl $0F38.w,X		; 1E 38 0F
	sec		; 38
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	bra  -4.b		; 80 FC
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $0D.b		; 00 0D
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	brk $E7.b		; 00 E7
	php		; 08
	ora $00FE00.l,X		; 1F 00 FE 00
	jsr ($6F03.w,X)		; FC 03 6F
	bmi  -9.b		; 30 F7
	trb $0EF1.w		; 1C F1 0E
	inc A		; 1A
	asl $A6.b		; 06 A6
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $4F.b		; 00 4F
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $DB.b		; 00 DB
	brk $CC.b		; 00 CC
	ora ($DB.b,S),Y		; 13 DB
	stz $E6.b,X		; 74 E6
	jsr $00F8.w		; 20 F8 00
	cld		; D8
	brk $00.b		; 00 00
	ora $000004.l		; 0F 04 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$8040.w		; E0 40 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	cpx #$8000.w		; E0 00 80
	bvs   0.b		; 70 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	ora ($02.b,X)		; 01 02
	ora ($00.b,X)		; 01 00
	clc		; 18
	ora ($3E.b,X)		; 01 3E
	cmp ($DE.b,X)		; C1 DE
	and ($C1.b,X)		; 21 C1
	ora $01013E.l		; 0F 3E 01 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	sta $0E90EE.l		; 8F EE 90 0E
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	sbc $09.b,X		; F5 09
	cpx $04.b		; E4 04
	sbc $FF.b,X		; F5 FF
	cpx $FF.b		; E4 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	cpx $FF.b		; E4 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	pea $04FF.w		; F4 FF 04
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	pea $06FF.w		; F4 FF 06
	asl $0000.w		; 0E 00 00
	jsr ($04FF.w,X)		; FC FF 04
	brk $08.b		; 00 08
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $0C.b,S		; 03 0C
	ora $0C02.w		; 0D 02 0C
	ora ($63.b,X)		; 01 63
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	brk $70.b		; 00 70
	brk $30.b		; 00 30
	rti		; 40

	bmi  64.b		; 30 40
	jsr $E000.w		; 20 00 E0
	brk $F8.b		; 00 F8
	and $3B.b,S		; 23 3B
	cpx $FC.b		; E4 FC
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
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
	brk $63.b		; 00 63
	trb $0161.w		; 1C 61 01
	ora $0CF000.l,X		; 1F 00 F0 0C
	inc $FF01.w,X		; FE 01 FF
	brk $78.b		; 00 78
	sty $573C.w		; 8C 3C 57
	eor ($00.b,X)		; 41 00
	rts		; 60

	brk $0C.b		; 00 0C
	brk $F0.b		; 00 F0
	brk $9E.b		; 00 9E
	brk $0D.b		; 00 0D
	brk $70.b		; 00 70
	brk $28.b		; 00 28
	brk $CF.b		; 00 CF
	rol $7C.b,X		; 36 7C
	bra -97.b		; 80 9F
	rts		; 60

	cpx #$2021.w		; E0 21 20
	sbc $1D20DF.l,X		; FF DF 20 1D
	and $E1.b,S		; 23 E1
	and $7C00C0.l		; 2F C0 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	bra -128.b		; 80 80
	brk $20.b		; 00 20
	clc		; 18
	brk $F0.b		; 00 F0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	ldy #$E8D8.w		; A0 D8 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	pea $0000.w		; F4 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $51C0.w,Y		; 39 C0 51
	bit $193F.w,X		; 3C 3F 19
	ror $F600.w		; 6E 00 F6
	trb $0E39.w		; 1C 39 0E
	clc		; 18
	rts		; 60

	ora $002038.l,X		; 1F 38 20 00
	brk $00.b		; 00 00
	rol $00.b		; 26 00
	rts		; 60

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $A3.b		; 00 A3
	jsr $A33C.w		; 20 3C A3
	stz $01.b,X		; 74 01
	cpy #$CF27.w		; C0 27 CF
	bmi  -1.b		; 30 FF
	brk $ED.b		; 00 ED
	cop $00.b		; 02 00
	brk $03.b		; 00 03
	brk $1C.b		; 00 1C
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	cli		; 58
	clc		; 18
	cpy #$8000.w		; C0 00 80
	brk $C0.b		; 00 C0
	rts		; 60

	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	sec		; 38
	bcc  96.b		; 90 60
	jsr $0000.w		; 20 00 00
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
	brk $3E.b		; 00 3E
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $33.b		; 00 33
	and ($0D.b,S),Y		; 33 0D
	tsb $0707.w		; 0C 07 07
	sbc ($3C.b,X)		; E1 3C
	tyx		; BB
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	rti		; 40

	jmp ($0080.w,X)		; 7C 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $FF.b		; 00 FF
	sta $FC03FF.l		; 8F FF 03 FC
	jsr ($00E0.w,X)		; FC E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F8.b		; 00 F8
	ora [$EB.b]		; 07 EB
	ora $F8.b,S		; 03 F8
	sbc $00FFEB.l,X		; FF EB FF 00
	asl $0000.w		; 0E 00 00
	sbc $FBFF.w,Y		; F9 FF FB
	sbc $000E02.l,X		; FF 02 0E 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	ora ($0E.b,X)		; 01 0E
	ora ($11.b),Y		; 11 11
	ora [$4F.b]		; 07 4F
	brk $76.b		; 00 76
	sta ($7D.b,X)		; 81 7D
	and [$00.b],Y		; 37 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $0B.b		; 00 0B
	brk $40.b		; 00 40
	brk $48.b		; 00 48
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $C6.b		; 00 C6
	brk $C8.b		; 00 C8
	ora [$C0.b]		; 07 C0
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$3F00.w		; C0 00 3F
	brk $E4.b		; 00 E4
	phy		; 5A
	inc $0B.b,X		; F6 0B
	ora $020000.l		; 0F 00 00 02
	brk $02.b		; 00 02
	ora $02.b,S		; 03 02
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $DF.b		; 00 DF
	jmp.w [$1F1F]		; DC 1F 1F
	cpx #$3A0C.w		; E0 0C 3A
	cpx #$8038.w		; E0 38 80
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	clv		; B8
	cpy #$59C0.w		; C0 C0 59
	brk $EA.b		; 00 EA
	and ($1D.b),Y		; 31 1D
	brk $3F.b		; 00 3F
	bvs  79.b		; 70 4F
	bmi  63.b		; 30 3F
	ora $E2.b,S		; 03 E2
	ora ($F9.b),Y		; 11 F9
	ora [$41.b]		; 07 41
	brk $80.b		; 00 80
	brk $0D.b		; 00 0D
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $2C.b		; 00 2C
	brk $E0.b		; 00 E0
	brk $B8.b		; 00 B8
	brk $A0.b		; 00 A0
	trb $3004.w		; 1C 04 30
	sed		; F8
	brk $5A.b		; 00 5A
	tsb $54.b		; 04 54
	tay		; A8
	sbc ($00.b,S),Y		; F3 00
	brk $1E.b		; 00 1E
	php		; 08
	beq   0.b		; F0 00
	brk $00.b		; 00 00
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
	brk $0E.b		; 00 0E
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	xce		; FB
	tsb $F2.b		; 04 F2
	ora ($FB.b,X)		; 01 FB
	sbc $00FFF2.l,X		; FF F2 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc ($FF.b)		; F2 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	xce		; FB
	sbc $02FFFA.l,X		; FF FA FF 02
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	plx		; FA
	sbc $000E03.l,X		; FF 03 0E 00
	brk $0C.b		; 00 0C
	brk $10.b		; 00 10
	php		; 08
	bit $0B.b,X		; 34 0B
	stz $7C00.w		; 9C 00 7C
	tad		; 5B
	ldx $3F01.w		; AE 01 3F
	brk $79.b		; 00 79
	rti		; 40

	php		; 08
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $88.b		; 00 88
	brk $24.b		; 00 24
	brk $88.b		; 00 88
	brk $19.b		; 00 19
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	php		; 08
	sbc #$1E.b		; E9 1E
	rol $6900.w,X		; 3E 00 69
	trb $0008.w		; 1C 08 00
	brk $08.b		; 00 08
	tsb $0010.w		; 0C 10 00
	brk $70.b		; 00 70
	brk $60.b		; 00 60
	brk $0C.b		; 00 0C
	brk $21.b		; 00 21
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $3E.b		; 00 3E
	jsl $401818.l		; 22 18 18 40
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	ora ($F9.b,X)		; 01 F9
	brk $FE.b		; 00 FE
	sbc $00FFF9.l,X		; FF F9 FF 00
	asl $0000.w		; 0E 00 00
	rti		; 40

	brk $60.b		; 00 60
	brk $20.b		; 00 20
	bpl -48.b		; 10 D0
	bra -112.b		; 80 90
	rts		; 60

	bcc  96.b		; 90 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	ora $3480.w		; 0D 80 34
	brk $E9.b		; 00 E9
	trb $B7.b		; 14 B7
	asl $F4.b		; 06 F4
	sbc $00FFB7.l,X		; FF B7 FF 00
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	lda [$FF.b],Y		; B7 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	cmp [$FF.b]		; C7 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp [$FF.b]		; C7 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	cmp [$FF.b]		; C7 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	sbc #$FF.b		; E9 FF
	cmp [$FF.b],Y		; D7 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	sbc $D7FF.w,Y		; F9 FF D7
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $09.b		; 00 09
	brk $D7.b		; 00 D7
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $EA.b		; 00 EA
	sbc $20FFE7.l,X		; FF E7 FF 20
	tsb $0000.w		; 0C 00 00
	plx		; FA
	sbc $22FFE7.l,X		; FF E7 FF 22
	tsb $0000.w		; 0C 00 00
	asl A		; 0A
	brk $E7.b		; 00 E7
	sbc $000C24.l,X		; FF 24 0C 00
	brk $F3.b		; 00 F3
	sbc $26FFF7.l,X		; FF F7 FF 26
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	sbc [$FF.b],Y		; F7 FF
	plp		; 28
	tsb $0000.w		; 0C 00 00
	ora $03.b,S		; 03 03
	ora $07.b,S		; 03 07
	ora $07.b,S		; 03 07
	brk $01.b		; 00 01
	rti		; 40

	adc $717F40.l,X		; 7F 40 7F 71
	ror $3E3F.w,X		; 7E 3F 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $CF.b		; 00 CF
	ora $FC.b,S		; 03 FC
	rol $80.b,X		; 36 80
	bmi -61.b		; 30 C3
	ora $FC.b,S		; 03 FC
	ldx #$007F.w		; A2 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sec		; 38
	brk $3C.b		; 00 3C
	brk $03.b		; 00 03
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	sei		; 78
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
	ora $1F1C1F.l,X		; 1F 1F 1C 1F
	brk $1F.b		; 00 1F
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	ora ($01.b,X)		; 01 01
	ora $F9FE1F.l,X		; 1F 1F FE F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	inc $FC9D.w,X		; FE 9D FC
	sbc $1C0FF7.l,X		; FF F7 0F 1C
	cmp $917E.w,X		; DD 7E 91
	tsa		; 3B
	cpy $0F.b		; C4 0F
	beq  64.b		; F0 40
	bcs   0.b		; B0 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	jsl $006E01.l		; 22 01 6E 00
	tsa		; 3B
	brk $0F.b		; 00 0F
	brk $4F.b		; 00 4F
	ror $E0FF.w,X		; 7E FF E0
	sbc $7EF08F.l,X		; FF 8F F0 7E
	bra  56.b		; 80 38
	ora [$80.b]		; 07 80
	and $C03D82.l,X		; 3F 82 3D C0
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $007900.l		; 0F 00 79 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	cpy #$8030.w		; C0 30 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpx #$EC00.w		; E0 00 EC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ror $017F.w,X		; 7E 7F 01
	adc $000000.l,X		; 7F 00 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0F3300.l,X		; FF 00 33 0F
	beq -16.b		; F0 F0
	sbc ($A0.b,S),Y		; F3 A0
	lda $0CFEC9.l,X		; BF C9 FE 0C
	sbc ($0C.b,S),Y		; F3 0C
	lda ($00.b,S),Y		; B3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $000C00.l		; 0F 00 0C 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $E0F3.w		; 0C F3 E0
	ora $04.b,S		; 03 04
	and [$77.b],Y		; 37 77
	sta [$47.b]		; 87 47
	lda [$86.b],Y		; B7 86
	bvs   0.b		; 70 00
	sbc $00DF20.l,X		; FF 20 DF 00
	tsb $FC00.w		; 0C 00 FC
	brk $C8.b		; 00 C8
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	ora [$08.b]		; 07 08
	ora [$E0.b]		; 07 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$79C7.w		; C0 C7 79
	adc $32053E.l,X		; 7F 3E 05 32
	and $C000.w		; 2D 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	tsb $DAF3.w		; 0C F3 DA
	and ($D8.b,X)		; 21 D8
	jsr $FF00.w		; 20 00 FF
	brk $FF.b		; 00 FF
	cmp $C03F20.l,X		; DF 20 3F C0
	ora $FA.b		; 05 FA
	brk $0C.b		; 00 0C
	brk $06.b		; 00 06
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $04.b		; 00 04
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	rts		; 60

	bcc -32.b		; 90 E0
	bpl -64.b		; 10 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $3C0300.l,X		; 1F 00 03 3C
	bit $FF0F.w,X		; 3C 0F FF
	brk $FF.b		; 00 FF
	ora $7E0020.l,X		; 1F 20 00 7E
	ora $7C.b,S		; 03 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	beq -29.b		; F0 E3
	adc $80E2.w,X		; 7D E2 80
	sbc $E7FF80.l,X		; FF 80 FF E7
	clc		; 18
	beq   8.b		; F0 08
	ror $81.b,X		; 76 81
	sbc ($02.b),Y		; F1 02
	brk $1C.b		; 00 1C
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A7.b		; 00 A7
	brk $07.b		; 00 07
	brk $18.b		; 00 18
	brk $3C.b		; 00 3C
	cpx #$0000.w		; E0 00 00
	clc		; 18
	brk $F8.b		; 00 F8
	clc		; 18
	cpx #$1E80.w		; E0 80 1E
	brk $7E.b		; 00 7E
	jsr $80DC.w		; 20 DC 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $E0.b		; 00 E0
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
	sec		; 38
	cmp ($00.b,X)		; C1 00
	cmp [$00.b]		; C7 00
	adc $1E7F06.l,X		; 7F 06 7F 1E
	ora $10001F.l,X		; 1F 1F 00 10
	ora ($00.b,X)		; 01 00
	adc $003E00.l,X		; 7F 00 3E 00
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	ora $E41BB0.l		; 0F B0 1B E4
	pld		; 2B
	bne  99.b		; D0 63
	sty $1F.b		; 84 1F
	cpx #$0081.w		; E0 81 00
	ora $B0.b,S		; 03 B0
	cop $F9.b		; 02 F9
	brk $43.b		; 00 43
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	sbc ($0E.b),Y		; F1 0E
	bra  62.b		; 80 3E
	ora $031C30.l		; 0F 30 1C 03
	beq  15.b		; F0 0F
	tsb $0003.w		; 0C 03 00
	bit $AF10.w,X		; 3C 10 AF
	brk $F1.b		; 00 F1
	brk $C1.b		; 00 C1
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $C3.b		; 00 C3
	brk $40.b		; 00 40
	bra 124.b		; 80 7C
	brk $F8.b		; 00 F8
	beq   0.b		; F0 00
	bvs -128.b		; 70 80
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	adc [$18.b]		; 67 18
	asl $99.b		; 06 99
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $07.b		; 00 07
	and ($3F.b),Y		; 31 3F
	sbc $1F1FFF.l,X		; FF FF 1F 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	ora ($7F.b,X)		; 01 7F
	ora [$FE.b]		; 07 FE
	ora $C07FFC.l		; 0F FC 7F C0
	inc $E780.w,X		; FE 80 E7
	bra 123.b		; 80 7B
	sta [$00.b]		; 87 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sec		; 38
	eor [$B1.b]		; 47 B1
	sbc $3FFF77.l		; EF 77 FF 3F
	stx $79.b,Y		; 96 79
	and $EE7F7C.l,X		; 3F 7C 7F EE
	sbc $04.b		; E5 04
	cmp [$F0.b]		; C7 F0
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $11.b		; 00 11
	brk $FB.b		; 00 FB
	brk $0F.b		; 00 0F
	wai		; CB
	pei ($0C.b)		; D4 0C
	sta ($87.b,S),Y		; 93 87
	clv		; B8
	eor $FC.b,S		; 43 FC
	brk $1F.b		; 00 1F
	bvs 127.b		; 70 7F
	trb $0F1F.w		; 1C 1F 0F
	ora $002000.l		; 0F 00 20 00
	rts		; 60

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	sbc $807F00.l,X		; FF 00 7F 80
	ror $F000.w,X		; 7E 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sed		; F8
	bra  -1.b		; 80 FF
	brk $6F.b		; 00 6F
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
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	tda		; 7B
	sbc $E3.b,S		; E3 E3
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	asl $0300.w		; 0E 00 03
	ora [$63.b]		; 07 63
	adc [$7B.b]		; 67 7B
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	wai		; CB
	sbc $803D42.l,X		; FF 42 3D 80
	and $1F03.w,X		; 3D 03 1F
	and $ECFFFE.l,X		; 3F FE FF EC
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	brk $C2.b		; 00 C2
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	lsr $FE7A.w,X		; 5E 7A FE
	jsr ($B0B2.w,X)		; FC B2 B0
	ora [$C6.b]		; 07 C6
	ldy $FCC0.w,X		; BC C0 FC
	brk $EE.b		; 00 EE
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	eor $003900.l		; 4F 00 39 00
	ora $003F00.l,X		; 1F 00 3F 00
	sbc $01FF00.l,X		; FF 00 FF 01
	adc $7F07.w,Y		; 79 07 7F
	brk $07.b		; 00 07
	sta $7F1E.w		; 8D 1E 7F
	sei		; 78
	pea $2FF0.w		; F4 F0 2F
	bpl  54.b		; 10 36
	ora #$00.b		; 09 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	sed		; F8
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $0B.b		; 00 0B
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bra -97.b		; 80 9F
	brk $F3.b		; 00 F3
	stz $F0E0.w		; 9C E0 F0
	php		; 08
	beq   8.b		; F0 08
	ora ($01.b,X)		; 01 01
	rol $803E.w,X		; 3E 3E 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
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
	jmp ($7C00.w,X)		; 7C 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	adc $007F00.l,X		; 7F 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
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
	bra   0.b		; 80 00
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
	brk $3F.b		; 00 3F
	and $0C1F13.l,X		; 3F 13 1F 0C
	ora $000100.l		; 0F 00 01 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
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
	cmp $81FC03.l		; CF 03 FC 81
	inc $F50F.w,X		; FE 0F F5
	asl $781F.w,X		; 1E 1F 78
	adc $00FCE0.l,X		; 7F E0 FC 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	brk $FC.b		; 00 FC
	brk $BC.b		; 00 BC
	cpy #$80BE.w		; C0 BE 80
	rol $3E80.w,X		; 3E 80 3E
	brk $3E.b		; 00 3E
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	and $001F00.l		; 2F 00 1F 00
	and $003F00.l		; 2F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $F83F00.l,X		; 3F 00 3F F8
	ora [$3C.b]		; 07 3C
	ora ($03.b,X)		; 01 03
	brk $0F.b		; 00 0F
	bmi   1.b		; 30 01
	rol $00.b		; 26 00
	and ($00.b),Y		; 31 00
	sec		; 38
	brk $18.b		; 00 18
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	trb $F2E0.w		; 1C E0 F2
	ora ($FE.b,X)		; 01 FE
	brk $F0.b		; 00 F0
	asl $C038.w		; 0E 38 C0
	jsr $0040.w		; 20 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $FC00.w		; 1C 00 FC
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
	ora ($00.b,X)		; 01 00
	ora ($80.b,X)		; 01 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $BE1F.w,X		; 1E 1F BE
	lda $7F1F00.l,X		; BF 00 1F 7F
	adc $000000.l,X		; 7F 00 00 00
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7BFFF1.l,X		; FF F1 FF 7B
	adc $000604.l,X		; 7F 04 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ply		; 7A
	brk $13.b		; 00 13
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	ply		; 7A
	plx		; FA
	ora ($F3.b,S),Y		; 13 F3
	ora [$FF.b]		; 07 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $58.b		; 00 58
	brk $AC.b		; 00 AC
	brk $C0.b		; 00 C0
	brk $E8.b		; 00 E8
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cli		; 58
	cli		; 58
	ldy $C0AC.w		; AC AC C0
	cpy #$E8E8.w		; C0 E8 E8
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	ora #$80.b		; 09 80
	bit $00.b		; 24 00
	inc $C60F.w		; EE 0F C6
	ora $00.b		; 05 00
	brk $C6.b		; 00 C6
	sbc $000C00.l,X		; FF 00 0C 00
	brk $00.b		; 00 00
	brk $D6.b		; 00 D6
	sbc $000C02.l,X		; FF 02 0C 00
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	sbc $000C04.l,X		; FF 04 0C 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $000C06.l,X		; FF 06 0C 00
	brk $F0.b		; 00 F0
	sbc $08FFC6.l,X		; FF C6 FF 08
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	dec $FF.b,X		; D6 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	beq  -1.b		; F0 FF
	inc $FF.b		; E6 FF
	tsb $000C.w		; 0C 0C 00
	brk $F0.b		; 00 F0
	sbc $0EFFF6.l,X		; FF F6 FF 0E
	tsb $0000.w		; 0C 00 00
	cpx #$E2FF.w		; E0 FF E2
	sbc $000C20.l,X		; FF 20 0C 00
	brk $00.b		; 00 00
	bvs  16.b		; 70 10
	cpx #$8070.w		; E0 70 80
	rti		; 40

	asl $9E60.w		; 0E 60 9E
	rti		; 40

	jsr ($6018.w,X)		; FC 18 60
	ldy #$0046.w		; A0 46 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rts		; 60

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
	.db $82, $7C, $88		; 82 7C 88
	adc [$80.b],Y		; 77 80
	ora [$E6.b]		; 07 E6
	ora $601F.w,Y		; 19 1F 60
	and ($0E.b),Y		; 31 0E
	cpx #$101F.w		; E0 1F 10
	ora $008000.l		; 0F 00 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	inc $00.b		; E6 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $E0.b		; 00 E0
	bpl -32.b		; 10 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dey		; 88
	sta [$8E.b],Y		; 97 8E
	bcs  71.b		; B0 47
	sed		; F8
	sta ($1E.b,X)		; 81 1E
	sta $8E1F.w,Y		; 99 1F 8E
	asl $B981.w		; 0E 81 B9
	sta [$3F.b]		; 87 3F
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	sed		; F8
	brk $F0.b		; 00 F0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	jsr ($BF00.w,X)		; FC 00 BF
	brk $3F.b		; 00 3F
	brk $EC.b		; 00 EC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  17.b		; 80 11
	bra  24.b		; 80 18
	bra   8.b		; 80 08
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	bvs -128.b		; 70 80
	rti		; 40

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
	brk $18.b		; 00 18
	sec		; 38
	clc		; 18
	bit $0F00.w,X		; 3C 00 0F
	ora $F8.b,S		; 03 F8
	dey		; 88
	sbc [$FA.b],Y		; F7 FA
	sbc [$7F.b],Y		; F7 7F
	ror $1E07.w,X		; 7E 07 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	ora $18061E.l,X		; 1F 1E 06 18
	brk $0F.b		; 00 0F
	ora ($0F.b,X)		; 01 0F
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	tas		; 1B
	stz $87.b		; 64 87
	sed		; F8
	ldy #$0758.w		; A0 58 07
	cli		; 58
	ora ($E8.b,S),Y		; 13 E8
	lda ($C4.b,S),Y		; B3 C4
	sta $00C1F0.l		; 8F F0 C1 00
	brk $1B.b		; 00 1B
	brk $07.b		; 00 07
	brk $A7.b		; 00 A7
	brk $A3.b		; 00 A3
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	ora ($1F.b,X)		; 01 1F
	ora [$78.b]		; 07 78
	jsr ($F7F8.w,X)		; FC F8 F7
	sed		; F8
	cld		; D8
	cmp $009F9C.l,X		; DF 9C 9F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	stp		; DB
	sbc $9CE38F.l,X		; FF 8F E3 9C
	cmp $02FA1E.l		; CF 1E FA 02
	adc ($F8.b,S),Y		; 73 F8
	ora $FFFFEE.l		; 0F EE FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FD.b		; 00 FD
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	asl $001F.w,X		; 1E 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpx #$8007.w		; E0 07 80
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	asl $F8.b		; 06 F8
	bvs -121.b		; 70 87
	brk $8F.b		; 00 8F
	pha		; 48
	and [$78.b],Y		; 37 78
	sbc $9FFFC0.l,X		; FF C0 FF 9F
	cpx #$807A.w		; E0 7A 80
	brk $06.b		; 00 06
	brk $78.b		; 00 78
	brk $70.b		; 00 70
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $75.b		; 00 75
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
	jsr $0EDE.w		; 20 DE 0E
	sta ($0F.b,X)		; 81 0F
	cpx #$FE01.w		; E0 01 FE
	cpy #$73CF.w		; C0 CF 73
	ror $8B3C.w,X		; 7E 3C 8B
	bit $AB.b,X		; 34 AB
	brk $01.b		; 00 01
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $81.b		; 00 81
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	bmi -52.b		; 30 CC
	bmi -52.b		; 30 CC
	rts		; 60

	sty $8060.w		; 8C 60 80
	brk $FF.b		; 00 FF
	tda		; 7B
	sty $FF.b		; 84 FF
	brk $1E.b		; 00 1E
	cpx #$0000.w		; E0 00 00
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $10.b		; 00 10
	cmp $3F8E.w		; CD 8E 3F
	sec		; 38
	stz $70.b,X		; 74 70
	sta $07F800.l,X		; 9F 00 F8 07
	trb $0301.w		; 1C 01 03
	brk $8F.b		; 00 8F
	bpl   0.b		; 10 00
	rts		; 60

	brk $C0.b		; 00 C0
	brk $8B.b		; 00 8B
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	cpx #$E010.w		; E0 10 E0
	bpl   6.b		; 10 06
	asl $78.b		; 06 78
	sei		; 78
	brk $80.b		; 00 80
	bmi -64.b		; 30 C0
	nop		; EA
	tsb $F8.b		; 04 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0300.w,X		; 1D 00 03
	brk $7F.b		; 00 7F
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	ora $03FD.w,X		; 1D FD 03
	sbc $40FF7F.l,X		; FF 7F FF 40
	cpy #$8080.w		; C0 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc  80.b		; 50 50
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$8080.w		; E0 80 80
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sbc $7FF906.l,X		; FF 06 F9 7F
	bra   7.b		; 80 07
	beq  -2.b		; F0 FE
	cmp $FF7C.w		; CD 7C FF
	adc $ED0C87.l,X		; 7F 87 0C ED
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $20.b		; 00 20
	brk $09.b		; 00 09
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $12.b		; 00 12
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	ora ($3E.b,X)		; 01 3E
	trb $09FF.w		; 1C FF 09
	ora $013E01.l		; 0F 01 3E 01
	rol $0000.w,X		; 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $F9.b		; 02 F9
	asl $F9.b		; 06 F9
	sec		; 38
	eor ($C2.b,X)		; 41 C2
	phd		; 0B
	ora ($EB.b,S),Y		; 13 EB
	adc $98.b,S		; 63 98
	bra 127.b		; 80 7F
	dey		; 88
	adc [$00.b],Y		; 77 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	rol $F400.w,X		; 3E 00 F4
	brk $04.b		; 00 04
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	php		; 08
	ora $70.b,S		; 03 70
	ora ($1B.b,X)		; 01 1B
	and $F8BE9F.l,X		; 3F 9F BE F8
	jsr ($7F18.w,X)		; FC 18 7F
	rts		; 60

	adc $000F00.l,X		; 7F 00 0F 00
	tsb $7800.w		; 0C 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($B9.b,X)		; 01 B9
	adc [$F8.b],Y		; 77 F8
	sbc $80FBC0.l,X		; FF C0 FB 80
	ora $807FE0.l,X		; 1F E0 7F 80
	and [$D8.b],Y		; 37 D8
	sbc [$30.b],Y		; F7 30
	brk $46.b		; 00 46
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $3F.b		; 00 3F
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $03.b		; 00 03
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
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $000100.l,X		; 1F 00 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	cpx #$00FF.w		; E0 FF 00
	sbc $07FFFE.l,X		; FF FE FF 07
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $00.b,S		; 03 00
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
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	bra  24.b		; 80 18
	brk $F3.b		; 00 F3
	phd		; 0B
	cmp $04.b,X		; D5 04
	sbc [$FF.b],Y		; F7 FF
	cmp $FF.b,X		; D5 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	cmp $FF.b,X		; D5 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	sbc $FF.b		; E5 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b		; E5 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	pea $F5FF.w		; F4 FF F5
	sbc $000C08.l,X		; FF 08 0C 00
	brk $04.b		; 00 04
	brk $F5.b		; 00 F5
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $06.b		; 00 06
	asl $00.b		; 06 00
	ora $00.b,S		; 03 00
	asl $1D12.w,X		; 1E 12 1D
	ora $07010F.l		; 0F 0F 01 07
	asl $0F3F.w		; 0E 3F 0F
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	cpy #$0CA0.w		; C0 A0 0C
	jsr $98DC.w		; 20 DC 98
	jsr $24C0.w		; 20 C0 24
	tsb $F8.b		; 04 F8
	bra  78.b		; 80 4E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $04.b		; 00 04
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
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	ora ($1E.b,X)		; 01 1E
	tsb $01FF.w		; 0C FF 01
	asl $1E01.w,X		; 1E 01 1E
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $89C1.w,X		; 3E C1 89
	brk $00.b		; 00 00
	sbc $808E60.l		; EF 60 8E 80
	and $01AE4E.l		; 2F 4E AE 01
	jsr ($DC21.w,X)		; FC 21 DC
	brk $3E.b		; 00 3E
	brk $FF.b		; 00 FF
	brk $10.b		; 00 10
	brk $70.b		; 00 70
	brk $D0.b		; 00 D0
	brk $11.b		; 00 11
	brk $02.b		; 00 02
	brk $22.b		; 00 22
	brk $F8.b		; 00 F8
	tsb $F8.b		; 04 F8
	tsb $DA.b		; 04 DA
	inx		; E8
	ora ($28.b)		; 12 28
	bne   0.b		; D0 00
	sbc $47A0DF.l,X		; FF DF A0 47
	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $04.b		; 00 04
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
	sta $FBF0BE.l,X		; 9F BE F0 FB
	rts		; 60

	adc $0E1C03.l,X		; 7F 03 1C 0E
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DB.b		; 00 DB
	brk $FF.b		; 00 FF
	brk $B0.b		; 00 B0
	cpy #$82B9.w		; C0 B9 82
	sec		; 38
	cop $38.b		; 02 38
	ora ($38.b,X)		; 01 38
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	jsr ($1C00.w,X)		; FC 00 1C
	brk $1F.b		; 00 1F
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	jmp.w [$001C]		; DC 1C 00
	cpx #$0076.w		; E0 76 00
	jsr ($1800.w,X)		; FC 00 18
	rts		; 60

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($1C.b,X)		; 01 1C
	adc $710F7B.l,X		; 7F 7B 0F 71
	ora $1B.b,S		; 03 1B
	asl $09.b		; 06 09
	beq -18.b		; F0 EE
	adc ($8E.b,X)		; 61 8E
	tsb $FA.b		; 04 FA
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $04.b		; 00 04
	brk $06.b		; 00 06
	brk $11.b		; 00 11
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	tay		; A8
	asl $38.b,X		; 16 38
	sbc $38E1DE.l,X		; FF DE E1 38
	cpy #$3CC0.w		; C0 C0 3C
	rti		; 40

	asl $E4.b		; 06 E4
	tas		; 1B
	sta $C00020.l,X		; 9F 20 00 C0
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $36.b		; 00 36
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $E4.b		; 00 E4
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora ($0F.b,X)		; 01 0F
	ora [$38.b]		; 07 38
	sbc $68F8.w,X		; FD F8 68
	adc $08CFCD.l		; 6F CD CF 08
	ora $0B.b,S		; 03 0B
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0000.w		; 0C 00 00
	jsr ($8AED.w,X)		; FC ED 8A
	adc [$BC.b],Y		; 77 BC
	adc ($E5.b),Y		; 71 E5
	ora ($3C.b,X)		; 01 3C
	lda $FC.b,X		; B5 FC
	sbc $6C0E.w,Y		; F9 0E 6C
	xce		; FB
	sta $00.b,S		; 83 00
	cop $00.b		; 02 00
	php		; 08
	brk $0E.b		; 00 0E
	brk $FE.b		; 00 FE
	brk $0A.b		; 00 0A
	brk $06.b		; 00 06
	brk $92.b		; 00 92
	brk $1C.b		; 00 1C
	stz $7860.w,X		; 9E 60 78
	bra  56.b		; 80 38
	cpy #$FEA0.w		; C0 A0 FE
	jsr $60A7.w		; 20 A7 60
	plx		; FA
	sed		; F8
	cpy $41.b		; C4 41
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcs   0.b		; B0 00
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
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $F0.b		; 00 F0
	ora $10.b,S		; 03 10
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	php		; 08
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	bit $3C.b,X		; 34 3C
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	brk $70.b		; 00 70
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cld		; D8
	cld		; D8
	bvs -16.b		; 70 F0
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F7.b		; 00 F7
	ora [$E3.b]		; 07 E3
	ora ($F9.b,X)		; 01 F9
	sbc $00FFE3.l,X		; FF E3 FF 00
	tsb $0000.w		; 0C 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc ($FF.b,S),Y		; F3 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	php		; 08
	ora $3823.w		; 0D 23 38
	ora $061F.w,Y		; 19 1F 06
	ora $3A05.w		; 0D 05 3A
	ora [$38.b]		; 07 38
	adc $057F.w,X		; 7D 7F 05
	rol $00.b,X		; 36 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	ora #$80.b		; 09 80
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra  96.b		; 80 60
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	ora [$19.b]		; 07 19
	ora $7E63.w,X		; 1D 63 7E
	ror $B7.b		; 66 B7
	lda $BE0E67.l,X		; BF 67 0E BE
	bcs  39.b		; B0 27
	sei		; 78
	ora [$1A.b]		; 07 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	brk $00.b		; 00 00
	brk $61.b		; 00 61
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	stx $A0.b,Y		; 96 A0
	sty $9030.w		; 8C 30 90
	ora ($98.b,S),Y		; 13 98
	lda $22BC.w,X		; BD BC 22
	ldx $B206.w,Y		; BE 06 B2
	tsb $209E.w		; 0C 9E 20
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F2.b		; 00 F2
	brk $C0.b		; 00 C0
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
	ror $79.b		; 66 79
	eor [$98.b]		; 47 98
	rol A		; 2A
	stz $72.b,X		; 74 72
	brk $04.b		; 00 04
	ply		; 7A
	bmi -61.b		; 30 C3
	and ($69.b,S),Y		; 33 69
	jsr $00DE.w		; 20 DE 00
	asl $00.b		; 06 00
	adc $00.b,S		; 63 00
	ora $00.b,S		; 03 00
	adc $000500.l,X		; 7F 00 05 00
	bit $8600.w,X		; 3C 00 86
	brk $01.b		; 00 01
	brk $E0.b		; 00 E0
	rti		; 40

	bcs -96.b		; B0 A0
	rti		; 40

	dey		; 88
	bvs  72.b		; 70 48
	bit $30.b,X		; 34 30
	cpy #$C4BA.w		; C0 BA C4
	cpy $0030.w		; CC 30 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $08.b		; 00 08
	and ($38.b),Y		; 31 38
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	tsb $07.b		; 04 07
	ora $00000F.l		; 0F 0F 00 00
	sty $20.b		; 84 20
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  62.b		; 80 3E
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	rol $7CFE.w,X		; 3E FE 7C
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
	jsr ($F202.w,X)		; FC 02 F2
	brk $FD.b		; 00 FD
	sbc $00FFF2.l,X		; FF F2 FF 00
	tsb $0000.w		; 0C 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $20.b		; 00 20
	pha		; 48
	bmi  40.b		; 30 28
	jsr $1858.w		; 20 58 18
	rti		; 40

	clv		; B8
	rti		; 40

	cpy $08.b		; C4 08
	rts		; 60

	clv		; B8
	trb $F8.b		; 14 F8
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $B8.b		; 00 B8
	brk $F0.b		; 00 F0
	brk $40.b		; 00 40
	brk $04.b		; 00 04
	bvs -108.b		; 70 94
	stz $7C.b,X		; 74 7C
	ror $42.b,X		; 76 42
	rol $40.b,X		; 36 40
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   2.b		; 10 02
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	jsl $00003A.l		; 22 3A 00 00
	asl $80.b,X		; 16 80
	cli		; 58
	brk $D4.b		; 00 D4
	rol A		; 2A
	ldx $DE07.w,Y		; BE 07 DE
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $0000.w		; 0C 00 00
	inc $F8FF.w		; EE FF F8
	sbc $000C02.l,X		; FF 02 0C 00
	brk $FE.b		; 00 FE
	sbc $04FFF8.l,X		; FF F8 FF 04
	tsb $0000.w		; 0C 00 00
	asl $F800.w		; 0E 00 F8
	sbc $000C06.l,X		; FF 06 0C 00
	brk $1E.b		; 00 1E
	brk $F8.b		; 00 F8
	sbc $000C08.l,X		; FF 08 0C 00
	brk $D4.b		; 00 D4
	sbc $0AFFE8.l,X		; FF E8 FF 0A
	tsb $0000.w		; 0C 00 00
	cpx $FF.b		; E4 FF
	inx		; E8
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $F4.b		; 00 F4
	sbc $0EFFE8.l,X		; FF E8 FF 0E
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	inx		; E8
	sbc $000C20.l,X		; FF 20 0C 00
	brk $14.b		; 00 14
	brk $E8.b		; 00 E8
	sbc $000C22.l,X		; FF 22 0C 00
	brk $24.b		; 00 24
	brk $E8.b		; 00 E8
	sbc $000C24.l,X		; FF 24 0C 00
	brk $D7.b		; 00 D7
	sbc $26FFD8.l,X		; FF D8 FF 26
	tsb $0000.w		; 0C 00 00
	sbc [$FF.b]		; E7 FF
	cld		; D8
	sbc $000C28.l,X		; FF 28 0C 00
	brk $F7.b		; 00 F7
	sbc $2AFFD8.l,X		; FF D8 FF 2A
	tsb $0000.w		; 0C 00 00
	ora [$00.b]		; 07 00
	cld		; D8
	sbc $000C2C.l,X		; FF 2C 0C 00
	brk $17.b		; 00 17
	brk $D8.b		; 00 D8
	sbc $000C2E.l,X		; FF 2E 0C 00
	brk $DF.b		; 00 DF
	sbc $40FFC8.l,X		; FF C8 FF 40
	tsb $0000.w		; 0C 00 00
	sbc $FFC8FF.l		; EF FF C8 FF
	.db $42, $0C		; 42 0C
	brk $00.b		; 00 00
	sbc $FFC8FF.l,X		; FF FF C8 FF
	mvp $00,$0C		; 44 0C 00
	brk $0F.b		; 00 0F
	brk $C8.b		; 00 C8
	sbc $000C46.l,X		; FF 46 0C 00
	brk $F0.b		; 00 F0
	sbc $48FFB8.l,X		; FF B8 FF 48
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	clv		; B8
	sbc $000C4A.l,X		; FF 4A 0C 00
	brk $20.b		; 00 20
	eor #$00.b		; 49 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	stz $0E11.w		; 9C 11 0E
	phd		; 0B
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $10.b		; 02 10
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $38F7F9.l		; EF F9 F7 38
	ora [$CB.b]		; 07 CB
	bpl   4.b		; 10 04
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
	brk $0C.b		; 00 0C
	cpy #$401C.w		; C0 1C 40
	eor $8180.w,X		; 5D 80 81
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $E4.b,S		; 03 E4
	ora $62.b,S		; 03 62
	brk $E2.b		; 00 E2
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sed		; F8
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $8F.b		; 00 8F
	asl $100F.w		; 0E 0F 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $28.b		; 00 28
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
	brk $47.b		; 00 47
	lda $003606.l,X		; BF 06 36 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	and $00.b,X		; 35 00
	and $397F13.l,X		; 3F 13 7F 39
	sbc [$37.b],Y		; F7 37
	eor [$07.b],Y		; 57 07
	lsr $001C.w,X		; 5E 1C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	and ($1D.b,S),Y		; 33 1D
	jsr $40DD.w		; 20 DD 40
	cmp $84.b,S		; C3 84
	ora ($06.b,X)		; 01 06
	ldx $9EB6.w,Y		; BE B6 9E
	bra  -1.b		; 80 FF
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DD.b		; 00 DD
	and $9D.b,S		; 23 9D
	adc $FC.b,S		; 63 FC
	cop $89.b		; 02 89
	ror $06.b,X		; 76 06
	and $00F8.w,Y		; 39 F8 00
	jsr ($FF04.w,X)		; FC 04 FF
	tsb $08.b		; 04 08
	php		; 08
	stz $E89C.w		; 9C 9C E8
	inx		; E8
	bra -128.b		; 80 80
	asl $06.b		; 06 06
	sec		; 38
	sec		; 38
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	stx $9D.b,Y		; 96 9D
	bra -113.b		; 80 8F
	cmp $EF.b,S		; C3 EF
	cld		; D8
	and $3F7B9F.l,X		; 3F 9F 7B 3F
	plp		; 28
	jmp ($FE01.w,X)		; 7C 01 FE
	ora $006000.l,X		; 1F 00 60 00
	bvs   0.b		; 70 00
	bpl   0.b		; 10 00
	brk $04.b		; 00 04
	tsb $17.b		; 04 17
	ora [$7C.b],Y		; 17 7C
	jmp ($E0E0.w,X)		; 7C E0 E0
	cpy #$503F.w		; C0 3F 50
	sbc $F0C6F8.l		; EF F8 C6 F0
	sty $E0F8.w		; 8C F8 E0
	adc $3960.w,Y		; 79 60 39
	sed		; F8
	sec		; 38
	sed		; F8
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	sec		; 38
	and $7370.w,Y		; 39 70 73
	clc		; 18
	tas		; 1B
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($30.b,X)		; C1 30
	mvp $07,$12		; 44 12 07
	brk $13.b		; 00 13
	rti		; 40

	ora $AE00.w,Y		; 19 00 AE
	bvc -27.b		; 50 E5
	inc A		; 1A
	tsx		; BA
	ora $10.b		; 05 10
	ora $00AD12.l		; 0F 12 AD 00
	sbc $00AF00.l,X		; FF 00 AF 00
	sbc [$08.b]		; E7 08
	ora #$04.b		; 09 04
	tsb $02.b		; 04 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $00BB00.l,X		; 5F 00 BB 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	eor $01BBBB.l,X		; 5F BB BB 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $00FF00.l,X		; 5F 00 FF 00
	inc $EE00.w,X		; FE 00 EE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $FFFF5F.l,X		; 5F 5F FF FF
	inc $EEFE.w,X		; FE FE EE
	inc $0000.w		; EE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1D.b		; 00 1D
	brk $F9.b		; 00 F9
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $F91D.w,X		; 1D 1D F9
	sbc $FFFF.w,Y		; F9 FF FF
	xce		; FB
	xce		; FB
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	ora $00.b,S		; 03 00
	ora $10.b,S		; 03 10
	asl $E0.b		; 06 E0
	ora [$C8.b]		; 07 C8
	ora [$F8.b]		; 07 F8
	ora [$78.b]		; 07 78
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $03.b		; 00 03
	bpl  19.b		; 10 13
	sbc ($E7.b,X)		; E1 E7
	iny		; C8
	cmp $78FFF8.l		; CF F8 FF 78
	adc $FDFFFF.l,X		; 7F FF FF FD
	sbc $0080.w,X		; FD 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	cpy #$F000.w		; C0 00 F0
	brk $00.b		; 00 00
	sbc $00FC00.l,X		; FF 00 FC 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FCFCFF.l,X		; FF FF FC FC
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $41.b		; 00 41
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $7E.b		; 00 7E
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $00.b		; 00 00
	asl $410E.w		; 0E 0E 41
	eor ($EF.b,X)		; 41 EF
	sbc $7EFFFF.l		; EF FF FF 7E
	inc $FFFF.w,X		; FE FF FF
	cmp $0000DF.l,X		; DF DF 00 00
	brk $78.b		; 00 78
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	brk $76.b		; 00 76
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sbc $F7F7FF.l,X		; FF FF F7 F7
	sbc $FBFBFF.l,X		; FF FF FB FB
	ror $76.b,X		; 76 76
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $DC.b		; 00 DC
	brk $FF.b		; 00 FF
	brk $F4.b		; 00 F4
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	jmp.w [$FFDC]		; DC DC FF
	sbc $7EF4F4.l,X		; FF F4 F4 7E
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy $00CC.w		; CC CC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sec		; 38
	tda		; 7B
	and ($37.b),Y		; 31 37
	ora ($03.b,X)		; 01 03
	ora $03.b,S		; 03 03
	ora ($02.b,X)		; 01 02
	brk $00.b		; 00 00
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
	sbc $39B9.w,Y		; F9 B9 39
	txy		; 9B
	txy		; 9B
	sbc $E3.b,S		; E3 E3
	ora $2F910F.l		; 0F 0F 91 2F
.INDEX 8
	sep #$1D		; E2 1D
	rol $01.b,X		; 36 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $BB81.w,X		; FD 81 BB
	inc $E3.b		; E6 E3
	jmp.w [$FE81]		; DC 81 FE
	brk $FF.b		; 00 FF
	bra  -9.b		; 80 F7
	tsb $F7.b		; 04 F7
	brk $F9.b		; 00 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F97F.w,X		; FE 7F F9
	ora $4CF0.w,Y		; 19 F0 4C
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	brk $00.b		; 00 00
	ora $04.b,S		; 03 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $E0.b		; 00 E0
	sec		; 38
	iny		; C8
	sei		; 78
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $B0.b		; 00 B0
	brk $04.b		; 00 04
	brk $20.b		; 00 20
	cpy #$00.b		; C0 00
	cop $00.b		; 02 00
	ora $20.b,S		; 03 20
	and $0F00.w		; 2D 00 0F
	brk $E1.b		; 00 E1
	brk $FC.b		; 00 FC
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	trb $2B.b		; 14 2B
	bmi  15.b		; 30 0F
	bit $0B.b,X		; 34 0B
	and $1306.w,Y		; 39 06 13
	tsb $0B64.w		; 0C 64 0B
	cpx #$07.b		; E0 07
	clc		; 18
	brk $04.b		; 00 04
	tsb $20.b		; 04 20
	jsr $0404.w		; 20 04 04
	ora $81.b		; 05 81
	phd		; 0B
	sbc $0C.b,S		; E3 0C
	pea $F800.w		; F4 00 F8
	brk $FE.b		; 00 FE
	sty $0D0C.w		; 8C 0C 0D
	trb $7086.w		; 1C 86 70
	jmp $03C000.l		; 5C 00 C0 03
	bra  17.b		; 80 11
	phb		; 8B
	ora $37.b,S		; 03 37
	and $00.b,X		; 35 00
	bra   0.b		; 80 00
	sta ($00.b,X)		; 81 00
	sta $00FD00.l		; 8F 00 FD 00
	cpx #$00.b		; E0 00
	brk $88.b		; 00 88
	dey		; 88
	cop $02.b		; 02 02
	asl $0E12.w		; 0E 12 0E
	asl $0E0E.w		; 0E 0E 0E
	ora ($00.b,X)		; 01 00
	sta [$FF.b]		; 87 FF
	sta [$FF.b]		; 87 FF
	bpl  -1.b		; 10 FF
	jsr ($0CFF.w,X)		; FC FF 0C
	tsb $F000.w		; 0C 00 F0
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $017D01.l,X		; 7F 01 7D 01
	cmp $E931.w		; CD 31 E9
	bpl -33.b		; 10 DF
	jsr $E09B.w		; 20 9B E0
	sta [$E8.b],Y		; 97 E8
	asl $F9.b		; 06 F9
	asl $040E.w		; 0E 0E 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bpl  28.b		; 10 1C
	clc		; 18
	bpl  16.b		; 10 10
	tsb $04.b		; 04 04
	sbc $BFF7FF.l,X		; FF FF F7 BF
	xce		; FB
	ora $FF1FEF.l		; 0F EF 1F FF
	eor ($F9.b,X)		; 41 F9
	asl $70.b		; 06 70
	sty $F107.w		; 8C 07 F1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $7020.w		; 20 20 70
	bvs  32.b		; 70 20
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	sed		; F8
	tya		; 98
	sed		; F8
	clv		; B8
	dec $C0BE.w		; CE BE C0
	bmi  14.b		; 30 0E
	inc $FCFC.w,X		; FE FC FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	tsb $1D00.w		; 0C 00 1D
	brk $07.b		; 00 07
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	tsb $1D1D.w		; 0C 1D 1D
	cop $02.b		; 02 02
	ora [$00.b],Y		; 17 00
	ora $003F00.l,X		; 1F 00 3F 00
	txy		; 9B
	bra  -4.b		; 80 FC
	cmp [$F9.b]		; C7 F9
	cmp [$FC.b]		; C7 FC
	sbc [$7D.b]		; E7 7D
	ora $1414.w,X		; 1D 14 14
	php		; 08
	php		; 08
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	xce		; FB
	and $2E91.w		; 2D 91 2E
	dey		; 88
	adc [$D5.b],Y		; 77 D5
	and [$B8.b]		; 27 B8
	inc $FDD2.w,X		; FE D2 FD
	txy		; 9B
	inc $BCC7.w		; EE C7 BC
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dec $38.b		; C6 38
	cpx #$1F.b		; E0 1F
	dec $EFED.w,X		; DE ED EF
	inc $F40F.w,X		; FE 0F F4
	eor $FB04A0.l,X		; 5F A0 04 FB
	beq   7.b		; F0 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $F0.b,S		; 03 F0
	brk $F8.b		; 00 F8
	rti		; 40

	clv		; B8
	cpx $4010.w		; EC 10 40
	ldy $9FDC.w,X		; BC DC 9F
	sbc $FC0000.l,X		; FF 00 00 FC
	brk $0C.b		; 00 0C
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	tsb $04.b		; 04 04
	bmi   0.b		; 30 00
	cld		; D8
	brk $E1.b		; 00 E1
	brk $49.b		; 00 49
	brk $1F.b		; 00 1F
	brk $08.b		; 00 08
	bpl   0.b		; 10 00
	pha		; 48
	beq   0.b		; F0 00
	brk $78.b		; 00 78
	brk $39.b		; 00 39
	brk $1F.b		; 00 1F
	php		; 08
	and $18FF1C.l,X		; 3F 1C FF 18
	inc $B448.w		; EE 48 B4
	brk $0C.b		; 00 0C
	sbc $245F00.l,X		; FF 00 5F 24
	sta $30073D.l,X		; 9F 3D 07 30
	ora $021800.l,X		; 1F 00 18 02
	bpl  33.b		; 10 21
	brk $33.b		; 00 33
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	ora ($01.b,X)		; 01 01
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	sbc [$37.b],Y		; F7 37
	sbc ($03.b,S),Y		; F3 03
	sbc $00FF01.l,X		; FF 01 FF 00
	cmp $3FC020.l,X		; DF 20 C0 3F
	cmp $F00F30.l		; CF 30 0F F0
	rti		; 40

	rti		; 40

	cpx #$E0.b		; E0 E0
	cpy $C4.b		; C4 C4
	sbc $C6C6FF.l,X		; FF FF C6 C6
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	tsb $04.b		; 04 04
	ora $7FF9.w,Y		; 19 F9 7F
	sbc $FFCEFE.l,X		; FF FE CE FF
	asl $DF.b		; 06 DF
	rti		; 40

	sbc $00F240.l,X		; FF 40 F2 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	sec		; 38
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcc   0.b		; 90 00
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
	adc $E31E04.l,X		; 7F 04 1E E3
	adc [$88.b],Y		; 77 88
	adc ($8F.b,S),Y		; 73 8F
	eor $39.b,S		; 43 39
	adc [$18.b]		; 67 18
	ldx $0C40.w,Y		; BE 40 0C
	eor $3B.b,S		; 43 3B
	tsa		; 3B
	trb $771C.w		; 1C 1C 77
	adc [$70.b],Y		; 77 70
	bvs  66.b		; 70 42
	.db $42, $67		; 42 67
	adc [$BE.b]		; 67 BE
	ldx $0C0C.w,Y		; BE 0C 0C
	sec		; 38
	sbc [$F0.b],Y		; F7 F0
	bra -57.b		; 80 C7
	and [$8B.b]		; 27 8B
	sbc [$F7.b]		; E7 F7
	cmp [$FF.b],Y		; D7 FF
	sed		; F8
	trb $7C6B.w		; 1C 6B 7C
	sta $08.b,S		; 83 08
	php		; 08
	bvs 112.b		; 70 70
	cpy #$C0.b		; C0 C0
	php		; 08
	php		; 08
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora ($77.b,X)		; 01 77
	bvs  -1.b		; 70 FF
	sed		; F8
	eor $3FFF7C.l		; 4F 7C FF 3F
	lda $805F41.l,X		; BF 41 5F 80
	ora $0E0E00.l		; 0F 00 0E 0E
	ora [$07.b]		; 07 07
	ora [$07.b]		; 07 07
	ora $03.b,S		; 03 03
	cpy #$C0.b		; C0 C0
	jsr $0C20.w		; 20 20 0C
	tsb $0202.w		; 0C 02 02
	sta $B087F0.l		; 8F F0 87 B0
	pea $FF77.w		; F4 77 FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	jsr ($7F67.w,X)		; FC 67 7F
	cmp $002F.w,Y		; D9 2F 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CC.b		; 00 CC
	jmp ($38C0.w,X)		; 7C C0 38
	sty $1C.b		; 84 1C
	inc $F6.b,X		; F6 F6
	.db $62, $62, $F0		; 62 62 F0
	beq -96.b		; F0 A0
	ldy #$D8.b		; A0 D8
	cld		; D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $023B1C.l,X		; 3F 1C 3B 02
	sbc $0E.b,S		; E3 0E
	sbc [$E2.b]		; E7 E2
	jmp ($FE4C.w,X)		; 7C 4C FE
	sta ($68.b),Y		; 91 68
	pla		; 68
	rti		; 40

	rti		; 40

	and $23.b,S		; 23 23
	and $E039.w,Y		; 39 39 E0
	cpx #$04.b		; E0 04
	tsb $30.b		; 04 30
	bmi 110.b		; 30 6E
	ror $0000.w		; 6E 00 00
	brk $00.b		; 00 00
	sbc $FC5D.w,X		; FD 5D FC
	wai		; CB
	cpx #$07.b		; E0 07
	bcs  39.b		; B0 27
	jmp ($0080.w,X)		; 7C 80 00
	inc $7E01.w,X		; FE 01 7E
	eor $A0A030.l		; 4F 30 A0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $EB9C0F.l		; 0F 0F 9C EB
	adc $02.b,X		; 75 02
	bit $D000.w,X		; 3C 00 D0
	bpl  -1.b		; 10 FF
	php		; 08
	adc $00E0C0.l		; 6F C0 E0 00
	cmp ($31.b,X)		; C1 31
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	tsb $34.b		; 04 34
	brk $C0.b		; 00 C0
	brk $01.b		; 00 01
	brk $16.b		; 00 16
	brk $3F.b		; 00 3F
	cpy #$CE.b		; C0 CE
	dex		; CA
	and $DF.b,X		; 35 DF
	brk $98.b		; 00 98
	brk $02.b		; 00 02
	brk $3C.b		; 00 3C
	brk $C2.b		; 00 C2
	mvp $00,$D5		; 44 D5 00
	inc $0001.w,X		; FE 01 00
	cop $D0.b		; 02 D0
	cmp [$18.b],Y		; D7 18
	ora $0100.w,Y		; 19 00 01
	brk $CB.b		; 00 CB
	brk $3B.b		; 00 3B
	brk $EE.b		; 00 EE
	brk $E8.b		; 00 E8
	cmp $60FFA0.l,X		; DF A0 FF 60
	lsr $F660.w,X		; 5E 60 F6
	brk $E0.b		; 00 E0
	brk $10.b		; 00 10
	sta ($60.b,X)		; 81 60
	tsb $AF10.w		; 0C 10 AF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $90.b		; 00 90
	brk $7E.b		; 00 7E
	brk $F3.b		; 00 F3
	brk $40.b		; 00 40
	beq   0.b		; F0 00
	php		; 08
	brk $4E.b		; 00 4E
	ora ($D0.b,X)		; 01 D0
	asl $0FF0.w		; 0E F0 0F
	brk $76.b		; 00 76
	tsb $60.b		; 04 60
	tsb $0000.w		; 0C 00 00
	tsb $3C00.w		; 0C 00 3C
	brk $7E.b		; 00 7E
	brk $E1.b		; 00 E1
	brk $C0.b		; 00 C0
	brk $88.b		; 00 88
	jsr $009C.w		; 20 9C 00
	sed		; F8
	jsr $2001.w		; 20 01 20
	ora ($00.b,S),Y		; 13 00
	and $005F00.l,X		; 3F 00 5F 00
	xba		; EB
	brk $27.b		; 00 27
	brk $06.b		; 00 06
	cpx #$E0.b		; E0 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $F30C80.l,X		; 7F 80 0C F3
	brk $FF.b		; 00 FF
	tsb $FF.b		; 04 FF
	bcc -21.b		; 90 EB
	sec		; 38
	eor $7E.b,S		; 43 7E
	brk $73.b		; 00 73
	ora $02.b,S		; 03 02
	cop $04.b		; 02 04
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	ror $7070.w		; 6E 70 70
	sbc ($0C.b)		; F2 0C
	bcc 110.b		; 90 6E
	brk $EE.b		; 00 EE
	ora ($7F.b,X)		; 01 7F
	ora $3FBF7F.l,X		; 1F 7F BF 3F
	ror $F846.w,X		; 7E 46 F8
	bra  16.b		; 80 10
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  32.b		; 80 20
	jsr $7070.w		; 20 70 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpx #$E0.b		; E0 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora [$07.b]		; 07 07
	ora ($01.b,X)		; 01 01
	ora [$07.b]		; 07 07
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	asl $0F08.w		; 0E 08 0F
	brk $2E.b		; 00 2E
	php		; 08
	inc $BC1E.w,X		; FE 1E BC
	bit $0C8C.w,X		; 3C 8C 0C
	bpl   1.b		; 10 01
	brk $00.b		; 00 00
	asl $06.b		; 06 06
	ora $26260F.l		; 0F 0F 26 26
	cpx #$E0.b		; E0 E0
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bpl  16.b		; 10 10
	ror $7E71.w,X		; 7E 71 7E
	adc ($3F.b,X)		; 61 3F
	and ($39.b),Y		; 31 39
	ora [$38.b]		; 07 38
	brk $E0.b		; 00 E0
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $1E0E0E.l,X		; FF 0E 0E 1E
	asl $0C0C.w,X		; 1E 0C 0C
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	xce		; FB
	ora #$3F.b		; 09 3F
	bcs  15.b		; B0 0F
	brk $1E.b		; 00 1E
	jmp ($701E.w,X)		; 7C 1E 70
	ora $D00DC0.l,X		; 1F C0 0D D0
	cmp ($19.b,X)		; C1 19
	cop $02.b		; 02 02
	ora [$07.b]		; 07 07
	ora [$87.b]		; 07 87
	brk $80.b		; 00 80
	brk $82.b		; 00 82
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	beq  -4.b		; F0 FC
	sbc $FF.b,S		; E3 FF
	sbc ($38.b,X)		; E1 38
	sbc ($19.b,X)		; E1 19
	beq  72.b		; F0 48
	beq 124.b		; F0 7C
	sbc ($7D.b),Y		; F1 7D
	stp		; DB
	stp		; DB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	ldy #$A0.b		; A0 A0
	bmi  48.b		; 30 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	bra -128.b		; 80 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsa		; 3B
	adc $0079.w,Y		; 79 79 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	tsb $07.b		; 04 07
	ora [$72.b]		; 07 72
	ora ($F7.b,X)		; 01 F7
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $07.b,S		; 03 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $42.b		; 00 42
	.db $42, $F1		; 42 F1
	sbc ($79.b),Y		; F1 79
	adc $0F0C.w,Y		; 79 0C 0F
	ora $0AEF0F.l		; 0F 0F EF 0A
	sbc $F18F62.l,X		; FF 62 8F F1
	phd		; 0B
	sbc $01FC.w,X		; FD FC 01
	sbc $00001B.l,X		; FF 1B 00 00
	brk $00.b		; 00 00
	cpx $F4.b		; E4 F4
	stz $0E9C.w		; 9C 9C 0E
	asl $0201.w		; 0E 01 02
	sed		; F8
	sed		; F8
	cpx #$E0.b		; E0 E0
	rts		; 60

	adc ($F8.b),Y		; 71 F8
	sbc $1FDF.w,X		; FD DF 1F
	sbc $CFF8BF.l,X		; FF BF F8 CF
	sei		; 78
	eor [$8C.b]		; 47 8C
	and ($64.b,S),Y		; 33 64
	tas		; 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	ora ($FE.b,X)		; 01 FE
	rts		; 60

	stz $3D60.w,X		; 9E 60 3D
	eor $1C.b,S		; 43 1C
	adc [$18.b]		; 67 18
	sta $E20C10.l		; 8F 10 0C E2
	tas		; 1B
	sty $00.b		; 84 00
	ora ($60.b,X)		; 01 60
	rts		; 60

	brk $40.b		; 00 40
	ora $43.b,S		; 03 43
	ora [$27.b]		; 07 27
	ora $00000F.l		; 0F 0F 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	sbc $1701.w,Y		; F9 01 17
	sta [$07.b]		; 87 07
	sta [$C7.b]		; 87 C7
	asl $C1.b		; 06 C1
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	bit $3C38.w,X		; 3C 38 3C
	bpl 120.b		; 10 78
	brk $78.b		; 00 78
	sta ($B9.b,X)		; 81 B9
	ora ($31.b,X)		; 01 31
	brk $30.b		; 00 30
	brk $F0.b		; 00 F0
	ora [$07.b],Y		; 17 07
	wai		; CB
	sbc ($C8.b,S),Y		; F3 C8
	beq  -1.b		; F0 FF
	brk $F4.b		; 00 F4
	ora $FC.b,S		; 03 FC
	ora $6F0FEF.l		; 0F EF 0F 6F
	ora $1000.w		; 0D 00 10
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	bra -113.b		; 80 8F
	cpy #$C4.b		; C0 C4
	cpy #$F0.b		; C0 F0
	bra -32.b		; 80 E0
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	sei		; 78
	brk $87.b		; 00 87
	ora [$7E.b]		; 07 7E
	stz $CF3F.w,X		; 9E 3F CF
	lsr $F6FF.w		; 4E FF F6
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	cpy #$F0.b		; C0 F0
	bpl -16.b		; 10 F0
	ora $00F9.w,Y		; 19 F9 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $74.b		; 00 74
	bmi  -1.b		; 30 FF
	php		; 08
	adc $8E9F08.l,X		; 7F 08 9F 8E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	mvp $F6,$44		; 44 44 F6
	inc $74.b,X		; F6 74
	stz $10.b,X		; 74 10
	bpl  62.b		; 10 3E
	asl $FF.b		; 06 FF
	ora ($7F.b,S),Y		; 13 7F
	ora [$7F.b]		; 07 7F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	php		; 08
	sbc $80FF08.l,X		; FF 08 FF 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $7120.w		; 20 20 71
	adc ($23.b),Y		; 71 23
	and $77.b,S		; 23 77
	adc [$76.b],Y		; 77 76
	ror $2E.b,X		; 76 2E
	rol $7D59.w		; 2E 59 7D
	ldx $BF.b,Y		; B6 BF
	stx $87.b		; 86 87
	ldy $FE8F.w		; AC 8F FE
	asl $4EFE.w		; 0E FE 4E
	beq   0.b		; F0 00
	sbc ($13.b,S),Y		; F3 13
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $10.b		; 00 10
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	cpx #$E0.b		; E0 E0
	bra -32.b		; 80 E0
	rts		; 60

	cpx #$68.b		; E0 68
	inx		; E8
	cpy #$F0.b		; C0 F0
	cpy #$FC.b		; C0 FC
	cpy #$FC.b		; C0 FC
	cpy #$F8.b		; C0 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $003C80.l		; 0F 80 3C 00
	cmp $CC21.w,X		; DD 21 CC
	asl $E1.b		; 06 E1
	sbc $00FFF7.l,X		; FF F7 FF 00
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b),Y		; F1 FF
	sbc [$FF.b],Y		; F7 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc [$FF.b],Y		; F7 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	sbc [$FF.b],Y		; F7 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	cmp $E7FF.w,X		; DD FF E7
	sbc $000C08.l,X		; FF 08 0C 00
	brk $ED.b		; 00 ED
	sbc $0AFFE7.l,X		; FF E7 FF 0A
	tsb $0000.w		; 0C 00 00
	sbc $E7FF.w,X		; FD FF E7
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $0D.b		; 00 0D
	brk $E7.b		; 00 E7
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $1D.b		; 00 1D
	brk $E7.b		; 00 E7
	sbc $000C20.l,X		; FF 20 0C 00
	brk $E1.b		; 00 E1
	sbc $22FFD7.l,X		; FF D7 FF 22
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b),Y		; F1 FF
	cmp [$FF.b],Y		; D7 FF
	bit $0C.b		; 24 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cmp [$FF.b],Y		; D7 FF
	rol $0C.b		; 26 0C
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	cmp [$FF.b],Y		; D7 FF
	plp		; 28
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b),Y		; F1 FF
	cmp [$FF.b]		; C7 FF
	rol A		; 2A
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	cmp [$FF.b]		; C7 FF
	bit $000C.w		; 2C 0C 00
	brk $A9.b		; 00 A9
	ora [$30.b],Y		; 17 30
	ora $04011A.l		; 0F 1A 01 04
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -18.b		; 80 EE
	php		; 08
	inc $F200.w		; EE 00 F2
	ora ($6E.b,X)		; 01 6E
	ora $01.b		; 05 01
	ora ($00.b,X)		; 01 00
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
	ora $0000.w		; 0D 00 00
	brk $18.b		; 00 18
	asl $E0.b		; 06 E0
	sbc $D60E31.l,X		; FF 31 0E D6
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $00F800.l,X		; 7F 00 F8 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	brk $5C.b		; 00 5C
	ora ($02.b,X)		; 01 02
	brk $26.b		; 00 26
	brk $6E.b		; 00 6E
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	cmp $00FE00.l,X		; DF 00 FE 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $000F00.l		; 0F 00 0F 00
	ora $330F00.l		; 0F 00 0F 33
	cpy $E01E.w		; CC 1E E0
	tsb $23.b		; 04 23
	rti		; 40

	and ($00.b,S),Y		; 33 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $33.b		; 00 33
	and ($1E.b,S),Y		; 33 1E
	asl $8404.w,X		; 1E 04 84
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	inc $39F1.w,X		; FE F1 39
	lsr $78.b,X		; 56 78
	sty $00.b		; 84 00
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
	sbc $037A0F.l,X		; FF 0F 7A 03
	and $1102.w,X		; 3D 02 11
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  32.b		; 80 20
	jsr $1010.w		; 20 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp.w [$74DC]		; DC DC 74
	pea $FABA.w		; F4 BA FA
	dec A		; 3A
	plx		; FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3100.w,X		; 1D 00 31
	asl $33.b		; 06 33
	bmi  30.b		; 30 1E
	asl $14.b		; 06 14
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($1D.b,X)		; 01 1D
	ora $3030.w,X		; 1D 30 30
	cop $02.b		; 02 02
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E0D6.w,Y		; F9 D6 E0
	asl $2EA1.w		; 0E A1 2E
	adc $0380.w,Y		; 79 80 03
	jmp ($205F.w,X)		; 7C 5F 20
	adc $F992.w		; 6D 92 F9
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	clc		; 18
	brk $00.b		; 00 00
	ora $01011F.l,X		; 1F 1F 01 01
	ora #$09.b		; 09 09
	cmp $00E510.l		; CF 10 E5 00
	rti		; 40

	rti		; 40

	sbc $8720.w,Y		; F9 20 87
	brk $0F.b		; 00 0F
	iny		; C8
	lda $66.b		; A5 66
	ldy #$63.b		; A0 63
	ora $C1010F.l		; 0F 0F 01 C1
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $FE.b		; 00 FE
	brk $36.b		; 00 36
	brk $18.b		; 00 18
	bra -100.b		; 80 9C
	sbc $0C8B0C.l,X		; FF 0C 8B 0C
	and $00DC00.l,X		; 3F 00 DC 00
	jmp $E201.w		; 4C 01 E2
	ora $61.b,X		; 15 61
	stz $EE30.w,X		; 9E 30 EE
	brk $60.b		; 00 60
	bra -112.b		; 80 90
	brk $18.b		; 00 18
	brk $B2.b		; 00 B2
	brk $FE.b		; 00 FE
	brk $88.b		; 00 88
	brk $00.b		; 00 00
	bpl  17.b		; 10 11
	cpy $00.b		; C4 00
	stx $01.b		; 86 01
	tay		; A8
	asl $38.b		; 06 38
	ora [$00.b]		; 07 00
	bpl   4.b		; 10 04
	cpy #$84.b		; C0 84
	rts		; 60

	bcc  40.b		; 90 28
	brk $1C.b		; 00 1C
	brk $1E.b		; 00 1E
	brk $31.b		; 00 31
	brk $20.b		; 00 20
	bpl -20.b		; 10 EC
	brk $3C.b		; 00 3C
	jsr $281C.w		; 20 1C 28
	mvn $27,$00		; 54 00 27
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	cop $D7.b		; 02 D7
	ora ($0C.b,X)		; 01 0C
	cmp ($C0.b,X)		; C1 C0
	eor ($42.b,X)		; 41 42
	eor ($C1.b),Y		; 51 C1
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $1E.b		; 00 1E
	and $DA.b		; 25 DA
	brk $FE.b		; 00 FE
	jsr $41FB.w		; 20 FB 41
	txy		; 9B
	sbc ($00.b,S),Y		; F3 00
	cmp $40DF1C.l,X		; DF 1C DF 40
	dec $20C0.w,X		; DE C0 20
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $82, $B2, $C3		; 82 B2 C3
	cmp $83.b,S		; C3 83
	sta $02.b,S		; 83 02
	cop $00.b		; 02 00
	cpy #$00.b		; C0 00
	cpy #$30.b		; C0 30
	beq -16.b		; F0 F0
	beq -36.b		; F0 DC
	jmp $FE1E9E.l		; 5C 9E 1E FE
	inc $FFF7.w,X		; FE F7 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $16.b		; 00 16
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	phd		; 0B
	asl $16.b,X		; 16 16
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $76.b		; 00 76
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FEFEFF.l,X		; FF FF FE FE
	ror $76.b,X		; 76 76
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tas		; 1B
	tas		; 1B
	sbc $F7F7FF.l,X		; FF FF F7 F7
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	trb $1C00.w		; 1C 00 1C
	brk $1C.b		; 00 1C
	rti		; 40

	bpl -128.b		; 10 80
	asl $1FE0.w,X		; 1E E0 1F
	cpx #$00.b		; E0 00
	sbc $00EF00.l,X		; FF 00 EF 00
	ora $401F00.l,X		; 1F 00 1F 40
	eor $E09F88.l,X		; 5F 88 9F E0
	sbc $FFFFE0.l,X		; FF E0 FF FF
	sbc $00EFEF.l,X		; FF EF EF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	php		; 08
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $DB.b		; 00 DB
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	ora $C3.b,S		; 03 C3
	php		; 08
	iny		; C8
	ora $FF0FFF.l,X		; 1F FF 0F FF
	sbc $DBDBFF.l,X		; FF FF DB DB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	brk $FA.b		; 00 FA
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $7FBC.w,X		; BC BC 7F
	adc $BFFFFF.l,X		; 7F FF FF BF
	lda $C0FAFA.l,X		; BF FA FA C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $FE.b		; 00 FE
	brk $EB.b		; 00 EB
	brk $7C.b		; 00 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	inc $EBFE.w,X		; FE FE EB
	xba		; EB
	jmp ($007C.w,X)		; 7C 7C 00
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
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	rol $64FC.w		; 2E FC 64
	sbc $1EBE7F.l,X		; FF 7F BE 1E
	sbc $65EF63.l,X		; FF 63 EF 65
	ror $0F06.w,X		; 7E 06 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	rol $10.b		; 26 10
	and $EF.b,S		; 23 EF
	ldy #$EF.b		; A0 EF
	brk $DF.b		; 00 DF
	cld		; D8
	stp		; DB
	dec $DDDE.w,X		; DE DE DD
	clc		; 18
	ora $000808.l,X		; 1F 08 08 00
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $36.b		; 00 36
	cmp $0F3FC7.l		; CF C7 3F 0F
	asl A		; 0A
	stz $BF80.w,X		; 9E 80 BF
	and $7CC67E.l,X		; 3F 7E C6 7C
	sta ($20.b)		; 92 20
	cmp $C00000.l,X		; DF 00 00 C0
	cpy #$05.b		; C0 05
	ora $1E.b		; 05 1E
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs -52.b		; 70 CC
	sed		; F8
	cpx #$B9.b		; E0 B9
	jsr $F819.w		; 20 19 F8
	clc		; 18
	inx		; E8
	clv		; B8
	bra  16.b		; 80 10
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	and ($18.b,S),Y		; 33 18
	tas		; 1B
	bcc -112.b		; 90 90
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $0C.b		; 00 0C
	brk $0F.b		; 00 0F
	rol $2680.w		; 2E 80 26
	brk $58.b		; 00 58
	ldy #$D4.b		; A0 D4
	plp		; 28
	and ($4C.b,S),Y		; 33 4C
	rts		; 60

	ora $670C73.l,X		; 1F 73 0C 67
	clc		; 18
	brk $5F.b		; 00 5F
	brk $DF.b		; 00 DF
	brk $04.b		; 00 04
	bpl  16.b		; 10 10
	ora ($11.b),Y		; 11 11
	rti		; 40

	rti		; 40

	ora ($13.b,S),Y		; 13 13
	ora [$07.b],Y		; 17 07
	cpy #$00.b		; C0 00
	php		; 08
	and $729F08.l,X		; 3F 08 9F 72
	and $EE0EF3.l,X		; 3F F3 0E EE
	sec		; 38
	ldy $B940.w,X		; BC 40 B9
	jmp ($DF00.w,X)		; 7C 00 DF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	sbc ($F1.b),Y		; F1 F1
	dec $C6.b		; C6 C6
	ldy $81BC.w,X		; BC BC 81
	sta ($38.b,X)		; 81 38
	tsb $F7.b		; 04 F7
	iny		; C8
	sbc $F8.b		; E5 F8
	and [$F8.b]		; 27 F8
	ora $C0.b,S		; 03 C0
	ora $FCFF1C.l,X		; 1F 1C FF FC
	eor ($DE.b,S),Y		; 53 DE
	brk $C0.b		; 00 C0
	tsb $04.b		; 04 04
	asl $04.b		; 06 04
	tsb $04.b		; 04 04
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	sbc $03FF1F.l		; EF 1F FF 03
	xce		; FB
	tsb $B0.b		; 04 B0
	eor $F0CF.w		; 4D CF F0
	cmp [$70.b]		; C7 70
	sbc $36.b,X		; F5 36
	sbc $00007F.l,X		; FF 7F 00 00
	jsr $3020.w		; 20 20 30
	bmi  32.b		; 30 20
	jsr $0000.w		; 20 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $03.b		; 02 03
	xce		; FB
	ora $FF.b,S		; 03 FF
	sta $FCE3.w,Y		; 99 E3 FC
	eor $3E.b,S		; 43 3E
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	sed		; F8
	jsr ($6666.w,X)		; FC 66 66
	ora $03.b,S		; 03 03
	rti		; 40

	eor ($DD.b,X)		; 41 DD
	ora $0DCD.w,X		; 1D CD 0D
	bpl   1.b		; 10 01
	jsr $FEB1.w		; 20 B1 FE
	asl $5EFE.w,X		; 1E FE 5E
	sed		; F8
	inc $A6B9.w		; EE B9 A6
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$FE.b		; C0 FE
	cpy #$FE.b		; C0 FE
	cop $FC.b		; 02 FC
	ora [$F8.b]		; 07 F8
	cpy #$76.b		; C0 76
	sty $DE32.w		; 8C 32 DE
	jsr $201E.w		; 20 1E 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $81.b		; 00 81
	tsb $1E8D.w		; 0C 8D 1E
	eor $FE1D1C.l,X		; 5F 1C 1D FE
	ora [$5E.b]		; 07 5E
	sta [$1F.b]		; 87 1F
	cmp $BD0082.l,X		; DF 82 00 BD
	rol $303F.w,X		; 3E 3F 30
	rol $1F20.w,X		; 3E 20 1F
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	jsr $2000.w		; 20 00 20
	bra -62.b		; 80 C2
	bra -63.b		; 80 C1
	php		; 08
	cmp #$1C.b		; C9 1C
	jmp.w [$9E1C]		; DC 1C 9E
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bvs 112.b		; 70 70
	cpx #$E0.b		; E0 E0
	trb $E300.w		; 1C 00 E3
	ora $9F.b,S		; 03 9F
	adc [$8F.b]		; 67 8F
	sbc ($00.b,S),Y		; F3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $E000.w		; 1C 00 E0
	brk $98.b		; 00 98
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	jsr $C020.w		; 20 20 C0
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
	brk $1D.b		; 00 1D
	ora ($3D.b,X)		; 01 3D
	ora $06FE.w		; 0D FE 06
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
	cpy $4ECC.w		; CC CC 4E
	inc $FEF4.w		; EE F4 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$60.b		; E0 60
	clv		; B8
	sei		; 78
	bra  64.b		; 80 40
	sec		; 38
	sed		; F8
	bcs -16.b		; B0 F0
	bra  96.b		; 80 60
	bpl  48.b		; 10 30
	cld		; D8
	cld		; D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($00.b,X)		; 01 00
	ora ($10.b,S),Y		; 13 10
	ora $0C6F0C.l		; 0F 0C 6F 0C
	sbc $31370E.l,X		; FF 0E 37 31
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	beq -16.b		; F0 F0
	asl $06.b		; 06 06
	sbc $0AFF07.l,X		; FF 07 FF 0A
	cpx $0B.b		; E4 0B
.INDEX 8
	sep #$1D		; E2 1D
	stx $35FF.w		; 8E FF 35
	inc $FB87.w,X		; FE 87 FB
	lda ($AE.b),Y		; B1 AE
	sec		; 38
	sec		; 38
	bcc -112.b		; 90 90
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $9B.b		; A4 9B
	inc $98.b		; E6 98
	cpx #$1F.b		; E0 1F
	ror $0FED.w,X		; 7E ED 0F
	stz $3E.b,X		; 74 3E
	cmp ($85.b,X)		; C1 85
	tda		; 7B
	sbc ($06.b),Y		; F1 06
	brk $20.b		; 00 20
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $0D10.w		; 2C 10 0D
	brk $0E.b		; 00 0E
	cpx #$03.b		; E0 03
	cpx #$D0.b		; E0 D0
	jsr $7080.w		; 20 80 70
	bcs  60.b		; B0 3C
	sbc $030000.l,X		; FF 00 00 03
	brk $F1.b		; 00 F1
	brk $11.b		; 00 11
	brk $1C.b		; 00 1C
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	bpl  16.b		; 10 10
	ora $01.b		; 05 01
	sta $00C700.l		; 8F 00 C7 00
	tas		; 1B
	ora $F3.b,S		; 03 F3
	brk $43.b		; 00 43
	bra   2.b		; 80 02
	rti		; 40

	bra   2.b		; 80 02
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $D8.b		; 00 D8
	brk $F8.b		; 00 F8
	cpy #$F0.b		; C0 F0
	cpy #$60.b		; C0 60
	rti		; 40

	bra   0.b		; 80 00
	mvp $9F,$FF		; 44 FF 9F
	sbc $81FD0F.l,X		; FF 0F FD 81
	sbc $08F780.l,X		; FF 80 F7 08
	bmi  79.b		; 30 4F
	and ($0C.b,S),Y		; 33 0C
	ora $7C.b,S		; 03 7C
	brk $20.b		; 00 20
	bpl  16.b		; 10 10
	sec		; 38
	sec		; 38
	and ($32.b)		; 32 32
	and ($B3.b,S),Y		; 33 B3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	inc A		; 1A
	plx		; FA
	txs		; 9A
	plx		; FA
	ldx $FCFE.w,Y		; BE FE FC
	cpy $00DF.w		; CC DF 00
	ror $F080.w,X		; 7E 80 F0
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	sec		; 38
	sec		; 38
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc A		; 1A
	clc		; 18
	and $041F04.l,X		; 3F 04 1F 04
	brk $00.b		; 00 00
	asl $0E08.w		; 0E 08 0E
	brk $8E.b		; 00 8E
	php		; 08
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	dec A		; 3A
	dec A		; 3A
	inc A		; 1A
	inc A		; 1A
	brk $00.b		; 00 00
	asl $06.b		; 06 06
	asl $860E.w		; 0E 0E 86
	sta [$7E.b]		; 87 7E
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	ora ($FF.b),Y		; 11 FF
	bpl  -5.b		; 10 FB
	cpx $F9.b		; E4 F9
	cmp [$7C.b]		; C7 7C
	stz $64.b		; 64 64
	ora $6262.w,X		; 1D 62 62
	rol $26.b		; 26 26
	ror $6C6E.w		; 6E 6E 6C
	jmp ($1818.w)		; 6C 18 18
	sec		; 38
	sec		; 38
	bpl  18.b		; 10 12
	brk $02.b		; 00 02
	ldx #$3E.b		; A2 3E
	pea $F437.w		; F4 37 F4
	and [$C4.b],Y		; 37 C4
	ora [$FE.b]		; 07 FE
	eor $7C8FFC.l,X		; 5F FC 8F 7C
	ora $EC.b,S		; 03 EC
	cmp $00.b,S		; C3 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	jsr $3020.w		; 20 20 30
	bmi  60.b		; 30 3C
	bit $0808.w,X		; 3C 08 08
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	rts		; 60

	cpy #$30.b		; C0 30
	jsr $2020.w		; 20 20 20
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
	inc $18.b		; E6 18
	cmp $0904.w,Y		; D9 04 09
	brk $E4.b		; 00 E4
	sbc $000C00.l,X		; FF 00 0C 00
	brk $09.b		; 00 09
	brk $F4.b		; 00 F4
	sbc $000C02.l,X		; FF 02 0C 00
	brk $F9.b		; 00 F9
	sbc $04FFD9.l,X		; FF D9 FF 04
	tsb $0000.w		; 0C 00 00
	sbc $E9FF.w,Y		; F9 FF E9
	sbc $000C06.l,X		; FF 06 0C 00
	brk $F9.b		; 00 F9
	sbc $08FFF9.l,X		; FF F9 FF 08
	tsb $0000.w		; 0C 00 00
	sbc #$FF.b		; E9 FF
	jmp.w [$0AFF]		; DC FF 0A
	tsb $0000.w		; 0C 00 00
	sbc #$FF.b		; E9 FF
	cpx $0CFF.w		; EC FF 0C
	tsb $0000.w		; 0C 00 00
	sbc #$FF.b		; E9 FF
	jsr ($0EFF.w,X)		; FC FF 0E
	tsb $0000.w		; 0C 00 00
	cmp $EDFF.w,Y		; D9 FF ED
	sbc $000C20.l,X		; FF 20 0C 00
	brk $C0.b		; 00 C0
	brk $30.b		; 00 30
	bmi 120.b		; 30 78
	ldy $FEF2.w,X		; BC F2 FE
	sbc ($7E.b)		; F2 7E
	sbc $00FB0B.l,X		; FF 0B FB 00
	sta $C00070.l		; 8F 70 00 C0
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	ldy #$A0.b		; A0 A0
	clv		; B8
	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rtl		; 6B

	beq  46.b		; F0 2E
	sbc ($87.b),Y		; F1 87
	eor $7F.b,S		; 43 7F
	sei		; 78
	cmp [$5D.b],Y		; D7 5D
	sbc $408793.l		; EF 93 87 40
	brk $81.b		; 00 81
	tsb $0808.w		; 0C 08 08
	php		; 08
	sty $84.b		; 84 84
	ora [$07.b]		; 07 07
	.db $82, $82, $00		; 82 82 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	bit $83.b		; 24 83
	adc $A08E7A.l		; 6F 7A 8E A0
	lda ($FD.b)		; B2 FD
	sbc $ECEC.w,X		; FD EC EC
	phy		; 5A
	plx		; FA
	inc A		; 1A
	plx		; FA
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3E01.w		; 0D 01 3E
	asl $3E.b		; 06 3E
	brk $9F.b		; 00 9F
	brk $FF.b		; 00 FF
	php		; 08
	tsa		; 3B
	bit $B9.b,X		; 34 B9
	and [$B4.b]		; 27 B4
	ora $0000.w		; 0D 00 00
	brk $01.b		; 00 01
	and ($32.b)		; 32 32
	stx $96.b,Y		; 96 96
	ldy $B4.b,X		; B4 B4
	php		; 08
	php		; 08
	tya		; 98
	tya		; 98
	bra -62.b		; 80 C2
	bcc -112.b		; 90 90
	beq  -8.b		; F0 F8
	pha		; 48
	sei		; 78
	beq 124.b		; F0 7C
	bcc  30.b		; 90 1E
	sed		; F8
	ldy $1EF3.w,X		; BC F3 1E
	cmp ($8D.b),Y		; D1 8D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	sta $70.b,S		; 83 70
	inx		; E8
	bpl -128.b		; 10 80
	sei		; 78
	adc $20FC80.l,X		; 7F 80 FC 20
	clc		; 18
	jsr $0063.w		; 20 63 00
	jsr $0009.w		; 20 09 00
	tsb $0700.w		; 0C 00 07
	brk $07.b		; 00 07
	php		; 08
	php		; 08
	brk $81.b		; 00 81
	brk $41.b		; 00 41
	brk $D2.b		; 00 D2
	ora ($F6.b,X)		; 01 F6
	and $00EF0C.l		; 2F 0C EF 00
	sta $0002.w		; 8D 02 00
	phd		; 0B
	bra  11.b		; 80 0B
	cpy #$2F.b		; C0 2F
	ora ($F7.b,X)		; 01 F7
	brk $02.b		; 00 02
	ora ($E1.b,X)		; 01 E1
	sta ($E1.b,X)		; 81 E1
	bra -64.b		; 80 C0
	brk $90.b		; 00 90
	brk $90.b		; 00 90
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	eor $00.b		; 45 00
	cop $80.b		; 02 80
	asl $C0.b,X		; 16 C0
	ror $80.b,X		; 76 80
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	tsb $0C00.w		; 0C 00 0C
	jsr $EF01.w		; 20 01 EF
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	jsr $6F2F.w		; 20 2F 6F
	sta ($13.b,S),Y		; 93 13
	jmp $6F80.w		; 4C 80 6F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	jmp ($106C.w)		; 6C 6C 10
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  13.b		; 80 0D
	sta $0000.w		; 8D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	ora $01.b,S		; 03 01
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	phd		; 0B
	ora $19.b,S		; 03 19
	ora ($24.b,X)		; 01 24
	rol $00.b,X		; 36 00
	brk $02.b		; 00 02
	cop $00.b		; 02 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($08.b,X)		; 01 08
	php		; 08
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	adc $15BE67.l		; 6F 67 BE 15
	sec		; 38
	eor $CE.b,S		; 43 CE
	bvc   1.b		; 50 01
	asl $350A.w		; 0E 0A 35
	asl $C621.w,X		; 1E 21 C6
	cmp #$08.b		; C9 08
	php		; 08
	ldy #$A0.b		; A0 A0
	brk $00.b		; 00 00
	bra -122.b		; 80 86
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	cop $02.b		; 02 02
	stz $CF61.w,X		; 9E 61 CF
	bpl 106.b		; 10 6A
	brk $F3.b		; 00 F3
	jsr $00CF.w		; 20 CF 00
	xba		; EB
	bit $27E0.w		; 2C E0 27
	lda $004F.w,X		; BD 4F 00
	brk $0E.b		; 00 0E
	ora WRMPYA.l		; 0F 02 42 00
	tsb $7D00.w		; 0C 00 7D
	bra -112.b		; 80 90
	cpy #$D8.b		; C0 D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $01011F.l,X		; 1F 1F 01 01
	asl $11.b,X		; 16 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $FF.b		; 00 FF
	brk $AF.b		; 00 AF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	sbc $AFAFFF.l,X		; FF FF AF AF
	and $D728C0.l,X		; 3F C0 28 D7
	brk $FF.b		; 00 FF
	eor $97.b,S		; 43 97
	sbc [$01.b],Y		; F7 01
	cmp $C3DF43.l,X		; DF 43 DF C3
	and ($08.b,S),Y		; 33 08
	rol $26.b		; 26 26
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	ldy $84.b,X		; B4 84
	sty $04.b		; 84 04
	tsb $00.b		; 04 00
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  96.b		; 80 60
	rts		; 60

	beq -16.b		; F0 F0
	ldy $FEFC.w,X		; BC FC FE
	ror $00.b,X		; 76 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sed		; F8
	brk $FF.b		; 00 FF
	brk $AF.b		; 00 AF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	sed		; F8
	sed		; F8
	sbc $AFAFFF.l,X		; FF FF AF AF
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
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	rts		; 60

	ror $7E60.w,X		; 7E 60 7E
	ora [$78.b]		; 07 78
	ldy #$BE.b		; A0 BE
	sty $9A.b		; 84 9A
	lsr $1490.w		; 4E 90 14
	iny		; C8
	sta $00.b		; 85 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $01.b		; 00 01
	tsb $05.b		; 04 05
	tsb $000D.w		; 0C 0D 00
	ora $00.b,S		; 03 00
	adc $1CF8.w,Y		; 79 F8 1C
	clv		; B8
	trb $030B.w		; 1C 0B 03
	stz $78.b,X		; 74 78
	adc $073C60.l,X		; 7F 60 3C 07
	ora [$04.b],Y		; 17 04
	ora $000000.l,X		; 1F 00 00 00
	brk $40.b		; 00 40
	brk $88.b		; 00 88
	brk $84.b		; 00 84
	brk $87.b		; 00 87
	bmi  56.b		; 30 38
	brk $01.b		; 00 01
	brk $80.b		; 00 80
	dey		; 88
	ror $C1.b,X		; 76 C1
	lda ($C2.b)		; B2 C2
	jsr $82CD.w		; 20 CD 82
	eor $43C2.w		; 4D C2 43
	sty $47.b		; 84 47
	brk $06.b		; 00 06
	ora ($02.b,X)		; 01 02
	ora ($42.b,X)		; 01 42
	eor $DDC0.w		; 4D C0 DD
	rti		; 40

	rti		; 40

	ora ($01.b,X)		; 01 01
	ora ($11.b,X)		; 01 11
	ora ($21.b,X)		; 01 21
	ora ($38.b,X)		; 01 38
	bcc  17.b		; 90 11
	trb $10.b		; 14 10
	bne   0.b		; D0 00
	brk $07.b		; 00 07
	sta $7D0F.w,X		; 9D 0F 7D
	sta $6E.b,S		; 83 6E
	bcc -20.b		; 90 EC
	asl $8000.w,X		; 1E 00 80
	brk $87.b		; 00 87
	brk $F7.b		; 00 F7
	brk $80.b		; 00 80
	bpl  16.b		; 10 10
	bit $6E3C.w,X		; 3C 3C 6E
	ror $E0E0.w		; 6E E0 E0
	php		; 08
	cpy #$0E.b		; C0 0E
	beq   0.b		; F0 00
	sbc $00F700.l,X		; FF 00 F7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cmp $FFFFF0.l		; CF F0 FF FF
	sbc $00F7F7.l,X		; FF F7 F7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	and $00FF00.l,X		; 3F 00 FF 00
	ldx $0000.w		; AE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $83.b,S		; 03 83
	and $FFFFFF.l,X		; 3F FF FF FF
	ldx $00AE.w		; AE AE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	cop $08.b		; 02 08
	ora ($0F.b,X)		; 01 0F
	brk $03.b		; 00 03
	brk $2F.b		; 00 2F
	jsr $131E.w		; 20 1E 13
	eor $0313.w,X		; 5D 13 03
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $0D.b		; 00 0D
	ora $0202.w		; 0D 02 02
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	sbc $DBFF33.l,X		; FF 33 FF DB
	rol $E5.b,X		; 36 E5
	sbc $32.b,X		; F5 32
	sbc $2F62.w,X		; FD 62 2F
	cmp $FF61.w,X		; DD 61 FF
	sta [$E8.b],Y		; 97 E8
	cpy #$C0.b		; C0 C0
	jsr $0020.w		; 20 20 00
	bpl -64.b		; 10 C0
	cpy $80.b		; C4 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	sed		; F8
	stp		; DB
	cpy #$F7.b		; C0 F7
	ror $D7.b,X		; 76 D7
	lsr $E6.b,X		; 56 E6
	sbc [$D6.b]		; E7 D6
	and $000738.l		; 2F 38 07 00
	ora ($01.b),Y		; 11 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8E.b		; 00 8E
	tsb $DC.b		; 04 DC
	eor ($FE.b,X)		; 41 FE
	and $20D438.l,X		; 3F 38 D4 20
	dec $6001.w,X		; DE 01 60
	cop $A1.b		; 02 A1
	trb $8A6F.w		; 1C 6F 8A
	txa		; 8A
	trb $001C.w		; 1C 1C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001000.l		; 0F 00 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	cop $07.b		; 02 07
	ora $01.b,S		; 03 01
	ora ($03.b,X)		; 01 03
	ora $01.b,S		; 03 01
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
	brk $07.b		; 00 07
	ora ($07.b,X)		; 01 07
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
	brk $05.b		; 00 05
	bra  20.b		; 80 14
	brk $EF.b		; 00 EF
	bpl -26.b		; 10 E6
	cop $F0.b		; 02 F0
	sbc $00FFE6.l,X		; FF E6 FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inc $FF.b		; E6 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc $FFF6FF.l		; EF FF F6 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	sbc $FFF6FF.l,X		; FF FF F6 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	ora $FFF600.l		; 0F 00 F6 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $07.b		; 06 07
	ora $01.b,S		; 03 01
	ora [$00.b]		; 07 00
	and $050612.l,X		; 3F 12 06 05
	ora [$05.b],Y		; 17 05
	jmp ($A03F.w,X)		; 7C 3F A0
	ora $00B7F4.l		; 0F F4 B7 00
	brk $04.b		; 00 04
	tsb $25.b		; 04 25
	and $02.b		; 25 02
	cop $12.b		; 02 12
	ora ($40.b)		; 12 40
	rti		; 40

	ldy #$A0.b		; A0 A0
	brk $00.b		; 00 00
	bne -48.b		; D0 D0
	brk $30.b		; 00 30
	beq -68.b		; F0 BC
	beq 120.b		; F0 78
	adc ($08.b)		; 72 08
	bvs  24.b		; 70 18
	rol $3B7E.w,X		; 3E 7E 3B
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CB.b		; 00 CB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $E512.w		; 0D 12 E5
	jsl $BD606B.l		; 22 6B 60 BD
	ldx $3734.w,Y		; BE 34 37
	bpl  14.b		; 10 0E
	php		; 08
	cop $00.b		; 02 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	txs		; 9A
	jmp ($65BA.w)		; 6C BA 65
	tsb $A0E4.w		; 0C E4 A0
	brk $F0.b		; 00 F0
	ora $80.b,S		; 03 80
	rts		; 60

	ldy $0078.w,X		; BC 78 00
	tsb $65.b		; 04 65
	tsb $05.b		; 04 05
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $73.b		; 00 73
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	eor $2809.w		; 4D 09 28
	brk $EC.b		; 00 EC
	ora [$8A.b]		; 07 8A
	stz $B5.b,X		; 74 B5
	lsr $6399.w		; 4E 99 63
	ldy #$17.b		; A0 17
	cpy #$00.b		; C0 00
	brk $E6.b		; 00 E6
	brk $FF.b		; 00 FF
	pha		; 48
	pha		; 48
	txa		; 8A
	txa		; 8A
	adc ($31.b),Y		; 71 31
	clc		; 18
	tya		; 98
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	sbc $274B8F.l		; EF 8F 4B 27
	bit $CB.b,X		; 34 CB
	tda		; 7B
	jmp ($EFDF.w)		; 6C DF EF
	adc ($87.b,S),Y		; 73 87
	ora $0B.b,X		; 15 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	jsr $1020.w		; 20 20 10
	bpl  16.b		; 10 10
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra  64.b		; 80 40
	cpy #$00.b		; C0 00
	bra -64.b		; 80 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora [$1F.b]		; 07 1F
	ora ($2C.b,X)		; 01 2C
	and $19.b,S		; 23 19
	ora [$3A.b],Y		; 17 3A
	and #$FB.b		; 29 FB
	trb $40DB.w		; 1C DB 40
.INDEX 16
	rep #$DC		; C2 DC
	brk $00.b		; 00 00
	inc A		; 1A
	inc A		; 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	cpx #$80E0.w		; E0 E0 80
	dey		; 88
	brk $01.b		; 00 01
	sbc [$50.b]		; E7 50
	sta ($AA.b),Y		; 91 AA
	bvs -36.b		; 70 DC
	asl $EFF0.w,X		; 1E F0 EF
	bpl 127.b		; 10 7F
	sty $BC.b		; 84 BC
	brk $74.b		; 00 74
	cop $83.b		; 02 83
	sta [$00.b]		; 87 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora ($02.b,X)		; 01 02
	cop $60.b		; 02 60
	bvs   0.b		; 70 00
	pha		; 48
	brk $DD.b		; 00 DD
	and ($05.b,S),Y		; 33 05
	ora $08AF0B.l,X		; 1F 0B AF 08
	adc $078000.l		; 6F 00 80 07
	rti		; 40

	ora [$81.b]		; 07 81
	ror $8403.w,X		; 7E 03 84
	bmi -14.b		; 30 F2
	brk $80.b		; 00 80
	cop $62.b		; 02 62
	.db $42, $E2		; 42 E2
	brk $50.b		; 00 50
	brk $D0.b		; 00 D0
	brk $00.b		; 00 00
	.db $82, $42, $80		; 82 42 80
	bra -96.b		; 80 A0
	cpx #$50F0.w		; E0 F0 50
	jsr ($F000.w,X)		; FC 00 F0
	brk $60.b		; 00 60
	bcc  56.b		; 90 38
	clv		; B8
	ldy $001C.w,X		; BC 1C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$2020.w		; C0 20 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tas		; 1B
	tas		; 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($14.b,X)		; 01 14
	ora ($BE.b,X)		; 01 BE
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	trb $15.b		; 14 15
	ldx $1EBF.w,Y		; BE BF 1E
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	ora $C0.b,S		; 03 C0
	ora $F600.w		; 0D 00 F6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	ora $E3.b,S		; 03 E3
	ora $F6FD.w		; 0D FD F6
	inc $00.b,X		; F6 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E400.w		; E0 00 E4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E4E0.w		; E0 E0 E4
	cpx $00.b		; E4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F8.b		; 00 F8
	ora [$F3.b]		; 07 F3
	brk $F8.b		; 00 F8
	sbc $00FFF3.l,X		; FF F3 FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	ora ($0C.b,X)		; 01 0C
	brk $00.b		; 00 00
	sed		; F8
	sbc $02FFFB.l,X		; FF FB FF 02
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	xce		; FB
	sbc $000C03.l,X		; FF 03 0C 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	cop $06.b		; 02 06
	ora [$1F.b]		; 07 1F
	trb $0419.w		; 1C 19 04
	rol $C710.w,X		; 3E 10 C7
	cop $11.b		; 02 11
	ror $00.b		; 66 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	ora $10.b,S		; 03 10
	ora ($00.b)		; 12 00
	brk $84.b		; 00 84
	sty $10.b		; 84 10
	clc		; 18
	ldy #$C060.w		; A0 60 C0
	rts		; 60

	cpy #$6020.w		; C0 20 60
	brk $F0.b		; 00 F0
	clc		; 18
	tsb $0090.w		; 0C 90 00
	bit $161E.w,X		; 3C 1E 16
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	cpx #$8000.w		; E0 00 80
	bra   0.b		; 80 00
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	dec $C1.b,X		; D6 C1
	tay		; A8
	sec		; 38
	php		; 08
	tsb $01.b		; 04 01
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	trb $00.b		; 14 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora ($07.b,X)		; 01 07
	ora [$07.b]		; 07 07
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	adc ($7E.b,S),Y		; 73 7E
	txs		; 9A
	brk $26.b		; 00 26
	bra   0.b		; 80 00
	brk $58.b		; 00 58
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	stz $64.b		; 64 64
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	cli		; 58
	cld		; D8
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $F9.b		; 00 F9
	ora [$FE.b]		; 07 FE
	ora $F9.b,S		; 03 F9
	sbc $00FFFE.l,X		; FF FE FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	inc $01FF.w,X		; FE FF 01
	asl $0000.w		; 0E 00 00
	cpy #$70C3.w		; C0 C3 70
	adc $FF3F06.l,X		; 7F 06 3F FF
	sbc ($01.b),Y		; F1 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $24.b		; 00 24
	bra  -2.b		; 80 FE
	cpx #$F83C.w		; E0 3C F8
	ror $80CE.w,X		; 7E CE 80
	rts		; 60

	rts		; 60

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	ora $FE.b		; 05 FE
	cop $FB.b		; 02 FB
	sbc $00FFFE.l,X		; FF FE FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	inc $01FF.w,X		; FE FF 01
	asl $0000.w		; 0E 00 00
	sta ($8C.b,X)		; 81 8C
	sbc $FF.b,S		; E3 FF
	sbc $0304E6.l,X		; FF E6 04 03
	ora $02.b,S		; 03 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
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
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jsr ($FF03.w,X)		; FC 03 FF
	ora ($FC.b,X)		; 01 FC
	sbc $00FFFF.l,X		; FF FF FF 00
	asl $0000.w		; 0E 00 00
	cmp $DBF7FC.l		; CF FC F7 DB
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $FF02.w,X		; FE 02 FF
	brk $FE.b		; 00 FE
	sbc $00FFFF.l,X		; FF FF FF 00
	asl $0000.w		; 0E 00 00
	clc		; 18
	jsr $A8F8.w		; 20 F8 A8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$FE.b]		; 07 FE
	ora ($FF.b,X)		; 01 FF
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	sbc $F40B.w,Y		; F9 0B F4
	ora $FB.b,S		; 03 FB
	sbc $00FFF4.l,X		; FF F4 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	pea $01FF.w		; F4 FF 01
	tsb $0000.w		; 0C 00 00
	sbc $FCFF.w,Y		; F9 FF FC
	sbc $000C02.l,X		; FF 02 0C 00
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	sbc $000C03.l,X		; FF 03 0C 00
	brk $09.b		; 00 09
	brk $FC.b		; 00 FC
	sbc $000C04.l,X		; FF 04 0C 00
	brk $00.b		; 00 00
	trb $2418.w		; 1C 18 24
	php		; 08
	bit $18.b,X		; 34 18
	stz $0C.b		; 64 0C
	adc ($00.b)		; 72 00
	inc $1EE0.w,X		; FE E0 1E
	cpy #$1C3E.w		; C0 3E 1C
	ora $24.b,S		; 03 24
	tas		; 1B
	bit $0B.b,X		; 34 0B
	stz $1B.b		; 64 1B
	adc ($0D.b)		; 72 0D
	inc $1E01.w,X		; FE 01 1E
	sbc ($3E.b,X)		; E1 3E
	cmp ($80.b,X)		; C1 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $08.b		; 00 08
	adc ($0D.b)		; 72 0D
	eor #$34.b		; 49 34
	brk $7F.b		; 00 7F
	ora $7C.b,S		; 03 7C
	asl $0470.w		; 0E 70 04
	sei		; 78
	lda $001200.l,X		; BF 00 12 00
	ora $3470.w		; 0D 70 34
	lsr A		; 4A
	adc $007C00.l,X		; 7F 00 7C 00
	bvs   1.b		; 70 01
	sei		; 78
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $82.b		; 00 82
	brk $0F.b		; 00 0F
	brk $26.b		; 00 26
	brk $33.b		; 00 33
	brk $11.b		; 00 11
	brk $7F.b		; 00 7F
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	adc $007D00.l,X		; 7F 00 7D 00
	beq   0.b		; F0 00
	cmp $CC00.w,Y		; D9 00 CC
	brk $EE.b		; 00 EE
	brk $00.b		; 00 00
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
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	ora #$F7.b		; 09 F7
	cop $FB.b		; 02 FB
	sbc $00FFFB.l,X		; FF FB FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	xce		; FB
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FC.b		; 00 FC
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	rts		; 60

	asl $1E61.w,X		; 1E 61 1E
	stx $70.b		; 86 70
	brk $FC.b		; 00 FC
	ora $10F0.w		; 0D F0 10
	cpx #$007D.w		; E0 7D 00
	plp		; 28
	brk $1E.b		; 00 1E
	adc ($1E.b,X)		; 61 1E
	rts		; 60

	bvs -119.b		; 70 89
	jsr ($F003.w,X)		; FC 03 F0
	cop $E0.b		; 02 E0
	ora $000000.l		; 0F 00 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $20.b		; 00 20
	brk $94.b		; 00 94
	brk $FA.b		; 00 FA
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	bra   0.b		; 80 00
	cld		; D8
	brk $68.b		; 00 68
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   8.b		; 30 08
	bpl  40.b		; 10 28
	bmi  72.b		; 30 48
	ora ($FC.b,X)		; 01 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	rol $28.b,X		; 36 28
	ora [$48.b],Y		; 17 48
	and [$FC.b],Y		; 37 FC
	cop $03.b		; 02 03
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	asl $F9.b		; 06 F9
	ora ($FC.b,X)		; 01 FC
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	sbc $01FF.w,Y		; F9 FF 01
	tsb $0000.w		; 0C 00 00
	sbc $01FF.w,X		; FD FF 01
	brk $02.b		; 00 02
	tsb $0000.w		; 0C 00 00
	bmi   0.b		; 30 00
	bmi  64.b		; 30 40
	cop $78.b		; 02 78
	eor [$38.b]		; 47 38
	cld		; D8
	jsr $F001.w		; 20 01 F0
	rol $C0.b,X		; 36 C0
	adc [$00.b],Y		; 77 00
	brk $3C.b		; 00 3C
	rti		; 40

	rol $0478.w,X		; 3E 78 04
	sec		; 38
	rti		; 40

	jsr $F0C7.w		; 20 C7 F0
	asl $09C0.w		; 0E C0 09
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A2.b		; 00 A2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $FC.b,S		; 03 FC
	ora ($FE.b,X)		; 01 FE
	sbc $00FFFC.l,X		; FF FC FF 00
	tsb $0000.w		; 0C 00 00
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	tya		; 98
	rts		; 60

	tsb $44E0.w		; 0C E0 44
	bra   8.b		; 80 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	bpl -32.b		; 10 E0
	bpl  96.b		; 10 60
	bra -32.b		; 80 E0
	bpl -128.b		; 10 80
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	inc $FFFF.w,X		; FE FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	tsb $0000.w		; 0C 00 00
	rti		; 40

	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	inc $09.b,X		; F6 09
	sbc $02.b,X		; F5 02
	sbc $F5FF.w,Y		; F9 FF F5
	sbc $000C00.l,X		; FF 00 0C 00
	brk $01.b		; 00 01
	brk $F5.b		; 00 F5
	sbc $000C01.l,X		; FF 01 0C 00
	brk $F6.b		; 00 F6
	sbc $02FFFD.l,X		; FF FD FF 02
	tsb $0000.w		; 0C 00 00
	inc $FDFF.w,X		; FE FF FD
	sbc $000C03.l,X		; FF 03 0C 00
	brk $06.b		; 00 06
	brk $FD.b		; 00 FD
	sbc $000C04.l,X		; FF 04 0C 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $03.b,S		; 03 03
	ora $07.b,S		; 03 07
	ora [$0E.b]		; 07 0E
	ora $010F04.l		; 0F 04 0F 01
	adc $01FF47.l,X		; 7F 47 FF 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sed		; F8
	tsb $F0.b		; 04 F0
	trb $32E0.w		; 1C E0 32
	cpy #$C01C.w		; C0 1C C0
	stx $F0.b		; 86 F0
	bra  -2.b		; 80 FE
	bra  -2.b		; 80 FE
	sed		; F8
	brk $F0.b		; 00 F0
	php		; 08
	cpx #$C000.w		; E0 00 C0
	tsb $22C0.w		; 0C C0 22
	beq   8.b		; F0 08
	inc $FE00.w,X		; FE 00 FE
	brk $3D.b		; 00 3D
	and $393D3A.l,X		; 3F 3A 3D 39
	rol $3F60.w,X		; 3E 60 3F
	lda [$00.b],Y		; B7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $003D00.l,X		; 3F 00 3D 00
	rol $3F00.w,X		; 3E 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	jsr ($F800.w,X)		; FC 00 F8
	bra 112.b		; 80 70
	cmp ($20.b,X)		; C1 20
	sbc $006D00.l,X		; FF 00 6D 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($F803.w,X)		; FC 03 F8
	ora [$70.b]		; 07 70
	ora $001E20.l		; 0F 20 1E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sed		; F8
	asl $F8.b		; 06 F8
	cop $F8.b		; 02 F8
	sbc $00FFFB.l,X		; FF FB FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	xce		; FB
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FE.b		; 00 FE
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	cop $07.b		; 02 07
	ora ($1F.b,X)		; 01 1F
	ora $3F.b,S		; 03 3F
	ror $7F.b,X		; 76 7F
	ror $79.b		; 66 79
.ACCU 16
.INDEX 16
	rep #$7D		; C2 7D
	adc $000100.l,X		; 7F 00 01 00
	ora [$00.b]		; 07 00
	ora $003F00.l,X		; 1F 00 3F 00
	adc $007900.l,X		; 7F 00 79 00
	adc $0000.w,X		; 7D 00 00
	brk $00.b		; 00 00
	brk $8C.b		; 00 8C
	cpx #$FC80.w		; E0 80 FC
	bra  -4.b		; 80 FC
	brk $E0.b		; 00 E0
	tsb $80.b		; 04 80
	asl $FC00.w,X		; 1E 00 FC
	brk $70.b		; 00 70
	brk $E0.b		; 00 E0
	bpl  -4.b		; 10 FC
	brk $FC.b		; 00 FC
	brk $E0.b		; 00 E0
	trb $7880.w		; 1C 80 78
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $78.b		; 02 78
	lsr $78.b		; 46 78
	cmp #$00F0.w		; C9 F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	tsb $78.b		; 04 78
	brk $F0.b		; 00 F0
	asl $02.b		; 06 02
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	ora $FA.b,S		; 03 FA
	ora ($FB.b,X)		; 01 FB
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	plx		; FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $00.b		; 00 00
	asl $1C1A.w		; 0E 1A 1C
	trb $1E.b		; 14 1E
	tsb $D07F.w		; 0C 7F D0
	inc $EC90.w,X		; FE 90 EC
	sbc $000B00.l,X		; FF 00 0B 00
	asl $1C01.w		; 0E 01 1C
	ora ($1E.b,X)		; 01 1E
	ora ($7F.b,X)		; 01 7F
	brk $FE.b		; 00 FE
	ora ($EC.b,X)		; 01 EC
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FC.b		; 00 FC
	cop $FC.b		; 02 FC
	brk $FC.b		; 00 FC
	sbc $00FFFC.l,X		; FF FC FF 00
	tsb $0000.w		; 0C 00 00
	trb $18.b		; 14 18
	brk $38.b		; 00 38
	cpx #$86F8.w		; E0 F8 86
	beq  28.b		; F0 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $38.b		; 00 38
	tsb $F8.b		; 04 F8
	tsb $F0.b		; 04 F0
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	sbc $FFFEFE.l,X		; FF FE FE FF
	inc $00FF.w,X		; FE FF 00
	tsb $0000.w		; 0C 00 00
	rti		; 40

	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FB.b		; 00 FB
	ora $F6.b		; 05 F6
	ora ($FE.b,X)		; 01 FE
	sbc $00FFF6.l,X		; FF F6 FF 00
	asl $0000.w		; 0E 00 00
	inc $FEFF.w,X		; FE FF FE
	sbc $000E01.l,X		; FF 01 0E 00
	brk $F6.b		; 00 F6
	sbc $02FFF9.l,X		; FF F9 FF 02
	asl $0000.w		; 0E 00 00
	php		; 08
	clc		; 18
	clc		; 18
	sec		; 38
	bpl  48.b		; 10 30
	bpl  54.b		; 10 36
	rol $FC.b,X		; 36 FC
	dec $4EF8.w		; CE F8 4E
	pea $F02A.w		; F4 2A F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp.w [$ECA8]		; DC A8 EC
	sei		; 78
	sbc $007A60.l,X		; FF 60 7A 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	cop $03.b		; 02 03
	ora ($06.b,X)		; 01 06
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
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	tsb $03.b		; 04 03
	sed		; F8
	brk $FC.b		; 00 FC
	sbc $00FFF8.l,X		; FF F8 FF 00
	asl $0000.w		; 0E 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	tsb $081C.w		; 0C 1C 08
	clc		; 18
	php		; 08
	phx		; DA
	rol $3C.b		; 26 3C
	stx $F8.b		; 86 F8
	lsr $B8.b,X		; 56 B8
	stz $1C.b,X		; 74 1C
	and $000010.l,X		; 3F 10 00 00
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
	sbc $FA02.w,X		; FD 02 FA
	brk $FD.b		; 00 FD
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	bpl  48.b		; 10 30
	brk $A8.b		; 00 A8
	cli		; 58
	bvs -104.b		; 70 98
	inx		; E8
	cli		; 58
	bvs 124.b		; 70 7C
	jsr $0030.w		; 20 30 00
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
	ora $00.b,S		; 03 00
	jsr ($FEFF.w,X)		; FC FF FE
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	brk $40.b		; 00 40
	jsr $A060.w		; 20 60 A0
	rts		; 60

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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	asl $0000.w		; 0E 00 00
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
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	sbc ($0F.b)		; F2 0F
	sep #$04		; E2 04
	sbc ($FF.b)		; F2 FF
	sbc $FF.b,X		; F5 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc $FF.b,X		; F5 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	sbc $FF.b		; E5 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc $FF.b		; E5 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sbc $D5FF.w,X		; FD FF D5
	sbc $000E08.l,X		; FF 08 0E 00
	brk $37.b		; 00 37
	bvs   3.b		; 70 03
	adc $1D13.w,X		; 7D 13 1D
	ora [$0E.b],Y		; 17 0E
	ora $CF0546.l,X		; 1F 46 05 CF
	dec $FB.b		; C6 FB
	adc ($FC.b,S),Y		; 73 FC
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc [$C8.b],Y		; 77 C8
	ldy #$F1DF.w		; A0 DF F1
	asl $E77F.w		; 0E 7F E7
	and $30DFF0.l,X		; 3F F0 DF 30
	eor $6FB8.w		; 4D B8 6F
	tya		; 98
	brk $06.b		; 00 06
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $C7.b		; 00 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $F0EFE0.l,X		; 7F E0 EF F0
	sbc [$C0.b],Y		; F7 C0
	sbc $8DEE5C.l,X		; FF 5C EE 8D
	cmp $39FF38.l,X		; DF 38 FF 39
	sbc $1E0031.l,X		; FF 31 00 1E
	brk $0E.b		; 00 0E
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clv		; B8
	sei		; 78
	jsr ($6C70.w,X)		; FC 70 6C
	brk $F0.b		; 00 F0
	bmi -16.b		; 30 F0
	bvs -20.b		; 70 EC
	jmp ($9C98.w)		; 6C 98 9C
	sed		; F8
	cld		; D8
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($07.b,X)		; 01 07
	ora $07.b		; 05 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0E1E.w		; 0D 1E 0E
	and $3E0D.w,X		; 3D 0D 3E
	pei ($FF.b)		; D4 FF
	sta $FBC7FB.l,X		; 9F FB C7 FB
	inc A		; 1A
	sbc $00FD82.l		; EF 82 FD 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $C0.b		; 00 C0
	cpy #$E060.w		; C0 60 E0
	bvs -16.b		; 70 F0
	bcs  48.b		; B0 30
	tay		; A8
	cli		; 58
	sec		; 38
	cld		; D8
	ply		; 7A
	stz $1CFA.w,X		; 9E FA 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $C2.b		; 00 C2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and #$0F7E.w		; 29 7E 0F
	and $001D02.l,X		; 3F 02 1D 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
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
	iny		; C8
	ldx $DFC4.w,Y		; BE C4 DF
	stz $EF.b		; 64 EF
	ora ($7F.b)		; 12 7F
	brk $DF.b		; 00 DF
	brk $6D.b		; 00 6D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D2.b		; 00 D2
	eor $F7.b,S		; 43 F7
	adc $FE.b,S		; 63 FE
	rti		; 40

	sed		; F8
	brk $FE.b		; 00 FE
	brk $EF.b		; 00 EF
	brk $79.b		; 00 79
	brk $E4.b		; 00 E4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0F.b		; 00 0F
	ora $0F1C07.l		; 0F 07 1C 0F
	trb $1D06.w		; 1C 06 1D
	rol $0CFD.w,X		; 3E FD 0C
	sbc $277F1E.l		; EF 1E 7F 27
	rts		; 60

	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	ora ($EC.b,S),Y		; 13 EC
	xba		; EB
	trb $8C6B.w		; 1C 6B 8C
	adc $CC378C.l,X		; 7F 8C 37 CC
	bvs -49.b		; 70 CF
	tsa		; 3B
	cmp [$7F.b]		; C7 7F
	cmp $00.b,S		; C3 00
	bpl   0.b		; 10 00
	sbc ($00.b,X)		; E1 00
	eor $00.b,S		; 43 00
	and ($00.b,S),Y		; 33 00
	and ($00.b,S),Y		; 33 00
	brk $00.b		; 00 00
	clc		; 18
	brk $1C.b		; 00 1C
	dec $0F38.w,X		; DE 38 0F
	sbc [$2E.b]		; E7 2E
	cmp [$FF.b]		; C7 FF
	sta $DBCC72.l		; 8F 72 CC DB
	jmp.w [$98FF]		; DC FF 98
	inc $0098.w,X		; FE 98 00
	dec $00.b		; C6 00
	brk $00.b		; 00 00
	jsr $7000.w		; 20 00 70
	brk $30.b		; 00 30
	brk $01.b		; 00 01
	brk $61.b		; 00 61
	brk $66.b		; 00 66
	bra -128.b		; 80 80
	brk $C0.b		; 00 C0
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$E0E0.w		; E0 E0 E0
	cld		; D8
	cli		; 58
	cld		; D8
	clc		; 18
	sei		; 78
	sed		; F8
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
	bmi 112.b		; 30 70
	jsr $6270.w		; 20 70 62
	plx		; FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bpl   0.b		; 10 00
	sbc $0B.b,X		; F5 0B
	inx		; E8
	ora $F5.b,S		; 03 F5
	sbc $00FFE8.l,X		; FF E8 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	inx		; E8
	sbc $000E02.l,X		; FF 02 0E 00
	brk $F5.b		; 00 F5
	sbc $04FFF8.l,X		; FF F8 FF 04
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	sed		; F8
	sbc $000E06.l,X		; FF 06 0E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	ora $02.b,S		; 03 02
	ora [$02.b]		; 07 02
	ora [$04.b]		; 07 04
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	mvp $5C,$F4		; 44 F4 5C
	cpx $DC64.w		; EC 64 DC
	txa		; 8A
	sbc ($F9.b)		; F2 F9
	sbc [$33.b],Y		; F7 33
	sbc $007BE7.l,X		; FF E7 7B 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	jsr $0000.w		; 20 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $84.b		; 00 84
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $1B3D34.l		; 2F 34 3D 1B
	and $169B.w,X		; 3D 9B 16
	sta $F2ED.w,X		; 9D ED F2
	eor [$FA.b]		; 47 FA
	ora $350A7E.l,X		; 1F 7E 0A 35
	brk $01.b		; 00 01
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	stz $FF6C.w,X		; 9E 6C FF
	and [$FD.b],Y		; 37 FD
	bit #$83FF.w		; 89 FF 83
	adc $44FEC2.l,X		; 7F C2 FE 44
	inc $FF04.w		; EE 04 FF
	tsb $00.b		; 04 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DE.b		; 00 DE
	brk $F8.b		; 00 F8
	dey		; 88
	clv		; B8
	cld		; D8
	inc $FC1E.w,X		; FE 1E FC
	stz $18.b,X		; 74 18
	bvs -16.b		; 70 F0
	rti		; 40

	bra   0.b		; 80 00
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
	trb $1F1F.w		; 1C 1F 1F
	bmi  29.b		; 30 1D
	and ($19.b)		; 32 19
	rol $11.b,X		; 36 11
	dec $FE39.w,X		; DE 39 FE
	eor $7DC2.w,X		; 5D C2 7D
	sep #$00		; E2 00
	brk $00.b		; 00 00
	ora $000C00.l		; 0F 00 0C 00
	ora #$0000.w		; 09 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	lda $CC7143.l,X		; BF 43 71 CC
	adc ($4C.b),Y		; 71 4C
	sbc $7F8F49.l,X		; FF 49 8F 7F
	sbc $3BFF3B.l,X		; FF 3B FF 3B
	lda [$4C.b],Y		; B7 4C
	brk $8C.b		; 00 8C
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $B6.b		; 00 B6
	brk $00.b		; 00 00
	brk $C4.b		; 00 C4
	brk $C4.b		; 00 C4
	brk $23.b		; 00 23
	ldy #$C020.w		; A0 20 C0
	beq -80.b		; F0 B0
	beq  -8.b		; F0 F8
	sed		; F8
	stz $94.b,X		; 74 94
	pea $9C04.w		; F4 04 9C
	bit $1CEC.w,X		; 3C EC 1C
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	asl $00.b		; 06 00
	ora #$0000.w		; 09 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FD.b		; 00 FD
	brk $57.b		; 00 57
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
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $50.b		; 00 50
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
	brk $03.b		; 00 03
	bra  12.b		; 80 0C
	brk $F8.b		; 00 F8
	php		; 08
	inc $F802.w		; EE 02 F8
	sbc $00FFEE.l,X		; FF EE FF 00
	asl $0000.w		; 0E 00 00
	php		; 08
	brk $EE.b		; 00 EE
	sbc $000E02.l,X		; FF 02 0E 00
	brk $F9.b		; 00 F9
	sbc $04FFFE.l,X		; FF FE FF 04
	asl $0000.w		; 0E 00 00
	ora ($01.b,X)		; 01 01
	ora ($03.b,X)		; 01 03
	ora ($07.b,X)		; 01 07
	phd		; 0B
	ora $020E09.l		; 0F 09 0E 02
	and $3D32.w,X		; 3D 32 3D
	bit $69.b,X		; 34 69
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	cpy #$2040.w		; C0 40 20
	cpx #$A060.w		; E0 60 A0
	bcs -48.b		; B0 D0
	bmi -40.b		; 30 D8
	cld		; D8
	bmi -70.b		; 30 BA
	lsr $0000.w		; 4E 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $48.b		; 00 48
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
	ror $37F2.w,X		; 7E F2 37
	dex		; CA
	ora $002B00.l		; 0F 00 2B 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp.w [$F048]		; DC 48 F0
	brk $F0.b		; 00 F0
	brk $6C.b		; 00 6C
	brk $D0.b		; 00 D0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	adc #$B926.w		; 69 26 B9
	and [$88.b],Y		; 37 88
	adc [$C8.b],Y		; 77 C8
	lsr $7761.w,X		; 5E 61 77
	ldx $B62B.w,Y		; BE 2B B6
	cmp $EA.b,X		; D5 EA
	brk $16.b		; 00 16
	brk $00.b		; 00 00
	brk $33.b		; 00 33
	brk $31.b		; 00 31
	brk $04.b		; 00 04
	brk $41.b		; 00 41
	brk $09.b		; 00 09
	brk $00.b		; 00 00
	sbc $DA565F.l,X		; FF 5F 56 DA
	xce		; FB
	cmp ($BD.b,S),Y		; D3 BD
	adc $EF.b,S		; 63 EF
	rti		; 40

	xce		; FB
	eor $FF33DF.l,X		; 5F DF 33 FF
	rol $00.b		; 26 00
	ldy #$0400.w		; A0 00 04
	brk $28.b		; 00 28
	brk $18.b		; 00 18
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
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
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	xce		; FB
	ora $F4.b		; 05 F4
	ora ($FB.b,X)		; 01 FB
	sbc $00FFF4.l,X		; FF F4 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	pea $01FF.w		; F4 FF 01
	asl $0000.w		; 0E 00 00
	xce		; FB
	sbc $02FFFC.l,X		; FF FC FF 02
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	jsr ($03FF.w,X)		; FC FF 03
	asl $0000.w		; 0E 00 00
	php		; 08
	tsb $1E0A.w		; 0C 0A 1E
	asl $2234.w		; 0E 34 22
	adc $4B75.w,X		; 7D 75 4B
	eor $EC5769.l,X		; 5F 69 57 EC
	sbc $000082.l,X		; FF 82 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $34.b		; 00 34
	brk $16.b		; 00 16
	brk $02.b		; 00 02
	brk $49.b		; 00 49
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$80C0.w		; C0 C0 80
	brk $C0.b		; 00 C0
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	adc $726D5D.l,X		; 7F 5D 6D 72
	ldy $0FC0.w,X		; BC C0 0F
	sei		; 78
	and $000300.l		; 2F 00 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$E040.w		; C0 40 E0
	rts		; 60

	rti		; 40

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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $FA.b		; 02 FA
	brk $FE.b		; 00 FE
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	brk $60.b		; 00 60
	brk $F0.b		; 00 F0
	sed		; F8
	tya		; 98
	sed		; F8
	php		; 08
	clv		; B8
	iny		; C8
	bmi -64.b		; 30 C0
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $90.b		; 00 90
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$2480.w		; 09 80 24
	brk $EE.b		; 00 EE
	ora ($D4.b,S),Y		; 13 D4
	asl $FC.b		; 06 FC
	sbc $00FFD4.l,X		; FF D4 FF 00
	asl $0000.w		; 0E 00 00
	inc $E4FF.w		; EE FF E4
	sbc $000E02.l,X		; FF 02 0E 00
	brk $FE.b		; 00 FE
	sbc $04FFE4.l,X		; FF E4 FF 04
	asl $0000.w		; 0E 00 00
	asl $E400.w		; 0E 00 E4
	sbc $000E06.l,X		; FF 06 0E 00
	brk $EF.b		; 00 EF
	sbc $08FFF4.l,X		; FF F4 FF 08
	asl $0000.w		; 0E 00 00
	sbc $FFF4FF.l,X		; FF FF F4 FF
	asl A		; 0A
	asl $0000.w		; 0E 00 00
	ora $FFF400.l		; 0F 00 F4 FF
	tsb $000E.w		; 0C 0E 00
	brk $F1.b		; 00 F1
	sbc $0E0004.l,X		; FF 04 00 0E
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	tsb $00.b		; 04 00
	jsr $000E.w		; 20 0E 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	bra -128.b		; 80 80
	rts		; 60

	brk $40.b		; 00 40
	rti		; 40

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	rts		; 60

	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rti		; 40

	brk $80.b		; 00 80
	php		; 08
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
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $0E.b		; 00 0E
	brk $10.b		; 00 10
	brk $03.b		; 00 03
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
	brk $40.b		; 00 40
	lda ($50.b),Y		; B1 50
	and $01EA14.l		; 2F 14 EA 01
	inc $1001.w,X		; FE 01 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $0800.w		; 1C 00 08
	rti		; 40

	brk $70.b		; 00 70
	brk $1C.b		; 00 1C
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	bra   1.b		; 80 01
	tsb $81.b		; 04 81
	dey		; 88
	ora ($B0.b),Y		; 11 B0
	ora ($E0.b,X)		; 01 E0
	ora ($EC.b,X)		; 01 EC
	ora ($80.b)		; 12 80
	cop $F0.b		; 02 F0
	ora $088004.l		; 0F 04 80 08
	sty $00.b		; 84 00
	dey		; 88
	brk $B0.b		; 00 B0
	brk $E0.b		; 00 E0
	ora ($FC.b,X)		; 01 FC
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	ora ($5E.b,X)		; 01 5E
	bvc -81.b		; 50 AF
	brk $02.b		; 00 02
	tsb $0023.w		; 0C 23 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	jmp $100000.l		; 5C 00 00 10
	rol $0000.w		; 2E 00 00
	brk $30.b		; 00 30
	brk $70.b		; 00 70
	jsr $00DC.w		; 20 DC 00
	bra   0.b		; 80 00
	cpx #$2000.w		; E0 00 20
	bpl  32.b		; 10 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cop $4D.b		; 02 4D
	clc		; 18
	cpx $00.b		; E4 00
	php		; 08
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	rti		; 40

	and $010318.l		; 2F 18 03 01
	brk $15.b		; 00 15
	php		; 08
	ldy #$0050.w		; A0 50 00
	rol $00.b		; 26 00
	bit $80.b		; 24 80
	ora ($90.b,X)		; 01 90
	eor ($00.b,X)		; 41 00
	ora $0102.w,Y		; 19 02 01
	cop $1D.b		; 02 1D
	cop $A0.b		; 02 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	stx $C031.w		; 8E 31 C0
	bit $6C93.w,X		; 3C 93 6C
	bpl   0.b		; 10 00
	txs		; 9A
	rti		; 40

	bne  15.b		; D0 0F
	cli		; 58
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	stx $D800.w		; 8E 00 D8
	brk $9F.b		; 00 9F
	cpx BG2VOFS.w		; EC 10 21
	txs		; 9A
	brk $D8.b		; 00 D8
	brk $D8.b		; 00 D8
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	ora $02F070.l		; 0F 70 F0 02
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	brk $08.b		; 00 08
	and #$1052.w		; 29 52 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00F000.l		; 0F 00 F0 00
	brk $80.b		; 00 80
	brk $E4.b		; 00 E4
	brk $84.b		; 00 84
	and #$5820.w		; 29 20 58
	rti		; 40

	bmi -64.b		; 30 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  32.b		; 80 20
	bcc -128.b		; 90 80
	rti		; 40

	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	rti		; 40

	brk $70.b		; 00 70
	brk $40.b		; 00 40
	jsr $8000.w		; 20 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tya		; 98
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003E00.l,X		; FF 00 3E 00
	pha		; 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003E00.l,X		; FF 00 3E 00
	pha		; 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $40.b		; 26 40
	eor ($22.b,X)		; 41 22
	jsr $2141.w		; 20 41 21
	rti		; 40

	brk $60.b		; 00 60
	brk $20.b		; 00 20
	jsr $2000.w		; 20 00 20
	ora ($00.b,X)		; 01 00
	rol $00.b		; 26 00
	eor $00.b,S		; 43 00
	and ($00.b,X)		; 21 00
	adc ($00.b,X)		; 61 00
	rts		; 60

	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	clc		; 18
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	cpy #$1800.w		; C0 00 18
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	jsr $8000.w		; 20 00 80
	rts		; 60

	bra  96.b		; 80 60
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora ($FE.b,X)		; 01 FE
	brk $10.b		; 00 10
	brk $10.b		; 00 10
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
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	asl $B071.w		; 0E 71 B0
	eor $000600.l		; 4F 00 06 00
	bpl   0.b		; 10 00
	asl $0400.w		; 0E 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $F8.b		; 00 F8
	clc		; 18
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cop $00.b		; 02 00
	rep #$80		; C2 80
	adc ($80.b)		; 72 80
	tda		; 7B
	cpy $03.b		; C4 03
	sty $48.b		; 84 48
	rti		; 40

	bcc   0.b		; 90 00
	bne   0.b		; D0 00
	cpy #$0000.w		; C0 00 00
	brk $80.b		; 00 80
	tsb $80.b		; 04 80
	clc		; 18
	cpy $32.b		; C4 32
	sty $01.b		; 84 01
	cpy #$C000.w		; C0 00 C0
	brk $17.b		; 00 17
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $FE.b		; 00 FE
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	brk $64.b		; 00 64
	pla		; 68
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $18.b		; 00 18
	brk $20.b		; 00 20
	cld		; D8
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	jsr $00D8.w		; 20 D8 00
	rti		; 40

	brk $48.b		; 00 48
	brk $E0.b		; 00 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $DE.b		; 00 DE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $DE.b		; 00 DE
	bpl -128.b		; 10 80
	bcc   0.b		; 90 00
	bcs   0.b		; B0 00
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	bcc   0.b		; 90 00
	bcs   0.b		; B0 00
	stx $00.b,Y		; 96 00
	brk $90.b		; 00 90
	brk $90.b		; 00 90
	brk $B0.b		; 00 B0
	brk $90.b		; 00 90
	brk $90.b		; 00 90
	brk $90.b		; 00 90
	brk $B0.b		; 00 B0
	brk $96.b		; 00 96
	brk $30.b		; 00 30
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pei ($00.b)		; D4 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D4.b		; 00 D4
	brk $00.b		; 00 00
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00A700.l,X		; FF 00 A7 00
	ora ($00.b),Y		; 11 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $A7.b		; 00 A7
	brk $11.b		; 00 11
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $82, $00, $40		; 82 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $82, $00, $40		; 82 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc ($0F.b),Y		; F1 0F
	cmp $F204.w,X		; DD 04 F2
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	sbc $FF.b,X		; F5 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	sbc $FF.b		; E5 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	sbc $FF.b		; E5 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sbc $D5FF.w,X		; FD FF D5
	sbc $000E08.l,X		; FF 08 0E 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $E810.w		; 20 10 E8
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	tsb $00.b		; 04 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	tsb $B9.b		; 04 B9
	ror $19.b		; 66 19
	ora $4902.w		; 0D 02 49
	jsr $9007.w		; 20 07 90
	ora $84.b,S		; 03 84
	ora ($84.b,X)		; 01 84
	brk $0C.b		; 00 0C
	rti		; 40

	tsb $6F00.w		; 0C 00 6F
	bpl  13.b		; 10 0D
	asl $69.b,X		; 16 69
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $05.b		; 00 05
	brk $18.b		; 00 18
	cpx #$0112.w		; E0 12 01
	dec $C03E.w		; CE 3E C0
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	sty $0A.b		; 84 0A
	brk $06.b		; 00 06
	asl $00.b		; 06 00
	brk $E0.b		; 00 E0
	brk $81.b		; 00 81
	brk $FE.b		; 00 FE
	cpy #$1D00.w		; C0 00 1D
	bra  17.b		; 80 11
	sty $00.b		; 84 00
	brk $00.b		; 00 00
	plp		; 28
	brk $18.b		; 00 18
	cpx #$0000.w		; E0 00 00
	bra   0.b		; 80 00
	brk $10.b		; 00 10
	plp		; 28
	rts		; 60

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $08.b		; 04 08
	brk $0C.b		; 00 0C
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	ora $C8.b		; 05 C8
	eor [$B8.b]		; 47 B8
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	jsr $0005.w		; 20 05 00
	cmp [$40.b]		; C7 40
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	jsr $7000.w		; 20 00 70
	brk $10.b		; 00 10
	rti		; 40

	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	tas		; 1B
	brk $40.b		; 00 40
	jsr $0010.w		; 20 10 00
	bpl   0.b		; 10 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $7E.b		; 00 7E
	rti		; 40

	ldy #$0000.w		; A0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	bit $0000.w		; 2C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	bit $0000.w		; 2C 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	adc $00.b,X		; 75 00
	sbc $003C00.l,X		; FF 00 3C 00
	bvc   0.b		; 50 00
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $75.b		; 00 75
	brk $FF.b		; 00 FF
	brk $3C.b		; 00 3C
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	brk $FC.b		; 00 FC
	brk $9A.b		; 00 9A
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	brk $FC.b		; 00 FC
	brk $9A.b		; 00 9A
	brk $48.b		; 00 48
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
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	ora $FC.b,S		; 03 FC
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $57.b		; 00 57
	ldy #$F00C.w		; A0 0C F0
	rol $C8.b,X		; 36 C8
	cpy #$043E.w		; C0 3E 04
	ora ($06.b,S),Y		; 13 06
	bmi   4.b		; 30 04
	ora ($02.b)		; 12 02
	tsb $00.b		; 04 00
	adc [$00.b],Y		; 77 00
	trb $3600.w		; 1C 00 36
	brk $E0.b		; 00 E0
	rts		; 60

	tsb $00.b		; 04 00
	asl $01.b		; 06 01
	tsb $00.b		; 04 00
	asl $CA.b		; 06 CA
	and $00.b		; 25 00
	jsr $2200.w		; 20 00 22
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	rti		; 40

	and $008040.l,X		; 3F 40 80 00
	brk $10.b		; 00 10
	wai		; CB
	brk $00.b		; 00 00
	ora $0100.w		; 0D 00 01
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rti		; 40

	jsr $1040.w		; 20 40 10
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	bra   0.b		; 80 00
	jsr ($F000.w,X)		; FC 00 F0
	brk $10.b		; 00 10
	brk $90.b		; 00 90
	brk $7C.b		; 00 7C
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	cpy #$8000.w		; C0 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bpl -64.b		; 10 C0
	pha		; 48
	bra  64.b		; 80 40
	sty $00.b		; 84 00
	rti		; 40

	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $10.b		; 00 10
	brk $48.b		; 00 48
	brk $44.b		; 00 44
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	sbc $0B.b,X		; F5 0B
	sbc [$03.b]		; E7 03
	sbc $FF.b,X		; F5 FF
	sbc [$FF.b]		; E7 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc [$FF.b]		; E7 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	sbc [$FF.b],Y		; F7 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	sbc [$FF.b],Y		; F7 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	rti		; 40

	brk $00.b		; 00 00
	brk $09.b		; 00 09
	rti		; 40

	ora ($40.b,X)		; 01 40
	brk $40.b		; 00 40
	cop $00.b		; 02 00
	brk $06.b		; 00 06
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rti		; 40

	brk $00.b		; 00 00
	ora #$0100.w		; 09 00 01
	brk $40.b		; 00 40
	tsb $02.b		; 04 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $01.b		; 04 01
	brk $00.b		; 00 00
	bpl -82.b		; 10 AE
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $02.b		; 00 02
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	rti		; 40

	jmp $5792.w		; 4C 92 57
	plp		; 28
	mvn $31,$20		; 54 20 31
	rti		; 40

	bpl  65.b		; 10 41
	bvc   0.b		; 50 00
	tsb $40.b		; 04 40
	brk $40.b		; 00 40
	brk $4C.b		; 00 4C
	bra  95.b		; 80 5F
	.db $82, $54, $02		; 82 54 02
	adc ($00.b),Y		; 71 00
	bvc   0.b		; 50 00
	bvc   0.b		; 50 00
	bpl   8.b		; 10 08
	tsb $00.b		; 04 00
	dey		; 88
	bra   0.b		; 80 00
	brk $10.b		; 00 10
	bmi -128.b		; 30 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   8.b		; 80 08
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	php		; 08
	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $13.b		; 00 13
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	asl $00F1.w		; 0E F1 00
	jsr $0100.w		; 20 00 01
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	php		; 08
	cop $30.b		; 02 30
	cmp $40.b,S		; C3 40
	sty $70.b		; 84 70
	asl $E400.w		; 0E 00 E4
	brk $3E.b		; 00 3E
	jsr $0087.w		; 20 87 00
	brk $80.b		; 00 80
	php		; 08
	brk $30.b		; 00 30
	brk $C0.b		; 00 C0
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	jsr $0000.w		; 20 00 00
	brk $2C.b		; 00 2C
	brk $F0.b		; 00 F0
	brk $20.b		; 00 20
	mvp $00,$20		; 44 20 00
	sec		; 38
	brk $80.b		; 00 80
	brk $E8.b		; 00 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	bra 100.b		; 80 64
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
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $50.b		; 00 50
	brk $DE.b		; 00 DE
	brk $C2.b		; 00 C2
	brk $88.b		; 00 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	bvc   0.b		; 50 00
	dec $C200.w,X		; DE 00 C2
	brk $88.b		; 00 88
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $EF07.w,Y		; F9 07 EF
	cop $F9.b		; 02 F9
	sbc $00FFFB.l,X		; FF FB FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	xce		; FB
	sbc $000E01.l,X		; FF 01 0E 00
	brk $F9.b		; 00 F9
	sbc $02FFF3.l,X		; FF F3 FF 02
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	sbc ($FF.b,S),Y		; F3 FF
	ora $0E.b,S		; 03 0E
	brk $00.b		; 00 00
	sbc $FFEBFF.l,X		; FF FF EB FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	cop $01.b		; 02 01
	ora ($E8.b,X)		; 01 E8
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $000000.l		; 6F 00 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	cpy #$7012.w		; C0 12 70
	dey		; 88
	brk $C6.b		; 00 C6
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $00.b		; E4 00
	jsr $0000.w		; 20 00 00
	cpy #$F000.w		; C0 00 F0
	jsr $0080.w		; 20 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $00.b		; E4 00
	jsr $0200.w		; 20 00 02
	cop $00.b		; 02 00
	brk $02.b		; 00 02
	phd		; 0B
	bit $02.b		; 24 02
	bit $E618.w,X		; 3C 18 E6
	cop $04.b		; 02 04
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $0B.b		; 00 0B
	brk $06.b		; 00 06
	brk $18.b		; 00 18
	brk $02.b		; 00 02
	jsr $4002.w		; 20 02 40
	brk $00.b		; 00 00
	cpy #$4080.w		; C0 80 40
	php		; 08
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	tsb $7480.w		; 0C 80 74
	brk $04.b		; 00 04
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $80.b		; 00 80
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $48.b		; 00 48
	bra -128.b		; 80 80
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	brk $A0.b		; 00 A0
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FA03.w,X		; FD 03 FA
	sbc $FAFFFD.l,X		; FF FD FF FA
	sbc $000E00.l,X		; FF 00 0E 00
	brk $00.b		; 00 00
	php		; 08
	bpl  44.b		; 10 2C
	rti		; 40

	ldx #$0200.w		; A2 00 02
	tsb $0010.w		; 0C 10 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   4.b		; 10 04
	rti		; 40

	php		; 08
	brk $00.b		; 00 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 09FFFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 09FFFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 09FFFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 09FFFF. Skipping.
.ENDS
