.BANK 25 SLOT 0
.ORG $0000

.SECTION "Bank25" FORCE

	asl $00.b		; 06 00
	asl $00.b		; 06 00
	sbc ($10.b),Y		; F1 10
	inc $FF.b,X		; F6 FF
	sbc ($FF.b),Y		; F1 FF
	sed		; F8
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
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $ED.b		; 00 ED
	ora $F3.b,X		; 15 F3
	sbc $F6FFED.l,X		; FF ED FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $ED.b		; 00 ED
	sbc $01FFFE.l,X		; FF FE FF 01
	tsb $00.b		; 04 00
	brk $F5.b		; 00 F5
	sbc $02FFF3.l,X		; FF F3 FF 02
	tsb $00.b		; 04 00
	brk $F5.b		; 00 F5
	sbc $03FFFB.l,X		; FF FB FF 03
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $04FFF3.l,X		; FF F3 FF 04
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $05FFFB.l,X		; FF FB FF 05
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $F3.b		; 00 F3
	sbc $000406.l,X		; FF 06 04 00
	brk $05.b		; 00 05
	brk $FB.b		; 00 FB
	sbc $000407.l,X		; FF 07 04 00
	brk $0D.b		; 00 0D
	brk $F7.b		; 00 F7
	sbc $000408.l,X		; FF 08 04 00
	brk $15.b		; 00 15
	brk $F9.b		; 00 F9
	sbc $000409.l,X		; FF 09 04 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	bra   0.b		; 80 00
	ora ($ED.b)		; 12 ED
	ora ($80.b)		; 12 80
	bra   0.b		; 80 00
	ora $8000FF.l,X		; 1F FF 00 80
	adc $FF00FF.l,X		; 7F FF 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $80.b		; 00 80
	adc $001F00.l,X		; 7F 00 1F 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	php		; 08
	and ($21.b,X)		; 21 21
	ora $030CEF.l,X		; 1F EF 0C 03
	ora $3BC707.l		; 0F 07 C7 3B
	ora $000F07.l		; 0F 07 0F 00
	sec		; 38
	brk $E1.b		; 00 E1
	brk $0E.b		; 00 0E
	brk $30.b		; 00 30
	cpy #$00F0.w		; C0 F0 00
	jsr ($F0FC.w,X)		; FC FC F0
	brk $F3.b		; 00 F3
	ora $3B.b,S		; 03 3B
	and $17.b,S		; 23 17
	stp		; DB
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$200C.w		; E0 0C 20
	cpy $18.b		; C4 18
	cpx #$C000.w		; E0 00 C0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $940C.w		; 0C 0C 94
	ldy $A2.b,X		; B4 A2
	inc $BE62.w,X		; FE 62 BE
	trb $FEF1.w		; 1C F1 FE
	sbc $DFE2.w,X		; FD E2 DF
	cmp $F3AF.w,X		; DD AF F3
	brk $C0.b		; 00 C0
	brk $3C.b		; 00 3C
	brk $7C.b		; 00 7C
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $21.b		; 00 21
	trb $225C.w		; 1C 5C 22
	lda $F7.b		; A5 F7
	lda ($E7.b,X)		; A1 E7
	lda $DE.b,X		; B5 DE
	brk $76.b		; 00 76
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bit $2442.w,X		; 3C 42 24
	phy		; 5A
	ora $6A.b,X		; 15 6A
	brk $7E.b		; 00 7E
	brk $3C.b		; 00 3C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $1020.w		; 20 20 10
	bpl   8.b		; 10 08
	php		; 08
	brk $04.b		; 00 04
	adc $FD82.w,X		; 7D 82 FD
	cop $7D.b		; 02 7D
	.db $82, $E0, $00		; 82 E0 00
	bmi   0.b		; 30 00
	clc		; 18
	brk $0C.b		; 00 0C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $FF00.w,X		; FE 00 FF
	sbc $E00000.l,X		; FF 00 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E00000.l,X		; FF 00 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	sty $1C.b,X		; 94 1C
	ldy #$003C.w		; A0 3C 00
	rol A		; 2A
	brk $32.b		; 00 32
	brk $2E.b		; 00 2E
	brk $3C.b		; 00 3C
	jsr ($FF00.w,X)		; FC 00 FF
	brk $F7.b		; 00 F7
	php		; 08
	sbc ($1E.b,X)		; E1 1E
	cmp #$D936.w		; C9 36 D9
	rol $C9.b		; 26 C9
	rol $00.b,X		; 36 00
	bit $0000.w,X		; 3C 00 00
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
	trb $00.b		; 14 00
	trb $00.b		; 14 00
	sbc $1F.b		; E5 1F
	sbc $E5FF.w		; ED FF E5
	sbc $00FFF8.l,X		; FF F8 FF 00
	tsb $00.b		; 04 00
	brk $ED.b		; 00 ED
	sbc $01FFF8.l,X		; FF F8 FF 01
	tsb $00.b		; 04 00
	brk $F5.b		; 00 F5
	sbc $02FFF8.l,X		; FF F8 FF 02
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $03FFF8.l,X		; FF F8 FF 03
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $F8.b		; 00 F8
	sbc $000404.l,X		; FF 04 04 00
	brk $0D.b		; 00 0D
	brk $F8.b		; 00 F8
	sbc $000405.l,X		; FF 05 04 00
	brk $15.b		; 00 15
	brk $F8.b		; 00 F8
	sbc $000406.l,X		; FF 06 04 00
	brk $1D.b		; 00 1D
	brk $F8.b		; 00 F8
	sbc $000407.l,X		; FF 07 04 00
	brk $E5.b		; 00 E5
	sbc $08FFF0.l,X		; FF F0 FF 08
	tsb $00.b		; 04 00
	brk $ED.b		; 00 ED
	sbc $09FFF0.l,X		; FF F0 FF 09
	tsb $00.b		; 04 00
	brk $F5.b		; 00 F5
	sbc $0AFFF0.l,X		; FF F0 FF 0A
	tsb $00.b		; 04 00
	brk $FD.b		; 00 FD
	sbc $0BFFF0.l,X		; FF F0 FF 0B
	tsb $00.b		; 04 00
	brk $05.b		; 00 05
	brk $F0.b		; 00 F0
	sbc $00040C.l,X		; FF 0C 04 00
	brk $0D.b		; 00 0D
	brk $F0.b		; 00 F0
	sbc $00040D.l,X		; FF 0D 04 00
	brk $15.b		; 00 15
	brk $F0.b		; 00 F0
	sbc $00040E.l,X		; FF 0E 04 00
	brk $1D.b		; 00 1D
	brk $F0.b		; 00 F0
	sbc $00040F.l,X		; FF 0F 04 00
	brk $F2.b		; 00 F2
	sbc $10FFE8.l,X		; FF E8 FF 10
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $11FFE8.l,X		; FF E8 FF 11
	tsb $00.b		; 04 00
	brk $02.b		; 00 02
	brk $E8.b		; 00 E8
	sbc $000412.l,X		; FF 12 04 00
	brk $0A.b		; 00 0A
	brk $E8.b		; 00 E8
	sbc $000413.l,X		; FF 13 04 00
	brk $FF.b		; 00 FF
	ora $FF08F7.l		; 0F F7 08 FF
	sbc $08F708.l,X		; FF 08 F7 08
	ora [$04.b]		; 07 04
	ora [$02.b]		; 07 02
	ora $00.b,S		; 03 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $88.b		; 00 88
	adc [$08.b],Y		; 77 08
	ora [$04.b]		; 07 04
	ora $02.b,S		; 03 02
	ora ($00.b,X)		; 01 00
	brk $FF.b		; 00 FF
	cpy #$41BF.w		; C0 BF 41
	sbc $31FE.w,X		; FD FE 31
	sbc $00EF30.l		; EF 30 EF 00
	sbc $88FE02.l,X		; FF 02 FE 88
	sed		; F8
	sbc $00FE00.l,X		; FF 00 FE 00
	sbc $CE3100.l,X		; FF 00 31 CE
	bmi -49.b		; 30 CF
	brk $FF.b		; 00 FF
	cop $FC.b		; 02 FC
	dey		; 88
	bvs  -1.b		; 70 FF
	lda $FF47FF.l,X		; BF FF 47 FF
	eor [$FF.b]		; 47 FF
	and $008FFF.l,X		; 3F FF 8F 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	brk $38.b		; 00 38
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $DE.b		; 00 DE
	lda ($D7.b)		; B2 D7
	lda #$2015.w		; A9 15 20
	sta ($77.b,S),Y		; 93 77
	sta ($EE.b),Y		; 91 EE
	asl $EA.b		; 06 EA
	rti		; 40

	adc $5E3F21.l,X		; 7F 21 3F 5E
	and ($55.b,X)		; 21 55
	rol A		; 2A
	txy		; 9B
	stz $9D.b		; 64 9D
	rts		; 60

	txy		; 9B
	stz $0E.b		; 64 0E
	sbc ($40.b),Y		; F1 40
	and $3F1E21.l,X		; 3F 21 1E 3F
	bcc  95.b		; 90 5F
	bne  31.b		; D0 1F
	sta $40805F.l		; 8F 5F 80 40
	sta $90A040.l,X		; 9F 40 A0 90
	stz $0000.w,X		; 9E 00 00
	adc $807F80.l,X		; 7F 80 7F 80
	and $C03FC0.l,X		; 3F C0 3F C0
	and $C03FC0.l,X		; 3F C0 3F C0
	bcc  14.b		; 90 0E
	brk $00.b		; 00 00
	sbc $08FE08.l,X		; FF 08 FE 08
	inc $F8F0.w,X		; FE F0 F8
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	and $12331A.l		; 2F 1A 33 12
	adc [$1A.b],Y		; 77 1A
	and ($0C.b,S),Y		; 33 0C
	adc $7E00.w		; 6D 00 7E
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	dec $DE21.w,X		; DE 21 DE
	and ($DA.b,X)		; 21 DA
	and $9E.b		; 25 9E
	adc ($8C.b,X)		; 61 8C
	adc ($00.b,S),Y		; 73 00
	sbc $003E00.l,X		; FF 00 3E 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	and $101E1E.l,X		; 3F 1E 1E 10
	ora $0A0000.l,X		; 1F 00 00 0A
	sbc $12.b,X		; F5 12
	sbc $0000.w		; ED 00 00
	brk $00.b		; 00 00
	cpy #$9100.w		; C0 00 91
	rts		; 60

	sta $00FF60.l,X		; 9F 60 FF 00
	sbc $BFFFBF.l,X		; FF BF FF BF
	ora $03.b,S		; 03 03
	brk $00.b		; 00 00
	sta $FC.b,S		; 83 FC
	bra 127.b		; 80 7F
	adc $0000FF.l,X		; 7F FF 00 00
	sty $2473.w		; 8C 73 24
	stp		; DB
	ora $003F00.l		; 0F 00 3F 00
	brk $00.b		; 00 00
	sta ($7E.b,X)		; 81 7E
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FCFFFC.l,X		; FF FC FF FC
	bpl  22.b		; 10 16
	ora $00.b,S		; 03 00
	ora $9B.b,X		; 15 9B
	bra  96.b		; 80 60
	cmp $BF.b,S		; C3 BF
	adc $CF3F3F.l,X		; 7F 3F 3F CF
	and $0017CF.l,X		; 3F CF 17 00
	jsr ($6000.w,X)		; FC 00 60
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F0.b		; 00 F0
	beq -16.b		; F0 F0
	beq -48.b		; F0 D0
	lsr $AEA0.w,X		; 5E A0 AE
	ora $7E007F.l,X		; 1F 7F 00 7E
	sbc $F1FFFF.l,X		; FF FF FF F1
	sbc ($DF.b),Y		; F1 DF
	ldy #$3FBF.w		; A0 BF 3F
	brk $6F.b		; 00 6F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $31.b		; 00 31
	asl $1F60.w		; 0E 60 1F
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	jsr $E02B.w		; 20 2B E0
	cpx #$2CFF.w		; E0 FF 2C
	lda ($AC.b,S),Y		; B3 AC
	and $D0FF10.l,X		; 3F 10 FF D0
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpx #$1F1B.w		; E0 1B 1F
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	rti		; 40

	lda $00BF40.l,X		; BF 40 BF 00
	bra -128.b		; 80 80
	rti		; 40

	rti		; 40

	jsr $0820.w		; 20 20 08
	php		; 08
	sbc $08FF08.l,X		; FF 08 FF 08
	sbc $08FF08.l,X		; FF 08 FF 08
	cpy #$6000.w		; C0 00 60
	brk $30.b		; 00 30
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $8C.b		; 00 8C
	brk $00.b		; 00 00
	tsb $332D.w		; 0C 2D 33
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $E1.b		; 00 E1
	asl $12ED.w,X		; 1E ED 12
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cpy #$E000.w		; C0 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$1A.b]		; 07 1A
	inc A		; 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $003F00.l		; 0F 00 3F 00
	plx		; FA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	xce		; FB
	ora $F5.b		; 05 F5
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FC00.l,X		; FF 00 FC 00
	xce		; FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	jsr $0000.w		; 20 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00E000.l,X		; FF 00 E0 00
	rts		; 60

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$2020.w		; C0 20 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$E000.w		; C0 00 E0
	brk $30.b		; 00 30
	brk $08.b		; 00 08
	bra  32.b		; 80 20
	brk $DC.b		; 00 DC
	plp		; 28
	inx		; E8
	sbc $F00019.l,X		; FF 19 00 F0
	sbc $000400.l,X		; FF 00 04 00
	brk $09.b		; 00 09
	brk $E8.b		; 00 E8
	sbc $000402.l,X		; FF 02 04 00
	brk $09.b		; 00 09
	brk $F8.b		; 00 F8
	sbc $000404.l,X		; FF 04 04 00
	brk $F9.b		; 00 F9
	sbc $06FFE8.l,X		; FF E8 FF 06
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $08FFF8.l,X		; FF F8 FF 08
	tsb $00.b		; 04 00
	brk $E9.b		; 00 E9
	sbc $0AFFE8.l,X		; FF E8 FF 0A
	tsb $00.b		; 04 00
	brk $E9.b		; 00 E9
	sbc $0CFFF8.l,X		; FF F8 FF 0C
	tsb $00.b		; 04 00
	brk $D9.b		; 00 D9
	sbc $0EFFEF.l,X		; FF EF FF 0E
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	ora $B43DF9.l,X		; 1F F9 3D B4
	and $76E1.w,X		; 3D E1 76
	xba		; EB
	adc $6B67.w,Y		; 79 67 6B
	sbc $00FF00.l,X		; FF 00 FF 00
	cpx #$C300.w		; E0 00 C3
	brk $C4.b		; 00 C4
	ora $89.b,S		; 03 89
	asl $8B.b		; 06 8B
	tsb $97.b		; 04 97
	php		; 08
	cpy #$10C0.w		; C0 C0 10
	bpl   4.b		; 10 04
	cpy $22.b		; C4 22
	sbc ($11.b)		; F2 11
	sbc $7080.w,Y		; F9 80 70
	plp		; 28
	clv		; B8
	cpx $34.b		; E4 34
	brk $00.b		; 00 00
	cpx #$3800.w		; E0 00 38
	brk $2C.b		; 00 2C
	cpy #$E016.w		; C0 16 E0
	cmp $D02F30.l		; CF 30 2F D0
	sbc $18.b,S		; E3 18
	sed		; F8
	sed		; F8
	inc $07FE.w,X		; FE FE 07
	ora [$01.b]		; 07 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	ldx $0000.w,Y		; BE 00 00
	sed		; F8
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	ror $0000.w,X		; 7E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$60C0.w		; C0 C0 60
	rts		; 60

	bmi  48.b		; 30 30
	clc		; 18
	clc		; 18
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

	brk $20.b		; 00 20
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra  64.b		; 80 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	inc $7C40.w,X		; FE 40 7C
	brk $00.b		; 00 00
	cmp $1FE020.l,X		; DF 20 E0 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FE0000.l,X		; FF 00 00 FE
	rti		; 40

	bit $0000.w,X		; 3C 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0001.w,X		; FD 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	tsb $07.b		; 04 07
	sed		; F8
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $02FFFF.l,X		; FF FF FF 02
	ora $08.b,S		; 03 08
	inc $DD15.w,X		; FE 15 DD
	rol A		; 2A
	dec A		; 3A
	sty $F6.b,X		; 94 F6
	and $0000E3.l		; 2F E3 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc ($00.b),Y		; F1 00
	sbc $00.b,S		; E3 00
	dec $00.b		; C6 00
	tsb $1F02.w		; 0C 02 1F
	brk $FF.b		; 00 FF
	sbc $07FF87.l,X		; FF 87 FF 07
	cmp [$80.b]		; C7 80
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	sed		; F8
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	and $009800.l,X		; 3F 00 98 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FA.b		; 00 FA
	sbc $E0.b,X		; F5 E0
	sbc $E0.b,X		; F5 E0
	sbc $ECD2.w,X		; FD D2 EC
	ora ($FC.b,X)		; 01 FC
	cpx #$10FE.w		; E0 FE 10
	ora $0A0700.l,X		; 1F 00 07 0A
	ora $03.b		; 05 03
	tsb $0D02.w		; 0C 02 0D
	ora ($0D.b)		; 12 0D
	ora ($FE.b,X)		; 01 FE
	cpx #$101F.w		; E0 1F 10
	ora $9D0700.l		; 0F 00 07 9D
	ora $110B65.l,X		; 1F 65 0B 11
	ror $2AB9.w,X		; 7E B9 2A
	bra -89.b		; 80 A7
	cpx #$040F.w		; E0 0F 04
	jsr ($F000.w,X)		; FC 00 F0
	jsr ($9C02.w,X)		; FC 02 9C
	.db $62, $E5, $0A		; 62 E5 0A
	cmp $8906.w,Y		; D9 06 89
	ror $F0.b,X		; 76 F0
	ora $00F804.l		; 0F 04 F8 00
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $00.b,S		; 03 00
	brk $3F.b		; 00 3F
	brk $03.b		; 00 03
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $01.b		; 00 01
	ora ($07.b,X)		; 01 07
	ora [$3C.b]		; 07 3C
	bit $C5C4.w,X		; 3C C4 C5
	tsb $05.b		; 04 05
	sbc $0000FF.l,X		; FF FF 00 00
	asl $0EBF.w		; 0E BF 0E
	brk $7F.b		; 00 7F
	brk $FC.b		; 00 FC
	brk $C5.b		; 00 C5
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $70.b		; 00 70
	brk $7F.b		; 00 7F
	bra  -4.b		; 80 FC
	sbc $40DF60.l,X		; FF 60 DF 40
	lda $01FF00.l,X		; BF 00 FF 01
	sbc $88FC00.l,X		; FF 00 FC 88
	sed		; F8
	sbc $00FF00.l,X		; FF 00 FF 00
	rts		; 60

	sta $00BF40.l,X		; 9F 40 BF 00
	sbc $00FE01.l,X		; FF 01 FE 00
	jsr ($7088.w,X)		; FC 88 70
	adc $C3FFC1.l,X		; 7F C1 FF C3
	and $CF2FBF.l,X		; 3F BF 2F CF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	rol $3C00.w,X		; 3E 00 3C
	brk $40.b		; 00 40
	bra  48.b		; 80 30
	cpy #$FF00.w		; C0 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora $1F0000.l		; 0F 00 00 1F
	ora ($0D.b)		; 12 0D
	ora ($0C.b,S),Y		; 13 0C
	brk $00.b		; 00 00
	ora $0F1000.l,X		; 1F 00 10 0F
	ora ($0E.b),Y		; 11 0E
	ora $1F0000.l,X		; 1F 00 00 1F
	ora $1B1F1B.l,X		; 1F 1B 1F 1B
	ora $000000.l,X		; 1F 00 00 00
	adc $03FCF8.l,X		; 7F F8 FC 03
	sbc $FF0000.l,X		; FF 00 00 FF
	stp		; DB
	bit $98.b		; 24 98
	adc [$3F.b]		; 67 3F
	adc $8700FF.l,X		; 7F FF 00 87
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E500FF.l,X		; FF FF 00 E5
	plx		; FA
	cmp [$FA.b]		; C7 FA
	dec $EB.b		; C6 EB
	sta $D9.b,S		; 83 D9
	ora ($1E.b,X)		; 01 1E
	brk $3F.b		; 00 3F
	bpl  31.b		; 10 1F
	brk $00.b		; 00 00
	ora $0A.b,X		; 15 0A
	ora [$08.b],Y		; 17 08
	ora [$18.b]		; 07 18
	and $1C.b,S		; 23 1C
	cmp ($3E.b,X)		; C1 3E
	brk $3F.b		; 00 3F
	bpl  15.b		; 10 0F
	brk $00.b		; 00 00
	tsb $D4.b		; 04 D4
	bit $F4.b		; 24 F4
	and $35.b		; 25 35
	rol $36.b		; 26 36
	tsb $F4.b		; 04 F4
	bpl -16.b		; 10 F0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	cmp $38.b,S		; C3 38
	sbc $18.b,S		; E3 18
.INDEX 8
	sep #$18		; E2 18
	jsr $C0D8.w		; 20 D8 C0
	sec		; 38
	bpl -32.b		; 10 E0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $38FF00.l,X		; FF 00 FF 38
	cmp [$00.b]		; C7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $807F00.l,X		; FF 00 7F 80
	lda $40BF40.l,X		; BF 40 BF 40
	lda $20DF40.l,X		; BF 40 DF 20
	cmp $20DF20.l,X		; DF 20 DF 20
	php		; 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	php		; 08
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	ora $DF6F80.l		; 0F 80 6F DF
	cmp $FE3F00.l,X		; DF 00 3F FE
	inc $FDF8.w,X		; FE F8 FD
	sbc $F3F7.w,X		; FD F7 F3
	xce		; FB
	sbc $100000.l,X		; FF 00 00 10
	brk $20.b		; 00 20
	and $0100C0.l,X		; 3F C0 00 01
	brk $03.b		; 00 03
	ora $02.b		; 05 02
	ora $04.b,S		; 03 04
	ora ($FE.b,X)		; 01 FE
	ora [$F0.b],Y		; 17 F0
	sbc ($F8.b,S),Y		; F3 F8
	ora $049C.w		; 0D 9C 04
	sbc ($12.b),Y		; F1 12
	phb		; 8B
	adc ($F5.b)		; 72 F5
	brk $FE.b		; 00 FE
	inc $0F01.w,X		; FE 01 0F
	brk $07.b		; 00 07
	brk $91.b		; 00 91
	.db $62, $06, $F9		; 62 06 F9
	ora ($FC.b,X)		; 01 FC
	sbc ($0C.b,S),Y		; F3 0C
	rtl		; 6B

	sty $00.b,X		; 94 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $00.b		; 00 00
	sbc $C4E31C.l,X		; FF 1C E3 C4
	tsa		; 3B
	brk $80.b		; 00 80
	sbc $FE0180.l,X		; FF 80 01 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	sec		; 38
	and $3F3F40.l,X		; 3F 40 3F 3F
	brk $F0.b		; 00 F0
	ora $E31FE3.l,X		; 1F E3 1F E3
	ora $63BF3F.l,X		; 1F 3F BF 63
	sta [$00.b]		; 87 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	jsr ($FCFC.w,X)		; FC FC FC
	jsr ($00C0.w,X)		; FC C0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	ora $000F00.l,X		; 1F 00 0F 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $08.b		; 00 08
	ora [$01.b]		; 07 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	rti		; 40

	lda $FFFF40.l,X		; BF 40 FF FF
	rti		; 40

	lda $00FF00.l,X		; BF 00 FF 00
	ora $000704.l,X		; 1F 04 07 00
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
	lda $007F80.l,X		; BF 80 7F 00
	and $000304.l,X		; 3F 04 03 00
	ora ($0C.b,X)		; 01 0C
	bra  48.b		; 80 30
	brk $D4.b		; 00 D4
	and ($E2.b)		; 32 E2
	sbc $E2FFD4.l,X		; FF D4 FF E2
	sbc $000400.l,X		; FF 00 04 00
	brk $E4.b		; 00 E4
	sbc $02FFE2.l,X		; FF E2 FF 02
	tsb $00.b		; 04 00
	brk $F4.b		; 00 F4
	sbc $04FFE2.l,X		; FF E2 FF 04
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	brk $E2.b		; 00 E2
	sbc $000406.l,X		; FF 06 04 00
	brk $14.b		; 00 14
	brk $E2.b		; 00 E2
	sbc $000408.l,X		; FF 08 04 00
	brk $24.b		; 00 24
	brk $E2.b		; 00 E2
	sbc $00040A.l,X		; FF 0A 04 00
	brk $D4.b		; 00 D4
	sbc $0CFFF2.l,X		; FF F2 FF 0C
	tsb $00.b		; 04 00
	brk $E4.b		; 00 E4
	sbc $0EFFF2.l,X		; FF F2 FF 0E
	tsb $00.b		; 04 00
	brk $F4.b		; 00 F4
	sbc $20FFF2.l,X		; FF F2 FF 20
	tsb $00.b		; 04 00
	brk $04.b		; 00 04
	brk $F2.b		; 00 F2
	sbc $000422.l,X		; FF 22 04 00
	brk $14.b		; 00 14
	brk $F2.b		; 00 F2
	sbc $000424.l,X		; FF 24 04 00
	brk $24.b		; 00 24
	brk $F2.b		; 00 F2
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
	brk $0F.b		; 00 0F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	ora [$1D.b]		; 07 1D
	ora $7171.w,X		; 1D 71 71
	cmp ($C1.b,X)		; C1 C1
	adc $00007F.l,X		; 7F 7F 00 00
	ora $00.b,S		; 03 00
	ora $003F00.l		; 0F 00 3F 00
	sbc $F100.w,X		; FD 00 F1
	brk $C1.b		; 00 C1
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	and $80FFFF.l,X		; 3F FF FF 80
	bra   0.b		; 80 00
	ora $003E00.l,X		; 1F 00 3E 00
	sec		; 38
.ACCU 8
	sep #$E3		; E2 E3
	ora $07.b		; 05 07
	cpy #$00.b		; C0 00
	sbc $008000.l,X		; FF 00 80 00
	asl $3F01.w,X		; 1E 01 3F
	brk $3F.b		; 00 3F
	brk $1C.b		; 00 1C
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	sbc $03FBF8.l,X		; FF F8 FB 03
	ora [$15.b]		; 07 15
	ora $7242.w,X		; 1D 42 72
	ldy $30EF.w		; AC EF 30
	lda [$20.b],Y		; B7 20
	and [$00.b]		; 27 00
	brk $FC.b		; 00 FC
	brk $18.b		; 00 18
	brk $63.b		; 00 63
	brk $8E.b		; 00 8E
	brk $1F.b		; 00 1F
	brk $77.b		; 00 77
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	sbc $9EF171.l,X		; FF 71 F1 9E
	stz $8080.w,X		; 9E 80 80
	brk $80.b		; 00 80
	rti		; 40

	cpy #$00.b		; C0 00
	cpy #$20.b		; C0 20
	cpx #$00.b		; E0 00
	brk $0F.b		; 00 0F
	brk $7E.b		; 00 7E
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	beq  -2.b		; F0 FE
	inc $0F0F.w,X		; FE 0F 0F
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq   0.b		; F0 00
	tsb $0200.w		; 0C 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$E0.b		; C0 E0
	cpx #$70.b		; E0 70
	bvs  56.b		; 70 38
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

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
	brk $06.b		; 00 06
	sbc $0000.w,Y		; F9 00 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $FFFF01.l,X		; FF 01 FF FF
	rti		; 40

	cpy #$08.b		; C0 08
	and $DFEF.w,Y		; 39 EF DF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $3FC000.l,X		; FF 00 C0 3F
	sec		; 38
	ora [$30.b]		; 07 30
	cmp $01FEFE.l		; CF FE FE 01
	sbc $FF01FF.l,X		; FF FF 01 FF
	ora ($FF.b,X)		; 01 FF
	sbc $800000.l,X		; FF 00 00 80
	brk $FF.b		; 00 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $C67F80.l,X		; FF 80 7F C6
	and $0000.w,Y		; 39 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFE00.l,X		; FF 00 FE FF
	ora ($01.b,X)		; 01 01
	rti		; 40

	bcs  -1.b		; B0 FF
	inc $00FF.w,X		; FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($FE.b,X)		; 01 FE
	rti		; 40

	lda $00F807.l,X		; BF 07 F8 00
	ora $D01FEF.l		; 0F EF 1F D0
	and $707FB0.l,X		; 3F B0 7F 70
	sbc $57FFF1.l,X		; FF F1 FF 57
	adc [$FF.b]		; 67 FF
	adc $E000FF.l,X		; 7F FF 00 E0
	brk $CF.b		; 00 CF
	brk $8F.b		; 00 8F
	brk $0F.b		; 00 0F
	brk $8E.b		; 00 8E
	brk $78.b		; 00 78
	bra   0.b		; 80 00
	brk $80.b		; 00 80
	brk $07.b		; 00 07
	ora $07.b		; 05 07
	brk $C6.b		; 00 C6
	eor [$00.b]		; 47 00
	brk $00.b		; 00 00
	sbc $07FC03.l,X		; FF 03 FC 07
	brk $FF.b		; 00 FF
	brk $86.b		; 00 86
	sei		; 78
	sta [$78.b]		; 87 78
	cmp [$38.b]		; C7 38
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $0F0FDF.l		; EF DF 0F 0F
	brk $00.b		; 00 00
	jsr ($FCF3.w,X)		; FC F3 FC
	ora $03.b,S		; 03 03
	sbc $000000.l,X		; FF 00 00 00
	sbc $F049B6.l,X		; FF B6 49 F0
	brk $FF.b		; 00 FF
	brk $0C.b		; 00 0C
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $0000.w,X		; FE 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	asl $00E1.w,X		; 1E E1 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $F7FEFF.l,X		; FF FF FE F7
	sbc $10AF40.l,X		; FF 40 AF 10
	ldx $D00F.w		; AE 0F D0
	cpy #$CF.b		; C0 CF
	ora $FC000F.l		; 0F 0F 00 FC
	ora [$F8.b]		; 07 F8
	sed		; F8
	brk $1C.b		; 00 1C
	brk $41.b		; 00 41
	bra -32.b		; 80 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sbc $F27FFF.l,X		; FF FF 7F F2
	inc $FC0D.w,X		; FE 0D FC
	brk $00.b		; 00 00
	beq  14.b		; F0 0E
	ora $FDFD.w,X		; 1D FD FD
	sbc $0300.w,X		; FD 00 03
	sbc $0001FF.l,X		; FF FF 01 00
	ora $00.b,S		; 03 00
	sbc $010000.l,X		; FF 00 00 01
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	ora $FC.b,S		; 03 FC
	brk $00.b		; 00 00
	beq  55.b		; F0 37
	ora $FF00FF.l,X		; 1F FF 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FE.b		; 00 FE
	beq -41.b		; F0 D7
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $0001.w,X		; FE 01 00
	ora $FBE300.l		; 0F 00 E3 FB
	xce		; FB
	ora $900FD9.l,X		; 1F D9 0F 90
	lda [$F8.b]		; A7 F8
	sbc [$F4.b]		; E7 F4
	sbc ($B6.b,S),Y		; F3 B6
	ora $FCCA.w,Y		; 19 CA FC
	ora $FF.b,S		; 03 FF
	brk $E0.b		; 00 E0
	asl $7E.b		; 06 7E
	ora ($1E.b,X)		; 01 1E
	ora ($0F.b,X)		; 01 0F
	brk $CB.b		; 00 CB
	tsb $11.b		; 04 11
	inc $00.b		; E6 00
	sty $6210.w		; 8C 10 62
	sbc $00FFFF.l,X		; FF FF FF 00
	tyx		; BB
	jmp ($3883.w,X)		; 7C 83 38
	cmp [$00.b]		; C7 00
	sbc $8C0000.l,X		; FF 00 00 8C
	bpl -30.b		; 10 E2
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $807F80.l,X		; 7F 80 7F 80
	adc $1C1C80.l,X		; 7F 80 1C 1C
	asl $FF0E.w		; 0E 0E FF
	jsr ($00FF.w,X)		; FC FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bpl   0.b		; 10 00
	php		; 08
	brk $00.b		; 00 00
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	ora $FB.b,S		; 03 FB
	ora $FE.b,S		; 03 FE
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	rti		; 40

	lda $40BC40.l,X		; BF 40 BC 40
	ldy $B840.w,X		; BC 40 B8
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $030C.w		; 0C 0C 03
	ora $FC.b,S		; 03 FC
	jsr ($EF8F.w,X)		; FC 8F EF
	ora ($DD.b),Y		; 11 DD
	rti		; 40

	cmp $000000.l,X		; DF 00 00 00
	brk $F0.b		; 00 F0
	brk $FC.b		; 00 FC
	brk $03.b		; 00 03
	brk $1C.b		; 00 1C
	brk $31.b		; 00 31
	asl $3F40.w		; 0E 40 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	bvs 112.b		; 70 70
	clc		; 18
	clc		; 18
	cpy $C6CC.w		; CC CC C6
	dec $00.b		; C6 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $30.b		; 00 30
	brk $B8.b		; 00 B8
	brk $00.b		; 00 00
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	adc $087F00.l,X		; 7F 00 7F 08
	ora $020704.l		; 0F 04 07 02
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	adc $087F00.l,X		; 7F 00 7F 08
	ora [$04.b]		; 07 04
	ora $02.b,S		; 03 02
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $02FF01.l,X		; FF 01 FF 02
	inc $F800.w,X		; FE 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	lda $00FF00.l,X		; BF 00 FF 00
	sbc $02FE01.l,X		; FF 01 FE 02
	jsr ($F800.w,X)		; FC 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF00F3.l		; 0F F3 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00F0.w		; 0C F0 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7FFFFF.l,X		; FF FF FF 7F
	sbc $FEFF7E.l,X		; FF 7E FF FE
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	sty $D083.w		; 8C 83 D0
	eor $58A5.w		; 4D A5 58
	xce		; FB
	bcs  44.b		; B0 2C
	and [$68.b]		; 27 68
	jsl $EC3068.l		; 22 68 30 EC
	jsr $031F.w		; 20 1F 03
	bit $324D.w,X		; 3C 4D 32
	eor $B726.w,Y		; 59 26 B7
	pha		; 48
	rol $32C1.w,X		; 3E C1 32
	cmp $CC33.w		; CD 33 CC
	ora #$66.b		; 09 66
	bit #$32.b		; 89 32
	sbc $DE.b		; E5 DE
	ora ($F8.b,X)		; 01 F8
	and ($7A.b,S),Y		; 33 7A
	sta ($6B.b)		; 92 6B
	bcc  73.b		; 90 49
	stx $D9.b,Y		; 96 D9
	ora $708FF0.l		; 0F F0 8F 70
	sbc $18.b,S		; E3 18
	lda [$58.b]		; A7 58
	lda ($4C.b),Y		; B1 4C
	sbc ($0C.b),Y		; F1 0C
	cmp ($2C.b,S),Y		; D3 2C
	ora ($6C.b,S),Y		; 13 6C
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	lda $40BF40.l,X		; BF 40 BF 40
	lda $40BF40.l,X		; BF 40 BF 40
	lda $3FC040.l,X		; BF 40 C0 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $07.b,X		; F6 07
	jsr ($FC0E.w,X)		; FC 0E FC
	ora $FC0FED.l		; 0F ED 0F FC
	asl $1DD8.w,X		; 1E D8 1D
	tya		; 98
	ora $3D08.w,X		; 1D 08 3D
	clv		; B8
	rti		; 40

	lda ($40.b),Y		; B1 40
	lda ($40.b),Y		; B1 40
	lda ($40.b),Y		; B1 40
	ldy #$41.b		; A0 41
	.db $62, $81, $E2		; 62 81 E2
	ora ($C2.b,X)		; 01 C2
	ora ($1C.b,X)		; 01 1C
	adc $00.b,S		; 63 00
	cmp $795F76.l,X		; DF 76 5F 79
	lda ($50.b,S),Y		; B3 50
	ldx $AF71.w		; AE 71 AF
	eor ($B1.b,X)		; 41 B1
	pla		; 68
	cmp $9C.b,S		; C3 9C
	adc $92.b,S		; 63 92
	adc $807F.w		; 6D 7F 80
	adc $A75880.l,X		; 7F 80 58 A7
	adc $5D86.w,Y		; 79 86 5D
	ldx #$6F.b		; A2 6F
	bcc  98.b		; 90 62
.ACCU 8
	sep #$22		; E2 22
	ldx #$22.b		; A2 22
.ACCU 8
	sep #$22		; E2 22
	sep #$02		; E2 02
	sep #$02		; E2 02
	sep #$06		; E2 06
	inc $04.b		; E6 04
	cpx $5C.b		; E4 5C
	bra  28.b		; 80 1C
	cpy #$1C.b		; C0 1C
	cpy #$1C.b		; C0 1C
	cpy #$3C.b		; C0 3C
	cpy #$3C.b		; C0 3C
	cpy #$38.b		; C0 38
	cpy #$38.b		; C0 38
	cpy #$FD.b		; C0 FD
	inc $FF00.w,X		; FE 00 FF
	inc $00FF.w,X		; FE FF 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	sbc $0001FE.l,X		; FF FE 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	cpy $0C.b		; C4 0C
	cpx $03.b		; E4 03
	beq   0.b		; F0 00
	jsr ($FF00.w,X)		; FC 00 FF
	rti		; 40

	adc $000000.l,X		; 7F 00 00 00
	brk $17.b		; 00 17
	inx		; E8
	tsb $03F3.w		; 0C F3 03
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	and $000000.l,X		; 3F 00 00 00
	brk $A6.b		; 00 A6
	sbc #$44.b		; E9 44
	txs		; 9A
	bra  63.b		; 80 3F
	dey		; 88
	sei		; 78
	brk $E0.b		; 00 E0
	rti		; 40

	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $23.b		; 00 23
	jmp $809C63.l		; 5C 63 9C 80
	adc $00F008.l,X		; 7F 08 F0 00
	cpx #$40.b		; E0 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	sbc $00FE00.l,X		; FF 00 FE 00
	bit $0000.w,X		; 3C 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
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
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  27.b		; 10 1B
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	tsb $07.b		; 04 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $01.b		; E6 01
	sed		; F8
	ora [$00.b]		; 07 00
	ora [$04.b]		; 07 04
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $31.b		; 00 31
	sta $14.b,X		; 95 14
	xba		; EB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sty $FC.b		; 84 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and ($CE.b),Y		; 31 CE
	trb $00E3.w		; 1C E3 00
	sbc $84FF00.l,X		; FF 00 FF 84
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	inx		; E8
	brk $E0.b		; 00 E0
	bra -128.b		; 80 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bmi -64.b		; 30 C0
	jsr $80C0.w		; 20 C0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $13.b		; 00 13
	bra  76.b		; 80 4C
	brk $CB.b		; 00 CB
	tsa		; 3B
	jmp.w [$CBFF]		; DC FF CB
	sbc $00FFF0.l,X		; FF F0 FF 00
	tsb $00.b		; 04 00
	brk $DB.b		; 00 DB
	sbc $02FFF0.l,X		; FF F0 FF 02
	tsb $00.b		; 04 00
	brk $EB.b		; 00 EB
	sbc $04FFF0.l,X		; FF F0 FF 04
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $06FFF0.l,X		; FF F0 FF 06
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $F0.b		; 00 F0
	sbc $000408.l,X		; FF 08 04 00
	brk $1B.b		; 00 1B
	brk $F0.b		; 00 F0
	sbc $00040A.l,X		; FF 0A 04 00
	brk $2B.b		; 00 2B
	brk $F0.b		; 00 F0
	sbc $00040C.l,X		; FF 0C 04 00
	brk $3B.b		; 00 3B
	brk $F0.b		; 00 F0
	sbc $00040E.l,X		; FF 0E 04 00
	brk $CB.b		; 00 CB
	sbc $20FFE0.l,X		; FF E0 FF 20
	tsb $00.b		; 04 00
	brk $DB.b		; 00 DB
	sbc $22FFE0.l,X		; FF E0 FF 22
	tsb $00.b		; 04 00
	brk $EB.b		; 00 EB
	sbc $24FFE0.l,X		; FF E0 FF 24
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $26FFE0.l,X		; FF E0 FF 26
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $E0.b		; 00 E0
	sbc $000428.l,X		; FF 28 04 00
	brk $1B.b		; 00 1B
	brk $E0.b		; 00 E0
	sbc $00042A.l,X		; FF 2A 04 00
	brk $2B.b		; 00 2B
	brk $E0.b		; 00 E0
	sbc $00042C.l,X		; FF 2C 04 00
	brk $3B.b		; 00 3B
	brk $E0.b		; 00 E0
	sbc $00042E.l,X		; FF 2E 04 00
	brk $E9.b		; 00 E9
	sbc $40FFD0.l,X		; FF D0 FF 40
	tsb $00.b		; 04 00
	brk $F9.b		; 00 F9
	sbc $42FFD0.l,X		; FF D0 FF 42
	tsb $00.b		; 04 00
	brk $09.b		; 00 09
	brk $D0.b		; 00 D0
	sbc $000444.l,X		; FF 44 04 00
	brk $A7.b		; 00 A7
	sei		; 78
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	adc $3F00FF.l,X		; 7F FF 00 3F
	cmp [$CF.b],Y		; D7 CF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr $8E1F.w		; 20 1F 8E
	adc ($3F.b),Y		; 71 3F
	adc $FF7FC0.l,X		; 7F C0 7F FF
	rti		; 40

	lda $806040.l,X		; BF 40 60 80
	sbc $BF60FF.l,X		; FF FF 60 BF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $9F6000.l,X		; FF 00 60 9F
	trb $E0E3.w		; 1C E3 E0
	beq  31.b		; F0 1F
	beq  -1.b		; F0 FF
	bpl -17.b		; 10 EF
	bpl   0.b		; 10 00
	brk $FF.b		; 00 FF
	sbc $FFF907.l,X		; FF 07 F9 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	sed		; F8
	bit $CF.b,X		; 34 CF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $0201.w,X		; FE 01 02
	ora $F1.b,S		; 03 F1
	sbc $FBFF00.l,X		; FF 00 FF FB
	sbc ($FF.b),Y		; F1 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	sbc $1FE11F.l,X		; FF 1F E1 1F
	and $807FFF.l,X		; 3F FF 7F 80
	cmp ($FF.b,X)		; C1 FF
	sbc $FFC0C0.l,X		; FF C0 C0 FF
	sbc $FE21A0.l,X		; FF A0 21 FE
	inc $00C0.w,X		; FE C0 00
	bra   0.b		; 80 00
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	cpy #$1E.b		; C0 1E
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	inc $7EFF.w,X		; FE FF 7E
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	inc $DD27.w		; EE 27 DD
	lsr $4CFA.w		; 4E FA 4C
	lda $11.b,X		; B5 11
	ldy $FC1A.w,X		; BC 1A FC
	txy		; 9B
	jsr ($7492.w,X)		; FC 92 74
	bpl  15.b		; 10 0F
	and [$18.b]		; 27 18
	asl $4C31.w		; 0E 31 4C
	and ($19.b,S),Y		; 33 19
	ror $1F.b		; 66 1F
	rts		; 60

	ora $6E9160.l,X		; 1F 60 91 6E
	ora $1D.b,S		; 03 1D
	sbc ($E5.b),Y		; F1 E5
	sec		; 38
	sbc ($04.b,S),Y		; F3 04
	sbc $1C1F28.l,X		; FF 28 1F 1C
	cmp $041FE4.l,X		; DF E4 1F 04
	cmp $F0FC02.l,X		; DF 02 FC F0
	asl $06F9.w		; 0E F9 06
	cmp $EC32.w		; CD 32 EC
	ora ($FC.b,S),Y		; 13 FC
	ora $3C.b,S		; 03 3C
	cmp $E4.b,S		; C3 E4
	tas		; 1B
	adc $403F80.l,X		; 7F 80 3F 40
	lda $C0BFC0.l,X		; BF C0 BF C0
	lda $605F80.l,X		; BF 80 5F 60
	eor $60DF60.l,X		; 5F 60 DF 60
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	adc [$08.b],Y		; 77 08
	tda		; 7B
	tsb $7B.b		; 04 7B
	tsb $3D.b		; 04 3D
	.db $82, $3C, $83		; 82 3C 83
	and $00FF80.l,X		; 3F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($FE00.w,X)		; FC 00 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FD.b,X)		; 01 FD
	cop $03.b		; 02 03
	jsr ($00FF.w,X)		; FC FF 00
	jsr ($FC1F.w,X)		; FC 1F FC
	rol $3FF8.w,X		; 3E F8 3F
	sbc $F83D.w,Y		; F9 3D F8
	rol $3EB8.w,X		; 3E B8 3E
	clv		; B8
	tsa		; 3B
	sed		; F8
	sbc $00E0.w,Y		; F9 E0 00
	cmp ($00.b,X)		; C1 00
	cmp ($00.b,X)		; C1 00
	cmp $00.b,S		; C3 00
	rep #$01		; C2 01
	rep #$01		; C2 01
	dec $01.b		; C6 01
	tsb $03.b		; 04 03
	stz $31E3.w		; 9C E3 31
	sta $DF71.w,X		; 9D 71 DF
	ror $50B1.w,X		; 7E B1 50
	lda [$7A.b]		; A7 7A
	lda $70.b,S		; A3 70
	lda [$68.b]		; A7 68
	lda ($9E.b),Y		; B1 9E
	adc ($31.b,X)		; 61 31
	dec $807F.w		; CE 7F 80
	adc $A15E80.l,X		; 7F 80 5E A1
	ply		; 7A
	sta $7E.b		; 85 7E
	sta ($7F.b,X)		; 81 7F
	bra  32.b		; 80 20
	cpx #$90.b		; E0 90
	bne  24.b		; D0 18
	sed		; F8
	dey		; 88
	inx		; E8
	php		; 08
	pla		; 68
	php		; 08
	pla		; 68
	dey		; 88
	inx		; E8
	bit #$E9.b		; 89 E9
	and $609FC0.l,X		; 3F C0 9F 60
	sta [$60.b],Y		; 97 60
	sta [$70.b]		; 87 70
	ora [$F0.b]		; 07 F0
	ora [$F0.b]		; 07 F0
	sta [$70.b]		; 87 70
	stx $70.b		; 86 70
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	trb $0303.w		; 1C 03 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	bne  32.b		; D0 20
	cmp $004F00.l,X		; DF 00 4F 00
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A0.b		; 00 A0
	eor $405FA0.l,X		; 5F A0 5F 40
	and $010100.l,X		; 3F 00 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	asl $09.b		; 06 09
	inc $06.b,X		; F6 06
	sbc $FF00.w,Y		; F9 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	adc $103F00.l,X		; 7F 00 3F 10
	ora $09F609.l,X		; 1F 09 F6 09
	inc $06.b,X		; F6 06
	sbc $FF00.w,Y		; F9 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	and $103F00.l,X		; 3F 00 3F 10
	ora $000101.l		; 0F 01 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF07.l,X		; FF 07 FF 00
	beq  16.b		; F0 10
	beq  64.b		; F0 40
	cpy #$01.b		; C0 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$F8.b]		; 07 F8
	brk $F0.b		; 00 F0
	bpl -32.b		; 10 E0
	rti		; 40

	bra  95.b		; 80 5F
	sta $00C737.l,X		; 9F 37 C7 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $38.b		; 00 38
	cpy #$00.b		; C0 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	sbc $00FEFD.l,X		; FF FD FE 00
	sbc $FCFF00.l,X		; FF 00 FF FC
	sbc $000101.l,X		; FF 01 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	sbc $FCFF00.l,X		; FF 00 FF FC
	ora $01.b,S		; 03 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	ror $6A01.w,X		; 7E 01 6A
	asl $05FA.w		; 0E FA 05
	sbc [$01.b],Y		; F7 01
	sed		; F8
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	rti		; 40

	adc $0BE619.l,X		; 7F 19 E6 0B
	pea $F10E.w		; F4 0E F1
	ora [$F8.b]		; 07 F8
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	and $FC1700.l,X		; 3F 00 17 FC
	phd		; 0B
	bit $47.b,X		; 34 47
	inx		; E8
	sbc $000FE0.l		; EF E0 0F 00
	jsr ($FC04.w,X)		; FC 04 FC
	bpl -16.b		; 10 F0
	cpx $1B.b		; E4 1B
	jsr ($3C03.w,X)		; FC 03 3C
	cmp $F8.b,S		; C3 F8
	ora [$E0.b]		; 07 E0
	ora $04FC00.l,X		; 1F 00 FC 04
	sed		; F8
	bpl -32.b		; 10 E0
	bne  96.b		; D0 60
	bne  96.b		; D0 60
	cpy #$00.b		; C0 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $0F.b		; 00 0F
	tsb $07.b		; 04 07
	brk $00.b		; 00 00
	and $803F80.l,X		; 3F 80 3F 80
	adc $807F80.l,X		; 7F 80 7F 80
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	tsb $03.b		; 04 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F80800.l,X		; FF 00 08 F8
	jsr $00E0.w		; 20 E0 00
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	beq  32.b		; F0 20
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $38.b		; 00 38
	sbc $3F00.w,Y		; F9 00 3F
	brk $0F.b		; 00 0F
	cpx #$17.b		; E0 17
	php		; 08
	ora $000302.l		; 0F 02 03 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora $C4.b,S		; 03 C4
	ora $F8.b,S		; 03 F8
	ora [$F0.b]		; 07 F0
	ora $020708.l		; 0F 08 07 02
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $64.b		; 00 64
	wai		; CB
	bmi -104.b		; 30 98
	clc		; 18
	sbc [$00.b]		; E7 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $00FC00.l,X		; FF 00 FC 00
	brk $6F.b		; 00 6F
	bcc  56.b		; 90 38
	cmp [$1E.b]		; C7 1E
	sbc ($00.b,X)		; E1 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FC00.w,X		; FE 00 FC
	brk $00.b		; 00 00
	ora #$E9.b		; 09 E9
	txa		; 8A
	nop		; EA
	php		; 08
	inx		; E8
	jsr $40E0.w		; 20 E0 40
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	bvs -124.b		; 70 84
	bvs   0.b		; 70 00
	beq  32.b		; F0 20
	cpy #$40.b		; C0 40
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
	brk $03.b		; 00 03
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	brk $07.b		; 00 07
	brk $20.b		; 00 20
	and $000000.l,X		; 3F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $1F.b		; 00 1F
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	php		; 08
	and $23.b,S		; 23 23
	stx $1C8E.w		; 8E 8E 1C
	trb $0101.w		; 1C 01 01
	inc $0F00.w,X		; FE 00 0F
	sbc [$0A.b],Y		; F7 0A
	ora $0007.w		; 0D 07 00
	ora $007E00.l,X		; 1F 00 7E 00
	jsr ($FE00.w,X)		; FC 00 FE
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $F0.b		; 00 F0
	brk $FE.b		; 00 FE
	inc $C6C6.w,X		; FE C6 C6
	asl $06.b		; 06 06
	asl $06.b		; 06 06
	cpy #$FF.b		; C0 FF
	brk $00.b		; 00 00
	cpy #$E0.b		; C0 E0
	asl $BF.b		; 06 BF
	inc $C600.w,X		; FE 00 C6
	brk $06.b		; 00 06
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	ora $017F00.l,X		; 1F 00 7F 01
	adc $F300.w,X		; 7D 00 F3
	pla		; 68
	sbc $843E22.l		; EF 22 3E 84
	jsr ($FC1F.w,X)		; FC 1F FC
	trb $7F03.w		; 1C 03 7F
	brk $7E.b		; 00 7E
	brk $FC.b		; 00 FC
	brk $10.b		; 00 10
	brk $C1.b		; 00 C1
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	asl $3909.w		; 0E 09 39
	asl $F7.b,X		; 16 F7
	jmp $90CF.w		; 4C CF 90
	sta ($60.b,S),Y		; 93 60
	and ($F0.b,S),Y		; 33 F0
	tas		; 1B
	sta $00317F.l		; 8F 7F 31 00
	cmp [$00.b]		; C7 00
	ora $003F00.l		; 0F 00 3F 00
	adc ($00.b,S),Y		; 73 00
	sbc $10.b,S		; E3 10
	sbc ($08.b,S),Y		; F3 08
	sbc $F8F800.l,X		; FF 00 F8 F8
	trb $1C3C.w		; 1C 3C 1C
	jsr ($FE0E.w,X)		; FC 0E FE
	asl $07FE.w		; 0E FE 07
	sbc $FFFF07.l,X		; FF 07 FF FF
	sbc $2400E0.l,X		; FF E0 00 24
	brk $F0.b		; 00 F0
	brk $F2.b		; 00 F2
	brk $F8.b		; 00 F8
	brk $F9.b		; 00 F9
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	ora $B0F180.l		; 0F 80 F1 B0
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl  15.b		; 10 0F
	bra 113.b		; 80 71
	bvs  14.b		; 70 0E
	trb $0E1C.w		; 1C 1C 0E
	asl $0707.w		; 0E 07 07
	ora $03.b,S		; 03 03
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $30.b		; 00 30
	bpl   0.b		; 10 00
	php		; 08
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$E0.b		; C0 E0
	cpx #$70.b		; E0 70
	bvs  56.b		; 70 38
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	rti		; 40

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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	cop $01.b		; 02 01
	cop $3F.b		; 02 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $977BA4.l,X		; FF A4 7B 97
	sei		; 78
	sta ($7E.b,X)		; 81 7E
	sta $7C.b,S		; 83 7C
	sta $7C.b,S		; 83 7C
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	cmp [$CF.b],Y		; D7 CF
	sbc [$CF.b]		; E7 CF
	sbc $00873E.l,X		; FF 3E 87 00
	asl $FF01.w,X		; 1E 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E111EE.l,X		; FF EE 11 E1
	asl $00C1.w,X		; 1E C1 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$3F.b		; C0 3F
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	cmp ($3E.b,X)		; C1 3E
	jmp.w [$C023]		; DC 23 C0
	and $FF00FF.l,X		; 3F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FCFF03.l,X		; FF 03 FF FC
	cop $00.b		; 02 00
	inc $00FE.w,X		; FE FE 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	pea $3A0F.w		; F4 0F 3A
	cmp $FFFC00.l		; CF 00 FC FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $F5F1FB.l,X		; FF FB F1 F5
	sbc ($40.b),Y		; F1 40
	clv		; B8
	ldy #$DF.b		; A0 DF
	and $3F3F40.l,X		; 3F 40 3F 3F
	and $F8003F.l,X		; 3F 3F 00 F8
	ora $C13FE1.l,X		; 1F E1 3F C1
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	inc $FEFE.w,X		; FE FE FE
	inc $0000.w,X		; FE 00 00
	sec		; 38
	dec $E0.b		; C6 E0
	asl $FDFD.w,X		; 1E FD FD
	sbc $00FD.w,X		; FD FD 00
	ora $FF.b,S		; 03 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	cop $03.b		; 02 03
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	stx $FE.b		; 86 FE
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	inx		; E8
	sbc ($D0.b,S),Y		; F3 D0
	sbc [$7F.b],Y		; F7 7F
	bra   1.b		; 80 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	ora [$00.b]		; 07 00
	ora $17F707.l		; 0F 07 F7 17
	php		; 08
	ora $F4.b,S		; 03 F4
	beq  -5.b		; F0 FB
	jsr ($3CFD.w,X)		; FC FD 3C
	bit $F202.w		; 2C 02 F2
	cop $FE.b		; 02 FE
	sed		; F8
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $02.b		; 00 02
	ora ($32.b,X)		; 01 32
	cmp ($01.b,X)		; C1 01
	jsr ($FC01.w,X)		; FC 01 FC
	ldy #$3F.b		; A0 3F
	cpy #$00.b		; C0 00
	sbc $09FF00.l,X		; FF 00 FF 09
	beq -121.b		; F0 87
	sei		; 78
	bra 127.b		; 80 7F
	brk $7F.b		; 00 7F
	bra  64.b		; 80 40
	bra -65.b		; 80 BF
	rti		; 40

	cmp $16E820.l,X		; DF 20 E8 16
	sbc $906F10.l		; EF 10 6F 90
	adc [$88.b],Y		; 77 88
	sbc [$08.b],Y		; F7 08
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $40FF00.l,X		; FF 00 FF 40
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E00C00.l,X		; FF 00 0C E0
	cop $00.b		; 02 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($0C.b,S),Y		; 13 0C
	sbc $FE02.w,X		; FD 02 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($00.b,X)		; 01 00
	brk $07.b		; 00 07
	brk $FF.b		; 00 FF
	brk $FB.b		; 00 FB
	ora $FF.b,S		; 03 FF
	ora [$F7.b]		; 07 F7
	ora [$EE.b]		; 07 EE
	ora $FF1FFE.l		; 0F FE 1F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $E0.b		; 00 E0
	brk $0E.b		; 00 0E
	asl $03F3.w		; 0E F3 03
	brk $00.b		; 00 00
	cpx #$FF.b		; E0 FF
	stx $10E4.w		; 8E E4 10
	dec $40.b,X		; D6 40
	eor $F0BF00.l,X		; 5F 00 BF F0
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $30.b		; 00 30
	ora $803FC0.l		; 0F C0 3F 80
	adc $C00000.l,X		; 7F 00 00 C0
	cpy #$70.b		; C0 70
	bvs  12.b		; 70 0C
	tsb $C646.w		; 0C 46 C6
	lda $E3.b,S		; A3 E3
	eor ($D1.b,X)		; 41 D1
	and ($B1.b,X)		; 21 B1
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	beq   0.b		; F0 00
	sec		; 38
	brk $9C.b		; 00 9C
	brk $6E.b		; 00 6E
	bra  46.b		; 80 2E
	cpy #$00.b		; C0 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	asl $2020.w		; 0E 20 20
	sta [$87.b]		; 87 87
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $007F00.l,X		; 1F 00 7F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $008080.l,X		; FF 80 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000100.l,X		; FF 00 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	sbc $0F1F07.l,X		; FF 07 1F 0F
	adc $00CE4E.l,X		; 7F 4E CE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $81.b		; 00 81
	brk $3E.b		; 00 3E
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
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$F0.b		; C0 F0
	beq  -4.b		; F0 FC
	jsr ($0E0E.w,X)		; FC 0E 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	php		; 08
	brk $16.b		; 00 16
	bra  88.b		; 80 58
	brk $C3.b		; 00 C3
	mvp $00,$D7		; 44 D7 00
	cmp $FF.b,S		; C3 FF
	sbc $FF.b,S		; E3 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	cmp $FF.b,S		; C3 FF
	sbc ($FF.b,S),Y		; F3 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	cmp ($FF.b,S),Y		; D3 FF
	cmp $04FF.w,X		; DD FF 04
	tsb $00.b		; 04 00
	brk $D3.b		; 00 D3
	sbc $06FFED.l,X		; FF ED FF 06
	tsb $00.b		; 04 00
	brk $D3.b		; 00 D3
	sbc $08FFFD.l,X		; FF FD FF 08
	tsb $00.b		; 04 00
	brk $E3.b		; 00 E3
	sbc $0AFFD7.l,X		; FF D7 FF 0A
	tsb $00.b		; 04 00
	brk $E3.b		; 00 E3
	sbc $0CFFE7.l,X		; FF E7 FF 0C
	tsb $00.b		; 04 00
	brk $E3.b		; 00 E3
	sbc $0EFFF7.l,X		; FF F7 FF 0E
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $20FFD7.l,X		; FF D7 FF 20
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $22FFE7.l,X		; FF E7 FF 22
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $24FFF7.l,X		; FF F7 FF 24
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $D7.b		; 00 D7
	sbc $000426.l,X		; FF 26 04 00
	brk $03.b		; 00 03
	brk $E7.b		; 00 E7
	sbc $000428.l,X		; FF 28 04 00
	brk $03.b		; 00 03
	brk $F7.b		; 00 F7
	sbc $00042A.l,X		; FF 2A 04 00
	brk $13.b		; 00 13
	brk $D7.b		; 00 D7
	sbc $00042C.l,X		; FF 2C 04 00
	brk $13.b		; 00 13
	brk $E7.b		; 00 E7
	sbc $00042E.l,X		; FF 2E 04 00
	brk $13.b		; 00 13
	brk $F7.b		; 00 F7
	sbc $000440.l,X		; FF 40 04 00
	brk $23.b		; 00 23
	brk $E3.b		; 00 E3
	sbc $000442.l,X		; FF 42 04 00
	brk $23.b		; 00 23
	brk $F3.b		; 00 F3
	sbc $000444.l,X		; FF 44 04 00
	brk $33.b		; 00 33
	brk $E5.b		; 00 E5
	sbc $000446.l,X		; FF 46 04 00
	brk $33.b		; 00 33
	brk $F5.b		; 00 F5
	sbc $000448.l,X		; FF 48 04 00
	brk $43.b		; 00 43
	brk $EB.b		; 00 EB
	sbc $00044A.l,X		; FF 4A 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	ora ($60.b,X)		; 01 60
	jsr $003F.w		; 20 3F 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	adc $3FC000.l,X		; 7F 00 C0 3F
	sta ($7E.b,X)		; 81 7E
	sta ($7E.b,X)		; 81 7E
	cpx #$1F.b		; E0 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0081BF.l,X		; FF BF 81 00
	sbc $FFC000.l,X		; FF 00 C0 FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$00.b		; C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	adc $6020FF.l,X		; 7F FF 20 60
	brk $3F.b		; 00 3F
	cop $1E.b		; 02 1E
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1F6000.l,X		; FF 00 60 1F
	jsr $1E1F.w		; 20 1F 1E
	ora ($03.b,X)		; 01 03
	brk $00.b		; 00 00
	brk $DF.b		; 00 DF
	jsr $C030.w		; 20 30 C0
	sbc $0000FF.l,X		; FF FF 00 00
	bmi -33.b		; 30 DF
	bpl 104.b		; 10 68
	bpl -17.b		; 10 EF
	brk $27.b		; 00 27
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	bmi -49.b		; 30 CF
	bvc -81.b		; 50 AF
	bne  47.b		; D0 2F
	jsr $001F.w		; 20 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	cop $08.b		; 02 08
	php		; 08
	and ($23.b,X)		; 21 23
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora [$00.b]		; 07 00
	ora $7F00.w,X		; 1D 00 7F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7B.b		; 00 7B
	sty $83.b		; 84 83
	jmp ($00FF.w,X)		; 7C FF 00
	jsr ($03FE.w,X)		; FC FE 03
	inc $02FF.w,X		; FE FF 02
	sbc $0002.w,X		; FD 02 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $82.b		; 00 82
	adc $7D82.w,X		; 7D 82 7D
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	inc $FEFF.w,X		; FE FF FE
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $20.b		; 00 20
	and $081F10.l,X		; 3F 10 1F 08
	ora $000302.l		; 0F 02 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	ora $080F10.l,X		; 1F 10 0F 08
	ora [$02.b]		; 07 02
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF01.l,X		; FF 01 FF 00
	inc $FC04.w,X		; FE 04 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	tsb $F8.b		; 04 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	php		; 08
	php		; 08
	and ($23.b,X)		; 21 23
	sta [$8F.b]		; 87 8F
	asl $703E.w,X		; 1E 3E 70
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $1D.b		; 00 1D
	brk $77.b		; 00 77
	brk $DE.b		; 00 DE
	brk $70.b		; 00 70
	brk $3F.b		; 00 3F
	and $07E0E0.l,X		; 3F E0 E0 07
	ora $F8FF7F.l		; 0F 7F FF F8
	sed		; F8
	cld		; D8
	cld		; D8
	clc		; 18
	ora $1918.w,Y		; 19 18 19
	brk $00.b		; 00 00
	ora $00F700.l,X		; 1F 00 F7 00
	adc $00F800.l,X		; 7F 00 F8 00
	cld		; D8
	brk $19.b		; 00 19
	brk $19.b		; 00 19
	brk $01.b		; 00 01
	sbc ($F0.b)		; F2 F0
	sbc ($F3.b,S),Y		; F3 F3
	ora $03.b,S		; 03 03
	ora $00.b,S		; 03 00
	sbc $A1FF40.l,X		; FF 40 FF A1
	inc $FF40.w,X		; FE 40 FF
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $00.b		; 00 00
	sbc $5F1FBF.l,X		; FF BF 1F 5F
	ora $FF1FBF.l,X		; 1F BF 1F FF
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFC000.l,X		; FF 00 C0 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F8F8F8.l,X		; FF F8 F8 F8
	sed		; F8
	sed		; F8
	sed		; F8
	ora [$FB.b]		; 07 FB
	inc A		; 1A
	trb $FE01.w		; 1C 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $8080FF.l,X		; 7F FF 80 80
	brk $00.b		; 00 00
	tsb $F8.b		; 04 F8
	ora $FC03E0.l,X		; 1F E0 03 FC
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $008080.l,X		; 7F 80 80 00
	brk $00.b		; 00 00
	sta [$87.b]		; 87 87
	sbc $3FBFFF.l,X		; FF FF BF 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ldy $7B.b		; A4 7B
	sta $7A.b,X		; 95 7A
	lda $7A.b		; A5 7A
	adc $000080.l,X		; 7F 80 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	cmp [$CF.b],Y		; D7 CF
	sbc [$CF.b]		; E7 CF
	cmp [$CF.b],Y		; D7 CF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	adc ($8C.b,S),Y		; 73 8C
	beq  15.b		; F0 0F
	cmp $3C.b,S		; C3 3C
	sbc $3F1F00.l,X		; FF 00 1F 3F
	cpx #$3F.b		; E0 3F
	sbc $FF0020.l,X		; FF 20 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
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
	beq -113.b		; F0 8F
	sbc $0FF000.l,X		; FF 00 F0 0F
	ora $00FFFF.l		; 0F FF FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	clv		; B8
	eor [$70.b]		; 47 70
	ora $FF00FF.l		; 0F FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00C13E.l,X		; FF 3E C1 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $000000.l,X		; FF 00 00 00
	sbc $010001.l,X		; FF 01 00 01
	inc $FF00.w,X		; FE 00 FF
	brk $7F.b		; 00 7F
	rti		; 40

	adc $0000FF.l,X		; 7F FF 00 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FE01.w,X		; FE 01 FE
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	rti		; 40

	and $00FFFE.l,X		; 3F FE FF 00
	brk $E0.b		; 00 E0
	and $20D020.l,X		; 3F 20 D0 20
	cmp $003FC0.l,X		; DF C0 3F 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $201FE0.l,X		; FF E0 1F 20
	cmp $C0DF20.l,X		; DF 20 DF C0
	and $00FF00.l,X		; 3F 00 FF 00
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
	brk $C0.b		; 00 C0
	cpy #$1C.b		; C0 1C
	ora $E00000.l,X		; 1F 00 00 E0
	brk $FE.b		; 00 FE
	adc $024D30.l,X		; 7F 30 4D 02
	sbc $C3.b		; E5 C3
	bmi -64.b		; 30 C0
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $83.b		; 00 83
	brk $38.b		; 00 38
	cpy #$FC.b		; C0 FC
	brk $18.b		; 00 18
	tas		; 1B
	ora ($FF.b,X)		; 01 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $03.b,S		; 03 03
	rol $00FF.w,X		; 3E FF 00
	cpx #$00.b		; E0 00
	sbc $00001B.l,X		; FF 1B 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $C0.b		; 00 C0
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	ora ($02.b,X)		; 01 02
	ora $FD.b,S		; 03 FD
	ora $FF.b,S		; 03 FF
	ora [$F6.b]		; 07 F6
	asl $3E36.w		; 0E 36 3E
	asl $FFEE.w,X		; 1E EE FF
	sbc [$FF.b]		; E7 FF
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	ora ($C1.b,X)		; 01 C1
	brk $F0.b		; 00 F0
	ora ($F8.b,X)		; 01 F8
	brk $07.b		; 00 07
	sbc [$FF.b],Y		; F7 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $7B0703.l,X		; FF 03 07 7B
	adc $3B0703.l,X		; 7F 03 07 3B
	and $0008F0.l,X		; 3F F0 08 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	bra   0.b		; 80 00
	brk $F8.b		; 00 F8
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
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	sbc $F8F8FF.l,X		; FF FF F8 F8
	brk $00.b		; 00 00
	brk $7E.b		; 00 7E
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sed		; F8
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $FC0000.l,X		; FF 00 00 FC
	jsr ($0302.w,X)		; FC 02 03
	cop $05.b		; 02 05
	ora ($1E.b)		; 12 1E
	ora #$39.b		; 09 39
	rol $E7.b		; 26 E7
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	tsb $1800.w		; 0C 00 18
	brk $61.b		; 00 61
	brk $C7.b		; 00 C7
	brk $1F.b		; 00 1F
	brk $C0.b		; 00 C0
	and $FB7B.w,X		; 3D 7B FB
	sbc [$F7.b],Y		; F7 F7
	sbc [$F7.b],Y		; F7 F7
	brk $0F.b		; 00 0F
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0200FF.l,X		; FF FF 00 02
	brk $04.b		; 00 04
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	ora $0000F0.l		; 0F F0 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	sed		; F8
	sbc ($F0.b,S),Y		; F3 F0
	cmp [$C0.b]		; C7 C0
	lda $000000.l		; AF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $08.b		; 00 08
	ora [$10.b]		; 07 10
	ora $F91F00.l		; 0F 00 1F F9
	sbc $F2FEFA.l,X		; FF FA FE F2
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	sed		; F8
	sbc $020704.l,X		; FF 04 07 02
	ora $01.b,S		; 03 01
	brk $00.b		; 00 00
	ora ($02.b,X)		; 01 02
	ora ($00.b,X)		; 01 00
	sbc $F8FF00.l,X		; FF 00 FF F8
	ora [$04.b]		; 07 04
	ora $02.b,S		; 03 02
	ora ($00.b,X)		; 01 00
	cpx $19.b		; E4 19
	inc $EA11.w		; EE 11 EA
	ora $F704EB.l		; 0F EB 04 F7
	ora ($F8.b,X)		; 01 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	ora ($EE.b),Y		; 11 EE
	ora $1BE6.w,Y		; 19 E6 1B
	cpx $0F.b		; E4 0F
	beq   7.b		; F0 07
	sed		; F8
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $3F03FF.l,X		; 1F FF 03 3F
	sta $E323FF.l,X		; 9F FF 23 E3
	bit $7C3C.w,X		; 3C 3C 7C
	jmp ($AE8E.w,X)		; 7C 8E AE
	ora [$F7.b]		; 07 F7
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	ora $00FC00.l,X		; 1F 00 FC 00
	inx		; E8
	brk $B4.b		; 00 B4
	brk $FA.b		; 00 FA
	brk $FF.b		; 00 FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	ora $00E0E0.l,X		; 1F E0 E0 00
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
	brk $10.b		; 00 10
	sbc ($E4.b,S),Y		; F3 E4
	sbc $FEF8.w,X		; FD F8 FE
	inc $2FFF.w,X		; FE FF 2F
	lda [$01.b],Y		; B7 01
	sed		; F8
	brk $FE.b		; 00 FE
	bpl  14.b		; 10 0E
	ora $000300.l		; 0F 00 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	clv		; B8
	rti		; 40

	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $817E00.l,X		; FF 00 7E 81
	adc $407E81.l,X		; 7F 81 7E 40
	and $A09F60.l,X		; 3F 60 9F A0
	sta $609FE0.l,X		; 9F E0 9F 60
	sbc [$08.b],Y		; F7 08
	sbc [$08.b],Y		; F7 08
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $BB.b		; 04 BB
	mvp $62,$1D		; 44 1D 62
	eor $FE22.w,X		; 5D 22 FE
	ora ($12.b,X)		; 01 12
	eor $B63B31.l,X		; 5F 31 3B B6
	bit $230A.w		; 2C 0A 23
	pea $E0F7.w		; F4 F7 E0
	ora [$20.b]		; 07 20
	ora $E3FF01.l,X		; 1F 01 FF E3
	tsb $0CC3.w		; 0C C3 0C
	dec $09.b,X		; D6 09
	asl $FCF1.w		; 0E F1 FC
	ora $F0.b,S		; 03 F0
	ora $01FF00.l		; 0F 00 FF 01
	inc $9877.w,X		; FE 77 98
	stz $98.b,X		; 74 98
	ror $98.b,X		; 76 98
	bvc -96.b		; 50 A0
	eor $FF00A0.l,X		; 5F A0 00 FF
	sty $87.b		; 84 87
	cop $03.b		; 02 03
	and $C02FC0.l		; 2F C0 2F C0
	and $C03FC0.l		; 2F C0 3F C0
	and $FF00C0.l,X		; 3F C0 00 FF
	sty $03.b		; 84 03
	cop $01.b		; 02 01
	cpx #$E0.b		; E0 E0
	sed		; F8
	sed		; F8
	inc $1FFE.w,X		; FE FE 1F
	ora $010303.l,X		; 1F 03 03 01
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $1C.b		; 00 1C
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$E0.b		; C0 E0
	cpx #$70.b		; E0 70
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	sed		; F8
	sbc $E00F28.l,X		; FF 28 0F E0
	ora $00FF00.l		; 0F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $00FF90.l		; 4F 90 FF 00
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
	brk $E3.b		; 00 E3
	bit #$8F.b		; 89 8F
	and [$3F.b]		; 27 3F
	sty $19FC.w		; 8C FC 19
	sed		; F8
	and [$F0.b],Y		; 37 F0
	brk $00.b		; 00 00
	sbc ($0D.b),Y		; F1 0D
	jsr ($7000.w,X)		; FC 00 70
	brk $C0.b		; 00 C0
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $FE.b		; 00 FE
	ora ($00.b,X)		; 01 00
	cop $4C.b		; 02 4C
	cmp $209390.l		; CF 90 93 20
	and $60.b,S		; 23 60
	and ($F0.b,S),Y		; 33 F0
	tas		; 1B
	ora $FF00FF.l,X		; 1F FF 00 FF
	asl $FE.b		; 06 FE
	and $007300.l,X		; 3F 00 73 00
	sbc $00.b,S		; E3 00
	sbc $10.b,S		; E3 10
	sbc ($08.b,S),Y		; F3 08
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	inc $FCFF.w,X		; FE FF FC
	sbc $FDFFFD.l,X		; FF FD FF FD
	inc $0000.w,X		; FE 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ldy #$D9.b		; A0 D9
	inc $75.b		; E6 75
	lsr $5C8A.w		; 4E 8A 5C
	cmp $90.b,X		; D5 90
	pld		; 2B
	txs		; 9A
	inc $6C0A.w		; EE 0A 6C
	brk $62.b		; 00 62
	and ($1E.b,X)		; 21 1E
	and [$18.b]		; 27 18
	lsr $5C31.w		; 4E 31 5C
	and $99.b,S		; 23 99
	ror $9F.b		; 66 9F
	rts		; 60

	ora $EC13E0.l,X		; 1F E0 13 EC
	ora ($01.b,X)		; 01 01
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
	brk $FF.b		; 00 FF
	rti		; 40

	adc $000000.l,X		; 7F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $003F40.l,X		; FF 40 3F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	sbc $07FB03.l,X		; FF 03 FB 07
	sbc $02FF03.l,X		; FF 03 FF 02
	inc $FFFF.w,X		; FE FF FF
	ora $FB.b,S		; 03 FB
	phd		; 0B
	tsb $FA.b		; 04 FA
	brk $FD.b		; 00 FD
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	bra -128.b		; 80 80
	bra -122.b		; 80 86
	sta $C0.b,S		; 83 C0
	inc $FDEC.w,X		; FE EC FD
	inx		; E8
	sta $0000F0.l		; 8F F0 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $86.b		; 00 86
	ora ($00.b,X)		; 01 00
	rol $031C.w,X		; 3E 1C 03
	bpl  96.b		; 10 60
	sbc $17E010.l		; EF 10 E0 17
	sed		; F8
	sbc ($6C.b,S),Y		; F3 6C
	adc #$02.b		; 69 02
	sbc $161F15.l,X		; FF 15 1F 16
	eor $A30EE3.l		; 4F E3 0E A3
	asl A		; 0A
	beq  15.b		; F0 0F
	sed		; F8
	ora [$6C.b]		; 07 6C
	sta ($66.b,S),Y		; 93 66
	sta $08F7.w,Y		; 99 F7 08
	sbc $40BF00.l,X		; FF 00 BF 40
	tyx		; BB
	mvp $20,$9F		; 44 9F 20
	eor $F04F70.l		; 4F 70 4F F0
	ora $B02F90.l		; 0F 90 2F B0
	and [$B8.b]		; 27 B8
	and [$B8.b]		; 27 B8
	ora [$88.b]		; 07 88
	inc $3E01.w,X		; FE 01 3E
	sta ($3E.b,X)		; 81 3E
	sta ($7F.b,X)		; 81 7F
	bra  31.b		; 80 1F
	cpy #$1F.b		; C0 1F
	cpy #$1F.b		; C0 1F
	cpy #$3F.b		; C0 3F
	cpy #$02.b		; C0 02
	inc $F808.w,X		; FE 08 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $FC.b		; 02 FC
	php		; 08
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
	cpx #$00.b		; E0 00
	bit $8640.w,X		; 3C 40 86
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $3C.b		; 00 3C
	rti		; 40

	stx $00.b		; 86 00
	brk $FF.b		; 00 FF
	brk $38.b		; 00 38
	sec		; 38
	trb $0E1C.w		; 1C 1C 0E
	asl $0707.w		; 0E 07 07
	ora $03.b,S		; 03 03
	ora $03.b,S		; 03 03
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr $1000.w		; 20 00 10
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $02.b		; 00 02
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
	brk $7F.b		; 00 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra   0.b		; 80 00
	sbc $FF00FF.l,X		; FF FF 00 FF
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
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	sbc $02FE00.l,X		; FF 00 FE 02
	inc $00FF.w,X		; FE FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	cop $FC.b		; 02 FC
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$C0.b		; C0 C0
	bvs   0.b		; 70 00
	php		; 08
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $8F.b		; 00 8F
	bvs  -9.b		; 70 F7
	php		; 08
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $FC.b		; 00 FC
	brk $F3.b		; 00 F3
	ora $FF.b,S		; 03 FF
	ora $000FEF.l		; 0F EF 0F 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	ora ($FD.b,X)		; 01 FD
	ora ($FD.b,X)		; 01 FD
	ora ($F9.b,X)		; 01 F9
	ora ($E7.b,X)		; 01 E7
	ora [$00.b]		; 07 00
	ora [$01.b]		; 07 01
	ora ($00.b,X)		; 01 00
	brk $FA.b		; 00 FA
	tsb $F6.b		; 04 F6
	php		; 08
	asl $FEF0.w		; 0E F0 FE
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	xce		; FB
	cpx #$FB.b		; E0 FB
	cpx #$FF.b		; E0 FF
	inx		; E8
	sbc $E0F7E0.l,X		; FF E0 F7 E0
	sbc [$00.b],Y		; F7 00
	sbc $082F00.l		; EF 00 2F 08
	ora [$08.b]		; 07 08
	ora [$08.b]		; 07 08
	ora [$08.b]		; 07 08
	ora [$00.b]		; 07 00
	ora $100F00.l		; 0F 00 0F 10
	ora $1E1FE0.l		; 0F E0 1F 1E
	asl $03E3.w,X		; 1E E3 03
	brk $00.b		; 00 00
	jsr ($C0FC.w,X)		; FC FC C0
	sbc $00EC1E.l,X		; FF 1E EC 00
	ldx $BF80.w		; AE 80 BF
	cpx #$00.b		; E0 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $1F.b		; 00 1F
	brk $60.b		; 00 60
	ora $007F80.l,X		; 1F 80 7F 00
	brk $C0.b		; 00 C0
	cpy #$60.b		; C0 60
	rts		; 60

	sec		; 38
	sec		; 38
	asl $030E.w		; 0E 0E 03
	cmp $A1.b,S		; C3 A1
	lda ($00.b,X)		; A1 00
	bne   0.b		; D0 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $3C.b		; 00 3C
	brk $DE.b		; 00 DE
	brk $2F.b		; 00 2F
	cpy #$C0.b		; C0 C0
	adc $D36090.l		; 6F 90 60 D3
	rts		; 60

	iny		; C8
	lda $40.b,X		; B5 40
	bit $14.b,X		; 34 14
	wai		; CB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	plx		; FA
	ora $9E.b		; 05 9E
	adc ($DF.b,X)		; 61 DF
	jsr $22DD.w		; 20 DD 22
	bvs -113.b		; 70 8F
	asl $00E1.w,X		; 1E E1 00
	sbc $84FF00.l,X		; FF 00 FF 84
	cpx $EC84.w		; EC 84 EC
	cpy $EC.b		; C4 EC
	tsb $AC.b		; 04 AC
	sta $ED.b		; 85 ED
	tsb $EC.b		; 04 EC
	jsr $00E0.w		; 20 E0 00
	cpy #$CB.b		; C0 CB
	bmi -53.b		; 30 CB
	bmi -53.b		; 30 CB
	bmi -117.b		; 30 8B
	bvs -118.b		; 70 8A
	bvs   8.b		; 70 08
	beq  32.b		; F0 20
	cpy #$00.b		; C0 00
	cpy #$80.b		; C0 80
	bra  64.b		; 80 40
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
	tsb $FC.b		; 04 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sbc $00FE00.l,X		; FF 00 FE 00
	xce		; FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $FB.b		; 04 FB
	tsb $DE.b		; 04 DE
	ora $F83EB8.l,X		; 1F B8 3E F8
	adc $7DF1.w,X		; 7D F1 7D
	bvs 122.b		; 70 7A
	sbc ($FB.b)		; F2 FB
	beq  -3.b		; F0 FD
	pea $E0F7.w		; F4 F7 E0
	brk $C1.b		; 00 C1
	brk $83.b		; 00 83
	brk $83.b		; 00 83
	brk $86.b		; 00 86
	ora ($06.b,X)		; 01 06
	ora ($04.b,X)		; 01 04
	ora $0C.b,S		; 03 0C
	ora $FF.b,S		; 03 FF
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
	brk $80.b		; 00 80
	eor $103F20.l,X		; 5F 20 3F 10
	ora $020F08.l,X		; 1F 08 0F 02
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	and $101F20.l,X		; 3F 20 1F 10
	ora $020708.l		; 0F 08 07 02
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $32C31C.l,X		; 7F 1C C3 32
	sta $E53941.l,X		; 9F 41 39 E5
	lda $8061DA.l,X		; BF DA 61 80
	adc $0067D2.l		; 6F D2 67 00
	sbc $33E11E.l,X		; FF 1E E1 33
	cpy $9E61.w		; CC 61 9E
	sbc $20DF00.l,X		; FF 00 DF 20
	txs		; 9A
	adc $F2.b		; 65 F2
	ora $F828.w		; 0D 28 F8
	jsr $10E8.w		; 20 E8 10
	cld		; D8
	bcc -40.b		; 90 D8
	trb $BC.b		; 14 BC
	cpy $E4.b		; C4 E4
	tsb $6C.b		; 04 6C
	tsb $6C.b		; 04 6C
	and [$C0.b]		; 27 C0
	and [$C0.b],Y		; 37 C0
	ora [$E0.b],Y		; 17 E0
	sta [$60.b],Y		; 97 60
	sta ($60.b,S),Y		; 93 60
	wai		; CB
	bmi  75.b		; 30 4B
	bcs  75.b		; B0 4B
	bcs   0.b		; B0 00
	sbc $04FF01.l,X		; FF 01 FF 04
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	tsb $F8.b		; 04 F8
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
	brk $40.b		; 00 40
	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	rti		; 40

	brk $00.b		; 00 00
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $00.b		; 00 00
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
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $06.b		; 00 06
	ora $F8.b		; 05 F8
	sbc $F8FFFA.l,X		; FF FA FF F8
	sbc $000400.l,X		; FF 00 04 00
	brk $02.b		; 00 02
	brk $F8.b		; 00 F8
	sbc $000401.l,X		; FF 01 04 00
	brk $02.b		; 00 02
	brk $18.b		; 00 18
	clc		; 18
	brk $20.b		; 00 20
	ora $080BC0.l,X		; 1F C0 0B 08
	bcc -128.b		; 90 80
	brk $F9.b		; 00 F9
	brk $E0.b		; 00 E0
	ora $003800.l,X		; 1F 00 38 00
	sbc $DF3F00.l,X		; FF 00 3F DF
	sbc $6F9000.l,X		; FF 00 90 6F
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	rti		; 40

	brk $80.b		; 00 80
	bpl -96.b		; 10 A0
	bcs -112.b		; B0 90
	bcc   0.b		; 90 00
	bcs   0.b		; B0 00
	bvs -64.b		; 70 C0
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	jsr $90E0.w		; 20 E0 90
	cpx #$10.b		; E0 10
	bcc  96.b		; 90 60
	brk $F0.b		; 00 F0
	brk $70.b		; 00 70
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sed		; F8
	asl $F6.b		; 06 F6
	sbc $F6FFF8.l,X		; FF F8 FF F6
	sbc $000400.l,X		; FF 00 04 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	sbc $000401.l,X		; FF 01 04 00
	brk $F8.b		; 00 F8
	sbc $02FFFE.l,X		; FF FE FF 02
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc $000403.l,X		; FF 03 04 00
	brk $10.b		; 00 10
	ora $3C0E1E.l		; 0F 1E 0E 3C
	bit $A190.w,X		; 3C 90 A1
	asl $FFD1.w		; 0E D1 FF
	bra -59.b		; 80 C5
	cpy $88.b		; C4 88
	bra  31.b		; 80 1F
	brk $1E.b		; 00 1E
	brk $03.b		; 00 03
	brk $7F.b		; 00 7F
	brk $2E.b		; 00 2E
	cmp $3F007F.l,X		; DF 7F 00 3F
	brk $88.b		; 00 88
	adc [$00.b],Y		; 77 00
	cpx #$60.b		; E0 60
	pla		; 68
	bit $1A3C.w,X		; 3C 3C 1A
	cop $F0.b		; 02 F0
	cop $FE.b		; 02 FE
	cop $E4.b		; 02 E4
	rol $22.b		; 26 22
	jsl $7800F0.l		; 22 F0 00 78
	brk $C0.b		; 00 C0
	brk $F8.b		; 00 F8
	tsb $FC.b		; 04 FC
	sbc ($FC.b)		; F2 FC
	brk $FC.b		; 00 FC
	cop $22.b		; 02 22
	jmp.w [$EC00]		; DC 00 EC
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
	brk $76.b		; 00 76
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
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
	brk $07.b		; 00 07
	brk $FB.b		; 00 FB
	sbc $000405.l,X		; FF 05 04 00
	brk $0B.b		; 00 0B
	brk $06.b		; 00 06
	asl $37.b,X		; 16 37
	jsr $7E7E.w		; 20 7E 7E
	bcc -90.b		; 90 A6
	phd		; 0B
	ora #$0D.b		; 09 0D
	sbc ($FF.b)		; F2 FF
	sbc $000F.w,Y		; F9 0F 00
	asl $3F00.w,X		; 1E 00 3F
	brk $01.b		; 00 01
	brk $79.b		; 00 79
	asl $F6.b		; 06 F6
	cop $7F.b		; 02 7F
	sbc $9A0006.l		; EF 06 00 9A
	brk $6F.b		; 00 6F
	adc $01FE.w		; 6D FE 01
	ora $39020F.l		; 0F 0F 02 39
	lsr $C6.b		; 46 C6
	pla		; 68
	sta [$FF.b],Y		; 97 FF
	sbc $6F00FE.l,X		; FF FE 00 6F
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $C7.b		; 00 C7
	sec		; 38
	and $FF80.w,Y		; 39 80 FF
	sbc $0010.w,X		; FD 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	rti		; 40

	cpy #$00.b		; C0 00
	brk $60.b		; 00 60
	ldy #$C0.b		; A0 C0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	cpy #$00.b		; C0 00
	jsr $C646.w		; 20 46 C6
	bra -128.b		; 80 80
	bra -118.b		; 80 8A
	php		; 08
	inc $E0A0.w		; EE A0 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $7F8080.l,X		; 7F 80 80 7F
	sty $7B.b		; 84 7B
	php		; 08
	inc $A0.b		; E6 A0
	rti		; 40

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx $001C.w		; EC 1C 00
	brk $00.b		; 00 00
	php		; 08
	bpl  29.b		; 10 1D
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	tsb $FB.b		; 04 FB
	bpl  13.b		; 10 0D
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$E0.b		; C0 E0
	rts		; 60

	rts		; 60

	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  32.b		; 80 20
	rti		; 40

	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	cpx #$20.b		; E0 20
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	brk $0A.b		; 00 0A
	brk $F3.b		; 00 F3
	ora $FFED.w		; 0D ED FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc $00FF.w		; ED FF 00
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $01FFED.l,X		; FF ED FF 01
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $ED.b		; 00 ED
	sbc $000402.l,X		; FF 02 04 00
	brk $0B.b		; 00 0B
	brk $ED.b		; 00 ED
	sbc $000403.l,X		; FF 03 04 00
	brk $F3.b		; 00 F3
	sbc $04FFF5.l,X		; FF F5 FF 04
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $05FFF5.l,X		; FF F5 FF 05
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $F5.b		; 00 F5
	sbc $000406.l,X		; FF 06 04 00
	brk $0B.b		; 00 0B
	brk $F5.b		; 00 F5
	sbc $000407.l,X		; FF 07 04 00
	brk $F3.b		; 00 F3
	sbc $08FFFD.l,X		; FF FD FF 08
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $09FFFD.l,X		; FF FD FF 09
	tsb $00.b		; 04 00
	brk $06.b		; 00 06
	brk $FD.b		; 00 FD
	sbc $004408.l,X		; FF 08 44 00
	brk $FE.b		; 00 FE
	sbc $09FFFD.l,X		; FF FD FF 09
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	ora ($0D.b,X)		; 01 0D
	ora #$05.b		; 09 05
	ora #$04.b		; 09 04
	php		; 08
	bvs 112.b		; 70 70
	pei ($C9.b)		; D4 C9
	ldy #$BF.b		; A0 BF
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	ora $000F00.l		; 0F 00 0F 00
	ora $000F00.l		; 0F 00 0F 00
	rol $5F01.w,X		; 3E 01 5F
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	sbc $67E101.l,X		; FF 01 E1 67
	sbc [$00.b]		; E7 00
	brk $7F.b		; 00 7F
	adc $C80000.l,X		; 7F 00 00 C8
	sbc $FF00F8.l,X		; FF F8 00 FF
	brk $E1.b		; 00 E1
	brk $E7.b		; 00 E7
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $180037.l,X		; FF 37 00 18
	brk $F4.b		; 00 F4
	beq -74.b		; F0 B6
	lda ($64.b)		; B2 64
	sbc ($05.b)		; F2 05
	ora $E0.b,S		; 03 E0
	cpx #$01.b		; E0 01
	ora $22.b,S		; 03 22
	sbc $FC00FC.l,X		; FF FC 00 FC
	brk $BE.b		; 00 BE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $4F.b		; 00 4F
	bcs -35.b		; B0 DD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	cpy #$60.b		; C0 60
	rts		; 60

	jsr $00A0.w		; 20 A0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $02.b		; 00 02
	cop $42.b		; 02 42
	lda $956A.w,X		; BD 6A 95
	adc $8F7F80.l,X		; 7F 80 7F 8F
	sbc $FD803F.l,X		; FF 3F 80 FD
	sta ($82.b,X)		; 81 82
	sbc $7F00.w,X		; FD 00 7F
	xce		; FB
	adc $807FFB.l,X		; 7F FB 7F 80
	adc $00FF80.l,X		; 7F 80 FF 00
	bra 127.b		; 80 7F
	sta ($7E.b,X)		; 81 7E
	.db $62, $2A, $13		; 62 2A 13
	cpx $08F7.w		; EC F7 08
	cmp $07F83F.l,X		; DF 3F F8 07
	bra -64.b		; 80 C0
	brk $BF.b		; 00 BF
	bra -64.b		; 80 C0
	cmp $48.b,X		; D5 48
	sbc $1EFFFF.l,X		; FF FF FF 1E
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$3F.b		; C0 3F
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	bne  84.b		; D0 54
	php		; 08
	sbc [$C9.b],Y		; F7 C9
	ldx $7F.b,Y		; B6 7F
	bra  -1.b		; 80 FF
	lsr $FFCF.w		; 4E CF FF
	brk $F7.b		; 00 F7
	bmi  40.b		; 30 28
	plb		; AB
	bra  -1.b		; 80 FF
	xce		; FB
	adc $00FF3B.l,X		; 7F 3B FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	bmi -49.b		; 30 CF
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	bra  96.b		; 80 60
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	bra -96.b		; 80 A0
	brk $C0.b		; 00 C0
	jsr $E020.w		; 20 20 E0
	brk $C0.b		; 00 C0
	cpx #$C0.b		; E0 C0
	cpx #$C0.b		; E0 C0
	jsr $20C0.w		; 20 C0 20
	cpy #$20.b		; C0 20
	jsr $20C0.w		; 20 C0 20
	cpy #$00.b		; C0 00
	sbc $00F800.l,X		; FF 00 F8 00
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
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
	ora $80.b		; 05 80
	trb $00.b		; 14 00
	sbc $FFE811.l		; EF 11 E8 FF
	sbc $FFF0FF.l		; EF FF F0 FF
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $FFF0FF.l,X		; FF FF F0 FF
	cop $04.b		; 02 04
	brk $00.b		; 00 00
	ora $FFF000.l		; 0F 00 F0 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	sbc ($FF.b),Y		; F1 FF
	cpx #$FF.b		; E0 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cpx #$FF.b		; E0 FF
	php		; 08
	tsb $00.b		; 04 00
	brk $68.b		; 00 68
	.db $62, $C3, $DC		; 62 C3 DC
	bne -33.b		; D0 DF
	brk $F3.b		; 00 F3
	cpy #$BF.b		; C0 BF
	cpy #$AD.b		; C0 AD
	adc $E07FFF.l,X		; 7F FF 7F E0
	tas		; 1B
	tsb $3F.b		; 04 3F
	brk $20.b		; 00 20
	brk $0C.b		; 00 0C
	sbc ($7F.b,S),Y		; F3 7F
	jmp ($7E7F.w,X)		; 7C 7F 7E
	brk $80.b		; 00 80
	ora $400080.l,X		; 1F 80 00 40
	bra   1.b		; 80 01
	brk $E6.b		; 00 E6
	adc $44BB80.l,X		; 7F 80 BB 44
	ldy $FF48.w,X		; BC 48 FF
	cmp [$F8.b]		; C7 F8
	ora $FF7F80.l		; 0F 80 7F FF
	brk $19.b		; 00 19
	brk $7F.b		; 00 7F
	sbc $F7FFFF.l,X		; FF FF FF F7
	cmp $3C.b,S		; C3 3C
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	inc $3D.b,X		; F6 3D
.ACCU 16
	rep #$E9		; C2 E9
	asl $0F.b,X		; 16 0F
	stz $FF.b,X		; 74 FF
	sbc $FE03.w,X		; FD 03 FE
	cop $FD.b		; 02 FD
	sbc $006B00.l,X		; FF 00 6B 00
	and $FFFF.w,X		; 3D FF FF
	sbc $0EF1FB.l,X		; FF FB F1 0E
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	pha		; 48
	sec		; 38
	ora [$01.b]		; 07 01
	xce		; FB
	ldy #$50.b		; A0 50
	jsr $20DF.w		; 20 DF 20
	stz $FFFF.w,X		; 9E FF FF
	inc $3B00.w,X		; FE 00 3B
	cpy $FF.b		; C4 FF
	brk $04.b		; 00 04
	brk $AF.b		; 00 AF
	beq  -1.b		; F0 FF
	sbc $00E7FF.l		; EF FF E7 00
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	cpy #$60.b		; C0 60
	rts		; 60

	rts		; 60

	rts		; 60

	brk $E0.b		; 00 E0
	rts		; 60

	ldy #$60.b		; A0 60
	ldy #$C0.b		; A0 C0
	cpx #$C0.b		; E0 C0
	cpx #$00.b		; E0 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	cpx #$C0.b		; E0 C0
	cpy #$C0.b		; C0 C0
	cpy #$00.b		; C0 00
	jsr $2000.w		; 20 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	sed		; F8
	cmp $FF80DF.l,X		; DF DF 80 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $78.b		; 00 78
	ora $003FC0.l,X		; 1F C0 3F 00
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	and $E038.w,Y		; 39 38 E0
	sed		; F8
	brk $7F.b		; 00 7F
	rts		; 60

	sbc [$60.b],Y		; F7 60
	sbc $00FC00.l,X		; FF 00 FC 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora [$00.b]		; 07 00
	sbc $609F60.l,X		; FF 60 9F 60
	sta $00FF00.l,X		; 9F 00 FF 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $06.b,S		; 03 06
	ora [$00.b]		; 07 00
	sbc $00FD00.l,X		; FF 00 FD 00
	sbc $000700.l,X		; FF 00 07 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	sed		; F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $C3.b,S		; C3 C3
	and $DF00FF.l,X		; 3F FF 00 DF
	cpy #$DF.b		; C0 DF
	cpy #$FF.b		; C0 FF
	brk $E7.b		; 00 E7
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	bra -32.b		; 80 E0
	cpy #$E0.b		; C0 E0
	rti		; 40

	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpy #$00.b		; C0 00
	rts		; 60

	brk $20.b		; 00 20
	rts		; 60

	bra  32.b		; 80 20
	cpy #$00.b		; C0 00
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
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	ora ($05.b,X)		; 01 05
	ora #$1915.w		; 09 15 19
	ora $2C10.w,X		; 1D 10 2C
	bmi -32.b		; 30 E0
	cpx #$03.b		; E0 03
	brk $07.b		; 00 07
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	brk $FF.b		; 00 FF
	sbc $E8F5F5.l,X		; FF F5 F5 E8
	inx		; E8
	sbc $000000.l,X		; FF 00 00 00
	adc $00E07F.l,X		; 7F 7F E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00.b,X		; F5 00
	inx		; E8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	brk $FF.b		; 00 FF
	sbc $1F3737.l,X		; FF 37 37 1F
	ora $0000FF.l,X		; 1F FF 00 00
	brk $FE.b		; 00 FE
	inc $0003.w,X		; FE 03 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and [$00.b],Y		; 37 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $000100.l,X		; FF 00 01 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	rti		; 40

	brk $40.b		; 00 40
	jsr $3050.w		; 20 50 30
	bvs  16.b		; 70 10
	pla		; 68
	clc		; 18
	asl $800E.w		; 0E 0E 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $06.b		; 00 06
	bra  24.b		; 80 18
	brk $EB.b		; 00 EB
	asl $E2.b,X		; 16 E2
	sbc $E2FFEB.l,X		; FF EB FF E2
	sbc $000400.l,X		; FF 00 04 00
	brk $FB.b		; 00 FB
	sbc $02FFE2.l,X		; FF E2 FF 02
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $E2.b		; 00 E2
	sbc $000404.l,X		; FF 04 04 00
	brk $EB.b		; 00 EB
	sbc $06FFF2.l,X		; FF F2 FF 06
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $08FFF2.l,X		; FF F2 FF 08
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $F2.b		; 00 F2
	sbc $00040A.l,X		; FF 0A 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	ora ($02.b,X)		; 01 02
	ora $02.b,S		; 03 02
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $71.b		; 00 71
	brk $40.b		; 00 40
	ora $4F8242.l		; 0F 42 82 4F
	sta $CF8F47.l		; 8F 47 8F CF
	brk $C0.b		; 00 C0
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $F2.b		; 00 F2
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	sbc $927F7F.l,X		; FF 7F 7F 92
	sta ($ED.b)		; 92 ED
	sbc $00FF.w		; ED FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $009200.l,X		; 7F 00 92 00
	sbc $FF00.w		; ED 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	sbc $EFBBBB.l,X		; FF BB BB EF
	sbc $FF3F3F.l		; EF 3F 3F FF
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $BB.b		; 00 BB
	brk $EF.b		; 00 EF
	brk $3F.b		; 00 3F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	bpl  40.b		; 10 28
	clc		; 18
	jsr $3418.w		; 20 18 34
	tsb $0C34.w		; 0C 34 0C
	bra   0.b		; 80 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	sed		; F8
	brk $F8.b		; 00 F8
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
	brk $A0.b		; 00 A0
	dec $9F.b,X		; D6 9F
	cpy #$2F.b		; C0 2F
	cpy #$2F.b		; C0 2F
	cpy #$3C.b		; C0 3C
	jmp.w [$5FFF]		; DC FF 5F
	cpx #$E0.b		; E0 E0
	cpy #$C0.b		; C0 C0
	and $003F7F.l,X		; 3F 7F 3F 00
	ora $C01FC0.l,X		; 1F C0 1F C0
	ora $001FC0.l,X		; 1F C0 1F 00
	rts		; 60

	ora $3F3FC0.l,X		; 1F C0 3F 3F
	rti		; 40

	sbc $00FF06.l,X		; FF 06 FF 00
	sbc $070700.l,X		; FF 00 07 07
	jsr ($00FF.w,X)		; FC FF 00
	brk $0C.b		; 00 0C
	brk $FF.b		; 00 FF
	clv		; B8
	sbc $FF00.w,Y		; F9 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $C1F30C.l,X		; FF 0C F3 C1
	asl A		; 0A
	sbc $FFFF80.l,X		; FF 80 FF FF
	sty $FB.b		; 84 FB
	ora $800000.l,X		; 1F 00 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $007F3F.l,X		; FF 3F 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7F8000.l,X		; FF 00 80 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	pea $FF3A.w		; F4 3A FF
	cli		; 58
	cmp $F01FF0.l,X		; DF F0 1F F0
	sbc $3F301F.l		; EF 1F 30 3F
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	cmp $00A70F.l		; CF 0F A7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C03F00.l,X		; FF 00 3F C0
	brk $FF.b		; 00 FF
	ora $FC.b,S		; 03 FC
	bra  56.b		; 80 38
	sbc $00FE00.l,X		; FF 00 FE 00
	inc $0700.w,X		; FE 00 07
	ora [$FF.b]		; 07 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	cmp $FF00FF.l		; CF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $50FF00.l,X		; FF 00 FF 50
	bcs  48.b		; B0 30
	bvs -112.b		; 70 90
	bvs -128.b		; 70 80
	bvs -128.b		; 70 80
	bvs -128.b		; 70 80
	bvs -16.b		; 70 F0
	beq  96.b		; F0 60
	bvs -64.b		; 70 C0
	cpx #$80.b		; E0 80
	brk $00.b		; 00 00
	jsr $3000.w		; 20 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	cpy #$00.b		; C0 00
	rts		; 60

	bra   0.b		; 80 00
	ora $363C0C.l,X		; 1F 0C 3C 36
	adc ($01.b,S),Y		; 73 01
	dec $DF50.w,X		; DE 50 DF
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	ldy #$DF.b		; A0 DF
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $002F00.l		; 0F 00 2F 00
	and [$00.b]		; 27 00
	sbc $F80700.l,X		; FF 00 07 F8
	and $FC037F.l,X		; 3F 7F 03 FC
	ora ($02.b,X)		; 01 02
	brk $80.b		; 00 80
	beq   0.b		; F0 00
	brk $FF.b		; 00 FF
	ora $60.b,S		; 03 60
	ora $C13EE0.l,X		; 1F E0 3E C1
	brk $00.b		; 00 00
	jsr ($F000.w,X)		; FC 00 F0
	ora $F800FF.l		; 0F FF 00 F8
	brk $9F.b		; 00 9F
	ora $1F.b,S		; 03 1F
	sbc $003FFF.l,X		; FF FF 3F 00
	bra   0.b		; 80 00
	sbc $000000.l,X		; FF 00 00 00
	clc		; 18
	brk $FF.b		; 00 FF
	brk $5B.b		; 00 5B
	sbc $F306.w,Y		; F9 06 F3
	tsb $007F.w		; 0C 7F 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00E700.l,X		; FF 00 E7 00
	ldy $18.b		; A4 18
	sbc $FFFF.w,Y		; F9 FF FF
	sbc $040700.l,X		; FF 00 07 04
	plx		; FA
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	jsr $F601.w		; 20 01 F6
	ora #$3BC4.w		; 09 C4 3B
	sed		; F8
	brk $01.b		; 00 01
	brk $18.b		; 00 18
	sbc [$FF.b]		; E7 FF
	brk $FB.b		; 00 FB
	brk $FE.b		; 00 FE
	jsr $FFF6.w		; 20 F6 FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	ora $03.b,S		; 03 03
	asl $1C.b		; 06 1C
	sed		; F8
	ora $00.b		; 05 00
	sbc $6000.w,X		; FD 00 60
	brk $E0.b		; 00 E0
	bra 127.b		; 80 7F
	brk $00.b		; 00 00
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FD.b		; 00 FD
	cop $F6.b		; 02 F6
	brk $9F.b		; 00 9F
	brk $1F.b		; 00 1F
	cpx #$FF.b		; E0 FF
	sta $000000.l,X		; 9F 00 00 00
	cpy #$C0.b		; C0 C0
	cpx #$00.b		; E0 00
	bmi  32.b		; 30 20
	bmi   0.b		; 30 00
	brk $00.b		; 00 00
	beq  80.b		; F0 50
	bcs   0.b		; B0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	beq -64.b		; F0 C0
	cpx #$00.b		; E0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	.db $82, $FE, $00		; 82 FE 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FE00.l,X		; FF 00 FE 00
	inc $7C82.w,X		; FE 82 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $0CAD.w,X		; 1E AD 0C
	sbc $203F00.l,X		; FF 00 3F 20
	and $000000.l		; 2F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1E.b		; 00 1E
	sbc ($0C.b,X)		; E1 0C
	sbc ($00.b,S),Y		; F3 00
	sbc $001F20.l,X		; FF 20 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000080.l,X		; FF 80 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	xce		; FB
	ora $FF.b,S		; 03 FF
	brk $3F.b		; 00 3F
	bmi  63.b		; 30 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora [$F8.b]		; 07 F8
	ora $FC.b,S		; 03 FC
	brk $FF.b		; 00 FF
	bmi  15.b		; 30 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  63.b		; 80 3F
	brk $FF.b		; 00 FF
	brk $8F.b		; 00 8F
	cpy #$CF.b		; C0 CF
	brk $0F.b		; 00 0F
	php		; 08
	ora $000000.l		; 0F 00 00 00
	brk $80.b		; 00 80
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $000FC0.l,X		; FF C0 0F 00
	ora $000708.l		; 0F 08 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq  16.b		; F0 10
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq  16.b		; F0 10
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	brk $0A.b		; 00 0A
	bra  40.b		; 80 28
	brk $E7.b		; 00 E7
	ora $FFDC.w,Y		; 19 DC FF
	asl A		; 0A
	brk $DC.b		; 00 DC
	sbc $000400.l,X		; FF 00 04 00
	brk $0A.b		; 00 0A
	brk $EC.b		; 00 EC
	sbc $000402.l,X		; FF 02 04 00
	brk $0A.b		; 00 0A
	brk $FC.b		; 00 FC
	sbc $000404.l,X		; FF 04 04 00
	brk $FA.b		; 00 FA
	sbc $06FFDD.l,X		; FF DD FF 06
	tsb $00.b		; 04 00
	brk $FA.b		; 00 FA
	sbc $08FFED.l,X		; FF ED FF 08
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $0AFFDC.l,X		; FF DC FF 0A
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $0CFFEC.l,X		; FF EC FF 0C
	tsb $00.b		; 04 00
	brk $EA.b		; 00 EA
	sbc $0EFFFC.l,X		; FF FC FF 0E
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $20FFE8.l,X		; FF E8 FF 20
	tsb $00.b		; 04 00
	brk $DA.b		; 00 DA
	sbc $22FFF8.l,X		; FF F8 FF 22
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $9C.b		; 00 9C
	brk $EE.b		; 00 EE
	cpx #$26.b		; E0 26
	jsr $E1E7.w		; 20 E7 E1
	inc $E1.b		; E6 E1
	ldx $E1.b		; A6 E1
	bvs   0.b		; 70 00
	jsr ($FE00.w,X)		; FC 00 FE
	brk $FE.b		; 00 FE
	brk $3E.b		; 00 3E
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
	bra -128.b		; 80 80
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	jmp ($3CC0.w)		; 6C C0 3C
	bpl -17.b		; 10 EF
	bvs -113.b		; 70 8F
	bpl -57.b		; 10 C7
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $009300.l,X		; FF 00 93 00
	cmp $FC.b,S		; C3 FC
	sbc $F9F7F1.l,X		; FF F1 F7 F9
	sbc $0000F9.l,X		; FF F9 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	asl $F9.b		; 06 F9
	asl $F9.b		; 06 F9
	asl $81.b		; 06 81
	inc $E2FB.w,X		; FE FB E2
	ora $FF0DE2.l		; 0F E2 0D FF
	brk $F0.b		; 00 F0
	ora $FEFFFE.l		; 0F FE FF FE
	sbc $00FFFE.l,X		; FF FE FF 00
	ora ($F0.b,X)		; 01 F0
	ora ($F0.b,X)		; 01 F0
	ora ($00.b,X)		; 01 00
	sbc ($00.b),Y		; F1 00
	ora ($01.b,X)		; 01 01
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $010100.l,X		; FF 00 01 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $00FF82.l,X		; FF 82 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $7C83.w,X		; FE 83 7C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $FF.b		; 00 FF
	sbc $C97F7F.l,X		; FF 7F 7F C9
	cmp #$B2B2.w		; C9 B2 B2
	phy		; 5A
	phx		; DA
	sbc $00F800.l,X		; FF 00 F8 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $00C900.l,X		; 7F 00 C9 00
	lda ($00.b)		; B2 00
	phx		; DA
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $FF.b		; 00 FF
	sbc $3BEEEE.l,X		; FF EE EE 3B
	tsa		; 3B
	sta $FFF09F.l,X		; 9F 9F F0 FF
	sbc $001F00.l,X		; FF 00 1F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $3B00.w		; EE 00 3B
	brk $9F.b		; 00 9F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	ora [$BD.b]		; 07 BD
	.db $42, $87		; 42 87
	pha		; 48
	bne   1.b		; D0 01
	sbc $FFBFFF.l,X		; FF FF BF FF
	.db $82, $FD, $0F		; 82 FD 0F
	brk $F8.b		; 00 F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C03FFF.l,X		; FF FF 3F C0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	cop $B1.b		; 02 B1
	lsr $4AB5.w		; 4E B5 4A
	lda $FF4E.w,X		; BD 4E FF
	sbc $07FCF7.l,X		; FF F7 FC 07
	jsr ($07FB.w,X)		; FC FB 07
	sbc $FFFF.w,X		; FD FF FF
	sbc $F3FFFF.l,X		; FF FF FF F3
	cmp $1C.b,S		; C3 1C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	cop $01.b		; 02 01
	cop $05.b		; 02 05
	asl $05.b		; 06 05
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $E1.b		; 00 E1
	brk $8F.b		; 00 8F
	ora $9B1797.l,X		; 1F 97 17 9B
	tas		; 1B
	sta $1F901F.l,X		; 9F 1F 90 1F
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc [$00.b],Y		; F7 00
	xce		; FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00.b,S		; E3 00
	sbc $00FD00.l,X		; FF 00 FD 00
	cmp $FFFF.w,X		; DD FF FF
	and $803F80.l,X		; 3F 80 3F 80
	sbc $E31C00.l,X		; FF 00 1C E3
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $0000FE.l,X		; FF FE 00 00
	adc $007F00.l,X		; 7F 00 7F 00
	cop $C0.b		; 02 C0
	and $946BC0.l,X		; 3F C0 6B 94
	adc $9C.b,S		; 63 9C
	adc $F0FF91.l		; 6F 91 FF F0
	sbc $01FF00.l,X		; FF 00 FF 01
	and $FF3F02.l,X		; 3F 02 3F FF
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	inc $0F70.w,X		; FE 70 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	tsb $FC.b		; 04 FC
	php		; 08
	jsr ($0000.w,X)		; FC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	tsb $F8.b		; 04 F8
	tsb $00F0.w		; 0C F0 00
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
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E6.b		; 00 E6
	ora ($06.b,X)		; 01 06
	ora ($80.b,X)		; 01 80
	adc $020080.l,X		; 7F 80 00 02
	and ($0E.b,X)		; 21 0E
	cmp ($1F.b,X)		; C1 1F
	brk $00.b		; 00 00
	ror $00FF.w,X		; 7E FF 00
	sbc $000000.l,X		; FF 00 00 00
	adc $E01F00.l,X		; 7F 00 1F E0
	and $00FFC0.l,X		; 3F C0 FF 00
	cmp #$C000.w		; C9 00 C0
	cpy #$40.b		; C0 40
	cpy #$00.b		; C0 00
	sed		; F8
	bmi  60.b		; 30 3C
	jmp ($164F.w)		; 6C 4F 16
	sbc [$02.b],Y		; F7 02
	stp		; DB
	ora ($73.b,S),Y		; 13 73
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	bvs -128.b		; 70 80
	inx		; E8
	brk $D4.b		; 00 D4
	jsr $008C.w		; 20 8C 00
	cpx #$E0.b		; E0 E0
	brk $1F.b		; 00 1F
	ora $EF00FF.l,X		; 1F FF 00 EF
	cpx #$80.b		; E0 80
	beq 103.b		; F0 67
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	cpx #$1F.b		; E0 1F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	brk $FF.b		; 00 FF
	bvs 127.b		; 70 7F
	bmi -41.b		; 30 D7
	sbc ($F7.b)		; F2 F7
	cop $FF.b		; 02 FF
	ora [$07.b]		; 07 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq   3.b		; F0 03
	sed		; F8
	ora $F8.b,S		; 03 F8
	ora ($02.b,X)		; 01 02
	jsr ($F807.w,X)		; FC 07 F8
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
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $0C.b		; 00 0C
	brk $E7.b		; 00 E7
	brk $49.b		; 00 49
	sbc $007F00.l,X		; FF 00 7F 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	adc $00FF80.l,X		; 7F 80 FF 00
	ora $B600.w,Y		; 19 00 B6
	php		; 08
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($FE.b,X)		; 01 FE
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $EE.b		; 00 EE
	clc		; 18
	bra  -1.b		; 80 FF
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	sbc $7F80.w,Y		; F9 80 7F
	sbc $001100.l,X		; FF 00 11 00
	adc $7F0018.l,X		; 7F 18 00 7F
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	sbc $7F8000.l,X		; FF 00 80 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	tsb $000F.w		; 0C 0F 00
	sbc $0100.w,X		; FD 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	sbc $F00F00.l,X		; FF 00 0F F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $1C1B0C.l		; 0F 0C 1B 1C
	brk $7F.b		; 00 7F
	bmi -16.b		; 30 F0
	cmp $23CA.w,Y		; D9 CA 23
	bit $7C03.w		; 2C 03 7C
	jsr $0F3F.w		; 20 3F 0F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $3B.b		; 00 3B
	tsb $CF.b		; 04 CF
	bpl -65.b		; 10 BF
	brk $C0.b		; 00 C0
	brk $9F.b		; 00 9F
	brk $80.b		; 00 80
	brk $06.b		; 00 06
	sbc $0201.w,Y		; F9 01 02
	brk $10.b		; 00 10
	bra  15.b		; 80 0F
	cpx #$00.b		; E0 00
	brk $F8.b		; 00 F8
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	jsr ($E000.w,X)		; FC 00 E0
	ora $FF0FF0.l,X		; 1F F0 0F FF
	brk $07.b		; 00 07
	brk $70.b		; 00 70
	beq  96.b		; F0 60
	eor $007F7F.l,X		; 5F 7F 7F 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF007F.l,X		; FF 7F 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000F0F.l,X		; FF 0F 0F 00
	cpx #$FC.b		; E0 FC
	sbc $3CBF00.l,X		; FF 00 BF 3C
	rol $38.b		; 26 38
	phy		; 5A
	bit $00FF.w,X		; 3C FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $3CC33C.l,X		; FF 3C C3 3C
	cmp $3C.b,S		; C3 3C
	cmp $00.b,S		; C3 00
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
	ora $01.b,S		; 03 01
	ora $01.b,S		; 03 01
	ora [$03.b]		; 07 03
	ora [$00.b]		; 07 00
	brk $00.b		; 00 00
	ora [$05.b]		; 07 05
	asl $05.b		; 06 05
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	ora [$01.b]		; 07 01
	ora $01.b,S		; 03 01
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
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$04.b]		; 07 04
	ora [$02.b]		; 07 02
	ora [$07.b]		; 07 07
	brk $00.b		; 00 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$04.b]		; 07 04
	ora $06.b,S		; 03 06
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
	brk $05.b		; 00 05
	asl $03.b		; 06 03
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora [$04.b]		; 07 04
	ora [$06.b]		; 07 06
	ora $02.b,S		; 03 02
	ora [$01.b]		; 07 01
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	asl $00.b		; 06 00
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	ora $00.b,S		; 03 00
	brk $02.b		; 00 02
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
	brk $0B.b		; 00 0B
	bra  44.b		; 80 2C
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
	ora $00.b,S		; 03 00
	beq  -1.b		; F0 FF
	tsb $04.b		; 04 04
	brk $00.b		; 00 00
	ora ($00.b,S),Y		; 13 00
	beq  -1.b		; F0 FF
	asl $04.b		; 06 04
	brk $00.b		; 00 00
	sbc $FF.b,S		; E3 FF
	cpx #$FF.b		; E0 FF
	php		; 08
	tsb $00.b		; 04 00
	brk $F3.b		; 00 F3
	sbc $0AFFE0.l,X		; FF E0 FF 0A
	tsb $00.b		; 04 00
	brk $03.b		; 00 03
	brk $E0.b		; 00 E0
	sbc $00040C.l,X		; FF 0C 04 00
	brk $13.b		; 00 13
	brk $E0.b		; 00 E0
	sbc $00040E.l,X		; FF 0E 04 00
	brk $EB.b		; 00 EB
	sbc $20FFD0.l,X		; FF D0 FF 20
	tsb $00.b		; 04 00
	brk $FB.b		; 00 FB
	sbc $22FFD0.l,X		; FF D0 FF 22
	tsb $00.b		; 04 00
	brk $0B.b		; 00 0B
	brk $D0.b		; 00 D0
	sbc $000424.l,X		; FF 24 04 00
	brk $13.b		; 00 13
	inx		; E8
	ora ($E8.b,S),Y		; 13 E8
	ora [$EF.b],Y		; 17 EF
	stx $E5.b,Y		; 96 E5
	cmp [$67.b],Y		; D7 67
	sed		; F8
	sed		; F8
	rti		; 40

	sbc $07E0E0.l,X		; FF E0 E0 07
	cpy #$07.b		; C0 07
	cpy #$07.b		; C0 07
	cpx #$0F.b		; E0 0F
	rts		; 60

	ora $077800.l		; 0F 00 78 07
	rti		; 40

	and $FF1FE0.l,X		; 3F E0 1F FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	sbc $0101.w,X		; FD 01 01
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	inc $FE03.w,X		; FE 03 FE
	ora [$3C.b]		; 07 3C
	bit $0100.w,X		; 3C 00 01
	beq  -2.b		; F0 FE
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	beq  24.b		; F0 18
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $0001.w,X		; FE 01 00
	sbc $F0FF00.l,X		; FF 00 FF F0
	ora $04FFFF.l		; 0F FF FF 04
	xce		; FB
	ora $FF0000.l,X		; 1F 00 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc [$FC.b],Y		; F7 FC
	ora [$FE.b]		; 07 FE
	xce		; FB
	ora [$00.b]		; 07 00
	inc $0F0E.w,X		; FE 0E 0F
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $FF00F0.l		; 0F F0 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	beq -16.b		; F0 F0
	brk $0F.b		; 00 0F
	ora $0000FF.l		; 0F FF 00 00
	brk $F3.b		; 00 F3
	bvs -56.b		; 70 C8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	bvs -113.b		; 70 8F
	jsr ($FC01.w,X)		; FC 01 FC
	ora ($1E.b,X)		; 01 1E
	ora $FEFA06.l,X		; 1F 06 FA FE
	inc $0101.w,X		; FE 01 01
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	inc $FE00.w,X		; FE 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	bvc -16.b		; 50 F0
	rti		; 40

	bcs   0.b		; B0 00
	beq  16.b		; F0 10
	beq  64.b		; F0 40
	beq -16.b		; F0 F0
	beq  64.b		; F0 40
	beq -32.b		; F0 E0
	beq   0.b		; F0 00
	jsr $3000.w		; 20 00 30
	brk $70.b		; 00 70
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	cpy #$00.b		; C0 00
	rti		; 40

	bra -32.b		; 80 E0
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	ora ($00.b,X)		; 01 00
	ora [$03.b]		; 07 03
	ora $327C1D.l,X		; 1F 1D 7C 32
	adc ($20.b)		; 72 20
	sbc [$64.b]		; E7 64
	sbc [$00.b]		; E7 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $0C.b		; 00 0C
	ora ($1B.b,X)		; 01 1B
	brk $19.b		; 00 19
	brk $DC.b		; 00 DC
	cpx #$9C.b		; E0 9C
	cpx #$00.b		; E0 00
	sbc $880000.l,X		; FF 00 00 88
	bcs  28.b		; B0 1C
	cpx #$3F.b		; E0 3F
	cpy #$00.b		; C0 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	rti		; 40

	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	clc		; 18
	inc $04.b		; E6 04
	phd		; 0B
	brk $80.b		; 00 80
	brk $7E.b		; 00 7E
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	ora ($00.b,X)		; 01 00
	beq   0.b		; F0 00
	brk $FF.b		; 00 FF
	sta ($7E.b,X)		; 81 7E
	sbc $00C700.l,X		; FF 00 C7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $18.b		; 00 18
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	cmp $000000.l		; CF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	ora [$F8.b]		; 07 F8
	bra 127.b		; 80 7F
	sbc $00EF00.l,X		; FF 00 EF 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	rti		; 40

	lda $0000C0.l,X		; BF C0 00 00
	bpl   3.b		; 10 03
	cpx #$0F.b		; E0 0F
	brk $00.b		; 00 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $0F.b		; 00 0F
	beq  31.b		; F0 1F
	cpx #$FF.b		; E0 FF
	brk $3F.b		; 00 3F
	brk $B0.b		; 00 B0
	bvs -104.b		; 70 98
	sei		; 78
	brk $FF.b		; 00 FF
	asl $9D0F.w		; 0E 0F 9D
	eor ($82.b),Y		; 51 82
	ror $C0.b,X		; 76 C0
	tsa		; 3B
	ora ($FB.b,X)		; 01 FB
	beq   0.b		; F0 00
	sed		; F8
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $DE.b		; 00 DE
	jsr $08F5.w		; 20 F5 08
	plx		; FA
	tsb $9C.b		; 04 9C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpx #$C0.b		; E0 C0
	cpx #$40.b		; E0 40
	bvs  96.b		; 70 60
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $00FF40.l,X		; FF 40 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $013FC0.l,X		; 7F C0 3F 01
	plx		; FA
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $C3.b		; 00 C3
	cop $C2.b		; 02 C2
	brk $C0.b		; 00 C0
	rti		; 40

	cpy #$80.b		; C0 80
	cpy #$01.b		; C0 01
	inc $FE01.w,X		; FE 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $C1.b		; 02 C1
	brk $C0.b		; 00 C0
	rti		; 40

	bra -64.b		; 80 C0
	brk $E0.b		; 00 E0
	xba		; EB
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FB.b,S		; 03 FB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FC.b,S		; 03 FC
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	tsb $000D.w		; 0C 0D 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0CFF00.l,X		; FF 00 FF 0C
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	lda $78.b,X		; B5 78
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($FE0E.w,X)		; FC 0E FE
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sta [$78.b]		; 87 78
	sta [$00.b]		; 87 00
	sbc $0EFF00.l,X		; FF 00 FF 0E
	beq   0.b		; F0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $407F00.l,X		; 7F 00 7F 40
	adc $007F20.l,X		; 7F 20 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $407F00.l,X		; 7F 00 7F 40
	and $001F60.l,X		; 3F 60 1F 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq  48.b		; F0 30
	beq  64.b		; F0 40
	beq  16.b		; F0 10
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	beq  48.b		; F0 30
	cpy #$70.b		; C0 70
	bra  98.b		; 80 62
	sbc $00.b,S		; E3 00
	brk $00.b		; 00 00
	inc $CFB0.w,X		; FE B0 CF
	bcs -49.b		; B0 CF
	bcs -51.b		; B0 CD
	sta $DF6FE0.l		; 8F E0 6F DF
	trb $FF00.w		; 1C 00 FF
	brk $01.b		; 00 01
	inc $7F3F.w,X		; FE 3F 7F
	and $7F3F7F.l,X		; 3F 7F 3F 7F
	ora $800000.l,X		; 1F 00 00 80
	brk $FF.b		; 00 FF
	brk $06.b		; 00 06
	ora ($1E.b,X)		; 01 1E
	ora $FC.b,S		; 03 FC
	ora $EC.b,S		; 03 EC
	ora $CC.b,S		; 03 CC
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	sbc $E100.w,Y		; F9 00 E1
	ora $FFE3FF.l,X		; 1F FF E3 FF
	sbc ($FF.b,S),Y		; F3 FF
	sbc ($FF.b,S),Y		; F3 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $08.b,S		; E3 08
	ora ($FF.b,X)		; 01 FF
	brk $6E.b		; 00 6E
	sta ($0E.b),Y		; 91 0E
	sbc ($7F.b),Y		; F1 7F
	sty $FF.b		; 84 FF
	and $1CC3FF.l,X		; 3F FF C3 1C
	brk $FE.b		; 00 FE
	php		; 08
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0FBFF.l,X		; FF FF FB C0
	cpy #$00.b		; C0 00
	and $CF0000.l,X		; 3F 00 00 CF
	brk $93.b		; 00 93
	sbc ($0E.b),Y		; F1 0E
	xce		; FB
	tsb $0E.b		; 04 0E
	ora ($A0.b),Y		; 11 A0
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	sbc $6C00B3.l,X		; FF B3 00 6C
	bpl -15.b		; 10 F1
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF7FFF.l,X		; FF FF 7F FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FC8218.l		; EF 18 82 FC
	ora $B0.b,S		; 03 B0
	eor $BE49B6.l		; 4F B6 49 BE
	eor $17FF.w		; 4D FF 17
	sbc $0012FD.l,X		; FF FD 12 00
	adc $FC18.w,X		; 7D 18 FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E8C1F3.l,X		; FF F3 C1 E8
	brk $1E.b		; 00 1E
	brk $00.b		; 00 00
	and $E43300.l,X		; 3F 00 33 E4
	tas		; 1B
	sty $BC73.w		; 8C 73 BC
	eor $8C.b,S		; 43 8C
	adc ($FF.b,X)		; 61 FF
	brk $FF.b		; 00 FF
	sbc $CC00E2.l,X		; FF E2 00 CC
	brk $E4.b		; 00 E4
	sbc $FDFCFF.l,X		; FF FF FC FD
	inc $FEFF.w,X		; FE FF FE
	sbc $000000.l,X		; FF 00 00 00
	cop $9E.b		; 02 9E
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E8.b		; 00 E8
	sbc $FFFF00.l,X		; FF 00 FF FF
	adc ($00.b,X)		; 61 00
	sbc $01FE00.l,X		; FF 00 FE 01
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	brk $00.b		; 00 00
	rts		; 60

	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	beq -48.b		; F0 D0
	bmi -48.b		; 30 D0
	bmi -48.b		; 30 D0
	bmi  48.b		; 30 30
	beq -64.b		; F0 C0
	bvs -128.b		; 70 80
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	beq -64.b		; F0 C0
	cpx #$C0.b		; E0 C0
	cpx #$C0.b		; E0 C0
	cpx #$00.b		; E0 00
	brk $00.b		; 00 00
	bmi   0.b		; 30 00
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
	brk $03.b		; 00 03
	brk $07.b		; 00 07
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
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3E.b		; 00 3E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
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
	brk $07.b		; 00 07
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	bpl  44.b		; 10 2C
	bmi  76.b		; 30 4C
	bvs  76.b		; 70 4C
	bvs -36.b		; 70 DC
	cpx #$0F.b		; E0 0F
	brk $0F.b		; 00 0F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $3F.b		; 00 3F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $07.b		; 00 07
	brk $00.b		; 00 00
	sbc $9DFF7F.l,X		; FF 7F FF 9D
	sta $EFEF.w,X		; 9D EF EF
	ldx $C1FE.w,Y		; BE FE C1
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $9D.b		; 00 9D
	brk $EF.b		; 00 EF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F0.b		; 00 F0
	brk $00.b		; 00 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E41212.l,X		; FF 12 12 E4
	cpx $B4.b		; E4 B4
	ldy $FF.b,X		; B4 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $12.b		; 00 12
	brk $E4.b		; 00 E4
	brk $B4.b		; 00 B4
	brk $FF.b		; 00 FF
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	sbc $EFFFFF.l,X		; FF FF FF EF
	sbc $9F3939.l		; EF 39 39 9F
	sta $FFFFF2.l,X		; 9F F2 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $EF.b		; 00 EF
	brk $39.b		; 00 39
	brk $9F.b		; 00 9F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $CF.b		; 00 CF
	brk $03.b		; 00 03
	beq -13.b		; F0 F3
	beq  17.b		; F0 11
	bpl -15.b		; 10 F1
	beq -15.b		; F0 F1
	beq  81.b		; F0 51
	beq -15.b		; F0 F1
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	rti		; 40

	ldy #$60.b		; A0 60
	ldy #$60.b		; A0 60
	bcs 112.b		; B0 70
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
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
	cpy #$00.b		; C0 00
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	and ($FF.b,S),Y		; 33 FF
	brk $FF.b		; 00 FF
	brk $C0.b		; 00 C0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$C0.b		; C0 C0
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	rti		; 40

	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
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
	cpx #$10.b		; E0 10
	rts		; 60

	sed		; F8
	brk $FC.b		; 00 FC
	brk $24.b		; 00 24
	brk $E4.b		; 00 E4
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpy #$00.b		; C0 00
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
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $880000.l,X		; FF 00 00 88
	brk $77.b		; 00 77
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $10.b		; 00 10
	ora $000000.l,X		; 1F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $01.b		; 00 01
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $080000.l,X		; FF 00 00 08
	brk $17.b		; 00 17
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra -86.b		; 80 AA
	eor $00.b,X		; 55 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $880000.l,X		; FF 00 00 88
	brk $77.b		; 00 77
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $FFFDFD.l,X		; FF FD FD FF
	sbc $A01018.l,X		; FF 18 10 A0
	and ($78.b),Y		; 31 78
	lsr $00.b		; 46 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	brk $DE.b		; 00 DE
	brk $F9.b		; 00 F9
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $C2FFF1.l,X		; FF F1 FF C2
	sbc $3F3F0D.l,X		; FF 0D 3F 3F
	sbc $00AAAA.l,X		; FF AA AA 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $55.b		; 00 55
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $AAFF11.l,X		; FF 11 FF AA
	sbc $FFFFDD.l,X		; FF DD FF FF
	sbc $00AAAA.l,X		; FF AA AA 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $55.b		; 00 55
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $A0BFC0.l,X		; FF C0 BF A0
	rti		; 40

	rti		; 40

	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	and $4040A0.l,X		; 3F A0 40 40
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  -1.b		; 80 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
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
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	eor $00.b,X		; 55 00
	sbc $05FD03.l,X		; FF 03 FD 05
	cop $02.b		; 02 02
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	jsr ($0205.w,X)		; FC 05 02
	cop $01.b		; 02 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
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
	sbc $03FC00.l,X		; FF 00 FC 03
	sbc ($0C.b,S),Y		; F3 0C
	sbc $19.b		; E5 19
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFCFF.l,X		; FF FF FC FF
	beq  -1.b		; F0 FF
	sbc ($FE.b,X)		; E1 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $07F800.l,X		; FF 00 F8 07
	sta ($7E.b,X)		; 81 7E
	adc $3FF887.l,X		; 7F 87 F8 3F
	rts		; 60

	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8FFFF.l,X		; FF FF FF F8
	sbc $07FF80.l,X		; FF 80 FF 07
	sed		; F8
	and $00FFC0.l,X		; 3F C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	cpy #$3F.b		; C0 3F
	and $0FEFC0.l,X		; 3F C0 EF 0F
	adc $7C.b,S		; 63 7C
	lda $00F8C0.l,X		; BF C0 F8 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	ora $807FF0.l		; 0F F0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1FE000.l,X		; FF 00 E0 1F
	tsb $F0.b		; 04 F0
	and $1F3F.w,X		; 3D 3F 1F
	cpx #$F8.b		; E0 F8
	brk $87.b		; 00 87
	ora [$0E.b]		; 07 0E
	ora $E0FFFF.l		; 0F FF FF E0
	sbc $3FFF00.l,X		; FF 00 FF 3F
	cpy #$FF.b		; C0 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $B3005F.l,X		; FF 5F 00 B3
	cmp $8F.b,S		; C3 8F
	ora $80FFFC.l		; 0F FC FF 80
	sbc $FFFC03.l,X		; FF 03 FC FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F000FC.l,X		; FF FC 00 F0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora $FF.b,S		; 03 FF
	brk $00.b		; 00 00
	sbc $FC00FF.l,X		; FF FF 00 FC
	sbc $07FFC0.l,X		; FF C0 FF 07
	sed		; F8
	eor $89FF21.l,X		; 5F 21 FF 89
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $03.b		; 04 03
	sbc ($1E.b,X)		; E1 1E
	bit #$FF76.w		; 89 76 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF803F.l,X		; FF 3F 80 FF
	and $69.b		; 25 69
	jmp $337B.w		; 4C 7B 33
	sbc $FF00FF.l,X		; FF FF 00 FF
	sbc $000000.l,X		; FF 00 00 00
	rts		; 60

	ora $4CDA25.l,X		; 1F 25 DA 4C
	lda ($5E.b,S),Y		; B3 5E
	bra  -1.b		; 80 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $5BFF00.l,X		; FF 00 FF 5B
	asl A		; 0A
	sbc $AA80.w		; ED 80 AA
	brk $FF.b		; 00 FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $E9F50A.l,X		; FF 0A F5 E9
	asl $FF.b,X		; 16 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	and $56FF.w		; 2D FF 56
	inc $FFCC.w,X		; FE CC FF
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $F7D22D.l,X		; FF 2D D2 F7
	php		; 08
	inc $FF01.w,X		; FE 01 FF
	brk $00.b		; 00 00
	sbc $21E0E7.l,X		; FF E7 E0 21
	cpx #$C0.b		; E0 C0
	and $F780FF.l,X		; 3F FF 80 F7
	cpx $6B9F.w		; EC 9F 6B
	sbc $FF00FF.l,X		; FF FF 00 FF
	cpx #$1F.b		; E0 1F
	ora $804000.l,X		; 1F 00 40 80
	sta ($7E.b,X)		; 81 7E
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $8FFF00.l,X		; FF 00 FF 8F
	adc $06FCFC.l,X		; 7F FC FC 06
	inc $3EC2.w,X		; FE C2 3E
	adc $FF87.w,Y		; 79 87 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0300FF.l,X		; FF FF 00 03
	brk $01.b		; 00 01
	brk $41.b		; 00 41
	bra -120.b		; 80 88
	bvs  -1.b		; 70 FF
	brk $03.b		; 00 03
	jsr ($FF00.w,X)		; FC 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	ora $009000.l		; 0F 00 90 00
	cpx #$E0.b		; E0 E0
	sbc $FF03FF.l,X		; FF FF 03 FF
	brk $FF.b		; 00 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $00FF00.l,X		; 1F 00 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $FFFFC0.l,X		; FF C0 FF FF
	sbc $017F3F.l,X		; FF 3F 7F 01
	ora [$00.b]		; 07 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	cpy #$3F.b		; C0 3F
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F80700.l,X		; FF 00 07 F8
	cpx #$1F.b		; E0 1F
	sbc [$E0.b]		; E7 E0
	jsr ($FEFC.w,X)		; FC FC FE
	rol $FFFF.w,X		; 3E FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora [$FF.b]		; 07 FF
	brk $FF.b		; 00 FF
	cpx #$1F.b		; E0 1F
	jsr ($FE03.w,X)		; FC 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra -113.b		; 80 8F
	bvs -13.b		; 70 F3
	tsb $C6F9.w		; 0C F9 C6
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $FF0FFF.l,X		; 7F FF 0F FF
	ora $FF.b,S		; 03 FF
	cmp ($3F.b,X)		; C1 3F
	jsl $0055FF.l		; 22 FF 55 00
	sbc $10EF00.l,X		; FF 00 EF 10
	eor $AA.b,X		; 55 AA
	jsl $FF00DD.l		; 22 DD 00 FF
	eor $FF.b,X		; 55 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	bvc 119.b		; 50 77
	dey		; 88
	sbc [$10.b]		; E7 10
	beq  24.b		; F0 18
	sbc $10E710.l		; EF 10 E7 10
	sbc [$48.b]		; E7 48
	cmp ($08.b,S),Y		; D3 08
	adc ($88.b,S),Y		; 73 88
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $18.b		; 00 18
	ora [$18.b]		; 07 18
	php		; 08
	clc		; 18
	php		; 08
	cpy $8C24.w		; CC 24 8C
	tsb $42.b		; 04 42
	cmp $1FE035.l,X		; DF 35 E0 1F
	cpx #$1F.b		; E0 1F
	cpx #$15.b		; E0 15
	nop		; EA
	cop $FD.b		; 02 FD
	rti		; 40

	adc $3FDF05.l,X		; 7F 05 DF 3F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $1F.b		; 00 1F
	brk $7F.b		; 00 7F
	bra  63.b		; 80 3F
	brk $21.b		; 00 21
	sbc $0055.w,Y		; F9 55 00
	sbc $10EF00.l,X		; FF 00 EF 10
	eor $AA.b,X		; 55 AA
	jsl $FF00DD.l		; 22 DD 00 FF
	eor $FF.b,X		; 55 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $F0.b		; 00 F0
	eor $00.b,X		; 55 00
	sbc $10EF00.l,X		; FF 00 EF 10
	eor $AA.b,X		; 55 AA
	jsl $FF00DD.l		; 22 DD 00 FF
	eor $FF.b,X		; 55 FF
	cmp $00FF00.l		; CF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	eor $00.b,X		; 55 00
	sbc $10EF00.l,X		; FF 00 EF 10
	eor $AA.b,X		; 55 AA
	jsl $FF00DD.l		; 22 DD 00 FF
	eor $FF.b,X		; 55 FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FDFEFE.l,X		; FF FE FE FD
	inc $F905.w,X		; FE 05 F9
	cop $F2.b		; 02 F2
	ora $F0.b		; 05 F0
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	jsr ($0102.w,X)		; FC 02 01
	tsb $03.b		; 04 03
	ora $0B02.w		; 0D 02 0B
	tsb $1E.b		; 04 1E
	sbc $7C.b,S		; E3 7C
	sta $A31F30.l		; 8F 30 1F A3
	bit $704F.w,X		; 3C 4F 70
	stz $3CE0.w,X		; 9E E0 3C
	cpy #$78.b		; C0 78
	bra -61.b		; 80 C3
	ldy $708F.w,X		; BC 8F 70
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora $807CE0.l,X		; 1F E0 7C 80
	beq   0.b		; F0 00
	cmp ($03.b,X)		; C1 03
	bcc  23.b		; 90 17
	clc		; 18
	ora $C37B64.l,X		; 1F 64 7B C3
	jsr ($00FF.w,X)		; FC FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($E800.w,X)		; FC 00 E8
	brk $E0.b		; 00 E0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $0F.b		; 00 0F
	ora $CB7F78.l		; 0F 78 7F CB
	ldy $87.b,X		; B4 87
	sei		; 78
	ora $807CE0.l,X		; 1F E0 7C 80
	inc $FF00.w,X		; FE 00 FF
	brk $F0.b		; 00 F0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora ($00.b,X)		; 01 00
	ora [$80.b]		; 07 80
	sbc $1FFF00.l,X		; FF 00 FF 1F
	cpx #$FF.b		; E0 FF
	cop $FF.b		; 02 FF
	tsb $FA.b		; 04 FA
	bpl  -8.b		; 10 F8
	php		; 08
	nop		; EA
	rtl		; 6B

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	cop $0D.b		; 02 0D
	and [$18.b]		; 27 18
	ora $C03F60.l,X		; 1F 60 3F C0
	stz $80.b,X		; 74 80
	and $38FEC2.l,X		; 3F C2 FE 38
	sbc $DD74.w,X		; FD 74 DD
	bra -69.b		; 80 BB
	ora ($56.b),Y		; 11 56
	ora [$D8.b],Y		; 17 D8
	sbc $23FFAA.l,X		; FF AA FF 23
	trb $C13E.w		; 1C 3E C1
	adc $00FF80.l,X		; 7F 80 FF 00
	inc $E800.w		; EE 00 E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	rol $FD.b		; 26 FD
	dey		; 88
	sta [$25.b],Y		; 97 25
	adc $77.b,X		; 75 77
	eor $FF307F.l		; 4F 7F 30 FF
	bit #$03F6.w		; 89 F6 03
	jsr ($40BF.w,X)		; FC BF 40
	sbc $00FA00.l,X		; FF 00 FA 00
	dey		; 88
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $65.b		; 00 65
	cmp ($6C.b)		; D2 6C
	bit $BB.b,X		; 34 BB
	sbc $22FF8E.l,X		; FF 8E FF 22
	sbc $30FF00.l,X		; FF 00 FF 30
	cmp $FF936C.l		; CF 6C 93 FF
	brk $DB.b		; 00 DB
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $52.b		; 00 52
	brk $48.b		; 00 48
	brk $A8.b		; 00 A8
	cmp $FFC8.w,X		; DD C8 FF
	brk $FF.b		; 00 FF
	tsb $FB.b		; 04 FB
	eor [$A8.b],Y		; 57 A8
	lda [$4C.b],Y		; B7 4C
	cmp $00FF20.l,X		; DF 20 FF 00
	jsl $000000.l		; 22 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $43.b,S		; 43 43
	tya		; 98
	stz $EFCB.w		; 9C CB EF
	brk $EF.b		; 00 EF
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	cpx $ED13.w		; EC 13 ED
	ora ($B7.b)		; 12 B7
	php		; 08
	jsl $001041.l		; 22 41 10 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp [$86.b],Y		; D7 86
	lsr $B344.w		; 4E 44 B3
	lda ($3F.b,S),Y		; B3 3F
	sbc $20FF01.l,X		; FF 01 FF 20
	sbc $90FF00.l,X		; FF 00 FF 90
	adc $9A20DF.l		; 6F DF 20 9A
	and ($4C.b,X)		; 21 4C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $AE.b		; 00 AE
	sbc ($8F.b),Y		; F1 8F
	stz $BA.b,X		; 74 BA
	sbc $74F2F1.l,X		; FF F1 F2 74
	pea $EF2F.w		; F4 2F EF
	asl $FE.b		; 06 FE
	ora $BF.b,S		; 03 BF
	sbc ($0C.b)		; F2 0C
	jsr ($5F03.w,X)		; FC 03 5F
	brk $0F.b		; 00 0F
	brk $0B.b		; 00 0B
	brk $10.b		; 00 10
	brk $01.b		; 00 01
	brk $40.b		; 00 40
	brk $7F.b		; 00 7F
	sbc $E01FA0.l,X		; FF A0 1F E0
	ora [$BD.b]		; 07 BD
	cpx #$3E.b		; E0 3E
	clv		; B8
	eor [$0E.b]		; 47 0E
	cli		; 58
	pha		; 48
	nop		; EA
	nop		; EA
	brk $00.b		; 00 00
	rti		; 40

	bra  24.b		; 80 18
	cpx #$E6.b		; E0 E6
	clc		; 18
	sbc $FE06.w,Y		; F9 06 FE
	ora ($BF.b,X)		; 01 BF
	brk $17.b		; 00 17
	brk $C0.b		; 00 C0
	cpy #$3C.b		; C0 3C
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	beq  15.b		; F0 0F
	jsr ($FF03.w,X)		; FC 03 FF
	brk $7F.b		; 00 7F
	brk $3F.b		; 00 3F
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $20.b		; 00 20
	cpy #$C0.b		; C0 C0
	bmi  -1.b		; 30 FF
	ora $8F031F.l		; 0F 1F 03 8F
	bra  99.b		; 80 63
	cpx #$78.b		; E0 78
	sed		; F8
	asl $07FE.w,X		; 1E FE 07
	sbc $FF3FC3.l,X		; FF C3 3F FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	sbc ($FF.b),Y		; F1 FF
	sed		; F8
	sbc $7EFFFC.l,X		; FF FC FF 7E
	sbc $0F7F1F.l,X		; FF 1F 7F 0F
	ora $C3CF07.l,X		; 1F 07 CF C3
	beq  15.b		; F0 0F
	sed		; F8
	ora [$FC.b]		; 07 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	sbc $3FFF00.l,X		; FF 00 FF 3F
	sbc $DF7F9F.l,X		; FF 9F 7F DF
	jsr $90EF.w		; 20 EF 90
	sbc $E0FFC0.l,X		; FF C0 FF E0
	sbc $FF7FFF.l,X		; FF FF 7F FF
	and $FF1FFF.l,X		; 3F FF 1F FF
	brk $E0.b		; 00 E0
	bra 112.b		; 80 70
	cpy #$30.b		; C0 30
	cpx #$18.b		; E0 18
	sbc $AAAAFF.l,X		; FF FF AA AA
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $55AA00.l,X		; FF 00 AA 55
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $B9.b		; 04 B9
	jmp ($FF00.w,X)		; 7C 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C600FF.l,X		; FF FF 00 C6
	cop $7F.b		; 02 7F
	sta $00.b,S		; 83 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	sbc ($07.b,S),Y		; F3 07
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0C00FF.l,X		; FF FF 00 0C
	php		; 08
	sbc $0000F8.l,X		; FF F8 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1ADABF.l,X		; 1F BF DA 1A
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	adc $25DA00.l,X		; 7F 00 DA 25
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
	rti		; 40

	bra  32.b		; 80 20
	cpy #$80.b		; C0 80
	sbc $0000FF.l,X		; FF FF 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra  64.b		; 80 40
	bra -96.b		; 80 A0
	rti		; 40

	rti		; 40

	and $000000.l,X		; 3F 00 00 00
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
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00F708.l,X		; FF 08 F7 00
	sbc $5555AA.l,X		; FF AA 55 55
	tax		; AA
	tax		; AA
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $11D52A.l,X		; FF 2A D5 11
	inc $55AA.w		; EE AA 55
	eor $AA.b,X		; 55 AA
	tax		; AA
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E4FF00.l,X		; FF 00 FF E4
	phd		; 0B
	jsr ($1907.w,X)		; FC 07 19
	inc $9B.b		; E6 9B
	jmp ($CC33.w)		; 6C 33 CC
	lda ($5C.b,S),Y		; B3 5C
	rol $D8.b		; 26 D8
	stz $B8.b		; 64 B8
	ora ($0C.b,S),Y		; 13 0C
	ora [$08.b],Y		; 17 08
	ora [$F8.b]		; 07 F8
	ora $F00FF0.l		; 0F F0 0F F0
	ora $E01FE0.l,X		; 1F E0 1F E0
	and $03F3C0.l,X		; 3F C0 F3 03
	sbc [$07.b]		; E7 07
	cmp [$07.b]		; C7 07
	stz $981F.w		; 9C 1F 98
	ora $303F30.l,X		; 1F 30 3F 30
	and $FC7F60.l,X		; 3F 60 7F FC
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $83.b		; 00 83
	jsr ($F00F.w,X)		; FC 0F F0
	ora $C03FE0.l,X		; 1F E0 3F C0
	jmp ($3A80.w,X)		; 7C 80 3A
	cmp $78.b,S		; C3 78
	sty $1AF2.w		; 8C F2 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $04.b,S		; 03 04
	ora $001D00.l		; 0F 00 1D 00
	beq   3.b		; F0 03
	cpy $06.b		; C4 06
	sta $3A09.w,Y		; 99 09 3A
	asl A		; 0A
	and [$27.b]		; 27 27
	lda $7EAF.w		; AD AF 7E
	adc $03BFB5.l,X		; 7F B5 BF 03
	tsb $3807.w		; 0C 07 38
	asl $3560.w,X		; 1E 60 35
	cpy #$78.b		; C0 78
	bra  80.b		; 80 50
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $D7.b		; 00 D7
	ora [$A5.b],Y		; 17 A5
	and [$EE.b]		; 27 EE
	sbc $E8FFD5.l		; EF D5 FF E8
	sbc $01FD52.l,X		; FF 52 FD 01
	inc $D42B.w,X		; FE 2B D4
	inx		; E8
	brk $D8.b		; 00 D8
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	sbc $01FD52.l,X		; FF 52 FD 01
	inc $D42B.w,X		; FE 2B D4
	jmp ($B083.w,X)		; 7C 83 B0
	eor $003FC0.l		; 4F C0 3F 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $17.b		; 00 17
	inx		; E8
	lda $07F850.l		; AF 50 F8 07
	sta $7F.b,S		; 83 7F
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	php		; 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	ora ($00.b,X)		; 01 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	cpy #$FF.b		; C0 FF
	bmi  63.b		; 30 3F
	iny		; C8
	ora $0000F4.l		; 0F F4 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
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
	sbc $C03F00.l,X		; FF 00 3F C0
	bra 127.b		; 80 7F
	sbc $01FE00.l,X		; FF 00 FE 01
	inc $F407.w,X		; FE 07 F4
	ora [$E8.b]		; 07 E8
	ora $000000.l		; 0F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $9B.b		; 00 9B
	stz $F6.b		; 64 F6
	ora #$F807.w		; 09 07 F8
	sed		; F8
	adc $00F803.l,X		; 7F 03 F8 00
	sbc $FE00.w,Y		; F9 00 FE
	brk $F9.b		; 00 F9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	ora ($06.b,X)		; 01 06
	brk $01.b		; 00 01
	ora ($06.b,X)		; 01 06
	brk $FF.b		; 00 FF
	ldy #$5F.b		; A0 5F
	cpy #$3F.b		; C0 3F
	nop		; EA
	ora $1F.b,X		; 15 1F
	cpx #$06.b		; E0 06
	lda $AE01.w,Y		; B9 01 AE
	brk $DF.b		; 00 DF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $50.b		; 00 50
	bvc  32.b		; 50 20
	sbc $E5.b		; E5 E5
	rol $0FFE.w,X		; 3E FE 0F
	sbc $03FF05.l,X		; FF 05 FF 03
	sbc $C05FA1.l,X		; FF A1 5F C0
	and $1A956A.l,X		; 3F 6A 95 1A
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	brk $B9.b		; 00 B9
	ldy #$C7.b		; A0 C7
	cmp ($AB.b,X)		; C1 AB
	tay		; A8
	sbc ($F0.b),Y		; F1 F0
	phy		; 5A
	plx		; FA
	and $FE56FF.l,X		; 3F FF 56 FE
	pea $5808.w		; F4 08 58
	asl $3F.b		; 06 3F
	brk $57.b		; 00 57
	brk $0F.b		; 00 0F
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $F0.b		; 00 F0
	ora $FE03FC.l		; 0F FC 03 FE
	ora ($BF.b,X)		; 01 BF
	bra  -1.b		; 80 FF
	rts		; 60

	adc $083F10.l,X		; 7F 10 3F 08
	lda $0000A4.l,X		; BF A4 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	sed		; F8
	brk $5C.b		; 00 5C
	brk $E6.b		; 00 E6
	sbc ($73.b,X)		; E1 73
	beq 113.b		; F0 71
	beq  28.b		; F0 1C
	jsr ($7C8C.w,X)		; FC 8C 7C
	dec $3E.b		; C6 3E
	inc $1E.b		; E6 1E
	sbc ($0F.b,S),Y		; F3 0F
	ora $000F00.l,X		; 1F 00 0F 00
	ora $000300.l		; 0F 00 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	and $F51AE0.l,X		; 3F E0 1A F5
	tsb $8EF3.w		; 0C F3 8E
	adc $7887.w,Y		; 79 87 78
	eor [$3C.b]		; 47 3C
	and $1C.b,S		; 23 1C
	and ($0E.b,S),Y		; 33 0E
	cpx #$18.b		; E0 18
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	sed		; F8
	ora [$F8.b]		; 07 F8
	ora [$FC.b]		; 07 FC
	ora $FC.b,S		; 03 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $02.b		; 00 02
	sbc $FF00.w,X		; FD 00 FF
	tax		; AA
	eor $11.b,X		; 55 11
	inc $55AA.w		; EE AA 55
	eor $AA.b,X		; 55 AA
	tax		; AA
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $0200FF.l,X		; FF FF 00 02
	sbc $FF00.w,X		; FD 00 FF
	tax		; AA
	eor $13.b,X		; 55 13
	cpx $53AC.w		; EC AC 53
	bvc -81.b		; 50 AF
	bra  96.b		; 80 60
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FC.b,S		; 03 FC
	ora $807FF0.l		; 0F F0 7F 80
	sbc $FD0200.l,X		; FF 00 02 FD
	brk $FF.b		; 00 FF
	txa		; 8A
	adc $5B.b,X		; 75 5B
	ldy $00.b		; A4 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $02.b		; 00 02
	sbc $FF00.w,X		; FD 00 FF
	tax		; AA
	eor $71.b,X		; 55 71
	stx $F52A.w		; 8E 2A F5
	ora $7A.b		; 05 7A
	bvs  -9.b		; 70 F7
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr $D8DF.w		; 20 DF D8
	and [$8E.b]		; 27 8E
	ora ($FF.b,X)		; 01 FF
	brk $02.b		; 00 02
	sbc $FF00.w,X		; FD 00 FF
	tax		; AA
	eor $11.b,X		; 55 11
	inc $55AA.w		; EE AA 55
	eor $AA.b,X		; 55 AA
	nop		; EA
	ora $00.b,X		; 15 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $AA8877.l,X		; FF 77 88 AA
	eor $FF.b,X		; 55 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $DD.b		; 00 DD
	brk $FF.b		; 00 FF
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	bra -70.b		; 80 BA
	eor $FF.b		; 45 FF
	brk $FD.b		; 00 FD
	cop $FD.b		; 02 FD
	cop $D3.b		; 02 D3
	tsb $FB.b		; 04 FB
	tsb $57.b		; 04 57
	ora ($00.b,X)		; 01 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $44FE01.l,X		; FF 01 FE 44
	clv		; B8
	cpy #$78.b		; C0 78
	dey		; 88
	bvs -117.b		; 70 8B
	adc ($9F.b,S),Y		; 73 9F
	adc [$9F.b]		; 67 9F
	sbc $2FCB3B.l		; EF 3B CB 2F
	cmp $7FC03F.l		; CF 3F C0 7F
	bra 127.b		; 80 7F
	bra 124.b		; 80 7C
	bra 120.b		; 80 78
	bra -16.b		; 80 F0
	brk $F4.b		; 00 F4
	brk $F0.b		; 00 F0
	brk $61.b		; 00 61
	ror $7C63.w,X		; 7E 63 7C
	cmp [$F8.b]		; C7 F8
	cmp $F20FF1.l		; CF F1 0F F2
	ldx $3DC4.w,Y		; BE C4 3D
	cmp #$927A.w		; C9 7A 92
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora [$00.b]		; 07 00
	asl $1D00.w		; 0E 00 1D
	brk $F1.b		; 00 F1
	and ($EA.b,X)		; 21 EA
	lsr A		; 4A
	cmp [$87.b]		; C7 87
	plb		; AB
	pld		; 2B
	lsr $AD5F.w,X		; 5E 5F AD
	lda $B47F78.l		; AF 78 7F B4
	lda $75003E.l,X		; BF 3E 00 75
	brk $F8.b		; 00 F8
	brk $D4.b		; 00 D4
	brk $A0.b		; 00 A0
	brk $50.b		; 00 50
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $F8.b		; 00 F8
	sbc $A1FFD0.l,X		; FF D0 FF A1
	inc $F54A.w,X		; FE 4A F5
	sta [$F8.b]		; 87 F8
	and $E31ED1.l		; 2F D1 1E E3
	ldy $0056.w		; AC 56 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($03.b,X)		; 01 03
	sbc $18FD04.l,X		; FF 04 FD 18
	jsr ($F520.w,X)		; FC 20 F5
	cpy #$F4.b		; C0 F4
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $9D.b		; 00 9D
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $0A.b		; 00 0A
	cop $09.b		; 02 09
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $62.b,X		; 15 62
	brk $47.b		; 00 47
	brk $D7.b		; 00 D7
	brk $57.b		; 00 57
	brk $57.b		; 00 57
	brk $47.b		; 00 47
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	plp		; 28
	bcc   0.b		; 90 00
	plp		; 28
	bra  40.b		; 80 28
	brk $A8.b		; 00 A8
	tay		; A8
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy $00.b		; C4 00
	sbc $00.b,X		; F5 00
	cmp $00.b		; C5 00
	cmp $C400.w,X		; DD 00 C4
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	asl A		; 0A
	and ($00.b),Y		; 31 00
	asl A		; 0A
	jsr $001A.w		; 20 1A 00
	jsl $003902.l		; 22 02 39 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $07.b		; 06 07
	nop		; EA
	ora $55.b,S		; 03 55
	ora ($56.b,X)		; 01 56
	brk $55.b		; 00 55
	brk $ED.b		; 00 ED
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $AD.b		; 00 AD
	tay		; A8
	bpl   0.b		; 10 00
	tay		; A8
	brk $A8.b		; 00 A8
	brk $AA.b		; 00 AA
	tay		; A8
	ora ($00.b)		; 12 00
	brk $00.b		; 00 00
	brk $05.b		; 00 05
	eor ($FF.b)		; 52 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $BE.b		; 00 BE
	bra -66.b		; 80 BE
	brk $5D.b		; 00 5D
	cmp ($1C.b,X)		; C1 1C
	cmp ($2A.b,X)		; C1 2A
	sbc $00.b,S		; E3 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $41.b		; 00 41
	brk $41.b		; 00 41
	brk $22.b		; 00 22
	brk $22.b		; 00 22
	brk $14.b		; 00 14
	rti		; 40

	bra  95.b		; 80 5F
	jsr $40B5.w		; 20 B5 40
	adc $80.b,X		; 75 80
	sbc ($00.b),Y		; F1 00
	cmp $DD00.w,X		; DD 00 DD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsr $4000.w		; 20 00 40
	asl A		; 0A
	bra  10.b		; 80 0A
	brk $0E.b		; 00 0E
	brk $22.b		; 00 22
	brk $22.b		; 00 22
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $BF.b		; 00 BF
	brk $5F.b		; 00 5F
	brk $5F.b		; 00 5F
	brk $5F.b		; 00 5F
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ldy #$40.b		; A0 40
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	ldy #$40.b		; A0 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FD.b		; 00 FD
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cop $01.b		; 02 01
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	cop $01.b		; 02 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $DF.b		; 00 DF
	brk $D7.b		; 00 D7
	brk $57.b		; 00 57
	brk $ED.b		; 00 ED
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	jsr $0080.w		; 20 80 00
	jsr $2880.w		; 20 80 28
	brk $A8.b		; 00 A8
	tay		; A8
	ora ($00.b)		; 12 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	sbc $C27F85.l,X		; FF 85 7F C2
	and $7057A9.l,X		; 3F A9 57 70
	sta $1CC53A.l		; 8F 3A C5 1C
	sbc $0A.b,S		; E3 0A
	sbc $00.b,X		; F5 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $CF.b		; 00 CF
.ACCU 16
	rep #$AF		; C2 AF
	lda #$F0F3.w		; A9 F3 F0
	rtl		; 6B

	nop		; EA
	lda $5AFD.w,X		; BD FD 5A
	plx		; FA
	ora $7E96FF.l		; 0F FF 96 7E
	rol $5700.w,X		; 3E 00 57
	brk $0F.b		; 00 0F
	brk $15.b		; 00 15
	brk $02.b		; 00 02
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $F3.b		; 00 F3
	ora $F90FF3.l		; 0F F3 0F F9
	sta [$F9.b]		; 87 F9
	eor [$FC.b]		; 47 FC
	and $FE.b,S		; 23 FE
	sta ($7E.b),Y		; 91 7E
	eor #$A4BF.w		; 49 BF A4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	cpx #$00.b		; E0 00
	bvs   0.b		; 70 00
	clv		; B8
	brk $5C.b		; 00 5C
	brk $11.b		; 00 11
	asl $0E01.w		; 0E 01 0E
	bit #$E887.w		; 89 87 E8
	sbc [$7C.b]		; E7 7C
	sbc ($FC.b,S),Y		; F3 FC
	xce		; FB
	ror $7AE9.w		; 6E E9 7A
	sbc $01FE.w,Y		; F9 FE 01
	inc $7F01.w,X		; FE 01 7F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $07.b		; 00 07
	brk $17.b		; 00 17
	brk $07.b		; 00 07
	brk $7F.b		; 00 7F
	bra -69.b		; 80 BB
	mvp $00,$FF		; 44 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80.b,X		; F5 80
	tda		; 7B
	bra 117.b		; 80 75
	cpy #$00.b		; C0 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $807F80.l,X		; FF 80 7F 80
	adc $7F3FC0.l,X		; 7F C0 3F 7F
	bra -69.b		; 80 BB
	mvp $0F,$F8		; 44 F8 0F
	inc $FF09.w,X		; FE 09 FF
	brk $51.b		; 00 51
	brk $BA.b		; 00 BA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	beq   7.b		; F0 07
	sed		; F8
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	bra  79.b		; 80 4F
	ora $302590.l		; 0F 90 25 30
	cop $0C.b		; 02 0C
	brk $81.b		; 00 81
	beq  15.b		; F0 0F
	sbc $801F00.l,X		; FF 00 1F 80
	adc $0FF080.l,X		; 7F 80 F0 0F
	bvc -113.b		; 50 8F
	tsb $81F3.w		; 0C F3 81
	ror $00FF.w,X		; 7E FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $00.b,X		; 55 00
	tax		; AA
	brk $00.b		; 00 00
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $0000FF.l,X		; FF FF 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $7E80.w,Y		; F9 80 7E
	bvc  14.b		; 50 0E
	lda ($0C.b,X)		; A1 0C
	ora $C0.b,S		; 03 C0
	sta [$F8.b]		; 87 F8
	adc $02F980.l,X		; 7F 80 F9 02
	sbc $807F00.l,X		; FF 00 7F 80
	ora $F00FF0.l		; 0F F0 0F F0
	cmp $3C.b,S		; C3 3C
	inc $FF01.w,X		; FE 01 FF
	brk $FE.b		; 00 FE
	ora ($3F.b,X)		; 01 3F
	cpy #$7B.b		; C0 7B
	cpy $7F.b		; C4 7F
	rti		; 40

	lda $F06F40.l,X		; BF 40 6F F0
	eor $C0.b,X		; 55 C0
	tyx		; BB
	brk $55.b		; 00 55
	brk $80.b		; 00 80
	adc $C03FC0.l,X		; 7F C0 3F C0
	and $60FF00.l,X		; 3F 00 FF 60
	sta $003FC0.l,X		; 9F C0 3F 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	bra -69.b		; 80 BB
	mvp $00,$FF		; 44 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $00.b,X		; 55 00
	tyx		; BB
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $EAFF00.l,X		; FF 00 FF EA
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $AA.b		; 00 AA
	tax		; AA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tax		; AA
	eor $CE.b,X		; 55 CE
	ora ($56.b,X)		; 01 56
	phd		; 0B
	tsb $0B.b		; 04 0B
	jmp $1817.w		; 4C 17 18
	ora [$28.b]		; 07 28
	and [$38.b],Y		; 37 38
	ora $01AE99.l		; 0F 99 AE 01
	inc $FC03.w,X		; FE 03 FC
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	and [$D8.b]		; 27 D8
	ora $708FF0.l		; 0F F0 8F 70
	ror $97.b,X		; 76 97
	lsr $87.b		; 46 87
	mvp $68,$87		; 44 87 68
	sta $BBAD2B.l		; 8F 2B AD BB
	rol $1E93.w,X		; 3E 93 1E
	stx $1C.b		; 86 1C
	inx		; E8
	brk $F8.b		; 00 F8
	brk $F8.b		; 00 F8
	brk $F0.b		; 00 F0
	brk $D1.b		; 00 D1
	brk $C3.b		; 00 C3
	brk $E3.b		; 00 E3
	brk $E7.b		; 00 E7
	brk $77.b		; 00 77
	lda [$EA.b]		; A7 EA
	lsr A		; 4A
	sbc [$47.b]		; E7 47
	xba		; EB
	plb		; AB
	stz $2D1F.w,X		; 9E 1F 2D
	and $B41F1E.l		; 2F 1E 1F B4
	lda $750038.l,X		; BF 38 00 75
	brk $78.b		; 00 78
	brk $D4.b		; 00 D4
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $E0.b		; 00 E0
	sbc $81FDD2.l,X		; FF D2 FD 81
	inc $F44B.w,X		; FE 4B F4
	stx $F9.b		; 86 F9
	and $1BD2.w		; 2D D2 1B
	cpx $AB.b		; E4 AB
	mvn $00,$00		; 54 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pla		; 68
	stz $2ED8.w,X		; 9E D8 2E
	bcs  90.b		; B0 5A
	bvs -102.b		; 70 9A
	cpx #$3F.b		; E0 3F
	cpx #$3F.b		; E0 3F
	cpy #$74.b		; C0 74
	cpy #$7D.b		; C0 7D
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $09.b		; 02 09
	brk $02.b		; 00 02
	brk $EA.b		; 00 EA
	brk $8A.b		; 00 8A
	brk $BA.b		; 00 BA
	brk $88.b		; 00 88
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $47.b		; 00 47
	bpl  87.b		; 10 57
	brk $15.b		; 00 15
	rti		; 40

	and $00.b,X		; 35 00
	eor $05.b		; 45 05
	adc ($00.b)		; 72 00
	brk $00.b		; 00 00
	brk $28.b		; 00 28
	bcc   0.b		; 90 00
	tay		; A8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	txa		; 8A
	ply		; 7A
	stx $79.b		; 86 79
	sta $75.b		; 85 75
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora #$0A06.w		; 09 06 0A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	inc $F800.w,X		; FE 00 F8
	brk $FB.b		; 00 FB
	brk $F8.b		; 00 F8
	rts		; 60

	adc $A81FC0.l,X		; 7F C0 1F A8
	ldy $00.b,X		; B4 00
	sbc $040100.l,X		; FF 00 01 04
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	ora [$80.b]		; 07 80
	brk $80.b		; 00 80
	rts		; 60

	rti		; 40

	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	tax		; AA
	brk $8A.b		; 00 8A
	brk $EA.b		; 00 EA
	brk $E8.b		; 00 E8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $44.b		; 00 44
	bpl  85.b		; 10 55
	brk $55.b		; 00 55
	brk $75.b		; 00 75
	brk $15.b		; 00 15
	ora $12.b		; 05 12
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tax		; AA
	ora ($00.b),Y		; 11 00
	tax		; AA
	php		; 08
	sbc $00.b,S		; E3 00
	xba		; EB
	php		; 08
	plb		; AB
	php		; 08
	plb		; AB
	brk $E3.b		; 00 E3
	trb $F7.b		; 14 F7
	bpl  87.b		; 10 57
	bpl 119.b		; 10 77
	trb $00.b		; 14 00
	trb $00.b		; 14 00
	trb $40.b		; 14 40
	trb $40.b		; 14 40
	trb $0800.w		; 1C 00 08
	brk $88.b		; 00 88
	jsr $8008.w		; 20 08 80
	brk $4E.b		; 00 4E
	brk $F5.b		; 00 F5
	brk $ED.b		; 00 ED
	brk $75.b		; 00 75
	brk $4E.b		; 00 4E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3B.b		; 00 3B
	asl A		; 0A
	lda ($00.b),Y		; B1 00
	asl A		; 0A
	php		; 08
	ora ($00.b)		; 12 00
	txa		; 8A
	asl A		; 0A
	lda ($00.b),Y		; B1 00
	brk $00.b		; 00 00
	brk $2A.b		; 00 2A
	cpy $00.b		; C4 00
	sbc $007F00.l,X		; FF 00 7F 00
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
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
	sed		; F8
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $FD.b		; 00 FD
	brk $FB.b		; 00 FB
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	brk $07.b		; 00 07
	brk $01.b		; 00 01
	ora ($02.b,X)		; 01 02
	asl $00.b		; 06 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	eor ($8C.b,S),Y		; 53 8C
	ora ($AE.b,X)		; 01 AE
	cop $AD.b		; 02 AD
	phd		; 0B
	ldy #$51.b		; A0 51
	txa		; 8A
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cmp $50AB.w,X		; DD AB 50
	jsr $5000.w		; 20 00 50
	brk $50.b		; 00 50
	brk $54.b		; 00 54
	bvc  36.b		; 50 24
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	mvn $03,$DD		; 54 DD 03
	sbc $C05FA5.l,X		; FF A5 5F C0
	and $B09769.l,X		; 3F 69 97 B0
	eor $DC45BA.l		; 4F BA 45 DC
	and $EA.b,S		; 23 EA
	sta $00.b,X		; 95 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc ($AF.b)		; F2 AF
	lda #$F1F3.w		; A9 F3 F1
	rtl		; 6B

	nop		; EA
	lda $5AFC.w,X		; BD FC 5A
	plx		; FA
	bit $96FC.w,X		; 3C FC 96
	ror $000E.w,X		; 7E 0E 00
	eor [$00.b],Y		; 57 00
	ora $001500.l		; 0F 00 15 00
	ora $00.b,S		; 03 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	and [$F4.b],Y		; 37 F4
	lda ($70.b),Y		; B1 70
	sta ($70.b),Y		; 91 70
	phb		; 8B
	sed		; F8
	nop		; EA
	phy		; 5A
	inc $743E.w		; EE 3E 74
	bit $9CF0.w		; 2C F0 9C
	phd		; 0B
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $87.b		; 00 87
	brk $C5.b		; 00 C5
	brk $E1.b		; 00 E1
	brk $E3.b		; 00 E3
	brk $73.b		; 00 73
	brk $38.b		; 00 38
	cpy #$35.b		; C0 35
	cpx #$10.b		; E0 10
	cpx #$18.b		; E0 18
	beq  12.b		; F0 0C
	beq -118.b		; F0 8A
	adc ($8E.b)		; 72 8E
	sei		; 78
	dec $C03A.w		; CE 3A C0
	and $E01FE0.l,X		; 3F E0 1F E0
	ora $F00FF0.l,X		; 1F F0 0F F0
	ora $F80DF2.l		; 0F F2 0D F8
	ora [$FA.b]		; 07 FA
	ora $88.b		; 05 88
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $22.b		; 00 22
	jsl $AA0000.l		; 22 00 00 AA
	tax		; AA
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsl $FF00DD.l		; 22 DD 00 FF
	tax		; AA
	eor $8E.b,X		; 55 8E
	asl $55.b		; 06 55
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $22.b		; 00 22
	jsl $AA0000.l		; 22 00 00 AA
	tax		; AA
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsl $FF00DD.l		; 22 DD 00 FF
	tax		; AA
	eor $18.b,X		; 55 18
	tya		; 98
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	jsl $000022.l		; 22 22 00 00
	tax		; AA
	tax		; AA
	sbc [$00.b]		; E7 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsl $FF00DD.l		; 22 DD 00 FF
	tax		; AA
	eor $48.b,X		; 55 48
	rti		; 40

	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	jsl $000022.l		; 22 22 00 00
	tax		; AA
	tax		; AA
	ldy #$1F.b		; A0 1F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	jsl $FF00DD.l		; 22 DD 00 FF
	tax		; AA
	eor $11.b,X		; 55 11
	ora ($AA.b),Y		; 11 AA
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	sbc $BBBBFF.l,X		; FF FF BB BB
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora ($EE.b),Y		; 11 EE
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $FF.b,X		; 55 FF
	brk $BB.b		; 00 BB
	mvp $00,$FF		; 44 FF 00
	sbc $4C3A00.l,X		; FF 00 3A 4C
	plx		; FA
	stz $1C72.w		; 9C 72 1C
	sbc [$98.b],Y		; F7 98
	sed		; F8
	ldy $ED.b,X		; B4 ED
	and ($E8.b),Y		; 31 E8
	bmi  96.b		; 30 60
	clv		; B8
	ora $609FF0.l		; 0F F0 9F 60
	ora $609FE0.l,X		; 1F E0 9F 60
	lda $C03E40.l,X		; BF 40 3E C0
	and $C03FC0.l,X		; 3F C0 3F C0
	tay		; A8
	sec		; 38
	lsr A		; 4A
	ply		; 7A
	eor ($71.b),Y		; 51 71
	tax		; AA
	tax		; AA
	and [$67.b]		; 27 67
	phk		; 4B
	phk		; 4B
	eor [$C7.b]		; 47 C7
	plb		; AB
	plb		; AB
	cmp $008D00.l		; CF 00 8D 00
	stz $7500.w,X		; 9E 00 75
	brk $B8.b		; 00 B8
	brk $F4.b		; 00 F4
	brk $78.b		; 00 78
	brk $D4.b		; 00 D4
	brk $78.b		; 00 78
	adc $E1FDD2.l,X		; 7F D2 FD E1
	inc $FDD2.w,X		; FE D2 FD
	sta [$F8.b]		; 87 F8
	phk		; 4B
	pea $F887.w		; F4 87 F8
	lsr A		; 4A
	sbc $80.b,X		; F5 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	dey		; 88
	sbc $20DF10.l		; EF 10 DF 20
	cmp $40BF20.l,X		; DF 20 BF 40
	adc $807F80.l,X		; 7F 80 7F 80
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra  60.b		; 80 3C
	bra  53.b		; 80 35
	bra  52.b		; 80 34
	bra  63.b		; 80 3F
	bra  63.b		; 80 3F
	bra  54.b		; 80 36
	cpy #$1E.b		; C0 1E
	cpy #$1E.b		; C0 1E
	.db $42, $01		; 42 01
	rti		; 40

	asl A		; 0A
	.db $42, $09		; 42 09
	rti		; 40

	brk $40.b		; 00 40
	brk $40.b		; 00 40
	ora #$0120.w		; 09 20 01
	jsr $0001.w		; 20 01 00
	eor [$00.b],Y		; 57 00
	eor [$00.b],Y		; 57 00
	eor [$00.b]		; 47 00
	sbc $00FF00.l,X		; FF 00 FF 00
	lda $00.b,S		; A3 00
	plb		; AB
	brk $2B.b		; 00 2B
	bra  40.b		; 80 28
	brk $A8.b		; 00 A8
	tay		; A8
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	pha		; 48
	brk $54.b		; 00 54
	brk $D4.b		; 00 D4
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F5.b		; 00 F5
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $7C0000.l		; 0F 00 00 7C
	brk $3D.b		; 00 3D
	brk $7C.b		; 00 7C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F8.b		; 00 F8
	brk $FE.b		; 00 FE
	brk $58.b		; 00 58
	.db $82, $01, $C0		; 82 01 C0
	cop $80.b		; 02 80
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	asl $00.b		; 06 00
	ora ($E1.b,X)		; 01 E1
	asl $00.b		; 06 00
	eor $00.b		; 45 00
	cmp $00.b,X		; D5 00
	mvp $FF,$00		; 44 00 FF
	brk $FF.b		; 00 FF
	brk $88.b		; 00 88
	brk $EA.b		; 00 EA
	brk $8A.b		; 00 8A
	plp		; 28
	sta ($00.b)		; 92 00
	rol A		; 2A
	rol A		; 2A
	sta ($00.b),Y		; 91 00
	brk $00.b		; 00 00
	brk $15.b		; 00 15
	.db $62, $00, $15		; 62 00 15
	rti		; 40

	and $14.b,X		; 35 14
	adc [$14.b],Y		; 77 14
	eor [$14.b],Y		; 57 14
	cmp $14.b,X		; D5 14
	sbc $14.b,X		; F5 14
	sbc [$14.b],Y		; F7 14
	cmp [$14.b],Y		; D7 14
	sbc [$14.b],Y		; F7 14
	sbc [$08.b],Y		; F7 08
	bra   8.b		; 80 08
	ldy #$88.b		; A0 88
	jsl $080208.l		; 22 08 02 08
	brk $08.b		; 00 08
	jsr $0008.w		; 20 08 00
	php		; 08
	brk $00.b		; 00 00
	cmp $00.b,X		; D5 00
	sta $00.b,X		; 95 00
	adc $00.b,X		; 75 00
	tas		; 1B
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $B7.b		; 00 B7
	brk $AB.b		; 00 AB
	brk $2A.b		; 00 2A
	bra 106.b		; 80 6A
	brk $8A.b		; 00 8A
	asl A		; 0A
	cpx $00.b		; E4 00
	brk $00.b		; 00 00
	brk $14.b		; 00 14
	pha		; 48
	brk $54.b		; 00 54
	brk $BF.b		; 00 BF
	brk $1F.b		; 00 1F
	brk $BF.b		; 00 BF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	rti		; 40

	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	sbc $01FE01.l,X		; FF 01 FE 01
	sbc $00FE01.l,X		; FF 01 FE 00
	sbc $1DFF00.l,X		; FF 00 FF 1D
	nop		; EA
	ora $FF.b,X		; 15 FF
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	brk $01.b		; 00 01
	ora ($01.b,X)		; 01 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $1D.b,X		; 15 1D
	brk $15.b		; 00 15
	eor $FE.b,X		; 55 FE
	pei ($BF.b)		; D4 BF
	eor $FF.b,X		; 55 FF
	cmp $00AA.w,X		; DD AA 00
	sbc $C7FF00.l,X		; FF 00 FF C7
	tsx		; BA
	eor ($FE.b,X)		; 41 FE
	brk $54.b		; 00 54
	rti		; 40

	pei ($00.b)		; D4 00
	eor $55.b,X		; 55 55
	cmp $0000.w,X		; DD 00 00
	brk $00.b		; 00 00
	mvp $00,$C6		; 44 C6 00
	rti		; 40

	sbc $40FFC0.l,X		; FF C0 FF 40
	sbc $40FF40.l,X		; FF 40 FF 40
	sbc $40FF40.l,X		; FF 40 FF 40
	sbc $80FF80.l,X		; FF 80 FF 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	ora $5FA5FF.l		; 0F FF A5 5F
	cmp $3F.b,S		; C3 3F
	lda $5F.b		; A5 5F
	beq  15.b		; F0 0F
	adc #$7017.w		; 69 17 70
	ora $003749.l		; 0F 49 37 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $1A.b		; 00 1A
	asl $AFB9.w		; 0E B9 AF
	cmp $AEC7.w		; CD C7 AE
	ldx #$F6.b		; A2 F6
	sbc ($6F.b,S),Y		; F3 6F
	sbc #$F1F3.w		; E9 F3 F1
	rtl		; 6B

	inx		; E8
	sbc $5800.w,Y		; F9 00 58
	brk $3C.b		; 00 3C
	brk $5F.b		; 00 5F
	brk $0E.b		; 00 0E
	brk $17.b		; 00 17
	brk $0F.b		; 00 0F
	brk $17.b		; 00 17
	brk $AF.b		; 00 AF
	ora $1C2F.w,Y		; 19 2F 1C
	and [$1C.b]		; 27 1C
	sbc [$8C.b],Y		; F7 8C
	ora $465B16.l		; 0F 16 5B 46
	phd		; 0B
	stx $03.b		; 86 03
	dec $06F9.w		; CE F9 06
	jsr ($FC03.w,X)		; FC 03 FC
	ora $7C.b,S		; 03 7C
	ora $FE.b,S		; 03 FE
	ora ($BE.b,X)		; 01 BE
	ora ($7E.b,X)		; 01 7E
	ora ($BE.b,X)		; 01 BE
	ora ($11.b,X)		; 01 11
	ora ($AA.b),Y		; 11 AA
	tax		; AA
	cmp $AADD.w,X		; DD DD AA
	tax		; AA
	sbc $3BBBFF.l,X		; FF FF BB 3B
	sbc $FF777F.l,X		; FF 7F 77 FF
	ora ($EE.b),Y		; 11 EE
	tax		; AA
	eor $DD.b,X		; 55 DD
	jsl $FF55AA.l		; 22 AA 55 FF
	brk $3B.b		; 00 3B
	cpy $7F.b		; C4 7F
	bra  -1.b		; 80 FF
	brk $11.b		; 00 11
	ora ($AA.b),Y		; 11 AA
	tax		; AA
	cmp $AADD.w,X		; DD DD AA
	tax		; AA
	sbc $BBBBFF.l,X		; FF FF BB BB
	sbc $FF77FF.l,X		; FF FF 77 FF
	ora ($EE.b),Y		; 11 EE
	tax		; AA
	eor $DD.b,X		; 55 DD
	jsl $FF55AA.l		; 22 AA 55 FF
	brk $BB.b		; 00 BB
	mvp $00,$FF		; 44 FF 00
	sbc $FFFE00.l,X		; FF 00 FE FF
	eor $FE.b,X		; 55 FE
	xce		; FB
	inc $FE55.w,X		; FE 55 FE
	bit #$55FE.w		; 89 FE 55
	inc $FC03.w,X		; FE 03 FC
	ora ($FC.b,S),Y		; 13 FC
	inc $FE01.w,X		; FE 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora ($FC.b,X)		; 01 FC
	ora $FC.b,S		; 03 FC
	ora $C1.b,S		; 03 C1
	adc ($D1.b),Y		; 71 D1
	adc ($F1.b,X)		; 61 F1
	eor ($D2.b,X)		; 41 D2
	.db $62, $9A, $62		; 62 9A 62
	bra 100.b		; 80 64
	bcs -60.b		; B0 C4
	ldy #$C4.b		; A0 C4
	ror $7F80.w,X		; 7E 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $87.b		; 00 87
	sta [$2D.b]		; 87 2D
	and $B51F1E.l		; 2F 1E 1F B5
	lda $B47F78.l,X		; BF 78 7F B4
	lda $B47F78.l,X		; BF 78 7F B4
	lda $D000F8.l,X		; BF F8 00 D0
	brk $E0.b		; 00 E0
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $86.b		; 00 86
	sbc $D22D.w,Y		; F9 2D D2
	tas		; 1B
	cpx $2B.b		; E4 2B
	pei ($77.b)		; D4 77
	dey		; 88
	lda [$48.b],Y		; B7 48
	adc $50AF90.l		; 6F 90 AF 50
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
	sbc $00F000.l,X		; FF 00 F0 00
	cpy #$1F.b		; C0 1F
	brk $6F.b		; 00 6F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $002000.l		; 0F 00 20 00
	bra  16.b		; 80 10
	cpy #$1B.b		; C0 1B
	cpx #$0B.b		; E0 0B
	cpx #$0F.b		; E0 0F
	beq   7.b		; F0 07
	beq   6.b		; F0 06
	bit $07.b,X		; 34 07
	asl A		; 0A
	cmp $05.b,S		; C3 05
	sbc ($20.b),Y		; F1 20
	tsb $10.b		; 04 10
	tsb $10.b		; 04 10
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	ora ($C8.b,X)		; 01 C8
	brk $34.b		; 00 34
	brk $0A.b		; 00 0A
	brk $00.b		; 00 00
	plb		; AB
	brk $A3.b		; 00 A3
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F1.b		; 00 F1
	brk $F5.b		; 00 F5
	brk $F5.b		; 00 F5
	brk $D5.b		; 00 D5
	brk $54.b		; 00 54
	trb $48.b		; 14 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl A		; 0A
	tsb $00.b		; 04 00
	asl A		; 0A
	brk $0A.b		; 00 0A
	brk $2A.b		; 00 2A
	brk $FE.b		; 00 FE
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $11.b		; 00 11
	brk $D7.b		; 00 D7
	brk $11.b		; 00 11
	brk $D5.b		; 00 D5
	brk $01.b		; 00 01
	ora ($06.b,X)		; 01 06
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plp		; 28
	dec $00.b		; C6 00
	plp		; 28
	jsl $2A00CC.l		; 22 CC 00 2A
	brk $BA.b		; 00 BA
	brk $88.b		; 00 88
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1D.b		; 00 1D
	brk $5F.b		; 00 5F
	ora ($5F.b,X)		; 01 5F
	brk $5A.b		; 00 5A
	brk $45.b		; 00 45
	ora $72.b		; 05 72
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ldy #$42.b		; A0 42
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	ora ($A4.b,X)		; 01 A4
	bit $B7.b,X		; 34 B7
	jsl $C008A2.l		; 22 A2 08 C0
	eor $3CC1.w,X		; 5D C1 3C
	bra -98.b		; 80 9E
	bra 126.b		; 80 7E
	brk $BF.b		; 00 BF
	brk $08.b		; 00 08
	rti		; 40

	trb $3641.w		; 1C 41 36
	ora ($22.b,X)		; 01 22
	brk $63.b		; 00 63
	brk $61.b		; 00 61
	brk $C1.b		; 00 C1
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	plb		; AB
	brk $AB.b		; 00 AB
	brk $B7.b		; 00 B7
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	rti		; 40

	ror $3E20.w,X		; 7E 20 3E
	brk $54.b		; 00 54
	brk $54.b		; 00 54
	trb $48.b		; 14 48
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	bra   1.b		; 80 01
	cpy #$01.b		; C0 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$FF.b		; C0 FF
	brk $7F.b		; 00 7F
	brk $BF.b		; 00 BF
	brk $BF.b		; 00 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	bra   0.b		; 80 00
	rti		; 40

	brk $40.b		; 00 40
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	phd		; 0B
	sbc $FF0A.w,X		; FD 0A FF
	asl A		; 0A
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	phd		; 0B
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	ora $05EF.w,X		; 1D EF 05
	sbc $00FA1D.l,X		; FF 1D FA 00
	sbc $B8FF00.l,X		; FF 00 FF B8
	eor [$A8.b],Y		; 57 A8
	sbc $10FFA8.l,X		; FF A8 FF 10
	ora $0500.w,X		; 1D 00 05
	ora $1D.b		; 05 1D
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tay		; A8
	clv		; B8
	brk $A8.b		; 00 A8
	brk $A8.b		; 00 A8
	eor ($FE.b,X)		; 41 FE
	phk		; 4B
	jsr ($B6D9.w,X)		; FC D9 B6
	brk $FD.b		; 00 FD
	cop $FC.b		; 02 FC
	adc $DB.b		; 65 DB
	phd		; 0B
	sbc [$12.b],Y		; F7 12
	xba		; EB
	brk $40.b		; 00 40
	ora ($48.b,X)		; 01 48
	eor #$03D8.w		; 49 D8 03
	brk $03.b		; 00 03
	brk $26.b		; 00 26
	rts		; 60

	tsb $1C00.w		; 0C 00 1C
	brk $FD.b		; 00 FD
	bra  -3.b		; 80 FD
	cop $FB.b		; 02 FB
	cop $FB.b		; 02 FB
	brk $FA.b		; 00 FA
	ora $B7.b		; 05 B7
	cpx #$FD.b		; E0 FD
	ora $D7.b,S		; 03 D7
	asl A		; 0A
	cop $01.b		; 02 01
	cop $01.b		; 02 01
	asl $01.b		; 06 01
	tsb $03.b		; 04 03
	ora $02.b		; 05 02
	lda #$0246.w		; A9 46 02
	tsb $102D.w		; 0C 2D 10
	bcs  15.b		; B0 0F
	tax		; AA
	ora $3C.b,X		; 15 3C
	sta $92.b,S		; 83 92
	lda $409F.w		; AD 9F 40
	asl $1BA1.w,X		; 1E A1 1B
	stz $0E.b		; 64 0E
	sbc ($C0.b),Y		; F1 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $A0.b		; 00 A0
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	beq  90.b		; F0 5A
	plx		; FA
	bit $56FC.w,X		; 3C FC 56
	inc $FF0F.w,X		; FE 0F FF
	stx $7E.b,Y		; 96 7E
	ora $7E96FF.l		; 0F FF 96 7E
	ora $000500.l		; 0F 00 05 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($C7.b,X)		; 01 C7
	sta $63.b		; 85 63
	sta [$71.b]		; 87 71
	cmp $B3.b		; C5 B3
	mvp $E0,$3B		; 44 3B E0
	txy		; 9B
	rol $19.b		; 26 19
	ldx #$9D.b		; A2 9D
	lda $00DF00.l,X		; BF 00 DF 00
	cmp $006F00.l		; CF 00 6F 00
	sbc [$00.b]		; E7 00
	adc [$00.b],Y		; 77 00
	sbc [$00.b],Y		; F7 00
	adc ($00.b,S),Y		; 73 00
	sbc $3FD57F.l,X		; FF 7F D5 3F
	nop		; EA
	and $E83FF5.l,X		; 3F F5 3F E8
	and $F03FE5.l,X		; 3F E5 3F F0
	sta $7F9FF0.l,X		; 9F F0 9F 7F
	bra  63.b		; 80 3F
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	cpy #$9F.b		; C0 9F
	rts		; 60

	sta $FFFF60.l,X		; 9F 60 FF FF
	eor $FF.b,X		; 55 FF
	tax		; AA
	sbc $88FF55.l,X		; FF 55 FF 88
	sbc $00FF45.l,X		; FF 45 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $88FF55.l,X		; FF 55 FF 88
	sbc $00FF45.l,X		; FF 45 FF 00
	sbc $FFFC01.l,X		; FF 01 FC FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $88FF55.l,X		; FF 55 FF 88
	sbc $00FF45.l,X		; FF 45 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $AAFF55.l,X		; FF 55 FF AA
	sbc $88FF55.l,X		; FF 55 FF 88
	sbc $00FF45.l,X		; FF 45 FF 00
	sbc $FF3F80.l,X		; FF 80 3F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $03.b		; 00 03
	jsr ($DC23.w,X)		; FC 23 DC
	ora $FD.b,S		; 03 FD
	plb		; AB
	eor $13.b,X		; 55 13
	sbc $57AA.w		; ED AA 57
	mvn $A8,$AB		; 54 AB A8
	mvn $03,$FC		; 54 FC 03
	jsr ($FD03.w,X)		; FC 03 FD
	cop $FD.b		; 02 FD
	cop $FD.b		; 02 FD
	cop $FF.b		; 02 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $A0.b		; 00 A0
	iny		; C8
	cmp ($8A.b)		; D2 8A
	cmp ($91.b,X)		; C1 91
	.db $82, $52, $81		; 82 52 81
	eor ($A3.b),Y		; 51 A3
	ora $27.b,S		; 03 27
	ora [$2B.b]		; 07 2B
	phd		; 0B
	sbc $00FD00.l,X		; FF 00 FD 00
	inc $FD00.w,X		; FE 00 FD
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $F4.b		; 00 F4
	brk $61.b		; 00 61
	ror $FDD2.w,X		; 7E D2 FD
	sbc ($FE.b,X)		; E1 FE
	cmp ($FD.b)		; D2 FD
	sbc ($FE.b,X)		; E1 FE
	phk		; 4B
	pea $F887.w		; F4 87 F8
	phk		; 4B
	pea $0080.w		; F4 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $23DF21.l,X		; DF 21 DF 23
	cmp $43BB23.l,X		; DF 23 BB 43
	tsx		; BA
	.db $42, $7E		; 42 7E
	stx $7D.b		; 86 7D
	sta $7D.b		; 85 7D
	sta $00.b		; 85 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $05.b		; 00 05
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $80.b		; 00 80
	sbc $BD00.w,X		; FD 00 BD
	brk $CF.b		; 00 CF
	brk $EF.b		; 00 EF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0200F8.l,X		; FF F8 00 02
	brk $42.b		; 00 42
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $07.b		; 00 07
	asl $7C.b		; 06 7C
	ora $7E.b,S		; 03 7E
	ora $D7.b,S		; 03 D7
	and $DF.b,S		; 23 DF
	ora ($FD.b,X)		; 01 FD
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	adc $80017F.l,X		; 7F 7F 01 80
	brk $80.b		; 00 80
	brk $28.b		; 00 28
	brk $20.b		; 00 20
	cop $00.b		; 02 00
	inc $FC00.w,X		; FE 00 FC
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cmp ($40.b),Y		; D1 40
	adc $C81F90.l,X		; 7F 90 1F C8
	ora $710764.l		; 0F 64 07 71
	ora ($7C.b,X)		; 01 7C
	brk $7F.b		; 00 7F
	brk $0A.b		; 00 0A
	bit $80.b		; 24 80
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $98.b		; 00 98
	brk $8E.b		; 00 8E
	brk $83.b		; 00 83
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40FF00.l,X		; FF 00 FF 40
	adc $000704.l,X		; 7F 04 07 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	ora ($00.b),Y		; 11 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $4CFD06.l,X		; FF 06 FD 4C
	cmp $2A.b,S		; C3 2A
	cpy $00.b		; C4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $3E.b		; 00 3E
	brk $5B.b		; 00 5B
	asl $F2.b		; 06 F2
	php		; 08
	inc $11.b		; E6 11
	cmp $9B23.w		; CD 23 9B
	eor [$A7.b]		; 47 A7
	sta $D73F3F.l		; 8F 3F 3F D7
	sbc $F8E916.l,X		; FF 16 E9 F8
	ora [$F1.b]		; 07 F1
	asl $1DE3.w		; 0E E3 1D
	cmp [$3B.b]		; C7 3B
	sta $DF3F77.l		; 8F 77 3F DF
	tyx		; BB
	sta $FF.b,S		; 83 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $80FFFF.l,X		; FF FF FF 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EF.b		; 00 EF
	beq -25.b		; F0 E7
	sed		; F8
	xce		; FB
	jsr ($7EFD.w,X)		; FC FD 7E
	inc $FF7F.w,X		; FE 7F FF
	adc $E97FFE.l,X		; 7F FE 7F E9
	adc $7A85FA.l,X		; 7F FA 85 7A
	eor $7F.b		; 45 7F
	rts		; 60

	sbc $78FF70.l,X		; FF 70 FF 78
	sbc $7EFF7C.l,X		; FF 7C FF 7E
	sbc $BF0061.l,X		; FF 61 00 BF
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	bpl  31.b		; 10 1F
	cmp ($01.b,X)		; C1 01
	brk $40.b		; 00 40
	rti		; 40

	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $3E.b		; 00 3E
	brk $0A.b		; 00 0A
	sbc $00FD0B.l,X		; FF 0B FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FC04.l,X		; FF 04 FC 00
	asl A		; 0A
	cop $0B.b		; 02 0B
	brk $00.b		; 00 00
	adc [$00.b],Y		; 77 00
	eor $00.b,X		; 55 00
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	lda #$BBFE.w		; A9 FE BB
	lsr $00.b,X		; 56 00
	sbc $02FF01.l,X		; FF 01 FF 02
	inc $F80F.w,X		; FE 0F F8
	and $0A7FE2.l,X		; 3F E2 7F 0A
	ora ($A9.b,X)		; 01 A9
	lda #$00BB.w		; A9 BB 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	ora $13.b,S		; 03 13
	tsb $30CE.w		; 0C CE 30
	beq -32.b		; F0 E0
	adc $E0.b,S		; 63 E0
	sta $103C80.l		; 8F 80 3C 10
	inx		; E8
	sta ($86.b)		; 92 86
	ora $807FBC.l		; 0F BC 7F 80
	sbc $1E000F.l,X		; FF 0F 00 1E
	ora ($78.b,X)		; 01 78
	ora [$F2.b]		; 07 F2
	ora $6897.w		; 0D 97 68
	bcs  64.b		; B0 40
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	ror $03.b,X		; 76 03
	dex		; CA
	pld		; 2B
	adc #$D0DF.w		; 69 DF D0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $34708C.l,X		; FF 8C 70 34
	cpy #$A0.b		; C0 A0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $61.b		; 00 61
	inc $FE01.w,X		; FE 01 FE
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
	cmp $3F.b,S		; C3 3F
	lda $5F.b		; A5 5F
	cmp $3F.b,S		; C3 3F
	lda $5F.b		; A5 5F
	eor $BF.b,S		; 43 BF
	adc #$7097.w		; 69 97 70
	sta $00D729.l		; 8F 29 D7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	ora $C9AEB1.l		; 0F B1 AE C9
	dec $A8.b		; C6 A8
	lda [$C8.b]		; A7 C8
	cmp [$66.b]		; C7 66
	sbc ($F6.b,X)		; E1 F6
	sbc ($6E.b),Y		; F1 6E
	sbc #$00F9.w		; E9 F9 00
	eor $3D00.w,Y		; 59 00 3D
	brk $5D.b		; 00 5D
	brk $3C.b		; 00 3C
	brk $1E.b		; 00 1E
	brk $0E.b		; 00 0E
	brk $16.b		; 00 16
	brk $F0.b		; 00 F0
	sta $F09DF2.l,X		; 9F F2 9D F0
	cmp $F555FA.l,X		; DF FA 55 F5
	phy		; 5A
	lda ($6D.b)		; B2 6D
	ora $9D0278.l		; 0F 78 02 9D
	sta $609F60.l,X		; 9F 60 9F 60
	cmp $20DF20.l,X		; DF 20 DF 20
	cmp $10EF20.l,X		; DF 20 EF 10
	sbc $007F00.l,X		; FF 00 7F 00
	brk $FF.b		; 00 FF
	jsl $FF00DD.l		; 22 DD 00 FF
	tax		; AA
	eor $55.b,X		; 55 55
	tax		; AA
	tax		; AA
	eor $FF.b,X		; 55 FF
	brk $AA.b		; 00 AA
	eor $FF.b,X		; 55 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	sed		; F8
	and $D2.b,S		; 23 D2
	ora ($E0.b,X)		; 01 E0
	plb		; AB
	lsr A		; 4A
	eor $B4.b,X		; 55 B4
	plb		; AB
	lsr A		; 4A
	sbc $4AAB1E.l,X		; FF 1E AB 4A
	inc $FC00.w,X		; FE 00 FC
	brk $FE.b		; 00 FE
	brk $F4.b		; 00 F4
	brk $EA.b		; 00 EA
	brk $F4.b		; 00 F4
	brk $E0.b		; 00 E0
	brk $F4.b		; 00 F4
	brk $00.b		; 00 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $18D300.l,X		; FF 00 D3 18
	cpy #$38.b		; C0 38
	cpy #$3C.b		; C0 3C
	cpy #$3C.b		; C0 3C
	cpy #$BF.b		; C0 BF
	cpy #$00.b		; C0 00
	sbc $18FF00.l,X		; FF 00 FF 18
	sbc $478763.l		; EF 63 87 47
	sta $43.b,S		; 83 43
	sta $43.b,S		; 83 43
	sta $00.b,S		; 83 00
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $18D300.l,X		; FF 00 D3 18
	cpy #$38.b		; C0 38
	cpy #$3C.b		; C0 3C
	cpy #$3C.b		; C0 3C
	cpy #$FF.b		; C0 FF
	rti		; 40

	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	clc		; 18
	sbc $478763.l		; EF 63 87 47
	sta $43.b,S		; 83 43
	sta $43.b,S		; 83 43
	sta $00.b,S		; 83 00
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $18D300.l,X		; FF 00 D3 18
	cmp [$3C.b]		; C7 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($FF.b,X)		; C1 FF
	rti		; 40

	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora $61EE.w,X		; 1D EE 61
	stx $43.b		; 86 43
	.db $82, $43, $82		; 82 43 82
	eor $82.b,S		; 43 82
	bra  31.b		; 80 1F
	ldx #$2D.b		; A2 2D
	bra   7.b		; 80 07
	tax		; AA
	and $52D5.w		; 2D D5 52
	tax		; AA
	and $78FF.w		; 2D FF 78
	tax		; AA
	and $007F.w		; 2D 7F 00
	eor $007F00.l,X		; 5F 00 7F 00
	eor [$00.b],Y		; 57 00
	and $005700.l		; 2F 00 57 00
	ora [$00.b]		; 07 00
	eor [$00.b],Y		; 57 00
	jmp ($BA80.w,X)		; 7C 80 BA
	mvp $00,$FE		; 44 FE 00
	inc $FF00.w,X		; FE 00 FF
	brk $55.b		; 00 55
	brk $BB.b		; 00 BB
	brk $55.b		; 00 55
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $47.b		; 00 47
	ora [$4B.b]		; 07 4B
	phb		; 8B
	eor [$07.b]		; 47 07
	phk		; 4B
	phd		; 0B
	stx $07.b		; 86 07
	lda $9E2F.w		; AD 2F 9E
	ora $F82FAD.l,X		; 1F AD 2F F8
	brk $F4.b		; 00 F4
	brk $F8.b		; 00 F8
	brk $F4.b		; 00 F4
	brk $F8.b		; 00 F8
	brk $D0.b		; 00 D0
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	brk $86.b		; 00 86
	sbc $F649.w,Y		; F9 49 F6
	sta $FA.b		; 85 FA
	eor $1BF2.w		; 4D F2 1B
	cpx $2B.b		; E4 2B
	pei ($1B.b)		; D4 1B
	cpx $3B.b		; E4 3B
	cpy $00.b		; C4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora [$FE.b]		; 07 FE
	cop $FF.b		; 02 FF
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $7FF4FF.l,X		; FF FF F4 7F
	adc $FFF8FF.l,X		; 7F FF F8 FF
	sbc $EF7FFF.l,X		; FF FF 7F EF
	ora $0000FF.l,X		; 1F FF 00 00
	brk $00.b		; 00 00
	phd		; 0B
	bra   0.b		; 80 00
	rti		; 40

	ora [$20.b]		; 07 20
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	inc $BCFC.w,X		; FE FC BC
	sbc $FBF9.w,Y		; F9 F9 FB
	ply		; 7A
	sbc [$F4.b],Y		; F7 F4
	sta $C0FF98.l,X		; 9F 98 FF C0
	sbc $000300.l,X		; FF 00 03 00
	ora $40.b,S		; 03 40
	asl $00.b		; 06 00
	tsb $1880.w		; 0C 80 18
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
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
	brk $E0.b		; 00 E0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0F.b		; 00 0F
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $FF.b		; 00 FF
	cop $FF.b		; 02 FF
	brk $FE.b		; 00 FE
	brk $FC.b		; 00 FC
	brk $F0.b		; 00 F0
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	cop $03.b		; 02 03
	tsb $0807.w		; 0C 07 08
	ora $DFE008.l		; 0F 08 E0 DF
	cpy #$B0.b		; C0 B0
	ora $3F3FCF.l		; 0F CF 3F 3F
	sbc $FFDDFF.l,X		; FF FF DD FF
	sbc $F40BF7.l,X		; FF F7 0B F4
	bra  95.b		; 80 5F
	brk $BF.b		; 00 BF
	ora $C03CF0.l		; 0F F0 3C C0
	iny		; C8
	brk $BE.b		; 00 BE
	brk $BE.b		; 00 BE
	brk $00.b		; 00 00
	sbc $FF8000.l,X		; FF 00 80 FF
	sbc $AFFFE5.l,X		; FF E5 FF AF
	sbc $FFFF7E.l,X		; FF 7E FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	brk $BB.b		; 00 BB
	brk $50.b		; 00 50
	brk $81.b		; 00 81
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $D8.b		; 00 D8
	sec		; 38
	ora $0D33F7.l		; 0F F7 33 0D
	cpx $E3.b		; E4 E3
	and #$A7F8.w		; 29 F8 A7
	sbc $FFFFE7.l,X		; FF E7 FF FF
	sbc $0107F8.l,X		; FF F8 07 01
	inc $FF00.w,X		; FE 00 FF
	cpx #$1F.b		; E0 1F
	sed		; F8
	ora [$5F.b]		; 07 5F
	brk $1B.b		; 00 1B
	brk $07.b		; 00 07
	brk $F0.b		; 00 F0
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $03.b		; 05 03
	jsr ($4EFB.w,X)		; FC FB 4E
	sbc $00A0.w,Y		; F9 A0 00
	pld		; 2B
	bra  -1.b		; 80 FF
	ora $008000.l		; 0F 00 80 00
	cmp $00.b,S		; C3 00
	brk $FF.b		; 00 FF
	lsr $5FA1.w,X		; 5E A1 5F
	brk $D4.b		; 00 D4
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	sbc ($7D.b),Y		; F1 7D
	and ($F7.b),Y		; 31 F7
	ora $E9.b		; 05 E9
	ora ($8C.b,X)		; 01 8C
	sta $9F94.w		; 8D 94 9F
	rti		; 40

	adc $0EFF80.l,X		; 7F 80 FF 0E
	brk $F2.b		; 00 F2
	tsb $A856.w		; 0C 56 A8
	inc $F200.w,X		; FE 00 F2
	brk $60.b		; 00 60
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	sbc $24B77C.l		; EF 7C B7 24
	sbc $00FF00.l		; EF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $2CFF00.l,X		; FF 00 FF 2C
	bpl 104.b		; 10 68
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF0F.l,X		; FF 0F FF 00
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
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $30.b		; 00 30
	cmp $10F709.l		; CF 09 F7 10
	sbc $0CF709.l		; EF 09 F7 0C
	sbc ($0A.b,S),Y		; F3 0A
	sbc $0C.b,X		; F5 0C
	sbc ($02.b,S),Y		; F3 02
	sbc $0000.w,X		; FD 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($F0.b,S),Y		; F3 F0
	rtl		; 6B

	inx		; E8
	sbc ($F0.b,S),Y		; F3 F0
	adc #$31E8.w		; 69 E8 31
	beq  91.b		; F0 5B
	plx		; FA
	and $5AFC.w,X		; 3D FC 5A
	plx		; FA
	ora $001700.l		; 0F 00 17 00
	ora $001700.l		; 0F 00 17 00
	ora $000500.l		; 0F 00 05 00
	ora $00.b,S		; 03 00
	ora $00.b		; 05 00
	ora $803D80.l,X		; 1F 80 3D 80
	and $C01580.l,X		; 3F 80 15 C0
	inc $9500.w		; EE 00 95
	rti		; 40

	tax		; AA
	rti		; 40

	sta $40.b,X		; 95 40
	adc $007F00.l,X		; 7F 00 7F 00
	adc $003F00.l,X		; 7F 00 3F 00
	lda $00BF00.l,X		; BF 00 BF 00
	lda $00BF00.l,X		; BF 00 BF 00
	sbc $00FD00.l,X		; FF 00 FD 00
	sbc $005500.l,X		; FF 00 55 00
	inc $5500.w		; EE 00 55
	brk $AA.b		; 00 AA
	brk $55.b		; 00 55
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $55.b		; 00 55
	brk $EE.b		; 00 EE
	brk $57.b		; 00 57
	ora $AF.b,S		; 03 AF
	tsb $5F.b		; 04 5F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	and $80FF.w		; 2D FF 80
	sbc $1FFF00.l,X		; FF 00 FF 1F
	sbc $00FFF0.l,X		; FF F0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C012.w		; ED 12 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FD.b		; 00 FD
	brk $FF.b		; 00 FF
	brk $D5.b		; 00 D5
	bra -18.b		; 80 EE
	jsr $08FD.w		; 20 FD 08
	inc $FF04.w,X		; FE 04 FF
.ACCU 8
.INDEX 8
	sep #$FF		; E2 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	brk $07.b		; 00 07
	brk $03.b		; 00 03
	brk $FF.b		; 00 FF
	asl $1CFD.w,X		; 1E FD 1C
	sbc $0E451E.l,X		; FF 1E 45 0E
	sbc $1E551E.l		; EF 1E 55 1E
	plb		; AB
	asl $1E55.w,X		; 1E 55 1E
	cpx #$00.b		; E0 00
	sep #$00		; E2 00
	cpx #$00.b		; E0 00
	beq   0.b		; F0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	bit $3CC1.w,X		; 3C C1 3C
	cpy #$3C.b		; C0 3C
	cpy #$3C.b		; C0 3C
	cpy #$3C.b		; C0 3C
	cmp ($3C.b,X)		; C1 3C
	cmp $3C.b,S		; C3 3C
	cmp ($3F.b,X)		; C1 3F
	cpy #$42.b		; C0 42
	sta $43.b,S		; 83 43
	sta $43.b,S		; 83 43
	sta $43.b,S		; 83 43
	sta $42.b,S		; 83 42
	sta $40.b,S		; 83 40
	sta $42.b,S		; 83 42
	sta ($40.b,X)		; 81 40
	bra  60.b		; 80 3C
	cmp ($3C.b,X)		; C1 3C
	cpy #$3C.b		; C0 3C
	cpy #$3C.b		; C0 3C
	cpy #$3C.b		; C0 3C
	cmp ($3C.b,X)		; C1 3C
	eor $7C.b,S		; 43 7C
	sta ($FF.b,X)		; 81 FF
	brk $42.b		; 00 42
	sta $43.b,S		; 83 43
	sta $43.b,S		; 83 43
	sta $43.b,S		; 83 43
	sta $42.b,S		; 83 42
	sta $40.b,S		; 83 40
	sta $02.b,S		; 83 02
	sta ($00.b,X)		; 81 00
	brk $3C.b		; 00 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($3C.b,X)		; C1 3C
	eor ($7C.b,X)		; 41 7C
	sta ($FC.b,X)		; 81 FC
	ora ($43.b,X)		; 01 43
	.db $82, $43, $82		; 82 43 82
	eor $82.b,S		; 43 82
	eor $82.b,S		; 43 82
	eor $82.b,S		; 43 82
	eor $82.b,S		; 43 82
	ora $82.b,S		; 03 82
	ora $02.b,S		; 03 02
	dey		; 88
	brk $55.b		; 00 55
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $23.b		; 00 23
	jsl $AB0001.l		; 22 01 00 AB
	tax		; AA
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00DD00.l,X		; FF 00 DD 00
	sbc $005500.l,X		; FF 00 55 00
	stz $2D1F.w,X		; 9E 1F 2D
	and $2D1F1E.l		; 2F 1E 1F 2D
	and $2D1F1E.l		; 2F 1E 1F 2D
	and $2C1F1E.l		; 2F 1E 1F 2C
	and $D000E0.l		; 2F E0 00 D0
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	brk $E0.b		; 00 E0
	brk $D0.b		; 00 D0
	brk $17.b		; 00 17
	inx		; E8
	and [$C8.b],Y		; 37 C8
	ora [$E8.b],Y		; 17 E8
	and [$C8.b],Y		; 37 C8
	ora [$E8.b],Y		; 17 E8
	and [$C8.b],Y		; 37 C8
	and [$C8.b],Y		; 37 C8
	lda $000050.l		; AF 50 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $10EF00.l,X		; FF 00 EF 10
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
	brk $01.b		; 00 01
	sbc $F801.w,X		; FD 01 F8
	brk $FA.b		; 00 FA
	ora $F4.b,S		; 03 F4
	ora [$F0.b]		; 07 F0
	ora [$E0.b]		; 07 E0
	ora $E01FD0.l		; 0F D0 1F E0
	and $0F1806.l,X		; 3F 06 18 0F
	bpl  28.b		; 10 1C
	jsr $6018.w		; 20 18 60
	sec		; 38
	rti		; 40

	bvs -128.b		; 70 80
	rts		; 60

	bra -64.b		; 80 C0
	brk $FF.b		; 00 FF
	sbc $FF.b,S		; E3 FF
	sbc [$DD.b],Y		; F7 DD
	sbc $F8FEFE.l,X		; FF FE FE F8
	sed		; F8
.ACCU 8
	sep #$E3		; E2 E3
	wai		; CB
	cmp $3E9F1F.l		; CF 1F 9F 3E
	brk $3E.b		; 00 3E
	brk $3E.b		; 00 3E
	brk $02.b		; 00 02
	ora ($08.b,X)		; 01 08
	ora [$23.b]		; 07 23
	trb $304C.w		; 1C 4C 30
	bcc  96.b		; 90 60
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $0000FF.l,X		; 3F FF 00 00
	brk $00.b		; 00 00
	sbc $FF0000.l,X		; FF 00 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	sbc $F8FFFD.l,X		; FF FD FF F8
	sbc $1F1FFD.l,X		; FF FD 1F 1F
	eor [$C7.b]		; 47 C7
	sbc $F3.b,S		; E3 F3
	sbc $7CF9.w,Y		; F9 F9 7C
	jsr ($000F.w,X)		; FC 0F 00
	ora $008F00.l		; 0F 00 8F 00
	ora [$E0.b]		; 07 E0
	cpy #$38.b		; C0 38
	ora ($0C.b)		; 12 0C
	ora #$06.b		; 09 06
	tsb $03.b		; 04 03
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	asl $11FF.w		; 0E FF 11
	sbc ($27.b),Y		; F1 27
	cpx #$0F.b		; E0 0F
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0E.b		; 00 0E
	brk $18.b		; 00 18
	brk $30.b		; 00 30
	brk $00.b		; 00 00
	sbc $1CFF07.l,X		; FF 07 FF 1C
	jsr ($C447.w,X)		; FC 47 C4
	adc $00FFE0.l,X		; 7F E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	sec		; 38
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F8.b		; 00 F8
	sei		; 78
	ora [$00.b]		; 07 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$00.b]		; 07 00
	sed		; F8
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FE.b		; 00 FE
	asl $FF.b		; 06 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $84.b		; 00 84
	xce		; FB
	.db $42, $7D		; 42 7D
	bit $3B.b		; 24 3B
	sta ($1D.b)		; 92 1D
	dex		; CA
	ora $0FE8.w		; 0D E8 0F
	inc $05.b,X		; F6 05
	inc $05.b,X		; F6 05
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	rts		; 60

	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0E.b		; 00 0E
	inc $7E96.w,X		; FE 96 7E
	ora $7E96FF.l		; 0F FF 96 7E
	ora $7E96FF.l		; 0F FF 96 7E
	ora $7E96FF.l		; 0F FF 96 7E
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cpy #$00.b		; C0 00
	cpy $00.b		; C4 00
	cpy #$00.b		; C0 00
	pha		; 48
	php		; 08
	rti		; 40

	brk $6A.b		; 00 6A
	rol A		; 2A
	mvp $6A,$04		; 44 04 6A
	rol A		; 2A
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $00F700.l,X		; FF 00 F7 00
	sbc $00D500.l,X		; FF 00 D5 00
	xce		; FB
	brk $D5.b		; 00 D5
	brk $00.b		; 00 00
	brk $44.b		; 00 44
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	php		; 08
	brk $00.b		; 00 00
	tax		; AA
	tax		; AA
	mvp $AA,$44		; 44 44 AA
	tax		; AA
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00F700.l,X		; FF 00 F7 00
	sbc $005500.l,X		; FF 00 55 00
	tyx		; BB
	brk $55.b		; 00 55
	brk $1F.b		; 00 1F
	ora ($5F.b),Y		; 11 5F
	ora $3F.b,S		; 03 3F
	asl $3F.b		; 06 3F
	tsb $7B.b		; 04 7B
	php		; 08
	sbc $007788.l,X		; FF 88 77 00
	sbc [$84.b],Y		; F7 84
	beq   0.b		; F0 00
	beq   0.b		; F0 00
	cpx #$00.b		; E0 00
	cpx #$00.b		; E0 00
	cpy $00.b		; C4 00
	rti		; 40

	brk $C8.b		; 00 C8
	ora ($48.b,X)		; 01 48
	brk $FF.b		; 00 FF
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	mvp $00,$00		; 44 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $42.b		; 00 42
	sbc $08FF30.l,X		; FF 30 FF 08
	sbc $04FF0C.l,X		; FF 0C FF 04
	sbc $02FF06.l,X		; FF 06 FF 02
	sbc $07FF03.l,X		; FF 03 FF 07
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	ora ($1E.b,X)		; 01 1E
	eor $1E.b		; 45 1E
	sta ($1E.b,X)		; 81 1E
	bit #$1E.b		; 89 1E
	cmp ($1E.b,X)		; C1 1E
	sbc #$3E.b		; E9 3E
	cmp $1E.b		; C5 1E
	sbc $E02A.w,X		; FD 2A E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $40.b		; 00 40
	brk $3F.b		; 00 3F
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	cpy #$3F.b		; C0 3F
	cpy #$3C.b		; C0 3C
.ACCU 16
.INDEX 16
	rep #$3C		; C2 3C
	cmp $3C.b,S		; C3 3C
	cpy #$C03C.w		; C0 3C C0
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  65.b		; 80 41
	sta $40.b,S		; 83 40
	sta $43.b,S		; 83 43
	sta $43.b,S		; 83 43
	sta $FF.b,S		; 83 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3C.b		; 00 3C
	cop $3C.b		; 02 3C
	eor $3C.b,S		; 43 3C
	cpy #$C03C.w		; C0 3C C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor ($83.b,X)		; 41 83
	rti		; 40

	sta $43.b,S		; 83 43
	sta $43.b,S		; 83 43
	sta $FC.b,S		; 83 FC
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	ora ($3C.b,X)		; 01 3C
	ora ($3C.b,X)		; 01 3C
	eor ($3C.b,X)		; 41 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($03.b,X)		; C1 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $03.b		; 02 03
	cop $43.b		; 02 43
	.db $82, $43, $82		; 82 43 82
	eor $82.b,S		; 43 82
	eor $82.b,S		; 43 82
	ora [$15.b],Y		; 17 15
	tax		; AA
	tay		; A8
	inc $AAFC.w,X		; FE FC AA
	tay		; A8
	inc $DEFC.w,X		; FE FC DE
	jsr ($FCFE.w,X)		; FC FE FC
	lsr $FC.b,X		; 56 FC
	nop		; EA
	brk $57.b		; 00 57
	brk $03.b		; 00 03
	brk $57.b		; 00 57
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $78.b		; 00 78
	adc $783F34.l,X		; 7F 34 3F 78
	adc $78BFB4.l,X		; 7F B4 BF 78
	adc $78BFB4.l,X		; 7F B4 BF 78
	adc $80BFB4.l,X		; 7F B4 BF 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $6F.b		; 00 6F
	bcc -81.b		; 90 AF
	bvc 127.b		; 50 7F
	bcc -17.b		; 90 EF
	brk $6F.b		; 00 6F
	bra -81.b		; 80 AF
	rts		; 60

	adc $409FA0.l		; 6F A0 9F 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bmi   0.b		; 30 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	inc $FB00.w,X		; FE 00 FB
	brk $DF.b		; 00 DF
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $06.b		; 00 06
	ora ($31.b,X)		; 01 31
	asl $708F.w		; 0E 8F 70
	sbc $F202.w,X		; FD 02 F2
	ora $E7.b		; 05 E7
	asl A		; 0A
	txy		; 9B
	bit $7A.b		; 24 7A
	sty $B3EA.w		; 8C EA B3
	stx $004F.w		; 8E 4F 00
	and $0D0102.l,X		; 3F 02 01 0D
	cop $1B.b		; 02 1B
	tsb $67.b		; 04 67
	clc		; 18
	sta $40BC60.l,X		; 9F 60 BC 40
	beq   0.b		; F0 00
	cpy #$A000.w		; C0 00 A0
	and $017FC0.l,X		; 3F C0 7F 01
	ror $C645.w,X		; 7E 45 C6
	ora ($80.b)		; 12 80
	dec A		; 3A
	bra  16.b		; 80 10
	bra  70.b		; 80 46
	cpy $C0.b		; C4 C0
	brk $80.b		; 00 80
	brk $81.b		; 00 81
	brk $39.b		; 00 39
	brk $6F.b		; 00 6F
	brk $47.b		; 00 47
	brk $6F.b		; 00 6F
	brk $3B.b		; 00 3B
	brk $3D.b		; 00 3D
	and $B77F7B.l,X		; 3F 7B 7F B7
	inc $FC7F.w,X		; FE 7F FC
	sbc $F8FFFC.l		; EF FC FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	jsr $40C1.w		; 20 C1 40
	sta $C0.b,S		; 83 C0
	asl $80.b		; 06 80
	tsb $0C00.w		; 0C 00 0C
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	sbc $80FFFF.l,X		; FF FF FF 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cmp $FFEFFF.l,X		; DF FF EF FF
	sbc [$3F.b],Y		; F7 3F
	sbc $1FFB1F.l,X		; FF 1F FB 1F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $C0010F.l,X		; FF 0F 01 C0
	ora ($E0.b,X)		; 01 E0
	brk $30.b		; 00 30
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	bra 127.b		; 80 7F
	bra 127.b		; 80 7F
	rti		; 40

	and $203F40.l,X		; 3F 40 3F 20
	sta $209F00.l,X		; 9F 00 9F 20
	sta $809F00.l,X		; 9F 00 9F 80
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $00.b		; 00 00
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $00FE02.l,X		; FF 02 FE 00
	jsr ($FC05.w,X)		; FC 05 FC
	ora $F8.b,S		; 03 F8
	phd		; 0B
	sed		; F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	sta $003F80.l,X		; 9F 80 3F 00
	adc $007F00.l,X		; 7F 00 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rts		; 60

	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FB.b		; 00 FB
	brk $FA.b		; 00 FA
	ora ($FB.b,X)		; 01 FB
	brk $FA.b		; 00 FA
	ora ($FB.b,X)		; 01 FB
	brk $FA.b		; 00 FA
	ora ($FB.b,X)		; 01 FB
	brk $FA.b		; 00 FA
	ora ($04.b,X)		; 01 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $77.b		; 00 77
	ora [$6A.b],Y		; 17 6A
	asl A		; 0A
	adc $8FAF1F.l,X		; 7F 1F AF 8F
	and $9FBD1F.l,X		; 3F 1F BD 9F
	and $9FB51F.l,X		; 3F 1F B5 9F
	inx		; E8
	brk $F5.b		; 00 F5
	brk $E0.b		; 00 E0
	brk $70.b		; 00 70
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $77.b		; 00 77
	adc [$AA.b],Y		; 77 AA
	tax		; AA
	sbc $EFEFFF.l,X		; FF FF EF EF
	sbc $FFDDFF.l,X		; FF FF DD FF
	sbc $FF55FF.l,X		; FF FF 55 FF
	dey		; 88
	brk $55.b		; 00 55
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $73.b		; 00 73
	cop $F1.b		; 02 F1
	sta ($F2.b,X)		; 81 F2
	txa		; 8A
	sbc $D5F1C3.l,X		; FF C3 F1 D5
	pei ($EA.b)		; D4 EA
	inc $ED.b,X		; F6 ED
	cli		; 58
	pea $00CC.w		; F4 CC 00
	lsr $4D00.w		; 4E 00 4D
	brk $2C.b		; 00 2C
	brk $2E.b		; 00 2E
	brk $17.b		; 00 17
	brk $13.b		; 00 13
	brk $0B.b		; 00 0B
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	tsb $FF.b		; 04 FF
	lsr $FD.b,X		; 56 FD
	phd		; 0B
	sbc $7F558B.l,X		; FF 8B 55 7F
	brk $42.b		; 00 42
	brk $00.b		; 00 00
	sbc $00FB00.l,X		; FF 00 FB 00
	brk $A9.b		; 00 A9
	brk $F4.b		; 00 F4
	brk $74.b		; 00 74
	bra   0.b		; 80 00
	xce		; FB
	phd		; 0B
	sbc $05.b,X		; F5 05
	ora $0B0A0F.l		; 0F 0F 0A 0B
	sbc ($33.b)		; F2 33
	cmp $36.b,X		; D5 36
	sbc $77.b,X		; F5 77
	phk		; 4B
	sbc $4004.w,X		; FD 04 40
	asl A		; 0A
	brk $F0.b		; 00 F0
	brk $F4.b		; 00 F4
	brk $0C.b		; 00 0C
	cpy #$C009.w		; C0 09 C0
	php		; 08
	bra   2.b		; 80 02
	brk $FD.b		; 00 FD
	rol $F5.b,X		; 36 F5
	rol A		; 2A
	sbc ($3E.b,X)		; E1 3E
	sbc ($7E.b,X)		; E1 7E
	sbc ($7E.b,X)		; E1 7E
	cmp $FC.b,S		; C3 FC
	sbc ($FE.b,X)		; E1 FE
	phk		; 4B
	pea $0040.w		; F4 40 00
	rti		; 40

	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3C.b		; 00 3C
	cpy #$C03C.w		; C0 3C C0
	bit $3CC0.w,X		; 3C C0 3C
	cpy #$C03C.w		; C0 3C C0
	bit $18C0.w,X		; 3C C0 18
	cpy #$A300.w		; C0 00 A3
	eor $83.b,S		; 43 83
	eor $83.b,S		; 43 83
	eor $83.b,S		; 43 83
	eor $83.b,S		; 43 83
	eor $83.b,S		; 43 83
	eor $83.b,S		; 43 83
	adc $87.b,S		; 63 87
	bit $3CC7.w,X		; 3C C7 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($3C.b,X)		; C1 3C
	cmp ($18.b,X)		; C1 18
	cmp [$08.b]		; C7 08
	lda [$43.b]		; A7 43
	.db $82, $43, $82		; 82 43 82
	eor $82.b,S		; 43 82
	eor $82.b,S		; 43 82
	eor $82.b,S		; 43 82
	eor $82.b,S		; 43 82
	adc ($86.b,X)		; 61 86
	and $C2.b,X		; 35 C2
	inc $56FC.w		; EE FC 56
	jsr ($FCA2.w,X)		; FC A2 FC
	lsr $FC.b,X		; 56 FC
	cop $FC.b		; 02 FC
	lsr $FC.b		; 46 FC
	cop $FC.b		; 02 FC
	txa		; 8A
	stz $03.b,X		; 74 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $67.b		; 00 67
	bra -89.b		; 80 A7
	rti		; 40

	adc $44AB80.l		; 6F 80 AB 44
	adc $40A784.l		; 6F 84 A7 40
	eor ($A1.b)		; 52 A1
	bcs  67.b		; B0 43
	clc		; 18
	brk $18.b		; 00 18
	brk $18.b		; 00 18
	brk $1C.b		; 00 1C
	brk $1C.b		; 00 1C
	cop $1E.b		; 02 1E
	ora ($0E.b,X)		; 01 0E
	brk $0C.b		; 00 0C
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FC.b		; 00 FC
	ora ($7F.b,X)		; 01 7F
	sta ($7F.b,X)		; 81 7F
	plp		; 28
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $80.b,S		; 03 80
	sta ($7E.b,X)		; 81 7E
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FC00.l,X		; FF 00 FC 01
	sbc ($04.b,S),Y		; F3 04
	stz $7325.w		; 9C 25 73
	ora ($3F.b,S),Y		; 13 3F
	lda $00FFE0.l,X		; BF E0 FF 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $0C.b		; 00 0C
	ora $65.b,S		; 03 65
	inc A		; 1A
	bit $C0C0.w,X		; 3C C0 C0
	brk $00.b		; 00 00
	brk $F4.b		; 00 F4
	ora ($9A.b,X)		; 01 9A
	and ($D0.b,X)		; 21 D0
	ora ($66.b),Y		; 11 66
	and [$A4.b]		; 27 A4
	lda $80FB28.l,X		; BF 28 FB 80
	sbc $0EFF00.l,X		; FF 00 FF 0E
	brk $62.b		; 00 62
	trb $E01E.w		; 1C 1E E0
	sei		; 78
	bra  64.b		; 80 40
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F0.b		; 00 F0
	brk $A7.b		; 00 A7
	ora [$70.b]		; 07 70
	and $00BF20.l,X		; 3F 20 BF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	bra  -8.b		; 80 F8
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	ora ($FD.b,X)		; 01 FD
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $2CFFFC.l		; EF FC FF 2C
	sbc [$AE.b],Y		; F7 AE
	xce		; FB
	cmp $3FC77D.l,X		; DF 7D C7 3F
	sep #$00		; E2 00
	clc		; 18
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	bne  12.b		; D0 0C
	bne   6.b		; D0 06
	ldy #$F803.w		; A0 03 F8
	ora ($FD.b,X)		; 01 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $7F.b,S		; E3 7F
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00.b,S		; E3 00
	adc $FF0FFF.l,X		; 7F FF 0F FF
	ora $FF1FFB.l		; 0F FB 1F FF
	inc A		; 1A
	sbc [$3A.b],Y		; F7 3A
	sbc $F9DF75.l		; EF 75 DF F9
	ror $0087.w,X		; 7E 87 00
	tsb $0C00.w		; 0C 00 0C
	brk $18.b		; 00 18
	ora $18.b		; 05 18
	ora $30.b		; 05 30
	phd		; 0B
	rts		; 60

	ora [$C0.b]		; 07 C0
	tda		; 7B
	brk $04.b		; 00 04
	stz $9801.w		; 9C 01 98
	ora $98.b,S		; 03 98
	eor ($58.b,X)		; 41 58
	mvp $80,$5C		; 44 5C 80
	lda $00BF80.l,X		; BF 80 BF 00
	and $660063.l,X		; 3F 63 00 66
	brk $64.b		; 00 64
	brk $A6.b		; 00 A6
	brk $A3.b		; 00 A3
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $4B.b		; 00 4B
	sei		; 78
	ora [$30.b]		; 07 30
	sta [$30.b],Y		; 97 30
	ora [$30.b],Y		; 17 30
	eor [$70.b],Y		; 57 70
	ora [$F0.b],Y		; 17 F0
	ora [$F0.b],Y		; 17 F0
	ora [$F0.b],Y		; 17 F0
	sty $00.b		; 84 00
	iny		; C8
	brk $48.b		; 00 48
	brk $C8.b		; 00 C8
	brk $88.b		; 00 88
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0F.b		; 00 0F
	sbc $0F7E96.l,X		; FF 96 7E 0F
	sbc $0F7E96.l,X		; FF 96 7E 0F
	sbc $0F7E96.l,X		; FF 96 7E 0F
	sbc $007E96.l,X		; FF 96 7E 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $2E.b		; 00 2E
	ora $201F35.l,X		; 1F 35 1F 20
	ora $209FB5.l,X		; 1F B5 9F 20
	ora $209FA4.l,X		; 1F A4 9F 20
	ora $E095AA.l,X		; 1F AA 95 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $E0.b		; 00 E0
	brk $60.b		; 00 60
	brk $EE.b		; 00 EE
	sbc $20FF55.l,X		; FF 55 FF 20
	sbc $00FF55.l,X		; FF 55 FF 00
	sbc $00FF04.l,X		; FF 04 FF 00
	sbc $0055AA.l,X		; FF AA 55 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $EE.b		; 00 EE
	xce		; FB
	eor [$FC.b],Y		; 57 FC
	jsr $55FF.w		; 20 FF 55
	sbc $04FF00.l,X		; FF 00 FF 04
	sbc $AAFF00.l,X		; FF 00 FF AA
	eor $04.b,X		; 55 04
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $AC.b		; 00 AC
	lda $D654.w		; AD 54 D6
	stp		; DB
	and $00C07F.l,X		; 3F 7F C0 00
	sbc $00FF04.l,X		; FF 04 FF 00
	sbc $5255AA.l,X		; FF AA 55 52
	brk $29.b		; 00 29
	brk $C0.b		; 00 C0
	brk $3F.b		; 00 3F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A6.b		; 00 A6
	plb		; AB
	eor $E047.w,X		; 5D 47 E0
	sta $007FD5.l,X		; 9F D5 7F 00
	sbc $00FF04.l,X		; FF 04 FF 00
	sbc $5455AA.l,X		; FF AA 55 54
	brk $B8.b		; 00 B8
	brk $60.b		; 00 60
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E1.b		; 00 E1
	inc $F44B.w,X		; FE 4B F4
	and $F44BE0.l,X		; 3F E0 4B F4
	ora $E41BE0.l,X		; 1F E0 1B E4
	ora $55AAE0.l,X		; 1F E0 AA 55
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
	brk $80.b		; 00 80
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tax		; AA
	eor $00.b,X		; 55 00
	sbc $7FFF00.l,X		; FF 00 FF 7F
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	rti		; 40

	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	tax		; AA
	eor $00.b,X		; 55 00
	sbc $BFFF00.l,X		; FF 00 FF BF
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	eor ($00.b,X)		; 41 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $AAFF00.l,X		; FF 00 FF AA
	eor $01.b,X		; 55 01
	inc $FE01.w,X		; FE 01 FE
	lda $00FFFE.l,X		; BF FE FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $FC.b		; 02 FC
	tax		; AA
	mvn $A8,$56		; 54 56 A8
	plb		; AB
	mvn $88,$77		; 54 77 88
	tyx		; BB
	mvp $00,$FF		; 44 FF 00
	sbc $000300.l,X		; FF 00 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	adc ($87.b,S),Y		; 73 87
	bmi -57.b		; 30 C7
	clc		; 18
	sbc $38.b,S		; E3 38
	cmp $18.b,S		; C3 18
	sbc $3C.b,S		; E3 3C
	cmp ($1C.b,X)		; C1 1C
	sbc ($3C.b,X)		; E1 3C
	cmp ($08.b,X)		; C1 08
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $10FE02.l,X		; FF 02 FE 10
	sbc ($80.b),Y		; F1 80
	sta $000000.l		; 8F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $0E.b		; 00 0E
	brk $70.b		; 00 70
	brk $00.b		; 00 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $00FC00.l,X		; FF 00 FC 00
	jsr ($7C60.w,X)		; FC 60 7C
	ora ($9F.b,S),Y		; 13 9F
	php		; 08
	cmp $000000.l		; CF 00 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $83.b		; 00 83
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $6C.b		; 00 6C
	sbc $33.b,S		; E3 33
	beq  28.b		; F0 1C
	trb $0F4F.w		; 1C 4F 0F
	sbc $0F.b,S		; E3 0F
	rti		; 40

	ora $001F10.l		; 0F 10 1F 00
	sbc $0C0010.l,X		; FF 10 00 0C
	brk $E3.b		; 00 E3
	brk $B0.b		; 00 B0
	brk $10.b		; 00 10
	brk $B0.b		; 00 B0
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $7F7F80.l,X		; FF 80 7F 7F
	brk $80.b		; 00 80
	bra  -1.b		; 80 FF
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $7F.b		; 00 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	nop		; EA
	sbc $05.b		; E5 05
	inc A		; 1A
	tas		; 1B
	sed		; F8
	sbc $08E3E2.l,X		; FF E2 E3 08
	cmp ($1C.b,X)		; C1 1C
	cmp ($08.b,X)		; C1 08
	cmp ($05.b,X)		; C1 05
	brk $1A.b		; 00 1A
	brk $E4.b		; 00 E4
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	brk $36.b		; 00 36
	brk $22.b		; 00 22
	brk $36.b		; 00 36
	brk $00.b		; 00 00
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $17.b		; 00 17
	beq  23.b		; F0 17
	beq  23.b		; F0 17
	beq  23.b		; F0 17
	beq  23.b		; F0 17
	beq  19.b		; F0 13
	beq  11.b		; F0 0B
	sed		; F8
	ora #$08F8.w		; 09 F8 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0C.b		; 00 0C
	brk $04.b		; 00 04
	brk $06.b		; 00 06
	brk $F7.b		; 00 F7
	brk $F2.b		; 00 F2
	ora $F4.b		; 05 F4
	ora $F2.b,S		; 03 F2
	ora $F4.b		; 05 F4
	ora $F2.b,S		; 03 F2
	ora $F4.b		; 05 F4
	ora $EA.b,S		; 03 EA
	ora $08.b		; 05 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $0F.b		; 00 0F
	sbc $3FFA5A.l,X		; FF 5A FA 3F
	sbc $3CFA5A.l,X		; FF 5A FA 3C
	jsr ($FA5A.w,X)		; FC 5A FA
	bit $5AFC.w,X		; 3C FC 5A
	plx		; FA
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	ora $00.b		; 05 00
	adc ($1E.b,X)		; 61 1E
	ror A		; 6A
	ora $75.b,X		; 15 75
	asl A		; 0A
	ror A		; 6A
	ora $77.b,X		; 15 77
	php		; 08
	tda		; 7B
	tsb $7F.b		; 04 7F
	brk $FF.b		; 00 FF
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $01.b		; 00 01
	inc $55AA.w,X		; FE AA 55
	eor $AA.b,X		; 55 AA
	tax		; AA
	eor $77.b,X		; 55 77
	dey		; 88
	tyx		; BB
	mvp $00,$FF		; 44 FF 00
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FC0300.l,X		; FF 00 03 FC
	brk $FF.b		; 00 FF
	sbc $01FFFF.l,X		; FF FF FF 01
	ora $808000.l		; 0F 00 80 80
	cpx #$FFE0.w		; E0 E0 FF
	sbc $00FF03.l,X		; FF 03 FF 00
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $1F.b		; 00 1F
	brk $F7.b		; 00 F7
	iny		; C8
	xce		; FB
	mvp $42,$FD		; 44 FD 42
	sbc $FE42.w,X		; FD 42 FE
	eor ($FF.b,X)		; 41 FF
	rti		; 40

	sbc $80FF80.l,X		; FF 80 FF 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $5FA5FF.l		; 0F FF A5 5F
	cmp $3F.b,S		; C3 3F
	lda $5F.b		; A5 5F
	beq  15.b		; F0 0F
	adc #$7097.w		; 69 97 70
	sta $0057A9.l		; 8F A9 57 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $28.b		; 00 28
	sec		; 38
	lsr A		; 4A
	ply		; 7A
	eor ($71.b),Y		; 51 71
	rol A		; 2A
	rol A		; 2A
	and [$27.b]		; 27 27
	wai		; CB
	wai		; CB
	cmp [$C7.b]		; C7 C7
	plb		; AB
	plb		; AB
	cmp $008D00.l		; CF 00 8D 00
	stz $F500.w,X		; 9E 00 F5
	brk $F8.b		; 00 F8
	brk $74.b		; 00 74
	brk $78.b		; 00 78
	brk $D4.b		; 00 D4
	brk $78.b		; 00 78
	adc $E1FDD2.l,X		; 7F D2 FD E1
	inc $FDD2.w,X		; FE D2 FD
	sta [$F8.b]		; 87 F8
	phk		; 4B
	pea $F887.w		; F4 87 F8
	eor #$80F6.w		; 49 F6 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $6F.b		; 00 6F
	bra -17.b		; 80 EF
	brk $DF.b		; 00 DF
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $7F.b		; 00 7F
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	bra  64.b		; 80 40
	sbc $80FF80.l,X		; FF 80 FF 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$00.b]		; 07 00
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sed		; F8
	brk $07.b		; 00 07
	brk $B0.b		; 00 B0
	eor $EC25DA.l		; 4F DA 25 EC
	ora ($EA.b,S),Y		; 13 EA
	ora $F7.b,X		; 15 F7
	php		; 08
	inc $09.b,X		; F6 09
	xce		; FB
	tsb $FA.b		; 04 FA
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $87.b		; 00 87
	sta [$2D.b]		; 87 2D
	and $351F1E.l		; 2F 1E 1F 35
	and $347F78.l,X		; 3F 78 7F 34
	and $347F78.l,X		; 3F 78 7F 34
	and $D000F8.l,X		; 3F F8 00 D0
	brk $E0.b		; 00 E0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $86.b		; 00 86
	sbc $D52A.w,Y		; F9 2A D5
	trb $20E3.w		; 1C E3 20
	cmp $B08778.l,X		; DF 78 87 B0
	eor $B09F60.l		; 4F 60 9F B0
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $5F.b		; 00 5F
	brk $5F.b		; 00 5F
	jsr $807F.w		; 20 7F 80
	lda $803F80.l,X		; BF 80 3F 80
	inc A		; 1A
	sbc [$4E.b]		; E7 4E
	cmp ($2D.b),Y		; D1 2D
.ACCU 8
	sep #$A0		; E2 A0
	rti		; 40

	ldy #$4040.w		; A0 40 40
	jsr $2040.w		; 20 40 20
	bvc  32.b		; 50 20
	rol A		; 2A
	ora $34.b,X		; 15 34
	ora #$1A.b		; 09 1A
	ora $10.b		; 05 10
	cmp $609F20.l,X		; DF 20 9F 60
	and $E0.b,X		; 35 E0
	adc $5F40.w,X		; 7D 40 5F
	cpy #$E040.w		; C0 40 E0
	rts		; 60

	sbc $00207F.l,X		; FF 7F 20 00
	rts		; 60

	brk $C0.b		; 00 C0
	asl A		; 0A
	bra   2.b		; 80 02
	ldy #$3F00.w		; A0 00 3F
	brk $1F.b		; 00 1F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	eor $005E00.l,X		; 5F 00 5E 00
	sbc $FB00.w,Y		; F9 00 FB
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $A0000F.l,X		; FF 0F 00 A0
	brk $A1.b		; 00 A1
	brk $06.b		; 00 06
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $F0.b		; 00 F0
	sbc $7D82.w,X		; FD 82 7D
.ACCU 16
.INDEX 16
	rep #$7D		; C2 7D
.ACCU 8
.INDEX 8
	sep #$7E		; E2 7E
	sbc ($3E.b,X)		; E1 3E
	lda ($3F.b,X)		; A1 3F
	bmi  95.b		; 30 5F
	bvc -33.b		; 50 DF
	bne   0.b		; D0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $A0.b		; 00 A0
	brk $20.b		; 00 20
	brk $C3.b		; 00 C3
	and $C35FA5.l,X		; 3F A5 5F C3
	and $C35FA5.l,X		; 3F A5 5F C3
	and $709769.l,X		; 3F 69 97 70
	sta $009769.l		; 8F 69 97 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $61.b		; 00 61
	ror $FDD2.w,X		; 7E D2 FD
	adc ($FE.b,X)		; 61 FE
	cmp ($FD.b)		; D2 FD
	sbc ($FE.b,X)		; E1 FE
	phk		; 4B
	pea $F887.w		; F4 87 F8
	lsr A		; 4A
	sbc $80.b,X		; F5 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C3.b		; 00 C3
	and $803FC0.l,X		; 3F C0 3F 80
	adc $807F80.l,X		; 7F 80 7F 80
	adc $00FF00.l,X		; 7F 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $2F.b		; 00 2F
	jsr ($FF3F.w,X)		; FC 3F FF
	eor ($FF.b,X)		; 41 FF
	ora $FF.b		; 05 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta [$3D.b]		; 87 3D
	cmp $1E.b,S		; C3 1E
	sbc ($87.b,S),Y		; F3 87
	sbc $E04FC3.l,X		; FF C3 4F E0
	and $F606FC.l,X		; 3F FC 06 F6
	bpl  -1.b		; 10 FF
	cpy #$00.b		; C0 00
	rts		; 60

	bra  24.b		; 80 18
	rts		; 60

	bit $18.b		; 24 18
	ora $0206.w,Y		; 19 06 02
	ora ($09.b,X)		; 01 09
	brk $00.b		; 00 00
	brk $51.b		; 00 51
	sbc $9FFFBF.l,X		; FF BF FF 9F
	and $631FCF.l,X		; 3F CF 1F 63
	ora $EC23D0.l		; 0F D0 23 EC
	bcc  -5.b		; 90 FB
	cpx $0A.b		; E4 0A
	bit $00.b		; 24 00
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $90.b		; 00 90
	brk $2C.b		; 00 2C
	cpy #$9F.b		; C0 9F
	rts		; 60

	bit $18.b		; 24 18
	stx $F9.b		; 86 F9
	eor #$F7.b		; 49 F7
	sta $FB.b		; 85 FB
	eor $1BF3.w		; 4D F3 1B
	sbc [$2B.b]		; E7 2B
	cmp [$18.b],Y		; D7 18
	sbc [$39.b]		; E7 39
	cmp [$00.b]		; C7 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora [$FE.b]		; 07 FE
	cop $FF.b		; 02 FF
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	brk $7F.b		; 00 7F
	cpy #$01.b		; C0 01
	brk $01.b		; 00 01
	bra   0.b		; 80 00
	bra   0.b		; 80 00
	bra -128.b		; 80 80
	rti		; 40

	bra  64.b		; 80 40
	bra  64.b		; 80 40
	rti		; 40

	jsr $116E.w		; 20 6E 11
	sbc $02FE01.l,X		; FF 01 FE 02
	jsr ($FF00.w,X)		; FC 00 FF
	cop $FF.b		; 02 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	asl $F0.b		; 06 F0
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	cop $03.b		; 02 03
	tsb $07.b		; 04 07
	clc		; 18
	sei		; 78
	sbc $4FFF80.l,X		; FF 80 FF 4F
	beq  53.b		; F0 35
	cmp $C3.b		; C5 C3
	ora $5F.b,S		; 03 5F
	eor $FFBFBF.l,X		; 5F BF BF FF
	sbc $8000FF.l,X		; FF FF 00 80
	ora $057F00.l,X		; 1F 00 7F 05
	plx		; FA
	cop $FC.b		; 02 FC
	phy		; 5A
	ldy #$90.b		; A0 90
	rti		; 40

	ldy #$00.b		; A0 00
	brk $FF.b		; 00 FF
	sbc [$00.b]		; E7 00
	bit $FE2C.w		; 2C 2C FE
	inc $FF7E.w,X		; FE 7E FF
	sbc $E3FFF7.l,X		; FF F7 FF E3
	sbc $FF00F7.l,X		; FF F7 00 FF
	brk $FF.b		; 00 FF
	bit $B6D3.w		; 2C D3 B6
	ora ($9D.b,X)		; 01 9D
	brk $3E.b		; 00 3E
	brk $3E.b		; 00 3E
	brk $3E.b		; 00 3E
	brk $F8.b		; 00 F8
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	and $40FF00.l,X		; 3F 00 FF 40
	sbc $40FF80.l,X		; FF 80 FF 40
	lda $000700.l,X		; BF 00 07 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	brk $80.b		; 00 80
	bra  64.b		; 80 40
	cpy #$20.b		; C0 20
	cpx #$18.b		; E0 18
	asl $01.b		; 06 01
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
	lda $1EDF3F.l,X		; BF 3F DF 1E
	cmp $0FEF0F.l		; CF 0F EF 0F
	sbc [$07.b],Y		; F7 07
	jsr ($FF04.w,X)		; FC 04 FF
	brk $FF.b		; 00 FF
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	ora ($30.b,X)		; 01 30
	brk $18.b		; 00 18
	brk $0C.b		; 00 0C
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FF97FF.l,X		; FF FF 97 FF
	sbc $FF0FFF.l,X		; FF FF 0F FF
	sbc $FBFFFF.l,X		; FF FF FF FB
	jsr ($00FF.w,X)		; FC FF 00
	brk $00.b		; 00 00
	brk $68.b		; 00 68
	brk $00.b		; 00 00
	ora ($F0.b,X)		; 01 F0
	cop $00.b		; 02 00
	clv		; B8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	beq  -1.b		; F0 FF
	cpx #$7F.b		; E0 7F
	rts		; 60

	sbc $81FFC0.l,X		; FF C0 FF 81
	sbc $FF01.w,X		; FD 01 FF
	ora ($FF.b,X)		; 01 FF
	ora $00.b,S		; 03 00
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $07.b		; 00 07
	brk $B0.b		; 00 B0
	eor $D0F7C9.l		; 4F C9 F7 D0
	sbc $4CF7C9.l		; EF C9 F7 4C
	sbc ($CA.b,S),Y		; F3 CA
	adc $8C.b,X		; 75 8C
	sbc ($0A.b,S),Y		; F3 0A
	sbc $00.b,X		; F5 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $86.b		; 00 86
	sbc $F748.w,Y		; F9 48 F7
	sty $FB.b		; 84 FB
	pha		; 48
	sbc [$18.b],Y		; F7 18
	sbc [$28.b]		; E7 28
	cmp [$18.b],Y		; D7 18
	sbc [$20.b]		; E7 20
	cmp $000000.l,X		; DF 00 00 00
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
	sbc $00FC1C.l,X		; FF 1C FC 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	brk $98.b		; 00 98
	sta $65.b,S		; 83 65
	inc $00.b,X		; F6 00
	sbc $FE08.w		; ED 08 FE
	brk $DF.b		; 00 DF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	adc $0900.w,X		; 7D 00 09
	brk $12.b		; 00 12
	brk $01.b		; 00 01
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $33.b		; 00 33
	phb		; 8B
	lsr $9BA1.w		; 4E A1 9B
	bcs -47.b		; B0 D1
	cmp ($28.b)		; D2 28
	sei		; 78
	ora [$F7.b]		; 07 F7
	brk $E7.b		; 00 E7
	brk $F7.b		; 00 F7
	sty $E170.w		; 8C 70 E1
	asl $0778.w,X		; 1E 78 07
	and $008700.l		; 2F 00 87 00
	php		; 08
	brk $18.b		; 00 18
	brk $08.b		; 00 08
	brk $8F.b		; 00 8F
	bra 126.b		; 80 7E
	brk $EC.b		; 00 EC
	tsb $5FE0.w		; 0C E0 5F
	sbc $811660.l,X		; FF 60 16 81
	brk $64.b		; 00 64
	bra -33.b		; 80 DF
	bvs   0.b		; 70 00
	sta ($00.b,X)		; 81 00
	and ($C0.b,S),Y		; 33 C0
	cpy #$3F.b		; C0 3F
	sbc $1A.b		; E5 1A
	ror $9B00.w,X		; 7E 00 9B
	brk $20.b		; 00 20
	brk $4B.b		; 00 4B
	cmp $FFE0.w		; CD E0 FF
	cpy #$F0.b		; C0 F0
	phd		; 0B
	cmp $171F07.l		; CF 07 1F 17
	sbc $E9FF.w,X		; FD FF E9
	phb		; 8B
	stx $30CF.w		; 8E CF 30
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	ora $E01FF0.l		; 0F F0 1F E0
	sbc $00FF00.l,X		; FF 00 FF 00
	ora [$70.b]		; 07 70
	sta ($7E.b,X)		; 81 7E
	ror $1481.w,X		; 7E 81 14
	trb $B7.b		; 14 B7
	sbc $FE17FD.l,X		; FF FD 17 FE
	sta ($FF.b,X)		; 81 FF
	brk $FF.b		; 00 FF
	ora ($00.b,X)		; 01 00
	sbc $14FF00.l,X		; FF 00 FF 14
	xba		; EB
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $B1D100.l,X		; FF 00 D1 B1
	asl $FE.b		; 06 FE
	ora $0F.b,S		; 03 0F
	beq -13.b		; F0 F3
	inc $FF3E.w,X		; FE 3E FF
	sta [$63.b]		; 87 63
	lda $C9.b,S		; A3 C9
	php		; 08
	sbc ($0E.b),Y		; F1 0E
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	beq  15.b		; F0 0F
	inc $FF01.w,X		; FE 01 FF
	brk $C1.b		; 00 C1
	trb $36C1.w		; 1C C1 36
	beq   0.b		; F0 00
	adc $00BF00.l,X		; 7F 00 BF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	adc $403F80.l,X		; 7F 80 3F 40
	ora $000F20.l,X		; 1F 20 0F 00
	bra   0.b		; 80 00
	cpy #$00.b		; C0 00
	rti		; 40

	bra  32.b		; 80 20
	cpy #$90.b		; C0 90
	rts		; 60

	iny		; C8
	bmi -28.b		; 30 E4
	clc		; 18
	sbc $E0FFF0.l,X		; FF F0 FF E0
	adc $C0FF60.l,X		; 7F 60 FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	rti		; 40

	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $B0.b		; 00 B0
	eor $D037C9.l		; 4F C9 37 D0
	and $EC27D9.l		; 2F D9 27 EC
	ora ($EA.b,S),Y		; 13 EA
	ora $EC.b,X		; 15 EC
	ora ($EE.b,S),Y		; 13 EE
	ora ($00.b),Y		; 11 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	sbc $10CF31.l		; EF 31 CF 10
	sbc $10CF30.l		; EF 30 CF 10
	sbc $30CF31.l		; EF 31 CF 30
	cmp $005FA0.l		; CF A0 5F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $BF.b		; 00 BF
	ldy #$5F.b		; A0 5F
	bne -81.b		; D0 AF
	sbc [$2F.b]		; E7 2F
	sbc $10FFBC.l,X		; FF BC FF 10
	sbc $00FF22.l,X		; FF 22 FF 00
	sbc $301060.l,X		; FF 60 10 30
	ora $00001F.l		; 0F 1F 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $81FFFF.l,X		; FF FF FF 81
	sbc $04FF91.l,X		; FF 91 FF 04
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cop $FE.b		; 02 FE
	jsr ($9C84.w,X)		; FC 84 9C
	brk $FE.b		; 00 FE
	ldx $FF.b		; A6 FF
	php		; 08
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $04.b		; 00 04
	sed		; F8
	sbc $006300.l,X		; FF 00 63 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	and $BF7F80.l,X		; 3F 80 7F BF
	ora $82.b,X		; 15 82
	brk $D5.b		; 00 D5
	brk $FF.b		; 00 FF
	brk $D5.b		; 00 D5
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	ora $7F007F.l,X		; 1F 7F 00 7F
	brk $2A.b		; 00 2A
	brk $00.b		; 00 00
	brk $2A.b		; 00 2A
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora [$FF.b]		; 07 FF
	sed		; F8
	phy		; 5A
	brk $00.b		; 00 00
	eor $00.b,X		; 55 00
	sbc $005500.l,X		; FF 00 55 00
	brk $00.b		; 00 00
	ora [$07.b]		; 07 07
	sed		; F8
	sbc $00FF00.l,X		; FF 00 FF 00
	tax		; AA
	brk $00.b		; 00 00
	brk $AA.b		; 00 AA
	brk $FF.b		; 00 FF
	php		; 08
	sed		; F8
	.db $62, $E0, $8F		; 62 E0 8F
	bra  47.b		; 80 2F
	brk $DF.b		; 00 DF
	brk $7F.b		; 00 7F
	brk $E3.b		; 00 E3
	php		; 08
	eor ($0F.b,X)		; 41 0F
	beq 125.b		; F0 7D
	bra -16.b		; 80 F0
	brk $D0.b		; 00 D0
	brk $20.b		; 00 20
	brk $80.b		; 00 80
	brk $1C.b		; 00 1C
	brk $B6.b		; 00 B6
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F8FEFE.l,X		; FF FE FE F8
	sed		; F8
.ACCU 8
	sep #$E3		; E2 E3
	wai		; CB
	cmp $809F1F.l		; CF 1F 9F 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	ora ($08.b,X)		; 01 08
	ora [$03.b]		; 07 03
	trb $300C.w		; 1C 0C 30
	bcc  96.b		; 90 60
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $0000FF.l,X		; FF FF 00 00
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $001CFF.l,X		; 3F FF 1C 00
	brk $00.b		; 00 00
	ror $0000.w,X		; 7E 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	and $FFFFFF.l,X		; 3F FF FF FF
	sbc $1FFFFF.l,X		; FF FF FF 1F
	ora $E3C747.l,X		; 1F 47 C7 E3
	sbc ($F9.b,S),Y		; F3 F9
	sbc $FC7C.w,Y		; F9 7C FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpy #$38.b		; C0 38
	bpl  12.b		; 10 0C
	php		; 08
	asl $04.b		; 06 04
	ora $3F.b,S		; 03 3F
	clc		; 18
	ora [$87.b],Y		; 17 87
	ora ($E7.b,X)		; 01 E7
	ora ($F0.b,X)		; 01 F0
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	brk $E3.b		; 00 E3
	php		; 08
	cmp ($F8.b,X)		; C1 F8
	ora [$7F.b]		; 07 7F
	brk $1F.b		; 00 1F
	brk $0F.b		; 00 0F
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $1C.b		; 00 1C
	brk $36.b		; 00 36
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpx #$7F.b		; E0 7F
	and $00000A.l,X		; 3F 0A 00 00
	tax		; AA
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	cpx #$1F.b		; E0 1F
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	eor $00.b,X		; 55 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	txs		; 9A
	brk $00.b		; 00 00
	tax		; AA
	brk $FF.b		; 00 FF
	brk $AA.b		; 00 AA
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($FE.b,X)		; 01 FE
	sbc $00FF00.l,X		; FF 00 FF 00
	eor $00.b,X		; 55 00
	brk $00.b		; 00 00
	eor $00.b,X		; 55 00
	sbc $00DF00.l,X		; FF 00 DF 00
	jsr $00DF.w		; 20 DF 00
	rti		; 40

	jsr $12FF.w		; 20 FF 12
	sbc $00FF08.l,X		; FF 08 FF 00
	sbc $300000.l,X		; FF 00 00 30
	ora $BF003F.l		; 0F 3F 00 BF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $40FFFF.l,X		; FF FF FF 40
	sbc $10FFC4.l,X		; FF C4 FF 10
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $0000FF.l,X		; FF FF 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	ora $F1FC.w		; 0D FC F1
	ora [$E7.b]		; 07 E7
	plx		; FA
	sbc $84FF9A.l,X		; FF 9A FF 84
	sbc $00FF22.l,X		; FF 22 FF 00
	sbc $FE000E.l,X		; FF 0E 00 FE
	brk $F8.b		; 00 F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $44.b		; 00 44
	xce		; FB
	cop $FD.b		; 02 FD
	tsb $FB.b		; 04 FB
	cop $FD.b		; 02 FD
	tsb $FB.b		; 04 FB
	.db $42, $FD		; 42 FD
	tsb $FB.b		; 04 FB
	cop $FD.b		; 02 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bcc -17.b		; 90 EF
	and ($DF.b,X)		; 21 DF
	sta ($EE.b)		; 92 EE
	bit $DC.b		; 24 DC
	lda #$D8.b		; A9 D8
	phd		; 0B
	sed		; F8
	and [$D0.b],Y		; 37 D0
	and [$D0.b],Y		; 37 D0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	asl $00.b		; 06 00
	tsb $00.b		; 04 00
	php		; 08
	brk $08.b		; 00 08
	brk $C0.b		; 00 C0
	cpy #$0F.b		; C0 0F
	brk $7F.b		; 00 7F
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $3F.b		; 00 3F
	brk $F0.b		; 00 F0
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $03.b		; 00 03
	ora $F8.b,S		; 03 F8
	clc		; 18
	sbc $00FF03.l,X		; FF 03 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	jsr ($0700.w,X)		; FC 00 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40FF00.l,X		; FF 00 FF 40
	sbc $E41F98.l,X		; FF 98 1F E4
	and [$FA.b]		; 27 FA
	phd		; 0B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	brk $18.b		; 00 18
	brk $04.b		; 00 04
	brk $27.b		; 00 27
	brk $77.b		; 00 77
	brk $27.b		; 00 27
	brk $8A.b		; 00 8A
	stx $08F8.w		; 8E F8 08
.ACCU 16
	rep #$23		; C2 23
	phb		; 8B
	eor $279F1F.l		; 4F 1F 9F 27
	cld		; D8
	adc [$88.b],Y		; 77 88
	and [$D8.b]		; 27 D8
	asl $71.b		; 06 71
	sed		; F8
	ora [$E3.b]		; 07 E3
	trb $30CC.w		; 1C CC 30
	bcc  96.b		; 90 60
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00007F.l,X		; FF 7F 00 00
	bra  -1.b		; 80 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $00FFFF.l,X		; 3F FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	cmp $C900.w,X		; DD 00 C9
	brk $E3.b		; 00 E3
	jsl $43001F.l		; 22 1F 00 43
	cpy $E3.b		; C4 E3
	beq  -8.b		; F0 F8
	sbc $FCFC.w,Y		; F9 FC FC
	cmp $C922.w,X		; DD 22 C9
	rol $C1.b,X		; 36 C1
	trb $E01F.w		; 1C 1F E0
	cmp [$38.b]		; C7 38
	ora ($0C.b,S),Y		; 13 0C
	ora #$0406.w		; 09 06 04
	ora $5D.b,S		; 03 5D
	rti		; 40

	sta $E02E80.l		; 8F 80 2E E0
	ora [$F0.b],Y		; 17 F0
	ora [$F0.b],Y		; 17 F0
	ora $F8.b,S		; 03 F8
	ora $03FC.w		; 0D FC 03
	inc $0CB2.w,X		; FE B2 0C
	ply		; 7A
	tsb $19.b		; 04 19
	asl $0D.b		; 06 0D
	cop $0C.b		; 02 0C
	ora $06.b,S		; 03 06
	ora ($03.b,X)		; 01 03
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $7F.b		; 00 7F
	bra  -1.b		; 80 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	bra  32.b		; 80 20
	cpy #$F4.b		; C0 F4
	phd		; 0B
	inc $09.b,X		; F6 09
	pea $F60B.w		; F4 0B F6
	ora #$0BF4.w		; 09 F4 0B
	inc $09.b,X		; F6 09
	inc $09.b,X		; F6 09
	plx		; FA
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $38.b		; 00 38
	and $783F34.l,X		; 3F 34 3F 78
	adc $78BFB4.l,X		; 7F B4 BF 78
	adc $78BFB4.l,X		; 7F B4 BF 78
	adc $C0BFB4.l,X		; 7F B4 BF C0
	brk $C0.b		; 00 C0
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	sta $605FA0.l,X		; 9F A0 5F 60
	sta $601FE0.l,X		; 9F E0 1F 60
	sta $605FA0.l,X		; 9F A0 5F 60
	sta $005FA0.l,X		; 9F A0 5F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $0C.b		; 00 0C
	cmp ($00.b),Y		; D1 00
	cmp #$E201.w		; C9 01 E2
	ora ($FE.b,X)		; 01 FE
	cop $FC.b		; 02 FC
	cop $FC.b		; 02 FC
	brk $FC.b		; 00 FC
	cop $FC.b		; 02 FC
	jsl $003600.l		; 22 00 36 00
	ora $0100.w,X		; 1D 00 01
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $98.b		; 00 98
	eor $80.b		; 45 80
	eor #$2340.w		; 49 40 23
	rti		; 40

	and $009F20.l,X		; 3F 20 9F 00
	sta $009F20.l,X		; 9F 20 9F 00
	sta $B600A2.l,X		; 9F A2 00 B6
	brk $DC.b		; 00 DC
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $03.b		; 00 03
	jsr ($FD02.w,X)		; FC 02 FD
	ora $FC.b,S		; 03 FC
	cop $FD.b		; 02 FD
	ora $FC.b,S		; 03 FC
	cop $FD.b		; 02 FD
	ora $FC.b,S		; 03 FC
	cop $FD.b		; 02 FD
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $C02F80.l		; 6F 80 2F C0
	adc $C02F80.l		; 6F 80 2F C0
	adc $C02F80.l		; 6F 80 2F C0
	adc $C02F80.l		; 6F 80 2F C0
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	bpl   0.b		; 10 00
	jsr ($FE04.w,X)		; FC 04 FE
	cop $FF.b		; 02 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	sbc $007F40.l,X		; FF 40 7F 00
	and $90BFA0.l,X		; 3F A0 BF 90
	ora $E84FC0.l,X		; 1F C0 4F E8
	and $0027E0.l		; 2F E0 27 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $40.b		; 00 40
	brk $60.b		; 00 60
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $18.b		; 00 18
	brk $00.b		; 00 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FE01.w,X		; FE 01 FE
	cop $FC.b		; 02 FC
	cop $FC.b		; 02 FC
	brk $FC.b		; 00 FC
	cop $FC.b		; 02 FC
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	ora $00.b,S		; 03 00
	bra 126.b		; 80 7E
	.db $82, $7F, $40		; 82 7F 40
	and $243151.l,X		; 3F 51 31 24
	bra  14.b		; 80 0E
	bra  36.b		; 80 24
	bra  17.b		; 80 11
	sta ($81.b),Y		; 91 81
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $CE.b		; 00 CE
	brk $7B.b		; 00 7B
	brk $71.b		; 00 71
	brk $7B.b		; 00 7B
	brk $6E.b		; 00 6E
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	php		; 08
	adc ($0C.b,S),Y		; 73 0C
	rol $6F81.w,X		; 3E 81 6F
	cpy #$43.b		; C0 43
	beq  40.b		; F0 28
	sbc $FE04.w,X		; FD 04 FE
	bra  96.b		; 80 60
	iny		; C8
	bmi -28.b		; 30 E4
	clc		; 18
	adc ($0E.b),Y		; 71 0E
	bit $0F03.w,X		; 3C 03 0F
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $F7.b		; 00 F7
	brk $DE.b		; 00 DE
	bra  27.b		; 80 1B
	bpl   0.b		; 10 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $18.b		; 00 18
	cpx #$C3.b		; E0 C3
	bit $07F8.w,X		; 3C F8 07
	xce		; FB
	tsb $FA.b		; 04 FA
	ora ($FF.b,X)		; 01 FF
	tsb $FB.b		; 04 FB
	brk $FF.b		; 00 FF
	brk $FA.b		; 00 FA
	ora $FF.b		; 05 FF
	tsb $FE.b		; 04 FE
	ora $00.b		; 05 00
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $60.b		; 00 60
	sta $605FA0.l,X		; 9F A0 5F 60
	sta $605FA0.l,X		; 9F A0 5F 60
	sta $605FA0.l,X		; 9F A0 5F 60
	sta $005FA0.l,X		; 9F A0 5F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $0FFF00.l,X		; FF 00 FF 0F
	sbc $7FFF3F.l,X		; FF 3F FF 7F
	beq 127.b		; F0 7F
	cpx #$FF.b		; E0 FF
	cpy #$FF.b		; C0 FF
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF03.l,X		; FF 03 FF FF
	sbc $FFFCFF.l,X		; FF FF FC FF
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
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
	brk $70.b		; 00 70
	sbc $E38F0C.l,X		; FF 0C 8F E3
	ora $F9.b,S		; 03 F9
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	brk $1C.b		; 00 1C
	brk $06.b		; 00 06
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $60FFC0.l,X		; FF C0 FF 60
	adc $D83FB0.l,X		; 7F B0 3F D8
	ora $000FEC.l,X		; 1F EC 0F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $40.b		; 00 40
	brk $20.b		; 00 20
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	jsr ($FC00.w,X)		; FC 00 FC
	brk $FC.b		; 00 FC
	brk $FC.b		; 00 FC
	ora ($FD.b,X)		; 01 FD
	brk $FE.b		; 00 FE
	brk $E2.b		; 00 E2
	php		; 08
	cmp ($03.b,X)		; C1 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $1D.b		; 00 1D
	brk $36.b		; 00 36
	brk $00.b		; 00 00
	sta $009F00.l,X		; 9F 00 9F 00
	sta $405F40.l,X		; 9F 40 5F 40
	eor $80BF80.l,X		; 5F 80 BF 80
	lda $08.b,S		; A3 08
	ora ($60.b,X)		; 01 60
	brk $60.b		; 00 60
	brk $60.b		; 00 60
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $40.b		; 00 40
	brk $5C.b		; 00 5C
	brk $F6.b		; 00 F6
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0DFE06.l,X		; FF 06 FE 0D
	jsr ($F81B.w,X)		; FC 1B F8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	ora [$FF.b]		; 07 FF
	clc		; 18
	sed		; F8
	adc [$F0.b],Y		; 77 F0
	cmp $003FC0.l		; CF C0 3F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	ora [$00.b]		; 07 00
	php		; 08
	brk $30.b		; 00 30
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFF7F.l,X		; FF 7F FF FF
	adc $FF00FF.l,X		; 7F FF 00 FF
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
	sbc $FFFFE0.l,X		; FF E0 FF FF
	sbc $FF1FFF.l,X		; FF FF 1F FF
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
	sbc $F8FF00.l,X		; FF 00 FF F8
	sbc $FEFFFE.l,X		; FF FE FF FE
	ora $FF07FF.l		; 0F FF 07 FF
	ora $FF.b,S		; 03 FF
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E5.b		; 00 E5
	ora [$F4.b]		; 07 F4
	asl $F4.b,X		; 16 F4
	asl $F4.b		; 06 F4
	asl $F5.b		; 06 F5
	ora [$F4.b]		; 07 F4
	ora [$F4.b]		; 07 F4
	ora [$F4.b]		; 07 F4
	ora [$18.b]		; 07 18
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $09.b		; 00 09
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	trb $0C40.w		; 1C 40 0C
	cpx #$0C.b		; E0 0C
	rti		; 40

	tsb $1D11.w		; 0C 11 1D
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FF.b		; 00 FF
	sbc $00.b,S		; E3 00
	lda ($00.b,S),Y		; B3 00
	ora ($00.b,S),Y		; 13 00
	lda ($00.b,S),Y		; B3 00
	sep #$00		; E2 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $9F.b		; 00 9F
	brk $9F.b		; 00 9F
	brk $9F.b		; 00 9F
	rti		; 40

	eor $805F40.l,X		; 5F 40 5F 80
	lda $00BF80.l,X		; BF 80 BF 00
	and $600060.l,X		; 3F 60 00 60
	brk $60.b		; 00 60
	brk $A0.b		; 00 A0
	brk $A0.b		; 00 A0
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $C0.b		; 00 C0
	brk $47.b		; 00 47
	cpx #$14.b		; E0 14
	jsr ($FE02.w,X)		; FC 02 FE
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $000300.l,X		; 1F 00 03 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $11F700.l,X		; FF 00 F7 11
	adc $8A7A32.l,X		; 7F 32 7A 8A
	bit $DE.b,X		; 34 DE
	asl A		; 0A
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $8AC008.l,X		; FF 08 C0 8A
	tsb $82.b		; 04 82
	ora $0007.w		; 0D 07 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $80FF00.l,X		; FF 00 FF 80
	sbc $823F10.l,X		; FF 10 3F 82
	eor [$10.b]		; 47 10
	adc $C6EA.w		; 6D EA C6
	inc $01.b,X		; F6 01
	sbc $000000.l,X		; FF 00 00 00
	brk $20.b		; 00 20
	cpy #$84.b		; C0 84
	sei		; 78
	beq  15.b		; F0 0F
	asl $01.b,X		; 16 01
	ora #$0000.w		; 09 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bpl  63.b		; 10 3F
	brk $91.b		; 00 91
	phb		; 8B
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	jsr $81C0.w		; 20 C0 81
	ror $443A.w,X		; 7E 3A 44
	sbc $05FE04.l,X		; FF 04 FE 05
	xce		; FB
	brk $F2.b		; 00 F2
	ora ($E3.b,X)		; 01 E3
	php		; 08
	cmp ($05.b)		; D2 05
	and $DECE.w		; 2D CE DE
	sbc $0804.w,Y		; F9 04 08
	tsb $08.b		; 04 08
	tsb $08.b		; 04 08
	tsb $18.b		; 04 18
	tsb $1830.w		; 0C 30 18
	cpx #$F0.b		; E0 F0
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	sta $10CF30.l		; 8F 30 CF 10
	sbc $10CF30.l		; EF 30 CF 10
	sbc $10CF30.l		; EF 30 CF 10
	sbc $00C738.l		; EF 38 C7 00
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
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$00.b		; C0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $F6.b		; 00 F6
	ora [$FB.b]		; 07 FB
	ora $FD.b,S		; 03 FD
	ora ($FD.b,X)		; 01 FD
	ora ($FE.b,X)		; 01 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	brk $FE.b		; 00 FE
	ora ($08.b,X)		; 01 08
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	cmp ($08.b,X)		; C1 08
	cmp ($00.b,X)		; C1 00
	sbc $80.b,S		; E3 80
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $40FFC0.l,X		; FF C0 FF 40
	adc $360022.l,X		; 7F 22 00 36
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $6C.b		; 00 6C
	sbc $33.b,S		; E3 33
	beq  28.b		; F0 1C
	jsr ($FF0F.w,X)		; FC 0F FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bpl   0.b		; 10 00
	tsb $0300.w		; 0C 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	nop		; EA
	sbc $05.b		; E5 05
	inc A		; 1A
	tas		; 1B
	sed		; F8
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $1A0005.l,X		; FF 05 00 1A
	brk $E4.b		; 00 E4
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $1C.b		; 00 1C
	eor ($08.b,X)		; 41 08
	cmp ($00.b,X)		; C1 00
	sbc $00.b,S		; E3 00
	sbc $01FF00.l,X		; FF 00 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $3600A2.l,X		; FF A2 00 36
	brk $1C.b		; 00 1C
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $37.b		; 00 37
	beq 111.b		; F0 6F
	cpx #$5F.b		; E0 5F
	cpy #$DF.b		; C0 DF
	cpy #$BF.b		; C0 BF
	bra -65.b		; 80 BF
	bra -65.b		; 80 BF
	bra 127.b		; 80 7F
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $40.b		; 00 40
	brk $80.b		; 00 80
	brk $07.b		; 00 07
	sed		; F8
	cop $FD.b		; 02 FD
	tsb $FB.b		; 04 FB
	cop $FD.b		; 02 FD
	tsb $FB.b		; 04 FB
	cop $FD.b		; 02 FD
	tsb $FB.b		; 04 FB
	asl A		; 0A
	sbc $00.b,X		; F5 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	bra  39.b		; 80 27
	bne  23.b		; D0 17
	cpx #$27.b		; E0 27
	bne  23.b		; D0 17
	cpx #$27.b		; E0 27
	bne  23.b		; D0 17
	cpx #$2B.b		; E0 2B
	bne   8.b		; D0 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $04.b		; 00 04
	brk $F4.b		; 00 F4
	ora [$F4.b]		; 07 F4
	ora [$F4.b]		; 07 F4
	ora [$F4.b]		; 07 F4
	ora [$F4.b]		; 07 F4
	ora [$EC.b]		; 07 EC
	ora $D00FE8.l		; 0F E8 0F D0
	ora $080008.l,X		; 1F 08 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $6C.b		; 00 6C
	sbc $33.b,S		; E3 33
	beq  28.b		; F0 1C
	jsr ($FF0F.w,X)		; FC 0F FF
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $0010F0.l		; 0F F0 10 00
	tsb $0300.w		; 0C 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $12.b		; 00 12
	nop		; EA
	sbc $05.b		; E5 05
	inc A		; 1A
	inc A		; 1A
	jsr ($E5F8.w,X)		; FC F8 E5
	sed		; F8
	tsb $F8.b		; 04 F8
	asl $FA.b		; 06 FA
	ora ($FE.b,X)		; 01 FE
	ora $00.b		; 05 00
	inc A		; 1A
	brk $E5.b		; 00 E5
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	adc $20FF00.l,X		; 7F 00 FF 20
	and $C01F80.l,X		; 3F 80 1F C0
	ora $201F80.l,X		; 1F 80 1F 20
	and $80FF00.l,X		; 3F 00 FF 80
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	brk $60.b		; 00 60
	brk $20.b		; 00 20
	brk $60.b		; 00 60
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $40FF1F.l,X		; FF 1F FF 40
	cpy #$BF.b		; C0 BF
	ldy #$00.b		; A0 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $3F.b		; 00 3F
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $10FF80.l,X		; FF 80 FF 10
	ora $001FE3.l,X		; 1F E3 1F 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $E0.b		; 00 E0
	brk $00.b		; 00 00
	brk $67.b		; 00 67
	sed		; F8
	stx $F9.b		; 86 F9
	tsb $0EF3.w		; 0C F3 0E
	sbc ($0C.b),Y		; F1 0C
	sbc ($1E.b,S),Y		; F3 1E
	sbc ($1C.b,X)		; E1 1C
	sbc $1E.b,S		; E3 1E
	sbc ($00.b,X)		; E1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $00.b		; 00 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FF0000.l,X		; FF 00 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $C60000.l,X		; FF 00 00 C6
	dec $C6.b		; C6 C6
	dec $C6.b		; C6 C6
	dec $01.b		; C6 01
	sbc $FC02.w,X		; FD 02 FC
	ora ($01.b,X)		; 01 01
	ora $FE.b,S		; 03 FE
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $00.b		; 02 00
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $FC.b,S		; 03 FC
	ora $02.b,S		; 03 02
	ora $02.b,S		; 03 02
	asl $04.b		; 06 04
	asl $04.b		; 06 04
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	cpy #$FF.b		; C0 FF
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	cmp [$C7.b]		; C7 C7
	cmp [$C7.b]		; C7 C7
	cmp [$C7.b]		; C7 C7
	ora ($FD.b,X)		; 01 FD
	cop $FC.b		; 02 FC
	ora ($01.b,X)		; 01 01
	ora $FE.b,S		; 03 FE
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $00.b		; 02 00
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $FC.b,S		; 03 FC
	ora $02.b,S		; 03 02
	sta $82.b,S		; 83 82
	stx $84.b		; 86 84
	stx $84.b		; 86 84
	ora ($FD.b,X)		; 01 FD
	cop $FC.b		; 02 FC
	ora ($01.b,X)		; 01 01
	ora $FE.b,S		; 03 FE
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $00.b		; 02 00
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $FC.b,S		; 03 FC
	ora $02.b,S		; 03 02
	sbc $E2.b,S		; E3 E2
	inc $E4.b		; E6 E4
	inc $E4.b		; E6 E4
	ora ($FD.b,X)		; 01 FD
	cop $FC.b		; 02 FC
	ora ($01.b,X)		; 01 01
	ora $FE.b,S		; 03 FE
	ora ($FC.b,X)		; 01 FC
	ora ($FC.b,X)		; 01 FC
	cop $F9.b		; 02 F9
	cop $F9.b		; 02 F9
	cop $00.b		; 02 00
	sbc $00FE00.l,X		; FF 00 FE 00
	ora $FC.b,S		; 03 FC
	ora $02.b,S		; 03 02
	xce		; FB
	plx		; FA
	inc $FEFC.w,X		; FE FC FE
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 0CFFFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 0CFFFF. Skipping.
.ENDS
