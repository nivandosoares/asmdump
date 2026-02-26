.BANK 20 SLOT 0
.ORG $0000

.SECTION "Bank20" FORCE

	ora $003C80.l		; 0F 80 3C 00
	inx		; E8
	asl $AF.b,X		; 16 AF
	php		; 08
	jsr ($AFFF.w,X)		; FC FF AF
	sbc $000E00.l,X		; FF 00 0E 00
	brk $F4.b		; 00 F4
	sbc $02FFBF.l,X		; FF BF FF 02
	asl $0000.w		; 0E 00 00
	tsb $00.b		; 04 00
	lda $0E04FF.l,X		; BF FF 04 0E
	brk $00.b		; 00 00
	inx		; E8
	sbc $06FFCF.l,X		; FF CF FF 06
	asl $0000.w		; 0E 00 00
	sed		; F8
	sbc $08FFCF.l,X		; FF CF FF 08
	asl $0000.w		; 0E 00 00
	php		; 08
	brk $CF.b		; 00 CF
	sbc $000E0A.l,X		; FF 0A 0E 00
	brk $E8.b		; 00 E8
	sbc $0CFFDF.l,X		; FF DF FF 0C
	asl $0000.w		; 0E 00 00
	sed		; F8
	sbc $0EFFDF.l,X		; FF DF FF 0E
	asl $0000.w		; 0E 00 00
	php		; 08
	brk $DF.b		; 00 DF
	sbc $000E20.l,X		; FF 20 0E 00
	brk $EC.b		; 00 EC
	sbc $22FFEF.l,X		; FF EF FF 22
	asl $0000.w		; 0E 00 00
	jsr ($EFFF.w,X)		; FC FF EF
	sbc $000E24.l,X		; FF 24 0E 00
	brk $0C.b		; 00 0C
	brk $EF.b		; 00 EF
	sbc $000E26.l,X		; FF 26 0E 00
	brk $EF.b		; 00 EF
	sbc $28FFFF.l,X		; FF FF FF 28
	tsb $0000.w		; 0C 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	rol A		; 2A
	tsb $0000.w		; 0C 00 00
	ora $FFFF00.l		; 0F 00 FF FF
	bit $000C.w		; 2C 0C 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	tsb $0C.b		; 04 0C
	tsb $0C.b		; 04 0C
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	tsb $0F.b		; 04 0F
	tsb $0F.b		; 04 0F
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $000F00.l		; 0F 00 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4F.b		; 00 4F
	ora $3F.b,S		; 03 3F
	tsb $C0F4.w		; 0C F4 C0
	stz $70.b,X		; 74 70
	stz $70.b,X		; 74 70
	sta [$03.b]		; 87 03
	cmp [$44.b]		; C7 44
	lda $B00088.l,X		; BF 88 00 B0
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $8B.b		; 00 8B
	brk $8B.b		; 00 8B
	brk $78.b		; 00 78
	brk $38.b		; 00 38
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$0080.w		; C0 80 00
	dey		; 88
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
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
	brk $00.b		; 00 00
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
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	php		; 08
	php		; 08
	bit $30.b,X		; 34 30
	ora [$03.b]		; 07 03
	ora [$03.b]		; 07 03
	bit $4F00.w,X		; 3C 00 4F
	eor $3F083F.l		; 4F 3F 08 3F
	php		; 08
	brk $07.b		; 00 07
	brk $0B.b		; 00 0B
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	cmp $03.b,S		; C3 03
	phd		; 0B
	ora $80.b,S		; 03 80
	bra -128.b		; 80 80
	bra  59.b		; 80 3B
	brk $C7.b		; 00 C7
	brk $0F.b		; 00 0F
	phd		; 0B
	ora $3C000B.l		; 0F 0B 00 3C
	brk $F4.b		; 00 F4
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $C4.b		; 00 C4
	brk $38.b		; 00 38
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	wai		; CB
	brk $F7.b		; 00 F7
	cmp $CF.b,S		; C3 CF
	tsb $0CCF.w		; 0C CF 0C
	and $038F38.l,X		; 3F 38 8F 03
	lda $8CBF8C.l,X		; BF 8C BF 8C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $C0.b		; 00 C0
	brk $70.b		; 00 70
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	sed		; F8
	clv		; B8
	beq -16.b		; F0 F0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cmp $80.b,S		; C3 80
	pea $FFF0.w		; F4 F0 FF
	bra  -1.b		; 80 FF
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
	brk $61.b		; 00 61
	jsr $0040.w		; 20 40 00
	jmp ($0700.w,X)		; 7C 00 07
	ora $0B.b,S		; 03 0B
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	asl $3F00.w,X		; 1E 00 3F
	brk $03.b		; 00 03
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $7B.b		; 00 7B
	brk $7B.b		; 00 7B
	brk $87.b		; 00 87
	cmp [$04.b]		; C7 04
	eor [$04.b]		; 47 04
	jmp ($F07C.w,X)		; 7C 7C F0
	cpy #$F8FF.w		; C0 FF F8
	iny		; C8
	brk $08.b		; 00 08
	brk $3F.b		; 00 3F
	php		; 08
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $83.b		; 00 83
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	brk $F7.b		; 00 F7
	brk $80.b		; 00 80
	lda [$87.b],Y		; B7 87
	lda [$87.b],Y		; B7 87
	tsb $7B0C.w		; 0C 0C 7B
	ora $FC.b,S		; 03 FC
	brk $20.b		; 00 20
	brk $F8.b		; 00 F8
	brk $3F.b		; 00 3F
	and $004800.l,X		; 3F 00 48 00
	pha		; 48
	brk $F3.b		; 00 F3
	brk $84.b		; 00 84
	brk $03.b		; 00 03
	brk $DF.b		; 00 DF
	brk $07.b		; 00 07
	brk $C0.b		; 00 C0
	sed		; F8
	beq  -8.b		; F0 F8
	bra  12.b		; 80 0C
	tsb $00C3.w		; 0C C3 00
	sed		; F8
	dey		; 88
	cop $02.b		; 02 02
	and $C7FF33.l,X		; 3F 33 FF C7
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $F3.b		; 00 F3
	brk $3C.b		; 00 3C
	brk $07.b		; 00 07
	brk $FD.b		; 00 FD
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	tsb $0C04.w		; 0C 04 0C
	tsb $0C.b		; 04 0C
	tsb $0C.b		; 04 0C
	tsb $0C.b		; 04 0C
	tsb $4C.b		; 04 4C
	tsb $0F.b		; 04 0F
	phd		; 0B
	eor $100003.l		; 4F 03 00 10
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $B0.b		; 00 B0
	brk $F0.b		; 00 F0
	brk $B0.b		; 00 B0
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
	bit $30.b,X		; 34 30
	bit $30.b,X		; 34 30
	brk $00.b		; 00 00
	cpy $0800.w		; CC 00 08
	brk $3C.b		; 00 3C
	sec		; 38
	bit $3F38.w,X		; 3C 38 3F
	ora $000B00.l		; 0F 00 0B 00
	phd		; 0B
	brk $FF.b		; 00 FF
	brk $33.b		; 00 33
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	dey		; 88
	brk $88.b		; 00 88
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $4C.b,S		; 03 4C
	tsb $C0.b		; 04 C0
	brk $C0.b		; 00 C0
	brk $BC.b		; 00 BC
	brk $00.b		; 00 00
	stz $00.b,X		; 74 00
	stz $00.b,X		; 74 00
	sbc $00F800.l,X		; FF 00 F8 00
	lda ($00.b,S),Y		; B3 00
	and $003F00.l,X		; 3F 00 3F 00
	ora $40.b,S		; 03 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	pea $0038.w		; F4 38 00
	sed		; F8
	brk $F8.b		; 00 F8
	brk $C3.b		; 00 C3
	brk $00.b		; 00 00
	clv		; B8
	brk $B8.b		; 00 B8
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
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0704.w		; 0C 04 07
	brk $83.b		; 00 83
	brk $00.b		; 00 00
	ora $000800.l		; 0F 00 08 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	bvs  12.b		; 70 0C
	brk $C4.b		; 00 C4
	brk $78.b		; 00 78
	brk $F3.b		; 00 F3
	brk $F3.b		; 00 F3
	brk $C0.b		; 00 C0
	rti		; 40

	ora [$00.b]		; 07 00
	cmp $00.b,S		; C3 00
	brk $F3.b		; 00 F3
	brk $3B.b		; 00 3B
	brk $07.b		; 00 07
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $3F.b		; 00 3F
	brk $F8.b		; 00 F8
	brk $3C.b		; 00 3C
	cmp [$47.b]		; C7 47
	beq   0.b		; F0 00
	ora [$00.b]		; 07 00
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	rti		; 40

	rti		; 40

	jmp ($B000.w,X)		; 7C 00 B0
	bmi   0.b		; 30 00
	sec		; 38
	brk $0F.b		; 00 0F
	brk $F8.b		; 00 F8
	brk $F7.b		; 00 F7
	brk $F7.b		; 00 F7
	brk $BF.b		; 00 BF
	brk $83.b		; 00 83
	brk $4F.b		; 00 4F
	jsr ($FF7C.w,X)		; FC 7C FF
	pha		; 48
	lda $8087B0.l,X		; BF B0 87 80
	sta [$80.b]		; 87 80
	tsa		; 3B
	ora $00.b,S		; 03 00
	brk $FB.b		; 00 FB
	phd		; 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $C4.b		; 00 C4
	brk $FF.b		; 00 FF
	brk $04.b		; 00 04
	bit $C000.w,X		; 3C 00 C0
	brk $FF.b		; 00 FF
	pha		; 48
	sed		; F8
	brk $F8.b		; 00 F8
	brk $CF.b		; 00 CF
	cmp $C74848.l		; CF 48 48 C7
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $B7.b		; 00 B7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bvs   0.b		; 70 00
	beq -128.b		; F0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor [$00.b]		; 47 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sei		; 78
	brk $33.b		; 00 33
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$F0.b]		; 07 F0
	brk $83.b		; 00 83
	ora $BF.b,S		; 03 BF
	rol $407E.w,X		; 3E 7E 40
	jsr ($0780.w,X)		; FC 80 07
	ora [$07.b]		; 07 07
	tsb $07.b		; 04 07
	tsb $00.b		; 04 00
	ora $007C00.l		; 0F 00 7C 00
	rti		; 40

	brk $81.b		; 00 81
	brk $03.b		; 00 03
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	clc		; 18
	clc		; 18
	pea $F4E0.w		; F4 E0 F4
	brk $0C.b		; 00 0C
	tsb $01F1.w		; 0C F1 01
	ora $0719.w,Y		; 19 19 07
	ora [$7C.b]		; 07 7C
	jmp ($E700.w,X)		; 7C 00 E7
	brk $0B.b		; 00 0B
	brk $0B.b		; 00 0B
	brk $F3.b		; 00 F3
	brk $0E.b		; 00 0E
	brk $E6.b		; 00 E6
	brk $F8.b		; 00 F8
	brk $83.b		; 00 83
	sbc $030384.l,X		; FF 84 03 03
	ora $03.b,S		; 03 03
	and [$03.b],Y		; 37 03
	tsa		; 3B
	brk $F8.b		; 00 F8
	sei		; 78
	and $3C3F3C.l,X		; 3F 3C 3F 3C
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $C8.b		; 00 C8
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	bit $3C3C.w,X		; 3C 3C 3C
	bit $007F.w,X		; 3C 7F 00
	jmp ($BF00.w,X)		; 7C 00 BF
	sta $FF3C3F.l		; 8F 3F 3C FF
	jsr ($40C0.w,X)		; FC C0 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $7804.w,X		; BC 04 78
	php		; 08
	stz $70.b,X		; 74 70
	bit $3C00.w,X		; 3C 00 3C
	brk $78.b		; 00 78
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$C000.w		; C0 00 C0
	brk $80.b		; 00 80
	cmp $00.b,S		; C3 00
	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $0700.w,X		; 3C 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$04.b]		; 07 04
	and ($02.b)		; 32 02
	jmp ($0F00.w,X)		; 7C 00 0F
	brk $0F.b		; 00 0F
	brk $F7.b		; 00 F7
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	clv		; B8
	brk $0C.b		; 00 0C
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	sta $83.b,S		; 83 83
	ora $7F18.w,X		; 1D 18 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	rts		; 60

	brk $7C.b		; 00 7C
	brk $E2.b		; 00 E2
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($F000.w,X)		; 7C 00 F0
	brk $F0.b		; 00 F0
	brk $F3.b		; 00 F3
	brk $BF.b		; 00 BF
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sbc $007F00.l,X		; FF 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sta $7C.b,S		; 83 7C
	jmp ($0404.w,X)		; 7C 04 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FD.b		; 00 FD
	brk $1F.b		; 00 1F
	brk $08.b		; 00 08
	brk $0F.b		; 00 0F
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
	ora [$00.b]		; 07 00
	ora $FF3CC3.l		; 0F C3 3C FF
	brk $FF.b		; 00 FF
	brk $4B.b		; 00 4B
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora $003C00.l		; 0F 00 3C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	bra 120.b		; 80 78
	bra  -8.b		; 80 F8
	brk $9E.b		; 00 9E
	rts		; 60

	sta $20DD60.l,X		; 9F 60 DD 20
	cmp [$20.b],Y		; D7 20
	sbc $800000.l,X		; FF 00 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($DF00.w,X)		; 7C 00 DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F6.b		; 00 F6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	brk $48.b		; 00 48
	brk $D5.b		; 00 D5
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
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	bra  -4.b		; 80 FC
	bra  -1.b		; 80 FF
	cpy #$00F8.w		; C0 F8 00
	and ($00.b,S),Y		; 33 00
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4C.b		; 00 4C
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	sei		; 78
	brk $78.b		; 00 78
	brk $FC.b		; 00 FC
	brk $F0.b		; 00 F0
	brk $40.b		; 00 40
	rti		; 40

	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
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
	brk $1F.b		; 00 1F
	ora ($02.b,X)		; 01 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $708FF0.l		; 0F F0 8F 70
	ora $700F70.l		; 0F 70 0F 70
	ora $700F70.l		; 0F 70 0F 70
	ora $700F70.l		; 0F 70 0F 70
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $70.b		; 00 70
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
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
	brk $0B.b		; 00 0B
	bra  44.b		; 80 2C
	brk $ED.b		; 00 ED
	bpl -62.b		; 10 C2
	asl $F9.b		; 06 F9
	sbc $00FFC2.l,X		; FF C2 FF 00
	asl $0000.w		; 0E 00 00
	beq  -1.b		; F0 FF
	cmp ($FF.b)		; D2 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp ($FF.b)		; D2 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	sbc $E2FF.w		; ED FF E2
	sbc $000E06.l,X		; FF 06 0E 00
	brk $FD.b		; 00 FD
	sbc $08FFE2.l,X		; FF E2 FF 08
	asl $0000.w		; 0E 00 00
	ora $E200.w		; 0D 00 E2
	sbc $000E0A.l,X		; FF 0A 0E 00
	brk $F0.b		; 00 F0
	sbc $0CFFF2.l,X		; FF F2 FF 0C
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	asl $000E.w		; 0E 0E 00
	brk $10.b		; 00 10
	brk $F2.b		; 00 F2
	sbc $000E20.l,X		; FF 20 0E 00
	brk $F2.b		; 00 F2
	sbc $220002.l,X		; FF 02 00 22
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	bit $0C.b		; 24 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	tda		; 7B
	clc		; 18
	tay		; A8
	bra   0.b		; 80 00
	brk $60.b		; 00 60
	brk $44.b		; 00 44
	brk $EC.b		; 00 EC
	cpy #$70FB.w		; C0 FB 70
	adc $03.b,S		; 63 03
	brk $04.b		; 00 04
	brk $57.b		; 00 57
	brk $FF.b		; 00 FF
	brk $9F.b		; 00 9F
	brk $8B.b		; 00 8B
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $9C.b		; 00 9C
	cpx $1000.w		; EC 00 10
	brk $10.b		; 00 10
	brk $FE.b		; 00 FE
	jmp ($808E.w,X)		; 7C 8E 80
	asl $9100.w,X		; 1E 00 91
	brk $8F.b		; 00 8F
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	stx $E000.w		; 8E 00 E0
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00C0.w		; C0 C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $1C.b		; 00 1C
	brk $0E.b		; 00 0E
	brk $C6.b		; 00 C6
	rti		; 40

	bra   0.b		; 80 00
	ora $030F0E.l,X		; 1F 0E 0F 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $E1.b		; 00 E1
	brk $38.b		; 00 38
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($01.b),Y		; 91 01
	sta ($01.b),Y		; 91 01
	and [$00.b],Y		; 37 00
	inc A		; 1A
	cop $3A.b		; 02 3A
	plp		; 28
	dec A		; 3A
	plp		; 28
	sta [$00.b]		; 87 00
	sbc $6E00C0.l,X		; FF C0 00 6E
	brk $6E.b		; 00 6E
	brk $C8.b		; 00 C8
	brk $E5.b		; 00 E5
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	bra   0.b		; 80 00
	ora $FC01.w,X		; 1D 01 FC
	jsr ($E0FC.w,X)		; FC FC E0
	adc ($60.b),Y		; 71 60
	stz $0000.w		; 9C 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $7F.b		; 00 7F
	brk $E2.b		; 00 E2
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $8E.b		; 00 8E
	brk $63.b		; 00 63
	sed		; F8
	brk $F8.b		; 00 F8
	brk $09.b		; 00 09
	ora #$C0C7.w		; 09 C7 C0
	bit $3C3C.w,X		; 3C 3C 3C
	bit $00BC.w,X		; 3C BC 00
	ror $004E.w,X		; 7E 4E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $00.b,X		; F6 00
	brk $00.b		; 00 00
	cpy #$C000.w		; C0 00 C0
	brk $00.b		; 00 00
	brk $81.b		; 00 81
	rti		; 40

	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	jsr $C0D0.w		; 20 D0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sty $0100.w		; 8C 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $7200.w,X		; FE 00 72
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy $383C.w,X		; BC 3C 38
	plp		; 28
	sbc [$00.b]		; E7 00
	adc [$00.b],Y		; 77 00
	adc [$00.b],Y		; 77 00
	lda $860100.l,X		; BF 00 01 86
	brk $FF.b		; 00 FF
	brk $43.b		; 00 43
	brk $C7.b		; 00 C7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	brk $FF.b		; 00 FF
	jmp ($6070.w,X)		; 7C 70 60
	rts		; 60

	inc $FC00.w,X		; FE 00 FC
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $FC.b		; 00 FC
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	sta $00.b,S		; 83 00
	sta $000000.l,X		; 9F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	asl $437F.w,X		; 1E 7F 43
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0000.w		; C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$8000.w		; E0 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$0101.w		; 09 01 01
	brk $09.b		; 00 09
	brk $07.b		; 00 07
	ora ($1F.b,X)		; 01 1F
	clc		; 18
	ora $40710E.l		; 0F 0E 71 40
	sbc $0049.w,Y		; F9 49 00
	asl $00.b,X		; 16 00
	asl $1600.w,X		; 1E 00 16
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $F0.b		; 00 F0
	brk $0E.b		; 00 0E
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$00C0.w		; C0 C0 00
	clc		; 18
	brk $20.b		; 00 20
	jsr $C0C0.w		; 20 C0 C0
	cpy $00.b		; C4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $010C.w		; 0D 0C 01
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	ora $6F.b,S		; 03 6F
	cop $6F.b		; 02 6F
	cop $F1.b		; 02 F1
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	asl $0100.w		; 0E 00 01
	phd		; 0B
	ora $C0.b,S		; 03 C0
	cpy #$001B.w		; C0 1B 00
	sbc [$80.b]		; E7 80
	sta $0B8F0B.l		; 8F 0B 8F 0B
	bvs   0.b		; 70 00
	ora [$00.b]		; 07 00
	brk $F4.b		; 00 F4
	brk $3F.b		; 00 3F
	brk $E4.b		; 00 E4
	brk $18.b		; 00 18
	brk $70.b		; 00 70
	brk $70.b		; 00 70
	brk $8F.b		; 00 8F
	brk $F8.b		; 00 F8
	sbc $109E8F.l,X		; FF 8F 9E 10
	ror $1F62.w,X		; 7E 62 1F
	ora $7F127F.l		; 0F 7F 12 7F
	ora ($FE.b)		; 12 FE
	bra 127.b		; 80 7F
	rts		; 60

	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	ldy #$F080.w		; A0 80 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	rti		; 40

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
	sta $000E00.l,X		; 9F 00 0E 00
	ora $00E101.l		; 0F 01 E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $ED.b		; 00 ED
	brk $EF.b		; 00 EF
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $02.b		; 00 02
	brk $1F.b		; 00 1F
	.db $42, $00		; 42 00
	eor $018100.l		; 4F 00 81 01
	asl $FE1E.w,X		; 1E 1E FE
	cpx #$01E1.w		; E0 E1 01
	and ($31.b),Y		; 31 31
	bmi  32.b		; 30 20
	brk $BD.b		; 00 BD
	brk $B0.b		; 00 B0
	brk $7E.b		; 00 7E
	brk $E1.b		; 00 E1
	brk $01.b		; 00 01
	brk $1E.b		; 00 1E
	brk $0E.b		; 00 0E
	brk $CF.b		; 00 CF
	ora ($01.b,X)		; 01 01
	ora $021F0D.l		; 0F 0D 1F 02
	sta ($01.b,X)		; 81 01
	sta ($01.b,X)		; 81 01
	sta $3C3C81.l		; 8F 81 3C 3C
	sbc $FE00EE.l		; EF EE 00 FE
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
	brk $70.b		; 00 70
	brk $C0.b		; 00 C0
	brk $10.b		; 00 10
	rol $FE3C.w,X		; 3E 3C FE
	jsr ($00FE.w,X)		; FC FE 00
	jsr ($FCC0.w,X)		; FC C0 FC
	cpy #$C0FF.w		; C0 FF C0
	and ($00.b)		; 32 00
	sta $03.b,S		; 83 03
	brk $C1.b		; 00 C1
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $7C.b		; 00 7C
	bvs   0.b		; 70 00
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	cpx #$E000.w		; E0 00 E0
	brk $F0.b		; 00 F0
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$8000.w		; C0 00 80
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
	php		; 08
	ora [$00.b],Y		; 17 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $000E01.l		; 0F 01 0E 00
	ora [$00.b],Y		; 17 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $E00E00.l		; 0F 00 0E E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
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
	brk $0F.b		; 00 0F
	brk $FB.b		; 00 FB
	brk $11.b		; 00 11
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
	brk $1D.b		; 00 1D
.ACCU 8
.INDEX 8
	sep #$FD		; E2 FD
	cop $1D.b		; 02 1D
	cop $F7.b		; 02 F7
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sep #$00		; E2 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $FD.b		; 00 FD
	brk $98.b		; 00 98
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $48.b		; 00 48
	brk $A0.b		; 00 A0
	brk $D0.b		; 00 D0
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
	brk $06.b		; 00 06
	bra  24.b		; 80 18
	brk $F2.b		; 00 F2
	phd		; 0B
	cmp ($04.b),Y		; D1 04
	pea $F5FF.w		; F4 FF F5
	sbc $000E00.l,X		; FF 00 0E 00
	brk $04.b		; 00 04
	brk $F5.b		; 00 F5
	sbc $000E02.l,X		; FF 02 0E 00
	brk $F2.b		; 00 F2
	sbc $04FFE5.l,X		; FF E5 FF 04
	asl $0000.w		; 0E 00 00
	cop $00.b		; 02 00
	sbc $FF.b		; E5 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	cmp $FF.b,X		; D5 FF
	php		; 08
	asl $0000.w		; 0E 00 00
	sbc $FFC5FF.l,X		; FF FF C5 FF
	asl A		; 0A
	asl $0000.w		; 0E 00 00
	ora [$05.b]		; 07 05
	sta $0701.w,Y		; 99 01 07
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $62.b		; 00 62
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp [$C6.b]		; C7 C6
	cpy $44.b		; C4 44
	and $00BF00.l,X		; 3F 00 BF 00
	sbc $201F00.l,X		; FF 00 1F 20
	jmp $0CB0.w		; 4C B0 0C
	bmi   0.b		; 30 00
	sec		; 38
	brk $3B.b		; 00 3B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $B0.b		; 00 B0
	brk $30.b		; 00 30
	asl $1F0E.w		; 0E 0E 1F
	ora $84.b,S		; 03 84
	tsb $00.b		; 04 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $17.b		; 00 17
	brk $17.b		; 00 17
	brk $39.b		; 00 39
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $31.b		; 00 31
	brk $89.b		; 00 89
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $0E.b		; 00 0E
	brk $70.b		; 00 70
	and $9D01.w,X		; 3D 01 9D
	trb $1C9D.w		; 1C 9D 1C
	adc $02.b,S		; 63 02
	bcc  16.b		; 90 10
	bcc  16.b		; 90 10
	beq   0.b		; F0 00
	lda $C2000F.l		; AF 0F 00 C2
	brk $62.b		; 00 62
	brk $62.b		; 00 62
	brk $9C.b		; 00 9C
	brk $6F.b		; 00 6F
	brk $6F.b		; 00 6F
	brk $0F.b		; 00 0F
	brk $50.b		; 00 50
.ACCU 8
	sep #$20		; E2 20
	inc $FEA0.w,X		; FE A0 FE
	ldy #$E0.b		; A0 E0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $01.b		; 00 01
	brk $1C.b		; 00 1C
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $E0.b		; 00 E0
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
	ora $02.b,S		; 03 02
	ora ($01.b,X)		; 01 01
	asl $0008.w		; 0E 08 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	asl $0100.w		; 0E 00 01
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rts		; 60

	jsr $2060.w		; 20 60 20
	iny		; C8
	brk $D0.b		; 00 D0
	bcc  96.b		; 90 60
	jsr $8000.w		; 20 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $10.b		; 00 10
	brk $20.b		; 00 20
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
	asl $01.b		; 06 01
	tsa		; 3B
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	bmi  12.b		; 30 0C
	bmi  12.b		; 30 0C
	bmi  12.b		; 30 0C
	bvs  54.b		; 70 36
	iny		; C8
	sbc [$08.b],Y		; F7 08
	and ($08.b,S),Y		; 33 08
	jsr ($0000.w,X)		; FC 00 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bvs   0.b		; 70 00
	iny		; C8
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	nop		; EA
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
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
	brk $81.b		; 00 81
	ora ($3E.b,X)		; 01 3E
	clc		; 18
	php		; 08
	brk $00.b		; 00 00
	brk $BE.b		; 00 BE
	brk $1F.b		; 00 1F
	ora [$C7.b]		; 07 C7
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	sei		; 78
	brk $01.b		; 00 01
	brk $D7.b		; 00 D7
	brk $DF.b		; 00 DF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $08.b		; 00 08
	lda $0C7E0C.l		; AF 0C 7E 0C
	jsr $7100.w		; 20 00 71
	ora ($13.b,X)		; 01 13
	bpl -32.b		; 10 E0
	brk $11.b		; 00 11
	bpl -105.b		; 10 97
	sta [$00.b],Y		; 97 00
	bvc   0.b		; 50 00
	sta ($00.b,X)		; 81 00
	cmp $008E00.l,X		; DF 00 8E 00
	cpx $1F00.w		; EC 00 1F
	brk $EE.b		; 00 EE
	brk $68.b		; 00 68
	trb $5D1C.w		; 1C 1C 5D
	brk $5E.b		; 00 5E
	jmp $FE7CFE.l		; 5C FE 7C FE
	bra 125.b		; 80 7D
	rts		; 60

	sbc $011B60.l,X		; FF 60 1B 01
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $A1.b		; 00 A1
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	cpy #$40.b		; C0 40
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	ora $101A06.l		; 0F 06 1A 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc A		; 1A
	bpl  31.b		; 10 1F
	tsb $C1E3.w		; 0C E3 C1
	bmi  16.b		; 30 10
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $3F.b		; 00 3F
	brk $13.b		; 00 13
	brk $01.b		; 00 01
	brk $20.b		; 00 20
	brk $1C.b		; 00 1C
	brk $0F.b		; 00 0F
	inx		; E8
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $4C.b		; 00 4C
	rti		; 40

	trb $D300.w		; 1C 00 D3
	brk $FF.b		; 00 FF
	cmp $00105C.l		; CF 5C 10 00
	tsb $00.b		; 04 00
	cpy $E000.w		; CC 00 E0
	brk $B0.b		; 00 B0
	brk $E0.b		; 00 E0
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc [$08.b],Y		; F7 08
	sbc ($02.b,X)		; E1 02
	sbc $E1FF.w,Y		; F9 FF E1
	sbc $000E00.l,X		; FF 00 0E 00
	brk $F7.b		; 00 F7
	sbc $02FFF1.l,X		; FF F1 FF 02
	asl $0000.w		; 0E 00 00
	ora [$00.b]		; 07 00
	sbc ($FF.b),Y		; F1 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	sbc $01FF.w,Y		; F9 FF 01
	brk $06.b		; 00 06
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	ora $01.b,S		; 03 01
	ora $02.b,S		; 03 02
	ora $0009.w		; 0D 09 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	tsb $0200.w		; 0C 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	ora $01.b,X		; 15 01
	bit $00.b		; 24 00
	tsb $00.b		; 04 00
	and $000B18.l,X		; 3F 18 0B 00
	rol $06.b		; 26 06
	sta $0401.w,Y		; 99 01 04
	brk $00.b		; 00 00
	asl A		; 0A
	brk $9B.b		; 00 9B
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $B4.b		; 00 B4
	brk $19.b		; 00 19
	brk $66.b		; 00 66
	brk $7B.b		; 00 7B
	trb $7B00.w		; 1C 00 7B
	clc		; 18
	inc $86.b		; E6 86
	ror $3E0A.w		; 6E 0A 3E
	rol $181E.w,X		; 3E 1E 18
	and $A1B118.l,X		; 3F 18 B1 A1
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $18.b		; 00 18
	brk $91.b		; 00 91
	brk $C1.b		; 00 C1
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $4E.b		; 00 4E
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$80.b		; C0 80
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
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
	inc $3D01.w,X		; FE 01 3D
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
	brk $FC.b		; 00 FC
	brk $E8.b		; 00 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bpl  41.b		; 10 29
	brk $1C.b		; 00 1C
	bpl  43.b		; 10 2B
	jsl $3A1011.l		; 22 11 10 3A
	bmi -10.b		; 30 F6
	rol $62.b		; 26 62
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	asl $00.b,X		; 16 00
	ora $00.b,S		; 03 00
	trb $00.b		; 14 00
	rol $0500.w		; 2E 00 05
	brk $09.b		; 00 09
	brk $1D.b		; 00 1D
	brk $00.b		; 00 00
	cpx #$C0.b		; E0 C0
	rts		; 60

	brk $70.b		; 00 70
	bmi  96.b		; 30 60
	brk $78.b		; 00 78
	bvs  -8.b		; 70 F8
	jsr $80FC.w		; 20 FC 80
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor ($03.b,S),Y		; 53 03
	cop $00.b		; 02 00
	ora $070000.l,X		; 1F 00 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $2C.b		; 00 2C
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	and $20.b,S		; 23 20
	beq   0.b		; F0 00
	pea $6000.w		; F4 00 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra  96.b		; 80 60
	bra   0.b		; 80 00
	jmp.w [$0000]		; DC 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	jsr ($F203.w,X)		; FC 03 F2
	brk $FC.b		; 00 FC
	sbc $00FFF2.l,X		; FF F2 FF 00
	asl $0000.w		; 0E 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000E01.l,X		; FF 01 0E 00
	brk $08.b		; 00 08
	php		; 08
	bpl  16.b		; 10 10
	jsr $3420.w		; 20 20 34
	jsr $2024.w		; 20 24 20
	ror $6500.w,X		; 7E 00 65
	brk $3A.b		; 00 3A
	ora ($00.b)		; 12 00
	bpl   0.b		; 10 00
	php		; 08
	brk $14.b		; 00 14
	brk $08.b		; 00 08
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $84.b		; 00 84
	ora $145F0E.l		; 0F 0E 5F 14
	wai		; CB
	ora #$7C.b		; 09 7C
	brk $08.b		; 00 08
	bpl   8.b		; 10 08
	bpl 126.b		; 10 7E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	ldy #$00.b		; A0 00
	bit $00.b,X		; 34 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	bra  60.b		; 80 3C
	brk $EA.b		; 00 EA
	ora [$B7.b],Y		; 17 B7
	php		; 08
	sbc $FF.b,X		; F5 FF
	lda [$FF.b],Y		; B7 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	lda [$FF.b],Y		; B7 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	cmp [$FF.b]		; C7 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cmp [$FF.b]		; C7 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	cmp [$FF.b]		; C7 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	nop		; EA
	sbc $0AFFD7.l,X		; FF D7 FF 0A
	tsb $0000.w		; 0C 00 00
	plx		; FA
	sbc $0CFFD7.l,X		; FF D7 FF 0C
	tsb $0000.w		; 0C 00 00
	asl A		; 0A
	brk $D7.b		; 00 D7
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $EB.b		; 00 EB
	sbc $20FFE7.l,X		; FF E7 FF 20
	tsb $0000.w		; 0C 00 00
	xce		; FB
	sbc $22FFE7.l,X		; FF E7 FF 22
	tsb $0000.w		; 0C 00 00
	phd		; 0B
	brk $E7.b		; 00 E7
	sbc $000C24.l,X		; FF 24 0C 00
	brk $F0.b		; 00 F0
	sbc $26FFF7.l,X		; FF F7 FF 26
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	plp		; 28
	tsb $0000.w		; 0C 00 00
	bpl   0.b		; 10 00
	sbc [$FF.b],Y		; F7 FF
	rol A		; 2A
	tsb $0000.w		; 0C 00 00
	sbc $07FF.w,X		; FD FF 07
	brk $2C.b		; 00 2C
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	rti		; 40

	brk $40.b		; 00 40
	brk $71.b		; 00 71
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cmp $0EFC03.l		; CF 03 FC 0E
	bcs  12.b		; B0 0C
	sbc ($00.b,S),Y		; F3 00
	sbc $00DD02.l,X		; FF 02 DD 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $3C.b		; 00 3C
	brk $03.b		; 00 03
	brk $A2.b		; 00 A2
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$C0.b		; C0 C0
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	ora ($06.b,X)		; 01 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora $001C00.l,X		; 1F 00 1C 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00FE00.l,X		; 1F 00 FE 00
	rts		; 60

	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sed		; F8
	jsl $816EC1.l		; 22 C1 6E 81
	sec		; 38
	cmp [$00.b]		; C7 00
	sbc $9EF00F.l,X		; FF 0F F0 9E
	brk $FC.b		; 00 FC
	brk $F7.b		; 00 F7
	brk $3E.b		; 00 3E
	brk $11.b		; 00 11
	brk $02.b		; 00 02
	brk $0E.b		; 00 0E
	brk $4F.b		; 00 4F
	brk $00.b		; 00 00
	sta ($00.b,X)		; 81 00
	ora $077F00.l,X		; 1F 00 7F 07
	sed		; F8
	sed		; F8
	ora [$40.b]		; 07 40
	lda $00BD42.l,X		; BF 42 BD 00
	cmp ($7E.b,X)		; C1 7E
	brk $E0.b		; 00 E0
	brk $8F.b		; 00 8F
	brk $79.b		; 00 79
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq -64.b		; F0 C0
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx $0000.w		; EC 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
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
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ror $0003.w,X		; 7E 03 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $0100.w,X		; 7E 00 01
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003300.l,X		; FF 00 33 00
	sbc $40030C.l,X		; FF 0C 03 40
	ora $0C3601.l,X		; 1F 01 36 0C
	sbc ($0C.b,S),Y		; F3 0C
	lda ($00.b,S),Y		; B3 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $FC.b		; 00 FC
	brk $E0.b		; 00 E0
	brk $C8.b		; 00 C8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $C8E31C.l,X		; FF 1C E3 C8
	and ($78.b,S),Y		; 33 78
	bra  72.b		; 80 48
	bcs -119.b		; B0 89
	ror $00.b,X		; 76 00
	sbc $0CFF00.l,X		; FF 00 FF 0C
	brk $FC.b		; 00 FC
	brk $CC.b		; 00 CC
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $C7.b		; 00 C7
	php		; 08
	ora [$E0.b]		; 07 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sec		; 38
	ora [$80.b]		; 07 80
	asl $FA.b		; 06 FA
	ora ($D2.b,X)		; 01 D2
	ora $00C0.w		; 0D C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $F9.b		; 00 F9
	brk $C4.b		; 00 C4
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	sbc $DB23DC.l,X		; FF DC 23 DB
	jsr $FF00.w		; 20 00 FF
	brk $FF.b		; 00 FF
	ora $E01FE0.l,X		; 1F E0 1F E0
	ora ($FE.b,X)		; 01 FE
	tsb $0600.w		; 0C 00 06
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq  96.b		; F0 60
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	sbc $01241B.l,X		; FF 1B 24 01
	ror $7C03.w,X		; 7E 03 7C
	ora $000000.l,X		; 1F 00 00 00
	bit $0F00.w,X		; 3C 00 0F
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($0D.b,S),Y		; 13 0D
	sta ($00.b)		; 92 00
	adc $407F00.l,X		; 7F 00 7F 40
	lda $6E08F7.l,X		; BF F7 08 6E
	sta ($CD.b),Y		; 91 CD
	and ($FC.b)		; 32 FC
	brk $70.b		; 00 70
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $A7.b		; 00 A7
	brk $07.b		; 00 07
	brk $18.b		; 00 18
	brk $3C.b		; 00 3C
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	clc		; 18
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	rts		; 60

	stz $7E80.w,X		; 9E 80 7E
	jsr $80DC.w		; 20 DC 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
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
	brk $06.b		; 00 06
	sbc $C738.w,Y		; F9 38 C7
	brk $7F.b		; 00 7F
	brk $79.b		; 00 79
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	asl $0011.w		; 0E 11 00
	adc $38003E.l,X		; 7F 3E 00 38
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	brk $4C.b		; 00 4C
	lda ($18.b,S),Y		; B3 18
	sbc [$28.b]		; E7 28
	cmp ($60.b,S),Y		; D3 60
	sta [$00.b]		; 87 00
	sbc $04817E.l,X		; FF 7E 81 04
	lda ($04.b,S),Y		; B3 04
	xce		; FB
	eor $00.b,S		; 43 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00FF00.l,X		; 1F 00 FF 00
	ora [$00.b]		; 07 00
	asl $00.b		; 06 00
	brk $FF.b		; 00 FF
	eor ($BE.b,X)		; 41 BE
	cmp $03FC30.l		; CF 30 FC 03
	brk $FF.b		; 00 FF
	beq  15.b		; F0 0F
	cmp $3C.b,S		; C3 3C
	bvc -81.b		; 50 AF
	and ($00.b),Y		; 31 00
	cmp ($00.b,X)		; C1 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	jsr ($C300.w,X)		; FC 00 C3
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	jsr ($F800.w,X)		; FC 00 F8
	beq   0.b		; F0 00
	bvs -128.b		; 70 80
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	sta [$78.b]		; 87 78
	ror $99.b		; 66 99
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	rts		; 60

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($00.b),Y		; 31 00
	sbc $001F00.l,X		; FF 00 1F 00
	brk $1B.b		; 00 1B
	brk $7E.b		; 00 7E
	ora ($F8.b,X)		; 01 F8
	ora $F0.b,S		; 03 F0
	and $007E80.l,X		; 3F 80 7E 00
	rts		; 60

	ora [$43.b]		; 07 43
	ldy $0000.w,X		; BC 00 00
	ora ($00.b,X)		; 01 00
	asl $00.b		; 06 00
	tsb $4000.w		; 0C 00 40
	brk $80.b		; 00 80
	brk $87.b		; 00 87
	brk $3B.b		; 00 3B
	brk $0E.b		; 00 0E
	beq -120.b		; F0 88
	bpl -64.b		; 10 C0
	brk $84.b		; 00 84
	rtl		; 6B

	brk $43.b		; 00 43
	brk $91.b		; 00 91
	inc A		; 1A
	sbc ($C8.b,X)		; E1 C8
	and [$49.b],Y		; 37 49
	brk $67.b		; 00 67
	brk $3F.b		; 00 3F
	brk $12.b		; 00 12
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $CF.b		; 00 CF
	brk $2B.b		; 00 2B
	trb $6C.b		; 14 6C
	sta ($47.b,S),Y		; 93 47
	sec		; 38
	ora $BC.b,S		; 03 BC
	cpx #$1F.b		; E0 1F
	bra  15.b		; 80 0F
	cpx #$03.b		; E0 03
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	rts		; 60

	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra 126.b		; 80 7E
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sed		; F8
	brk $7F.b		; 00 7F
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($0E.b,X)		; 01 0E
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	tda		; 7B
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $63.b		; 00 63
	brk $7B.b		; 00 7B
	brk $00.b		; 00 00
	sbc $003400.l,X		; FF 00 34 00
	adc $80BD42.l,X		; 7F 42 BD 80
	trb $C001.w		; 1C 01 C0
	ora ($01.b)		; 12 01
	ora $0000F0.l		; 0F F0 00 00
	wai		; CB
	brk $42.b		; 00 42
	brk $C2.b		; 00 C2
	brk $83.b		; 00 83
	brk $3E.b		; 00 3E
	brk $ED.b		; 00 ED
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	bit $01.b		; 24 01
	cop $4D.b		; 02 4D
	cop $38.b		; 02 38
	cmp ($23.b,X)		; C1 23
	jmp $113CC3.l		; 5C C3 3C 11
	inc $0EF1.w		; EE F1 0E
	eor $00FF00.l,X		; 5F 00 FF 00
	sbc $003F00.l,X		; FF 00 3F 00
	sta $003F00.l,X		; 9F 00 3F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sta ($78.b,X)		; 81 78
	sta [$78.b]		; 87 78
	sed		; F8
	ora [$41.b]		; 07 41
	sta ($87.b)		; 92 87
	brk $0F.b		; 00 0F
	brk $EF.b		; 00 EF
	bpl -10.b		; 10 F6
	ora #$81.b		; 09 81
	brk $87.b		; 00 87
	brk $F8.b		; 00 F8
	brk $CC.b		; 00 CC
	brk $F8.b		; 00 F8
	brk $FB.b		; 00 FB
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	ora $1CF300.l,X		; 1F 00 F3 1C
	rts		; 60

	beq   8.b		; F0 08
	beq   8.b		; F0 08
	cmp ($00.b,X)		; C1 00
	rol $8000.w,X		; 3E 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$07.b]		; 07 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $38.b		; 00 38
	cpy #$38.b		; C0 38
	cpy #$38.b		; C0 38
	cpy #$38.b		; C0 38
	cpy #$38.b		; C0 38
	cpy #$38.b		; C0 38
	cpy #$38.b		; C0 38
	cpy #$78.b		; C0 78
	bra  -8.b		; 80 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $0300.w		; 0C 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $001300.l,X		; 3F 00 13 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cmp $01FC03.l		; CF 03 FC 01
	ror $F00A.w,X		; 7E 0A F0
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	ora $00.b		; 05 00
	asl $7800.w,X		; 1E 00 78
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	ora $131CE3.l		; 0F E3 1C 13
	jmp ($3E01.w)		; 6C 01 3E
	ora ($BE.b,X)		; 01 BE
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	and $001F00.l		; 2F 00 1F 00
	lda $00BF00.l		; AF 00 BF 00
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	sec		; 38
	cmp [$C0.b]		; C7 C0
	and $03FC.w,X		; 3D FC 03
	cmp $26C130.l		; CF 30 C1 26
	cpy #$31.b		; C0 31
	cpy #$38.b		; C0 38
	cpy #$18.b		; C0 18
	cpy #$00.b		; C0 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	jsr ($F10E.w,X)		; FC 0E F1
	inc $F000.w,X		; FE 00 F0
	asl $C038.w		; 0E 38 C0
	jsr $0040.w		; 20 40 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $FC.b		; 00 FC
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
	brk $0F.b		; 00 0F
	brk $85.b		; 00 85
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
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
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora $FF1FE0.l,X		; 1F E0 1F FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $37.b		; 00 37
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	bra 120.b		; 80 78
	bra 120.b		; 80 78
	bra 126.b		; 80 7E
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	brk $6F.b		; 00 6F
	brk $E4.b		; 00 E4
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $CF.b		; 00 CF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	brk $F7.b		; 00 F7
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
	brk $E4.b		; 00 E4
	brk $7B.b		; 00 7B
	brk $ED.b		; 00 ED
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
	brk $0B.b		; 00 0B
	bra  44.b		; 80 2C
	brk $EF.b		; 00 EF
	ora ($C6.b)		; 12 C6
	asl $F6.b		; 06 F6
	sbc $00FFC6.l,X		; FF C6 FF 00
	tsb $0000.w		; 0C 00 00
	asl $00.b		; 06 00
	dec $FF.b		; C6 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc $FFD6FF.l		; EF FF D6 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	sbc $FFD6FF.l,X		; FF FF D6 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	ora $FFD600.l		; 0F 00 D6 FF
	php		; 08
	tsb $0000.w		; 0C 00 00
	sbc $FFE6FF.l		; EF FF E6 FF
	asl A		; 0A
	tsb $0000.w		; 0C 00 00
	sbc $FFE6FF.l,X		; FF FF E6 FF
	tsb $000C.w		; 0C 0C 00
	brk $0F.b		; 00 0F
	brk $E6.b		; 00 E6
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $F3.b		; 00 F3
	sbc $20FFF6.l,X		; FF F6 FF 20
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	inc $FF.b,X		; F6 FF
	jsl $00000C.l		; 22 0C 00 00
	inc $06FF.w,X		; FE FF 06
	brk $24.b		; 00 24
	tsb $0000.w		; 0C 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	jsr $3100.w		; 20 00 31
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	asl $9C02.w		; 0E 02 9C
	asl $10F0.w		; 0E F0 10
	sbc $08FF00.l		; EF 00 FF 08
	lda [$13.b],Y		; B7 13
	bit $FF00.w		; 2C 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	tsb $4800.w		; 0C 00 48
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $00.b		; 06 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	ora $1F00.w,Y		; 19 00 1F
	ora ($7E.b,X)		; 01 7E
	.db $82, $7D, $04		; 82 7D 04
	plx		; FA
	tsb $0F91.w		; 0C 91 0F
	beq -31.b		; F0 E1
	asl $00.b,X		; 16 00
	brk $E1.b		; 00 E1
	brk $E9.b		; 00 E9
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	sbc $C0FD02.l,X		; FF 02 FD C0
	and ($01.b,X)		; 21 01
	inc $D827.w,X		; FE 27 D8
	bit $B8C3.w,X		; 3C C3 B8
	eor [$23.b]		; 47 23
	jmp.w [$0080]		; DC 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	sbc ($00.b,X)		; E1 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	jsr ($E300.w,X)		; FC 00 E3
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cld		; D8
	brk $F0.b		; 00 F0
	cpx #$00.b		; E0 00
	rts		; 60

	bra   4.b		; 80 04
	sed		; F8
	sty $0070.w		; 8C 70 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $01.b,S		; 03 01
	asl $1801.w,X		; 1E 01 18
	ora ($00.b,X)		; 01 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $00.b		; 66 00
	inc $3D00.w,X		; FE 00 3D
	brk $E7.b		; 00 E7
	brk $01.b		; 00 01
	brk $09.b		; 00 09
	cpx #$1C.b		; E0 1C
	cpy #$F0.b		; C0 F0
	tsb $E0.b		; 04 E0
	php		; 08
	ora ($3E.b,X)		; 01 3E
	ora $00E2.w,X		; 1D E2 00
	cpy #$02.b		; C0 02
	sed		; F8
	asl $00.b,X		; 16 00
	and $00.b,S		; 23 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	and $00DD00.l,X		; 3F 00 DD 00
	and $001700.l,X		; 3F 00 17 00
	inc A		; 1A
	ora $13.b		; 05 13
	tsb $6718.w		; 0C 18 67
	brk $23.b		; 00 23
	cli		; 58
	and ($18.b,X)		; 21 18
	cpx #$11.b		; E0 11
	rol $21DE.w		; 2E DE 21
	sed		; F8
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FB.b		; 00 FB
	brk $F1.b		; 00 F1
	brk $FE.b		; 00 FE
	brk $3E.b		; 00 3E
	cpy #$BC.b		; C0 BC
	brk $70.b		; 00 70
	bra   0.b		; 80 00
	sed		; F8
	brk $BF.b		; 00 BF
	brk $2F.b		; 00 2F
	cpy #$3B.b		; C0 3B
	tsb $00F0.w		; 0C F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	adc $03140B.l,X		; 7F 0B 14 03
	bit $0006.w,X		; 3C 06 00
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	asl $38.b		; 06 38
	ora $000000.l		; 0F 00 00 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	sbc $EF00.w,Y		; F9 00 EF
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	sbc $EE7E81.l,X		; FF 81 7E EE
	ora ($96.b),Y		; 11 96
	pla		; 68
	brk $70.b		; 00 70
	brk $67.b		; 00 67
	brk $0F.b		; 00 0F
	dec $0021.w,X		; DE 21 00
	brk $4F.b		; 00 4F
	brk $0E.b		; 00 0E
	brk $70.b		; 00 70
	brk $CF.b		; 00 CF
	brk $98.b		; 00 98
	brk $F3.b		; 00 F3
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpy #$C0.b		; C0 C0
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
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $000400.l		; 0F 00 04 00
	sed		; F8
	tsb $0001.w		; 0C 01 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	brk $07.b		; 00 07
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	inc $FF00.w,X		; FE 00 FF
	ora $67F2.w		; 0D F2 67
	clc		; 18
	ora $FA.b		; 05 FA
	ora $60A6.w,Y		; 19 A6 60
	sta $01DE01.l,X		; 9F 01 DE 01
	brk $01.b		; 00 01
	brk $7D.b		; 00 7D
	brk $E1.b		; 00 E1
	brk $01.b		; 00 01
	brk $41.b		; 00 41
	brk $02.b		; 00 02
	brk $05.b		; 00 05
	brk $08.b		; 00 08
	sbc [$13.b],Y		; F7 13
	cpx #$00.b		; E0 00
	adc $0C1F00.l,X		; 7F 00 1F 0C
	ora $20.b,S		; 03 20
	cmp $15.b,S		; C3 15
	sep #$C9		; E2 C9
	asl $80.b		; 06 80
	brk $90.b		; 00 90
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $18.b		; 00 18
	brk $38.b		; 00 38
	brk $4C.b		; 00 4C
	lda ($80.b,S),Y		; B3 80
	adc $00A05A.l,X		; 7F 5A A0 00
	sbc $1EFF00.l,X		; FF 00 FF 1E
	adc ($03.b,X)		; 61 03
	jsr ($01FE.w,X)		; FC FE 01
	rti		; 40

	brk $0C.b		; 00 0C
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
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
	brk $01.b		; 00 01
	cop $02.b		; 02 02
	trb $0800.w		; 1C 00 08
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	asl $6700.w,X		; 1E 00 67
	brk $77.b		; 00 77
	brk $3E.b		; 00 3E
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	inc $6300.w		; EE 00 63
	eor ($0E.b),Y		; 51 0E
	and $38C7C0.l,X		; 3F C0 C7 38
	ora #$F2.b		; 09 F2
	bmi -63.b		; 30 C1
	brk $0D.b		; 00 0D
	ora ($00.b),Y		; 11 00
	ora $AF00.w,X		; 1D 00 AF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $04.b		; 00 04
	brk $0D.b		; 00 0D
	brk $71.b		; 00 71
	brk $88.b		; 00 88
	bpl  49.b		; 10 31
	cpy #$1F.b		; C0 1F
	cpx #$1D.b		; E0 1D
	sep #$06		; E2 06
	sbc $C03F.w,Y		; F9 3F C0
	tas		; 1B
	cpx $18.b		; E4 18
	sbc $FB.b		; E5 FB
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $78.b		; 00 78
	sty $F8.b		; 84 F8
	tsb $DE.b		; 04 DE
	brk $80.b		; 00 80
	rti		; 40

	brk $E0.b		; 00 E0
	asl $F9.b		; 06 F9
	inc $7800.w,X		; FE 00 78
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
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
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	stz $1E01.w,X		; 9E 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($1E.b,X)		; 01 1E
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	sta ($46.b,X)		; 81 46
	bra  32.b		; 80 20
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
	sta ($00.b,X)		; 81 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $008B00.l,X		; 1F 00 8B 00
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	trb $1C03.w		; 1C 03 1C
	ora $7C.b,S		; 03 7C
	sta $7C.b,S		; 83 7C
	xce		; FB
	tsb $FA.b		; 04 FA
	brk $DE.b		; 00 DE
	brk $02.b		; 00 02
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $DF.b		; 00 DF
	brk $FB.b		; 00 FB
	brk $F7.b		; 00 F7
	brk $5D.b		; 00 5D
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
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
	brk $07.b		; 00 07
	bra  28.b		; 80 1C
	brk $F3.b		; 00 F3
	tsb $05D5.w		; 0C D5 05
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
	brk $FE.b		; 00 FE
	sbc $0C0005.l,X		; FF 05 00 0C
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $31.b		; 00 31
	ora $000610.l		; 0F 10 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b)		; 12 00
	ora $001800.l		; 0F 00 18 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	cpy #$40.b		; C0 40
	ldy $FC00.w,X		; BC 00 FC
	cli		; 58
	ldy #$00.b		; A0 00
	jsr ($FC00.w,X)		; FC 00 FC
	bcs  78.b		; B0 4E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	jsr $C000.w		; 20 00 C0
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	tsb $00.b		; 04 00
	ora $010600.l		; 0F 00 06 01
	brk $00.b		; 00 00
	sbc ($01.b,S),Y		; F3 01
	asl $0200.w,X		; 1E 00 02
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000C00.l,X		; FF 00 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	trb $EB.b		; 14 EB
	bpl -17.b		; 10 EF
	bpl -18.b		; 10 EE
	bvs -125.b		; 70 83
	eor ($A0.b),Y		; 51 A0
	ora $FC.b,S		; 03 FC
	clc		; 18
	sbc ($3E.b,X)		; E1 3E
	brk $1C.b		; 00 1C
	brk $10.b		; 00 10
	brk $70.b		; 00 70
	brk $1C.b		; 00 1C
	brk $1F.b		; 00 1F
	brk $02.b		; 00 02
	brk $56.b		; 00 56
	brk $00.b		; 00 00
	sed		; F8
	cpy $38.b		; C4 38
	bit $DA.b		; 24 DA
	cpx $0012.w		; EC 12 00
	inc $FF00.w,X		; FE 00 FF
	eor $807E30.l		; 4F 30 7E 80
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	jsr $0400.w		; 20 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
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
	brk $03.b		; 00 03
	trb $0B04.w		; 1C 04 0B
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $00F400.l,X		; DF 00 F4 00
	rts		; 60

	brk $03.b		; 00 03
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	ora $1CE3.w,Y		; 19 E3 1C
	and $BA0450.l		; 2F 50 04 BA
	tsb $3A.b		; 04 3A
	tsb $39.b		; 04 39
	tsb $38.b		; 04 38
	tsb $38.b		; 04 38
	jsr ($1C00.w,X)		; FC 00 1C
	brk $9F.b		; 00 9F
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $80.b		; 00 80
	rti		; 40

	brk $E0.b		; 00 E0
	stx $7070.w		; 8E 70 70
	sty $6018.w		; 8C 18 60
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
	brk $84.b		; 00 84
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	clc		; 18
	tsb $00.b		; 04 00
	brk $7E.b		; 00 7E
	ora $18.b		; 05 18
	asl $09.b		; 06 09
	ora ($1E.b,X)		; 01 1E
	.db $62, $9D, $04		; 62 9D 04
	plx		; FA
	brk $00.b		; 00 00
	tda		; 7B
	brk $0F.b		; 00 0F
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	ldy #$00.b		; A0 00
	cmp [$00.b]		; C7 00
	and $008C70.l,X		; 3F 70 8C 00
	jsr ($4680.w,X)		; FC 80 46
	tsb $FB.b		; 04 FB
	eor $00C0A0.l,X		; 5F A0 C0 00
	sec		; 38
	brk $DE.b		; 00 DE
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C4.b		; 00 C4
	brk $C0.b		; 00 C0
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
	ora [$00.b]		; 07 00
	asl $3007.w		; 0E 07 30
	tsb $01.b		; 04 01
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	tsb $0B.b		; 04 0B
	brk $14.b		; 00 14
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	pha		; 48
	brk $F9.b		; 00 F9
	brk $68.b		; 00 68
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $0B.b		; 00 0B
	brk $12.b		; 00 12
	ora ($80.b,X)		; 01 80
	adc $0400.w,X		; 7D 00 04
	inc A		; 1A
	cpx $02.b		; E4 02
	bit #$2B.b		; 89 2B
	sty $90.b		; 84 90
	.db $62, $64, $18		; 62 64 18
	inc $0A00.w		; EE 00 0A
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $3E.b		; 00 3E
	brk $FF.b		; 00 FF
	brk $9E.b		; 00 9E
	brk $9F.b		; 00 9F
	brk $9E.b		; 00 9E
	rts		; 60

	sei		; 78
	bra   0.b		; 80 00
	sed		; F8
	brk $5E.b		; 00 5E
	jsr $8487.w		; 20 87 84
	sei		; 78
	sec		; 38
	tsb $F1.b		; 04 F1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $B1.b		; 00 B1
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
	brk $0F.b		; 00 0F
	brk $27.b		; 00 27
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	sec		; 38
	tsb $38.b		; 04 38
	tsb $0C30.w		; 0C 30 0C
	bmi  14.b		; 30 0E
	beq -17.b		; F0 EF
	bpl -21.b		; 10 EB
	brk $08.b		; 00 08
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora #$E3.b		; 09 E3
	cop $F8.b		; 02 F8
	sbc $00FFE3.l,X		; FF E3 FF 00
	tsb $0000.w		; 0C 00 00
	sed		; F8
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $F1.b		; 00 F1
	sbc $000C04.l,X		; FF 04 0C 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	asl $0C03.w		; 0E 03 0C
	brk $00.b		; 00 00
	ora $0C.b,S		; 03 0C
	cop $00.b		; 02 00
	php		; 08
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	rti		; 40

	brk $F0.b		; 00 F0
	rti		; 40

	bcs   0.b		; B0 00
	beq   0.b		; F0 00
	sed		; F8
	jsr $00C0.w		; 20 C0 00
	clv		; B8
	rts		; 60

	bcc   0.b		; 90 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $04.b		; 00 04
	and ($11.b,S),Y		; 33 11
	asl $00.b		; 06 00
	trb $0A15.w		; 1C 15 0A
	cop $11.b		; 02 11
	phd		; 0B
	trb $01.b		; 14 01
	bit $0500.w,X		; 3C 00 05
	php		; 08
	brk $E7.b		; 00 E7
	brk $E1.b		; 00 E1
	brk $15.b		; 00 15
	brk $2D.b		; 00 2D
	brk $68.b		; 00 68
	brk $42.b		; 00 42
	brk $19.b		; 00 19
	brk $1C.b		; 00 1C
	ldy #$C0.b		; A0 C0
	ora [$48.b],Y		; 17 48
	lda $0C.b,S		; A3 0C
	.db $42, $19		; 42 19
	bra  32.b		; 80 20
	cld		; D8
	adc ($8D.b)		; 72 8D
	lsr $A8.b		; 46 A8
	cpy #$00.b		; C0 00
	inx		; E8
	brk $C8.b		; 00 C8
	brk $D0.b		; 00 D0
	brk $E9.b		; 00 E9
	brk $C0.b		; 00 C0
	brk $FE.b		; 00 FE
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	asl $2F10.w		; 0E 10 2F
	brk $07.b		; 00 07
	ora #$16.b		; 09 16
	ora ($16.b,X)		; 01 16
	phd		; 0B
	bit $08.b		; 24 08
	and [$01.b],Y		; 37 01
	asl $0039.w		; 0E 39 00
	bpl   0.b		; 10 00
	ora $1900.w,Y		; 19 00 19
	brk $03.b		; 00 03
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $80.b		; 00 80
	trb $EC10.w		; 1C 10 EC
	brk $FC.b		; 00 FC
	ora ($EC.b)		; 12 EC
	asl $00C1.w,X		; 1E C1 00
	adc $9E8877.l,X		; 7F 77 88 9E
	and ($80.b,X)		; 21 80
	brk $90.b		; 00 90
	brk $C0.b		; 00 C0
	brk $98.b		; 00 98
	brk $02.b		; 00 02
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $07.b,S		; 03 07
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra 119.b		; 80 77
	bra -66.b		; 80 BE
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	ora $F2.b,S		; 03 F2
	brk $FC.b		; 00 FC
	sbc $00FFF2.l,X		; FF F2 FF 00
	tsb $0000.w		; 0C 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $00.b		; 00 00
	bit $1C00.w,X		; 3C 00 1C
	php		; 08
	bmi  24.b		; 30 18
	bit $40.b		; 24 40
	bit $7806.w,X		; 3C 06 78
	brk $2E.b		; 00 2E
	asl $1020.w,X		; 1E 20 10
	brk $20.b		; 00 20
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $54.b		; 00 54
	brk $D0.b		; 00 D0
	brk $08.b		; 00 08
	brk $48.b		; 00 48
	rol $78.b		; 26 78
	asl $00.b		; 06 00
	jmp ($300A.w,X)		; 7C 0A 30
	php		; 08
	bpl   8.b		; 10 08
	bpl  63.b		; 10 3F
	brk $00.b		; 00 00
	brk $B8.b		; 00 B8
	brk $78.b		; 00 78
	brk $98.b		; 00 98
	brk $58.b		; 00 58
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $F8.b		; 00 F8
	ora [$F3.b]		; 07 F3
	cop $FA.b		; 02 FA
	sbc $00FFF3.l,X		; FF F3 FF 00
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	sbc ($FF.b,S),Y		; F3 FF
	ora ($0C.b,X)		; 01 0C
	brk $00.b		; 00 00
	sed		; F8
	sbc $02FFFB.l,X		; FF FB FF 02
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	xce		; FB
	sbc $000C03.l,X		; FF 03 0C 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b)		; 12 00
	ora ($00.b)		; 12 00
	ora ($00.b)		; 12 00
	tas		; 1B
	brk $8B.b		; 00 8B
	brk $49.b		; 00 49
	brk $2D.b		; 00 2D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $06.b		; 00 06
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bmi   0.b		; 30 00
	bcs   0.b		; B0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	cmp $6700.w		; CD 00 67
	brk $3A.b		; 00 3A
	brk $0D.b		; 00 0D
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsl $001800.l		; 22 00 18 00
	ora $00.b		; 05 00
	sbc ($00.b)		; F2 00
	trb $0300.w		; 1C 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($AC00.w)		; 6C 00 AC
	brk $AC.b		; 00 AC
	brk $68.b		; 00 68
	brk $C8.b		; 00 C8
	brk $D0.b		; 00 D0
	ora [$00.b]		; 07 00
	phy		; 5A
	brk $93.b		; 00 93
	brk $53.b		; 00 53
	brk $52.b		; 00 52
	brk $96.b		; 00 96
	brk $36.b		; 00 36
	brk $2C.b		; 00 2C
	brk $FF.b		; 00 FF
	brk $5A.b		; 00 5A
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	tsb $F6.b		; 04 F6
	ora ($FD.b,X)		; 01 FD
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $0000.w		; 0C 00 00
	sbc $FEFF.w,X		; FD FF FE
	sbc $000C01.l,X		; FF 01 0C 00
	brk $F5.b		; 00 F5
	sbc $02FFF9.l,X		; FF F9 FF 02
	tsb $0000.w		; 0C 00 00
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $82.b		; 00 82
	brk $52.b		; 00 52
	brk $52.b		; 00 52
	brk $7A.b		; 00 7A
	brk $EA.b		; 00 EA
	brk $4A.b		; 00 4A
	brk $00.b		; 00 00
	rti		; 40

	brk $41.b		; 00 41
	brk $21.b		; 00 21
	brk $21.b		; 00 21
	brk $01.b		; 00 01
	brk $15.b		; 00 15
	brk $B5.b		; 00 B5
	brk $00.b		; 00 00
	clv		; B8
	brk $14.b		; 00 14
	ora $00.b,S		; 03 00
	ora $00.b,X		; 15 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor [$00.b]		; 47 00
	ror A		; 6A
	brk $3F.b		; 00 3F
	brk $15.b		; 00 15
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	ora $F9.b,S		; 03 F9
	ora ($FC.b,X)		; 01 FC
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora ($0C.b,X)		; 01 0C
	brk $00.b		; 00 00
	brk $2A.b		; 00 2A
	brk $2A.b		; 00 2A
	brk $0A.b		; 00 0A
	brk $16.b		; 00 16
	brk $B6.b		; 00 B6
	brk $4E.b		; 00 4E
	brk $1A.b		; 00 1A
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b),Y		; 11 00
	ora #$00.b		; 09 00
	ora #$00.b		; 09 00
	and ($00.b),Y		; 31 00
	adc $00.b		; 65 00
	ora $00C000.l,X		; 1F 00 C0 00
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
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FB01.w,X		; FD 01 FB
	sbc $FBFFFD.l,X		; FF FD FF FB
	sbc $000C00.l,X		; FF 00 0C 00
	brk $00.b		; 00 00
	pha		; 48
	brk $88.b		; 00 88
	brk $38.b		; 00 38
	brk $98.b		; 00 98
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $60.b		; 00 60
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $05.b		; 00 05
	brk $FF.b		; 00 FF
	inc $FFFF.w,X		; FE FF FF
	sbc $0C00FF.l,X		; FF FF 00 0C
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
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	sed		; F8
	asl A		; 0A
	inc $02.b,X		; F6 02
	sed		; F8
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inc $FF.b,X		; F6 FF
	ora ($0C.b,X)		; 01 0C
	brk $00.b		; 00 00
	sed		; F8
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inc $03FF.w,X		; FE FF 03
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $FE.b		; 00 FE
	sbc $000C04.l,X		; FF 04 0C 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	asl $060D.w		; 0E 0D 06
	eor $E733.w		; 4D 33 E7
	sta $030101.l,X		; 9F 01 01 03
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora [$01.b]		; 07 01
	ora $7E0F0B.l		; 0F 0B 0F 7E
	adc $78FF78.l,X		; 7F 78 FF 78
	bra 120.b		; 80 78
	bra  32.b		; 80 20
	cpy #$CC.b		; C0 CC
	tsb $E222.w		; 0C 22 E2
	iny		; C8
	clv		; B8
	sbc $E99791.l		; EF 91 97 E9
	sed		; F8
	sed		; F8
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FEF2.w,X)		; FC F2 FE
	jmp.w [$76FE]		; DC FE 76
	inc $FF7E.w,X		; FE 7E FF
	ror $AFFF.w,X		; 7E FF AF
	jmp $F022FD.l		; 5C FD 22 F0
	and ($F9.b,S),Y		; 33 F9
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	cmp $FFCFFF.l,X		; DF FF CF FF
	ora [$FF.b]		; 07 FF
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $F9399F.l,X		; 7F 9F 39 F9
	jmp ($70FC.w,X)		; 7C FC 70
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	sbc $83FFC6.l,X		; FF C6 FF 83
	sbc $FFFE8F.l,X		; FF 8F FE FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FA.b		; 00 FA
	php		; 08
	sed		; F8
	ora ($FA.b,X)		; 01 FA
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	plx		; FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FE.b		; 00 FE
	sbc $02FFF2.l,X		; FF F2 FF 02
	tsb $0000.w		; 0C 00 00
	asl $161C.w,X		; 1E 1C 16
	tas		; 1B
	sta [$6E.b],Y		; 97 6E
	dec $F53F.w,X		; DE 3F F5
	phk		; 4B
	sbc ($6F.b,X)		; E1 6F
	sbc $E3.b		; E5 E3
	brk $00.b		; 00 00
	ora $1F.b,S		; 03 1F
	ora $F91F.w		; 0D 1F F9
	sbc $BEFFE1.l,X		; FF E1 FF BE
	sbc $1EFF9E.l,X		; FF 9E FF 1E
	sbc $60003F.l,X		; FF 3F 00 60
	rts		; 60

	rti		; 40

	cpy #$70.b		; C0 70
	bcc -80.b		; 90 B0
	bvc -48.b		; 50 D0
	bne -32.b		; D0 E0
	cpx #$80.b		; E0 80
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	cpx #$A0.b		; E0 A0
	cpx #$E0.b		; E0 E0
	beq -32.b		; F0 E0
	beq  44.b		; F0 2C
	beq  24.b		; F0 18
	beq 126.b		; F0 7E
	cpx #$F8.b		; E0 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $9C.b		; 00 9C
	rts		; 60

	bne -32.b		; D0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $3EFE.w,X		; FE FE 3E
	inc $0002.w,X		; FE 02 00
	cop $00.b		; 02 00
	jsr ($FA06.w,X)		; FC 06 FA
	brk $FC.b		; 00 FC
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	plx		; FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $16.b		; 00 16
	php		; 08
	and $2831.w,Y		; 39 31 28
	rol $7CBB.w,X		; 3E BB 7C
	inc $1E.b		; E6 1E
	dec $CE.b		; C6 CE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $3F0E1F.l,X		; 1F 1F 0E 3F
	ora [$3F.b],Y		; 17 3F
	cmp [$FF.b]		; C7 FF
	sbc $39FF.w,Y		; F9 FF 39
	sbc $00007F.l,X		; FF 7F 00 00
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
	bra  64.b		; 80 40
	bra -32.b		; 80 E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FD.b		; 00 FD
	cop $FC.b		; 02 FC
	brk $FD.b		; 00 FD
	sbc $00FFFC.l,X		; FF FC FF 00
	tsb $0000.w		; 0C 00 00
	bmi  32.b		; 30 20
	rts		; 60

	bvc -20.b		; 50 EC
	stz $98.b,X		; 74 98
	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	sec		; 38
	sec		; 38
	sei		; 78
	tya		; 98
	jsr ($FC64.w,X)		; FC 64 FC
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $000C00.l,X		; FF 00 0C 00
	brk $80.b		; 00 80
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	plx		; FA
	ora $03F4.w		; 0D F4 03
	xce		; FB
	sbc $00FFF4.l,X		; FF F4 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	pea $01FF.w		; F4 FF 01
	tsb $0000.w		; 0C 00 00
	plx		; FA
	sbc $02FFFC.l,X		; FF FC FF 02
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	jsr ($03FF.w,X)		; FC FF 03
	tsb $0000.w		; 0C 00 00
	asl A		; 0A
	brk $FC.b		; 00 FC
	sbc $000C04.l,X		; FF 04 0C 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	sec		; 38
	plp		; 28
	bpl  10.b		; 10 0A
	bvs  75.b		; 70 4B
	bit $00.b,X		; 34 00
	ror $140B.w,X		; 7E 0B 14
	and ($4C.b)		; 32 4C
	ora $3F3F1F.l,X		; 1F 1F 3F 3F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	adc $FFFF7F.l,X		; 7F 7F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	cpy #$40.b		; C0 40
	beq -16.b		; F0 F0
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	php		; 08
	sed		; F8
	ora $3D.b,S		; 03 3D
	and $4B.b,S		; 23 4B
	sty $6B.b,X		; 94 6B
.INDEX 8
	sep #$9E		; E2 9E
	sbc $FBDC.w,X		; FD DC FB
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FCFF.w,X		; FE FF FC
	sbc $7DFFFF.l,X		; FF FF FF 7D
	sbc $07FF23.l,X		; FF 23 FF 07
	sbc $10007F.l,X		; FF 7F 00 10
	brk $F8.b		; 00 F8
	beq -106.b		; F0 96
	sty $5E.b,X		; 94 5E
	asl $34F4.w,X		; 1E F4 34
	adc $67F77F.l,X		; 7F 7F F7 67
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $6AFE.w		; 0E FE 6A
	inc $FFE1.w,X		; FE E1 FF
	wai		; CB
	sbc $98FF80.l,X		; FF 80 FF 98
	sbc $4600FF.l,X		; FF FF 00 46
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $90.b		; 00 90
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FC.b		; 00 FC
	ora #$F7.b		; 09 F7
	cop $FC.b		; 02 FC
	sbc $00FFFB.l,X		; FF FB FF 00
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	xce		; FB
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FC.b		; 00 FC
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	ora [$09.b],Y		; 17 09
	and $59.b		; 25 59
	lsr $308E.w		; 4E 8E 30
	cpy $39CB.w		; CC CB 39
	sbc $0000E1.l		; EF E1 00 00
	brk $00.b		; 00 00
	inc $FEFF.w,X		; FE FF FE
	sbc $FFFFF1.l,X		; FF F1 FF FF
	sbc $1EFFF6.l,X		; FF F6 FF 1E
	sbc $2000FF.l,X		; FF FF 00 20
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$A0.b		; C0 A0
	ldy #$E0.b		; A0 E0
	cpx #$A0.b		; E0 A0
	ldy #$B0.b		; A0 B0
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	cpx #$40.b		; E0 40
	cpx #$10.b		; E0 10
	beq  92.b		; F0 5C
	beq -52.b		; F0 CC
	beq -16.b		; F0 F0
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	bmi  48.b		; 30 30
	brk $15.b		; 00 15
	rts		; 60

	ora ($7D.b,X)		; 01 7D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $3F3E.w,X		; 3E 3E 3F
	and $FE7F7F.l,X		; 3F 7F 7F FE
	sbc $030003.l,X		; FF 03 00 03
	brk $FD.b		; 00 FD
	ora $F9.b		; 05 F9
	ora ($FD.b,X)		; 01 FD
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b		; 05 00
	sbc $01FF.w,Y		; F9 FF 01
	tsb $0000.w		; 0C 00 00
	inc $01FF.w,X		; FE FF 01
	brk $02.b		; 00 02
	tsb $0000.w		; 0C 00 00
	clc		; 18
	rts		; 60

	bit $40.b		; 24 40
	tsb $74.b		; 04 74
	lsr $36.b		; 46 36
	asl $636E.w,X		; 1E 6E 63
	sta ($E7.b,S),Y		; 93 E7
	sbc [$00.b]		; E7 00
	brk $78.b		; 00 78
	sei		; 78
	jmp ($F87C.w,X)		; 7C 7C F8
	jsr ($FFF9.w,X)		; FC F9 FF
	sbc ($FF.b),Y		; F1 FF
	jsr ($18FF.w,X)		; FC FF 18
	sbc $0000FF.l,X		; FF FF 00 00
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
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $82.b		; 00 82
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
	rti		; 40

	brk $10.b		; 00 10
	beq  48.b		; F0 30
	bne  72.b		; D0 48
	tay		; A8
	ldy $009C.w,X		; BC 9C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	bvs -32.b		; 70 E0
	beq -24.b		; F0 E8
	sed		; F8
	pea $60FC.w		; F4 FC 60
	jsr ($0008.w,X)		; FC 08 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	inc $FFFF.w,X		; FE FF FF
	sbc $00FFFE.l,X		; FF FE FF 00
	tsb $0000.w		; 0C 00 00
	brk $80.b		; 00 80
	cpy #$40.b		; C0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
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
	asl A		; 0A
	bra  40.b		; 80 28
	brk $EC.b		; 00 EC
	trb $05E1.w		; 1C E1 05
	cpx $E1FF.w		; EC FF E1
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FC.b		; 00 FC
	sbc $02FFE1.l,X		; FF E1 FF 02
	tsb $0000.w		; 0C 00 00
	tsb $E100.w		; 0C 00 E1
	sbc $000C04.l,X		; FF 04 0C 00
	brk $EC.b		; 00 EC
	sbc $06FFF1.l,X		; FF F1 FF 06
	tsb $0000.w		; 0C 00 00
	jsr ($F1FF.w,X)		; FC FF F1
	sbc $000C08.l,X		; FF 08 0C 00
	brk $0C.b		; 00 0C
	brk $F1.b		; 00 F1
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $1C.b		; 00 1C
	brk $F1.b		; 00 F1
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $EC.b		; 00 EC
	sbc $0E0001.l,X		; FF 01 00 0E
	tsb $0000.w		; 0C 00 00
	jsr ($01FF.w,X)		; FC FF 01
	brk $20.b		; 00 20
	tsb $0000.w		; 0C 00 00
	tsb $0100.w		; 0C 00 01
	brk $22.b		; 00 22
	tsb $0000.w		; 0C 00 00
	ora $3F3F0F.l		; 0F 0F 3F 3F
	adc $FFE77F.l,X		; 7F 7F E7 FF
	cmp $BF.b,S		; C3 BF
	lda $9F.b,S		; A3 9F
	lda $9F.b,S		; A3 9F
	lda $9F.b,S		; A3 9F
	ora $3F3F0F.l		; 0F 0F 3F 3F
	adc $FFE77F.l,X		; 7F 7F E7 FF
	cmp $FF.b,S		; C3 FF
	lda $BF.b,S		; A3 BF
	lda $BF.b,S		; A3 BF
	lda $BF.b,S		; A3 BF
	beq  -1.b		; F0 FF
	cpy #$FF.b		; C0 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	cpy #$FF.b		; C0 FF
	cpx #$FF.b		; E0 FF
	beq  -1.b		; F0 FF
	cpy #$FF.b		; C0 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	cpy #$FF.b		; C0 FF
	cpx #$FF.b		; E0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ora $FF.b,S		; 03 FF
	ror $7FFE.w,X		; 7E FE 7F
	sbc $F0FF7F.l,X		; FF 7F FF F0
	sbc $E0FFF0.l,X		; FF F0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $7FFE7E.l,X		; FF 7E FE 7F
	sbc $F0FF7F.l,X		; FF 7F FF F0
	sbc $E0FFF0.l,X		; FF F0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $C00000.l,X		; FF 00 00 C0
	cpy #$E0.b		; C0 E0
	cpx #$70.b		; E0 70
	beq 120.b		; F0 78
	sed		; F8
	tsb $06FC.w		; 0C FC 06
	inc $FE06.w,X		; FE 06 FE
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	cpx #$E0.b		; E0 E0
	bvs -16.b		; 70 F0
	sei		; 78
	sed		; F8
	tsb $06FC.w		; 0C FC 06
	inc $FE06.w,X		; FE 06 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sta [$D8.b]		; 87 D8
	cmp [$D9.b]		; C7 D9
	cmp [$5F.b]		; C7 5F
	eor [$5F.b]		; 47 5F
	eor [$7E.b]		; 47 7E
	adc $1E2F3E.l		; 6F 3E 2F 1E
	ora $D89F98.l		; 0F 98 9F D8
	cmp $5FDFD9.l,X		; DF D9 DF 5F
	eor $7E5F5F.l,X		; 5F 5F 5F 7E
	adc $1E3F3E.l,X		; 7F 3E 3F 1E
	ora $7FFF7F.l,X		; 1F 7F FF 7F
	sbc $80FF83.l,X		; FF 83 FF 80
	sbc $3FC03F.l,X		; FF 3F C0 3F
	dec $BE7F.w,X		; DE 7F BE
	sbc $FF7F1C.l,X		; FF 1C 7F FF
	adc $FF83FF.l,X		; 7F FF 83 FF
	bra  -1.b		; 80 FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	jsr ($FFFF.w,X)		; FC FF FF
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $008080.l,X		; FF 80 80 00
	brk $00.b		; 00 00
	brk $27.b		; 00 27
	cmp $13CF33.l,X		; DF 33 CF 13
	sbc $868F62.l		; EF 62 8F 86
	ora $1E0F1E.l		; 0F 1E 0F 1E
	ora $270F1E.l		; 0F 1E 0F 27
	sbc $13FF33.l,X		; FF 33 FF 13
	sbc $86EF62.l,X		; FF 62 EF 86
	sta $1E1F1E.l		; 8F 1E 1F 1E
	ora $FF1F1E.l,X		; 1F 1E 1F FF
	lda $FF3BFF.l,X		; BF FF 3B FF
	ora #$1F.b		; 09 1F
	sbc ($03.b,X)		; E1 03
	cmp ($01.b,X)		; C1 01
	sta ($01.b,X)		; 81 01
	bra   0.b		; 80 00
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FF1F.l,X		; FF 1F FF 03
	cmp $01.b,S		; C3 01
	sta ($01.b,X)		; 81 01
	sta ($00.b,X)		; 81 00
	bra  61.b		; 80 3D
	sbc $FFFF.w,X		; FD FF FF
	cpx $E0F9.w		; EC F9 E0
	sbc ($C8.b)		; F2 C8
	inc $FEC0.w,X		; FE C0 FE
	inc $FF.b		; E6 FF
	adc $FD3D7E.l,X		; 7F 7E 3D FD
	sbc $FFEFFF.l,X		; FF FF EF FF
	cpx $C8FE.w		; EC FE C8
	inc $FEC0.w,X		; FE C0 FE
	sbc [$FF.b]		; E7 FF
	sbc $8080FF.l,X		; FF FF 80 80
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0E04.w		; 0E 04 0E
	tsb $8E.b		; 04 8E
	brk $37.b		; 00 37
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	asl $0E0E.w		; 0E 0E 0E
	asl $060E.w		; 0E 0E 06
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $FD.b		; 00 FD
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0.b		; C0 C0
	cpy #$60.b		; C0 60
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda ($9F.b,X)		; A1 9F
	lda ($9F.b,X)		; A1 9F
	ldy #$9F.b		; A0 9F
	ldy #$9F.b		; A0 9F
	bcs -113.b		; B0 8F
	bcc -113.b		; 90 8F
	bcc -113.b		; 90 8F
	bcc -113.b		; 90 8F
	lda ($BF.b,X)		; A1 BF
	lda ($BF.b,X)		; A1 BF
	ldy #$BF.b		; A0 BF
	ldy #$BF.b		; A0 BF
	bcs -65.b		; B0 BF
	bcc -97.b		; 90 9F
	bcc -97.b		; 90 9F
	bcc -97.b		; 90 9F
	cpx #$FF.b		; E0 FF
	beq  -1.b		; F0 FF
	sed		; F8
	sbc $7FFF7C.l,X		; FF 7C FF 7F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $E0FF3F.l,X		; FF 3F FF E0
	sbc $F8FFF0.l,X		; FF F0 FF F8
	sbc $7FFF7C.l,X		; FF 7C FF 7F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $03FF3F.l,X		; FF 3F FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $FEFF1F.l,X		; FF 1F FF FE
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $03FFF8.l,X		; FF F8 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $FEFF1F.l,X		; FF 1F FF FE
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $E0FFF8.l,X		; FF F8 FF E0
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $47FF07.l,X		; FF 07 FF 47
	lda $E0BF47.l,X		; BF 47 BF E0
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $47FF07.l,X		; FF 07 FF 47
	sbc $07FF47.l,X		; FF 47 FF 07
	sbc $1FFF07.l,X		; FF 07 FF 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $07BFFC.l,X		; FF FC BF 07
	sbc $1FFF07.l,X		; FF 07 FF 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $00FFFC.l,X		; FF FC FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpx #$08.b		; E0 08
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	php		; 08
	sed		; F8
	asl $1E0F.w,X		; 1E 0F 1E
	ora $1F061F.l		; 0F 1F 06 1F
	asl $1F.b		; 06 1F
	tsb $0F.b		; 04 0F
	tsb $0F.b		; 04 0F
	tsb $0F.b		; 04 0F
	tsb $1E.b		; 04 1E
	ora $1F1F1E.l,X		; 1F 1E 1F 1F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $0F0F0F.l,X		; 1F 0F 0F 0F
	ora $BE0F0F.l		; 0F 0F 0F BE
	jsl $000080.l		; 22 80 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $C0C0.w,X		; FE C0 C0
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
	asl $1E07.w,X		; 1E 07 1E
	ora [$1C.b]		; 07 1C
	ora [$0C.b]		; 07 0C
	ora [$0C.b]		; 07 0C
	ora $0C.b,S		; 03 0C
	ora $0C.b,S		; 03 0C
	ora $0C.b,S		; 03 0C
	ora $1E.b,S		; 03 1E
	ora $1C1F1E.l,X		; 1F 1E 1F 1C
	ora $0C0F0C.l,X		; 1F 0C 0F 0C
	ora $0C0F0C.l		; 0F 0C 0F 0C
	ora $000F0C.l		; 0F 0C 0F 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $1E0F1D.l,X		; 3F 1D 0F 1E
	trb $1414.w		; 1C 14 14
	bit $34.b,X		; 34 34
	bit $34.b,X		; 34 34
	bit $34.b,X		; 34 34
	mvn $3F,$54		; 54 54 3F
	and $0E1F1D.l,X		; 3F 1D 1F 0E
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $FF00.w		; 20 00 FF
	brk $A9.b		; 00 A9
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
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	ora $06.b,S		; 03 06
	ora $F7.b,S		; 03 F7
	ora ($EE.b,X)		; 01 EE
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	ora $010302.l		; 0F 02 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -82.b		; 80 AE
	bra  -9.b		; 80 F7
	brk $EB.b		; 00 EB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	bvc  16.b		; 50 10
	bpl   8.b		; 10 08
	brk $E4.b		; 00 E4
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F0.b		; 00 F0
	asl $E8.b,X		; 16 E8
	tsb $F0.b		; 04 F0
	sbc $00FFE8.l,X		; FF E8 FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	inx		; E8
	sbc $000C02.l,X		; FF 02 0C 00
	brk $10.b		; 00 10
	brk $E8.b		; 00 E8
	sbc $000C04.l,X		; FF 04 0C 00
	brk $F0.b		; 00 F0
	sbc $06FFF8.l,X		; FF F8 FF 06
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	sed		; F8
	sbc $000C08.l,X		; FF 08 0C 00
	brk $10.b		; 00 10
	brk $F8.b		; 00 F8
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $3F.b		; 00 3F
	and $EE7F7E.l,X		; 3F 7E 7F EE
	sbc $A79FA6.l,X		; FF A6 9F A7
	sta $A39FA7.l,X		; 9F A7 9F A3
	sta $3F9FA1.l,X		; 9F A1 9F 3F
	and $EE7F7E.l,X		; 3F 7E 7F EE
	sbc $A7BFA6.l,X		; FF A6 BF A7
	lda $A3BFA7.l,X		; BF A7 BF A3
	lda $00BFA1.l,X		; BF A1 BF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $0FFFE0.l,X		; FF E0 FF 0F
	sbc $1CFF0F.l,X		; FF 0F FF 1C
	sbc $3CFF3C.l,X		; FF 3C FF 3C
	sbc $3CFF3C.l,X		; FF 3C FF 3C
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $1CFF0F.l,X		; FF 0F FF 1C
	sbc $3CFF3C.l,X		; FF 3C FF 3C
	sbc $3CFF3C.l,X		; FF 3C FF 3C
	sbc $E0FFFF.l,X		; FF FF FF E0
	cpx #$F0.b		; E0 F0
	beq  56.b		; F0 38
	sed		; F8
	tsb $FC.b		; 04 FC
	asl $FE.b		; 06 FE
	asl $FE.b		; 06 FE
	ora [$FF.b]		; 07 FF
	sta $E0E0FF.l		; 8F FF E0 E0
	beq -16.b		; F0 F0
	sec		; 38
	sed		; F8
	tsb $FC.b		; 04 FC
	asl $FE.b		; 06 FE
	asl $FE.b		; 06 FE
	ora [$FF.b]		; 07 FF
	sta $0000FF.l		; 8F FF 00 00
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
	jmp ($3D7F.w,X)		; 7C 7F 3D
	rol $1E1C.w,X		; 3E 1C 1E
	trb $1E1E.w		; 1C 1E 1E
	tsb $081E.w		; 0C 1E 08
	asl $1E08.w,X		; 1E 08 1E
	php		; 08
	jmp ($3D7F.w,X)		; 7C 7F 3D
	and $1D1F1D.l,X		; 3F 1D 1F 1D
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $1F1F1F.l,X		; 1F 1F 1F 1F
	ora $F870FC.l,X		; 1F FC 70 F8
	beq -16.b		; F0 F0
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	jsr ($F8F8.w,X)		; FC F8 F8
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $01.b,S		; 03 01
	ora $01.b,S		; 03 01
	ora $01.b,S		; 03 01
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	sta ($C1.b,X)		; 81 C1
	sta ($C0.b,X)		; 81 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	sta ($C1.b,X)		; 81 C1
	sta ($C1.b,X)		; 81 C1
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra  -8.b		; 80 F8
	iny		; C8
	jsr ($7C7C.w,X)		; FC 7C 7C
	bit $1C.b,X		; 34 1C
	sec		; 38
	bmi  96.b		; 30 60
	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	rts		; 60

	bra  -8.b		; 80 F8
	cpy $7CFC.w		; CC FC 7C
	jmp ($3C34.w,X)		; 7C 34 3C
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda ($9F.b,X)		; A1 9F
	lda ($9F.b,X)		; A1 9F
	bra -97.b		; 80 9F
	bra -97.b		; 80 9F
	sta ($8F.b),Y		; 91 8F
	cmp ($CF.b),Y		; D1 CF
	lsr $5E4F.w,X		; 5E 4F 5E
	eor $A1BFA1.l		; 4F A1 BF A1
	lda $809F80.l,X		; BF 80 9F 80
	sta $D19F91.l,X		; 9F 91 9F D1
	cmp $5E5F5E.l,X		; DF 5E 5F 5E
	eor $FFFFE1.l,X		; 5F E1 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FFFF07.l,X		; FF 07 FF FF
	brk $E1.b		; 00 E1
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $07FFFE.l,X		; FF FE FF 07
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C9FFC3.l,X		; FF C3 FF C9
	sbc [$89.b],Y		; F7 89
	sbc [$05.b],Y		; F7 05
	xce		; FB
	tsb $FB.b		; 04 FB
	cpy $F1F3.w		; CC F3 F1
	ora $FF.b,S		; 03 FF
	sbc $C9FFC3.l,X		; FF C3 FF C9
	sbc $05FF89.l,X		; FF 89 FF 05
	sbc $CCFF04.l,X		; FF 04 FF CC
	sbc $FFF3F1.l,X		; FF F1 F3 FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	sbc $FFDFFC.l,X		; FF FC DF FF
	cmp $8F9BFF.l,X		; DF FF 9B 8F
	sbc ($83.b),Y		; F1 83
	sbc ($FF.b,X)		; E1 FF
	sbc $FCFFFF.l,X		; FF FF FF FC
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $8FFFFF.l,X		; FF FF FF 8F
	sbc $00E383.l,X		; FF 83 E3 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$10.b		; C0 10
	beq 118.b		; F0 76
	inc $FC.b,X		; F6 FC
	jsr ($E8C0.w,X)		; FC C0 E8
	bcc  -8.b		; 90 F8
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	bpl -16.b		; 10 F0
	ror $F6.b,X		; 76 F6
	inc $D0FE.w,X		; FE FE D0
	sed		; F8
	bcc  -8.b		; 90 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $1C08.w,X		; 1E 08 1C
	php		; 08
	stz $2F00.w		; 9C 00 2F
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $1D1D1D.l,X		; 1F 1D 1D 1D
	ora $0C0C.w,X		; 1D 0C 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	adc $00EE00.l,X		; 7F 00 EE 00
	ora $00.b,S		; 03 00
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
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	sbc $BF00.w,X		; FD 00 BF
	brk $C8.b		; 00 C8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	cpy #$D6.b		; C0 D6
	rti		; 40

	sbc $007300.l,X		; FF 00 73 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2020.w		; 20 20 20
	jsr $0010.w		; 20 10 00
	cpy #$00.b		; C0 00
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
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F4.b		; 00 F4
	bpl -18.b		; 10 EE
	ora $F4.b,S		; 03 F4
	sbc $00FFEE.l,X		; FF EE FF 00
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	inc $02FF.w		; EE FF 02
	tsb $0000.w		; 0C 00 00
	sbc $FF.b,X		; F5 FF
	inc $04FF.w,X		; FE FF 04
	tsb $0000.w		; 0C 00 00
	ora $00.b		; 05 00
	inc $06FF.w,X		; FE FF 06
	tsb $0000.w		; 0C 00 00
	jmp ($D87F.w,X)		; 7C 7F D8
	sbc $CCBFC8.l,X		; FF C8 BF CC
	lda $C7BFCE.l,X		; BF CE BF C7
	lda $83BFC7.l,X		; BF C7 BF 83
	lda $D87F7C.l,X		; BF 7C 7F D8
	sbc $CCFFC8.l,X		; FF C8 FF CC
	sbc $C7FFCE.l,X		; FF CE FF C7
	sbc $83FFC7.l,X		; FF C7 FF 83
	lda $03FF01.l,X		; BF 01 FF 03
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $F8FF1F.l,X		; FF 1F FF F8
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $F8FF1F.l,X		; FF 1F FF F8
	sbc $88F0F0.l,X		; FF F0 F0 88
	sed		; F8
	tsb $FC.b		; 04 FC
	cop $FE.b		; 02 FE
	ora $FF.b,S		; 03 FF
	sbc [$FF.b]		; E7 FF
	sbc $FF7EFF.l,X		; FF FF 7E FF
	beq -16.b		; F0 F0
	dey		; 88
	sed		; F8
	tsb $FC.b		; 04 FC
	cop $FE.b		; 02 FE
	ora $FF.b,S		; 03 FF
	sbc [$FF.b]		; E7 FF
	sbc $FF7EFF.l,X		; FF FF 7E FF
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
	bvs  32.b		; 70 20
	bvs  32.b		; 70 20
	bvs  32.b		; 70 20
	rts		; 60

	jsr $00BE.w		; 20 BE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	pla		; 68
	pla		; 68
	jsr $0020.w		; 20 20 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $86.b		; 00 86
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
	brk $80.b		; 00 80
	rti		; 40

	bra  64.b		; 80 40
	sta ($41.b,X)		; 81 41
	bra  96.b		; 80 60
	lda [$00.b],Y		; B7 00
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	bra -64.b		; 80 C0
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $BF.b,S		; 83 BF
	lda [$9F.b]		; A7 9F
	tay		; A8
	sta $731C3B.l,X		; 9F 3B 1C 73
	adc $3937.w,X		; 7D 37 39
	bmi  56.b		; 30 38
	sec		; 38
	bpl -125.b		; 10 83
	lda $A8BFA7.l,X		; BF A7 BF A8
	lda $733F3B.l,X		; BF 3B 3F 73
	adc $343F37.l,X		; 7F 37 3F 34
	bit $3C3C.w,X		; 3C 3C 3C
	beq  -1.b		; F0 FF
	sbc ($FE.b,X)		; E1 FE
	cpx #$FF.b		; E0 FF
	inc $C000.w,X		; FE 00 C0
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $E0FFE1.l,X		; FF E1 FF E0
	sbc $C0FEFE.l,X		; FF FE FE C0
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	sbc $BFFF7F.l,X		; FF 7F FF BF
	adc $43.b		; 65 43
	adc ($C1.b),Y		; 71 C1
	adc ($C0.b),Y		; 71 C0
	bvs -64.b		; 70 C0
	bvs -64.b		; 70 C0
	rts		; 60

	jmp ($7FFF.w,X)		; 7C FF 7F
	sbc $43FFBF.l,X		; FF BF FF 43
	adc ($C1.b,S),Y		; 73 C1
	sbc ($C0.b),Y		; F1 C0
	beq -64.b		; F0 C0
	beq -64.b		; F0 C0
	cpx #$20.b		; E0 20
	cpx #$68.b		; E0 68
	inx		; E8
	ldy #$E0.b		; A0 E0
	ldy #$F0.b		; A0 F0
	bra -16.b		; 80 F0
	beq -16.b		; F0 F0
	rts		; 60

	bmi 112.b		; 30 70
	rts		; 60

	jsr $68E0.w		; 20 E0 68
	inx		; E8
	bcs -16.b		; B0 F0
	ldy #$F0.b		; A0 F0
	bra -16.b		; 80 F0
	beq -16.b		; F0 F0
	rts		; 60

	bvs  48.b		; 70 30
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F8.b		; 00 F8
	asl A		; 0A
	pea $F801.w		; F4 01 F8
	sbc $00FFF4.l,X		; FF F4 FF 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	pea $01FF.w		; F4 FF 01
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $F4.b		; 00 F4
	sbc $000C02.l,X		; FF 02 0C 00
	brk $F9.b		; 00 F9
	sbc $03FFFC.l,X		; FF FC FF 03
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	jsr ($04FF.w,X)		; FC FF 04
	tsb $0000.w		; 0C 00 00
	ora #$00.b		; 09 00
	jsr ($05FF.w,X)		; FC FF 05
	tsb $0000.w		; 0C 00 00
	cpx #$FF.b		; E0 FF
	jsr $307F.w		; 20 7F 30
	adc $0F7F18.l,X		; 7F 18 7F 0F
	adc $C67F0F.l,X		; 7F 0F 7F C6
	lda $E0FCEE.l,X		; BF EE FC E0
	sbc $307F20.l,X		; FF 20 7F 30
	adc $0F7F18.l,X		; 7F 18 7F 0F
	adc $C67F0F.l,X		; 7F 0F 7F C6
	sbc $3CFEEE.l,X		; FF EE FE 3C
	jsr ($FE62.w,X)		; FC 62 FE
	.db $62, $FE, $F3		; 62 FE F3
	sbc $1EFF9E.l,X		; FF 9E FF 1E
	sbc $11F10F.l,X		; FF 0F F1 11
	ora $FC3C.w,Y		; 19 3C FC
	.db $62, $FE, $62		; 62 FE 62
	inc $FFF3.w,X		; FE F3 FF
	stz $1EFF.w,X		; 9E FF 1E
	sbc $11FF0F.l,X		; FF 0F FF 11
	ora $0000.w,Y		; 19 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	cpy #$C0.b		; C0 C0
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	cpy #$E0.b		; C0 E0
	cpx #$00.b		; E0 00
	cpy #$F8.b		; C0 F8
	bne -64.b		; D0 C0
	rti		; 40

	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cmp $004300.l,X		; DF 00 43 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($31.b,X)		; 21 31
	jsr $2120.w		; 20 20 21
	ora ($20.b,X)		; 01 20
	brk $FC.b		; 00 FC
	bpl  27.b		; 10 1B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $21.b		; 00 21
	and ($20.b),Y		; 31 20
	jsr $2020.w		; 20 20 20
	jsr $1020.w		; 20 20 10
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	tsb $FA.b		; 04 FA
	brk $FC.b		; 00 FC
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	plx		; FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $08.b		; 00 08
	inc $FF4D.w,X		; FE 4D FF
	rol $FF.b,X		; 36 FF
	lda $E5.b		; A5 E5
	sty $04.b		; 84 04
	sty $00.b		; 84 00
	ora ($00.b,S),Y		; 13 00
	brk $00.b		; 00 00
	php		; 08
	inc $FF4D.w,X		; FE 4D FF
	rol $FF.b,X		; 36 FF
	lda $E5.b		; A5 E5
	cpy $C4.b		; C4 C4
	cpy $C4.b		; C4 C4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $80.b		; 04 80
	bpl   0.b		; 10 00
	sbc ($0E.b)		; F2 0E
	sbc $02.b,S		; E3 02
	sbc ($FF.b)		; F2 FF
	sbc $FF.b,S		; E3 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc $FF.b,S		; E3 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc ($FF.b)		; F2 FF
	sbc ($FF.b,S),Y		; F3 FF
	tsb $0E.b		; 04 0E
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	sbc ($FF.b,S),Y		; F3 FF
	asl $0E.b		; 06 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	cop $03.b		; 02 03
	tsb $07.b		; 04 07
	asl $06.b		; 06 06
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	asl $3F0E.w		; 0E 0E 3F
	tsa		; 3B
	cpx $E952.w		; EC 52 E9
	sta $D4.b		; 85 D4
	brk $1B.b		; 00 1B
	cpy #$C2.b		; C0 C2
	eor $DE.b,S		; 43 DE
	jmp.w [$1100]		; DC 00 11
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $2B.b		; 00 2B
	brk $24.b		; 00 24
	brk $3C.b		; 00 3C
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rts		; 60

	brk $70.b		; 00 70
	brk $30.b		; 00 30
	brk $80.b		; 00 80
	cpy #$78.b		; C0 78
	cpx #$7E.b		; E0 7E
	jmp ($0000.w)		; 6C 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1C2F7D.l,X		; 1F 7D 2F 1C
	tsb $070F.w		; 0C 0F 07
	brk $39.b		; 00 39
	adc $7B43.w,Y		; 79 43 7B
	bvs  99.b		; 70 63
	rol $00D7.w,X		; 3E D7 00
	brk $00.b		; 00 00
	rti		; 40

	brk $70.b		; 00 70
	brk $18.b		; 00 18
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	xce		; FB
	sta $0FF0.w,X		; 9D F0 0F
	stz $38E7.w		; 9C E7 38
	cpy #$E6.b		; C0 E6
	sta ($F7.b,X)		; 81 F7
	sbc [$FC.b]		; E7 FC
	sbc $00F828.l,X		; FF 28 F8 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	clc		; 18
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	dec $7EF0.w		; CE F0 7E
	dec $4DEE.w,X		; DE EE 4D
	inc $69E0.w		; EE E0 69
	ldx $1F.b,Y		; B6 1F
	stx $1C.b		; 86 1C
	ora $1E20.w		; 0D 20 1E
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $E2.b		; 00 E2
	brk $C0.b		; 00 C0
	bvs   0.b		; 70 00
	bvs  64.b		; 70 40
	rti		; 40

	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	brk $70.b		; 00 70
	bra -32.b		; 80 E0
	cpx #$18.b		; E0 18
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	rts		; 60

	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	asl $7731.w		; 0E 31 77
	tda		; 7B
	adc $000662.l,X		; 7F 62 06 00
	ora ($7E.b,S),Y		; 13 7E
	adc $031F74.l		; 6F 74 1F 03
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $60.b		; 00 60
	sbc $0771CF.l		; EF CF 71 07
	jmp $4F4FF1.l		; 5C F1 4F 4F
	and ($33.b,S),Y		; 33 33
	and ($33.b,S),Y		; 33 33
	jmp ($9FF4.w,X)		; 7C F4 9F
	stz $00.b		; 64 00
	bpl   0.b		; 10 00
	dey		; 88
	brk $02.b		; 00 02
	brk $B0.b		; 00 B0
	brk $C0.b		; 00 C0
	brk $C8.b		; 00 C8
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	jmp.w [$10CC]		; DC CC 10
	cpy #$07.b		; C0 07
	brk $26.b		; 00 26
	jsr $74FE.w		; 20 FE 74
	dec A		; 3A
	dec A		; 3A
	ora $9C04.w,X		; 1D 04 9C
	adc $00.b		; 65 00
	jsr $2000.w		; 20 00 20
	brk $E8.b		; 00 E8
	brk $C9.b		; 00 C9
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	rti		; 40

	jsr $C030.w		; 20 30 C0
	beq -64.b		; F0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $2F6B2D.l,X		; 1F 2D 6B 2F
	phd		; 0B
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bpl   0.b		; 10 00
	bmi   0.b		; 30 00
	asl $0102.w,X		; 1E 02 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $DB86.w,X		; FE 86 DB
	and $01CF0C.l		; 2F 0C CF 01
	bpl   1.b		; 10 01
	php		; 08
	ora #$C4.b		; 09 C4
	ora ($44.b,X)		; 01 44
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	bpl -52.b		; 10 CC
	php		; 08
	ror $C4.b		; 66 C4
	and ($44.b)		; 32 44
	dec A		; 3A
	brk $00.b		; 00 00
	sbc $8FCC.w,X		; FD CC 8F
	cmp [$63.b]		; C7 63
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	sec		; 38
	bra  96.b		; 80 60
	ora $00FF00.l,X		; 1F 00 FF 00
	brk $02.b		; 00 02
	brk $10.b		; 00 10
	brk $14.b		; 00 14
	brk $16.b		; 00 16
	sec		; 38
	tsb $60.b		; 04 60
	clc		; 18
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	sed		; F8
	brk $E0.b		; 00 E0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F5.b		; 00 F5
	asl A		; 0A
	sbc #$01.b		; E9 01
	sbc $FF.b,X		; F5 FF
	sbc #$FF.b		; E9 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc #$FF.b		; E9 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	sbc $FF.b,X		; F5 FF
	sbc $04FF.w,Y		; F9 FF 04
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	sbc $06FF.w,Y		; F9 FF 06
	asl $0000.w		; 0E 00 00
	ora ($01.b,X)		; 01 01
	ora [$04.b]		; 07 04
	ora [$06.b]		; 07 06
	bpl  30.b		; 10 1E
	inc A		; 1A
	clc		; 18
	asl $02.b		; 06 02
	ora [$02.b],Y		; 17 02
	jsr ($00EF.w,X)		; FC EF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	ora $0800.w,Y		; 19 00 08
	brk $00.b		; 00 00
	sed		; F8
	beq  68.b		; F0 44
	ldy #$56.b		; A0 56
	bpl  -8.b		; 10 F8
	tsb $3C27.w		; 0C 27 3C
	sbc [$C5.b]		; E7 C5
	adc $90C07D.l,X		; 7F 7D C0 90
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $28.b		; 00 28
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $2D.b		; 00 2D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$00.b		; C0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $BF79EF.l		; 8F EF 79 BF
	and $5DCE56.l,X		; 3F 56 CE 5D
	tsb $0012.w		; 0C 12 00
	php		; 08
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	brk $61.b		; 00 61
	php		; 08
	ora $06.b		; 05 06
	ora ($00.b,X)		; 01 00
	ora ($B3.b,X)		; 01 B3
	sec		; 38
	rti		; 40

	cmp $EF.b,S		; C3 EF
	and $7CF9.w		; 2D F9 7C
	mvp $10,$78		; 44 78 10
	eor $58.b,S		; 43 58
	tsb $13.b		; 04 13
	brk $00.b		; 00 00
	mvp $1C,$00		; 44 00 1C
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $82.b		; 00 82
	eor $20.b,S		; 43 20
	tsb $A3.b		; 04 A3
	brk $EC.b		; 00 EC
	cld		; D8
	ldy #$04.b		; A0 04
	bra  -4.b		; 80 FC
	bra  -8.b		; 80 F8
	beq  64.b		; F0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcs   0.b		; B0 00
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
	brk $FC.b		; 00 FC
	iny		; C8
	ora $DD01.w,Y		; 19 01 DD
	sbc ($3E.b,S),Y		; F3 3E
	ora $F63F.w		; 0D 3F F6
	eor $021D30.l,X		; 5F 30 1D 02
	adc [$E6.b]		; 67 E6
	brk $03.b		; 00 03
	brk $26.b		; 00 26
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	brk $18.b		; 00 18
	bvs 112.b		; 70 70
	lda $80C3B6.l,X		; BF B6 C3 80
	xce		; FB
	tsb $FD.b		; 04 FD
	dec $7F87.w,X		; DE 87 7F
	cmp $250C.w		; CD 0C 25
	inc A		; 1A
	brk $8D.b		; 00 8D
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	brk $C0.b		; 00 C0
	ldy #$00.b		; A0 00
	bra -128.b		; 80 80
	iny		; C8
	bcs -72.b		; B0 B8
	beq -104.b		; F0 98
	brk $98.b		; 00 98
	bcc -128.b		; 90 80
	brk $68.b		; 00 68
	bra   0.b		; 80 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $18.b		; 00 18
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
	ora $80.b,S		; 03 80
	tsb $F800.w		; 0C 00 F8
	php		; 08
	sbc $FFF801.l		; EF 01 F8 FF
	sbc $0E00FF.l		; EF FF 00 0E
	brk $00.b		; 00 00
	php		; 08
	brk $EF.b		; 00 EF
	sbc $000E02.l,X		; FF 02 0E 00
	brk $FB.b		; 00 FB
	sbc $04FFFF.l,X		; FF FF FF 04
	asl $0000.w		; 0E 00 00
	ora [$06.b]		; 07 06
	tsb $2209.w		; 0C 09 22
	sec		; 38
	sec		; 38
	bmi  45.b		; 30 2D
	ora #$F3.b		; 09 F3
	dec $91F1.w,X		; DE F1 91
	lsr $F6.b,X		; 56 F6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $07.b		; 00 07
	brk $12.b		; 00 12
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $08.b		; 00 08
	cpy #$80.b		; C0 80
	ldy #$80.b		; A0 80
	cpy #$40.b		; C0 40
	bmi -32.b		; 30 E0
	cld		; D8
	cld		; D8
	tsb $A880.w		; 0C 80 A8
	ldy #$B2.b		; A0 B2
	lda ($00.b),Y		; B1 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $72.b		; 00 72
	brk $54.b		; 00 54
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $81.b		; 04 81
	tsb $08.b		; 04 08
	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta ($28.b,X)		; 81 28
	php		; 08
	and ($00.b,S),Y		; 33 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  -8.b		; 80 F8
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	ora $7E.b,X		; 15 7E
	xba		; EB
	pld		; 2B
	and $C84D.w,X		; 3D 4D C8
	sta $FE74DD.l,X		; 9F DD 74 FE
	txs		; 9A
	and $11.b,X		; 35 11
	and #$00.b		; 29 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	and ($00.b)		; 32 00
	jsr $0100.w		; 20 00 01
	brk $40.b		; 00 40
	brk $46.b		; 00 46
	stp		; DB
	rol $E0DB.w		; 2E DB E0
	ply		; 7A
	stz $E835.w		; 9C 35 E8
	sta $1820C8.l,X		; 9F C8 20 18
	cmp $C024CE.l,X		; DF CE 24 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $20.b		; 00 20
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	xce		; FB
	tsb $F5.b		; 04 F5
	brk $FB.b		; 00 FB
	sbc $00FFF5.l,X		; FF F5 FF 00
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b,X		; F5 FF
	ora ($0E.b,X)		; 01 0E
	brk $00.b		; 00 00
	xce		; FB
	sbc $02FFFD.l,X		; FF FD FF 02
	asl $0000.w		; 0E 00 00
	ora $00.b,S		; 03 00
	sbc $03FF.w,X		; FD FF 03
	asl $0000.w		; 0E 00 00
	dec A		; 3A
	jsr $6044.w		; 20 44 60
	pld		; 2B
	phd		; 0B
	sbc #$B4.b		; E9 B4
	rol $D6.b,X		; 36 D6
	adc $4B3B.w		; 6D 3B 4B
	adc $BD3D.w,X		; 7D 3D BD
	brk $04.b		; 00 04
	brk $18.b		; 00 18
	brk $50.b		; 00 50
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $42.b		; 00 42
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $40.b		; 00 40
	rti		; 40

	bra   0.b		; 80 00
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D2.b		; 00 D2
	adc ($2A.b),Y		; 71 2A
	jmp $2A04.w		; 4C 04 2A
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $91.b		; 00 91
	rol A		; 2A
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $FB.b		; 02 FB
	brk $FE.b		; 00 FE
	sbc $00FFFB.l,X		; FF FB FF 00
	asl $0000.w		; 0E 00 00
	ldy #$80.b		; A0 80
	bcc  96.b		; 90 60
	clv		; B8
	bvc 120.b		; 50 78
	bvs   0.b		; 70 00
	ldy #$70.b		; A0 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $3080.w		; 0C 80 30
	brk $E9.b		; 00 E9
	ora ($B6.b,S),Y		; 13 B6
	tsb $F1.b		; 04 F1
	sbc $00FFF5.l,X		; FF F5 FF 00
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	sbc $FF.b,X		; F5 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	nop		; EA
	sbc $04FFE5.l,X		; FF E5 FF 04
	tsb $0000.w		; 0C 00 00
	plx		; FA
	sbc $06FFE5.l,X		; FF E5 FF 06
	tsb $0000.w		; 0C 00 00
	asl A		; 0A
	brk $E5.b		; 00 E5
	sbc $000C08.l,X		; FF 08 0C 00
	brk $E9.b		; 00 E9
	sbc $0AFFD5.l,X		; FF D5 FF 0A
	tsb $0000.w		; 0C 00 00
	sbc $D5FF.w,Y		; F9 FF D5
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $09.b		; 00 09
	brk $D5.b		; 00 D5
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $F0.b		; 00 F0
	sbc $20FFC5.l,X		; FF C5 FF 20
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	cmp $FF.b		; C5 FF
	jsl $00000C.l		; 22 0C 00 00
	pea $B5FF.w		; F4 FF B5
	sbc $000C24.l,X		; FF 24 0C 00
	brk $04.b		; 00 04
	brk $B5.b		; 00 B5
	sbc $000C26.l,X		; FF 26 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $001F00.l,X		; 1F 00 1F 00
	ora $1F1F00.l,X		; 1F 00 1F 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $E0.b		; 00 E0
	tsb $00E0.w		; 0C E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
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
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($0E.b,X)		; 01 0E
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	rol $7B00.w,X		; 3E 00 7B
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $63.b		; 00 63
	brk $87.b		; 00 87
	sei		; 78
	brk $FF.b		; 00 FF
	brk $34.b		; 00 34
	brk $7F.b		; 00 7F
	.db $42, $BD		; 42 BD
	bra  28.b		; 80 1C
	ora ($C0.b,X)		; 01 C0
	ora ($01.b)		; 12 01
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	wai		; CB
	brk $42.b		; 00 42
	brk $C2.b		; 00 C2
	brk $83.b		; 00 83
	brk $3E.b		; 00 3E
	brk $ED.b		; 00 ED
	brk $91.b		; 00 91
	ror $2401.w		; 6E 01 24
	ora ($02.b,X)		; 01 02
	eor $3802.w		; 4D 02 38
	cmp ($23.b,X)		; C1 23
	jmp $113CC3.l		; 5C C3 3C 11
	inc $009F.w		; EE 9F 00
	eor $00FF00.l,X		; 5F 00 FF 00
	sbc $003F00.l,X		; FF 00 3F 00
	sta $003F00.l,X		; 9F 00 3F 00
	sbc $00C000.l,X		; FF 00 C0 00
	sta ($78.b,X)		; 81 78
	sta [$78.b]		; 87 78
	sed		; F8
	ora [$41.b]		; 07 41
	sta ($87.b)		; 92 87
	brk $0F.b		; 00 0F
	brk $EF.b		; 00 EF
	bpl -34.b		; 10 DE
	brk $81.b		; 00 81
	brk $87.b		; 00 87
	brk $F8.b		; 00 F8
	brk $CC.b		; 00 CC
	brk $F8.b		; 00 F8
	brk $FB.b		; 00 FB
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cmp $001F00.l,X		; DF 00 1F 00
	sbc ($1C.b,S),Y		; F3 1C
	rts		; 60

	beq   8.b		; F0 08
	beq   8.b		; F0 08
	cmp ($00.b,X)		; C1 00
	rol $0000.w,X		; 3E 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C1.b		; 00 C1
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ror $0003.w,X		; 7E 03 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $0100.w,X		; 7E 00 01
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and ($00.b,S),Y		; 33 00
	sbc $40030C.l,X		; FF 0C 03 40
	ora $0C3601.l,X		; 1F 01 36 0C
	sbc ($00.b,S),Y		; F3 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $FC.b		; 00 FC
	brk $E0.b		; 00 E0
	brk $C8.b		; 00 C8
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	sbc [$00.b],Y		; F7 00
	sbc $C8E31C.l,X		; FF 1C E3 C8
	and ($78.b,S),Y		; 33 78
	bra  72.b		; 80 48
	bcs -119.b		; B0 89
	ror $00.b,X		; 76 00
	sbc $0C000C.l,X		; FF 0C 00 0C
	brk $FC.b		; 00 FC
	brk $CC.b		; 00 CC
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	eor $0708C7.l,X		; 5F C7 08 07
	cpx #$00.b		; E0 00
	sbc $38FF00.l,X		; FF 00 FF 38
	ora [$80.b]		; 07 80
	asl $FA.b		; 06 FA
	ora ($80.b,X)		; 01 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	brk $C4.b		; 00 C4
	brk $CC.b		; 00 CC
	and ($00.b,S),Y		; 33 00
	sbc $DB23DC.l,X		; FF DC 23 DB
	jsr $FF00.w		; 20 00 FF
	brk $FF.b		; 00 FF
	ora $E01FE0.l,X		; 1F E0 1F E0
	cpy #$00.b		; C0 00
	tsb $0600.w		; 0C 00 06
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$60.b		; E0 60
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
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2F.b		; 00 2F
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $1E01.w,X		; 1E 01 1E
	ora ($1E.b,X)		; 01 1E
	ora ($7E.b,X)		; 01 7E
	ora ($7E.b,X)		; 01 7E
	sbc $0302.w,X		; FD 02 03
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F6.b		; 00 F6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F8.b		; 00 F8
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	tsb $0300.w		; 0C 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tda		; 7B
	brk $3F.b		; 00 3F
	brk $13.b		; 00 13
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $0F.b		; 00 0F
	beq  48.b		; F0 30
	cmp $01FC03.l		; CF 03 FC 01
	ror $F00A.w,X		; 7E 0A F0
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $1C.b		; 00 1C
	sbc $003000.l,X		; FF 00 30 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	ora $00.b		; 05 00
	asl $7800.w,X		; 1E 00 78
	brk $E0.b		; 00 E0
	brk $F1.b		; 00 F1
	asl $0FF0.w		; 0E F0 0F
	sbc $1C.b,S		; E3 1C
	ora ($6C.b,S),Y		; 13 6C
	ora ($3E.b,X)		; 01 3E
	ora ($BE.b,X)		; 01 BE
	ora ($3E.b,X)		; 01 3E
	ora ($3E.b,X)		; 01 3E
	sbc $002F00.l,X		; FF 00 2F 00
	ora $00AF00.l,X		; 1F 00 AF 00
	lda $003F00.l,X		; BF 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	inc $09.b,X		; F6 09
	sec		; 38
	cmp [$C0.b]		; C7 C0
	and $03FC.w,X		; 3D FC 03
	cmp $26C130.l		; CF 30 C1 26
	cpy #$31.b		; C0 31
	cpy #$38.b		; C0 38
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	jsr ($F10E.w,X)		; FC 0E F1
	inc $F000.w,X		; FE 00 F0
	asl $C038.w		; 0E 38 C0
	jsr $0040.w		; 20 40 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $FC.b		; 00 FC
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
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($00.b),Y		; 31 00
	sbc $B30C00.l,X		; FF 00 0C B3
	brk $1B.b		; 00 1B
	brk $7E.b		; 00 7E
	ora ($F8.b,X)		; 01 F8
	ora $F0.b,S		; 03 F0
	and $007E80.l,X		; 3F 80 7E 00
	rts		; 60

	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	brk $0C.b		; 00 0C
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $87.b		; 00 87
	brk $00.b		; 00 00
	sbc $88F00E.l,X		; FF 0E F0 88
	bpl -64.b		; 10 C0
	brk $84.b		; 00 84
	rtl		; 6B

	brk $43.b		; 00 43
	brk $91.b		; 00 91
	inc A		; 1A
	sbc ($20.b,X)		; E1 20
	brk $49.b		; 00 49
	brk $67.b		; 00 67
	brk $3F.b		; 00 3F
	brk $12.b		; 00 12
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $D2.b		; 00 D2
	ora $142B.w		; 0D 2B 14
	jmp ($4793.w)		; 6C 93 47
	sec		; 38
	ora $BC.b,S		; 03 BC
	cpx #$1F.b		; E0 1F
	bra  15.b		; 80 0F
	cpx #$03.b		; E0 03
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	rts		; 60

	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $01.b		; 00 01
	inc $00FF.w,X		; FE FF 00
	adc $007E80.l,X		; 7F 80 7E 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	brk $F8.b		; 00 F8
	brk $7F.b		; 00 7F
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	ora ($06.b,X)		; 01 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $001C00.l,X		; 1F 00 1C 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $C33C00.l,X		; 1F 00 3C C3
	rts		; 60

	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sed		; F8
	jsl $816EC1.l		; 22 C1 6E 81
	sec		; 38
	cmp [$00.b]		; C7 00
	sbc $9E0003.l,X		; FF 03 00 9E
	brk $FC.b		; 00 FC
	brk $F7.b		; 00 F7
	brk $3E.b		; 00 3E
	brk $11.b		; 00 11
	brk $02.b		; 00 02
	brk $0E.b		; 00 0E
	brk $D8.b		; 00 D8
	jsr $8100.w		; 20 00 81
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	ora [$F8.b]		; 07 F8
	sed		; F8
	ora [$40.b]		; 07 40
	lda $C0BD42.l,X		; BF 42 BD C0
	brk $7E.b		; 00 7E
	brk $E0.b		; 00 E0
	brk $8F.b		; 00 8F
	brk $79.b		; 00 79
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq -64.b		; F0 C0
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
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
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	ora ($00.b,X)		; 01 00
	and $003F00.l,X		; 3F 00 3F 00
	ora $030000.l		; 0F 00 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $71.b		; 00 71
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cmp $0EFC03.l		; CF 03 FC 0E
	bcs  12.b		; B0 0C
	sbc ($00.b,S),Y		; F3 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $3C.b		; 00 3C
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$C0.b		; C0 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sei		; 78
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
	brk $00.b		; 00 00
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
	asl $F9.b		; 06 F9
	sec		; 38
	cmp [$00.b]		; C7 00
	adc $007900.l,X		; 7F 00 79 00
	ora ($00.b,X)		; 01 00
	ora $FE110E.l,X		; 1F 0E 11 FE
	brk $3E.b		; 00 3E
	brk $38.b		; 00 38
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $1E.b		; 00 1E
	brk $1F.b		; 00 1F
	brk $1E.b		; 00 1E
	brk $0F.b		; 00 0F
	beq  76.b		; F0 4C
	lda ($18.b,S),Y		; B3 18
	sbc [$28.b]		; E7 28
	cmp ($60.b,S),Y		; D3 60
	sta [$00.b]		; 87 00
	sbc $04817E.l,X		; FF 7E 81 04
	lda ($4F.b,S),Y		; B3 4F
	brk $43.b		; 00 43
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	cmp ($00.b,X)		; C1 00
	sbc $CFBE41.l,X		; FF 41 BE CF
	bmi  -4.b		; 30 FC
	ora $00.b,S		; 03 00
	sbc $C30FF0.l,X		; FF F0 0F C3
	bit $0000.w,X		; 3C 00 00
	and ($00.b),Y		; 31 00
	cmp ($00.b,X)		; C1 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	jsr ($C300.w,X)		; FC 00 C3
	brk $00.b		; 00 00
	cpx $FC00.w		; EC 00 FC
	brk $F8.b		; 00 F8
	beq   0.b		; F0 00
	bvs -128.b		; 70 80
	brk $FC.b		; 00 FC
	ora $FC.b,S		; 03 FC
	sta [$78.b]		; 87 78
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	tas		; 1B
	bit $01.b		; 24 01
	ror $003F.w,X		; 7E 3F 00
	ora $000000.l,X		; 1F 00 00 00
	bit $0F00.w,X		; 3C 00 0F
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	cmp $130C.w,X		; DD 0C 13
	ora $0092.w		; 0D 92 00
	adc $407F00.l,X		; 7F 00 7F 40
	lda $6E08F7.l,X		; BF F7 08 6E
	sta ($A2.b),Y		; 91 A2
	brk $FC.b		; 00 FC
	brk $70.b		; 00 70
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $A7.b		; 00 A7
	brk $07.b		; 00 07
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	beq -32.b		; F0 E0
	brk $00.b		; 00 00
	clc		; 18
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	rts		; 60

	stz $7E80.w,X		; 9E 80 7E
	jsr $00DC.w		; 20 DC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
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
	brk $0A.b		; 00 0A
	bra  40.b		; 80 28
	brk $EE.b		; 00 EE
	ora $F503C5.l		; 0F C5 03 F5
	sbc $00FFC5.l,X		; FF C5 FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b		; 05 00
	cmp $FF.b		; C5 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	inc $D5FF.w		; EE FF D5
	sbc $000C04.l,X		; FF 04 0C 00
	brk $FE.b		; 00 FE
	sbc $06FFD5.l,X		; FF D5 FF 06
	tsb $0000.w		; 0C 00 00
	asl $D500.w		; 0E 00 D5
	sbc $000C08.l,X		; FF 08 0C 00
	brk $EE.b		; 00 EE
	sbc $0AFFE5.l,X		; FF E5 FF 0A
	tsb $0000.w		; 0C 00 00
	inc $E5FF.w,X		; FE FF E5
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $0E.b		; 00 0E
	brk $E5.b		; 00 E5
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $F3.b		; 00 F3
	sbc $20FFF5.l,X		; FF F5 FF 20
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	sbc $FF.b,X		; F5 FF
	jsl $00000C.l		; 22 0C 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	jsr $3100.w		; 20 00 31
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	asl $9C02.w		; 0E 02 9C
	asl $10F0.w		; 0E F0 10
	sbc $08FF00.l		; EF 00 FF 08
	lda [$13.b],Y		; B7 13
	bit $FF00.w		; 2C 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	tsb $4800.w		; 0C 00 48
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $00.b		; 06 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	ora $1F00.w,Y		; 19 00 1F
	ora ($7E.b,X)		; 01 7E
	.db $82, $7D, $04		; 82 7D 04
	plx		; FA
	tsb $0091.w		; 0C 91 00
	ora $0016E1.l,X		; 1F E1 16 00
	brk $E1.b		; 00 E1
	brk $E9.b		; 00 E9
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $E3.b		; 00 E3
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	sbc $C0FD02.l,X		; FF 02 FD C0
	and ($01.b,X)		; 21 01
	inc $D827.w,X		; FE 27 D8
	bit $00C3.w,X		; 3C C3 00
	sbc $80DC23.l,X		; FF 23 DC 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E1.b		; 00 E1
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $E3.b		; 00 E3
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cld		; D8
	brk $F0.b		; 00 F0
	cpx #$00.b		; E0 00
	rts		; 60

	bra   0.b		; 80 00
	sed		; F8
	sty $0070.w		; 8C 70 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$01.b]		; 07 01
	clc		; 18
	ora ($00.b,X)		; 01 00
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $00.b		; 66 00
	inc $3D00.w,X		; FE 00 3D
	brk $76.b		; 00 76
	brk $01.b		; 00 01
	brk $09.b		; 00 09
	cpx #$1C.b		; E0 1C
	cpy #$18.b		; C0 18
	sta [$E0.b]		; 87 E0
	php		; 08
	ora ($3E.b,X)		; 01 3E
	ora $00E2.w,X		; 1D E2 00
	sed		; F8
	cop $F8.b		; 02 F8
	asl $00.b,X		; 16 00
	and $00.b,S		; 23 00
	rts		; 60

	brk $07.b		; 00 07
	brk $3F.b		; 00 3F
	brk $DD.b		; 00 DD
	brk $03.b		; 00 03
	brk $17.b		; 00 17
	brk $1A.b		; 00 1A
	ora $13.b		; 05 13
	tsb $6E81.w		; 0C 81 6E
	brk $23.b		; 00 23
	cli		; 58
	and ($18.b,X)		; 21 18
	cpx #$10.b		; E0 10
	lsr $21DE.w		; 4E DE 21
	sed		; F8
	brk $F0.b		; 00 F0
	brk $50.b		; 00 50
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FB.b		; 00 FB
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	brk $3E.b		; 00 3E
	cpy #$BC.b		; C0 BC
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sed		; F8
	brk $BF.b		; 00 BF
	brk $2F.b		; 00 2F
	rti		; 40

	ora $00F00C.l		; 0F 0C F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	adc $03140B.l,X		; 7F 0B 14 03
	bit $0006.w,X		; 3C 06 00
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	asl $38.b		; 06 38
	ora $000000.l		; 0F 00 00 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	sbc $EF00.w,Y		; F9 00 EF
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	sbc $EE7E81.l,X		; FF 81 7E EE
	ora ($96.b),Y		; 11 96
	pla		; 68
	brk $70.b		; 00 70
	brk $67.b		; 00 67
	brk $0F.b		; 00 0F
	dec $0021.w,X		; DE 21 00
	brk $4F.b		; 00 4F
	brk $0E.b		; 00 0E
	brk $70.b		; 00 70
	brk $CF.b		; 00 CF
	brk $98.b		; 00 98
	brk $F3.b		; 00 F3
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpy #$C0.b		; C0 C0
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
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	tsb $00.b		; 04 00
	sed		; F8
	tsb $0001.w		; 0C 01 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	brk $07.b		; 00 07
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	inc $FF00.w,X		; FE 00 FF
	ora ($9E.b,X)		; 01 9E
	adc [$18.b]		; 67 18
	ora $FA.b		; 05 FA
	ora $60A6.w,Y		; 19 A6 60
	sta $01DE01.l,X		; 9F 01 DE 01
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $E1.b		; 00 E1
	brk $01.b		; 00 01
	brk $41.b		; 00 41
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	brk $08.b		; 00 08
	sbc [$13.b],Y		; F7 13
	cpx #$83.b		; E0 83
	sei		; 78
	brk $1F.b		; 00 1F
	tsb $2003.w		; 0C 03 20
	cmp $1D.b,S		; C3 1D
	cpx #$C9.b		; E0 C9
	asl $80.b		; 06 80
	brk $90.b		; 00 90
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $12.b		; 00 12
	brk $38.b		; 00 38
	brk $4C.b		; 00 4C
	lda ($80.b,S),Y		; B3 80
	adc $0023DC.l,X		; 7F DC 23 00
	sbc $1EFF00.l,X		; FF 00 FF 1E
	adc ($1F.b,X)		; 61 1F
	cpx #$FE.b		; E0 FE
	ora ($40.b,X)		; 01 40
	brk $0C.b		; 00 0C
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
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
	brk $01.b		; 00 01
	cop $02.b		; 02 02
	trb $0900.w		; 1C 00 09
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $19.b		; 00 19
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	asl $0600.w,X		; 1E 00 06
	brk $77.b		; 00 77
	brk $3E.b		; 00 3E
	brk $06.b		; 00 06
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	inc $6300.w		; EE 00 63
	asl $3F01.w		; 0E 01 3F
	cpy #$C7.b		; C0 C7
	sec		; 38
	asl $09E1.w,X		; 1E E1 09
	sbc ($00.b)		; F2 00
	ora $0011.w		; 0D 11 00
	ora $F100.w,X		; 1D 00 F1
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	brk $71.b		; 00 71
	brk $88.b		; 00 88
	bpl  49.b		; 10 31
	cpy #$23.b		; C0 23
	cpy #$1D.b		; C0 1D
	sep #$06		; E2 06
	sbc $C738.w,Y		; F9 38 C7
	and $E518C0.l,X		; 3F C0 18 E5
	xce		; FB
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $78.b		; 00 78
	sty $F8.b		; 84 F8
	tsb $E1.b		; 04 E1
	brk $80.b		; 00 80
	rti		; 40

	brk $E0.b		; 00 E0
	brk $7C.b		; 00 7C
	asl $F9.b		; 06 F9
	sei		; 78
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
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
	ora $00.b,S		; 03 00
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $F000.w,X		; 3C 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	bit $3C03.w,X		; 3C 03 3C
	ora $3C.b,S		; 03 3C
	ora $3C.b,S		; 03 3C
	ora $3C.b,S		; 03 3C
	ora $3C.b,S		; 03 3C
	ora $3C.b,S		; 03 3C
	ora $3C.b,S		; 03 3C
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	ora $8C.b,S		; 03 8C
	cop $C4.b		; 02 C4
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
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $007F00.l		; 2F 00 7F 00
	and $000100.l,X		; 3F 00 01 00
	brk $00.b		; 00 00
	ora [$38.b]		; 07 38
	ora [$38.b]		; 07 38
	ora [$38.b]		; 07 38
	ora [$F8.b]		; 07 F8
	sbc [$08.b],Y		; F7 08
	tsb $0400.w		; 0C 00 04
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
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
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
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
	brk $06.b		; 00 06
	bra  24.b		; 80 18
	brk $F3.b		; 00 F3
	phd		; 0B
	pei ($02.b)		; D4 02
	sbc [$FF.b],Y		; F7 FF
	pei ($FF.b)		; D4 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	pei ($FF.b)		; D4 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	cpx $FF.b		; E4 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cpx $FF.b		; E4 FF
	asl $0C.b		; 06 0C
	brk $00.b		; 00 00
	pea $F4FF.w		; F4 FF F4
	sbc $000C08.l,X		; FF 08 0C 00
	brk $04.b		; 00 04
	brk $F4.b		; 00 F4
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $000F00.l,X		; 1F 00 0F 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	and ($0F.b),Y		; 31 0F
	bpl   6.b		; 10 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	brk $0F.b		; 00 0F
	brk $18.b		; 00 18
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  48.b		; 30 30
	cpy #$40.b		; C0 40
	ldy $FC00.w,X		; BC 00 FC
	cli		; 58
	ldy #$00.b		; A0 00
	jsr ($FC00.w,X)		; FC 00 FC
	bcs  78.b		; B0 4E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	jsr $C000.w		; 20 00 C0
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	tsb $00.b		; 04 00
	ora $010600.l		; 0F 00 06 01
	brk $00.b		; 00 00
	sbc ($01.b,S),Y		; F3 01
	asl $0200.w,X		; 1E 00 02
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000C00.l,X		; FF 00 0C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	trb $EB.b		; 14 EB
	bpl -17.b		; 10 EF
	bpl -18.b		; 10 EE
	bvs -125.b		; 70 83
	eor ($A0.b),Y		; 51 A0
	ora $FC.b,S		; 03 FC
	clc		; 18
	sbc ($3E.b,X)		; E1 3E
	brk $1C.b		; 00 1C
	brk $10.b		; 00 10
	brk $70.b		; 00 70
	brk $1C.b		; 00 1C
	brk $1F.b		; 00 1F
	brk $02.b		; 00 02
	brk $56.b		; 00 56
	brk $00.b		; 00 00
	sed		; F8
	cpy $38.b		; C4 38
	bit $DA.b		; 24 DA
	cpx $0012.w		; EC 12 00
	inc $FF00.w,X		; FE 00 FF
	eor $807E30.l		; 4F 30 7E 80
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	jsr $0400.w		; 20 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
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
	brk $03.b		; 00 03
	trb $6E01.w		; 1C 01 6E
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $001000.l,X		; DF 00 10 00
	rts		; 60

	brk $03.b		; 00 03
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	ora $33CC.w,Y		; 19 CC 33
	and $BA0450.l		; 2F 50 04 BA
	tsb $3B.b		; 04 3B
	tsb $39.b		; 04 39
	tsb $38.b		; 04 38
	tsb $38.b		; 04 38
	jsr ($3F00.w,X)		; FC 00 3F
	brk $9F.b		; 00 9F
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $80.b		; 00 80
	rti		; 40

	brk $F8.b		; 00 F8
	stx $7070.w		; 8E 70 70
	sty $2010.w		; 8C 10 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	dey		; 88
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
	brk $07.b		; 00 07
	clc		; 18
	tsb $00.b		; 04 00
	brk $7E.b		; 00 7E
	ora $18.b		; 05 18
	asl $09.b		; 06 09
	ora ($1E.b,X)		; 01 1E
	.db $62, $9D, $04		; 62 9D 04
	plx		; FA
	brk $00.b		; 00 00
	tda		; 7B
	brk $0F.b		; 00 0F
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	ldy #$00.b		; A0 00
	cmp [$00.b]		; C7 00
	and $008C70.l,X		; 3F 70 8C 00
	jsr ($4680.w,X)		; FC 80 46
	tsb $FB.b		; 04 FB
	eor $00C0A0.l,X		; 5F A0 C0 00
	sec		; 38
	brk $DE.b		; 00 DE
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C4.b		; 00 C4
	brk $C0.b		; 00 C0
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
	asl $0E00.w		; 0E 00 0E
	ora [$30.b]		; 07 30
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	php		; 08
	and ($00.b),Y		; 31 00
	trb $01.b		; 14 01
	brk $01.b		; 00 01
	brk $48.b		; 00 48
	brk $76.b		; 00 76
	brk $68.b		; 00 68
	brk $04.b		; 00 04
	brk $38.b		; 00 38
	brk $0B.b		; 00 0B
	brk $C2.b		; 00 C2
	ora ($80.b,X)		; 01 80
	adc $0400.w,X		; 7D 00 04
	cmp ($2C.b)		; D2 2C
	cop $89.b		; 02 89
	pld		; 2B
	sty $06.b		; 84 06
	sec		; 38
	stz $18.b		; 64 18
	rol $0A00.w,X		; 3E 00 0A
	brk $7F.b		; 00 7F
	brk $DE.b		; 00 DE
	brk $3E.b		; 00 3E
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $9F.b		; 00 9F
	brk $DC.b		; 00 DC
	brk $78.b		; 00 78
	bra   0.b		; 80 00
	sed		; F8
	brk $17.b		; 00 17
	jsr $8487.w		; 20 87 84
	sei		; 78
	sei		; 78
	tsb $F1.b		; 04 F1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $B1.b		; 00 B1
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
	brk $0B.b		; 00 0B
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	sec		; 38
	tsb $38.b		; 04 38
	tsb $0C30.w		; 0C 30 0C
	bmi  14.b		; 30 0E
	beq  24.b		; F0 18
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	bra  12.b		; 80 0C
	brk $F7.b		; 00 F7
	ora [$E3.b]		; 07 E3
	ora ($F7.b,X)		; 01 F7
	sbc $00FFE3.l,X		; FF E3 FF 00
	tsb $0000.w		; 0C 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc ($FF.b),Y		; F1 FF
	tsb $0C.b		; 04 0C
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($0E.b,X)		; 01 0E
	ora $0C.b,S		; 03 0C
	brk $00.b		; 00 00
	ora $0C.b,S		; 03 0C
	cop $00.b		; 02 00
	php		; 08
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	rti		; 40

	brk $F0.b		; 00 F0
	rti		; 40

	bcs   0.b		; B0 00
	beq   0.b		; F0 00
	sed		; F8
	jsr $00C0.w		; 20 C0 00
	clv		; B8
	rts		; 60

	bcc   0.b		; 90 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $04.b		; 00 04
	and ($18.b,S),Y		; 33 18
	rti		; 40

	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	cop $11.b		; 02 11
	phd		; 0B
	trb $01.b		; 14 01
	bit $0500.w,X		; 3C 00 05
	php		; 08
	brk $A3.b		; 00 A3
	brk $E1.b		; 00 E1
	brk $17.b		; 00 17
	brk $2D.b		; 00 2D
	brk $68.b		; 00 68
	brk $42.b		; 00 42
	brk $19.b		; 00 19
	brk $1C.b		; 00 1C
	ldy #$00.b		; A0 00
	trb $A348.w		; 1C 48 A3
.INDEX 8
	sep #$1C		; E2 1C
	ora $2080.w,Y		; 19 80 20
	cld		; D8
	adc ($8D.b)		; 72 8D
	lsr $A8.b		; 46 A8
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	iny		; C8
	brk $E0.b		; 00 E0
	brk $E9.b		; 00 E9
	brk $C0.b		; 00 C0
	brk $FE.b		; 00 FE
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$10.b]		; 07 10
	and $090700.l		; 2F 00 07 09
	asl $01.b,X		; 16 01
	asl $0B.b,X		; 16 0B
	bit $08.b		; 24 08
	and [$01.b],Y		; 37 01
	asl $0019.w		; 0E 19 00
	bpl   0.b		; 10 00
	ora $1900.w,Y		; 19 00 19
	brk $03.b		; 00 03
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	sed		; F8
	bpl -20.b		; 10 EC
	brk $FC.b		; 00 FC
	ora ($EC.b)		; 12 EC
	asl $00C1.w,X		; 1E C1 00
	adc $9E8877.l,X		; 7F 77 88 9E
	and ($00.b,X)		; 21 00
	brk $90.b		; 00 90
	brk $C0.b		; 00 C0
	brk $98.b		; 00 98
	brk $02.b		; 00 02
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($07.b,X)		; 01 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $1F.b		; 00 1F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra 112.b		; 80 70
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
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
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	ora $F2.b,S		; 03 F2
	brk $FC.b		; 00 FC
	sbc $00FFF2.l,X		; FF F2 FF 00
	tsb $0000.w		; 0C 00 00
	jsr ($FAFF.w,X)		; FC FF FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $00.b		; 00 00
	bit $1C00.w,X		; 3C 00 1C
	php		; 08
	bmi   4.b		; 30 04
	sec		; 38
	tsb $78.b		; 04 78
	asl A		; 0A
	stz $08.b,X		; 74 08
	lda [$26.b]		; A7 26
	pha		; 48
	bpl   0.b		; 10 00
	jsr $1000.w		; 20 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $58.b		; 00 58
	brk $10.b		; 00 10
	brk $28.b		; 00 28
	eor ($04.b,S),Y		; 53 04
	sta ($28.b)		; 92 28
	cmp ($08.b)		; D2 08
	bpl   8.b		; 10 08
	bpl   8.b		; 10 08
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $B8.b		; 00 B8
	brk $1A.b		; 00 1A
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	bra  76.b		; 80 4C
	brk $E1.b		; 00 E1
	ora $E806B4.l,X		; 1F B4 06 E8
	sbc $00FFF7.l,X		; FF F7 FF 00
	tsb $0000.w		; 0C 00 00
	sed		; F8
	sbc $02FFF7.l,X		; FF F7 FF 02
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $F7.b		; 00 F7
	sbc $000C04.l,X		; FF 04 0C 00
	brk $E4.b		; 00 E4
	sbc $06FFE7.l,X		; FF E7 FF 06
	tsb $0000.w		; 0C 00 00
	pea $E7FF.w		; F4 FF E7
	sbc $000C08.l,X		; FF 08 0C 00
	brk $04.b		; 00 04
	brk $E7.b		; 00 E7
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $14.b		; 00 14
	brk $E7.b		; 00 E7
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $E1.b		; 00 E1
	sbc $0EFFD7.l,X		; FF D7 FF 0E
	tsb $0000.w		; 0C 00 00
	sbc ($FF.b),Y		; F1 FF
	cmp [$FF.b],Y		; D7 FF
	jsr $000C.w		; 20 0C 00
	brk $01.b		; 00 01
	brk $D7.b		; 00 D7
	sbc $000C22.l,X		; FF 22 0C 00
	brk $11.b		; 00 11
	brk $D7.b		; 00 D7
	sbc $000C24.l,X		; FF 24 0C 00
	brk $E6.b		; 00 E6
	sbc $26FFC7.l,X		; FF C7 FF 26
	tsb $0000.w		; 0C 00 00
	inc $FF.b,X		; F6 FF
	cmp [$FF.b]		; C7 FF
	plp		; 28
	tsb $0000.w		; 0C 00 00
	asl $00.b		; 06 00
	cmp [$FF.b]		; C7 FF
	rol A		; 2A
	tsb $0000.w		; 0C 00 00
	asl $00.b,X		; 16 00
	cmp [$FF.b]		; C7 FF
	bit $000C.w		; 2C 0C 00
	brk $ED.b		; 00 ED
	sbc $2EFFB7.l,X		; FF B7 FF 2E
	tsb $0000.w		; 0C 00 00
	sbc $B7FF.w,X		; FD FF B7
	sbc $000C40.l,X		; FF 40 0C 00
	brk $0D.b		; 00 0D
	brk $B7.b		; 00 B7
	sbc $000C42.l,X		; FF 42 0C 00
	brk $F7.b		; 00 F7
	sbc $44FFA7.l,X		; FF A7 FF 44
	tsb $0000.w		; 0C 00 00
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
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	ora [$00.b]		; 07 00
	ora $010F00.l		; 0F 00 0F 01
	ora $030F01.l		; 0F 01 0F 03
	ora $020F02.l		; 0F 02 0F 02
	ora [$CF.b]		; 07 CF
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $F0.b		; 00 F0
	ldy #$F0.b		; A0 F0
	cpx #$F8.b		; E0 F8
	cpx #$F8.b		; E0 F8
	cpx #$78.b		; E0 78
	cpx #$78.b		; E0 78
	cpx #$F8.b		; E0 F8
	cpy #$F0.b		; C0 F0
	cpy #$FD.b		; C0 FD
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
	brk $E0.b		; 00 E0
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
	bpl   3.b		; 10 03
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $70.b		; 00 70
	ora $10FF00.l		; 0F 00 FF 10
	ora $20600F.l		; 0F 0F 60 20
	ora $0738.w,Y		; 19 38 07
	trb $00.b		; 14 00
	bpl   0.b		; 10 00
	ror $F100.w,X		; 7E 00 F1
	brk $02.b		; 00 02
	brk $0C.b		; 00 0C
	brk $77.b		; 00 77
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	asl $710E.w,X		; 1E 0E 71
	ora $837CE0.l,X		; 1F E0 7C 83
	sbc ($0E.b),Y		; F1 0E
	bra 124.b		; 80 7C
	ora $CF30F0.l		; 0F F0 30 CF
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	php		; 08
	brk $D1.b		; 00 D1
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	clc		; 18
	jmp ($1080.w,X)		; 7C 80 10
	brk $03.b		; 00 03
	brk $0B.b		; 00 0B
	beq  -9.b		; F0 F7
	php		; 08
	asl $C7C1.w,X		; 1E C1 C7
	brk $7F.b		; 00 7F
	brk $FC.b		; 00 FC
	ora $0C.b,S		; 03 0C
	sbc ($40.b,S),Y		; F3 40
	rti		; 40

	ora [$81.b]		; 07 81
	ora ($00.b,X)		; 01 00
	cmp [$00.b]		; C7 00
	sed		; F8
	brk $60.b		; 00 60
	rti		; 40

	ora [$83.b],Y		; 17 83
	bpl   0.b		; 10 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	ora [$20.b]		; 07 20
	cmp $FFF807.l,X		; DF 07 F8 FF
	brk $FF.b		; 00 FF
	brk $18.b		; 00 18
	sbc [$81.b]		; E7 81
	ora ($0F.b,X)		; 01 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	brk $C7.b		; 00 C7
	ora $1C.b,S		; 03 1C
	brk $E1.b		; 00 E1
	asl $E01F.w,X		; 1E 1F E0
	adc $FF80.w,X		; 7D 80 FF
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $C7.b		; 00 C7
	sec		; 38
	ora ($FE.b,X)		; 01 FE
	sed		; F8
	sed		; F8
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $83.b		; 00 83
	bra  96.b		; 80 60
	rts		; 60

	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($F0.b,X)		; 01 F0
	sbc ($1E.b,X)		; E1 1E
	jsr ($FF03.w,X)		; FC 03 FF
	brk $9C.b		; 00 9C
	adc $FF.b,S		; 63 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	rti		; 40

	bvs -128.b		; 70 80
	beq  12.b		; F0 0C
	cpy #$3F.b		; C0 3F
	sta $000060.l,X		; 9F 60 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $E0.b		; 00 E0
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $03.b		; 04 03
	tsb $03.b		; 04 03
	cop $01.b		; 02 01
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor ($00.b,X)		; 41 00
	lda ($00.b,X)		; A1 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora $037C00.l		; 0F 00 7C 03
	tas		; 1B
	tsb $05.b		; 04 05
	.db $82, $00, $C3		; 82 00 C3
	sec		; 38
	cmp ($FF.b,X)		; C1 FF
	brk $ED.b		; 00 ED
	brk $2F.b		; 00 2F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $0F.b		; 00 0F
	brk $02.b		; 00 02
	ora [$00.b]		; 07 00
	ora [$01.b]		; 07 01
	ora [$01.b]		; 07 01
	ora $007F00.l,X		; 1F 00 7F 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $70.b		; 00 70
	cpy #$70.b		; C0 70
	cpy #$70.b		; C0 70
	cpy #$7E.b		; C0 7E
	cpx #$FF.b		; E0 FF
	bne  96.b		; D0 60
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora $00.b,S		; 03 00
	ora [$01.b]		; 07 01
	brk $00.b		; 00 00
	bit $340B.w,X		; 3C 0B 34
	brk $07.b		; 00 07
	tsb $03.b		; 04 03
	ora [$00.b]		; 07 00
	sta $00.b,S		; 83 00
	and $00FC00.l		; 2F 00 FC 00
	and $3010.w		; 2D 10 30
	cpy #$00.b		; C0 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $03FF00.l,X		; FF 00 FF 03
	jsr ($003F.w,X)		; FC 3F 00
	sbc $0DF200.l,X		; FF 00 F2 0D
	brk $FF.b		; 00 FF
	sbc $00E000.l,X		; FF 00 E0 00
	jsr $3819.w		; 20 19 38
	brk $80.b		; 00 80
	brk $01.b		; 00 01
	brk $6F.b		; 00 6F
	brk $BC.b		; 00 BC
	brk $E0.b		; 00 E0
	brk $1F.b		; 00 1F
	cpx #$F9.b		; E0 F9
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($DF.b,X)		; 01 DF
	jsr $EE11.w		; 20 11 EE
	eor $BC.b,S		; 43 BC
	ora $0007E0.l,X		; 1F E0 07 00
	ror $1080.w		; 6E 80 10
	bpl  16.b		; 10 10
	bpl -57.b		; 10 C7
	ora ($71.b,X)		; 01 71
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	sec		; 38
	rts		; 60

	sta $FF6C93.l,X		; 9F 93 6C FF
	brk $7D.b		; 00 7D
	.db $82, $0F, $F0		; 82 0F F0
	stx $C171.w		; 8E 71 C1
	rol $07F8.w,X		; 3E F8 07
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	ora $001F1F.l,X		; 1F 1F 1F 00
	sbc ($00.b,X)		; E1 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($F093.w)		; 6C 93 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BD.b		; 00 BD
	rti		; 40

	lda $008740.l,X		; BF 40 87 00
	sei		; 78
	sta $10.b,S		; 83 10
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$FC.b		; E0 FC
	brk $06.b		; 00 06
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	brk $0E.b		; 00 0E
	cmp ($00.b,X)		; C1 00
	ora [$E0.b]		; 07 E0
	asl $7C80.w,X		; 1E 80 7C
	sbc $2206.w,Y		; F9 06 22
	cmp $C33C.w,X		; DD 3C C3
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BC.b		; 00 BC
	rti		; 40

	rts		; 60

	sta ($38.b,X)		; 81 38
	cmp [$60.b]		; C7 60
	asl $04F8.w,X		; 1E F8 04
	bmi -64.b		; 30 C0
	rti		; 40

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
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $8F.b		; 00 8F
	brk $C0.b		; 00 C0
	brk $78.b		; 00 78
	brk $0C.b		; 00 0C
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	tsb $8F00.w		; 0C 00 8F
	ora $C0.b,S		; 03 C0
	brk $7C.b		; 00 7C
	bmi  14.b		; 30 0E
	bit $0003.w,X		; 3C 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	brk $0C.b		; 00 0C
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	brk $07.b		; 00 07
	brk $FE.b		; 00 FE
	brk $67.b		; 00 67
	tya		; 98
	brk $FF.b		; 00 FF
	sbc ($0E.b),Y		; F1 0E
	adc $800F00.l,X		; 7F 00 0F 80
	sed		; F8
	brk $1E.b		; 00 1E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $4B.b		; 00 4B
	tsb $03.b		; 04 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1E.b		; 00 1E
	bra  63.b		; 80 3F
	cpy #$97.b		; C0 97
	rts		; 60

	cmp [$38.b]		; C7 38
	sbc $020200.l,X		; FF 00 02 02
	mvp $00,$04		; 44 04 00
	rti		; 40

	sbc ($90.b),Y		; F1 90
	eor [$20.b]		; 47 20
	jmp ($6000.w)		; 6C 00 60
	bra  64.b		; 80 40
	ldy #$FE.b		; A0 FE
	ora ($F7.b,X)		; 01 F7
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora [$F0.b]		; 07 F0
	ora $EF1EE1.l		; 0F E1 1E EF
	bpl  48.b		; 10 30
	jsr $0070.w		; 20 70 00
	bne   0.b		; D0 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	jsr $1F00.w		; 20 00 1F
	brk $3E.b		; 00 3E
	cmp ($F5.b,X)		; C1 F5
	cop $BD.b		; 02 BD
	.db $42, $3D		; 42 3D
	cpy #$38.b		; C0 38
	cmp [$F3.b]		; C7 F3
	tsb $10EE.w		; 0C EE 10
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($00.b)		; 32 00
	.db $62, $00, $0F		; 62 00 0F
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	bra -33.b		; 80 DF
	brk $BF.b		; 00 BF
	brk $0F.b		; 00 0F
	beq  26.b		; F0 1A
	cpx #$EF.b		; E0 EF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F9.b		; 00 F9
	asl $E1.b		; 06 E1
	asl $304F.w,X		; 1E 4F 30
	inc $F610.w		; EE 10 F6
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $D0.b		; 00 D0
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
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	clc		; 18
	brk $18.b		; 00 18
	bpl  12.b		; 10 0C
	brk $0E.b		; 00 0E
	cpy #$00.b		; C0 00
	bvs   0.b		; 70 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora [$C0.b]		; 07 C0
	ora ($F0.b,X)		; 01 F0
	brk $7C.b		; 00 7C
	plb		; AB
	mvn $16,$68		; 54 68 16
	sbc $7F12.w		; ED 12 7F
	brk $3E.b		; 00 3E
	ora ($0B.b,X)		; 01 0B
	cop $0F.b		; 02 0F
	cop $07.b		; 02 07
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E7.b		; 00 E7
	clc		; 18
	cmp $1C.b,S		; C3 1C
	and ($0E.b),Y		; 31 0E
	sbc ($0E.b),Y		; F1 0E
	adc #$16.b		; 69 16
	cpy $1B.b		; C4 1B
	sbc [$08.b],Y		; F7 08
	sbc [$18.b]		; E7 18
	clc		; 18
	bpl  48.b		; 10 30
	bmi  32.b		; 30 20
	brk $C0.b		; 00 C0
	brk $91.b		; 00 91
	bra -79.b		; 80 B1
	bra  99.b		; 80 63
	rti		; 40

	cop $00.b		; 02 00
	tad		; 5B
	ldy #$FF.b		; A0 FF
	brk $FF.b		; 00 FF
	brk $F3.b		; 00 F3
	brk $FE.b		; 00 FE
	ora ($F6.b,X)		; 01 F6
	ora #$E0.b		; 09 E0
	tas		; 1B
	cpy $0033.w		; CC 33 00
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $8C.b		; 00 8C
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $38.b		; 00 38
	brk $73.b		; 00 73
	tsb $4897.w		; 0C 97 48
	and [$C8.b],Y		; 37 C8
	and [$C0.b],Y		; 37 C0
	tas		; 1B
	cpx $1B.b		; E4 1B
	cpx $11.b		; E4 11
	inc $4EB0.w		; EE B0 4E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $08.b		; C4 08
	cpy $19.b		; C4 19
	dey		; 88
	and [$96.b],Y		; 37 96
	pla		; 68
	sec		; 38
	cpy $E0.b		; C4 E0
	clc		; 18
	cpy #$21.b		; C0 21
	rts		; 60

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
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $28.b		; 05 28
	brk $24.b		; 00 24
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	bit $6608.w		; 2C 08 66
	ora $E2.b		; 05 E2
	and ($C0.b,S),Y		; 33 C0
	adc ($80.b,S),Y		; 73 80
	adc $FB80.w,X		; 7D 80 FB
	tsb $69.b		; 04 69
	stx $00.b		; 86 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $F4.b		; 00 F4
	brk $3C.b		; 00 3C
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	brk $7B.b		; 00 7B
	brk $C6.b		; 00 C6
	and $E31C.w,Y		; 39 1C E3
	beq  15.b		; F0 0F
	ora ($FE.b,X)		; 01 FE
	cmp $3C.b,S		; C3 3C
	tsb $64.b		; 04 64
	trb $007C.w		; 1C 7C 00
	rti		; 40

	cop $00.b		; 02 00
	bra   0.b		; 80 00
	and ($60.b,X)		; 21 60
	rti		; 40

	brk $03.b		; 00 03
	rti		; 40

	adc $007F00.l,X		; 7F 00 7F 00
	adc $05FA00.l,X		; 7F 00 FA 05
	bmi -49.b		; 30 CF
	inc $F801.w,X		; FE 01 F8
	ora [$FC.b]		; 07 FC
	ora $80.b,S		; 03 80
	brk $C0.b		; 00 C0
	rti		; 40

	rts		; 60

	rti		; 40

	adc ($43.b,S),Y		; 73 43
	rol $04.b		; 26 04
	eor [$40.b]		; 47 40
	cpx $C000.w		; EC 00 C0
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F3.b		; 00 F3
	brk $26.b		; 00 26
	cmp $3FC0.w,Y		; D9 C0 3F
	ora $FC.b,S		; 03 FC
	and $0000C0.l,X		; 3F C0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcc -112.b		; 90 90
	stx $06.b		; 86 06
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $7F.b		; 00 7F
	brk $7C.b		; 00 7C
	brk $F0.b		; 00 F0
	tsb $7886.w		; 0C 86 78
	ora $20DFE0.l,X		; 1F E0 DF 20
	ora $000070.l		; 0F 70 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	pla		; 68
	brk $D8.b		; 00 D8
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc [$81.b]		; E7 81
	ror $D827.w,X		; 7E 27 D8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $C0.b		; 00 C0
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	ora $8100.w		; 0D 00 81
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $41.b		; 00 41
	brk $08.b		; 00 08
	ora [$0C.b]		; 07 0C
	ora ($0F.b,S),Y		; 13 0F
	bpl   3.b		; 10 03
	trb $9C03.w		; 1C 03 9C
	bpl -113.b		; 10 8F
	clc		; 18
	cmp [$8E.b]		; C7 8E
	eor ($00.b,X)		; 41 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $18.b		; 00 18
	brk $AC.b		; 00 AC
	brk $FE.b		; 00 FE
	ora ($76.b,X)		; 01 76
	sta ($9C.b,X)		; 81 9C
	adc $FC.b,S		; 63 FC
	ora $FC.b,S		; 03 FC
	ora $7E.b,S		; 03 7E
	ora ($1E.b,X)		; 01 1E
	sta ($2F.b,X)		; 81 2F
	cpy #$00.b		; C0 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0018.w		; 0C 18 00
	brk $E3.b		; 00 E3
	trb $8E51.w		; 1C 51 8E
	adc $7B82.w,X		; 7D 82 7B
	bra 127.b		; 80 7F
	bra -68.b		; 80 BC
	rti		; 40

	cmp $805F00.l,X		; DF 00 5F 80
	brk $00.b		; 00 00
	jsr $3000.w		; 20 00 30
	brk $70.b		; 00 70
	rti		; 40

	nop		; EA
	cpy #$D7.b		; C0 D7
	cmp ($FF.b,X)		; C1 FF
	rep #$42		; C2 42
	cop $39.b		; 02 39
	dec $F3.b		; C6 F3
	tsb $00FF.w		; 0C FF 00
	xce		; FB
	tsb $F7.b		; 04 F7
	php		; 08
	cmp [$38.b]		; C7 38
	cmp [$38.b]		; C7 38
	and ($CC.b,S),Y		; 33 CC
	rts		; 60

	jsr $40C0.w		; 20 C0 40
	cpy #$40.b		; C0 40
	tsb $00.b		; 04 00
	tsb $0A00.w		; 0C 00 0A
	brk $02.b		; 00 02
	brk $0F.b		; 00 0F
	brk $72.b		; 00 72
	sty $08D7.w		; 8C D7 08
	sbc [$18.b]		; E7 18
	stp		; DB
	bit $F1.b		; 24 F1
	asl $0CD2.w		; 0E D2 0C
	sbc $1C.b,S		; E3 1C
	sbc $000010.l		; EF 10 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	cpx #$00.b		; E0 00
	rts		; 60

	ora $E1.b,S		; 03 E1
	asl $C3.b		; 06 C3
	tsb $308E.w		; 0C 8E 30
	stz $8C21.w,X		; 9E 21 8C
	adc $F3.b,S		; 63 F3
	tsb $00FF.w		; 0C FF 00
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
	brk $E0.b		; 00 E0
	rts		; 60

	bra 104.b		; 80 68
	bcc -56.b		; 90 C8
	bpl -56.b		; 10 C8
	bmi  24.b		; 30 18
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
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	php		; 08
	ora $09.b,S		; 03 09
	brk $0C.b		; 00 0C
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	bra  12.b		; 80 0C
	brk $0C.b		; 00 0C
	php		; 08
	tsb $00.b		; 04 00
	stx $04.b		; 86 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	cop $0D.b		; 02 0D
	brk $69.b		; 00 69
	asl $78.b		; 06 78
	ora [$B4.b]		; 07 B4
	ora $3C.b,S		; 03 3C
	cmp $F8.b,S		; C3 F8
	ora $7C.b,S		; 03 7C
	ora $37.b,S		; 03 37
	php		; 08
	sbc ($0C.b),Y		; F1 0C
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $14.b		; 00 14
	php		; 08
	trb $7700.w		; 1C 00 77
	brk $7E.b		; 00 7E
	ora ($FD.b,X)		; 01 FD
	brk $EF.b		; 00 EF
	bpl -114.b		; 10 8E
	bmi -58.b		; 30 C6
	sec		; 38
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	ldy #$00.b		; A0 00
	bmi   0.b		; 30 00
	bvs   0.b		; 70 00
	rti		; 40

	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	ldy #$88.b		; A0 88
	bmi -120.b		; 30 88
	bvs -120.b		; 70 88
	bvs -128.b		; 70 80
	adc $0000.w,Y		; 79 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	ora ($01.b),Y		; 11 01
	and ($02.b,S),Y		; 33 02
	adc $00.b,S		; 63 00
	dec $04.b		; C6 04
	cmp $38.b,S		; C3 38
	lda [$48.b],Y		; B7 48
	inc $BC11.w		; EE 11 BC
	ora $6D.b,S		; 03 6D
	bcc -49.b		; 90 CF
	bmi -113.b		; 30 8F
	bvs -121.b		; 70 87
	bvs -95.b		; 70 A1
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $82.b		; 00 82
	brk $86.b		; 00 86
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $D920.w,Y		; F9 20 D9
	rts		; 60

	txy		; 9B
	cpx #$13.b		; E0 13
	lda ($06.b),Y		; B1 06
	sbc ($06.b),Y		; F1 06
	cpy #$07.b		; C0 07
	lda ($05.b)		; B2 05
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
	cpx #$00.b		; E0 00
	cpx #$02.b		; E0 02
	rep #$04		; C2 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	brk $38.b		; 00 38
	brk $B0.b		; 00 B0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	rts		; 60

	asl $3880.w		; 0E 80 38
	brk $E8.b		; 00 E8
	ora $05C4.w,Y		; 19 C4 05
	sbc $F6FF.w		; ED FF F6
	sbc $000C00.l,X		; FF 00 0C 00
	brk $FD.b		; 00 FD
	sbc $02FFF6.l,X		; FF F6 FF 02
	tsb $0000.w		; 0C 00 00
	ora $F600.w		; 0D 00 F6
	sbc $000C04.l,X		; FF 04 0C 00
	brk $E8.b		; 00 E8
	sbc $06FFE6.l,X		; FF E6 FF 06
	tsb $0000.w		; 0C 00 00
	sed		; F8
	sbc $08FFE6.l,X		; FF E6 FF 08
	tsb $0000.w		; 0C 00 00
	php		; 08
	brk $E6.b		; 00 E6
	sbc $000C0A.l,X		; FF 0A 0C 00
	brk $18.b		; 00 18
	brk $E6.b		; 00 E6
	sbc $000C0C.l,X		; FF 0C 0C 00
	brk $EB.b		; 00 EB
	sbc $0EFFD6.l,X		; FF D6 FF 0E
	tsb $0000.w		; 0C 00 00
	xce		; FB
	sbc $20FFD6.l,X		; FF D6 FF 20
	tsb $0000.w		; 0C 00 00
	phd		; 0B
	brk $D6.b		; 00 D6
	sbc $000C22.l,X		; FF 22 0C 00
	brk $EE.b		; 00 EE
	sbc $24FFC6.l,X		; FF C6 FF 24
	tsb $0000.w		; 0C 00 00
	inc $C6FF.w,X		; FE FF C6
	sbc $000C26.l,X		; FF 26 0C 00
	brk $0E.b		; 00 0E
	brk $C6.b		; 00 C6
	sbc $000C28.l,X		; FF 28 0C 00
	brk $F9.b		; 00 F9
	sbc $2AFFB6.l,X		; FF B6 FF 2A
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $4063.w		; 1C 63 40
	and $0F007F.l,X		; 3F 7F 00 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	brk $DC.b		; 00 DC
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $89.b		; 00 89
	ror $23.b,X		; 76 23
	jmp.w [$30CF]		; DC CF 30
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $62, $00, $20		; 62 00 20
	brk $FC.b		; 00 FC
	bmi -68.b		; 30 BC
	stz $1E.b,X		; 74 1E
	jsr ($FC3E.w,X)		; FC 3E FC
	rol $2EFC.w		; 2E FC 2E
	jsr ($619E.w,X)		; FC 9E 61
.ACCU 16
.INDEX 16
	rep #$3C		; C2 3C
	sbc ($0E.b),Y		; F1 0E
	sbc $00FE00.l,X		; FF 00 FE 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $3A.b		; 00 3A
	ora $C3.b		; 05 C3
	trb $0870.w		; 1C 70 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A4.b		; 00 A4
	cli		; 58
	php		; 08
	beq -64.b		; F0 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $1E.b		; 00 1E
	brk $83.b		; 00 83
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	bpl   1.b		; 10 01
	asl $830C.w,X		; 1E 0C 83
	adc ($18.b,X)		; 61 18
	bvs  14.b		; 70 0E
	rol $3E00.w,X		; 3E 00 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $6E.b		; 00 6E
	brk $03.b		; 00 03
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $E7.b		; 00 E7
	brk $3C.b		; 00 3C
	cmp $01.b,S		; C3 01
	inc $0FF0.w,X		; FE F0 0F
	jmp ($6003.w,X)		; 7C 03 60
	trb $631C.w		; 1C 1C 63
	asl $1E.b		; 06 1E
	brk $10.b		; 00 10
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	bcc   0.b		; 90 00
	sta ($10.b,X)		; 81 10
	cop $02.b		; 02 02
	jsr $FF24.w		; 20 24 FF
	brk $7F.b		; 00 7F
	brk $DF.b		; 00 DF
	jsr $738C.w		; 20 8C 73
	rol $7EC1.w,X		; 3E C1 7E
	sta ($1F.b,X)		; 81 1F
	brk $3F.b		; 00 3F
	cpy #$2060.w		; C0 60 20
	jsr $3320.w		; 20 20 33
	and $07.b,S		; 23 07
	tsb $6C.b		; 04 6C
	brk $E0.b		; 00 E0
	brk $10.b		; 00 10
	brk $61.b		; 00 61
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $73.b		; 00 73
	bra   7.b		; 80 07
	sed		; F8
	ora $FC.b,S		; 03 FC
	asl $FCE0.w,X		; 1E E0 FC
	ora $E3.b,S		; 03 E3
	trb $0000.w		; 1C 00 00
	brk $00.b		; 00 00
	jsr $1820.w		; 20 20 18
	clc		; 18
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	jmp ($FE7C.w,X)		; 7C 7C FE
	brk $FE.b		; 00 FE
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	bpl  24.b		; 10 18
	cpx #$41BE.w		; E0 BE 41
	ora $7FE2.w,X		; 1D E2 7F
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $18.b		; 06 18
	cpx #$C030.w		; E0 30 C0
	cpy #$E000.w		; C0 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $06.b		; 00 06
	brk $10.b		; 00 10
	brk $0A.b		; 00 0A
	brk $83.b		; 00 83
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	php		; 08
	brk $0C.b		; 00 0C
	ora ($0E.b,X)		; 01 0E
	php		; 08
	ora [$07.b],Y		; 17 07
	clc		; 18
	ora [$98.b]		; 07 98
	bpl -114.b		; 10 8E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $09.b		; 00 09
	cop $00.b		; 02 00
	brk $80.b		; 00 80
	brk $A3.b		; 00 A3
	bvc  -1.b		; 50 FF
	brk $F7.b		; 00 F7
	php		; 08
	sbc [$08.b],Y		; F7 08
	cmp ($0C.b)		; D2 0C
	sbc ($0C.b,S),Y		; F3 0C
	sbc ($0C.b,S),Y		; F3 0C
	sbc $0A.b,X		; F5 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $FE00.w,X		; 3E 00 FE
	brk $0E.b		; 00 0E
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
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3B.b		; 00 3B
	brk $1C.b		; 00 1C
	sei		; 78
	tsb $0C78.w		; 0C 78 0C
	sei		; 78
	bit $1F78.w		; 2C 78 1F
	sed		; F8
	tsb $0830.w		; 0C 30 08
	bpl   0.b		; 10 00
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $E0.b		; 00 E0
	brk $FC.b		; 00 FC
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
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $070708.l,X		; 3F 08 07 07
	bpl  16.b		; 10 10
	ora $0106.w		; 0D 06 01
	brk $03.b		; 00 03
	ora ($00.b,X)		; 01 00
	brk $1E.b		; 00 1E
	sbc $00.b,S		; E3 00
	tsb $00.b		; 04 00
	ora $6F00.w,Y		; 19 00 6F
	brk $87.b		; 00 87
	brk $3E.b		; 00 3E
	brk $F8.b		; 00 F8
	brk $3A.b		; 00 3A
	brk $78.b		; 00 78
	sta [$E3.b]		; 87 E3
	trb $7881.w		; 1C 81 78
	ora $FF00E0.l,X		; 1F E0 00 FF
	ora ($FE.b,X)		; 01 FE
	ora [$F8.b]		; 07 F8
	and $004E00.l,X		; 3F 00 4E 00
	ora [$00.b]		; 07 00
	.db $82, $62, $E1		; 82 62 E1
	tsb $80.b		; 04 80
	brk $82.b		; 00 82
	jmp ($01E1.w)		; 6C E1 01
	ora ($01.b,X)		; 01 01
	bvs  15.b		; 70 0F
	clc		; 18
	ora [$FF.b]		; 07 FF
	brk $E7.b		; 00 E7
	clc		; 18
	ply		; 7A
	sta $ED.b		; 85 ED
	cop $FF.b		; 02 FF
	brk $F3.b		; 00 F3
	tsb $0060.w		; 0C 60 00
	bcc   0.b		; 90 00
	asl $7900.w,X		; 1E 00 79
	jsr $0072.w		; 20 72 00
	cpx #$0300.w		; E0 00 03
	ora $03.b,S		; 03 03
	brk $1F.b		; 00 1F
	cpx #$8077.w		; E0 77 80
	sbc $06F900.l,X		; FF 00 F9 06
	ora $3EF2.w		; 0D F2 3E
	cpy #$00FF.w		; C0 FF 00
	cmp $000020.l,X		; DF 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($E0.b,X)		; E1 E0
	php		; 08
	php		; 08
	brk $00.b		; 00 00
	cpy #$F0C0.w		; C0 C0 F0
	bmi -15.b		; 30 F1
	asl $01FE.w		; 0E FE 01
	sbc $11EE00.l,X		; FF 00 EE 11
	and $2106C0.l		; 2F C0 06 21
	cpy #$F003.w		; C0 03 F0
	asl $0000.w		; 0E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rti		; 40

	rts		; 60

	bra -32.b		; 80 E0
	ora $3FC0.w,Y		; 19 C0 3F
	clv		; B8
	rti		; 40

	rts		; 60

	.db $82, $30, $CE		; 82 30 CE
	rts		; 60

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
	rti		; 40

	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $10.b		; 00 10
	cmp $86608F.l		; CF 8F 60 86
	adc ($41.b,X)		; 61 41
	bmi  96.b		; 30 60
	bpl  63.b		; 10 3F
	brk $1B.b		; 00 1B
	brk $0B.b		; 00 0B
	brk $60.b		; 00 60
	brk $78.b		; 00 78
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	brk $80.b		; 00 80
	brk $30.b		; 00 30
	brk $AB.b		; 00 AB
	tsb $83.b		; 04 83
	brk $76.b		; 00 76
	php		; 08
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $C00E00.l,X		; FF 00 0E C0
	cmp [$30.b]		; C7 30
	sbc [$18.b]		; E7 18
	sbc $001200.l,X		; FF 00 12 00
	tsb $0008.w		; 0C 08 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $0E.b		; 00 0E
	php		; 08
	ora $0A08.w		; 0D 08 0A
	php		; 08
	sta $837C60.l,X		; 9F 60 7C 83
	adc $3786.w,Y		; 79 86 37
	iny		; C8
	asl $BFE1.w,X		; 1E E1 BF
	brk $FE.b		; 00 FE
	ora ($C8.b,X)		; 01 C8
	ora [$66.b]		; 07 66
	brk $C6.b		; 00 C6
	brk $8C.b		; 00 8C
	brk $10.b		; 00 10
	brk $30.b		; 00 30
	bpl   2.b		; 10 02
	brk $86.b		; 00 86
	brk $C5.b		; 00 C5
	rti		; 40

	sta $0872.w		; 8D 72 08
	sbc [$28.b],Y		; F7 28
	cmp [$59.b],Y		; D7 59
	ldx $FB.b		; A6 FB
	tsb $FD.b		; 04 FD
	cop $F8.b		; 02 F8
	ora [$F9.b]		; 07 F9
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cmp #$23C0.w		; C9 C0 23
	rts		; 60

	ora $60.b,S		; 03 60
	asl $E2.b		; 06 E2
	tsb $318C.w		; 0C 8C 31
	stz $8923.w		; 9C 23 89
	ror $00.b		; 66 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -128.b		; 80 80
	brk $A0.b		; 00 A0
	rti		; 40

	jsr $0040.w		; 20 40 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($10.b,X)		; 01 10
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	trb $05.b		; 14 05
	adc ($1B.b)		; 72 1B
	rts		; 60

	tsa		; 3B
	rti		; 40

	and $3140.w,X		; 3D 40 31
	lsr $31.b		; 46 31
	stx $38.b		; 86 38
	sta [$10.b]		; 87 10
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $21.b		; 00 21
	brk $41.b		; 00 41
	brk $22.b		; 00 22
	brk $00.b		; 00 00
	brk $28.b		; 00 28
	bpl 108.b		; 10 6C
	cop $78.b		; 02 78
	asl $FE.b		; 06 FE
	brk $DE.b		; 00 DE
	and ($8A.b,X)		; 21 8A
	adc ($84.b),Y		; 71 84
	adc ($EC.b,S),Y		; 73 EC
	ora ($00.b,S),Y		; 13 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $88.b		; 00 88
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	iny		; C8
	brk $C8.b		; 00 C8
	bra  72.b		; 80 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $080888.l		; CF 88 08 08
	sta ($00.b,X)		; 81 00
	ora $80.b,S		; 03 80
	inc $20.b		; E6 20
	bne   0.b		; D0 00
	cpy #$8000.w		; C0 00 80
	rti		; 40

	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$EF.b]		; 07 EF
	brk $FE.b		; 00 FE
	ora ($FC.b,X)		; 01 FC
	ora $E3.b,S		; 03 E3
	trb $38C7.w		; 1C C7 38
	cmp $80C120.l,X		; DF 20 C1 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	ora $00.b,S		; 03 00
	bra   0.b		; 80 00
	ora $00.b,S		; 03 00
	beq   0.b		; F0 00
	sbc ($0E.b),Y		; F1 0E
	sbc [$08.b],Y		; F7 08
	lda $EB10.w		; AD 10 EB
	bpl -32.b		; 10 E0
	ora $7F609E.l		; 0F 9E 60 7F
	bra  -3.b		; 80 FD
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	brk $0C.b		; 00 0C
	brk $44.b		; 00 44
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	php		; 08
	stz $F801.w,X		; 9E 01 F8
	ora [$E3.b]		; 07 E3
	tsb $04FB.w		; 0C FB 04
	sbc $00FE00.l,X		; FF 00 FE 00
	pea $0000.w		; F4 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	cpy #$00C0.w		; C0 C0 00
	cpy #$8000.w		; C0 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $06.b		; 00 06
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	bpl   0.b		; 10 00
	asl $8700.w,X		; 1E 00 87
	ora $8482.w		; 0D 82 84
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	cop $05.b		; 02 05
	brk $07.b		; 00 07
	ora ($83.b,X)		; 01 83
	brk $81.b		; 00 81
	brk $5C.b		; 00 5C
	sta $78.b,S		; 83 78
	ora $3C.b,S		; 03 3C
	ora $9F.b,S		; 03 9F
	brk $F9.b		; 00 F9
	tsb $71.b		; 04 71
	asl $08.b		; 06 08
	sta [$78.b]		; 87 78
	sta [$20.b]		; 87 20
	brk $26.b		; 00 26
	tsb $64.b		; 04 64
	brk $44.b		; 00 44
	brk $88.b		; 00 88
	php		; 08
	bcs  48.b		; B0 30
	lda ($00.b,X)		; A1 00
	cmp ($00.b,X)		; C1 00
	cmp $5E26.w,Y		; D9 26 5E
	ldy #$609F.w		; A0 9F 60
	sta $608E60.l,X		; 9F 60 8E 60
	sbc $01FE00.l,X		; FF 00 FE 01
	inc $01.b,X		; F6 01
	bpl   0.b		; 10 00
	bmi   0.b		; 30 00
	jsr $2000.w		; 20 00 20
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	cli		; 58
	dey		; 88
	bit $8E.b,X		; 34 8E
	bmi   6.b		; 30 06
	sec		; 38
	sty $28.b,X		; 94 28
	lsr $5CA0.w,X		; 5E A0 5C
	lda ($5C.b,X)		; A1 5C
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
	rti		; 40

	rti		; 40

	brk $40.b		; 00 40
	bcc   0.b		; 90 00
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
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($00.b,S),Y		; 33 00
	lda ($00.b,X)		; A1 00
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
	bra   9.b		; 80 09
	bra  36.b		; 80 24
	brk $EE.b		; 00 EE
	ora ($D3.b),Y		; 11 D3
	ora $F2.b,S		; 03 F2
	sbc $00FFD3.l,X		; FF D3 FF 00
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	cmp ($FF.b,S),Y		; D3 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	inc $E3FF.w		; EE FF E3
	sbc $000C04.l,X		; FF 04 0C 00
	brk $FE.b		; 00 FE
	sbc $06FFE3.l,X		; FF E3 FF 06
	tsb $0000.w		; 0C 00 00
	asl $E300.w		; 0E 00 E3
	sbc $000C08.l,X		; FF 08 0C 00
	brk $F0.b		; 00 F0
	sbc $0AFFF3.l,X		; FF F3 FF 0A
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	tsb $000C.w		; 0C 0C 00
	brk $10.b		; 00 10
	brk $F3.b		; 00 F3
	sbc $000C0E.l,X		; FF 0E 0C 00
	brk $F9.b		; 00 F9
	sbc $200003.l,X		; FF 03 00 20
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	ora ($02.b,X)		; 01 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	bit $00.b		; 24 00
	jsl $002200.l		; 22 00 22 00
	brk $36.b		; 00 36
	ora $20.b,S		; 03 20
	and [$90.b]		; 27 90
	eor [$80.b],Y		; 57 80
	sbc $8902.w		; ED 02 89
	rol $88.b,X		; 36 88
	rol $6D.b,X		; 36 6D
	ora ($00.b)		; 12 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $24.b		; 00 24
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	ldy #$6090.w		; A0 90 60
	brk $74.b		; 00 74
	bra 116.b		; 80 74
	rts		; 60

	stz $0000.w		; 9C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	phd		; 0B
	ora $0C.b,S		; 03 0C
	php		; 08
	rol $08.b		; 26 08
	and [$27.b],Y		; 37 27
	bpl  17.b		; 10 11
	php		; 08
	bpl   8.b		; 10 08
	ora $001800.l		; 0F 00 18 00
	trb $00.b		; 14 00
	bra   0.b		; 80 00
	eor $02.b,S		; 43 02
	bvs   0.b		; 70 00
	tsb $02.b		; 04 02
	sta $00.b,S		; 83 00
	and $00.b,S		; 23 00
	cpx #$E61B.w		; E0 1B E6
	clc		; 18
	sbc $106B10.l		; EF 10 6B 10
	adc $00FF80.l,X		; 7F 80 FF 00
	tas		; 1B
	cpy #$20CF.w		; C0 CF 20
	rol $02.b		; 26 02
	rts		; 60

	rti		; 40

	pha		; 48
	rti		; 40

	sei		; 78
	pha		; 48
	pha		; 48
	rti		; 40

	clc		; 18
	brk $20.b		; 00 20
	brk $88.b		; 00 88
	brk $EF.b		; 00 EF
	bpl  -1.b		; 10 FF
	brk $4F.b		; 00 4F
	bmi -50.b		; 30 CE
	and ($CE.b),Y		; 31 CE
	and ($ED.b),Y		; 31 ED
	ora ($EC.b)		; 12 EC
	ora ($1B.b),Y		; 11 1B
	cpx $00.b		; E4 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $C0.b		; 00 C0
	brk $30.b		; 00 30
	brk $F2.b		; 00 F2
	tsb $64.b		; 04 64
	sta $9265.w,Y		; 99 65 92
	tda		; 7B
	sty $EE.b		; 84 EE
	ora ($F3.b,X)		; 01 F3
	tsb $3F.b		; 04 3F
	cpy #$00BF.w		; C0 BF 00
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
	rti		; 40

	brk $40.b		; 00 40
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
	brk $00.b		; 00 00
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
	brk $05.b		; 00 05
	brk $18.b		; 00 18
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $4C.b		; 00 4C
	and ($83.b,S),Y		; 33 83
	jmp $001F20.l		; 5C 20 1F 00
	and $0CE007.l,X		; 3F 07 E0 0C
	and ($3F.b,S),Y		; 33 3F
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $F1.b		; 00 F1
	brk $E0.b		; 00 E0
	brk $A2.b		; 00 A2
	trb $81.b		; 14 81
	ora ($7F.b,X)		; 01 7F
	brk $63.b		; 00 63
	ora ($01.b,X)		; 01 01
	ora $CC.b,S		; 03 CC
	ora $F3.b,S		; 03 F3
	tsb $E11E.w		; 0C 1E E1
	adc $82.b,X		; 75 82
	xce		; FB
	tsb $04.b		; 04 04
	xce		; FB
	sta $001360.l,X		; 9F 60 13 00
	ldy #$6700.w		; A0 00 67
	eor $68.b,S		; 43 68
	brk $C0.b		; 00 C0
	brk $0F.b		; 00 0F
	ora ($20.b,X)		; 01 20
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	cpy #$807F.w		; C0 7F 80
	sbc [$18.b]		; E7 18
	ora $EA.b,X		; 15 EA
	sei		; 78
	sta ($BF.b,X)		; 81 BF
	rti		; 40

	sbc $639800.l,X		; FF 00 98 63
	cpx $0002.w		; EC 02 00
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  32.b		; 80 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EC.b		; 00 EC
	bpl 104.b		; 10 68
	sta [$76.b],Y		; 97 76
	php		; 08
	jmp ($8C10.w)		; 6C 10 8C
	adc $D4.b,S		; 63 D4
	plp		; 28
	cpx #$0010.w		; E0 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $8200.w		; 0C 00 82
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $05.b		; 00 05
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	trb $8619.w		; 1C 19 86
	php		; 08
	stx $8F.b		; 86 8F
	rti		; 40

	asl $0261.w,X		; 1E 61 02
	brk $06.b		; 00 06
	brk $29.b		; 00 29
	ora ($3A.b,X)		; 01 3A
	cop $0C.b		; 02 0C
	brk $08.b		; 00 08
	brk $06.b		; 00 06
	tsb $00.b		; 04 00
	brk $C5.b		; 00 C5
	inc A		; 1A
	sbc #$C916.w		; E9 16 C9
	rol $8F.b		; 26 8F
	bmi -50.b		; 30 CE
	bmi 111.b		; 30 6F
	bpl -34.b		; 10 DE
	and ($CB.b,X)		; 21 CB
	bit $88.b,X		; 34 88
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $48.b		; 00 48
	brk $88.b		; 00 88
	brk $20.b		; 00 20
	brk $A4.b		; 00 A4
	asl A		; 0A
	inc $08.b		; E6 08
	tax		; AA
	tsb $DE.b		; 04 DE
	jsr $619E.w		; 20 9E 61
	sta $6A.b,X		; 95 6A
	ora ($ED.b)		; 12 ED
	and $C8.b,X		; 35 C8
	brk $00.b		; 00 00
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

	brk $40.b		; 00 40
	ldy #$00C0.w		; A0 C0 00
	bra  80.b		; 80 50
	brk $30.b		; 00 30
	brk $28.b		; 00 28
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	jsr $8E00.w		; 20 00 8E
	brk $21.b		; 00 21
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $05.b		; 00 05
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	jsr $8F10.w		; 20 10 8F
	eor [$30.b]		; 47 30
	adc ($18.b,X)		; 61 18
	sei		; 78
	ora ($01.b,X)		; 01 01
	ror $0186.w,X		; 7E 86 01
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	ror A		; 6A
	brk $38.b		; 00 38
	cop $04.b		; 02 04
	tsb $31.b		; 04 31
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $37.b		; 00 37
	brk $19.b		; 00 19
	inc $87.b		; E6 87
	sei		; 78
	cmp [$38.b]		; C7 38
	cmp [$38.b]		; C7 38
	dec $31.b		; C6 31
	asl $9000.w		; 0E 00 90
	bcc  16.b		; 90 10
	bpl   7.b		; 10 07
	tsb $14.b		; 04 14
	brk $70.b		; 00 70
	brk $11.b		; 00 11
	brk $90.b		; 00 90
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $07.b		; 00 07
	sed		; F8
	sta $7C.b,S		; 83 7C
	stx $F370.w		; 8E 70 F3
	tsb $F00F.w		; 0C 0F F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $0620.w		; 20 20 06
	brk $0A.b		; 00 0A
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $F8.b		; 00 F8
	brk $E0.b		; 00 E0
	brk $20.b		; 00 20
	cpy #$8778.w		; C0 78 87
	and $CA.b,X		; 35 CA
	sbc $1AE400.l,X		; FF 00 E4 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	asl $0600.w,X		; 1E 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	ora $01.b,S		; 03 01
	ora $01.b,S		; 03 01
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $01.b,S		; 03 01
	ora $00.b,S		; 03 00
	ora $030000.l		; 0F 00 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	cpy #$C060.w		; C0 60 C0
	rts		; 60

	cpy #$80C0.w		; C0 C0 80
	rti		; 40

	bra  64.b		; 80 40
	bra  -8.b		; 80 F8
	bra   0.b		; 80 00
	bra -32.b		; 80 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $F4.b		; 00 F4
	phd		; 0B
	sep #$02		; E2 02
	sbc $FF.b,X		; F5 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	ora $00.b		; 05 00
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	pea $F2FF.w		; F4 FF F2
	sbc $000C04.l,X		; FF 04 0C 00
	brk $04.b		; 00 04
	brk $F2.b		; 00 F2
	sbc $000C06.l,X		; FF 06 0C 00
	brk $FB.b		; 00 FB
	sbc $080002.l,X		; FF 02 00 08
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $01.b		; 02 01
	cop $00.b		; 02 00
	asl $01.b		; 06 01
	tsb $03.b		; 04 03
	brk $05.b		; 00 05
	brk $02.b		; 00 02
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	ldy $00.b		; A4 00
	sta ($00.b,X)		; 81 00
	php		; 08
	php		; 08
	plp		; 28
	brk $C4.b		; 00 C4
	brk $00.b		; 00 00
	bra -72.b		; 80 B8
	brk $7A.b		; 00 7A
	tsb $50.b		; 04 50
	lda [$7C.b]		; A7 7C
	sta $3D.b,S		; 83 3D
	rti		; 40

	cld		; D8
	and ($7B.b,X)		; 21 7B
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
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	tsb $4000.w		; 0C 00 40
	brk $18.b		; 00 18
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $32.b		; 00 32
	brk $0B.b		; 00 0B
	brk $06.b		; 00 06
	brk $1F.b		; 00 1F
	brk $3B.b		; 00 3B
	rti		; 40

	and ($1E.b,X)		; 21 1E
	dec $6621.w		; CE 21 66
	ora #$09.b		; 09 09
	rol $47.b,X		; 36 47
	sec		; 38
	ora ($1E.b,X)		; 01 1E
	dec $00.b		; C6 00
	php		; 08
	pha		; 48
	ora $00.b,S		; 03 00
	clc		; 18
	rti		; 40

	bit #$80.b		; 89 80
	bit $00.b,X		; 34 00
	sta $2808.w,X		; 9D 08 28
	bra  -1.b		; 80 FF
	brk $FE.b		; 00 FE
	brk $03.b		; 00 03
	jsr ($18E6.w,X)		; FC E6 18
	xce		; FB
	tsb $4F.b		; 04 4F
	bmi -67.b		; 30 BD
	.db $42, $9E		; 42 9E
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	bmi   0.b		; 30 00
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	bra   0.b		; 80 00
	rti		; 40

	.db $82, $48, $B0		; 82 48 B0
	sed		; F8
	brk $E8.b		; 00 E8
	bpl -16.b		; 10 F0
	ora $009228.l		; 0F 28 92 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $10.b		; 00 10
	brk $33.b		; 00 33
	brk $38.b		; 00 38
	brk $06.b		; 00 06
	brk $41.b		; 00 41
	brk $04.b		; 00 04
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	jsr $320D.w		; 20 0D 32
	ora $0D22.w,X		; 1D 22 0D
	lda ($B7.b)		; B2 B7
	pha		; 48
	ora $047940.l		; 0F 40 79 04
	stz $00.b		; 64 00
	plp		; 28
	jsr $0004.w		; 20 04 00
	jsr $2920.w		; 20 20 29
	jsr $2028.w		; 20 28 20
	clc		; 18
	bra -56.b		; 80 C8
	brk $6B.b		; 00 6B
	sty $62.b		; 84 62
	sta $A857.w,X		; 9D 57 A8
	sbc $10AF00.l,X		; FF 00 AF 10
	sbc $EB12.w		; ED 12 EB
	trb $9E.b		; 14 9E
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $8000.w		; 20 00 80
	brk $60.b		; 00 60
	bra -128.b		; 80 80
	bpl -128.b		; 10 80
	jsr $5020.w		; 20 20 50
	bpl -88.b		; 10 A8
	pla		; 68
	bpl -112.b		; 10 90
	jsr $00F0.w		; 20 F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $0700.w,X		; 3C 00 07
	rts		; 60

	ora ($1E.b,X)		; 01 1E
	tsb $0000.w		; 0C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $13.b		; 00 13
	bpl -112.b		; 10 90
	brk $18.b		; 00 18
	sec		; 38
	trb $1C38.w		; 1C 38 1C
	sec		; 38
	php		; 08
	bmi  24.b		; 30 18
	bmi   8.b		; 30 08
	bpl  -9.b		; 10 F7
	php		; 08
	adc $98.b		; 65 98
	lda $003C00.l,X		; BF 00 3C 00
	bit $3800.w,X		; 3C 00 38
	brk $38.b		; 00 38
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	bra  96.b		; 80 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $88.b		; 00 88
	stz $00.b		; 64 00
	beq   0.b		; F0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FA.b		; 00 FA
	tsb $F1.b		; 04 F1
	brk $FA.b		; 00 FA
	sbc $00FFF1.l,X		; FF F1 FF 00
	tsb $0000.w		; 0C 00 00
	plx		; FA
	sbc $01FFF9.l,X		; FF F9 FF 01
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	sbc $FF.b,X		; F5 FF
	cop $0C.b		; 02 0C
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	cop $00.b		; 02 00
	ora $00.b		; 05 00
	bit $0504.w		; 2C 04 05
	brk $85.b		; 00 85
	brk $10.b		; 00 10
	brk $29.b		; 00 29
	bpl   4.b		; 10 04
	clc		; 18
	bpl  14.b		; 10 0E
	bpl  13.b		; 10 0D
	ora [$28.b],Y		; 17 28
	bit $2E43.w,X		; 3C 43 2E
	cmp ($BE.b),Y		; D1 BE
	brk $7F.b		; 00 7F
	brk $80.b		; 00 80
	brk $01.b		; 00 01
	ora ($11.b,X)		; 01 11
	ora ($21.b,X)		; 01 21
	brk $04.b		; 00 04
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	brk $79.b		; 00 79
	sty $8F.b		; 84 8F
	jsr $4AB5.w		; 20 B5 4A
	and [$88.b],Y		; 37 88
	bit $01.b		; 24 01
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$80.b		; C0 80
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra  96.b		; 80 60
	rti		; 40

	bra   2.b		; 80 02
	brk $02.b		; 00 02
	brk $F9.b		; 00 F9
	php		; 08
	sbc $F902.w,X		; FD 02 F9
	sbc $00FFFD.l,X		; FF FD FF 00
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	sbc $01FF.w,X		; FD FF 01
	tsb $0000.w		; 0C 00 00
	ora $33.b,S		; 03 33
	asl A		; 0A
	ora $0E3131.l		; 0F 31 31 0E
	brk $2B.b		; 00 2B
	rol A		; 2A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F0.b		; C0 F0
	bvs 117.b		; 70 75
	asl $F10E.w		; 0E 0E F1
	sbc ($2A.b),Y		; F1 2A
	rol A		; 2A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bpl  48.b		; 10 30
	tsb $8C.b		; 04 8C
	bcs -62.b		; B0 C2
	sbc $387D.w,X		; FD 7D 38
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bne -16.b		; D0 F0
	stz $FC.b,X		; 74 FC
	tsb $1D4E.w		; 0C 4E 1D
	ora $5858.w,X		; 1D 58 58
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	xce		; FB
	tsb $FD.b		; 04 FD
	ora ($FB.b,X)		; 01 FB
	sbc $00FFFD.l,X		; FF FD FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	sbc $01FF.w,X		; FD FF 01
	tsb $0000.w		; 0C 00 00
	tsb $086C.w		; 0C 6C 08
	ora $6464.w,X		; 1D 64 64
	eor $00014B.l		; 4F 4B 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -32.b		; 80 E0
.ACCU 8
.INDEX 8
	sep #$F7		; E2 F7
	tas		; 1B
	tas		; 1B
	pha		; 48
	pha		; 48
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rti		; 40

	rti		; 40

	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jsr ($FE02.w,X)		; FC 02 FE
	brk $FC.b		; 00 FC
	sbc $00FFFE.l,X		; FF FE FF 00
	tsb $0000.w		; 0C 00 00
	clc		; 18
	cli		; 58
	bvc  90.b		; 50 5A
	asl $0006.w,X		; 1E 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	cpy #$24.b		; C0 24
	rol $0202.w		; 2E 02 02
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
	tsb $0000.w		; 0C 00 00
	brk $70.b		; 00 70
	clv		; B8
	tya		; 98
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -16.b		; 80 F0
	dey		; 88
	dey		; 88
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
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	sbc $F808.w,Y		; F9 08 F8
	cop $F9.b		; 02 F9
	sbc $00FFFB.l,X		; FF FB FF 00
	tsb $0000.w		; 0C 00 00
	ora ($00.b,X)		; 01 00
	xce		; FB
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FF.b		; 00 FF
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $0000.w		; 0C 00 00
	brk $05.b		; 00 05
	ora ($08.b,X)		; 01 08
	adc $2810.w		; 6D 10 28
	ora ($F2.b),Y		; 11 F2
	ora $2E.b		; 05 2E
	cmp ($02.b),Y		; D1 02
	sbc ($BF.b),Y		; F1 BF
	lda $0F0007.l,X		; BF 07 00 0F
	ora ($7F.b,X)		; 01 7F
	adc $28FF.w		; 6D FF 28
	sbc $2EFFF2.l,X		; FF F2 FF 2E
	sbc $BFBF02.l,X		; FF 02 BF BF
	brk $E4.b		; 00 E4
	bra  56.b		; 80 38
	jmp ($1480.w)		; 6C 80 14
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	pla		; 68
	cop $42.b		; 02 42
	sbc $F5.b,X		; F5 F5
	jsr ($FC00.w,X)		; FC 00 FC
	bra  -4.b		; 80 FC
	jmp ($14FC.w)		; 6C FC 14
	jsr ($FCC0.w,X)		; FC C0 FC
	bra  -2.b		; 80 FE
	cop $F5.b		; 02 F5
	sbc $00.b,X		; F5 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $44.b		; 00 44
	plp		; 28
	iny		; C8
	jsl L002250.l		; 22 50 A2 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7C.b		; 00 7C
	mvp $C8,$FE		; 44 FE C8
	inc $0250.w,X		; FE 50 02
	brk $02.b		; 00 02
	brk $FB.b		; 00 FB
	ora $FA.b		; 05 FA
	ora ($FB.b,X)		; 01 FB
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	ora $00.b,S		; 03 00
	plx		; FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $0D.b		; 00 0D
	brk $06.b		; 00 06
	php		; 08
	tsb $01.b		; 04 01
	cmp [$20.b],Y		; D7 20
	rti		; 40

	bit $58.b		; 24 58
	lda [$08.b]		; A7 08
	inc $7F.b		; E6 7F
	adc $0F0D0F.l,X		; 7F 0F 0D 0F
	asl $1F.b		; 06 1F
	tsb $FF.b		; 04 FF
	cmp [$FF.b],Y		; D7 FF
	rti		; 40

	sbc $08FF58.l,X		; FF 58 FF 08
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	rti		; 40

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	jsr $C0C0.w		; 20 C0 C0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$40.b		; C0 40
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	cpx #$20.b		; E0 20
	cpy #$C0.b		; C0 C0
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	jsr ($FC03.w,X)		; FC 03 FC
	ora ($FC.b,X)		; 01 FC
	sbc $00FFFC.l,X		; FF FC FF 00
	tsb $0000.w		; 0C 00 00
	trb $0A.b		; 14 0A
	brk $3C.b		; 00 3C
	ldx $48.b,Y		; B6 48
	iny		; C8
	bmi   1.b		; 30 01
	cmp ($7C.b),Y		; D1 7C
	jmp ($0000.w,X)		; 7C 00 00
	brk $00.b		; 00 00
	asl $3E14.w,X		; 1E 14 3E
	brk $FE.b		; 00 FE
	ldx $FE.b,Y		; B6 FE
	iny		; C8
	sbc $7C7C01.l,X		; FF 01 7C 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $FD02.w,X		; FE 02 FD
	brk $FE.b		; 00 FE
	sbc $00FFFD.l,X		; FF FD FF 00
	tsb $0000.w		; 0C 00 00
	jsr $F800.w		; 20 00 F8
	brk $C0.b		; 00 C0
	bmi  -8.b		; 30 F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  32.b		; 30 20
	sed		; F8
	sed		; F8
	sed		; F8
	cpy #$F8.b		; C0 F8
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0C00FF.l,X		; FF FF 00 0C
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	plx		; FA
	php		; 08
	sbc [$01.b],Y		; F7 01
	plx		; FA
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	cop $00.b		; 02 00
	plx		; FA
	sbc $000C01.l,X		; FF 01 0C 00
	brk $FD.b		; 00 FD
	sbc $02FFF2.l,X		; FF F2 FF 02
	tsb $0000.w		; 0C 00 00
	and ($01.b)		; 32 01
	mvn $04,$29		; 54 29 04
	clc		; 18
	ora [$68.b],Y		; 17 68
	jmp $3AC020.l		; 5C 20 C0 3A
	cpx #$00.b		; E0 00
	eor $323F5F.l,X		; 5F 5F 3F 32
	adc $047F54.l,X		; 7F 54 7F 04
	sbc $5CFF17.l,X		; FF 17 FF 5C
	sbc $E0FFC0.l,X		; FF C0 FF E0
	eor $80005F.l,X		; 5F 5F 00 80
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $A0.b		; 00 A0
	rti		; 40

	brk $48.b		; 00 48
	tya		; 98
	asl $E44E.w		; 0E 4E E4
	cpx $80.b		; E4 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	rti		; 40

	sed		; F8
	pha		; 48
	inc $E40E.w,X		; FE 0E E4
	cpx $00.b		; E4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	bpl -80.b		; 10 B0
	rti		; 40

	bra  48.b		; 80 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	cpx #$F8.b		; E0 F8
	bcs  -4.b		; B0 FC
	bra   2.b		; 80 02
	brk $02.b		; 00 02
	brk $FC.b		; 00 FC
	asl $F9.b		; 06 F9
	brk $FC.b		; 00 FC
	sbc $00FFF9.l,X		; FF F9 FF 00
	tsb $0000.w		; 0C 00 00
	tsb $00.b		; 04 00
	sbc $01FF.w,Y		; F9 FF 01
	tsb $0000.w		; 0C 00 00
	sec		; 38
	brk $20.b		; 00 20
	clc		; 18
	pla		; 68
	tsb $10.b		; 04 10
	and ($3C.b,X)		; 21 3C
	cmp ($B2.b,X)		; C1 B2
	rti		; 40

	cpy #$02.b		; C0 02
	lda $383CBF.l,X		; BF BF 3C 38
	bit $7C20.w,X		; 3C 20 7C
	pla		; 68
	sbc $3CFF10.l,X		; FF 10 FF 3C
	sbc $C0FFB2.l,X		; FF B2 FF C0
	lda $0000BF.l,X		; BF BF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpx #$60.b		; E0 60
	rti		; 40

	rti		; 40

	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FB04.w,X		; FD 04 FB
	sbc $FBFFFD.l,X		; FF FD FF FB
	sbc $000C00.l,X		; FF 00 0C 00
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	clc		; 18
	jsr $E044.w		; 20 44 E0
	brk $83.b		; 00 83
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	rts		; 60

	sei		; 78
	rti		; 40

	jsr ($FC20.w,X)		; FC 20 FC
	cpx #$FF.b		; E0 FF
	sta $00.b,S		; 83 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $FD.b		; 02 FD
	brk $FE.b		; 00 FE
	sbc $00FFFD.l,X		; FF FD FF 00
	tsb $0000.w		; 0C 00 00
	brk $40.b		; 00 40
	rti		; 40

	bpl  64.b		; 10 40
	bra 120.b		; 80 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $F0.b		; 00 F0
	rti		; 40

	beq  64.b		; F0 40
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $0C.b		; 00 0C
	brk $00.b		; 00 00
	bra  64.b		; 80 40
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
	sbc $000C02.l,X		; FF 02 0C 00
	brk $05.b		; 00 05
	brk $FE.b		; 00 FE
	sbc $000C03.l,X		; FF 03 0C 00
	brk $02.b		; 00 02
	cop $04.b		; 02 04
	tsb $04.b		; 04 04
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
	ora $4819.w,Y		; 19 19 48
	pha		; 48
	tsb $04.b		; 04 04
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
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $BA.b		; 00 BA
	bpl -54.b		; 10 CA
	php		; 08
	lsr $BD02.w		; 4E 02 BD
	sta $0000.w,X		; 9D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	mvp $34,$44		; 44 44 34
	bit $32.b,X		; 34 32
	and ($9D.b)		; 32 9D
	sta $0000.w,X		; 9D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	ldy #$A0.b		; A0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	ldy #$A0.b		; A0 A0
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
	tsb $0000.w		; 0C 00 00
	sbc $00FF.w,X		; FD FF 00
	brk $01.b		; 00 01
	tsb $0000.w		; 0C 00 00
	bpl  16.b		; 10 10
	bpl  16.b		; 10 10
	cmp ($D2.b)		; D2 D2
	inc A		; 1A
	clc		; 18
	ror $EE78.w,X		; 7E 78 EE
	tay		; A8
	pla		; 68
	php		; 08
	and $0C01.w		; 2D 01 0C
	tsb $0808.w		; 0C 08 08
	php		; 08
	php		; 08
	bit $24.b		; 24 24
	bra -128.b		; 80 80
	bpl  16.b		; 10 10
	trb $14.b		; 14 14
	ora ($11.b),Y		; 11 11
	ldx $00BE.w,Y		; BE BE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BE.b		; 00 BE
	ldx $0000.w,Y		; BE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	sbc $FA03.w,X		; FD 03 FA
	brk $FD.b		; 00 FD
	sbc $00FFFA.l,X		; FF FA FF 00
	tsb $0000.w		; 0C 00 00
	jsr $A820.w		; 20 20 A8
	tay		; A8
	plp		; 28
	jsr $6070.w		; 20 70 60
	plp		; 28
	jsr $0C5C.w		; 20 5C 0C
	rol $36.b,X		; 36 36
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	bvc  80.b		; 50 50
	dey		; 88
	dey		; 88
	bvc  80.b		; 50 50
	bit $362C.w		; 2C 2C 36
	rol $00.b,X		; 36 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $0A.b		; 00 0A
	ora ($FC.b,X)		; 01 FC
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $000C00.l,X		; FF 00 0C 00
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	cpy #$40.b		; C0 40
	beq -16.b		; F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2020.w		; 20 20 20
	jsr $F0F0.w		; 20 F0 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $FE00.w		; 0D 00 FE
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $000C00.l,X		; FF 00 0C 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
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
	brk $04.b		; 00 04
	bra  16.b		; 80 10
	brk $F3.b		; 00 F3
	bpl -21.b		; 10 EB
	php		; 08
	sbc ($FF.b,S),Y		; F3 FF
	xba		; EB
	sbc $000E00.l,X		; FF 00 0E 00
	brk $03.b		; 00 03
	brk $EB.b		; 00 EB
	sbc $000E02.l,X		; FF 02 0E 00
	brk $F9.b		; 00 F9
	sbc $04FFFB.l,X		; FF FB FF 04
	asl $0000.w		; 0E 00 00
	ora #$00.b		; 09 00
	xce		; FB
	sbc $000E06.l,X		; FF 06 0E 00
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	asl $FCE3.w,X		; 1E E3 FC
	tsb $03.b		; 04 03
	ora [$00.b]		; 07 00
	asl $0D01.w		; 0E 01 0D
	cop $0D.b		; 02 0D
	cop $00.b		; 02 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $78.b		; 00 78
	sei		; 78
	jsr ($7F2F.w,X)		; FC 2F 7F
	sta $2FC73F.l,X		; 9F 3F C7 2F
	cmp $AB57.w,X		; DD 57 AB
	ora [$F9.b]		; 07 F9
	pld		; 2B
	dec $00.b,X		; D6 00
	brk $D0.b		; 00 D0
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $F2.b		; 00 F2
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	cpy #$C0.b		; C0 C0
	cpx #$C0.b		; E0 C0
	beq -32.b		; F0 E0
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
	brk $93.b		; 00 93
	jmp ($7EC5.w,X)		; 7C C5 7E
	cmp $63C429.l		; CF 29 C4 63
	lsr $21.b		; 46 21
	mvp $44,$63		; 44 63 44
	and [$46.b]		; 27 46
	adc $83.b,S		; 63 83
	brk $83.b		; 00 83
	brk $C6.b		; 00 C6
	brk $84.b		; 00 84
	brk $46.b		; 00 46
	brk $04.b		; 00 04
	brk $40.b		; 00 40
	brk $04.b		; 00 04
	brk $FC.b		; 00 FC
	stx $DC78.w		; 8E 78 DC
	sei		; 78
	jmp.w [$FE38]		; DC 38 FE
	brk $7E.b		; 00 7E
	trb $1E77.w		; 1C 77 1E
	sbc $7057AE.l		; EF AE 57 70
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $70.b		; 00 70
	brk $E8.b		; 00 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	clc		; 18
	tya		; 98
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	phd		; 0B
	tsb $0F.b		; 04 0F
	brk $0F.b		; 00 0F
	brk $0B.b		; 00 0B
	tsb $06.b		; 04 06
	ora ($06.b,X)		; 01 06
	ora ($02.b,X)		; 01 02
	ora $02.b,S		; 03 02
	ora $0F.b,S		; 03 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D7.b		; 00 D7
	pld		; 2B
	sta $7B.b		; 85 7B
	tad		; 5B
	ldy $FD.b		; A4 FD
	cop $FA.b		; 02 FA
	ora $9F.b		; 05 9F
	rts		; 60

	cmp $B15E30.l,X		; DF 30 5E B1
	jsr ($FE00.w,X)		; FC 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DF.b		; 00 DF
	brk $CF.b		; 00 CF
	brk $CF.b		; 00 CF
	brk $E0.b		; 00 E0
	bvs -32.b		; 70 E0
	beq -16.b		; F0 F0
	sei		; 78
	beq  -8.b		; F0 F8
	beq 120.b		; F0 78
	beq -72.b		; F0 B8
	beq  -8.b		; F0 F8
	beq 120.b		; F0 78
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

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
	brk $5E.b		; 00 5E
	adc $82FDDE.l,X		; 7F DE FD 82
	adc ($02.b,X)		; 61 02
	ora $06.b,S		; 03 06
	ora $04.b,S		; 03 04
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	trb $1C1E.w		; 1C 1E 1C
	.db $82, $00, $00		; 82 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	sbc [$00.b]		; E7 00
	and $F70F35.l,X		; 3F 35 0F F7
	sbc $F5F6FE.l		; EF FE F6 F5
	sbc $00.b,X		; F5 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $39.b		; 00 39
	ora ($F9.b,X)		; 01 F9
	sbc ($FA.b,X)		; E1 FA
	sbc ($F5.b)		; F2 F5
	sbc $00.b,X		; F5 00
	brk $00.b		; 00 00
	brk $E8.b		; 00 E8
	inx		; E8
	ror $FC7E.w,X		; 7E 7E FC
	jsr ($FEFE.w,X)		; FC FE FE
	sbc $6868FF.l,X		; FF FF 68 68
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pla		; 68
	pla		; 68
	ror $FC7E.w,X		; 7E 7E FC
	jsr ($FEFE.w,X)		; FC FE FE
	sbc $6868FF.l,X		; FF FF 68 68
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	tsb $F600.w		; 0C 00 F6
	tsb $06F0.w		; 0C F0 06
	inc $FF.b,X		; F6 FF
	beq  -1.b		; F0 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	plx		; FA
	sbc $020000.l,X		; FF 00 00 02
	asl $0000.w		; 0E 00 00
	asl A		; 0A
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	asl $0000.w		; 0E 00 00
	and [$39.b]		; 27 39
	cmp $11F2.w		; CD F2 11
	asl $0718.w		; 0E 18 07
	trb $0B.b		; 14 0B
	ora $0A.b,X		; 15 0A
	asl $1C01.w,X		; 1E 01 1C
	ora $06.b,S		; 03 06
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $C0.b		; 00 C0
	bvs -16.b		; 70 F0
	sed		; F8
	sed		; F8
	bit $7CBC.w,X		; 3C BC 7C
	bit $7CDE.w,X		; 3C DE 7C
	ldx $FE1C.w		; AE 1C FE
	inc $8007.w,X		; FE 07 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	brk $E0.b		; 00 E0
	brk $F8.b		; 00 F8
	brk $48.b		; 00 48
	adc $4E.b		; 65 4E
	adc $5C.b		; 65 5C
	adc $07F8DC.l,X		; 7F DC F8 07
	ora [$0F.b]		; 07 0F
	ora [$0B.b]		; 07 0B
	ora [$00.b]		; 07 00
	brk $08.b		; 00 08
	brk $0B.b		; 00 0B
	brk $18.b		; 00 18
	clc		; 18
	trb $0318.w		; 1C 18 03
	ora $0B.b,S		; 03 0B
	ora $0B.b,S		; 03 0B
	ora $00.b,S		; 03 00
	brk $60.b		; 00 60
	sed		; F8
	lda ($79.b),Y		; B1 79
	ror $07BE.w,X		; 7E BE 07
	sbc $F7BFFF.l,X		; FF FF BF F7
	sbc [$EE.b],Y		; F7 EE
	inc $0000.w		; EE 00 00
	brk $00.b		; 00 00
	sta ($01.b,X)		; 81 01
	lsr $06.b		; 46 06
	ora [$07.b]		; 07 07
	cmp $D7D78F.l		; CF 8F D7 D7
	inc $00EE.w		; EE EE 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	cpy #$C0.b		; C0 C0
	cpy #$E0.b		; C0 E0
	cpx #$80.b		; E0 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -64.b		; 80 C0
	cpy #$C0.b		; C0 C0
	cpy #$E0.b		; C0 E0
	cpx #$80.b		; E0 80
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
	brk $0F.b		; 00 0F
	bpl  27.b		; 10 1B
	tsb $0A.b		; 04 0A
	ora $0F08.w		; 0D 08 0F
	php		; 08
	ora [$0D.b]		; 07 0D
	ora $0C.b,S		; 03 0C
	asl $04.b		; 06 04
	cop $1F.b		; 02 1F
	brk $1B.b		; 00 1B
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $DE.b		; 00 DE
	and $FE17EE.l		; 2F EE 17 FE
	sta $7E97EE.l		; 8F EE 97 7E
	lda $DC.b,S		; A3 DC
	rol $8C.b,X		; 36 8C
	adc $F01FC0.l,X		; 7F C0 1F F0
	brk $F8.b		; 00 F8
	brk $70.b		; 00 70
	brk $78.b		; 00 78
	brk $5C.b		; 00 5C
	brk $C8.b		; 00 C8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora #$F4.b		; 09 F4
	tsb $FA.b		; 04 FA
	sbc $00FFF4.l,X		; FF F4 FF 00
	asl $0000.w		; 0E 00 00
	sbc $0004FF.l,X		; FF FF 04 00
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	stz $4FEB.w,X		; 9E EB 4F
	and ($67.b,S),Y		; 33 67
	ora $3D43.w,Y		; 19 43 3D
	and [$49.b],Y		; 37 49
	adc $1A.b		; 65 1A
	jmp ($7703.w,X)		; 7C 03 77
	php		; 08
	trb $00.b		; 14 00
	jmp ($7E00.w,X)		; 7C 00 7E
	brk $7E.b		; 00 7E
	brk $7E.b		; 00 7E
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $77.b		; 00 77
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	cpy #$C0.b		; C0 C0
	rti		; 40

	cpy #$60.b		; C0 60
	cpy #$60.b		; C0 60
	cpy #$E0.b		; C0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	lda ($33.b,S),Y		; B3 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda ($33.b,S),Y		; B3 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $3D.b		; 26 3D
	and [$1D.b]		; 27 1D
	and $13041B.l		; 2F 1B 04 13
	tsb $17.b		; 04 17
	tsb $2C1F.w		; 0C 1F 2C
	rol $0301.w,X		; 3E 01 03
	ora ($00.b,S),Y		; 13 00
	jsl $002400.l		; 22 00 24 00
	tsb $00.b		; 04 00
	ora ($00.b,X)		; 01 00
	tsb $0C0C.w		; 0C 0C 0C
	tsb $0101.w		; 0C 01 01
	cpy #$60.b		; C0 60
	cpy #$40.b		; C0 40
	cpy #$40.b		; C0 40
	brk $E0.b		; 00 E0
	pla		; 68
	sed		; F8
	ply		; 7A
	tsx		; BA
	ora $FFBFFF.l		; 0F FF BF FF
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	dey		; 88
	php		; 08
	lsr A		; 4A
	asl A		; 0A
	eor $9FDF0F.l		; 4F 0F DF 9F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $00.b,S		; 03 00
	xce		; FB
	ora $F8.b		; 05 F8
	cop $FB.b		; 02 FB
	sbc $00FFF8.l,X		; FF F8 FF 00
	asl $0000.w		; 0E 00 00
	sbc $00FF.w,X		; FD FF 00
	brk $01.b		; 00 01
	asl $0000.w		; 0E 00 00
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	ldy $4CCC.w,X		; BC CC 4C
	rol $76.b,X		; 36 76
	asl A		; 0A
	ror $1A.b		; 66 1A
	eor ($2E.b)		; 52 2E
	asl A		; 0A
	rol $3E.b,X		; 36 3E
	asl $0E20.w,X		; 1E 20 0E
	bmi   0.b		; 30 00
	sei		; 78
	brk $7C.b		; 00 7C
	brk $7C.b		; 00 7C
	brk $5C.b		; 00 5C
	brk $0C.b		; 00 0C
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $89.b		; 00 89
	lda $C3.b,X		; B5 C3
	sbc $00331B.l		; EF 1B 33 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $19.b		; 00 19
	ora ($4B.b,X)		; 01 4B
	eor $1B.b,S		; 43 1B
	ora ($00.b,S),Y		; 13 00
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
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $FE.b		; 00 FE
	cop $FC.b		; 02 FC
	brk $FE.b		; 00 FE
	sbc $00FFFC.l,X		; FF FC FF 00
	asl $0000.w		; 0E 00 00
	ldy #$60.b		; A0 60
	ldy #$40.b		; A0 40
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	pha		; 48
	cli		; 58
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	jsr $0000.w		; 20 00 00
	brk $48.b		; 00 48
	pha		; 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	sbc $F012.w		; ED 12 F0
	ora $ED.b,S		; 03 ED
	sbc $00FFF4.l,X		; FF F4 FF 00
	asl $0000.w		; 0E 00 00
	sbc $F4FF.w,X		; FD FF F4
	sbc $000E02.l,X		; FF 02 0E 00
	brk $0D.b		; 00 0D
	brk $F4.b		; 00 F4
	sbc $000E04.l,X		; FF 04 0E 00
	brk $EF.b		; 00 EF
	sbc $06FFE4.l,X		; FF E4 FF 06
	asl $0000.w		; 0E 00 00
	sbc $FFE4FF.l,X		; FF FF E4 FF
	php		; 08
	asl $0000.w		; 0E 00 00
	cpy #$21.b		; C0 21
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp.w [$DAAB]		; DC AB DA
	and $F7.b,X		; 35 F7
	tax		; AA
	sbc $5FFF09.l,X		; FF 09 FF 5F
	sbc $0FFC2E.l,X		; FF 2E FC 0F
	jsr ($236C.w,X)		; FC 6C 23
	mvn $CA,$25		; 54 25 CA
	php		; 08
	eor $00.b,X		; 55 00
	inc $00.b,X		; F6 00
	ldy #$00.b		; A0 00
	cmp ($00.b),Y		; D1 00
	beq   0.b		; F0 00
	bcc -95.b		; 90 A1
	eor $DB3BE6.l,X		; 5F E6 3B DB
	lda [$FF.b],Y		; B7 FF
	lda $FF.b,S		; A3 FF
	lsr $7EF3.w		; 4E F3 7E
	ora [$FC.b]		; 07 FC
	asl $01.b		; 06 01
	lsr $19A0.w,X		; 5E A0 19
	cpy $24.b		; C4 24
	pha		; 48
	brk $5C.b		; 00 5C
	brk $B1.b		; 00 B1
	brk $81.b		; 00 81
	brk $03.b		; 00 03
	brk $06.b		; 00 06
	sei		; 78
	stx $B7CC.w		; 8E CC B7
	dec $BB.b		; C6 BB
	dex		; CA
	sbc $DF.b,X		; F5 DF
	sbc #$9E.b		; E9 9E
	ply		; 7A
	sta $1FF4.w,X		; 9D F4 1F
	jmp.w [$7080]		; DC 80 70
	bmi  72.b		; 30 48
	clc		; 18
	mvp $0A,$14		; 44 14 0A
	brk $16.b		; 00 16
	ora ($84.b,X)		; 01 84
	cop $09.b		; 02 09
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	bra  32.b		; 80 20
	cpy #$30.b		; C0 30
	ldy #$58.b		; A0 58
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	bra  64.b		; 80 40
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cop $01.b		; 02 01
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	cmp $000100.l,X		; DF 00 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sec		; 38
	cpy #$40.b		; C0 40
	cpx #$20.b		; E0 20
	beq -16.b		; F0 F0
	and $3FBD.w,X		; 3D BD 3F
	sbc $003313.l,X		; FF 13 33 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	brk $05.b		; 00 05
	ora $27.b		; 05 27
	and [$13.b]		; 27 13
	ora ($00.b,S),Y		; 13 00
	brk $03.b		; 00 03
	cop $01.b		; 02 01
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $E0.b,S		; 03 E0
	inc $F9.b		; E6 F9
	sbc $08BFBF.l,X		; FF BF BF 08
	php		; 08
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	sbc $BFF9.w,Y		; F9 F9 BF
	lda $0E0808.l,X		; BF 08 08 0E
	cmp $C14383.l		; CF 83 43 C1
	cmp ($C1.b,X)		; C1 C1
	sbc ($60.b,X)		; E1 60
	rts		; 60

	sbc $FCFCFF.l,X		; FF FF FC FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $FCFC9F.l,X		; 9F 9F FC FC
	brk $00.b		; 00 00
	bpl  -8.b		; 10 F8
	bcc -24.b		; 90 E8
	bne  56.b		; D0 38
	cpy #$B0.b		; C0 B0
	cpx #$F0.b		; E0 F0
	cpx $F8EC.w		; EC EC F8
	sed		; F8
	rts		; 60

	rts		; 60

	jsr $1000.w		; 20 00 10
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $00.b		; 00 00
	sty $F88C.w		; 8C 8C F8
	sed		; F8
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
	and $3EC101.l,X		; 3F 01 C1 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $3E.b		; 00 3E
	brk $C1.b		; 00 C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $20DF00.l,X		; 7F 00 DF 20
	sbc $8112.w		; ED 12 81
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	jsr $12DF.w		; 20 DF 12
	sbc $817E.w		; ED 7E 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($3C00.w,X)		; FC 00 3C
	cmp $DF.b,S		; C3 DF
	bcs 121.b		; B0 79
	sta $000000.l		; 8F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($3CC0.w,X)		; FC C0 3C
	jsr $864F.w		; 20 4F 86
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpx #$C0.b		; E0 C0
	bcs   0.b		; B0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	cop $80.b		; 02 80
	php		; 08
	brk $F1.b		; 00 F1
	asl $03F4.w		; 0E F4 03
	sbc ($FF.b),Y		; F1 FF
	pea $00FF.w		; F4 FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	pea $02FF.w		; F4 FF 02
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	ora $1E6101.l,X		; 1F 01 61 1E
	sta $46.b,S		; 83 46
	ora [$02.b]		; 07 02
	ora [$00.b]		; 07 00
	ora [$01.b]		; 07 01
	ora [$00.b]		; 07 00
	brk $01.b		; 00 01
	brk $1E.b		; 00 1E
	brk $61.b		; 00 61
	brk $81.b		; 00 81
	brk $05.b		; 00 05
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	ldy $D743.w,X		; BC 43 D7
	rol A		; 2A
	ora $FA.b		; 05 FA
	nop		; EA
	eor $BD.b,X		; 55 BD
	tad		; 5B
	sbc $F4FF4A.l,X		; FF 4A FF F4
	sbc $BC4377.l,X		; FF 77 43 BC
	plp		; 28
	cmp $FA.b,X		; D5 FA
	ora $15.b		; 05 15
	tax		; AA
	.db $42, $A4		; 42 A4
	brk $B5.b		; 00 B5
	brk $0B.b		; 00 0B
	brk $88.b		; 00 88
	cpx #$1C.b		; E0 1C
	beq -114.b		; F0 8E
	cpy $2E7B.w		; CC 7B 2E
	sbc ($71.b,S),Y		; F3 71
	inc $7DF2.w,X		; FE F2 7D
	sbc [$DA.b],Y		; F7 DA
	adc [$CE.b],Y		; 77 CE
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	bmi -124.b		; 30 84
	bne  12.b		; D0 0C
	stx $01.b		; 86 01
	ora $82.b		; 05 82
	brk $25.b		; 00 25
	brk $31.b		; 00 31
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	bra -32.b		; 80 E0
	rti		; 40

	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	rti		; 40

	ora $01.b,S		; 03 01
	ora $04.b,S		; 03 04
	ora [$09.b]		; 07 09
	ora [$08.b]		; 07 08
	brk $0E.b		; 00 0E
	brk $BF.b		; 00 BF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$60.b		; E0 60
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FFEE.w		; EE EE FF
	sbc $009B9B.l,X		; FF 9B 9B 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2E.b		; 00 2E
	rol $3F3F.w		; 2E 3F 3F
	txy		; 9B
	txy		; 9B
	brk $00.b		; 00 00
	cmp [$37.b]		; C7 37
	adc $53.b,S		; 63 53
	bmi  32.b		; 30 20
	bpl 112.b		; 10 70
	php		; 08
	iny		; C8
	and $FFFFFF.l,X		; 3F FF FF FF
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $20.b		; 00 20
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and [$37.b],Y		; 37 37
	sbc $0000FF.l,X		; FF FF 00 00
	bne  40.b		; D0 28
	brk $F8.b		; 00 F8
	cpy #$F8.b		; C0 F8
	cpx #$98.b		; E0 98
	bvs 112.b		; 70 70
	jsr ($78FC.w,X)		; FC FC 78
	sei		; 78
	bmi  48.b		; 30 30
	bvs -128.b		; 70 80
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	cpy $78CC.w		; CC CC 78
	sei		; 78
	bmi  48.b		; 30 30
	cop $80.b		; 02 80
	php		; 08
	brk $F5.b		; 00 F5
	asl A		; 0A
	sbc [$02.b],Y		; F7 02
	sbc $FF.b,X		; F5 FF
	sbc [$FF.b],Y		; F7 FF
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc [$FF.b],Y		; F7 FF
	cop $0E.b		; 02 0E
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	mvp $8F,$3B		; 44 3B 8F
	php		; 08
	ora $070F08.l		; 0F 08 0F 07
	ora $050F01.l		; 0F 01 0F 05
	tsb $0014.w		; 0C 14 00
	ora [$03.b]		; 07 03
	mvp $87,$00		; 44 00 87
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $0E.b		; 00 0E
	brk $0A.b		; 00 0A
	brk $08.b		; 00 08
	cpy $1933.w		; CC 33 19
	sbc [$65.b]		; E7 65
	stz $FFD6.w,X		; 9E D6 FF
	inc $F68B.w,X		; FE 8B F6
	lda $0608.w,Y		; B9 08 06
	asl $04.b		; 06 04
	bmi -52.b		; 30 CC
	inc $18.b		; E6 18
	txs		; 9A
	adc ($28.b,X)		; 61 28
	brk $00.b		; 00 00
	stz $00.b,X		; 74 00
	lsr $00.b		; 46 00
	php		; 08
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	rti		; 40

	ldy #$E0.b		; A0 E0
	bcs -64.b		; B0 C0
	dey		; 88
	inx		; E8
	pei ($20.b)		; D4 20
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  64.b		; 80 40
	brk $40.b		; 00 40
	bmi  64.b		; 30 40
	clc		; 18
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
	brk $00.b		; 00 00
	tsb $0310.w		; 0C 10 03
	tas		; 1B
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora ($01.b,X)		; 01 01
	cop $02.b		; 02 02
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $06.b		; 02 06
	adc ($69.b,X)		; 61 69
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	rts		; 60

	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  44.b		; 30 2C
	clc		; 18
	clc		; 18
	jmp.w [$18DC]		; DC DC 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	jmp.w [$18DC]		; DC DC 18
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	sbc $FA07.w,Y		; F9 07 FA
	ora ($F9.b,X)		; 01 F9
	sbc $00FFFA.l,X		; FF FA FF 00
	asl $0000.w		; 0E 00 00
	ora ($00.b,X)		; 01 00
	plx		; FA
	sbc $000E01.l,X		; FF 01 0E 00
	brk $7F.b		; 00 7F
	bpl  24.b		; 10 18
	lda $3F083F.l		; AF 3F 08 3F
	ora $302818.l		; 0F 18 28 30
	brk $0F.b		; 00 0F
	adc $000000.l,X		; 7F 00 00 00
	adc $001007.l		; 6F 07 10 00
	and [$00.b],Y		; 37 00
	bmi   0.b		; 30 00
	bpl   0.b		; 10 00
	bmi   7.b		; 30 07
	ora [$00.b]		; 07 00
	brk $C0.b		; 00 C0
	jsr $D020.w		; 20 20 D0
	cpy #$F8.b		; C0 F8
	sed		; F8
	ldy $90.b		; A4 90
	jmp.w [$C448]		; DC 48 C4
	ror $04FE.w,X		; 7E FE 04
	tsb $00.b		; 04 00
	cpy #$C0.b		; C0 C0
	jsr $0030.w		; 20 30 00
	brk $58.b		; 00 58
	tsb $00.b		; 04 00
	brk $08.b		; 00 08
	ply		; 7A
	ply		; 7A
	tsb $04.b		; 04 04
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	inc $FD03.w,X		; FE 03 FD
	sbc $FDFFFE.l,X		; FF FE FF FD
	sbc $000E00.l,X		; FF 00 0E 00
	brk $80.b		; 00 80
	sei		; 78
	sed		; F8
	stz $90.b		; 64 90
	trb $00.b		; 14 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	bra   0.b		; 80 00
	tya		; 98
	brk $80.b		; 00 80
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
	.db $FF		; Opcode FF overrunning bank boundry at 0A7FFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0A7FFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0A7FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0A7FFF. Skipping.
.ENDS
