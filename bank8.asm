.BANK 8 SLOT 0
.ORG $0000

.SECTION "Bank8" FORCE

	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $0000.w,X		; FE 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $0000.w,X		; FE 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $0000.w,X		; FE 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $0000.w,X		; FE 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$11.b],Y		; F7 11
	inc $F807.w		; EE 07 F8
	ora $0000F0.l		; 0F F0 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	brk $00.b		; 00 00
	eor ($BE.b,X)		; 41 BE
	ora [$FD.b]		; 07 FD
	ora $917FE9.l,X		; 1F E9 7F 91
	sbc $41FF21.l,X		; FF 21 FF 41
	sbc $000081.l,X		; FF 81 00 00
	ora $FF.b,S		; 03 FF
	asl $3EFF.w		; 0E FF 3E
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $407F80.l,X		; FF 80 7F 40
	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $03FF00.l		; EF 00 FF 03
	jsr ($FF00.w,X)		; FC 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $03FF00.l,X		; BF 00 FF 03
	jsr ($F00F.w,X)		; FC 0F F0
	and $00FFC0.l,X		; 3F C0 FF 00
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $807FE0.l,X		; 1F E0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0CFF06.l,X		; FF 06 FF 0C
	sbc $30FF18.l,X		; FF 18 FF 30
	sbc $C0FF60.l,X		; FF 60 FF C0
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $07FE01.l		; EF 01 FE 07
	sed		; F8
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $07FE01.l,X		; BF 01 FE 07
	sed		; F8
	ora $807FE0.l,X		; 1F E0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	and $02FFC1.l,X		; 3F C1 FF 02
	sbc $08FF04.l,X		; FF 04 FF 08
	sbc $20FF10.l,X		; FF 10 FF 20
	sbc $80FF40.l,X		; FF 40 FF 80
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $407F80.l,X		; FF 80 7F 40
	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $01FF00.l,X		; BF 00 FF 01
	inc $F807.w,X		; FE 07 F8
	ora $807FE0.l,X		; 1F E0 7F 80
	sbc $FF0000.l,X		; FF 00 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $C03FF0.l		; 0F F0 3F C0
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
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0CFF06.l,X		; FF 06 FF 0C
	sbc $30FF18.l,X		; FF 18 FF 30
	sbc $C0FF60.l,X		; FF 60 FF C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FF80.l,X		; FF 80 FF 00
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
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $407F80.l,X		; FF 80 7F 40
	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $00FF00.l		; EF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $3FFF0F.l,X		; FF 0F FF 3F
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $0FFC03.l,X		; FF 03 FC 0F
	beq  63.b		; F0 3F
	cpy #$00FF.w		; C0 FF 00
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora [$F8.b]		; 07 F8
	ora $807FE0.l,X		; 1F E0 7F 80
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
	sbc $01FFFF.l,X		; FF FF FF 01
	sbc $06FF03.l,X		; FF 03 FF 06
	sbc $18FF0C.l,X		; FF 0C FF 18
	sbc $60FF30.l,X		; FF 30 FF 60
	sbc $FFFFC0.l,X		; FF C0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $80FFFF.l,X		; FF FF FF 80
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
	sbc $03FFFF.l,X		; FF FF FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $FFFC03.l,X		; FF 03 FC FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $80FFFC.l,X		; FF FC FF 80
	adc $00BF40.l,X		; 7F 40 BF 00
	sbc $08FB04.l,X		; FF 04 FB 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $01FF00.l		; EF 00 FF 01
	inc $FF00.w,X		; FE 00 FF
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $407F80.l,X		; FF 80 7F 40
	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $00FF00.l		; EF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $3FFF0F.l,X		; FF 0F FF 3F
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $07FE01.l,X		; FF 01 FE 07
	sed		; F8
	ora $807FE0.l,X		; 1F E0 7F 80
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FC.b,S		; 03 FC
	ora $C03FF0.l		; 0F F0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	sbc $06FF03.l,X		; FF 03 FF 06
	sbc $18FF0C.l,X		; FF 0C FF 18
	sbc $60FF30.l,X		; FF 30 FF 60
	sbc $FFFFC0.l,X		; FF C0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $80FFFF.l,X		; FF FF FF 80
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
	sbc $03FFFF.l,X		; FF FF FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $FFFC03.l,X		; FF 03 FC FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $80FFFC.l,X		; FF FC FF 80
	adc $00BF40.l,X		; 7F 40 BF 00
	sbc $08FB04.l,X		; FF 04 FB 08
	sbc [$10.b],Y		; F7 10
	sbc $00FF00.l		; EF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $3FFF0F.l,X		; FF 0F FF 3F
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $F807.w,X		; FE 07 F8
	ora $FF00E0.l,X		; 1F E0 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra 127.b		; 80 7F
	rti		; 40

	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$10.b],Y		; F7 10
	sbc $00FF00.l		; EF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	sbc $3FFF0F.l,X		; FF 0F FF 3F
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00FF00.l,X		; BF 00 FF 00
	sbc $03FF00.l,X		; FF 00 FF 03
	jsr ($F00F.w,X)		; FC 0F F0
	and $FF00C0.l,X		; 3F C0 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora ($FE.b,X)		; 01 FE
	ora [$F8.b]		; 07 F8
	ora $C03FE0.l,X		; 1F E0 3F C0
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
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0EFF07.l,X		; FF 07 FF 0E
	sbc $38FF1C.l,X		; FF 1C FF 38
	sbc $E0FF70.l,X		; FF 70 FF E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $80FF80.l,X		; FF 80 FF 80
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
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $F807.w,X		; FE 07 F8
	ora $C03FE0.l,X		; 1F E0 3F C0
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $807FFF.l,X		; FF FF 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
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
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $FFF807.l,X		; FF 07 F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
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
	sbc $0FFC03.l,X		; FF 03 FC 0F
	beq  63.b		; F0 3F
	cpy #$807F.w		; C0 7F 80
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
	sbc $01FFFF.l,X		; FF FF FF 01
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $1CFF0E.l,X		; FF 0E FF 1C
	sbc $70FF38.l,X		; FF 38 FF 70
	sbc $FFFFE0.l,X		; FF E0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
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
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $FFF807.l,X		; FF 07 F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
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
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$FF.b]		; 07 FF
	ora [$F8.b]		; 07 F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $01FFF8.l,X		; FF F8 FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	cpx #$F81F.w		; E0 1F F8
	ora [$00.b]		; 07 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $01FFFC.l,X		; FF FC FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $007F80.l,X		; FF 80 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $007F80.l,X		; FF 80 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
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
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1EFF.l		; 0F FF 1E FF
	bit $78FF.w,X		; 3C FF 78
	sbc $FFFFF0.l,X		; FF F0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	sbc $80FFC0.l,X		; FF C0 FF 80
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
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $FFF807.l,X		; FF 07 F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $FF03FC.l,X		; FF FC 03 FF
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
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	and $F80FF0.l,X		; 3F F0 0F F8
	ora [$FE.b]		; 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	cpx #$001F.w		; E0 1F 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $01FFFC.l,X		; FF FC FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $007F80.l,X		; FF 80 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $007F80.l,X		; FF 80 7F 00
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
	brk $FE.b		; 00 FE
	ora ($FF.b,X)		; 01 FF
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
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $E07F80.l,X		; FF 80 7F E0
	ora $FC07F8.l,X		; 1F F8 07 FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$F03F.w		; C0 3F F0
	ora $C0FF00.l		; 0F 00 FF C0
	sbc $FCFFF0.l,X		; FF F0 FF FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $02FE01.l,X		; FF 01 FE 02
	sbc $FF00.w,X		; FD 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1EFF.l		; 0F FF 1E FF
	bit $78FF.w,X		; 3C FF 78
	sbc $FFFFF0.l,X		; FF F0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E0FFFF.l,X		; FF FF FF E0
	sbc $80FFC0.l,X		; FF C0 FF 80
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
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FFF80F.l,X		; FF 0F F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F0FFF8.l,X		; FF F8 FF F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
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
	sbc $F8FFFF.l,X		; FF FF FF F8
	ora [$FE.b]		; 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $F01FE0.l,X		; 7F E0 1F F0
	ora $FF03FC.l		; 0F FC 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$003F.w		; C0 3F 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	cpx #$C0FF.w		; E0 FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
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
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  15.b		; F0 0F
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E03FC0.l,X		; FF C0 3F E0
	ora $FE07F8.l,X		; 1F F8 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	brk $FF.b		; 00 FF
	cpy #$F0FF.w		; C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $01FFFC.l,X		; FF FC FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $007F80.l,X		; FF 80 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $007F80.l,X		; FF 80 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
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
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	rol $7CFF.w,X		; 3E FF 7C
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $E0FFFF.l,X		; FF FF FF E0
	sbc $C0FFE0.l,X		; FF E0 FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
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
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $03FF07.l,X		; FF 07 FF 03
	sbc $00FF01.l,X		; FF 01 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $3FC0FF.l,X		; FF FF C0 3F
	beq  15.b		; F0 0F
	jsr ($FF03.w,X)		; FC 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	and $F81FE0.l,X		; 3F E0 1F F8
	ora [$FE.b]		; 07 FE
	ora ($FF.b,X)		; 01 FF
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
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $FF0FFF.l		; 0F FF 0F FF
	ora $F00FFF.l		; 0F FF 0F F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $FFFFF0.l,X		; FF F0 FF FF
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
	sbc $E0FFFF.l,X		; FF FF FF E0
	ora $FE07F8.l,X		; 1F F8 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E07F80.l,X		; FF 80 7F E0
	ora $FC0FF0.l,X		; 1F F0 0F FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$F0FF.w		; C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	rol $7CFF.w,X		; 3E FF 7C
	sbc $FFFFF8.l,X		; FF F8 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $F0FFFF.l,X		; FF FF FF F0
	sbc $C0FFE0.l,X		; FF E0 FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
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
	sbc $FE01FF.l,X		; FF FF 01 FE
	cop $FD.b		; 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$F0FF.w		; C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	beq  -1.b		; F0 FF
	cpx #$C0FF.w		; E0 FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
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
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FFF01F.l,X		; FF 1F F0 FF
	cpx #$E0FF.w		; E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $F03FC0.l,X		; FF C0 3F F0
	ora $FF03FC.l		; 0F FC 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E07F80.l,X		; FF 80 7F E0
	ora $FF07F8.l,X		; 1F F8 07 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$F0FF.w		; C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $E01FFF.l,X		; 1F FF 1F E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $FFFFE0.l,X		; FF E0 FF FF
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
	ora $FF0FFF.l		; 0F FF 0F FF
	ora [$FF.b]		; 07 FF
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra  -1.b		; 80 FF
	cpy #$E0FF.w		; C0 FF E0
	sbc $F8FFF0.l,X		; FF F0 FF F8
	sbc $7EFFFC.l,X		; FF FC FF 7E
	sbc $FFFF3F.l,X		; FF 3F FF FF
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
	bra 127.b		; 80 7F
	cpx #$F81F.w		; E0 1F F8
	ora [$FE.b]		; 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $F03FC0.l,X		; 7F C0 3F F0
	ora $FF03FC.l		; 0F FC 03 FF
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $E01FFF.l,X		; 1F FF 1F E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $FFFFE0.l,X		; FF E0 FF FF
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
	sbc $FEFFFF.l,X		; FF FF FF FE
	ora ($FF.b,X)		; 01 FF
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
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $E07F80.l,X		; FF 80 7F E0
	ora $FE07F8.l,X		; 1F F8 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C07F80.l,X		; FF 80 7F C0
	and $FF0FF0.l,X		; 3F F0 0F FF
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $E01FFF.l,X		; 1F FF 1F E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $FFFFE0.l,X		; FF E0 FF FF
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
	ora $FF0FFF.l,X		; 1F FF 0F FF
	ora [$FF.b]		; 07 FF
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra  -1.b		; 80 FF
	cpy #$E0FF.w		; C0 FF E0
	sbc $F8FFF0.l,X		; FF F0 FF F8
	sbc $7EFFFC.l,X		; FF FC FF 7E
	sbc $FFFF3F.l,X		; FF 3F FF FF
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
	sbc $03FCFF.l,X		; FF FF FC 03
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	brk $FF.b		; 00 FF
	cpy #$F03F.w		; C0 3F F0
	ora $FF03FC.l		; 0F FC 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $FF1FE0.l,X		; 7F E0 1F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$F0FF.w		; C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF3FFF.l,X		; 1F FF 3F FF
	and $E03FFF.l,X		; 3F FF 3F E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FFFFC0.l,X		; FF C0 FF FF
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
	ora $FF0FFF.l,X		; 1F FF 0F FF
	ora [$FF.b]		; 07 FF
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
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
	sbc $F0FFFF.l,X		; FF FF FF F0
	ora $FE07F8.l		; 0F F8 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $E07F80.l,X		; FF 80 7F E0
	ora $FE07F8.l,X		; 1F F8 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
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
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$F0FF.w		; C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
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
	sbc $F8FFFF.l,X		; FF FF FF F8
	ora [$FE.b]		; 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $F81FE0.l,X		; 7F E0 1F F8
	ora [$FE.b]		; 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FF3FC0.l,X		; FF C0 3F FF
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
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $C03FFF.l,X		; 3F FF 3F C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FFFFC0.l,X		; FF C0 FF FF
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
	sbc $C0FFFF.l,X		; FF FF FF C0
	and $FC0FF0.l,X		; 3F F0 0F FC
	ora $FF.b,S		; 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF00.l,X		; FF 00 FF C0
	and $FC0FF0.l,X		; 3F F0 0F FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
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
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $C03FFF.l,X		; 3F FF 3F C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FFFFC0.l,X		; FF C0 FF FF
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF07FF.l		; 0F FF 07 FF
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra  -1.b		; 80 FF
	cpy #$E0FF.w		; C0 FF E0
	sbc $F8FFF0.l,X		; FF F0 FF F8
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $FFFF7F.l,X		; FF 7F FF FF
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
	sbc $7F80FF.l,X		; FF FF 80 7F
	cpx #$F81F.w		; E0 1F F8
	ora [$FE.b]		; 07 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $F81FE0.l,X		; 7F E0 1F F8
	ora [$FC.b]		; 07 FC
	ora $FF.b,S		; 03 FF
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
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	cpy #$F0FF.w		; C0 FF F0
	sbc $FFFFFC.l,X		; FF FC FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FD02.w,X		; FE 02 FD
	brk $FF.b		; 00 FF
	jsr $10DF.w		; 20 DF 10
	sbc $00F708.l		; EF 08 F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F0FFC0.l,X		; FF C0 FF F0
	sbc $00FFFC.l,X		; FF FC FF 00
	brk $40.b		; 00 40
	lda $04FF00.l,X		; BF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$11.b],Y		; F7 11
	inc $F807.w		; EE 07 F8
	ora $0000F0.l		; 0F F0 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora $FF.b,S		; 03 FF
	ora $FF3FFF.l		; 0F FF 3F FF
	brk $00.b		; 00 00
	eor ($BE.b,X)		; 41 BE
	ora [$F9.b]		; 07 F9
	ora $817FE1.l,X		; 1F E1 7F 81
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $000001.l,X		; FF 01 00 00
	ora $FF.b,S		; 03 FF
	asl $3EFF.w		; 0E FF 3E
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $7FE01F.l,X		; FF 1F E0 7F
	bra  -1.b		; 80 FF
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
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $C03FFF.l,X		; 3F FF 3F C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $FFFFC0.l,X		; FF C0 FF FF
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
	and $FF1FFF.l,X		; 3F FF 1F FF
	ora $FF07FF.l		; 0F FF 07 FF
	ora $FF.b,S		; 03 FF
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	bra  -1.b		; 80 FF
	cpy #$E0FF.w		; C0 FF E0
	sbc $F8FFF0.l,X		; FF F0 FF F8
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $FFFF7F.l,X		; FF 7F FF FF
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
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FF00FF.l,X		; FF FF 00 FF
	cpy #$F03F.w		; C0 3F F0
	ora $FF03FC.l		; 0F FC 03 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $F03FC0.l,X		; FF C0 3F F0
	ora $FF07F8.l		; 0F F8 07 FF
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
	sbc $3FFFFF.l,X		; FF FF FF 3F
	cpy #$00FF.w		; C0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
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
	brk $08.b		; 00 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $080000.l,X		; FF 00 00 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $080000.l,X		; FF 00 00 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $090000.l,X		; FF 00 00 09
	inc $01.b,X		; F6 01
	inc $7D83.w,X		; FE 83 7D
	eor [$B9.b]		; 47 B9
	and $E11FD1.l		; 2F D1 1F E1
	ora $0000E1.l,X		; 1F E1 00 00
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	asl $FF.b		; 06 FF
	asl $1EFF.w		; 0E FF 1E
	sbc $7EFF3E.l,X		; FF 3E FF 7E
	sbc $880000.l,X		; FF 00 00 88
	adc [$80.b],Y		; 77 80
	adc $E0BFC0.l,X		; 7F C0 BF E0
	sta $F88FF0.l,X		; 9F F0 8F F8
	sta [$F8.b]		; 87 F8
	sta [$00.b]		; 87 00
	brk $80.b		; 00 80
	sbc $60FFC0.l,X		; FF C0 FF 60
	sbc $78FF70.l,X		; FF 70 FF 78
	sbc $7EFF7C.l,X		; FF 7C FF 7E
	sbc $080000.l,X		; FF 00 00 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $08FB04.l,X		; FF 04 FB 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $417F80.l,X		; FF 80 7F 41
	ldx $DE21.w,Y		; BE 21 DE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $08FB04.l,X		; FF 04 FB 08
	sbc [$00.b],Y		; F7 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $C07F80.l,X		; 7F 80 7F C0
	and $001FE0.l,X		; 3F E0 1F 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
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
	brk $04.b		; 00 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $437E81.l,X		; FF 81 7E 43
	ldy $DC23.w,X		; BC 23 DC
	ora [$F8.b]		; 07 F8
	ora $FF00F0.l		; 0F F0 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	and $817FC1.l,X		; 3F C1 7F 81
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FE83FC.l,X		; FF FC 83 FE
	sta ($FF.b,X)		; 81 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra 127.b		; 80 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $04FF7F.l,X		; FF 7F FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $C07F80.l,X		; FF 80 7F C0
	and $E03FC0.l,X		; 3F C0 3F E0
	ora $000FF0.l,X		; 1F F0 0F 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $01DF20.l,X		; BF 20 DF 01
	inc $FC03.w,X		; FE 03 FC
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	ora $E01FF0.l		; 0F F0 1F E0
	and $807FC0.l,X		; 3F C0 7F 80
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
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $F80FF0.l,X		; FF F0 0F F8
	ora [$FC.b]		; 07 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $04FFFF.l,X		; FF FF FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $003FC0.l,X		; 7F C0 3F 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FE01.l,X		; FF 01 FE 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $07FF7F.l,X		; FF 7F FF 07
	sed		; F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $807FC0.l,X		; 3F C0 7F 80
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $03FFFF.l,X		; FF FF FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $FFFC03.l,X		; FF 03 FC FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $04FFFC.l,X		; FF FC FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $007F80.l,X		; FF 80 7F 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $01FF7F.l,X		; FF 7F FF 01
	inc $FC03.w,X		; FE 03 FC
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $FFFF80.l,X		; 7F 80 FF FF
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
	sbc $03FFFF.l,X		; FF FF FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $FFFC03.l,X		; FF 03 FC FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $04FFFC.l,X		; FF FC FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
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
	brk $04.b		; 00 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $03FF7F.l,X		; FF 7F FF 03
	jsr ($F807.w,X)		; FC 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $C03FC0.l,X		; 3F C0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $E03FC0.l,X		; FF C0 3F E0
	ora $F80FF0.l,X		; 1F F0 0F F8
	ora [$FC.b]		; 07 FC
	ora $FC.b,S		; 03 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $04FFFF.l,X		; FF FF FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $03FE01.l,X		; FF 01 FE 03
	jsr ($F807.w,X)		; FC 07 F8
	ora $F00FF0.l		; 0F F0 0F F0
	ora $C03FE0.l,X		; 1F E0 3F C0
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $F8FFFC.l,X		; FF FC FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $E03FC0.l,X		; 7F C0 3F E0
	ora $F00FF0.l,X		; 1F F0 0F F0
	ora $FC07F8.l		; 0F F8 07 FC
	ora $FF.b,S		; 03 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $04FFFF.l,X		; FF FF FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FC03.w,X		; FE 03 FC
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $04FFF8.l,X		; FF F8 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FE01.w,X		; FE 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	tsb $FB.b		; 04 FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $04FF00.l,X		; FF 00 FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $04FF7F.l,X		; FF 7F FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FE01.l,X		; FF 01 FE 03
	jsr ($FC03.w,X)		; FC 03 FC
	ora [$F8.b]		; 07 F8
	ora $FFFFF0.l		; 0F F0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C03FFF.l,X		; FF FF 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $FFF807.l,X		; FF 07 F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $C03FC0.l,X		; 7F C0 3F C0
	and $F01FE0.l,X		; 3F E0 1F F0
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $08FB04.l,X		; FF 04 FB 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $00FF7F.l,X		; FF 7F FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FC03.w,X		; FE 03 FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $E01FF0.l		; 0F F0 1F E0
	and $807FC0.l,X		; 3F C0 7F 80
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	cpy #$FF3F.w		; C0 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $04FFFF.l,X		; FF FF FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $0FFF07.l,X		; FF 07 FF 0F
	sbc $3FFF1F.l,X		; FF 1F FF 3F
	sbc $00FF7F.l,X		; FF 7F FF 00
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
	sbc $FFFE01.l,X		; FF 01 FE FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $07FFFF.l,X		; FF FF FF 07
	sed		; F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $807FC0.l,X		; 3F C0 7F 80
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FFF80F.l,X		; FF 0F F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F0FFF8.l,X		; FF F8 FF F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $08FB04.l,X		; FF 04 FB 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $04FFFE.l,X		; FF FE FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FFFF.l,X		; FF FF FF 01
	inc $FC03.w,X		; FE 03 FC
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $FFFF80.l,X		; 7F 80 FF FF
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
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FFF00F.l,X		; FF 0F F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
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
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
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
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $C03FC0.l,X		; 3F C0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
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
	tsb $FB.b		; 04 FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $00FFFE.l,X		; FF FE FF 00
	sbc $03FE01.l,X		; FF 01 FE 03
	jsr ($F807.w,X)		; FC 07 F8
	ora $F00FF0.l		; 0F F0 0F F0
	ora $C03FE0.l,X		; 1F E0 3F C0
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
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $FFFFF0.l		; 0F F0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C03FFF.l,X		; FF FF 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $1FFF0F.l,X		; FF 0F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FFF01F.l,X		; FF 1F F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	cpx #$E0FF.w		; E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $E01FFF.l,X		; 1F FF 1F E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $C07F80.l,X		; 7F 80 7F C0
	and $FF1FE0.l,X		; 3F E0 1F FF
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
	sbc $FF7F80.l,X		; FF 80 7F FF
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
	sbc $FFFE01.l,X		; FF 01 FE FF
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $E03FFF.l,X		; 3F FF 3F E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $C0FFE0.l,X		; FF E0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $00FFC0.l,X		; FF C0 FF 00
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
	brk $08.b		; 00 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $090000.l,X		; FF 00 00 09
	inc $01.b,X		; F6 01
	inc $7C83.w,X		; FE 83 7C
	eor [$B8.b]		; 47 B8
	and $E01FD0.l		; 2F D0 1F E0
	ora $0000E0.l,X		; 1F E0 00 00
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	brk $00.b		; 00 00
	dey		; 88
	adc [$80.b],Y		; 77 80
	adc $E03FC0.l,X		; 7F C0 3F E0
	ora $F80FF0.l,X		; 1F F0 0F F8
	ora [$F8.b]		; 07 F8
	ora [$00.b]		; 07 00
	brk $80.b		; 00 80
	sbc $E0FFC0.l,X		; FF C0 FF E0
	sbc $F8FFF0.l,X		; FF F0 FF F8
	sbc $FEFFFC.l,X		; FF FC FF FE
	sbc $080000.l,X		; FF 00 00 08
	sbc [$00.b],Y		; F7 00
	sbc $407F80.l,X		; FF 80 7F 40
	lda $00DF20.l,X		; BF 20 DF 00
	sbc $00FD02.l,X		; FF 02 FD 00
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $E01FFF.l,X		; 1F FF 1F E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	ora $FC07F8.l		; 0F F8 07 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $FF3FC0.l,X		; 7F C0 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	and $F01FE0.l,X		; 3F E0 1F F0
	ora $FC07F8.l		; 0F F8 07 FC
	ora $FC.b,S		; 03 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
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
	sbc $03FFFF.l,X		; FF FF FF 03
	jsr ($F807.w,X)		; FC 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $C03FC0.l,X		; 3F C0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	cpy #$C0FF.w		; C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $E03FC0.l,X		; 7F C0 3F E0
	ora $F00FF0.l,X		; 1F F0 0F F0
	ora $FC07F8.l		; 0F F8 07 FC
	ora $FF.b,S		; 03 FF
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
	sbc $03FE01.l,X		; FF 01 FE 03
	jsr ($F807.w,X)		; FC 07 F8
	ora $F00FF0.l		; 0F F0 0F F0
	ora $C03FE0.l,X		; 1F E0 3F C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	tsb $FB.b		; 04 FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $437E81.l,X		; FF 81 7E 43
	ldy $DC23.w,X		; BC 23 DC
	ora [$F8.b]		; 07 F8
	ora $FF00F0.l		; 0F F0 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	and $807FC0.l,X		; 3F C0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($FE03.w,X)		; FC 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $04FFFF.l,X		; FF FF FF 04
	xce		; FB
	php		; 08
	sbc [$00.b],Y		; F7 00
	sbc $C07F80.l,X		; FF 80 7F C0
	and $E03FC0.l,X		; 3F C0 3F E0
	ora $000FF0.l,X		; 1F F0 0F 00
	sbc $C0FF80.l,X		; FF 80 FF C0
	sbc $F0FFE0.l,X		; FF E0 FF F0
	sbc $FCFFF8.l,X		; FF F8 FF FC
	sbc $FFFFFE.l,X		; FF FE FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
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
	sbc $00FFFF.l,X		; FF FF FF 00
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
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FDFEFF.l,X		; FF FF FE FD
	inc $FDFB.w,X		; FE FB FD
	sbc [$F9.b],Y		; F7 F9
	sbc $E1DFF1.l		; EF F1 DF E1
	sta $0000E1.l,X		; 9F E1 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	asl $07.b		; 06 07
	asl $1E0F.w		; 0E 0F 1E
	ora $7E3F3E.l,X		; 1F 3E 3F 7E
	adc $FFFFFF.l,X		; 7F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $F1FFF8.l,X		; FF F8 FF F1
	inc $FEE1.w,X		; FE E1 FE
	cmp $FC.b,S		; C3 FC
	sta [$F8.b]		; 87 F8
	brk $00.b		; 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora $1F1F0F.l		; 0F 0F 1F 1F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
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
	sbc $FFFEFF.l,X		; FF FF FE FF
	jsr ($F8FF.w,X)		; FC FF F8
	sbc $E0FFF0.l,X		; FF F0 FF E0
	sbc $81FFC0.l,X		; FF C0 FF 81
	inc $0000.w,X		; FE 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora $1F1F0F.l		; 0F 0F 1F 1F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
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
	sbc $FFFEFF.l,X		; FF FF FE FF
	jsr ($F8FF.w,X)		; FC FF F8
	sbc $E0FFF0.l,X		; FF F0 FF E0
	sbc $80FFC0.l,X		; FF C0 FF 80
	sbc $010000.l,X		; FF 00 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $FF7F7F.l,X		; 3F 7F 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $F0FFF8.l,X		; FF F8 FF F0
	sbc $C0FFE0.l,X		; FF E0 FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $FF7F7F.l,X		; 3F 7F 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $F0FFF8.l,X		; FF F8 FF F0
	sbc $C0FFE0.l,X		; FF E0 FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $FF7F7F.l,X		; 3F 7F 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $F0FFF8.l,X		; FF F8 FF F0
	sbc $C0FFE0.l,X		; FF E0 FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $FF7F7F.l,X		; 3F 7F 7F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
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
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $F3FEF9.l,X		; FF F9 FE F3
	jsr ($FCE3.w,X)		; FC E3 FC
	cmp [$F8.b]		; C7 F8
	sta $0000F0.l		; 8F F0 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora $1F1F0F.l		; 0F 0F 1F 1F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	and $817FC1.l,X		; 3F C1 7F 81
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFF.l,X		; FF FF FF FE
	sbc $F8FFFC.l,X		; FF FC FF F8
	sbc $E0FFF0.l,X		; FF F0 FF E0
	sbc $83FEC1.l,X		; FF C1 FE 83
	jsr ($0000.w,X)		; FC 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora $1F1F0F.l		; 0F 0F 1F 1F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	ora $E01FF0.l		; 0F F0 1F E0
	and $807FC0.l,X		; 3F C0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	jsr ($F8FF.w,X)		; FC FF F8
	sbc $E0FFF0.l,X		; FF F0 FF E0
	sbc $80FFC0.l,X		; FF C0 FF 80
	sbc $010000.l,X		; FF 00 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $037F7F.l,X		; 3F 7F 7F 03
	jsr ($F807.w,X)		; FC 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $C03FC0.l,X		; 3F C0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	jsr ($F8FF.w,X)		; FC FF F8
	sbc $E0FFF0.l,X		; FF F0 FF E0
	sbc $80FFC0.l,X		; FF C0 FF 80
	sbc $010000.l,X		; FF 00 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $007F7F.l,X		; 3F 7F 7F 00
	sbc $03FE01.l,X		; FF 01 FE 03
	jsr ($F807.w,X)		; FC 07 F8
	ora $F00FF0.l		; 0F F0 0F F0
	ora $C03FE0.l,X		; 1F E0 3F C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	jsr ($F8FF.w,X)		; FC FF F8
	sbc $E0FFF0.l,X		; FF F0 FF E0
	sbc $80FFC0.l,X		; FF C0 FF 80
	sbc $010000.l,X		; FF 00 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $007F7F.l,X		; 3F 7F 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $03FE01.l,X		; FF 01 FE 03
	jsr ($FC03.w,X)		; FC 03 FC
	ora [$F8.b]		; 07 F8
	ora $FFFFF0.l		; 0F F0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	inc $FCFF.w,X		; FE FF FC
	sbc $F0FFF8.l,X		; FF F8 FF F0
	sbc $C0FFE0.l,X		; FF E0 FF C0
	sbc $00FF80.l,X		; FF 80 FF 00
	brk $01.b		; 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $007F7F.l,X		; 3F 7F 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $01FF00.l,X		; FF 00 FF 01
	inc $FC03.w,X		; FE 03 FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFEFF.l,X		; FF FF FE FF
	jsr ($F8FF.w,X)		; FC FF F8
	sbc $E0FFF0.l,X		; FF F0 FF E0
	sbc $80FFC0.l,X		; FF C0 FF 80
	sbc $010000.l,X		; FF 00 00 01
	ora ($03.b,X)		; 01 03
	ora $07.b,S		; 03 07
	ora [$0F.b]		; 07 0F
	ora $3F1F1F.l		; 0F 1F 1F 3F
	and $007F7F.l,X		; 3F 7F 7F 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFF00.l,X		; FF 00 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	sbc $FDFEFF.l,X		; FF FF FE FD
	inc $FCFB.w,X		; FE FB FC
	sbc [$F8.b],Y		; F7 F8
	sbc $E0DFF0.l		; EF F0 DF E0
	sta $0000E0.l,X		; 9F E0 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora $1F1F0F.l		; 0F 0F 1F 1F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc $FFFEFF.l,X		; FF FF FE FF
	jsr ($F9FF.w,X)		; FC FF F9
	inc $FCF3.w,X		; FE F3 FC
	sbc $FC.b,S		; E3 FC
	cmp [$F8.b]		; C7 F8
	sta $0000F0.l		; 8F F0 00 00
	ora ($01.b,X)		; 01 01
	ora $03.b,S		; 03 03
	ora [$07.b]		; 07 07
	ora $1F1F0F.l		; 0F 0F 1F 1F
	and $7F7F3F.l,X		; 3F 3F 7F 7F
	and $807FC0.l,X		; 3F C0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $00.b		; 00 00
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora $FD.b,S		; 03 FD
	ora [$F9.b]		; 07 F9
	ora $E11FF1.l		; 0F F1 1F E1
	ora $0000E1.l,X		; 1F E1 00 00
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	asl $FF.b		; 06 FF
	asl $1EFF.w		; 0E FF 1E
	sbc $7EFF3E.l,X		; FF 3E FF 7E
	sbc $800000.l,X		; FF 00 00 80
	brk $80.b		; 00 80
	rti		; 40

	cpy #$E0A0.w		; C0 A0 E0
	bcc -16.b		; 90 F0
	dey		; 88
	sed		; F8
	sty $F8.b		; 84 F8
	stx $00.b		; 86 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$E060.w		; C0 60 E0
	bvs -16.b		; 70 F0
	sei		; 78
	sed		; F8
	jmp ($7EFC.w,X)		; 7C FC 7E
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
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $03FF01.l,X		; FF 01 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FCFFFE.l,X		; FF FE FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $000000.l,X		; FF 00 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	bra 112.b		; 80 70
	bra 120.b		; 80 78
	cpy #$E03C.w		; C0 3C E0
	asl $0000.w,X		; 1E 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $FF00F0.l		; 0F F0 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	and $817FC1.l,X		; 3F C1 7F 81
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	sbc $01FF01.l,X		; FF 01 FF 01
	inc $FEFF.w,X		; FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FEFFFE.l,X		; FF FE FF FE
	sbc $FE83FC.l,X		; FF FC 83 FE
	sta ($FF.b,X)		; 81 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra  -1.b		; 80 FF
	bra 127.b		; 80 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $7FFF7F.l,X		; FF 7F FF 7F
	sbc $00FF7F.l,X		; FF 7F FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$6080.w		; C0 80 60
	cpy #$C030.w		; C0 30 C0
	sec		; 38
	cpx #$F01C.w		; E0 1C F0
	asl $0000.w		; 0E 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FF00.w,X		; FE 00 FF
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	ora $E01FF0.l		; 0F F0 1F E0
	and $807FC0.l,X		; 3F C0 7F 80
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
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $F80FF0.l,X		; FF F0 0F F8
	ora [$FC.b]		; 07 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	bra 124.b		; 80 7C
	cpy #$003E.w		; C0 3E 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$E0E0.w		; C0 E0 E0
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FF00.w,X		; FE 00 FF
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
	ora ($FE.b,X)		; 01 FE
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $807FC0.l,X		; 3F C0 7F 80
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $03FFFF.l,X		; FF FF FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $FFFC03.l,X		; FF 03 FC FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $00FFFC.l,X		; FF FC FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	bra 126.b		; 80 7E
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
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
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $FFFF80.l,X		; 7F 80 FF FF
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
	sbc $03FFFF.l,X		; FF FF FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $FFFC03.l,X		; FF 03 FC FF
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $00FFFC.l,X		; FF FC FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $C03FC0.l,X		; 3F C0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $E03FC0.l,X		; FF C0 3F E0
	ora $F80FF0.l,X		; 1F F0 0F F8
	ora [$FC.b]		; 07 FC
	ora $FC.b,S		; 03 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $F00FF0.l		; 0F F0 0F F0
	ora $C03FE0.l,X		; 1F E0 3F C0
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
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $03FF03.l,X		; FF 03 FF 03
	sbc $07FF03.l,X		; FF 03 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	jsr ($FCFF.w,X)		; FC FF FC
	sbc $FCFFFC.l,X		; FF FC FF FC
	sbc $F8FFFC.l,X		; FF FC FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $E03FC0.l,X		; 7F C0 3F E0
	ora $F00FF0.l,X		; 1F F0 0F F0
	ora $FC07F8.l		; 0F F8 07 FC
	ora $FF.b,S		; 03 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FF00.w,X		; FE 00 FF
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
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $00FFF8.l,X		; FF F8 FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
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
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
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
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $FFFFF0.l		; 0F F0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C03FFF.l,X		; FF FF 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $FFF807.l,X		; FF 07 F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $C03FC0.l,X		; 7F C0 3F C0
	and $F01FE0.l,X		; 3F E0 1F F0
	ora $FFFFFF.l		; 0F FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $000000.l,X		; FF 00 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora $E01FF0.l		; 0F F0 1F E0
	and $807FC0.l,X		; 3F C0 7F 80
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
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	bra 127.b		; 80 7F
	cpy #$FF3F.w		; C0 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FF00.w,X		; FE 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
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
	ora ($FE.b,X)		; 01 FE
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $807FC0.l,X		; 3F C0 7F 80
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $07FFFF.l,X		; FF FF FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $07FF07.l,X		; FF 07 FF 07
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FFF80F.l,X		; FF 0F F8 FF
	sed		; F8
	sbc $F8FFF8.l,X		; FF F8 FF F8
	sbc $F0FFF8.l,X		; FF F8 FF F0
	sbc $F0FFF0.l,X		; FF F0 FF F0
	sbc $000000.l,X		; FF 00 00 00
	bra   0.b		; 80 00
	cpy #$E000.w		; C0 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
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
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $FFFF80.l,X		; 7F 80 FF FF
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
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $FFF00F.l,X		; FF 0F F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
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
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
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
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	ora $C03FE0.l,X		; 1F E0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $C03FC0.l,X		; 3F C0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
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
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $E0.b		; 00 E0
	brk $F0.b		; 00 F0
	brk $F8.b		; 00 F8
	brk $FC.b		; 00 FC
	brk $FE.b		; 00 FE
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $FF00.w,X		; FE 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $F00FF0.l		; 0F F0 0F F0
	ora $C03FE0.l,X		; 1F E0 3F C0
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
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $FFFFF0.l		; 0F F0 FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C03FFF.l,X		; FF FF 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $0FFFFF.l,X		; FF FF FF 0F
	sbc $0FFF0F.l,X		; FF 0F FF 0F
	sbc $1FFF0F.l,X		; FF 0F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $FFF01F.l,X		; FF 1F F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	beq  -1.b		; F0 FF
	cpx #$E0FF.w		; E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $E01FFF.l,X		; 1F FF 1F E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $00FFE0.l,X		; FF E0 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $C07F80.l,X		; 7F 80 7F C0
	and $FF1FE0.l,X		; 3F E0 1F FF
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
	sbc $FF7F80.l,X		; FF 80 7F FF
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
	sbc $FFFE01.l,X		; FF 01 FE FF
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
	ora $FF1FFF.l,X		; 1F FF 1F FF
	ora $FF1FFF.l,X		; 1F FF 1F FF
	and $FF3FFF.l,X		; 3F FF 3F FF
	and $E03FFF.l,X		; 3F FF 3F E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $C0FFE0.l,X		; FF E0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $00FFC0.l,X		; FF C0 FF 00
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
	brk $00.b		; 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $000000.l,X		; FF 00 00 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $010000.l,X		; FF 00 00 01
	inc $FE01.w,X		; FE 01 FE
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	ora $0000E0.l,X		; 1F E0 00 00
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	bra  64.b		; 80 40
	cpy #$E020.w		; C0 20 E0
	bpl -16.b		; 10 F0
	php		; 08
	sed		; F8
	tsb $F8.b		; 04 F8
	asl $00.b		; 06 00
	brk $80.b		; 00 80
	bra -64.b		; 80 C0
	cpy #$E0E0.w		; C0 E0 E0
	beq -16.b		; F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
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
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	sbc $1FFF1F.l,X		; FF 1F FF 1F
	cpx #$E0FF.w		; E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $E0FFE0.l,X		; FF E0 FF E0
	sbc $F80FF0.l,X		; FF F0 0F F8
	ora [$FC.b]		; 07 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $FF3FC0.l,X		; 7F C0 3F FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $C0FFFF.l,X		; FF FF FF C0
	and $F01FE0.l,X		; 3F E0 1F F0
	ora $FC07F8.l		; 0F F8 07 FC
	ora $FC.b,S		; 03 FC
	ora $FE.b,S		; 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
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
	sbc $03FFFF.l,X		; FF FF FF 03
	jsr ($F807.w,X)		; FC 07 F8
	ora $E01FF0.l		; 0F F0 1F E0
	and $C03FC0.l,X		; 3F C0 3F C0
	adc $00FF80.l,X		; 7F 80 FF 00
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
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	sbc $3FFF3F.l,X		; FF 3F FF 3F
	cpy #$C0FF.w		; C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $C0FFC0.l,X		; FF C0 FF C0
	sbc $80FF00.l,X		; FF 00 FF 80
	adc $E03FC0.l,X		; 7F C0 3F E0
	ora $F00FF0.l,X		; 1F F0 0F F0
	ora $FC07F8.l		; 0F F8 07 FC
	ora $FF.b,S		; 03 FF
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
	sbc $03FE01.l,X		; FF 01 FE 03
	jsr ($F807.w,X)		; FC 07 F8
	ora $F00FF0.l		; 0F F0 0F F0
	ora $C03FE0.l,X		; 1F E0 3F C0
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	ora ($FE.b,X)		; 01 FE
	ora $FC.b,S		; 03 FC
	ora $FC.b,S		; 03 FC
	ora [$F8.b]		; 07 F8
	ora $FF00F0.l		; 0F F0 00 FF
	ora ($FF.b,X)		; 01 FF
	ora $FF.b,S		; 03 FF
	ora [$FF.b]		; 07 FF
	ora $FF1FFF.l		; 0F FF 1F FF
	and $FF7FFF.l,X		; 3F FF 7F FF
	and $807FC0.l,X		; 3F C0 7F 80
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $00FF00.l,X		; FF 00 FF 00
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	jsr ($FE03.w,X)		; FC 03 FE
	ora ($FF.b,X)		; 01 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	brk $FF.b		; 00 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $00FFFF.l,X		; FF FF FF 00
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	cpy #$6080.w		; C0 80 60
	cpy #$C030.w		; C0 30 C0
	sec		; 38
	cpx #$F01C.w		; E0 1C F0
	asl $0000.w		; 0E 00 00
	bra -128.b		; 80 80
	cpy #$E0C0.w		; C0 C0 E0
	cpx #$F0F0.w		; E0 F0 F0
	sed		; F8
	sed		; F8
	jsr ($FEFC.w,X)		; FC FC FE
	inc $5559.w,X		; FE 59 55
	phk		; 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $35.b		; 00 35
	jsr $03E9.w		; 20 E9 03
	inc A		; 1A
	jsr $5243.w		; 20 43 52
	eor ($53.b,X)		; 41 53
	pha		; 48
	rol $6F73.w		; 2E 73 6F
	jmp ($6F00.w)		; 6C 00 6F
	jmp ($0D00.w)		; 6C 00 0D
	ora $0B120F.l		; 0F 0F 12 0B
	sbc #$D9D4.w		; E9 D4 D9
	cmp $270DED.l,X		; DF ED 0D 27
	and #$101B.w		; 29 1B 10
	ora $F1.b,S		; 03 F1
	sbc ($02.b)		; F2 02
	ora #$FC02.w		; 09 02 FC
	sbc $EAEE.w,Y		; F9 EE EA
	sbc $05.b,X		; F5 05
	bpl  21.b		; 10 15
	clc		; 18
	bpl  -9.b		; 10 F7
	jmp.w [$E8DD]		; DC DD E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $64.b		; 00 64
	brk $C4.b		; 00 C4
	tsb $04.b		; 04 04
	ora ($04.b,X)		; 01 04
	ora ($DD.b),Y		; 11 DD
	ldy $0F.b		; A4 0F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	bpl -21.b		; 10 EB
	sta $F1CEB0.l,X		; 9F B0 CE F1
	eor [$63.b],Y		; 57 63
	ora $CA20E0.l,X		; 1F E0 20 CA
	bcs -69.b		; B0 BB
	ldx $D00E.w,Y		; BE 0E D0
	mvp $FC,$32		; 44 32 FC
	cmp $1E23B0.l		; CF B0 23 1E
	cpy $ADDB.w		; CC DB AD
	sbc ($35.b),Y		; F1 35
	and $24CDB0.l,X		; 3F B0 CD 24
	and $03BDDB.l		; 2F DB BD 03
	mvn $B4,$22		; 54 22 B4
	jsr $E2EC.w		; 20 EC E2
	eor ($EC.b)		; 52 EC
	cmp $B41B44.l,X		; DF 44 1B B4
	bcs  84.b		; B0 54
	jsr ($45D0.w,X)		; FC D0 45
	rol $11DE.w		; 2E DE 11
	bcs  15.b		; B0 0F
	wai		; CB
	cmp $E1CB.w		; CD CB E1
	and ($20.b,S),Y		; 33 20
	jmp.w [$F1B0]		; DC B0 F1
	and $40.b,X		; 35 40
	ora $65.b,S		; 03 65
	eor $20.b,S		; 43 20
	sbc $02A4.w		; ED A4 02
	eor ($DA.b,X)		; 41 DA
	sta $3F37.w,Y		; 99 37 3F
	trb $5F.b		; 14 5F
	ldy $DF.b,X		; B4 DF
	jsl $23CFEC.l		; 22 EC CF 23
	ora ($2F.b)		; 12 2F
	cmp ($B4.b,X)		; C1 B4
	eor ($F1.b)		; 52 F1
	jsr $F0EF.w		; 20 EF F0
	sbc $A4DDFE.l,X		; FF FE DD A4
	sbc $40.b,X		; F5 40
	sbc ($20.b),Y		; F1 20
	ora ($24.b)		; 12 24
	adc $EC.b,X		; 75 EC
	ldy $EF.b		; A4 EF
	sbc $FF00EF.l,X		; FF EF 00 FF
	inc $DBFF.w		; EE FF DB
	cpy #$FDDF.w		; C0 DF FD
	cpy $DEDD.w		; CC DD DE
	sbc $C02201.l,X		; FF 01 22 C0
	bit $43.b		; 24 43
	and ($11.b,X)		; 21 11
	ora ($0F.b),Y		; 11 0F
	ora $61A4EF.l		; 0F EF A4 61
	dec $EF1F.w,X		; DE 1F EF
	dec $15CC.w,X		; DE CC 15
	bit $B0.b,X		; 34 B0
	and ($CD.b),Y		; 31 CD
	and $20.b,X		; 35 20
	ora ($32.b,S),Y		; 13 32
	xce		; FB
	txs		; 9A
	ldy $33.b,X		; B4 33
	eor $EB.b,S		; 43 EB
	trb $0C.b		; 14 0C
	and $EB.b,S		; 23 EB
	ora $A4.b,S		; 03 A4
	eor ($0D.b)		; 52 0D
	cmp $FFF0FF.l,X		; DF FF F0 FF
	beq  14.b		; F0 0E
	ldy $EF.b		; A4 EF
	dex		; CA
	cmp ($54.b)		; D2 54
	bit $52.b		; 24 52
	ldy $C037.w,X		; BC 37 C0
	jsr $12F0.w		; 20 F0 12
	bit $54.b,X		; 34 54
	and ($11.b)		; 32 11
	asl $E3B4.w		; 0E B4 E3
	rti		; 40

	cmp $F3DF.w,X		; DD DF F3
	eor ($CA.b)		; 52 CA
.ACCU 8
.INDEX 8
	sep #$B0		; E2 B0
	dec $47F1.w,X		; DE F1 47
	stz $21.b,X		; 74 21
	ora ($21.b),Y		; 11 21
	ora $CBDDA4.l		; 0F A4 DD CB
	cmp ($44.b,X)		; C1 44
	jsl $761312.l		; 22 12 13 76
	ldy $FC.b		; A4 FC
	dec $F0FF.w,X		; DE FF F0
	beq -38.b		; F0 DA
	sbc $4E.b		; E5 4E
	ldy $F2.b		; A4 F2
	and $EE000F.l		; 2F 0F 00 EE
	xba		; EB
	ldy #$74.b		; A0 74
	ldy $23.b,X		; B4 23
	asl $FDEF.w,X		; 1E EF FD
	sbc ($22.b),Y		; F1 22
	ora ($35.b)		; 12 35
	ldy $2B.b		; A4 2B
	dec $FEEE.w		; CE EE FE
	plb		; AB
	asl $64.b,X		; 16 64
	and $E1DBB4.l		; 2F B4 DB E1
	jsl $FF2113.l		; 22 13 21 FF
	dec $B003.w,X		; DE 03 B0
	eor $0B.b,S		; 43 0B
	sta $46BF.w,Y		; 99 BF 46
	bmi  -1.b		; 30 FF
	cpx $15A4.w		; EC A4 15
	and $DADF.w		; 2D DF DA
	lda ($50.b,S),Y		; B3 50
	cop $0E.b		; 02 0E
	ldy $23.b		; A4 23
	bpl  17.b		; 10 11
	ora ($11.b),Y		; 11 11
	ora ($11.b),Y		; 11 11
	rol $B4.b,X		; 36 B4
	rol $EEEE.w		; 2E EE EE
	ora ($FD.b)		; 12 FD
	cpy $1102.w		; CC 02 11
	ldy $24.b		; A4 24
	asl A		; 0A
	rep #$42		; C2 42
	and $1C.b,S		; 23 1C
	cmp ($74.b,S),Y		; D3 74
	sty $FA.b,X		; 94 FA
	lda $FFED.w		; AD ED FF
	inc $FDEF.w,X		; FE EF FD
	tyx		; BB
	ldy $DE.b,X		; B4 DE
	and $0D.b,S		; 23 0D
	sbc ($43.b,X)		; E1 43
	beq  34.b		; F0 22
	jmp.w [$BDB0]		; DC B0 BD
	ora $65.b,X		; 15 65
	and ($12.b,X)		; 21 12
	mvp $12,$10		; 44 10 12
	bcs  13.b		; B0 0D
	tax		; AA
	cmp ($41.b)		; D2 41
	cmp $6415.w,X		; DD 15 64
	ora $05B4.w		; 0D B4 05
	.db $42, $DD		; 42 DD
	sbc $2F.b,S		; E3 2F
	sbc $C00F0F.l,X		; FF 0F 0F C0
	inc $CDDC.w,X		; FE DC CD
	sbc ($0E.b),Y		; F1 0E
	sbc $B02102.l		; EF 02 21 B0
	stp		; DB
	cmp $772401.l,X		; DF 01 24 77
	adc $32.b		; 65 32
	bpl -92.b		; 10 A4
	sbc $3D17CB.l,X		; FF CB 17 3D
	dec $FE0F.w,X		; DE 0F FE
	cmp $CDA4.w,X		; DD A4 CD
	bit $32.b		; 24 32
	and ($22.b,X)		; 21 22
	and $B422F1.l		; 2F F1 22 B4
	jsl $E1CB20.l		; 22 20 CB E1
	jsl $EE1E23.l		; 22 23 1E EE
	ldy $EC.b		; A4 EC
	ldy $6604.w		; AC 04 66
	and $C2BADC.l,X		; 3F DC BA C2
	ldy $44.b,X		; B4 44
	ora $D0FDDF.l,X		; 1F DF FD D0
	lsr $0B.b,X		; 56 0B
	ldx $33B4.w		; AE B4 33
	mvn $ED,$1E		; 54 1E ED
	sbc ($2E.b,S),Y		; F3 2E
	ldy $B403.w,X		; BC 03 B4
	mvn $EB,$1F		; 54 1F EB
	cmp ($41.b)		; D2 41
	tsb $1E.b		; 04 1E
	sbc ($B4.b,X)		; E1 B4
	ora $0F00FF.l,X		; 1F FF 00 0F
	inc $65D1.w		; EE D1 65
	ora $EFB4.w		; 0D B4 EF
	ora $4422DF.l		; 0F DF 22 44
	and $A4DFDE.l		; 2F DE DF A4
	cmp $113223.l,X		; DF 23 32 11
	ora ($44.b)		; 12 44
	asl A		; 0A
	sbc $A4.b,S		; E3 A4
	stz $FB.b,X		; 74 FB
	sbc $1C03B9.l		; EF B9 03 1C
	dec $A457.w,X		; DE 57 A4
	bvc -35.b		; 50 DD
	cmp $EF0F0F.l,X		; DF 0F 0F EF
	ora $10A4FF.l		; 0F FF A4 10
	asl $9CFC.w		; 0E FC 9C
	ora $32.b,X		; 15 32
	ora ($22.b,X)		; 01 22
	ldy $22.b		; A4 22
	jsl $1CED66.l		; 22 66 ED 1C
	lda $A4F40E.l,X		; BF 0E F4 A4
	ora $2111E0.l,X		; 1F E0 11 21
	rol $6F.b		; 26 6F
	cmp $94FF.w		; CD FF 94
	cmp $DFDD.w		; CD DD DF
	ora $1EE0ED.l		; 0F ED E0 1E
	jmp.w [$ECB4]		; DC B4 EC
	pea $2130.w		; F4 30 21
	wai		; CB
	cop $45.b		; 02 45
	eor $02ABB4.l		; 4F B4 AB 02
	bpl  17.b		; 10 11
	jsr $1010.w		; 20 10 10
	beq -92.b		; F0 A4
	bpl   4.b		; 10 04
	stz $FE.b		; 64 FE
	sbc $EEFFEE.l,X		; FF EE FF EE
	ldy $FE.b		; A4 FE
	stp		; DB
	ldy $4005.w		; AC 05 40
	ora ($11.b),Y		; 11 11
	and ($A4.b)		; 32 A4
	inc $0111.w,X		; FE 11 01
	ora ($20.b),Y		; 11 20
	bpl  20.b		; 10 14
	rts		; 60

	ldy $BF.b		; A4 BF
	jsr $EEEE.w		; 20 EE EE
	sbc $EE0FE0.l		; EF E0 0F EE
	ldy $00.b,X		; B4 00
	beq  -1.b		; F0 FF
	brk $ED.b		; 00 ED
	cmp ($35.b),Y		; D1 35
	asl $D1B4.w,X		; 1E B4 D1
	bit $50.b		; 24 50
	lda $2C36.w,X		; BD 36 2C
	lda $B403.w		; AD 03 B4
	and ($FF.b),Y		; 31 FF
	ora ($10.b),Y		; 11 10
	beq  51.b		; F0 33
	jsr ($B0F3.w,X)		; FC F3 B0
	adc [$75.b]		; 67 75
	and ($11.b),Y		; 31 11
	asl $9DB9.w		; 0E B9 9D
	ora ($B0.b)		; 12 B0
	ora $DFDD.w		; 0D DD DF
	ora ($10.b),Y		; 11 10
	nop		; EA
	sta $B024.w,X		; 9D 24 B0
	eor ($FE.b,X)		; 41 FE
	stp		; DB
	sta $33C0.w,Y		; 99 C0 33
	sbc $A4F1.w,X		; FD F1 A4
	plx		; FA
	cmp ($32.b),Y		; D1 32
	ora ($01.b),Y		; 11 01
	ora ($11.b)		; 12 11
	jsl $250DA4.l		; 22 A4 0D 25
	rol $EC01.w		; 2E 01 EC
	sbc $A4FEF0.l		; EF F0 FE A4
	inc $0F0F.w		; EE 0F 0F
	sbc $C0DC.w		; ED DC C0
	and ($F2.b)		; 32 F2
	ldy $32.b		; A4 32
	jsl $4B4721.l		; 22 21 47 4B
	sta ($3B.b)		; 92 3B
	lda ($A4.b),Y		; B1 A4
	asl $2D15.w,X		; 1E 15 2D
	cmp $242202.l		; CF 02 22 24
	rti		; 40

	ldy $DB.b,X		; B4 DB
	bne  34.b		; D0 22
	bpl   1.b		; 10 01
	and ($1E.b,S),Y		; 33 1E
	cmp $FFFFA4.l,X		; DF A4 FF FF
	sbc $F0DDCC.l,X		; FF CC DD F0
	brk $03.b		; 00 03
	ldy $32.b		; A4 32
	and ($10.b,X)		; 21 10
	and ($1E.b,S),Y		; 33 1E
	bne 101.b		; D0 65
	asl $2594.w		; 0E 94 25
	nop		; EA
	cmp $EDED.w,X		; DD ED ED
	stp		; DB
	ldy $A40F.w		; AC 0F A4
	xce		; FB
	cmp $112344.l		; CF 44 23 11
	jsl $A42C34.l		; 22 34 2C A4
	ldy #$52.b		; A0 52
	ora ($1F.b)		; 12 1F
	inc $FB01.w,X		; FE 01 FB
	cmp $5623A4.l		; CF A4 23 56
	and $EEDD.w		; 2D DD EE
	sbc $A4F00F.l		; EF 0F F0 A4
	cpx $DEDF.w		; EC DF DE
	lsr $2F.b		; 46 2F
	sbc $A42211.l,X		; FF 11 22 A4
	ora ($33.b,S),Y		; 13 33
	adc $FB.b		; 65 FB
	cmp $AFDB.w		; CD DB AF
	and ($A4.b,S),Y		; 33 A4
	ora ($31.b,X)		; 01 31
	ora $DC7304.l		; 0F 04 73 DC
	dec $B0EC.w,X		; DE EC B0
	tyx		; BB
	lda $CBAC.w,Y		; B9 AC CB
	ldy $EFDE.w,X		; BC DE EF
	cop $A4.b		; 02 A4
	asl $36E0.w,X		; 1E E0 36
	adc ($AA.b,X)		; 61 AA
	ora ($00.b)		; 12 00
	xba		; EB
	ldy $C2.b		; A4 C2
	eor ($FF.b,X)		; 41 FF
	cpx $E1BD.w		; EC BD E1
	and ($CD.b),Y		; 31 CD
	ldy $22.b		; A4 22
	cop $42.b		; 02 42
	ora $2503FF.l		; 0F FF 03 25
	eor ($B0.b)		; 52 B0
	mvn $55,$34		; 54 34 55
	trb $E1BC.w		; 1C BC E1
	mvp $A4,$1F		; 44 1F A4
	asl $52.b,X		; 16 52
	inc $FDEF.w		; EE EF FD
	ldy $5005.w,X		; BC 05 50
	ldy $DC.b,X		; B4 DC
.ACCU 8
	sep #$21		; E2 21
	ora ($F0.b),Y		; 11 F0
	ora ($20.b,S),Y		; 13 20
	ora ($A4.b),Y		; 11 A4
	tsb $E2BB.w		; 0C BB E2
	asl $03DF.w,X		; 1E DF 03
	eor ($FF.b,X)		; 41 FF
	sty $15.b,X		; 94 15
	eor ($02.b,X)		; 41 02
	bmi -38.b		; 30 DA
	lda $A40D77.l,X		; BF 77 0D A4
	sbc $CDCDFE.l		; EF FE CD CD
	and $FD.b,X		; 35 FD
	tsb $47.b		; 04 47
	ldy $2F.b		; A4 2F
	sbc $1102AB.l		; EF AB 02 11
	ora ($23.b)		; 12 23
	jsr $02A4.w		; 20 A4 02
	and $2C.b,X		; 35 2C
	dec $DDED.w,X		; DE ED DD
	ldy $B467.w		; AC 67 B4
	ora $1E230F.l		; 0F 0F 23 1E
	wai		; CB
.ACCU 8
.INDEX 8
	sep #$32		; E2 32
	bpl -76.b		; 10 B4
	and $31.b,S		; 23 31
	ldy $32F3.w,X		; BC F3 32
	ora $E3ED.w		; 0D ED E3
	ldy $40.b,X		; B4 40
	cmp $20F1.w		; CD F1 20
	ldx $F032.w,Y		; BE 32 F0
	ora ($A4.b)		; 12 A4
	and ($CB.b)		; 32 CB
	ora $45.b,X		; 15 45
	pld		; 2B
	dec $71.b,X		; D6 71
	sbc ($B4.b),Y		; F1 B4
	inc $FFF0.w,X		; FE F0 FF
	sbc $DEEEF0.l,X		; FF F0 EE DE
	trb $B4.b		; 14 B4
	and $42D2.w		; 2D D2 42
	sbc $42D0ED.l,X		; FF ED D0 42
	dec $35A4.w,X		; DE A4 35
	bit $4D.b		; 24 4D
	lda ($55.b,X)		; A1 55
	adc $0C.b		; 65 0C
	cmp $FEFFA4.l,X		; DF A4 FF FE
	inc $ADDB.w		; EE DB AD
	and ($37.b,X)		; 21 37
	jmp $55D0B0.l		; 5C B0 D0 55
	and $23C1CA.l		; 2F CA C1 23
	and $43B0BE.l,X		; 3F BE B0 43
	cpx $3313.w		; EC 13 33
	phd		; 0B
	cmp $63.b,S		; C3 63
	ora $02CBB4.l,X		; 1F B4 CB 02
	and ($34.b)		; 32 34
	rol $EEEE.w,X		; 3E EE EE
	dec $9BB0.w,X		; DE B0 9B
	ora $0C.b,S		; 03 0C
	ldx $12F0.w,Y		; BE F0 12
	jsl $20B435.l		; 22 35 B4 20
	sbc $D0FD0F.l		; EF 0F FD D0
	and ($EB.b,S),Y		; 33 EB
	cmp ($B0.b,S),Y		; D3 B0
	asl $41D2.w		; 0E D2 41
	sbc $99CA.w		; ED CA 99
	cmp ($D9.b),Y		; D1 D9
	ldy $37.b,X		; B4 37
	bit $26CE.w		; 2C CE 26
	lsr $E0DE.w,X		; 5E DE E0
	asl $05B4.w,X		; 1E B4 05
	rol $E2EE.w		; 2E EE E2
	stz $EE.b		; 64 EE
	jmp.w [$B4D3]		; DC D3 B4
	ora $F01D35.l,X		; 1F 35 1D F0
	xba		; EB
	cpy #$32.b		; C0 32
	brk $A4.b		; 00 A4
	ora ($45.b),Y		; 11 45
	sbc $4623.w		; ED 23 46
	plx		; FA
	asl $F9.b,X		; 16 F9
	ldy $E3.b,X		; B4 E3
	bit $72A2.w		; 2C A2 72
	lda $67B2.w,Y		; B9 B2 67
	ora $DFB4.w,X		; 1D B4 DF
	sbc $E2CA22.l		; EF 22 CA E2
	and ($23.b)		; 32 23
	eor ($B0.b,X)		; 41 B0
	eor ($EB.b,X)		; 41 EB
	cpy #$32.b		; C0 32
	cmp #$E3.b		; C9 E3
	and ($0C.b)		; 32 0C
	ldy $EF.b,X		; B4 EF
	sbc ($51.b),Y		; F1 51
	bne  48.b		; D0 30
	sbc $51.b,S		; E3 51
	cmp $C02DB4.l,X		; DF B4 2D C0
	ora $F20C24.l,X		; 1F 24 0C F2
	.db $42, $EC		; 42 EC
	ldy $F0.b,X		; B4 F0
	dec $05FE.w,X		; DE FE 05
	and $3ED3.w,X		; 3D D3 3E
	cop $B4.b		; 02 B4
	ora ($20.b),Y		; 11 20
	dec $FA34.w,X		; DE 34 FA
	cmp ($40.b)		; D2 40
	brk $B4.b		; 00 B4
	sbc $E4DCFF.l,X		; FF FF DC E4
	jsr $E31F.w		; 20 1F E3
	eor $DCEFB4.l,X		; 5F B4 EF DC
	and [$1C.b],Y		; 37 1C
	cpx #$04.b		; E0 04
	.db $62, $DB, $B4		; 62 DB B4
	lda $3037.w,X		; BD 37 30
	inc $21DE.w		; EE DE 21
	cmp $D0B431.l,X		; DF 31 B4 D0
	asl $21E3.w,X		; 1E E3 21
	and $1D.b		; 25 1D
	sbc ($FE.b,X)		; E1 FE
	ldy $00.b,X		; B4 00
	inc $D2FD.w,X		; FE FD D2
	bmi   2.b		; 30 02
	phd		; 0B
	asl $B4.b,X		; 16 B4
	inc $BF51.w,X		; FE 51 BF
	and $3EC2.w,X		; 3D C2 3E
	sbc ($1F.b,X)		; E1 1F
	bcs -14.b		; B0 F2
	eor [$75.b],Y		; 57 75
	jsl $1A4532.l		; 22 32 45 1A
	sta $72A4.w,X		; 9D A4 72
	xba		; EB
	bcs  66.b		; B0 42
	ora ($00.b,X)		; 01 00
	ora $55.b,S		; 03 55
	ldy $20.b,X		; B4 20
	inc $0FEF.w,X		; FE EF 0F
	sbc $CD0D0F.l,X		; FF 0F 0D CD
	ldy $31.b		; A4 31
	cpx #$55.b		; E0 55
	lsr $73.b,X		; 56 73
	cmp $51B1.w,Y		; D9 B1 51
	ldy $EF.b,X		; B4 EF
	ora $23CDFC.l		; 0F FC CD 23
	and ($00.b,X)		; 21 00
	ora ($A4.b)		; 12 A4
	bpl  18.b		; 10 12
	and $41.b,S		; 23 41
	asl $6F.b,X		; 16 6F
	cpy $B4DE.w		; CC DE B4
	sbc $1B03.w,X		; FD 03 1B
	lda ($6E.b,X)		; A1 6E
	bcs  94.b		; B0 5E
	cmp ($B0.b,S),Y		; D3 B0
	lsr $2E.b		; 46 2E
.ACCU 8
.INDEX 8
	sep #$31		; E2 31
	sbc $30F2.w		; ED F2 30
	phx		; DA
	ldy $CF.b,X		; B4 CF
	bit $00.b,X		; 34 00
	bit $10.b		; 24 10
	stp		; DB
	ora $F0.b,S		; 03 F0
	bcs  36.b		; B0 24
	plx		; FA
	stz $67E1.w		; 9C E1 67
	rol A		; 2A
	sta $B002.w,X		; 9D 02 B0
	ror $1C.b		; 66 1C
	cmp $3DF4.w		; CD F4 3D
	bcs  51.b		; B0 33
	adc [$B4.b]		; 67 B4
	sbc $C0DC.w		; ED DC C0
	.db $42, $11		; 42 11
	sbc $B4F110.l,X		; FF 10 F1 B4
	and ($D0.b,X)		; 21 D0
	mvn $E0,$FD		; 54 FD E0
	ora $B4C0FE.l		; 0F FE C0 B4
	ora $3CE4.w,X		; 1D E4 3C
	cop $00.b		; 02 00
	and ($00.b,X)		; 21 00
	inc $BCB0.w		; EE B0 BC
	cmp $DDEC22.l,X		; DF 22 EC DD
	pea $0351.w		; F4 51 03
	ldy $0F.b,X		; B4 0F
	sbc $5EE5.w,X		; FD E5 5E
	lda $1310.w		; AD 10 13
	ora $1413A4.l		; 0F A4 13 14
	adc ($00.b,S),Y		; 73 00
	sbc $FCEE.w,X		; FD EE FC
	bcs -76.b		; B0 B4
	rol $12AC.w		; 2E AC 12
	jsr $2C35.w		; 20 35 2C
.INDEX 16
	rep #$54		; C2 54
	ldy $0E.b,X		; B4 0E
	sbc $F2CC.w		; ED CC F2
	and ($10.b),Y		; 31 10
	bpl   1.b		; 10 01
	ldy $10.b,X		; B4 10
	and $1B.b		; 25 1B
	ldx #$DF71.w		; A2 71 DF
	and ($DA.b,X)		; 21 DA
	ldy $BF.b,X		; B4 BF
	eor $4D.b,X		; 55 4D
	lda $71D35F.l		; AF 5F D3 71
	cmp $F094.w,X		; DD 94 F0
	asl $CCED.w		; 0E ED CC
	dec $A0FC.w,X		; DE FC A0
	adc ($B4.b),Y		; 71 B4
	cpx $51D2.w		; EC D2 51
	pea $DC52.w		; F4 52 DC
	sep #$42		; E2 42
	ldy $EE.b,X		; B4 EE
	ora ($EC.b)		; 12 EC
	ora $2E.b,X		; 15 2E
	inc $F1DD.w		; EE DD F1
	ldy $32.b,X		; B4 32
	bpl  31.b		; 10 1F
	asl $5E.b,X		; 16 5E
	cpy #$DF2F.w		; C0 2F DF
	ldy $33.b,X		; B4 33
	sbc $D000.w		; ED 00 D0
	ora $AC1CF3.l,X		; 1F F3 1C AC
	ldy $16.b,X		; B4 16
	lsr $5ED5.w,X		; 5E D5 5E
	lda ($3D.b,X)		; A1 3D
	lda ($64.b),Y		; B1 64
	ldy $C9.b,X		; B4 C9
	cmp ($74.b)		; D2 74
	cpx $03DD.w		; EC DD 03
	ora ($40.b),Y		; 11 40
	ldy $DF.b,X		; B4 DF
	and ($03.b,X)		; 21 03
	ora $AB12.w,X		; 1D 12 AB
	and $EE.b,X		; 35 EE
	ldy $34.b,X		; B4 34
	xce		; FB
	sta ($76.b),Y		; 91 76
	jsr ($0EE0.w,X)		; FC E0 0E
	bne -76.b		; D0 B4
	asl $0E13.w,X		; 1E 13 0E
	ora $EC32D1.l		; 0F D1 32 EC
	cmp $04B4.w		; CD B4 04
	adc $E9.b		; 65 E9
	cpy $50.b		; C4 50
	cmp $B41232.l		; CF 32 12 B4
	ora ($43.b)		; 12 43
	xce		; FB
	sbc ($0C.b,S),Y		; F3 0C
	sbc ($1F.b,X)		; E1 1F
	sbc $C2B4.w,X		; FD B4 C2
	eor ($EF.b),Y		; 51 EF
	asl $0FF0.w		; 0E F0 0F
	inc $B4D0.w,X		; FE D0 B4
	and ($F2.b),Y		; 31 F2
	eor $31.b,S		; 43 31
	cmp #$F6.b		; C9 F6
	.db $62, $DC, $B4		; 62 DC B4
	lda $FC45.w,X		; BD 45 FC
	and $FC.b,S		; 23 FC
	rol $0B.b,X		; 36 0B
	trb $B4.b		; 14 B4
	ora $1FCF.w,X		; 1D CF 1F
	cpy $2602.w		; CC 02 26
	tsa		; 3B
	ldy #$14C0.w		; A0 C0 14
	eor ($FC.b,S),Y		; 53 FC
	cmp $00F0.w		; CD F0 00
	and $64.b		; 25 64
	ldy $CF.b,X		; B4 CF
	beq  -1.b		; F0 FF
	inc $1DF1.w,X		; FE F1 1D
	ldy $B414.w,X		; BC 14 B4
	and $FB3402.l		; 2F 02 34 FB
	sbc $21.b,S		; E3 21
	and ($DF.b,X)		; 21 DF
	ldy $54.b,X		; B4 54
	dex		; CA
.ACCU 8
.INDEX 8
	sep #$FD		; E2 FD
	eor $DC.b		; 45 DC
	and ($EE.b,S),Y		; 33 EE
	ldy $FF.b,X		; B4 FF
	jmp.w [$22D0]		; DC D0 22
	ora ($23.b),Y		; 11 23
	and ($0E.b,S),Y		; 33 0E
	bcs  17.b		; B0 11
	jsl $90D90F.l		; 22 0F D9 90
	mvn $DE,$0E		; 54 0E DE
	ldy $ED.b,X		; B4 ED
	cpx $5D.b		; E4 5D
	stz $3102.w		; 9C 02 31
	and ($12.b,X)		; 21 12
	ldy $32.b,X		; B4 32
	sbc $6304.w		; ED 04 63
	cmp #$F2.b		; C9 F2
	jsl $F7B4EA.l		; 22 EA B4 F7
	bvc -52.b		; 50 CC
.ACCU 8
.INDEX 8
	sep #$3F		; E2 3F
	dec $BEFD.w,X		; DE FD BE
	ldy $44.b		; A4 44
	ora ($32.b,S),Y		; 13 32
	ora ($12.b),Y		; 11 12
	ora ($21.b),Y		; 11 21
	and [$B4.b]		; 27 B4
	bvc -50.b		; 50 CE
	inc $2002.w,X		; FE 02 20
	sbc $B4DDFF.l		; EF FF DD B4
	ora $2E.b		; 05 2E
	cmp $0FFD00.l,X		; DF 00 FD 0F
	cmp ($73.b)		; D2 73
	cpy #$0F.b		; C0 0F
	sbc $CBFEFF.l,X		; FF FF FE CB
	cmp $00EF.w		; CD EF 00
	ldy $01.b,X		; B4 01
	ora ($12.b),Y		; 11 12
	and ($44.b,X)		; 21 44
	trb $10D0.w		; 1C D0 10
	ldy $EF.b,X		; B4 EF
	beq  -1.b		; F0 FF
	beq -16.b		; F0 F0
	cpx $0FD2.w		; EC D2 0F
	ldy $06.b,X		; B4 06
	eor ($D9.b)		; 52 D9
.ACCU 16
.INDEX 16
	rep #$31		; C2 31
	ora ($03.b),Y		; 11 03
	mvn $0C,$B4		; 54 B4 0C
	sbc $21E3DA.l		; EF DA E3 21
	brk $11.b		; 00 11
	bpl -76.b		; 10 B4
	cop $43.b		; 02 43
	sbc $DD00.w,X		; FD 00 DD
	ora ($2E.b,S),Y		; 13 2E
	inc $E1B4.w		; EE B4 E1
	asl $E1CB.w,X		; 1E CB E1
	and ($12.b)		; 32 12
	jsl $1DB433.l		; 22 33 B4 1D
	sbc $32CEFD.l		; EF FD CE 32
	and $4F.b		; 25 4F
	lda $01B4.w,X		; BD B4 01
	bpl -37.b		; 10 DB
	cmp ($35.b)		; D2 35
	eor ($EE.b),Y		; 51 EE
	sbc $FBDEA4.l,X		; FF A4 DE FB
	stz $3135.w		; 9C 35 31
	ora ($22.b)		; 12 22
	ora ($B4.b),Y		; 11 B4
	ora ($13.b),Y		; 11 13
	mvn $DF,$FD		; 54 FD DF
	ora $B4FEFF.l		; 0F FF FE B4
	tyx		; BB
	sep #$44		; E2 44
	and $EF43CF.l,X		; 3F CF 43 EF
	mvp $0E,$B4		; 44 B4 0E
	brk $EF.b		; 00 EF
	jmp.w [$1E26]		; DC 26 1E
	inc $B4BE.w		; EE BE B4
	ror $0C.b		; 66 0C
	inc $02CC.w		; EE CC 02
	and ($21.b,X)		; 21 21
	bit $B4.b		; 24 B4
	eor ($EC.b)		; 52 EC
	inc $46CE.w,X		; FE CE 46
	tsb $44CF.w		; 0C CF 44
	ldy $FE.b,X		; B4 FE
	rol $0DC0.w		; 2E C0 0D
	sbc ($46.b)		; F2 46
	bvc -34.b		; 50 DE
	ldy $FF.b,X		; B4 FF
	cop $FD.b		; 02 FD
	cmp $2D24.w		; CD 24 2D
	ora $1D.b		; 05 1D
	ldy $BB.b,X		; B4 BB
	asl $40.b		; 06 40
	ora $6F06ED.l		; 0F ED 06 6F
	tax		; AA
	ldy $E2.b,X		; B4 E2
	eor $4F.b		; 45 4F
	txy		; 9B
	and [$3B.b],Y		; 37 3B
	ldx $B424.w		; AE 24 B4
	jsr $13DD.w		; 20 DD 13
	eor ($E9.b,S),Y		; 53 E9
	lda ($31.b),Y		; B1 31
	brk $B4.b		; 00 B4
	ora ($00.b),Y		; 11 00
	jsr $3F12.w		; 20 12 3F
	ldx $EE21.w,Y		; BE 21 EE
	ldy $FF.b,X		; B4 FF
	sbc ($0F.b),Y		; F1 0F
	dec $3FF0.w,X		; DE F0 3F
	cmp $B4F0.w		; CD F0 B4
	ora ($EF.b)		; 12 EF
	rol $51.b		; 26 51
	dec $E2FE.w,X		; DE FE E2
	bit $B4.b,X		; 34 B4
	and ($FF.b,X)		; 21 FF
	sbc $BCFE00.l		; EF 00 FE BC
	sbc ($33.b,S),Y		; F3 33
	cpy #$5325.w		; C0 25 53
	sbc $3114.w,X		; FD 14 31
	ora ($22.b,X)		; 01 22
	bpl -80.b		; 10 B0
	lda $DCAC.w,Y		; B9 AC DC
	plb		; AB
	and [$4D.b]		; 27 4D
	ldx $B426.w,Y		; BE 26 B4
	eor $EE.b,S		; 43 EE
	inc $E0DC.w		; EE DC E0
	and $4E.b		; 25 4E
	cmp ($B4.b),Y		; D1 B4
	ora $35BD.w		; 0D BD 35
	and $F3E0.w		; 2D E0 F3
	rol $A4BE.w		; 2E BE A4
	ror $52.b,X		; 76 52
	bpl  17.b		; 10 11
	wai		; CB
	pea $4C34.w		; F4 34 4C
	ldy #$F0EC.w		; A0 EC F0
	brk $01.b		; 00 01
	ora ($31.b),Y		; 11 31
	cmp $CFB464.l		; CF 64 B4 CF
	jsl $10F20E.l		; 22 0E F2 10
	and $B4EACE.l		; 2F CE EA B4
	sbc $52.b,X		; F5 52
	asl $3FCF.w,X		; 1E CF 3F
	cpx #$C02F.w		; E0 2F C0
	ldy $3D.b,X		; B4 3D
	sta $5425.w,X		; 9D 25 54
	jsr $DBDE.w		; 20 DE DB
	cmp ($A4.b)		; D2 A4
	adc ($F1.b,S),Y		; 73 F1
	jsl $111133.l		; 22 33 11 11
	and [$3B.b],Y		; 37 3B
	ldy $14.b,X		; B4 14
	rol $FDCF.w,X		; 3E CF FD
	cmp $3212.w		; CD 12 32
	and ($B4.b),Y		; 31 B4
	inc $EE0E.w		; EE 0E EE
	sbc ($65.b)		; F2 65
	sbc $0FE0.w		; ED E0 0F
	ldy $FD.b		; A4 FD
	cpx #$2D02.w		; E0 02 2D
	cpy $F4BA.w		; CC BA F4
	mvn $34,$B4		; 54 B4 34
	adc ($BB.b,X)		; 61 BB
	sbc $9C3C25.l,X		; FF 25 3C 9C
	sbc ($B4.b)		; F2 B4
	and ($11.b,X)		; 21 11
	ora ($01.b),Y		; 11 01
	and ($35.b,X)		; 21 35
	asl $B4EF.w,X		; 1E EF B4
	cmp $EDF0.w		; CD F0 ED
	sbc ($32.b,X)		; E1 32
	ora ($4F.b,S),Y		; 13 4F
	tax		; AA
	ldy $D2.b,X		; B4 D2
	eor $40.b,X		; 55 40
	cmp $34AD.w,X		; DD AD 34
	ora ($1E.b),Y		; 11 1E
	ldy $F1.b,X		; B4 F1
	sbc $BFECF0.l,X		; FF F0 EC BF
	eor $31.b,X		; 55 31
	sbc $EFB4.w		; ED B4 EF
	sbc ($41.b),Y		; F1 41
	wai		; CB
	beq  34.b		; F0 22
	and ($0E.b)		; 32 0E
	cpy #$2301.w		; C0 01 23
	and ($00.b)		; 32 00
	ora ($22.b)		; 12 22
	bit $55.b		; 24 55
	cpy #$4245.w		; C0 45 42
	ora ($11.b,X)		; 01 11
	brk $FE.b		; 00 FE
	inc $B4DB.w,X		; FE DB B4
	inc $32E2.w,X		; FE E2 32
	ora $53.b,S		; 03 53
	phd		; 0B
	bne  30.b		; D0 1E
	bcs -34.b		; B0 DE
	sbc $47D0.w,X		; FD D0 47
	stz $20.b		; 64 20
	dec $B057.w,X		; DE 57 B0
	bit $5FF5.w		; 2C F5 5F
	tsx		; BA
	ldx $3F13.w,Y		; BE 13 3F
	cmp $E070B4.l		; CF B4 70 E0
	ora $FFEFFE.l,X		; 1F FE EF FF
	dec $B445.w,X		; DE 45 B4
	sbc $1E44.w		; ED 44 1E
	inc $04DC.w,X		; FE DC 04
	and $F2B4DD.l,X		; 3F DD B4 F2
	bit $00.b,X		; 34 00
	ora ($3D.b,S),Y		; 13 3D
	cmp ($FA.b)		; D2 FA
	sbc [$B4.b]		; E7 B4
	bvc   1.b		; 50 01
	jsr ($02AC.w,X)		; FC AC 02
	bit $41.b,X		; 34 41
	jmp.w [$FFC0]		; DC C0 FF
	sbc ($42.b)		; F2 42
	cpx $13E0.w		; EC E0 13
	mvn $B4,$0E		; 54 0E B4
	adc $BE.b,S		; 63 BE
	eor ($9B.b,X)		; 41 9B
	ora ($00.b)		; 12 00
	eor $EC.b,S		; 43 EC
	ldy $F4.b		; A4 F4
	jsr $FE21.w		; 20 21 FE
	ora ($22.b,S),Y		; 13 22
	stz $C9.b		; 64 C9
	ldy $12.b,X		; B4 12
	stp		; DB
	sbc $31.b,S		; E3 31
	sbc $D5CB.w		; ED CB D5
	lsr $D4B4.w,X		; 5E B4 D4
	adc $F5ECDF.l		; 6F DF EC F5
	rts		; 60

	lda $B421.w,X		; BD 21 B4
	sbc ($2D.b),Y		; F1 2D
	sta $3A1452.l,X		; 9F 52 14 3A
	bcc  82.b		; 90 52
	cpy #$4312.w		; C0 12 43
	ora ($55.b)		; 12 55
	bpl  31.b		; 10 1F
	dec $C024.w,X		; DE 24 C0
	and ($1F.b)		; 32 1F
	inc $BEEC.w		; EE EC BE
	bit $1D.b		; 24 1D
	lda $F1B0.w,X		; BD B0 F1
	eor [$75.b]		; 47 75
	eor $20.b,S		; 43 20
	asl $D2BA.w		; 0E BA D2
	ldy $1D.b,X		; B4 1D
	sbc $D4EC00.l,X		; FF 00 EC D4
	adc ($CE.b)		; 72 CE
	inc $D2B0.w,X		; FE B0 D2
	.db $42, $FE		; 42 FE
	sbc $1ED00E.l		; EF 0E D0 1E
	sbc ($B4.b)		; F2 B4
	jsr ($3F26.w,X)		; FC 26 3F
	inc $31CF.w,X		; FE CF 31
	sbc ($10.b),Y		; F1 10
	bcs  16.b		; B0 10
	stp		; DB
	plb		; AB
	ora $61.b		; 05 61
	cmp $DE10.w		; CD 10 DE
	cpy #$F1FF.w		; C0 FF F1
	and ($24.b,X)		; 21 24
	adc $FD.b,S		; 63 FD
	trb $31.b		; 14 31
	ldy $CB.b,X		; B4 CB
	cmp ($3F.b,S),Y		; D3 3F
	ora $0A.b,X		; 15 0A
	cmp ($33.b,X)		; C1 33
	eor ($B0.b,S),Y		; 53 B0
	adc ($EC.b,X)		; 61 EC
	lda $62B2.w,Y		; B9 B2 62
	dec $BDFC.w,X		; DE FC BD
	ldy $ED.b,X		; B4 ED
	sbc ($33.b)		; F2 33
	ora $EC101F.l		; 0F 1F 10 EC
	bne -76.b		; D0 B4
	eor $0D.b		; 45 0D
	cmp ($30.b)		; D2 30
	ora ($22.b,X)		; 01 22
	and $30B4BF.l,X		; 3F BF B4 30
	dec $DB33.w		; CE 33 DB
	trb $EA.b		; 14 EA
	ora $0C.b		; 05 0C
	ldy $24.b,X		; B4 24
	inc $BC54.w,X		; FE 54 BC
	eor $CB.b,X		; 55 CB
	and ($AD.b)		; 32 AD
	cpy $22.b		; C4 22
	inc $3112.w,X		; FE 12 31
	cpx $2FE2.w		; EC E2 2F
	sbc ($B4.b)		; F2 B4
	pld		; 2B
	cmp ($30.b,S),Y		; D3 30
	brk $22.b		; 00 22
	.db $42, $EB		; 42 EB
	sbc ($B0.b,S),Y		; F3 B0
	rol $0EBE.w,X		; 3E BE 0E
	bne  16.b		; D0 10
	brk $00.b		; 00 00
	ora ($A4.b)		; 12 A4
	beq  68.b		; F0 44
	wai		; CB
	inc $30B0.w,X		; FE B0 30
	sbc ($FF.b,X)		; E1 FF
	bcs -16.b		; B0 F0
	trb $40.b		; 14 40
	cpy $EFDD.w		; CC DD EF
	ora ($43.b,S),Y		; 13 43
	ldy $EE.b,X		; B4 EE
	cmp $01E2.w,X		; DD E2 01
	eor $EE.b,S		; 43 EE
	sbc $B4BF.w,X		; FD BF B4
	mvp $CE,$1B		; 44 1B CE
	and ($01.b)		; 32 01
	bit $40.b		; 24 40
	lda $65A4.w,X		; BD A4 65
	sbc $C2DA.w		; ED DA C2
	eor $44.b,S		; 43 44
	jsr ($B4DD.w,X)		; FC DD B4
	jmp.w [$10F2]		; DC F2 10
	ora ($11.b),Y		; 11 11
	jsl $B4EC33.l		; 22 33 EC B4
	pea $E01D.w		; F4 1D E0
	brk $10.b		; 00 10
	mvp $12,$0E		; 44 0E 12
	ldy $FC.b,X		; B4 FC
	lda $1111.w		; AD 11 11
	and $2F.b,S		; 23 2F
	sbc ($0C.b,X)		; E1 0C
	ldy $CC.b,X		; B4 CC
	sep #$42		; E2 42
	ora ($0C.b)		; 12 0C
	ora $FE.b,S		; 03 FE
	brk $B4.b		; 00 B4
	sbc $23DF.w		; ED DF 23
	eor $2C.b		; 45 2C
	cpy #$23F0.w		; C0 F0 23
	ldy $EC.b		; A4 EC
	cpy $EFFF.w		; CC FF EF
	and ($0F.b,S),Y		; 33 0F
	sbc $B4F2.w,X		; FD F2 B4
	inc $2E36.w,X		; FE 36 2E
	sbc $1FE0.w		; ED E0 1F
	dec $B425.w		; CE 25 B4
	and $02EF.w,X		; 3D EF 02
	bit $61.b,X		; 34 61
	tyx		; BB
	ora ($1F.b,S),Y		; 13 1F
	ldy $00.b,X		; B4 00
	beq  16.b		; F0 10
	wai		; CB
	ora $FE.b,S		; 03 FE
	ora ($10.b),Y		; 11 10
	ldy $02.b		; A4 02
	ror $DC.b,X		; 76 DC
	bit $FC.b		; 24 FC
	cmp $A42D34.l,X		; DF 34 2D A4
	dec $01EE.w		; CE EE 01
	ora $C1BA.w		; 0D BA C1
	mvp $B4,$31		; 44 31 B4
	ora $120110.l		; 0F 10 01 12
	.db $42, $0F		; 42 0F
	bpl -67.b		; 10 BD
	bcs -12.b		; B0 F4
	adc [$52.b]		; 67 52
	sbc ($57.b),Y		; F1 57
	adc $31.b,X		; 75 31
	nop		; EA
	ldy $C0.b,X		; B4 C0
	eor $20.b		; 45 20
	asl $20C0.w		; 0E C0 20
	cmp $B000.w,X		; DD 00 B0
	cmp ($63.b,S),Y		; D3 63
	plx		; FA
	txy		; 9B
	jmp.w [$23CE]		; DC CE 23
	bit $A4.b,X		; 34 A4
	and ($ED.b)		; 32 ED
	ora $1B.b,S		; 03 1B
	lda ($50.b,S),Y		; B3 50
	lda #$B4C0.w		; A9 C0 B4
	jsr $6113.w		; 20 13 61
	cmp $FEF0.w,X		; DD F0 FE
	dec $B003.w,X		; DE 03 B0
	sbc ($10.b),Y		; F1 10
	ora $77.b,S		; 03 77
	adc $30.b		; 65 30
	sbc ($31.b)		; F2 31
	ldy $D0.b,X		; B4 D0
	ora ($10.b)		; 12 10
	inc $2303.w,X		; FE 03 23
	jsr $B0DB.w		; 20 DB B0
	tsx		; BA
	lda $13EF.w,X		; BD EF 13
	mvn $AC,$FB		; 54 FB AC
	cmp $D050A4.l,X		; DF A4 50 D0
	adc ($CB.b,X)		; 61 CB
	cmp $01EEFE.l,X		; DF FE EE 01
	ldy $F0.b,X		; B4 F0
	ora ($EC.b)		; 12 EC
	sbc $C12D24.l		; EF 24 2D C1
	and ($A4.b),Y		; 31 A4
	cmp $35FD55.l,X		; DF 55 FD 35
	rol $4FE2.w		; 2E E2 4F
	dec $EFA4.w		; CE A4 EF
	ora ($20.b,S),Y		; 13 20
	ora ($24.b,X)		; 01 24
	adc ($C9.b,S),Y		; 73 C9
	lda $23A4.w		; AD A4 23
	xce		; FB
	lda ($54.b)		; B2 54
	and ($DB.b),Y		; 31 DB
	dec $A43F.w		; CE 3F A4
	lda $2033.w,X		; BD 33 20
	cmp $6FC31D.l,X		; DF 1D C3 6F
	cmp $02FEA4.l		; CF A4 FE 02
	jsr $FD02.w		; 20 02 FD
	and $EC.b		; 25 EC
	and $A4.b		; 25 A4
	jsr $9E1E.w		; 20 1E 9E
	eor $62.b		; 45 62
	cmp $25EE.w		; CD EE 25
	ldy $1C.b		; A4 1C
	cmp ($1D.b)		; D2 1D
	ldy $67DF.w,X		; BC DF 67
	ora #$94AE.w		; 09 AE 94
	and [$61.b],Y		; 37 61
	rol $64.b		; 26 64
	ror $1E.b		; 66 1E
	lda $A42F.w		; AD 2F A4
	cmp $CDDD.w,X		; DD DD CD
	tsb $33.b		; 04 33
	phd		; 0B
	sbc $2C.b		; E5 2C
	ldy $D3.b		; A4 D3
	eor $20.b,S		; 43 20
	ora ($31.b,S),Y		; 13 31
	tyx		; BB
	ora ($13.b,X)		; 01 13
	ldy #$0E74.w		; A0 74 0E
	cpy $46F3.w		; CC F3 46
	adc $35.b		; 65 35
	adc [$A4.b],Y		; 77 A4
	cpx #$E00D.w		; E0 0D E0
	tsb $0FC1.w		; 0C C1 0F
	ora ($EC.b),Y		; 11 EC
	ldy $F1.b,X		; B4 F1
	asl $14CE.w		; 0E CE 14
	eor ($ED.b),Y		; 51 ED
	ora ($11.b,S),Y		; 13 11
	ldy $FC.b		; A4 FC
	cmp $AC3F35.l,X		; DF 35 3F AC
	and $0B.b,X		; 35 0B
	cmp ($A4.b,X)		; C1 A4
	and ($22.b,S),Y		; 33 22
	nop		; EA
	sbc $43.b,S		; E3 43
	eor $FC.b,X		; 55 FC
	rol $B0.b,X		; 36 B0
	.db $62, $FF, $F0		; 62 FF F0
	bit $64.b		; 24 64
	ora $D1CB.w		; 0D CB D1
	ldy $5E.b		; A4 5E
	stz $EF02.w		; 9C 02 EF
	eor $51.b		; 45 51
	dec $A400.w		; CE 00 A4
	sbc $BAEF.w,X		; FD EF BA
	sbc $4F.b,X		; F5 4F
	ora ($24.b),Y		; 11 24
	and $FEF2A4.l		; 2F A4 F2 FE
	asl $00EE.w		; 0E EE 00
	xce		; FB
	lda ($65.b),Y		; B1 65
	ldy $42.b		; A4 42
	ora ($EA.b),Y		; 11 EA
	cmp ($31.b,X)		; C1 31
	and ($FB.b,S),Y		; 33 FB
	cmp ($A4.b)		; D2 A4
	bmi  17.b		; 30 11
	ora ($31.b)		; 12 31
	xba		; EB
	lda $4513.w,X		; BD 13 45
	bcs  83.b		; B0 53
	asl $0EDE.w,X		; 1E DE 0E
	lda $02AD.w,Y		; B9 AD 02
	asl $04A4.w,X		; 1E A4 04
	eor [$4E.b],Y		; 57 4E
	lda $EFE0.w,X		; BD E0 EF
	inc $A4CF.w,X		; FE CF A4
	rol $35AE.w		; 2E AE 35
	adc $EA.b		; 65 EA
.INDEX 16
	rep #$1B		; C2 1B
	cmp ($A4.b),Y		; D1 A4
	jsr ($6106.w,X)		; FC 06 61
	jmp.w [$2FF4]		; DC F4 2F
	and ($E1.b),Y		; 31 E1
	ldy $4F.b		; A4 4F
	lda $4224.w,X		; BD 24 42
	brk $31.b		; 00 31
	ldy $A4DC.w,X		; BC DC A4
	cmp $5E.b,S		; C3 5E
	lda ($51.b)		; B2 51
	sbc $30E2.w		; ED E2 30
	tsx		; BA
	ldy $EF.b,X		; B4 EF
	and $40.b,X		; 35 40
	dec $00FF.w,X		; DE FF 00
	ora ($FF.b),Y		; 11 FF
	ldy #$4ED2.w		; A0 D2 4E
	cmp $57AF0B.l		; CF 0B AF 57
	and $B0DE.w		; 2D DE B0
	sbc $221112.l,X		; FF 12 11 22
	bpl  20.b		; 10 14
	adc [$30.b],Y		; 77 30
	ldy $CF.b		; A4 CF
	and ($E1.b),Y		; 31 E1
	and ($1D.b,S),Y		; 33 1D
	lda $A44E57.l		; AF 57 4E A4
	ldx $35DB.w,Y		; BE DB 35
	inc $0E1E.w,X		; FE 1E 0E
	tax		; AA
	trb $B4.b		; 14 B4
	sbc $FB3113.l,X		; FF 13 31 FB
	sbc ($23.b,X)		; E1 23
	rol $B4D0.w		; 2E D0 B4
	and ($0E.b),Y		; 31 0E
	cmp $44F2.w,X		; DD F2 44
	tsb $33D1.w		; 0C D1 33
	bcs  49.b		; B0 31
	sbc ($44.b),Y		; F1 44
	plx		; FA
	stz $6603.w		; 9C 03 66
	and $379AA0.l,X		; 3F A0 9A 37
	tas		; 1B
	ldy $FFF0.w		; AC F0 FF
	ora ($23.b,X)		; 01 23
	bcs  31.b		; B0 1F
	sbc $1E4325.l		; EF 25 43 1E
	cmp $B43145.l		; CF 45 31 B4
	sbc ($1F.b),Y		; F1 1F
	cpx $43D1.w		; EC D1 43
	cpx WRMPYB.w		; EC 03 42
	bcs  49.b		; B0 31
	cmp $239E.w,Y		; D9 9E 23
	jsl $F1BC2E.l		; 22 2E BC F1
	bcs  53.b		; B0 35
	eor ($DC.b,X)		; 41 DC
	ora $31.b,S		; 03 31
	brk $35.b		; 00 35
	rti		; 40

	ldy $F3.b,X		; B4 F3
	bmi  -1.b		; 30 FF
	sbc $20E012.l		; EF 12 E0 20
	lda $25A4.w,X		; BD A4 25
	asl $CC31.w		; 0E 31 CC
	ora ($1F.b,X)		; 01 1F
	sbc $0CA442.l		; EF 42 A4 0C
	bcs  50.b		; B0 32
	and ($EF.b,X)		; 21 EF
	bit $2E.b		; 24 2E
	lda $2032A4.l,X		; BF A4 32 20
	cmp ($53.b,X)		; C1 53
	sbc ($1D.b),Y		; F1 1D
	cpx #$A4FD.w		; E0 FD A4
	inc $46CC.w,X		; FE CC 46
	rol $33CE.w,X		; 3E CE 33
	dec $A033.w,X		; DE 33 A0
	and ($EA.b,X)		; 21 EA
	cpy #$D10D.w		; C0 0D D1
	plx		; FA
	plb		; AB
	ldx $4EA4.w,Y		; BE A4 4E
	cmp ($40.b,X)		; C1 40
	sbc ($61.b,S),Y		; F3 61
	phx		; DA
	bne  49.b		; D0 31
	ldy $EE.b,X		; B4 EE
	beq  33.b		; F0 21
	sbc $EE1111.l,X		; FF 11 11 EE
	ora $A4.b,X		; 15 A4
	ora $D011.w,X		; 1D 11 D0
	and $F3CADE.l		; 2F DE CA F3
	jsl $1023A4.l		; 22 A4 23 10
	sbc ($76.b)		; F2 76
	plx		; FA
	lda ($34.b),Y		; B1 34
	ora $C0A4.w,X		; 1D A4 C0
	sbc $CC11.w,X		; FD 11 CC
	cpx #$E120.w		; E0 20 E1
	adc ($A4.b)		; 72 A4
	brk $0B.b		; 00 0B
	lda $CD2F33.l,X		; BF 33 2F CD
	rol $33.b,X		; 36 33
	ldy $4E.b		; A4 4E
	lda $0EF02F.l,X		; BF 2F F0 0E
	sbc $A4CDED.l		; EF ED CD A4
.ACCU 8
	sep #$62		; E2 62
	lda #$C1.b		; A9 C1
	eor $33.b,S		; 43 33
	and ($34.b,S),Y		; 33 34
	ldy $4F.b		; A4 4F
	sbc $1D03.w		; ED 03 1D
	bne  48.b		; D0 30
	cpx $A4BB.w		; EC BB A4
	ora $4F.b,X		; 15 4F
	sta $3323.w,X		; 9D 23 33
	bmi -51.b		; 30 CD
	ora [$A4.b],Y		; 17 A4
	lsr $3FCF.w,X		; 5E CF 3F
	dec $ED21.w,X		; DE 21 ED
	dec $A40E.w,X		; DE 0E A4
	sbc ($50.b,S),Y		; F3 50
	cpy $53CF.w		; CC CF 53
	sbc $00EF.w,X		; FD EF 00
	ldy $12.b		; A4 12
	asl $13EF.w,X		; 1E EF 13
	.db $42, $25		; 42 25
	bit $A4BE.w,X		; 3C BE A4
	and $0E.b,S		; 23 0E
	cpx #$6E16.w		; E0 16 6E
	txy		; 9B
	sbc ($0C.b),Y		; F1 0C
	ldy $CC.b		; A4 CC
	dec $3424.w,X		; DE 24 34
	asl $15EF.w,X		; 1E EF 15
	bvc -92.b		; 50 A4
	ora ($FE.b,S),Y		; 13 FE
	brk $2F.b		; 00 2F
	tsx		; BA
	ora $34.b,S		; 03 34
	rti		; 40

	ldy $CD.b		; A4 CD
	ora $10E0DB.l,X		; 1F DB E0 10
	ora ($DD.b,X)		; 01 DD
	ora ($A4.b,S),Y		; 13 A4
	stp		; DB
	sbc ($24.b)		; F2 24
	mvn $BB,$42		; 54 42 BB
	rol $2E.b,X		; 36 2E
	ldy $DC.b		; A4 DC
	tsx		; BA
.ACCU 8
.INDEX 8
	sep #$33		; E2 33
	ora $F10FF1.l,X		; 1F F1 0F F1
	bcs   2.b		; B0 02
	bit $43.b,X		; 34 43
	jsl $426624.l		; 22 24 66 42
	and $A4.b,S		; 23 A4
	asl $F101.w		; 0E 01 F1
	bmi  17.b		; 30 11
	inc $B4E9.w		; EE E9 B4
	ldy $3F.b		; A4 3F
	sbc $1113DD.l,X		; FF DD 13 11
	and $0D.b,S		; 23 0D
	cmp $1056A4.l		; CF A4 56 10
	ora $44BF.w		; 0D BF 44
	and $A41FC0.l		; 2F C0 1F A4
	ldy $3E15.w,X		; BC 15 3E
	wai		; CB
	cpx #$11.b		; E0 11
	bit $31.b,X		; 34 31
	ldy #$42.b		; A0 42
	sbc ($43.b),Y		; F1 43
	sbc #$A0.b		; E9 A0
	eor $45.b,X		; 55 45
	rti		; 40

	ldy $F3.b		; A4 F3
	.db $42, $0E		; 42 0E
	beq  15.b		; F0 0F
	inc $2523.w		; EE 23 25
	ldy $50.b		; A4 50
	tyx		; BB
	sbc $51.b,S		; E3 51
	sbc $BAED.w		; ED ED BA
	dec $F2A4.w,X		; DE A4 F2
	mvp $00,$42		; 44 42 00
	and $2E.b,S		; 23 2E
	cmp $FFB4FF.l		; CF FF B4 FF
	ora $FC220F.l,X		; 1F 0F 22 FC
	dec OAMADDH.w		; CE 03 21
	ldy $01.b		; A4 01
	ora ($45.b),Y		; 11 45
	eor ($DF.b),Y		; 51 DF
	bit $FE.b,X		; 34 FE
	and $A4.b,X		; 35 A4
	plx		; FA
	cmp ($2F.b,X)		; C1 2F
	ldy $EC01.w		; AC 01 EC
	inc $B4A9.w,X		; FE A9 B4
	ora ($34.b,S),Y		; 13 34
	.db $42, $FE		; 42 FE
	sbc $DDFD10.l		; EF 10 FD DD
	ldy $04.b,X		; B4 04
	eor ($FD.b)		; 52 FD
	sbc $21F1.w		; ED F1 21
	ora ($21.b,X)		; 01 21
	ldy $3F.b		; A4 3F
	sbc ($52.b)		; F2 52
	ora ($EC.b)		; 12 EC
	cpx #$21.b		; E0 21
	asl $CDA4.w		; 0E A4 CD
	sbc ($EE.b),Y		; F1 EE
	sbc ($1D.b)		; F2 1D
	sta $5106.w,Y		; 99 06 51
	bcs   4.b		; B0 04
	and $AEB9DD.l,X		; 3F DD B9 AE
	bit $32.b		; 24 32
	bit $A4.b,X		; 34 A4
	asl $DEFF.w		; 0E FF DE
	ora ($EA.b,X)		; 01 EA
	dec $73.b,X		; D6 73
	jmp.w [$F3A4]		; DC A4 F3
	and $66EFE0.l		; 2F E0 EF 66
	nop		; EA
	asl $2C.b		; 06 2C
	ldy $E1.b,X		; B4 E1
	sbc $12EF.w,X		; FD EF 12
	and $2F.b,S		; 23 2F
	dec $B025.w		; CE 25 B0
	adc $43.b		; 65 43
	jsr ($DCCE.w,X)		; FC CE DC
	dec $0001.w		; CE 01 00
	bcs  -1.b		; B0 FF
	ora ($32.b)		; 12 32
	and $77.b,X		; 35 77
	rol $10E0.w		; 2E E0 10
	ldy $EC.b		; A4 EC
	dec $0C12.w		; CE 12 0C
	lda $F5BA.w,X		; BD BA F5
	mvn $65,$A4		; 54 A4 65
	phd		; 0B
	ora $52.b		; 05 52
	and ($DD.b,X)		; 21 DD
	ora ($DE.b),Y		; 11 DE
	ldy $FF.b		; A4 FF
	inc $1FF0.w,X		; FE F0 1F
	sbc $EDDD.w		; ED DD ED
	asl $B4.b		; 06 B4
	eor ($EC.b,S),Y		; 53 EC
	sbc ($31.b,S),Y		; F3 31
	beq -16.b		; F0 F0
	eor $0E.b,S		; 43 0E
	bcs  70.b		; B0 46
	.db $62, $DB, $DF		; 62 DB DF
	ora ($11.b,X)		; 01 11
	ora ($34.b)		; 12 34
	ldy $33.b		; A4 33
	ora $23CDFE.l		; 0F FE CD 23
	asl $EFCC.w,X		; 1E CC EF
	ldy $DD.b		; A4 DD
	brk $DB.b		; 00 DB
	sbc ($34.b),Y		; F1 34
	and ($20.b)		; 32 20
	dec $55A4.w		; CE A4 55
	ora $FE12F0.l		; 0F F0 12 FE
	ora ($EE.b)		; 12 EE
	jmp.w [$A0A4]		; DC A4 A0
	.db $42, $22		; 42 22
	bpl   0.b		; 10 00
	sbc ($32.b)		; F2 32
	sbc $2222B0.l,X		; FF B0 22 22
	and ($F0.b),Y		; 31 F0
	tsb $CF99.w		; 0C 99 CF
	inc $EEA4.w,X		; FE A4 EE
	cop $42.b		; 02 42
	mvp $A0,$1B		; 44 1B A0
	and ($DD.b)		; 32 DD
	ldy $16.b		; A4 16
	rol $0D03.w		; 2E 03 0D
	dec $BFEC.w		; CE EC BF
	adc $B0.b,X		; 75 B0
	jsr ($E0BC.w,X)		; FC BC E0
	ora ($34.b)		; 12 34
	eor ($F2.b,X)		; 41 F2
	adc [$A4.b]		; 67 A4
	cpy $9DEC.w		; CC EC 9D
	bit $10.b,X		; 34 10
	ora $A42213.l		; 0F 13 22 A4
	and $01.b,S		; 23 01
	bpl  16.b		; 10 10
	cpx $20D0.w		; EC D0 20
	cmp $CE2EA4.l,X		; DF A4 2E CE
	sbc $22F2.w,X		; FD F2 22
	and ($0D.b,S),Y		; 33 0D
	lda $33A4.w,X		; BD A4 33
	inc $0C14.w		; EE 14 0C
	sbc ($2C.b,S),Y		; F3 2C
	ldx $A434.w		; AE 34 A4
	and ($55.b,S),Y		; 33 55
	bvc -54.b		; 50 CA
.ACCU 8
	sep #$2D		; E2 2D
	ldy $A415.w		; AC 15 A4
	adc ($AA.b,X)		; 61 AA
	cmp ($54.b,S),Y		; D3 54
	brk $11.b		; 00 11
	and ($DA.b)		; 32 DA
	ldy $D2.b		; A4 D2
	jsl $00CD0F.l		; 22 0F CD 00
	inc $D9FF.w,X		; FE FF D9
	ldy $E5.b		; A4 E5
	adc $13.b,S		; 63 13
	rol $22E0.w		; 2E E0 22
	and ($0D.b,S),Y		; 33 0D
	ldy $DD.b		; A4 DD
	sbc ($1E.b)		; F2 1E
	beq  -4.b		; F0 FC
	cmp $944411.l		; CF 11 44 94
	and $F12E23.l		; 2F 23 2E F1
	mvp $CA,$41		; 44 41 CA
	cmp ($94.b),Y		; D1 94
	eor $31.b		; 45 31
	beq  33.b		; F0 21
	jmp.w [$CFFD]		; DC FD CF
	jsr ($CF94.w,X)		; FC 94 CF
	cmp $CBDE.w,Y		; D9 DE CB
	ora $D9.b,X		; 15 D9
	sbc [$73.b],Y		; F7 73
	ldy $22.b		; A4 22
	.db $42, $01		; 42 01
	jsr $43E0.w		; 20 E0 43
	phd		; 0B
	ora [$A4.b]		; 07 A4
	bvs -68.b		; 70 BC
	cmp $FEFEF0.l,X		; DF F0 FE FE
	sbc $EEA4DD.l		; EF DD A4 EE
	lda $ED32.w		; AD 32 ED
	and $32.b,X		; 35 32
	jsl $33A423.l		; 22 23 A4 33
	lsr $4F.b,X		; 56 4F
	jmp.w [$F0EE]		; DC EE F0
	sbc $A4ED.w,X		; FD ED A4
	tyx		; BB
	inc $14FD.w		; EE FD 14
	stz $13.b		; 64 13
	rti		; 40

	cmp ($B4.b),Y		; D1 B4
	and ($FC.b,X)		; 21 FC
	cmp ($30.b)		; D2 30
	bne  12.b		; D0 0C
	cmp ($31.b,X)		; C1 31
	ldy $12.b,X		; B4 12
	jsl $E2CC32.l		; 22 32 CC E2
	and $EB.b,S		; 23 EB
	cpy #$A4.b		; C0 A4
	bmi  20.b		; 30 14
	jsr $5E14.w		; 20 14 5E
	lda $A44F36.l		; AF 36 4F A4
	cpy $FEF1.w		; CC F1 FE
	dec $1F01.w,X		; DE 01 1F
	dec $B4FE.w,X		; DE FE B4
	cmp $53E2.w,X		; DD E2 53
	inc $01EE.w,X		; FE EE 01
	brk $33.b		; 00 33
	ldy $DB.b,X		; B4 DB
	ora $21.b,S		; 03 21
	ora ($F1.b),Y		; 11 F1
	bpl   3.b		; 10 03
	and ($A4.b),Y		; 31 A4
	stz $A02C.w,X		; 9E 2C A0
	eor $53.b,S		; 43 53
	asl $11DC.w		; 0E DC 11
	ldy $FF.b,X		; B4 FF
	ora $10E0FE.l		; 0F FE E0 10
	lda $2F45.w,X		; BD 45 2F
	ldy $BB.b,X		; B4 BB
	sbc $31.b,S		; E3 31
	ora ($11.b,X)		; 01 11
	sbc $B42122.l		; EF 22 21 B4
	ora ($4F.b)		; 12 4F
	cpy $FDF1.w		; CC F1 FD
	ora $2B.b		; 05 2B
.ACCU 16
.INDEX 16
	rep #$B4		; C2 B4
	.db $42, $FD		; 42 FD
	cpx #$1B33.w		; E0 33 1B
	cpy #$1F12.w		; C0 12 1F
	ldy #$109C.w		; A0 9C 10
	lda $2CE3.w,Y		; B9 E3 2C
	bcs  68.b		; B0 44
	bit $A4.b,X		; 34 A4
	eor [$3D.b],Y		; 57 3D
	lda $F0FF.w		; AD FF F0
	ora $B4E0ED.l		; 0F ED E0 B4
	ora $21EF0F.l,X		; 1F 0F EF 21
	ldx $EE33.w,Y		; BE 33 EE
	and ($B0.b)		; 32 B0
	inc $F1F0.w,X		; FE F0 F1
	and $42.b,X		; 35 42
	and [$74.b],Y		; 37 74
	ora ($A4.b)		; 12 A4
	tsa		; 3B
	lda ($3F.b),Y		; B1 3F
	ora $67.b,S		; 03 67
	lsr $0DF1.w		; 4E F1 0D
	bcs  33.b		; B0 21
	asl $A9FE.w		; 0E FE A9
	dec $EDCC.w,X		; DE CC ED
	dec $71A4.w		; CE A4 71
	stz $3701.w		; 9C 01 37
	lsr $E3E0.w		; 4E E0 E3
	eor $EDB0.w,X		; 5D B0 ED
	sbc $FB4214.l		; EF 14 42 FB
	plb		; AB
	cmp $CDB445.l		; CF 45 B4 CD
	bit $FA.b		; 24 FA
	bcs  67.b		; B0 43
	asl $4F15.w		; 0E 15 4F
	ldy $CE.b,X		; B4 CE
	bpl  14.b		; 10 0E
	sbc $42CF0F.l,X		; FF 0F CF 42
	sbc $0FA4.w		; ED A4 0F
	trb $1F.b		; 14 1F
	ora ($22.b,X)		; 01 22
	ora ($67.b)		; 12 67
	and $E0A4.w,X		; 3D A4 E0
	stp		; DB
	ora ($EE.b),Y		; 11 EE
	jmp.w [$1F16]		; DC 16 1F
	ora ($A4.b)		; 12 A4
	cop $41.b		; 02 41
	cmp $DDCA42.l		; CF 42 CA DD
	cmp $CAA474.l		; CF 74 A4 CA
	tsb $2D.b		; 04 2D
	sbc $34BC.w		; ED BC 34
	and ($EA.b,X)		; 21 EA
	ldy $D4.b		; A4 D4
	.db $42, $22		; 42 22
	jsl $DB6357.l		; 22 57 63 DB
	ldx $3F94.w,Y		; BE 94 3F
	plb		; AB
	dec $FA25.w,X		; DE 25 FA
	bcs  47.b		; B0 2F
	ldy $01B4.w		; AC B4 01
	bpl  -2.b		; 10 FE
	cmp $4304.w,X		; DD 04 43
	ora $A4E0.w		; 0D E0 A4
	and ($12.b,S),Y		; 33 12
	bit $50.b		; 24 50
	cmp $4102.w		; CD 02 41
	tsx		; BA
	sty $F6.b,X		; 94 F6
	trb $9DA9.w		; 1C A9 9D
	beq  19.b		; F0 13
	lsr $40.b,X		; 56 40
	ldy $DF.b		; A4 DF
	adc $FC.b		; 65 FC
	sbc $4004.w		; ED 04 40
	dec $A414.w		; CE 14 A4
	adc $FB.b,S		; 63 FB
	cmp ($21.b,X)		; C1 21
	inc $F0DC.w,X		; FE DC F0
	ora $F0B4.w		; 0D B4 F0
	ora $F31FE0.l		; 0F E0 1F F3
	mvp $CF,$FC		; 44 FC CF
	ldy $34.b		; A4 34
	eor [$3F.b],Y		; 57 3F
	tax		; AA
	ora $EA.b		; 05 EA
	cmp $56B027.l,X		; DF 27 B0 56
	and $BAFEEF.l		; 2F EF FE BA
	cmp $FFDE.w		; CD DE FF
	ldy $1F.b		; A4 1F
	cop $11.b		; 02 11
	mvp $BC,$2E		; 44 2E BC
	sbc ($36.b),Y		; F1 36
	cpy #$3334.w		; C0 34 33
	and ($00.b,X)		; 21 00
	ora $CC0EFF.l		; 0F FF 0E CC
	ldy $24.b		; A4 24
	and ($30.b)		; 32 30
	bpl -17.b		; 10 EF
	brk $47.b		; 00 47
	and ($B4.b,X)		; 21 B4
	jsr ($41D2.w,X)		; FC D2 41
	ora $ED0FFF.l		; 0F FF 0F ED
	cpx #$47A4.w		; E0 A4 47
	bvc -32.b		; 50 E0
	cmp $2E25.w		; CD 25 2E
	jmp.w [$A4EF]		; DC EF A4
	ora ($0D.b),Y		; 11 0D
	tyx		; BB
	ora $1E.b		; 05 1E
	ora $33.b,S		; 03 33
	and ($A4.b),Y		; 31 A4
	and $33.b,S		; 23 33
	jsr $3FF1.w		; 20 F1 3F
	cmp $FE32.w		; CD 32 FE
	ldy $EE.b		; A4 EE
	sbc $D0DC.w		; ED DC D0
	eor ($01.b,X)		; 41 01
	ora $A4BD.w		; 0D BD A4
	bit $30.b		; 24 30
	ora ($44.b)		; 12 44
	ora $EB6405.l		; 0F 05 64 EB
	ldy $EE.b,X		; B4 EE
	beq  32.b		; F0 20
	stp		; DB
.INDEX 8
	sep #$1F		; E2 1F
	cop $12.b		; 02 12
	ldy $56.b		; A4 56
	plx		; FA
	ldx $BB0E.w,Y		; BE 0E BB
	inc $4F.b		; E6 4F
	sbc $A4.b,X		; F5 A4
	bvc -53.b		; 50 CB
	cop $ED.b		; 02 ED
	eor $D9.b,S		; 43 D9
	ldx $B026.w,Y		; BE 26 B0
	sbc $34CF.w,X		; FD CF 34
	and ($24.b,X)		; 21 24
	adc [$75.b]		; 67 75
	and ($A4.b,X)		; 21 A4
	tsb $1AC2.w		; 0C C2 1A
	lda ($40.b,X)		; A1 40
.INDEX 16
	rep #$54		; C2 54
	and ($A0.b)		; 32 A0
	mvn $2E,$77		; 54 77 2E
	cmp $4E27.w		; CD 27 4E
	cmp $DCA020.l		; CF 20 A0 DC
	cpy $03E0.w		; CC E0 03
	adc $01.b,S		; 63 01
	eor [$50.b],Y		; 57 50
	ldy $E1.b		; A4 E1
	phx		; DA
	cmp ($23.b),Y		; D1 23
	jsr $2D45.w		; 20 45 2D
	ldx $13B0.w		; AE B0 13
	xce		; FB
	cmp ($32.b),Y		; D1 32
	ora $FE2002.l		; 0F 02 20 FE
	ldy $FD.b,X		; B4 FD
	dec $1022.w		; CE 22 10
	ora ($10.b),Y		; 11 10
	ora ($2F.b),Y		; 11 2F
	ldy $DF.b		; A4 DF
	adc $CA.b,S		; 63 CA
	pea $5F57.w		; F4 57 5F
	tax		; AA
	bne -92.b		; D0 A4
	inc $0B46.w,X		; FE 46 0B
	cmp $FD0E22.l		; CF 22 0E FD
	ldy $34B4.w		; AC B4 34
	ora $03EF.w		; 0D EF 03
	ora $4FF2.w,X		; 1D F2 4F
	dec $F0C0.w,X		; DE C0 F0
	ora ($11.b),Y		; 11 11
	bit $54.b		; 24 54
	jsl $A42222.l		; 22 22 22 A4
	sbc $0F0F.w		; ED 0F 0F
	asl $B3C9.w		; 0E C9 B3
	adc $FFB4CC.l		; 6F CC B4 FF
	ora $31.b,X		; 15 31
	sbc $FF0E02.l,X		; FF 02 0E FF
	asl $ABA4.w		; 0E A4 AB
	ora $43.b,S		; 03 43
	ora $332312.l,X		; 1F 12 23 33
	and ($A4.b)		; 32 A4
	sbc ($34.b),Y		; F1 34
	jsr ($F1AC.w,X)		; FC AC F1
	bne  68.b		; D0 44
	cpx $FFB4.w		; EC B4 FF
	jsr ($14CE.w,X)		; FC CE 14
	eor ($DE.b,X)		; 41 DE
	ora ($13.b),Y		; 11 13
	bcs  50.b		; B0 32
	beq  87.b		; F0 57
	eor ($EC.b),Y		; 51 EC
	cmp $B41D44.l		; CF 44 1D B4
	bne  65.b		; D0 41
	sbc ($3F.b,X)		; E1 3F
	cmp $63F3.w,X		; DD F3 63
	wai		; CB
	bcs -51.b		; B0 CD
	dec $1123.w		; CE 23 11
	and ($D9.b)		; 32 D9
	lda $73B036.l		; AF 36 B0 73
	stp		; DB
	cmp ($63.b,S),Y		; D3 63
	cpx $2D26.w		; EC 26 2D
	cmp $10B4.w		; CD B4 10
	brk $12.b		; 00 12
	ora $54E10E.l		; 0F 0E E1 54
	tsb $DDB4.w		; 0C B4 DD
	ora $5F.b		; 05 5F
	dec $1FE0.w		; CE E0 1F
	cmp ($43.b),Y		; D1 43
	bcs  46.b		; B0 2E
	ldy $3003.w,X		; BC 03 30
	cmp #$47AF.w		; C9 AF 47
	eor ($B4.b)		; 52 B4
	cpx #$E3EC.w		; E0 EC E3
	mvn $C0,$EB		; 54 EB C0
	and ($12.b,X)		; 21 12
	ldy $31.b,X		; B4 31
	sbc $1C24.w		; ED 24 1C
	cmp ($30.b),Y		; D1 30
	beq  68.b		; F0 44
	cpy #$1053.w		; C0 53 10
	cpx $02DF.w		; EC DF 02
	jsr $01EF.w		; 20 EF 01
	bcs  31.b		; B0 1F
	sbc ($66.b,X)		; E1 66
	and ($22.b)		; 32 22
	brk $00.b		; 00 00
	xba		; EB
	bcs -83.b		; B0 AD
	ora $CB0EF0.l		; 0F F0 0E CB
	sep #$42		; E2 42
	inc $FFC0.w,X		; FE C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $CBEE.w		; ED EE CB
	ldy $14.b,X		; B4 14
	bit $3F.b,X		; 34 3F
	plb		; AB
	sbc ($65.b)		; F2 65
	plx		; FA
	cmp ($C0.b),Y		; D1 C0
	ora ($11.b,X)		; 01 11
	ora ($22.b),Y		; 11 22
	and $46.b,S		; 23 46
	stz $21.b		; 64 21
	ldy $C0.b,X		; B4 C0
	eor $FD.b		; 45 FD
	sbc $01EE0E.l,X		; FF 0E EE 01
	ora $D032A4.l		; 0F A4 32 D0
	rol $20C1.w		; 2E C1 20
	and ($FE.b,X)		; 21 FE
	sbc ($B4.b),Y		; F1 B4
	asl $0001.w		; 0E 01 00
	ora $3213DD.l		; 0F DD 13 32
	jmp.w [$CEB0]		; DC B0 CE
	ora $77.b,S		; 03 77
	and ($46.b),Y		; 31 46
	adc [$64.b]		; 67 64
	eor [$B4.b],Y		; 57 B4
	plx		; FA
	cpy #$0031.w		; C0 31 00
	ora ($11.b,X)		; 01 11
	brk $24.b		; 00 24
	ldy $6E.b		; A4 6E
	ldy $FDFF.w		; AC FF FD
	inc $FCCC.w		; EE CC FC
	stz $BDC0.w		; 9C C0 BD
	cpx #$0010.w		; E0 10 00
	ora ($10.b,X)		; 01 10
	cpx $B4BC.w		; EC BC B4
	and ($F1.b),Y		; 31 F1
	and ($00.b,X)		; 21 00
	bpl  36.b		; 10 24
	and $CBB0DD.l		; 2F DD B0 CB
	ora $51.b		; 05 51
	xba		; EB
	ldy $EC12.w		; AC 12 EC
	ldy $43A4.w,X		; BC A4 43
	sbc $E0FB76.l		; EF 76 FB E0
	brk $EE.b		; 00 EE
	ora $CDECC0.l		; 0F C0 EC CD
	sbc $01EEEE.l,X		; FF EE EE 01
	ora ($33.b)		; 12 33
	ldy $B9.b		; A4 B9
	cmp ($30.b,S),Y		; D3 30
	cop $33.b		; 02 33
	ora ($43.b),Y		; 11 43
	ora $43B0.w		; 0D B0 43
	ora $DEBB.w		; 0D BB DE
	tsb $42.b		; 04 42
	ora ($2E.b)		; 12 2E
	ldy $CE.b,X		; B4 CE
	ora ($11.b)		; 12 11
	brk $22.b		; 00 22
	and $A412CF.l,X		; 3F CF 12 A4
	and $0FDF.w		; 2D DF 0F
	tyx		; BB
	bit $0E.b		; 24 0E
	ora $13C0F4.l		; 0F F4 C0 13
	jsl $FE0F10.l		; 22 10 0F FE
	wai		; CB
	cmp $A4EF.w		; CD EF A4
	rol $22F2.w		; 2E F2 22
	eor $3611BD.l		; 4F BD 11 36
	and $D1B4.w,X		; 3D B4 D1
	adc $DC.b,S		; 63 DC
	cop $0E.b		; 02 0E
	sbc $2EE1.w		; ED E1 2E
	ldy $F6.b		; A4 F6
	tsa		; 3B
	lda ($21.b),Y		; B1 21
	jsl $EC4511.l		; 22 11 45 EC
	ldy $46.b		; A4 46
	phd		; 0B
	dec $0E01.w		; CE 01 0E
	inc $EEE0.w		; EE E0 EE
	ldy $22.b		; A4 22
	cpx $37BD.w		; EC BD 37
	and $46BD00.l,X		; 3F 00 BD 46
	ldy $F0.b		; A4 F0
	plx		; FA
	cpy $51.b		; C4 51
	ora $34.b,S		; 03 34
	bit $A4E2.w		; 2C E2 A4
	bit $2F.b,X		; 34 2F
	sbc ($1F.b,X)		; E1 1F
	inc $0E14.w		; EE 14 0E
	inc $EFB4.w,X		; FE B4 EF
	cmp $F0EC44.l,X		; DF 44 EC F0
	cpx #$DE42.w		; E0 42 DE
	bcs -36.b		; B0 DC
	dec $FF0F.w		; CE 0F FF
	sbc $F4EE.w		; ED EE F4
	.db $62, $B0, $FE		; 62 B0 FE
	dec $DC22.w,X		; DE 22 DC
	ora ($DA.b,X)		; 01 DA
	txy		; 9B
	ora $B4.b		; 05 B4
	ora $66BFFD.l,X		; 1F FD BF 66
	jsr ($F4DC.w,X)		; FC DC F4
	bmi -80.b		; 30 B0
	xba		; EB
	cmp ($2F.b),Y		; D1 2F
	cmp $232212.l,X		; DF 12 22 23
	and ($B0.b,X)		; 21 B0
	brk $11.b		; 00 11
	bit $54.b		; 24 54
	eor $3F.b		; 45 3F
.ACCU 8
.INDEX 8
	sep #$32		; E2 32
	ldy $EE.b		; A4 EE
	sbc ($1B.b,S),Y		; F3 1B
	sbc [$6C.b],Y		; F7 6C
	ldy $0CDF.w		; AC DF 0C
	ldy $E2.b,X		; B4 E2
	ora $63D2.w,X		; 1D D2 63
	jmp.w [$3FF4]		; DC F4 3F
	cmp $11B4.w,X		; DD B4 11
	jsr $04EB.w		; 20 EB 04
	asl $00F2.w,X		; 1E F2 00
	cop $A4.b		; 02 A4
	eor $0A.b		; 45 0A
	lda ($44.b,X)		; A1 44
	ror $2B.b		; 66 2B
	ldx $A423.w		; AE 23 A4
	asl $36BC.w		; 0E BC 36
	nop		; EA
	sbc ($1E.b,S),Y		; F3 1E
	ora ($ED.b),Y		; 11 ED
	ldy $FF.b		; A4 FF
	inc $23CE.w		; EE CE 23
	ora $43E2.w		; 0D E2 43
	ora ($B0.b),Y		; 11 B0
	bpl   1.b		; 10 01
	and $34.b,S		; 23 34
	eor $54.b		; 45 54
	eor $33.b,X		; 55 33
	bcs  85.b		; B0 55
	ora $FB3223.l		; 0F 23 32 FB
	ldx $22EF.w,Y		; BE EF 22
	ldy $DF.b,X		; B4 DF
	asl $DEEF.w		; 0E EF DE
	bit $1F.b		; 24 1F
	ora $5EA4D1.l,X		; 1F D1 A4 5E
	pei ($3D.b)		; D4 3D
	sbc [$7F.b],Y		; F7 7F
	lda $D2DB.w		; AD DB D2
	bcs -35.b		; B0 DD
	sbc $1066F2.l		; EF F2 66 10
	and ($0D.b,S),Y		; 33 0D
	wai		; CB
	bcs -50.b		; B0 CE
	ora ($10.b)		; 12 10
	ora $2045DF.l		; 0F DF 45 20
	ora ($A0.b)		; 12 A0
	rti		; 40

	cmp $ED00.w		; CD 00 ED
	dec $B0D9.w,X		; DE D9 B0
	tsb $EFA4.w		; 0C A4 EF
	brk $0F.b		; 00 0F
	cmp $A13A27.l,X		; DF 27 3A A1
	rol $F3B4.w,X		; 3E B4 F3
	and $2D3303.l		; 2F 03 33 2D
	cmp ($30.b,X)		; C1 30
	sbc $E2ABA4.l,X		; FF A4 AB E2
	ror $FA.b,X		; 76 FA
	cmp $40F4.w		; CD F4 40
	and $A4.b		; 25 A4
	trb $02F2.w		; 1C F2 02
	and $D9F2.w,X		; 3D F2 D9
	cmp ($30.b)		; D2 30
	ldy $DB.b,X		; B4 DB
	sbc ($00.b),Y		; F1 00
	.db $42, $FD		; 42 FD
	ora ($22.b,X)		; 01 22
	jsr $1FB0.w		; 20 B0 1F
	tsb $76.b		; 04 76
	and ($0F.b),Y		; 31 0F
	cpx $0DE0.w		; EC E0 0D
	ldy $D0.b		; A4 D0
	jmp.w [$A933]		; DC 33 A9
.ACCU 8
.INDEX 8
	sep #$35		; E2 35
	bmi -14.b		; 30 F2
	cpy #$11.b		; C0 11
	ora ($22.b)		; 12 22
	jsl $004245.l		; 22 45 42 00
	ora ($A4.b),Y		; 11 A4
	and [$1A.b],Y		; 37 1A
	dec $30DE.w		; CE DE 30
	ldy $F201.w		; AC 01 F2
	ldy $3F.b		; A4 3F
	tsb $50.b		; 04 50
	cpy #$44.b		; C0 44
	ora ($ED.b),Y		; 11 ED
	sbc ($A4.b)		; F2 A4
	xba		; EB
	trb $31.b		; 14 31
	asl $FFEE.w,X		; 1E EE FF
	ora $A4D2.w		; 0D D2 A4
	and $D93202.l,X		; 3F 02 32 D9
	pea $F40A.w		; F4 0A F4
	ora $0023B4.l,X		; 1F B4 23 00
	inc $3203.w,X		; FE 03 32
	xba		; EB
	sbc $21.b,S		; E3 21
	bcs  47.b		; B0 2F
	wai		; CB
	cmp $C1EA22.l		; CF 22 EA C1
	and ($43.b,S),Y		; 33 43
	ldy $DA.b		; A4 DA
	sta $EE2254.l,X		; 9F 54 22 EE
	rol $4090.w		; 2E 90 40
	bcs -35.b		; B0 DD
	sbc $2301EF.l		; EF EF 01 23
	and ($0B.b,X)		; 21 0B
	lda $20B4.w		; AD B4 20
	and $EB.b,S		; 23 EB
.ACCU 8
	sep #$2F		; E2 2F
	sbc ($3F.b),Y		; F1 3F
	cmp $DE4FA4.l,X		; DF A4 4F DE
	sbc ($66.b,X)		; E1 66
	cmp #$D2.b		; C9 D2
	stz $1D.b		; 64 1D
	sty $C1.b,X		; 94 C1
	asl $0A56.w		; 0E 56 0A
	txs		; 9A
	cmp $2416.w,X		; DD 16 24
	ldy $64.b		; A4 64
	jmp.w [$EA34]		; DC 34 EA
	cpy #$10.b		; C0 10
	bpl -36.b		; 10 DC
	bcs -31.b		; B0 E1
	ora $ECF1.w		; 0D F1 EC
	asl $50.b,X		; 16 50
	cpx #$21.b		; E0 21
	ldy $00.b		; A4 00
	cmp #$F6.b		; C9 F6
	adc $1C14CC.l		; 6F CC 14 1C
	cmp ($A4.b,X)		; C1 A4
	stz $0B.b		; 64 0B
	sbc ($BA.b),Y		; F1 BA
	lsr $EC.b		; 46 EC
	bpl -61.b		; 10 C3
	ldy #$0D.b		; A0 0D
	ldy $32CD.w		; AC CD 32
	lda $0B67.w,X		; BD 67 0B
	lda $0250A4.l,X		; BF A4 50 02
	sbc #$D1.b		; E9 D1
	dec $E165.w,X		; DE 65 E1
	jmp $C3A4.w		; 4C A4 C3
	mvn $FE,$54		; 54 54 FE
	inc $FEDE.w,X		; FE DE FE
	sbc $F0FFA4.l		; EF A4 FF F0
	beq  -2.b		; F0 FE
	sbc $92F9F2.l,X		; FF F2 F9 92
	ldy $20.b,X		; B4 20
	cop $11.b		; 02 11
	ora ($12.b),Y		; 11 12
	rti		; 40

	jmp.w [$A436]		; DC 36 A4
	dec A		; 3A
	sbc ($B9.b,S),Y		; F3 B9
	sbc $54AE.w		; ED AE 54
	jsl $23B433.l		; 22 33 B4 23
	ora $DDEF.w,X		; 1D EF DD
	bit $1D.b		; 24 1D
	cpx #$EF.b		; E0 EF
	ldy $EC.b,X		; B4 EC
	cpx $40.b		; E4 40
	sbc $01120F.l		; EF 0F 12 01
	bpl -92.b		; 10 A4
	and ($13.b,X)		; 21 13
	ora ($54.b)		; 12 54
	sbc $EEF0.w		; ED F0 EE
	inc $EFB4.w,X		; FE B4 EF
	sbc $32F1.w		; ED F1 32
	asl $14CD.w		; 0E CD 14
	jsr $36A4.w		; 20 A4 36
	tas		; 1B
	sbc $4ED1.w		; ED D1 4E
	cpx $53.b		; E4 53
	bit $A4.b		; 24 A4
	ora $EDCF.w		; 0D CF ED
	cmp $44E4DB.l,X		; DF DB E4 44
	and $3EF3B4.l		; 2F B4 F3 3E
	bcs  64.b		; B0 40
	cmp $1102FD.l,X		; DF FD 02 11
	bcs   3.b		; B0 03
	mvn $44,$23		; 54 23 44
	jsr $2012.w		; 20 12 20
	dex		; CA
	ldy $30.b,X		; B4 30
	cmp $1022.w		; CD 22 10
	ora ($21.b),Y		; 11 21
	sbc $56B032.l,X		; FF 32 B0 56
	adc [$64.b],Y		; 77 64
	and ($10.b,X)		; 21 10
	ora $A4CCFD.l		; 0F FD CC A4
	asl $02DD.w		; 0E DD 02
	tsb $3FF6.w		; 0C F6 3F
	ora ($EE.b)		; 12 EE
	ldy $42.b		; A4 42
	sbc ($32.b),Y		; F1 32
	ora ($22.b,S),Y		; 13 22
	ora $E3AA.w,X		; 1D AA E3
	ldy $40.b		; A4 40
	cmp ($3E.b,X)		; C1 3E
	lda $2204ED.l		; AF ED 04 22
	ora ($A4.b)		; 12 A4
	bpl  18.b		; 10 12
	eor [$3D.b]		; 47 3D
	lda $FEE1FF.l,X		; BF FF E1 FE
	ldy $EE.b		; A4 EE
	sbc $12D00F.l,X		; FF 0F D0 12
	sbc $E2BA.w,X		; FD BA E2
	ldy $2F.b		; A4 2F
	tsb $42.b		; 04 42
	rol $2E.b		; 26 2E
	ora $EC.b,X		; 15 EC
	brk $A4.b		; 00 A4
	sbc ($41.b,S),Y		; F3 41
	cmp $F3DC.w,X		; DD DC F3
	and ($12.b)		; 32 12
	ora $631594.l		; 0F 94 15 63
	rol $72.b,X		; 36 72
	tsx		; BA
	lda $DEED.w,X		; BD ED DE
	bcs -19.b		; B0 ED
	cpy $BCCB.w		; CC CB BC
	inc $BCCB.w		; EE CB BC
	dec $0FB4.w,X		; DE B4 0F
	ora $EF41E1.l		; 0F E1 41 EF
	ora $A42F04.l		; 0F 04 2F A4
	inc $63DF.w,X		; FE DF 63
	cpx #$11.b		; E0 11
	ora ($33.b),Y		; 11 33
	inc $2FA4.w		; EE A4 2F
	sta $F342.w,X		; 9D 42 F3
	and $AD2DE2.l,X		; 3F E2 2D AD
	ldy $EE.b		; A4 EE
	and [$19.b],Y		; 37 19
	sta ($63.b),Y		; 91 63
	ldy $E5FD.w,X		; BC FD E5
	ldy $72.b		; A4 72
	sbc $11AE.w,X		; FD AE 11
	bit $0F.b,X		; 34 0F
	eor $DD.b,S		; 43 DD
	ldy $EC.b		; A4 EC
	cpy #$EC.b		; C0 EC
	tsb $42.b		; 04 42
	bit $21.b,X		; 34 21
	bpl -80.b		; 10 B0
	and $132002.l		; 2F 02 20 13
	eor $21.b,S		; 43 21
	jsr ($B0D1.w,X)		; FC D1 B0
	mvp $DA,$31		; 44 31 DA
	ldy $F0EE.w		; AC EE F0
	and $45.b,S		; 23 45
	ldy $3C.b		; A4 3C
	ldx $ED21.w		; AE 21 ED
	inc $0E01.w		; EE 01 0E
	cmp $CFB4.w,Y		; D9 B4 CF
	lsr $2C.b,X		; 56 2C
	ldx $2203.w,Y		; BE 03 22
	ora $21B011.l		; 0F 11 B0 21
	brk $13.b		; 00 13
	.db $42, $00		; 42 00
	and $57.b,S		; 23 57
	adc ($B0.b,S),Y		; 73 B0
	sbc $013202.l,X		; FF 02 32 01
	lsr $53.b		; 46 53
	bpl  -1.b		; 10 FF
	sty $DD.b,X		; 94 DD
	sbc $BEB910.l,X		; FF 10 B9 BE
	cmp $6F27.w,X		; DD 27 6F
	ldy $DF.b		; A4 DF
	brk $D1.b		; 00 D1
	adc $DB.b,S		; 63 DB
	dec $3014.w,X		; DE 14 30
	sty $20.b,X		; 94 20
	ora ($56.b,S),Y		; 13 56
	eor $1122F1.l		; 4F F1 22 11
	rol $0394.w		; 2E 94 03
	sbc $CB2101.l,X		; FF 01 21 CB
	cmp $946124.l,X		; DF 24 61 94
	dec $E5EA.w		; CE EA E5
	and $5FA10E.l		; 2F 0E A1 5F
	sbc $94.b,S		; E3 94
	ora #$BE.b		; 09 BE
	cpy $FC36.w		; CC 36 FC
	inc $4E9F.w,X		; FE 9F 4E
	ldy $E2.b		; A4 E2
	ora ($42.b)		; 12 42
	sbc $460F22.l		; EF 22 0F 46
	plx		; FA
	ldy #$EB.b		; A0 EB
	lda #$D4.b		; A9 D4
	.db $62, $00, $EA		; 62 00 EA
	txy		; 9B
	cmp $F2A4.w		; CD A4 F2
	ora $EF53F2.l,X		; 1F F2 53 EF
	ora $A00FDE.l,X		; 1F DE 0F A0
	sbc $BD2CF2.l,X		; FF F2 2C BD
	sbc $0A0043.l		; EF 43 00 0A
	ldy $B2.b		; A4 B2
	adc ($EE.b,X)		; 61 EE
	and ($02.b,X)		; 21 02
	and ($10.b,S),Y		; 33 10
	ora $A1FCA4.l		; 0F A4 FC A1
	eor ($FF.b)		; 52 FF
	sbc $1EE1.w		; ED E1 1E
	lda $FDE1B0.l,X		; BF B0 E1 FD
	dex		; CA
	txs		; 9A
	cmp $D0CC.w		; CD CC D0
	eor [$A4.b]		; 47 A4
	rol A		; 2A
	cmp ($10.b),Y		; D1 10
	nop		; EA
	sta $EC4433.l,X		; 9F 33 44 EC
	ldy $FF.b,X		; B4 FF
	ora ($10.b),Y		; 11 10
	ora ($11.b,X)		; 01 11
	ora ($FC.b)		; 12 FC
	sbc $A4.b,S		; E3 A4
	rts		; 60

	ora ($DE.b),Y		; 11 DE
	and ($DC.b),Y		; 31 DC
	inc $E0ED.w,X		; FE ED E0
	ldy $DD.b		; A4 DD
	sbc ($10.b,X)		; E1 10
	beq  52.b		; F0 34
	jsl $B42C56.l		; 22 56 2C B4
	sbc $FF21FF.l		; EF FF 21 FF
	sbc ($21.b),Y		; F1 21
	jmp.w [$B0E1]		; DC E1 B0
	sbc $1E3312.l		; EF 12 33 1E
	wai		; CB
	cmp ($43.b),Y		; D1 43
	ora $E0B4.w		; 0D B4 E0
	cop $1F.b		; 02 1F
	sbc ($44.b,X)		; E1 44
	jsr ($0FE1.w,X)		; FC E1 0F
	sty $25.b,X		; 94 25
	.db $42, $14		; 42 14
	and ($E2.b),Y		; 31 E2
	rol $40D3.w		; 2E D3 40
	ldy $EF.b		; A4 EF
	and $3E.b,X		; 35 3E
	bne  14.b		; D0 0E
	dec $DFFC.w,X		; DE FC DF
	ldy $0E.b		; A4 0E
	cmp ($53.b),Y		; D1 53
	cpx $FFDE.w		; EC DE FF
	sbc $3EA445.l,X		; FF 45 A4 3E
	ora $FA.b,X		; 15 FA
	cmp ($30.b)		; D2 30
	ldy $FF55.w,X		; BC 55 FF
	ldy $44.b		; A4 44
	inc $31EF.w,X		; FE EF 31
	sbc $43D0.w,X		; FD D0 43
	bit $A4.b		; 24 A4
	tas		; 1B
	bcs  48.b		; B0 30
	jsr ($32E0.w,X)		; FC E0 32
	ora $F3A4DB.l		; 0F DB A4 F3
	rol $35C0.w,X		; 3E C0 35
	eor ($1F.b,X)		; 41 1F
	sep #$4F		; E2 4F
	ldy $EF.b,X		; B4 EF
	bpl -33.b		; 10 DF
	ora ($F1.b),Y		; 11 F1
	and ($EB.b),Y		; 31 EB
	sbc ($A4.b,S),Y		; F3 A4
	lsr $2DE1.w,X		; 5E E1 2D
	sep #$0E		; E2 0E
	ora ($0F.b,S),Y		; 13 0F
	and $A4.b,S		; 23 A4
	asl $C1B9.w		; 0E B9 C1
	eor $1F.b,S		; 43 1F
	cmp $A41032.l,X		; DF 32 10 A4
	and ($35.b,S),Y		; 33 35
	and $FFBD.w,X		; 3D BD FF
	dex		; CA
	cmp ($2F.b,S),Y		; D3 2F
	ldy $02.b,X		; B4 02
	jsr ($21E1.w,X)		; FC E1 21
	ora ($1F.b,X)		; 01 1F
	ora ($21.b,X)		; 01 21
	ldy $EE.b		; A4 EE
	inc $3214.w		; EE 14 32
	ora ($22.b),Y		; 11 22
	ora $B4AA.w		; 0D AA B4
	sbc ($42.b)		; F2 42
	sbc $1FE0.w,X		; FD E0 1F
	sbc $45E0.w		; ED E0 45
	sty $61.b,X		; 94 61
	nop		; EA
	stz $A1EA.w,X		; 9E EA A1
	and $A416BB.l,X		; 3F BB 16 A4
	mvp $1C,$67		; 44 67 1C
	cmp ($44.b,X)		; C1 44
	tsb $ACCC.w		; 0C CC AC
	ldy $03.b		; A4 03
	jsl $43E30D.l		; 22 0D E3 43
	ora ($11.b),Y		; 11 11
	and ($A4.b,S),Y		; 33 A4
	asl $1411.w		; 0E 11 14
	eor $F0CE.w		; 4D CE F0
	sbc $D0A4DC.l,X		; FF DC A4 D0
	xba		; EB
	bcs  50.b		; B0 32
	lsr $3D.b		; 46 3D
	sbc ($31.b)		; F2 31
	ldy $21.b,X		; B4 21
	inc $CE10.w,X		; FE 10 CE
	and ($CD.b,X)		; 21 CD
	ora $32.b,S		; 03 32
	ldy #$40.b		; A0 40
	asl $71.b,X		; 16 71
	sbc ($67.b)		; F2 67
	adc $41.b		; 65 41
	phx		; DA
	bcs -35.b		; B0 DD
	jmp.w [$DCBC]		; DC BC DC
	plb		; AB
	sbc ($FD.b),Y		; F1 FD
	cmp $F3A4.w,X		; DD A4 F3
	eor ($DE.b),Y		; 51 DE
	and ($11.b)		; 32 11
	asl $FE11.w		; 0E 11 FE
	ldy $11.b		; A4 11
	inc $F0FF.w,X		; FE FF F0
	xba		; EB
	lda $B02134.l,X		; BF 34 21 B0
	ora $76.b,X		; 15 76
	eor ($EE.b),Y		; 51 EE
	ora ($01.b,X)		; 01 01
	ora ($34.b),Y		; 11 34
	ldy $0C.b		; A4 0C
	sbc ($0E.b,X)		; E1 0E
	sbc $1E250E.l,X		; FF 0E 25 1E
	cpy #$A4.b		; C0 A4
	and $54.b,S		; 23 54
	eor ($DA.b,X)		; 41 DA
	dec $03BB.w,X		; DE BB 03
	ora $F1A4.w		; 0D A4 F1
	mvp $23,$CB		; 44 CB 23
	sbc ($63.b)		; F2 63
	stp		; DB
	cmp ($B0.b),Y		; D1 B0
	sbc $CDCBEE.l,X		; FF EE CB CD
	wai		; CB
	sta $ABAA.w,Y		; 99 AA AB
	ldy $0F.b		; A4 0F
	tsb $51.b		; 04 51
	dec $3F47.w		; CE 47 3F
	cmp $A405.w,X		; DD 05 A4
	rts		; 60

	dec $22CC.w,X		; DE CC 22
	cmp $3344.w		; CD 44 33
	nop		; EA
	ldy $D2.b		; A4 D2
	eor ($DB.b),Y		; 51 DB
	cpx #$55.b		; E0 55
	asl $AB0E.w		; 0E 0E AB
	ldy $25.b		; A4 25
	rol $4E06.w		; 2E 06 4E
	cpy #$0D.b		; C0 0D
	sbc $50.b,X		; F5 50
	ldy #$43.b		; A0 43
	jsr $CCFD.w		; 20 FD CC
	sbc ($0B.b)		; F2 0B
	lda $B0DC.w,X		; BD DC B0
	sbc $BCBA.w		; ED BA BC
	cmp $12DF.w,X		; DD DF 12
	and ($11.b,S),Y		; 33 11
	ldy $1F.b		; A4 1F
	ora $1F.b,S		; 03 1F
	dec $50F3.w,X		; DE F3 50
	cpx #$1D.b		; E0 1D
	ldy $BF.b		; A4 BF
	ora $D10D13.l,X		; 1F 13 0D D1
	bit $3D.b,X		; 34 3D
	cpy #$A0.b		; C0 A0
	trb $51.b		; 14 51
	lda $EFAC.w,Y		; B9 AC EF
	xba		; EB
	ldx $A41E.w,Y		; BE 1E A4
	plb		; AB
	ora $21.b,S		; 03 21
	ora $013015.l		; 0F 15 30 01
	beq -92.b		; F0 A4
	eor $EE.b,S		; 43 EE
	asl $CEED.w		; 0E ED CE
	and ($FF.b)		; 32 FF
	ora ($A4.b)		; 12 A4
	bmi -19.b		; 30 ED
	cpy $EC12.w		; CC 12 EC
	sbc ($33.b,X)		; E1 33
	ora ($94.b)		; 12 94
	ora ($0F.b),Y		; 11 0F
	ora $234213.l		; 0F 13 42 23
	beq 119.b		; F0 77
	sty $F0.b,X		; 94 F0
	eor [$FB.b],Y		; 57 FB
	tax		; AA
	cmp $CCAA.w		; CD AA CC
	inc $01A4.w		; EE A4 01
	jsr ($40E3.w,X)		; FC E3 40
	sbc ($1E.b),Y		; F1 1E
	cmp $00A402.l,X		; DF 02 A4 00
	brk $00.b		; 00 00
	and ($24.b,S),Y		; 33 24
	bvc -66.b		; 50 BE
	beq -92.b		; F0 A4
	sbc ($51.b),Y		; F1 51
	cpy $3302.w		; CC 02 33
	ora $FCE0.w		; 0D E0 FC
	ldy #$9A.b		; A0 9A
	tyx		; BB
	cmp $EF11FF.l,X		; DF FF 11 EF
	rol $A499.w		; 2E 99 A4
	and ($35.b,X)		; 21 35
	jsr $15EE.w		; 20 EE 15
	eor ($FF.b)		; 52 FF
	sbc $0FC0.w		; ED C0 0F
	jmp.w [$E0BD]		; DC BD E0
	jsl $1FF11F.l		; 22 1F F1 1F
	ldy $CE.b,X		; B4 CE
	ora ($32.b)		; 12 32
	ora $2202DF.l,X		; 1F DF 02 22
	and ($C0.b,X)		; 21 C0
	and ($00.b,X)		; 21 00
	ora $F0EEFE.l		; 0F FE EE F0
	ora $F2A4DB.l		; 0F DB A4 F2
	and $32.b,S		; 23 32
	jsl $3F4622.l		; 22 22 46 3F
	cmp $F2A4.w,X		; DD A4 F2
	and $DD0EEF.l		; 2F EF 0E DD
	cpy $65E2.w		; CC E2 65
	ldy $0B.b		; A4 0B
	sbc ($2D.b,X)		; E1 2D
	sbc $2D.b,S		; E3 2D
	dec $5303.w		; CE 03 53
	ldy $FD.b		; A4 FD
	sbc ($25.b),Y		; F1 25
	adc ($E0.b),Y		; 71 E0
	mvp $C2,$DB		; 44 DB C2
	ldy $33.b		; A4 33
	phd		; 0B
	cmp $DCEE1F.l,X		; DF 1F EE DC
	inc $B0E0.w		; EE E0 B0
	ldy $01EF.w,X		; BC EF 01
	bit $42.b		; 24 42
	ora ($34.b,X)		; 01 34
	and ($B4.b)		; 32 B4
	bit $3F.b		; 24 3F
	dec $0F1F.w,X		; DE 1F 0F
	inc $03EE.w,X		; FE EE 03
	ldy $20.b,X		; B4 20
	sbc $20F1.w,X		; FD F1 20
	jsr ($33CF.w,X)		; FC CF 33
	ora ($A4.b,X)		; 01 A4
	eor $0F.b,S		; 43 0F
	ora ($21.b,S),Y		; 13 21
	sbc $2B15.w,X		; FD 15 2B
	bcc -76.b		; 90 B4
	mvn $03,$FB		; 54 FB 03
	and $10E1EE.l,X		; 3F EE E1 10
	sbc $EDFFC0.l		; EF C0 FF ED
	inc $BCEC.w		; EE EC BC
	sbc $B0F00F.l		; EF 0F F0 B0
	eor [$42.b],Y		; 57 42
	ora ($1F.b),Y		; 11 1F
	dec $2002.w,X		; DE 02 20
	ora ($A4.b,X)		; 01 A4
	.db $42, $FF		; 42 FF
	and ($0D.b,S),Y		; 33 0D
	cpx $51.b		; E4 51
	lda #$E5.b		; A9 E5
	bcs  68.b		; B0 44
	jsl $AFEB22.l		; 22 22 EB AF
	jsl $A4EEFE.l		; 22 FE EE A4
	cmp $1D04.w,X		; DD 04 1D
	lda $EE2113.l,X		; BF 13 21 EE
	sbc $F3BAA4.l,X		; FF A4 BA F3
	eor ($0F.b)		; 52 0F
	ora ($22.b,S),Y		; 13 22
	and ($FE.b),Y		; 31 FE
	ldy $02.b		; A4 02
	trb $31.b		; 14 31
	sbc $B4FB21.l,X		; FF 21 FB B4
	ror $ACA4.w,X		; 7E A4 AC
	ora ($2F.b)		; 12 2F
	cmp $2001.w		; CD 01 20
	brk $CB.b		; 00 CB
	ldy $F5.b		; A4 F5
	eor $33AF.w		; 4D AF 33
	and ($11.b)		; 32 11
	ora ($33.b),Y		; 11 33
	ldy $21.b		; A4 21
	sbc $FEDF.w		; ED DF FE
	brk $DB.b		; 00 DB
	ora ($0E.b,S),Y		; 13 0E
	bcs -54.b		; B0 CA
	txs		; 9A
	cmp $F20E00.l,X		; DF 00 0E F2
	eor $2E.b,X		; 55 2E
	bcs -52.b		; B0 CC
	tsx		; BA
	cmp ($33.b),Y		; D1 33
	jsr $F1CC.w		; 20 CC F1
	inc $0FA4.w,X		; FE A4 0F
	inc $DEDD.w,X		; FE DD DE
	cpx $52.b		; E4 52
	jsl $F0A4ED.l		; 22 ED A4 F0
	ora ($F2.b),Y		; 11 F2
	adc $E0.b,S		; 63 E0
	jsr $0F13.w		; 20 13 0F
	ldy $2F.b		; A4 2F
	dec $C0FB.w		; CE FB C0
	adc $DC.b		; 65 DC
	and $01.b,S		; 23 01
	bcs  35.b		; B0 23
	and ($F0.b),Y		; 31 F0
	bpl -17.b		; 10 EF
	ora $A4C0DB.l		; 0F DB C0 A4
	inc A		; 1A
.ACCU 16
	rep #$2E		; C2 2E
	cmp $EE6226.l		; CF 26 62 EE
	beq -92.b		; F0 A4
	bit $20.b		; 24 20
	cmp #$34AF.w		; C9 AF 34
	bpl  68.b		; 10 44
	cmp #$F6A4.w		; C9 A4 F6
	stz $1E.b,X		; 74 1E
	phx		; DA
	cmp $62.b,S		; C3 62
	jmp.w [$B4DE]		; DC DE B4
	beq   0.b		; F0 00
	sbc $D2EB33.l		; EF 33 EB D2
	and ($F0.b),Y		; 31 F0
	ldy $10.b		; A4 10
	asl $67BF.w		; 0E BF 67
	sbc $32C11F.l,X		; FF 1F C1 32
	bcs  69.b		; B0 45
	rol $47D0.w,X		; 3E D0 47
	adc $20.b,X		; 75 20
	sbc $B0F1.w		; ED F1 B0
	and ($ED.b,X)		; 21 ED
	dec $AAEC.w,X		; DE EC AA
.INDEX 8
	sep #$1E		; E2 1E
	bne -80.b		; D0 B0
	jsr $DFDB.w		; 20 DB DF
	inc $0B02.w,X		; FE 02 0B
	ldy $A4E0.w		; AC E0 A4
	mvp $03,$0F		; 44 0F 03
	asl $1F01.w,X		; 1E 01 1F
	sbc ($63.b)		; F2 63
	ldy $CC.b		; A4 CC
	bit $EB.b,X		; 34 EB
	cpy #$20.b		; C0 20
	ora $A4DDEE.l,X		; 1F EE DD A4
	ora $1F.b,S		; 03 1F
	cpx $CFCD.w		; EC CD CF
	mvp $0E,$42		; 44 42 0E
	ldy $15.b		; A4 15
	adc ($FB.b,S),Y		; 73 FB
	cmp $23DF30.l		; CF 30 DF 23
	ora ($A4.b)		; 12 A4
	and ($CC.b),Y		; 31 CC
	ora ($31.b,S),Y		; 13 31
	dec $FF21.w		; CE 21 FF
	asl $DFA4.w		; 0E A4 DF
	brk $F0.b		; 00 F0
	sbc $9E0DEE.l,X		; FF EE 0D 9E
	ror $A4.b		; 66 A4
	asl $6204.w,X		; 1E 04 62
	dec $D000.w,X		; DE 00 D0
	mvn $94,$10		; 54 10 94
	rti		; 40

	dex		; CA
	cpy $62.b		; C4 62
	cmp $232134.l		; CF 34 21 23
	sty $1B.b,X		; 94 1B
	tyx		; BB
	inc $C1EB.w		; EE EB C1
	asl $1CD1.w,X		; 1E D1 1C
	bcs -70.b		; B0 BA
	ldy $BCCB.w		; AC CB BC
	cpx #$12.b		; E0 12
	and ($34.b,S),Y		; 33 34
	ldy $30.b		; A4 30
	ora ($DC.b,X)		; 01 DC
	bne  34.b		; D0 22
	ora $A4FFEE.l		; 0F EE FF A4
	sbc $F2FB24.l,X		; FF 24 FB F2
	bpl  15.b		; 10 0F
	cmp $A403.w		; CD 03 A4
	and ($DC.b)		; 32 DC
	tsb $2F.b		; 04 2F
	ora ($33.b)		; 12 33
	and ($CE.b),Y		; 31 CE
	ldy $44.b		; A4 44
	sbc $F0EC11.l,X		; FF 11 EC F0
	tyx		; BB
	sbc ($33.b,X)		; E1 33
	ldy $CA.b		; A4 CA
	sbc $63.b,X		; F5 63
	sbc $2202.w		; ED 02 22
	bpl -53.b		; 10 CB
	ldy $15.b		; A4 15
	sbc $5DF6.w,Y		; F9 F6 5D
	cmp $B03D33.l		; CF 33 3D B0
	ldy $3D.b		; A4 3D
	lda ($52.b,X)		; A1 52
	cmp $E00D45.l,X		; DF 45 0D E0
	inc $D294.w,X		; FE 94 D2
	eor $ED72E4.l		; 4F E4 72 ED
	cpx #$F1.b		; E0 F1
	ror $A4.b		; 66 A4
	ora $0FEF.w		; 0D EF 0F
	sbc $0D21EF.l,X		; FF EF 21 0D
	cpy $13A4.w		; CC A4 13
	bit $2C.b,X		; 34 2C
	rep #$40		; C2 40
	ora ($34.b)		; 12 34
	rol $64A0.w,X		; 3E A0 64
	adc [$4F.b]		; 67 4F
	tax		; AA
	sbc ($2F.b,S),Y		; F3 2F
	ora ($11.b)		; 12 11
	ldy $0F.b		; A4 0F
	brk $22.b		; 00 22
	and ($02.b,X)		; 21 02
	eor ($BD.b,X)		; 41 BD
	ora ($A4.b,S),Y		; 13 A4
	ora $F0CDDC.l,X		; 1F DC CD F0
	cop $11.b		; 02 11
	jsl $11A4EF.l		; 22 EF A4 11
	cpx $D2DB.w		; EC DB D2
	eor ($13.b)		; 52 13
	ora $00A4FF.l,X		; 1F FF A4 00
	cpx #$46.b		; E0 46
	cpx $FE03.w		; EC 03 FE
	sbc $B09E.w,X		; FD 9E B0
	cpy $03BC.w		; CC BC 03
	bmi -18.b		; 30 EE
	ora ($1F.b,X)		; 01 1F
	sbc $9E40A4.l		; EF A4 40 9E
	adc [$FC.b],Y		; 77 FC
	cmp $0D01.w,X		; DD 01 0D
	brk $A4.b		; 00 A4
	beq  84.b		; F0 54
	ora $62.b,S		; 03 62
	lda $26AC.w,Y		; B9 AC 26
	bmi -80.b		; 30 B0
	ora ($11.b,X)		; 01 11
	ora ($22.b)		; 12 22
	lsr $54.b		; 46 54
	eor $65.b		; 45 65
	ldy $CB.b		; A4 CB
	cmp ($22.b,X)		; C1 22
	ora $F0DF.w		; 0D DF F0
	beq -17.b		; F0 EF
	ldy $02.b,X		; B4 02
	jsr $12FF.w		; 20 FF 12
	bpl -20.b		; 10 EC
	cmp ($53.b),Y		; D1 53
	ldy $EB.b		; A4 EB
	cpy $1D13.w		; CC 13 1D
	sep #$43		; E2 43
	tsb $A4D0.w		; 0C D0 A4
	ror $3D.b		; 66 3D
	ldy $31E1.w,X		; BC E1 31
	inc $FE02.w		; EE 02 FE
	ldy $CE.b		; A4 CE
	and $30.b,X		; 35 30
	sbc $EB1F02.l,X		; FF 02 1F EB
.ACCU 8
	sep #$A4		; E2 A4
	and ($2F.b)		; 32 2F
	sbc $141F32.l		; EF 32 1F 14
	ora $9990DC.l,X		; 1F DC 90 99
	stz $C02F.w,X		; 9E 2F C0
	rti		; 40

	cpy #$1F.b		; C0 1F
	ora [$A4.b]		; 07 A4
	rol $E0CD.w		; 2E CD E0
	bpl -19.b		; 10 ED
	and $2E.b		; 25 2E
	cpx #$A0.b		; E0 A0
.INDEX 8
	sep #$55		; E2 55
	eor $20.b,S		; 43 20
	cop $42.b		; 02 42
	nop		; EA
	lda $031FA4.l,X		; BF A4 1F 03
	rol $01DF.w,X		; 3E DF 01
	jmp.w [$45E0]		; DC E0 45
	ldy $2D.b		; A4 2D
	ldy $43E3.w		; AC E3 43
	bpl  18.b		; 10 12
	and ($DE.b),Y		; 31 DE
	ldy $12.b		; A4 12
	jsr $1FFD.w		; 20 FD 1F
	sbc $04DC.w,X		; FD DC 04
	adc ($94.b,X)		; 61 94
	txy		; 9B
	and $3D.b		; 25 3D
	cmp ($30.b,X)		; C1 30
	cmp ($2F.b),Y		; D1 2F
.INDEX 8
	sep #$94		; E2 94
	ror $0B.b,X		; 76 0B
	cmp $F3CB31.l		; CF 31 CB F3
	bvc -39.b		; 50 D9
	sty $A1.b,X		; 94 A1
	eor $270DD2.l		; 4F D2 0D 27
	eor ($0F.b)		; 52 0F
	sbc $F1EDA4.l,X		; FF A4 ED F1
	ora ($FC.b)		; 12 FC
	lda $002034.l,X		; BF 34 20 00
	ldy $01.b		; A4 01
	jsl $E1E932.l		; 22 32 E9 E1
	eor $0E.b,S		; 43 0E
	dec $1494.w,X		; DE 94 14
	eor ($E0.b,X)		; 41 E0
	stz $DA.b		; 64 DA
	wai		; CB
	lda ($41.b),Y		; B1 41
	sty $DD.b,X		; 94 DD
	pea $DF60.w		; F4 60 DF
	ora ($1E.b,S),Y		; 13 1E
	dec $A0EF.w,X		; DE EF A0
	ora $31.b,S		; 03 31
	ora $CDEDEE.l		; 0F EE ED CD
	jmp.w [$A4BC]		; DC BC A4
	jsr $13DC.w		; 20 DC 13
	eor $0E.b,S		; 43 0E
	cpx #$11.b		; E0 11
	ora $33D094.l		; 0F 94 D0 33
	ora ($35.b,X)		; 01 35
	and ($2D.b,S),Y		; 33 2D
	lda $30A042.l,X		; BF 42 A0 30
	jsr ($CC99.w,X)		; FC 99 CC
	ldy $0D13.w		; AC 13 0D
	dec $20A4.w		; CE A4 20
	sbc ($FC.b),Y		; F1 FC
	sbc $4D.b,S		; E3 4D
	bne  46.b		; D0 2E
	cpy #$A4.b		; C0 A4
	mvp $23,$EE		; 44 EE 23
	ora $3FF11F.l,X		; 1F 1F F1 3F
	plb		; AB
	ldy #$90.b		; A0 90
	eor ($EE.b,S),Y		; 53 EE
	ora ($0E.b)		; 12 0E
	sbc ($31.b)		; F2 31
	nop		; EA
	bcs -50.b		; B0 CE
	bpl -35.b		; 10 DD
	bit $2D.b		; 24 2D
	cpy #$41.b		; C0 41
	dec $34A0.w,X		; DE A0 34
	jsr ($12E0.w,X)		; FC E0 12
	tsb $64B1.w		; 0C B1 64
	jmp.w [$22B4]		; DC B4 22
	cpx $2D05.w		; EC 05 2D
	cpy #$41.b		; C0 41
	sbc $A013.w		; ED 13 A0
	eor $0E.b,S		; 43 0E
	tsb $61.b		; 04 61
	dec $2B47.w		; CE 47 2B
	ldy #$A4.b		; A0 A4
	jmp $73C4.w		; 4C C4 73
	tax		; AA
	and $1C.b,X		; 35 1C
	lda $A402.w		; AD 02 A4
	ora $FE33F0.l,X		; 1F F0 33 FE
	rol $2B.b		; 26 2B
	lda $0FA042.l		; AF 42 A0 0F
	and $1D.b,X		; 35 1D
	cmp $FF1F22.l,X		; DF 22 1F FF
	cpx $D0A4.w		; EC A4 D0
	ora ($EC.b)		; 12 EC
.ACCU 8
.INDEX 8
	sep #$3F		; E2 3F
	sbc $5F.b,S		; E3 5F
	ldy $D4A0.w		; AC A0 D4
	stz $0E.b		; 64 0E
	sbc $47EFEE.l		; EF EE EF 47
	and $07A4.w,X		; 3D A4 07
	pld		; 2B
	cmp $50.b,S		; C3 50
	ldx $F022.w,Y		; BE 22 F0
	brk $A0.b		; 00 A0
	ora $42.b,S		; 03 42
	brk $33.b		; 00 33
	nop		; EA
	cmp ($2D.b)		; D2 2D
	bcs -96.b		; B0 A0
	mvn $E0,$FC		; 54 FC E0
	bpl  15.b		; 10 0F
	inc $14F0.w		; EE F0 14
	ldy $0D.b		; A4 0D
	cpy #$43.b		; C0 43
	cpx $3FF3.w		; EC F3 3F
	dec $A045.w		; CE 45 A0
	eor $EA22CE.l		; 4F CE 22 EA
	cpy #$1E.b		; C0 1E
	cmp $9401.w		; CD 01 94
	cmp $5F25.w		; CD 25 5F
	cmp $F7EA55.l		; CF 55 EA F7
	lsr $9F94.w,X		; 5E 94 9F
	stz $DA.b		; 64 DA
	bne  14.b		; D0 0E
	lda $2B25.w,X		; BD 25 2B
	ldy $BF.b		; A4 BF
	eor $FD.b,S		; 43 FD
	ora $2D.b,S		; 03 2D
	sep #$4F		; E2 4F
	dec $2794.w		; CE 94 27
	eor $0D32D1.l		; 4F D1 32 0D
	cmp ($62.b),Y		; D1 62
	cpy $F294.w		; CC 94 F2
	asl $2FF1.w,X		; 1E F1 2F
	ldy $0E03.w,X		; BC 03 0E
	sbc ($94.b,X)		; E1 94
	eor $0C.b,S		; 43 0C
	sbc ($2D.b),Y		; F1 2D
	lda ($62.b)		; B2 62
	jmp.w [$94D1]		; DC D1 94
	jsr $2D13.w		; 20 13 2D
	cpx #$04.b		; E0 04
	eor ($C9.b,S),Y		; 53 C9
	inc $94.b,X		; F6 94
	eor $DF41BF.l,X		; 5F BF 41 DF
	jsr $23F1.w		; 20 F1 23
	rol $C094.w		; 2E 94 C0
	eor ($D0.b,X)		; 41 D0
	and ($1E.b,S),Y		; 33 1E
	inc $1FD0.w		; EE D0 1F
	sty $AE.b,X		; 94 AE
	mvn $01,$FE		; 54 FE 01
	asl $2FE3.w		; 0E E3 2F
	cmp $CC4F84.l		; CF 84 4F CC
	inc $40EF.w		; EE EF 40
	ldx $D164.w		; AE 64 D1
	sty $24.b		; 84 24
	and $E051F4.l		; 2F F4 51 E0
	tas		; 1B
	cmp ($11.b,X)		; C1 11
	sty $21.b,X		; 94 21
	ora ($31.b),Y		; 11 31
	ora $0C03CD.l		; 0F CD 03 0C
	lda $DCBE90.l		; AF 90 BE DC
	cpy $00DF.w		; CC DF 00
	cop $66.b		; 02 66
	ora $DD2194.l,X		; 1F 94 21 DD
	mvp $E1,$EA		; 44 EA E1
	ora $804102.l,X		; 1F 02 41 80
	eor ($ED.b)		; 52 ED
	ora $50.b		; 05 50
	dec $99DB.w,X		; DE DB 99
	plb		; AB
	sty $CB.b		; 84 CB
	and [$1D.b]		; 27 1D
	cmp ($14.b)		; D2 14
	stz $EB.b		; 64 EB
	ora $84.b		; 05 84
	bit $4F92.w		; 2C 92 4F
	cmp ($30.b)		; D2 30
	sbc $0C11.w		; ED 11 0C
	sty $E0.b		; 84 E0
	and ($CD.b),Y		; 31 CD
	tsb $20.b		; 04 20
	jsr ($43C3.w,X)		; FC C3 43
	stz $CE.b,X		; 74 CE
	rol $EE22.w		; 2E 22 EE
	.db $42, $06		; 42 06
	eor $E2809B.l		; 4F 9B 80 E2
	.db $42, $EA		; 42 EA
	cmp ($2E.b,X)		; C1 2E
	ldx $BD0D.w,Y		; BE 0D BD
	sty $34.b		; 84 34
	and $43.b,S		; 23 43
	lda $21BF.w,Y		; B9 BF 21
	bmi -33.b		; 30 DF
	bra -13.b		; 80 F3
	.db $42, $FD		; 42 FD
	bne  32.b		; D0 20
	cmp $C0CA.w,X		; DD CA C0
	sty $EA.b		; 84 EA
	cmp ($4E.b,S),Y		; D3 4E
	tyx		; BB
	pea $CF4D.w		; F4 4D CF
	brk $74.b		; 00 74
	ror $62.b,X		; 76 62
	bit $67.b		; 24 67
	phx		; DA
	ldy $4D.b,X		; B4 4D
	ldy $0280.w,X		; BC 80 02
	bit $44.b,X		; 34 44
	eor ($0C.b,S),Y		; 53 0C
	plb		; AB
	sbc ($41.b,S),Y		; F3 41
	bra -53.b		; 80 CB
	jmp.w [$FDCE]		; DC CE FD
	cmp $99DA.w		; CD DA 99
	plb		; AB
	bvs -96.b		; 70 A0
	.db $42, $EE		; 42 EE
	mvp $42,$E0		; 44 E0 42
	cpy $7426.w		; CC 26 74
	.db $42, $1D		; 42 1D
	sbc ($64.b)		; F2 64
	ora $DEFE.w		; 0D FE DE
	and ($70.b,X)		; 21 70
	ror $0E.b		; 66 0E
	sep #$0E		; E2 0E
	cop $2E.b		; 02 2E
	cpx $80AC.w		; EC AC 80
	and $42.b		; 25 42
	ora ($EB.b),Y		; 11 EB
	lda $DCEF.w,X		; BD EF DC
	cmp $E0EC70.l,X		; DF 70 EC E0
	asl $CE00.w		; 0E 00 CE
	brk $00.b		; 00 00
	sbc #$80.b		; E9 80
	tax		; AA
	lda #$9B.b		; A9 9B
	sbc $00DEEE.l		; EF EE DE 00
	dex		; CA
	bvs -96.b		; 70 A0
	inc $0200.w		; EE 00 02
	ror $64.b		; 66 64
	tsb $74AA.w		; 0C AA 74
	ora ($2C.b,X)		; 01 2C
	cmp ($72.b,X)		; C1 72
	brk $01.b		; 00 01
	cpx $74E0.w		; EC E0 74
	asl $2FCF.w,X		; 1E CF 2F
	sbc $32.b,S		; E3 32
	dex		; CA
	sbc ($10.b,X)		; E1 10
	bvs -82.b		; 70 AE
	jsr $0C02.w		; 20 02 0C
	dec $2000.w		; CE 00 20
	asl $74.b		; 06 74
	adc ($DE.b,X)		; 61 DE
	bpl -36.b		; 10 DC
	cop $CE.b		; 02 CE
	and ($00.b)		; 32 00
	stz $E2.b,X		; 74 E2
	bit $22.b		; 24 22
	xce		; FB
.ACCU 8
	sep #$E0		; E2 E0
	jsl $C270EB.l		; 22 EB 70 C2
	mvp $0E,$22		; 44 22 0E
	ldy $EE02.w		; AC 02 EE
	cpx $C364.w		; EC 64 C3
	jmp ($74C4.w,X)		; 7C C4 74
	stz $DF03.w		; 9C 03 DF
	brk $74.b		; 00 74
.INDEX 8
	sep #$1E		; E2 1E
	brk $CC.b		; 00 CC
	sbc ($30.b,X)		; E1 30
	bne  20.b		; D0 14
	bvs  36.b		; 70 24
	jsr $2C02.w		; 20 02 2C
	sta $EECE.w,Y		; 99 CE EE
	cmp #$80.b		; C9 80
	ldy $0EE0.w,X		; BC E0 0E
	cmp $FFDE.w,X		; DD DE FF
	inc $6002.w		; EE 02 60
	jmp $0400.w		; 4C 00 04
	stz $40.b,X		; 74 40
	cpy $C4CC.w		; CC CC C4
	bvs  70.b		; 70 46
	lsr $00AC.w		; 4E AC 00
	inc $22E0.w		; EE E0 22
	jsr $0070.w		; 20 70 00
	lsr $20.b		; 46 20
	tsb $44.b		; 04 44
	jsr $E0EC.w		; 20 EC E0
	stz $EB.b,X		; 74 EB
	lda ($31.b)		; B2 31
	jsr $120E.w		; 20 0E 12
	cpx $70E1.w		; EC E1 70
	dec $CC00.w		; CE 00 CC
	inc $CAEE.w		; EE EE CA
	tax		; AA
	inc $CC64.w		; EE 64 CC
	adc ($4C.b,S),Y		; 73 4C
	brk $0D.b		; 00 0D
	pea $03CC.w		; F4 CC 03
	rts		; 60

	cmp #$9C.b		; C9 9C
	cpy $0CC0.w		; CC C0 0C
	cpy $0000.w		; CC 00 00
	rts		; 60

	brk $CC.b		; 00 CC
	sta $9999.w,Y		; 99 99 99
	cpy #$0C.b		; C0 0C
	sta $3064.w,Y		; 99 64 30
	ora $FFCC00.l		; 0F 00 CC FF
	stz $0C.b,X		; 74 0C
	ora $60.b,S		; 03 60
	brk $CC.b		; 00 CC
	cmp #$99.b		; C9 99
	cpy $00CC.w		; CC CC 00
	tsb $60.b		; 04 60
	tsb $00CC.w		; 0C CC 00
	tsb $44.b		; 04 44
	brk $00.b		; 00 00
	ora [$70.b]		; 07 70
	stz $22.b		; 64 22
	mvp $0E,$20		; 44 20 0E
	cpx #$00.b		; E0 00
	inc $0060.w		; EE 60 00
	brk $0C.b		; 00 0C
	sta $CCC0.w,Y		; 99 C0 CC
	cpy $6000.w		; CC 00 60
	cpy $CC99.w		; CC 99 CC
	cpy $CCC0.w		; CC C0 CC
	sta $50CC.w,Y		; 99 CC 50
	bcc   0.b		; 90 00
	sta $9999.w,Y		; 99 99 99
	sta $0090.w,Y		; 99 90 00
	bvc   0.b		; 50 00
	brk $77.b		; 00 77
	ora #$99.b		; 09 99
	brk $09.b		; 00 09
	sta $9950.w,Y		; 99 50 99
	brk $99.b		; 00 99
	sta $9900.w,Y		; 99 00 99
	sta $5099.w,Y		; 99 99 50
	sta $9099.w,Y		; 99 99 90
	brk $99.b		; 00 99
	sta $0090.w,Y		; 99 90 00
	bvc -112.b		; 50 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	ora [$60.b]		; 07 60
	mvp $C0,$40		; 44 40 C0
	brk $CC.b		; 00 CC
	cpy $C99C.w		; CC 9C C9
	mvn $FF,$EF		; 54 EF FF
	sbc $0FF60F.l,X		; FF 0F F6 0F
	ora $99500F.l		; 0F 0F 50 99
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	adc [$50.b],Y		; 77 50
	adc [$77.b],Y		; 77 77
	adc [$00.b],Y		; 77 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	mvn $00,$00		; 54 00 00
	brk $00.b		; 00 00
	ora #$F0.b		; 09 F0
	beq -16.b		; F0 F0
	stz $CF.b		; 64 CF
	ora $0C.b,S		; 03 0C
	bmi   0.b		; 30 00
	beq   0.b		; F0 00
	beq  84.b		; F0 54
	adc $F0F0.w,Y		; 79 F0 F0
	sbc [$00.b],Y		; F7 00
	sta $54700F.l,X		; 9F 0F 70 54
	sta $0F0F0F.l,X		; 9F 0F 0F 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	ora #$99.b		; 09 99
	sta $2499.w,Y		; 99 99 24
	ldy $CCCC.w		; AC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $50CC.w		; CC CC 50
	sta $0099.w,Y		; 99 99 00
	brk $99.b		; 00 99
	sta $9999.w,Y		; 99 99 99
	mvn $07,$0F		; 54 0F 07
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	ora #$99.b		; 09 99
	ora #$99.b		; 09 99
	sta $9999.w,Y		; 99 99 99
	mvn $0F,$0F		; 54 0F 0F
	bvs   0.b		; 70 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $99.b		; 00 99
	sta $9999.w,Y		; 99 99 99
	bcc   0.b		; 90 00
	bvc   0.b		; 50 00
	ora #$99.b		; 09 99
	sta $0000.w,Y		; 99 00 00
	brk $00.b		; 00 00
	bvc   0.b		; 50 00
	brk $90.b		; 00 90
	brk $09.b		; 00 09
	bcc -103.b		; 90 99
	sta $0F54.w,Y		; 99 54 0F
	ora $9F700F.l		; 0F 0F 70 9F
	ora $500F0F.l		; 0F 0F 0F 50
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bcc   0.b		; 90 00
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5099.w,Y		; 99 99 50
	bcc   0.b		; 90 00
	ora #$00.b		; 09 00
	ora #$90.b		; 09 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $5099.w,Y		; 99 99 50
	sta $9999.w,Y		; 99 99 99
	bcc   0.b		; 90 00
	sta $0000.w,Y		; 99 00 00
	bvc   0.b		; 50 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$90.b		; 09 90
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $5099.w,Y		; 99 99 50
	bcc   9.b		; 90 09
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	bvc -103.b		; 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $9950.w,Y		; 99 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $9050.w,Y		; 99 50 90
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $09.b		; 00 09
	bvc -103.b		; 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9000.w,Y		; 99 00 90
	brk $54.b		; 00 54
	ora #$F0.b		; 09 F0
	beq  -9.b		; F0 F7
	sta $007079.l,X		; 9F 79 70 00
	eor ($00.b),Y		; 51 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$59.b		; 09 59
	eor $4B.b,X		; 55 4B
	eor $000000.l		; 4F 00 00 00
	brk $00.b		; 00 00
	brk $22.b		; 00 22
	bcc -23.b		; 90 E9
	ora $1A.b,S		; 03 1A
	jsr $4C42.w		; 20 42 4C
	eor $554F57.l		; 4F 57 4F 55
	mvn $73,$2E		; 54 2E 73
	adc $00006C.l		; 6F 6C 00 00
	ora $0F0F.w		; 0D 0F 0F
	ora ($0B.b)		; 12 0B
	sbc #$D4.b		; E9 D4
	cmp $EDDF.w,Y		; D9 DF ED
	ora $2927.w		; 0D 27 29
	tas		; 1B
	bpl   3.b		; 10 03
	sbc ($F2.b),Y		; F1 F2
	cop $09.b		; 02 09
	cop $FC.b		; 02 FC
	sbc $EAEE.w,Y		; F9 EE EA
	sbc $05.b,X		; F5 05
	bpl  21.b		; 10 15
	clc		; 18
	bpl  -9.b		; 10 F7
	jmp.w [$E8DD]		; DC DD E8
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $90.b		; 00 90
	ora #$09.b		; 09 09
	brk $99.b		; 00 99
	sty $0F.b,X		; 94 0F
	sbc ($2E.b,X)		; E1 2E
	sbc $EF1C12.l		; EF 12 1C EF
	cmp #$A4.b		; C9 A4
	ldx $2324.w,Y		; BE 24 23
	jsl $101022.l		; 22 22 10 10
	brk $A4.b		; 00 A4
	beq  -1.b		; F0 FF
	ora $71.b,S		; 03 71
	wai		; CB
	cmp $CDCD.w		; CD CD CD
	sty $CE.b,X		; 94 CE
	sbc $2211E0.l,X		; FF E0 11 22
	jsl $943331.l		; 22 31 33 94
	and ($1F.b,S),Y		; 33 1F
	lda $53F5.w,Y		; B9 F5 53
	mvp $57,$43		; 44 43 57
	sty $60.b,X		; 94 60
	jsl $DCBBDA.l		; 22 DA BB DC
	plb		; AB
	cmp $A4DE.w		; CD DE A4
	brk $D9.b		; 00 D9
	cmp ($55.b)		; D2 55
	mvp $12,$43		; 44 43 12
	and ($A4.b,X)		; 21 A4
	ora ($10.b)		; 12 10
	brk $11.b		; 00 11
	brk $0F.b		; 00 0F
	ora $62.b,S		; 03 62
	ldy $DA.b		; A4 DA
	cpy $DDBC.w		; CC BC DD
	sbc $DDEEEE.l		; EF EE EE DD
	ldy $E0.b		; A4 E0
	bit $54.b		; 24 54
	mvn $33,$43		; 54 43 33
	jsl $21A421.l		; 22 21 A4 21
	bpl  15.b		; 10 0F
	ora ($00.b,X)		; 01 00
	ora $20.b,S		; 03 20
	stp		; DB
	cpy #$0F.b		; C0 0F
	sbc $CCCC.w		; ED CC CC
	cpy $CCCC.w		; CC CC CC
	cmp $6294.w,X		; DD 94 62
	ora ($11.b)		; 12 11
	ora $10E3.w		; 0D E3 10
	mvn $94,$23		; 54 23 94
	eor $32.b,S		; 43 32
	and ($23.b),Y		; 31 23
	jsl $523433.l		; 22 33 34 52
	ldy $ED.b		; A4 ED
	ldy $CDBC.w,X		; BC BC CD
	cpy $DDDD.w		; CC DD DD
	dec $1494.w,X		; DE 94 14
	adc $54.b		; 65 54
	adc [$76.b]		; 67 76
	eor $21.b,S		; 43 21
	brk $A4.b		; 00 A4
	ora ($23.b),Y		; 11 23
	ora $BCBBFD.l,X		; 1F FD BB BC
	cmp $84EE.w,X		; DD EE 84
	lda $E0F0ED.l		; AF ED F0 E0
	ora ($13.b)		; 12 13
	eor [$76.b]		; 47 76
	bcs  -2.b		; B0 FE
	dec $3302.w,X		; DE 02 33
	eor $55.b		; 45 55
	mvp $A4,$55		; 44 55 A4
	inc $F0ED.w,X		; FE ED F0
	ora ($47.b),Y		; 11 47
	ora $A4DDF0.l,X		; 1F F0 DD A4
	sbc $FECE.w		; ED CE FE
	cmp $FFFEFF.l,X		; DF FF FE FF
	ora ($94.b,S),Y		; 13 94
	.db $42, $13		; 42 13
	mvp $BC,$1E		; 44 1E BC
	inc $04FF.w		; EE FF 04
	bcs  37.b		; B0 25
	ror $42.b,X		; 76 42
	bpl  -1.b		; 10 FF
	sbc $A4FEEE.l,X		; FF EE FE A4
	sbc $BCED.w		; ED ED BC
	beq -16.b		; F0 F0
	bit $33.b,X		; 34 33
	and ($A4.b,S),Y		; 33 A4
	mvp $22,$33		; 44 33 22
	ora ($00.b),Y		; 11 00
	ora ($00.b,X)		; 01 00
	brk $A4.b		; 00 A4
	asl $BCBA.w		; 0E BA BC
	wai		; CB
	lda $0FDF.w,X		; BD DF 0F
	and $A4.b		; 25 A4
	adc $54.b		; 65 54
	eor $22.b,S		; 43 22
	ora ($10.b)		; 12 10
	ora ($0F.b)		; 12 0F
	sty $EF.b		; 84 EF
	ora $54.b,S		; 03 54
	sbc $0202.w		; ED 02 02
	eor $4E.b,S		; 43 4E
	cpy #$11.b		; C0 11
	ora $CCDCFE.l		; 0F FE DC CC
	tyx		; BB
	tyx		; BB
	ldy $3394.w,X		; BC 94 33
	eor ($32.b,S),Y		; 53 32
	and $53.b,X		; 35 53
	.db $42, $24		; 42 24
	.db $42, $94		; 42 94
	bit $3F.b,X		; 34 3F
	trb $32.b		; 14 32
	and ($24.b,X)		; 21 24
	.db $42, $FD		; 42 FD
	ldy $ED.b		; A4 ED
	jmp.w [$CDCC]		; DC CC CD
	cpy $12CF.w		; CC CF 12
	mvn $44,$A4		; 54 A4 44
	eor $44.b,S		; 43 44
	and ($21.b,S),Y		; 33 21
	ora ($21.b)		; 12 21
	beq -64.b		; F0 C0
	eor $1F.b,S		; 43 1F
	cpx $BBBB.w		; EC BB BB
	ldy $DECD.w,X		; BC CD DE
	sty $23.b,X		; 94 23
	rti		; 40

	and $25.b,X		; 35 25
	adc ($44.b,S),Y		; 73 44
	ora ($21.b)		; 12 21
	sty $EE.b,X		; 94 EE
	stp		; DB
	dec $DECB.w		; CE CB DE
	brk $FE.b		; 00 FE
	sta $AAB0.w,Y		; 99 B0 AA
	ldy $02DE.w,X		; BC DE 02
	eor $66.b		; 45 66
	adc [$77.b],Y		; 77 77
	sty $57.b		; 84 57
	adc $DB.b,S		; 63 DB
	cmp $30D1FB.l,X		; DF FB D1 30
	xce		; FB
	ldy $FF.b		; A4 FF
	inc $DCEE.w		; EE EE DC
	ldy $DECC.w,X		; BC CC DE
	inc $FFA4.w		; EE A4 FF
	cop $56.b		; 02 56
	eor $55.b,X		; 55 55
	adc $32.b		; 65 32
	ora ($A4.b),Y		; 11 A4
	and ($0E.b,X)		; 21 0E
	sbc ($0D.b),Y		; F1 0D
	cpy $DBEE.w		; CC EE DB
	ldx $ACB0.w,Y		; BE B0 AC
	tyx		; BB
	cmp $F0DD.w		; CD DD F0
	ora ($45.b)		; 12 45
	adc $94.b		; 65 94
	and ($DD.b)		; 32 DD
	phx		; DA
	lda $B9EF.w,X		; BD EF B9
	lda #$AC.b		; A9 AC
	sty $DC.b,X		; 94 DC
	dec $240E.w		; CE 0E 24
	and $53.b,X		; 35 53
	eor [$77.b],Y		; 57 77
	sty $64.b,X		; 94 64
	ora ($53.b,S),Y		; 13 53
	bpl -51.b		; 10 CD
	wai		; CB
	dec $94CA.w		; CE CA 94
	cmp $DE99FD.l		; CF FD 99 DE
	sbc $BDCCCD.l		; EF CD CC BD
	ldy $00.b		; A4 00
	ora ($21.b,X)		; 01 21
	ora ($24.b),Y		; 11 24
	eor $22.b,S		; 43 22
	jsl $2322A4.l		; 22 A4 22 23
	and ($0F.b,X)		; 21 0F
	cop $0E.b		; 02 0E
	jmp.w [$A4CB]		; DC CB A4
	lda $DDDD.w,X		; BD DD DD
	cmp $231111.l,X		; DF 11 11 23
	and ($94.b,S),Y		; 33 94
	ror $76.b		; 66 76
	rti		; 40

	brk $FE.b		; 00 FE
	stp		; DB
	lda $84AB.w,X		; BD AB 84
	cmp ($44.b,S),Y		; D3 44
	eor ($57.b,S),Y		; 53 57
	eor ($EF.b,X)		; 41 EF
	asl $84EE.w		; 0E EE 84
	inc $57D2.w,X		; FE D2 57
	bit $2CE5.w,X		; 3C E5 2C
	tax		; AA
	tsx		; BA
	sty $BD.b		; 84 BD
	adc [$2A.b]		; 67 2A
.ACCU 16
	rep #$67		; C2 67
	and ($01.b),Y		; 31 01
	sbc ($94.b,X)		; E1 94
	bit $22.b,X		; 34 22
	ora ($22.b),Y		; 11 22
	cop $10.b		; 02 10
	xba		; EB
	bne -108.b		; D0 94
	sbc $DDFEF0.l		; EF F0 FE DD
	stz $0E00.w		; 9C 00 0E
	sbc $DD94.w		; ED 94 DD
	sbc $23F2DE.l,X		; FF DE F2 23
	eor $23.b,S		; 43 23
	bit $94.b,X		; 34 94
	eor ($22.b,S),Y		; 53 22
	ora ($44.b)		; 12 44
	jsl $EA2012.l		; 22 12 20 EA
	sty $AD.b,X		; 94 AD
	ora $E0DD.w		; 0D DD E0
	eor $11.b,S		; 43 11
	bpl  -3.b		; 10 FD
	sty $F1.b,X		; 94 F1
	jsr ($B9DD.w,X)		; FC DD B9
	sbc $239B.w,X		; FD 9B 23
	ora ($94.b,X)		; 01 94
	and ($00.b),Y		; 31 00
	bit $2F.b,X		; 34 2F
	ora ($57.b,S),Y		; 13 57
	stz $35.b		; 64 35
	sty $43.b,X		; 94 43
	and ($22.b)		; 32 22
	ora ($32.b,S),Y		; 13 32
	ora $DCAB.w		; 0D AB DC
	ldy $CC.b		; A4 CC
	cmp $EEDE.w,X		; DD DE EE
	sbc ($22.b),Y		; F1 22
	ora ($44.b,S),Y		; 13 44
	sty $45.b,X		; 94 45
	ror $64.b		; 66 64
	jsl $EC1032.l		; 22 32 10 EC
	tsx		; BA
	ldy $DD.b		; A4 DD
	jmp.w [$DCDD]		; DC DD DC
	ldy $FEEF.w,X		; BC EF FE
	ora ($A4.b,X)		; 01 A4
	bit $44.b		; 24 44
	eor $43.b,X		; 55 43
	and ($34.b)		; 32 34
	.db $42, $00		; 42 00
	ldy $0F.b		; A4 0F
	cmp $CAED.w,X		; DD ED CA
	ldx $EFFF.w,Y		; BE FF EF
	sbc $ED2194.l,X		; FF 94 21 ED
	ora $236115.l		; 0F 15 61 23
	eor $24.b,X		; 55 24
	sty $53.b,X		; 94 53
	ora ($43.b),Y		; 11 43
	and ($FF.b,X)		; 21 FF
	brk $10.b		; 00 10
	bpl -92.b		; 10 A4
	cop $10.b		; 02 10
	jsl $CBFE10.l		; 22 10 FE CB
	cpy $A4CC.w		; CC CC A4
	dec $DDED.w,X		; DE ED DD
	inc $2401.w		; EE 01 24
	eor $43.b,X		; 55 43
	sty $44.b,X		; 94 44
	bit $41.b,X		; 34 41
	and ($22.b,S),Y		; 33 22
	cop $53.b		; 02 53
	ora $F0FFA4.l		; 0F A4 FF F0
	sbc $DBCDDC.l,X		; FF DC CD DB
	cmp $EEA4EE.l		; CF EE A4 EE
	cmp $12DF.w,X		; DD DF 12
	and $33.b,S		; 23 33
	lsr $45.b		; 46 45
	ldy $44.b		; A4 44
	eor $22.b,S		; 43 22
	bpl   1.b		; 10 01
	sbc $A4ECFE.l,X		; FF FE EC A4
	ldy $EECD.w,X		; BC CD EE
	inc $12FF.w,X		; FE FF 12
	jsl $159012.l		; 22 12 90 15
	adc $00.b,S		; 63 00
	xba		; EB
	ldx $CDDB.w,Y		; BE DB CD
	beq -108.b		; F0 94
	inc $3224.w,X		; FE 24 32
	jsr $1132.w		; 20 32 11
	bpl  17.b		; 10 11
	sty $01.b,X		; 94 01
	ora $BFA9FD.l,X		; 1F FD A9 BF
	sbc $0DC0.w,X		; FD C0 0D
	sty $CD.b,X		; 94 CD
	sbc $24F2.w		; ED F2 24
	eor $44.b,X		; 55 44
	jsl $44A02F.l		; 22 2F A0 44
	eor $77.b		; 45 77
	adc [$76.b],Y		; 77 76
	eor ($DA.b)		; 52 DA
	txy		; 9B
	sty $2D.b,X		; 94 2D
	tsx		; BA
	cmp $33010F.l,X		; DF 0F 01 33
	and ($23.b,X)		; 21 23
	sty $45.b		; 84 45
	eor ($37.b,S),Y		; 53 37
	eor ($54.b),Y		; 51 54
	jsr $DD21.w		; 20 21 DD
	sty $F0.b,X		; 94 F0
	wai		; CB
	txs		; 9A
	cmp $03FDE0.l,X		; DF E0 FD 03
	adc $84.b		; 65 84
	adc ($2F.b,S),Y		; 73 2F
	and ($DE.b,S),Y		; 33 DE
	cpx $EDF1.w		; EC F1 ED
	bne -96.b		; D0 A0
	sbc $12F0FE.l,X		; FF FE F0 12
	bpl  19.b		; 10 13
	mvp $94,$31		; 44 31 94
	dec $0E00.w		; CE 00 0E
	dec $FD11.w		; CE 11 FD
	ldy $B01F.w,X		; BC 1F B0
	wai		; CB
	tyx		; BB
	ldy $EFDD.w,X		; BC DD EF
	beq  35.b		; F0 23
	eor $B0.b		; 45 B0
	adc [$77.b]		; 67 77
	adc [$66.b],Y		; 77 66
	eor $44.b,X		; 55 44
	and ($21.b)		; 32 21
	sty $EE.b,X		; 94 EE
	cpx #$FC.b		; E0 FC
	cmp $0EE0.w		; CD E0 0E
	inc $94F1.w,X		; FE F1 94
	asl $22F0.w		; 0E F0 22
	jsr $4203.w		; 20 03 42
	inc $84ED.w		; EE ED 84
	rol $22.b		; 26 22
	xce		; FB
	bcs -49.b		; B0 CF
	jsr $10FE.w		; 20 FE 10
	sty $13.b		; 84 13
	eor [$66.b],Y		; 57 66
	lsr $73.b,X		; 56 73
	sbc ($21.b,X)		; E1 21
	ora $CD94.w		; 0D 94 CD
	sbc $EBE0.w		; ED E0 EB
	cmp $112321.l		; CF 21 23 11
	sty $23.b,X		; 94 23
	and ($00.b,X)		; 21 00
	asl $DBFE.w		; 0E FE DB
	cmp $94ED.w		; CD ED 94
	dec $D2BB.w,X		; DE BB D2
	adc $66.b		; 65 66
	stz $55.b		; 64 55
	jsr $1094.w		; 20 94 10
	cmp $EF0F.w,X		; DD 0F EF
	ora $5503FF.l		; 0F FF 03 55
	cpy #$23.b		; C0 23
	mvp $44,$44		; 44 44 44
	and ($10.b)		; 32 10
	inc $B0ED.w,X		; FE ED B0
	sta $9B99.w,Y		; 99 99 9B
	tyx		; BB
	ldy $FFDE.w,X		; BC DE FF
	beq -108.b		; F0 94
	lsr $1F.b,X		; 56 1F
	beq  35.b		; F0 23
	bpl  -2.b		; 10 FE
	inc $94FE.w		; EE FE 94
	jsr ($D0CC.w,X)		; FC CC D0
	jsr $4412.w		; 20 12 44
	eor ($33.b),Y		; 51 33
	sty $23.b,X		; 94 23
	and ($00.b,X)		; 21 00
	inc $DEFE.w		; EE FE DE
	sbc $94CC.w,X		; FD CC 94
	inc $EE0F.w		; EE 0F EE
	inc $3045.w		; EE 45 30
	jsl $DE942F.l		; 22 2F 94 DE
	inc $DCED.w		; EE ED DC
	dec $BCED.w,X		; DE ED BC
	bne -92.b		; D0 A4
	ora ($33.b),Y		; 11 33
	mvp $34,$33		; 44 33 34
	.db $42, $32		; 42 32
	and ($94.b,X)		; 21 94
	bpl  -1.b		; 10 FF
	sbc $CECC.w,X		; FD CC CE
	cmp $EDDD.w,X		; DD DD ED
	sty $EB.b,X		; 94 EB
	lda $CDDC.w,X		; BD DC CD
	dex		; CA
	lda $020F.w		; AD 0F 02
	sty $43.b,X		; 94 43
	mvn $44,$23		; 54 23 44
	and ($35.b)		; 32 35
	eor ($22.b,X)		; 41 22
	sty $11.b,X		; 94 11
	ora ($02.b,X)		; 01 02
	ora ($21.b),Y		; 11 21
	sbc $94DCED.l,X		; FF ED DC 94
	tyx		; BB
	wai		; CB
	bne -22.b		; D0 EA
	txy		; 9B
	cmp $01DF.w,X		; DD DF 01
	ldy $03.b		; A4 03
	mvp $F0,$10		; 44 10 F0
	and ($00.b,X)		; 21 00
	ora ($10.b),Y		; 11 10
	sty $34.b,X		; 94 34
	mvp $35,$64		; 44 64 35
	jsr $FD00.w		; 20 00 FD
	stp		; DB
	ldy $DD.b		; A4 DD
	inc $CBED.w		; EE ED CB
	dec $01F0.w,X		; DE F0 01
	ora ($A4.b)		; 12 A4
	eor $32.b		; 45 32
	ora ($23.b,X)		; 01 23
	bit $31.b,X		; 34 31
	brk $FE.b		; 00 FE
	sty $BB.b,X		; 94 BB
	cpy $EFCC.w		; CC CC EF
	bpl  14.b		; 10 0E
	inc $84EE.w		; EE EE 84
	sbc ($1F.b,X)		; E1 1F
	tsb $FCAD.w		; 0C AD FC
	tyx		; BB
	cmp $94CC.w,X		; DD CC 94
	brk $12.b		; 00 12
	and $54.b,S		; 23 54
	and $56.b,S		; 23 56
	adc $32.b		; 65 32
	sty $34.b,X		; 94 34
	mvp $FF,$20		; 44 20 FF
	beq -19.b		; F0 ED
	cmp $94ED.w		; CD ED 94
	dex		; CA
	tyx		; BB
	cmp $FDDD.w,X		; DD DD FD
	sbc $842233.l		; EF 33 22 84
	adc $33.b,S		; 63 33
	sbc ($22.b),Y		; F1 22
	ora ($76.b,S),Y		; 13 76
	mvp $84,$42		; 44 42 84
	and $9921F0.l,X		; 3F F0 21 99
	lda $12DD.w		; AD DD 12
	plx		; FA
	cpy #$FF.b		; C0 FF
	inc $EDEE.w		; EE EE ED
	jmp.w [$CCCB]		; DC CB CC
	dec $43A4.w,X		; DE A4 43
	mvp $33,$54		; 44 54 33
	eor $20.b,S		; 43 20
	inc $94EE.w		; EE EE 94
	tyx		; BB
	ldy $99AA.w,X		; BC AA 99
	ldy $EEEE.w		; AC EE EE
	bne -108.b		; D0 94
	ora ($11.b,X)		; 01 11
	ora $444334.l		; 0F 34 43 44
	and $33.b,S		; 23 33
	sty $77.b		; 84 77
	lsr $56.b		; 46 56
	eor ($25.b,S),Y		; 53 25
	mvn $00,$21		; 54 21 00
	cpy #$21.b		; C0 21
	ora $CBDCFE.l		; 0F FE DC CB
	tyx		; BB
	cpy $84DD.w		; CC DD 84
	ror $75.b		; 66 75
	ror $65.b		; 66 65
	eor $31.b,S		; 43 31
	bpl  19.b		; 10 13
	ldy #$44.b		; A0 44
	bit $43.b,X		; 34 43
	and ($33.b,S),Y		; 33 33
	jsl $94EC0F.l		; 22 0F EC 94
	ldy $CECA.w,X		; BC CA CE
	bne  18.b		; D0 12
	and $57.b,X		; 35 57
	ror $94.b		; 66 94
	ror $54.b		; 66 54
	and ($21.b,S),Y		; 33 21
	bpl  -2.b		; 10 FE
	inc $840F.w,X		; FE 0F 84
	wai		; CB
	sta $A9CD.w,Y		; 99 CD A9
	tyx		; BB
	tyx		; BB
	cmp $CD840D.l,X		; DF 0D 84 CD
	inc $FDEE.w		; EE EE FD
	dec $E30E.w		; CE 0E E3
	and ($94.b),Y		; 31 94
	jsl $553322.l		; 22 22 33 55
	and ($13.b),Y		; 31 13
	and ($2F.b)		; 32 2F
	sty $FE.b,X		; 94 FE
	sbc $BDDB0D.l,X		; FF 0D DB BD
	sbc $DFCC.w		; ED CC DF
	sty $F0.b,X		; 94 F0
	ora ($11.b,X)		; 01 11
	tsb $41.b		; 04 41
	eor $41.b		; 45 41
	ora ($94.b,S),Y		; 13 94
	asl $EDEF.w,X		; 1E EF ED
	dec $DFEE.w,X		; DE EE DF
	xce		; FB
	sbc ($84.b,X)		; E1 84
	ora ($22.b,X)		; 01 22
	eor $66.b		; 45 66
	eor $32.b,X		; 55 32
	and ($34.b,S),Y		; 33 34
	sty $51.b		; 84 51
	and ($0C.b,S),Y		; 33 0C
	cpy $DCED.w		; CC ED DC
	sbc $A0BC.w,X		; FD BC A0
	wai		; CB
	tyx		; BB
	ldy $F0CE.w,X		; BC CE F0
	bit $57.b		; 24 57
	adc [$94.b],Y		; 77 94
	cop $31.b		; 02 31
	jsl $CBED00.l		; 22 00 ED CB
	plb		; AB
	ldy $BC94.w,X		; BC 94 BC
	dec $EFEE.w,X		; DE EE EF
	ora $342300.l		; 0F 00 23 34
	sty $56.b,X		; 94 56
	lsr $65.b,X		; 56 65
	eor $44.b,X		; 55 44
	and ($10.b,X)		; 21 10
	bpl -108.b		; 10 94
	ora $FFFEEF.l		; 0F EF FE FF
	inc $DAEC.w,X		; FE EC DA
	lda $AA94.w		; AD 94 AA
	tyx		; BB
	cmp $13EF.w		; CD EF 13
	and $44.b,S		; 23 44
	mvn $12,$B0		; 54 B0 12
	and ($44.b,S),Y		; 33 44
	mvp $43,$45		; 44 45 43
	and ($0F.b,X)		; 21 0F
	sty $CB.b,X		; 94 CB
	cmp $EFDD.w		; CD DD EF
	bpl  15.b		; 10 0F
	sbc ($12.b),Y		; F1 12
	sty $13.b,X		; 94 13
	and ($54.b,S),Y		; 33 54
	and ($12.b)		; 32 12
	and ($20.b)		; 32 20
	ora ($84.b),Y		; 11 84
	ora $3322F1.l,X		; 1F F1 22 33
	and $64.b,S		; 23 64
	mvp $94,$01		; 44 01 94
	and ($0D.b,X)		; 21 0D
	wai		; CB
	tsx		; BA
	plb		; AB
	lda $DF9B.w,Y		; B9 9B DF
	sty $ED.b,X		; 94 ED
	beq  50.b		; F0 32
	and ($12.b),Y		; 31 12
	bit $35.b,X		; 34 35
	and ($84.b)		; 32 84
	bit $75.b		; 24 75
	jsr ($0EBF.w,X)		; FC BF 0E
	sbc $74DFCC.l		; EF CC DF 74
	lda $12D0.w,Y		; B9 D0 12
	ora ($31.b,S),Y		; 13 31
	dec $53D1.w		; CE D1 53
	bra   3.b		; 80 03
	adc [$64.b]		; 67 64
	lsr $77.b		; 46 77
	adc $1E.b,X		; 75 1E
	lda #$EE84.w		; A9 84 EE
	sbc $BBCDFD.l		; EF FD CD BB
	inc $F6DC.w		; EE DC F6
	sty $32.b,X		; 94 32
	ora ($34.b)		; 12 34
	stz $42.b		; 64 42
	and ($F0.b)		; 32 F0
	and ($84.b,X)		; 21 84
	ora ($DC.b),Y		; 11 DC
	tsx		; BA
	sta $AC9C.w,Y		; 99 9C AC
	cpx $B0BC.w		; EC BC B0
	cpy $CDBB.w		; CC BB CD
	dec $EFEE.w,X		; DE EE EF
	ora ($12.b,X)		; 01 12
	bcs  52.b		; B0 34
	mvp $44,$44		; 44 44 44
	mvp $32,$44		; 44 44 32
	ora ($94.b),Y		; 11 94
	sbc ($FC.b),Y		; F1 FC
	tyx		; BB
	inc $DDDD.w		; EE DD DD
	sbc $94E2.w		; ED E2 94
	and ($22.b)		; 32 22
	jsl $314322.l		; 22 22 43 31
	jsl L000400.l		; 22 00 84 00
	sbc $D0BCFD.l		; EF FD BC D0
	jmp.w [$F1BE]		; DC BE F1
	sty $01.b		; 84 01
	ora ($0E.b),Y		; 11 0E
	jsl $1E5422.l		; 22 22 54 1E
	inc $DA84.w		; EE 84 DA
	cmp $E1EF0C.l,X		; DF 0C EF E1
	inc $44F2.w,X		; FE F2 44
	stz $57.b,X		; 74 57
	adc $35.b,S		; 63 35
	adc $0E.b,X		; 75 0E
	bit $41.b,X		; 34 41
	plx		; FA
	stz $9D.b,X		; 74 9D
	sta $9DAB.w,Y		; 99 AB 9D
	ldy $BCEE.w,X		; BC EE BC
	sbc ($74.b,X)		; E1 74
	stz $01.b		; 64 01
	and ($57.b),Y		; 31 57
	adc ($45.b,X)		; 61 45
	and $1090FD.l,X		; 3F FD 90 10
	sbc $EEDE.w		; ED DE EE
	inc $01EE.w		; EE EE 01
	bit $84.b,X		; 34 84
	bpl  29.b		; 10 1D
	cmp $E0DD1F.l		; CF 1F DD E0
	inc $84CD.w		; EE CD 84
	dec $1110.w,X		; DE 10 11
	bpl  18.b		; 10 12
	mvp $31,$45		; 44 45 31
	sty $00.b		; 84 00
	brk $10.b		; 00 10
	asl $EDCD.w		; 0E CD ED
	wai		; CB
	cpy $D174.w		; CC 74 D1
	jsl $60D620.l		; 22 20 D6 60
	sta ($15.b),Y		; 91 15
	ror $74.b,X		; 76 74
	and $23.b,S		; 23 23
	and ($51.b),Y		; 31 51
	ora ($31.b)		; 12 31
	and $1174ED.l		; 2F ED 74 11
	sbc $E9E1.w,X		; FD E1 E9
	ldx $CB11.w		; AE 11 CB
	inc $0D84.w		; EE 84 0D
	inc $0FE0.w,X		; FE E0 0F
	sbc $534224.l		; EF 24 42 53
	sty $1F.b		; 84 1F
	sbc $113412.l,X		; FF 12 34 11
	and ($EF.b,X)		; 21 EF
	cpy $1184.w		; CC 84 11
	ora $2101F1.l		; 0F F1 01 21
	ora ($20.b)		; 12 20
	bit $84.b,X		; 34 84
	rol $12D2.w		; 2E D2 12
	sbc $CCCDDD.l,X		; FF DD CD CC
	dex		; CA
	sty $BE.b		; 84 BE
	dec $F2FE.w,X		; DE FE F2
	mvp $13,$00		; 44 00 13
	eor ($84.b,S),Y		; 53 84
	inc $1F00.w,X		; FE 00 1F
	and $31.b		; 25 31
	beq   3.b		; F0 03
	and $AD84.w		; 2D 84 AD
	rol $DFBA.w,X		; 3E BA DF
	ora ($00.b),Y		; 11 00
	beq  17.b		; F0 11
	sty $11.b,X		; 94 11
	and ($20.b,X)		; 21 20
	and $44.b,S		; 23 44
	brk $00.b		; 00 00
	ora ($84.b,X)		; 01 84
	jsl $CC0101.l		; 22 01 01 CC
	cpy $9AAA.w		; CC AA 9A
	ldy $DB94.w,X		; BC 94 DB
	bne  -1.b		; D0 FF
	cop $0F.b		; 02 0F
	bpl  18.b		; 10 12
	ora ($84.b)		; 12 84
	lsr $55.b,X		; 56 55
	eor $44.b,X		; 55 44
	and $22.b,S		; 23 22
	and ($FC.b),Y		; 31 FC
	sty $CC.b		; 84 CC
	tsx		; BA
	wai		; CB
	ldy $ACCB.w,X		; BC CB AC
	inc $84EF.w		; EE EF 84
	ora ($33.b,S),Y		; 13 33
	bit $43.b		; 24 43
	and ($31.b,X)		; 21 31
	and ($32.b,X)		; 21 32
	stz $00.b,X		; 74 00
	ora $67.b,X		; 15 67
	adc ($DA.b,X)		; 61 DA
	tax		; AA
	ldy $849A.w,X		; BC 9A 84
	cpy $F0DF.w		; CC DF F0
	sbc $200201.l,X		; FF 01 02 20
	ora $342184.l		; 0F 84 21 34
	and ($10.b,X)		; 21 10
	ora ($31.b)		; 12 31
	stp		; DB
	sbc $84.b,S		; E3 84
	rti		; 40

	cpx #$33.b		; E0 33
	and $2FE1.w		; 2D E1 2F
	cpx #$FF.b		; E0 FF
	stz $0D.b,X		; 74 0D
	dec $F1DC.w		; CE DC F1
	bpl -48.b		; 10 D0
	cmp $0F74E0.l,X		; DF E0 74 0F
	ora $4F131E.l,X		; 1F 1E 13 4F
	ldy $F0FF.w,X		; BC FF F0
	sty $00.b		; 84 00
	nop		; EA
	ldx $EF1F.w		; AE 1F EF
	and $77.b,X		; 35 77
	adc [$94.b],Y		; 77 94
	jsl $321322.l		; 22 22 13 32
	and ($2F.b,S),Y		; 33 2F
	dex		; CA
	txy		; 9B
	sty $BB.b,X		; 94 BB
	cmp $EFEE.w,X		; DD EE EF
	beq  15.b		; F0 0F
	beq  15.b		; F0 0F
	sty $EE.b,X		; 94 EE
	sbc ($44.b)		; F2 44
	and ($43.b,S),Y		; 33 43
	eor $42.b,S		; 43 42
	and ($84.b)		; 32 84
	adc $32.b,S		; 63 32
	ora $ED0E00.l		; 0F 00 0E ED
	sbc $ED94FF.l,X		; FF FF 94 ED
	dex		; CA
	wai		; CB
	cpy $CBCC.w		; CC CC CB
	ldx $94FF.w,Y		; BE FF 94
	and $55.b		; 25 55
	lsr $54.b,X		; 56 54
	.db $42, $33		; 42 33
	and ($12.b)		; 32 12
	sty $33.b,X		; 94 33
	and ($EC.b),Y		; 31 EC
	stp		; DB
	wai		; CB
	wai		; CB
	lda $94DD.w,X		; BD DD 94
	cmp $DFDD.w,X		; DD DD DF
	beq  51.b		; F0 33
	eor $54.b		; 45 54
	eor $94.b,S		; 43 94
	mvp $20,$31		; 44 31 20
	brk $10.b		; 00 10
	brk $01.b		; 00 01
	ora ($84.b)		; 12 84
	sbc $ECEDEF.l,X		; FF EF ED EC
	tyx		; BB
	lda #$BB99.w		; A9 99 BB
	stz $B9.b,X		; 74 B9
	plb		; AB
	tyx		; BB
	wai		; CB
	lda $6635.w,X		; BD 35 66
	adc [$A0.b],Y		; 77 A0
	beq   1.b		; F0 01
	and $67.b,X		; 35 67
	ror $54.b		; 66 54
	mvp $74,$44		; 44 44 74
	txy		; 9B
	cmp $CCDE.w,X		; DD DE CC
	dec $F1F3.w		; CE F3 F1
	eor ($84.b,X)		; 41 84
	ora ($12.b,X)		; 01 12
	jsl $0CFF22.l		; 22 22 FF 0C
	stz $841E.w,X		; 9E 1E 84
	sbc ($35.b,X)		; E1 35
	adc [$55.b],Y		; 77 55
	adc $67.b		; 65 67
	eor [$74.b],Y		; 57 74
	ldy $FE.b		; A4 FE
	jmp.w [$CCCC]		; DC CC CC
	sbc $FFEE.w		; ED EE FF
	beq -108.b		; F0 94
	cop $12.b		; 02 12
	bit $44.b,X		; 34 44
	mvn $43,$55		; 54 55 43
	eor $84.b,S		; 43 84
	eor $32.b,X		; 55 32
	and ($43.b,S),Y		; 33 43
	bmi  -2.b		; 30 FE
	cpx #$FE.b		; E0 FE
	sty $FF.b,X		; 94 FF
	sbc $CCEDFF.l		; EF FF ED CC
	ldy $ACAA.w,X		; BC AA AC
	sty $BC.b,X		; 94 BC
	cpy $13CF.w		; CC CF 13
	mvn $66,$53		; 54 53 66
	adc $94.b		; 65 94
	adc $54.b		; 65 54
	.db $42, $10		; 42 10
	ora $CDDC.w		; 0D DC CD
	cmp $CBA0.w		; CD A0 CB
	tsx		; BA
	tax		; AA
	plb		; AB
	cpy $00EF.w		; CC EF 00
	ora ($84.b),Y		; 11 84
	mvp $21,$42		; 44 42 21
	asl $12F0.w		; 0E F0 12
	and ($45.b,S),Y		; 33 45
	sty $44.b		; 84 44
	bit $54.b		; 24 54
	and ($33.b,X)		; 21 33
	sbc $EAEE.w,X		; FD EE EA
	sty $CC.b,X		; 94 CC
	cpy $CDDD.w		; CC DD CD
	cmp $DEEE.w,X		; DD EE DE
	cpx #$84.b		; E0 84
	bit $44.b		; 24 44
	jsr $4511.w		; 20 11 45
	.db $42, $20		; 42 20
	ora ($84.b),Y		; 11 84
	bpl   1.b		; 10 01
	ora ($10.b),Y		; 11 10
	ora $44.b,X		; 15 44
	and ($12.b),Y		; 31 12
	sty $2F.b		; 84 2F
	sbc ($1E.b),Y		; F1 1E
	dec $CBBC.w,X		; DE BC CB
	lda $74DE.w,X		; BD DE 74
	cpx #$10.b		; E0 10
	tsb $E1AC.w		; 0C AC E1
	cpx #$0C.b		; E0 0C
	cpx #$A0.b		; E0 A0
	cpy $DECC.w		; CC CC DE
	sbc $231200.l,X		; FF 00 12 23
	mvp $44,$84		; 44 84 44
	jsl $FE3222.l		; 22 22 32 FE
	sbc $84CBFE.l,X		; FF FE CB 84
	dec $ACEB.w		; CE EB AC
	tsx		; BA
	cpx #$FF.b		; E0 FF
	bpl  18.b		; 10 12
	stz $12.b,X		; 74 12
	mvp $66,$57		; 44 57 66
	eor $13.b,S		; 43 13
	ora ($32.b,S),Y		; 13 32
	bcc  85.b		; 90 55
	eor $54.b		; 45 54
	eor $33.b,S		; 43 33
	and ($0E.b,X)		; 21 0E
	wai		; CB
	sty $DC.b		; 84 DC
	cpy $F0D0.w		; CC D0 F0
	jsl $441222.l		; 22 22 12 44
	ldy #$22.b		; A0 22
	and ($44.b,S),Y		; 33 44
	eor $54.b,X		; 55 54
	mvp $43,$34		; 44 34 43
	sty $FF.b		; 84 FF
	sbc $F0FF.w		; ED FF F0
	dec $EEDB.w,X		; DE DB EE
	inc $C074.w		; EE 74 C0
	sbc $EDCBEB.l		; EF EB CB ED
	cpx $21DD.w		; EC DD 21
	ldy #$CD.b		; A0 CD
	dec $00FF.w,X		; DE FF 00
	ora ($23.b,X)		; 01 23
	bit $55.b,X		; 34 55
	ldy #$66.b		; A0 66
	ror $67.b		; 66 67
	adc [$76.b],Y		; 77 76
	eor $44.b,X		; 55 44
	mvp $33,$A0		; 44 A0 33
	and ($10.b,X)		; 21 10
	brk $FF.b		; 00 FF
	inc $CBDC.w		; EE DC CB
	sty $DF.b		; 84 DF
	sbc $EFDF.w,X		; FD DF EF
	dec $1302.w,X		; DE 02 13
	bit $84.b,X		; 34 84
	bit $45.b		; 24 45
	eor $21.b,S		; 43 21
	and ($20.b)		; 32 20
	ora $DD8410.l		; 0F 10 84 DD
	lda $DDBD.w,X		; BD BD DD
	dec $EDED.w		; CE ED ED
	sbc $FECE64.l		; EF 64 CE FE
	and [$44.b],Y		; 37 44
	lsr $5F.b		; 46 5F
	rol $37.b		; 26 37
	ldy #$01.b		; A0 01
	ora ($22.b)		; 12 22
	and ($33.b,S),Y		; 33 33
	mvp $44,$55		; 44 55 44
	sty $0F.b		; 84 0F
	cmp $BCCB.w,X		; DD CB BC
	ldy $DEBC.w,X		; BC BC DE
	sbc $340284.l,X		; FF 84 02 34
	mvp $54,$65		; 44 65 54
	eor $33.b,S		; 43 33
	ora $DD0E84.l,X		; 1F 84 0E DD
	cmp $10D0.w		; CD D0 10
	sbc $33E1.w		; ED E1 33
	sty $22.b		; 84 22
	brk $10.b		; 00 10
	ora ($EF.b),Y		; 11 EF
	wai		; CB
	cmp $84ED.w,X		; DD ED 84
	sbc $11FFFD.l		; EF FD FF 11
	eor $45.b,S		; 43 45
	adc $64.b,X		; 75 64
	sty $33.b		; 84 33
	eor ($12.b,S),Y		; 53 12
	ora $CDCCED.l		; 0F ED CC CD
	wai		; CB
	sty $9B.b		; 84 9B
	lda $EF0E.w,X		; BD 0E EF
	ora ($22.b),Y		; 11 22
	bit $42.b,X		; 34 42
	sty $00.b		; 84 00
	ora ($10.b,X)		; 01 10
	sbc $BCEC.w		; ED EC BC
	tsx		; BA
	dec $0174.w,X		; DE 74 01
	sbc $432454.l,X		; FF 54 24 43
	bit $32.b,X		; 34 32
	and ($84.b,X)		; 21 84
	cop $22.b		; 02 22
	sbc $2454F2.l,X		; FF F2 54 24
	and ($21.b),Y		; 31 21
	sty $24.b		; 84 24
	eor $3F.b,S		; 43 3F
	inc $FEFF.w		; EE FF FE
	lda $84CB.w,X		; BD CB 84
	wai		; CB
	tax		; AA
	cpy $DDBD.w		; CC BD DD
	sbc ($FF.b,X)		; E1 FF
	sbc ($84.b,X)		; E1 84
	and $33.b		; 25 33
	lsr $67.b		; 46 67
	stz $33.b		; 64 33
	eor ($11.b),Y		; 51 11
	stz $12.b,X		; 74 12
	sbc $FC5210.l,X		; FF 10 52 FC
	ldy $B9DD.w,X		; BC DD B9
	sty $DC.b		; 84 DC
	cpy $F1EF.w		; CC EF F1
	beq  16.b		; F0 10
	jsr $7010.w		; 20 10 70
	ldy #$00.b		; A0 00
	cop $20.b		; 02 20
	brk $00.b		; 00 00
	cpx $64CC.w		; EC CC 64
	stz $40.b,X		; 74 40
	bpl  25.b		; 10 19
	brk $C3.b		; 00 C3
	rti		; 40

	jmp.w [$C074]		; DC 74 C0
	sbc $0F0D.w		; ED 0D 0F
	ora $F00B0F.l,X		; 1F 0F 0B F0
	stz $FF.b,X		; 74 FF
	cmp $1FEE.w,X		; DD EE 1F
	ora ($37.b,S),Y		; 13 37
	adc ($0F.b,S),Y		; 73 0F
	stz $23.b,X		; 74 23
	eor ($11.b,X)		; 41 11
	ora ($11.b),Y		; 11 11
	ora $74ED1F.l,X		; 1F 1F ED 74
	jsr ($D1BC.w,X)		; FC BC D1
	and $0C.b,S		; 23 0C
	jmp.w [$EDF1]		; DC F1 ED
	stz $EE.b		; 64 EE
	ldx $E22E.w		; AE 2E E2
	jsl $443337.l		; 22 37 33 44
	stz $24.b,X		; 74 24
	ora $EFACED.l,X		; 1F ED AC EF
	sbc $F0CB.w		; ED CB F0
	stz $13.b,X		; 74 13
	sbc $13F2FF.l,X		; FF FF F2 13
	ror $43.b,X		; 76 43
	ora $433374.l		; 0F 74 33 43
	ora $B9F1.w		; 0D F1 B9
	brk $20.b		; 00 20
	asl $0F74.w		; 0E 74 0F
	sbc ($00.b,X)		; E1 00
	ldy $55F0.w		; AC F0 55
	bit $74C0.w		; 2C C0 74
	eor ($00.b)		; 52 00
	sbc $D2F0CE.l		; EF CE F0 D2
	rol $74E1.w,X		; 3E E1 74
	bit $00.b,X		; 34 00
	tsb $65.b		; 04 65
	eor ($0F.b,X)		; 41 0F
	sbc $1F74F0.l,X		; FF F0 74 1F
	ora $EECE.w		; 0D CE EE
	cpx $BCBC.w		; EC BC BC
	beq 100.b		; F0 64
	sbc $E11D.w		; ED 1D E1
	asl $62.b,X		; 16 62
	and ($30.b,S),Y		; 33 30
	rti		; 40

	stz $CC.b		; 64 CC
	cmp $C04FF3.l		; CF F3 4F C0
	bit $74.b,X		; 34 74
	cmp ($80.b),Y		; D1 80
	rol $77.b,X		; 36 77
	adc $43.b		; 65 43
	bit $42.b,X		; 34 42
	tsb $7499.w		; 0C 99 74
	sbc $F2BD.w,X		; FD BD F2
	and ($CB.b,X)		; 21 CB
	beq 117.b		; F0 75
	bmi 116.b		; 30 74
	ora $62.b,S		; 03 62
	ora ($05.b),Y		; 11 05
	eor ($53.b,X)		; 41 53
	and $84CB.w		; 2D CB 84
	sbc ($21.b)		; F2 21
	inc $10BE.w		; EE BE 10
	sbc $0DEF.w		; ED EF 0D
	ldy #$DD.b		; A0 DD
	cmp $DDCC.w,X		; DD CC DD
	jmp.w [$CCCC]		; DC CC CC
	cmp $0184.w,X		; DD 84 01
	ora ($20.b,S),Y		; 13 20
	ora ($21.b,S),Y		; 13 21
	ora ($44.b,S),Y		; 13 44
	and ($74.b,X)		; 21 74
	bit $11EE.w		; 2C EE 11
	jmp.w [$BBBA]		; DC BA BB
	cmp $74F3.w		; CD F3 74
	and $33AEFC.l,X		; 3F FC AE 33
	and $BFDDEC.l,X		; 3F EC DD BF
	stz $FE.b,X		; 74 FE
	cmp $2FFD01.l,X		; DF 01 FD 2F
	sbc ($66.b),Y		; F1 66
	ora ($90.b)		; 12 90
	ora ($33.b)		; 12 33
	mvp $55,$55		; 44 55 55
	eor $77.b		; 45 77
	adc [$74.b],Y		; 77 74
	sbc ($2E.b,X)		; E1 2E
	phx		; DA
	phx		; DA
	ldx $D1DE.w,Y		; BE DE D1
	trb $74.b		; 14 74
	ora ($EC.b)		; 12 EC
	dec $0DFF.w,X		; DE FF 0D
	cmp ($54.b,S),Y		; D3 54
	inc $0C74.w,X		; FE 74 0C
	ora ($54.b,X)		; 01 54
	ora $F04E02.l		; 0F 02 4E F0
	jsl $1CFE74.l		; 22 74 FE 1C
	tyx		; BB
	ora $21.b,S		; 03 21
	jsr $03EC.w		; 20 EC 03
	stz $44.b,X		; 74 44
	jsr $AEDB.w		; 20 DB AE
	and $2E.b,X		; 35 2E
	inc $84EE.w		; EE EE 84
	ora ($30.b)		; 12 30
	ora $E1CDEC.l		; 0F EC CD E1
	and ($0F.b,X)		; 21 0F
	stz $DC.b,X		; 74 DC
	sbc ($1F.b,X)		; E1 1F
	eor ($CA.b,S),Y		; 53 CA
	cmp ($1F.b),Y		; D1 1F
	cmp ($74.b),Y		; D1 74
	and $13ED.w,X		; 3D ED 13
	adc $32.b,X		; 75 32
	ora $0F.b,S		; 03 0F
	dec $2474.w,X		; DE 74 24
	eor $1F.b,S		; 43 1F
	tsx		; BA
	dec $F0DE.w,X		; DE DE F0
	beq -124.b		; F0 84
	sbc $E1EE.w,X		; FD EE E1
	mvp $10,$30		; 44 30 10
	sbc $468012.l		; EF 12 80 46
	adc $2F.b,X		; 75 2F
	sbc ($55.b,X)		; E1 55
	and $804003.l,X		; 3F 03 40 80
	jmp.w [$4304]		; DC 04 43
	and ($34.b,S),Y		; 33 34
	eor $20.b,S		; 43 20
	dex		; CA
	stz $CD.b,X		; 74 CD
	sbc $D0DCFB.l,X		; FF FB DC D0
	asl $52FE.w,X		; 1E FE 52
	stz $1E.b,X		; 74 1E
	ora $54.b,X		; 15 54
	mvp $E0,$41		; 44 41 E0
	ora ($01.b),Y		; 11 01
	stz $BD.b,X		; 74 BD
	cpx #$62.b		; E0 62
	ldx $6126.w,Y		; BE 26 61
	dec $8052.w,X		; DE 52 80
	stz $21.b		; 64 21
	bit $30.b,X		; 34 30
	sbc ($42.b),Y		; F1 42
	stp		; DB
	bne -112.b		; D0 90
	asl $BCCB.w		; 0E CB BC
	sbc $1F12F0.l		; EF F0 12 1F
	inc $5774.w		; EE 74 57
	eor $C00EEF.l		; 4F EF 0E C0
	eor [$4D.b]		; 47 4D
	lda ($74.b)		; B2 74
	and ($EE.b,X)		; 21 EE
	ldy $C0E9.w,X		; BC E9 C0
	adc ($EA.b,S),Y		; 73 EA
	cmp ($74.b,S),Y		; D3 74
	ora $71C2CB.l,X		; 1F CB C2 71
	cmp $442311.l		; CF 11 23 44
	sty $31.b		; 84 31
	sbc $2F25.w		; ED 25 2F
	cmp $FF2113.l,X		; DF 13 21 FF
	stz $11.b,X		; 74 11
	sbc $9A0DF0.l		; EF F0 0D 9A
	sbc ($EB.b),Y		; F1 EB
	cmp $F084.w		; CD 84 F0
	ora $F1FF.w,X		; 1D FF F1
	and $53.b,S		; 23 53
	jsr $7412.w		; 20 12 74
	and $53.b		; 25 53
	ora $64.b,S		; 03 64
	rol $11CE.w		; 2E CE 11
	plx		; FA
	stz $BE.b,X		; 74 BE
	sbc $CBBFCC.l		; EF CC BF CB
	lda $BC0C.w,X		; BD 0C BC
	stz $EC.b,X		; 74 EC
	dex		; CA
	sbc $F04203.l		; EF 03 42 F0
	eor $32.b,X		; 55 32
	stz $16.b,X		; 74 16
	stz $33.b		; 64 33
	and $0F.b,X		; 35 0F
	ora ($11.b,X)		; 01 11
	ora $557680.l		; 0F 80 76 55
	eor $21.b,S		; 43 21
	ora $FEFFEF.l		; 0F EF FF FE
	stz $00.b		; 64 00
	bcs  63.b		; B0 3F
	ora $CF0003.l		; 0F 03 00 CF
	bmi  80.b		; 30 50
	bcc   7.b		; 90 07
	adc [$00.b],Y		; 77 00
	brk $70.b		; 00 70
	ora [$77.b]		; 07 77
	stz $D0.b		; 64 D0
	brk $C0.b		; 00 C0
	jsr ($F3CC.w,X)		; FC CC F3
	and $446443.l,X		; 3F 43 64 44
	eor ($D0.b,X)		; 41 D0
	eor ($11.b,X)		; 41 11
	ora #$C01C.w		; 09 1C C0
	stz $CC.b		; 64 CC
	sbc ($0F.b,S),Y		; F3 0F
	cmp $30.b,S		; C3 30
	brk $30.b		; 00 30
	brk $60.b		; 00 60
	brk $04.b		; 00 04
	stz $47.b,X		; 74 47
	stz $40.b,X		; 74 40
	tsb $40.b		; 04 40
	stz $00.b		; 64 00
	cpy #$CC.b		; C0 CC
	sbc $FFB00F.l,X		; FF 0F B0 FF
	tyx		; BB
	stz $B2.b		; 64 B2
	plx		; FA
	and ($23.b)		; 32 23
	ora $F3.b,S		; 03 F3
	mvp $64,$04		; 44 04 64
	eor $11.b		; 45 11
	bpl  30.b		; 10 1E
	ora $01D0.w		; 0D D0 01
	cpy #$64.b		; C0 64
	tsb $CFC0.w		; 0C C0 CF
	beq -69.b		; F0 BB
	tyx		; BB
	inc $64EF.w,X		; FE EF 64
	ldx $E2EF.w		; AE EF E2
.ACCU 8
	sep #$23		; E2 23
	and ($77.b,S),Y		; 33 77
	bpl 100.b		; 10 64
	bpl  20.b		; 10 14
	bpl  17.b		; 10 11
	bpl  20.b		; 10 14
	eor $74ED.w,X		; 5D ED 74
	brk $1E.b		; 00 1E
	cpx $EDCE.w		; EC CE ED
	ldy $FECD.w,X		; BC CD FE
	stz $D1.b		; 64 D1
	cmp $DDDE.w,X		; DD DE DD
	cmp $2111.w,X		; DD 11 21
	.db $62, $64, $36		; 62 64 36
	ora $43.b,S		; 03 43
	bpl   4.b		; 10 04
	eor $11.b		; 45 11
	ora ($64.b),Y		; 11 64
	ora $C11D.w,X		; 1D 1D C1
	tsb $C0DF.w		; 0C DF C0
	jsr ($64F3.w,X)		; FC F3 64
	ora $04430F.l		; 0F 0F 43 04
	rti		; 40

	mvn $45,$D1		; 54 D1 45
	stz $1E.b		; 64 1E
	cmp ($01.b),Y		; D1 01
	pei ($11.b)		; D4 11
	bne -48.b		; D0 D0
	ora $0E74.w		; 0D 74 0E
	cpx #$0D.b		; E0 0D
	cpx #$DE.b		; E0 DE
	ldx $DDFF.w,Y		; BE FF DD
	stz $D1.b		; 64 D1
	sbc ($22.b,X)		; E1 22
	jsl $37203F.l		; 22 3F 20 37
	eor [$74.b]		; 47 74
	and $25.b,S		; 23 25
	and $2F.b,S		; 23 2F
	ora ($F1.b),Y		; 11 F1
	sbc $D064FF.l,X		; FF FF 64 D0
	cmp $000D.w,X		; DD 0D 00
	rti		; 40

	tsb $41.b		; 04 41
	bpl 116.b		; 10 74
	beq -17.b		; F0 EF
	asl $DEE0.w		; 0E E0 DE
	cmp $64DFEF.l		; CF EF DF 64
	lda ($EF.b),Y		; B1 EF
	ora ($EF.b,S),Y		; 13 EF
	sbc $E3.b,S		; E3 E3
	lda $FF6433.l,X		; BF 33 64 FF
	jsr ($F3F3.w,X)		; FC F3 F3
	bit $4F0F.w,X		; 3C 0F 4F
	brk $64.b		; 00 64
	ora $0C.b,S		; 03 0C
	cpy $F3FC.w		; CC FC F3
	lda $64F0F3.l,X		; BF F3 F0 64
	sbc ($30.b,S),Y		; F3 30
	rti		; 40

	tsb $4430.w		; 0C 30 44
	eor ($4E.b,X)		; 41 4E
	stz $01.b		; 64 01
	ora ($CD.b),Y		; 11 CD
	bne -52.b		; D0 CC
	wai		; CB
	wai		; CB
	xba		; EB
	stz $BE.b		; 64 BE
	inc $DEEB.w		; EE EB DE
	inc $E22E.w		; EE 2E E2
	and $E6EF64.l		; 2F 64 EF E6
	sbc ($F0.b,S),Y		; F3 F0
	sbc $34F430.l,X		; FF 30 F4 34
	bra  17.b		; 80 11
	ora ($11.b),Y		; 11 11
	bpl  15.b		; 10 0F
	cpx $A9BA.w		; EC BA A9
	stz $BE.b		; 64 BE
	inc $EBEE.w		; EE EE EB
	ora $232E1B.l,X		; 1F 1B 2E 23
	bra -68.b		; 80 BC
	dec $F0EF.w,X		; DE EF F0
	ora ($11.b),Y		; 11 11
	jsl $016422.l		; 22 22 64 01
	ora $01.b		; 05 01
	bpl  21.b		; 10 15
	bpl  17.b		; 10 11
	eor $3254.w,X		; 5D 54 32
	and ($22.b,X)		; 21 22
	jsl $12212A.l		; 22 2A 21 12
	lda #$70.b		; A9 70
	jsl $EC2222.l		; 22 22 22 EC
	cpy $CACC.w		; CC CC CA
	tax		; AA
	stz $03.b		; 64 03
	sbc ($C0.b,S),Y		; F3 C0
	pea $00F0.w		; F4 F0 00
	cpy $74BB.w		; CC BB 74
	xba		; EB
	cmp $10DF.w,X		; DD DF 10
	ora ($13.b),Y		; 11 13
	and ($42.b)		; 32 42
	stz $44.b		; 64 44
	ora ($D1.b),Y		; 11 D1
	bpl -47.b		; 10 D1
	ora ($01.b,X)		; 01 01
	cmp ($64.b,X)		; C1 64
	mvp $D1,$10		; 44 10 D1
	ora ($04.b,X)		; 01 04
	ora ($D0.b),Y		; 11 D0
	bpl 100.b		; 10 64
	bpl  28.b		; 10 1C
	trb $03CC.w		; 1C CC 03
	cpy $0FBF.w		; CC BF 0F
	mvn $FE,$DE		; 54 DE FE
	inc $6F6E.w		; EE 6E 6F
	adc $609F70.l,X		; 7F 70 9F 60
	cpy $CCCC.w		; CC CC CC
	tsb $47.b		; 04 47
	adc [$77.b],Y		; 77 77
	adc [$64.b],Y		; 77 64
	ora ($0D.b,X)		; 01 0D
	bne  12.b		; D0 0C
	cpy $CBFF.w		; CC FF CB
	sbc $3FFE64.l,X		; FF 64 FE 3F
	and ($F4.b,S),Y		; 33 F4
	bit $44.b,X		; 34 44
	ora ($01.b),Y		; 11 01
	stz $10.b		; 64 10
	ora ($14.b),Y		; 11 14
	ora $CDD1.w,X		; 1D D1 CD
	cpy $640F.w		; CC 0F 64
	phd		; 0B
	wai		; CB
	sbc ($FF.b,S),Y		; F3 FF
	sbc $32FFFB.l,X		; FF FB FF 32
	stz $0B.b		; 64 0B
	sbc $FCFFFF.l,X		; FF FF FF FC
	ldx $22FB.w,Y		; BE FB 22
	bvs -102.b		; 70 9A
	cpy $E0CC.w		; CC CC E0
	inc $0000.w		; EE 00 00
	inc $0364.w		; EE 64 03
	tsb $0C00.w		; 0C 00 0C
	beq -49.b		; F0 CF
	sbc ($0C.b,S),Y		; F3 0C
	stz $FB.b		; 64 FB
.ACCU 16
.INDEX 16
	rep #$F3		; C2 F3
	beq -13.b		; F0 F3
	phd		; 0B
	ora $30.b,S		; 03 30
	bvc -103.b		; 50 99
	sta $9999.w,Y		; 99 99 99
	bcc   0.b		; 90 00
	ora #$6499.w		; 09 99 64
	ora $CF0B0C.l		; 0F 0C 0B CF
	sbc $CEFFFF.l,X		; FF FF FF CE
	stz $F3.b		; 64 F3
	sbc $03FFF3.l,X		; FF F3 FF 03
	bmi -52.b		; 30 CC
	sbc $3FCF64.l,X		; FF 64 CF 3F
	sbc $343003.l,X		; FF 03 30 34
	eor ($40.b,X)		; 41 40
	stz $D1.b		; 64 D1
	ora ($0D.b,X)		; 01 0D
	cpy #$DC00.w		; C0 00 DC
	ldy $64FF.w,X		; BC FF 64
	sbc $BF3BBF.l,X		; FF BF 3B BF
	ldx $EEEF.w,Y		; BE EF EE
	inc $2F64.w,X		; FE 64 2F
	sbc $23.b,S		; E3 23
	beq -13.b		; F0 F3
	stz $40.b,X		; 74 40
	eor $74.b		; 45 74
	and $43.b,S		; 23 43
	ora $F11F11.l,X		; 1F 11 1F F1
	inc $641E.w,X		; FE 1E 64
	ldy $CB0D.w		; AC 0D CB
	cmp $FFFFFB.l		; CF FB FF FF
	cpx $EF64.w		; EC 64 EF
	and $F32BFF.l		; 2F FF 2B F3
	and $64FF3C.l,X		; 3F 3C FF 64
	ora $F0.b,S		; 03 F0
	beq  52.b		; F0 34
	brk $03.b		; 00 03
	eor ($41.b,X)		; 41 41
	stz $41.b		; 64 41
	eor ($11.b),Y		; 51 11
	and #$01D1.w		; 29 D1 01
	ora $5000.w		; 0D 00 50
	brk $07.b		; 00 07
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	brk $09.b		; 00 09
	bvc -103.b		; 50 99
	bcc   0.b		; 90 00
	adc [$77.b],Y		; 77 77
	brk $77.b		; 00 77
	brk $64.b		; 00 64
	cpy $0003.w		; CC 03 00
	cmp $F0F4CF.l		; CF CF F4 F0
	bcs 112.b		; B0 70
	ldy $00EE.w		; AC EE 00
	brk $02.b		; 00 02
	mvp $00,$20		; 44 20 00
	stz $0C.b		; 64 0C
	cpy $FBBC.w		; CC BC FB
	ldx $EF2F.w,Y		; BE 2F EF
	and $2FFF64.l		; 2F 64 FF 2F
	sbc $0C4073.l,X		; FF 73 40 0C
	rti		; 40

	brk $64.b		; 00 64
	ora $10.b,S		; 03 10
	brk $17.b		; 00 17
	eor ($11.b),Y		; 51 11
	trb $21.b		; 14 21
	stz $5D.b		; 64 5D
	and $1111.w		; 2D 11 11
	ora $CC9D.w,X		; 1D 9D CC
	beq 100.b		; F0 64
	cmp $BFFFCF.l		; CF CF FF BF
	sbc ($3F.b)		; F2 3F
	bit $64F0.w,X		; 3C F0 64
	sbc $0FBF0F.l,X		; FF 0F BF 0F
	lda $3FF2BE.l,X		; BF BE F2 3F
	stz $BB.b		; 64 BB
	adc $33F2FC.l		; 6F FC F2 33
	ora $03.b,S		; 03 03
	brk $60.b		; 00 60
	tsb $77.b		; 04 77
	mvp $44,$44		; 44 44 44
	rti		; 40

	tsb $40.b		; 04 40
	stz $00.b		; 64 00
	cpy $0C43.w		; CC 43 0C
	tsb $0F0F.w		; 0C 0F 0F
	phd		; 0B
	stz $30.b		; 64 30
	cmp $4C4FF3.l		; CF F3 4F 4C
	cpy $03F3.w		; CC F3 03
	mvn $0F,$0F		; 54 0F 0F
	ora $100707.l		; 0F 07 07 10
	bpl  16.b		; 10 10
	bvc   7.b		; 50 07
	adc [$00.b],Y		; 77 00
	brk $07.b		; 00 07
	adc [$70.b],Y		; 77 70
	adc [$50.b],Y		; 77 50
	bvs   0.b		; 70 00
	brk $70.b		; 00 70
	sta $7790.w,Y		; 99 90 77
	ora #$CC60.w		; 09 60 CC
	cpy $09C0.w		; CC C0 09
	stz $0400.w		; 9C 00 04
	mvp $01,$64		; 44 64 01
	mvp $15,$14		; 44 14 15
	cmp ($DD.b),Y		; D1 DD
	bne   1.b		; D0 01
	stz $C0.b		; 64 C0
	cpy $CC0F.w		; CC 0F CC
	lda $33CEF2.l,X		; BF F2 CE 33
	stz $FF.b		; 64 FF
	wai		; CB
	lda $E3BC63.l,X		; BF 63 BC E3
	and ($F0.b,S),Y		; 33 F0
	stz $F0.b		; 64 F0
	pea $04F4.w		; F4 F4 04
	brk $44.b		; 00 44
	eor $51.b,X		; 55 51
	mvn $22,$B3		; 54 B3 22
	tsa		; 3B
	ora ($B1.b)		; 12 B1
	and ($A9.b,X)		; 21 A9
	bcc 100.b		; 90 64
	cpy $CBCF.w		; CC CF CB
	lda $3C26EB.l,X		; BF EB 26 3C
	lda $AA9A70.l,X		; BF 70 9A AA
	tax		; AA
	ldy $00E0.w		; AC E0 00
	bit $42.b		; 24 42
	stz $C0.b		; 64 C0
	ora $0FC3.w		; 0D C3 0F
	cpy $FC.b		; C4 FC
	cmp $0F.b,S		; C3 0F
	stz $CC.b		; 64 CC
	sbc ($0F.b)		; F2 0F
	jsr ($FFFF.w,X)		; FC FF FF
	sbc $3F64FF.l,X		; FF FF 64 3F
	ora $0C0FF3.l		; 0F F3 0F 0C
	lda $64CEFF.l,X		; BF FF CE 64
	sbc $FFBEFF.l,X		; FF FF BE FF
	sbc $332FE3.l		; EF E3 2F 33
	stz $30.b		; 64 30
	eor $45.b,S		; 43 45
	ora $4514.w		; 0D 14 45
	asl $6442.w,X		; 1E 42 64
	cmp $CDDD.w,X		; DD DD CD
	beq -64.b		; F0 C0
	bcs -65.b		; B0 BF
	sbc $FCFF64.l,X		; FF 64 FF FC
	xce		; FB
	xba		; EB
	sbc $EFFF2E.l		; EF 2E FF EF
	bra -85.b		; 80 AB
	ldy $DDCD.w,X		; BC CD DD
	inc $00F0.w		; EE F0 00
	sbc $000F64.l,X		; FF 64 0F 00
	brk $CB.b		; 00 CB
	cmp $FFBFFF.l		; CF FF BF FF
	stz $FB.b		; 64 FB
	sbc $FFF22F.l		; EF 2F F2 FF
	bmi  63.b		; 30 3F
	phd		; 0B
	stz $0F.b		; 64 0F
	cmp $0FFF20.l		; CF 20 FF 0F
	sbc ($4F.b,S),Y		; F3 4F
	tsb $3064.w		; 0C 64 30
	brk $F4.b		; 00 F4
	tsb $CB0C.w		; 0C 0C CB
	sbc ($F3.b,S),Y		; F3 F3
	stz $CC.b		; 64 CC
	sbc $0FFFF3.l,X		; FF F3 FF 0F
	and $640003.l,X		; 3F 03 00 64
	jsr ($F000.w,X)		; FC 00 F0
	beq -80.b		; F0 B0
	sbc $60FFC3.l,X		; FF C3 FF 60
	sta $C0CC.w,Y		; 99 CC C0
	mvp $00,$00		; 44 00 00
	tsb $44.b		; 04 44
	stz $D0.b		; 64 D0
	cpy #$0FCF.w		; C0 CF 0F
	cpy $FBFF.w		; CC FF FB
	xce		; FB
	stz $FA.b		; 64 FA
	ldx $2F22.w,Y		; BE 22 2F
	sbc ($F3.b,S),Y		; F3 F3
	and $006434.l,X		; 3F 34 64 00
	brk $44.b		; 00 44
	eor ($0D.b,X)		; 41 0D
	ora $D000.w,X		; 1D 00 D0
	stz $0C.b		; 64 0C
	tsb $FFB0.w		; 0C B0 FF
	phd		; 0B
	sbc $70FFFF.l,X		; FF FF FF 70
	sta $AC99.w,Y		; 99 99 AC
	dec $00EE.w		; CE EE 00
	brk $EE.b		; 00 EE
	stz $0F.b		; 64 0F
	cpy #$F0CF.w		; C0 CF F0
	tyx		; BB
	sbc $80FEFB.l,X		; FF FB FE 80
	tax		; AA
	ldy $CDCC.w,X		; BC CC CD
	dec $F0EE.w,X		; DE EE F0
	ora ($64.b)		; 12 64
	trb $11.b		; 14 11
	eor ($11.b,X)		; 41 11
	cmp ($10.b),Y		; D1 10
	ora $6401.w,X		; 1D 01 64
	ora $0001.w		; 0D 01 00
	jmp.w [$000F]		; DC 0F 00
	cmp $99600C.l		; CF 0C 60 99
	sta $9999.w,Y		; 99 99 99
	sta $9C99.w,Y		; 99 99 9C
	cmp #$EF54.w		; C9 54 EF
	sbc $F0FFFF.l,X		; FF FF FF F0
	inc $0F.b,X		; F6 0F
	ora $700F54.l		; 0F 54 0F 70
	brk $09.b		; 00 09
	beq -16.b		; F0 F0
	beq -16.b		; F0 F0
	bvc -103.b		; 50 99
	brk $00.b		; 00 00
	ora #$9999.w		; 09 99 99
	bcc   0.b		; 90 00
	bvc   0.b		; 50 00
	brk $07.b		; 00 07
	adc [$77.b],Y		; 77 77
	adc [$70.b],Y		; 77 70
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	bcc   0.b		; 90 00
	brk $00.b		; 00 00
	ora [$70.b]		; 07 70
	mvn $71,$00		; 54 00 71
	ora ($01.b,X)		; 01 01
	ora ($90.b,X)		; 01 90
	adc $5000.w,Y		; 79 00 50
	brk $77.b		; 00 77
	adc [$07.b],Y		; 77 07
	adc [$77.b],Y		; 77 77
	adc [$77.b],Y		; 77 77
	rts		; 60

	eor [$77.b]		; 47 77
	stz $40.b,X		; 74 40
	tsb $00CC.w		; 0C CC 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora #$9999.w		; 09 99 99
	sta $F054.w,Y		; 99 54 F0
	beq  -9.b		; F0 F7
	brk $09.b		; 00 09
	beq -16.b		; F0 F0
	beq 100.b		; F0 64
	tsb $FFB0.w		; 0C B0 FF
	bmi -16.b		; 30 F0
	beq -16.b		; F0 F0
	beq 100.b		; F0 64
	jsr ($F3F0.w,X)		; FC F0 F3
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $0F0F64.l		; 0F 64 0F 0F
	tsb $0FFF.w		; 0C FF 0F
	and $64F04C.l,X		; 3F 4C F0 64
	beq -16.b		; F0 F0
	beq -49.b		; F0 CF
	sbc ($0F.b,S),Y		; F3 0F
	ora $00.b,S		; 03 00
	rts		; 60

	cpy $CCCC.w		; CC CC CC
	cmp #$9999.w		; C9 99 99
	sta $60CC.w,Y		; 99 CC 60
	cpy $9CC9.w		; CC C9 9C
	cmp #$9999.w		; C9 99 99
	cpy $64CC.w		; CC CC 64
	brk $F0.b		; 00 F0
	tsb $0BF0.w		; 0C F0 0B
	ora $604FFF.l		; 0F FF 4F 60
	stz $CCCC.w		; 9C CC CC
	tsb $44.b		; 04 44
	brk $40.b		; 00 40
	tsb $F064.w		; 0C 64 F0
	tsb $F0FC.w		; 0C FC F0
	jsr ($3FFB.w,X)		; FC FB 3F
	sbc $BFF364.l,X		; FF 64 F3 BF
	sbc ($F3.b,S),Y		; F3 F3
	ora $F4C003.l		; 0F 03 C0 F4
	mvn $0F,$FF		; 54 FF 0F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora [$00.b]		; 07 00
	rts		; 60

	cpy $CCCC.w		; CC CC CC
	sta $C09C.w,Y		; 99 9C C0
	brk $CC.b		; 00 CC
	stz $00.b		; 64 00
	beq -64.b		; F0 C0
	lda ($0F.b,S),Y		; B3 0F
	tsb $30FF.w		; 0C FF 30
	stz $F0.b		; 64 F0
	jsr ($FFF0.w,X)		; FC F0 FF
	ora $F00FFF.l		; 0F FF 0F F0
	stz $3F.b		; 64 3F
	ora $0F0F0F.l		; 0F 0F 0F 0F
	ora $64F3CC.l		; 0F CC F3 64
	sbc ($30.b,S),Y		; F3 30
	cpy #$FFB0.w		; C0 B0 FF
	beq  -1.b		; F0 FF
	phd		; 0B
	stz $FF.b		; 64 FF
	and $C03F0F.l,X		; 3F 0F 3F C0
	and $640F0F.l,X		; 3F 0F 0F 64
	tsb $F0FF.w		; 0C FF F0
	sbc $FCF030.l,X		; FF 30 F0 FC
	beq 100.b		; F0 64
	sbc ($0F.b,S),Y		; F3 0F
	ora $0C0F0F.l		; 0F 0F 0F 0C
	sbc $996030.l,X		; FF 30 60 99
	sta $CC99.w,Y		; 99 99 CC
	sta $9999.w,Y		; 99 99 99
	sta $9960.w,Y		; 99 60 99
	sta $CC99.w,Y		; 99 99 CC
	cpy $9CC9.w		; CC C9 9C
	cpy $C960.w		; CC 60 C9
	stz $C0CC.w		; 9C CC C0
	brk $CC.b		; 00 CC
	brk $00.b		; 00 00
	rts		; 60

	brk $04.b		; 00 04
	rti		; 40

	cpy $00C0.w		; CC C0 00
	cmp #$60C0.w		; C9 C0 60
	tsb $C0C9.w		; 0C C9 C0
	tsb $C099.w		; 0C 99 C0
	tsb $64C0.w		; 0C C0 64
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$F000.w		; C0 00 F0
	cpy $6F54.w		; CC 54 6F
	inc $0F.b,X		; F6 0F
	ora $F0000F.l		; 0F 0F 00 F0
	beq  96.b		; F0 60
	cpy $0000.w		; CC 00 00
	sta $CC99.w,Y		; 99 99 CC
	cpy $6499.w		; CC 99 64
	cmp $3C.b,S		; C3 3C
	cmp $F0F030.l		; CF 30 F0 F0
	beq -12.b		; F0 F4
	rts		; 60

	cpy $9999.w		; CC 99 99
	stz $99CC.w		; 9C CC 99
	cpy #$600C.w		; C0 0C 60
	cmp #$CCCC.w		; C9 CC CC
	cpy $9C99.w		; CC 99 9C
	cpy $60C0.w		; CC C0 60
	tsb $99CC.w		; 0C CC 99
	stz $99CC.w		; 9C CC 99
	stz $6400.w		; 9C 00 64
	tsb $0F0C.w		; 0C 0C 0F
	bmi  12.b		; 30 0C
	bmi -52.b		; 30 CC
	sbc ($64.b,S),Y		; F3 64
	ora $F30C0F.l		; 0F 0F 0C F3
	jsr ($FFF0.w,X)		; FC F0 FF
	bmi 100.b		; 30 64
	jsr ($FFF0.w,X)		; FC F0 FF
	ora $B0.b,S		; 03 B0
	lda $640F3F.l,X		; BF 3F 0F 64
	sbc $30F30B.l,X		; FF 0B F3 30
	beq  60.b		; F0 3C
	cmp $0C64F3.l		; CF F3 64 0C
	sbc $3FFC0F.l,X		; FF 0F FC 3F
	sbc $643FCF.l,X		; FF CF 3F 64
	beq  -1.b		; F0 FF
	cmp $FF3CF3.l		; CF F3 3C FF
	beq -13.b		; F0 F3
	stz $39.b		; 64 39
	lda $FC303F.l,X		; BF 3F 30 FC
	jsr ($303F.w,X)		; FC 3F 30
	stz $F0.b		; 64 F0
	bcs -13.b		; B0 F3
	ora $F3FFCB.l		; 0F CB FF F3
	ora $60.b,S		; 03 60
	sta $99C9.w,Y		; 99 C9 99
	stz $9CCC.w		; 9C CC 9C
	cpy $60C0.w		; CC C0 60
	tsb $C0CC.w		; 0C CC C0
	brk $CC.b		; 00 CC
	sta $00CC.w,Y		; 99 CC 00
	stz $00.b		; 64 00
	cpy #$CF0C.w		; C0 0C CF
	and $00004F.l,X		; 3F 4F 00 00
	stz $FC.b		; 64 FC
	ora $30F30C.l		; 0F 0C F3 30
	brk $F0.b		; 00 F0
	brk $60.b		; 00 60
	brk $C9.b		; 00 C9
	cpy #$C00C.w		; C0 0C C0
	brk $CC.b		; 00 CC
	brk $60.b		; 00 60
	cmp #$C09C.w		; C9 9C C0
	brk $C9.b		; 00 C9
	stz $CCCC.w		; 9C CC CC
	stz $00.b		; 64 00
	jsr ($34CF.w,X)		; FC CF 34
	cmp $F00003.l		; CF 03 00 F0
	bvc -103.b		; 50 99
	bcc 112.b		; 90 70
	sta $0907.w,Y		; 99 07 09
	bcc   0.b		; 90 00
	bvc -103.b		; 50 99
	brk $00.b		; 00 00
	sta $0000.w,Y		; 99 00 00
	ora #$6499.w		; 09 99 64
	ora $300F0C.l		; 0F 0C 0F 30
	cpy $0C73.w		; CC 73 0C
	ora [$50.b]		; 07 50
	adc [$77.b],Y		; 77 77
	bvs   7.b		; 70 07
	adc [$09.b],Y		; 77 09
	ora [$77.b]		; 07 77
	bvc 119.b		; 50 77
	bvs   9.b		; 70 09
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sta $6090.w,Y		; 99 90 60
	cpy $0000.w		; CC 00 00
	brk $CC.b		; 00 CC
	cpy $9CC9.w		; CC C9 9C
	stz $C0.b		; 64 C0
	bit $0FF0.w,X		; 3C F0 0F
	ora $0F0B0F.l		; 0F 0F 0B 0F
	stz $3C.b		; 64 3C
	sbc $F0300F.l,X		; FF 0F 30 F0
	beq -80.b		; F0 B0
	sbc $CF3064.l,X		; FF 64 30 CF
	beq  63.b		; F0 3F
	phd		; 0B
	ora $6433F0.l		; 0F F0 33 64
	cmp $3CF3C0.l		; CF C0 F3 3C
	ora $0F0F0F.l		; 0F 0F 0F 0F
	stz $0F.b		; 64 0F
	ora $30CC4F.l		; 0F 4F CC 30
	pea $0FCF.w		; F4 CF 0F
	stz $0F.b		; 64 0F
	ora $BC4C0F.l		; 0F 0F 4C BC
	sbc ($FF.b,S),Y		; F3 FF
	cmp $70.b,S		; C3 70
	tax		; AA
	tax		; AA
	ldy $99CC.w		; AC CC 99
	tax		; AA
	dec $64EC.w		; CE EC 64
	cmp $0C3003.l		; CF 03 30 0C
	jsr ($0FF3.w,X)		; FC F3 0F
	ora $0C0F64.l		; 0F 64 0F 0C
	sbc $F4F030.l,X		; FF 30 F0 F4
	bmi -64.b		; 30 C0
	stz $C0.b		; 64 C0
	jsr ($003F.w,X)		; FC 3F 00
	beq  48.b		; F0 30
	beq   0.b		; F0 00
	stz $CF.b		; 64 CF
	ora $F0C003.l		; 0F 03 C0 F0
	sbc ($04.b,S),Y		; F3 04
	cpy $0F64.w		; CC 64 0F
	ora $0C.b,S		; 03 0C
	pea $03CB.w		; F4 CB 03
	sbc ($C4.b,S),Y		; F3 C4
	rts		; 60

	cpy #$9CCC.w		; C0 CC 9C
	cpy #$CC0C.w		; C0 0C CC
	sta $609C.w,Y		; 99 9C 60
	cpy $C0CC.w		; CC CC C0
	tsb $CCCC.w		; 0C CC CC
	cpy $64C9.w		; CC C9 64
	sbc ($00.b,S),Y		; F3 00
	cpy $0F3F.w		; CC 3F 0F
	ora $64C003.l		; 0F 03 C0 64
	beq -80.b		; F0 B0
	sbc ($30.b,S),Y		; F3 30
	brk $FC.b		; 00 FC
	ora $9960CF.l		; 0F CF 60 99
	sta $CCCC.w,Y		; 99 CC CC
	cpy $9C99.w		; CC 99 9C
	cpy $CF64.w		; CC 64 CF
	brk $F0.b		; 00 F0
	beq -16.b		; F0 F0
	beq -12.b		; F0 F4
	beq 100.b		; F0 64
	tsb $0F30.w		; 0C 30 0F
	brk $0C.b		; 00 0C
	beq  60.b		; F0 3C
	phd		; 0B
	stz $0F.b		; 64 0F
	bmi -13.b		; 30 F3
	brk $CC.b		; 00 CC
	sbc ($FC.b,S),Y		; F3 FC
	ora $60.b,S		; 03 60
	sta $99CC.w,Y		; 99 CC 99
	stz $CC00.w		; 9C 00 CC
	cpy $60CC.w		; CC CC 60
	cmp #$CC9C.w		; C9 9C CC
	sta $CCCC.w,Y		; 99 CC CC
	brk $CC.b		; 00 CC
	rts		; 60

	sta $C0CC.w,Y		; 99 CC C0
	brk $C9.b		; 00 C9
	cpy $CC0C.w		; CC 0C CC
	rts		; 60

	cmp #$9999.w		; C9 99 99
	stz $CCCC.w		; 9C CC CC
	cpy #$6000.w		; C0 00 60
	brk $C9.b		; 00 C9
	sta $99CC.w,Y		; 99 CC 99
	sta $CC99.w,Y		; 99 99 CC
	bvc -103.b		; 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9999.w,Y		; 99 99 99
	sta $CF64.w,Y		; 99 64 CF
	eor $3CCF0C.l		; 4F 0C CF 3C
	sbc ($0F.b,S),Y		; F3 0F
	ora $AAAA70.l		; 0F 70 AA AA
	tax		; AA
	cpy $EECC.w		; CC CC EE
	cpx $60CC.w		; EC CC 60
	sta $C999.w,Y		; 99 99 C9
	sta $C9CC.w,Y		; 99 CC C9
	cpy #$64C9.w		; C0 C9 64
	sbc $30CC4F.l,X		; FF 4F CC 30
	beq  48.b		; F0 30
	cmp $075003.l		; CF 03 50 07
	brk $00.b		; 00 00
	brk $77.b		; 00 77
	bvs 119.b		; 70 77
	ora #$CC60.w		; 09 60 CC
	tsb $77.b		; 04 77
	stz $44.b,X		; 74 44
	brk $04.b		; 00 04
	mvp $47,$60		; 44 60 47
	mvp $77,$04		; 44 04 77
	mvp $74,$47		; 44 47 74
	eor [$60.b]		; 47 60
	stz $44.b,X		; 74 44
	brk $04.b		; 00 04
	mvp $74,$77		; 44 77 74
	mvp $40,$60		; 44 60 40
	mvp $74,$44		; 44 44 74
	brk $44.b		; 00 44
	brk $04.b		; 00 04
	bvc 112.b		; 50 70
	brk $07.b		; 00 07
	adc [$09.b],Y		; 77 09
	bcc 112.b		; 90 70
	ora #$C960.w		; 09 60 C9
	stz $0C00.w		; 9C 00 0C
	cmp #$CC9C.w		; C9 9C CC
	cpy #$0C60.w		; C0 60 0C
	cpy $99C0.w		; CC C0 99
	cpy #$CC0C.w		; C0 0C CC
	cpy #$0050.w		; C0 50 00
	sta $9900.w,Y		; 99 00 99
	sta $0900.w,Y		; 99 00 09
	sta $7750.w,Y		; 99 50 77
	ora #$7077.w		; 09 77 70
	ora #$9000.w		; 09 00 90
	brk $60.b		; 00 60
	tsb $40.b		; 04 40
	cpy #$9CC9.w		; C0 C9 9C
	cpy $CC00.w		; CC 00 CC
	rts		; 60

	brk $0C.b		; 00 0C
	cpy $C0CC.w		; CC CC C0
	tsb $99CC.w		; 0C CC 99
	rts		; 60

	cpy $CCCC.w		; CC CC CC
	cpy $CCCC.w		; CC CC CC
	cpy $5099.w		; CC 99 50
	sta $9999.w,Y		; 99 99 99
	brk $90.b		; 00 90
	ora #$9999.w		; 09 99 99
	rts		; 60

	brk $0C.b		; 00 0C
	cmp #$0C9C.w		; C9 9C 0C
	cpy $990C.w		; CC 0C 99
	rts		; 60

	cpy $CCCC.w		; CC CC CC
	cpy #$C900.w		; C0 00 C9
	cpy $60CC.w		; CC CC 60
	cpy $9CC9.w		; CC C9 9C
	cpy $CCCC.w		; CC CC CC
	cmp #$609C.w		; C9 9C 60
	cpy $00C0.w		; CC C0 00
	cmp #$00C0.w		; C9 C0 00
	cpy #$5004.w		; C0 04 50
	brk $99.b		; 00 99
	sta $0090.w,Y		; 99 90 00
	sta $0099.w,Y		; 99 99 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $50.b		; 00 50
	bcc 119.b		; 90 77
	adc [$77.b],Y		; 77 77
	brk $00.b		; 00 00
	bvs   0.b		; 70 00
	bvc   0.b		; 50 00
	sta $0090.w,Y		; 99 90 00
	sta $0099.w,Y		; 99 99 00
	sta $CC60.w,Y		; 99 60 CC
	brk $40.b		; 00 40
	tsb $CC9C.w		; 0C 9C CC
	sta $60CC.w,Y		; 99 CC 60
	cmp #$C99C.w		; C9 9C C9
	cpy $C9CC.w		; CC CC C9
	sta $6099.w,Y		; 99 99 60
	cpy $0CCC.w		; CC CC 0C
	sta $CC9C.w,Y		; 99 9C CC
	cpy #$5400.w		; C0 00 54
	sta $700F0F.l,X		; 9F 0F 0F 70
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rts		; 60

	cmp #$99CC.w		; C9 CC 99
	stz $CCCC.w		; 9C CC CC
	cpy $60CC.w		; CC CC 60
	cmp #$CC99.w		; C9 99 CC
	cpy $9C99.w		; CC 99 9C
	cpy $60CC.w		; CC CC 60
	cpy $9CC9.w		; CC C9 9C
	cpy $CC9C.w		; CC 9C CC
	cmp #$60CC.w		; C9 CC 60
	cpy $C999.w		; CC 99 C9
	stz $CC0C.w		; 9C 0C CC
	brk $C9.b		; 00 C9
	bvc -103.b		; 50 99
	sta $9999.w,Y		; 99 99 99
	sta $9990.w,Y		; 99 90 99
	bcc  96.b		; 90 60
	cpy $C99C.w		; CC 9C C9
	sta $9999.w,Y		; 99 99 99
	cmp #$6499.w		; C9 99 64
	beq  -4.b		; F0 FC
	beq  51.b		; F0 33
	cpy #$F030.w		; C0 30 F0
	brk $60.b		; 00 60
	cpy $CC00.w		; CC 00 CC
	cmp #$C09C.w		; C9 9C C0
	cmp #$64CC.w		; C9 CC 64
	cmp $0C.b,S		; C3 0C
	pea $0C0F.w		; F4 0F 0C
	bit $0C.b,X		; 34 0C
	brk $60.b		; 00 60
	cpy $00C0.w		; CC C0 00
	cmp #$CC9C.w		; C9 9C CC
	cpy $61CC.w		; CC CC 61
	cpy $9C99.w		; CC 99 9C
	cmp #$CCCC.w		; C9 CC CC
	cpy $FFC0.w		; CC C0 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 047FFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 047FFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 047FFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 047FFF. Skipping.
.ENDS
