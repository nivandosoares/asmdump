.BANK 28 SLOT 0
.ORG $0000

.SECTION "Bank28" FORCE

	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	cmp $FFEF1A.l,X		; DF 1A EF FF
	cmp $FFF1FF.l,X		; DF FF F1 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	cmp $FFF9FF.l,X		; DF FF F9 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	beq  -1.b		; F0 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	sed		; F8
	sbc $000403.l,X		; FF 03 04 00
	brk $EF.b		; 00 EF
	sbc $04FFEF.l,X		; FF EF FF 04
	tsb $00.b		; 04 00
	brk $EF.b		; 00 EF
	sbc $05FFF7.l,X		; FF F7 FF 05
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $06FFEF.l,X		; FF EF FF 06
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $07FFF7.l,X		; FF F7 FF 07
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $08FFFF.l,X		; FF FF FF 08
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $09FFEF.l,X		; FF EF FF 09
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $0AFFF7.l,X		; FF F7 FF 0A
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $EF.b		; 00 EF
	sbc $00040B.l,X		; FF 0B 04 00
	brk $07.b		; 00 07
	brk $F7.b		; 00 F7
	sbc $00040C.l,X		; FF 0C 04 00
	brk $0F.b		; 00 0F
	brk $F1.b		; 00 F1
	sbc $00040D.l,X		; FF 0D 04 00
	brk $0F.b		; 00 0F
	brk $F9.b		; 00 F9
	sbc $00040E.l,X		; FF 0E 04 00
	brk $17.b		; 00 17
	brk $F4.b		; 00 F4
	sbc $00040F.l,X		; FF 0F 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($B7.b,X)		; 01 B7
	eor $004FB7.l		; 4F B7 4F 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $47.b		; 00 47
	sbc $FFFF47.l,X		; FF 47 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sei		; 78
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $3B.b		; 05 3B
	ora ($0E.b,X)		; 01 0E
	ora $070707.l		; 0F 07 07 07
	ora ($03.b,X)		; 01 03
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $063F00.l,X		; FF 00 3F 06
	ora $0F0F01.l		; 0F 01 0F 0F
	ora [$07.b]		; 07 07
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $BF.b		; 00 BF
	sbc $FCFFFC.l,X		; FF FC FF FC
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $00FF00.l		; 0F 00 FF 00
	ldy $FE40.w,X		; BC 40 FE
	sbc $FFFFFE.l,X		; FF FE FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FAE712.l,X		; FF 12 E7 FA
	adc $FFDF.w,X		; 7D DF FF
	cld		; D8
	sed		; F8
	cpx #$40F0.w		; E0 F0 40
	cpx #$00FF.w		; E0 FF 00
	sbc $1CFF00.l,X		; FF 00 FF 1C
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
	cpx #$00E0.w		; E0 E0 00
	brk $03.b		; 00 03
	adc $00FF00.l,X		; 7F 00 FF 00
	inc $48B0.w,X		; FE B0 48
	bcs  72.b		; B0 48
	ora ($00.b,X)		; 01 00
	sbc $7FE8.w,Y		; F9 E8 7F
	brk $FC.b		; 00 FC
	brk $C0.b		; 00 C0
	brk $01.b		; 00 01
	brk $47.b		; 00 47
	beq  71.b		; F0 47
	beq  -1.b		; F0 FF
	brk $F7.b		; 00 F7
	brk $FA.b		; 00 FA
	sbc $0F0F.w,Y		; F9 0F 0F
	asl A		; 0A
	sbc ($02.b),Y		; F1 02
	sbc $FEC1.w,X		; FD C1 FE
	sbc ($FF.b,S),Y		; F3 FF
	phd		; 0B
	ora [$01.b]		; 07 01
	ora ($FF.b,X)		; 01 FF
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $010F0F.l,X		; FF 0F 0F 01
	ora ($1F.b,X)		; 01 1F
	ora $06FDF1.l,X		; 1F F1 FD 06
	inc $00.b,X		; F6 00
	ora $FE0000.l		; 0F 00 00 FE
	brk $99.b		; 00 99
	phy		; 5A
	ror $FF.b		; 66 FF
	cpx #$0E00.w		; E0 00 0E
	brk $19.b		; 00 19
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DB.b		; 00 DB
	bit $7EFF.w,X		; 3C FF 7E
	.db $42, $66		; 42 66
	lda #$D3.b		; A9 D3
	xba		; EB
	sta $D5.b		; 85 D5
	lda #$EB.b		; A9 EB
	sta $A9.b		; 85 A9
	cmp ($DA.b,S),Y		; D3 DA
	sbc [$E6.b]		; E7 E6
	inc $FF7E.w,X		; FE 7E FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $7EFE.w,X		; FE FE 7E
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	sbc $043727.l,X		; FF 27 37 04
	rts		; 60

	brk $FD.b		; 00 FD
	cop $02.b		; 02 02
	ora ($01.b,X)		; 01 01
	sbc ($01.b,X)		; E1 01
	sbc $000001.l,X		; FF 01 00 00
	sbc $34EC27.l,X		; FF 27 EC 34
	brk $02.b		; 00 02
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $FFFF80.l,X		; 7F 80 FF FF
	clc		; 18
	sbc $87FF88.l		; EF 88 FF 87
	sed		; F8
	asl $001F.w,X		; 1E 1F 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	php		; 08
	sbc $00FF08.l,X		; FF 08 FF 00
	ora $00001F.l,X		; 1F 1F 00 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	stz $039E.w,X		; 9E 9E 03
	ora $0F.b,S		; 03 0F
	sbc $001F00.l		; EF 00 1F 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	bra   2.b		; 80 02
	brk $1F.b		; 00 1F
	ora $FF00E0.l		; 0F E0 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	bra 127.b		; 80 7F
	sbc $F8FF00.l,X		; FF 00 FF F8
	ora [$00.b]		; 07 00
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
	brk $E0.b		; 00 E0
	cpx #$F8F8.w		; E0 F8 F8
	ldx $66.b,Y		; B6 66
	eor ($47.b),Y		; 51 47
	and $2D0327.l		; 2F 27 03 2D
	rep #$49		; C2 49
	jsr ($6042.w,X)		; FC 42 60
	rts		; 60

	cpx #$98E0.w		; E0 E0 98
	brk $BE.b		; 00 BE
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora $C30FFF.l		; 0F FF 0F C3
	pea $F20D.w		; F4 0D F2
	ora $F9.b		; 05 F9
	and $3C1E7E.l,X		; 3F 7E 1E 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $7F7F0F.l,X		; FF 0F 7F 7F
	rol $003E.w,X		; 3E 3E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  96.b		; 80 60
	cpx #$2020.w		; E0 20 20
	bcs -112.b		; B0 90
	bra -96.b		; 80 A0
	ldy #$8080.w		; A0 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	bra -32.b		; 80 E0
	bra -128.b		; 80 80
	bra   9.b		; 80 09
	bra  36.b		; 80 24
	brk $D5.b		; 00 D5
	jsl $D5FFEA.l		; 22 EA FF D5
	sbc $00FFEC.l,X		; FF EC FF 00
	tsb $00.b		; 04 00
	brk $D5.b		; 00 D5
	sbc $02FFFC.l,X		; FF FC FF 02
	tsb $00.b		; 04 00
	brk $E5.b		; 00 E5
	sbc $04FFEA.l,X		; FF EA FF 04
	tsb $00.b		; 04 00
	brk $E5.b		; 00 E5
	sbc $06FFFA.l,X		; FF FA FF 06
	tsb $00.b		; 04 00
	brk $F5.b		; 00 F5
	sbc $08FFEA.l,X		; FF EA FF 08
	tsb $00.b		; 04 00
	brk $F5.b		; 00 F5
	sbc $0AFFFA.l,X		; FF FA FF 0A
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $EA.b		; 00 EA
	sbc $00040C.l,X		; FF 0C 04 00
	brk $05.b		; 00 05
	brk $FA.b		; 00 FA
	sbc $00040E.l,X		; FF 0E 04 00
	brk $15.b		; 00 15
	brk $ED.b		; 00 ED
	sbc $000420.l,X		; FF 20 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $48.b,S		; 03 48
	bit $16.b,X		; 34 16
	adc #$4D.b		; 69 4D
	and ($FF.b)		; 32 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	brk $A7.b		; 00 A7
	sei		; 78
	ldy $7B.b		; A4 7B
	ldy $7B.b		; A4 7B
	sbc $000000.l,X		; FF 00 00 00
	cop $01.b		; 02 01
	bra 127.b		; 80 7F
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000100.l,X		; FF 00 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $030100.l,X		; FF 00 01 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $FFFF.w,X		; FE FF FF
	sbc $18FF7E.l,X		; FF 7E FF 18
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3C3CFF.l,X		; FF FF 3C 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	ora [$01.b]		; 07 01
	inc $EF18.w,X		; FE 18 EF
	cpx #$0800.w		; E0 00 08
	ora [$D5.b]		; 07 D5
	dex		; CA
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	beq   0.b		; F0 00
	sbc $0FF200.l,X		; FF 00 F2 0F
	sbc ($EF.b)		; F2 EF
	brk $00.b		; 00 00
	jsr $071F.w		; 20 1F 07
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $901F1F.l,X		; FF 1F 1F 90
	bvc  80.b		; 50 50
	bcc  31.b		; 90 1F
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $2F.b		; 00 2F
	cpy #$C02F.w		; C0 2F C0
	inc $8F.b,X		; F6 8F
	sbc $00E3.w,X		; FD E3 00
	sbc $008000.l,X		; FF 00 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $FFFFFE.l,X		; FF FE FF FF
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc ($FF.b,X)		; E1 FF
	ora [$FF.b]		; 07 FF
	ora [$0F.b]		; 07 0F
	ora ($03.b,X)		; 01 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $0F0FFF.l,X		; FF FF 0F 0F
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	adc $C6F8BC.l,X		; 7F BC F8 C6
	sbc ($F3.b,S),Y		; F3 F3
	asl $FFFE.w,X		; 1E FE FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FE.b		; 00 FE
	brk $C3.b		; 00 C3
	brk $3F.b		; 00 3F
	brk $0C.b		; 00 0C
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $C04980.l,X		; FF 80 49 C0
	jmp.w [$8C88]		; DC 88 8C
	php		; 08
	ora $00FFFF.l		; 0F FF FF 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	tsb $7D.b		; 04 7D
	asl $0EFF.w		; 0E FF 0E
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C6.b,X		; F5 C6
	sed		; F8
	dec $D1.b,X		; D6 D1
	cpx $F9E7.w		; EC E7 F9
	sbc $FF7EFF.l,X		; FF FF 7E FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $FD.b,S		; 63 FD
	rts		; 60

	sbc $80C381.l,X		; FF 81 C3 80
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	cpy #$C0FF.w		; C0 FF C0
	cmp $C3.b,S		; C3 C3
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sed		; F8
	sed		; F8
	brk $40.b		; 00 40
	ora $FFFF0F.l		; 0F 0F FF FF
	bmi  32.b		; 30 20
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	inc $F8F8.w,X		; FE F8 F8
	sed		; F8
	bra  64.b		; 80 40
	cmp $00200F.l		; CF 0F 20 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	beq -16.b		; F0 F0
	jmp ($1F7C.w,X)		; 7C 7C 1F
	ora $8FFFFE.l,X		; 1F FE FF 8F
	sbc ($0D.b),Y		; F1 0D
	asl $0101.w		; 0E 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $18.b		; 00 18
	brk $FF.b		; 00 FF
	sbc $F1000F.l,X		; FF 0F 00 F1
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $78.b		; 00 78
	beq -64.b		; F0 C0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $78F800.l,X		; FF 00 F8 78
	cpx #$00E0.w		; E0 E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	ora $000000.l,X		; 1F 00 00 00
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
	brk $FC.b		; 00 FC
	jsr ($7F7F.w,X)		; FC 7F 7F
	brk $00.b		; 00 00
	sbc $330E00.l,X		; FF 00 0E 33
	ora $1C.b,S		; 03 1C
	brk $07.b		; 00 07
	ora $03.b,S		; 03 03
	jsr ($7F7B.w,X)		; FC 7B 7F
	bit $00FF.w,X		; 3C FF 00
	sbc $0C3F00.l,X		; FF 00 3F 0C
	ora $000703.l,X		; 1F 03 07 00
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FC1F00.l,X		; FF 00 1F FC
	cmp $7E.b,S		; C3 7E
	adc [$8F.b],Y		; 77 8F
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $7FFF81.l,X		; FF 81 FF 7F
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
	cld		; D8
	cmp [$FF.b]		; C7 FF
	brk $1F.b		; 00 1F
	ora $00FFFF.l,X		; 1F FF FF 00
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	sbc $F23FD0.l,X		; FF D0 3F F2
	sbc $1F00FF.l		; EF FF 00 1F
	sbc $FF07FF.l		; EF FF 07 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	cpx #$5093.w		; E0 93 50
	sbc [$10.b],Y		; F7 10
	xce		; FB
	cld		; D8
	jsr ($07EC.w,X)		; FC EC 07
	brk $C7.b		; 00 C7
	brk $22.b		; 00 22
	cmp ($08.b,X)		; C1 08
	sbc ($2F.b),Y		; F1 2F
	cpy #$00EF.w		; C0 EF 00
	sbc [$80.b]		; E7 80
	sbc ($C0.b,S),Y		; F3 C0
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
	cpx #$BE1F.w		; E0 1F BE
	ror $7FFF.w,X		; 7E FF 7F
	adc $E4D3F1.l		; 6F F1 D3 E4
	jmp.w [$F1D7]		; DC D7 F1
	dec $EC.b		; C6 EC
	cmp [$FF.b]		; C7 FF
	brk $FE.b		; 00 FE
	and $FF7FFF.l,X		; 3F FF 7F FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FBFFFF.l,X		; FF FF FF FB
	sbc $FF00F0.l,X		; FF F0 00 FF
	bra  -1.b		; 80 FF
	cpy #$BFBF.w		; C0 BF BF
	cpy #$C0FF.w		; C0 FF C0
	ror $FD43.w,X		; 7E 43 FD
	adc $FD.b,S		; 63 FD
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0BF80.l,X		; FF 80 BF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C1FFC0.l,X		; FF C0 FF C1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	bcc  16.b		; 90 10
	sbc $F8FF10.l,X		; FF 10 FF F8
	ora $0808F8.l		; 0F F8 08 08
	sbc [$0F.b],Y		; F7 0F
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$FF00.w		; E0 00 FF
	brk $FF.b		; 00 FF
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpx #$20E0.w		; E0 E0 20
	jmp.w [$E3DC]		; DC DC E3
	adc $A2.b,S		; 63 A2
	lda ($2F.b,X)		; A1 2F
	and [$5F.b]		; 27 5F
	eor $C05942.l		; 4F 42 59 C0
	cpx #$C0C0.w		; E0 C0 C0
	cpx #$BC00.w		; E0 00 BC
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	rti		; 40

	beq -80.b		; F0 B0
	sed		; F8
	cld		; D8
	cpx $00CC.w		; EC CC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	bra -16.b		; 80 F0
	cpy #$928E.w		; C0 8E 92
	sbc ($88.b),Y		; F1 88
	sta [$81.b],Y		; 97 81
	pea $1AE1.w		; F4 E1 1A
	inc $0D.b		; E6 0D
	beq -49.b		; F0 CF
	sbc $77EA.w,Y		; F9 EA 77
	sbc $1FFF0F.l,X		; FF 0F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	mvp $4C,$E4		; 44 E4 4C
	rts		; 60

	bvc 108.b		; 50 6C
	jmp $E04060.l		; 5C 60 40 E0
	cpy #$0080.w		; C0 80 00
	bra   0.b		; 80 00
	brk $F8.b		; 00 F8
	cpy #$C0FC.w		; C0 FC C0
	jsr ($FCC0.w,X)		; FC C0 FC
	cpy #$C0FC.w		; C0 FC C0
	cpy #$80C0.w		; C0 C0 80
	bra   0.b		; 80 00
	brk $0C.b		; 00 0C
	bra  48.b		; 80 30
	brk $CA.b		; 00 CA
	and #$E5.b		; 29 E5
	brk $CA.b		; 00 CA
	sbc $00FFE5.l,X		; FF E5 FF 00
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $02FFE5.l,X		; FF E5 FF 02
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $04FFE5.l,X		; FF E5 FF 04
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $06FFE5.l,X		; FF E5 FF 06
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $E5.b		; 00 E5
	sbc $000408.l,X		; FF 08 04 00
	brk $1A.b		; 00 1A
	brk $E5.b		; 00 E5
	sbc $00040A.l,X		; FF 0A 04 00
	brk $CA.b		; 00 CA
	sbc $0CFFF5.l,X		; FF F5 FF 0C
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $0EFFF5.l,X		; FF F5 FF 0E
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $20FFF5.l,X		; FF F5 FF 20
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $22FFF5.l,X		; FF F5 FF 22
	tsb $00.b		; 04 00
	brk $0A.b		; 00 0A
	brk $F5.b		; 00 F5
	sbc $000424.l,X		; FF 24 04 00
	brk $1A.b		; 00 1A
	brk $F5.b		; 00 F5
	sbc $000426.l,X		; FF 26 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $53.b		; 00 53
	adc $0000.w		; 6D 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $003F00.l		; 0F 00 3F 00
	php		; 08
	rol $0000.w,X		; 3E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi  14.b		; 30 0E
	bra 126.b		; 80 7E
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rol $FE01.w,X		; 3E 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	ora ($C0.b,X)		; 01 C0
	and $01FF00.l,X		; 3F 00 FF 01
	inc $FFFF.w,X		; FE FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	ora [$00.b]		; 07 00
	sbc $78FB07.l,X		; FF 07 FB 78
	lda $22FF80.l,X		; BF 80 FF 22
	eor $0000.w,X		; 5D 00 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $00FC00.l,X		; FF 00 FC 00
	cpy #$0000.w		; C0 00 00
	brk $C8.b		; 00 C8
	adc $C00000.l,X		; 7F 00 00 C0
	and $7CFD03.l,X		; 3F 03 FD 7C
	lda $01FF80.l,X		; BF 80 FF 01
	sbc $B0FF1F.l,X		; FF 1F FF B0
	bcs  -1.b		; B0 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	ldx $F0FF.w,Y		; BE FF F0
	bmi  -4.b		; 30 FC
	ora ($F9.b,X)		; 01 F9
	sed		; F8
	sbc $000707.l,X		; FF 07 07 00
	brk $FF.b		; 00 FF
	brk $C1.b		; 00 C1
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $091BE1.l,X		; FF E1 1B 09
	sbc $6361.w		; ED 61 63
	cpy #$82C3.w		; C0 C3 82
	sta $00.b,S		; 83 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	ora ($F7.b,X)		; 01 F7
	ora ($9F.b,X)		; 01 9F
	ora ($3F.b,X)		; 01 3F
	ora ($7F.b,X)		; 01 7F
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $1FBF9F.l,X		; FF 9F BF 1F
	sbc $08DC40.l,X		; FF 40 DC 08
	sty $00.b		; 84 00
	cpx $FF02.w		; EC 02 FF
	ora ($03.b,X)		; 01 03
	brk $00.b		; 00 00
	sbc $9FFF9F.l,X		; FF 9F FF 9F
	sed		; F8
	sty $CCB8.w		; 8C B8 CC
	sed		; F8
	cpy $02.b		; C4 02
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	jsr ($373F.w,X)		; FC 3F 37
	stx $008C.w		; 8E 8C 00
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	rts		; 60

	ora ($FD.b,X)		; 01 FD
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	sec		; 38
	brk $8F.b		; 00 8F
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $FC0003.l,X		; 7F 03 00 FC
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -16.b		; 80 F0
	beq -36.b		; F0 DC
	jmp.w [$3333]		; DC 33 33
	sbc $0706.w,X		; FD 06 07
	sbc $00FFC2.l,X		; FF C2 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $3D.b		; 00 3D
	ora ($FF.b,X)		; 01 FF
	sbc $02FFFF.l,X		; FF FF FF 02
	cop $00.b		; 02 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	bra -32.b		; 80 E0
	rts		; 60

	ldy #$64B8.w		; A0 B8 64
	lda [$00.b]		; A7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$7880.w		; C0 80 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	adc $013807.l,X		; 7F 07 38 01
	asl $0300.w		; 0E 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $007F00.l,X		; FF 00 7F 00
	and $010F07.l,X		; 3F 07 0F 01
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sta $FF.b,S		; 83 FF
	beq  31.b		; F0 1F
	rol $FFC3.w,X		; 3E C3 FF
	sed		; F8
	sbc $FF7FFF.l,X		; FF FF 7F FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E0FF00.l,X		; FF 00 FF E0
	sbc $FFFF3C.l,X		; FF 3C FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	cpx $9F.b		; E4 9F
	and $1EC7.w,Y		; 39 C7 1E
	sbc ($BF.b),Y		; F1 BF
	jmp ($FFBF.w,X)		; 7C BF FF
	bra  -1.b		; 80 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3EFF78.l,X		; FF 78 FF 3E
	sbc $FFFF0F.l,X		; FF 0F FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	rts		; 60

	sbc $FF7F9E.l,X		; FF 9E 7F FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	cpx #$FFFF.w		; E0 FF FF
	sbc $5B65FF.l,X		; FF FF 65 5B
	eor ($2D.b,S),Y		; 53 2D
	ora ($7F.b,X)		; 01 7F
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $00007F.l,X		; 7F 7F 00 00
	ora #$3E.b		; 09 3E
	cmp #$3E.b		; C9 3E
	sbc $00FF3E.l,X		; FF 3E FF 00
	sbc $3EFF00.l,X		; FF 00 FF 3E
	adc $00FF1F.l,X		; 7F 1F FF 00
	brk $FF.b		; 00 FF
	lda $BF7F7F.l,X		; BF 7F 7F BF
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF3FFF.l,X		; FF FF 3F FF
	and $00FFFF.l,X		; 3F FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FEFC.w,X		; FD FC FE
	jsr ($0000.w,X)		; FC 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sta $6A.b,X		; 95 6A
	ldx #$805D.w		; A2 5D 80
	adc $FF0000.l,X		; 7F 00 00 FF
	sbc $FF7F7F.l,X		; FF 7F 7F FF
	sbc $C80000.l,X		; FF 00 00 C8
	adc $FF7FC8.l,X		; 7F C8 7F FF
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $7F.b		; 00 7F
	inc $3FFF.w,X		; FE FF 3F
	sbc $A02000.l,X		; FF 00 20 A0
	lda ($60.b,X)		; A1 60
	and [$60.b]		; 27 60
	and [$60.b]		; 27 60
	adc $A08760.l		; 6F 60 87 A0
	cld		; D8
	cld		; D8
	asl $DF01.w,X		; 1E 01 DF
	brk $9F.b		; 00 9F
	brk $9F.b		; 00 9F
	brk $9F.b		; 00 9F
	brk $9F.b		; 00 9F
	brk $DF.b		; 00 DF
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	ora $FF3FDF.l,X		; 1F DF 3F FF
	adc $717FFF.l,X		; 7F FF 7F 71
	beq -55.b		; F0 C9
	cpx #$00FF.w		; E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7FFF1F.l,X		; FF 1F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $0000FF.l,X		; FF FF 00 00
	cpx #$3C00.w		; E0 00 3C
	cpy #$407F.w		; C0 7F 40
	sbc $D0CFE0.l,X		; FF E0 CF D0
	sbc $7F30FF.l,X		; FF FF 30 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $807F00.l,X		; FF 00 7F 80
	sbc $E0DFC0.l,X		; FF C0 DF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	sed		; F8
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $05.b		; 00 05
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($F8.b,X)		; 01 F8
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $A0.b		; 00 A0
	ldy #$2364.w		; A0 64 23
	adc $470F47.l		; 6F 47 0F 47
	sta $88.b,X		; 95 88
	.db $82, $98, $0E		; 82 98 0E
	sta ($F1.b,S),Y		; 93 F1
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $80C080.l,X		; 1F 80 C0 80
	bmi -96.b		; 30 A0
	dey		; 88
	cld		; D8
	cpx $D6C4.w		; EC C4 D6
	adc ($F3.b)		; 72 F3
	and [$61.b]		; 27 61
	jsr $0026.w		; 20 26 00
	brk $C0.b		; 00 C0
	brk $B0.b		; 00 B0
	cpy #$C0F0.w		; C0 F0 C0
	cld		; D8
	cpx #$E0FC.w		; E0 FC E0
	inc $EEF0.w		; EE F0 EE
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
	brk $7F.b		; 00 7F
	adc $2F7F3F.l,X		; 7F 3F 7F 2F
	ora $000F03.l,X		; 1F 03 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	adc $3F7F7F.l,X		; 7F 7F 7F 3F
	and $000F0F.l,X		; 3F 0F 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	beq  -8.b		; F0 F8
	bne -32.b		; D0 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	beq -16.b		; F0 F0
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
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	cmp ($FF.b,X)		; C1 FF
	and ($57.b,X)		; 21 57
	sta ($1F.b),Y		; 91 1F
	sbc [$05.b]		; E7 05
	sbc $FF01.w,Y		; F9 01 FF
	sta $FF1FFF.l,X		; 9F FF 1F FF
	sbc $01DF00.l,X		; FF 00 DF 01
	sbc $01F901.l		; EF 01 F9 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C2.b,X		; F5 C2
	sbc [$D7.b]		; E7 D7
	cpx #$EFC3.w		; E0 C3 EF
	cmp ($E8.b)		; D2 E8
	cmp ($DE.b),Y		; D1 DE
	cmp $BEE8E5.l		; CF E5 E8 BE
	cpx #$FFFF.w		; E0 FF FF
	xce		; FB
	sbc $FDFFFF.l,X		; FF FF FF FD
	sbc $FBFFFF.l,X		; FF FF FF FB
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $B03F70.l,X		; FF 70 3F B0
	and $A83FB0.l,X		; 3F B0 3F A8
	and $383FB8.l		; 2F B8 3F 38
	and $203060.l,X		; 3F 60 30 20
	bvs  -1.b		; 70 FF
	cpx #$E0FF.w		; E0 FF E0
	sbc $F0EFE0.l,X		; FF E0 EF F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	brk $C0.b		; 00 C0
	bmi -65.b		; 30 BF
	adc $BF70B0.l		; 6F B0 70 BF
	and $FF00D0.l,X		; 3F D0 00 FF
	ror $3CFF.w,X		; 7E FF 3C
	ror $00FF.w,X		; 7E FF 00
	sbc $00FF30.l,X		; FF 30 FF 00
	sbc $10FF20.l,X		; FF 20 FF 10
	sbc $FFFF00.l,X		; FF 00 FF FF
	ror $807E.w,X		; 7E 7E 80
	bra  64.b		; 80 40
	sbc $007FBF.l,X		; FF BF 7F 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $6300FF.l,X		; FF FF 00 63
	sbc $00.b,S		; E3 00
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E3.b		; 00 E3
	ora $000101.l,X		; 1F 01 01 00
	brk $FC.b		; 00 FC
	brk $16.b		; 00 16
	cpx #$E0F4.w		; E0 F4 E0
	ora [$E2.b],Y		; 17 E2
	sbc $F902.w,X		; FD 02 F9
	sed		; F8
	sbc [$FF.b],Y		; F7 FF
	tda		; 7B
	sbc $FF1FFF.l,X		; FF FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $2626A0.l,X		; FF A0 26 26
	ldy #$20A6.w		; A0 A6 20
	jsr $C060.w		; 20 60 C0
	rts		; 60

	cpy #$80C0.w		; C0 C0 80
	cpy #$8000.w		; C0 00 80
	inc $EEF0.w		; EE F0 EE
	beq -18.b		; F0 EE
	beq -18.b		; F0 EE
	beq -32.b		; F0 E0
	cpx #$C0C0.w		; E0 C0 C0
	cpy #$80C0.w		; C0 C0 80
	bra  15.b		; 80 0F
	ora $010F07.l,X		; 1F 07 0F 01
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $070F0F.l,X		; 1F 0F 0F 07
	ora [$01.b]		; 07 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $99.b		; 00 99
	beq -49.b		; F0 CF
	sbc $7FFFE0.l,X		; FF E0 FF 7F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$E0C0.w		; E0 C0 E0
	bra -64.b		; 80 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$C0C0.w		; E0 C0 C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($80.b),Y		; 11 80
	mvp $C0,$00		; 44 00 C0
	and ($E1.b),Y		; 31 E1
	ora ($C0.b,X)		; 01 C0
	sbc $00FFE6.l,X		; FF E6 FF 00
	tsb $00.b		; 04 00
	brk $C0.b		; 00 C0
	sbc $02FFF6.l,X		; FF F6 FF 02
	tsb $00.b		; 04 00
	brk $D0.b		; 00 D0
	sbc $04FFE3.l,X		; FF E3 FF 04
	tsb $00.b		; 04 00
	brk $D0.b		; 00 D0
	sbc $06FFF3.l,X		; FF F3 FF 06
	tsb $00.b		; 04 00
	brk $E0.b		; 00 E0
	sbc $08FFE1.l,X		; FF E1 FF 08
	tsb $00.b		; 04 00
	brk $E0.b		; 00 E0
	sbc $0AFFF1.l,X		; FF F1 FF 0A
	tsb $00.b		; 04 00
	brk $E0.b		; 00 E0
	sbc $0C0001.l,X		; FF 01 00 0C
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $0EFFE1.l,X		; FF E1 FF 0E
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $20FFF1.l,X		; FF F1 FF 20
	tsb $00.b		; 04 00
	brk $F0.b		; 00 F0
	sbc $220001.l,X		; FF 01 00 22
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	sbc $000424.l,X		; FF 24 04 00
	brk $00.b		; 00 00
	brk $F1.b		; 00 F1
	sbc $000426.l,X		; FF 26 04 00
	brk $10.b		; 00 10
	brk $E2.b		; 00 E2
	sbc $000428.l,X		; FF 28 04 00
	brk $10.b		; 00 10
	brk $F2.b		; 00 F2
	sbc $00042A.l,X		; FF 2A 04 00
	brk $20.b		; 00 20
	brk $E6.b		; 00 E6
	sbc $00042C.l,X		; FF 2C 04 00
	brk $20.b		; 00 20
	brk $F6.b		; 00 F6
	sbc $00042E.l,X		; FF 2E 04 00
	brk $30.b		; 00 30
	brk $EF.b		; 00 EF
	sbc $000440.l,X		; FF 40 04 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($20.b,X)		; 01 20
	jsr $0000.w		; 20 00 00
	and $1A12.w		; 2D 12 1A
	and $2D.b		; 25 2D
	ora ($00.b)		; 12 00
	and $000000.l,X		; 3F 00 00 00
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	and $403F00.l,X		; 3F 00 3F 40
	and $083F7F.l,X		; 3F 7F 3F 08
	php		; 08
	asl $01.b		; 06 01
	bpl  15.b		; 10 0F
	adc $800000.l,X		; 7F 00 00 80
	rti		; 40

	sbc $DF5FEF.l,X		; FF EF 5F DF
	adc $FF0007.l		; 6F 07 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and $CF3FCF.l,X		; 3F CF 3F CF
	and $001C03.l,X		; 3F 03 1C 00
	ora $000700.l		; 0F 00 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	ora $0F.b,S		; 03 0F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	sbc $3B1FEC.l,X		; FF EC 1F 3B
	cmp [$07.b]		; C7 07
	sed		; F8
	sbc $7F3F7F.l,X		; FF 7F 3F 7F
	ora $1F3F3F.l,X		; 1F 3F 3F 1F
	sbc $F0FF80.l,X		; FF 80 FF F0
	sbc $07FF3C.l,X		; FF 3C FF 07
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	and $3F3F3F.l,X		; 3F 3F 3F 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  16.b		; 10 10
	tsb $0003.w		; 0C 03 00
	sbc $FFEF00.l		; EF 00 EF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $DF.b		; 00 DF
	jsr $10EF.w		; 20 EF 10
	sbc $00FF10.l		; EF 10 FF 00
	sbc $010100.l,X		; FF 00 01 01
	rti		; 40

	rti		; 40

	bmi  15.b		; 30 0F
	brk $FF.b		; 00 FF
	ora [$FB.b]		; 07 FB
	tsb $F8F7.w		; 0C F7 F8
	php		; 08
	cop $01.b		; 02 01
	brk $00.b		; 00 00
	and $00FF00.l,X		; 3F 00 FF 00
	sbc $00FC00.l,X		; FF 00 FC 00
	sed		; F8
	brk $F7.b		; 00 F7
	brk $FC.b		; 00 FC
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $77.b		; 00 77
	sed		; F8
	ora $FF06FC.l		; 0F FC 06 FF
	sbc $0FF77F.l,X		; FF 7F F7 0F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	sbc $01FF03.l,X		; FF 03 FF 01
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	sbc $E67FB8.l,X		; FF B8 7F E6
	ora $FEC7F9.l,X		; 1F F9 C7 FE
	sbc ($FF.b,X)		; E1 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	cpy #$F8FF.w		; C0 FF F8
	sbc $FFFFFE.l,X		; FF FE FF FF
	brk $00.b		; 00 00
	php		; 08
	php		; 08
	asl $01.b		; 06 01
	cpy #$033F.w		; C0 3F 03
	sbc $DF3E.w,X		; FD 3E DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $E000.w,X		; FE 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	jsr $0708.w		; 20 08 07
	brk $FF.b		; 00 FF
	and $FFE0DF.l,X		; 3F DF E0 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	bit $1FFC.w,X		; 3C FC 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	inc $FFFF.w,X		; FE FF FF
	brk $00.b		; 00 00
	inc $F801.w,X		; FE 01 F8
	ora [$01.b]		; 07 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc [$60.b]		; 67 60
	bcs  48.b		; B0 30
	rol $7E01.w,X		; 3E 01 7E
	sta ($FE.b,X)		; 81 FE
	ora ($AD.b,X)		; 01 AD
	and $5D.b,S		; 23 5D
	txy		; 9B
	and $C7.b,X		; 35 C7
	sta $00CF00.l,X		; 9F 00 CF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01DF00.l,X		; FF 00 DF 01
	sbc [$01.b]		; E7 01
	xce		; FB
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
	brk $02.b		; 00 02
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $07.b		; 00 07
	xce		; FB
	sbc $F3FC3F.l,X		; FF 3F FC F3
	bmi  -4.b		; 30 FC
	cpx #$FC1C.w		; E0 1C FC
	sbc $FF0303.l,X		; FF 03 03 FF
	brk $FC.b		; 00 FC
	brk $C0.b		; 00 C0
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $7F.b		; 00 7F
	adc $F8F1FE.l,X		; 7F FE F1 F8
	asl $04.b		; 06 04
	sty $39.b		; 84 39
	and $F1F1.w,Y		; 39 F1 F1
	eor ($C1.b,X)		; 41 C1
	bra  -1.b		; 80 FF
	bra   0.b		; 80 00
	ora $00FF00.l		; 0F 00 FF 00
	xce		; FB
	brk $C7.b		; 00 C7
	ora ($0F.b,X)		; 01 0F
	ora ($3F.b,X)		; 01 3F
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	adc $3F3F30.l,X		; 7F 30 3F 3F
	and $FF0000.l,X		; 3F 00 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	and $3F1F3F.l,X		; 3F 3F 1F 3F
	ora $FF00FF.l		; 0F FF 00 FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	cpy #$FF3F.w		; C0 3F FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$FFFF.w		; C0 FF FF
	cpx #$F0FF.w		; E0 FF F0
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
	ora $070B1F.l		; 0F 1F 0B 07
	ora ($03.b,X)		; 01 03
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $0F0F1F.l,X		; 1F 1F 0F 0F
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FA.b		; 05 FA
	dec $C1.b,X		; D6 C1
	inc $00C1.w		; EE C1 00
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	ora [$FE.b]		; 07 FE
	sbc $FCFFFF.l,X		; FF FF FF FC
	xce		; FB
	jsr ($FDFB.w,X)		; FC FB FD
	xce		; FB
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$FF.b]		; 07 FF
	sbc $01FF03.l,X		; FF 03 FF 01
	sbc [$FF.b],Y		; F7 FF
	pea $F3FF.w		; F4 FF F3
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FEFC.w,X		; FE FC FE
	stz $F8.b,X		; 74 F8
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FEFEFF.l,X		; FF FF FE FE
	jsr ($00FC.w,X)		; FC FC 00
	brk $FF.b		; 00 FF
	sed		; F8
	brk $FF.b		; 00 FF
	cpy #$0080.w		; C0 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	cpy #$8080.w		; C0 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	pei ($2A.b)		; D4 2A
	rol A		; 2A
	pei ($54.b)		; D4 54
	plb		; AB
	txa		; 8A
	adc $00.b,X		; 75 00
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	inc $00FE.w,X		; FE FE 00
	and $FE.b,S		; 23 FE
	eor ($FE.b,X)		; 41 FE
	ldx #$74FE.w		; A2 FE 74
	inc $00FE.w,X		; FE FE 00
	inc $FF00.w,X		; FE 00 FF
	sed		; F8
	brk $C0.b		; 00 C0
	rti		; 40

	cpy #$C040.w		; C0 40 C0
	cmp ($C0.b,X)		; C1 C0
	cmp $C0CFC0.l		; CF C0 CF C0
	cmp $C08FC0.l,X		; DF C0 8F C0
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	and $003F00.l,X		; 3F 00 3F 00
	cpx #$78FF.w		; E0 FF 78
	sbc $007FBF.l,X		; FF BF 7F 00
	sbc $000001.l,X		; FF 01 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	cpy #$FFFF.w		; C0 FF FF
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FB.b		; 05 FB
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	and $FF1FFF.l,X		; 3F FF 1F FF
	eor $070F3F.l,X		; 5F 3F 0F 07
	ora $07.b,S		; 03 07
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $FFFF07.l,X		; FF 07 FF FF
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	ora $07070F.l		; 0F 0F 07 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpx #$DF1F.w		; E0 1F DF
	and $7F7FBF.l,X		; 3F BF 7F 7F
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF3FFF.l,X		; 1F FF 3F FF
	adc $007F7F.l,X		; 7F 7F 7F 00
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	brk $1F.b		; 00 1F
	cpx #$706F.w		; E0 6F 70
	cmp [$D8.b],Y		; D7 D8
	xce		; FB
	jsr ($0080.w,X)		; FC 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $E0DF80.l,X		; 7F 80 DF E0
	sbc $FFCFF0.l,X		; FF F0 CF FF
	bcc  -8.b		; 90 F8
	ldx $72E0.w		; AE E0 72
	sbc #$7D.b		; E9 7D
	xba		; EB
	rts		; 60

	cmp ($44.b,X)		; C1 44
	bne  69.b		; D0 45
	cmp ($FF.b),Y		; D1 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F5FFFE.l,X		; FF FE FF F5
	inc $FF.b,X		; F6 FF
	adc $BC3F9C.l,X		; 7F 9C 3F BC
	ora $4C9F0C.l,X		; 1F 0C 9F 4C
	sta $CA0BCA.l		; 8F CA 0B CA
	phd		; 0B
	sbc [$F8.b],Y		; F7 F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FCFBF8.l,X		; FF F8 FB FC
	xce		; FB
	jsr ($FFFF.w,X)		; FC FF FF
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
	ldy #$00C0.w		; A0 C0 00
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
	sbc $F703FF.l,X		; FF FF 03 F7
	and $F3.b,S		; 23 F3
	and ($7B.b,X)		; 21 7B
	adc #$FF.b		; 69 FF
	rti		; 40

	sbc $C0.b,X		; F5 C0
	sed		; F8
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $23FF00.l,X		; FF 00 FF 23
	sbc $71FF31.l,X		; FF 31 FF 71
	sbc [$78.b],Y		; F7 78
	xce		; FB
	jsr ($0000.w,X)		; FC 00 00
	inc $FFFE.w,X		; FE FE FF
	sbc $9CF1F1.l,X		; FF F1 F1 9C
	stz $8000.w		; 9C 00 80
	bra   0.b		; 80 00
	ora [$87.b]		; 07 87
	jsr $009F.w		; 20 9F 00
	brk $FE.b		; 00 FE
	brk $F1.b		; 00 F1
	beq -100.b		; F0 9C
	stz $8080.w		; 9C 80 80
	bra -128.b		; 80 80
	sta [$07.b]		; 87 07
	jsr $FF40.w		; 20 40 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	tsb $F3.b		; 04 F3
	ora $F30FF6.l		; 0F F6 0F F3
	ora $FF.b,S		; 03 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	sbc $01FF02.l,X		; FF 02 FF 01
	sbc [$0C.b],Y		; F7 0C
	sbc $FC07FC.l,X		; FF FC 07 FC
	tsb $04.b		; 04 04
	ora $FE.b,S		; 03 FE
	sbc $0003.w,X		; FD 03 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	cpy #$B8F8.w		; C0 F8 B8
	trb $0718.w		; 1C 18 07
	ora [$00.b]		; 07 00
	brk $FF.b		; 00 FF
	sbc $E0EF07.l,X		; FF 07 EF E0
	sbc $C00000.l,X		; FF 00 00 C0
	brk $1F.b		; 00 1F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00031F.l,X		; FF 1F 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$3838.w		; E0 38 38
	sbc $C3.b,S		; E3 C3
	sbc $FFFFFC.l,X		; FF FC FF FF
	adc $0000FE.l,X		; 7F FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$FF00.w		; C0 00 FF
	ora $FF.b,S		; 03 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	ora ($FF.b,X)		; 01 FF
	ora ($01.b,X)		; 01 01
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	rti		; 40

	bra -72.b		; 80 B8
	bvc -34.b		; 50 DE
	sbc ($E1.b,X)		; E1 E1
	ldy #$44A0.w		; A0 A0 44
	adc $EF.b,S		; 63 EF
	eor [$C0.b]		; 47 C0
	cpy #$C0C0.w		; C0 C0 C0
	cpy #$6080.w		; C0 80 60
	brk $3E.b		; 00 3E
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$7040.w		; C0 40 70
	bvc -100.b		; 50 9C
	sed		; F8
	inc $0000.w		; EE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$F000.w		; E0 00 F0
	cpy #$E0F4.w		; C0 F4 E0
	asl $17E0.w,X		; 1E E0 17
	sbc ($EE.b,X)		; E1 EE
	bpl -16.b		; 10 F0
	sed		; F8
	cmp $EBF8.w		; CD F8 EB
	sbc [$7E.b],Y		; F7 7E
	sbc $FF1FFF.l,X		; FF FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FFFFFF.l,X		; 1F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $B19453.l,X		; FF 53 94 B1
	trb $3418.w		; 1C 18 34
	bmi  96.b		; 30 60
	rts		; 60

	cpx #$E0C0.w		; E0 C0 E0
	rti		; 40

	bra   0.b		; 80 00
	brk $F7.b		; 00 F7
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	beq -16.b		; F0 F0
	cpx #$E0E0.w		; E0 E0 E0
	cpx #$C0C0.w		; E0 C0 C0
	brk $00.b		; 00 00
	sbc ($C1.b,X)		; E1 C1
	cmp [$ED.b],Y		; D7 ED
	inc $776D.w,X		; FE 6D 77
	ldy #$B0C8.w		; A0 C8 B0
	ldy $D8.b,X		; B4 D8
	xce		; FB
	sbc [$F7.b]		; E7 F7
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	dec $0E8F.w,X		; DE 8F 0E
	sta $1C1F9E.l,X		; 9F 9E 1F 1C
	sec		; 38
	bmi 120.b		; 30 78
	beq 120.b		; F0 78
	inx		; E8
	beq -48.b		; F0 D0
	cpx #$FCFF.w		; E0 FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	jsr ($F8FC.w,X)		; FC FC F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpx #$FF00.w		; E0 00 FF
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
	sbc $181030.l		; EF 30 10 18
	bpl  24.b		; 10 18
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	php		; 08
	sbc $003008.l,X		; FF 08 30 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FE0100.l,X		; FF 00 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$0F.b]		; 07 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0F0F00.l,X		; FF 00 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	pea $D0F8.w		; F4 F8 D0
	cpx #$0000.w		; E0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($F0FC.w,X)		; FC FC F0
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
	brk $FC.b		; 00 FC
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
	sbc $0F0F.w,Y		; F9 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($01.b,X)		; 01 01
	cmp ($01.b,X)		; C1 01
	asl $00.b		; 06 00
	beq   0.b		; F0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sta $83.b		; 85 83
	ora ($03.b,X)		; 01 03
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta [$7F.b]		; 87 7F
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $8FDFC7.l		; 8F C7 DF 8F
	ora $98.b,S		; 03 98
	stx $18.b		; 86 18
	ora $F211.w		; 0D 11 F2
	brk $FC.b		; 00 FC
	brk $15.b		; 00 15
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $FF1FFF.l		; 0F FF 1F FF
	ora $EC1FFF.l,X		; 1F FF 1F EC
	sbc [$F2.b],Y		; F7 F2
	xce		; FB
	bmi 124.b		; 30 7C
	sei		; 78
	bit $3411.w,X		; 3C 11 34
	sta ($15.b)		; 92 15
	bvc -105.b		; 50 97
	sta ($D5.b)		; 92 D5
	sed		; F8
	cpx #$E0FC.w		; E0 FC E0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc [$F8.b],Y		; F7 F8
	sbc [$F8.b],Y		; F7 F8
	sbc [$F8.b],Y		; F7 F8
	sbc [$F8.b],Y		; F7 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra -64.b		; 80 C0
	brk $40.b		; 00 40
	cpy #$0040.w		; C0 40 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	bra  80.b		; 80 50
	brk $B6.b		; 00 B6
	and $01DC.w,Y		; 39 DC 01
	ldx $FF.b,Y		; B6 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	ldx $FF.b,Y		; B6 FF
	sbc ($FF.b)		; F2 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	cpx #$FF.b		; E0 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	beq  -1.b		; F0 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	dec $FF.b		; C6 FF
	brk $00.b		; 00 00
	php		; 08
	tsb $00.b		; 04 00
	brk $D6.b		; 00 D6
	sbc $0AFFDD.l,X		; FF DD FF 0A
	tsb $00.b		; 04 00
	brk $D6.b		; 00 D6
	sbc $0CFFED.l,X		; FF ED FF 0C
	tsb $00.b		; 04 00
	brk $E6.b		; 00 E6
	sbc $0EFFDC.l,X		; FF DC FF 0E
	tsb $00.b		; 04 00
	brk $E6.b		; 00 E6
	sbc $20FFEC.l,X		; FF EC FF 20
	tsb $00.b		; 04 00
	brk $E6.b		; 00 E6
	sbc $22FFFC.l,X		; FF FC FF 22
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $24FFDC.l,X		; FF DC FF 24
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $26FFEC.l,X		; FF EC FF 26
	tsb $00.b		; 04 00
	brk $F6.b		; 00 F6
	sbc $28FFFC.l,X		; FF FC FF 28
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $DC.b		; 00 DC
	sbc $00042A.l,X		; FF 2A 04 00
	brk $06.b		; 00 06
	brk $EC.b		; 00 EC
	sbc $00042C.l,X		; FF 2C 04 00
	brk $16.b		; 00 16
	brk $DE.b		; 00 DE
	sbc $00042E.l,X		; FF 2E 04 00
	brk $16.b		; 00 16
	brk $EE.b		; 00 EE
	sbc $000440.l,X		; FF 40 04 00
	brk $26.b		; 00 26
	brk $E2.b		; 00 E2
	sbc $000442.l,X		; FF 42 04 00
	brk $26.b		; 00 26
	brk $F2.b		; 00 F2
	sbc $000444.l,X		; FF 44 04 00
	brk $36.b		; 00 36
	brk $EA.b		; 00 EA
	sbc $000446.l,X		; FF 46 04 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	cop $10.b		; 02 10
	bpl  32.b		; 10 20
	jsr $3629.w		; 20 29 36
	rol A		; 2A
	and $35.b,X		; 35 35
	asl A		; 0A
	rol A		; 2A
	ora $00.b,X		; 15 00
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $16.b		; 00 16
	ora $601F00.l,X		; 1F 00 1F 60
	ora $041F60.l,X		; 1F 60 1F 04
	tsb $01.b		; 04 01
	brk $08.b		; 00 08
	ora [$1F.b]		; 07 1F
	brk $3F.b		; 00 3F
	sbc $376080.l,X		; FF 80 60 37
	stp		; DB
	clv		; B8
	eor [$03.b],Y		; 57 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	cpy #$7F.b		; C0 7F
	cpy #$73.b		; C0 73
	cmp $FFCF73.l		; CF 73 CF FF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	and $000700.l,X		; 3F 00 07 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $0E877F.l,X		; FF 7F 87 0E
	sbc ($03.b),Y		; F1 03
	jsr ($3F00.w,X)		; FC 00 3F
	and $00FF1F.l,X		; 3F 1F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0FFF78.l,X		; FF 78 FF 0F
	sbc $003F03.l,X		; FF 03 3F 00
	and $00003F.l,X		; 3F 3F 00 00
	bpl  16.b		; 10 10
	bpl  13.b		; 10 0D
	brk $FD.b		; 00 FD
	brk $FD.b		; 00 FD
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $02FD00.l		; 0F 00 FD 02
	sbc $FD02.w,X		; FD 02 FD
	cop $FF.b		; 02 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $10.b		; 00 10
	bpl   8.b		; 10 08
	ora [$00.b]		; 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $0F0000.l,X		; FF 00 00 0F
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
	brk $00.b		; 00 00
	sbc $E0FF01.l,X		; FF 01 FF E0
	sbc $FF1FEF.l,X		; FF EF 1F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $66D7E9.l,X		; FF E9 D7 66
	sbc ($F9.b),Y		; F1 F9
	pea $00FF.w		; F4 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FFF3E.l,X		; FF 3E FF 1F
	sbc $7FBF1F.l,X		; FF 1F BF 7F
	rol $1F.b		; 26 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$E0.b		; C0 E0
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$C0.b		; E0 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($40.b,X)		; 01 40
	rti		; 40

	jsr $001F.w		; 20 1F 00
	sbc $38F70F.l,X		; FF 0F F7 38
	sbc $00807F.l,X		; FF 7F 80 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $08.b		; 00 08
	php		; 08
	asl $01.b		; 06 01
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	ora [$FB.b]		; 07 FB
	bra  -1.b		; 80 FF
	ora ($FE.b,X)		; 01 FE
	sbc $000700.l,X		; FF 00 07 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FC00.l,X		; FF 00 FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $3F3FFF.l,X		; FF FF 3F 3F
	sbc $FFFCFF.l,X		; FF FF FC FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FF3F00.l,X		; FF 00 3F FF
	sbc $07FF0F.l,X		; FF 0F FF 07
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	plx		; FA
	sbc ($FD.b,S),Y		; F3 FD
	sbc $FEFF.w,Y		; F9 FF FE
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
	sed		; F8
	ora [$E1.b]		; 07 E1
	asl $F907.w,X		; 1E 07 F9
	jsr ($FE00.w,X)		; FC 00 FE
	cpx #$FF.b		; E0 FF
	sed		; F8
	sbc $00FFFC.l,X		; FF FC FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $2000.w,X		; FE 00 20
	jsr $0718.w		; 20 18 07
	brk $FF.b		; 00 FF
	ora [$FB.b]		; 07 FB
	sei		; 78
	lda $1FFFC0.l,X		; BF C0 FF 1F
	cpx #$FB.b		; E0 FB
	ora [$1F.b]		; 07 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	sbc $FFBF7F.l,X		; FF 7F BF FF
	sed		; F8
	ror $38C1.w,X		; 7E C1 38
	inc $7F81.w,X		; FE 81 7F
	jsr ($FFFF.w,X)		; FC FF FF
	brk $FC.b		; 00 FC
	brk $C0.b		; 00 C0
	brk $07.b		; 00 07
	brk $3F.b		; 00 3F
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $7F0000.l,X		; 3F 00 00 7F
	brk $7F.b		; 00 7F
	adc $1F7F7F.l,X		; 7F 7F 7F 1F
	ora $000F0C.l,X		; 1F 0C 0F 00
	brk $7F.b		; 00 7F
	ora $7F007F.l,X		; 1F 7F 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	ora $0F071F.l,X		; 1F 1F 07 0F
	ora $FF.b,S		; 03 FF
	brk $37.b		; 00 37
	stp		; DB
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	beq -16.b		; F0 F0
	sbc $FF07FF.l,X		; FF FF 07 FF
	brk $00.b		; 00 00
	sbc ($CF.b,S),Y		; F3 CF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $CFF000.l,X		; FF 00 F0 CF
	sbc $F8FFF0.l,X		; FF F0 FF F8
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
	and $1F0F1F.l		; 2F 1F 0F 1F
	ora [$0F.b],Y		; 17 0F
	phd		; 0B
	ora [$05.b]		; 07 05
	ora $02.b,S		; 03 02
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	and $1F1F1F.l,X		; 3F 1F 1F 1F
	ora $070F0F.l,X		; 1F 0F 0F 07
	ora [$03.b]		; 07 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	inc $FE00.w,X		; FE 00 FE
	sbc $0000FE.l,X		; FF FE 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $C73B00.l,X		; FF 00 3B C7
	sbc $FFFFF0.l,X		; FF F0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FDFEFF.l,X		; FF FF FE FD
	adc $FF7FFF.l,X		; 7F FF 7F FF
	rti		; 40

	sbc $F8FE3C.l,X		; FF 3C FE F8
	jsr ($F8F0.w,X)		; FC F0 F8
	cpx #$F0.b		; E0 F0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FCFE.w,X		; FE FE FC
	jsr ($F8F8.w,X)		; FC F8 F8
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$40.b		; C0 40
	nop		; EA
	sbc $15.b,X		; F5 15
	rol A		; 2A
	lsr A		; 4A
	and $94.b,X		; 35 94
	pld		; 2B
	eor #$36.b		; 49 36
	brk $00.b		; 00 00
	sbc $00BF00.l,X		; FF 00 BF 00
	and $1F.b,X		; 35 1F
	cpx #$3F.b		; E0 3F
	cpx #$FF.b		; E0 FF
	sbc ($FF.b,X)		; E1 FF
	sbc ($FF.b)		; F2 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	cop $03.b		; 02 03
	mvn $28,$AD		; 54 AD 28
	cmp $55.b,X		; D5 55
	plb		; AB
	and ($DB.b,X)		; 21 DB
	eor #$B3.b		; 49 B3
	ora ($03.b,X)		; 01 03
	sbc $07.b,X		; F5 07
	jsr ($AE00.w,X)		; FC 00 AE
	sed		; F8
	stx $F8.b		; 86 F8
	sty $F8.b		; 84 F8
	sty $94F8.w		; 8C F8 94
	sed		; F8
	jsr ($F800.w,X)		; FC 00 F8
	brk $80.b		; 00 80
	sbc $BCFF60.l,X		; FF 60 FF BC
	adc $B33F4F.l,X		; 7F 4F 3F B3
	eor $00E3CC.l		; 4F CC E3 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	cpy #$FF.b		; C0 FF
	beq  -1.b		; F0 FF
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	cpx #$FF.b		; E0 FF
	inc $00FF.w,X		; FE FF 00
	sbc $FF0102.l,X		; FF 02 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $7C0303.l,X		; FF 03 03 7C
	jsr ($8080.w,X)		; FC 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $001F00.l		; 0F 00 1F 00
	ora $000300.l,X		; 1F 00 03 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $030300.l,X		; FF 00 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	beq  15.b		; F0 0F
	cmp $00FC3F.l		; CF 3F FC 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $003F0F.l,X		; FF 0F 3F 00
	and $809F00.l,X		; 3F 00 9F 80
	cpx #$E1.b		; E0 E1
	sbc $017FFF.l,X		; FF FF 7F 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $001F00.l,X		; 7F 00 1F 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	lda $FC7B7F.l,X		; BF 7F 7B FC
	adc $DCF8F7.l		; 6F F7 F8 DC
	tyx		; BB
	beq -27.b		; F0 E5
	bcs 123.b		; B0 7B
	cpx $EC.b		; E4 EC
	adc $FF.b		; 65 FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	sbc $2FFF3F.l,X		; FF 3F FF 2F
	ora $0B0F17.l,X		; 1F 17 0F 0B
	ora [$02.b]		; 07 02
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $3FFFFF.l,X		; FF FF FF 3F
	and $0F1F1F.l,X		; 3F 1F 1F 0F
	ora $000303.l		; 0F 03 03 00
	brk $00.b		; 00 00
	brk $D4.b		; 00 D4
	clv		; B8
	tay		; A8
	jmp.w [$EFD7]		; DC D7 EF
	sbc $FCFBF3.l		; EF F3 FB FC
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $F8FF1F.l,X		; 1F 1F FF F8
	jsr ($E083.w,X)		; FC 83 E0
	trb $E303.w		; 1C 03 E3
	asl $F80E.w		; 0E 0E F8
	sed		; F8
	bpl -16.b		; 10 F0
	cpx #$00.b		; E0 00
	ora [$00.b]		; 07 00
	adc $00FF00.l,X		; 7F 00 FF 00
	jsr ($F100.w,X)		; FC 00 F1
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	sbc $0C7E80.l,X		; FF 80 7E 0C
	stz $EDC8.w,X		; 9E C8 ED
	php		; 08
	and $405F49.l		; 2F 49 5F 40
	eor $005F50.l,X		; 5F 50 5F 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tsb $0E3D.w		; 0C 3D 0E
	sbc $4EFF0E.l,X		; FF 0E FF 4E
	sbc $5FFF4F.l,X		; FF 4F FF 5F
	sbc ($F4.b,S),Y		; F3 F4
	sbc $FA7E.w,X		; FD 7E FA
	xce		; FB
	eor $9C3D.w,X		; 5D 3D 9C
	tsb $0F47.w		; 0C 47 0F
	adc $C7A787.l		; 6F 87 A7 C7
	sbc [$F8.b],Y		; F7 F8
	sbc $FCFBF8.l,X		; FF F8 FB FC
	sbc $FCFE.w,X		; FD FE FC
	sbc $FFFEFF.l,X		; FF FF FE FF
	inc $FEFF.w,X		; FE FF FE
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $807F00.l,X		; FF 00 7F 80
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	tsb $5E1E.w		; 0C 1E 5E
	bit $FCFC.w,X		; 3C FC FC
	jsr ($B0F8.w,X)		; FC F8 B0
	sei		; 78
	inx		; E8
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $FEFE.w,X		; FE FE FE
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($F8F8.w,X)		; FC F8 F8
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
	sbc $FF7FFF.l,X		; FF FF 7F FF
	and $7B3B7F.l,X		; 3F 7F 3B 7B
	ora $0038.w,Y		; 19 38 00
	clv		; B8
	brk $98.b		; 00 98
	brk $58.b		; 00 58
	brk $00.b		; 00 00
	sbc $3FFF00.l,X		; FF 00 FF 3F
	xce		; FB
	tsa		; 3B
	sbc $F019.w,Y		; F9 19 F0
	clc		; 18
	cpx #$18.b		; E0 18
	bvs -120.b		; 70 88
	cpx #$E0.b		; E0 E0
	sbc $9C9EFF.l,X		; FF FF 9E 9C
	cmp $C3.b,S		; C3 C3
	cpy #$40.b		; C0 40
	brk $00.b		; 00 00
	ora $302F1F.l,X		; 1F 1F 2F 30
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	sta $C0C380.l,X		; 9F 80 C3 C0
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	ora $3F3F1F.l,X		; 1F 1F 3F 3F
	cpx #$00.b		; E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cpx #$7F.b		; E0 7F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40FF00.l,X		; FF 00 FF 40
	cpy #$40.b		; C0 40
	sbc $40FF40.l,X		; FF 40 FF 40
	sbc $E0FF40.l,X		; FF 40 FF E0
	and $2020E0.l,X		; 3F E0 20 20
	and $00FFE0.l,X		; 3F E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E0E000.l,X		; FF 00 E0 E0
	stz $739C.w		; 9C 9C 73
	adc $1E.b,S		; 63 1E
	trb $FFFF.w		; 1C FF FF
	sbc $FF3000.l,X		; FF 00 30 FF
	bra  -3.b		; 80 FD
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	jmp ($1F00.w,X)		; 7C 00 1F
	brk $FF.b		; 00 FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	ora $000003.l		; 0F 03 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra  -9.b		; 80 F7
	sbc [$FF.b],Y		; F7 FF
	cld		; D8
	sbc [$38.b]		; E7 38
	and $FD96FF.l		; 2F FF 96 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	sbc $FFFF1F.l,X		; FF 1F FF FF
	sbc $7CFEFF.l,X		; FF FF FE 7C
	adc $B503.w,X		; 7D 03 B5
	and ($6D.b,S),Y		; 33 6D
	sta $05E319.l		; 8F 19 E3 05
	xce		; FB
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	adc $01FFFF.l,X		; 7F FF FF 01
	cmp $01F301.l		; CF 01 F3 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $6FD6FF.l,X		; FF FF D6 6F
	cmp ($48.b)		; D2 48
	cmp ($48.b)		; D2 48
	bne -56.b		; D0 C8
	beq -64.b		; F0 C0
	wai		; CB
	inc $FD.b		; E6 FD
	stz $7B.b		; 64 7B
	bcs  -3.b		; B0 FD
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFD.l,X		; FF FD FF FF
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
	brk $C0.b		; 00 C0
	sbc $003F3F.l,X		; FF 3F 3F 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	sed		; F8
	cmp $0000C8.l		; CF C8 00 00
	cpy #$00.b		; C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0CF00.l,X		; FF 00 CF F0
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $D7.b		; 00 D7
	sbc [$56.b]		; E7 56
	asl $F6.b		; 06 F6
	stx $17.b		; 86 17
	eor [$D7.b]		; 47 D7
	sbc [$A7.b]		; E7 A7
	cmp [$67.b]		; C7 67
	sta [$87.b]		; 87 87
	asl $FEFF.w		; 0E FF FE
	inc $7EFF.w,X		; FE FF 7E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FFFF.l,X		; FF FF FF 03
	jsr ($FE81.w,X)		; FC 81 FE
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	brk $01.b		; 00 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $010100.l,X		; FF 00 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $FB.b		; 02 FB
	sbc $0301FE.l,X		; FF FE 01 03
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $04.b		; 02 04
	ora $00.b,S		; 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	cpy #$80.b		; C0 80
	rti		; 40

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	sbc $607FE0.l,X		; FF E0 7F 60
	sbc $1F3FE0.l,X		; FF E0 3F 1F
	cpx #$00.b		; E0 00
	sbc $FDFF1F.l,X		; FF 1F FF FD
	inc $E0FF.w,X		; FE FF E0
	sbc $40FF60.l,X		; FF 60 FF 40
	sbc $00FF20.l,X		; FF 20 FF 00
	sbc $1FFF00.l,X		; FF 00 FF 1F
	sbc $FF1FFF.l,X		; FF FF 1F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	bra -64.b		; 80 C0
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$C0.b		; C0 C0
	brk $00.b		; 00 00
	jmp ($037F.w,X)		; 7C 7F 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1D.b		; 00 1D
	xba		; EB
	cmp #$F7.b		; C9 F7
	asl $000E.w		; 0E 0E 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	ora ($01.b,X)		; 01 01
	ora ($1C.b,X)		; 01 1C
	php		; 08
	php		; 08
	brk $F1.b		; 00 F1
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	ora $FA.b,S		; 03 FA
	ora $FF.b,S		; 03 FF
	cop $FF.b		; 02 FF
	cop $03.b		; 02 03
	cop $FE.b		; 02 FE
	cop $FF.b		; 02 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$40.b		; C0 40
	sei		; 78
	bne -98.b		; D0 9E
	cpx #$43.b		; E0 43
	sbc ($A1.b,X)		; E1 A1
	cpx #$43.b		; E0 43
	sta [$C3.b]		; 87 C3
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	jsr ($7E00.w,X)		; FC 00 7E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpx #$28.b		; E0 28
	cpy $B7AC.w		; CC AC B7
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	clv		; B8
	cpy #$F8.b		; C0 F8
	tsb $15.b		; 04 15
	brk $F5.b		; 00 F5
	cpx $1A.b		; E4 1A
	cpx $17.b		; E4 17
	sbc ($FE.b,X)		; E1 FE
	ora $0A.b,S		; 03 0A
	beq -12.b		; F0 F4
	sed		; F8
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FFFF1F.l,X		; FF 1F FF FF
	plp		; 28
	lsr A		; 4A
	pha		; 48
	ror A		; 6A
	pha		; 48
	ror A		; 6A
	cld		; D8
	asl $1A8C.w		; 0E 8C 1A
	clv		; B8
	clc		; 18
	clc		; 18
	sec		; 38
	bcs 120.b		; B0 78
	xce		; FB
	jsr ($FCFB.w,X)		; FC FB FC
	xce		; FB
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $F8F8FC.l,X		; FF FC F8 F8
	sed		; F8
	sed		; F8
	sed		; F8
	sed		; F8
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	bra -32.b		; 80 E0
	rti		; 40

	bvs  32.b		; 70 20
	bmi  96.b		; 30 60
	brk $C0.b		; 00 C0
	bmi -128.b		; 30 80
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $0FF0F0.l		; 0F F0 F0 0F
	ora [$FF.b]		; 07 FF
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
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	phd		; 0B
	ora [$03.b]		; 07 03
	ora [$03.b]		; 07 03
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	sbc $030707.l,X		; FF 07 07 03
	ora $01.b,S		; 03 01
	ora ($00.b,X)		; 01 00
	brk $CB.b		; 00 CB
	sta [$0F.b]		; 87 0F
	sta [$97.b]		; 87 97
	ora $070C10.l		; 0F 10 0C 07
	clc		; 18
	ora $0F11.w		; 0D 11 0F
	ora $F6.b,X		; 15 F6
	tsb $FF.b		; 04 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $E21FFF.l		; 0F FF 1F E2
	xba		; EB
	sbc $F1.b,X		; F5 F1
	sed		; F8
	jsr ($7CBA.w,X)		; FC BA 7C
	trb $083E.w		; 1C 3E 08
	txs		; 9A
	cld		; D8
	txa		; 8A
	iny		; C8
	asl A		; 0A
	cpx $F6F0.w		; EC F0 F6
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FCFBF8.l,X		; FF F8 FB FC
	xce		; FB
	jsr ($FCFB.w,X)		; FC FB FC
	bit #$FC.b		; 89 FC
	sbc $FFFEF3.l		; EF F3 FE FF
	brk $00.b		; 00 00
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
	pla		; 68
	beq -96.b		; F0 A0
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sed		; F8
	cpx #$E0.b		; E0 E0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	bra  96.b		; 80 60
	cpx #$00.b		; E0 00
	bvs   0.b		; 70 00
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
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
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	sbc ($0C.b,S),Y		; F3 0C
	sbc [$FF.b],Y		; F7 FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc [$FF.b],Y		; F7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	xce		; FB
	sbc $01FFF7.l,X		; FF F7 FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F7.b		; 00 F7
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $F7.b		; 00 F7
	sbc $000403.l,X		; FF 03 04 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	sbc $000404.l,X		; FF 04 04 00
	brk $03.b		; 00 03
	ora $1F.b,S		; 03 1F
	ora $FECFFF.l,X		; 1F FF CF FE
	brk $21.b		; 00 21
	inc $7F5D.w,X		; FE 5D 7F
	bvs  95.b		; 70 5F
	bmi  48.b		; 30 30
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
	sbc $20FF00.l,X		; FF 00 FF 20
	adc $707F70.l,X		; 7F 70 7F 70
	bmi  48.b		; 30 30
	jsr ($48FC.w,X)		; FC FC 48
	cld		; D8
	sta ($EC.b,S),Y		; 93 EC
	sbc $03FFFF.l,X		; FF FF FF 03
	ora $FE.b		; 05 FE
	ora [$FE.b]		; 07 FE
	rol $25.b		; 26 25
	ora $00.b,S		; 03 00
	bne  16.b		; D0 10
	sbc $00005C.l,X		; FF 5C 00 00
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $272707.l,X		; FF 07 27 27
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	tya		; 98
	tya		; 98
	dec $EF4E.w		; CE 4E EF
	ldy #$8B.b		; A0 8B
	sbc $00C7C7.l,X		; FF C7 C7 00
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $67.b		; 00 67
	brk $B1.b		; 00 B1
	brk $DF.b		; 00 DF
	bra  -1.b		; 80 FF
	bra -57.b		; 80 C7
	cmp [$00.b]		; C7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	cpx #$00.b		; E0 00
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
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $EF.b		; 00 EF
	bpl -10.b		; 10 F6
	sbc $F7FFEF.l,X		; FF EF FF F7
	sbc $000400.l,X		; FF 00 04 00
	brk $F7.b		; 00 F7
	sbc $01FFF6.l,X		; FF F6 FF 01
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $03FFF6.l,X		; FF F6 FF 03
	tsb $00.b		; 04 00
	brk $FF.b		; 00 FF
	sbc $04FFFE.l,X		; FF FE FF 04
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F8.b		; 00 F8
	sbc $000405.l,X		; FF 05 04 00
	brk $0F.b		; 00 0F
	brk $FA.b		; 00 FA
	sbc $000406.l,X		; FF 06 04 00
	brk $0F.b		; 00 0F
	ora $FFFFFB.l		; 0F FB FF FF
	bra  24.b		; 80 18
	sbc $2F6F34.l,X		; FF 34 6F 2F
	and [$34.b],Y		; 37 34
	and $001C1C.l		; 2F 1C 1C 00
	brk $0C.b		; 00 0C
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	clc		; 18
	adc $3C3F3C.l,X		; 7F 3C 3F 3C
	and $1C1C3C.l,X		; 3F 3C 1C 1C
	sbc $F9A8FF.l,X		; FF FF A8 F9
	and ($FE.b),Y		; 31 FE
	sbc $40FFFF.l,X		; FF FF FF 40
	jsr $FFFF.w		; 20 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $59.b		; 00 59
	eor ($DF.b,X)		; 41 DF
	cmp $0040.w		; CD 40 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $06.b		; 06 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($83FC.w,X)		; FC FC 83
	sbc $4F.b,S		; E3 4F
	beq  -4.b		; F0 FC
	jsr ($9BFF.w,X)		; FC FF 9B
	sbc [$AD.b],Y		; F7 AD
	lda $3CF6.w		; AD F6 3C
	sbc [$00.b],Y		; F7 00
	brk $60.b		; 00 60
	rts		; 60

	lda $0043B0.l		; AF B0 43 00
	jsr ($FE18.w,X)		; FC 18 FE
	bit $3CFF.w,X		; 3C FF 3C
	sbc $2E363C.l,X		; FF 3C 36 2E
	trb $001C.w		; 1C 1C 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	rol $1C1C.w,X		; 3E 1C 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$E0.b		; E0 E0
	adc ($72.b)		; 72 72
	trb $FF1C.w		; 1C 1C FF
	sbc $FF80BF.l,X		; FF BF 80 FF
	sbc $000E0E.l,X		; FF 0E 0E 00
	brk $10.b		; 00 10
	brk $8C.b		; 00 8C
	brk $E3.b		; 00 E3
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $0E.b		; 00 0E
	asl $0000.w		; 0E 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	cpy #$C0.b		; C0 C0
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
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	sbc $F905.w,Y		; F9 05 F9
	sbc $F9FFF9.l,X		; FF F9 FF F9
	sbc $000400.l,X		; FF 00 04 00
	brk $01.b		; 00 01
	brk $F9.b		; 00 F9
	sbc $000401.l,X		; FF 01 04 00
	brk $30.b		; 00 30
	ora $6F0050.l		; 0F 50 00 6F
	ora [$E2.b],Y		; 17 E2
	adc $0075.w,X		; 7D 75 00
	ora ($F2.b)		; 12 F2
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	and $007F00.l,X		; 3F 00 7F 00
	sta [$7F.b],Y		; 97 7F
	sbc $00FF60.l,X		; FF 60 FF 00
	sbc ($0D.b)		; F2 0D
	cpx #$E0.b		; E0 E0
	brk $00.b		; 00 00
	rts		; 60

	bra  80.b		; 80 50
	bpl -48.b		; 10 D0
	tay		; A8
	bmi -16.b		; 30 F0
	beq   0.b		; F0 00
	php		; 08
	cli		; 58
	sec		; 38
	sec		; 38
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	tay		; A8
	bne  -8.b		; D0 F8
	bmi  -8.b		; 30 F8
	brk $58.b		; 00 58
	ldy #$38.b		; A0 38
	sec		; 38
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	tsb $00.b		; 04 00
	sbc [$07.b],Y		; F7 07
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	sbc [$FF.b],Y		; F7 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFF7FF.l,X		; FF FF F7 FF
	ora ($04.b,X)		; 01 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc [$FF.b],Y		; F7 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $0403FF.l,X		; FF FF 03 04
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	sbc $0403FF.l,X		; FF FF 03 04
	brk $00.b		; 00 00
	brk $17.b		; 00 17
	php		; 08
	bvc 103.b		; 50 67
	phd		; 0B
	beq 127.b		; F0 7F
	ora ($FD.b,S),Y		; 13 FD
	ply		; 7A
	brk $18.b		; 00 18
	sed		; F8
	cpx #$F0.b		; E0 F0
	ora $00FF07.l		; 0F 07 FF 00
	txy		; 9B
	adc $FF70FF.l		; 6F FF 70 FF
	bvs  -1.b		; 70 FF
	brk $F8.b		; 00 F8
	ora [$F0.b]		; 07 F0
	beq   0.b		; F0 00
	pea $030A.w		; F4 0A 03
	xce		; FB
	pea $6F97.w		; F4 97 6F
	sei		; 78
	sbc $80007F.l,X		; FF 7F 00 80
	sta $03.b,S		; 83 03
	ora [$F8.b]		; 07 F8
	beq  -3.b		; F0 FD
	brk $F4.b		; 00 F4
	xce		; FB
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $7C8300.l,X		; FF 00 83 7C
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	cpx #$E0.b		; E0 E0
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
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	sbc $0A.b,X		; F5 0A
	pea $F5FF.w		; F4 FF F5
	sbc $00FFF4.l,X		; FF F4 FF 00
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $01FFF4.l,X		; FF F4 FF 01
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $F4.b		; 00 F4
	sbc $000402.l,X		; FF 02 04 00
	brk $F6.b		; 00 F6
	sbc $03FFFC.l,X		; FF FC FF 03
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $04FFFC.l,X		; FF FC FF 04
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $FC.b		; 00 FC
	sbc $000405.l,X		; FF 05 04 00
	brk $00.b		; 00 00
	ora [$01.b]		; 07 01
	and [$40.b]		; 27 40
	jmp ($D329.w,X)		; 7C 29 D3
	sta $05.b,S		; 83 05
	cpy #$7F.b		; C0 7F
	lda ($7F.b,X)		; A1 7F
	inc $0300.w,X		; FE 00 03
	brk $1B.b		; 00 1B
	ora ($3F.b,X)		; 01 3F
	brk $C7.b		; 00 C7
	tsa		; 3B
	sbc $FF03.w,X		; FD 03 FF
	sei		; 78
	bra   0.b		; 80 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $85.b		; 00 85
	ora $FEFF1F.l,X		; 1F 1F FF FE
	sed		; F8
	dec $FF00.w		; CE 00 FF
	ldy $7FBF.w		; AC BF 7F
	brk $FF.b		; 00 FF
	brk $85.b		; 00 85
	sty $E0.b		; 84 E0
	brk $FE.b		; 00 FE
	sbc $FF80FF.l,X		; FF FF 80 FF
	brk $40.b		; 00 40
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sei		; 78
	bra -88.b		; 80 A8
	bvc -88.b		; 50 A8
	bra -124.b		; 80 84
	brk $FC.b		; 00 FC
	beq  -4.b		; F0 FC
	sed		; F8
	tsb $80.b		; 04 80
	brk $80.b		; 00 80
	brk $78.b		; 00 78
	brk $88.b		; 00 88
	sed		; F8
	jsr ($FC00.w,X)		; FC 00 FC
	sei		; 78
	tsb $00.b		; 04 00
	jsr ($1100.w,X)		; FC 00 11
	sbc $E0FFFF.l,X		; FF FF FF E0
	cpx #$E0.b		; E0 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	asl $FF.b		; 06 FF
	adc $E0E0E0.l,X		; 7F E0 E0 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D9.b		; 00 D9
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	asl $FF.b		; 06 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	beq -16.b		; F0 F0
	beq 112.b		; F0 70
	bvs 112.b		; 70 70
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	bra 112.b		; 80 70
	bvs 112.b		; 70 70
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	asl $FFEF.w		; 0E EF FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	beq  -1.b		; F0 FF
	sed		; F8
	sbc $000401.l,X		; FF 01 04 00
	brk $F8.b		; 00 F8
	sbc $02FFEF.l,X		; FF EF FF 02
	tsb $00.b		; 04 00
	brk $F8.b		; 00 F8
	sbc $03FFF7.l,X		; FF F7 FF 03
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	sbc $000404.l,X		; FF 04 04 00
	brk $00.b		; 00 00
	brk $F7.b		; 00 F7
	sbc $000405.l,X		; FF 05 04 00
	brk $08.b		; 00 08
	brk $F0.b		; 00 F0
	sbc $000406.l,X		; FF 06 04 00
	brk $08.b		; 00 08
	brk $F8.b		; 00 F8
	sbc $000407.l,X		; FF 07 04 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	ora $60.b,S		; 03 60
	eor $2A.b,X		; 55 2A
	trb $54.b		; 14 54
	tax		; AA
	bra   1.b		; 80 01
	inc $FE7F.w,X		; FE 7F FE
	adc $1C0001.l,X		; 7F 01 00 1C
	brk $3F.b		; 00 3F
	brk $43.b		; 00 43
	bit $7C83.w,X		; 3C 83 7C
	sbc $7EFF00.l,X		; FF 00 FF 7E
	sbc $7FB87E.l,X		; FF 7E B8 7F
	jsr ($0000.w,X)		; FC 00 00
	sbc $7F7F04.l,X		; FF 04 7F 7F
	adc $787F7F.l,X		; 7F 7F 7F 78
	sei		; 78
	sei		; 78
	sei		; 78
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $3F7F00.l,X		; 7F 00 7F 3F
	adc $78787F.l,X		; 7F 7F 78 78
	sei		; 78
	sei		; 78
	cmp $4D819F.l,X		; DF 9F 81 4D
	bcs 123.b		; B0 7B
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	cpy #$3F.b		; C0 3F
	bit $00FE.w,X		; 3C FE 00
	sbc $CD0060.l,X		; FF 60 00 CD
	ora $7BFB.w		; 0D FB 7B
	inc $FF00.w,X		; FE 00 FF
	brk $3F.b		; 00 3F
	sbc $FFF0FF.l,X		; FF FF F0 FF
	brk $D1.b		; 00 D1
	sbc $26E968.l,X		; FF 68 E9 26
	clc		; 18
	rts		; 60

	sbc $FFFF9E.l,X		; FF 9E FF FF
	sbc $008000.l,X		; FF 00 80 00
	brk $FF.b		; 00 FF
	brk $16.b		; 00 16
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	rts		; 60

	sbc $FFFF60.l,X		; FF 60 FF FF
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	bra -89.b		; 80 A7
	ora ($52.b,X)		; 01 52
	sbc $00FFFF.l,X		; FF FF FF 00
	asl $F9.b		; 06 F9
	cmp $0061.w,Y		; D9 61 00
	sbc $A600FE.l,X		; FF FE 00 A6
	ldy $53.b		; A4 53
	bvc   0.b		; 50 00
	brk $FF.b		; 00 FF
	brk $F9.b		; 00 F9
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	sbc $6BBF5D.l,X		; FF 5D BF 6B
	brk $0E.b		; 00 0E
	sbc ($75.b,S),Y		; F3 75
	sbc $01FFFF.l,X		; FF FF FF 01
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl $0EFF.w		; 0E FF 0E
	sbc $0303FF.l,X		; FF FF 03 03
	brk $00.b		; 00 00
	bra -32.b		; 80 E0
	brk $7C.b		; 00 7C
	.db $82, $E6, $28		; 82 E6 28
	lsr $54.b,X		; 56 54
	plp		; 28
	brk $00.b		; 00 00
	inc $FCFC.w,X		; FE FC FC
	inc $0000.w,X		; FE 00 00
	bra   0.b		; 80 00
	jmp ($8200.w,X)		; 7C 00 82
	jmp ($7C82.w,X)		; 7C 82 7C
	inc $FE00.w,X		; FE 00 FE
	jmp ($7CFE.w,X)		; 7C FE 7C
	plx		; FA
	inc $00FC.w,X		; FE FC 00
	brk $FE.b		; 00 FE
	cpy #$FE.b		; C0 FE
	jsr ($FEFE.w,X)		; FC FE FE
	inc $3E3E.w,X		; FE 3E 3E
	rol $001E.w,X		; 3E 1E 00
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	cpx #$FE.b		; E0 FE
	inc $3E3E.w,X		; FE 3E 3E
	rol $063E.w,X		; 3E 3E 06
	bra  24.b		; 80 18
	brk $EC.b		; 00 EC
	ora ($EA.b,S),Y		; 13 EA
	sbc $EAFFEC.l,X		; FF EC FF EA
	sbc $000400.l,X		; FF 00 04 00
	brk $FC.b		; 00 FC
	sbc $02FFEA.l,X		; FF EA FF 02
	tsb $00.b		; 04 00
	brk $0C.b		; 00 0C
	brk $EA.b		; 00 EA
	sbc $000404.l,X		; FF 04 04 00
	brk $ED.b		; 00 ED
	sbc $06FFFA.l,X		; FF FA FF 06
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $08FFFA.l,X		; FF FA FF 08
	tsb $00.b		; 04 00
	brk $0D.b		; 00 0D
	brk $FA.b		; 00 FA
	sbc $00040A.l,X		; FF 0A 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	bpl  13.b		; 10 0D
	tas		; 1B
	phk		; 4B
	mvn $AA,$15		; 54 15 AA
	rol A		; 2A
	sta $00.b,X		; 95 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $76.b		; 00 76
	brk $21.b		; 00 21
	asl $3FC0.w,X		; 1E C0 3F
	cpy #$3F.b		; C0 3F
	php		; 08
	php		; 08
	brk $7F.b		; 00 7F
	jsr $A29D.w		; 20 9D A2
	cmp [$20.b],Y		; D7 20
	bra  63.b		; 80 3F
	adc $10003F.l,X		; 7F 3F 00 10
	and $1F0017.l		; 2F 17 00 1F
	brk $7D.b		; 00 7D
	ora $0737.w		; 0D 37 07
	sbc $00C000.l,X		; FF 00 C0 00
	sbc $3FC700.l,X		; FF 00 C7 3F
	ora [$07.b]		; 07 07
	brk $FF.b		; 00 FF
	clc		; 18
	lda $4E00.w,X		; BD 00 4E
	brk $00.b		; 00 00
	sbc ($F0.b),Y		; F1 F0
	beq  15.b		; F0 0F
	brk $FF.b		; 00 FF
	sed		; F8
	brk $FF.b		; 00 FF
	brk $BD.b		; 00 BD
	lda $4E4E.w,X		; BD 4E 4E
	sbc $000F00.l,X		; FF 00 0F 00
	sbc $FFFF0F.l,X		; FF 0F FF FF
	beq -16.b		; F0 F0
	brk $FE.b		; 00 FE
	tsb $79.b		; 04 79
	ora $8B.b		; 05 8B
	tsb $00.b		; 04 00
	inc $0802.w,X		; FE 02 08
	pea $E814.w		; F4 14 E8
	php		; 08
	brk $F8.b		; 00 F8
	brk $7E.b		; 00 7E
	bvs -116.b		; 70 8C
	bra  -1.b		; 80 FF
	brk $FD.b		; 00 FD
	brk $E3.b		; 00 E3
	jsr ($FCE3.w,X)		; FC E3 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $FC.b		; 00 FC
	cpx #$FA.b		; E0 FA
	tax		; AA
	eor ($54.b)		; 52 54
	tax		; AA
	tay		; A8
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $84.b		; 00 84
	sei		; 78
	cop $FC.b		; 02 FC
	ora $FC.b,S		; 03 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor [$FF.b]		; 47 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($F8FC.w,X)		; FC FC F8
	jsr ($F8FC.w,X)		; FC FC F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $FCFCFF.l,X		; FF FF FC FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	sbc $C080FF.l,X		; FF FF 80 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$3F.b		; C0 3F
	sbc $E0E0FF.l,X		; FF FF E0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	clc		; 18
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	clc		; 18
	sbc [$FF.b]		; E7 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000F07.l,X		; FF 07 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $1FFFFF.l,X		; FF FF FF 1F
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	jsr ($FCF8.w,X)		; FC F8 FC
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($FC7C.w,X)		; FC 7C FC
	jsr ($007C.w,X)		; FC 7C 00
	brk $00.b		; 00 00
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	bra  -4.b		; 80 FC
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sbc $7F803F.l,X		; FF 3F 80 7F
	bra 127.b		; 80 7F
	jmp.w [$BF7F]		; DC 7F BF
	brk $3F.b		; 00 3F
	bra   0.b		; 80 00
	adc $FF00FF.l,X		; 7F FF 00 FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF0080.l,X		; 3F 80 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  47.b		; 80 2F
	eor [$80.b],Y		; 57 80
	sbc $DEFF80.l,X		; FF 80 FF DE
	sbc $80FD09.l,X		; FF 09 FD 80
	ora [$F7.b]		; 07 F7
	clc		; 18
	rol $EF.b,X		; 36 EF
	cmp [$3E.b]		; C7 3E
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $000280.l,X		; FF 80 02 00
	sed		; F8
	brk $FF.b		; 00 FF
	trb $1CFF.w		; 1C FF 1C
	ldx #$C7.b		; A2 C7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc ($FF.b,S),Y		; F3 FF
	rol A		; 2A
	lda $1083.w,X		; BD 83 10
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	.db $42, $00		; 42 00
	sbc $00FF00.l		; EF 00 FF 00
	sbc $A64400.l,X		; FF 00 44 A6
	ora $01EF.w,Y		; 19 EF 01
	sbc $97FF77.l,X		; FF 77 FF 97
	sbc $EF808A.l,X		; FF 8A 80 EF
	bmi 108.b		; 30 6C
	cmp $FF00FF.l,X		; DF FF 00 FF
	ora ($FF.b,X)		; 01 FF
	ora ($FF.b,X)		; 01 FF
	ora ($00.b,X)		; 01 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	sec		; 38
	sbc $010038.l,X		; FF 38 00 01
	inc $00FD.w,X		; FE FD 00
	sbc $FAFF00.l,X		; FF 00 FF FA
	sbc $FC01FC.l,X		; FF FC 01 FC
	ora ($00.b,X)		; 01 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $0001FC.l,X		; FF FC 01 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $E7.b		; 00 E7
	clc		; 18
	sbc $FF.b		; E5 FF
	sbc [$FF.b]		; E7 FF
	sbc $FF.b		; E5 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc [$FF.b],Y		; F7 FF
	sbc $FF.b		; E5 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	sbc $FF.b		; E5 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	ora [$00.b],Y		; 17 00
	sbc $FF.b		; E5 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	sbc [$FF.b]		; E7 FF
	sbc $FF.b,X		; F5 FF
	php		; 08
	tsb $00.b		; 04 00
	brk $F7.b		; 00 F7
	sbc $0AFFF5.l,X		; FF F5 FF 0A
	tsb $00.b		; 04 00
	brk $07.b		; 00 07
	brk $F5.b		; 00 F5
	sbc $00040C.l,X		; FF 0C 04 00
	brk $17.b		; 00 17
	brk $F5.b		; 00 F5
	sbc $00040E.l,X		; FF 0E 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	php		; 08
	asl $0C.b		; 06 0C
	lsr A		; 4A
	eor $15.b,X		; 55 15
	asl A		; 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	tda		; 7B
	brk $35.b		; 00 35
	ora $051F62.l,X		; 1F 62 1F 05
	ora $04.b		; 05 04
	ora ($04.b,S),Y		; 13 04
	rtl		; 6B

	tsb $F3.b		; 04 F3
	bit $4832.w		; 2C 32 48
	cpx #$CF.b		; E0 CF
	ora $028040.l,X		; 1F 40 80 02
	brk $0F.b		; 00 0F
	brk $17.b		; 00 17
	ora ($0F.b,X)		; 01 0F
	ora ($CE.b,X)		; 01 CE
	brk $BF.b		; 00 BF
	brk $70.b		; 00 70
	bra  63.b		; 80 3F
	cpy #$80.b		; C0 80
	bra   0.b		; 80 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp [$C0.b],Y		; D7 C0
	sbc ($00.b)		; F2 00
	brk $FF.b		; 00 FF
	sbc $7F0000.l,X		; FF 00 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $F2D7D7.l,X		; FF D7 D7 F2
	sbc ($FF.b)		; F2 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FD80.l,X		; FF 80 FD 00
	ldx $00.b,Y		; B6 00
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $B6FDFD.l,X		; FF FD FD B6
	ldx $FF.b,Y		; B6 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	plx		; FA
	brk $F7.b		; 00 F7
	php		; 08
	sbc ($0C.b),Y		; F1 0C
	adc ($0C.b),Y		; 71 0C
	cop $FE.b		; 02 FE
	cop $FD.b		; 02 FD
	brk $10.b		; 00 10
	brk $F4.b		; 00 F4
	brk $F8.b		; 00 F8
	cpy #$FE.b		; C0 FE
	cpx #$7E.b		; E0 7E
	rts		; 60

	sbc $FD00.w,X		; FD 00 FD
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sed		; F8
	brk $FE.b		; 00 FE
	beq  -4.b		; F0 FC
	tay		; A8
	mvn $AA,$54		; 54 54 AA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $7CD700.l		; 0F 00 D7 7C
	sta $FE.b,S		; 83 FE
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
	ldx $BF00.w,Y		; BE 00 BF
	brk $00.b		; 00 00
	sbc $307F00.l,X		; FF 00 7F 30
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $FF7F7F.l,X		; 7F 7F 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	brk $7F.b		; 00 7F
	ora $7F7F7F.l,X		; 1F 7F 7F 7F
	adc $FF00EC.l,X		; 7F EC 00 FF
	brk $07.b		; 00 07
	plx		; FA
	asl $FD.b		; 06 FD
	sed		; F8
	sed		; F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$E0.b		; C0 E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF07.l,X		; FF 07 FF 03
	sed		; F8
	ora [$FF.b]		; 07 FF
	sbc $F0FFFF.l,X		; FF FF FF F0
	beq -114.b		; F0 8E
	bpl  87.b		; 10 57
	brk $C0.b		; 00 C0
	lda $00FFC0.l,X		; BF C0 FF 00
	brk $FF.b		; 00 FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$FF.b		; C0 FF
	bra   0.b		; 80 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $120000.l,X		; FF 00 00 12
	asl A		; 0A
	cmp $FF0000.l,X		; DF 00 00 FF
	ora ($FF.b,X)		; 01 FF
	ldy #$E0.b		; A0 E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	sbc $00.b,X		; F5 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FE000.l,X		; FF 00 E0 1F
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	adc [$00.b],Y		; 77 00
	sbc $FFF000.l,X		; FF 00 F0 FF
	sed		; F8
	and $FF0000.l,X		; 3F 00 00 FF
	sbc $03FFFF.l,X		; FF FF FF 03
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	beq   0.b		; F0 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0303.l,X		; FF 03 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $40FF00.l,X		; FF 00 FF 40
	adc $FEFFFF.l,X		; 7F FF FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	cpy #$FF.b		; C0 FF
	jsr ($FFFF.w,X)		; FC FF FF
	bra  64.b		; 80 40
	brk $C0.b		; 00 C0
	bra -64.b		; 80 C0
	brk $40.b		; 00 40
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	lda $15.b,X		; B5 15
	tax		; AA
	bra   0.b		; 80 00
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	lda $7FA07F.l,X		; BF 7F A0 7F
	dec $E07F.w,X		; DE 7F E0
	ora $FF3FEA.l,X		; 1F EA 3F FF
	brk $FF.b		; 00 FF
	ora $FF3FFF.l,X		; 1F FF 3F FF
	and $803FFF.l,X		; 3F FF 3F 80
	brk $80.b		; 00 80
	eor $028A45.l		; 4F 45 8A 02
	ora $E0.b,X		; 15 E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $01FF33.l,X		; FF 33 FF 01
	sbc $B8C77F.l,X		; FF 7F C7 B8
	cmp $FF07F8.l		; CF F8 07 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	cpx #$00.b		; E0 00
	brk $FF.b		; 00 FF
	sbc $FDFF00.l,X		; FF 00 FF FD
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	pha		; 48
	sbc $B1FF6D.l,X		; FF 6D FF B1
	sbc $FFFF.w,Y		; F9 FF FF
	sbc $E0FFFF.l,X		; FF FF FF E0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	asl $00.b		; 06 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	eor $003E.w,Y		; 59 3E 00
	sbc $82FF00.l,X		; FF 00 FF 82
	sbc $1ABFD1.l,X		; FF D1 BF 1A
	sbc $FFFFFF.l		; EF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $10.b		; 00 10
	brk $D0.b		; 00 D0
	sbc $D528.w		; ED 28 D5
	jmp $73CC.w		; 4C CC 73
	lda $03FF03.l,X		; BF 03 FF 03
	sbc $4FFFAA.l,X		; FF AA FF 4F
	sbc $C7FCC7.l,X		; FF C7 FC C7
	jsr ($00FF.w,X)		; FC FF 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	brk $00.b		; 00 00
	tax		; AA
	eor $54.b,X		; 55 54
	plb		; AB
	brk $00.b		; 00 00
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $FF01FF.l,X		; FF FF 01 FF
	jsr ($11FF.w,X)		; FC FF 11
	inc $FEAB.w,X		; FE AB FE
	sbc $FEFF00.l,X		; FF 00 FF FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F3F7F.l,X		; 7F 7F 3F 7F
	adc $00003F.l,X		; 7F 3F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $00007F.l,X		; 7F 7F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	bra   0.b		; 80 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $E3.b		; 00 E3
	trb $FFE0.w		; 1C E0 FF
	sbc $FF.b,S		; E3 FF
	cpx #$FF.b		; E0 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc ($FF.b,S),Y		; F3 FF
	cpx #$FF.b		; E0 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cpx #$FF.b		; E0 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	ora ($00.b,S),Y		; 13 00
	cpx #$FF.b		; E0 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	beq  -1.b		; F0 FF
	php		; 08
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $0AFFF0.l,X		; FF F0 FF 0A
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	sbc $00040C.l,X		; FF 0C 04 00
	brk $13.b		; 00 13
	brk $F0.b		; 00 F0
	sbc $00040E.l,X		; FF 0E 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	adc ($03.b,X)		; 61 03
	asl $6668.w		; 0E 68 66
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $7D00.w,X		; 1E 00 7D
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $00.b,S		; 03 00
	dec A		; 3A
	ora ($FA.b,X)		; 01 FA
	ora ($FC.b,X)		; 01 FC
	ora $50.b,S		; 03 50
	and ($68.b,S),Y		; 33 68
	rti		; 40

	ldx $0000.w		; AE 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	lda $00DF00.l		; AF 00 DF 00
	sbc $606000.l,X		; FF 00 60 60
	eor $FF009F.l,X		; 5F 9F 00 FF
	brk $F2.b		; 00 F2
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $00E000.l,X		; 9F 00 E0 00
	sbc $32F23F.l,X		; FF 3F F2 32
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $03.b,S		; 03 03
	sbc $00FC.w,X		; FD FC 00
	sbc $089E0E.l,X		; FF 0E 9E 08
	rol $FF00.w,X		; 3E 00 FF
	brk $00.b		; 00 00
	ora $00FC0F.l		; 0F 0F FC 00
	ora $00.b,S		; 03 00
	sbc $9E9EFF.l,X		; FF FF 9E 9E
	rol $FF3E.w,X		; 3E 3E FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $004200.l,X		; FF 00 42 00
	sbc $00FF00.l		; EF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sbc $EF4242.l,X		; FF 42 42 EF
	sbc $FF00FF.l		; EF FF 00 FF
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	ldy #$00.b		; A0 00
	bne  32.b		; D0 20
	cmp [$24.b],Y		; D7 24
	cmp [$20.b],Y		; D7 20
	wai		; CB
	bmi -59.b		; 30 C5
	ora ($05.b),Y		; 11 05
	jsr ($40FD.w,X)		; FC FD 40
	brk $E0.b		; 00 E0
	brk $E8.b		; 00 E8
	brk $E8.b		; 00 E8
	brk $F4.b		; 00 F4
	bra  -6.b		; 80 FA
	brk $FA.b		; 00 FA
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	sed		; F8
	brk $83.b		; 00 83
	bvs -10.b		; 70 F6
	ora ($E3.b,X)		; 01 E3
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jmp ($8F00.w,X)		; 7C 00 8F
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$80.b		; C0 80
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $BF.b		; 00 BF
	adc $CF3FA0.l,X		; 7F A0 3F CF
	adc $BF4080.l,X		; 7F 80 40 BF
	brk $3F.b		; 00 3F
	bra   0.b		; 80 00
	sbc $FF7F00.l,X		; FF 00 7F FF
	and $8000C0.l,X		; 3F C0 00 80
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $F9.b		; 00 F9
	sbc $00FE02.l,X		; FF 02 FE 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF21.l,X		; FF 21 FF FF
	sed		; F8
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF4C00.l,X		; FF 00 4C FF
	rol $DB.b		; 26 DB
	.db $62, $FB, $04		; 62 FB 04
	and $D700FB.l,X		; 3F FB 00 D7
	inx		; E8
	sed		; F8
	cmp [$27.b],Y		; D7 27
	sbc $3700FF.l,X		; FF FF 00 37
	brk $04.b		; 00 04
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	sed		; F8
	sbc $FF8CF8.l,X		; FF F8 8C FF
	jmp ($14FF.w,X)		; 7C FF 14
	stz $7E03.w,X		; 9E 03 7E
	tsa		; 3B
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFF1.l,X		; FF F1 FF FF
	brk $77.b		; 00 77
	brk $61.b		; 00 61
	brk $81.b		; 00 81
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $10.b		; 00 10
	sbc $DDEFF2.l,X		; FF F2 EF DD
	adc $FFC901.l,X		; 7F 01 C9 FF
	brk $FB.b		; 00 FB
	ora [$07.b]		; 07 07
	xce		; FB
	sed		; F8
	sbc $DC00FF.l,X		; FF FF 00 DC
	brk $80.b		; 00 80
	brk $36.b		; 00 36
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora [$07.b]		; 07 07
	sbc $3FFF90.l,X		; FF 90 FF 3F
	sbc $FF4040.l,X		; FF 40 40 FF
	brk $DF.b		; 00 DF
	jsr $DFE0.w		; 20 E0 DF
	ora $03FFFF.l,X		; 1F FF FF 03
	clc		; 18
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$FF.b		; C0 FF
	cpx #$FF.b		; E0 FF
	cpx #$FF.b		; E0 FF
	sbc $FEFF01.l,X		; FF 01 FF FE
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFF80.l,X		; FF 80 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	bra  64.b		; 80 40
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	cpy #$00.b		; C0 00
	rti		; 40

	brk $40.b		; 00 40
	rti		; 40

	cpy #$00.b		; C0 00
	cpy #$C0.b		; C0 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $15.b		; 00 15
	asl A		; 0A
	rol A		; 2A
	sta $15.b,X		; 95 15
	tax		; AA
	txa		; 8A
	and $80.b,X		; 35 80
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	and $607FA0.l,X		; 3F A0 7F 60
	ora $E01FF1.l,X		; 1F F1 1F E0
	ora $FF1FF5.l,X		; 1F F5 1F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	and $503FFF.l,X		; 3F FF 3F 50
	ldy #$B3.b		; A0 B3
	rti		; 40

	rti		; 40

	lda ($A0.b,S),Y		; B3 A0
	eor ($01.b,S),Y		; 53 01
	asl $00.b		; 06 00
	tsb $F8.b		; 04 F8
	sbc $3FFF08.l,X		; FF 08 FF 3F
	cpx #$1F.b		; E0 1F
	cpx #$3F.b		; E0 3F
	sbc ($5E.b,X)		; E1 5E
	sbc ($FE.b,S),Y		; F3 FE
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $0000F8.l,X		; FF F8 00 00
	sbc $FF1F00.l,X		; FF 00 1F FF
	lda $BF5F5F.l,X		; BF 5F 5F BF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF1FFF.l,X		; FF FF 1F FF
	ora $00FFFC.l,X		; 1F FC FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $0FF000.l		; 0F 00 F0 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sta ($E1.b,S),Y		; 93 E1
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0FFF00.l,X		; FF 00 FF 0F
	sbc $80FFFF.l,X		; FF FF FF 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFEFE.l,X		; FF FE FE FF
	cmp $43F3.w		; CD F3 43
	bra   0.b		; 80 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	sbc $FEFFFE.l,X		; FF FE FF FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F2.b		; 00 F2
	ora ($02.b,X)		; 01 02
	sbc ($40.b),Y		; F1 40
	lda ($A0.b,S),Y		; B3 A0
	eor ($10.b,S),Y		; 53 10
	clc		; 18
	jsr $0728.w		; 20 28 07
	sbc $FFFF04.l,X		; FF 04 FF FF
	ora ($FF.b,X)		; 01 FF
	sbc ($1F.b),Y		; F1 1F
	sbc ($1F.b),Y		; F1 1F
	sbc ($FF.b),Y		; F1 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $AA.b,S		; 03 AA
	mvn $AA,$55		; 54 55 AA
	tax		; AA
	eor $54.b,X		; 55 54
	plb		; AB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF01FF.l,X		; FF FF 01 FF
	ora ($FE.b),Y		; 11 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b),Y		; 11 FE
	plb		; AB
	inc $00FF.w,X		; FE FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $C000FF.l,X		; FF FF 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	rti		; 40

	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $30.b		; 00 30
	adc $7F7F1F.l,X		; 7F 1F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	sbc $FFC0C0.l,X		; FF C0 C0 FF
	sbc $F0FFFE.l,X		; FF FE FF F0
	sed		; F8
	cpy #$C0.b		; C0 C0
	bra -64.b		; 80 C0
	cpy #$80.b		; C0 80
	sbc $3FC000.l,X		; FF 00 C0 3F
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($C0FC.w,X)		; FC FC C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $008080.l,X		; FF 80 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	ora $FF0000.l		; 0F 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	beq   0.b		; F0 00
	sbc $00FFFF.l,X		; FF FF FF 00
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
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $071F3F.l,X		; FF 3F 1F 07
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $0F7F7F.l,X		; FF 7F 7F 0F
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $FE7F00.l,X		; 7F 00 7F FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7F7F7F.l,X		; FF 7F 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	inc $FEFF.w,X		; FE FF FE
	sbc $7F7FFF.l,X		; FF FF 7F 7F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	rti		; 40

	cpy #$40.b		; C0 40
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$80.b		; C0 80
	cpy #$C0.b		; C0 C0
	bra -64.b		; 80 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	rti		; 40

	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	tsb $3080.w		; 0C 80 30
	brk $DE.b		; 00 DE
	and ($DB.b,X)		; 21 DB
	sbc $DBFFDE.l,X		; FF DE FF DB
	sbc $000400.l,X		; FF 00 04 00
	brk $EE.b		; 00 EE
	sbc $02FFDB.l,X		; FF DB FF 02
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $04FFDB.l,X		; FF DB FF 04
	tsb $00.b		; 04 00
	brk $0E.b		; 00 0E
	brk $DB.b		; 00 DB
	sbc $000406.l,X		; FF 06 04 00
	brk $1E.b		; 00 1E
	brk $DB.b		; 00 DB
	sbc $000408.l,X		; FF 08 04 00
	brk $DE.b		; 00 DE
	sbc $0AFFEB.l,X		; FF EB FF 0A
	tsb $00.b		; 04 00
	brk $EE.b		; 00 EE
	sbc $0CFFEB.l,X		; FF EB FF 0C
	tsb $00.b		; 04 00
	brk $FE.b		; 00 FE
	sbc $0EFFEB.l,X		; FF EB FF 0E
	tsb $00.b		; 04 00
	brk $0E.b		; 00 0E
	brk $EB.b		; 00 EB
	sbc $000420.l,X		; FF 20 04 00
	brk $1E.b		; 00 1E
	brk $EB.b		; 00 EB
	sbc $000422.l,X		; FF 22 04 00
	brk $DF.b		; 00 DF
	sbc $24FFFB.l,X		; FF FB FF 24
	tsb $00.b		; 04 00
	brk $11.b		; 00 11
	brk $FB.b		; 00 FB
	sbc $000426.l,X		; FF 26 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	rts		; 60

	ora ($07.b,X)		; 01 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $007E00.l,X		; 1F 00 7E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0E.b		; 00 0E
	brk $7E.b		; 00 7E
	brk $FF.b		; 00 FF
	brk $A4.b		; 00 A4
	sty $003A.w		; 8C 3A 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $5B.b		; 00 5B
	brk $F7.b		; 00 F7
	brk $2C.b		; 00 2C
	bit $D34B.w		; 2C 4B D3
	jsr $205F.w		; 20 5F 20
	sta $609E60.l,X		; 9F 60 9E 60
	ora $C01FE0.l,X		; 1F E0 1F C0
	brk $13.b		; 00 13
	brk $3C.b		; 00 3C
	brk $BF.b		; 00 BF
	brk $7F.b		; 00 7F
	ora [$7E.b]		; 07 7E
	asl $FF.b		; 06 FF
	ora $FF00FF.l		; 0F FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $002900.l,X		; FF 00 29 00
	lda ($00.b,S),Y		; B3 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $B32929.l,X		; FF 29 29 B3
	lda ($FF.b,S),Y		; B3 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	ora $00E7E8.l,X		; 1F E8 E7 00
	sbc $F0FF00.l,X		; FF 00 FF F0
	sbc ($40.b,S),Y		; F3 40
	sbc [$00.b],Y		; F7 00
	sbc $E00000.l,X		; FF 00 00 E0
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $F7F3F3.l,X		; FF F3 F3 F7
	sbc [$FF.b],Y		; F7 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	phd		; 0B
	brk $BD.b		; 00 BD
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0A0BFE.l,X		; FF FE 0B 0A
	lda $FFBD.w,X		; BD BD FF
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	rti		; 40

	brk $A0.b		; 00 A0
	rti		; 40

	tya		; 98
	rti		; 40

	lda $40AF48.l		; AF 48 AF 40
	sta [$60.b],Y		; 97 60
	bit #$21.b		; 89 21
	ora #$80.b		; 09 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	brk $D0.b		; 00 D0
	brk $E8.b		; 00 E8
	brk $F6.b		; 00 F6
	brk $F6.b		; 00 F6
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	jsr ($8100.w,X)		; FC 00 81
	bvs  -5.b		; 70 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $8F00.w,X		; 7E 00 8F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	rts		; 60

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
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	lda $7FA07F.l,X		; BF 7F A0 7F
	ldy #$3F.b		; A0 3F
	cmp $40807F.l		; CF 7F 80 40
	lda $1FFF00.l,X		; BF 00 FF 1F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $00C03F.l,X		; FF 3F C0 00
	bra   0.b		; 80 00
	lda $00FF00.l,X		; BF 00 FF 00
	inc $FEFF.w,X		; FE FF FE
	sbc $03FFFE.l,X		; FF FE FF 03
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $BA0000.l,X		; FF 00 00 BA
	brk $FF.b		; 00 FF
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	eor #$FF.b		; 49 FF
	ora $9BA4FF.l,X		; 1F FF A4 9B
	tsb $00FF.w		; 0C FF 00
	ora [$A0.b]		; 07 A0
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $66.b		; 00 66
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $FD.b		; 00 FD
	brk $00.b		; 00 00
	sbc $88FF00.l,X		; FF 00 FF 88
	sbc $E7FFDD.l,X		; FF DD FF E7
	adc $807961.l,X		; 7F 61 79 80
	sbc [$0A.b],Y		; F7 0A
	ldy #$FF.b		; A0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $86.b		; 00 86
	brk $08.b		; 00 08
	brk $5F.b		; 00 5F
	brk $00.b		; 00 00
	sbc $60FF00.l,X		; FF 00 FF 60
	sbc $66EFDD.l,X		; FF DD EF 66
	sbc $18F326.l,X		; FF 26 F3 18
	ror $05.b,X		; 76 05
	.db $82, $FF, $00		; 82 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00BF00.l,X		; FF 00 BF 00
	tsb $8900.w		; 0C 00 89
	brk $7D.b		; 00 7D
	brk $07.b		; 00 07
	sbc $FF00.w,Y		; F9 00 FF
	rti		; 40

	sbc $C9FF3B.l,X		; FF 3B FF C9
	lda $04FF76.l,X		; BF 76 FF 04
	bit $55.b		; 24 55
	rti		; 40

	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	stp		; DB
	brk $BF.b		; 00 BF
	brk $6C.b		; 00 6C
	adc $45.b,S		; 63 45
	lsr A		; 4A
	asl A		; 0A
	ora $35.b,X		; 15 35
	txa		; 8A
	asl A		; 0A
	lda $95.b,X		; B5 95
	rol A		; 2A
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	ora $0F3A00.l,X		; 1F 00 3A 0F
	adc ($1F.b),Y		; 71 1F
	cpx #$1F.b		; E0 1F
	sbc ($3F.b,X)		; E1 3F
	nop		; EA
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $20.b		; 00 20
	tad		; 5B
	pha		; 48
	lda ($A4.b),Y		; B1 A4
	cli		; 58
	mvn $A8,$A8		; 54 A8 A8
	mvn $AC,$50		; 54 50 AC
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	sbc $F0BF00.l,X		; FF 00 BF F0
	ora $F80FF8.l		; 0F F8 0F F8
	ora [$FC.b]		; 07 FC
	lda $00FFFC.l		; AF FC FF 00
	sbc $800000.l,X		; FF 00 00 80
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $D72800.l,X		; FF 00 28 D7
	eor [$AB.b],Y		; 57 AB
	and $00005F.l		; 2F 5F 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sta $FF.b,S		; 83 FF
	sta $FF.b,S		; 83 FF
	cmp $00FF7F.l		; CF 7F FF 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FEF9FF.l,X		; FF FF F9 FE
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $00FFC0.l,X		; FF C0 FF 00
	adc $80837F.l,X		; 7F 7F 83 80
	adc $7F8000.l,X		; 7F 00 80 7F
	adc $FFFFFF.l,X		; 7F FF FF FF
	asl $020F.w,X		; 1E 0F 02
	tsb $0080.w		; 0C 80 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $FFFF7F.l,X		; FF 7F FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FEFE.w,X		; FD FE FE
	sbc $CC34.w,X		; FD 34 CC
	asl $0002.w		; 0E 02 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FCFFFC.l,X		; FF FC FF FC
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	sbc $18F9.w,Y		; F9 F9 18
	sbc $00.b,S		; E3 00
	cop $E1.b		; 02 E1
	eor ($A2.b,X)		; 41 A2
	bra  99.b		; 80 63
	jsr $4030.w		; 20 30 40
	bvc   7.b		; 50 07
	brk $E7.b		; 00 E7
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
	sbc ($3E.b,X)		; E1 3E
	sbc ($3F.b,X)		; E1 3F
	sbc ($FF.b,X)		; E1 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc ($AA.b,X)		; E1 AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $55.b		; 00 55
	sbc $00FF08.l,X		; FF 08 FF 00
	sbc $55FF08.l,X		; FF 08 FF 55
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $C0.b		; 00 C0
	cpx #$40.b		; E0 40
	rts		; 60

	brk $E0.b		; 00 E0
	bra  96.b		; 80 60
	brk $B0.b		; 00 B0
	bra  48.b		; 80 30
	brk $10.b		; 00 10
	rti		; 40

	bpl  32.b		; 10 20
	brk $A0.b		; 00 A0
	brk $E0.b		; 00 E0
	bra  96.b		; 80 60
	bra -16.b		; 80 F0
	bra 112.b		; 80 70
	bra -16.b		; 80 F0
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
	brk $3F.b		; 00 3F
	bra   0.b		; 80 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $1F7F38.l,X		; 7F 38 7F 1F
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	adc $FF00FF.l,X		; 7F FF 00 FF
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	php		; 08
	adc $7F7F7F.l,X		; 7F 7F 7F 7F
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	clc		; 18
	sbc $E0FF3F.l,X		; FF 3F FF E0
	cpx #$FF.b		; E0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	ora $FFFFFF.l,X		; 1F FF FF FF
	sbc $3F3DDA.l,X		; FF DA 3D 3F
	phx		; DA
	tda		; 7B
	sbc [$44.b]		; E7 44
	sbc $00C0C0.l,X		; FF C0 C0 00
	brk $FF.b		; 00 FF
	sbc $FFC0A0.l,X		; FF A0 C0 FF
	asl $3FFF.w,X		; 1E FF 3F
	sbc $3FFF1E.l,X		; FF 1E FF 3F
	cpy #$3F.b		; C0 3F
	brk $FF.b		; 00 FF
	sbc $F0F0FF.l,X		; FF FF F0 F0
	sbc $FF0000.l,X		; FF 00 00 FF
	bra  -1.b		; 80 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	sta $7868FF.l		; 8F FF 68 78
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sei		; 78
	sta [$00.b]		; 87 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $ED.b		; 00 ED
	asl $ED1F.w,X		; 1E 1F ED
	ora $E2F3.w,X		; 1D F3 E2
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	ora $001FFF.l		; 0F FF 1F 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $CF0000.l,X		; FF 00 00 CF
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $20FF5C.l,X		; FF 5C FF 20
	sbc $80FF7F.l,X		; FF 7F FF 80
	bra  -5.b		; 80 FB
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$30.b]		; 07 30
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	bpl -32.b		; 10 E0
	bcc -96.b		; 90 A0
	bne -128.b		; D0 80
	beq -96.b		; F0 A0
	bcc  64.b		; 90 40
	bne  32.b		; D0 20
	bvs -96.b		; 70 A0
	bpl -16.b		; 10 F0
	brk $F0.b		; 00 F0
	bra -16.b		; 80 F0
	bra -16.b		; 80 F0
	bra 112.b		; 80 70
	brk $30.b		; 00 30
	brk $90.b		; 00 90
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	jsr ($C0C0.w,X)		; FC C0 C0
	cpy #$C0.b		; C0 C0
	bra -64.b		; 80 C0
	cpy #$80.b		; C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $C0FE.w,X		; FE FE C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	and $030303.l,X		; 3F 03 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $030303.l,X		; FF 03 03 03
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFE.l,X		; FF FE FF FF
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	lda $BFC040.l,X		; BF 40 C0 BF
	cpy #$FF.b		; C0 FF
	and $0000FF.l,X		; 3F FF 00 00
	brk $00.b		; 00 00
	sbc $3F7FFF.l,X		; FF FF 7F 3F
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $C0FF80.l,X		; FF 80 FF C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $807F80.l,X		; 7F 80 7F 80
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra  48.b		; 80 30
	jsr $00F0.w		; 20 F0 00
	bne   0.b		; D0 00
	cpx #$20.b		; E0 20
	cpx #$20.b		; E0 20
	cpx #$60.b		; E0 60
	cpx #$E0.b		; E0 E0
	cpx #$D0.b		; E0 D0
	brk $D0.b		; 00 D0
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	jsr $60E0.w		; 20 E0 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora ($00.b,X)		; 01 00
	plx		; FA
	asl $F8.b		; 06 F8
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $FF.b		; 00 FF
	sbc $00FFF8.l,X		; FF F8 FF 00
	mvp $00,$00		; 44 00 00
	rti		; 40

	jsr $DFC0.w		; 20 C0 DF
	bra  63.b		; 80 3F
	adc $00E06F.l		; 6F 6F E0 00
	lda $DFDF80.l,X		; BF 80 DF DF
	cpy #$C0.b		; C0 C0
	adc $DFFF00.l,X		; 7F 00 FF DF
	sbc $00903F.l,X		; FF 3F 90 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$00.b		; E0 00
	cpy #$C0.b		; C0 C0
	ora $00.b		; 05 00
	tsb $00.b		; 04 00
	sed		; F8
	php		; 08
	inc $FF.b,X		; F6 FF
	sed		; F8
	sbc $00FFF6.l,X		; FF F6 FF 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $000401.l,X		; FF 01 04 00
	brk $08.b		; 00 08
	brk $F6.b		; 00 F6
	sbc $000402.l,X		; FF 02 04 00
	brk $F9.b		; 00 F9
	sbc $03FFFE.l,X		; FF FE FF 03
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $004403.l,X		; FF 03 44 00
	brk $08.b		; 00 08
	php		; 08
	rti		; 40

	and [$C8.b]		; 27 C8
	cmp $771F90.l		; CF 90 1F 77
	adc [$77.b],Y		; 77 77
	adc [$B8.b],Y		; 77 B8
	bra -120.b		; 80 88
	cmp [$0F.b]		; C7 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	cmp [$FF.b]		; C7 FF
	ora $880088.l		; 0F 88 00 88
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	php		; 08
	ora ($F2.b,X)		; 01 F2
	ora ($F9.b,X)		; 01 F9
	tsb $FC.b		; 04 FC
	sbc [$F7.b],Y		; F7 F7
	sbc [$F7.b],Y		; F7 F7
	asl $0800.w		; 0E 00 08
	sbc ($F8.b),Y		; F1 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $F8FF.w,Y		; F9 FF F8
	php		; 08
	brk $08.b		; 00 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $A0.b		; 00 A0
	cpy #$E0.b		; C0 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $59.b		; 00 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	bmi 112.b		; 30 70
	rol $44AE.w,X		; 3E AE 44
	lsr $42.b,X		; 56 42
	eor ($53.b,X)		; 41 53
	eor ($33.b,S),Y		; 53 33
	rol $6F73.w		; 2E 73 6F
	jmp ($6C00.w)		; 6C 00 6C
	brk $CF.b		; 00 CF
	jmp ($E0D6.w,X)		; 7C D6 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	ora $45.b,S		; 03 45
	eor $77.b		; 45 77
	adc [$66.b],Y		; 77 66
	lsr $24.b		; 46 24
	cpy $E0.b		; C4 E0
	and $E629.w		; 2D 29 E6
	cmp $000DE0.l,X		; DF E0 0D 00
	ldy $F2.b,X		; B4 F2
	lda $FFFF0F.l,X		; BF 0F FF FF
	jmp $033A.w		; 4C 3A 03
	cpy #$C0.b		; C0 C0
	cmp $CB.b,S		; C3 CB
	ldx $574E.w,Y		; BE 4E 57
	eor [$77.b]		; 47 77
	cpy $10.b		; C4 10
	ora $0D1000.l		; 0F 00 10 0D
	cmp [$87.b]		; C7 87
	tsb $C4.b		; 04 C4
	inc $F041.w		; EE 41 F0
	ora $000F00.l		; 0F 00 0F 00
	brk $C4.b		; 00 C4
	lda $10.b,X		; B5 10
	lda ($A0.b)		; B2 A0
	cpx #$13.b		; E0 13
	lda $99C00F.l,X		; BF 0F C0 99
	ldy $F99F.w		; AC 9F F9
	txy		; 9B
	cmp $57.b		; C5 57
	adc $C0.b,X		; 75 C0
	sbc $54.b		; E5 54
	.db $62, $55, $44		; 62 55 44
	xba		; EB
	ora ($0F.b,S),Y		; 13 0F
	cpy #$CA.b		; C0 CA
	iny		; C8
	sta $ACC9.w,X		; 9D C9 AC
	ldy $CCCC.w,X		; BC CC CC
	ldy $10.b,X		; B4 10
	ora $2A.b		; 05 2A
	rtl		; 6B

	ora $00.b		; 05 00
	bit $C0C5.w,X		; 3C C5 C0
	and $75.b,S		; 23 75
	bpl   1.b		; 10 01
	adc [$13.b]		; 67 13
	inc $C403.w,X		; FE 03 C4
	bpl -19.b		; 10 ED
	bit $D6.b		; 24 D6
	asl $02F0.w		; 0E F0 02
	ora $23B4.w,X		; 1D B4 23
	sta ($31.b),Y		; 91 31
	bpl -13.b		; 10 F3
	beq  30.b		; F0 1E
	asl $FFC0.w		; 0E C0 FF
	brk $21.b		; 00 21
	ldy $00EF.w		; AC EF 00
	xba		; EB
	txy		; 9B
	cpy $F2.b		; C4 F2
	cmp ($23.b),Y		; D1 23
	asl $07EE.w,X		; 1E EE 07
	rol $B4FE.w		; 2E FE B4
	pea $A252.w		; F4 52 A2
	bmi -22.b		; 30 EA
	cmp $C06402.l		; CF 02 64 C0
	phx		; DA
	dec $EDEE.w,X		; DE EE ED
	wai		; CB
	cpy $EDDD.w		; CC DD ED
	ldy $01.b,X		; B4 01
	and $F13DE1.l		; 2F E1 3D F1
	and ($FE.b,X)		; 21 FE
	bit $B4.b		; 24 B4
	sbc $14CC72.l		; EF 72 CC 14
	bit $FBE4.w		; 2C E4 FB
	trb $B4.b		; 14 B4
	rol $5ED2.w,X		; 3E D2 5E
	cmp $4F.b,X		; D5 4F
	sbc ($10.b,X)		; E1 10
	dec $64B4.w,X		; DE B4 64
	sbc $10F2.w		; ED F2 10
	and $FD020F.l,X		; 3F 0F 02 FD
	cpy #$FF.b		; C0 FF
	ora ($20.b)		; 12 20
	lda #$CF.b		; A9 CF
	ora $C4BBDA.l		; 0F DA BB C4
	sbc ($FE.b)		; F2 FE
	and ($0E.b,S),Y		; 33 0E
	cmp $EE2026.l,X		; DF 26 20 EE
	ldy $E5.b,X		; B4 E5
	eor $2FC5.w		; 4D C5 2F
	phd		; 0B
	lda $C05E24.l,X		; BF 24 5E C0
	dex		; CA
	ldy $DCDE.w,X		; BC DE DC
	tyx		; BB
	cmp $DDDD.w		; CD DD DD
	ldy $F0.b		; A4 F0
	brk $02.b		; 00 02
	lsr $22E1.w		; 4E E1 22
	bpl  32.b		; 10 20
	ldy $DF.b		; A4 DF
	adc $DC.b,S		; 63 DC
	cop $1F.b		; 02 1F
	and $FC.b,X		; 35 FC
	sbc $A4.b,X		; F5 A4
	eor ($F4.b,X)		; 41 F4
	rol A		; 2A
	cpy $62.b		; C4 62
	brk $ED.b		; 00 ED
	pei ($B4.b)		; D4 B4
	mvn $E1,$0E		; 54 0E E1
	ora ($1F.b)		; 12 1F
	ora $C41DE2.l,X		; 1F E2 1D C4
	sbc ($20.b,X)		; E1 20
	asl $13BE.w		; 0E BE 13
	bpl -35.b		; 10 DD
	and $0EF2C4.l		; 2F C4 F2 0E
	and $0D.b,S		; 23 0D
	cpx #$26.b		; E0 26
	bpl  -2.b		; 10 FE
	ldy $F5.b,X		; B4 F5
	pld		; 2B
	sbc $1F.b,X		; F5 1F
	tas		; 1B
	lda $C01D35.l,X		; BF 35 1D C0
	dex		; CA
	plb		; AB
	cmp $BBCB.w,X		; DD CB BB
	cmp $DDDD.w		; CD DD DD
	sty $30.b,X		; 94 30
	ora ($02.b),Y		; 11 02
	eor $4134E1.l		; 4F E1 34 41
	tsb $D094.w		; 0C 94 D0
	mvn $E0,$EC		; 54 EC E0
	jsl $E62C75.l		; 22 75 2C E6
	ldy $33.b		; A4 33
	ora ($EB.b,S),Y		; 13 EB
	cmp ($53.b)		; D2 53
	and $B405CD.l		; 2F CD 05 B4
	mvn $E0,$1E		; 54 1E E0
	and $0F.b,S		; 23 0F
	asl $1DF2.w,X		; 1E F2 1D
	cpy $F1.b		; C4 F1
	bpl  14.b		; 10 0E
	ldx $1F13.w,Y		; BE 13 1F
	dec $C02F.w,X		; DE 2F C0
	lda $E1CC.w,X		; BD CC E1
	ora $F4CC.w		; 0D CC F4
	adc $42.b		; 65 42
	bcs  55.b		; B0 37
	adc ($26.b,S),Y		; 73 26
	ror $50.b,X		; 76 50
	cpy $4003.w		; CC 03 40
	cpy #$CA.b		; C0 CA
	plb		; AB
	cmp $BBCB.w,X		; DD CB BB
	cmp $CDDD.w		; CD DD CD
	sty $01.b,X		; 94 01
	and ($E0.b,X)		; 21 E0
	and $5124F1.l,X		; 3F F1 24 51
	jmp.w [$F094]		; DC 94 F0
	and ($0D.b,S),Y		; 33 0D
	cpx #$13.b		; E0 13
	eor $1E.b,X		; 55 1E
	pea $33A4.w		; F4 A4 33
	and ($EB.b),Y		; 31 EB
.ACCU 8
.INDEX 8
	sep #$34		; E2 34
	rol $16BE.w,X		; 3E BE 16
	ldy $53.b,X		; B4 53
	asl $23E1.w,X		; 1E E1 23
	brk $0E.b		; 00 0E
	sbc ($1D.b)		; F2 1D
	cpy #$12.b		; C0 12
	and ($20.b,S),Y		; 33 20
	tsx		; BA
	ldx $BAFE.w,Y		; BE FE BA
	wai		; CB
	cpy $F1.b		; C4 F1
	ora $F0FD32.l		; 0F 32 FD F0
	and $10.b,X		; 35 10
	sbc $0C03B4.l,X		; FF B4 03 0C
	ora ($1F.b,S),Y		; 13 1F
	phd		; 0B
	cmp ($23.b),Y		; D1 23
	tsb $ACB4.w		; 0C B4 AC
	ora ($2F.b,X)		; 01 2F
	dec $1100.w,X		; DE 00 11
	ora $ABB0F0.l		; 0F F0 B0 AB
	cpy $CCBB.w		; CC BB CC
	cmp $00DE.w		; CD DE 00
	inc $F194.w,X		; FE 94 F1
	and ($1E.b,X)		; 21 1E
	beq  18.b		; F0 12
	eor $2E.b,S		; 43 2E
	pea $33A4.w		; F4 A4 33
	and ($DC.b),Y		; 31 DC
	sbc ($34.b),Y		; F1 34
	rol $26BE.w,X		; 3E BE 26
	ldy $53.b,X		; B4 53
	asl $32E1.w,X		; 1E E1 32
	ora $1DF10F.l,X		; 1F 0F F1 1D
	cpy #$12.b		; C0 12
	and ($20.b,S),Y		; 33 20
	wai		; CB
	dec $BBFD.w		; CE FD BB
	wai		; CB
	ldy $F1.b,X		; B4 F1
	beq  83.b		; F0 53
	cpx $67E1.w		; EC E1 67
	bmi -18.b		; 30 EE
	bcs  87.b		; B0 57
	adc $46.b,S		; 63 46
	ror $40.b		; 66 40
	dec $2E13.w,X		; DE 13 2E
	ldy $AD.b,X		; B4 AD
	ora ($1F.b,X)		; 01 1F
	dec $1100.w,X		; DE 00 11
	ora $2494F0.l		; 0F F0 94 24
	ora $1000CE.l,X		; 1F CE 00 10
	ora $30.b,S		; 03 30
	inc $1084.w		; EE 84 10
	and ($1E.b,S),Y		; 33 1E
	ora $F1.b,S		; 03 F1
	eor $3D.b,X		; 55 3D
	tsb $A4.b		; 04 A4
	bit $21.b,X		; 34 21
	cmp $34F1.w,X		; DD F1 34
	rol $26CE.w		; 2E CE 26
	ldy $53.b,X		; B4 53
	ora $0033E1.l		; 0F E1 33 00
	asl $0E01.w		; 0E 01 0E
	ldy $F2.b,X		; B4 F2
	bpl  -5.b		; 10 FB
	stz $1D13.w,X		; 9E 13 1D
	bcs  31.b		; B0 1F
	ldy $F1.b,X		; B4 F1
	sbc ($52.b),Y		; F1 52
	cpx $67F1.w		; EC F1 67
	jsr $B0EE.w		; 20 EE B0
	adc [$64.b]		; 67 64
	lsr $65.b		; 46 65
	bmi -17.b		; 30 EF
	ora ($2E.b)		; 12 2E
	ldy $BD.b,X		; B4 BD
	ora ($1F.b,X)		; 01 1F
	dec $1100.w,X		; DE 00 11
	ora $3494F0.l		; 0F F0 94 34
	and $00BD.w		; 2D BD 00
	and $F02001.l		; 2F 01 20 F0
	ldy #$CC.b		; A0 CC
	cmp $F0EE.w		; CD EE F0
	sbc $011000.l,X		; FF 00 10 01
	ldy $33.b		; A4 33
	jsr $01ED.w		; 20 ED 01
	bit $2D.b,X		; 34 2D
	dec $B436.w,X		; DE 36 B4
	eor $0F.b,S		; 43 0F
	sbc ($33.b),Y		; F1 33
	brk $0E.b		; 00 0E
	ora ($0E.b,X)		; 01 0E
	ldy $F2.b,X		; B4 F2
	bpl  -6.b		; 10 FA
	ldx $1C22.w		; AE 22 1C
	cpy #$1F.b		; C0 1F
	ldy $F1.b,X		; B4 F1
	sbc ($42.b)		; F2 42
	sbc $56F2.w		; ED F2 56
	jsr $B0EF.w		; 20 EF B0
	adc [$64.b]		; 67 64
	lsr $65.b		; 46 65
	bmi -32.b		; 30 E0
	jsl $CEB41D.l		; 22 1D B4 CE
	ora ($0E.b,X)		; 01 0E
	inc $2000.w		; EE 00 20
	asl $9400.w		; 0E 00 94
	eor $1C.b		; 45 1C
	lda $10F2.w		; AD F2 10
	cpx #$01.b		; E0 01
	sbc ($84.b),Y		; F1 84
	jsr $02F2.w		; 20 F2 02
	adc $FB.b,S		; 63 FB
	ora $00.b,S		; 03 00
	ora ($A4.b)		; 12 A4
	and $20.b,S		; 23 20
	inc $3301.w		; EE 01 33
	rol $26DF.w		; 2E DF 26
	ldy $43.b,X		; B4 43
	asl $3301.w		; 0E 01 33
	brk $0F.b		; 00 0F
	sbc ($FE.b)		; F2 FE
	ldy $01.b,X		; B4 01
	bpl -21.b		; 10 EB
	ldx $0D12.w,Y		; BE 12 0D
	bne  31.b		; D0 1F
	ldy $F0.b,X		; B4 F0
	cop $42.b		; 02 42
	sbc $65F2.w		; ED F2 65
	bpl  -1.b		; 10 FF
	ldy $32.b		; A4 32
	dec $1F22.w,X		; DE 22 1F
	wai		; CB
	sbc $31.b,S		; E3 31
	phx		; DA
	ldy $9D.b		; A4 9D
	cop $0C.b		; 02 0C
	lda OAMADDL.w		; AD 02 21
	sbc $94F1.w,X		; FD F1 94
	eor $1B.b		; 45 1B
	ldy $2F02.w		; AC 02 2F
	dec $1210.w		; CE 10 12
	sty $1F.b,X		; 94 1F
	beq  18.b		; F0 12
	.db $42, $ED		; 42 ED
	beq   1.b		; F0 01
	ora ($A4.b,X)		; 01 A4
	ora ($30.b)		; 12 30
	sbc $1E32F2.l		; EF F2 32 1E
	sbc $75A436.l		; EF 36 A4 75
	asl $74F3.w		; 0E F3 74
	bpl  -2.b		; 10 FE
	ora ($FC.b),Y		; 11 FC
	ldy $01.b,X		; B4 01
	bpl -21.b		; 10 EB
	lda $E00C11.l,X		; BF 11 0C E0
	ora $12F0B4.l,X		; 1F B4 F0 12
	and ($ED.b)		; 32 ED
	cop $55.b		; 02 55
	ora $41A4F0.l,X		; 1F F0 A4 41
	inc $0F12.w		; EE 12 0F
	jmp.w [$21F2]		; DC F2 21
	phx		; DA
	ldy $BE.b		; A4 BE
	ora ($FC.b,X)		; 01 FC
	lda OAMADDH.w		; AD 03 21
	sbc $94F1.w		; ED F1 94
	ror $FA.b,X		; 76 FA
	ldy $2E03.w		; AC 03 2E
	lda $13F1.w,X		; BD F1 13
	sty $2E.b,X		; 94 2E
	sbc $EB5213.l,X		; FF 13 52 EB
	sbc $A41010.l,X		; FF 10 10 A4
	ora ($10.b)		; 12 10
	sbc $1E3201.l,X		; FF 01 32 1E
	cpx #$35.b		; E0 35
	ldy $74.b		; A4 74
	ora $6404.w,X		; 1D 04 64
	bpl  -1.b		; 10 FF
	cop $ED.b		; 02 ED
	ldy $01.b,X		; B4 01
	bpl -37.b		; 10 DB
	cmp $E1FD11.l		; CF 11 FD E1
	ora $0300B4.l		; 0F B4 00 03
	and ($EE.b),Y		; 31 EE
	cop $54.b		; 02 54
	ora $22A400.l,X		; 1F 00 A4 22
	cmp $CD0F12.l,X		; DF 12 0F CD
	cop $20.b		; 02 20
	stp		; DB
	ldy $BF.b		; A4 BF
	ora ($EB.b),Y		; 11 EB
	lda $2103.w,X		; BD 03 21
	dec $94F2.w,X		; DE F2 94
	adc $FB.b		; 65 FB
	stz $1E13.w		; 9C 13 1E
	ldy $34E1.w		; AC E1 34
	sty $1E.b,X		; 94 1E
	cmp $CC4315.l,X		; DF 15 43 CC
	cmp $A41F11.l,X		; DF 11 1F A4
	ora ($20.b,X)		; 01 20
	sbc $1E3201.l,X		; FF 01 32 1E
	cpx #$35.b		; E0 35
	ldy $64.b		; A4 64
	asl $6305.w,X		; 1E 05 63
	bpl -16.b		; 10 F0
	ora ($ED.b,X)		; 01 ED
	ldy $01.b,X		; B4 01
	ora $11CFEB.l,X		; 1F EB CF 11
	sbc $1FE1.w,X		; FD E1 1F
	ldy $F0.b,X		; B4 F0
	ora ($21.b,S),Y		; 13 21
	sbc $1F4303.l		; EF 03 43 1F
	brk $A4.b		; 00 A4
	and ($E0.b),Y		; 31 E0
	ora ($0F.b,X)		; 01 0F
	dec $1002.w,X		; DE 02 10
	stp		; DB
	ldy $DF.b		; A4 DF
	bpl -21.b		; 10 EB
	ldx $2012.w,Y		; BE 12 20
	dec $94F3.w,X		; DE F3 94
	stz $FA.b,X		; 74 FA
	sta $2D13.w,X		; 9D 13 2D
	txs		; 9A
.ACCU 8
.INDEX 8
	sep #$34		; E2 34
	sty $1D.b,X		; 94 1D
	cmp $DB4225.l,X		; DF 25 42 DB
	cmp $A41D11.l		; CF 11 1D A4
	ora ($10.b,X)		; 01 10
	beq   1.b		; F0 01
	jsl $35F01E.l		; 22 1E F0 35
	ldy $54.b		; A4 54
	ora $106315.l		; 0F 15 63 10
	beq   0.b		; F0 00
	sbc $01B4.w		; ED B4 01
	ora $10DFDC.l,X		; 1F DC DF 10
	sbc $00F1.w,X		; FD F1 00
	ldy $E0.b		; A4 E0
	and $41.b,X		; 35 41
	dec $7506.w,X		; DE 06 75
	and $21A401.l		; 2F 01 A4 21
	sbc $EEFF11.l,X		; FF 11 FF EE
	cop $1F.b		; 02 1F
	cpx $D0A4.w		; EC A4 D0
	bpl -37.b		; 10 DB
	dec $1013.w		; CE 13 10
	dec $B0F3.w,X		; DE F3 B0
	sbc $CDCCFD.l		; EF FD CC CD
	sbc $ABBA.w		; ED BA AB
	cmp $1C94.w		; CD 94 1C
	cmp $CA5225.l,X		; DF 25 52 CA
	dec $0D11.w,X		; DE 11 0D
	ldy #$AB.b		; A0 AB
	cpy $DECC.w		; CC CC DE
	cop $21.b		; 02 21
	brk $27.b		; 00 27
	ldy $53.b		; A4 53
	brk $15.b		; 00 15
	mvn $0F,$00		; 54 00 0F
	bpl -34.b		; 10 DE
	ldy $02.b		; A4 02
	asl $AFA9.w,X		; 1E A9 AF
	bpl -37.b		; 10 DB
	sbc ($0F.b)		; F2 0F
	ldy $F1.b		; A4 F1
	and $40.b		; 25 40
	cmp $106416.l,X		; DF 16 64 10
	ora ($94.b,X)		; 01 94
	adc ($EF.b,X)		; 61 EF
	jsr $CD0D.w		; 20 0D CD
	jsl $A4C92E.l		; 22 2E C9 A4
	cpx #$00.b		; E0 00
	xba		; EB
	dec $1022.w		; CE 22 10
	dec $A402.w,X		; DE 02 A4
	.db $42, $FD		; 42 FD
	cmp $CD0E12.l,X		; DF 12 0E CD
	sbc ($22.b,X)		; E1 22
	sty $0D.b,X		; 94 0D
	dec $5135.w		; CE 35 51
	dex		; CA
	cmp $A4FD02.l		; CF 02 FD A4
	cpx #$10.b		; E0 10
	brk $01.b		; 00 01
	and ($1F.b,X)		; 21 1F
	beq  52.b		; F0 34
	ldy $62.b		; A4 62
	ora $105325.l,X		; 1F 25 53 10
	beq  31.b		; F0 1F
	cmp $1E01A4.l,X		; DF A4 01 1E
	lda #$CE.b		; A9 CE
	ora $0001DC.l,X		; 1F DC 01 00
	ldy $F1.b		; A4 F1
	bit $30.b,X		; 34 30
	sbc $106325.l		; EF 25 63 10
	cop $94.b		; 02 94
	eor ($E1.b),Y		; 51 E1
	brk $0D.b		; 00 0D
	cmp $CB1E22.l		; CF 22 1E CB
	ldy $F0.b		; A4 F0
	ora $12CFDC.l,X		; 1F DC CF 12
	ora $9403EE.l,X		; 1F EE 03 94
	.db $62, $FB, $BE		; 62 FB BE
	and $1A.b,S		; 23 1A
	sta $43D2.w,Y		; 99 D2 43
	sty $0B.b,X		; 94 0B
	cmp $DA4035.l,X		; DF 35 40 DA
	dec $EC11.w		; CE 11 EC
	ldy $E0.b		; A4 E0
	brk $00.b		; 00 00
	ora ($11.b),Y		; 11 11
	ora $A425F1.l,X		; 1F F1 25 A4
	eor ($10.b)		; 52 10
	and $52.b		; 25 52
	bpl   0.b		; 10 00
	ora $01A4DF.l		; 0F DF A4 01
	asl $CFB9.w		; 0E B9 CF
	ora $0001DD.l		; 0F DD 01 00
	ldy $01.b		; A4 01
	bit $20.b,X		; 34 20
	sbc $105334.l		; EF 34 53 10
	ora $84.b,S		; 03 84
	stz $E0.b,X		; 74 E0
	brk $0B.b		; 00 0B
	ldx $1D33.w,Y		; BE 33 1D
	sta $00B0.w,Y		; 99 B0 00
	brk $FD.b		; 00 FD
	tyx		; BB
	cmp $CCED.w		; CD ED CC
	dec $5294.w		; CE 94 52
	cpx $32BE.w		; EC BE 32
	inc A		; 1A
	sta $42D2.w,Y		; 99 D2 42
	sty $FC.b,X		; 94 FC
	dec $4035.w,X		; DE 35 40
	dex		; CA
	dec $EB11.w		; CE 11 EB
	ldy $EF.b		; A4 EF
	ora ($00.b,X)		; 01 00
	ora ($11.b,X)		; 01 11
	ora $A43400.l,X		; 1F 00 34 A4
	eor $01.b,S		; 43 01
	and $52.b		; 25 52
	bpl -15.b		; 10 F1
	asl $A4EE.w		; 0E EE A4
	cop $FE.b		; 02 FE
	plb		; AB
	dec $DD0F.w,X		; DE 0F DD
	ora ($00.b),Y		; 11 00
	ldy $01.b		; A4 01
	bit $20.b,X		; 34 20
	cpx #$25.b		; E0 25
	.db $42, $10		; 42 10
	ora ($94.b)		; 12 94
	eor ($F0.b)		; 52 F0
	brk $0E.b		; 00 0E
	cpx #$11.b		; E0 11
	ora $F194DD.l		; 0F DD 94 F1
	asl $AEBA.w,X		; 1E BA AE
	and ($1D.b,S),Y		; 33 1D
	cmp $B025.w		; CD 25 B0
	brk $0F.b		; 00 0F
	inc $FEEF.w		; EE EF FE
	wai		; CB
	plb		; AB
	cmp $EC94.w		; CD 94 EC
	cmp $BB3035.l		; CF 35 30 BB
	dec $EB10.w		; CE 10 EB
	bcs -86.b		; B0 AA
	plb		; AB
	ldy $DECC.w,X		; BC CC DE
	inc $02EF.w		; EE EF 02
	ldy $42.b		; A4 42
	ora ($35.b),Y		; 11 35
	.db $42, $00		; 42 00
	brk $0E.b		; 00 0E
	sbc $FE01A4.l		; EF A4 01 FE
	tyx		; BB
	cmp $01DEFF.l,X		; DF FF DE 01
	bpl -80.b		; 10 B0
	cmp $11E0.w		; CD E0 11
	brk $13.b		; 00 13
	lsr $65.b,X		; 56 65
	ror $94.b		; 66 94
	.db $62, $00, $00		; 62 00 00
	asl $10F0.w		; 0E F0 10
	brk $ED.b		; 00 ED
	sty $00.b,X		; 94 00
	asl $BFCB.w,X		; 1E CB BF
	jsl $24CE1D.l		; 22 1D CE 24
	sty $41.b,X		; 94 41
	sbc $22C0.w		; ED C0 22
	xce		; FB
	tax		; AA
	cmp ($31.b),Y		; D1 31
	sty $EC.b,X		; 94 EC
	cmp $BB2025.l,X		; DF 25 20 BB
	dec $DA00.w,X		; DE 00 DA
	bcs -87.b		; B0 A9
	tax		; AA
	tyx		; BB
	ldy $EEDD.w,X		; BC DD EE
	inc $A402.w		; EE 02 A4
	.db $42, $02		; 42 02
	and $32.b,X		; 35 32
	ora ($00.b,X)		; 01 00
	inc $A4EF.w,X		; FE EF A4
	ora ($FD.b,X)		; 01 FD
	wai		; CB
	sbc $01EEFE.l		; EF FE EE 01
	bpl -80.b		; 10 B0
	cmp $11F0.w		; CD F0 11
	brk $24.b		; 00 24
	eor $55.b,X		; 55 55
	lsr $94.b,X		; 56 94
	eor ($00.b)		; 52 00
	brk $F0.b		; 00 F0
	beq  16.b		; F0 10
	beq  -2.b		; F0 FE
	sty $00.b,X		; 94 00
	ora $12C0CB.l,X		; 1F CB C0 12
	ora $14DF.w		; 0D DF 14
	sty $31.b,X		; 94 31
	sbc $21D0.w		; ED D0 21
	phd		; 0B
	tax		; AA
	sbc ($21.b,X)		; E1 21
	sty $EB.b,X		; 94 EB
	cmp $CB2F24.l,X		; DF 24 2F CB
	dec $DA00.w,X		; DE 00 DA
	bcs -103.b		; B0 99
	txs		; 9A
	tax		; AA
	tyx		; BB
	cmp $EEDD.w		; CD DD EE
	cop $A4.b		; 02 A4
	eor ($12.b,X)		; 41 12
	bit $41.b,X		; 34 41
	bpl   0.b		; 10 00
	inc $A4EF.w,X		; FE EF A4
	ora ($ED.b,X)		; 01 ED
	cpy $FEEF.w		; CC EF FE
	sbc $941001.l		; EF 01 10 94
	trb $64.b		; 14 64
	and $6256F2.l		; 2F F2 56 62
	ora ($36.b),Y		; 11 36
	sty $52.b,X		; 94 52
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	bpl -16.b		; 10 F0
	beq -124.b		; F0 84
	beq  14.b		; F0 0E
	cmp #$AE.b		; C9 AE
	and ($0B.b)		; 32 0B
	lda $9436.w,X		; BD 36 94
	jsr $E0FE.w		; 20 FE E0
	ora ($FC.b),Y		; 11 FC
	tyx		; BB
	cmp ($20.b),Y		; D1 20
	sty $EB.b,X		; 94 EB
	cmp $CB2F32.l,X		; DF 32 2F CB
	dec $CA00.w,X		; DE 00 CA
	sty $AD.b,X		; 94 AD
	brk $F0.b		; 00 F0
	ora ($21.b),Y		; 11 21
	bpl   3.b		; 10 03
	eor [$C0.b],Y		; 57 C0
	ora ($22.b)		; 12 22
	bit $44.b,X		; 34 44
	mvp $32,$43		; 44 43 32
	and ($B0.b,X)		; 21 B0
	jsl $CCEC20.l		; 22 20 EC CC
	tyx		; BB
	tax		; AA
	plb		; AB
	cpy $2394.w		; CC 94 23
	stz $1F.b		; 64 1F
	ora ($56.b,X)		; 01 56
	eor ($12.b),Y		; 51 12
	eor $94.b		; 45 94
	eor $00.b,S		; 43 00
	brk $10.b		; 00 10
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	sty $10.b		; 84 10
	beq -53.b		; F0 CB
	cmp $CEFC21.l		; CF 21 FC CE
	bit $94.b		; 24 94
	ora ($FE.b),Y		; 11 FE
	cpx #$10.b		; E0 10
	tsb $D1CC.w		; 0C CC D1
	ora $DFEC94.l,X		; 1F 94 EC DF
	jsl $DECC1F.l		; 22 1F CC DE
	ora $BD94C9.l		; 0F C9 94 BD
	cpx #$00.b		; E0 00
	cop $21.b		; 02 21
	brk $13.b		; 00 13
	ror $C0.b		; 66 C0
	ora ($22.b)		; 12 22
	bit $44.b,X		; 34 44
	mvp $32,$33		; 44 33 32
	ora ($94.b),Y		; 11 94
	brk $DA.b		; 00 DA
	txs		; 9A
	dec $CEEC.w,X		; DE EC CE
	and ($11.b,X)		; 21 11
	sty $24.b,X		; 94 24
	mvn $02,$1F		; 54 1F 02
	lsr $32.b		; 46 32
	cop $46.b		; 02 46
	bcs 119.b		; B0 77
	ror $66.b,X		; 76 66
	adc $55.b		; 65 55
	mvp $33,$43		; 44 43 33
	ldy #$65.b		; A0 65
	mvp $21,$43		; 44 43 21
	jsl $00FF10.l		; 22 10 FF 00
	ldy #$11.b		; A0 11
	ora $FEFFFF.l		; 0F FF FF FE
	dex		; CA
	tax		; AA
	tyx		; BB
	sty $DD.b,X		; 94 DD
	cmp $CC1E12.l,X		; DF 12 1E CC
	cmp $94BAFF.l,X		; DF FF BA 94
	lda $F0F0.w		; AD F0 F0
	cop $21.b		; 02 21
	ora ($13.b,X)		; 01 13
	lsr $B0.b,X		; 56 B0
	and $34.b,S		; 23 34
	adc [$77.b]		; 67 77
	adc [$76.b],Y		; 77 76
	eor ($22.b,S),Y		; 53 22
	sty $0F.b,X		; 94 0F
	phx		; DA
	plb		; AB
	dec $DEEC.w,X		; DE EC DE
	and ($11.b,X)		; 21 11
	sty $24.b,X		; 94 24
	eor ($1F.b,S),Y		; 53 1F
	cop $54.b		; 02 54
	eor ($02.b,X)		; 41 02
	lsr $B0.b		; 46 B0
	adc [$66.b]		; 67 66
	ror $66.b		; 66 66
	eor $44.b,X		; 55 44
	and ($33.b,S),Y		; 33 33
	stz $ED.b,X		; 74 ED
	cmp ($2F.b)		; D2 2F
	cpy #$F0.b		; C0 F0
	cmp $24BD.w,X		; DD BD 24
	sty $0F.b		; 84 0F
	asl $00E0.w		; 0E E0 00
	jsr ($D0A9.w,X)		; FC A9 D0
	asl $DD94.w		; 0E 94 DD
	bne  17.b		; D0 11
	asl $DFDC.w		; 0E DC DF
	inc $94BA.w,X		; FE BA 94
	ldy $00FF.w,X		; BC FF 00
	ora ($21.b,X)		; 01 21
	bpl  20.b		; 10 14
	lsr $94.b,X		; 56 94
	eor $35.b,S		; 43 35
	adc [$42.b]		; 67 42
	ora ($FE.b,X)		; 01 FE
	jmp.w [$94DF]		; DC DF 94
	ora $EEACCA.l		; 0F CA AC EE
	cmp $11DF.w,X		; DD DF 11
	ora ($94.b)		; 12 94
	bit $42.b		; 24 42
	bpl -13.b		; 10 F3
	mvp $02,$31		; 44 31 02
	lsr $94.b		; 46 94
	eor $1F.b,S		; 43 1F
	ora ($21.b),Y		; 11 21
	ora $1001FF.l		; 0F FF 01 10
	stz $CC.b,X		; 74 CC
.ACCU 8
	sep #$63		; E2 63
	sbc $BFF0EE.l		; EF EE F0 BF
	ora ($84.b),Y		; 11 84
	sbc $F0E00F.l,X		; FF 0F E0 F0
	sbc $CFCC.w,X		; FD CC CF
	sbc $EFDC94.l,X		; FF 94 DC EF
	ora ($0F.b),Y		; 11 0F
	cpy $0DEE.w		; CC EE 0D
	tsx		; BA
	sty $AD.b,X		; 94 AD
	sbc $220100.l		; EF 00 01 22
	brk $33.b		; 00 33
	eor $94.b,X		; 55 94
	eor $36.b,S		; 43 36
	eor [$32.b],Y		; 57 32
	ora $DFDCFE.l,X		; 1F FE DC DF
	sty $0E.b,X		; 94 0E
	wai		; CB
	ldy $DDEE.w,X		; BC EE DD
	bne   1.b		; D0 01
	ora ($94.b)		; 12 94
	bit $42.b		; 24 42
	ora $213403.l,X		; 1F 03 34 21
	cop $55.b		; 02 55
	sty $51.b,X		; 94 51
	and $FF2211.l		; 2F 11 22 FF
	inc $1011.w,X		; FE 11 10
	stz $BD.b,X		; 74 BD
	inc $64.b		; E6 64
	ora $EF00C0.l,X		; 1F C0 00 EF
	beq -124.b		; F0 84
	cmp ($F0.b),Y		; D1 F0
	ora $DBF0FF.l		; 0F FF F0 DB
	inc $94FD.w,X		; FE FD 94
	cpx $01E0.w		; EC E0 01
	inc $EEDC.w,X		; FE DC EE
	inc $94BA.w,X		; FE BA 94
	ldy $F0EF.w,X		; BC EF F0
	ora ($21.b),Y		; 11 21
	ora ($24.b),Y		; 11 24
	eor $94.b		; 45 94
	eor $35.b,S		; 43 35
	adc $42.b		; 65 42
	beq  -2.b		; F0 FE
	cpy $94D0.w		; CC D0 94
	inc $CCCB.w,X		; FE CB CC
	inc $DFDD.w,X		; FE DD DF
	ora ($12.b),Y		; 11 12
	sty $24.b,X		; 94 24
	and ($00.b)		; 32 00
	ora $42.b,S		; 03 42
	jsr $5502.w		; 20 02 55
	sty $43.b,X		; 94 43
	ora ($03.b,X)		; 01 03
	ora ($1E.b),Y		; 11 1E
	cpx #$01.b		; E0 01
	ora $06DB74.l,X		; 1F 74 DB 06
	adc [$2D.b],Y		; 77 2D
	asl $0E20.w,X		; 1E 20 0E
	tsb $DF74.w		; 0C 74 DF
	bpl  -3.b		; 10 FD
	inc $EB00.w,X		; FE 00 EB
	lda $94FA.w		; AD FA 94
	dec $00EF.w,X		; DE EF 00
	ora $EEDD.w		; 0D DD EE
	sbc $94BA.w,X		; FD BA 94
	lda $00EE.w,X		; BD EE 00
	cop $21.b		; 02 21
	ora ($24.b),Y		; 11 24
	mvn $43,$94		; 54 94 43
	and $64.b,X		; 35 64
	and ($F0.b)		; 32 F0
	inc $DFCD.w		; EE CD DF
	sty $FE.b,X		; 94 FE
	wai		; CB
	dec $ECEE.w		; CE EE EC
	sbc $940211.l		; EF 11 02 94
	and ($31.b,S),Y		; 33 31
	brk $03.b		; 00 03
	and ($10.b,S),Y		; 33 10
	cop $46.b		; 02 46
	sty $65.b		; 84 65
	ora ($24.b)		; 12 24
	eor $FD.b,S		; 43 FD
	cpy #$03.b		; C0 03
	brk $84.b		; 00 84
	cmp $5413.w,X		; DD 13 54
	jsr $12FF.w		; 20 FF 12
	brk $EE.b		; 00 EE
	stz $CF.b,X		; 74 CF
	ora ($FF.b,S),Y		; 13 FF
	bcs   3.b		; B0 03
	ora $DACD.w		; 0D CD DA
	sty $ED.b,X		; 94 ED
	sbc $ECFE0F.l,X		; FF 0F FE EC
	inc $BAED.w,X		; FE ED BA
	sty $BD.b,X		; 94 BD
	bne  -1.b		; D0 FF
	ora ($12.b)		; 12 12
	ora ($34.b),Y		; 11 34
	mvp $34,$94		; 44 94 34
	and $54.b,X		; 35 54
	and ($1F.b,X)		; 21 1F
	sbc $EFDC.w		; ED DC EF
	sty $EE.b,X		; 94 EE
	cpy $DFCF.w		; CC CF DF
	cmp $10EF.w,X		; DD EF 10
	ora ($94.b)		; 12 94
	and $22.b,S		; 23 22
	ora $2F3113.l		; 0F 13 31 2F
	cop $45.b		; 02 45
	sty $74.b		; 84 74
	and ($25.b,X)		; 21 25
	eor ($0D.b)		; 52 0D
	dec $0F04.w,X		; DE 04 0F
	sty $DE.b		; 84 DE
	ora $65.b,S		; 03 65
	bpl -15.b		; 10 F1
	ora ($1F.b,S),Y		; 13 1F
	sbc $C074.w,X		; FD 74 C0
	jsl $43DFFD.l		; 22 FD DF 43
	ora $94FAED.l,X		; 1F ED FA 94
	sbc $0FE0.w		; ED E0 0F
	inc $EEDD.w,X		; FE DD EE
	sbc $94BB.w		; ED BB 94
	ldy $F0EF.w,X		; BC EF F0
	ora ($22.b),Y		; 11 22
	ora ($34.b),Y		; 11 34
	eor ($94.b,S),Y		; 53 94
	and ($44.b,S),Y		; 33 44
	mvn $0E,$21		; 54 21 0E
	inc $DFCD.w		; EE CD DF
	bcs  15.b		; B0 0F
	sbc $CCDC.w		; ED DC CC
	wai		; CB
	tyx		; BB
	ldy $A0CD.w,X		; BC CD A0
	lda $FFEF.w,X		; BD EF FF
	sbc ($22.b),Y		; F1 22
	jsl $B05723.l		; 22 23 57 B0
	mvp $44,$44		; 44 44 44
	eor $44.b,X		; 55 44
	and ($33.b,S),Y		; 33 33
	and ($84.b)		; 32 84
	dec $6414.w,X		; DE 14 64
	ora ($F1.b),Y		; 11 F1
	and ($10.b,S),Y		; 33 10
	sbc $D274.w		; ED 74 D2
	ora ($EF.b,S),Y		; 13 EF
	sbc $D03245.l		; EF 45 32 D0
	stp		; DB
	sty $EE.b,X		; 94 EE
	sbc $DDFEF0.l		; EF F0 FE DD
	inc $BBED.w		; EE ED BB
	sty $BC.b,X		; 94 BC
	inc $12F0.w,X		; FE F0 12
	and ($12.b,X)		; 21 12
	bit $43.b,X		; 34 43
	sty $43.b,X		; 94 43
	bit $53.b,X		; 34 53
	and ($FE.b,X)		; 21 FE
	jsr ($EEDD.w,X)		; FC DD EE
	sty $DA.b		; 84 DA
	lda #$AD.b		; A9 AD
	jmp.w [$CFBA]		; DC BA CF
	brk $23.b		; 00 23
	sty $45.b		; 84 45
	and ($00.b),Y		; 31 00
	and ($53.b)		; 32 53
	brk $04.b		; 00 04
	adc [$84.b],Y		; 77 84
	stz $12.b		; 64 12
	mvp $EC,$53		; 44 53 EC
	sbc $841D12.l		; EF 12 1D 84
	dec $5415.w,X		; DE 15 54
	bmi   2.b		; 30 02
	bit $20.b		; 24 20
	dec $D274.w,X		; DE 74 D2
	and $0E.b,S		; 23 0E
	sbc ($37.b,X)		; E1 37
	bvc  46.b		; 50 2E
	xba		; EB
	sty $FE.b,X		; 94 FE
	sbc $DEEE0F.l		; EF 0F EE DE
	inc $BBEC.w		; EE EC BB
	sty $BD.b,X		; 94 BD
	sbc $2112F0.l		; EF F0 12 21
	jsl $945333.l		; 22 33 53 94
	and ($34.b,S),Y		; 33 34
	eor $11.b,S		; 43 11
	sbc $DFCEDD.l,X		; FF DD CE DF
	sty $CB.b		; 84 CB
	lda #$BD.b		; A9 BD
	cpx $CEBA.w		; EC BA CE
	sbc ($03.b)		; F2 03
	sty $34.b		; 84 34
	and ($10.b),Y		; 31 10
	trb $32.b		; 14 32
	brk $14.b		; 00 14
	ror $84.b		; 66 84
	eor ($21.b,S),Y		; 53 21
	lsr $42.b		; 46 42
	jsr ($22EE.w,X)		; FC EE 22
	asl $CF84.w,X		; 1E 84 CF
	ora $55.b		; 05 55
	ora ($12.b),Y		; 11 12
	eor $30.b,S		; 43 30
	cmp $4444A0.l,X		; DF A0 44 44
	eor $33.b,S		; 43 33
	mvp $44,$54		; 44 54 44
	eor $94.b,S		; 43 94
	sbc $EEFFEF.l		; EF EF FF EE
	sbc $DCEF.w		; ED EF DC
	tyx		; BB
	bcs -103.b		; B0 99
	sta $AB9A.w,Y		; 99 9A AB
	cmp $F0DE.w		; CD DE F0
	ora ($84.b)		; 12 84
	adc $77.b		; 65 77
	ror $20.b,X		; 76 20
	sbc $9ABA.w		; ED BA 9A
	cpy $DB84.w		; CC 84 DB
	lda #$DD.b		; A9 DD
	cmp $CEAB.w,X		; DD AB CE
	ora $338413.l		; 0F 13 84 33
	bmi  16.b		; 30 10
	ora ($31.b,S),Y		; 13 31
	brk $12.b		; 00 12
	adc $84.b		; 65 84
	eor $22.b,S		; 43 22
	eor $52.b		; 45 52
	sbc $21D0.w		; ED D0 21
	asl $DE84.w		; 0E 84 DE
	bit $54.b		; 24 54
	jsr $4333.w		; 20 33 43
	bmi -18.b		; 30 EE
	stz $F4.b,X		; 74 F4
	.db $42, $1E		; 42 1E
	cpx $67.b		; E4 67
	stz $11.b,X		; 74 11
	tas		; 1B
	sty $FE.b,X		; 94 FE
	sbc $DEFDFF.l,X		; FF FF FD DE
	inc $CBDC.w		; EE DC CB
	sty $CD.b,X		; 94 CD
	inc $1201.w		; EE 01 12
	jsl $423422.l		; 22 22 34 42
	sty $55.b		; 84 55
	ror $74.b,X		; 76 74
	jsr $BAFB.w		; 20 FB BA
	txs		; 9A
	cmp $CB84.w		; CD 84 CB
	ldy $DCBE.w		; AC BE DC
	dex		; CA
	dec $12FF.w,X		; DE FF 12
	sty $23.b		; 84 23
	ora ($00.b),Y		; 11 00
	jsl $130F21.l		; 22 21 0F 13
	mvn $33,$84		; 54 84 33
	ora ($45.b,S),Y		; 13 45
	.db $42, $FC		; 42 FC
	beq  17.b		; F0 11
	asl $EE84.w		; 0E 84 EE
	trb $53.b		; 14 53
	jsl $214524.l		; 22 24 45 21
	inc $1284.w		; EE 84 12
	and ($00.b,X)		; 21 00
	sbc ($44.b)		; F2 44
	eor ($21.b,X)		; 41 21
	beq -108.b		; F0 94
	sbc $EEFFEF.l,X		; FF EF FF EE
	dec $DCEE.w,X		; DE EE DC
	ldy $CD94.w,X		; BC 94 CD
	sbc $2222F1.l		; EF F1 22 22
	ora ($34.b,S),Y		; 13 34
	and ($B0.b,S),Y		; 33 B0
	and $34.b,S		; 23 34
	eor $44.b		; 45 44
	eor $21.b,S		; 43 21
	ora $AC84FF.l		; 0F FF 84 AC
	tyx		; BB
	cmp $DDBBDC.l		; CF DC BB DD
	sbc $357401.l,X		; FF 01 74 35
	jsl $2124F2.l		; 22 F2 24 21
	sbc ($F7.b),Y		; F1 F7
	ror $84.b,X		; 76 84
	eor ($22.b,X)		; 41 22
	eor $32.b		; 45 32
	inc $12F0.w		; EE F0 12
	sbc $23C084.l,X		; FF 84 C0 23
	eor ($22.b,S),Y		; 53 22
	bit $55.b		; 24 55
	jsr $840F.w		; 20 0F 84
	ora $21.b,S		; 03 21
	ora $524303.l,X		; 1F 03 43 52
	ora ($1F.b)		; 12 1F
	sty $FF.b,X		; 94 FF
	sbc $EEFDFE.l		; EF FE FD EE
	dec $CCDC.w,X		; DE DC CC
	sty $9B.b		; 84 9B
	ldx $44E3.w,Y		; BE E3 44
	eor ($54.b,S),Y		; 53 54
	adc [$64.b],Y		; 77 64
	sty $54.b		; 84 54
	ror $54.b		; 66 54
	asl $B9EC.w,X		; 1E EC B9
	plb		; AB
	jmp.w [$BC84]		; DC 84 BC
	tyx		; BB
	sbc $BBFB.w		; ED FB BB
	dec $01FE.w		; CE FE 01
	sty $11.b		; 84 11
	bpl  17.b		; 10 11
	sbc ($11.b)		; F2 11
	ora $841521.l		; 0F 21 15 84
	jsl $325312.l		; 22 12 53 32
	inc $02F1.w,X		; FE F1 02
	asl $E084.w		; 0E 84 E0
	ora ($43.b,S),Y		; 13 43
	jsl $315533.l		; 22 33 55 31
	sbc ($84.b),Y		; F1 84
	ora $22.b,S		; 03 22
	brk $13.b		; 00 13
	and $42.b,X		; 35 42
	and ($10.b),Y		; 31 10
	sty $FE.b,X		; 94 FE
	sbc $DEEDFF.l,X		; FF FF ED DE
	inc $CCDC.w		; EE DC CC
	sty $9B.b		; 84 9B
	dec $36F3.w		; CE F3 36
	and $46.b,X		; 35 46
	ror $64.b		; 66 64
	sty $45.b		; 84 45
	lsr $33.b,X		; 56 33
	bpl -21.b		; 10 EB
	tax		; AA
	plb		; AB
	cmp $CB84.w		; CD 84 CB
	ldy $DDEE.w,X		; BC EE DD
	dex		; CA
	cmp $0FFE.w,X		; DD FE 0F
	stz $22.b,X		; 74 22
	ora $F1.b,S		; 03 F1
	bmi  32.b		; 30 20
	beq  18.b		; F0 12
	eor $74.b,X		; 55 74
	and ($25.b)		; 32 25
	adc [$73.b]		; 67 73
	inc $11F1.w		; EE F1 11
	ora $FF84.w,X		; 1D 84 FF
	ora ($42.b,S),Y		; 13 42
	jsl $325534.l		; 22 34 55 32
	brk $84.b		; 00 84
	jsl $22F123.l		; 22 23 F1 22
	mvn $22,$43		; 54 43 22
	bpl -80.b		; 10 B0
	and ($22.b,S),Y		; 33 22
	and ($00.b,X)		; 21 00
	sbc $CBDCEE.l,X		; FF EE DC CB
	bcs -86.b		; B0 AA
	tax		; AA
	tyx		; BB
	cmp $F0EE.w		; CD EE F0
	ora ($22.b),Y		; 11 22
	sty $35.b		; 84 35
	mvn $1F,$42		; 54 42 1F
	jmp.w [$ADB9]		; DC B9 AD
	cpy $CC84.w		; CC 84 CC
	lda $DEDF.w,X		; BD DF DE
	ldy $FECD.w		; AC CD FE
	inc $1064.w,X		; FE 64 10
	rti		; 40

	jsl $01702F.l		; 22 2F 70 01
	ora $56.b		; 05 56
	bcc -17.b		; 90 EF
	beq  19.b		; F0 13
	mvp $33,$44		; 44 44 33
	bit $32.b,X		; 34 32
	sty $F0.b		; 84 F0
	jsl $242323.l		; 22 23 23 24
	stz $32.b		; 64 32
	ora ($84.b,X)		; 01 84
	and ($42.b),Y		; 31 42
	ora ($22.b,X)		; 01 22
	mvn $32,$44		; 54 44 32
	ora ($B0.b),Y		; 11 B0
	eor $32.b,S		; 43 32
	and ($10.b,X)		; 21 10
	sbc $CBDCEE.l,X		; FF EE DC CB
	sty $9C.b		; 84 9C
	dec $4513.w,X		; DE 13 45
	mvp $74,$65		; 44 65 74
	mvn $44,$84		; 54 84 44
	eor ($42.b,S),Y		; 53 42
	asl $A9EC.w,X		; 1E EC A9
	ldy $84DB.w,X		; BC DB 84
	stp		; DB
	cmp $ECEF.w		; CD EF EC
	cpy $EECD.w		; CC CD EE
	sbc $0DC364.l		; EF 64 C3 0D
	lsr $3F22.w,X		; 5E 22 3F
	brk $41.b		; 00 41
	.db $42, $74		; 42 74
	and ($13.b),Y		; 31 13
	mvn $1F,$60		; 54 60 1F
	ora $03.b,S		; 03 03
	sbc $12F184.l		; EF 84 F1 12
	jsl $543531.l		; 22 31 35 54
	and ($11.b)		; 32 11
	sty $32.b		; 84 32
	and ($10.b,S),Y		; 33 10
	bit $36.b		; 24 36
	eor $33.b,S		; 43 33
	ora ($94.b),Y		; 11 94
	asl $FFFE.w		; 0E FE FF
	cmp $DEEE.w,X		; DD EE DE
	cmp $84CD.w,X		; DD CD 84
	plb		; AB
	cmp $554523.l,X		; DF 23 45 55
	eor $55.b,X		; 55 55
	mvn $34,$84		; 54 84 34
	mvp $0E,$32		; 44 32 0E
	xba		; EB
	dex		; CA
	ldy $84CD.w		; AC CD 84
	cpy $EFCD.w		; CC CD EF
	sbc $CEBD.w		; ED BD CE
	dec $64DF.w,X		; DE DF 64
	cpy $D2F4.w		; CC F4 D2
	ora $00342F.l,X		; 1F 2F 34 00
	ora ($74.b),Y		; 11 74
	and ($13.b,X)		; 21 13
	ora $22.b,X		; 15 22
	brk $22.b		; 00 22
	ora ($F0.b)		; 12 F0
	sty $F1.b		; 84 F1
	ora ($22.b)		; 12 22
	ora ($34.b)		; 12 34
	eor $33.b		; 45 33
	ora ($84.b)		; 12 84
	and $23.b,S		; 23 23
	ora ($23.b)		; 12 23
	mvn $33,$44		; 54 44 33
	ora ($84.b)		; 12 84
	inc $CDDE.w		; EE DE CD
	tyx		; BB
	ldy $A9BB.w,X		; BC BB A9
	txy		; 9B
	sty $AC.b		; 84 AC
	sbc $655414.l		; EF 14 54 65
	eor $65.b,X		; 55 65
	eor $84.b,S		; 43 84
	and ($52.b,S),Y		; 33 52
	and ($1E.b),Y		; 31 1E
	cpx $CCBA.w		; EC BA CC
	cpy $DC84.w		; CC 84 DC
	dec $EDEF.w		; CE EF ED
	ldx $EDCD.w,Y		; BE CD ED
	dec $9C64.w,X		; DE 64 9C
	bit $1211.w,X		; 3C 11 12
	sbc $100060.l,X		; FF 60 00 10
	stz $11.b		; 64 11
	and ($62.b,X)		; 21 62
	rol $0F.b,X		; 36 0F
	eor $40.b,S		; 43 40
	ora ($84.b,X)		; 01 84
	bpl  17.b		; 10 11
	ora ($12.b)		; 12 12
	eor $54.b,S		; 43 54
	and ($32.b)		; 32 32
	sty $32.b		; 84 32
	and ($11.b,S),Y		; 33 11
	bit $35.b,X		; 34 35
	mvn $21,$33		; 54 33 21
	sty $EE.b		; 84 EE
	sbc $BCDB.w		; ED DB BC
	plb		; AB
	wai		; CB
	lda $84AA.w,Y		; B9 AA 84
	ldy $24FF.w,X		; BC FF 24
	eor $65.b		; 45 65
	lsr $54.b,X		; 56 54
	bit $84.b,X		; 34 84
	bit $23.b,X		; 34 23
	bmi  31.b		; 30 1F
	xba		; EB
	wai		; CB
	lda $84CD.w,X		; BD CD 84
	cpy $FFEC.w		; CC EC FF
	sbc $DDDC.w		; ED DC DD
	sbc $B0CD.w,X		; FD CD B0
	cpy $DDCC.w		; CC CC DD
	cmp $EEDE.w,X		; DD DE EE
	inc $64EF.w		; EE EF 64
	cmp ($12.b),Y		; D1 12
	asl $F362.w,X		; 1E 62 F3
	and ($30.b,S),Y		; 33 30
	bmi -124.b		; 30 84
	bpl  17.b		; 10 11
	bpl  49.b		; 10 31
	bit $44.b		; 24 44
	and ($32.b)		; 32 32
	sty $33.b		; 84 33
	eor ($22.b,X)		; 41 22
	bit $45.b,X		; 34 45
	eor $33.b		; 45 33
	and ($84.b,X)		; 21 84
	sbc $CCDD.w,X		; FD DD CC
	tyx		; BB
	ldy $ABBB.w,X		; BC BB AB
	stz $BC84.w		; 9C 84 BC
	sbc ($14.b),Y		; F1 14
	eor $65.b,X		; 55 65
	eor $63.b,X		; 55 63
	and ($84.b,S),Y		; 33 84
	eor $33.b,S		; 43 33
	and ($0E.b,X)		; 21 0E
	sbc $BDCB.w		; ED CB BD
	cmp $CD84.w		; CD 84 CD
	dec $EDFF.w,X		; DE FF ED
	dec $DEDE.w		; CE DE DE
	cmp $BE74.w		; CD 74 BE
	cpx #$0E.b		; E0 0E
	ora $001211.l,X		; 1F 11 12 00
	beq  84.b		; F0 54
	ora ($BB.b),Y		; 11 BB
	bit $3524.w		; 2C 24 35
	lsr $E656.w		; 4E 56 E6
	sty $11.b		; 84 11
	ora ($10.b,X)		; 01 10
	ora ($33.b),Y		; 11 33
	eor ($33.b)		; 52 33
	and $84.b,S		; 23 84
	bit $32.b,X		; 34 32
	and ($34.b),Y		; 31 34
	mvn $33,$54		; 54 54 33
	bmi -124.b		; 30 84
	inc $CCDD.w,X		; FE DD CC
	tyx		; BB
	tyx		; BB
	dex		; CA
	tsx		; BA
	tyx		; BB
	sty $CD.b		; 84 CD
	beq  37.b		; F0 25
	lsr $54.b,X		; 56 54
	adc $54.b		; 65 54
	and ($84.b,S),Y		; 33 84
	and $33.b,S		; 23 33
	ora ($0F.b),Y		; 11 0F
	sbc $CCCB.w,X		; FD CB CC
	cmp $DCA0.w,X		; DD A0 DC
	cpy $CBCC.w		; CC CC CB
	tyx		; BB
	tax		; AA
	lda #$99.b		; A9 99
	stz $AE.b,X		; 74 AE
	inc $1F1E.w		; EE 1E 1F
	ora ($32.b),Y		; 11 32
	brk $FE.b		; 00 FE
	stz $1D.b		; 64 1D
	inc A		; 1A
	cmp $1ED5.w,X		; DD D5 1E
	jsl $A0F76E.l		; 22 6E F7 A0
	beq   0.b		; F0 00
	brk $01.b		; 00 01
	ora ($23.b)		; 12 23
	mvp $84,$45		; 44 45 84
	bit $32.b,X		; 34 32
	and ($35.b)		; 32 35
	eor $43.b		; 45 43
	eor $30.b,S		; 43 30
	sty $FE.b		; 84 FE
	cmp $CBBB.w,X		; DD BB CB
	tyx		; BB
	ldy $ADAB.w,X		; BC AB AD
	sty $DD.b		; 84 DD
	ora $656435.l		; 0F 35 64 65
	stz $53.b		; 64 53
	.db $42, $84		; 42 84
	and ($32.b)		; 32 32
	and ($0F.b,X)		; 21 0F
	jsr ($BDDD.w,X)		; FC DD BD
	cmp $DC84.w,X		; DD 84 DC
	sbc $DDFEE0.l		; EF E0 FE DD
	inc $CCDE.w		; EE DE CC
	ldy #$99.b		; A0 99
	sta $ABAA.w,Y		; 99 AA AB
	ldy $DDCC.w,X		; BC CC DD
	cmp $D164.w,X		; DD 64 D1
	lda $0D9A.w		; AD 9A 0D
	ora ($11.b),Y		; 11 11
	rol $846E.w		; 2E 6E 84
	and $110F01.l		; 2F 01 0F 11
	jsl $322334.l		; 22 34 23 32
	sty $44.b		; 84 44
	and ($32.b,S),Y		; 33 32
	eor $54.b,S		; 43 54
	mvp $21,$43		; 44 43 21
	sty $EF.b		; 84 EF
	jmp.w [$AABC]		; DC BC AA
	cpy $BBCA.w		; CC CA BB
	cmp $CE84.w		; CD 84 CE
	sbc ($35.b)		; F2 35
	lsr $55.b,X		; 56 55
	mvn $23,$54		; 54 54 23
	sty $32.b		; 84 32
	jsl $ED0011.l		; 22 11 00 ED
	sbc $EDBD.w		; ED BD ED
	stz $9C.b,X		; 74 9C
	ldx $EDDE.w,Y		; BE DE ED
	ldy $CACC.w		; AC CC CA
	txs		; 9A
	stz $9C.b,X		; 74 9C
	inc $FFFF.w,X		; FE FF FF
	and ($40.b),Y		; 31 40
	ora $0F740F.l		; 0F 0F 74 0F
	plx		; FA
	xce		; FB
	cpx #$01.b		; E0 01
	sbc ($E1.b,X)		; E1 E1
	bpl -124.b		; 10 84
	bpl   0.b		; 10 00
	sbc ($F2.b),Y		; F1 F2
	ora ($33.b),Y		; 11 33
	and ($25.b,S),Y		; 33 25
	sty $33.b		; 84 33
	.db $42, $33		; 42 33
	mvp $53,$44		; 44 44 53
	bit $11.b,X		; 34 11
	sty $0D.b		; 84 0D
	cpy $BADA.w		; CC DA BA
	cpy $BCCB.w		; CC CB BC
	lda $EE84.w,X		; BD 84 EE
	ora ($45.b,X)		; 01 45
	eor $74.b		; 45 74
	stz $52.b		; 64 52
	and ($A0.b,S),Y		; 33 A0
	ror $77.b		; 66 77
	ror $65.b		; 66 65
	mvn $10,$32		; 54 32 10
	ora $DFDE84.l		; 0F 84 DE DF
	ora $FEEEFE.l		; 0F FE EE FE
	sbc $74DC.w		; ED DC 74
	lda $FDDF.w,X		; BD DF FD
	sbc ($F4.b),Y		; F1 F4
	ora ($1E.b)		; 12 1E
	beq 116.b		; F0 74
	sbc $EFBCDC.l,X		; FF DC BC EF
	brk $EE.b		; 00 EE
	bpl   1.b		; 10 01
	stz $1F.b,X		; 74 1F
	ora $151FFF.l,X		; 1F FF 1F 15
	rol $66.b,X		; 36 66
	adc $84.b		; 65 84
	eor $32.b		; 45 32
	and ($44.b,S),Y		; 33 44
	eor $43.b		; 45 43
	eor $11.b,S		; 43 11
	sty $EE.b		; 84 EE
	jmp.w [$BBAB]		; DC AB BB
	cpy $BCBD.w		; CC BD BC
	lda $FE84.w,X		; BD 84 FE
	ora $35.b,S		; 03 35
	eor $46.b,X		; 55 46
	stz $43.b		; 64 43
	and ($74.b)		; 32 74
	and $35.b,X		; 35 35
	and ($11.b,X)		; 21 11
	cmp $BCBA.w,X		; DD BA BC
	plb		; AB
	ldy #$FF.b		; A0 FF
	inc $EEEE.w		; EE EE EE
	cmp $CCDD.w,X		; DD DD CC
	tyx		; BB
	stz $AB.b,X		; 74 AB
	cmp $12F00D.l,X		; DF 0D F0 12
	jsl $74FE0F.l		; 22 0F FE 74
	ora $CDF9.w,X		; 1D F9 CD
	dec $0EEE.w		; CE EE 0E
	asl $7420.w		; 0E 20 74
	ora $1FFEEF.l,X		; 1F EF FE 1F
	ora ($35.b)		; 12 35
	adc [$67.b]		; 67 67
	sty $43.b		; 84 43
	bit $24.b,X		; 34 24
	eor $64.b,S		; 43 64
	bit $33.b,X		; 34 33
	jsr $ED84.w		; 20 84 ED
	jmp.w [$CBBA]		; DC BA CB
	ldy $CCDB.w,X		; BC DB CC
	cmp $FE84.w,X		; DD 84 FE
	ora $44.b,S		; 03 44
	lsr $56.b,X		; 56 56
	mvn $23,$33		; 54 33 23
	stz $44.b,X		; 74 44
	eor ($12.b,S),Y		; 53 12
	ora ($FD.b),Y		; 11 FD
	ldx $DBC9.w,Y		; BE C9 DB
	stz $BC.b,X		; 74 BC
	dec $0DFF.w,X		; DE FF 0D
	dec $CBED.w		; CE ED CB
	tsx		; BA
	stz $AE.b,X		; 74 AE
	cmp $02E1ED.l		; CF ED E1 02
	jsl $740FFF.l		; 22 FF 0F 74
	sbc $CEBBBC.l,X		; FF BC BB CE
	inc $E2DE.w		; EE DE E2
.INDEX 8
	sep #$90		; E2 90
	txs		; 9A
	tax		; AA
	tax		; AA
	tax		; AA
	plb		; AB
	dec $24F0.w		; CE F0 24
	sty $53.b		; 84 53
	eor $43.b,S		; 43 43
	and $34.b,X		; 35 34
	eor ($42.b,S),Y		; 53 42
	rol $0D84.w		; 2E 84 0D
	wai		; CB
	wai		; CB
	plb		; AB
	cmp $CEBC.w		; CD BC CE
	dec $FE84.w		; CE 84 FE
	trb $34.b		; 14 34
	lsr $55.b,X		; 56 55
	mvn $13,$43		; 54 43 13
	stz $44.b,X		; 74 44
	and ($31.b,S),Y		; 33 31
	and ($FD.b,X)		; 21 FD
	sbc $DBCB.w		; ED CB DB
	stz $DB.b,X		; 74 DB
	inc $DE00.w,X		; FE 00 DE
	dec $CBFF.w,X		; DE FF CB
	tyx		; BB
	stz $AC.b,X		; 74 AC
	inc $0FEE.w		; EE EE 0F
	cop $3E.b		; 02 3E
	ora ($FF.b),Y		; 11 FF
	stz $EF.b,X		; 74 EF
	wai		; CB
	plb		; AB
	cpy $DEEC.w		; CC EC DE
	inc $7400.w,X		; FE 00 74
	sbc $EEEEEE.l,X		; FF EE EE EE
	brk $34.b		; 00 34
	eor [$76.b]		; 47 76
	sty $44.b		; 84 44
	mvp $53,$33		; 44 33 53
	eor $34.b		; 45 34
	and ($10.b)		; 32 10
	sty $ED.b		; 84 ED
	wai		; CB
	tyx		; BB
	tyx		; BB
	cpy $ECDB.w		; CC DB EC
	sbc $0F84.w		; ED 84 0F
	ora ($35.b,S),Y		; 13 35
	lsr $45.b,X		; 56 45
	eor $33.b		; 45 33
	and ($74.b),Y		; 31 74
	eor $33.b		; 45 33
	and ($21.b),Y		; 31 21
	sbc ($CF.b),Y		; F1 CF
	dec $74BE.w		; CE BE 74
	ldx $0EFE.w,Y		; BE FE 0E
	asl $FEEE.w		; 0E EE FE
	dec $749B.w,X		; DE 9B 74
	lda $EEEC.w,X		; BD EC EE
	beq  32.b		; F0 20
	ora ($F1.b,X)		; 01 F1
	sbc $DBFD74.l		; EF 74 FD DB
	tsx		; BA
	jmp.w [$CEDC]		; DC DC CE
	bne -48.b		; D0 D0
	sty $F0.b		; 84 F0
	sbc $F0FFFE.l,X		; FF FE FF F0
	ora ($24.b)		; 12 24
	and ($84.b,S),Y		; 33 84
	mvp $35,$34		; 44 34 35
	and $44.b,X		; 35 44
	eor $32.b,S		; 43 32
	ora $BCED84.l,X		; 1F 84 ED BC
	tsx		; BA
	cpy $BDBD.w		; CC BD BD
	cpx $84EE.w		; EC EE 84
	ora $643423.l		; 0F 23 34 64
	eor $54.b,X		; 55 54
	and ($22.b,S),Y		; 33 22
	stz $35.b,X		; 74 35
	ora $23.b,X		; 15 23
	ora ($1F.b),Y		; 11 1F
	inc $CCEE.w,X		; FE EE CC
	stz $FD.b,X		; 74 FD
	sbc ($E0.b,X)		; E1 E0
	inc $EE0E.w,X		; FE 0E EE
	asl A		; 0A
	jmp.w [$DB74]		; DC 74 DB
	sbc $E1ED.w		; ED ED E1
	brk $3F.b		; 00 3F
	sbc ($FF.b),Y		; F1 FF
	stz $DF.b,X		; 74 DF
	tyx		; BB
	tsx		; BA
	dex		; CA
	dec $DFBC.w		; CE BC DF
	sbc $EF0E84.l		; EF 84 0E EF
	ora $11F0FE.l		; 0F FE F0 11
	and ($34.b)		; 32 34
	sty $44.b		; 84 44
	eor $53.b,S		; 43 53
	mvp $33,$44		; 44 44 33
	eor ($1F.b,X)		; 41 1F
	sty $DC.b		; 84 DC
	stp		; DB
	tsx		; BA
	wai		; CB
	stp		; DB
	cmp $FEED.w,X		; DD ED FE
	sty $0F.b		; 84 0F
	jsl $555445.l		; 22 45 54 55
	mvp $21,$33		; 44 33 21
	stz $53.b,X		; 74 53
	and ($32.b,S),Y		; 33 32
	and ($10.b),Y		; 31 10
	sbc ($CE.b),Y		; F1 CE
	inc $FC74.w		; EE 74 FC
	ora $1EFEF0.l		; 0F F0 FE 1E
	asl $BEDE.w		; 0E DE BE
	stz $BE.b,X		; 74 BE
	cmp $F0ED.w,X		; DD ED F0
	sbc ($1F.b)		; F2 1F
	sbc $FE74FF.l,X		; FF FF 74 FE
	cmp $AABC.w,Y		; D9 BC AA
	cpy $DDBC.w		; CC BC DD
	inc $EF84.w,X		; FE 84 EF
	inc $EFFF.w,X		; FE FF EF
	sbc $451312.l,X		; FF 12 13 45
	sty $25.b		; 84 25
	mvp $53,$43		; 44 43 53
	and $33.b,X		; 35 33
	jsl $DD840F.l		; 22 0F 84 DD
	wai		; CB
	tyx		; BB
	ldy $DDCD.w		; AC CD DD
	sbc $84FF.w		; ED FF 84
	brk $13.b		; 00 13
	mvp $53,$46		; 44 46 53
	mvn $22,$32		; 54 32 22
	stz $35.b,X		; 74 35
	and ($13.b,S),Y		; 33 13
	ora ($11.b,S),Y		; 13 11
	ora $900E0D.l		; 0F 0D 0E 90
	mvn $32,$43		; 54 43 32
	jsl $001121.l		; 22 21 11 00
	inc $BB64.w,X		; FE 64 BB
	tsx		; BA
	tsx		; BA
	dec $E221.w,X		; DE 21 E2
	sbc $FE74EE.l		; EF EE 74 FE
	tyx		; BB
	tyx		; BB
	ldy $9CAC.w		; AC AC 9C
	cmp $A0FD.w,X		; DD FD A0
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	ldy $EFCD.w,X		; BC CD EF
	sty $55.b		; 84 55
	eor $44.b,S		; 43 44
	eor $44.b,S		; 43 44
	and ($21.b,S),Y		; 33 21
	ora $BBDD84.l		; 0F 84 DD BB
	tyx		; BB
	tyx		; BB
	sbc $DECE.w		; ED CE DE
	ora $320F84.l		; 0F 84 0F 32
	bit $55.b,X		; 34 55
	mvp $33,$53		; 44 53 33
	ora ($74.b)		; 12 74
	and $33.b		; 25 33
	and ($33.b),Y		; 31 33
	ora ($11.b)		; 12 11
	bne  14.b		; D0 0E
	bcc 101.b		; 90 65
	mvn $33,$44		; 54 44 33
	jsl $0F1021.l		; 22 21 10 0F
	stz $BC.b		; 64 BC
	tyx		; BB
	ldx $2EBE.w,Y		; BE BE 2E
	sbc $AF.b,S		; E3 AF
	inc $FE74.w		; EE 74 FE
	lda $AA9D.w,X		; BD 9D AA
	tax		; AA
	ldy $FDDB.w,X		; BC DB FD
	sty $FD.b		; 84 FD
	inc $FEFE.w,X		; FE FE FE
	sbc $342301.l,X		; FF 01 23 34
	sty $54.b		; 84 54
	mvp $34,$44		; 44 44 34
	eor $32.b,S		; 43 32
	jsl $DC84FF.l		; 22 FF 84 DC
	ldy $BCAB.w,X		; BC AB BC
	cmp $EEDE.w,X		; DD DE EE
	ora $11F284.l		; 0F 84 F2 11
	mvp $54,$54		; 44 54 54
	eor $33.b,S		; 43 33
	and ($64.b,X)		; 21 64
	ror $56.b,X		; 76 56
	.db $62, $55, $65		; 62 55 65
	and ($11.b,X)		; 21 11
	bne 100.b		; D0 64
	tsb $FE0F.w		; 0C 0F FE
	inc $ED1E.w,X		; FE 1E ED
	cpx #$9D.b		; E0 9D
	bra  14.b		; 80 0E
	jmp.w [$AABB]		; DC BB AA
	tax		; AA
	plb		; AB
	tsx		; BA
	tax		; AA
	stz $DE.b,X		; 74 DE
	stp		; DB
	stp		; DB
	plb		; AB
	tax		; AA
	stz $DDBD.w		; 9C BD DD
	sty $EE.b		; 84 EE
	sbc $FFEEDF.l		; EF DF EE FF
	cop $22.b		; 02 22
	eor $84.b		; 45 84
	mvp $44,$44		; 44 44 44
	eor $43.b,S		; 43 43
	and $20.b,S		; 23 20
	sbc $CBDC84.l,X		; FF 84 DC CB
	txy		; 9B
	jmp.w [$EDDD]		; DC DD ED
	cpx #$E0.b		; E0 E0
	sty $01.b		; 84 01
	ora ($34.b,S),Y		; 13 34
	eor $55.b,S		; 43 55
	bit $32.b		; 24 32
	jsl $655564.l		; 22 64 55 65
	eor ($55.b)		; 52 55
	lsr $51.b,X		; 56 51
	ora ($10.b),Y		; 11 10
	bcc 119.b		; 90 77
	ror $55.b		; 66 55
	mvp $32,$43		; 44 43 32
	jsl $DC6411.l		; 22 11 64 DC
	cpy #$CC.b		; C0 CC
	cmp $FFBFFF.l		; CF FF BF FF
	xba		; EB
	stz $0D.b,X		; 74 0D
	lda $DAD9.w,X		; BD D9 DA
	txs		; 9A
	stz $DBDB.w		; 9C DB DB
	sty $EE.b		; 84 EE
	inc $FEEE.w		; EE EE FE
	sbc $441420.l		; EF 20 14 44
	sty $45.b		; 84 45
	eor $44.b,S		; 43 44
	bit $42.b,X		; 34 42
	and ($20.b)		; 32 20
	tsb $FB84.w		; 0C 84 FB
	ldy $CBBB.w,X		; BC BB CB
	dec $EFDF.w,X		; DE DF EF
	beq -124.b		; F0 84
	ora ($12.b,X)		; 01 12
	bit $35.b,X		; 34 35
	eor $52.b,S		; 43 52
	and ($32.b)		; 32 32
	stz $23.b,X		; 74 23
	and ($23.b),Y		; 31 23
	ora $14.b		; 05 14
	ora ($12.b)		; 12 12
	bpl -112.b		; 10 90
	adc [$76.b],Y		; 77 76
	adc $54.b		; 65 54
	mvp $22,$33		; 44 33 22
	and ($74.b,X)		; 21 74
	sbc $0BCEEE.l		; EF EE CE 0B
	ora $DEDE.w		; 0D DE DE
	stp		; DB
	ldy #$DC.b		; A0 DC
	cpy $BABB.w		; CC BB BA
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	stz $1F.b,X		; 74 1F
	beq  48.b		; F0 30
	.db $42, $27		; 42 27
	and ($66.b,S),Y		; 33 66
	adc $74.b,S		; 63 74
	eor ($35.b,S),Y		; 53 35
	bit $22.b		; 24 22
	ora ($20.b)		; 12 20
	brk $F0.b		; 00 F0
	bcc  84.b		; 90 54
	and ($11.b)		; 32 11
	brk $FE.b		; 00 FE
	sbc $CCDD.w		; ED DD CC
	stz $EE.b		; 64 EE
	ldx $EED2.w		; AE D2 EE
	asl $3E22.w,X		; 1E 22 3E
	adc $00F090.l,X		; 7F 90 F0 00
	ora ($22.b),Y		; 11 22
	and $34.b,S		; 23 34
	mvp $64,$44		; 44 44 64
	.db $62, $32, $23		; 62 32 23
	and $2EE222.l		; 2F 22 E2 2E
	sbc ($64.b,X)		; E1 64
	sbc $D01E.w		; ED 1E D0
	jmp.w [$FC09]		; DC 09 FC
	beq -65.b		; F0 BF
	stz $BF.b		; 64 BF
	xce		; FB
	inc $3FFE.w,X		; FE FE 3F
	sbc $64F33F.l		; EF 3F F3 64
	sbc $00F434.l,X		; FF 34 F4 00
	mvp $11,$04		; 44 04 11
	eor ($64.b,X)		; 41 64
	ora ($11.b),Y		; 11 11
	eor $5D11.w,X		; 5D 11 5D
	ora $0111.w,X		; 1D 11 01
	stz $D1.b		; 64 D1
	ora $000C.w		; 0D 0C 00
	cmp $F0FCC0.l,X		; DF C0 FC F0
	stz $FF.b		; 64 FF
	ora $FFFFFC.l		; 0F FC FF FF
	and $60FFF0.l,X		; 3F F0 FF 60
	sta $CC9C.w,Y		; 99 9C CC
	brk $04.b		; 00 04
	mvp $44,$44		; 44 44 44
	stz $04.b		; 64 04
	ora ($01.b,X)		; 01 01
	eor $0110.w		; 4D 10 01
	ora $6001.w		; 0D 01 60
	mvp $40,$44		; 44 44 40
	brk $CC.b		; 00 CC
	cpy $9999.w		; CC 99 99
	rts		; 60

	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $6199.w,Y		; 99 99 61
	stz $CCCC.w		; 9C CC CC
	cpy $0000.w		; CC 00 00
	brk $04.b		; 00 04
	eor $4B55.w,Y		; 59 55 4B
	eor $1C0000.l		; 4F 00 00 1C
	bcs   0.b		; B0 00
	brk $21.b		; 00 21
	bra 112.b		; 80 70
	rol $44AE.w,X		; 3E AE 44
	eor ($54.b,S),Y		; 53 54
	eor ($43.b,X)		; 41 43
	pha		; 48
	eor $56.b		; 45 56
	lsr $732E.w		; 4E 2E 73
	adc $CF006C.l		; 6F 6C 00 CF
	jmp ($E0D6.w,X)		; 7C D6 E0
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
	ldx #$00.b		; A2 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $79.b		; 00 79
	tsb $0FA2.w		; 0C A2 0F
	sbc $C6.b		; E5 C6
	phd		; 0B
	ora $1FE1.w,X		; 1D E1 1F
	rol $2DA2.w,X		; 3E A2 2D
	asl $C201.w		; 0E 01 C2
	phd		; 0B
	asl $2F05.w		; 0E 05 2F
	sta ($71.b)		; 92 71
	inc $5EFF.w,X		; FE FF 5E
	lda $0121D9.l,X		; BF D9 21 01
	sta ($19.b)		; 92 19
	ora $602CF6.l		; 0F F6 2C 60
	cmp $3F00.w		; CD 00 3F
	ldx $F3.b		; A6 F3
	plx		; FA
	stz $91.b,X		; 74 91
	and $2BF3FF.l		; 2F FF F3 2B
	ldx $3F.b		; A6 3F
	cmp ($11.b)		; D2 11
	ora ($EF.b,X)		; 01 EF
	asl $A225.w,X		; 1E 25 A2
	ldx #$3F.b		; A2 3F
	sbc $D24CE4.l		; EF E4 4C D2
	stp		; DB
	ora ($F0.b)		; 12 F0
	ldx $F1.b		; A6 F1
	tsb $EC27.w		; 0C 27 EC
	eor $F2B4.w,X		; 5D B4 F2
	brk $A2.b		; 00 A2
	pea $1401.w		; F4 01 14
	ora ($E9.b),Y		; 11 E9
	cpx $CD97.w		; EC 97 CD
	ldx $E1.b,Y		; B6 E1
	cmp $2F.b		; C5 2F
	rtl		; 6B

	ora $A0.b,S		; 03 A0
	sbc [$C6.b],Y		; F7 C6
	ldx $A3.b,Y		; B6 A3
.ACCU 8
.INDEX 8
	sep #$F0		; E2 F0
	asl $B3C4.w,X		; 1E C4 B3
	ora ($D3.b,X)		; 01 D3
	lda ($B0.b)		; B2 B0
	dec $2007.w		; CE 07 20
	ora ($D0.b)		; 12 D0
	sbc ($21.b,S),Y		; F3 21
	ldx #$25.b		; A2 25
	ldy $52.b,X		; B4 52
	bit $AD.b,X		; 34 AD
	ldy $9ED5.w,X		; BC D5 9E
	lda ($0C.b)		; B2 0C
	bcs   3.b		; B0 03
	eor ($03.b,X)		; 41 03
	tyx		; BB
	eor ($E5.b)		; 52 E5
	lda ($1E.b)		; B2 1E
	asl $2F16.w,X		; 1E 16 2F
	and $FF0E9E.l		; 2F 9E 0E FF
	ldx $C0.b,Y		; B6 C0
	ora ($63.b,X)		; 01 63
	cpy $FC.b		; C4 FC
	sbc ($12.b)		; F2 12
	inc $2EB2.w,X		; FE B2 2E
	sta $F13432.l,X		; 9F 32 34 F1
	cpy $C320.w		; CC 20 C3
	lda ($19.b)		; B2 19
	lda $4351E4.l,X		; BF E4 51 43
	cmp ($52.b,X)		; C1 52
	sbc ($B2.b,S),Y		; F3 B2
	inc $15DE.w,X		; FE DE 15
	cop $3F.b		; 02 3F
	lda $B6FFEF.l,X		; BF EF FF B6
	cmp ($D2.b)		; D2 D2
	eor ($C4.b)		; 52 C4
	ora $11F2.w		; 0D F2 11
.ACCU 16
.INDEX 16
	rep #$B2		; C2 B2
	ora $219E.w,X		; 1D 9E 21
	ora ($0F.b)		; 12 0F
	cmp $B6DF00.l		; CF 00 DF B6
	brk $D2.b		; 00 D2
	and ($C3.b)		; 32 C3
	ora $B211C4.l,X		; 1F C4 11 B2
	lda ($0F.b)		; B2 0F
	lda $1FE212.l,X		; BF 12 E2 1F
	cpy #$CFFE.w		; C0 FE CF
	lda ($FF.b)		; B2 FF
	bcs  35.b		; B0 23
	sbc $22.b,S		; E3 22
	pea $EF34.w		; F4 34 EF
	lda ($F1.b)		; B2 F1
	ldx $C102.w		; AE 02 C1
	brk $CE.b		; 00 CE
	sbc $3EB6CE.l,X		; FF CE B6 3E
	sbc $0F.b,X		; F5 0F
	cpx $E2.b		; E4 E2
	cmp ($2F.b)		; D2 2F
.ACCU 16
.INDEX 16
	rep #$B2		; C2 B2
	ora $02CE.w		; 0D CE 02
	sbc $1DC012.l		; EF 12 C0 1D
	dec $0FB2.w		; CE B2 0F
	sbc ($43.b,X)		; E1 43
	cpx #$1340.w		; E0 40 13
	bvc   0.b		; 50 00
	ldx $F1.b		; A6 F1
	sta ($6E.b)		; 92 6E
	cmp ($3A.b,S),Y		; D3 3A
	ora $B2C23B.l,X		; 1F 3B C2 B2
	ora $1F41F2.l,X		; 1F F2 41 1F
	and ($12.b),Y		; 31 12
	adc ($F0.b),Y		; 71 F0
	ldx $1B.b,Y		; B6 1B
	and $5C1E4D.l		; 2F 4D 1E 5C
	ora $B2004B.l		; 0F 4B 00 B2
	ora $2F5120.l		; 0F 20 51 2F
	bmi  34.b		; 30 22
	.db $62, $1E, $B6		; 62 1E B6
	dec A		; 3A
	and $4C1F4C.l,X		; 3F 4C 1F 4C
	ora $B21F4B.l,X		; 1F 4B 1F B2
	asl $5232.w,X		; 1E 32 52
	trb M7Y.w		; 1C 20 21
	.db $62, $2F, $B2		; 62 2F B2
	ora $2EDE.w,X		; 1D DE 2E
	inc $0E0C.w		; EE 0C 0E
	tsb $B6DB.w		; 0C DB B6
	eor $0C3E21.l,X		; 5F 21 3E 0C
	bpl  47.b		; 10 2F
	adc $A6ED.w		; 6D ED A6
	phy		; 5A
	ora $3EFE5D.l		; 0F 5D FE 3E
	and ($49.b,X)		; 21 49
	inc A		; 1A
	ldx $4F.b,Y		; B6 4F
	bvc  44.b		; 50 2C
	asl $2100.w		; 0E 00 21
	ora ($CD.b,S),Y		; 13 CD
	lda ($1F.b)		; B2 1F
	dec $CD1E.w,X		; DE 1E CD
	bne  -2.b		; D0 FE
	beq -52.b		; F0 CC
	ldx $30.b,Y		; B6 30
	and ($0F.b,S),Y		; 33 0F
	sbc $11E3.w,X		; FD E3 11
	ora ($B1.b)		; 12 B1
	ldx $EF.b,Y		; B6 EF
	sbc ($03.b),Y		; F1 03
	dec $F023.w		; CE 23 F0
	ora $54A6C0.l,X		; 1F C0 A6 54
	and $20.b		; 25 20
	lda $25E4.w,Y		; B9 E4 25
	bit $AC.b		; 24 AC
	ldx $D1.b		; A6 D1
	sbc ($F1.b,X)		; E1 F1
	lda $11EF06.l		; AF 06 EF 11
	ldx $E1B2.w,Y		; BE B2 E1
	eor $66.b		; 45 66
	rol $11D2.w,X		; 3E D2 11
	eor $10.b,X		; 55 10
	ldx $FF.b		; A6 FF
	inc $AFE5.w,X		; FE E5 AF
	asl $D3.b		; 06 D3
	beq -36.b		; F0 DC
	ldx $15.b,Y		; B6 15
	ora ($11.b),Y		; 11 11
	cmp $E203.w		; CD 03 E2
	and ($FD.b,X)		; 21 FD
	ldx $F4.b		; A6 F4
	stz $AF13.w,X		; 9E 13 AF
	tsb $2D.b		; 04 2D
	ora $9D.b		; 05 9D
	ldx $56.b		; A6 56
	and $2C.b,X		; 35 2C
	plx		; FA
.ACCU 8
.INDEX 8
	sep #$3D		; E2 3D
	adc $BB.b,X		; 75 BB
	lda ($00.b)		; B2 00
	sbc $D9EE.w,X		; FD EE D9
	cmp $DE0EEC.l,X		; DF EC 0E DE
	lda ($F1.b)		; B2 F1
	eor $76.b,S		; 43 76
	lsr $111F.w		; 4E 1F 11
	bit $4F.b		; 24 4F
	ldx $21.b,Y		; B6 21
	cpx $FD20.w		; EC 20 FD
	bmi  29.b		; 30 1D
	jsr $B2FE.w		; 20 FE B2
	sbc ($32.b)		; F2 32
	adc ($40.b,S),Y		; 73 40
	brk $1F.b		; 00 1F
	and $31.b,X		; 35 31
	ldx $1D.b,Y		; B6 1D
	asl $1BF1.w		; 0E F1 1B
	and ($0D.b,X)		; 21 0D
	eor $44A60F.l		; 4F 0F A6 44
	adc $2CBA16.l		; 6F 16 BA 2C
	jsr $3C50.w		; 20 50 3C
	ldx $ED.b		; A6 ED
	sbc $FE1F.w		; ED 1F FE
	brk $FF.b		; 00 FF
	bvc  13.b		; 50 0D
	lda ($01.b)		; B2 01
	eor $45.b		; 45 45
	bvc   1.b		; 50 01
	ora $A63224.l,X		; 1F 24 32 A6
	cmp $0FEE.w,X		; DD EE 0F
	inc A		; 1A
	ora $FE.b,S		; 03 FE
	trb $C2.b		; 14 C2
	ldx $35.b		; A6 35
	bit $2E.b		; 24 2E
	ora $F0B1.w,X		; 1D B1 F0
	eor $FE.b,S		; 43 FE
	ldx $0B.b		; A6 0B
	ora $FDE1.w,X		; 1D E1 FD
	sbc $B0.b		; E5 B0
	ora ($E4.b),Y		; 11 E4
	ldx $51.b		; A6 51
	sbc [$D5.b],Y		; F7 D5
	sbc $D3D3.w,X		; FD D3 D3
	tsb $EF.b		; 04 EF
	ldx $EE.b		; A6 EE
	cpx $D1C4.w		; EC C4 D1
.ACCU 8
.INDEX 8
	sep #$B2		; E2 B2
	pei ($04.b)		; D4 04
	lda ($05.b)		; B2 05
	asl $44.b,X		; 16 44
	and $13.b,X		; 35 13
	cop $04.b		; 02 04
	and ($B6.b,S),Y		; 33 B6
	sbc ($B1.b,X)		; E1 B1
	sbc ($E3.b,X)		; E1 E3
	cpy $CF.b		; C4 CF
	ora $E4.b,S		; 03 E4
	ldx $02.b,Y		; B6 02
	sbc $D3.b		; E5 D3
	sbc ($E2.b),Y		; F1 E2
	sbc ($E3.b,X)		; E1 E3
.ACCU 8
.INDEX 8
	sep #$B6		; E2 B6
	cmp ($B1.b)		; D2 B1
	cmp ($E2.b)		; D2 E2
	cmp ($E1.b),Y		; D1 E1
	cpy $02.b		; C4 02
	ldx $14.b,Y		; B6 14
	sbc ($21.b,X)		; E1 21
	sbc ($D2.b)		; F2 D2
.INDEX 8
	sep #$D3		; E2 D3
	cmp $A6.b,S		; C3 A6
	inc $B1A2.w		; EE A2 B1
	ora ($91.b,S),Y		; 13 91
.ACCU 16
.INDEX 16
	rep #$B7		; C2 B7
	pea $04B2.w		; F4 B2 04
	mvp $15,$24		; 44 24 15
	bit $13.b,X		; 34 13
	ora ($23.b)		; 12 23
	lda ($00.b)		; B2 00
	cmp $BCDEDD.l,X		; DF DD DE BC
	dex		; CA
	stz $A6C0.w		; 9C C0 A6
	mvp $F1,$E4		; 44 E4 F1
	ora ($E1.b,S),Y		; 13 E1
	brk $D2.b		; 00 D2
	cpx #$D0A6.w		; E0 A6 D0
	ldx #$D395.w		; A2 95 D3
	lda ($CF.b),Y		; B1 CF
	dec $16.b		; C6 16
	ldx $16.b		; A6 16
	ora ($E2.b),Y		; 11 E2
	jsr $C103.w		; 20 03 C1
	sbc ($D0.b,X)		; E1 D0
	ldx $E0.b		; A6 E0
	cmp ($DF.b,X)		; C1 DF
	ora ($DF.b),Y		; 11 DF
	xba		; EB
	sbc $33.b		; E5 33
	ldx $25.b		; A6 25
	bpl  18.b		; 10 12
	sbc ($33.b),Y		; F1 33
	bne  -1.b		; D0 FF
	sbc ($A6.b,X)		; E1 A6
	cmp $E0C3B2.l		; CF B2 C3 E0
	cmp $B6FE.w,X		; DD FE B6
	and $A6.b,S		; 23 A6
	adc $F2.b		; 65 F2
	cpx $02.b		; E4 02
	ora $B2.b		; 05 B2
	ora $A6C0.w		; 0D C0 A6
.ACCU 16
	rep #$A2		; C2 A2
	cpy $E1.b		; C4 E1
	bne -81.b		; D0 AF
	cpx $24.b		; E4 24
	ldx $17.b		; A6 17
	ora ($E2.b,X)		; 01 E2
	trb $04.b		; 14 04
	cpx #$AEF1.w		; E0 F1 AE
	ldx $EE.b		; A6 EE
	inc $F13F.w		; EE 3F F1
	inc $F4CD.w		; EE CD F4
	ora ($A6.b,S),Y		; 13 A6
	adc ($05.b,X)		; 61 05
	sbc $1C1433.l		; EF 33 14 1C
	rol $A6AE.w,X		; 3E AE A6
	jsr ($F3E1.w,X)		; FC E1 F3
	sbc $3FCBFE.l		; EF FE CB 3F
	rol $A6.b,X		; 36 A6
	bvc   3.b		; 50 03
	brk $30.b		; 00 30
	and ($4E.b),Y		; 31 4E
	pld		; 2B
	xba		; EB
	ldx $FE.b		; A6 FE
	cmp $FB1F3F.l,X		; DF 3F 1F FB
	jmp.w [$0350]		; DC 50 03
	ldx $61.b		; A6 61
	ora $2D.b,S		; 03 2D
	bit $2D.b,X		; 34 2D
	adc $A6D91E.l		; 6F 1E D9 A6
	tsb $2ED3.w		; 0C D3 2E
	ora $15CDDD.l,X		; 1F DD CD 15
	sbc $A6.b,S		; E3 A6
	adc ($03.b),Y		; 71 03
	lsr $30E5.w		; 4E E5 30
	ora ($E0.b,S),Y		; 13 E0
	ldy $DDA6.w		; AC A6 DD
	lda $02.b,X		; B5 02
.ACCU 8
	sep #$AF		; E2 AF
	cpy #$F4C6.w		; C0 C6 F4
	ldx $21.b,Y		; B6 21
	sbc ($21.b)		; F2 21
	sbc $F2.b,S		; E3 F2
	ora $F0.b,S		; 03 F0
	cmp $9DECB2.l		; CF B2 EC 9D
	dec $CCEF.w		; CE EF CC
	plb		; AB
	lda $B6CE.w		; AD CE B6
	ora ($F3.b)		; 12 F3
	sbc ($E2.b,S),Y		; F3 E2
	ora ($F4.b),Y		; 11 F4
	sbc ($C0.b,X)		; E1 C0
	ldx $B0.b,Y		; B6 B0
	cmp ($02.b,S),Y		; D3 02
.INDEX 8
	sep #$DF		; E2 DF
	cmp ($F3.b),Y		; D1 F3
	pei ($A6.b)		; D4 A6
	pea $02E6.w		; F4 E6 02
	ora ($F5.b,S),Y		; 13 F5
	cmp [$F0.b],Y		; D7 F0
	ldy #$B2.b		; A0 B2
	cmp $D0CC.w		; CD CC D0
	cmp $BC9BDC.l		; CF DC 9B BC
	cmp $0402A6.l,X		; DF A6 02 04
	trb $E4.b		; 14 E4
	ora ($23.b,X)		; 01 23
	sbc ($D9.b)		; F2 D9
	ldx $BD.b		; A6 BD
	lda ($42.b,X)		; A1 42
	brk $CE.b		; 00 CE
	sbc $2031.w		; ED 31 20
	ldx $3F.b		; A6 3F
	ora ($51.b)		; 12 51
	bpl  76.b		; 10 4C
	adc ($4D.b,X)		; 61 4D
	plx		; FA
	ldx $EB.b,Y		; B6 EB
	brk $11.b		; 00 11
	and $1D1C.w,X		; 3D 1C 1D
	and $3EB61F.l,X		; 3F 1F B6 3E
	rol $4F5E.w,X		; 3E 5E 4F
	rol $4E3F.w		; 2E 3F 4E
	tsb $F9B6.w		; 0C B6 F9
	and $3C20.w,X		; 3D 20 3C
	and $4F1C.w		; 2D 1C 4F
	rol $2FB6.w,X		; 3E B6 2F
	jsr $4D5D.w		; 20 5D 4D
	rol $4F3E.w,X		; 3E 3E 4F
	jsr ($0BB2.w,X)		; FC B2 0B
	dex		; CA
	sbc $EB0D.w		; ED 0D EB
	wai		; CB
	cpx $B6ED.w		; EC ED B6
	ora $204F3F.l,X		; 1F 3F 4F 20
	ora $FC203F.l,X		; 1F 3F 20 FC
	ldx $CA.b		; A6 CA
	inc $3B40.w,X		; FE 40 3B
	rol A		; 2A
	ora $3E40.w,X		; 1D 40 3E
	ldx $2F.b,Y		; B6 2F
	cop $4E.b		; 02 4E
	jsr $3F1F.w		; 20 1F 3F
	bpl  -3.b		; 10 FD
	ldx $BA.b		; A6 BA
.INDEX 8
	sep #$12		; E2 12
	tsa		; 3B
	sbc $1E221D.l		; EF 1D 22 1E
	ldx $30.b		; A6 30
	sbc ($51.b,S),Y		; F3 51
	and ($F2.b,X)		; 21 F2
	rti		; 40

	lsr $A6CB.w		; 4E CB A6
	phx		; DA
	cpx #$02.b		; E0 02
	eor $0FCE.w		; 4D CE 0F
	ora $0D.b		; 05 0D
	ldx $23.b		; A6 23
	sbc ($41.b,S),Y		; F3 41
	bmi   3.b		; 30 03
	sbc ($20.b,S),Y		; F3 20
	tyx		; BB
	ldx $AD.b		; A6 AD
	sbc ($03.b),Y		; F1 03
	cmp ($CE.b),Y		; D1 CE
	and $A62CE6.l		; 2F E6 2C A6
	tsb $F2.b		; 04 F2
	eor $00.b,S		; 43 00
	bmi  35.b		; 30 23
	ora $9EA6CD.l		; 0F CD A6 9E
	sbc $EF0E21.l,X		; FF 21 0E EF
	sbc ($03.b,X)		; E1 03
	brk $A6.b		; 00 A6
	ora $01.b,S		; 03 01
	eor ($11.b)		; 52 11
	jsr $1F12.w		; 20 12 1F
	tyx		; BB
	ldx $DB.b		; A6 DB
	brk $20.b		; 00 20
	asl $01ED.w,X		; 1E ED 01
	ora ($4C.b),Y		; 11 4C
	ldx $04.b		; A6 04
	bpl  97.b		; 10 61
	ora ($20.b),Y		; 11 20
	and $A6DA1F.l		; 2F 1F DA A6
	xba		; EB
	ora ($11.b,X)		; 01 11
	asl $E1C1.w		; 0E C1 E1
	ora ($1E.b)		; 12 1E
	ldx $2F.b		; A6 2F
	jsl $022242.l		; 22 42 22 02
	bpl  45.b		; 10 2D
	cmp $DAA6.w		; CD A6 DA
	sbc ($E1.b,S),Y		; F3 E1
	ora $FDF1.w,X		; 1D F1 FD
	.db $42, $0E		; 42 0E
	ldx $12.b		; A6 12
	cop $50.b		; 02 50
	jsl $0F1002.l		; 22 02 10 0F
	lda $3EBBA6.l,X		; BF A6 BB 3E
	ora ($0C.b),Y		; 11 0C
	asl $1101.w,X		; 1E 01 11
	ora $0202A6.l,X		; 1F A6 02 02
	eor ($30.b,X)		; 41 30
	and ($10.b,X)		; 21 10
	inc $B2EB.w,X		; FE EB B2
	cmp $EECC.w,X		; DD CC EE
	cmp $DDDC.w,X		; DD DC DD
	sbc $2FA6FE.l		; EF FE A6 2F
	trb $30.b		; 14 30
	bvc -14.b		; 50 F2
	jmp $EAFE.w		; 4C FE EA
	ldx $FF.b		; A6 FF
	sbc $1F1D2E.l,X		; FF 2E 1D 1F
	and $0F6D.w,X		; 3D 6D 0F
	ldx $2F.b,Y		; B6 2F
	ora ($10.b),Y		; 11 10
	and $1D2E2F.l,X		; 3F 2F 2E 1D
	tas		; 1B
	ldx $2D.b		; A6 2D
	rol $2D2C.w		; 2E 2C 2D
	bit $5C5C.w,X		; 3C 5C 5C
	lsr A		; 4A
	ldx $6C.b		; A6 6C
	eor $5D7E7D.l,X		; 5F 7D 7E 5D
	adc #$2B.b		; 69 2B
	ora #$A6.b		; 09 A6
	bit $4C3A.w		; 2C 3A 4C
	and $6A5E.w,Y		; 39 5E 6A
	jmp ($A64A.w,X)		; 7C 4A A6
	tda		; 7B
	rti		; 40

	eor $3E4D50.l		; 4F 50 4D 3E
	plx		; FA
	inc A		; 1A
	ldx $3D.b		; A6 3D
	asl $5D2A.w		; 0E 2A 5D
	sbc ($5D.b),Y		; F1 5D
	jsr $A60C.w		; 20 0C A6
	rti		; 40

	bpl 111.b		; 10 6F
	eor $FD0E4F.l,X		; 5F 4F 0E FD
	cmp $1FA6.w,X		; DD A6 1F
	ora $3F1B.w		; 0D 1B 3F
	ora $0E014F.l,X		; 1F 4F 01 0E
	ldx $E4.b		; A6 E4
	ora ($42.b,X)		; 01 42
	ora ($30.b)		; 12 30
	sbc $EDEF.w,X		; FD EF ED
	ldx $01.b		; A6 01
	cmp ($0C.b,X)		; C1 0C
	sbc ($E2.b)		; F2 E2
	rti		; 40

	sbc ($F1.b,X)		; E1 F1
	lda ($F0.b)		; B2 F0
	ora ($24.b,X)		; 01 24
	eor $55.b		; 45 55
	.db $42, $10		; 42 10
	sbc $D0F1A6.l,X		; FF A6 F1 D0
	rep #$C3		; C2 C3
	pea $0F02.w		; F4 02 0F
	beq -90.b		; F0 A6
	sbc ($D5.b,S),Y		; F3 D5
	inc $F5.b,X		; F6 F5
	cmp ($FE.b)		; D2 FE
	bcs -16.b		; B0 F0
	ldx $E4.b		; A6 E4
	ldx $E4EF.w,Y		; BE EF E4
	sbc ($11.b,S),Y		; F3 11
	sbc $C2.b,S		; E3 C2
	ldx $F4.b		; A6 F4
	cpx $F4.b		; E4 F4
	ora $E2.b,X		; 15 E2
	cmp $A6F1B0.l		; CF B0 F1 A6
	ldy $FC.b,X		; B4 FC
	bne -30.b		; D0 E2
	and ($02.b,S),Y		; 33 02
	cpy $C0.b		; C4 C0
	ldx $F5.b		; A6 F5
	cmp $43.b,S		; C3 43
	inc $0F.b		; E6 0F
	cmp $A6F0A2.l,X		; DF A2 F0 A6
	ora $03CFEF.l		; 0F EF CF 03
	inc $2E.b		; E6 2E
	cmp ($FF.b,S),Y		; D3 FF
	ldx $03.b		; A6 03
	cmp ($27.b)		; D2 27
	sbc ($02.b,S),Y		; F3 02
	ldy #$B0.b		; A0 B0
	cop $A6.b		; 02 A6
	cmp ($CD.b)		; D2 CD
	lda ($E3.b)		; B2 E3
	ora $01.b		; 05 01
	beq -15.b		; F0 F1
	ldx $E2.b		; A6 E2
	ora ($17.b,X)		; 01 17
	pea $C0D1.w		; F4 D1 C0
	ldy $E1.b		; A4 E1
	ldx $11.b		; A6 11
	lda $D3C2.w		; AD C2 D3
	.db $42, $02		; 42 02
	sbc $F0B2D3.l,X		; FF D3 B2 F0
	ora ($13.b,X)		; 01 13
	eor $43.b		; 45 43
	jsr $10F0.w		; 20 F0 10
	ldx $F3.b		; A6 F3
	dex		; CA
	bne   3.b		; D0 03
	.db $42, $1E		; 42 1E
	bpl  -1.b		; 10 FF
	ldx $00.b		; A6 00
	ora ($32.b)		; 12 32
	rti		; 40

	asl $0FDC.w		; 0E DC 0F
	lsr $1FB2.w		; 4E B2 1F
	xce		; FB
	dex		; CA
	cpy $10F0.w		; CC F0 10
	bpl  15.b		; 10 0F
	ldx $2D.b		; A6 2D
	lsr $4F61.w		; 4E 61 4F
	pld		; 2B
	xce		; FB
	asl $B24E.w,X		; 1E 4E B2
	ora $CDCBEB.l,X		; 1F EB CB CD
	brk $20.b		; 00 20
	jsr $A61E.w		; 20 1E A6
	eor $603E.w		; 4D 3E 60
	eor $101B1B.l		; 4F 1B 1B 10
	eor $5BA6.w		; 4D A6 5B
	stp		; DB
	jsr ($4042.w,X)		; FC 42 40
	and $A62B0E.l,X		; 3F 0E 2B A6
	eor $405F11.l		; 4F 11 5F 40
	ora $F1EE.w		; 0D EE F1
	and $3CA6.w,X		; 3D A6 3C
	stp		; DB
	ora $3215.w		; 0D 15 32
	bpl  15.b		; 10 0F
	asl $1296.w		; 0E 96 12
	sbc $45.b		; E5 45
	and ($AE.b,S),Y		; 33 AE
	ldy $4102.w		; AC 02 41
	ldx $0E.b		; A6 0E
	lda $15E0.w		; AD E0 15
	and ($30.b,X)		; 21 30
	sbc $0196F0.l		; EF F0 96 01
	sbc $27.b,X		; F5 27
	bpl -19.b		; 10 ED
	sbc $2FD6.w		; ED D6 2F
	ldx $F0.b		; A6 F0
	ldy $12F0.w		; AC F0 12
	eor $02.b,S		; 43 02
	sbc $F1A6D1.l		; EF D1 A6 F1
	and ($21.b,X)		; 21 21
	ora ($ED.b)		; 12 ED
	beq -30.b		; F0 E2
	jmp $0FB6.w		; 4C B6 0F
	tsb $02F0.w		; 0C F0 02
	and ($00.b),Y		; 31 00
	ora $00A20F.l		; 0F 0F A2 00
	bpl 116.b		; 10 74
	eor $61.b		; 45 61
	and $A641EF.l		; 2F EF 41 A6
	sbc $FDFB.w,X		; FD FB FD
	eor ($51.b,X)		; 41 51
	eor $5AFE.w,X		; 5D FE 5A
	ldx #$21.b		; A2 21
	brk $54.b		; 00 54
	eor ($50.b,S),Y		; 53 50
	asl $311D.w,X		; 1E 1D 31
	ldx $0D.b		; A6 0D
	nop		; EA
	ora $507E.w		; 0D 7E 50
	lsr $0E1D.w,X		; 5E 1D 0E
	ldx $2F.b		; A6 2F
	rol $4C5E.w,X		; 3E 5E 4C
	bit $3D0F.w,X		; 3C 0F 3D
	rol $1CB6.w,X		; 3E B6 1C
	bit $2E0F.w		; 2C 0F 2E
	eor ($10.b,X)		; 41 10
	bit $A210.w		; 2C 10 A2
	ora $614342.l		; 0F 42 43 61
	eor ($20.b,X)		; 41 20
	and $EEA621.l,X		; 3F 21 A6 EE
	asl A		; 0A
	inc $7012.w,X		; FE 12 70
	bmi  43.b		; 30 2B
	and $2E96.w		; 2D 96 2E
	rts		; 60

	phy		; 5A
	and $FD.b,S		; 23 FD
	ply		; 7A
	cpx #$5A.b		; E0 5A
	ldx $2C.b		; A6 2C
	jsr ($01FE.w,X)		; FC FE 01
	eor ($41.b)		; 52 41
	inc $92FF.w,X		; FE FF 92
	eor $637655.l		; 4F 55 76 63
	eor $57.b,S		; 43 57
	and $A640.w,X		; 3D 40 A6
	beq -21.b		; F0 EB
	sbc $603202.l,X		; FF 02 32 60
	ora $960D.w		; 0D 0D 96
	.db $42, $F3		; 42 F3
	dec A		; 3A
	eor ($FC.b),Y		; 51 FC
	bmi  43.b		; 30 2B
	jsr $0EB2.w		; 20 B2 0E
	sbc $CDBB.w,X		; FD BB CD
	sbc ($12.b),Y		; F1 12
	and ($10.b,X)		; 21 10
	stx $E2.b,Y		; 96 E2
	adc $0D3F3E.l		; 6F 3E 3F 0D
	bmi  -1.b		; 30 FF
	and $FBEEA6.l		; 2F A6 EE FB
	ora $3320.w		; 0D 20 33
	and $F0.b,S		; 23 F0
	sbc $1401A2.l,X		; FF A2 01 14
	.db $42, $45		; 42 45
	bpl  32.b		; 10 20
	ora ($11.b)		; 12 11
	ldx $CF.b		; A6 CF
	asl $E1B2.w		; 0E B2 E1
	bit $04.b,X		; 34 04
	sbc ($E0.b),Y		; F1 E0
	stx $B1.b,Y		; 96 B1
	and $02.b,X		; 35 02
	beq -62.b		; F0 C2
	sbc ($C4.b,S),Y		; F3 C4
	asl $FFA2.w,X		; 1E A2 FF
	tsx		; BA
	sta $BF9B.w,Y		; 99 9B BF
	trb $43.b		; 14 43
	ora ($A2.b),Y		; 11 A2
	cpx #$14.b		; E0 14
	eor $45.b		; 45 45
	cop $12.b		; 02 12
	trb $21.b		; 14 21
	ldx #$ED.b		; A2 ED
	dex		; CA
	sta $BF9B.w,Y		; 99 9B BF
	tsb $23.b		; 04 23
	bmi -106.b		; 30 96
	dec $2662.w,X		; DE 62 26
	beq -80.b		; F0 B0
	sbc ($02.b)		; F2 02
	bit $CFA6.w		; 2C A6 CF
	sbc $1100E0.l		; EF E0 00 11
	eor $A2FE22.l,X		; 5F 22 FE A2
	bmi   3.b		; 30 03
	stz $63.b		; 64 63
	bpl  34.b		; 10 22
	and $40.b,S		; 23 40
	ldx $FB.b		; A6 FB
	pld		; 2B
	brk $4B.b		; 00 4B
	and $1C2141.l,X		; 3F 41 21 1C
	ldx $1F.b		; A6 1F
	and $2D3B40.l		; 2F 40 3B 2D
	ora $A62D3F.l,X		; 1F 3F 2D A6
	dec $3F0B.w,X		; DE 0B 3F
	trb $423E.w		; 1C 3E 42
	and $0EA63D.l,X		; 3F 3D A6 0E
	lsr $4B5F.w		; 4E 5F 4B
	ora $302F.w		; 0D 2F 30
	phd		; 0B
	ldx #$EB.b		; A2 EB
	lda $BAA9.w,Y		; B9 A9 BA
	tyx		; BB
	cmp $A64243.l,X		; DF 43 42 A6
	inc $2031.w,X		; FE 31 20
	bit $2E1D.w		; 2C 1D 2E
	bmi  12.b		; 30 0C
	ldx #$DB.b		; A2 DB
	txs		; 9A
	tsx		; BA
	dex		; CA
	ldy $24EE.w		; AC EE 24
	.db $42, $96		; 42 96
	ora $4242.w,X		; 1D 42 42
	dec A		; 3A
	inc $6D1E.w,X		; FE 1E 6D
	trb $BA96.w		; 1C 96 BA
	asl $DBD5.w		; 0E D5 DB
	ora ($60.b),Y		; 11 60
	adc ($3E.b)		; 72 3E
	stx $FF.b,Y		; 96 FF
	lsr $FE72.w		; 4E 72 FE
	cpx $0131.w		; EC 31 01
	xce		; FB
	stx $DC.b,Y		; 96 DC
	cpy #$10.b		; C0 10
	rol A		; 2A
	sbc ($34.b,X)		; E1 34
	and $2F.b,X		; 35 2F
	stx $F1.b,Y		; 96 F1
	jsr $2B17.w		; 20 17 2B
	sbc $DD400E.l		; EF 0E 40 DD
	ldx #$DD.b		; A2 DD
	plb		; AB
	ldy $A9BA.w,X		; BC BA A9
	ldx $43F2.w		; AE F2 43
	stx $D3.b,Y		; 96 D3
	ora ($04.b)		; 12 04
	and $35DDB2.l		; 2F B2 DD 35
	sta $DCA2.w,X		; 9D A2 DC
	stz $9ACD.w		; 9C CD 9A
	txs		; 9A
	lda $34F1.w		; AD F1 34
	stx $DF.b,Y		; 96 DF
	jsl $B5D017.l		; 22 17 D0 B5
	rep #$C4		; C2 C4
	sta $D1D1A6.l,X		; 9F A6 D1 D1
	ora ($E1.b,X)		; 01 E1
	cpy #$12.b		; C0 12
	ora $F1.b,X		; 15 F1
	stx $02.b,Y		; 96 02
	cmp [$D5.b],Y		; D7 D5
	sbc ($B5.b),Y		; F1 B5
	lda ($F3.b,X)		; A1 F3
	ldx $C096.w		; AE 96 C0
	beq -44.b		; F0 D4
	sta $26E6D1.l,X		; 9F D1 E6 26
	eor ($96.b)		; 52 96
.ACCU 8
.INDEX 8
	sep #$F1		; E2 F1
	bit $B2.b		; 24 B2
	ora $C0D0E2.l,X		; 1F E2 D0 C0
	stx $A2.b,Y		; 96 A2
	cpx #$F2.b		; E0 F2
	lda $46E4B2.l		; AF B2 E4 46
	and ($96.b)		; 32 96
	ora ($D3.b)		; 12 D3
	and $FCC402.l,X		; 3F 02 C4 FC
	brk $A1.b		; 00 A1
	ldx #$DC.b		; A2 DC
	cmp $D9DC.w		; CD DC D9
	sta $E1AB.w,Y		; 99 AB E1
	ora $96.b,X		; 15 96
	sbc ($1E.b),Y		; F1 1E
	bmi  60.b		; 30 3C
	lsr $D0FD.w		; 4E FD D0
	ora $2EA6.w,Y		; 19 A6 2E
	and $FD3D.w		; 2D 3D FD
	ora $3111.w,X		; 1D 11 31
	rti		; 40

	ldx #$75.b		; A2 75
	eor ($64.b,S),Y		; 53 64
	stz $43.b		; 64 43
	rti		; 40

	ora $2EA6FD.l,X		; 1F FD A6 2E
	asl $0E1E.w,X		; 1E 1E 0E
	tsb $5F21.w		; 0C 21 5F
	and ($96.b)		; 32 96
	rtl		; 6B

	jmp $4F3D.w		; 4C 3D 4F
	phk		; 4B
	pld		; 2B
	ora #$1D.b		; 09 1D
	ldx $2F.b		; A6 2F
	rol $1C1D.w		; 2E 1D 1C
	asl $520F.w		; 0E 0F 52
	and ($96.b,X)		; 21 96
	adc $EF20.w,X		; 7D 20 EF
	rti		; 40

	eor $FA0A.w		; 4D 0A FA
	bpl -106.b		; 10 96
	ora $19DA21.l,X		; 1F 21 DA 19
	inc $641F.w,X		; FE 1F 64
	adc $96.b		; 65 96
	bvc -48.b		; 50 D0
	brk $14.b		; 00 14
	sbc $01DC19.l,X		; FF 19 DC 01
	stx $02.b,Y		; 96 02
	bpl -50.b		; 10 CE
	bcs -36.b		; B0 DC
	and ($17.b,X)		; 21 17
	eor $A6.b,X		; 55 A6
	and ($FF.b,X)		; 21 FF
	sbc ($02.b),Y		; F1 02
	ora ($EF.b,X)		; 01 EF
	bcs -14.b		; B0 F2
	ldx #$F1.b		; A2 F1
	beq -20.b		; F0 EC
	ldy $9A99.w		; AC 99 9A
	lda $67A215.l,X		; BF 15 A2 67
	mvn $45,$23		; 54 23 45
	mvn $DD,$41		; 54 41 DD
	cmp $F1A2.w		; CD A2 F1
	brk $EC.b		; 00 EC
	tsx		; BA
	lda #$9A.b		; A9 9A
	dec $9616.w		; CE 16 96
	ora ($E1.b,S),Y		; 13 E1
	lda ($23.b,X)		; A1 23
	rol $BCEB.w,X		; 3E EB BC
	jsl $3C0396.l		; 22 96 03 3C
	jmp.w [$0FDC]		; DC DC 0F
	sbc ($34.b,X)		; E1 34
	eor [$96.b],Y		; 57 96
	eor ($EE.b),Y		; 51 EE
	ora $FA2E14.l		; 0F 14 2E FA
	sta $1496F5.l,X		; 9F F5 96 14
	inc $EDCC.w,X		; FE CC ED
	rep #$0F		; C2 0F
	and $47.b,X		; 35 47
	ldx #$67.b		; A2 67
	mvn $36,$32		; 54 32 36
	mvn $CD,$20		; 54 20 CD
	cmp $1E12A6.l,X		; DF A6 12 1E
	dec $E2F0.w,X		; DE F0 E2
	bne  20.b		; D0 14
	ora $96.b		; 05 96
	and $D1.b,S		; 23 D1
	inc $D334.w		; EE 34 D3
	ldy $0591.w,X		; BC 91 05
	stx $22.b,Y		; 96 22
	ora $C09E.w,X		; 1D 9E C0
	lda ($E0.b,S),Y		; B3 E0
	sbc [$57.b]		; E7 57
	ldx #$66.b		; A2 66
	mvn $35,$34		; 54 34 35
	mvp $CD,$20		; 44 20 CD
	bne -94.b		; D0 A2
	tsb $21.b		; 04 21
	jmp.w [$ABBB]		; DC BB AB
	tsx		; BA
	lda $9604.w		; AD 04 96
	.db $42, $01		; 42 01
	lda ($32.b,X)		; A1 32
	cmp ($F9.b),Y		; D1 F9
	lda ($40.b,X)		; A1 40
	stx $63.b,Y		; 96 63
	jmp.w [$C0BE]		; DC BE C0
	sbc $763F00.l		; EF 00 3F 76
	stx $7D.b,Y		; 96 7D
	jmp ($6FB1.w)		; 6C B1 6F
	asl $DDDB.w		; 0E DB DD
	adc ($A6.b,X)		; 61 A6
	ora ($2C.b),Y		; 11 2C
	sbc $2E0E.w,X		; FD 0E 2E
	ora $964100.l,X		; 1F 00 41 96
	.db $62, $4C, $0E		; 62 4C 0E
	jmp $FEFA4B.l		; 5C 4B FA FE
	eor ($96.b),Y		; 51 96
	eor ($09.b),Y		; 51 09
	xba		; EB
	sbc $00010E.l		; EF 0E 01 00
	stz $A6.b,X		; 74 A6
	sbc $2E.b,X		; F5 2E
	sbc ($F1.b),Y		; F1 F1
	asl $E2FE.w		; 0E FE E2
	cop $96.b		; 02 96
	and ($E0.b,X)		; 21 E0
	tyx		; BB
	ldy $C1.b,X		; B4 C1
	and $9636C5.l		; 2F C5 36 96
	asl $05.b,X		; 16 05
	sty $0C.b,X		; 94 0C
	ldy $CC.b,X		; B4 CC
	brk $E7.b		; 00 E7
	stx $13.b,Y		; 96 13
	cmp ($AC.b,X)		; C1 AC
	sbc ($EE.b,X)		; E1 EE
	trb $C3.b		; 14 C3
	ora $A2.b		; 05 A2
	ora $67.b,X		; 15 67
	and $44.b		; 25 44
	ora ($FF.b,X)		; 01 FF
	cmp $03A2F1.l,X		; DF F1 A2 03
	bpl -35.b		; 10 DD
	sta $AEBC.w,X		; 9D BC AE
	dec $A2E1.w		; CE E1 A2
	trb $67.b		; 14 67
	eor $33.b,X		; 55 33
	beq -16.b		; F0 F0
	cpy #$F1.b		; C0 F1
	stx $02.b,Y		; 96 02
	sbc ($CE.b,X)		; E1 CE
	bcs -30.b		; B0 E2
	inc $B0.b		; E6 B0
	and $A2.b,X		; 35 A2
	tsb $67.b		; 04 67
	lsr $22.b,X		; 56 22
	sbc $00EFE0.l,X		; FF E0 EF 00
	stx $E3.b,Y		; 96 E3
	asl $B2FD.w		; 0E FD B2
	ldx #$21.b		; A2 21
	pei ($E4.b)		; D4 E4
	stx $44.b,Y		; 96 44
	eor ($0F.b,S),Y		; 53 0F
	ldx $12AF.w,Y		; BE AF 12
	brk $01.b		; 00 01
	stx $F1.b,Y		; 96 F1
	rol $C1BF.w,X		; 3E BF C1
	ldy $F3.b,X		; B4 F3
	sbc $E3.b,S		; E3 E3
	stx $17.b,Y		; 96 17
	eor $FC.b,X		; 55 FC
	jmp.w [$03DE]		; DC DE 03
	sep #$00		; E2 00
	stx $E2.b,Y		; 96 E2
	ora $AC.b		; 05 AC
	beq -108.b		; F0 94
	jsr $F3F1.w		; 20 F1 F3
	stx $05.b,Y		; 96 05
	adc $E0.b,X		; 75 E0
	ldx $F2B1.w		; AE B1 F2
	ora $C1.b,S		; 03 C1
	stx $00.b,Y		; 96 00
	trb $CD.b		; 14 CD
	bcs -77.b		; B0 B3
	ora $D0.b		; 05 D0
	ora $A6.b		; 05 A6
	cpx $23.b		; E4 23
.ACCU 8
.INDEX 8
	sep #$B0		; E2 B0
.ACCU 16
.INDEX 16
	rep #$F3		; C2 F3
.ACCU 8
	sep #$E1		; E2 E1
	ldx #$02F1.w		; A2 F1 02
	brk $CE.b		; 00 CE
	ldy $DEC0.w,X		; BC C0 DE
	bne -90.b		; D0 A6
	pea $E123.w		; F4 23 E1
	cmp ($B1.b,X)		; C1 B1
	ora $E4.b,S		; 03 E4
	cmp ($A2.b,X)		; C1 A2
	sbc ($F3.b)		; F2 F3
	brk $DE.b		; 00 DE
	lda $DFDF.w		; AD DF DF
	sbc $37F2A2.l		; EF A2 F2 37
	eor $10.b,X		; 55 10
	dec $01E2.w,X		; DE E2 01
	beq -90.b		; F0 A6
	sbc ($F3.b)		; F2 F3
	sbc $14DFE1.l		; EF E1 DF 14
.ACCU 16
.INDEX 16
	rep #$F0		; C2 F0
	ldx #$45D3.w		; A2 D3 45
	mvn $FF,$00		; 54 00 FF
	sbc ($00.b),Y		; F1 00
	brk $96.b		; 00 96
.ACCU 16
	rep #$24		; C2 24
	sbc $EFC0.w		; ED C0 EF
	and ($C0.b)		; 32 C0
	bpl -106.b		; 10 96
	jsl $BD0072.l		; 22 72 00 BD
	cmp ($02.b)		; D2 02
	ora $EF92E2.l		; 0F E2 92 EF
	ora $22.b,X		; 15 22
	xba		; EB
	ldy $DC9E.w,X		; BC 9E DC
	lda $54E496.l		; AF 96 E4 54
	beq -65.b		; F0 BF
	lda ($15.b)		; B2 15
	lda $C69601.l,X		; BF 01 96 C6
	sbc ($F0.b,S),Y		; F3 F0
	cmp ($92.b,X)		; C1 92
	sbc $B2.b,X		; F5 B2
	lda $A6.b,X		; B5 A6
	ora $04.b,S		; 03 04
	sbc $F3C2F1.l		; EF F1 C2 F3
	sbc ($D2.b,X)		; E1 D2
	stx $A5.b,Y		; 96 A5
	ora [$A3.b]		; 07 A3
	lda ($C3.b),Y		; B1 C3
	cmp $E3.b,S		; C3 E3
	lda [$A6.b]		; A7 A6
	sbc $04.b,S		; E3 04
	cmp ($C1.b)		; D2 C1
	sbc ($02.b,X)		; E1 02
	cmp ($E1.b)		; D2 E1
	sta ($A0.b)		; 92 A0
	sbc [$16.b],Y		; F7 16
	sbc ($AE.b),Y		; F1 AE
	lda $929CAE.l,X		; BF AE 9C 92
	lda ($07.b)		; B2 07
	eor $03.b,X		; 55 03
	bne   4.b		; D0 04
	brk $DF.b		; 00 DF
	sta ($A0.b)		; 92 A0
	sbc $03.b,X		; F5 03
	brk $EE.b		; 00 EE
	dec $BCDC.w		; CE DC BC
	stx $03.b,Y		; 96 03
	and [$C0.b]		; 27 C0
	sbc ($E0.b,X)		; E1 E0
	cop $FE.b		; 02 FE
	beq -122.b		; F0 86
	lda ($57.b,S),Y		; B3 57
	and $C12A.w		; 2D 2A C1
.ACCU 16
	rep #$AE		; C2 AE
	sbc ($96.b,S),Y		; F3 96
	bpl  81.b		; 10 51
	ora $101F0E.l,X		; 1F 0E 1F 10
	asl $86D2.w		; 0E D2 86
	ldy $63.b		; A4 63
	jsr $DCEF.w		; 20 EF DC
	cmp ($CD.b)		; D2 CD
	rti		; 40

	.db $82, $9B, $36		; 82 9B 36
	ror $36.b		; 66 36
	eor ($65.b,S),Y		; 53 65
	ora $CE92D9.l		; 0F D9 92 CE
	sbc ($54.b,X)		; E1 54
	and $2D.b,S		; 23 2D
	sbc $AEBB.w		; ED BB AE
	stx $2E.b		; 86 2E
	rol $1F.b		; 26 1F
	ror $E3C4.w		; 6E C4 E3
	dec $92A2.w		; CE A2 92
	lda $3406F1.l,X		; BF F1 06 34
	jsr $CB9E.w		; 20 9E CB
	stz $BE92.w,X		; 9E 92 BE
	bne   3.b		; D0 03
	ora [$35.b]		; 07 35
	bit $00.b		; 24 00
	cmp $B39E92.l,X		; DF 92 9E B3
	asl $27.b		; 06 27
	cop $DE.b		; 02 DE
	sta $D396AE.l,X		; 9F AE 96 D3
	cpy $01.b		; C4 01
	inc $B6.b,X		; F6 B6
	cmp $A3.b,S		; C3 A3
	lda ($96.b,S),Y		; B3 96
	cmp ($F7.b,X)		; C1 F7
	cmp [$D3.b],Y		; D7 D3
	bcs -93.b		; B0 A3
	ldx #$9203.w		; A2 03 92
	ldx $D4CF.w		; AE CF D4
	pea $1654.w		; F4 54 16
	brk $EF.b		; 00 EF
	stx $97.b,Y		; 96 97
	pei ($16.b)		; D4 16
	cmp $DE.b,X		; D5 DE
	lda ($D2.b,X)		; A1 D2
.INDEX 8
	sep #$92		; E2 92
	lda $FFAD.w,X		; BD AD FF
	ora $35.b,X		; 15 35
	mvp $DF,$00		; 44 00 DF
	stx $D0.b,Y		; 96 D0
	sbc ($36.b,S),Y		; F3 36
.ACCU 8
.INDEX 8
	sep #$FD		; E2 FD
	lda ($FE.b,X)		; A1 FE
	cpx $86.b		; E4 86
	cpx $15F3.w		; EC F3 15
	and [$3F.b],Y		; 37 3F
	ldy $EC.b,X		; B4 EC
	sta $C0BC92.l,X		; 9F 92 BC C0
	rol $67.b		; 26 67
	eor ($EF.b,S),Y		; 53 EF
	jmp.w [$86CC]		; DC CC 86
	beq -109.b		; F0 93
	eor $56.b,S		; 43 56
	and ($A3.b,X)		; 21 A3
	and #$92.b		; 29 92
	stx $DF.b,Y		; 96 DF
	asl $03.b,X		; 16 03
	and $EE.b,S		; 23 EE
	lda $96E2F0.l,X		; BF F0 E2 96
	cmp $0412C5.l,X		; DF C5 12 04
	ora ($D1.b)		; 12 D1
	beq -93.b		; F0 A3
	stx $DD.b,Y		; 96 DD
	asl $25.b		; 06 25
	ora $B0.b,S		; 03 B0
	cpy #$FF.b		; C0 FF
	cmp ($96.b),Y		; D1 96
	sbc $E5E5.w,X		; FD E5 E5
	sbc $10.b,X		; F5 10
	sbc $DE.b		; E5 DE
	bne -106.b		; D0 96
	lda ($E6.b)		; B2 E6
	and $D4.b,X		; 35 D4
	cpx $C0D4.w		; EC D4 C0
	cpy #$96.b		; C0 96
	cmp ($C4.b),Y		; D1 C4
	ora $07.b,S		; 03 07
	sbc ($F4.b),Y		; F1 F4
	cmp $E196BF.l,X		; DF BF 96 E1
	cmp [$41.b],Y		; D7 41
	ora $EE.b,S		; 03 EE
	lda ($FE.b,S),Y		; B3 FE
	beq -106.b		; F0 96
	ldx $1103.w,Y		; BE 03 11
	and $E3.b		; 25 E3
	ora ($EF.b,X)		; 01 EF
	dec $1C96.w,X		; DE 96 1C
	ora $6F.b		; 05 6F
	and ($FD.b,X)		; 21 FD
	beq  12.b		; F0 0C
	cpx #$96.b		; E0 96
	jmp.w [$2103]		; DC 03 21
	eor ($12.b,X)		; 41 12
	rol $EE49.w		; 2E 49 EE
	stx $0C.b,Y		; 96 0C
	and ($50.b)		; 32 50
	and $2A0149.l,X		; 3F 49 01 2A
	tas		; 1B
	stx $ED.b,Y		; 96 ED
	brk $60.b		; 00 60
	and ($4D.b,X)		; 21 4D
	rti		; 40

	rol A		; 2A
	inc $0EA6.w,X		; FE A6 0E
	jsr $2F4F.w		; 20 4F 2F
	ora $1C2F.w,X		; 1D 2F 1C
	ora $0E96.w		; 0D 96 0E
	ora $211342.l,X		; 1F 42 13 21
	pea $A11D.w		; F4 1D A1
	stx $DF.b,Y		; 96 DF
	and ($50.b,X)		; 21 50
	asl $EB.b		; 06 EB
	ora ($DF.b)		; 12 DF
	lda $E49196.l,X		; BF 96 91 E4
	trb $F4.b		; 14 F4
	jsl $C0EF03.l		; 22 03 EF C0
	stx $C0.b,Y		; 96 C0
	sbc $24.b		; E5 24
	sbc $0F.b,S		; E3 0F
	sbc $AF.b		; E5 AF
	dec $B196.w		; CE 96 B1
	cmp $22.b		; C5 22
	ora $03.b,S		; 03 03
	sbc $D2.b,X		; F5 D2
	ldy #$92.b		; A0 92
	dec $23C3.w		; CE C3 23
	lsr $47.b		; 46 47
	and $4F.b,X		; 35 4F
	txs		; 9A
	stx $AF.b,Y		; 96 AF
	ora $14.b,S		; 03 14
	cpx $22.b		; E4 22
	inc $EF.b		; E6 EF
	cmp ($92.b,X)		; C1 92
	dec $14D0.w		; CE D0 14
	and $46.b,X		; 35 46
	and [$30.b],Y		; 37 30
	sta $B196.w,Y		; 99 96 B1
	cmp $03.b,X		; D5 03
	sbc $11.b,X		; F5 11
	trb $EF.b		; 14 EF
	cpy #$96.b		; C0 96
	cpx #$05.b		; E0 05
	sbc $02.b,S		; E3 02
	tsb $C1.b		; 04 C1
	jsr ($9690.w,X)		; FC 90 96
	ldx $13F5.w,Y		; BE F5 13
	pea $0304.w		; F4 04 03
	sbc $EE92C2.l,X		; FF C2 92 EE
	beq   2.b		; F0 02
	eor $46.b		; 45 46
	rol $20.b,X		; 36 20
	lda #$96.b		; A9 96
	cpy #$E5.b		; C0 E5
	sbc $E6.b		; E5 E6
.ACCU 8
	sep #$23		; E2 23
	sbc ($B1.b),Y		; F1 B1
	ldx #$EF.b		; A2 EF
	beq  18.b		; F0 12
	ora ($24.b,S),Y		; 13 24
	bit $11.b,X		; 34 11
	jmp.w [$B296]		; DC 96 B2
	dec $E3.b,X		; D6 E3
	pea $14E5.w		; F4 E5 14
	ora ($B0.b,X)		; 01 B0
	sta ($0F.b)		; 92 0F
	sep #$03		; E2 03
	ora ($37.b,S),Y		; 13 37
	lsr $00.b		; 46 00
	sta $D096.w,Y		; 99 96 D0
	sbc $E3.b,X		; F5 E3
	sbc ($03.b,S),Y		; F3 03
	trb $F2.b		; 14 F2
	cmp $D4B296.l,X		; DF 96 B2 D4
	cpx $E3.b		; E4 E3
	trb $D2.b		; 14 D2
	cmp $B296AE.l		; CF AE 96 B2
	sbc ($01.b,S),Y		; F3 01
	sbc ($F4.b,S),Y		; F3 F4
	asl $E3.b		; 06 E3
.INDEX 16
	rep #$92		; C2 92
	cop $EF.b		; 02 EF
	sbc $14.b,S		; E3 14
	and [$55.b],Y		; 37 55
	bpl -87.b		; 10 A9
	stx $C2.b,Y		; 96 C2
	cop $F4.b		; 02 F4
	cmp ($10.b)		; D2 10
	and $02.b,X		; 35 02
	cmp $CF0192.l,X		; DF 92 01 CF
	sbc ($14.b,X)		; E1 14
	and [$55.b],Y		; 37 55
	ora ($B9.b),Y		; 11 B9
	stx $E0.b		; 86 E0
	sbc $11.b,S		; E3 11
	ora ($F6.b,X)		; 01 F6
	eor $70.b,X		; 55 70
	bit $CD86.w		; 2C 86 CD
	lda ($02.b),Y		; B1 02
	asl $22.b,X		; 16 22
	asl $B9C9.w,X		; 1E C9 B9
	stx $F0.b,Y		; 96 F0
	ora $2F4E.w,X		; 1D 4E 2F
	jsr $4150.w		; 20 50 41
	trb $2A96.w		; 1C 96 2A
	asl $3111.w		; 0E 11 31
	eor $EB4A1B.l		; 4F 1B 4A EB
	ldx #$DCDB.w		; A2 DB DC
	cmp $FFFD.w,X		; DD FD FF
	ora ($54.b),Y		; 11 54
	eor ($A2.b,S),Y		; 53 A2
	bmi  30.b		; 30 1E
	beq  31.b		; F0 1F
	.db $42, $30		; 42 30
	and $4B96FC.l		; 2F FC 96 4B
	and $1E7C.w		; 2D 7C 1E
	jmp $5A6F7F.l		; 5C 7F 6F 5A
	stx $3A.b,Y		; 96 3A
	jsr ($6D4E.w,X)		; FC 4E 6D
	adc $494A.w,X		; 7D 4A 49
	inc A		; 1A
	ldx #$DCDC.w		; A2 DC DC
	jmp.w [$FEDC]		; DC DC FE
	bpl  68.b		; 10 44
	adc $92.b,S		; 63 92
	adc ($1C.b)		; 72 1C
	inc $6410.w,X		; FE 10 64
	rti		; 40

	rol $96FB.w		; 2E FB 96
	trb $3F0E.w		; 1C 0E 3F
	rol STAT78.w		; 2E 3F 21
	.db $62, $2E, $96		; 62 2E 96
	inc A		; 1A
	cpx $3130.w		; EC 30 31
	rol $2E1C.w,X		; 3E 1C 2E
	inc $0C96.w,X		; FE 96 0C
	beq -15.b		; F0 F1
	rol $1120.w		; 2E 20 11
	adc ($2F.b)		; 72 2F
	ldx #$0E51.w		; A2 51 0E
	sbc $112211.l,X		; FF 11 22 11
	ora $EE960E.l,X		; 1F 0E 96 EE
	jsr ($2F30.w,X)		; FC 30 2F
	jsr $44F4.w		; 20 F4 44
	jsr $0B96.w		; 20 96 0B
	dec $4100.w		; CE 00 41
	jsr $100C.w		; 20 0C 10
	inc $FD96.w,X		; FE 96 FD
	sbc $0F1110.l		; EF 10 11 0F
	and ($54.b,X)		; 21 54
	jsl $DC0A96.l		; 22 96 0A DC
	ora ($12.b),Y		; 11 12
	and $F0D1E1.l,X		; 3F E1 D1 F0
	stx $D0.b,Y		; 96 D0
	cmp $D214.w		; CD 14 D2
	ora $403404.l,X		; 1F 04 34 40
	stx $0D.b,Y		; 96 0D
	stz $0510.w,X		; 9E 10 05
	sbc ($EF.b),Y		; F1 EF
	cop $FE.b		; 02 FE
	stx $EF.b,Y		; 96 EF
	lda $F2E303.l,X		; BF 03 E3 F2
	sbc $37.b,S		; E3 37
	ora ($96.b,S),Y		; 13 96
	sbc $D4AF.w		; ED AF D4
	sbc $02.b,S		; E3 02
	cmp $E3.b,S		; C3 E3
	sbc ($A6.b,X)		; E1 A6
	sbc $E203EF.l		; EF EF 03 E2
	beq -13.b		; F0 F3
	tsb $F3.b		; 04 F3
	ldx $F0.b		; A6 F0
	lda ($F1.b),Y		; B1 F1
	sbc ($E2.b,S),Y		; F3 E2
	sbc ($F2.b,X)		; E1 F2
	sbc ($A2.b,X)		; E1 A2
	inc $ADBC.w		; EE BC AD
	cmp $15E0DF.l		; CF DF E0 15
	eor [$96.b]		; 47 96
	lda $D49492.l		; AF 92 94 D4
	sbc $D3.b,S		; E3 D3
	sbc ($D3.b)		; F2 D3
	ldx #$BCEF.w		; A2 EF BC
	ldx $EFCF.w,Y		; BE CF EF
	cpx #$4604.w		; E0 04 46
	ldx #$0135.w		; A2 35 01
	beq -16.b		; F0 F0
	sbc ($00.b),Y		; F1 00
	cop $00.b		; 02 00
	stx $EE.b,Y		; 96 EE
	lda ($01.b,X)		; A1 01
	sbc $E3.b		; E5 E3
	sbc ($35.b),Y		; F1 35
	and $96.b		; 25 96
	cmp ($BE.b),Y		; D1 BE
	cpy #$01F0.w		; C0 F0 01
	ora ($03.b,X)		; 01 03
	sbc $DEFC96.l,X		; FF 96 FC DE
	ora ($11.b,X)		; 01 11
	and $414310.l		; 2F 10 43 41
	stx $2D.b,Y		; 96 2D
	xce		; FB
	ora $1F0F.w		; 0D 0F 1F
	and $961D21.l,X		; 3F 21 1D 96
	tsb $1FDC.w		; 0C DC 1F
	lsr $2F4E.w,X		; 5E 4E 2F
	adc ($40.b,X)		; 61 40
	stx $4C.b,Y		; 96 4C
	inc A		; 1A
	xce		; FB
	bit $304E.w		; 2C 4E 30
	and ($3C.b),Y		; 31 3C
	stx $FA.b,Y		; 96 FA
	tas		; 1B
	bpl  46.b		; 10 2E
	bmi  47.b		; 30 2F
	rti		; 40

	adc ($96.b,X)		; 61 96
	and $0BFC.w,X		; 3D FC 0B
	trb $502F.w		; 1C 2F 50
	lsr $963B.w		; 4E 3B 96
	ora $3FE9.w		; 0D E9 3F
	jsr $204E.w		; 20 4E 20
	adc $4E965F.l		; 6F 5F 96 4E
	ora $E0DC.w		; 0D DC E0
	ora ($21.b,X)		; 01 21
	and ($2C.b,X)		; 21 2C
	stx $EF.b,Y		; 96 EF
	jmp.w [$F32F]		; DC 2F F3
	ora ($10.b),Y		; 11 10
	jsl $309631.l		; 22 31 96 30
	cmp $E3D0EC.l,X		; DF EC D0 E3
	bmi  65.b		; 30 41
	inc $0E96.w		; EE 96 0E
	cpy #$11DF.w		; C0 DF 11
	ora ($02.b)		; 12 02
	ora ($04.b,S),Y		; 13 04
	stx $04.b,Y		; 96 04
	bne -52.b		; D0 CC
	dec $2102.w,X		; DE 02 21
	bit $DF.b		; 24 DF
	ldx #$DD0F.w		; A2 0F DD
	cpy $EFCD.w		; CC CD EF
	ora ($02.b,X)		; 01 02
	bit $96.b		; 24 96
	jsl $BFBEE0.l		; 22 E0 BE BF
	pea $2221.w		; F4 21 22
	bne -110.b		; D0 92
	ora $9999CB.l		; 0F CB 99 99
	cmp $3724F1.l,X		; DF F1 24 37
	stx $13.b,Y		; 96 13
	sbc $04BFBE.l,X		; FF BE BF 04
	pea $E211.w		; F4 11 E2
	stx $DF.b,Y		; 96 DF
	inc $F0EF.w		; EE EF F0
	and ($04.b)		; 32 04
	sbc ($14.b),Y		; F1 14
	stx $04.b,Y		; 96 04
	sbc $F3A0BE.l,X		; FF BE A0 F3
	trb $F2.b		; 14 F2
	cmp ($96.b)		; D2 96
	cmp ($A3.b)		; D2 A3
	bcs -44.b		; B0 D4
	ora $04.b,S		; 03 04
	sep #$02		; E2 02
	stx $24.b,Y		; 96 24
	beq -82.b		; F0 AE
	lda ($D5.b,X)		; A1 D5
	ora $13.b,S		; 03 13
	ldy $96.b		; A4 96
	bne -31.b		; D0 E1
	dec $05D3.w		; CE D3 05
	ora $F1.b,S		; 03 F1
	pea $34A2.w		; F4 A2 34
	mvp $DC,$01		; 44 01 DC
	cmp $0101F1.l		; CF F1 01 01
	stx $E1.b,Y		; 96 E1
	cpx #$D3C0.w		; E0 C0 D3
	ora $15.b,S		; 03 15
	cmp $D3.b,S		; C3 D3
	stx $24.b,Y		; 96 24
	sbc ($AF.b,X)		; E1 AF
	sta ($D6.b),Y		; 91 D6
	ora ($F2.b,S),Y		; 13 F2
	cmp ($96.b),Y		; D1 96
	sbc ($D1.b)		; F2 D1
	bcs -61.b		; B0 C3
	tsb $04.b		; 04 04
	sbc ($F4.b,X)		; E1 F4
	stx $14.b,Y		; 96 14
	sbc ($9E.b),Y		; F1 9E
	lda ($D6.b),Y		; B1 D6
	ora ($02.b,X)		; 01 02
	sbc ($96.b,X)		; E1 96
	sep #$C2		; E2 C2
	dec $12D3.w,X		; DE D3 12
	tsb $E1.b		; 04 E1
	tsb $96.b		; 04 96
	sbc $E1.b,X		; F5 E1
	cmp $E3B0.w		; CD B0 E3
	trb $E1.b		; 14 E1
	sbc $EF0392.l,X		; FF 92 03 EF
	jmp.w [$CF9B]		; DC 9B CF
	sbc ($22.b)		; F2 22
	ora ($96.b,S),Y		; 13 96
	bit $D2.b		; 24 D2
	cmp $F2B0.w,X		; DD B0 F2
	ora ($2F.b),Y		; 11 2F
	beq -122.b		; F0 86
	ora $C0C00E.l,X		; 1F 0E C0 C0
	bit $07.b		; 24 07
	brk $E7.b		; 00 E7
	stx $13.b,Y		; 96 13
	beq -33.b		; F0 DF
	lda $2EF410.l		; AF 10 F4 2E
	sbc ($96.b),Y		; F1 96
	sbc ($0F.b),Y		; F1 0F
	beq -61.b		; F0 C3
	sbc ($02.b),Y		; F1 02
	ora ($01.b,X)		; 01 01
	stx $22.b,Y		; 96 22
	sbc ($FC.b)		; F2 FC
	cmp $1112F1.l		; CF F1 12 11
	cmp $92.b,S		; C3 92
	cpx #$DDE0.w		; E0 E0 DD
	ldy $F2B0.w		; AC B0 F2
	ora ($05.b,S),Y		; 13 05
	stx $E5.b,Y		; 96 E5
	pei ($B0.b)		; D4 B0
	lda ($B4.b,X)		; A1 B4
	sbc $D4.b,X		; F5 D4
	lda ($92.b,S),Y		; B3 92
	sbc ($E2.b,X)		; E1 E2
	cpx #$B0B0.w		; E0 B0 B0
	pea $0403.w		; F4 03 04
	stx $C5.b,Y		; 96 C5
	cmp $C0.b,X		; D5 C0
	lda $B3.b,S		; A3 B3
	sbc $E3.b		; E5 E3
	cmp ($92.b,S),Y		; D3 92
	beq -47.b		; F0 D1
	cpx #$BFBF.w		; E0 BF BF
	cmp ($F4.b)		; D2 F4
	tsb $96.b		; 04 96
	cpx $E4.b		; E4 E4
	bne -80.b		; D0 B0
	cmp ($02.b,X)		; C1 02
	cop $E2.b		; 02 E2
	.db $82, $B0, $91		; 82 B0 91
	cmp $D49EAE.l,X		; DF AE 9E D4
	and $17.b,X		; 35 17
	sta ($14.b)		; 92 14
	mvp $0E,$23		; 44 23 0E
	plb		; AB
	ldx $00F1.w,Y		; BE F1 00
	.db $82, $EF, $D3		; 82 EF D3
	ora $DFBBEC.l		; 0F EC BB DF
	eor $35.b		; 45 35
	stx $C4.b		; 86 C4
	jsl $CE99F3.l		; 22 F3 99 CE
	rol $1F64.w		; 2E 64 1F
	.db $82, $EE, $F0		; 82 EE F0
	and ($FC.b,S),Y		; 33 FC
	sbc #$EF.b		; E9 EF
	jsl $01925F.l		; 22 5F 92 01
	jsl $C92E44.l		; 22 44 2E C9
	tyx		; BB
	cpx #$8220.w		; E0 20 82
	asl $14E2.w		; 0E E2 14
	rol $ECAD.w,X		; 3E AD EC
	mvp $92,$31		; 44 31 92
	bpl  18.b		; 10 12
	mvp $CB,$3F		; 44 3F CB
	plb		; AB
	beq  17.b		; F0 11
	.db $82, $E0, $1F		; 82 E0 1F
	rol $1F.b		; 26 1F
	xba		; EB
	dec WRDIVB.w		; CE 06 42
	stx $F0.b,Y		; 96 F0
	ora $12.b,S		; 03 12
	inc $1FBE.w		; EE BE 1F
	ora $1F.b		; 05 1F
	.db $82, $2F, $C2		; 82 2F C2
	rol $5F.b		; 26 5F
	stz $06BC.w,X		; 9E BC 06
	jsl $E3F096.l		; 22 96 F0 E3
	trb $EE.b		; 14 EE
	lda $1013E1.l,X		; BF E1 13 10
	.db $82, $E0, $D0		; 82 E0 D0
	ora [$53.b]		; 07 53
	jsr ($07BE.w,X)		; FC BE 07
	rti		; 40

	stx $E0.b,Y		; 96 E0
	bpl  66.b		; 10 42
	inc $EFCD.w,X		; FE CD EF
	bit $01.b		; 24 01
	.db $82, $F1, $FF		; 82 F1 FF
	and [$62.b],Y		; 37 62
	sbc $4014CF.l,X		; FF CF 14 40
	stx $FF.b,Y		; 96 FF
	ora ($14.b),Y		; 11 14
	trb $D0DC.w		; 1C DC D0
	bit $1F.b		; 24 1F
	.db $82, $13, $00		; 82 13 00
	lsr $62.b,X		; 56 62
	rol $05DE.w		; 2E DE 05
	lsr $EF96.w		; 4E 96 EF
	ora ($42.b),Y		; 11 42
	trb $CFEE.w		; 1C EE CF
	trb $11.b		; 14 11
	.db $82, $53, $10		; 82 53 10
	eor [$62.b],Y		; 57 62
	asl $32EE.w,X		; 1E EE 32
	and $10EF96.l		; 2F 96 EF 10
	and $3B.b		; 25 3B
	cmp $23DE.w,X		; DD DE 23
	and ($86.b,X)		; 21 86
	and $ED350F.l		; 2F 0F 35 ED
	ora $24FE.w		; 0D FE 24
	tas		; 1B
	stx $EF.b,Y		; 96 EF
	cop $24.b		; 02 24
	asl $DEDD.w,X		; 1E DD DE
	and $11.b,S		; 23 11
	.db $82, $44, $22		; 82 44 22
	and [$71.b],Y		; 37 71
	bpl -36.b		; 10 DC
	ora $0E.b,S		; 03 0E
	stx $EE.b,Y		; 96 EE
	ora ($17.b),Y		; 11 17
	trb $BFFD.w		; 1C FD BF
	ora ($20.b,S),Y		; 13 20
	.db $82, $37, $21		; 82 37 21
	eor [$64.b]		; 47 64
	and ($DD.b),Y		; 31 DD
	sep #$0D		; E2 0D
	stx $D1.b,Y		; 96 D1
	brk $34.b		; 00 34
	brk $DD.b		; 00 DD
	dec $0205.w		; CE 05 02
	.db $82, $27, $42		; 82 27 42
	and [$74.b],Y		; 37 74
	and $CD.b,S		; 23 CD
	pea $96EC.w		; F4 EC 96
	beq -15.b		; F0 F1
	bit $0F.b,X		; 34 0F
	jsr ($03BF.w,X)		; FC BF 03
	and ($82.b,X)		; 21 82
	rol $30.b		; 26 30
	eor $54.b,X		; 55 54
	eor ($0B.b),Y		; 51 0B
	sbc ($F9.b,X)		; E1 F9
	stx $2E.b,Y		; 96 2E
	ora ($42.b,X)		; 01 42
	asl $EBFC.w,X		; 1E FC EB
	bmi  48.b		; 30 30
	stx $5F.b,Y		; 96 5F
	ora $1E2E3F.l		; 0F 3F 2E 1E
	tsb $F03F.w		; 0C 3F F0
	sta ($FC.b)		; 92 FC
	cmp $6203.w,X		; DD 03 62
	and $0FCAC9.l,X		; 3F C9 CA 0F
	.db $82, $65, $62		; 82 65 62
	adc [$75.b]		; 67 75
	adc ($F9.b),Y		; 71 F9
	phx		; DA
	sbc #$96.b		; E9 96
	bpl  30.b		; 10 1E
	.db $42, $2E		; 42 2E
	trb $3FBD.w		; 1C BD 3F
	eor ($86.b,X)		; 41 86
	rti		; 40

	ora $0151.w,X		; 1D 51 01
	trb $F0EA.w		; 1C EA F0
	rol $FF92.w		; 2E 92 FF
	sbc $3313.w		; ED 13 33
	and $EF9CD9.l		; 2F D9 9C EF
	stx $42.b,Y		; 96 42
	bne  33.b		; D0 21
	cop $EE.b		; 02 EE
	tsb $00F1.w		; 0C F1 00
	stx $20.b		; 86 20
	cmp ($34.b),Y		; D1 34
	and $BD.b,S		; 23 BD
	txs		; 9A
	ora $22.b		; 05 22
	stx $75.b		; 86 75
	lda $EE2230.l,X		; BF 30 22 EE
	phx		; DA
	beq  47.b		; F0 2F
	stx $10.b,Y		; 96 10
	beq  18.b		; F0 12
	ora ($FF.b),Y		; 11 FF
	ldx $2201.w,Y		; BE 01 22
	stx $43.b		; 86 43
	asl $3DF5.w		; 0E F5 3D
	and $E0BA.w		; 2D BA E0
	bpl -110.b		; 10 92
	inc $00FD.w,X		; FE FD 00
	and ($40.b)		; 32 40
	phx		; DA
	plb		; AB
	beq -110.b		; F0 92
	and $31.b,S		; 23 31
	and $43.b,S		; 23 43
	.db $42, $0C		; 42 0C
	ldy $92ED.w,X		; BC ED 92
	ora $32010E.l		; 0F 0E 01 32
	bpl -22.b		; 10 EA
	cpy $86F0.w		; CC F0 86
	tda		; 7B
	ror A		; 6A
	ror $4A5D.w,X		; 7E 5D 4A
	sbc #$FE.b		; E9 FE
	and $3E2D96.l,X		; 3F 96 2D 3E
	and ($3B.b,X)		; 21 3B
	and $0F0D.w,X		; 3D 0D 0F
	lsr $1192.w,X		; 5E 92 11
	bmi  67.b		; 30 43
	eor $50.b,S		; 43 50
	ora $EBDC.w,X		; 1D DC EB
	sta ($0E.b)		; 92 0E
	ora $1D4020.l		; 0F 20 40 1D
	plx		; FA
	wai		; CB
	inc $3F96.w,X		; FE 96 3F
	rol $5C3E.w,X		; 3E 3E 5C
	and $2E1B.w		; 2D 1B 2E
	ora $4C96.w,X		; 1D 96 4C
	eor $1D3D3E.l		; 4F 3E 3D 1D
	ora $4E2E.w,X		; 1D 2E 4E
	stx $3F.b,Y		; 96 3F
	rol $3D2F.w,X		; 3E 2F 3D
	ora $1D3B.w,X		; 1D 3B 1D
	and $DA82.w		; 2D 82 DA
	inc $5F6E.w,X		; FE 6E 5F
	sbc $B9F9.w,Y		; F9 F9 B9
	sbc #$92.b		; E9 92
	ora $523231.l		; 0F 31 32 52
	and ($30.b),Y		; 31 30
	asl $82EC.w		; 0E EC 82
	cmp #$2F.b		; C9 2F
	and ($6F.b,X)		; 21 6F
	phx		; DA
	sbc #$A9.b		; E9 A9
	xba		; EB
	stx $2F.b,Y		; 96 2F
	lsr $1E20.w,X		; 5E 20 1E
	ora $2D0D1D.l,X		; 1F 1D 0D 2D
	.db $82, $99, $FF		; 82 99 FF
	and ($6E.b)		; 32 6E
	nop		; EA
	jsr ($0CBB.w,X)		; FC BB 0C
	sta ($F0.b)		; 92 F0
	ora ($31.b)		; 12 31
	.db $42, $21		; 42 21
	rti		; 40

	ora $9982FB.l		; 0F FB 82 99
	sbc $CA3F22.l		; EF 22 3F CA
	jsr ($ECAD.w,X)		; FC AD EC
	stx $01.b		; 86 01
	bvs  47.b		; 70 2F
	and $4AF0.w,X		; 3D F0 4A
	sbc $D286FC.l		; EF FC 86 D2
	.db $62, $01, $3A		; 62 01 3A
	cpx #$1D2F.w		; E0 2F 1D
	and $7DD286.l,X		; 3F 86 D2 7D
	and $EB.b		; 25 EB
	ora ($01.b)		; 12 01
	jmp.w [$92DE]		; DC DE 92
	sta $01DF.w,Y		; 99 DF 01
	and ($0F.b,X)		; 21 0F
	bne  31.b		; D0 1F
	sbc $F4CA82.l,X		; FF 82 CA F4
	eor ($65.b,S),Y		; 53 65
	and $2A6F54.l,X		; 3F 54 6F 2A
	stx $BE.b		; 86 BE
	and $6C.b		; 25 6C
	and $205EEB.l,X		; 3F EB 5E 20
	tsb $2C86.w		; 0C 86 2C
	eor $5C.b		; 45 5C
	eor $5FEE.w		; 4D EE 5F
	and $920B.w,Y		; 39 0B 92
	lda $00DF.w,Y		; B9 DF 00
	bmi  14.b		; 30 0E
	sbc $820F0F.l,X		; FF 0F 0F 82
	jmp.w [$7511]		; DC 11 75
	eor ($1F.b,X)		; 41 1F
	and $70.b,X		; 35 70
	sbc $CA92.w,Y		; F9 92 CA
	cmp $0E2100.l,X		; DF 00 21 0E
	beq  14.b		; F0 0E
	inc $CE82.w,X		; FE 82 CE
	and $56.b,S		; 23 56
	.db $42, $20		; 42 20
	ora [$77.b],Y		; 17 77
	and $E2CB86.l,X		; 3F 86 CB E2
	eor $E3.b		; 45 E3
	rol A		; 2A
	beq  94.b		; F0 5E
	beq -126.b		; F0 82
	phx		; DA
	ldx $5335.w,Y		; BE 35 53
	rti		; 40

	and ($67.b)		; 32 67
	eor $BBEC92.l		; 4F 92 EC BB
	brk $10.b		; 00 10
	ora $0E00FE.l,X		; 1F FE 00 0E
	stx $1D.b,Y		; 96 1D
	jsr $0F40.w		; 20 40 0F
	asl $4F1F.w,X		; 1E 1F 4F
	tsb $0C96.w		; 0C 96 0C
	brk $40.b		; 00 40
	rol $0F2E.w		; 2E 2E 0F
	rol $921E.w,X		; 3E 1E 92
	xce		; FB
	inc $2020.w,X		; FE 20 20
	bpl  16.b		; 10 10
	eor $4F.b,S		; 43 4F
	sta ($FB.b)		; 92 FB
	wai		; CB
	sbc $0E1E20.l,X		; FF 20 1E 0E
	bpl  14.b		; 10 0E
	sta ($0C.b)		; 92 0C
	cmp $123321.l,X		; DF 21 33 12
	ora ($15.b,X)		; 01 15
	and ($96.b)		; 32 96
	cmp $1203C1.l,X		; DF C1 03 12
	sbc ($E1.b,X)		; E1 E1
	pea $86EF.w		; F4 EF 86
	cpx #$13B4.w		; E0 B4 13
	cop $C4.b		; 02 C4
	ldy $17.b,X		; B4 17
	cmp ($92.b,X)		; C1 92
	brk $CC.b		; 00 CC
	cpy #$F0F1.w		; C0 F1 F0
	sbc $860002.l,X		; FF 02 00 86
	ldx #$05C2.w		; A2 C2 05
	ora ($D5.b,X)		; 01 D5
	sbc ($26.b,X)		; E1 26
	sbc $EF96.w		; ED 96 EF
	cpy #$1011.w		; C0 11 10
	brk $01.b		; 00 01
	sbc ($E0.b,S),Y		; F3 E0
	stx $EF.b		; 86 EF
	sbc $E21F05.l,X		; FF 05 1F E2
.ACCU 8
.INDEX 8
	sep #$34		; E2 34
	beq -126.b		; F0 82
	asl $9DC9.w		; 0E C9 9D
	cmp $EF0D.w,X		; DD 0D EF
	sbc ($40.b),Y		; F1 40
	.db $82, $CD, $DC		; 82 CD DC
	lda $F1E2FF.l		; AF FF E2 F1
	bit $67.b		; 24 67
	.db $82, $41, $1D		; 82 41 1D
	stz $DFBD.w		; 9C BD DF
	cmp ($E2.b),Y		; D1 E2
	and $76.b,S		; 23 76
	sta $21C3DF.l,X		; 9F DF C3 21
	cpx $06.b		; E4 06
	cpx $63.b		; E4 63
	ror $9D.b,X		; 76 9D
	stz $F3A1.w,X		; 9E A1 F3
.ACCU 8
.INDEX 8
	sep #$34		; E2 34
	jsr $862D.w		; 20 2D 86
	asl $0EFF.w		; 0E FF 0E
	jsl $1203E1.l		; 22 E1 03 12
	eor $2382.w		; 4D 82 23
	inc $9DCA.w		; EE CA 9D
	lda $130F.w		; AD 0F 13
	and ($76.b,S),Y		; 33 76
	phx		; DA
	brk $CF.b		; 00 CF
	and ($C3.b,X)		; 21 C3
	mvp $43,$22		; 44 22 43
	stx $CF.b		; 86 CF
	ora $F0D0.w		; 0D D0 F0
	beq  67.b		; F0 43
	bpl -12.b		; 10 F4
	.db $82, $4F, $FF		; 82 4F FF
	jsr ($CCDE.w,X)		; FC DE CC
	cmp $865522.l,X		; DF 22 55 86
	trb $0D1D.w		; 1C 1D 0D
	sbc $5032FF.l		; EF FF 32 50
	brk $82.b		; 00 82
	eor $DFFCFE.l,X		; 5F FE FC DF
	cmp #$EF.b		; C9 EF
	eor ($65.b)		; 52 65
	.db $82, $41, $31		; 82 41 31
	sbc $99B9.w,X		; FD B9 99
	cmp $4463.w		; CD 63 44
	stx $09.b		; 86 09
	and $2B0F1E.l,X		; 3F 1E 0F 2B
	trb $2E.b		; 14 2E
	rts		; 60

	.db $82, $51, $21		; 82 51 21
	ora $CF9999.l,X		; 1F 99 99 CF
	bit $34.b,X		; 34 34
	.db $82, $4F, $E2		; 82 4F E2
	and $CFB9ED.l		; 2F ED B9 CF
	jsl $D18636.l		; 22 36 86 D1
.ACCU 8
	sep #$A0		; E2 A0
	tsb $10DF.w		; 0C DF 10
	adc $1E.b		; 65 1E
	.db $82, $51, $F1		; 82 51 F1
	ora ($FD.b),Y		; 11 FD
	dex		; CA
	plb		; AB
	sbc $2E8633.l,X		; FF 33 86 2E
	and $EB4D.w		; 2D 4D EB
	sbc $53F4.w,X		; FD F4 53
	ora ($82.b,X)		; 01 82
	and ($1F.b),Y		; 31 1F
	jsl $9ED9EC.l		; 22 EC D9 9E
	sbc ($52.b)		; F2 52
	stx $3F.b		; 86 3F
	brk $2E.b		; 00 2E
	dec $11DD.w		; CE DD 11
	eor $F0.b,X		; 55 F0
	.db $82, $21, $F1		; 82 21 F1
	and ($1D.b),Y		; 31 1D
	tyx		; BB
	stz $36F4.w		; 9C F4 36
	stx $0F.b		; 86 0F
	beq  32.b		; F0 20
	lda $3203BF.l		; AF BF 03 32
	and ($82.b),Y		; 31 82
	jsr $2511.w		; 20 11 25
	ora $E29CB9.l		; 0F B9 9C E2
	bit $86.b,X		; 34 86
	ora ($D5.b,X)		; 01 D5
	ora $D0EDFC.l		; 0F FC ED D0
	and ($4F.b)		; 32 4F
	.db $82, $32, $0D		; 82 32 0D
	jsr $E932.w		; 20 32 E9
	sta $239F.w,Y		; 99 9F 23
	stx $00.b		; 86 00
	and $DE0D2E.l		; 2F 2E 0D DE
	cpx $2372.w		; EC 72 23
	stx $FC.b		; 86 FC
	rol $2C12.w		; 2E 12 2C
	tsb $11B2.w		; 0C B2 11
	eor ($82.b)		; 52 82
	eor ($53.b,S),Y		; 53 53
	and $3F.b,X		; 35 3F
	nop		; EA
	txs		; 9A
	cmp $2B7623.l,X		; DF 23 76 2B
	inc $2E42.w		; EE 42 2E
	txs		; 9A
	lda $7715.w		; AD 15 77
	.db $82, $42, $54		; 82 42 54
	eor $31.b,S		; 43 31
	plx		; FA
	tax		; AA
	dec $8615.w,X		; DE 15 86
	dec $022F.w,X		; DE 2F 02
	ora $12D0EB.l		; 0F EB D0 12
	rti		; 40

	.db $82, $54, $44		; 82 54 44
	.db $42, $52		; 42 52
	and $F2AC99.l		; 2F 99 AC F2
	stx $01.b		; 86 01
	sbc $0AF222.l		; EF 22 F2 0A
	cmp $41E1.w,X		; DD E1 41
	.db $82, $34, $25		; 82 34 25
	eor $33.b,S		; 43 33
	and $EFAED9.l		; 2F D9 AE EF
	stx $4F.b		; 86 4F
	cmp ($2F.b)		; D2 2F
	cop $FC.b		; 02 FC
	cmp $44EE.w,X		; DD EE 44
	ror $64.b,X		; 76 64
	pea $0FD0.w		; F4 D0 0F
	sbc $E1AF.w		; ED AF E1
	ora [$86.b]		; 07 86
	and $111000.l,X		; 3F 00 10 11
	sbc $E1AF.w,X		; FD AF E1
	ora $76.b,S		; 03 76
	eor [$10.b]		; 47 10
	ora ($E4.b,X)		; 01 E4
	bne -98.b		; D0 9E
	cmp $3E8616.l		; CF 16 86 3E
	jsr $121E.w		; 20 1E 12
	inc $FF0A.w,X		; FE 0A FF
	cmp ($82.b)		; D2 82
	sbc $214224.l,X		; FF 24 42 21
	ora $1D.b,S		; 03 1D
	phx		; DA
	lda $1286.w,X		; BD 86 12
	sbc ($11.b),Y		; F1 11
	rol $FC2E.w		; 2E 2E FC
	dec $82E3.w,X		; DE E3 82
	sbc ($41.b),Y		; F1 41
	eor ($20.b)		; 52 20
	eor ($2F.b,X)		; 41 2F
	xba		; EB
	cmp $FF82.w,Y		; D9 82 FF
	and ($30.b,X)		; 21 30
	and ($42.b)		; 32 42
	sbc $99A9.w,Y		; F9 A9 99
	.db $82, $00, $32		; 82 00 32
	eor ($41.b,X)		; 41 41
	adc ($3E.b,S),Y		; 73 3E
	cpx $82AB.w		; EC AB 82
	dec $431F.w,X		; DE 1F 43
	jsl $B9FC71.l		; 22 71 FC B9
	tsx		; BA
	.db $82, $FF, $30		; 82 FF 30
	eor ($31.b,X)		; 41 31
	adc $3E.b,S		; 63 3E
	xba		; EB
	lda $FF82.w,Y		; B9 82 FF
	beq  85.b		; F0 55
	cop $04.b		; 02 04
	ora $829ABC.l,X		; 1F BC 9A 82
	bcc -15.b		; 90 F1
	tsb $21.b		; 04 21
	and [$33.b]		; 27 33
	ora $C586AB.l		; 0F AB 86 C5
	ora $03.b,S		; 03 03
	ora $EFFFF1.l		; 0F F1 FF EF
	cpx #$82.b		; E0 82
	lda $21F30F.l,X		; BF 0F F3 21
	rol $42.b		; 26 42
	rol $76B9.w,X		; 3E B9 76
	ora $51.b,S		; 03 51
	lsr $EF.b		; 46 EF
	brk $DC.b		; 00 DC
	tsb $82FE.w		; 0C FE 82
	lda $02FF.w,X		; BD FF 02
	bpl  53.b		; 10 35
	mvn $D9,$30		; 54 30 D9
	.db $82, $9C, $2E		; 82 9C 2E
	mvp $2E,$30		; 44 30 2E
	sbc $D9FE.w,X		; FD FE D9
	sta ($0F.b,S),Y		; 93 0F
	ora $32001F.l		; 0F 1F 00 32
	eor ($10.b),Y		; 51 10
	xce		; FB
	eor $4B55.w,Y		; 59 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	bne -89.b		; D0 A7
	asl $A8.b,X		; 16 A8
	asl $4C.b,X		; 16 4C
	eor $41.b		; 45 41
	mvp $73,$2E		; 44 2E 73
	adc $16006C.l		; 6F 6C 00 16
	jsl $162316.l		; 22 16 23 16
	bit $16.b		; 24 16
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $16BAFF.l,X		; FF FF BA 16
	tyx		; BB
	asl $BC.b,X		; 16 BC
	asl $BD.b,X		; 16 BD
	asl $FF.b,X		; 16 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $24FFB2.l,X		; FF B2 FF 24
	mvp $43,$33		; 44 33 43
	ora $BBBB.w		; 0D BB BB
	ldx $16.b		; A6 16
	adc ($1F.b,S),Y		; 73 1F
	ora ($0F.b,X)		; 01 0F
	dex		; CA
	ldx $A600.w,Y		; BE 00 A6
	and $73.b		; 25 73
	brk $01.b		; 00 01
	ora $00BFC9.l		; 0F C9 BF 00
	ldx $25.b		; A6 25
	adc ($00.b,S),Y		; 73 00
	ora ($0F.b,X)		; 01 0F
	cmp #$BE.b		; C9 BE
	brk $A6.b		; 00 A6
	rol $63.b,X		; 36 63
	brk $00.b		; 00 00
	ora $00BEC9.l,X		; 1F C9 BE 00
	ldx $36.b		; A6 36
	adc $00.b,S		; 63 00
	sbc ($1F.b),Y		; F1 1F
	tsx		; BA
	ldx $A6F1.w,Y		; BE F1 A6
	rol $63.b,X		; 36 63
	brk $F1.b		; 00 F1
	ora $F1BDBA.l,X		; 1F BA BD F1
	ldx $47.b		; A6 47
	eor ($1F.b)		; 52 1F
	ora ($1E.b,X)		; 01 1E
	dex		; CA
	lda $A6F1.w,X		; BD F1 A6
	lsr $52.b,X		; 56 52
	ora $CA1E01.l,X		; 1F 01 1E CA
	ldy $A6F2.w,X		; BC F2 A6
	lsr $52.b,X		; 56 52
	brk $01.b		; 00 01
	ora $E2BCCA.l		; 0F CA BC E2
	ldx $67.b		; A6 67
	.db $42, $00		; 42 00
	brk $1F.b		; 00 1F
	dex		; CA
	ldy $A6E3.w		; AC E3 A6
	adc [$42.b]		; 67 42
	brk $00.b		; 00 00
	ora $E3ACCA.l,X		; 1F CA AC E3
	ldx $67.b		; A6 67
	eor ($10.b,X)		; 41 10
	sbc ($1F.b),Y		; F1 1F
	dex		; CA
	plb		; AB
	sbc $C2.b,S		; E3 C2
	sbc ($22.b),Y		; F1 22
	jsl $0F2122.l		; 22 22 21 0F
	jmp.w [$B6CD]		; DC CD B6
	eor $21.b,S		; 43 21
	brk $00.b		; 00 00
	brk $ED.b		; 00 ED
	cmp $B6F2.w,X		; DD F2 B6
	eor $20.b,S		; 43 20
	bpl   0.b		; 10 00
	brk $ED.b		; 00 ED
	cmp $B6F2.w,X		; DD F2 B6
	mvp $10,$10		; 44 10 10
	brk $00.b		; 00 00
	sbc $F2DD.w		; ED DD F2
	ldx $53.b,Y		; B6 53
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	sbc $E3DD.w		; ED DD E3
	ldx $53.b,Y		; B6 53
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	sbc $F3DC.w		; ED DC F3
	ldx $53.b,Y		; B6 53
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	sbc $F3DC.w		; ED DC F3
	ldx $53.b,Y		; B6 53
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	sbc $F3DC.w		; ED DC F3
	ldx $53.b,Y		; B6 53
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	sbc $E4DC.w		; ED DC E4
	ldx $53.b,Y		; B6 53
	bpl  16.b		; 10 10
	brk $00.b		; 00 00
	sbc $F4CC.w		; ED CC F4
	ldx $62.b,Y		; B6 62
	bpl  16.b		; 10 10
	sbc ($00.b),Y		; F1 00
	sbc $F4CC.w		; ED CC F4
	ldx $63.b,Y		; B6 63
	brk $10.b		; 00 10
	sbc ($00.b),Y		; F1 00
	sbc $F4CC.w		; ED CC F4
	ldx $63.b,Y		; B6 63
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	asl $CFDC.w		; 0E DC CF
	ldx $46.b,Y		; B6 46
	bmi   1.b		; 30 01
	brk $00.b		; 00 00
	asl $BFDC.w		; 0E DC BF
	ldx $56.b,Y		; B6 56
	bmi   1.b		; 30 01
	ora $DC0E10.l		; 0F 10 0E DC
	lda $2057B6.l,X		; BF B6 57 20
	ora ($0F.b,X)		; 01 0F
	bpl  14.b		; 10 0E
	jmp.w [$B6BF]		; DC BF B6
	eor [$20.b],Y		; 57 20
	ora ($0F.b,X)		; 01 0F
	bpl  14.b		; 10 0E
	jmp.w [$B6BF]		; DC BF B6
	ror $20.b		; 66 20
	ora ($0F.b,X)		; 01 0F
	bpl  14.b		; 10 0E
	jmp.w [$B6A0]		; DC A0 B6
	ror $20.b		; 66 20
	ora ($0F.b,X)		; 01 0F
	bpl  14.b		; 10 0E
	jmp.w [$B6A0]		; DC A0 B6
	adc [$10.b]		; 67 10
	ora ($0F.b,X)		; 01 0F
	bpl  14.b		; 10 0E
	stp		; DB
	bcs -74.b		; B0 B6
	adc [$10.b]		; 67 10
	ora ($0F.b,X)		; 01 0F
	bpl  14.b		; 10 0E
	stp		; DB
	lda $1077B6.l,X		; BF B6 77 10
	ora ($0F.b,X)		; 01 0F
	bpl  14.b		; 10 0E
	stp		; DB
	ldy #$B6.b		; A0 B6
	adc [$10.b],Y		; 77 10
	brk $1F.b		; 00 1F
	ora ($0E.b,X)		; 01 0E
	stp		; DB
	ldy #$B6.b		; A0 B6
	adc [$1F.b],Y		; 77 1F
	ora ($00.b,X)		; 01 00
	ora ($0E.b,X)		; 01 0E
	stp		; DB
	ldy #$B6.b		; A0 B6
	adc [$1F.b],Y		; 77 1F
	ora ($00.b,X)		; 01 00
	ora ($0E.b,X)		; 01 0E
	phx		; DA
	lda ($B6.b,X)		; A1 B6
	adc [$1F.b],Y		; 77 1F
	ora ($00.b,X)		; 01 00
	ora ($FF.b,X)		; 01 FF
	phx		; DA
	lda ($B6.b,X)		; A1 B6
	adc [$1F.b],Y		; 77 1F
	ora ($00.b,X)		; 01 00
	ora ($FF.b,X)		; 01 FF
	phx		; DA
	ldy #$C6.b		; A0 C6
	mvp $10,$0F		; 44 0F 10
	brk $00.b		; 00 00
	ora $C6D0FD.l		; 0F FD D0 C6
	mvp $01,$0F		; 44 0F 01
	brk $00.b		; 00 00
	ora $C6D0FD.l		; 0F FD D0 C6
	mvp $01,$0F		; 44 0F 01
	brk $00.b		; 00 00
	ora $C6D0FD.l		; 0F FD D0 C6
	mvp $01,$0F		; 44 0F 01
	brk $00.b		; 00 00
	ora $C6D1FC.l		; 0F FC D1 C6
	mvp $01,$0F		; 44 0F 01
	brk $00.b		; 00 00
	ora $C6D1FC.l		; 0F FC D1 C6
	mvp $01,$0F		; 44 0F 01
	brk $00.b		; 00 00
	ora $C6D1FC.l		; 0F FC D1 C6
	mvp $01,$0F		; 44 0F 01
	brk $00.b		; 00 00
	ora $C6D1ED.l		; 0F ED D1 C6
	mvp $01,$0F		; 44 0F 01
	brk $00.b		; 00 00
	ora $C6D1ED.l		; 0F ED D1 C6
	eor ($0F.b,S),Y		; 53 0F
	ora ($00.b,X)		; 01 00
	brk $0F.b		; 00 0F
	sbc $C6D1.w		; ED D1 C6
	eor ($0F.b,S),Y		; 53 0F
	ora ($00.b,X)		; 01 00
	brk $0F.b		; 00 0F
	sbc $C6D1.w		; ED D1 C6
	eor ($00.b,S),Y		; 53 00
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6DD.w,X		; FE DD C6
	ora $30.b,X		; 15 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6DD.w,X		; FE DD C6
	ora $30.b,X		; 15 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	ora $30.b,X		; 15 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	ora $30.b,X		; 15 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	ora $30.b,X		; 15 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	ora $30.b,X		; 15 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	ora $30.b,X		; 15 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	bit $30.b		; 24 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	bit $30.b		; 24 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	bit $30.b		; 24 30
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	and $20.b		; 25 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	and $20.b		; 25 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	and $20.b		; 25 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	and $20.b		; 25 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	inc $C6CE.w,X		; FE CE C6
	and $20.b		; 25 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	and $20.b		; 25 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	and $20.b		; 25 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	and $20.b		; 25 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	and $20.b		; 25 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	bit $20.b,X		; 34 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	bit $20.b,X		; 34 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	bit $20.b,X		; 34 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	bit $20.b,X		; 34 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	bit $20.b,X		; 34 20
	beq  16.b		; F0 10
	brk $00.b		; 00 00
	sbc $C6CF.w,X		; FD CF C6
	bit $20.b,X		; 34 20
	beq   1.b		; F0 01
	brk $00.b		; 00 00
	ora $F3C6DC.l		; 0F DC C6 F3
	.db $42, $0F		; 42 0F
	ora ($00.b,X)		; 01 00
	brk $0F.b		; 00 0F
	cmp $9DC2.w		; CD C2 9D
	ora ($22.b,S),Y		; 13 22
	ora ($22.b)		; 12 22
	jsl $C2D920.l		; 22 20 D9 C2
	sta $2213.w,X		; 9D 13 22
	ora ($22.b)		; 12 22
	jsl $C2D920.l		; 22 20 D9 C2
	sta $2213.w,X		; 9D 13 22
	ora ($22.b)		; 12 22
	jsl $C2D920.l		; 22 20 D9 C2
	lda $2213.w		; AD 13 22
	ora ($22.b)		; 12 22
	jsl $C2C920.l		; 22 20 C9 C2
	lda $2213.w		; AD 13 22
	ora ($22.b)		; 12 22
	jsl $C2C920.l		; 22 20 C9 C2
	lda $2213.w		; AD 13 22
	ora ($22.b)		; 12 22
	jsl $B6C920.l		; 22 20 C9 B6
	asl $64.b		; 06 64
	ora $000001.l		; 0F 01 00 00
	ora $B69A.w		; 0D 9A B6
	asl $64.b		; 06 64
	ora $000001.l		; 0F 01 00 00
	ora $C29A.w		; 0D 9A C2
	lda $2213.w		; AD 13 22
	ora ($22.b)		; 12 22
	jsl $B6CA20.l		; 22 20 CA B6
	ora $64.b,X		; 15 64
	ora $001000.l		; 0F 00 10 00
	tsb $B69B.w		; 0C 9B B6
	ora $64.b,X		; 15 64
	ora $001000.l		; 0F 00 10 00
	tsb $B69B.w		; 0C 9B B6
	ora $64.b,X		; 15 64
	ora $001000.l		; 0F 00 10 00
	tsb $B69B.w		; 0C 9B B6
	ora $64.b,X		; 15 64
	ora $F110F1.l		; 0F F1 10 F1
	tsb $C29B.w		; 0C 9B C2
	ldx $2213.w,Y		; BE 13 22
	ora ($22.b)		; 12 22
	ora ($1F.b)		; 12 1F
	dex		; CA
	ldx $15.b,Y		; B6 15
	stz $0F.b		; 64 0F
	sbc ($10.b),Y		; F1 10
	sbc ($0B.b),Y		; F1 0B
	stz $24B6.w		; 9C B6 24
	stz $0F.b		; 64 0F
	sbc ($10.b),Y		; F1 10
	sbc ($0B.b),Y		; F1 0B
	stz $24B6.w		; 9C B6 24
	stz $0F.b		; 64 0F
	sbc ($10.b),Y		; F1 10
	sbc ($FC.b),Y		; F1 FC
	stz $24B6.w		; 9C B6 24
	stz $0F.b		; 64 0F
	sbc ($10.b),Y		; F1 10
	sbc ($FC.b),Y		; F1 FC
	sta $15B6.w,X		; 9D B6 15
	mvn $F1,$0F		; 54 0F F1
	bpl -15.b		; 10 F1
	xce		; FB
	lda $14B6.w		; AD B6 14
	mvn $F1,$1F		; 54 1F F1
	bpl -15.b		; 10 F1
	xce		; FB
	lda $24B6.w		; AD B6 24
	eor ($1F.b,S),Y		; 53 1F
	sbc ($10.b),Y		; F1 10
	sbc ($FB.b),Y		; F1 FB
	lda $24B6.w		; AD B6 24
	mvp $F1,$1F		; 44 1F F1
	bpl -15.b		; 10 F1
	xce		; FB
	lda $24B6.w		; AD B6 24
	mvp $F1,$1F		; 44 1F F1
	bpl -15.b		; 10 F1
	xce		; FB
	stz $24B6.w,X		; 9E B6 24
	mvp $0F,$1F		; 44 1F 0F
	ora ($00.b),Y		; 11 00
	ora $E2B6BA.l		; 0F BA B6 E2
	bit $41.b,X		; 34 41
	sbc $0F0011.l,X		; FF 11 00 0F
	plb		; AB
	ldx $E2.b,Y		; B6 E2
	bit $41.b,X		; 34 41
	sbc $0E0011.l,X		; FF 11 00 0E
	tsx		; BA
	ldx $F2.b,Y		; B6 F2
	bit $41.b,X		; 34 41
	sbc $1E0F11.l,X		; FF 11 0F 1E
	tsx		; BA
	ldx $F2.b,Y		; B6 F2
	bit $41.b,X		; 34 41
	sbc $1E0F11.l,X		; FF 11 0F 1E
	tsx		; BA
	ldx $F2.b,Y		; B6 F2
	bit $41.b,X		; 34 41
	sbc $1E0F11.l,X		; FF 11 0F 1E
	plb		; AB
	ldx $F2.b,Y		; B6 F2
	bit $41.b,X		; 34 41
	sbc $1EF011.l,X		; FF 11 F0 1E
	plb		; AB
	ldx $02.b,Y		; B6 02
	bit $41.b		; 24 41
	sbc $1D0F11.l,X		; FF 11 0F 1D
	tyx		; BB
	ldx $02.b,Y		; B6 02
	bit $41.b		; 24 41
	sbc $1D0F11.l,X		; FF 11 0F 1D
	tyx		; BB
	ldx $02.b,Y		; B6 02
	bit $41.b		; 24 41
	sbc $0E0F11.l,X		; FF 11 0F 0E
	tyx		; BB
	ldx $02.b,Y		; B6 02
	bit $41.b		; 24 41
	sbc $0E0F11.l,X		; FF 11 0F 0E
	ldy $11B6.w		; AC B6 11
	and $51.b,S		; 23 51
	sbc $0EF011.l,X		; FF 11 F0 0E
	ldy $11B6.w		; AC B6 11
	and $51.b,S		; 23 51
	sbc $0DF011.l,X		; FF 11 F0 0D
	ldy $11B6.w,X		; BC B6 11
	and $42.b,S		; 23 42
	sbc $0D0010.l,X		; FF 10 00 0D
	ldy $12B6.w,X		; BC B6 12
	ora ($42.b,S),Y		; 13 42
	sbc $0D0010.l,X		; FF 10 00 0D
	ldy $12B6.w,X		; BC B6 12
	ora ($42.b,S),Y		; 13 42
	sbc $0D0010.l,X		; FF 10 00 0D
	ldx $11B6.w		; AE B6 11
	ora ($42.b,S),Y		; 13 42
	sbc $0C0010.l,X		; FF 10 00 0C
	ldx $11B6.w,Y		; BE B6 11
	ora ($42.b,S),Y		; 13 42
	sbc $0C0010.l,X		; FF 10 00 0C
	ldx $11B6.w,Y		; BE B6 11
	ora ($42.b,S),Y		; 13 42
	sbc $FD0010.l,X		; FF 10 00 FD
	ldx $11B6.w,Y		; BE B6 11
	tsb $42.b		; 04 42
	sbc $FD0010.l,X		; FF 10 00 FD
	ldx $ABB2.w,Y		; BE B2 AB
	cmp $344345.l		; CF 45 43 34
	and ($2E.b,S),Y		; 33 2E
	lda #$B6.b		; A9 B6
	jsr $5203.w		; 20 03 52
	cpx #$01.b		; E0 01
	brk $FC.b		; 00 FC
	dec $20B6.w		; CE B6 20
	ora $52.b,S		; 03 52
	cpx #$01.b		; E0 01
	brk $FC.b		; 00 FC
	lda $CFBCB2.l,X		; BF B2 BC CF
	eor $43.b		; 45 43
	bit $33.b,X		; 34 33
	rol $B699.w		; 2E 99 B6
	jsr $5103.w		; 20 03 51
	sbc $EC0011.l,X		; FF 11 00 EC
	cmp $0320B6.l		; CF B6 20 03
	.db $42, $F0		; 42 F0
	brk $10.b		; 00 10
	asl $B6CC.w		; 0E CC B6
	cop $F0.b		; 02 F0
	and $1F.b,X		; 35 1F
	brk $10.b		; 00 10
	asl $B6CC.w		; 0E CC B6
	cop $0F.b		; 02 0F
	and $2E.b,X		; 35 2E
	brk $10.b		; 00 10
	asl $B6CC.w		; 0E CC B6
	cop $0F.b		; 02 0F
	and $2E.b,X		; 35 2E
	brk $10.b		; 00 10
	asl $B6CC.w		; 0E CC B6
	ora ($0F.b),Y		; 11 0F
	and $2F.b,X		; 35 2F
	beq  16.b		; F0 10
	asl $B6BD.w		; 0E BD B6
	ora ($FF.b)		; 12 FF
	and $2F.b,X		; 35 2F
	beq  16.b		; F0 10
	asl $B6BD.w		; 0E BD B6
	ora ($FF.b)		; 12 FF
	and $2F.b,X		; 35 2F
	beq  16.b		; F0 10
	ora $B6CD.w		; 0D CD B6
	ora ($FF.b)		; 12 FF
	and $2F.b,X		; 35 2F
	beq  16.b		; F0 10
	ora $B2CD.w		; 0D CD B2
	lda $E3CB.w,X		; BD CB E3
	mvn $44,$33		; 54 33 44
	bmi -54.b		; 30 CA
	lda ($BD.b)		; B2 BD
	wai		; CB
	sbc $54.b,S		; E3 54
	and ($44.b,S),Y		; 33 44
	bmi -70.b		; 30 BA
	lda ($CD.b)		; B2 CD
	wai		; CB
	sbc $54.b,S		; E3 54
	and ($44.b,S),Y		; 33 44
	bmi -70.b		; 30 BA
	lda ($CE.b)		; B2 CE
	wai		; CB
	sbc $54.b,S		; E3 54
	and ($44.b,S),Y		; 33 44
	and $CEB2BA.l,X		; 3F BA B2 CE
	wai		; CB
	sbc $54.b,S		; E3 54
	and ($44.b,S),Y		; 33 44
	and $CEB2BA.l,X		; 3F BA B2 CE
	wai		; CB
	sbc $54.b,S		; E3 54
	and ($44.b,S),Y		; 33 44
	and $DEB2BA.l		; 2F BA B2 DE
	wai		; CB
	sbc $54.b,S		; E3 54
	and ($44.b,S),Y		; 33 44
	and $31B6BA.l		; 2F BA B6 31
	sbc $F03F25.l		; EF 25 3F F0
	bpl  -4.b		; 10 FC
	cpy #$B2.b		; C0 B2
	dec $E3CB.w,X		; DE CB E3
	mvn $44,$33		; 54 33 44
	rol $B2AA.w		; 2E AA B2
	cmp $54E3CB.l,X		; DF CB E3 54
	and ($44.b,S),Y		; 33 44
	rol $B2AA.w		; 2E AA B2
	sbc $54E3CB.l		; EF CB E3 54
	and ($44.b,S),Y		; 33 44
	rol $B2AB.w		; 2E AB B2
	sbc $54E3CB.l		; EF CB E3 54
	and ($44.b,S),Y		; 33 44
	rol $B2AB.w		; 2E AB B2
	sbc $54E3CB.l		; EF CB E3 54
	and ($44.b,S),Y		; 33 44
	and $B2AB.w		; 2D AB B2
	sbc $54E3CB.l		; EF CB E3 54
	and ($44.b,S),Y		; 33 44
	and $B6AB.w		; 2D AB B6
	and ($DE.b),Y		; 31 DE
	and $20.b,X		; 35 20
	beq  16.b		; F0 10
	cpx $B2C1.w		; EC C1 B2
	sbc $54D3CB.l,X		; FF CB D3 54
	and ($44.b,S),Y		; 33 44
	ora $B6AC.w,X		; 1D AC B6
	bmi -34.b		; 30 DE
	and $20.b,X		; 35 20
	beq  16.b		; F0 10
	xba		; EB
	cmp ($B6.b)		; D2 B6
	bmi -34.b		; 30 DE
	and $30.b		; 25 30
	beq   1.b		; F0 01
	asl $B6BD.w		; 0E BD B6
	and $0D.b,S		; 23 0D
	sbc $52.b,S		; E3 52
	ora $BD0E01.l		; 0F 01 0E BD
	lda ($C0.b)		; B2 C0
	tsb $25BD.w		; 0C BD 25
	eor $34.b,S		; 43 34
	eor ($CA.b,X)		; 41 CA
	lda ($C0.b)		; B2 C0
	tsb $25BD.w		; 0C BD 25
	eor $34.b,S		; 43 34
	eor ($CA.b,X)		; 41 CA
	lda ($D0.b)		; B2 D0
	tsb $25BD.w		; 0C BD 25
	eor $34.b,S		; 43 34
	bmi -54.b		; 30 CA
	lda ($D0.b)		; B2 D0
	tsb $25BD.w		; 0C BD 25
	eor $34.b,S		; 43 34
	bmi -70.b		; 30 BA
	ldx $33.b,Y		; B6 33
	sbc $53E2.w,X		; FD E2 53
	sbc $BF0D01.l,X		; FF 01 0D BF
	ldx $33.b,Y		; B6 33
	sbc $53E2.w,X		; FD E2 53
	sbc $BF0D01.l,X		; FF 01 0D BF
	ldx $33.b,Y		; B6 33
	sbc $53E2.w,X		; FD E2 53
	sbc $BF0D01.l,X		; FF 01 0D BF
	lda ($E1.b)		; B2 E1
	ora $25BD.w		; 0D BD 25
	eor $34.b,S		; 43 34
	and $E1B2BA.l,X		; 3F BA B2 E1
	tsb $25BD.w		; 0C BD 25
	eor $34.b,S		; 43 34
	and $E1B2BA.l,X		; 3F BA B2 E1
	ora $25BD.w		; 0D BD 25
	eor $34.b,S		; 43 34
	and $43B6AA.l,X		; 3F AA B6 43
	sbc $44E2.w		; ED E2 44
	sbc $B00C01.l,X		; FF 01 0C B0
	ldx $43.b,Y		; B6 43
	sbc $54E1.w		; ED E1 54
	sbc $B00C01.l,X		; FF 01 0C B0
	ldx $43.b,Y		; B6 43
	sbc $54E1.w		; ED E1 54
	sbc $C0FC01.l,X		; FF 01 FC C0
	ldx $43.b,Y		; B6 43
	sbc $54E1.w		; ED E1 54
	sbc $C0FC01.l,X		; FF 01 FC C0
	ldx $43.b,Y		; B6 43
	sbc $53D2.w		; ED D2 53
	ora $B1FC01.l		; 0F 01 FC B1
	ldx $52.b,Y		; B6 52
	sbc $53D2.w		; ED D2 53
	ora $C1FB01.l		; 0F 01 FB C1
	ldx $52.b,Y		; B6 52
	sbc $53D2.w		; ED D2 53
	ora $C1FB01.l		; 0F 01 FB C1
	ldx $52.b,Y		; B6 52
	sbc $53D2.w		; ED D2 53
	ora $C1FB01.l		; 0F 01 FB C1
	ldx $52.b,Y		; B6 52
	sbc $53D2.w		; ED D2 53
	ora $C2EC01.l		; 0F 01 EC C2
	ldx $42.b,Y		; B6 42
	sbc $53D2.w		; ED D2 53
	ora $C2EC01.l		; 0F 01 EC C2
	lda ($13.b)		; B2 13
	ora $15BC.w		; 0D BC 15
	eor ($33.b,S),Y		; 53 33
	and $B69C.w		; 2D 9C B6
	eor ($ED.b),Y		; 51 ED
	cmp ($44.b)		; D2 44
	ora $D2EB01.l		; 0F 01 EB D2
	ldx $51.b,Y		; B6 51
	sbc $44D2.w		; ED D2 44
	ora $D2EB01.l		; 0F 01 EB D2
	ldx $52.b,Y		; B6 52
	cmp $44D2.w,X		; DD D2 44
	ora $BD1E00.l		; 0F 00 1E BD
	lda ($C2.b)		; B2 C2
	bmi -37.b		; 30 DB
	cmp ($55.b,X)		; C1 55
	and ($31.b,S),Y		; 33 31
	cmp #$B2.b		; C9 B2
	cmp ($30.b)		; D2 30
	stp		; DB
	cmp ($55.b,X)		; C1 55
	and ($31.b,S),Y		; 33 31
	cmp #$B2.b		; C9 B2
	cmp ($30.b)		; D2 30
	stp		; DB
	cmp ($55.b,X)		; C1 55
	and ($31.b,S),Y		; 33 31
	cmp #$B2.b		; C9 B2
	cmp ($30.b)		; D2 30
	stp		; DB
	cmp ($55.b,X)		; C1 55
	and ($31.b,S),Y		; 33 31
	lda $35B6.w,Y		; B9 B6 35
	ora $14DE.w,X		; 1D DE 14
	rti		; 40

	beq  14.b		; F0 0E
	ldx $E2B2.w,Y		; BE B2 E2
	bmi -37.b		; 30 DB
	cmp ($55.b,X)		; C1 55
	and ($30.b,S),Y		; 33 30
	tsx		; BA
	lda ($E3.b)		; B2 E3
	bmi -37.b		; 30 DB
	cmp ($55.b,X)		; C1 55
	and ($30.b,S),Y		; 33 30
	tsx		; BA
	lda ($E3.b)		; B2 E3
	bmi -37.b		; 30 DB
	cmp ($55.b,X)		; C1 55
	and ($30.b,S),Y		; 33 30
	tsx		; BA
	lda ($E3.b)		; B2 E3
	bmi -37.b		; 30 DB
	cmp ($55.b,X)		; C1 55
	and ($30.b,S),Y		; 33 30
	tsx		; BA
	ldx $44.b,Y		; B6 44
	ora $15DD.w,X		; 1D DD 15
	rti		; 40

	beq  13.b		; F0 0D
	lda $30F3B2.l,X		; BF B2 F3 30
	stp		; DB
	cmp ($55.b,X)		; C1 55
	and ($3F.b,S),Y		; 33 3F
	tax		; AA
	lda ($F3.b)		; B2 F3
	bmi -37.b		; 30 DB
	cpy #$55.b		; C0 55
	and ($2F.b,S),Y		; 33 2F
	tax		; AA
	lda ($F3.b)		; B2 F3
	bmi -37.b		; 30 DB
	cpy #$55.b		; C0 55
	and ($2F.b,S),Y		; 33 2F
	tax		; AA
	ldx $54.b,Y		; B6 54
	ora $14DD.w		; 0D DD 14
	bvc -16.b		; 50 F0
	sbc $B6B0.w,X		; FD B0 B6
	mvn $DD,$0D		; 54 0D DD
	trb $50.b		; 14 50
	beq  -3.b		; F0 FD
	bcs -78.b		; B0 B2
	tsb $30.b		; 04 30
	stp		; DB
	cpy #$55.b		; C0 55
	and ($2E.b,S),Y		; 33 2E
	plb		; AB
	lda ($04.b)		; B2 04
	bmi -37.b		; 30 DB
	cpy #$45.b		; C0 45
	and ($2E.b,S),Y		; 33 2E
	plb		; AB
	lda ($04.b)		; B2 04
	bmi -37.b		; 30 DB
	cpy #$45.b		; C0 45
	and ($2E.b,S),Y		; 33 2E
	plb		; AB
	lda ($04.b)		; B2 04
	bmi -37.b		; 30 DB
	cpy #$45.b		; C0 45
	and ($2E.b,S),Y		; 33 2E
	plb		; AB
	ldx $53.b,Y		; B6 53
	ora $14DD.w		; 0D DD 14
	eor ($FF.b,X)		; 41 FF
	jsr ($B6D1.w,X)		; FC D1 B6
	eor ($0D.b,S),Y		; 53 0D
	cmp $4114.w,X		; DD 14 41
	sbc $B2C2FC.l,X		; FF FC C2 B2
	trb $30.b		; 14 30
	stp		; DB
	cpy #$45.b		; C0 45
	and ($1D.b,S),Y		; 33 1D
	ldy $14B2.w		; AC B2 14
	bmi -37.b		; 30 DB
	cpy #$45.b		; C0 45
	and ($1D.b,S),Y		; 33 1D
	ldy $53B6.w		; AC B6 53
	inc $05DD.w,X		; FE DD 05
	eor ($FF.b,X)		; 41 FF
	cpx $B6D2.w		; EC D2 B6
	eor ($FE.b,S),Y		; 53 FE
	cmp $5104.w,X		; DD 04 51
	sbc ($FE.b,X)		; E1 FE
	cmp $35B6.w		; CD B6 35
	and $45D0ED.l		; 2F ED D0 45
	ora $B2CDFE.l,X		; 1F FE CD B2
	cmp ($43.b)		; D2 43
	ora $04BB.w,X		; 1D BB 04
	eor ($20.b,S),Y		; 53 20
	dex		; CA
	lda ($D2.b)		; B2 D2
	eor $1E.b,S		; 43 1E
	tyx		; BB
	tsb $53.b		; 04 53
	jsr $B6CA.w		; 20 CA B6
	and $2F.b,X		; 35 2F
	sbc $45D0.w		; ED D0 45
	ora $B6CEFD.l,X		; 1F FD CE B6
	and $2F.b,X		; 35 2F
	sbc $45D0.w		; ED D0 45
	ora $B6CEFD.l,X		; 1F FD CE B6
	and $2F.b,X		; 35 2F
	sbc $45D0.w		; ED D0 45
	asl $CEFE.w,X		; 1E FE CE
	lda ($E3.b)		; B2 E3
	eor $1E.b,S		; 43 1E
	tyx		; BB
	pea $2F53.w		; F4 53 2F
	tsx		; BA
	lda ($E3.b)		; B2 E3
	eor $1E.b,S		; 43 1E
	tyx		; BB
	pea $2F54.w		; F4 54 2F
	tsx		; BA
	ldx $44.b,Y		; B6 44
	and $44D0ED.l		; 2F ED D0 44
	ora $B6CFFD.l,X		; 1F FD CF B6
	mvp $ED,$2F		; 44 2F ED
	bne  68.b		; D0 44
	ora $B2CFFD.l,X		; 1F FD CF B2
	sbc ($43.b,S),Y		; F3 43
	asl $F4BB.w,X		; 1E BB F4
	mvn $BB,$2E		; 54 2E BB
	lda ($F3.b)		; B2 F3
	eor $1E.b,S		; 43 1E
	tyx		; BB
	pea $2E54.w		; F4 54 2E
	plb		; AB
	lda ($F3.b)		; B2 F3
	eor $1E.b,S		; 43 1E
	tyx		; BB
	pea $1E54.w		; F4 54 1E
	plb		; AB
	lda ($F3.b)		; B2 F3
	eor $1E.b,S		; 43 1E
	tyx		; BB
	pea $1E54.w		; F4 54 1E
	plb		; AB
	lda ($03.b)		; B2 03
	eor $1E.b,S		; 43 1E
	tyx		; BB
	pea $1D54.w		; F4 54 1D
	plb		; AB
	lda ($04.b)		; B2 04
	eor $1E.b,S		; 43 1E
	tyx		; BB
	pea $1D54.w		; F4 54 1D
	plb		; AB
	lda ($04.b)		; B2 04
	eor $1E.b,S		; 43 1E
	tyx		; BB
	pea $1D54.w		; F4 54 1D
	ldy $04B2.w		; AC B2 04
	eor $1E.b,S		; 43 1E
	tyx		; BB
	pea $1D54.w		; F4 54 1D
	ldy $53B6.w		; AC B6 53
	ora $35D0ED.l,X		; 1F ED D0 35
	and $B6D2DC.l		; 2F DC D2 B6
	eor $1F.b,S		; 43 1F
	sbc $35D0.w		; ED D0 35
	and $B2D2DC.l		; 2F DC D2 B2
	trb $43.b		; 14 43
	asl $F4BB.w,X		; 1E BB F4
	mvn $AC,$0C		; 54 0C AC
	lda ($14.b)		; B2 14
	eor $1E.b,S		; 43 1E
	tyx		; BB
	sbc ($54.b,S),Y		; F3 54
	tsb $B2AD.w		; 0C AD B2
	trb $43.b		; 14 43
	asl $F3BB.w,X		; 1E BB F3
	mvn $AD,$0C		; 54 0C AD
	lda ($14.b)		; B2 14
	eor $1E.b,S		; 43 1E
	tyx		; BB
	sbc $54.b,S		; E3 54
	tsb $B2AD.w		; 0C AD B2
	bit $43.b		; 24 43
	asl $E3BB.w,X		; 1E BB E3
	mvn $BA,$00		; 54 00 BA
	lda ($D2.b)		; B2 D2
	mvp $EB,$31		; 44 31 EB
	ldx $3F35.w,Y		; BE 35 3F
	tsx		; BA
	lda ($E2.b)		; B2 E2
	mvp $EB,$31		; 44 31 EB
	ldx $3F35.w,Y		; BE 35 3F
	tsx		; BA
	lda ($E2.b)		; B2 E2
	mvp $EB,$31		; 44 31 EB
	ldx $3F35.w,Y		; BE 35 3F
	tsx		; BA
	lda ($E2.b)		; B2 E2
	mvp $EB,$31		; 44 31 EB
	ldx $3F35.w,Y		; BE 35 3F
	tsx		; BA
	ldx $44.b,Y		; B6 44
	jsr $DD0E.w		; 20 0E DD
	sbc ($52.b,S),Y		; F3 52
	xce		; FB
	cmp $2044B6.l		; CF B6 44 20
	sbc $52F3DD.l,X		; FF DD F3 52
	cpx $B6C0.w		; EC C0 B6
	bit $20.b,X		; 34 20
	sbc $52F3DD.l,X		; FF DD F3 52
	cpx $B2CF.w		; EC CF B2
	sbc ($44.b,S),Y		; F3 44
	and ($EC.b),Y		; 31 EC
	ldx $3E35.w,Y		; BE 35 3E
	plb		; AB
	lda ($F3.b)		; B2 F3
	mvp $EC,$31		; 44 31 EC
	ldx $3E35.w,Y		; BE 35 3E
	plb		; AB
	ldx $44.b,Y		; B6 44
	bpl  -1.b		; 10 FF
	cmp $52F3.w,X		; DD F3 52
	xba		; EB
	cmp ($B6.b,X)		; C1 B6
	mvp $FF,$10		; 44 10 FF
	cmp $52F3.w,X		; DD F3 52
	xba		; EB
	cmp ($B6.b,X)		; C1 B6
	mvp $FF,$10		; 44 10 FF
	cmp $52F3.w,X		; DD F3 52
	xba		; EB
	cmp ($B6.b,X)		; C1 B6
	eor ($10.b,S),Y		; 53 10
	sbc $43F3DD.l,X		; FF DD F3 43
	nop		; EA
	cmp ($B6.b),Y		; D1 B6
	eor ($10.b,S),Y		; 53 10
	sbc $53F2DD.l,X		; FF DD F2 53
	nop		; EA
	cmp ($B6.b),Y		; D1 B6
	eor ($10.b,S),Y		; 53 10
	sbc $53F2DD.l,X		; FF DD F2 53
	stp		; DB
.ACCU 16
.INDEX 16
	rep #$B6		; C2 B6
	eor ($01.b,S),Y		; 53 01
	sbc $53F2DD.l,X		; FF DD F2 53
	stp		; DB
.ACCU 16
.INDEX 16
	rep #$B6		; C2 B6
	eor ($00.b,S),Y		; 53 00
	ora $53F2DD.l		; 0F DD F2 53
	phx		; DA
	cmp ($B6.b)		; D2 B6
	eor ($00.b,S),Y		; 53 00
	ora $53F2DD.l		; 0F DD F2 53
	phx		; DA
	cmp ($B6.b,S),Y		; D3 B6
	eor $00.b,S		; 43 00
	ora $53F2DD.l		; 0F DD F2 53
	phx		; DA
	cmp ($B6.b,S),Y		; D3 B6
	eor ($00.b)		; 52 00
	ora $53F2DD.l		; 0F DD F2 53
	phx		; DA
	cmp ($B6.b,S),Y		; D3 B6
	eor ($00.b)		; 52 00
	ora $53F2DD.l		; 0F DD F2 53
	dex		; CA
	sbc $B6.b,S		; E3 B6
	eor ($00.b)		; 52 00
	ora $52E3DD.l		; 0F DD E3 52
	phx		; DA
	sbc $B6.b,S		; E3 B6
	eor ($00.b)		; 52 00
	ora $52E3DD.l		; 0F DD E3 52
	phx		; DA
	sbc $B6.b,S		; E3 B6
	eor ($00.b)		; 52 00
	ora $52E3DD.l		; 0F DD E3 52
	phx		; DA
	cpx $B2.b		; E4 B2
	bit $44.b		; 24 44
	and ($FC.b)		; 32 FC
	lda $1B25.w,X		; BD 25 1B
	lda $45B6.w,Y		; B9 B6 45
	jsr $EE00.w		; 20 00 EE
	dec $3C25.w,X		; DE 25 3C
	ldx $E3B2.w		; AE B2 E3
	mvp $2F,$43		; 44 43 2F
	wai		; CB
	cmp ($51.b)		; D2 51
	lda #$E3B2.w		; A9 B2 E3
	mvp $2F,$43		; 44 43 2F
	wai		; CB
	cmp ($50.b)		; D2 50
	tax		; AA
	ldx $45.b,Y		; B6 45
	bpl   0.b		; 10 00
	sbc $25DE.w,X		; FD DE 25
	bit $B2AF.w,X		; 3C AF B2
	sbc ($44.b,S),Y		; F3 44
	eor $2F.b,S		; 43 2F
	wai		; CB
	cmp ($40.b)		; D2 40
	tax		; AA
	ldx $54.b,Y		; B6 54
	bpl   0.b		; 10 00
	sbc $25DE.w,X		; FD DE 25
	bit $B6A0.w		; 2C A0 B6
	mvn $10,$1F		; 54 1F 10
	sbc $25DE.w,X		; FD DE 25
	bit $B6A0.w		; 2C A0 B6
	mvn $10,$1F		; 54 1F 10
	sbc $25DE.w,X		; FD DE 25
	bit $B6A0.w		; 2C A0 B6
	mvn $10,$1F		; 54 1F 10
	sbc $25DE.w,X		; FD DE 25
	bit $B6A0.w		; 2C A0 B6
	mvn $10,$1F		; 54 1F 10
	sbc $25DE.w,X		; FD DE 25
	pld		; 2B
	bcs -74.b		; B0 B6
	mvn $10,$1F		; 54 1F 10
	sbc $25DE.w,X		; FD DE 25
	pld		; 2B
	bcs -74.b		; B0 B6
	adc $1F.b,S		; 63 1F
	bpl  -3.b		; 10 FD
	dec $2B25.w,X		; DE 25 2B
	bcs -74.b		; B0 B6
	stz $0F.b		; 64 0F
	bpl  -3.b		; 10 FD
	dec $2B25.w,X		; DE 25 2B
	lda ($B6.b),Y		; B1 B6
	mvn $10,$0F		; 54 0F 10
	sbc $25DE.w,X		; FD DE 25
	trb $B6B1.w		; 1C B1 B6
	mvn $10,$0F		; 54 0F 10
	sbc $25DE.w,X		; FD DE 25
	tas		; 1B
	lda ($B6.b)		; B2 B6
	mvn $10,$0F		; 54 0F 10
	sbc $24DE.w,X		; FD DE 24
	pld		; 2B
	lda ($B6.b)		; B2 B6
	adc $0F.b,S		; 63 0F
	bpl  -3.b		; 10 FD
	dec $2B24.w,X		; DE 24 2B
	lda ($B6.b)		; B2 B6
	adc $0F.b,S		; 63 0F
	bpl  -3.b		; 10 FD
	dec $2B24.w,X		; DE 24 2B
	lda ($B6.b)		; B2 B6
	adc $0F.b,S		; 63 0F
	bpl  -3.b		; 10 FD
	dec $1B24.w,X		; DE 24 1B
.ACCU 16
.INDEX 16
	rep #$B6		; C2 B6
	adc $0F.b,S		; 63 0F
	bpl  -3.b		; 10 FD
	dec $1B15.w,X		; DE 15 1B
	cmp $B6.b,S		; C3 B6
	eor ($F0.b,S),Y		; 53 F0
	ora ($FD.b,X)		; 01 FD
	dec $1B15.w,X		; DE 15 1B
	cmp $B6.b,S		; C3 B6
	eor ($F0.b,S),Y		; 53 F0
	ora ($FD.b,X)		; 01 FD
	dec $1B15.w,X		; DE 15 1B
	cmp $B6.b,S		; C3 B6
	eor ($F0.b,S),Y		; 53 F0
	ora ($FD.b,X)		; 01 FD
	dec $0C15.w,X		; DE 15 0C
	cmp $B6.b,S		; C3 B6
	eor ($F0.b,S),Y		; 53 F0
	ora ($FD.b,X)		; 01 FD
	dec $1B14.w,X		; DE 14 1B
	cmp ($B6.b,S),Y		; D3 B6
	eor ($F0.b,S),Y		; 53 F0
	ora ($EE.b,X)		; 01 EE
	dec $1B14.w,X		; DE 14 1B
	bne -74.b		; D0 B6
	and $20.b,X		; 35 20
	sbc ($0F.b),Y		; F1 0F
	sbc $40D2.w		; ED D2 40
	cmp $35B6.w		; CD B6 35
	jsr $0FF1.w		; 20 F1 0F
	sbc $40D2.w		; ED D2 40
	ldx $35B6.w,Y		; BE B6 35
	jsr $0FF1.w		; 20 F1 0F
	sbc $41D1.w		; ED D1 41
	ldx $E3B2.w,Y		; BE B2 E3
	mvp $42,$33		; 44 33 42
	ora $00BC.w		; 0D BC 00
	dex		; CA
	lda ($E3.b)		; B2 E3
	mvp $42,$33		; 44 33 42
	ora $00BC.w		; 0D BC 00
	dex		; CA
	ldx $44.b,Y		; B6 44
	and $ED0F01.l		; 2F 01 0F ED
	cmp ($40.b),Y		; D1 40
	dec $45B6.w		; CE B6 45
	ora $ED0F01.l,X		; 1F 01 0F ED
	cmp ($40.b),Y		; D1 40
	dec $45B6.w		; CE B6 45
	ora $ED0F01.l,X		; 1F 01 0F ED
	cmp ($30.b),Y		; D1 30
	cmp $1F45B6.l		; CF B6 45 1F
	brk $1F.b		; 00 1F
	sbc $30D1.w		; ED D1 30
	cmp $1F45B6.l		; CF B6 45 1F
	brk $1F.b		; 00 1F
	sbc $30D1.w		; ED D1 30
	cmp $1F54B6.l		; CF B6 54 1F
	brk $1F.b		; 00 1F
	sbc $30D1.w		; ED D1 30
	cpy #$44B6.w		; C0 B6 44
	ora $ED0F01.l,X		; 1F 01 0F ED
	cmp ($3F.b),Y		; D1 3F
	bne -74.b		; D0 B6
	mvp $01,$1F		; 44 1F 01
	ora $20D1ED.l		; 0F ED D1 20
	bne -74.b		; D0 B6
	mvp $00,$1F		; 44 1F 00
	ora $20D1ED.l,X		; 1F ED D1 20
	bne -74.b		; D0 B6
	mvp $00,$1F		; 44 1F 00
	ora $20D1ED.l,X		; 1F ED D1 20
	bne -74.b		; D0 B6
	eor ($1F.b,S),Y		; 53 1F
	brk $1F.b		; 00 1F
	sbc $2FD1.w		; ED D1 2F
	cpx #$53B6.w		; E0 B6 53
	ora $ED1F00.l,X		; 1F 00 1F ED
	cmp ($2F.b),Y		; D1 2F
	sbc ($B2.b,X)		; E1 B2
	trb $44.b		; 14 44
	and ($43.b,S),Y		; 33 43
	ora $DDBB.w		; 0D BB DD
	ldy $14B2.w,X		; BC B2 14
	mvp $43,$33		; 44 33 43
	ora $DDBB.w		; 0D BB DD
	lda $14B2.w,X		; BD B2 14
	mvp $43,$33		; 44 33 43
	ora $DDBB.w		; 0D BB DD
	lda $14B2.w,X		; BD B2 14
	mvp $43,$33		; 44 33 43
	ora $DCBB.w		; 0D BB DC
	lda $52B6.w,X		; BD B6 52
	ora $ED0F01.l,X		; 1F 01 0F ED
	bne  16.b		; D0 10
	sbc ($A6.b)		; F2 A6
	adc $1F.b,X		; 75 1F
	ora ($1E.b,X)		; 01 1E
	dex		; CA
	lda $A6F42F.l,X		; BF 2F F4 A6
	adc $1F.b,X		; 75 1F
	ora ($0F.b,X)		; 01 0F
	dex		; CA
	lda $B3F42F.l,X		; BF 2F F4 B3
	bit $44.b		; 24 44
	and ($43.b,S),Y		; 33 43
	ora $CCBB.w		; 0D BB CC
	dec $5559.w		; CE 59 55
	phk		; 4B
	eor $010000.l		; 4F 00 00 01
	rti		; 40

	brk $00.b		; 00 00
	cop $50.b		; 02 50
	brk $00.b		; 00 00
	sbc $0004FF.l,X		; FF FF 04 00
	cop $32.b		; 02 32
	ora ($67.b,X)		; 01 67
	inc $FB.b,X		; F6 FB
	sbc [$01.b],Y		; F7 01
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
	brk $8A.b		; 00 8A
	ora $31.b		; 05 31
	ora ($0F.b,X)		; 01 0F
	sbc $01E0FE.l		; EF FE E0 01
	ror A		; 6A
	ora ($26.b,S),Y		; 13 26
	ror $67.b		; 66 67
	adc [$66.b]		; 67 66
	eor $43.b		; 45 43
	ply		; 7A
	ora ($22.b),Y		; 11 22
	and ($55.b,S),Y		; 33 55
	mvn $43,$55		; 54 55 43
	and ($7A.b,X)		; 21 7A
	brk $00.b		; 00 00
	ora ($23.b,X)		; 01 23
	mvp $43,$44		; 44 44 43
	and ($6A.b,S),Y		; 33 6A
	eor ($00.b,S),Y		; 53 00
	brk $01.b		; 00 01
	and $20.b,S		; 23 20
	ora $FF7AED.l		; 0F ED 7A FF
	inc $EDFF.w,X		; FE FF ED
	sbc $DCCC.w		; ED CC DC
	cmp $EF7A.w		; CD 7A EF
	ora ($21.b)		; 12 21
	ora ($0D.b),Y		; 11 0D
	tsx		; BA
	tyx		; BB
	tyx		; BB
	ply		; 7A
	cmp $CCED.w		; CD ED CC
	cpy $BCBB.w		; CC BB BC
	cpy $6AEF.w		; CC EF 6A
	ora ($44.b)		; 12 44
	and ($00.b)		; 32 00
	brk $EE.b		; 00 EE
	sbc $7ADD.w		; ED DD 7A
	beq  -1.b		; F0 FF
	ora ($FF.b,X)		; 01 FF
	beq   1.b		; F0 01
	and $33.b,S		; 23 33
	ply		; 7A
	mvp $23,$32		; 44 32 23
	and ($35.b)		; 32 35
	adc $55.b		; 65 55
	eor $7A.b,S		; 43 7A
	jsl $01FF00.l		; 22 00 FF 01
	ora ($44.b)		; 12 44
	mvp $6A,$43		; 44 43 6A
	eor ($45.b,S),Y		; 53 45
	lsr $76.b,X		; 56 76
	eor $43.b,X		; 55 43
	jsl $FF7A0F.l		; 22 0F 7A FF
	sbc $0001F0.l,X		; FF F0 01 00
	inc $CDDD.w		; EE DD CD
	ply		; 7A
	cmp $01E0.w,X		; DD E0 01
	ora ($01.b,X)		; 01 01
	sbc $7ACCDD.l,X		; FF DD CC 7A
	cpy $DDBC.w		; CC BC DD
	cpy $CCCC.w		; CC CC CC
	dec $7AEE.w,X		; DE EE 7A
	sbc $DDFEF0.l		; EF F0 FE DD
	wai		; CB
	cmp $12EF.w		; CD EF 12
	ror A		; 6A
	lsr $65.b,X		; 56 65
	bmi  -3.b		; 30 FD
	lda $CEAA.w,Y		; B9 AA CE
	brk $6A.b		; 00 6A
	bit $44.b,X		; 34 44
	lsr $77.b,X		; 56 77
	ror $66.b		; 66 66
	stz $33.b		; 64 33
	ply		; 7A
	and ($12.b,X)		; 21 12
	bit $45.b,X		; 34 45
	eor $54.b,X		; 55 54
	eor $21.b,S		; 43 21
	ply		; 7A
	bpl -16.b		; 10 F0
	ora ($13.b),Y		; 11 13
	mvp $44,$44		; 44 44 44
	and ($6A.b,S),Y		; 33 6A
	and ($01.b,S),Y		; 33 01
	beq   2.b		; F0 02
	and $20.b,S		; 23 20
	sbc $FF7AFD.l,X		; FF FD 7A FF
	inc $FEEF.w,X		; FE EF FE
	cmp $CCCC.w,X		; DD CC CC
	cmp $EF7A.w,X		; DD 7A EF
	ora ($22.b),Y		; 11 22
	jsr $CAFD.w		; 20 FD CA
	tsx		; BA
	ldy $DC7A.w,X		; BC 7A DC
	cmp $CBDC.w,X		; DD DC CB
	ldy $CDBB.w,X		; BC BB CD
	sbc $33126A.l		; EF 6A 12 33
	and ($10.b,S),Y		; 33 10
	beq -18.b		; F0 EE
	sbc $7ADE.w		; ED DE 7A
	sbc $0F00F0.l,X		; FF F0 00 0F
	sbc $342211.l,X		; FF 11 22 34
	ply		; 7A
	mvp $22,$32		; 44 32 22
	and ($44.b,S),Y		; 33 44
	eor $65.b,X		; 55 65
	eor $7A.b,S		; 43 7A
	and ($10.b,X)		; 21 10
	sbc $441300.l,X		; FF 00 13 44
	mvp $6A,$43		; 44 43 6A
	eor $45.b,S		; 43 45
	ror $66.b		; 66 66
	adc $43.b		; 65 43
	and ($0F.b,X)		; 21 0F
	ply		; 7A
	sbc $0000FF.l,X		; FF FF 00 00
	ora $DCDDFE.l		; 0F FE DD DC
	ply		; 7A
	dec $01EF.w,X		; DE EF 01
	ora ($01.b,X)		; 01 01
	sbc $7ACCDE.l,X		; FF DE CC 7A
	tyx		; BB
	cpy $DCDD.w		; CC DD DC
	ldy $CDCD.w,X		; BC CD CD
	sbc $FFFF7A.l		; EF 7A FF FF
	inc $CCDD.w,X		; FE DD CC
	lda $02E0.w,X		; BD E0 02
	ror A		; 6A
	eor [$55.b],Y		; 57 55
	and ($FC.b),Y		; 31 FC
	tsx		; BA
	tax		; AA
	ldx $6B01.w,Y		; BE 01 6B
	bit $45.b		; 24 45
	lsr $67.b,X		; 56 67
	adc [$66.b]		; 67 66
	mvn $59,$33		; 54 33 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $0D.b		; 00 0D
	cpy #$3E70.w		; C0 70 3E
	ldx $4D44.w		; AE 44 4D
	eor $54.b,X		; 55 54
	eor $4D.b		; 45 4D
	eor $54.b		; 45 54
	jmp $732E.w		; 4C 2E 73
	adc $CF006C.l		; 6F 6C 00 CF
	jmp ($E0D6.w,X)		; 7C D6 E0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $C9CC.w		; 0C CC C9
	sta $1184.w,Y		; 99 84 11
	ora ($22.b)		; 12 22
	and $12.b,S		; 23 12
	inc $EBDF.w,X		; FE DF EB
	stz $9F.b,X		; 74 9F
	eor $64.b		; 45 64
	mvp $13,$53		; 44 53 13
	bpl -35.b		; 10 DD
	sty $FF.b,X		; 94 FF
	sbc $DCDD.w		; ED DD DC
	cmp $00EF.w,X		; DD EF 00
	beq -124.b		; F0 84
	bpl  -1.b		; 10 FF
	cpx #$5534.w		; E0 34 55
	lsr $77.b,X		; 56 77
	ror $94.b,X		; 76 94
	mvp $FE,$32		; 44 32 FE
	cmp $FE0022.l,X		; DF 22 00 FE
	bcs -124.b		; B0 84
	eor $45.b		; 45 45
	eor ($30.b)		; 52 30
	tyx		; BB
	rol $FC.b,X		; 36 FC
	asl $FDB4.w		; 0E B4 FD
	cmp $FFF0.w,X		; DD F0 FF
	brk $F1.b		; 00 F1
	mvp $B0,$21		; 44 21 B0
	lsr $76.b,X		; 56 76
	and ($10.b),Y		; 31 10
	sbc $57D0.w		; ED D0 57
	lsr $B4.b,X		; 56 B4
	bmi  16.b		; 30 10
	tyx		; BB
	ora $E10DE1.l		; 0F E1 0D E1
	ora $A1A4.w		; 0D A4 A1
	ror $32.b,X		; 76 32
	and ($FE.b),Y		; 31 FE
	dec $CCEC.w,X		; DE EC CC
	ldy $F1.b,X		; B4 F1
	jsl $FB1101.l		; 22 01 11 FB
	cmp ($0F.b),Y		; D1 0F
	lsr $B4.b,X		; 56 B4
	ora $DE1032.l,X		; 1F 32 10 DE
	ora ($15.b),Y		; 11 15
	rol $B402.w,X		; 3E 02 B4
	cpx $F2EF.w		; EC EF F2
	eor ($F2.b,X)		; 41 F2
	rol $FDBC.w		; 2E BC FD
	ldy $13.b,X		; B4 13
	ora $FBFF22.l		; 0F 22 FF FB
	dec $E20E.w		; CE 0E E2
	ldy $52.b,X		; B4 52
	sbc ($21.b),Y		; F1 21
	ora $F01ED1.l,X		; 1F D1 1E F0
	asl $F3B4.w		; 0E B4 F3
	eor ($03.b),Y		; 51 03
	and $F22FEF.l,X		; 3F EF 2F F2
	eor $6466B0.l		; 4F B0 66 64
	asl $CDDD.w,X		; 1E DD CD
	and $11.b,S		; 23 11
	and ($B4.b,X)		; 21 B4
	jmp.w [$FFEF]		; DC EF FF
	mvn $21,$0F		; 54 0F 21
	sbc $B0D0.w		; ED D0 B0
	tyx		; BB
	sbc $43.b,X		; F5 43
	eor $42.b,X		; 55 42
	stp		; DB
	cpy $B0C2.w		; CC C2 B0
	adc $46.b		; 65 46
	stz $FB.b		; 64 FB
	tyx		; BB
	lda $B44655.l,X		; BF 55 46 B4
	ora $02C0EB.l		; 0F EB C0 02
	adc ($02.b,X)		; 61 02
	ora $CFB4FB.l,X		; 1F FB B4 CF
	asl $3600.w		; 0E 00 36
	rol $EC13.w		; 2E 13 EC
	sbc ($B4.b,X)		; E1 B4
	ora $EF5303.l,X		; 1F 03 53 EF
	and $FF00BD.l		; 2F BD 00 FF
	ldy $26.b,X		; B4 26
	and $FBF2.w		; 2D F2 FB
	cpy #$FF0F.w		; C0 0F FF
	brk $B4.b		; 00 B4
	sbc $351035.l,X		; FF 35 10 35
	rol $FED0.w		; 2E D0 FE
	dec $D2B4.w,X		; DE B4 D2
	rts		; 60

	sbc $31.b,S		; E3 31
	sbc $ECE0.w,X		; FD E0 EC
	inc $05B4.w		; EE B4 05
	and $CE3F14.l,X		; 3F 14 3F CE
	ora $B435DE.l,X		; 1F DE 35 B4
	brk $22.b		; 00 22
	cpx $D30F.w		; EC 0F D3
	bit $FDD4.w,X		; 3C D4 FD
	ldy $55.b,X		; B4 55
	beq  67.b		; F0 43
	jsr ($FED0.w,X)		; FC D0 FE
	ora $42B4F1.l		; 0F F1 B4 42
	sbc ($20.b,X)		; E1 20
	brk $DD.b		; 00 DD
	ora ($EE.b,X)		; 01 EE
	cmp $E033B4.l,X		; DF B4 33 E0
	and ($0F.b),Y		; 31 0F
	cpx #$E10E.w		; E0 0E E1
	.db $42, $B4		; 42 B4
	cpx #$FC21.w		; E0 21 FC
	cmp ($5D.b,S),Y		; D3 5D
	cpy #$F20E.w		; C0 0E F2
	ldy $61.b,X		; B4 61
	ora $32.b,S		; 03 32
	sbc $FEF0.w		; ED F0 FE
	beq   5.b		; F0 05
	ldy $4F.b,X		; B4 4F
	cop $00.b		; 02 00
	ora $EE1EBE.l,X		; 1F BE 1E EE
	cpx #$41B4.w		; E0 B4 41
	sbc ($21.b),Y		; F1 21
	ora $0DE0.w		; 0D E0 0D
	pea $B43F.w		; F4 3F B4
	sbc ($1F.b),Y		; F1 1F
	cmp $F100.w		; CD 00 F1
	asl $1500.w,X		; 1E 00 15
	ldy $40.b,X		; B4 40
	tsb $3F.b		; 04 3F
	bne  31.b		; D0 1F
	cmp $B425FE.l,X		; DF FE 25 B4
	ora $1BF122.l,X		; 1F 22 F1 1B
	cpy #$FE0C.w		; C0 0C FE
	sbc ($B4.b,S),Y		; F3 B4
	and $ED10F2.l,X		; 3F F2 10 ED
	cop $FF.b		; 02 FF
	bit $0E.b,X		; 34 0E
	bcs  17.b		; B0 11
	brk $FD.b		; 00 FD
	ldy $EC45.w		; AC 45 EC
	cpx $B4B0.w		; EC B0 B4
	ora $1E13.w,X		; 1D 13 1E
	sbc ($0E.b),Y		; F1 0E
	ora ($F0.b,X)		; 01 F0
	eor ($A4.b,S),Y		; 53 A4
	sbc ($71.b,X)		; E1 71
	tsb $F9.b		; 04 F9
.INDEX 8
	sep #$DD		; E2 DD
	cpx $B4E6.w		; EC E6 B4
	asl $1001.w,X		; 1E 01 10
	dec $E000.w,X		; DE 00 E0
	.db $42, $EE		; 42 EE
	ldy $0F.b,X		; B4 0F
	brk $DC.b		; 00 DC
	and [$0B.b],Y		; 37 0B
	sbc ($ED.b,X)		; E1 ED
	and ($B4.b,S),Y		; 33 B4
	inc $0F32.w		; EE 32 0F
	ora ($F0.b,X)		; 01 F0
	brk $F2.b		; 00 F2
	eor ($A4.b),Y		; 51 A4
	sbc $61.b,X		; F5 61
	and $BA.b,X		; 35 BA
	ora ($CD.b,X)		; 01 CD
	sbc $A435.w		; ED 35 A4
	inc $2D33.w,X		; FE 33 2D
	ldx $A30E.w		; AE 0E A3
	adc ($BD.b),Y		; 71 BD
	ldy $0F.b,X		; B4 0F
	tsb $50D4.w		; 0C D4 50
	dec $E0FE.w,X		; DE FE E0
	bmi -76.b		; 30 B4
	sbc ($21.b,X)		; E1 21
	asl $F010.w		; 0E 10 F0
	ora $A44F05.l		; 0F 05 4F A4
	and [$41.b]		; 27 41
	eor $BF2E9E.l,X		; 5F 9E 2E BF
	dec $A465.w		; CE 65 A4
	cmp ($53.b),Y		; D1 53
	asl A		; 0A
	cmp ($FB.b,X)		; C1 FB
	sbc [$3D.b],Y		; F7 3D
	sbc $DC0FB4.l		; EF B4 0F DC
	and $0F.b		; 25 0F
	inc $F2FE.w		; EE FE F2
	rol $ACB0.w		; 2E B0 AC
	inc $CDDC.w		; EE DC CD
	cmp $E4DC.w,X		; DD DC E4
	mvn $56,$A4		; 54 A4 56
	ora ($5C.b,S),Y		; 13 5C
	ldy #$2C.b		; A0 2C
	cmp $71D1.w,X		; DD D1 71
	ldy $E2.b		; A4 E2
	eor ($BA.b)		; 52 BA
	ora ($CD.b,X)		; 01 CD
	ror $EE.b		; 66 EE
	sbc $FEB4.w,X		; FD B4 FE
	cmp $EEFF53.l		; CF 53 FF EE
	asl $0EF3.w		; 0E F3 0E
	ldy $03.b,X		; B4 03
	bpl -17.b		; 10 EF
	brk $F1.b		; 00 F1
	beq  69.b		; F0 45
	ora $1553A4.l		; 0F A4 53 15
	rol A		; 2A
	rep #$0C		; C2 0C
	cpx $5EC4.w		; EC C4 5E
	bcs   2.b		; B0 02
	eor $20.b,X		; 55 20
	ora ($EC.b),Y		; 11 EC
	bne  47.b		; D0 2F
	cmp $AEFCB0.l,X		; DF B0 FC AE
	jsl $B9CC1F.l		; 22 1F CC B9
	ldx $B4CB.w,Y		; BE CB B4
	ora ($1E.b)		; 12 1E
	bne  31.b		; D0 1F
	brk $F0.b		; 00 F0
	mvn $A4,$F0		; 54 F0 A4
	adc ($25.b)		; 72 25
	ora #$EDF1.w		; 09 F1 ED
	jmp.w [$3DF7]		; DC F7 3D
	ldy $16.b		; A4 16
	and $1EAF.w,X		; 3D AF 1E
	ldx $FB67.w,Y		; BE 67 FB
	brk $B0.b		; 00 B0
	dex		; CA
.ACCU 8
	sep #$21		; E2 21
	ora $99BC.w,X		; 1D BC 99
	cmp $B0BC.w,X		; DD BC B0
	beq  -4.b		; F0 FC
	ldy $CBCB.w,X		; BC CB CB
	lda $4535.w		; AD 35 45
	ldy $52.b		; A4 52
	bit $BB.b,X		; 34 BB
	ora ($CE.b),Y		; 11 CE
	cpx $0E27.w		; EC 27 0E
	ldy $22.b,X		; B4 22
	ora $0EE1.w		; 0D E1 0E
	sep #$41		; E2 41
	sbc $C3B40D.l		; EF 0D B4 C3
	bvc -14.b		; 50 F2
	jmp.w [$D21E]		; DC 1E D2
	rol $B0E3.w,X		; 3E E3 B0
	ora ($EB.b,X)		; 01 EB
	ldy $BABB.w,X		; BC BB BA
	bcs  68.b		; B0 44
	rol $A4.b,X		; 36 A4
	and ($52.b),Y		; 31 52
	ldy $CF2F.w		; AC 2F CF
	dec $C064.w,X		; DE 64 C0
	ldy $31.b,X		; B4 31
	sbc $FE01.w		; ED 01 FE
	sbc $50.b,S		; E3 50
	bne -21.b		; D0 EB
	bcs -96.b		; B0 A0
	and ($32.b,X)		; 21 32
	cmp $9DEA.w,X		; DD EA 9D
	xba		; EB
	cmp $DE1FB4.l		; CF B4 1F DE
	bpl -16.b		; 10 F0
	sbc $123F15.l,X		; FF 15 3F 12
	ldy $33.b		; A4 33
	eor $CE2E9F.l,X		; 5F 9F 2E CE
	cmp ($71.b),Y		; D1 71
	cmp ($B0.b)		; D2 B0
	eor $2F.b,X		; 55 2F
	ora ($FC.b,X)		; 01 FC
	cmp ($42.b)		; D2 42
	ora $63B4A9.l,X		; 1F A9 B4 63
.INDEX 8
	sep #$1C		; E2 1C
	sbc ($EB.b,X)		; E1 EB
	and ($EF.b,S),Y		; 33 EF
	and ($B4.b)		; 32 B4
	inc $00D0.w,X		; FE D0 00
	sbc $1F35F0.l,X		; FF F0 35 1F
	and $A4.b,S		; 23 A4
	and $4B.b,S		; 23 4B
	ldx #$0B.b		; A2 0B
	inc $5EE5.w		; EE E5 5E
	sbc $B4.b,X		; F5 B4
	rol $1FDF.w		; 2E DF 1F
	sbc $FBFE44.l		; EF 44 FE FB
	pei ($B0.b)		; D4 B0
	ora $EE0C03.l,X		; 1F 03 0C EE
	sta $BDEE.w,Y		; 99 EE BD
	ora ($B4.b,X)		; 01 B4
	inc $1FD0.w,X		; FE D0 1F
	sbc $F04401.l,X		; FF 01 44 F0
	and ($A4.b)		; 32 A4
	ora $19.b,X		; 15 19
	cmp ($EC.b)		; D2 EC
	sbc $2D16.w		; ED 16 2D
	bit $B4.b		; 24 B4
	ora $1EE0.w,X		; 1D E0 1E
.INDEX 8
	sep #$50		; E2 50
	sbc $B435BB.l,X		; FF BB 35 B4
	ora $2CCF30.l		; 0F 30 CF 2C
	cmp ($3D.b,S),Y		; D3 3D
	ora $10.b,S		; 03 10
	bcs  13.b		; B0 0D
	ldy $ABDB.w,X		; BC DB AB
	ldy $3314.w,X		; BC 14 33
	adc [$A4.b]		; 67 A4
	and $D9.b,X		; 35 D9
	ora ($CE.b,X)		; 01 CE
	inc $DF45.w		; EE 45 DF
	eor $B4.b,S		; 43 B4
	ora $0DE1.w		; 0D E1 0D
	ora $2E.b		; 05 2E
	tsb $61A0.w		; 0C A0 61
	ldy $E2.b,X		; B4 E2
	and $FBD2.w,X		; 3D D2 FB
	sbc $0E.b,X		; F5 0E
	jsl $FDB400.l		; 22 00 B4 FD
	sbc ($FE.b)		; F2 FE
	brk $F2.b		; 00 F2
	eor ($F2.b)		; 52 F2
	and ($A4.b,X)		; 21 A4
	eor ($9B.b,S),Y		; 53 9B
	and $51E1DE.l		; 2F DE E1 51
	rep #$42		; C2 42
	ldy $ED.b,X		; B4 ED
	sbc ($FE.b),Y		; F1 FE
	and $FE.b		; 25 FE
	nop		; EA
	cmp $3E.b,X		; D5 3E
	ldy $14.b,X		; B4 14
	jsr ($CD11.w,X)		; FC 11 CD
	and ($E0.b,S),Y		; 33 E0
	bmi   1.b		; 30 01
	cpy #$FE.b		; C0 FE
	sbc $E0EEEE.l,X		; FF EE EE E0
	jsl $C04423.l		; 22 23 44 C0
	eor $22.b,X		; 55 22
	and ($00.b,X)		; 21 00
	beq  17.b		; F0 11
	ora ($22.b,X)		; 01 22
	ldy $DD.b,X		; B4 DD
	ora ($D1.b,X)		; 01 D1
	.db $42, $EE		; 42 EE
	tyx		; BB
	bit $FF.b,X		; 34 FF
	bcs   1.b		; B0 01
	sbc $9AFD.w		; ED FD 9A
	sbc $2211E0.l,X		; FF E0 11 22
	ldy $DE.b,X		; B4 DE
	jsr $1FD0.w		; 20 D0 1F
	trb $2F.b		; 14 2F
	ora ($12.b,S),Y		; 13 12
	ldy $5B.b		; A4 5B
	bcc  28.b		; 90 1C
	dec $0D15.w,X		; DE 15 0D
	bit $3F.b		; 24 3F
	ldy $CE.b,X		; B4 CE
	ora $ED4EF3.l,X		; 1F F3 4E ED
	lda $B0E161.l		; AF 61 E1 B0
	bpl -34.b		; 10 DE
	xce		; FB
	stz $F10F.w		; 9C 0F F1
	ora ($31.b),Y		; 11 31
	ldy $C1.b,X		; B4 C1
	asl $0FF1.w,X		; 1E F1 0F
	bit $1F.b		; 24 1F
	jsl $19A413.l		; 22 13 A4 19
	lda ($FC.b)		; B2 FC
	cmp $44DE34.l,X		; DF 34 DE 44
	bit $CFB4.w		; 2C B4 CF
	ora $DB0E14.l,X		; 1F 14 0E DB
	pei ($3E.b)		; D4 3E
	ora $B4.b,S		; 03 B4
	ora $EC01.w,X		; 1D 01 EC
	ora $2F.b		; 05 2F
	cop $01.b		; 02 01
	ora $F0C0.w		; 0D C0 F0
	ora $12FFFF.l		; 0F FF FF 12
	jsl $B44534.l		; 22 34 45 B4
	jsr ($EEF1.w,X)		; FC F1 EE
	beq  48.b		; F0 30
	sbc ($21.b,X)		; E1 21
	tsb $D0B4.w		; 0C B4 D0
	ora $CCED42.l,X		; 1F 42 ED CC
	bit $FF.b		; 24 FF
	and $B0.b,S		; 23 B0
	sbc $B9EE.w,X		; FD EE B9
	cmp ($00.b,X)		; C1 00
	ora ($24.b)		; 12 24
	rol $02B4.w		; 2E B4 02
	inc $F110.w,X		; FE 10 F1
	.db $42, $F1		; 42 F1
	and ($22.b),Y		; 31 22
	bcs  99.b		; B0 63
	and ($1F.b,S),Y		; 33 1F
	cpx #$20.b		; E0 20
	sbc ($34.b),Y		; F1 34
	ora $EFC0.w,X		; 1D C0 EF
	beq  33.b		; F0 21
	sbc $EFCC.w,X		; FD CC EF
	inc $B400.w		; EE 00 B4
	sbc $52D01E.l		; EF 1E D0 52
	beq  47.b		; F0 2F
	and ($DD.b,X)		; 21 DD
	ldy $11.b,X		; B4 11
	sbc $5FF31F.l		; EF 1F F3 5F
	cop $22.b		; 02 22
	jsr $CEB4.w		; 20 B4 CE
	ora $0F03EE.l,X		; 1F EE 03 0F
	cop $20.b		; 02 20
	cpy $11B4.w		; CC B4 11
	trb $1C.b		; 14 1C
	cmp $30E1.w		; CD E1 30
	sbc ($3F.b)		; F2 3F
	bcs -18.b		; B0 EE
	xba		; EB
	stz $0112.w		; 9C 12 01
	jsl $B4FD43.l		; 22 43 FD B4
	and $050EF0.l		; 2F F0 0E 05
	rol $1213.w,X		; 3E 13 12
	rol $C0B4.w		; 2E B4 C0
	asl $12DF.w,X		; 1E DF 12
	ora $BF1E22.l		; 0F 22 1E BF
	ldy $12.b,X		; B4 12
	and ($EB.b)		; 32 EB
	dec $1E03.w,X		; DE 03 1E
	tsb $1D.b		; 04 1D
	ldy $F1.b,X		; B4 F1
	sbc $3FF5.w		; ED F5 3F
	ora ($11.b,X)		; 01 11
	and $B4C1.w		; 2D C1 B4
	ora $25FFF0.l,X		; 1F F0 FF 25
	asl $1232.w,X		; 1E 32 12
	trb $E1B4.w		; 1C B4 E1
	inc $22EF.w,X		; FE EF 22
	beq  34.b		; F0 22
	jsr ($B4D1.w,X)		; FC D1 B4
	ora ($3F.b,S),Y		; 13 3F
	lda $22FE.w,X		; BD FE 22
	sbc $B0EE33.l,X		; FF 33 EE B0
	inc $C1B9.w		; EE B9 C1
	jsr $2412.w		; 20 12 24
	eor $0FB4DF.l		; 4F DF B4 0F
	brk $EF.b		; 00 EF
	eor ($F0.b,S),Y		; 53 F0
	and ($12.b)		; 32 12
	jsr ($23B0.w,X)		; FC B0 23
	ora $0111DE.l,X		; 1F DE 11 01
	mvp $CE,$1D		; 44 1D CE
	bcs   4.b		; B0 04
	bvc -53.b		; 50 CB
	lda #$CE.b		; A9 CE
	cmp $FE12.w		; CD 12 FE
	bcs -19.b		; B0 ED
	tax		; AA
.INDEX 8
	sep #$10		; E2 10
	ora ($34.b)		; 12 34
	and $B4DF.w		; 2D DF B4
	asl $E10F.w		; 0E 0F E1
	eor ($F1.b)		; 52 F1
	and ($21.b),Y		; 31 21
	cmp $10B4.w,X		; DD B4 10
	inc $30E2.w		; EE E2 30
	sbc ($2F.b)		; F2 2F
	dec $B003.w		; CE 03 B0
	lsr $2D.b		; 46 2D
	wai		; CB
	txy		; 9B
	sbc $31C0.w		; ED C0 31
	inc $ECB0.w		; EE B0 EC
	ldy $1013.w		; AC 13 10
	jsl $EF0C44.l		; 22 44 0C EF
	ldy $FF.b,X		; B4 FF
	asl $50E3.w		; 0E E3 50
	sbc ($21.b,S),Y		; F3 21
	jsr $B4CF.w		; 20 CF B4
	ora $2F03DE.l,X		; 1F DE 03 2F
	ora $1D.b,S		; 03 1D
	cmp $73B034.l		; CF 34 B0 73
	sbc $AEDA.w		; ED DA AE
	cpx $30F3.w		; EC F3 30
	sbc $BEDBB0.l,X		; FF B0 DB BE
	jsl $422301.l		; 22 01 23 42
	cpx $B4EF.w		; EC EF B4
	sbc $4FF40E.l		; EF 0E F4 4F
	ora $12.b,S		; 03 12
	rol $B0D0.w		; 2E D0 B0
	jsr $E2ED.w		; 20 ED E2
	and ($24.b,X)		; 21 24
	and $B016DE.l,X		; 3F DE 16 B0
	rts		; 60

	dec $DFCA.w,X		; DE CA DF
	cmp $2F24.w,X		; DD 24 2F
	inc $EEB4.w,X		; FE B4 EE
	trb $3E.b		; 14 3E
	sbc ($11.b),Y		; F1 11
	ora $2FC0.w,X		; 1D C0 2F
	ldy $E0.b,X		; B4 E0
	sbc $2F15.w,X		; FD 15 2F
	ora ($12.b,S),Y		; 13 12
	ora $B4E1.w,X		; 1D E1 B4
	inc $33EF.w,X		; FE EF 33
	beq  33.b		; F0 21
	cpx $53F2.w		; EC F2 53
	ldy $DA.b,X		; B4 DA
	brk $D0.b		; 00 D0
	eor $DF40E3.l		; 4F E3 40 DF
	sbc $E2CBB0.l,X		; FF B0 CB E2
	bmi   2.b		; 30 02
	and ($2F.b,S),Y		; 33 2F
	dec $B4FD.w		; CE FD B4
	sbc $1F26FD.l,X		; FF FD 26 1F
	ora ($13.b,S),Y		; 13 13
	sbc $B0F1.w,X		; FD F1 B0
	asl $33DF.w,X		; 1E DF 33
	ora ($44.b,S),Y		; 13 44
	ora $60E5.w		; 0D E5 60
	ldy $94.b		; A4 94
	cmp #$36.b		; C9 36
	cmp $2C66.w,X		; DD 66 2C
	dec $B4FE.w		; CE FE B4
	sbc ($42.b)		; F2 42
	bne  17.b		; D0 11
	brk $DD.b		; 00 DD
	cop $FE.b		; 02 FE
	bcs -53.b		; B0 CB
	txs		; 9A
	cop $02.b		; 02 02
	eor $77.b		; 45 77
	and ($21.b),Y		; 31 21
	ldy #$BB.b		; A0 BB
	and [$42.b],Y		; 37 42
	adc [$56.b]		; 67 56
	ror $62.b,X		; 76 62
	cmp $D9B0.w,X		; DD B0 D9
	sta $ADDA.w,X		; 9D DA AD
	sbc $CBBB.w		; ED BB CB
	lda $63B4.w		; AD B4 63
	beq  32.b		; F0 20
	sbc ($0C.b),Y		; F1 0C
.INDEX 8
	sep #$1E		; E2 1E
	brk $B4.b		; 00 B4
	cmp ($60.b)		; D2 60
.ACCU 8
	sep #$20		; E2 20
	cop $EC.b		; 02 EC
	brk $CF.b		; 00 CF
	bcs   3.b		; B0 03
	ora $0FFF11.l		; 0F 11 FF 0F
	asl $B9AA.w		; 0E AA B9
	ldy $14.b,X		; B4 14
	sbc $FD02.w,X		; FD 02 FD
	sep #$0F		; E2 0F
	pea $B463.w		; F4 63 B4
	ora ($21.b,X)		; 01 21
	sbc $10D00D.l,X		; FF 0D D0 10
	sbc $3EB415.l,X		; FF 15 B4 3E
	ora $1F.b,S		; 03 1F
	ora $D21ECE.l		; 0F CE 1E D2
	rti		; 40

	ldy $D2.b		; A4 D2
	and $0AEFEF.l,X		; 3F EF EF 0A
	lda $B43E15.l		; AF 15 3E B4
	sbc ($0E.b),Y		; F1 0E
	ldx $0000.w,Y		; BE 00 00
	eor $21.b,X		; 55 21
	and ($B4.b)		; 32 B4
	bpl  15.b		; 10 0F
	cpx $FEE0.w		; EC E0 FE
	ora $61.b,S		; 03 61
	sbc ($B4.b)		; F2 B4
	and ($0F.b,X)		; 21 0F
	cpy $D2FF.w		; CC FF D2
	rti		; 40

	sbc ($1F.b),Y		; F1 1F
	ldy $21.b		; A4 21
	cmp $BEEC.w,X		; DD EC BE
	adc $EF.b,X		; 75 EF
	mvp $B4,$1F		; 44 1F B4
	cpy $DFEF.w		; CC EF DF
	rol $40.b		; 26 40
	and $21.b,S		; 23 21
	bpl -76.b		; 10 B4
	sbc $C0FEBD.l,X		; FF BD FE C0
	mvn $32,$11		; 54 11 32
	brk $B4.b		; 00 B4
	cpx $D0EF.w		; EC EF D0
	bmi   1.b		; 30 01
	ora $B40F01.l		; 0F 01 0F B4
	ora $1122F0.l,X		; 1F F0 22 11
	jsl $D0FB11.l		; 22 11 FB D0
	ldy $EC.b,X		; B4 EC
	cmp ($33.b),Y		; D1 33
	ora ($32.b)		; 12 32
	ora ($F0.b,X)		; 01 F0
	ora $ADB4.w		; 0D B4 AD
	sbc $0013.w		; ED 13 00
	and $11.b,S		; 23 11
	ora $0094DE.l,X		; 1F DE 94 00
	cmp ($3F.b),Y		; D1 3F
	and [$4E.b]		; 27 4E
	cmp $A4CD10.l		; CF 10 CD A4
	ora ($34.b,S),Y		; 13 34
	mvn $2E,$43		; 54 43 2E
	lda $BC0E.w		; AD 0E BC
	ldy $07.b		; A4 07
	rts		; 60

	asl $51.b,X		; 16 51
	brk $FF.b		; 00 FF
	xba		; EB
	plb		; AB
	ldy $DC.b		; A4 DC
	cpy $F0EE.w		; CC EE F0
	beq  -2.b		; F0 FE
	inc $A4EF.w,X		; FE EF A4
	brk $02.b		; 00 02
	ora ($01.b),Y		; 11 01
	bpl   1.b		; 10 01
	ora ($47.b),Y		; 11 47
	ldy $32.b,X		; B4 32
	and ($20.b,S),Y		; 33 20
	asl $0FEF.w		; 0E EF 0F
	cpx #$44.b		; E0 44
	ldy $32.b		; A4 32
	and ($11.b)		; 32 11
	ora $BCDBFE.l		; 0F FE DB BC
	wai		; CB
	cpy #$CB.b		; C0 CB
	tsx		; BA
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	tax		; AA
	plb		; AB
	ldy $00.b		; A4 00
	ora ($00.b),Y		; 11 00
	ora ($00.b),Y		; 11 00
	trb $44.b		; 14 44
	eor $C0.b,X		; 55 C0
	eor $66.b,X		; 55 66
	mvn $22,$33		; 54 33 22
	and $56.b,S		; 23 56
	adc [$A4.b],Y		; 77 A4
	and ($10.b,X)		; 21 10
	beq  -2.b		; F0 FE
	cpy $CDCC.w		; CC CC CD
	cpy $CA94.w		; CC 94 CA
	txs		; 9A
	cpy $EECD.w		; CC CD EE
	sbc $A400DE.l		; EF DE 00 A4
	brk $00.b		; 00 00
	sbc $452311.l,X		; FF 11 23 45
	eor $42.b,S		; 43 42
	ldy $20.b		; A4 20
	brk $EF.b		; 00 EF
	sbc ($35.b),Y		; F1 35
	adc $44.b		; 65 44
	and ($C0.b,X)		; 21 C0
	ror $65.b,X		; 76 65
	mvp $10,$32		; 44 32 10
	inc $DCED.w,X		; FE ED DC
	sty $BB.b,X		; 94 BB
	ldy $EFCE.w		; AC CE EF
	sbc $F0FEFE.l,X		; FF FE FE F0
	bcs -103.b		; B0 99
	txs		; 9A
	plb		; AB
	dec $34F1.w,X		; DE F1 34
	eor $66.b,X		; 55 66
	ldy $00.b		; A4 00
	brk $02.b		; 00 02
	and ($45.b,S),Y		; 33 45
	bit $21.b,X		; 34 21
	brk $94.b		; 00 94
	inc $DCDB.w,X		; FE DB DC
	tsx		; BA
	sta $CB9B.w,Y		; 99 9B CB
	ldy $DB94.w		; AC 94 DB
	ldx $EFEE.w,Y		; BE EE EF
	asl $EFEF.w		; 0E EF EF
	brk $A4.b		; 00 A4
	ora ($21.b),Y		; 11 21
	and $34.b,S		; 23 34
	eor $22.b,S		; 43 22
	xba		; EB
	beq -92.b		; F0 A4
	inc $5512.w		; EE 12 55
	eor $45.b,S		; 43 45
	and ($11.b)		; 32 11
	ora $4354C0.l		; 0F C0 54 43
	and ($0F.b,X)		; 21 0F
	sbc $CCDC.w		; ED DC CC
	cpy $BC94.w		; CC 94 BC
	dec $00DD.w,X		; DE DD 00
	sbc $1200DE.l,X		; FF DE 00 12
	sty $43.b,X		; 94 43
	and $76.b		; 25 76
	lsr $64.b		; 46 64
	ora $940301.l,X		; 1F 01 03 94
	eor $33.b,X		; 55 33
	and ($21.b,S),Y		; 33 21
	ora $F00FF0.l,X		; 1F F0 0F F0
	sty $DA.b		; 84 DA
	dex		; CA
	txs		; 9A
	sta $EDAD.w,Y		; 99 AD ED
	dec $84C9.w,X		; DE C9 84
	stz $CEDC.w		; 9C DC CE
	cpx $DE9B.w		; EC 9B DE
	cop $10.b		; 02 10
	sty $36.b		; 84 36
	eor $67.b,X		; 55 67
	mvn $20,$34		; 54 34 20
	and $54.b		; 25 54
	sty $54.b		; 84 54
	mvp $34,$33		; 44 33 34
	ora ($13.b,X)		; 01 13
	rol $84CB.w		; 2E CB 84
	ldy $BDCD.w,X		; BC CD BD
	inc $0FF0.w		; EE F0 0F
	lda $84ED.w,X		; BD ED 84
	cmp $BCED0F.l		; CF 0F ED BC
	dec $F0FF.w,X		; DE FF F0
	jsl $533584.l		; 22 84 35 53
	ora ($32.b,S),Y		; 13 32
	jsr $1F01.w		; 20 01 1F
	sbc ($74.b),Y		; F1 74
	eor $354213.l		; 4F 13 42 35
	ror $0F.b,X		; 76 0F
	tsb $74EB.w		; 0C EB 74
	sbc $4312.w,X		; FD 12 43
	sbc $0FC0FD.l,X		; FF FD C0 0F
	dec $0F84.w		; CE 84 0F
	stp		; DB
	dec $E0DE.w,X		; DE DE E0
	sbc $804313.l		; EF 13 43 80
	sbc $4512E0.l		; EF E0 12 45
	eor ($12.b,S),Y		; 53 12
	and ($0F.b,X)		; 21 0F
	stz $00.b,X		; 74 00
	trb $29.b		; 14 29
	cpy #$10.b		; C0 10
	brk $AF.b		; 00 AF
	eor ($74.b)		; 52 74
	cop $52.b		; 02 52
	bpl  62.b		; 10 3E
	bit $33.b,X		; 34 33
	.db $42, $BC		; 42 BC
	stz $99.b		; 64 99
	bne -52.b		; D0 CC
	bmi -52.b		; 30 CC
	lda ($30.b,S),Y		; B3 30
	sbc [$60.b],Y		; F7 60
	tsb $0C9C.w		; 0C 9C 0C
	stz $0000.w		; 9C 00 00
	brk $44.b		; 00 44
	stz $00.b,X		; 74 00
	lsr $0EDE.w		; 4E DE 0E
	inc $DCFE.w		; EE FE DC
	lda $1074.w,X		; BD 74 10
	sbc $7636DF.l,X		; FF DF 36 76
	jsl $74AEDB.l		; 22 DB AE 74
	and $00.b,S		; 23 00
	rol $23.b,X		; 36 23
	asl $3112.w,X		; 1E 12 31
	and $51D264.l,X		; 3F 64 D2 51
	and $26.b		; 25 26
	inc $E92E.w		; EE 2E E9
	ora ($84.b),Y		; 11 84
	sbc $EFFB23.l,X		; FF 23 FB EF
	sbc $DFDD.w		; ED DD DF
	sbc $E11274.l,X		; FF 74 12 E1
	bit $73.b		; 24 73
	jsr $CC0C.w		; 20 0C CC
	sbc $53F374.l		; EF 74 F3 53
	.db $42, $10		; 42 10
	sbc ($00.b,X)		; E1 00
	ora ($40.b,X)		; 01 40
	stz $14.b,X		; 74 14
	eor $33.b,S		; 43 33
	bpl -13.b		; 10 F3
	and $91130F.l,X		; 3F 0F 13 91
	eor $34.b,S		; 43 34
	and ($0F.b),Y		; 31 0F
	jmp.w [$AABB]		; DC BB AA
	lda $000000.l		; AF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $00		; Opcode 00 overrunning bank boundry at 0E7FFE. Skipping.
	.db $00		; Opcode 00 overrunning bank boundry at 0E7FFF. Skipping.
.ENDS
