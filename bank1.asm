.BANK 1 SLOT 0
.ORG $0000

.SECTION "Bank1" FORCE

	brk $00.b		; 00 00
	ora $00.b		; 05 00
	phd		; 0B
	brk $12.b		; 00 12
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	brk $80.b		; 00 80
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	ora $00.b		; 05 00
	ora $00.b		; 05 00
	ora [$00.b]		; 07 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	ora $00.b		; 05 00
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	ora $00.b		; 05 00
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	cop $00.b		; 02 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	ora [$00.b]		; 07 00
	ora ($00.b,X)		; 01 00
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	ora $00.b		; 05 00
	cop $00.b		; 02 00
	asl $00.b		; 06 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	ora $00.b		; 05 00
	asl $00.b		; 06 00
	ora [$00.b]		; 07 00
	php		; 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	brk $0F.b		; 00 0F
	brk $10.b		; 00 10
	brk $11.b		; 00 11
	brk $12.b		; 00 12
	brk $13.b		; 00 13
	brk $14.b		; 00 14
	brk $15.b		; 00 15
	brk $16.b		; 00 16
	brk $17.b		; 00 17
	brk $18.b		; 00 18
	brk $19.b		; 00 19
	brk $1A.b		; 00 1A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $0A.b		; 00 0A
	brk $20.b		; 00 20
	brk $0A.b		; 00 0A
	brk $20.b		; 00 20
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
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
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
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	ora $00.b		; 05 00
	tsb $00.b		; 04 00
	ora $00.b		; 05 00
	tsb $00.b		; 04 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $00.b,S		; 03 00
	ora $00.b		; 05 00
	ora $00.b,S		; 03 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	tsb $00.b		; 04 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($A6.b,X)		; 01 A6
	ora ($A6.b,X)		; 01 A6
	ora ($A6.b,X)		; 01 A6
	ora ($5E.b,X)		; 01 5E
	ora ($2C.b,X)		; 01 2C
	ora ($A6.b,X)		; 01 A6
	ora ($A6.b,X)		; 01 A6
	ora ($A6.b,X)		; 01 A6
	ora ($A6.b,X)		; 01 A6
	ora ($45.b,X)		; 01 45
	ora ($FA.b,X)		; 01 FA
	brk $7C.b		; 00 7C
	ora ($68.b,X)		; 01 68
	ora ($54.b,X)		; 01 54
	ora ($40.b,X)		; 01 40
	ora ($2C.b,X)		; 01 2C
	ora ($18.b,X)		; 01 18
	ora ($04.b,X)		; 01 04
	ora ($90.b,X)		; 01 90
	ora ($7C.b,X)		; 01 7C
	ora ($68.b,X)		; 01 68
	ora ($54.b,X)		; 01 54
	ora ($40.b,X)		; 01 40
	ora ($2C.b,X)		; 01 2C
	ora ($18.b,X)		; 01 18
	ora ($04.b,X)		; 01 04
	ora ($40.b,X)		; 01 40
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	ora ($40.b,X)		; 01 40
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	ora ($80.b,X)		; 01 80
	ora ($40.b,X)		; 01 40
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($40.b,X)		; 01 40
	ora ($40.b,X)		; 01 40
	ora ($40.b,X)		; 01 40
	ora ($00.b,X)		; 01 00
	cop $80.b		; 02 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	ora ($80.b,X)		; 01 80
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $80.b		; 02 80
	brk $C0.b		; 00 C0
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	ora ($40.b,X)		; 01 40
	brk $80.b		; 00 80
	brk $C0.b		; 00 C0
	brk $00.b		; 00 00
	ora ($80.b,X)		; 01 80
	ora ($80.b,X)		; 01 80
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($00.b,X)		; 01 00
	ora ($40.b,X)		; 01 40
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	ora ($00.b,X)		; 01 00
	ora ($80.b,X)		; 01 80
	ora ($80.b,X)		; 01 80
	ora ($00.b,X)		; 01 00
	cop $00.b		; 02 00
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	tsb $00.b		; 04 00
	asl $2300.w,X		; 1E 00 23
	brk $28.b		; 00 28
	brk $2D.b		; 00 2D
	brk $32.b		; 00 32
	brk $23.b		; 00 23
	brk $28.b		; 00 28
	brk $2D.b		; 00 2D
	brk $32.b		; 00 32
	brk $37.b		; 00 37
	brk $3C.b		; 00 3C
	brk $28.b		; 00 28
	brk $2D.b		; 00 2D
	brk $2D.b		; 00 2D
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $46.b		; 00 46
	pla		; 68
	and #$2D00.w		; 29 00 2D
	brk $32.b		; 00 32
	brk $37.b		; 00 37
	brk $3C.b		; 00 3C
	brk $46.b		; 00 46
	brk $50.b		; 00 50
	brk $5A.b		; 00 5A
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $38.b		; 00 38
	brk $3F.b		; 00 3F
	brk $3F.b		; 00 3F
	brk $14.b		; 00 14
	brk $48.b		; 00 48
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	brk $04.b		; 00 04
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $02.b		; 00 02
	brk $04.b		; 00 04
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $01.b		; 00 01
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $05.b		; 00 05
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $02.b		; 00 02
	brk $10.b		; 00 10
	cmp $11.b		; C5 11
	brk $00.b		; 00 00
	bra   5.b		; 80 05
	brk $30.b		; 00 30
	cmp $11.b		; C5 11
	brk $50.b		; 00 50
	cmp $11.b		; C5 11
	brk $70.b		; 00 70
	cmp $11.b		; C5 11
	brk $D0.b		; 00 D0
	cmp $11.b		; C5 11
	brk $90.b		; 00 90
	cmp $11.b		; C5 11
	brk $B0.b		; 00 B0
	cmp $11.b		; C5 11
	brk $F0.b		; 00 F0
	cmp $11.b		; C5 11
	brk $00.b		; 00 00
	bra  22.b		; 80 16
	brk $10.b		; 00 10
	dec $11.b		; C6 11
	brk $00.b		; 00 00
	bra  24.b		; 80 18
	brk $30.b		; 00 30
	dec $11.b		; C6 11
	brk $00.b		; 00 00
	bra  27.b		; 80 1B
	brk $2A.b		; 00 2A
	sbc $001F.w		; ED 1F 00
	ror A		; 6A
	sbc $001F.w		; ED 1F 00
	tax		; AA
	sbc $001F.w		; ED 1F 00
	nop		; EA
	sbc $001F.w		; ED 1F 00
	rol A		; 2A
	inc $001F.w		; EE 1F 00
	ror A		; 6A
	inc $001F.w		; EE 1F 00
	tax		; AA
	inc $001F.w		; EE 1F 00
	nop		; EA
	inc $001F.w		; EE 1F 00
	rol A		; 2A
	sbc $05001F.l		; EF 1F 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $14.b		; 00 14
	brk $28.b		; 00 28
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $14.b		; 00 14
	brk $28.b		; 00 28
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $05.b		; 00 05
	brk $0A.b		; 00 0A
	brk $0F.b		; 00 0F
	brk $14.b		; 00 14
	brk $1E.b		; 00 1E
	brk $28.b		; 00 28
	brk $32.b		; 00 32
	brk $3C.b		; 00 3C
	brk $64.b		; 00 64
	iny		; C8
	tax		; AA
	sbc $CA8000.l,X		; FF 00 80 CA
	sta [$98.b]		; 87 98
	sta $2C9A33.l		; 8F 33 9A 2C
	lda $90.b,S		; A3 90
	ldy $B6CE.w		; AC CE B6
	eor #$3CBF.w		; 49 BF 3C
	dex		; CA
	ply		; 7A
	sta ($49.b,X)		; 81 49
	bit #$91D8.w		; 89 D8 91
	asl A		; 0A
	stz $A511.w		; 9C 11 A5
	txa		; 8A
	ldx $B870.w		; AE 70 B8
	ora ($C1.b)		; 12 C1
	tay		; A8
	dex		; CA
	bra -16.b		; 80 F0
	rti		; 40

	sbc ($00.b),Y		; F1 00
	sbc ($40.b)		; F2 40
	sbc ($C0.b)		; F2 C0
	sbc ($80.b)		; F2 80
	sbc ($00.b,S),Y		; F3 00
	pea $F440.w		; F4 40 F4
	brk $F5.b		; 00 F5
	cpy #$80F0.w		; C0 F0 80
	sbc ($00.b),Y		; F1 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sbc ($00.b,S),Y		; F3 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	pea $F100.w		; F4 00 F1
	cpy #$00F1.w		; C0 F1 00
	brk $80.b		; 00 80
	sbc ($00.b)		; F2 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $C0.b		; 00 C0
	pea $0000.w		; F4 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	rti		; 40

	sbc ($C0.b,S),Y		; F3 C0
	sbc ($50.b,S),Y		; F3 50
	lda [$17.b]		; A7 17
	brk $56.b		; 00 56
	clv		; B8
	ora [$00.b],Y		; 17 00
	jmp $0017C9.l		; 5C C9 17 00
	tay		; A8
	lda $0019.w,X		; BD 19 00
	brk $80.b		; 00 80
	asl $00.b		; 06 00
	jsr $06B9.w		; 20 B9 06
	brk $00.b		; 00 00
	bra   6.b		; 80 06
	bcc  12.b		; 90 0C
	bcs   0.b		; B0 00
	bra -128.b		; 80 80
	sta $2BB9A0.l,X		; 9F A0 B9 2B
	lda $2BAFAB.l		; AF AB AF 2B
	bcs  32.b		; B0 20
	sta ($D4.b,X)		; 81 D4
	ldy $68.b		; A4 68
	cmp $00.b,S		; C3 00
	bra -128.b		; 80 80
	brk $40.b		; 00 40
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	bra -128.b		; 80 80
	brk $10.b		; 00 10
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	rti		; 40

	brk $04.b		; 00 04
	brk $08.b		; 00 08
	rti		; 40

	brk $80.b		; 00 80
	brk $00.b		; 00 00
	bra   0.b		; 80 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $78.b		; 00 78
	brk $78.b		; 00 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	sei		; 78
	sei		; 78
	sei		; 78
	sei		; 78
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $2800.w		; 20 00 28
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $70.b		; 00 70
	bvs 124.b		; 70 7C
	jmp $7C547C.l		; 5C 7C 54 7C
	stz $7C.b,X		; 74 7C
	stz $7C.b,X		; 74 7C
	jmp ($8000.w,X)		; 7C 00 80
	tsb $0800.w		; 0C 00 08
	sta $0C.b		; 85 0C
	brk $08.b		; 00 08
	sta $0C.b		; 85 0C
	brk $30.b		; 00 30
	txa		; 8A
	tsb $3000.w		; 0C 00 30
	txa		; 8A
	tsb $CC00.w		; 0C 00 CC
	sta $CC000C.l		; 8F 0C 00 CC
	sta $00000C.l		; 8F 0C 00 00
	sta $0C.b,X		; 95 0C
	brk $00.b		; 00 00
	sta $0C.b,X		; 95 0C
	brk $54.b		; 00 54
	txs		; 9A
	tsb $0000.w		; 0C 00 00
	sta $0C.b,X		; 95 0C
	brk $54.b		; 00 54
	txs		; 9A
	tsb $5400.w		; 0C 00 54
	txs		; 9A
	tsb $CC00.w		; 0C 00 CC
	ldy #$000C.w		; A0 0C 00
	mvn $0C,$9A		; 54 9A 0C
	brk $CC.b		; 00 CC
	ldy #$000C.w		; A0 0C 00
	cpy $0CA0.w		; CC A0 0C
	brk $90.b		; 00 90
	lda [$0C.b]		; A7 0C
	brk $CC.b		; 00 CC
	ldy #$000C.w		; A0 0C 00
	bcc -89.b		; 90 A7
	tsb $9000.w		; 0C 00 90
	lda [$0C.b]		; A7 0C
	brk $C0.b		; 00 C0
	ldx $000C.w		; AE 0C 00
	bcc -89.b		; 90 A7
	tsb $C000.w		; 0C 00 C0
	ldx $000C.w		; AE 0C 00
	cpy #$0CAE.w		; C0 AE 0C
	brk $40.b		; 00 40
	lda [$0C.b],Y		; B7 0C
	brk $10.b		; 00 10
	dec $000C.w,X		; DE 0C 00
	pea $0CE7.w		; F4 E7 0C
	brk $40.b		; 00 40
	lda [$0C.b],Y		; B7 0C
	brk $FC.b		; 00 FC
	lda $FC000C.l,X		; BF 0C 00 FC
	lda $34000C.l,X		; BF 0C 00 34
	cmp #$000C.w		; C9 0C 00
	jsr ($0CBF.w,X)		; FC BF 0C
	brk $34.b		; 00 34
	cmp #$000C.w		; C9 0C 00
	beq -15.b		; F0 F1
	asl $5800.w,X		; 1E 00 58
	jsr ($001E.w,X)		; FC 1E 00
	bit $C9.b,X		; 34 C9
	tsb $AC00.w		; 0C 00 AC
	cmp ($0C.b,S),Y		; D3 0C
	brk $AC.b		; 00 AC
	cmp ($0C.b,S),Y		; D3 0C
	brk $10.b		; 00 10
	dec $000C.w,X		; DE 0C 00
	bit $C9.b,X		; 34 C9
	tsb $AC00.w		; 0C 00 AC
	cmp ($0C.b,S),Y		; D3 0C
	brk $10.b		; 00 10
	dec $000C.w,X		; DE 0C 00
	pea $0CE7.w		; F4 E7 0C
	brk $F4.b		; 00 F4
	sbc [$0C.b]		; E7 0C
	brk $AC.b		; 00 AC
	sbc ($0C.b)		; F2 0C
	brk $AC.b		; 00 AC
	sbc ($0C.b)		; F2 0C
	brk $24.b		; 00 24
	sbc $000C.w,X		; FD 0C 00
	beq -15.b		; F0 F1
	asl $5800.w,X		; 1E 00 58
	jsr ($001E.w,X)		; FC 1E 00
	beq -15.b		; F0 F1
	asl $5800.w,X		; 1E 00 58
	jsr ($001E.w,X)		; FC 1E 00
L008784:
.ACCU 16
.INDEX 16
	rep #$30
	lda $12A9.w
	pha
	lda $12AB.w
	pha
	stz $12AB.w
	stz $12A9.w
	jsl L000420.l
	inc $1CB0.w
	jsl L00050F.l
	stz $1E2E.w
	stz $1E3C.w
	jsl L0023A5.l
	jsl L000819.l
.ACCU 8
	sep #$20
	lda #$04.b
	sta TMAIN.w		; Mainscreen Designation
.ACCU 16
	rep #$20
	lda #$0000.w
	jsr L00A9CB.w
	lda #$0000.w
	jsr L00A9F2.w
	jsr L009D07.w
	jsl L000521.l
	jsr L008A50.w
	jsr L0089AD.w
	lda $1406.w
	sta $1470.w
	lda $1444.w
	sta $1472.w
	lda $1446.w
	sta $1474.w
	lda $1408.w
	sta $1476.w
	lda $1442.w
	sta $1478.w
	lda $1416.w
	sta $147A.w
	jsl L00050F.l
	jsl L0023A5.l
	jsl L0117FE.l
	stz $1CB0.w
	pla
	sta $12AB.w
	pla
	sta $12A9.w
	jmp L008CA2.w
	eor $55.b,S		; 43 55
	eor ($54.b,S),Y		; 53 54
	eor $5A494D.l		; 4F 4D 49 5A
	eor $20.b		; 45 20
	eor $41.b,S		; 43 41
	eor ($00.b)		; 52 00
	eor ($75.b,X)		; 41 75
	stz $6F.b,X		; 74 6F
	adc ($68.b,S),Y		; 73 68
	adc #$7466.w		; 69 66 74
	brk $43.b		; 00 43
	adc ($72.b,X)		; 61 72
	jsr $6548.w		; 20 48 65
	adc #$6867.w		; 69 67 68
	stz $00.b,X		; 74 00
	mvp $61,$72		; 44 72 61
	adc [$20.b]		; 67 20
	eor $6F.b,S		; 43 6F
	adc $66.b		; 65 66
	ror $00.b		; 66 00
	eor ($63.b,X)		; 41 63
	adc $65.b,S		; 63 65
	jmp ($4320.w)		; 6C 20 43
	adc $666665.l		; 6F 65 66 66
	brk $42.b		; 00 42
	adc ($61.b)		; 72 61
	rtl		; 6B

	adc $20.b		; 65 20
	eor $6F.b,S		; 43 6F
	adc $66.b		; 65 66
	ror $00.b		; 66 00
	eor $7861.w		; 4D 61 78
	jsr $2047.w		; 20 47 20
	lsr $6F.b		; 46 6F
	adc ($63.b)		; 72 63
	adc $00.b		; 65 00
	eor ($63.b,S),Y		; 53 63
	adc ($75.b)		; 72 75
	.db $62, $20, $52		; 62 20 52
	adc ($74.b,X)		; 61 74
	adc $00.b		; 65 00
	bmi  45.b		; 30 2D
	rol $30.b,X		; 36 30
	brk $30.b		; 00 30
	and $3031.w		; 2D 31 30
	bmi   0.b		; 30 00
	and ($2F.b),Y		; 31 2F
	bit $20.b,X		; 34 20
	eor $6C69.w		; 4D 69 6C
	adc $00.b		; 65 00
	and ($2F.b),Y		; 31 2F
	bit $20.b,X		; 34 20
	eor ($70.b,S),Y		; 53 70
	adc $65.b		; 65 65
	stz $00.b		; 64 00
	mvn $70,$6F		; 54 6F 70
	jsr $7053.w		; 20 53 70
	adc $65.b		; 65 65
	stz $00.b		; 64 00
	mvn $70,$6F		; 54 6F 70
	jsr $6954.w		; 20 54 69
	adc $0065.w		; 6D 65 00
	jmp $7669.w		; 4C 69 76
	adc $73.b		; 65 73
	brk $00.b		; 00 00
	brk $1B.b		; 00 1B
	dey		; 88
	and $88.b		; 25 88
	bmi -120.b		; 30 88
	tsa		; 3B
	dey		; 88
	eor [$88.b]		; 47 88
	eor ($88.b,S),Y		; 53 88
	eor $1C7488.l,X		; 5F 88 74 1C
	asl $14.b		; 06 14
	.db $42, $14		; 42 14
	mvp $46,$14		; 44 14 46
	trb $08.b		; 14 08
	trb $16.b		; 14 16
	trb $EA.b		; 14 EA
	asl $1EEC.w,X		; 1E EC 1E
	inc $F01E.w		; EE 1E F0
	asl $1CEE.w,X		; 1E EE 1C
	sbc ($1E.b)		; F2 1E
	stx $1C.b		; 86 1C
	brk $00.b		; 00 00
	ora ($00.b,X)		; 01 00
	bit $7800.w,X		; 3C 00 78
	brk $58.b		; 00 58
	cop $84.b		; 02 84
	ora $C8.b,S		; 03 C8
	brk $F4.b		; 00 F4
	ora ($96.b,X)		; 01 96
	brk $90.b		; 00 90
	ora ($58.b,X)		; 01 58
	tas		; 1B
	bpl  39.b		; 10 27
	brk $00.b		; 00 00
	asl $0000.w,X		; 1E 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $64.b		; 00 64
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $01.b		; 00 01
	brk $0A.b		; 00 0A
	brk $05.b		; 00 05
	brk $32.b		; 00 32
	brk $05.b		; 00 05
	brk $32.b		; 00 32
	brk $05.b		; 00 05
	brk $32.b		; 00 32
	brk $0A.b		; 00 0A
	brk $64.b		; 00 64
	brk $01.b		; 00 01
	brk $03.b		; 00 03
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
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
	brk $05.b		; 00 05
	.db $00		; Opcode overrunning section
L00893D:
	jsr L00896E.w
	stx $1E30.w
	clc		; Clear carry
	adc $1E30.w
	cmp $1E38.w
	beq L008951.b
	bcc L008951.b
	lda $1E3A.w
L008951:
	jsr L00899D.w
	rts

L008955:
	jsr L00896E.w
	stx $1E30.w
	sec		; Set carry
	sbc $1E30.w
	bcc L008966.b
	cmp $1E3A.w
	bcs L00896A.b
L008966:
	lda $1E38.w
	dec A
L00896A:
	jsr L00899D.w
	rts

L00896E:
	stx $1E30.w
	lda $1E3C.w
	asl A
	tax
	asl A
	tay
	lda $0188B1.l,X
	tax
	lda $0000.w,X
	pha
	tyx
	lda $0188CD.l,X
	sta $1E3A.w
	lda $0188CF.l,X
	sta $1E38.w
	txa
	clc		; Clear carry
	adc $1E30.w
	tax
	lda $018905.l,X
	tax
	pla
	rts

L00899D:
	pha
	lda $1E3C.w
	asl A
	tax
	lda $0188B1.l,X
	tax
	pla
	sta $0000.w,X
	rts

L0089AD:
	lda $0962.w
	beq L0089AD.b
	jsr L0089BE.w
	ldx #$0006.w
	jsl L00040D.l
	bra L0089AD.b
L0089BE:
	bit #$0800.w
	beq L0089FB.b
	lda $1E3C.w
	beq L0089EB.b
	pha
	dec A
L0089CA:
	sta $1E3C.w
	cmp $1E2E.w
	bcc L0089F3.b
	lda $1E2E.w
	clc		; Clear carry
	adc #$0006.w
	cmp $1E3C.w
	bcc L0089EC.b
	lda $1E3C.w
	jsr L008AAA.w
	pla
	jsr L008AAA.w
	jsr L008A7F.w
L0089EB:
	rts

L0089EC:
	lda $1E3C.w
	sec		; Set carry
	sbc #$0006.w
L0089F3:
	sta $1E2E.w
	pla
	jsr L008A50.w
	rts

L0089FB:
	bit #$0400.w
	beq L008A0C.b
	lda $1E3C.w
	cmp #$0006.w
	beq L0089EB.b
	pha
	inc A
	bra L0089CA.b
L008A0C:
	bit #$1000.w
	beq L008A13.b
	pla
	rts

L008A13:
	bit #$0200.w
	beq L008A28.b
	ldx #$0000.w
	jsr L008955.w
L008A1E:
	lda $1E3C.w
	jsr L008AAA.w
	jsr L008A7F.w
	rts

L008A28:
	bit #$0100.w
	beq L008A35.b
	ldx #$0000.w
	jsr L00893D.w
	bra L008A1E.b
L008A35:
	bit #$0020.w
	beq L008A42.b
	ldx #$0002.w
	jsr L008955.w
	bra L008A1E.b
L008A42:
	bit #$0010.w
	beq L008A4F.b
	ldx #$0002.w
	jsr L00893D.w
	bra L008A1E.b
L008A4F:
	rts

L008A50:
.ACCU 16
.INDEX 16
	rep #$30
	phk
	plb
	stz $20.b
	lda #$880D.w
	sta $0C.b
	lda #$0001.w
	sta $0E.b
	ldx #$0009.w
	ldy #$0002.w
	lda #$1800.w
	jsl L000798.l
	lda #$0000.w
L008A70:
	pha
	clc		; Clear carry
	adc $1E2E.w
	jsr L008AAA.w
	pla
	inc A
	cmp #$0007.w
	bcc L008A70.b
L008A7F:
.INDEX 8
	sep #$10
	ldx $54.b
	lda #$0001.w
	sta $0600.w,X
	lda #$7E78.w
	sta $0602.w,X
	lda #$0800.w
	sta $0604.w,X
	lda #$1000.w
	sta $0606.w,X
.ACCU 8
	sep #$20
	txa
	clc		; Clear carry
	adc #$08.b
	sta $54.b
.ACCU 16
.INDEX 16
	rep #$30
	jsl L0003AB.l
	rts

L008AAA:
	php
	pha
	ldx #$1000.w
	cmp $1E3C.w
	bne L008AB7.b
	ldx #$1400.w
L008AB7:
	stx $1E32.w
	sec		; Set carry
	sbc $1E2E.w
	tay
	iny
	iny
	iny
	iny
	iny
	sty $1E.b
	pla
	pha
	asl A
	tax
	phx
	lda #$0014.w
	sta $20.b
	lda $0188A3.l,X
	sta $0C.b
	lda #$0001.w
	sta $0E.b
	ldx #$0003.w
	ldy $1E.b
	lda $1E32.w
	jsl L000798.l
	ldy $1E.b
	plx
	lda $0188B1.l,X
	tax
	lda $0000.w,X
	jsr L00B0AF.w
	pla
	plp
	rts

L008AF8:
	php
.ACCU 8
.INDEX 8
	sep #$30
	lda #$01.b
	sta $1E56.w
	sta $1C78.w
	sta $1E6E.w
	inc A
	sta $1E5E.w
	sta $1E76.w
	ldy #$06.b
	ldx #$00.b
L008B11:
	lda #$41.b
	sta $1E4F.w,X
	sta $1E50.w,X
	sta $1E51.w,X
	txa
	clc		; Clear carry
	adc #$08.b
	tax
	dey
	bne L008B11.b
	plp
	rtl

L008B26:
.ACCU 16
.INDEX 16
	rep #$30
	stz $1E2C.w
	jsr L009D1C.w
L008B2E:
	jsr L009C3E.w
L008B31:
	jsr L00BAE8.w
	cmp #$FFFF.w
	beq L008B2E.b
	cpx #$0001.w
	beq L008B87.b
L008B3E:
	lda #$0003.w
	sta $1C84.w
	lda $1C78.w
	sta $0202.w
	jsr L00BBCB.w
	cmp #$FFFF.w
	bne L008B57.b
	stz $0996.w
	bra L008B31.b
L008B57:
	lda $0202.w
	sta $1C78.w
L008B5D:
	jsr L00C20B.w
	cmp #$FFFF.w
	bne L008B6F.b
	lda $0996.w
	beq L008B3E.b
	stz $0996.w
	bra L008B31.b
L008B6F:
	lda #$0004.w
	sta $1C84.w
	jsr L00BE76.w
	cmp #$FFFF.w
	bne L008B87.b
	lda $0996.w
	beq L008B5D.b
	stz $0996.w
	bra L008B31.b
L008B87:
	lda $1C6C.w
	ldx #$0001.w
	cmp #$0002.w
	bcc L008B95.b
	ldx #$0000.w
L008B95:
	stx $1C74.w
	ldx #$0001.w
	lda $1C70.w
	cmp #$0003.w
	bne L008BA7.b
	dex
	lda #$0000.w
L008BA7:
	stx $1C76.w
	sta $1C7A.w
	lda $0996.w
	beq L008BB8.b
	lda #$0001.w
	sta $1C74.w
L008BB8:
	lda $1C90.w
	asl A
	asl A
	adc $1C90.w
	asl A
	tax
	lda $0185F6.l,X
	sta $1C92.w
	lda $0185F8.l,X
	sta $1C94.w
	lda $0185FA.l,X
	sta $1C96.w
	lda $0185FC.l,X
	sta $1C98.w
	lda $0185FE.l,X
	sta $1C9A.w
	lda $1C7C.w
	asl A
	tax
	lda $018000.l,X
	sta $1C7E.w
	lda $018008.l,X
	sta $1C80.w
	lda #$0005.w
	sta $1C86.w
	stz $1CA8.w
	stz $1C88.w
	stz $1C8A.w
	stz $1C8C.w
	stz $1C8E.w
	stz $146E.w
L008C10:
	lda #$FFFF.w
	sta $1E3E.w
	sta $1CB0.w
	jsl L002336.l
	lda $1C72.w
	inc A
	pha
	jsl L009BA0.l
	pla
	jsl L009C14.l
	lda $1CA8.w
	clc		; Clear carry
	adc $1C7E.w
	sta $1C82.w
	asl A
	tax
	lda $018016.l,X
	sta $1CAC.w
	lda $01807E.l,X
	sta $1CCA.w
	lda $0180B2.l,X
	sta $1CFA.w
	lda $01804A.l,X
	sta $1CAA.w
	lda $0180E8.l,X
	sta $1CE2.w
	lda $01811C.l,X
	sta $1CE4.w
	lda $018150.l,X
	sta $1CE6.w
	lda $018184.l,X
	lsr A
	lsr A
	sta $1CB8.w
	lda $0181B8.l,X
	sta $1CBE.w
	lda $018220.l,X
	sta $1CBA.w
	lda $0181EC.l,X
	sta $1CBC.w
	lda $018254.l,X
	sta $1CC2.w
	lda $0182C8.l,X
	sta $1CCC.w
	lda $0182FC.l,X
	sta $1CCE.w
	lda $018330.l,X
	sta $1CD0.w
L008CA2:
	jsl L00050F.l
.ACCU 8
.INDEX 8
	sep #$30
	lda #$21.b
	sta BGMODE.w		; BG Mode and Character Size
	lda #$01.b
	sta BG1SC.w		; BG1 Tilemap Address and Size
	lda #$0B.b
	sta BG2SC.w		; BG2 Tilemap Address and Size
	lda #$19.b
	sta BG3SC.w		; BG3 Tilemap Address and Size
	lda #$23.b
	sta BG12NBA.w		; BG1&2 Tilemap Character Address
	lda #$35.b
	sta BG34NBA.w		; BG3&4 Tilemap Character Address
	lda #$17.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$03.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
.INDEX 16
	rep #$30
	lda #$FFFF.w
	sta $1E24.w
	sta $1E26.w
	sta $1E28.w
	stz $11AB.w
	ldx #$0000.w
	lda $1CE2.w
	beq L008CF9.b
	inx
	ldy $1CE4.w
	beq L008CF3.b
	inx
	inx
	bra L008CF9.b
L008CF3:
	cmp #$000B.w
	bcc L008CF9.b
	inx
L008CF9:
	txa
	asl A
	sta $1D1C.w
	ldx #$0000.w
	lda $1CE6.w
	beq L008D09.b
	inx
	bra L008D16.b
L008D09:
	lda $1CE2.w
	beq L008D16.b
	inx
	inx
	lda $1CE4.w
	beq L008D16.b
	inx
L008D16:
	txa
	asl A
	asl A
	asl A
	beq L008D1D.b
	inc A
L008D1D:
	sta $1CAE.w
	lda $1CCA.w
	asl A
	tax
	lda $018010.l,X
	sta $1CEA.w
	sta $1CEC.w
	bpl L008D8F.b
.ACCU 8
	sep #$20
	lda #$03.b
	sta BG1SC.w		; BG1 Tilemap Address and Size
	lda #$11.b
	sta BG2SC.w		; BG2 Tilemap Address and Size
	lda #$06.b
	sta TSW.w		; Window Mask Designation for the Subscreen
	lda #$20.b
	sta W12SEL.w		; Window Mask Settings for BG1 and BG2
	sta WOBJSEL.w		; Window Mask Settings for Objects and Color Window
	lda #$02.b
	sta W34SEL.w		; Window Mask Settings for BG3 and BG4
	lda #$EF.b
	sta COLDATA.w		; Fixed Color Data
.ACCU 16
	rep #$20
	lda #$0400.w
	sta $0992.w
	lda #$1000.w
	sta $0990.w
	lda $0185DE.l,X
	sta $0C.b
	lda #$0009.w
	sta $0E.b
	ldx #$0000.w
	txy
	jsl L0005AC.l
	lda #$0017.w
	jsr L00A9CB.w
	lda #$000B.w
	jsr L00A9F2.w
	lda #$0015.w
	jsr L00A9A0.w
	lda #$0015.w
	jsr L00A9CB.w
	bra L008DBA.b
L008D8F:
	lda #$0400.w
	sta $0992.w
	lda #$0800.w
	sta $0990.w
	lda $0185DE.l,X
	sta $0C.b
	lda #$0009.w
	sta $0E.b
	ldx #$0000.w
	txy
	jsl L0005AC.l
	lda #$0016.w
	jsr L00A9CB.w
	lda #$000B.w
	jsr L00A9F2.w
L008DBA:
	lda $1CCA.w
	asl A
	tax
	lda $0185E4.l,X
	sta $0C.b
	lda #$0008.w
	sta $0E.b
	lda #$1F80.w
	ldx #$2000.w
	jsl L0006C9.l
	lda $1C78.w
	clc		; Clear carry
	adc #$000C.w
	jsr L00A9F2.w
	lda $1C78.w
	asl A
	asl A
	tax
	lda $0185C6.l,X
	sta $0C.b
	lda $0185C8.l,X
	sta $0E.b
	stz $0990.w
	ldx #$0000.w
	txy
	jsl L0005AC.l
	lda $1C78.w
	asl A
	asl A
	tax
	lda $0185D2.l,X
	sta $0C.b
	lda $0185D4.l,X
	sta $0E.b
	lda #$3920.w
	ldx #$3000.w
	jsl L0006C9.l
	lda $1CAC.w
	bit $1CEA.w
	bpl L008E22.b
	lda #$0008.w
L008E22:
	pha
	asl A
	tax
	phx
	lda $018564.l,X
	sta $0C.b
	lda #$0007.w
	sta $0E.b
	lda #$1800.w
	sta $0990.w
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	ldx #$0000.w
	txy
	jsl L0005AC.l
	plx
	lda $018576.l,X
	sta $0C.b
	lda #$0007.w
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	ldx #$5000.w
	jsl L0006C9.l
	pla
	clc		; Clear carry
	adc $1CAE.w
	sta $1CAE.w
	asl A
	tax
	lda $018588.l,X
	sta $0C.b
	lda #$0006.w
	sta $0E.b
	lda #$0000.w
	ldx #$0020.w
	jsl L000583.l
	lda #$0009.w
	jsr L00A9F2.w
	lda $1CE6.w
	beq L008EAE.b
	lda #$0017.w
	jsr L00A9CB.w
	lda #$EFDE.w
	sta $0C.b
	lda #$000D.w
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	ldx #$4D00.w
	jsl L0006C9.l
L008EAE:
	lda #$003F.w
	sta $19FE.w
	lda #$0000.w
	asl A
	asl A
	asl A
	tax
	lda $018364.l,X
	sta $0C.b
	lda $018366.l,X
	sta $0E.b
	lda $018368.l,X
	sta $1A14.w
	lda $01836A.l,X
	sta $1A26.w
	lda #$003F.w
	sta $1A02.w
	lda #$0090.w
	ldx #$0010.w
	jsl L000583.l
	lda $1C7A.w
	asl A
	asl A
	asl A
	tax
	lda $018384.l,X
	sta $0C.b
	lda $018386.l,X
	sta $0E.b
	lda $018388.l,X
	sta $1A12.w
	lda $01838A.l,X
	sta $1A24.w
	lda #$003F.w
	sta $1A00.w
	lda #$00A0.w
	ldx #$0010.w
	jsl L000583.l
	lda $1CCC.w
	asl A
	tax
	lda $0182BC.l,X
	sta $1A04.w
	sta $1A0A.w
	txa
	asl A
	tax
	lda $01836C.l,X
	sta $0C.b
	lda $01836E.l,X
	sta $0E.b
	txa
	sta $14.b
	asl A
	asl A
	adc $14.b
	sta $1A16.w
	sta $1A1C.w
	lda #$00B0.w
	ldx #$0010.w
	jsl L000583.l
	lda $1CCE.w
	asl A
	tax
	lda $0182BC.l,X
	sta $1A06.w
	sta $1A0C.w
	txa
	asl A
	tax
	lda $01836C.l,X
	sta $0C.b
	lda $01836E.l,X
	sta $0E.b
	txa
	sta $14.b
	asl A
	asl A
	adc $14.b
	sta $1A18.w
	sta $1A1E.w
	lda #$00C0.w
	ldx #$0010.w
	jsl L000583.l
	lda $1CD0.w
	asl A
	tax
	lda $0182BC.l,X
	sta $1A08.w
	sta $1A0E.w
	txa
	asl A
	tax
	lda $01836C.l,X
	sta $0C.b
	lda $01836E.l,X
	sta $0E.b
	txa
	sta $14.b
	asl A
	asl A
	adc $14.b
	sta $1A1A.w
	sta $1A20.w
	lda #$00D0.w
	ldx #$0010.w
	jsl L000583.l
	lda $1C82.w
	asl A
	asl A
	asl A
	asl A
	tax
	lda $0183C0.l,X
	sta $1CD2.w
	lda $0183C2.l,X
	sta $1CD4.w
	lda $0183C4.l,X
	sta $1CD6.w
	lda $0183C6.l,X
	sta $1CD8.w
	lda $0183C8.l,X
	sta $1CDA.w
	lda $0183CA.l,X
	sta $1CDC.w
	lda $0183CC.l,X
	sta $1CDE.w
	lda $0183CE.l,X
	sta $1CE0.w
	lda $1CAC.w
	bit $1CEA.w
	bpl L009000.b
	lda #$0008.w
L009000:
	asl A
	asl A
	tax
	lda $01839C.l,X
	sta $0C.b
	lda $01839E.l,X
	sta $0E.b
	txa
	sta $14.b
	asl A
	sta $1CB4.w
	asl A
	adc $14.b
	asl A
	sta $1CB2.w
	lda #$00E0.w
	ldx #$0020.w
	jsl L000583.l
	lda $1C78.w
	asl A
	asl A
	asl A
	asl A
	asl A
	adc #$8614.w
	sta $0C.b
	lda #$0001.w
	sta $0E.b
	ldx #$60B0.w
	lda #$0020.w
	jsl L0006C9.l
	lda $1C7A.w
	asl A
	asl A
	asl A
	asl A
	asl A
	adc #$8614.w
	sta $0C.b
	ldx #$60C0.w
	lda #$0020.w
	jsl L0006C9.l
	lda #$8674.w
	sta $0C.b
	ldx #$60D0.w
	lda #$0040.w
	jsl L0006C9.l
	lda $1E3E.w
	bpl L009075.b
	stz $1EE6.w
	jsl L0110B2.l
L009075:
	stz $1E3E.w
	jsl L0113DF.l
	lda $1C78.w
	asl A
	tax
	lda #$0003.w
	sta $12.b
	lda $0185F0.l,X
	sta $10.b
	lda #$0000.w
	sta $00.b
	lda #$0029.w
	jsl L001895.l
	lda #$0007.w
	sta $00.b
	lda #$002A.w
	jsl L001895.l
	jsl L00158F.l
	jsl L0015BD.l
	jsl L0003AB.l
	lda $1CE8.w
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$1000.w
	clc		; Clear carry
	adc #$0008.w
	sta $0738.w
	lda #$300B.w
	sta $072E.w
	lda #$300C.w
	sta $0732.w
	lda #$300D.w
	sta $0736.w
	lda #$300E.w
	sta $073A.w
	lda #$0056.w
	sta $0F30.w
	ldx #$96A0.w
	lda #$0001.w
	ldy #$0017.w
	jsl L000341.l
	lda #$0002.w
	ldx #$9016.w
	jsl L000385.l
	lda #$0002.w
	ldx #$8F3C.w
	jsl L0003A0.l
	lda $0972.w
	sec		; Set carry
	sbc #$01F4.w
	sta $0972.w
	stz $1CB0.w
	jsl L000521.l
L009111:
	lda $1CBE.w
	sta $1CC0.w
	lda $11F1.w
	tay
	lsr A
	and #$FFFE.w
	tax
	lda $1CEA.w
	beq L00912C.b
	lda $7E6000.l,X
	and #$8000.w
L00912C:
	sta $1396.w
	lda #$0014.w
	jsl L002212.l
	lda #$0015.w
	jsl L002212.l
	lda $0F77.w
	bne L009149.b
	lda #$002B.w
	jsl L002212.l
L009149:
	lda $1CE6.w
	beq L009162.b
	lda #$0DEC.w
	sta $0D.b
	lda #$ECDE.w
	sta $0C.b
	lda #$0300.w
	ldx #$0060.w
	jsl L0006ED.l
L009162:
.ACCU 16
.INDEX 16
	rep #$30
	lda $118F.w
	bne L0091E1.b
	lda $1195.w
	beq L009185.b
	lda $11CD.w
	bne L009185.b
	lda $12EA.w
	beq L00917D.b
	lda $11CF.w
	bne L009185.b
L00917D:
	lda $1191.w
	sta $118F.w
	bra L0091E1.b
L009185:
	jsl L011165.l
	lda $09A2.w
	pha
	phk
	plb
	lda $1C78.w
	asl A
	tax
	lda #$0003.w
	sta $12.b
	lda $0185F0.l,X
	sta $10.b
	stz $30.b
	stz $34.b
	lda #$00E0.w
	sta $32.b
	sta $36.b
	jsr L00993E.w
	jsr L00999D.w
	jsr L0095DB.w
	jsr L009825.w
	jsr L009868.w
	pla
	sta $09A2.w
	jsl L0015BD.l
	lda $0962.w
	bit #$0020.w
	beq L009162.b
	bit #$0010.w
	beq L009162.b
	jmp L008784.w
	lda $DCB9DF.l,X		; BF DF B9 DC
	lda ($D9.b,S),Y		; B3 D9
	lda $A7D6.w		; AD D6 A7
	cmp ($A1.b,S),Y		; D3 A1
	bne -101.b		; D0 9B
	cmp $CA95.w		; CD 95 CA
L0091E1:
	ldx #$0100.w
	stx $10B9.w
	stz $12A1.w
	stz $0998.w
.ACCU 8
	sep #$20
	stz $0F76.w
.ACCU 16
	rep #$20
	ldx $0996.w
	bne L00922E.b
	cmp #$0001.w
	bne L009201.b
	jmp L0093A6.w
L009201:
	cmp #$0002.w
	bne L009209.b
	jmp L0093A6.w
L009209:
	cmp #$FFFF.w
	beq L009211.b
	jmp L00924B.w
L009211:
	jsl L00050F.l
	jsl L002336.l
	jsl L0023A5.l
	lda #$0000.w
	jsl L009BA0.l
	lda #$0000.w
	jsl L009C14.l
	jmp L008B31.w
L00922E:
	jsl L00050F.l
	jsl L002336.l
	jsl L0023A5.l
	lda #$0000.w
	jsl L009BA0.l
	lda #$0000.w
	jsl L009C14.l
	jmp L008B2E.w
L00924B:
	pha
	lda #$0014.w
	jsl L0022B4.l
	lda #$002B.w
	jsl L0022B4.l
	pla
	cmp #$0003.w
	beq L00929C.b
	cmp #$0007.w
	beq L00929C.b
L009265:
	lda $096A.w
	bne L009265.b
	jsl L00158F.l
	jsl L0110BE.l
	jsl L0003AB.l
	ldx $1197.w
	cpx #$0010.w
	bne L009265.b
	jsl L000401.l
	ldy #$FFFF.w
	jsl L0003C0.l
	jsl L000401.l
	lda $1CCA.w
	asl A
	tax
	lda $018010.l,X
	sta $1CEA.w
	jmp L0092C4.w
L00929C:
	stz $1E34.w
L00929F:
	lda $096A.w
	bne L00929F.b
	jsl L00158F.l
	jsl L0110BE.l
	jsl L010930.l
	lda $1E34.w
	bne L0092BF.b
	lda $0960.w
	bne L00929F.b
	inc $1E34.w
	bra L00929F.b
L0092BF:
	lda $0960.w
	beq L00929F.b
L0092C4:
	lda $1C86.w
	bpl L0092CC.b
	jmp L0093A6.w
L0092CC:
	bne L0092D1.b
	jmp L0093A6.w
L0092D1:
	jsl L0023A5.l
	lda #$0300.w
	ldy #$0060.w
	ldx #$0000.w
	jsl L000715.l
	jsl L0003AB.l
	lda $0964.w
	sta $12A7.w
	lda $1CC4.w
	clc		; Clear carry
	adc #$0080.w
	sta $11DF.w
	lda #$0400.w
	sta $1C9C.w
	lda #$0001.w
	sta $1E2A.w
	stz $137C.w
	lda $1426.w
	sta $1C9E.w
	sta $1CA2.w
	lda $1434.w
	sta $1CA0.w
	sta $1CA4.w
	lda $141A.w
	sta $1CA6.w
	lda $118F.w
	pha
	ldx #$004E.w
L009324:
	stz $117D.w,X
	dex
	dex
	bpl L009324.b
	lda $1CA8.w
	clc		; Clear carry
	adc $1C7E.w
	asl A
	tax
	lda $018254.l,X
	sta $1CC2.w
	stz $11CD.w
	pla
	cmp #$0007.w
	beq L009395.b
	stz $129D.w
	jsl L011BD0.l
	lda #$FFFE.w
	sta $125D.w
	sta $125F.w
	ldy $129B.w
	ldx #$0000.w
L00935A:
	lda $1281.w,X
	cmp #$0006.w
	bcc L009390.b
	dec $129F.w
	dec $129B.w
	phx
	phy
L00936A:
	dey
	beq L00938C.b
	lda $1283.w,X
	sta $1281.w,X
	bne L00937D.b
	dec $126F.w
	dec $126F.w
	bra L009388.b
L00937D:
	cmp #$0002.w
	bne L009388.b
	dec $1271.w
	dec $1271.w
L009388:
	inx
	inx
	bra L00936A.b
L00938C:
	ply
	plx
	dex
	dex
L009390:
	inx
	inx
	dey
	bne L00935A.b
L009395:
	stz $D0.b
	stz $D6.b
	stz $D4.b
	stz $D2.b
	lda #$0001.w
	sta $12A1.w
	jmp L009111.w
L0093A6:
.ACCU 16
.INDEX 16
	rep #$30
	jsl L00050F.l
	lda $0F77.w
	bne L0093CD.b
	jsl L0023A5.l
	lda $1C86.w
	beq L0093CD.b
	bmi L0093CD.b
	lda #$0023.w
	jsl L002212.l
	ldx #$0048.w
	ldy #$0000.w
	jsl L0003B4.l
L0093CD:
	jsl L002336.l
	jsl L0023A5.l
	lda $12D8.w
	clc		; Clear carry
	adc $12E0.w
	adc $12DC.w
	ldx #$04B0.w
	jsl L0008CB.l
	lda $08.b
	sta $1D18.w
	lda $1CE8.w
	sec		; Set carry
	sbc #$002D.w
	sta $1CE8.w
	lda $11F1.w
	sec		; Set carry
	sbc #$002D.w
	cmp $1CE8.w
	bcc L009404.b
	lda $1CE8.w
L009404:
	sta $1D12.w
	asl A
	stz $08.b
	sta $0A.b
	inc $12A3.w
	lda $12A3.w
	clc		; Clear carry
	adc $1D18.w
	sta $04.b
	jsl L000A24.l
	lda $00.b
	sta $1D10.w
	lda $1D10.w
	ldx #$2710.w
	jsl L000926.l
	lda $1CEE.w
	sta $04.b
	jsl L000A24.l
	lda $00.b
	sta $1D08.w
	ldx $1D10.w
	lda #$0005.w
	jsl L000AFE.l
	clc		; Clear carry
	adc $1D08.w
	sta $1D08.w
	ldx $1C6C.w
	lda $018560.l,X
	and #$00FF.w
	ldx $1D08.w
	jsl L0008CB.l
	lda $09.b
	ldx $1D12.w
	jsl L000926.l
	lda $1CE8.w
	sta $04.b
	jsl L000A24.l
	lda $00.b
	sta $1D08.w
	clc		; Clear carry
	adc $1C88.w
	sta $1C88.w
	lda $1C8A.w
	adc #$0000.w
	sta $1C8A.w
	lda $1C76.w
	bne L00948A.b
	jmp L009568.w
L00948A:
	lda $12DA.w
	ldx #$04B0.w
	jsl L0008CB.l
	lda $08.b
	sta $1D1A.w
	lda $11F3.w
	sec		; Set carry
	sbc #$002D.w
	cmp $1CE8.w
	bcc L0094A8.b
	lda $1CE8.w
L0094A8:
	sta $1D16.w
	inc $12A5.w
	lda $1C86.w
	beq L0094ED.b
	ldx $11CF.w
	lda $1CF2.w
	jsl L000AFE.l
	clc		; Clear carry
	adc $12A5.w
	sta $1D0C.w
	lda $1CE8.w
	ldx $12A5.w
	jsl L000926.l
	lda $1D16.w
	bne L0094D4.b
	inc A
L0094D4:
	sta $04.b
	jsl L000A24.l
	lda $00.b
	cmp $1D0C.w
	bcs L0094E4.b
	lda $1D0C.w
L0094E4:
	sta $12A5.w
	lda $1CE8.w
	sta $1D16.w
L0094ED:
	lda $1D16.w
	asl A
	stz $08.b
	sta $0A.b
	lda $12A5.w
	clc		; Clear carry
	adc $1D1A.w
	sta $04.b
	jsl L000A24.l
	lda $00.b
	sta $1D14.w
	lda $1D14.w
	ldx #$2710.w
	jsl L000926.l
	lda $1CF0.w
	sta $04.b
	jsl L000A24.l
	lda $00.b
	sta $1D0C.w
	ldx $1D14.w
	lda #$0005.w
	jsl L000AFE.l
	clc		; Clear carry
	adc $1D0C.w
	sta $1D0C.w
	ldx $1C6C.w
	lda $018560.l,X
	and #$00FF.w
	ldx $1D0C.w
	jsl L0008CB.l
	lda $09.b
	ldx $1D16.w
	jsl L000926.l
	lda $1CE8.w
	sta $04.b
	jsl L000A24.l
	lda $00.b
	sta $1D0C.w
	clc		; Clear carry
	adc $1C8C.w
	sta $1C8C.w
	lda $1C8E.w
	adc #$0000.w
	sta $1C8E.w
L009568:
	inc $1CA8.w
	lda $1C86.w
	beq L009575.b
	bmi L009575.b
	jsr L00B1F9.w
L009575:
	lda $0F77.w
	bne L009599.b
	lda #$0000.w
	jsl L009BA0.l
	lda #$0029.w
	jsl L002212.l
	ldx #$0070.w
	ldy #$0000.w
	jsl L0003B4.l
	lda #$0000.w
	jsl L009C14.l
L009599:
	jsr L00B75E.w
	lda $1D10.w
	cmp #$4100.w
	bcc L0095C7.b
	lda $1C86.w
	bmi L0095C7.b
	bne L0095D0.b
	bra L0095C7.b
L0095AD:
	inc $1CA8.w
	jsl L002336.l
	jsr L00B1F9.w
	lda #$0000.w
	jsl L009BA0.l
	lda #$0000.w
	jsl L009C14.l
	bra L0095C7.b
L0095C7:
	jsr L00A5AE.w
	jsr L00A3CC.w
	jmp L008B31.w
L0095D0:
	lda $1CA8.w
	cmp $1C80.w
	beq L0095AD.b
	jmp L008C10.w
L0095DB:
	lda $11AD.w
	beq L0095E5.b
	dec A
	sta $11AD.w
	rts

L0095E5:
	lda $D6.b
	cmp #$FE70.w
	bpl L0095F1.b
	lda #$0001.w
	bra L0095FE.b
L0095F1:
	cmp #$0190.w
	bmi L0095FB.b
	lda #$0002.w
	bra L0095FE.b
L0095FB:
	lda #$0000.w
L0095FE:
	cmp $11AB.w
	beq L00960C.b
	sta $11AB.w
	lda #$000A.w
	sta $11AD.w
L00960C:
	rts

.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	ldx #$01.b		; A2 01
	ldy #$FF.b		; A0 FF
	lda $11AB.w		; AD AB 11
	beq  23.b		; F0 17
	cmp #$01.b		; C9 01
	beq  38.b		; F0 26
	bit $4212.w		; 2C 12 42
	bvc  -5.b		; 50 FB
	stz BG1HOFS.w		; 9C 0D 21
	stx BG1HOFS.w		; 8E 0D 21
	sty BG1VOFS.w		; 8C 0E 21
	sty BG1VOFS.w		; 8C 0E 21
	bra  38.b		; 80 26
	bit $4212.w		; 2C 12 42
	bvc  -5.b		; 50 FB
	stz BG1HOFS.w		; 9C 0D 21
	stz BG1HOFS.w		; 9C 0D 21
	sty BG1VOFS.w		; 8C 0E 21
	sty BG1VOFS.w		; 8C 0E 21
	bra  19.b		; 80 13
	bit $4212.w		; 2C 12 42
	bvc  -5.b		; 50 FB
	stz BG1HOFS.w		; 9C 0D 21
	stx BG1HOFS.w		; 8E 0D 21
	lda #$87.b		; A9 87
	sta BG1VOFS.w		; 8D 0E 21
	stx BG1VOFS.w		; 8E 0E 21
	lda #$13.b		; A9 13
	sta TMAIN.w		; 8D 2C 21
	lda #$30.b		; A9 30
	sta CGWSEL.w		; 8D 30 21
.ACCU 16
	rep #$20		; C2 20
	lda $1CEC.w		; AD EC 1C
	bpl  52.b		; 10 34
	stz $0F3A.w		; 9C 3A 0F
	lda $1396.w		; AD 96 13
	bpl  44.b		; 10 2C
	lda $B8.b		; A5 B8
	beq  40.b		; F0 28
.ACCU 8
	sep #$20		; E2 20
	lda #$00.b		; A9 00
	sta W1L.w		; 8D 26 21
	lda #$FF.b		; A9 FF
	sta W1R.w		; 8D 27 21
	lda #$17.b		; A9 17
	sta TMAIN.w		; 8D 2C 21
	lda #$06.b		; A9 06
	sta TSW.w		; 8D 2F 21
	ora #$80.b		; 09 80
	sta CGADSUB.w		; 8D 31 21
	lda #$10.b		; A9 10
	sta CGWSEL.w		; 8D 30 21
.ACCU 16
	rep #$20		; C2 20
	lda #$0100.w		; A9 00 01
	sta $0F3A.w		; 8D 3A 0F
	lda #$96A0.w		; A9 A0 96
	sta $3E.b		; 85 3E
	rtl		; 6B

.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	lda #$17.b		; A9 17
	sta TMAIN.w		; 8D 2C 21
	bit $1CEB.w		; 2C EB 1C
	bmi  67.b		; 30 43
	ldx #$03.b		; A2 03
	dex		; CA
	bpl  -3.b		; 10 FD
	lda $1E1C.w		; AD 1C 1E
	sta BG3HOFS.w		; 8D 11 21
	lda $1E1D.w		; AD 1D 1E
	sta BG3HOFS.w		; 8D 11 21
	lda $1E1E.w		; AD 1E 1E
	sta BG3VOFS.w		; 8D 12 21
	lda $1E1F.w		; AD 1F 1E
	sta BG3VOFS.w		; 8D 12 21
	lda $1CE6.w		; AD E6 1C
	beq  30.b		; F0 1E
	bit $4212.w		; 2C 12 42
	bvc  -5.b		; 50 FB
	lda #$16.b		; A9 16
	sta TMAIN.w		; 8D 2C 21
	lda #$01.b		; A9 01
	sta TSUB.w		; 8D 2D 21
	lda #$02.b		; A9 02
	sta CGWSEL.w		; 8D 30 21
	lda #$93.b		; A9 93
	sta CGADSUB.w		; 8D 31 21
	lda #$E0.b		; A9 E0
	sta COLDATA.w		; 8D 32 21
	jmp $97FA.w		; 4C FA 97
	lda $13BA.w		; AD BA 13
	sta TSW.w		; 8D 2F 21
	ora #$80.b		; 09 80
	sta CGADSUB.w		; 8D 31 21
	lda $13A4.w		; AD A4 13
	sta W1L.w		; 8D 26 21
	lda $13A6.w		; AD A6 13
	sta W1R.w		; 8D 27 21
.ACCU 16
	rep #$20		; C2 20
	lda $13B4.w		; AD B4 13
.ACCU 8
	sep #$20		; E2 20
	ldx $1E1E.w		; AE 1E 1E
	ldy $1E1F.w		; AC 1F 1E
	sta BG3HOFS.w		; 8D 11 21
	xba		; EB
	sta BG3HOFS.w		; 8D 11 21
	stx BG3VOFS.w		; 8E 12 21
	sty BG3VOFS.w		; 8C 12 21
.ACCU 16
	rep #$20		; C2 20
	lda $13AA.w		; AD AA 13
	bne  39.b		; D0 27
	lda $13B6.w		; AD B6 13
	cmp #$0074.w		; C9 74 00
	bpl  15.b		; 10 0F
.ACCU 8
	sep #$20		; E2 20
	dec A		; 3A
	sta VTIMEL.w		; 8D 09 42
.ACCU 16
	rep #$20		; C2 20
	lda #$9809.w		; A9 09 98
	sta $3E.b		; 85 3E
	bra  86.b		; 80 56
.ACCU 8
	sep #$20		; E2 20
	lda #$78.b		; A9 78
	sta VTIMEL.w		; 8D 09 42
.ACCU 16
	rep #$20		; C2 20
	lda #$960D.w		; A9 0D 96
	sta $3E.b		; 85 3E
	bra  70.b		; 80 46
	lda $13A8.w		; AD A8 13
	cmp #$001C.w		; C9 1C 00
	bpl  44.b		; 10 2C
.ACCU 8
	sep #$20		; E2 20
	lda $13AE.w		; AD AE 13
	sta CGWSEL.w		; 8D 30 21
	lda $1E1C.w		; AD 1C 1E
	sta BG3HOFS.w		; 8D 11 21
	lda $1E1D.w		; AD 1D 1E
	sta BG3HOFS.w		; 8D 11 21
.ACCU 16
	rep #$20		; C2 20
	lda $13AA.w		; AD AA 13
	cmp #$0074.w		; C9 74 00
	bcs -54.b		; B0 CA
.ACCU 8
	sep #$20		; E2 20
	sta VTIMEL.w		; 8D 09 42
.ACCU 16
	rep #$20		; C2 20
	lda #$97E1.w		; A9 E1 97
	sta $3E.b		; 85 3E
	bra  18.b		; 80 12
.ACCU 8
	sep #$20		; E2 20
	sta VTIMEL.w		; 8D 09 42
	lda $13AC.w		; AD AC 13
	sta CGWSEL.w		; 8D 30 21
.ACCU 16
	rep #$20		; C2 20
	lda #$97B1.w		; A9 B1 97
	sta $3E.b		; 85 3E
.ACCU 16
	rep #$20		; C2 20
	lda $C2.b		; A5 C2
	ldx $C4.b		; A6 C4
	ldy $C5.b		; A4 C5
.ACCU 8
	sep #$20		; E2 20
	bit $4212.w		; 2C 12 42
	bvc  -5.b		; 50 FB
	sta BG1HOFS.w		; 8D 0D 21
	xba		; EB
	sta BG1HOFS.w		; 8D 0D 21
	stx BG1VOFS.w		; 8E 0E 21
	sty BG1VOFS.w		; 8C 0E 21
	rtl		; 6B

.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	lda $1E1C.w		; AD 1C 1E
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	ldx $13AE.w		; AE AE 13
	bit $4212.w		; 2C 12 42
	bvc  -5.b		; 50 FB
	stx CGWSEL.w		; 8E 30 21
	sta BG3HOFS.w		; 8D 11 21
	xba		; EB
	sta BG3HOFS.w		; 8D 11 21
.ACCU 16
	rep #$20		; C2 20
	lda $13AA.w		; AD AA 13
	cmp #$0074.w		; C9 74 00
	bcs  38.b		; B0 26
.ACCU 8
	sep #$20		; E2 20
	sta VTIMEL.w		; 8D 09 42
.ACCU 16
	rep #$20		; C2 20
	lda #$97E1.w		; A9 E1 97
	sta $3E.b		; 85 3E
	rtl		; 6B

.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	lda $13B4.w		; AD B4 13
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	ldx $13AC.w		; AE AC 13
	bit $4212.w		; 2C 12 42
	bvc  -5.b		; 50 FB
	stx CGWSEL.w		; 8E 30 21
	sta BG3HOFS.w		; 8D 11 21
	xba		; EB
	sta BG3HOFS.w		; 8D 11 21
.ACCU 8
	sep #$20		; E2 20
	lda #$78.b		; A9 78
	sta VTIMEL.w		; 8D 09 42
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	lda #$960D.w		; A9 0D 96
	sta $3E.b		; 85 3E
	rtl		; 6B

.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	ldx #$000A.w		; A2 0A 00
	dex		; CA
	bpl  -3.b		; 10 FD
	lda $1E1C.w		; AD 1C 1E
.ACCU 8
.INDEX 8
	sep #$30		; E2 30
	bit $4212.w		; 2C 12 42
	bvc  -5.b		; 50 FB
	sta BG3HOFS.w		; 8D 11 21
	xba		; EB
	sta BG3HOFS.w		; 8D 11 21
	jmp $97FA.w		; 4C FA 97
L009825:
	lda $1C9C.w
	xba
	and #$00FF.w
	cmp $1E24.w
	bne L009832.b
	rts

L009832:
	sta $1E24.w
	cmp #$0029.w
	bcc L00983D.b
	lda #$0028.w
L00983D:
	ldx #$0001.w
	stx $00.b
	pha
	jsl L001895.l
	pla
	sta $00.b
	lda #$0001.w
	sta $0A.b
	lda #$0001.w
	sta $16.b
	lda #$E100.w
	sta $070C.w
	ldx $144E.w
	ldy $1450.w
	lda #$3000.w
	jsl L00163C.l
	rts

L009868:
	lda $11CE.w
	and #$00FF.w
	tax
	lda #$0005.w
	jsl L000AFE.l
	cmp $1E26.w
	bne L00987C.b
	rts

L00987C:
	sta $1E26.w
	clc		; Clear carry
	adc #$002B.w
	cmp #$0056.w
	bcc L00988B.b
	lda #$0056.w
L00988B:
	ldx #$0004.w
	stx $00.b
	pha
	jsl L001895.l
	pla
	sta $00.b
	lda #$0004.w
	sta $0A.b
	lda #$0004.w
	sta $16.b
	lda #$E100.w
	sta $0718.w
	ldx $1452.w
	ldy $1454.w
	lda #$3000.w
	jsl L00163C.l
	rts

	brk $00.b		; 00 00
	cop $00.b		; 02 00
	tsb $00.b		; 04 00
	asl $00.b		; 06 00
	php		; 08
	brk $09.b		; 00 09
	brk $0B.b		; 00 0B
	brk $0D.b		; 00 0D
	brk $0F.b		; 00 0F
	brk $11.b		; 00 11
	brk $13.b		; 00 13
	brk $14.b		; 00 14
	brk $16.b		; 00 16
	brk $18.b		; 00 18
	brk $1A.b		; 00 1A
	brk $1C.b		; 00 1C
	brk $1D.b		; 00 1D
	brk $1F.b		; 00 1F
	brk $21.b		; 00 21
	brk $22.b		; 00 22
	brk $24.b		; 00 24
	brk $26.b		; 00 26
	brk $27.b		; 00 27
	brk $29.b		; 00 29
	brk $2A.b		; 00 2A
	brk $2C.b		; 00 2C
	brk $2D.b		; 00 2D
	brk $2F.b		; 00 2F
	brk $30.b		; 00 30
	brk $32.b		; 00 32
	brk $32.b		; 00 32
	brk $32.b		; 00 32
	brk $32.b		; 00 32
	brk $32.b		; 00 32
	brk $4C.b		; 00 4C
	brk $4C.b		; 00 4C
	brk $4C.b		; 00 4C
	brk $4C.b		; 00 4C
	brk $4C.b		; 00 4C
	brk $4B.b		; 00 4B
	brk $4B.b		; 00 4B
	brk $4B.b		; 00 4B
	brk $4A.b		; 00 4A
	brk $4A.b		; 00 4A
	brk $49.b		; 00 49
	brk $49.b		; 00 49
	brk $48.b		; 00 48
	brk $48.b		; 00 48
	brk $47.b		; 00 47
	brk $46.b		; 00 46
	brk $45.b		; 00 45
	brk $45.b		; 00 45
	brk $44.b		; 00 44
	brk $43.b		; 00 43
	brk $42.b		; 00 42
	brk $41.b		; 00 41
	brk $40.b		; 00 40
	brk $3F.b		; 00 3F
	brk $3D.b		; 00 3D
	brk $3C.b		; 00 3C
	brk $3B.b		; 00 3B
	brk $3A.b		; 00 3A
	brk $38.b		; 00 38
	brk $37.b		; 00 37
	brk $37.b		; 00 37
	brk $37.b		; 00 37
	brk $37.b		; 00 37
	brk $37.b		; 00 37
	.db $00		; Opcode overrunning section
L00993E:
	lda $D6.b
	cmp #$8000.w
	ror A
	cmp #$8000.w
	ror A
	cmp #$8000.w
	ror A
	cmp #$8000.w
	ror A
	cmp #$8000.w
	ror A
	cmp #$8000.w
	ror A
	cmp $1E28.w
	bne L00995E.b
	rts

L00995E:
	sta $1E28.w
	cmp #$0080.w
	bcc L00996A.b
	eor #$FFFF.w
	inc A
L00996A:
	asl A
	tax
	lda $1458.w
	sec		; Set carry
	sbc $0198FA.l,X
	tay
	lda $0198B6.l,X
	bit $D6.b
	bpl L009981.b
	eor #$FFFF.w
	inc A
L009981:
	clc		; Clear carry
	adc $1456.w
	tax
	lda #$0029.w
	sta $00.b
	lda #$0000.w
	sta $0A.b
	lda #$0000.w
	sta $16.b
	lda #$3000.w
	jsl L001774.l
	rts

L00999D:
	lda $1E2A.w
	bne L0099A3.b
	rts

L0099A3:
	lda #$002A.w
	sta $00.b
	lda #$0007.w
	sta $0A.b
	lda #$0007.w
	sta $16.b
	ldx $1CA2.w
	ldy $1CA4.w
	lda #$3000.w
	jsl L001774.l
	stz $1E2A.w
	rts

	ldy $1ADD.w		; AC DD 1A
	brk $0E.b		; 00 0E
	sbc $1A.b,S		; E3 1A
	brk $50.b		; 00 50
	dec $11.b		; C6 11
	brk $52.b		; 00 52
	phx		; DA
	ora ($00.b),Y		; 11 00
	jsr $1AF3.w		; 20 F3 1A
	brk $C8.b		; 00 C8
	lda $001C.w,Y		; B9 1C 00
	ora $CB.b,S		; 03 CB
	trb $1B00.w		; 1C 00 1B
	dec $001C.w,X		; DE 1C 00
	brk $80.b		; 00 80
	asl A		; 0A
	brk $F0.b		; 00 F0
	inx		; E8
	trb $7D00.w		; 1C 00 7D
	nop		; EA
	trb $7400.w		; 1C 00 74
	inc $03.b		; E6 03
	brk $3B.b		; 00 3B
	lda $0A.b,S		; A3 0A
	brk $A6.b		; 00 A6
	tay		; A8
	asl A		; 0A
	brk $51.b		; 00 51
	sbc $620003.l		; EF 03 00 62
	phx		; DA
	ora [$00.b],Y		; 17 00
	ora ($EC.b)		; 12 EC
	ora [$00.b],Y		; 17 00
	bra -51.b		; 80 CD
	php		; 08
	brk $68.b		; 00 68
	tsx		; BA
	asl A		; 0A
	brk $D5.b		; 00 D5
	inc $17.b,X		; F6 17
	brk $A2.b		; 00 A2
	xba		; EB
	php		; 08
	brk $12.b		; 00 12
	cpy #$0009.w		; C0 09 00
	sbc ($B0.b,X)		; E1 B0
	phd		; 0B
	brk $07.b		; 00 07
	cmp $09.b,S		; C3 09
	brk $3E.b		; 00 3E
	cpy $0009.w		; CC 09 00
	cpy #$09D2.w		; C0 D2 09
	brk $E9.b		; 00 E9
	phx		; DA
	ora #$4B00.w		; 09 00 4B
	dec $0A.b		; C6 0A
	brk $B8.b		; 00 B8
	cld		; D8
	asl A		; 0A
	brk $00.b		; 00 00
	bra  11.b		; 80 0B
	brk $B2.b		; 00 B2
	stz $000B.w,X		; 9E 0B 00
	sbc [$A8.b],Y		; F7 A8
	phd		; 0B
	brk $E1.b		; 00 E1
	bcs  11.b		; B0 0B
	brk $47.b		; 00 47
	lda $0B.b,X		; B5 0B
	brk $81.b		; 00 81
	cpy $0B.b		; C4 0B
	brk $E3.b		; 00 E3
	cmp ($0B.b)		; D2 0B
	brk $DF.b		; 00 DF
	rep #$00		; C2 00
	brk $DA.b		; 00 DA
	sbc $000A.w		; ED 0A 00
	cmp ($DE.b,S),Y		; D3 DE
	brk $00.b		; 00 00
	cmp $F2.b,X		; D5 F2
	brk $00.b		; 00 00
	lda [$9A.b]		; A7 9A
	ora $9B.b,X		; 15 9B
	tyx		; BB
	txs		; 9A
	cmp $F79A.w,Y		; D9 9A F7
	txs		; 9A
	and ($9B.b,S),Y		; 33 9B
	phb		; 8B
	cmp $01.b,S		; C3 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $A9.b		; 00 A9
	dec $01.b,X		; D6 01
	brk $FF.b		; 00 FF
	cpy #$0002.w		; C0 02 00
	sta $02D7.w,X		; 9D D7 02
	brk $43.b		; 00 43
	xba		; EB
	cop $00.b		; 02 00
	ora $002500.l		; 0F 00 25 00
	ora $001600.l,X		; 1F 00 16 00
	asl $00.b,X		; 16 00
	jsr $1000.w		; 20 00 10
	brk $11.b		; 00 11
	brk $12.b		; 00 12
	brk $13.b		; 00 13
	brk $14.b		; 00 14
	brk $15.b		; 00 15
	brk $17.b		; 00 17
	brk $18.b		; 00 18
	brk $19.b		; 00 19
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	brk $1D.b		; 00 1D
	brk $23.b		; 00 23
	brk $26.b		; 00 26
	brk $17.b		; 00 17
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	brk $0E.b		; 00 0E
	brk $03.b		; 00 03
	brk $0E.b		; 00 0E
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	brk $0E.b		; 00 0E
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0D.b		; 00 0D
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $0E.b		; 00 0E
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $FF.b		; 00 FF
	sbc $010000.l,X		; FF 00 00 01
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $05.b		; 00 05
	brk $0E.b		; 00 0E
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	brk $FF.b		; 00 FF
	sbc $1B001A.l,X		; FF 1A 00 1B
	brk $24.b		; 00 24
	brk $1F.b		; 00 1F
	brk $1E.b		; 00 1E
	brk $21.b		; 00 21
	brk $22.b		; 00 22
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $FF.b		; 00 FF
	sbc $0E001C.l,X		; FF 1C 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $05.b		; 00 05
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0E.b		; 00 0E
	brk $0D.b		; 00 0D
	brk $FF.b		; 00 FF
	sbc $1708FF.l,X		; FF FF 08 17
	bit $24.b		; 24 24
	ora [$08.b],Y		; 17 08
	sbc $404040.l,X		; FF 40 40 40
	brk $0F.b		; 00 0F
	php		; 08
L009B5F:
	asl A
	asl A
	tay
	lda $99C3.w,Y
	sta $0C.b
	lda $99C5.w,Y
	sta $0E.b
	ldy #$0006.w
	lda [$0C.b],Y
	xba
	lsr A
	lsr A
	lsr A
	lsr A
	sta $14.b
	asl A
	asl A
	asl A
	adc $14.b
	sta $14.b
	ldy #$000A.w
	lda [$0C.b],Y
	xba
	lsr A
	lsr A
	lsr A
	lsr A
	sta $16.b
	asl A
	asl A
	asl A
	adc $16.b
	tax
	ldy $14.b
	lda $0C.b
	clc		; Clear carry
	adc #$0040.w
	sta $0C.b
	jsl L00132B.l
	rts

L009BA0:
.ACCU 16
.INDEX 16
	rep #$30
	phk
	plb
	sta $00.b
	inc $0974.w
.ACCU 8
	sep #$20
	dec $0F70.w
.ACCU 16
	rep #$20
	jsl L0012E9.l
	lda $00.b
	asl A
	tax
	lda $9A63.w,X
	tax
L009BBC:
	phx
	jsl L001300.l
	plx
	lda $0000.w,X
	bmi L009BD0.b
	phx
	jsr L009B5F.w
	plx
	inx
	inx
	bra L009BBC.b
L009BD0:
	lda $00.b
	beq L009C05.b
	cmp #$0005.w
	bcs L009C05.b
	lda $1C78.w
	asl A
	tax
.BASE $C0
LC19BDE:
.BASE $00
L009BDE:
	phx
	lda $019A87.l,X
	jsr L009B5F.w
	plx
	lda $019A8D.l,X
	jsr L009B5F.w
	ldx #$9A93.w
L009BF1:
	phx
	jsl L001300.l
	plx
	lda $0000.w,X
	bmi L009C05.b
	phx
	jsr L009B5F.w
	plx
	inx
	inx
	bra L009BF1.b
L009C05:
	jsl L001300.l
	stx $1EF4.w
.ACCU 8
	sep #$20
	inc $0F70.w
.ACCU 16
	rep #$20
	rtl

L009C14:
.ACCU 8
	sep #$20
.ACCU 16
.INDEX 16
	rep #$30
	pha
	lda #$EC87.w
	sta $4D.b
	lda #$0002.w
	sta $4F.b
	jsl L002368.l
	pla
	asl A
	asl A
	tax
	phk
	plb
	lda $9A6F.w,X
	sta $0C.b
	beq L009C3D.b
	lda $9A71.w,X
	sta $0E.b
	jsl L0022EC.l
L009C3D:
	rtl

L009C3E:
	php
.ACCU 16
.INDEX 16
	rep #$30
	stz $0996.w
	lda #$0003.w
	sta $1C84.w
L009C4A:
	jsr L00A35A.w
	and #$1080.w
	bne L009C75.b
	jsr L00A00C.w
	and #$1080.w
	bne L009C75.b
	jsr L00A16C.w
	and #$1080.w
	bne L009C75.b
	lda #$0000.w
	jsr L00A3CC.w
	and #$1080.w
	bne L009C75.b
	dec $1C84.w
	bne L009C4A.b
	inc $0996.w
L009C75:
	plp
	rts

	brk $80.b		; 00 80
	inc A		; 1A
	brk $D8.b		; 00 D8
	sta [$1A.b],Y		; 97 1A
	brk $78.b		; 00 78
	lda $11.b		; A5 11
	brk $95.b		; 00 95
	stz $9CC3.w		; 9C C3 9C
	sbc ($9C.b,X)		; E1 9C
	iny		; C8
	sbc $CD0034.l,X		; FF 34 00 CD
	sbc $CB002C.l,X		; FF 2C 00 CB
	sbc $150038.l,X		; FF 38 00 15
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	brk $0E.b		; 00 0E
	brk $0D.b		; 00 0D
	brk $0C.b		; 00 0C
	brk $0B.b		; 00 0B
	brk $0A.b		; 00 0A
	brk $09.b		; 00 09
	brk $08.b		; 00 08
	brk $08.b		; 00 08
	brk $0D.b		; 00 0D
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0C.b		; 00 0C
	brk $11.b		; 00 11
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $08.b		; 00 08
	brk $09.b		; 00 09
	brk $0A.b		; 00 0A
	brk $0B.b		; 00 0B
	brk $0C.b		; 00 0C
	brk $0D.b		; 00 0D
	brk $0C.b		; 00 0C
	brk $0B.b		; 00 0B
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	.db $00		; Opcode overrunning section
L009D07:
	ldx #$07FE.w
	lda #$0000.w
L009D0D:
	sta $7E7800.l,X
	dex
	dex
	bpl L009D0D.b
	lda #$7800.w
	sta $0990.w
	rts

L009D1C:
	lda #$0000.w
	pha
	jsl L009BA0.l
	pla
	jsl L009C14.l
	jsl L00050F.l
	jsl L000819.l
.ACCU 8
	sep #$20
	lda #$04.b
	sta TMAIN.w		; Mainscreen Designation
.ACCU 16
.INDEX 16
	rep #$30
	lda #$0000.w
	jsr L00A9A0.w
	lda #$0000.w
	jsr L00A9CB.w
	lda #$0000.w
	jsr L00A9F2.w
	jsl L000521.l
	ldx #$00B4.w
	ldy #$0000.w
	jsl L0003B4.l
	ldx #$0168.w
	ldy #$0000.w
	jsl L0003C0.l
	jsl L000401.l
	rts

	phk		; 4B
	plb		; AB
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	lda $0202.w		; AD 02 02
	asl A		; 0A
	tax		; AA
	lda $0185EA.l,X		; BF EA 85 01
	sta $0C.b		; 85 0C
	lda #$0000.w		; A9 00 00
	sta $0E.b		; 85 0E
	lda #$0080.w		; A9 80 00
	ldx #$0030.w		; A2 30 00
	jsl L000583.l		; 22 83 85 00
	lda $0202.w		; AD 02 02
	asl A		; 0A
	tax		; AA
	lda $019C83.l,X		; BF 83 9C 01
	tax		; AA
	sta $020A.w		; 8D 0A 02
	lda $0000.w,X		; BD 00 00
	sta $0208.w		; 8D 08 02
	jsl L000375.l		; 22 75 83 00
	jsl L00158F.l		; 22 8F 95 00
	lda #$0002.w		; A9 02 00
	sta $09A8.w		; 8D A8 09
	lda $0202.w		; AD 02 02
	asl A		; 0A
	asl A		; 0A
	tax		; AA
	lda $019C79.l,X		; BF 79 9C 01
	sta $12.b		; 85 12
	lda $019C77.l,X		; BF 77 9C 01
	sta $10.b		; 85 10
	lda #$0000.w		; A9 00 00
	jsl $0098FF.l		; 22 FF 98 00
	jsl L0015BD.l		; 22 BD 95 00
	rtl		; 6B

L009DC6:
.ACCU 16
.INDEX 16
	rep #$30
	phk
	plb
	stx $0204.w
	cpy $0208.w
	bcc L009DD5.b
	ldy $0208.w
L009DD5:
	sty $0206.w
	jsl L00158F.l
	lda $0202.w
	asl A
	asl A
	tax
	lda $019C79.l,X
	sta $12.b
	lda $019C77.l,X
	sta $10.b
	lda #$0002.w
	sta $09A8.w
	lda $0206.w
	inc A
	asl A
	adc $020A.w
	tax
	lda $0000.w,X
	clc		; Clear carry
	adc #$0005.w
	sta $040A.w
	sta $00.b
	ldx $0405.w
	ldy $0400.w
	lda #$3000.w
	jsl L001662.l
	lda #$0002.w
	sta $09A8.w
	lda $0204.w
	sta $00.b
	lda $0202.w
	asl A
	asl A
	tax
	lda $019C89.l,X
	clc		; Clear carry
	adc $0405.w
	tax
	ldy $0400.w
	lda #$2000.w
	jsl L001662.l
	lda $0204.w
	sta $00.b
	lda $0202.w
	asl A
	asl A
	tax
	lda $019C8B.l,X
	clc		; Clear carry
	adc $0405.w
	tax
	ldy $0400.w
	lda #$2000.w
	jsl L001662.l
	stz $00.b
	lda #$2000.w
	ldx $0405.w
	ldy $0400.w
	jsl L001662.l
	lda $1E2C.w
	beq L009ED6.b
	lda #$0001.w
	sta $09A8.w
	lda #$1F80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda $0444.w
	inc A
	inc A
	inc A
	sta $00.b
	ldx #$00A6.w
	ldy #$00B6.w
	lda #$2000.w
	jsl L001662.l
	lda $0440.w
	cmp #$000A.w
	bcs L009EB2.b
	cmp #$0005.w
	bcc L009EB2.b
	lda #$0002.w
	sta $00.b
	ldx #$00A6.w
	ldy #$00B6.w
	lda #$2000.w
	jsl L001662.l
	bra L009EC4.b
L009EB2:
	lda #$0001.w
	sta $00.b
	ldx #$00A6.w
	ldy #$00B6.w
	lda #$2000.w
	jsl L001662.l
L009EC4:
	lda #$0000.w
	sta $00.b
	ldx #$00A6.w
	ldy #$00B6.w
	lda #$2000.w
	jsl L001662.l
L009ED6:
	jsl L0015BD.l
	rtl

L009EDB:
.ACCU 16
.INDEX 16
	rep #$30
	stz $0964.w
L009EE0:
	jsl L0003AB.l
	lda $0960.w
	bne L009F18.b
	lda $0405.w
	clc		; Clear carry
	adc #$0190.w
	lsr A
	lsr A
	sta $08.b
	lda #$0003.w
	sta $04.b
	jsl L000AE3.l
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	eor #$0003.w
	tax
	lda $0964.w
	lsr A
	lsr A
	tay
	cmp #$0016.w
	beq L009F18.b
	sty $0408.w
	jsl L009DC6.l
	bra L009EE0.b
L009F18:
	lda $0960.w
	rtl

L009F1C:
.ACCU 16
.INDEX 16
	rep #$30
	jsl L0003AB.l
	lda $0405.w
	cmp #$FF38.w
	bmi L009F78.b
	lda $0960.w
	bne L009F78.b
	lda $0402.w
	clc		; Clear carry
	adc #$0040.w
	cmp #$0C40.w
	bcc L009F3E.b
	lda #$0C40.w
L009F3E:
	sta $0402.w
	lda $0404.w
	sec		; Set carry
	sbc $0402.w
	sta $0404.w
	lda $0406.w
	sbc #$0000.w
	sta $0406.w
	lda $0405.w
	clc		; Clear carry
	adc #$0190.w
	lsr A
	lsr A
	sta $08.b
	lda #$0003.w
	sta $04.b
	jsl L000AE3.l
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	eor #$0003.w
	tax
	ldy $0408.w
	jsl L009DC6.l
	bra L009F1C.b
L009F78:
	lda $0960.w
	rtl

L009F7C:
.ACCU 16
.INDEX 16
	rep #$30
	stz $0404.w
	lda #$01AE.w
	sta $0405.w
	lda #$0C40.w
	sta $0402.w
L009F8D:
	jsl L0003AB.l
	lda $0402.w
	beq L009FE1.b
	lda $0960.w
	bne L009FE1.b
	lda $0402.w
	sec		; Set carry
	sbc #$0040.w
	bcs L009FA7.b
	lda #$0000.w
L009FA7:
	sta $0402.w
	lda $0404.w
	sec		; Set carry
	sbc $0402.w
	sta $0404.w
	lda $0406.w
	sbc #$0000.w
	sta $0406.w
	lda $0405.w
	clc		; Clear carry
	adc #$0190.w
	lsr A
	lsr A
	sta $08.b
	lda #$0003.w
	sta $04.b
	jsl L000AE3.l
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	eor #$0003.w
	tax
	ldy #$0000.w
	jsl L009DC6.l
	bra L009F8D.b
L009FE1:
	lda $0960.w
	rtl

.ACCU 16
	rep #$20		; C2 20
	lda $22.b		; A5 22
	sec		; 38
	sbc #$0080.w		; E9 80 00
	sta $22.b		; 85 22
.ACCU 8
	sep #$20		; E2 20
	sta M7A.w		; 8D 1B 21
	sta M7D.w		; 8D 1E 21
	xba		; EB
	sta M7A.w		; 8D 1B 21
	sta M7D.w		; 8D 1E 21
.ACCU 16
	rep #$20		; C2 20
	lda $22.b		; A5 22
	cmp #$0100.w		; C9 00 01
	bne   4.b		; D0 04
	jsl L000375.l		; 22 75 83 00
	rtl		; 6B

L00A00C:
.ACCU 16
.INDEX 16
	rep #$30
	jsl L00050F.l
.ACCU 8
	sep #$20
	lda #$07.b
	sta BGMODE.w		; BG Mode and Character Size
	lda #$FF.b
	sta $0F42.w
	lda #$01.b
	sta BG1SC.w		; BG1 Tilemap Address and Size
	lda #$42.b
	sta BG12NBA.w		; BG1&2 Tilemap Character Address
	lda #$11.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$02.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
	rep #$20
	lda #$9AED.w
	sta $0C.b
	lda #$0004.w
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	stz $0990.w
	ldx #$0000.w
	txy
	jsl L00065F.l
	lda #$9BF5.w
	sta $0C.b
	lda #$0004.w
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	ldx #$0000.w
	jsl L00073E.l
	lda #$0001.w
	jsr L00A9F2.w
.ACCU 8
	sep #$20
	lda #$80.b
	sta M7SEL.w		; Mode 7 Settings
	sta M7X.w		; Mode 7 Center X
	stz M7X.w		; Mode 7 Center X
	stz M7B.w		; Mode 7 Matrix B
	stz M7B.w		; Mode 7 Matrix B
	stz M7C.w		; Mode 7 Matrix C
	stz M7C.w		; Mode 7 Matrix C
	stz M7A.w		; Mode 7 Matrix A
	stz M7D.w		; Mode 7 Matrix D
	lda #$70.b
	sta M7Y.w		; Mode 7 Center Y
	stz M7Y.w		; Mode 7 Center Y
	lda #$40.b
	sta M7A.w		; Mode 7 Matrix A
	sta M7D.w		; Mode 7 Matrix D
.ACCU 16
	rep #$20
	ldx #$0000.w
	txy
	lda #$4000.w
	jsl L00154E.l
	jsl L000521.l
	inc $0F86.w
	lda #$FFFF.w
	sta $040A.w
	lda #$0001.w
	sta $0202.w
	lda #$0001.w
	ldx #$9D69.w
	jsl L000385.l
	jsl L0003AB.l
	jsl L0003AB.l
	lda #$4000.w
	sta $22.b
	lda #$0001.w
	ldx #$9FE5.w
	jsl L000385.l
	stz $0408.w
	lda #$00C8.w
	sta $0400.w
	jsl L009F7C.l
	bne L00A15B.b
	lda #$0022.w
	jsl L002212.l
	jsl L009EDB.l
	bne L00A15B.b
	lda #$0026.w
	jsl L002212.l
	ldx #$0032.w
	ldy #$0000.w
	jsl L0003B4.l
	lda #$002A.w
	jsl L002212.l
	jsl L009F1C.l
	bne L00A15B.b
	ldx #$0000.w
	txy
	lda #$4000.w
	jsl L00154E.l
	lda #$FFFF.w
	sta $040A.w
	lda #$0000.w
	sta $0202.w
	lda #$0001.w
	ldx #$9D69.w
	jsl L000385.l
	jsl L0003AB.l
	jsl L0003AB.l
	stz $0408.w
	lda #$0500.w
	sta $0402.w
	stz $0404.w
	lda #$0190.w
	sta $0405.w
	jsl L009F1C.l
L00A15B:
	jsl L000401.l
	pha
	lda #$002A.w
	jsl L0022B4.l
	pla
	stz $0F86.w
	rts

L00A16C:
.ACCU 16
.INDEX 16
	rep #$30
	jsl L00050F.l
	lda #$2000.w
	ldx #$0000.w
	ldy #$0000.w
	jsl L00045B.l
	jsl L000819.l
.ACCU 8
	sep #$20
	lda #$13.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$03.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
	rep #$20
	lda #$001C.w
	jsr L00A9A0.w
	lda #$001C.w
	jsr L00A9CB.w
	lda #$001C.w
	jsr L00A9F2.w
	lda #$001D.w
	jsr L00A9A0.w
	lda #$001D.w
	jsr L00A9CB.w
	lda #$0003.w
	jsr L00A9F2.w
	lda #$A6FE.w
	sta $0C.b
	lda #$0004.w
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	stz $0200.w
	stz $0400.w
	lda #$6000.w
	ldx #$0026.w
	ldy #$0022.w
	jsl L00154E.l
	lda #$FFFF.w
	sta $09A8.w
	lda #$2000.w
	sta $10.b
	lda #$007E.w
	sta $12.b
	stz $00.b
	lda #$000A.w
	jsl L001895.l
	stz $16.b
	stz $0A.b
	lda #$000A.w
	sta $00.b
	ldx #$0040.w
	ldy #$00A5.w
	lda #$0000.w
	jsl L001774.l
	lda #$0100.w
	sta $0F32.w
	lda #$FF00.w
	sta $0F36.w
	lda #$0001.w
	ldx #$A24E.w
	jsl L000385.l
	lda #$00DC.w
	sta $1E41.w
	lda #$0022.w
	sta $1E44.w
	lda #$F6DC.w
	sta $1E48.w
	lda #$FA24.w
	sta $1E46.w
	jsl L000521.l
	stz $0964.w
	ldx #$0168.w
	ldy #$0000.w
	jsl L0003C0.l
	jsl L000401.l
	rts

.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	lda $0F32.w		; AD 32 0F
	beq  14.b		; F0 0E
	sec		; 38
	sbc #$0004.w		; E9 04 00
	sta $0F32.w		; 8D 32 0F
	eor #$FFFF.w		; 49 FF FF
	inc A		; 1A
	sta $0F36.w		; 8D 36 0F
	lda $1E44.w		; AD 44 1E
	cmp #$00A2.w		; C9 A2 00
	bcc  15.b		; 90 0F
	lda #$0000.w		; A9 00 00
	sta $1E43.w		; 8D 43 1E
	lda #$00A2.w		; A9 A2 00
	sta $1E44.w		; 8D 44 1E
	jsr $A31F.w		; 20 1F A3
	lda $1E44.w		; AD 44 1E
	cmp #$0010.w		; C9 10 00
	bcs  15.b		; B0 0F
	lda #$0000.w		; A9 00 00
	sta $1E43.w		; 8D 43 1E
	lda #$0011.w		; A9 11 00
	sta $1E44.w		; 8D 44 1E
	jsr $A31F.w		; 20 1F A3
	lda $1E41.w		; AD 41 1E
	cmp #$00C8.w		; C9 C8 00
	bcc  15.b		; 90 0F
	lda #$0000.w		; A9 00 00
	sta $1E40.w		; 8D 40 1E
	lda #$00C7.w		; A9 C7 00
	sta $1E41.w		; 8D 41 1E
	jsr $A346.w		; 20 46 A3
	lda $1E41.w		; AD 41 1E
	cmp #$0010.w		; C9 10 00
	bcs  15.b		; B0 0F
	lda #$0000.w		; A9 00 00
	sta $1E40.w		; 8D 40 1E
	lda #$0011.w		; A9 11 00
	sta $1E41.w		; 8D 41 1E
	jsr $A346.w		; 20 46 A3
	lda $1E48.w		; AD 48 1E
	clc		; 18
	adc #$004B.w		; 69 4B 00
	sta $1E48.w		; 8D 48 1E
	clc		; 18
	adc $1E43.w		; 6D 43 1E
	sta $1E43.w		; 8D 43 1E
	lda $1E46.w		; AD 46 1E
	cmp #$0019.w		; C9 19 00
	bcs   1.b		; B0 01
	dec A		; 3A
	clc		; 18
	adc $1E40.w		; 6D 40 1E
	sta $1E40.w		; 8D 40 1E
	jsl L00158F.l		; 22 8F 95 00
	lda #$2000.w		; A9 00 20
	sta $10.b		; 85 10
	lda #$007E.w		; A9 7E 00
	sta $12.b		; 85 12
	lda $0200.w		; AD 00 02
	sta $00.b		; 85 00
	ldx $1E41.w		; AE 41 1E
	ldy $1E44.w		; AC 44 1E
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	jsl L0015BD.l		; 22 BD 95 00
	dec $0400.w		; CE 00 04
	bpl  21.b		; 10 15
	lda #$0002.w		; A9 02 00
	sta $0400.w		; 8D 00 04
	lda $0200.w		; AD 00 02
	inc A		; 1A
	cmp #$000A.w		; C9 0A 00
	bne   3.b		; D0 03
	lda #$0000.w		; A9 00 00
	sta $0200.w		; 8D 00 02
	rtl		; 6B

	lda #$00D2.w		; A9 D2 00
	ldx $1E48.w		; AE 48 1E
	jsl L0008FC.l		; 22 FC 88 00
	lda $09.b		; A5 09
	sec		; 38
	sbc #$004B.w		; E9 4B 00
	eor #$FFFF.w		; 49 FF FF
	inc A		; 1A
	sta $1E48.w		; 8D 48 1E
	lda #$00E6.w		; A9 E6 00
	ldx $1E46.w		; AE 46 1E
	jsl L0008FC.l		; 22 FC 88 00
	lda $09.b		; A5 09
	sta $1E46.w		; 8D 46 1E
	rts		; 60

	lda #$00D2.w		; A9 D2 00
	ldx $1E46.w		; AE 46 1E
	jsl L0008FC.l		; 22 FC 88 00
	lda $09.b		; A5 09
	eor #$FFFF.w		; 49 FF FF
	inc A		; 1A
	sta $1E46.w		; 8D 46 1E
	rts		; 60

L00A35A:
	jsl L00050F.l
	jsl L000819.l
.ACCU 8
	sep #$20
	lda #$01.b
	sta TMAIN.w		; Mainscreen Designation
.ACCU 16
	rep #$20
	lda #$0004.w
	jsr L00A9A0.w
	lda #$0004.w
	jsr L00A9CB.w
	lda #$0004.w
	jsr L00A9F2.w
	lda #$0001.w
	ldx #$A39C.w
	jsl L000385.l
	stz $20.b
	jsl L000521.l
	ldx #$012C.w
	ldy #$0000.w
	jsl L0003C0.l
	jsl L000401.l
	rts

.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	lda $0964.w		; AD 64 09
	and #$0003.w		; 29 03 00
	bne  37.b		; D0 25
	lda $20.b		; A5 20
	clc		; 18
	adc #$0002.w		; 69 02 00
	asl A		; 0A
	adc #$99ED.w		; 69 ED 99
	sta $0C.b		; 85 0C
	lda #$0004.w		; A9 04 00
	sta $0E.b		; 85 0E
	lda #$0002.w		; A9 02 00
	ldx #$000E.w		; A2 0E 00
	jsl L000583.l		; 22 83 85 00
	lda $20.b		; A5 20
	dec A		; 3A
	bpl   3.b		; 10 03
	lda #$000D.w		; A9 0D 00
	sta $20.b		; 85 20
	rtl		; 6B

L00A3CC:
	pha
	jsl L00050F.l
	jsl L000819.l
.ACCU 8
	sep #$20
	lda #$17.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$01.b
	sta BG34NBA.w		; BG3&4 Tilemap Character Address
	lda #$09.b
	sta BGMODE.w		; BG Mode and Character Size
	lda #$03.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
	rep #$20
	lda #$0022.w
	jsr L00A9F2.w
	lda #$0014.w
	jsr L00A9F2.w
	lda #$0022.w
	jsr L00A9A0.w
	lda #$0022.w
	jsr L00A9CB.w
	lda #$0005.w
	jsr L00A9CB.w
	lda #$000F.w
	jsr L00A9CB.w
	lda #$000F.w
	jsr L00A9A0.w
	lda #$000F.w
	jsr L00A9F2.w
	jsr L009D07.w
	lda #$D23F.w
	sta $0C.b
	lda #$001A.w
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	lda #$6000.w
	ldx #$0000.w
	txy
	jsl L00154E.l
	inc $0968.w
	lda #$2000.w
	sta $10.b
	lda #$007E.w
	sta $12.b
	jsl L00158F.l
	lda #$0000.w
L00A452:
	sta $22.b
	asl A
	asl A
	asl A
	tax
	lda $1E4E.w,X
	and #$00FF.w
	inc A
	inc A
	inc A
	sta $00.b
	ldx #$0040.w
	lda #$0005.w
	sec		; Set carry
	sbc $22.b
	cmp #$0003.w
	bcc L00A477.b
	sbc #$0003.w
	ldx #$00C0.w
L00A477:
	asl A
	asl A
	asl A
	asl A
	sta $14.b
	asl A
	adc $14.b
	adc #$005E.w
	tay
	lda #$3800.w
	phx
	phy
	jsl L001662.l
	lda $22.b
	asl A
	asl A
	asl A
	tax
	lda $1E4A.w,X
	sta $14.b
	lda $1E4C.w,X
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	sta $16.b
	jsr L00AFC9.w
	pla
	lsr A
	lsr A
	lsr A
	inc A
	tay
	pla
	lsr A
	lsr A
	lsr A
	sec		; Set carry
	sbc #$0006.w
	tax
	phy
	phx
	lda #$0007.w
	sta $20.b
	lda #$1C28.w
	sta $0C.b
	stz $0E.b
	lda #$3500.w
	jsl L000798.l
	lda $22.b
	asl A
	asl A
	asl A
	clc		; Clear carry
	adc #$1E4F.w
	sta $0C.b
	lda #$0003.w
	sta $20.b
	pla
	clc		; Clear carry
	adc #$0008.w
	tax
	ply
	lda #$3500.w
	jsl L000798.l
	lda $22.b
	inc A
	cmp #$0006.w
	beq L00A4F9.b
	jmp L00A452.w
L00A4F9:
	jsr L008A7F.w
	jsl L0015BD.l
	jsl L000521.l
	ldx #$012C.w
	ply
	jsl L0003C0.l
	jsl L000401.l
	rts

.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	lda $0F34.w		; AD 34 0F
	bmi  14.b		; 30 0E
	sec		; 38
	sbc #$0004.w		; E9 04 00
	sta $0F34.w		; 8D 34 0F
	sta $0F38.w		; 8D 38 0F
	sta $0F3C.w		; 8D 3C 0F
	rtl		; 6B

	jsl L00158F.l		; 22 8F 95 00
	lda #$1E80.w		; A9 80 1E
	sta $11.b		; 85 11
	lda #$8000.w		; A9 00 80
	sta $10.b		; 85 10
	lda #$001E.w		; A9 1E 00
	sta $00.b		; 85 00
	ldx #$0000.w		; A2 00 00
	txy		; 9B
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	lda $0964.w		; AD 64 09
	and #$0010.w		; 29 10 00
	beq  25.b		; F0 19
	lda #$001F.w		; A9 1F 00
	sta $00.b		; 85 00
	lda $0202.w		; AD 02 02
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	adc #$007B.w		; 69 7B 00
	tax		; AA
	ldy #$003C.w		; A0 3C 00
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	jsl L0015BD.l		; 22 BD 95 00
	lda #$1000.w		; A9 00 10
	sta $0990.w		; 8D 90 09
	ldx $0200.w		; AE 00 02
	lda $1E4F.w,X		; BD 4F 1E
	and #$00FF.w		; 29 FF 00
	ora #$3500.w		; 09 00 35
	sta $0400.w		; 8D 00 04
	lda $1E50.w,X		; BD 50 1E
	and #$00FF.w		; 29 FF 00
	ora #$3500.w		; 09 00 35
	sta $0402.w		; 8D 02 04
	lda $1E51.w,X		; BD 51 1E
	and #$00FF.w		; 29 FF 00
	ora #$3500.w		; 09 00 35
	sta $0404.w		; 8D 04 04
	lda #$0004.w		; A9 04 00
	sta $0D.b		; 85 0D
	lda #$0400.w		; A9 00 04
	sta $0C.b		; 85 0C
	lda #$0006.w		; A9 06 00
	ldx #$000F.w		; A2 0F 00
	ldy #$0007.w		; A0 07 00
	jsl $008760.l		; 22 60 87 00
	rtl		; 6B

L00A5AE:
	lda $1E4A.w
	cmp $1C88.w
	lda $1E4C.w
	sbc $1C8A.w
	bcc L00A5BD.b
	rts

L00A5BD:
	jsl L00050F.l
	jsl L000819.l
.ACCU 8
	sep #$20
	lda #$17.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$02.b
	sta BG1SC.w		; BG1 Tilemap Address and Size
	lda #$0A.b
	sta BG2SC.w		; BG2 Tilemap Address and Size
	lda #$12.b
	sta BG3SC.w		; BG3 Tilemap Address and Size
	lda #$09.b
	sta BGMODE.w		; BG Mode and Character Size
	lda #$01.b
	sta BG34NBA.w		; BG3&4 Tilemap Character Address
	lda #$03.b
	sta OBJSEL.w		; Object Size and Chr Address
	lda $1C78.w
	sta $1E4E.w
.ACCU 16
	rep #$20
	and #$00FF.w
	clc		; Clear carry
	adc #$0010.w
	pha
	jsr L00A9A0.w
	pla
	pha
	jsr L00A9CB.w
	pla
	jsr L00A9F2.w
	lda $1C88.w
	sta $1E4A.w
	lda $1C8A.w
	sta $1E4C.w
	ldx #$0000.w
L00A615:
	lda $1E52.w,X
	cmp $1E4A.w,X
	lda $1E54.w,X
	sbc $1E4C.w,X
	bcs L00A668.b
	lda $1E52.w,X
	tay
	lda $1E4A.w,X
	sta $1E52.w,X
	tya
	sta $1E4A.w,X
	lda $1E54.w,X
	tay
	lda $1E4C.w,X
	sta $1E54.w,X
	tya
	sta $1E4C.w,X
	lda $1E56.w,X
	tay
	lda $1E4E.w,X
	sta $1E56.w,X
	tya
	sta $1E4E.w,X
	lda $1E58.w,X
	tay
	lda $1E50.w,X
	sta $1E58.w,X
	tya
	sta $1E50.w,X
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	cpx #$0028.w
	bne L00A615.b
L00A668:
	stx $0200.w
	stz $0202.w
	lda #$0022.w
	jsr L00A9A0.w
	lda #$0022.w
	jsr L00A9CB.w
	lda #$0022.w
	jsr L00A9F2.w
	lda #$0005.w
	jsr L00A9CB.w
	lda #$000A.w
	jsr L00A9F2.w
	lda #$001E.w
	jsr L00A9F2.w
	jsr L009D07.w
	lda $1C88.w
	sta $14.b
	lda $1C8A.w
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	sta $16.b
	jsr L00AFC9.w
	lda #$0007.w
	sta $20.b
	lda #$1C28.w
	sta $0C.b
	stz $0E.b
	lda #$3500.w
	ldx #$000C.w
	ldy #$0018.w
	jsl L000798.l
	jsr L008A7F.w
	lda #$6000.w
	ldx #$0000.w
	txy
	jsl L00154E.l
	lda #$00FF.w
	sta $0F34.w
	sta $0F38.w
	sta $0F3C.w
	lda #$0001.w
	ldx #$A511.w
	jsl L000385.l
	jsl L000521.l
L00A6EF:
	jsl L0003AB.l
	lda $0F34.w
	bpl L00A6EF.b
L00A6F8:
	jsl L0003AB.l
	lda $0960.w
	and #$1FB0.w
	beq L00A6F8.b
	bit #$1080.w
	beq L00A70E.b
	jsl L000401.l
	rts

L00A70E:
	bit #$0220.w
	beq L00A722.b
	lda $0202.w
	dec A
	bmi L00A71C.b
	sta $0202.w
L00A71C:
	jsl L000401.l
	bra L00A6F8.b
L00A722:
	bit #$0110.w
	beq L00A739.b
	lda $0202.w
	inc A
	cmp #$0003.w
	bcs L00A733.b
	sta $0202.w
L00A733:
	jsl L000401.l
	bra L00A6F8.b
L00A739:
	bit #$0800.w
	beq L00A763.b
	lda $0200.w
	clc		; Clear carry
	adc $0202.w
	tax
.ACCU 8
	sep #$20
	lda $1E4F.w,X
	inc A
	cmp #$7E.b
	bcc L00A752.b
	lda #$20.b
L00A752:
	sta $1E4F.w,X
.ACCU 16
	rep #$20
	ldx #$000F.w
	ldy #$0000.w
	jsl L0003EE.l
	bra L00A6F8.b
L00A763:
	lda $0200.w
	clc		; Clear carry
	adc $0202.w
	tax
.ACCU 8
	sep #$20
	lda $1E4F.w,X
	dec A
	cmp #$20.b
	bcs L00A777.b
	lda #$7D.b
L00A777:
	sta $1E4F.w,X
.ACCU 16
	rep #$20
	ldx #$000F.w
	ldy #$0000.w
	jsl L0003EE.l
	jmp L00A6F8.w
	brk $80.b		; 00 80
	sbc $009A.w		; ED 9A 00
	bra -97.b		; 80 9F
	sta ($B6.b,X)		; 81 B6
	.db $82, $00, $00		; 82 00 00
	ora [$BF.b],Y		; 17 BF
	tya		; 98
	cmp ($50.b,X)		; C1 50
	sbc #$B0AB.w		; E9 AB B0
	lda ($B6.b)		; B2 B6
	tsx		; BA
	ldy $0000.w,X		; BC 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	pla		; 68
	lda $6BE958.l,X		; BF 58 E9 6B
	pea $B6E7.w		; F4 E7 B6
	cpx $0DC2.w		; EC C2 0D
.ACCU 16
.INDEX 16
	rep #$BA		; C2 BA
	dex		; CA
	eor $0000F0.l		; 4F F0 00 00
	brk $00.b		; 00 00
	pea $3CF0.w		; F4 F0 3C
	cpx $50.b		; E4 50
	sbc #$DF6C.w		; E9 6C DF
	and $0000E7.l,X		; 3F E7 00 00
	plp		; 28
	cmp $EE7F.w,Y		; D9 7F EE
	sec		; 38
	phx		; DA
	adc [$E2.b]		; 67 E2
	ror A		; 6A
	sbc $04EFE4.l		; EF E4 EF 04
	tsb $0D.b		; 04 0D
	tsb $04.b		; 04 04
	brk $04.b		; 00 04
	inc A		; 1A
	ora $00.b		; 05 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $11.b		; 00 11
	ora $15.b,X		; 15 15
	asl $0D0D.w		; 0E 0D 0D
	ora [$1F.b]		; 07 1F
	brk $00.b		; 00 00
	ora $1E0504.l,X		; 1F 04 05 1E
	asl $1F00.w,X		; 1E 00 1F
	asl $0E1A.w,X		; 1E 1A 0E
	ora $10001F.l,X		; 1F 1F 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $10.b		; 00 10
	brk $00.b		; 00 00
	brk $08.b		; 00 08
	jsr $0012.w		; 20 12 00
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
	brk $08.b		; 00 08
	jsr $2012.w		; 20 12 20
	cop $1F.b		; 02 1F
	sbc $F5.b,X		; F5 F5
	txy		; 9B
	jsl $F51F83.l		; 22 83 1F F5
	bit #$1F85.w		; 89 85 1F
	sbc $37.b,X		; F5 37
	cpy $5A.b		; C4 5A
	cmp $0A.b		; C5 0A
	cpx $8000.w		; EC 00 80
	inc $2891.w,X		; FE 91 28
	ldy $00.b		; A4 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $DC.b		; 00 DC
	lda $1AEAFA.l,X		; BF FA EA 1A
	inc $5C.b,X		; F6 5C
	clv		; B8
	brk $00.b		; 00 00
	lda [$C2.b]		; A7 C2
	eor $CB.b,S		; 43 CB
	jmp.w [$BFC4]		; DC C4 BF
	sep #$00		; E2 00
	brk $A5.b		; 00 A5
	cpy $E756.w		; CC 56 E7
	asl A		; 0A
	cpx $E039.w		; EC 39 E0
	brk $E8.b		; 00 E8
	brk $00.b		; 00 00
	and $C0.b		; 25 C0
	bit #$9BD1.w		; 89 D1 9B
	jmp.w [$E6FE]		; DC FE E6
	cop $04.b		; 02 04
	ora $0402.w		; 0D 02 04
	cop $04.b		; 02 04
	inc A		; 1A
	ora $0E.b		; 05 0E
	asl $000E.w		; 0E 0E 00
	brk $00.b		; 00 00
	ora ($15.b),Y		; 11 15
	ora $0E.b,X		; 15 0E
	brk $0D.b		; 00 0D
	ora [$0D.b]		; 07 0D
	ora $0700.w		; 0D 00 07
	tsb $05.b		; 04 05
	asl $001E.w,X		; 1E 1E 00
	asl $1F0E.w		; 0E 0E 1F
	asl $6000.w		; 0E 00 60
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $10.b		; 00 10
	brk $20.b		; 00 20
	brk $18.b		; 00 18
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $30.b		; 00 30
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $4D.b		; 00 4D
	brk $58.b		; 00 58
	brk $58.b		; 00 58
	brk $00.b		; 00 00
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $20.b		; 00 20
	brk $40.b		; 00 40
	brk $00.b		; 00 00
	rts		; 60

	.db $42, $60		; 42 60
	.db $42, $60		; 42 60
	.db $42, $00		; 42 00
	rti		; 40

	cmp ($FB.b),Y		; D1 FB
	inc $C5A4.w,X		; FE A4 C5
	sta $BEF7.w,Y		; 99 F7 BE
	sbc $1899.w		; ED 99 18
	phx		; DA
	bit $3FE2.w,X		; 3C E2 3F
	cmp ($D2.b),Y		; D1 D2
	plx		; FA
	ora ($FC.b),Y		; 11 FC
	sbc ($FB.b,S),Y		; F3 FB
	sta $B756C9.l		; 8F C9 56 B7
	jmp $D962C8.l		; 5C C8 62 D9
	bpl -60.b		; 10 C4
	rtl		; 6B

	sbc ($B9.b,S),Y		; F3 B9
	xce		; FB
	and $BF.b		; 25 BF
	jmp.w [$60C3]		; DC C3 60
	inc $DF4C.w,X		; FE 4C DF
	cmp ($E8.b)		; D2 E8
	bit $ACDF.w		; 2C DF AC
	dec $F709.w,X		; DE 09 F7
	ply		; 7A
	sbc ($D2.b,S),Y		; F3 D2
	plx		; FA
	and $0000E6.l,X		; 3F E6 00 00
	dec $E8.b		; C6 E8
	brk $00.b		; 00 00
	bit $00E2.w,X		; 3C E2 00
	brk $A4.b		; 00 A4
	sbc ($02.b,S),Y		; F3 02
	tsb $0D.b		; 04 0D
	tsb $04.b		; 04 04
	inc A		; 1A
	tsb $1A.b		; 04 1A
	ora $02.b		; 05 02
	cop $0D.b		; 02 0D
	ora [$17.b],Y		; 17 17
	ora [$11.b],Y		; 17 11
	ora $15.b,X		; 15 15
	asl $0F0D.w		; 0E 0D 0F
	asl $1E0D.w,X		; 1E 0D 1E
	asl $041F.w,X		; 1E 1F 04
	ora $1E.b		; 05 1E
	brk $11.b		; 00 11
	brk $04.b		; 00 04
	brk $0E.b		; 00 0E
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	ora ($00.b,X)		; 01 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cpy #$0080.w		; C0 80 00
	beq -128.b		; F0 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $80.b		; 00 80
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	jsr $8080.w		; 20 80 80
	bpl -128.b		; 10 80
	bpl -128.b		; 10 80
	rti		; 40

	bra -128.b		; 80 80
	ora $404060.l		; 0F 60 40 40
	rti		; 40

	bpl -128.b		; 10 80
	bra -128.b		; 80 80
	jsr $1030.w		; 20 30 10
	rts		; 60

	bpl L00A9D6.b		; 10 40
	bra -128.b		; 80 80
	bra -128.b		; 80 80
	brk $10.b		; 00 10
	brk $FF.b		; 00 FF
	brk $40.b		; 00 40
L00A9A0:
	tay
	asl A
	tax
	phx
	lda $01A789.l,X
	sta $0C.b
	lda $01A7F8.l,X
	sta $0990.w
	tyx
	lda $01A7D3.l,X
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	plx
	ldx #$0000.w
	txy
	jsl L0005AC.l
	rts

L00A9CB:
	tay
	asl A
	tax
	phx
	lda $01A842.l,X
	sta $0C.b
	tyx
L00A9D6:
	lda $01A888.l,X
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	plx
	pha
	lda $01A8AB.l,X
	tax
	pla
	jsl L0006C9.l
	rts

L00A9F2:
	tay
	asl A
	tax
	lda $01A8F1.l,X
	sta $0C.b
	tyx
	lda $01A937.l,X
	sta $0E.b
	lda $01A95A.l,X
	tay
	lda $01A97D.l,X
	tax
	tya
	jsl L000583.l
	rts

	ora ($00.b,X)		; 01 00
	ora $000F00.l		; 0F 00 0F 00
	ora $000F00.l		; 0F 00 0F 00
	ora $000F00.l		; 0F 00 0F 00
	sei		; 78
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0A.b		; 00 0A
	brk $0C.b		; 00 0C
	brk $0B.b		; 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $0B000D.l,X		; FF 0D 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $0B000E.l,X		; FF 0E 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $0B000F.l,X		; FF 0F 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $0B0010.l,X		; FF 10 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $0B0011.l,X		; FF 11 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $0B0012.l,X		; FF 12 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $140012.l,X		; FF 12 00 14
	brk $0B.b		; 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $150012.l,X		; FF 12 00 15
	brk $0B.b		; 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $160012.l,X		; FF 12 00 16
	brk $0B.b		; 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $170012.l,X		; FF 12 00 17
	brk $0B.b		; 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $180012.l,X		; FF 12 00 18
	brk $0B.b		; 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $190012.l,X		; FF 12 00 19
	brk $0B.b		; 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $1A0012.l,X		; FF 12 00 1A
	brk $1B.b		; 00 1B
	brk $0B.b		; 00 0B
	brk $13.b		; 00 13
	brk $FF.b		; 00 FF
	sbc $0F000F.l,X		; FF 0F 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $B4.b		; 00 B4
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $0F.b		; 00 0F
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	brk $02.b		; 00 02
	brk $03.b		; 00 03
	brk $04.b		; 00 04
	brk $05.b		; 00 05
	brk $06.b		; 00 06
	brk $07.b		; 00 07
	brk $06.b		; 00 06
	brk $05.b		; 00 05
	brk $04.b		; 00 04
	brk $03.b		; 00 03
	brk $02.b		; 00 02
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $59.b		; 00 59
	adc $6D2075.l		; 6F 75 20 6D
	adc ($6B.b,X)		; 61 6B
	adc $20.b		; 65 20
	adc $2079.w		; 6D 79 20
	eor [$72.b]		; 47 72
	adc ($6E.b,X)		; 61 6E
	stz $6D.b		; 64 6D
	adc ($20.b,X)		; 61 20
	jmp ($6F6F.w)		; 6C 6F 6F
	rtl		; 6B

	brk $6C.b		; 00 6C
	adc #$656B.w		; 69 6B 65
	jsr $2061.w		; 20 61 20
	adc ($61.b)		; 72 61
	adc $65.b,S		; 63 65
	jsr $6163.w		; 20 63 61
	adc ($20.b)		; 72 20
	stz $72.b		; 64 72
	adc #$6576.w		; 69 76 65
	adc ($2E.b)		; 72 2E
	brk $57.b		; 00 57
	pla		; 68
	adc $72.b		; 65 72
	adc $60.b		; 65 60
	stz $20.b		; 64 20
	adc $756F.w,Y		; 79 6F 75
	jsr $656C.w		; 20 6C 65
	adc ($72.b,X)		; 61 72
	ror $7420.w		; 6E 20 74
	adc $726420.l		; 6F 20 64 72
	adc #$6576.w		; 69 76 65
	and $434100.l,X		; 3F 00 41 43
	eor $2045.w		; 4D 45 20
	stz $72.b		; 64 72
	adc #$6976.w		; 69 76 69
	ror $2067.w		; 6E 67 20
	adc ($63.b,S),Y		; 73 63
	pla		; 68
	adc $3F6C6F.l		; 6F 6F 6C 3F
	brk $4D.b		; 00 4D
	adc ($79.b,X)		; 61 79
	.db $62, $65, $20		; 62 65 20
	adc ($20.b,X)		; 61 20
	stz $72.b,X		; 74 72
	adc #$7963.w		; 69 63 79
	adc $6C.b,S		; 63 6C
	adc $20.b		; 65 20
	adc #$2073.w		; 69 73 20
	adc $726F.w		; 6D 6F 72
	adc $00.b		; 65 00
	adc $756F.w,Y		; 79 6F 75
	adc ($20.b)		; 72 20
	adc ($70.b,S),Y		; 73 70
	adc $65.b		; 65 65
	stz $2E.b		; 64 2E
	brk $54.b		; 00 54
	pla		; 68
	adc $20.b		; 65 20
	adc [$61.b]		; 67 61
	adc ($20.b,S),Y		; 73 20
	bvs 101.b		; 70 65
	stz $61.b		; 64 61
	jmp ($6920.w)		; 6C 20 69
	adc ($20.b,S),Y		; 73 20
	adc $74206E.l		; 6F 6E 20 74
	pla		; 68
	adc $00.b		; 65 00
	adc ($69.b)		; 72 69
	adc [$68.b]		; 67 68
	stz $21.b,X		; 74 21
	brk $47.b		; 00 47
	adc $616620.l		; 6F 20 66 61
	adc ($74.b,S),Y		; 73 74
	adc $72.b		; 65 72
	rol $2020.w		; 2E 20 20
	mvn $69,$68		; 54 68 69
	adc ($20.b,S),Y		; 73 20
	adc #$2073.w		; 69 73 20
	adc $796C6E.l		; 6F 6E 6C 79
	jsr $0061.w		; 20 61 00
	adc [$61.b]		; 67 61
	adc $2E65.w		; 6D 65 2E
	brk $43.b		; 00 43
	adc $20656D.l		; 6F 6D 65 20
	adc $20216E.l		; 6F 6E 21 20
	jsr $7355.w		; 20 55 73
	adc $20.b		; 65 20
	stz $68.b,X		; 74 68
	adc ($74.b,X)		; 61 74
	jsr $656C.w		; 20 6C 65
	adc ($64.b,X)		; 61 64
	brk $66.b		; 00 66
	adc $20746F.l		; 6F 6F 74 20
	adc $792066.l		; 6F 66 20 79
	adc $737275.l		; 6F 75 72 73
	rol $5300.w		; 2E 00 53
	bvs 111.b		; 70 6F
	adc ($74.b)		; 72 74
	adc ($20.b,S),Y		; 73 20
	adc $61.b,S		; 63 61
	adc ($73.b)		; 72 73
	jsr $6163.w		; 20 63 61
	ror $6720.w		; 6E 20 67
	adc $756D20.l		; 6F 20 6D 75
	adc $68.b,S		; 63 68
	brk $66.b		; 00 66
	adc ($73.b,X)		; 61 73
	stz $65.b,X		; 74 65
	adc ($20.b)		; 72 20
	stz $68.b,X		; 74 68
	adc ($6E.b,X)		; 61 6E
	jsr $6874.w		; 20 74 68
	adc ($74.b,X)		; 61 74
	and ($00.b,X)		; 21 00
	mvp $6E,$6F		; 44 6F 6E
	rts		; 60

	stz $20.b,X		; 74 20
	adc [$69.b]		; 67 69
	ror $65.b,X		; 76 65
	jsr $7075.w		; 20 75 70
	jsr $6F79.w		; 20 79 6F
	adc $72.b,X		; 75 72
	jsr $6164.w		; 20 64 61
	adc $6A20.w,Y		; 79 20 6A
	adc $002C62.l		; 6F 62 2C 00
	stz $72.b		; 64 72
	adc #$6976.w		; 69 76 69
	ror $2067.w		; 6E 67 20
	adc #$6E73.w		; 69 73 6E
	rts		; 60

	stz $20.b,X		; 74 20
	ror $6F.b		; 66 6F
	adc ($20.b)		; 72 20
	adc $756F.w,Y		; 79 6F 75
	rol $4100.w		; 2E 00 41
	adc $74.b,X		; 75 74
	adc $686162.l		; 6F 62 61 68
	ror $2073.w		; 6E 73 20
	adc [$65.b],Y		; 77 65
	adc ($65.b)		; 72 65
	jsr $616D.w		; 20 6D 61
	stz $65.b		; 64 65
	jsr $6F66.w		; 20 66 6F
	adc ($00.b)		; 72 00
	stz $72.b		; 64 72
	adc #$6576.w		; 69 76 65
	adc ($73.b)		; 72 73
	jsr $696C.w		; 20 6C 69
	rtl		; 6B

	adc $20.b		; 65 20
	adc $756F.w,Y		; 79 6F 75
	rol $5700.w		; 2E 00 57
	pla		; 68
	adc ($74.b,X)		; 61 74
	rts		; 60

	adc ($20.b,S),Y		; 73 20
	stz $68.b,X		; 74 68
	adc $20.b		; 65 20
	adc $7461.w		; 6D 61 74
	stz $65.b,X		; 74 65
	adc ($2C.b)		; 72 2C
	jsr $6F63.w		; 20 63 6F
	adc $6C.b,X		; 75 6C
	stz $6E.b		; 64 6E
	rts		; 60

	stz $00.b,X		; 74 00
	ror $69.b		; 66 69
	ror $2064.w		; 6E 64 20
	stz $68.b,X		; 74 68
	adc $20.b		; 65 20
	.db $62, $72, $61		; 62 72 61
	rtl		; 6B

	adc $73.b		; 65 73
	and $6F4700.l,X		; 3F 00 47 6F
	adc $642064.l		; 6F 64 20 64
	adc ($69.b)		; 72 69
	ror $69.b,X		; 76 69
	ror $2C67.w		; 6E 67 2C
	jsr $7562.w		; 20 62 75
	stz $20.b,X		; 74 20
	stz $68.b,X		; 74 68
	adc #$0073.w		; 69 73 00
	adc $61.b,S		; 63 61
	adc ($20.b)		; 72 20
	adc $61.b,S		; 63 61
	ror $6720.w		; 6E 20 67
	adc $616620.l		; 6F 20 66 61
	adc ($74.b,S),Y		; 73 74
	adc $72.b		; 65 72
	and ($00.b,X)		; 21 00
	eor #$7320.w		; 49 20 73
	adc $6C65.w		; 6D 65 6C
	jmp ($7320.w)		; 6C 20 73
	adc $6B6F.w		; 6D 6F 6B
	adc $20.b		; 65 20
	adc $6F.b,S		; 63 6F
	adc $6E69.w		; 6D 69 6E
	adc [$20.b]		; 67 20
	adc $006666.l		; 6F 66 66 00
	adc $742066.l		; 6F 66 20 74
	pla		; 68
	adc $206573.l		; 6F 73 65 20
	stz $69.b,X		; 74 69
	adc ($65.b)		; 72 65
	adc ($21.b,S),Y		; 73 21
	brk $4C.b		; 00 4C
	adc $74.b		; 65 74
	rts		; 60

	adc ($20.b,S),Y		; 73 20
	adc ($65.b,S),Y		; 73 65
	adc $20.b		; 65 20
	adc $756F.w,Y		; 79 6F 75
	adc ($20.b)		; 72 20
	bvs 105.b		; 70 69
	jmp ($746F.w)		; 6C 6F 74
	rts		; 60

	adc ($00.b,S),Y		; 73 00
	jmp ($6369.w)		; 6C 69 63
	adc $6E.b		; 65 6E
	adc ($65.b,S),Y		; 73 65
	and ($00.b,X)		; 21 00
	eor [$72.b]		; 47 72
	adc $61.b		; 65 61
	stz $20.b,X		; 74 20
	stz $72.b		; 64 72
	adc #$6976.w		; 69 76 69
	ror $2167.w		; 6E 67 21
	jsr $5920.w		; 20 20 59
	adc $642075.l		; 6F 75 20 64
	adc $73.b		; 65 73
	adc $72.b		; 65 72
	ror $65.b,X		; 76 65
	brk $74.b		; 00 74
	adc $776F20.l		; 6F 20 6F 77
	ror $7420.w		; 6E 20 74
	pla		; 68
	adc #$2073.w		; 69 73 20
	adc $61.b,S		; 63 61
	adc ($2E.b)		; 72 2E
	brk $49.b		; 00 49
	jsr $6874.w		; 20 74 68
	adc #$6B6E.w		; 69 6E 6B
	jsr $6F79.w		; 20 79 6F
	adc $20.b,X		; 75 20
	.db $62, $72, $6F		; 62 72 6F
	rtl		; 6B

	adc $20.b		; 65 20
	stz $68.b,X		; 74 68
	adc $00.b		; 65 00
	adc ($6F.b,S),Y		; 73 6F
	adc $6E.b,X		; 75 6E
	stz $20.b		; 64 20
	.db $62, $61, $72		; 62 61 72
	adc ($69.b)		; 72 69
	adc $72.b		; 65 72
	and ($00.b,X)		; 21 00
	eor $756F.w,Y		; 59 6F 75
	jsr $696D.w		; 20 6D 69
	adc [$68.b]		; 67 68
	stz $20.b,X		; 74 20
	adc ($73.b,X)		; 61 73
	jsr $6577.w		; 20 77 65
	jmp ($206C.w)		; 6C 6C 20
	adc [$65.b]		; 67 65
	stz $20.b,X		; 74 20
	adc ($69.b)		; 72 69
	stz $00.b		; 64 00
	adc $792066.l		; 6F 66 20 79
	adc $207275.l		; 6F 75 72 20
	adc $7269.w		; 6D 69 72
	adc ($6F.b)		; 72 6F
	adc ($73.b)		; 72 73
	and ($00.b,X)		; 21 00
	eor $756F.w,Y		; 59 6F 75
	jsr $6168.w		; 20 68 61
	stz $20.b		; 64 20
	adc ($20.b,X)		; 61 20
	adc $6C.b,S		; 63 6C
	adc $61.b		; 65 61
	ror $7220.w		; 6E 20 72
	adc $6E.b,X		; 75 6E
	and ($00.b,X)		; 21 00
	.db $42, $6F		; 42 6F
	ror $7375.w		; 6E 75 73
	jsr $6163.w		; 20 63 61
	adc ($20.b)		; 72 20
	adc ($77.b,X)		; 61 77
	adc ($72.b,X)		; 61 72
	stz $65.b		; 64 65
	stz $2E.b		; 64 2E
	brk $54.b		; 00 54
	adc #$656D.w		; 69 6D 65
	adc ($20.b,S),Y		; 73 20
	adc $72.b,S		; 63 72
	adc ($73.b,X)		; 61 73
	pla		; 68
	adc $64.b		; 65 64
	dec A		; 3A
	brk $4E.b		; 00 4E
	adc $6D.b,X		; 75 6D
	.db $62, $65, $72		; 62 65 72
	jsr $666F.w		; 20 6F 66
	jsr $6974.w		; 20 74 69
	adc $6B.b,S		; 63 6B
	adc $74.b		; 65 74
	adc ($3A.b,S),Y		; 73 3A
	brk $45.b		; 00 45
	ror $6967.w		; 6E 67 69
	ror $7365.w		; 6E 65 73
	jsr $6C62.w		; 20 62 6C
	adc $3A6E77.l		; 6F 77 6E 3A
	brk $59.b		; 00 59
	adc $722075.l		; 6F 75 20 72
	adc ($6E.b,X)		; 61 6E
	jsr $756F.w		; 20 6F 75
	stz $20.b,X		; 74 20
	adc $672066.l		; 6F 66 20 67
	adc ($73.b,X)		; 61 73
	rol DMAP0.w		; 2E 00 43
	adc ($72.b,X)		; 61 72
	adc ($20.b,S),Y		; 73 20
	jmp ($6665.w)		; 6C 65 66
	stz $3A.b,X		; 74 3A
	brk $50.b		; 00 50
	adc ($65.b)		; 72 65
	adc ($73.b,S),Y		; 73 73
	jsr $6E61.w		; 20 61 6E
	adc $6220.w,Y		; 79 20 62
	adc $74.b,X		; 75 74
	stz $6F.b,X		; 74 6F
	ror $002E.w		; 6E 2E 00
	eor $756F.w,Y		; 59 6F 75
	jsr $6F77.w		; 20 77 6F
	ror $7420.w		; 6E 20 74
	pla		; 68
	adc ($74.b,X)		; 61 74
	jsr $6F72.w		; 20 72 6F
	adc $6E.b,X		; 75 6E
	stz $21.b		; 64 21
	brk $59.b		; 00 59
	adc $6C2075.l		; 6F 75 20 6C
	adc $207473.l		; 6F 73 74 20
	stz $68.b,X		; 74 68
	adc ($74.b,X)		; 61 74
	jsr $6F72.w		; 20 72 6F
	adc $6E.b,X		; 75 6E
	stz $2E.b		; 64 2E
	brk $59.b		; 00 59
	adc $726075.l		; 6F 75 60 72
	adc $20.b		; 65 20
	adc [$69.b],Y		; 77 69
	ror $696E.w		; 6E 6E 69
	ror $2067.w		; 6E 67 20
	stz $68.b,X		; 74 68
	adc $20.b		; 65 20
	adc [$61.b]		; 67 61
	adc $2165.w		; 6D 65 21
	brk $59.b		; 00 59
	adc $726075.l		; 6F 75 60 72
	adc $20.b		; 65 20
	jmp ($736F.w)		; 6C 6F 73
	adc #$676E.w		; 69 6E 67
	jsr $6874.w		; 20 74 68
	adc $20.b		; 65 20
	adc [$61.b]		; 67 61
	adc $2E65.w		; 6D 65 2E
	brk $59.b		; 00 59
	adc $772075.l		; 6F 75 20 77
	adc $74206E.l		; 6F 6E 20 74
	pla		; 68
	adc $20.b		; 65 20
	adc [$61.b]		; 67 61
	adc $2165.w		; 6D 65 21
	brk $59.b		; 00 59
	adc $6C2075.l		; 6F 75 20 6C
	adc $207473.l		; 6F 73 74 20
	stz $68.b,X		; 74 68
	adc $20.b		; 65 20
	adc [$61.b]		; 67 61
	adc $2E65.w		; 6D 65 2E
	brk $59.b		; 00 59
	adc $672075.l		; 6F 75 20 67
	adc $742074.l		; 6F 74 20 74
	pla		; 68
	adc $20.b		; 65 20
	.db $62, $65, $73		; 62 65 73
	stz $20.b,X		; 74 20
	adc ($70.b,S),Y		; 73 70
	adc $65.b		; 65 65
	stz $21.b		; 64 21
	brk $59.b		; 00 59
	adc $672075.l		; 6F 75 20 67
	adc $742074.l		; 6F 74 20 74
	pla		; 68
	adc $20.b		; 65 20
	.db $62, $65, $73		; 62 65 73
	stz $20.b,X		; 74 20
	adc ($63.b,S),Y		; 73 63
	adc $216572.l		; 6F 72 65 21
	brk $4C.b		; 00 4C
	adc #$6563.w		; 69 63 65
	ror $6573.w		; 6E 73 65
	jsr $6572.w		; 20 72 65
	ror $6F.b,X		; 76 6F
	rtl		; 6B

	adc $64.b		; 65 64
	jsr $6E61.w		; 20 61 6E
	stz $20.b		; 64 20
	adc ($20.b,X)		; 61 20
	and ($30.b,S),Y		; 33 30
	brk $64.b		; 00 64
	adc ($79.b,X)		; 61 79
	jsr $616A.w		; 20 6A 61
	adc #$206C.w		; 69 6C 20
	adc ($65.b,S),Y		; 73 65
	ror $6574.w		; 6E 74 65
	ror $6563.w		; 6E 63 65
	jsr $6F66.w		; 20 66 6F
	adc ($20.b)		; 72 20
	stz $68.b,X		; 74 68
	adc $00.b		; 65 00
	ror $6F.b		; 66 6F
	jmp ($6F6C.w)		; 6C 6C 6F
	adc [$69.b],Y		; 77 69
	ror $2067.w		; 6E 67 20
	adc #$666E.w		; 69 6E 66
	adc ($61.b)		; 72 61
	adc $74.b,S		; 63 74
	adc #$6E6F.w		; 69 6F 6E
	adc ($3A.b,S),Y		; 73 3A
	brk $45.b		; 00 45
	sei		; 78
	adc $65.b,S		; 63 65
	adc ($73.b,S),Y		; 73 73
	adc #$6576.w		; 69 76 65
	jsr $7073.w		; 20 73 70
	adc $65.b		; 65 65
	stz $00.b		; 64 00
	eor ($65.b)		; 52 65
	adc $6B.b,S		; 63 6B
	jmp ($7365.w)		; 6C 65 73
	adc ($20.b,S),Y		; 73 20
	stz $72.b		; 64 72
	adc #$6976.w		; 69 76 69
	ror $0067.w		; 6E 67 00
	eor $76.b		; 45 76
	adc ($64.b,X)		; 61 64
	adc #$676E.w		; 69 6E 67
	jsr $6968.w		; 20 68 69
	adc [$68.b]		; 67 68
	adc [$61.b],Y		; 77 61
	adc $7020.w,Y		; 79 20 70
	adc ($74.b,X)		; 61 74
	adc ($6F.b)		; 72 6F
	jmp ($5900.w)		; 6C 00 59
	adc $642075.l		; 6F 75 20 64
	adc ($6F.b)		; 72 6F
	ror $65.b,X		; 76 65
	jsr $6177.w		; 20 77 61
	adc $7420.w,Y		; 79 20 74
	adc $73206F.l		; 6F 6F 20 73
	jmp ($776F.w)		; 6C 6F 77
	bit $7400.w		; 2C 00 74
	adc ($79.b)		; 72 79
	jsr $6168.w		; 20 68 61
	adc ($64.b)		; 72 64
	adc $72.b		; 65 72
	jsr $656E.w		; 20 6E 65
	sei		; 78
	stz $20.b,X		; 74 20
	stz $69.b,X		; 74 69
	adc $2E65.w		; 6D 65 2E
	brk $F2.b		; 00 F2
	tax		; AA
	and $AB.b,S		; 23 AB
	mvn $79,$AB		; 54 AB 79
	plb		; AB
	tya		; 98
	plb		; AB
	lda $E0AB.w,Y		; B9 AB E0
	plb		; AB
	asl A		; 0A
	ldy $AC3D.w		; AC 3D AC
	adc [$AC.b]		; 67 AC
	sty $AC.b,X		; 94 AC
	ldx $E7AC.w,Y		; BE AC E7
	ldy $AD07.w		; AC 07 AD
	bit $AD.b,X		; 34 AD
	eor $0BAD.w,Y		; 59 AD 0B
	plb		; AB
	and $AB6DAB.l,X		; 3F AB 6D AB
	sta ($AB.b),Y		; 91 AB
	lda ($AB.b,S),Y		; B3 AB
	cmp ($AB.b),Y		; D1 AB
	sed		; F8
	plb		; AB
	rol $AC.b		; 26 AC
	eor $AC.b,X		; 55 AC
	sta $AC.b,S		; 83 AC
	plb		; AB
	ldy $ACD7.w		; AC D7 AC
	inc $23AC.w,X		; FE AC 23
	lda $AD4A.w		; AD 4A AD
	adc ($AD.b,S),Y		; 73 AD
	rti		; 40

	.db $42, $A0		; 42 A0
	stx $10.b		; 86 10
	and [$E8.b]		; 27 E8
	ora $64.b,S		; 03 64
	brk $0A.b		; 00 0A
	brk $01.b		; 00 01
	brk $0F.b		; 00 0F
	brk $01.b		; 00 01
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	.db $00		; Opcode overrunning section
L00AFC9:
	php
	phb
	phk
	plb
	lda #$0030.w
	ldx #$0000.w
L00AFD3:
	sta $1C28.w,X
	inx
	cpx #$0007.w
	bne L00AFD3.b
	ldx #$0000.w
	txy
L00AFE0:
	lda $14.b
	cmp $AFAD.w,Y
	lda $16.b
	sbc $AFBB.w,Y
	bcc L00B004.b
	lda $14.b
	sec		; Set carry
	sbc $AFAD.w,Y
	sta $14.b
	lda $16.b
	sbc $AFBB.w,Y
	sta $16.b
.ACCU 8
	sep #$20
	inc $1C28.w,X
.ACCU 16
	rep #$20
	bra L00AFE0.b
L00B004:
	iny
	iny
	inx
	cpy #$000E.w
	bne L00AFE0.b
.ACCU 8
	sep #$20
	ldx #$0000.w
L00B011:
	lda #$30.b
	cmp $1C28.w,X
	bne L00B023.b
	lda #$20.b
	sta $1C28.w,X
	inx
	cpx #$0006.w
	bne L00B011.b
L00B023:
.ACCU 16
	rep #$20
	stz $20.b
	lda #$1C28.w
	sta $0C.b
	plb
	plp
	rts

L00B02F:
	php
	phb
	phk
	plb
	pha
	lda #$0030.w
	ldx #$0000.w
L00B03A:
	sta $1C28.w,X
	inx
	cpx #$0005.w
	bne L00B03A.b
	stz $1C28.w,X
	pla
	ldx #$0000.w
	txy
L00B04B:
	cmp $AFB1.w,Y
	bcc L00B05C.b
	sbc $AFB1.w,Y
.ACCU 8
	sep #$20
	inc $1C28.w,X
.ACCU 16
	rep #$20
	bra L00B04B.b
L00B05C:
	iny
	iny
	inx
	cpy #$000A.w
	bne L00B04B.b
.ACCU 8
	sep #$20
	ldx #$0000.w
L00B069:
	lda #$30.b
	cmp $1C28.w,X
	bne L00B07B.b
	lda #$20.b
	sta $1C28.w,X
	inx
	cpx #$0004.w
	bne L00B069.b
L00B07B:
.ACCU 16
	rep #$20
	stz $20.b
	lda #$1C28.w
	sta $0C.b
	plb
	plp
	rts

L00B087:
	tax
.ACCU 8
	sep #$20
	stz $12.b
	lda $0082BE.l,X
	and #$0F.b
	ora #$30.b
	sta $11.b
	lda $0082BE.l,X
	lsr A
	lsr A
	lsr A
	lsr A
	bne L00B0A2.b
	lda #$F0.b
L00B0A2:
	clc		; Clear carry
	adc #$30.b
	sta $10.b
.ACCU 16
	rep #$20
	lda #$0010.w
	sta $0C.b
	rts

L00B0AF:
	php
	phy
	jsr L00B02F.w
	ply
	ldx #$0018.w
	lda $1E32.w
	jsl L000798.l
	plp
	rts

L00B0C1:
	php
	phb
	phk
	plb
	ldx $14.b
	lda #$003C.w
	jsl L000AFE.l
	tax
	lda RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	sta $14.b
	lda #$003C.w
	jsl L000AFE.l
	sta $16.b
.ACCU 8
	sep #$20
	ldx RDMPYL.w		; Multiplication Product or Divide Remainder Low Byte
	lda $0082BE.l,X
	and #$0F.b
	ora #$30.b
	sta $1C2C.w
	lda $0082BE.l,X
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$30.b
	sta $1C2B.w
	ldx $16.b
	lda $0082BE.l,X
	and #$0F.b
	ora #$30.b
	sta $1C29.w
	lda $0082BE.l,X
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$30.b
	sta $1C28.w
	lda #$3A.b
	sta $1C2A.w
	lda #$2E.b
	sta $1C2D.w
	stz $1C30.w
	lda $14.b
	xba
	tax
	lda #$9A.b
	jsl L000AFE.l
	tax
	lda $0082BE.l,X
	and #$0F.b
	ora #$30.b
	sta $1C2F.w
	lda $0082BE.l,X
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$30.b
	sta $1C2E.w
.ACCU 16
	rep #$20
	stz $20.b
	lda #$1C28.w
	sta $0C.b
.ACCU 8
	sep #$20
	lda $1C28.w
	cmp #$30.b
	bne L00B15B.b
	lda #$20.b
	sta $1C28.w
L00B15B:
	plb
	plp
	rts

L00B15E:
	php
	phb
	phk
	plb
	ldx $14.b
	lda #$009B.w
	jsl L000926.l
	ldx $0A.b
.ACCU 8
	sep #$20
	lda $0082BE.l,X
	and #$0F.b
	ora #$30.b
	sta $1C29.w
	lda $0082BE.l,X
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$30.b
	sta $1C28.w
.ACCU 16
	rep #$20
	ldx $08.b
	lda #$0064.w
	jsl L000926.l
.ACCU 8
	sep #$20
	ldx $0A.b
	lda $0082BE.l,X
	and #$0F.b
	ora #$30.b
	sta $1C2C.w
	lda $0082BE.l,X
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$30.b
	sta $1C2B.w
	lda #$2E.b
	sta $1C2A.w
	stz $1C2D.w
.ACCU 16
	rep #$20
	stz $20.b
	lda #$1C28.w
	sta $0C.b
	plb
	plp
	rts

.ACCU 8
	sep #$20		; E2 20
	lda $22.b		; A5 22
	sta BG2VOFS.w		; 8D 10 21
	lda $23.b		; A5 23
	sta BG2VOFS.w		; 8D 10 21
.ACCU 16
	rep #$20		; C2 20
	lda $1E40.w		; AD 40 1E
	beq   5.b		; F0 05
	dec $1E40.w		; CE 40 1E
	bra  30.b		; 80 1E
.ACCU 8
	sep #$20		; E2 20
	lda STAT78.w		; AD 3F 21
	bpl  23.b		; 10 17
.ACCU 16
	rep #$20		; C2 20
	lda $0964.w		; AD 64 09
	and #$0006.w		; 29 06 00
	bne  13.b		; D0 0D
	lda $22.b		; A5 22
	inc A		; 1A
	cmp $0432.w		; CD 32 04
	bne   3.b		; D0 03
	lda #$0033.w		; A9 33 00
	sta $22.b		; 85 22
	rtl		; 6B

L00B1F9:
	php
	phk
	plb
.ACCU 16
.INDEX 16
	rep #$30
	jsl L00050F.l
	jsl L00083F.l
.ACCU 8
	sep #$20
	lda #$13.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$03.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
	rep #$20
	lda #$0002.w
	ldx $1C80.w
	cpx $1CA8.w
	bcs L00B226.b
	lda $1C78.w
	clc		; Clear carry
	adc #$001F.w
L00B226:
	pha
	jsr L00A9A0.w
	lda #$0002.w
	jsr L00A9CB.w
	pla
	jsr L00A9CB.w
	lda #$0002.w
	jsr L00A9F2.w
	lda $1CAC.w
	asl A
	tax
	phx
	lda $018564.l,X
	sta $0C.b
	lda #$0007.w
	sta $0E.b
	lda #$0800.w
	sta $0990.w
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	ldx #$0000.w
	txy
	jsl L0005AC.l
	plx
	lda $018576.l,X
	sta $0C.b
	lda #$0007.w
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	ldx #$1000.w
	jsl L0006C9.l
	lda $1CAE.w
	asl A
	tax
	lda $018588.l,X
	sta $0C.b
	lda #$0006.w
	sta $0E.b
	lda #$0000.w
	ldx #$0020.w
	jsl L000583.l
	lda #$0005.w
	jsr L00A9CB.w
	lda $1C80.w
	cmp $1CA8.w
	bcc L00B2CF.b
	lda $0F77.w
	bne L00B2B9.b
	lda #$0000.w
	jsl L009BA0.l
	lda #$0000.w
	jsl L009C14.l
L00B2B9:
	lda #$D828.w
	sta $0C.b
	lda #$001F.w
	sta $0E.b
	lda #$0080.w
	ldx #$0080.w
	jsl L000583.l
	bra L00B2EA.b
L00B2CF:
	lda #$0005.w
	jsl L009BA0.l
	lda #$ED7F.w
	sta $0C.b
	lda #$001E.w
	sta $0E.b
	lda #$0080.w
	ldx #$0080.w
	jsl L000583.l
L00B2EA:
	lda $1CAA.w
	asl A
	asl A
	asl A
	asl A
	asl A
	adc #$8000.w
	sta $0C.b
	lda #$0003.w
	sta $0E.b
	lda #$00D0.w
	ldx #$0010.w
	jsl L000583.l
	jsr L009D07.w
	lda $1C80.w
	cmp $1CA8.w
	bcs L00B314.b
	jmp L00B4CC.w
L00B314:
	jsl L00042C.l
	and #$0003.w
	sta $22.b
	ldx #$0000.w
	lda $1D10.w
	cmp #$3C00.w
	bcc L00B335.b
	inx
	cmp #$6400.w
	bcc L00B335.b
	inx
	cmp #$8C00.w
	bcc L00B335.b
	inx
L00B335:
	txa
	stx $10.b
	asl A
	asl A
	adc $22.b
	asl A
	sta $22.b
	tax
	lda $01AF6D.l,X
	sta $0C.b
	lda #$0001.w
	sta $0E.b
	stz $20.b
	ldy #$0000.w
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	ldx $22.b
	lda $01AF8D.l,X
	sta $0C.b
	ldy #$0001.w
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	lda #$0003.w
	sta $22.b
	lda $1D10.w
	cmp #$4100.w
	bcs L00B3AB.b
	lda #$AF3F.w
	sta $0C.b
	ldy $22.b
	inc $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	lda #$AF57.w
	sta $0C.b
	ldy $22.b
	inc $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	inc $22.b
	lda #$0029.w
	jsl L002212.l
L00B3AB:
	lda $12D8.w
	ora $12DE.w
	ora $12DC.w
	ora $12E0.w
	bne L00B3CC.b
	lda #$AD84.w
	sta $0C.b
	ldy $22.b
	inc $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
L00B3CC:
	lda $1D10.w
	cmp #$4100.w
	bcc L00B40C.b
	lda $1C86.w
	beq L00B40C.b
	lda $1C74.w
	bne L00B3EE.b
	lda $12D8.w
	ora $12DE.w
	ora $12DC.w
	ora $12E0.w
	bne L00B40C.b
	bra L00B3F6.b
L00B3EE:
	lda $1D10.w
	cmp #$7800.w
	bcc L00B40C.b
L00B3F6:
	lda #$AD99.w
	sta $0C.b
	ldy $22.b
	inc $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	inc $1C86.w
L00B40C:
	lda #$ADF1.w
	sta $0C.b
	ldy $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	lda $1C86.w
	jsr L00B087.w
	ldy $22.b
	inc $22.b
	ldx #$0016.w
	lda #$3100.w
	jsl L000798.l
	lda $12D8.w
	beq L00B45B.b
	lda #$ADAC.w
	sta $0C.b
	ldy $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	lda $12D8.w
	jsr L00B087.w
	ldy $22.b
	inc $22.b
	ldx #$0016.w
	lda #$3100.w
	jsl L000798.l
L00B45B:
	lda $12DC.w
	beq L00B485.b
	lda #$ADCE.w
	sta $0C.b
	ldy $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	lda $12DC.w
	jsr L00B087.w
	ldy $22.b
	inc $22.b
	ldx #$0016.w
	lda #$3100.w
	jsl L000798.l
L00B485:
	lda $12DE.w
	beq L00B4AF.b
	lda #$ADBB.w
	sta $0C.b
	ldy $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	lda $12DE.w
	jsr L00B087.w
	ldy $22.b
	inc $22.b
	ldx #$0016.w
	lda #$3100.w
	jsl L000798.l
L00B4AF:
	lda $12E0.w
	bne L00B4B7.b
	jmp L00B542.w
L00B4B7:
	lda #$ADDD.w
	sta $0C.b
	ldy $22.b
	inc $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	bra L00B542.b
L00B4CC:
	lda #$01AE.w
	sta $0D.b
	lda #$AEBD.w
	sta $0C.b
	ldx #$0003.w
	ldy #$0000.w
	lda #$3100.w
	jsl L000798.l
	lda #$AED6.w
	sta $0C.b
	ldx #$0003.w
	ldy #$0001.w
	lda #$3100.w
	jsl L000798.l
	lda #$AEF0.w
	sta $0C.b
	ldx #$0003.w
	ldy #$0002.w
	lda #$3100.w
	jsl L000798.l
	lda #$AF07.w
	sta $0C.b
	ldx #$0003.w
	ldy #$0003.w
	lda #$3100.w
	jsl L000798.l
	lda #$AF17.w
	sta $0C.b
	ldx #$0003.w
	ldy #$0004.w
	lda #$3100.w
	jsl L000798.l
	lda #$AF28.w
	sta $0C.b
	ldx #$0003.w
	ldy #$0005.w
	lda #$3100.w
	jsl L000798.l
	lda #$0007.w
	sta $22.b
L00B542:
	lda #$ADFC.w
	sta $0C.b
	ldy $22.b
	inc $22.b
	ldx #$0003.w
	lda #$3100.w
	jsl L000798.l
	lda #$7800.w
	sta $0C.b
	lda #$007E.w
	sta $0E.b
	lda $22.b
	inc A
	asl A
	asl A
	asl A
	sta $0432.w
	asl A
	asl A
	sta $22.b
	asl A
	ldx #$0C00.w
	jsl L0006C9.l
	lda $22.b
	clc		; Clear carry
	adc #$0C00.w
	tax
	lda #$0080.w
	jsl L0006C9.l
	lda $0432.w
	clc		; Clear carry
	adc #$0033.w
	sta $0432.w
	lda #$9BC5.w
	sta $0C.b
	lda #$000D.w
	sta $0E.b
	lda #$2000.w
	sta $10.b
	jsl L001210.l
	inc $0968.w
	ldx #$0000.w
	txy
	lda #$6000.w
	jsl L00154E.l
	lda #$FFFF.w
	sta $09A8.w
	lda #$2000.w
	sta $10.b
	lda #$007E.w
	sta $12.b
	lda $1CAA.w
	sta $00.b
	lda #$3000.w
	ldx #$0012.w
	ldy #$003F.w
	jsl L00179B.l
	lda $09A2.w
	sta $099C.w
	jsl L0015BD.l
	lda #$0002.w
	sta $09A8.w
	lda #$0064.w
	sta $1E40.w
	lda #$003B.w
	sta $22.b
	lda #$00C4.w
	sta $0F30.w
	ldx #$B1C2.w
	lda #$0001.w
	ldy #$00C4.w
	jsl L000341.l
	lda $1C80.w
	cmp $1CA8.w
	bcc L00B608.b
	jmp L00B6A3.w
L00B608:
	lda $1C78.w
	asl A
	tax
	lda $0185EA.l,X
	sta $0C.b
	lda #$0000.w
	sta $0E.b
	lda #$0080.w
	ldx #$0030.w
	jsl L000583.l
	lda #$0005.w
	jsl L009C14.l
	lda #$0002.w
	sta $09A8.w
	stz $0964.w
	stz $0200.w
	stz $0202.w
L00B638:
	jsl L0003AB.l
	lda $0964.w
	ldx $0200.w
	cmp $01AA12.l,X
	bne L00B68D.b
	stz $0964.w
	inx
	inx
	stx $0200.w
	cpx #$001E.w
	beq L00B692.b
	jsl L00158F.l
	lda #$1F80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
L00B663:
	ldx $0202.w
	lda $01AA32.l,X
	sta $00.b
	inx
	inx
	stx $0202.w
	cmp #$0000.w
	bmi L00B685.b
	ldx #$006E.w
	ldy #$00C2.w
	lda #$2000.w
	jsl L00179B.l
	bra L00B663.b
L00B685:
	jsl L0015BD.l
	jsl L000521.l
L00B68D:
	lda $0960.w
	beq L00B638.b
L00B692:
	lda #$0021.w
	jsl L002212.l
	ldy #$FFFF.w
	jsl L0003C0.l
	jmp L00B755.w
L00B6A3:
	lda #$0001.w
	sta $1E2C.w
	stz $0440.w
	stz $0442.w
	stz $0444.w
	lda #$FFFF.w
	sta $040A.w
	lda $1C78.w
	sta $0202.w
	lda #$0001.w
	ldx #$9D69.w
	jsl L000385.l
	jsl L0003AB.l
	jsl L0003AB.l
	jsl L000521.l
	stz $0408.w
	lda #$00BC.w
	sta $0400.w
	jsl L009F7C.l
	bne L00B755.b
L00B6E3:
	jsl L0003AB.l
	lda $0960.w
	bne L00B755.b
	lda $0440.w
	asl A
	tax
	lda $0442.w
	inc A
	sta $0442.w
	cmp $01AAB2.l,X
	bcc L00B6E3.b
	stz $0442.w
	lda $0440.w
	inc A
	cmp #$000F.w
	beq L00B727.b
	sta $0440.w
	asl A
	tax
	lda $01AAD2.l,X
	sta $0444.w
	ldx $0204.w
	ldy $0206.w
	jsl L009DC6.l
	lda $0960.w
	bne L00B755.b
	bra L00B6E3.b
L00B727:
	ldy #$FFFF.w
	jsl L0003C0.l
	jsl L000401.l
	lda #$0026.w
	jsl L002212.l
	ldx #$0032.w
	ldy #$0000.w
	jsl L0003B4.l
	lda #$002A.w
	jsl L002212.l
	jsl L009F1C.l
	lda #$002A.w
	jsl L0022B4.l
L00B755:
	jsl L000401.l
	stz $1E2C.w
	plp
	rts

L00B75E:
	jsl L00050F.l
	jsl L000819.l
.ACCU 8
	sep #$20
	lda #$07.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$09.b
	sta BGMODE.w		; BG Mode and Character Size
.ACCU 16
	rep #$20
	lda #$FFFC.w
	sta $0F3A.w
	lda #$0014.w
	jsr L00A9A0.w
	lda #$0022.w
	jsr L00A9A0.w
	lda #$0013.w
	jsr L00A9A0.w
	lda #$0000.w
	jsr L00A9CB.w
	lda #$0014.w
	jsr L00A9CB.w
	lda #$0022.w
	jsr L00A9CB.w
	lda #$0007.w
	jsr L00A9F2.w
	lda #$0013.w
	jsr L00A9F2.w
	lda $1C76.w
	beq L00B7BB.b
	lda #$0023.w
	jsr L00A9A0.w
	lda #$0024.w
	jsr L00A9A0.w
L00B7BB:
	stz $20.b
	lda #$1000.w
	sta $0990.w
	lda $1CA8.w
	sta $14.b
	jsr L00B02F.w
	ldy #$0003.w
	ldx #$0016.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1CE8.w
	sta $14.b
	jsr L00B15E.w
	ldy #$0004.w
	ldx #$0016.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1C76.w
	beq L00B862.b
	lda #$0001.w
	sta $0E.b
	ldx #$AE0E.w
	lda $1D08.w
	cmp $1D0C.w
	bcs L00B805.b
	ldx #$AE22.w
L00B805:
	stx $0C.b
	ldy #$0005.w
	ldx #$0004.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1D10.w
	cmp #$4100.w
	bcc L00B829.b
	lda $1CA8.w
	cmp $1C80.w
	beq L00B829.b
	lda $1C86.w
	bne L00B83F.b
L00B829:
	ldx #$AE68.w
	lda $1C88.w
	cmp $1C8C.w
	lda $1C8A.w
	sbc $1C8E.w
	bcs L00B853.b
	ldx #$AE7A.w
	bra L00B853.b
L00B83F:
	ldx #$AE37.w
	lda $1C88.w
	cmp $1C8C.w
	lda $1C8A.w
	sbc $1C8E.w
	bcs L00B853.b
	ldx #$AE50.w
L00B853:
	stx $0C.b
	ldy #$0006.w
	ldx #$0004.w
	lda #$2C00.w
	jsl L0007D9.l
L00B862:
	lda $12A3.w
	sta $14.b
	jsr L00B0C1.w
	ldy #$000A.w
	ldx #$0013.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1D18.w
	sta $14.b
	jsr L00B0C1.w
	ldy #$000B.w
	ldx #$0013.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $12E5.w
	and #$00FF.w
	ldx $12E3.w
	bpl L00B898.b
	inc A
L00B898:
	jsr L00B02F.w
	ldy #$000C.w
	ldx #$0016.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1D11.w
	and #$00FF.w
	ldx $1D0F.w
	bpl L00B8B4.b
	inc A
L00B8B4:
	jsr L00B02F.w
	ldy #$000D.w
	ldx #$0016.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1D08.w
	sta $14.b
	lda #$0000.w
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	sta $16.b
	jsr L00AFC9.w
	ldy #$000E.w
	ldx #$0014.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1C88.w
	sta $14.b
	lda $1C8A.w
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	sta $16.b
	jsr L00AFC9.w
	ldy #$000F.w
	ldx #$0014.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1C76.w
	bne L00B918.b
	jmp L00B9C6.w
L00B918:
	lda $12A5.w
	sta $14.b
	jsr L00B0C1.w
	ldy #$0012.w
	ldx #$0013.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1D1A.w
	sta $14.b
	jsr L00B0C1.w
	ldy #$0013.w
	ldx #$0013.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $12E7.w
	and #$00FF.w
	ldx $12E5.w
	bpl L00B94E.b
	inc A
L00B94E:
	jsr L00B02F.w
	ldy #$0014.w
	ldx #$0016.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1D15.w
	and #$00FF.w
	ldx $1D13.w
	bpl L00B96A.b
	inc A
L00B96A:
	jsr L00B02F.w
	ldy #$0015.w
	ldx #$0016.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1D0C.w
	sta $14.b
	lda #$0000.w
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	sta $16.b
	jsr L00AFC9.w
	ldy #$0016.w
	ldx #$0014.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1C8C.w
	sta $14.b
	lda $1C8E.w
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	sta $16.b
	jsr L00AFC9.w
	ldy #$0017.w
	ldx #$0014.w
	lda #$2C00.w
	jsl L0007D9.l
L00B9C6:
	jsl L000521.l
	ldy #$FFFF.w
	jsl L0003C0.l
	jsl L000401.l
	jsl L0004DF.l
	ldx #$001E.w
	ldy #$0000.w
	jsl L0003B4.l
	lda #$0080.w
	ldx #$0000.w
	ldy #$10A0.w
	jsl L00045B.l
	lda #$0016.w
	jsr L00A9A0.w
	lda #$0024.w
	jsr L00A9A0.w
	lda #$1000.w
	sta $0990.w
	stz $20.b
	lda #$0001.w
	sta $0E.b
	lda $1C82.w
	asl A
	tax
	lda $1E7A.w,X
	cmp $1D10.w
	bcs L00BA2E.b
	lda $1D10.w
	sta $1E7A.w,X
	lda #$AE8D.w
	sta $0C.b
	ldx #$0004.w
	ldy #$0005.w
	lda #$2C00.w
	jsl L0007D9.l
L00BA2E:
	lda $1C82.w
	asl A
	tax
	lda $1EAE.w,X
	cmp $1D08.w
	bcs L00BA53.b
	lda $1D08.w
	sta $1EAE.w,X
	lda #$AEA5.w
	sta $0C.b
	ldx #$0004.w
	ldy #$0006.w
	lda #$2C00.w
	jsl L0007D9.l
L00BA53:
	lda $1C82.w
	asl A
	tax
	lda $1E7A.w,X
	xba
	tax
	and #$00FF.w
	cpx #$8000.w
	bcc L00BA66.b
	inc A
L00BA66:
	sta $14.b
	jsr L00B02F.w
	ldy #$0015.w
	ldx #$0016.w
	lda #$2C00.w
	jsl L0007D9.l
	lda $1C82.w
	asl A
	tax
	lda $1EAE.w,X
	sta $14.b
	lda #$0000.w
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	asl $14.b
	rol A
	sta $16.b
	jsr L00AFC9.w
	ldy #$0016.w
	ldx #$0014.w
	lda #$2C00.w
	jsl L0007D9.l
	jsl L000521.l
	ldy #$FFFF.w
	jsl L0003C0.l
	jsl L000401.l
	rts

.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	phk		; 4B
	plb		; AB
	jsl L00158F.l		; 22 8F 95 00
	lda $0964.w		; AD 64 09
	and #$0010.w		; 29 10 00
	beq  32.b		; F0 20
	lda #$1E80.w		; A9 80 1E
	sta $11.b		; 85 11
	lda #$8000.w		; A9 00 80
	sta $10.b		; 85 10
	lda $1C6A.w		; AD 6A 1C
	clc		; 18
	adc #$000F.w		; 69 0F 00
	sta $00.b		; 85 00
	ldx #$0000.w		; A2 00 00
	ldy #$0000.w		; A0 00 00
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	jsl L0015BD.l		; 22 BD 95 00
	rtl		; 6B

L00BAE8:
	phk
	plb
	jsl L00050F.l
	jsl L000819.l
.ACCU 8
	sep #$20
	lda #$11.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$02.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
.INDEX 16
	rep #$30
	lda #$0001.w
	sta $1C6A.w
	lda #$0006.w
	jsr L00A9A0.w
	lda #$0006.w
	jsr L00A9CB.w
	lda #$0020.w
	jsr L00A9F2.w
	ldx #$0000.w
	txy
	lda #$4000.w
	jsl L00154E.l
	lda #$0001.w
	ldx #$BAB3.w
	jsl L000385.l
	jsl L000521.l
	lda $0996.w
	beq L00BB46.b
	ldx #$012C.w
	ldy #$0000.w
	jsl L0003C0.l
	bne L00BB43.b
	rts

L00BB43:
	stz $0996.w
L00BB46:
	ldx #$1C20.w
	ldy #$0000.w
	jsl L0003C0.l
	bne L00BB56.b
	inc $0996.w
	rts

L00BB56:
	lda $0960.w
	and #$B380.w
	beq L00BB46.b
	bit #$0200.w
	bne L00BBA4.b
	bit #$0100.w
	bne L00BBB7.b
	bit #$A000.w
	bne L00BB9C.b
	ldx #$0000.w
L00BB70:
	lda $0960.w
	beq L00BB7F.b
	cmp #$1080.w
	bne L00BB70.b
L00BB7A:
	ldx #$0001.w
	bra L00BB70.b
L00BB7F:
	lda $1C6A.w
	beq L00BB8D.b
	cmp #$0002.w
	beq L00BB93.b
	lda #$0000.w
	rts

L00BB8D:
	jsr L00C0C7.w
	jmp L00BAE8.w
L00BB93:
	lda #$FFFF.w
	jsr L00A3CC.w
	jmp L00BAE8.w
L00BB9C:
	jsl L000401.l
	lda #$FFFF.w
	rts

L00BBA4:
	lda $1C6A.w
	dec A
	bpl L00BBAD.b
	lda #$0002.w
L00BBAD:
	sta $1C6A.w
	jsl L000401.l
	jmp L00BB46.w
L00BBB7:
	lda $1C6A.w
	inc A
	cmp #$0003.w
	bne L00BBAD.b
	lda #$0000.w
	bra L00BBAD.b
	plb		; AB
	bcs L00BB7A.b		; B0 B2
	ldx $B2.b,Y		; B6 B2
	.db $B6		; Opcode overrunning section
L00BBCB:
	jsl L00050F.l
.ACCU 8
	sep #$20
	lda #$01.b
	sta BGMODE.w		; BG Mode and Character Size
	lda #$01.b
	sta BG1SC.w		; BG1 Tilemap Address and Size
	lda #$12.b
	sta BG2SC.w		; BG2 Tilemap Address and Size
	lda #$32.b
	sta BG12NBA.w		; BG1&2 Tilemap Character Address
	lda #$13.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$03.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
.INDEX 16
	rep #$30
	lda #$0007.w
	jsr L00A9A0.w
	lda #$0007.w
	jsr L00A9CB.w
	lda #$0007.w
	jsr L00A9F2.w
	lda #$FF80.w
	sta $0405.w
	lda #$0008.w
	sta $0410.w
L00BC0F:
	lda $0405.w
	pha
	lda $0410.w
	pha
	stz $0992.w
	lda $0202.w
	clc		; Clear carry
	adc #$0009.w
	pha
	jsr L00A9A0.w
	pla
	jsr L00A9CB.w
	ldx #$0000.w
	txy
	lda #$6000.w
	jsl L00154E.l
	lda #$FFFF.w
	sta $040A.w
	lda #$0001.w
	ldx #$9D69.w
	jsl L000385.l
	jsl L0003AB.l
	jsl L0003AB.l
	stz $0402.w
	stz $0404.w
	lda #$FFFF.w
	sta $040A.w
	lda #$0064.w
	sta $0400.w
	stz $0408.w
	pla
	sta $0410.w
	pla
	eor #$FE00.w
	sta $0405.w
	lda #$FF00.w
	sta $0F32.w
	lda #$FF8F.w
	sta $0F38.w
	jsl L000521.l
L00BC7C:
	jsl L0003AB.l
	lda $0405.w
	sec		; Set carry
	sbc $0410.w
	sta $0405.w
	lda #$0080.w
	sec		; Set carry
	sbc $0405.w
	sta $0F32.w
	bmi L00BC9A.b
	eor #$FFFF.w
	inc A
L00BC9A:
	cmp #$8000.w
	ror A
	cmp #$FF90.w
	bpl L00BCA6.b
	lda #$FF90.w
L00BCA6:
	dec A
	sta $0F38.w
	ldx #$0003.w
	ldy #$0000.w
	jsl L009DC6.l
	lda $0405.w
	cmp #$0080.w
	bne L00BC7C.b
	lda $0996.w
	beq L00BCDB.b
	ldx #$00F0.w
	ldy #$0000.w
	jsl L0003C0.l
	beq L00BCD0.b
	jmp L00BD53.w
L00BCD0:
	dec $1C84.w
	beq L00BD23.b
	lda #$0100.w
	jmp L00BD60.w
L00BCDB:
	ldx #$1C20.w
	ldy #$0000.w
	jsl L0003C0.l
	bne L00BCEC.b
	inc $0996.w
	bra L00BD23.b
L00BCEC:
	lda $0960.w
	and #$BFB0.w
	beq L00BCDB.b
	bit #$0800.w
	beq L00BD09.b
	lda $0F38.w
	cmp #$FFFF.w
	beq L00BD06.b
	dec A
	dec A
	sta $0F38.w
L00BD06:
	jmp L00BCDB.w
L00BD09:
	bit #$0400.w
	beq L00BD1E.b
	lda $0F38.w
	cmp #$00B7.w
	beq L00BD06.b
	inc A
	inc A
	sta $0F38.w
	jmp L00BCDB.w
L00BD1E:
	bit #$1080.w
	beq L00BD4E.b
L00BD23:
	jsl L000401.l
	lda #$0026.w
	jsl L002212.l
	ldx #$0032.w
	ldy #$0000.w
	jsl L0003B4.l
	lda #$002A.w
	jsl L002212.l
	jsl L009F1C.l
	lda #$002A.w
	jsl L0022B4.l
	lda #$0000.w
	rts

L00BD4E:
	bit #$A000.w
	beq L00BD5B.b
L00BD53:
	jsl L000401.l
	lda #$FFFF.w
	rts

L00BD5B:
	bit #$0110.w
	beq L00BDDB.b
L00BD60:
	pha
	lda #$0008.w
	sta $0410.w
L00BD67:
	jsl L0003AB.l
	lda $0405.w
	sec		; Set carry
	sbc $0410.w
	sta $0405.w
	lda #$0080.w
	sec		; Set carry
	sbc $0405.w
	sta $0F32.w
	bmi L00BD85.b
	eor #$FFFF.w
	inc A
L00BD85:
	cmp #$8000.w
	ror A
	cmp #$FF90.w
	bpl L00BD91.b
	lda #$FF90.w
L00BD91:
	dec A
	sta $0F38.w
	ldx #$0003.w
	ldy #$0000.w
	jsl L009DC6.l
	lda $0405.w
	cmp #$FF80.w
	beq L00BDAC.b
	cmp #$0180.w
	bne L00BD67.b
L00BDAC:
	pla
	and #$0220.w
	bne L00BDD0.b
	lda $0202.w
	inc A
	cmp #$0003.w
	bne L00BDBE.b
	lda #$0000.w
L00BDBE:
	sta $0202.w
	jsl L000401.l
	jsl L0004DF.l
	jsl L00052E.l
	jmp L00BC0F.w
L00BDD0:
	lda $0202.w
	dec A
	bpl L00BDBE.b
	lda #$0002.w
	bra L00BDBE.b
L00BDDB:
	pha
	lda #$FFF8.w
	sta $0410.w
	bra L00BD67.b
.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	phk		; 4B
	plb		; AB
	lda $0964.w		; AD 64 09
	and #$0001.w		; 29 01 00
	bne  82.b		; D0 52
	jsl L00158F.l		; 22 8F 95 00
	lda #$1E80.w		; A9 80 1E
	sta $11.b		; 85 11
	lda #$8000.w		; A9 00 80
	sta $10.b		; 85 10
	lda $1C6C.w		; AD 6C 1C
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	adc #$0028.w		; 69 28 00
	tax		; AA
	ldy #$0062.w		; A0 62 00
	lda $22.b		; A5 22
	clc		; 18
	adc #$0008.w		; 69 08 00
	sta $00.b		; 85 00
	lda #$2A00.w		; A9 00 2A
	jsl L001662.l		; 22 62 96 00
	lda $22.b		; A5 22
	inc A		; 1A
	cmp #$0003.w		; C9 03 00
	bne   3.b		; D0 03
	lda #$0000.w		; A9 00 00
	sta $22.b		; 85 22
	lda $1C72.w		; AD 72 1C
	clc		; 18
	adc #$0004.w		; 69 04 00
	sta $00.b		; 85 00
	ldx #$0080.w		; A2 80 00
	ldy #$009B.w		; A0 9B 00
	lda #$2000.w		; A9 00 20
	jsl L001662.l		; 22 62 96 00
	jsl L0015BD.l		; 22 BD 95 00
	rtl		; 6B

.ACCU 16
.INDEX 16
	rep #$30		; C2 30
	phk		; 4B
	plb		; AB
	jsl L00158F.l		; 22 8F 95 00
	lda $0964.w		; AD 64 09
	and #$0030.w		; 29 30 00
	beq  30.b		; F0 1E
	lda #$1E80.w		; A9 80 1E
	sta $11.b		; 85 11
	lda #$8000.w		; A9 00 80
	sta $10.b		; 85 10
	lda $1C7C.w		; AD 7C 1C
	clc		; 18
	adc #$000B.w		; 69 0B 00
	sta $00.b		; 85 00
	ldx #$0000.w		; A2 00 00
	txy		; 9B
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	jsl L0015BD.l		; 22 BD 95 00
	rtl		; 6B

L00BE76:
	jsl L00050F.l
.ACCU 8
	sep #$20
	lda #$11.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$03.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
.INDEX 16
	rep #$30
	lda #$0019.w
	jsr L00A9A0.w
	lda #$0019.w
	jsr L00A9CB.w
	lda #$0019.w
	jsr L00A9F2.w
	lda #$0015.w
	jsr L00A9F2.w
	ldx #$0000.w
	txy
	lda #$6000.w
	jsl L00154E.l
	lda #$0001.w
	ldx #$BE43.w
	jsl L000385.l
	jsl L000521.l
	lda $0996.w
	beq L00BED1.b
L00BEBE:
	ldx #$00B4.w
	ldy #$0000.w
	jsl L0003C0.l
	bne L00BF0A.b
	dec $1C84.w
	beq L00BF02.b
	bra L00BF1E.b
L00BED1:
	lda $0996.w
	bne L00BEBE.b
	ldx #$1C20.w
	ldy #$0000.w
	jsl L0003C0.l
	bne L00BEE7.b
	inc $0996.w
	bra L00BF02.b
L00BEE7:
	lda $0960.w
	and #$BC80.w
	beq L00BED1.b
	bit #$0800.w
	bne L00BF0E.b
	bit #$0400.w
	bne L00BF1E.b
	bit #$A000.w
	bne L00BF06.b
	jsl L000401.l
L00BF02:
	lda #$0000.w
	rts

L00BF06:
	jsl L000401.l
L00BF0A:
	lda #$FFFF.w
	rts

L00BF0E:
	lda $1C7C.w
	dec A
	and #$0003.w
	sta $1C7C.w
	jsl L000401.l
	bra L00BED1.b
L00BF1E:
	lda $1C7C.w
	inc A
	and #$0003.w
	sta $1C7C.w
	jsl L000401.l
	bra L00BED1.b
	tay		; A8
	brk $91.b		; 00 91
	brk $A8.b		; 00 A8
	brk $91.b		; 00 91
	brk $2B.b		; 00 2B
	brk $90.b		; 00 90
	brk $A8.b		; 00 A8
	brk $89.b		; 00 89
	brk $A8.b		; 00 A8
	brk $89.b		; 00 89
	brk $2B.b		; 00 2B
	brk $80.b		; 00 80
	brk $A8.b		; 00 A8
	brk $81.b		; 00 81
	brk $A8.b		; 00 A8
	brk $76.b		; 00 76
	brk $A8.b		; 00 A8
	brk $81.b		; 00 81
	brk $A8.b		; 00 A8
	brk $76.b		; 00 76
	brk $A8.b		; 00 A8
	brk $81.b		; 00 81
	brk $A8.b		; 00 A8
	brk $89.b		; 00 89
	brk $2B.b		; 00 2B
	brk $76.b		; 00 76
	brk $A8.b		; 00 A8
	brk $99.b		; 00 99
	brk $A8.b		; 00 A8
	brk $91.b		; 00 91
	brk $30.b		; 00 30
	brk $42.b		; 00 42
	brk $66.b		; 00 66
	brk $63.b		; 00 63
	brk $4E.b		; 00 4E
	brk $A4.b		; 00 A4
	brk $4E.b		; 00 4E
	brk $AF.b		; 00 AF
	brk $C2.b		; 00 C2
	bmi  75.b		; 30 4B
	plb		; AB
	jsl L00158F.l		; 22 8F 95 00
	lda #$1E80.w		; A9 80 1E
	sta $11.b		; 85 11
	lda #$8000.w		; A9 00 80
	sta $10.b		; 85 10
	lda $0964.w		; AD 64 09
	and #$0001.w		; 29 01 00
	bne  12.b		; D0 0C
	lda $0202.w		; AD 02 02
	dec A		; 3A
	bpl   3.b		; 10 03
	lda #$0002.w		; A9 02 00
	sta $0202.w		; 8D 02 02
	lda $0202.w		; AD 02 02
	clc		; 18
	adc #$0008.w		; 69 08 00
	sta $00.b		; 85 00
	lda $1C6C.w		; AD 6C 1C
	asl A		; 0A
	asl A		; 0A
	asl A		; 0A
	adc $1C6C.w		; 6D 6C 1C
	asl A		; 0A
	asl A		; 0A
	adc #$0049.w		; 69 49 00
	tax		; AA
	ldy #$005A.w		; A0 5A 00
	lda #$3A00.w		; A9 00 3A
	jsl L00179B.l		; 22 9B 97 00
	lda $1C90.w		; AD 90 1C
	asl A		; 0A
	asl A		; 0A
	tax		; AA
	phx		; DA
	lda #$0015.w		; A9 15 00
	sta $00.b		; 85 00
	lda $01BF30.l,X		; BF 30 BF 01
	tay		; A8
	lda $01BF2E.l,X		; BF 2E BF 01
	tax		; AA
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	plx		; FA
	phx		; DA
	lda #$0016.w		; A9 16 00
	sta $00.b		; 85 00
	lda $01BF3C.l,X		; BF 3C BF 01
	tay		; A8
	lda $01BF3A.l,X		; BF 3A BF 01
	tax		; AA
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	plx		; FA
	phx		; DA
	lda #$0017.w		; A9 17 00
	sta $00.b		; 85 00
	lda $01BF48.l,X		; BF 48 BF 01
	tay		; A8
	lda $01BF46.l,X		; BF 46 BF 01
	tax		; AA
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	plx		; FA
	phx		; DA
	lda #$0018.w		; A9 18 00
	sta $00.b		; 85 00
	lda $01BF54.l,X		; BF 54 BF 01
	tay		; A8
	lda $01BF52.l,X		; BF 52 BF 01
	tax		; AA
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	plx		; FA
	lda #$0019.w		; A9 19 00
	sta $00.b		; 85 00
	lda $01BF60.l,X		; BF 60 BF 01
	tay		; A8
	lda $01BF5E.l,X		; BF 5E BF 01
	tax		; AA
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	lda $1C90.w		; AD 90 1C
	clc		; 18
	adc #$0012.w		; 69 12 00
	sta $00.b		; 85 00
	ldx #$0000.w		; A2 00 00
	txy		; 9B
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	lda #$001A.w		; A9 1A 00
	sta $00.b		; 85 00
	ldx #$0000.w		; A2 00 00
	txy		; 9B
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	lda $1C72.w		; AD 72 1C
	clc		; 18
	adc #$0004.w		; 69 04 00
	sta $00.b		; 85 00
	ldx #$0054.w		; A2 54 00
	ldy #$00AE.w		; A0 AE 00
	lda #$3800.w		; A9 00 38
	jsl L00179B.l		; 22 9B 97 00
	lda $0994.w		; AD 94 09
	clc		; 18
	adc #$001B.w		; 69 1B 00
	sta $00.b		; 85 00
	ldx #$0054.w		; A2 54 00
	ldy #$00B8.w		; A0 B8 00
	lda #$3800.w		; A9 00 38
	jsl L00179B.l		; 22 9B 97 00
	lda $0964.w		; AD 64 09
	and #$0010.w		; 29 10 00
	beq  28.b		; F0 1C
	lda #$0020.w		; A9 20 00
	sta $00.b		; 85 00
	lda $0200.w		; AD 00 02
	asl A		; 0A
	asl A		; 0A
	tax		; AA
	lda $01BF6C.l,X		; BF 6C BF 01
	tay		; A8
	lda $01BF6A.l,X		; BF 6A BF 01
	tax		; AA
	lda #$3800.w		; A9 00 38
	jsl L00179B.l		; 22 9B 97 00
	jsl L0015BD.l		; 22 BD 95 00
	rtl		; 6B

	tsb $00.b		; 04 00
	ora $00.b,S		; 03 00
	tsb $00.b		; 04 00
	cop $00.b		; 02 00
	jmp ($901C.w)		; 6C 1C 90
	trb $1C72.w		; 1C 72 1C
	sty $09.b,X		; 94 09
L00C0C7:
	jsl L00050F.l
.ACCU 8
	sep #$20
	lda #$11.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$03.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
.INDEX 16
	rep #$30
	lda #$001A.w
	jsr L00A9A0.w
	lda #$001A.w
	jsr L00A9CB.w
	lda #$001A.w
	jsr L00A9F2.w
	lda #$0080.w
	ldx #$0080.w
	jsl L000583.l
	lda #$0017.w
	jsr L00A9F2.w
	lda #$FC11.w
	sta $0C.b
	lda #$0002.w
	sta $0E.b
	lda #$00C0.w
	ldx #$0010.w
	jsl L000583.l
	stz $0200.w
	stz $0202.w
	ldx #$0000.w
	txy
	lda #$6000.w
	jsl L00154E.l
	lda #$0001.w
	ldx #$BF7A.w
	jsl L000385.l
	jsl L000521.l
L00C12E:
	jsl L0003AB.l
	lda $0960.w
	and #$BF80.w
	beq L00C12E.b
	bit #$0800.w
	bne L00C163.b
	bit #$0400.w
	bne L00C173.b
	bit #$0200.w
	bne L00C183.b
	bit #$0100.w
	bne L00C1A1.b
	bit #$A000.w
	bne L00C15B.b
	jsl L000401.l
	lda #$0000.w
	rts

L00C15B:
	jsl L000401.l
	lda #$FFFF.w
	rts

L00C163:
	lda $0200.w
	dec A
	and #$0003.w
	sta $0200.w
	jsl L000401.l
	bra L00C12E.b
L00C173:
	lda $0200.w
	inc A
	and #$0003.w
	sta $0200.w
	jsl L000401.l
	bra L00C12E.b
L00C183:
	lda $0200.w
	asl A
	tax
	lda $01C0BF.l,X
	tay
	lda $0000.w,Y
	dec A
	bpl L00C198.b
	lda $01C0B7.l,X
	dec A
L00C198:
	sta $0000.w,Y
	jsl L000401.l
	bra L00C12E.b
L00C1A1:
	lda $0200.w
	asl A
	tax
	lda $01C0BF.l,X
	tay
	lda $0000.w,Y
	inc A
	cmp $01C0B7.l,X
	bne L00C1B8.b
	lda #$0000.w
L00C1B8:
	sta $0000.w,Y
	jsl L000401.l
	jmp L00C12E.w
	eor $00.b,X		; 55 00
	adc $AD00.w		; 6D 00 AD
	brk $6D.b		; 00 6D
	brk $55.b		; 00 55
	brk $AD.b		; 00 AD
	brk $AD.b		; 00 AD
	brk $AD.b		; 00 AD
	brk $C2.b		; 00 C2
	bmi  75.b		; 30 4B
	plb		; AB
	jsl L00158F.l		; 22 8F 95 00
	lda $0964.w		; AD 64 09
	and #$0020.w		; 29 20 00
	beq  36.b		; F0 24
	lda #$1E80.w		; A9 80 1E
	sta $11.b		; 85 11
	lda #$8000.w		; A9 00 80
	sta $10.b		; 85 10
	lda #$001D.w		; A9 1D 00
	sta $00.b		; 85 00
	lda $1C70.w		; AD 70 1C
	asl A		; 0A
	asl A		; 0A
	tax		; AA
	lda $C1C4.w,X		; BD C4 C1
	tay		; A8
	lda $C1C2.w,X		; BD C2 C1
	tax		; AA
	lda #$3000.w		; A9 00 30
	jsl L00179B.l		; 22 9B 97 00
	jsl L0015BD.l		; 22 BD 95 00
	rtl		; 6B

L00C20B:
	jsl L00050F.l
.ACCU 8
	sep #$20
	phk
	plb
	lda #$11.b
	sta TMAIN.w		; Mainscreen Designation
	lda #$03.b
	sta OBJSEL.w		; Object Size and Chr Address
.ACCU 16
.INDEX 16
	rep #$30
	lda #$0008.w
	jsr L00A9A0.w
	lda #$0008.w
	jsr L00A9CB.w
	lda #$0008.w
	jsr L00A9F2.w
	lda #$C5F0.w
	sta $0C.b
	lda #$0011.w
	sta $0E.b
	lda #$0080.w
	ldx #$0010.w
	jsl L000583.l
	lda #$C610.w
	sta $0C.b
	lda #$0011.w
	sta $0E.b
	lda #$0090.w
	ldx #$0010.w
	jsl L000583.l
	lda #$C630.w
	sta $0C.b
	lda #$0011.w
	sta $0E.b
	lda #$00A0.w
	ldx #$0010.w
	jsl L000583.l
	lda #$FC11.w
	sta $0C.b
	lda #$0002.w
	sta $0E.b
	lda #$00C0.w
	ldx #$0010.w
	jsl L000583.l
	ldx #$0000.w
	txy
	lda #$6000.w
	jsl L00154E.l
	lda #$FFFF.w
	sta $09A8.w
	lda #$1680.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda #$0006.w
	sta $00.b
	ldx $C1C2.w
	dex
	dex
	ldy $C1C4.w
	lda #$3400.w
	jsl L00179B.l
	lda #$1880.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda #$0006.w
	sta $00.b
	ldx $C1C6.w
	dex
	dex
	ldy $C1C8.w
	lda #$3600.w
	jsl L00179B.l
	lda #$1B80.w
	sta $11.b
	lda #$8000.w
	sta $10.b
	lda #$0006.w
	sta $00.b
	ldx $C1CA.w
	dex
	dex
	ldy $C1CC.w
	lda #$3000.w
	jsl L00179B.l
	lda $09A2.w
	sta $099C.w
	lda #$0002.w
	sta $09A8.w
	lda #$0001.w
	ldx #$C1D2.w
	jsl L000385.l
	jsl L000521.l
	lda $0996.w
	beq L00C319.b
	ldx #$0168.w
	ldy #$0000.w
	jsl L0003C0.l
	beq L00C37F.b
	bra L00C387.b
L00C319:
	ldx #$1C20.w
	ldy #$0000.w
	jsl L0003C0.l
	bne L00C32A.b
	inc $0996.w
	bra L00C37F.b
L00C32A:
	lda $0960.w
	bit #$0800.w
	beq L00C33E.b
	lda $1C70.w
	and #$0001.w
	sta $1C70.w
	lda $0960.w
L00C33E:
	bit #$0400.w
	beq L00C34F.b
	lda $1C70.w
	ora #$0002.w
	sta $1C70.w
	lda $0960.w
L00C34F:
	bit #$0200.w
	beq L00C360.b
	lda $1C70.w
	and #$0002.w
	sta $1C70.w
	lda $0960.w
L00C360:
	bit #$0100.w
	beq L00C371.b
	lda $1C70.w
	ora #$0001.w
	sta $1C70.w
	lda $0960.w
L00C371:
	bit #$A000.w
	bne L00C383.b
	bit #$1080.w
	beq L00C319.b
	jsl L000401.l
L00C37F:
	lda #$0000.w
	rts

L00C383:
	jsl L000401.l
L00C387:
	lda #$FFFF.w
	rts

	rol A		; 2A
	brk $4E.b		; 00 4E
	php		; 08
	rol $120A.w,X		; 3E 0A 12
	asl $0F72.w		; 0E 72 0F
	.db $42, $12		; 42 12
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ror $0000.w		; 6E 00 00
	brk $08.b		; 00 08
	bit $54.b		; 24 54
	eor ($41.b)		; 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $42.b		; 05 42
	adc ($73.b,X)		; 61 73
	adc ($00.b,S),Y		; 73 00
	brk $DC.b		; 00 DC
	tsb $00.b		; 04 00
	cmp $005A07.l,X		; DF 07 5A 00
	sta ($7F.b,S),Y		; 93 7F
	asl $06.b		; 06 06
	sta [$7F.b]		; 87 7F
	asl $06.b		; 06 06
	stx $7F.b,Y		; 96 7F
	asl $06.b		; 06 06
	sta [$7F.b]		; 87 7F
	asl $06.b		; 06 06
	sta $7F.b,X		; 95 7F
	asl $06.b		; 06 06
	sta [$7F.b]		; 87 7F
	asl $06.b		; 06 06
	sta ($7F.b),Y		; 91 7F
	asl $06.b		; 06 06
	sta ($7F.b,S),Y		; 93 7F
	asl $06.b		; 06 06
	sta [$7F.b]		; 87 7F
	asl $06.b		; 06 06
	stx $067F.w		; 8E 7F 06
	asl $96.b		; 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $9A0606.l,X		; 7F 06 06 9A
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $9E0606.l,X		; 7F 06 06 9E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $9C0606.l,X		; 7F 06 06 9C
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $980606.l,X		; 7F 06 06 98
	adc $9A0606.l,X		; 7F 06 06 9A
	adc $950606.l,X		; 7F 06 06 95
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $9E0606.l,X		; 7F 06 06 9E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $9C0606.l,X		; 7F 06 06 9C
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $980606.l,X		; 7F 06 06 98
	adc $9A0606.l,X		; 7F 06 06 9A
	adc $980606.l,X		; 7F 06 06 98
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $9D0606.l,X		; 7F 06 06 9D
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $9C0606.l,X		; 7F 06 06 9C
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $960606.l,X		; 7F 06 06 96
	adc $980606.l,X		; 7F 06 06 98
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $9D0606.l,X		; 7F 06 06 9D
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $9C0606.l,X		; 7F 06 06 9C
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $960606.l,X		; 7F 06 06 96
	adc $980606.l,X		; 7F 06 06 98
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $950606.l,X		; 7F 06 06 95
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $8F0606.l,X		; 7F 06 06 8F
	adc $960606.l,X		; 7F 06 06 96
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $950606.l,X		; 7F 06 06 95
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $9A0606.l,X		; 7F 06 06 9A
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $9E0606.l,X		; 7F 06 06 9E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $9C0606.l,X		; 7F 06 06 9C
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $980606.l,X		; 7F 06 06 98
	adc $9A0606.l,X		; 7F 06 06 9A
	adc $950606.l,X		; 7F 06 06 95
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $9E0606.l,X		; 7F 06 06 9E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $9C0606.l,X		; 7F 06 06 9C
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $980606.l,X		; 7F 06 06 98
	adc $9A0606.l,X		; 7F 06 06 9A
	adc $980606.l,X		; 7F 06 06 98
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $9D0606.l,X		; 7F 06 06 9D
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $9C0606.l,X		; 7F 06 06 9C
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $960606.l,X		; 7F 06 06 96
	adc $980606.l,X		; 7F 06 06 98
	adc $930606.l,X		; 7F 06 06 93
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $9D0606.l,X		; 7F 06 06 9D
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $9C0606.l,X		; 7F 06 06 9C
	adc $8C0606.l,X		; 7F 06 06 8C
	adc $960606.l,X		; 7F 06 06 96
	adc $980606.l,X		; 7F 06 06 98
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $870606.l,X		; 7F 06 06 87
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $960606.l,X		; 7F 06 06 96
	adc $870606.l,X		; 7F 06 06 87
	adc $950606.l,X		; 7F 06 06 95
	adc $870606.l,X		; 7F 06 06 87
	adc $910606.l,X		; 7F 06 06 91
	adc $930606.l,X		; 7F 06 06 93
	adc $DB0606.l,X		; 7F 06 06 DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $01.b		; 00 01
	beq  84.b		; F0 54
	eor ($41.b)		; 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $4C.b		; 05 4C
	adc $61.b		; 65 61
	stz $00.b		; 64 00
	brk $DC.b		; 00 DC
	ora $00.b,S		; 03 00
	cmp $863C07.l,X		; DF 07 3C 86
	brk $AB.b		; 00 AB
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A91212.l,X		; 7F 12 12 A9
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A21212.l,X		; 7F 12 12 A2
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A91212.l,X		; 7F 12 12 A9
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A21212.l,X		; 7F 12 12 A2
	adc $A70C0C.l,X		; 7F 0C 0C A7
	adc $A91212.l,X		; 7F 12 12 A9
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $AB3030.l,X		; 7F 30 30 AB
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $AE0C0C.l,X		; 7F 0C 0C AE
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A91212.l,X		; 7F 12 12 A9
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A21212.l,X		; 7F 12 12 A2
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A91212.l,X		; 7F 12 12 A9
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A21212.l,X		; 7F 12 12 A2
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $AB3030.l,X		; 7F 30 30 AB
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $AE0C0C.l,X		; 7F 0C 0C AE
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AA0C0C.l,X		; 7F 0C 0C AA
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AD0C0C.l,X		; 7F 0C 0C AD
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AA1212.l,X		; 7F 12 12 AA
	adc $AE0C0C.l,X		; 7F 0C 0C AE
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $B00C0C.l,X		; 7F 0C 0C B0
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $814081.l,X		; 7F 81 40 81
	rti		; 40

	plb		; AB
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A91212.l,X		; 7F 12 12 A9
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A21212.l,X		; 7F 12 12 A2
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A91212.l,X		; 7F 12 12 A9
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A21212.l,X		; 7F 12 12 A2
	adc $A70C0C.l,X		; 7F 0C 0C A7
	adc $A91212.l,X		; 7F 12 12 A9
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $AB3030.l,X		; 7F 30 30 AB
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $AE0C0C.l,X		; 7F 0C 0C AE
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A91212.l,X		; 7F 12 12 A9
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A21212.l,X		; 7F 12 12 A2
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A91212.l,X		; 7F 12 12 A9
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A61212.l,X		; 7F 12 12 A6
	adc $A21212.l,X		; 7F 12 12 A2
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $AB0C0C.l,X		; 7F 0C 0C AB
	adc $AB3030.l,X		; 7F 30 30 AB
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $AE0C0C.l,X		; 7F 0C 0C AE
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AA0C0C.l,X		; 7F 0C 0C AA
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AD1212.l,X		; 7F 12 12 AD
	adc $AD0C0C.l,X		; 7F 0C 0C AD
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AA1212.l,X		; 7F 12 12 AA
	adc $AE0C0C.l,X		; 7F 0C 0C AE
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $B00C0C.l,X		; 7F 0C 0C B0
	adc $AE1212.l,X		; 7F 12 12 AE
	adc $AB1212.l,X		; 7F 12 12 AB
	adc $B70C0C.l,X		; 7F 0C 0C B7
	adc $814081.l,X		; 7F 81 40 81
	rti		; 40

	stp		; DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $D4.b,S		; 03 D4
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $54.b		; 05 54
	adc $00736D.l		; 6F 6D 73 00
	brk $DC.b		; 00 DC
	cop $00.b		; 02 00
	cmp $004B07.l,X		; DF 07 4B 00
	sta ($7F.b)		; 92 7F
	tsb $920C.w		; 0C 0C 92
	adc $920C00.l,X		; 7F 00 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921218.l,X		; 7F 18 12 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921218.l,X		; 7F 18 12 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921218.l,X		; 7F 18 12 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920006.l,X		; 7F 06 00 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920006.l,X		; 7F 06 00 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920006.l,X		; 7F 06 00 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920006.l,X		; 7F 06 00 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920006.l,X		; 7F 06 00 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920006.l,X		; 7F 06 00 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921218.l,X		; 7F 18 12 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920606.l,X		; 7F 06 06 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920606.l,X		; 7F 06 06 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921E1E.l,X		; 7F 1E 1E 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $921212.l,X		; 7F 12 12 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $920C0C.l,X		; 7F 0C 0C 92
	adc $DB1E1E.l,X		; 7F 1E 1E DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	asl $00.b		; 06 00
	brk $01.b		; 00 01
	rts		; 60

	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	asl $53.b		; 06 53
	ror $7261.w		; 6E 61 72
	adc $00.b		; 65 00
	brk $DC.b		; 00 DC
	ora ($00.b,X)		; 01 00
	cmp $186407.l,X		; DF 07 64 18
	stx $0C7F.w		; 8E 7F 0C
	bmi -114.b		; 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E240C.l,X		; 7F 0C 24 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E1E06.l,X		; 7F 06 1E 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E240C.l,X		; 7F 0C 24 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E1E06.l,X		; 7F 06 1E 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E180C.l,X		; 7F 0C 18 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E7206.l,X		; 7F 06 72 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E240C.l,X		; 7F 0C 24 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $8E1E06.l,X		; 7F 06 1E 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E300C.l,X		; 7F 0C 30 8E
	adc $8E180C.l,X		; 7F 0C 18 8E
	adc $8E0606.l,X		; 7F 06 06 8E
	adc $DB5A06.l,X		; 7F 06 5A DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	cop $D0.b		; 02 D0
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $4B.b		; 05 4B
	adc #$6B63.w		; 69 63 6B
	brk $00.b		; 00 00
	jmp.w [$0000]		; DC 00 00
	cmp $006407.l,X		; DF 07 64 00
	sty $0C7F.w		; 8C 7F 0C
	tsb $7F8C.w		; 0C 8C 7F
	brk $18.b		; 00 18
	sty $0C7F.w		; 8C 7F 0C
	tsb $7F8C.w		; 0C 8C 7F
	tsb $8C0C.w		; 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C240C.l,X		; 7F 0C 24 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C300C.l,X		; 7F 0C 30 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C240C.l,X		; 7F 0C 24 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C300C.l,X		; 7F 0C 30 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C6C0C.l,X		; 7F 0C 6C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C240C.l,X		; 7F 0C 24 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C300C.l,X		; 7F 0C 30 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C0C0C.l,X		; 7F 0C 0C 8C
	adc $8C180C.l,X		; 7F 0C 18 8C
	adc $DB6C0C.l,X		; 7F 0C 6C DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $0000.w		; 0C 00 00
	brk $E4.b		; 00 E4
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora [$53.b]		; 07 53
	ror $7261.w		; 6E 61 72
	adc $32.b		; 65 32
	brk $00.b		; 00 00
	jmp.w [$0001]		; DC 01 00
	cmp $824607.l,X		; DF 07 46 82
	stz $95.b,X		; 74 95
	stz $02.b		; 64 02
	asl $95.b		; 06 95
	stz $04.b		; 64 04
	.db $82, $4A, $8E		; 82 4A 8E
	stz $02.b		; 64 02
	asl $8E.b		; 06 8E
	stz $04.b		; 64 04
	asl $91.b		; 06 91
	stz $02.b		; 64 02
	asl $91.b		; 06 91
	stz $04.b		; 64 04
	asl $93.b		; 06 93
	stz $02.b		; 64 02
	asl $95.b		; 06 95
	stz $04.b		; 64 04
	asl $97.b		; 06 97
	stz $02.b		; 64 02
	asl $98.b		; 06 98
	stz $03.b		; 64 03
	asl $98.b		; 06 98
	stz $03.b		; 64 03
	asl $95.b		; 06 95
	stz $04.b		; 64 04
	.db $82, $7A, $98		; 82 7A 98
	stz $02.b		; 64 02
	asl $98.b		; 06 98
	stz $02.b		; 64 02
	sta $26.b		; 85 26
	sta ($64.b),Y		; 91 64
	cop $06.b		; 02 06
	sta ($64.b),Y		; 91 64
	ora $06.b,S		; 03 06
	sta ($64.b,S),Y		; 93 64
	cop $06.b		; 02 06
	sta ($64.b,S),Y		; 93 64
	tsb $06.b		; 04 06
	sta [$64.b],Y		; 97 64
	ora $06.b,S		; 03 06
	sta [$64.b],Y		; 97 64
	ora $06.b,S		; 03 06
	txs		; 9A
	stz $04.b		; 64 04
	tsb $649D.w		; 0C 9D 64
	tsb $06.b		; 04 06
	txs		; 9A
	stz $03.b		; 64 03
	asl $9A.b		; 06 9A
	stz $03.b		; 64 03
	asl $97.b		; 06 97
	stz $03.b		; 64 03
	asl $97.b		; 06 97
	stz $04.b		; 64 04
	asl $95.b		; 06 95
	stz $01.b		; 64 01
	asl $93.b		; 06 93
	stz $04.b		; 64 04
	sta $00.b,S		; 83 00
	tya		; 98
	stz $02.b		; 64 02
	asl $98.b		; 06 98
	stz $02.b		; 64 02
	sta $26.b		; 85 26
	sta ($64.b),Y		; 91 64
	cop $06.b		; 02 06
	sta ($64.b),Y		; 91 64
	tsb $06.b		; 04 06
	sta $64.b,X		; 95 64
	cop $06.b		; 02 06
	sta ($64.b,S),Y		; 93 64
	tsb $06.b		; 04 06
	tya		; 98
	stz $02.b		; 64 02
	asl $97.b		; 06 97
	stz $04.b		; 64 04
	asl $9C.b		; 06 9C
	stz $02.b		; 64 02
	asl $9C.b		; 06 9C
	stz $04.b		; 64 04
	asl $9F.b		; 06 9F
	stz $03.b		; 64 03
	asl $9F.b		; 06 9F
	stz $04.b		; 64 04
	asl $9C.b		; 06 9C
	stz $03.b		; 64 03
	asl $9A.b		; 06 9A
	stz $03.b		; 64 03
	asl $98.b		; 06 98
	stz $03.b		; 64 03
	asl $97.b		; 06 97
	stz $04.b		; 64 04
	asl $93.b		; 06 93
	stz $02.b		; 64 02
	asl $93.b		; 06 93
	stz $04.b		; 64 04
	asl $DB.b		; 06 DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	tsb $002A.w		; 0C 2A 00
	ply		; 7A
	asl $A2.b		; 06 A2
	ora $0F04.w		; 0D 04 0F
	ror A		; 6A
	bpl  78.b		; 10 4E
	ora ($00.b)		; 12 00
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
	brk $00.b		; 00 00
	brk $06.b		; 00 06
	bvc  84.b		; 50 54
	eor ($41.b)		; 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $42.b		; 05 42
	adc ($73.b,X)		; 61 73
	adc ($00.b,S),Y		; 73 00
	brk $DC.b		; 00 DC
	ora $00.b		; 05 00
	cmp $003207.l,X		; DF 07 32 00
	stx $047F.w		; 8E 7F 04
	tsb $7F8E.w		; 0C 8E 7F
	ora #$950C.w		; 09 0C 95
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C0C07.l,X		; 7F 07 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0A.l,X		; 7F 0A 0C 91
	adc $8C0C08.l,X		; 7F 08 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C06.l,X		; 7F 06 0C 8E
	adc $950C07.l,X		; 7F 07 0C 95
	adc $8E0C03.l,X		; 7F 03 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E120A.l,X		; 7F 0A 12 8E
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $8E0C08.l,X		; 7F 08 0C 8E
	adc $8E0C06.l,X		; 7F 06 0C 8E
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $8E0C07.l,X		; 7F 07 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0A.l,X		; 7F 0A 0C 91
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8C0C06.l,X		; 7F 06 0C 8C
	adc $910C0A.l,X		; 7F 0A 0C 91
	adc $8C0C07.l,X		; 7F 07 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $8E0C08.l,X		; 7F 08 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $8E0C09.l,X		; 7F 09 0C 8E
	adc $8E0C06.l,X		; 7F 06 0C 8E
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $8E0C09.l,X		; 7F 09 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8C0C06.l,X		; 7F 06 0C 8C
	adc $910C0A.l,X		; 7F 0A 0C 91
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C0C06.l,X		; 7F 06 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $960C0B.l,X		; 7F 0B 0C 96
	adc $980C08.l,X		; 7F 08 0C 98
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $8E0C06.l,X		; 7F 06 0C 8E
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $8E0C08.l,X		; 7F 08 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $8E0C07.l,X		; 7F 07 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C09.l,X		; 7F 09 0C 95
	adc $8E0C06.l,X		; 7F 06 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0A.l,X		; 7F 0A 0C 91
	adc $8C0C08.l,X		; 7F 08 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $930C09.l,X		; 7F 09 0C 93
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0A.l,X		; 7F 0A 0C 91
	adc $8C0C07.l,X		; 7F 07 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0A.l,X		; 7F 0A 0C 95
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $9A0605.l,X		; 7F 05 06 9A
	adc $8E0604.l,X		; 7F 04 06 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E180C.l,X		; 7F 0C 18 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $870C0B.l,X		; 7F 0B 0C 87
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8A180C.l,X		; 7F 0C 18 8A
	adc $8A180C.l,X		; 7F 0C 18 8A
	adc $8A180B.l,X		; 7F 0B 18 8A
	adc $870C0B.l,X		; 7F 0B 0C 87
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8A180B.l,X		; 7F 0B 18 8A
	adc $8A180A.l,X		; 7F 0A 18 8A
	adc $8A180C.l,X		; 7F 0C 18 8A
	adc $870C0B.l,X		; 7F 0B 0C 87
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8C180B.l,X		; 7F 0B 18 8C
	adc $8C180B.l,X		; 7F 0B 18 8C
	adc $8C180B.l,X		; 7F 0B 18 8C
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $8C180A.l,X		; 7F 0A 18 8C
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $870C0A.l,X		; 7F 0A 0C 87
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E180C.l,X		; 7F 0C 18 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8E180A.l,X		; 7F 0A 18 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E180B.l,X		; 7F 0B 18 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $870C0B.l,X		; 7F 0B 0C 87
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8A180C.l,X		; 7F 0C 18 8A
	adc $8A180C.l,X		; 7F 0C 18 8A
	adc $8A180B.l,X		; 7F 0B 18 8A
	adc $870C0B.l,X		; 7F 0B 0C 87
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8A180B.l,X		; 7F 0B 18 8A
	adc $8A180A.l,X		; 7F 0A 18 8A
	adc $8A180C.l,X		; 7F 0C 18 8A
	adc $870C0B.l,X		; 7F 0B 0C 87
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8C180B.l,X		; 7F 0B 18 8C
	adc $8C180B.l,X		; 7F 0B 18 8C
	adc $8C180B.l,X		; 7F 0B 18 8C
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $8C180A.l,X		; 7F 0A 18 8C
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8C0C09.l,X		; 7F 09 0C 8C
	adc $870C0A.l,X		; 7F 0A 0C 87
	adc $8A0C0B.l,X		; 7F 0B 0C 8A
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $950C09.l,X		; 7F 09 0C 95
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C0C07.l,X		; 7F 07 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0A.l,X		; 7F 0A 0C 91
	adc $8C0C08.l,X		; 7F 08 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $8E0C04.l,X		; 7F 04 0C 8E
	adc $950C09.l,X		; 7F 09 0C 95
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E0C05.l,X		; 7F 05 0C 8E
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $930605.l,X		; 7F 05 06 93
	adc $8E1211.l,X		; 7F 11 12 8E
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $9A0C0B.l,X		; 7F 0B 0C 9A
	adc $8C0C0A.l,X		; 7F 0A 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0B.l,X		; 7F 0B 0C 91
	adc $8C0C07.l,X		; 7F 07 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $930C0B.l,X		; 7F 0B 0C 93
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $8C0C05.l,X		; 7F 05 0C 8C
	adc $910C0A.l,X		; 7F 0A 0C 91
	adc $8C0C08.l,X		; 7F 08 0C 8C
	adc $930605.l,X		; 7F 05 06 93
	adc $8C1211.l,X		; 7F 11 12 8C
	adc $950C0B.l,X		; 7F 0B 0C 95
	adc $980C0B.l,X		; 7F 0B 0C 98
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $8E1208.l,X		; 7F 08 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1209.l,X		; 7F 09 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1208.l,X		; 7F 08 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1209.l,X		; 7F 09 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1208.l,X		; 7F 08 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1209.l,X		; 7F 09 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1208.l,X		; 7F 08 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1209.l,X		; 7F 09 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $8E1208.l,X		; 7F 08 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1209.l,X		; 7F 09 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1208.l,X		; 7F 08 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1209.l,X		; 7F 09 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1208.l,X		; 7F 08 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1209.l,X		; 7F 09 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1208.l,X		; 7F 08 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0A.l,X		; 7F 0A 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $8E1209.l,X		; 7F 09 12 8E
	adc $8C0605.l,X		; 7F 05 06 8C
	adc $8E0C0B.l,X		; 7F 0B 0C 8E
	adc $891817.l,X		; 7F 17 18 89
	adc $8C0C0B.l,X		; 7F 0B 0C 8C
	adc $890C0B.l,X		; 7F 0B 0C 89
	adc $DB0C0A.l,X		; 7F 0A 0C DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $07.b		; 00 07
	plp		; 28
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	asl A		; 0A
	jmp $6165.w		; 4C 65 61
	stz $2F.b		; 64 2F
	adc $68.b,S		; 63 68
	adc ($64.b)		; 72 64
	brk $00.b		; 00 00
	jmp.w [$0003]		; DC 03 00
	cmp $003C07.l,X		; DF 07 3C 00
	lda $537F.w		; AD 7F 53
	mvn $7F,$AB		; 54 AB 7F
	asl $06.b		; 06 06
	bcs 127.b		; B0 7F
	asl $07.b		; 06 07
	lda $527F.w		; AD 7F 52
	eor ($A9.b)		; 52 A9
	adc $AB0606.l,X		; 7F 06 06 AB
	adc $AD0706.l,X		; 7F 06 07 AD
	adc $A92323.l,X		; 7F 23 23 A9
	adc $AB0C0B.l,X		; 7F 0B 0C AB
	adc $A62423.l,X		; 7F 23 24 A6
	adc $A90A0A.l,X		; 7F 0A 0A A9
	adc $AB0D0C.l,X		; 7F 0C 0D AB
	adc $A61A19.l,X		; 7F 19 1A A6
	adc $A41717.l,X		; 7F 17 17 A4
	adc $A90B0B.l,X		; 7F 0B 0B A9
	adc $A60C0B.l,X		; 7F 0B 0C A6
	adc $AB0C0B.l,X		; 7F 0B 0C AB
	adc $AD1817.l,X		; 7F 17 18 AD
	adc $A91918.l,X		; 7F 18 19 A9
	adc $A62423.l,X		; 7F 23 24 A6
	adc $A44947.l,X		; 7F 47 49 A4
	adc $A60605.l,X		; 7F 05 06 A6
	adc $A90603.l,X		; 7F 03 06 A9
	adc $A60C0B.l,X		; 7F 0B 0C A6
	adc $A90605.l,X		; 7F 05 06 A9
	adc $AB0505.l,X		; 7F 05 05 AB
	adc $A90D0C.l,X		; 7F 0C 0D A9
	adc $AB0504.l,X		; 7F 04 05 AB
	adc $AD0505.l,X		; 7F 05 05 AD
	adc $AB0D0C.l,X		; 7F 0C 0D AB
	adc $B00B0A.l,X		; 7F 0A 0B B0
	adc $AD0D0C.l,X		; 7F 0C 0D AD
	adc $B20C0B.l,X		; 7F 0B 0C B2
	adc $B40C0C.l,X		; 7F 0C 0C B4
	adc $B20C0B.l,X		; 7F 0B 0C B2
	adc $B02221.l,X		; 7F 21 22 B0
	adc $B20F0D.l,X		; 7F 0D 0F B2
	adc $B41615.l,X		; 7F 15 16 B4
	adc $B21918.l,X		; 7F 18 19 B2
	adc $AD5453.l,X		; 7F 53 54 AD
	adc $AB0606.l,X		; 7F 06 06 AB
	adc $AD0706.l,X		; 7F 06 07 AD
	adc $A93A34.l,X		; 7F 34 3A A9
	adc $AB0706.l,X		; 7F 06 07 AB
	adc $AD0707.l,X		; 7F 07 07 AD
	adc $A90B0A.l,X		; 7F 0A 0B A9
	adc $AB0B0B.l,X		; 7F 0B 0B AB
	adc $AD2626.l,X		; 7F 26 26 AD
	adc $A90B0B.l,X		; 7F 0B 0B A9
	adc $A42423.l,X		; 7F 23 24 A4
	adc $A60706.l,X		; 7F 06 07 A6
	adc $A80606.l,X		; 7F 06 06 A8
	adc $A4231F.l,X		; 7F 1F 23 A4
	adc $A90B0B.l,X		; 7F 0B 0B A9
	adc $AB0C0B.l,X		; 7F 0B 0C AB
	adc $A80D0C.l,X		; 7F 0C 0D A8
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $A60C0B.l,X		; 7F 0B 0C A6
	adc $A42322.l,X		; 7F 22 23 A4
	adc $A60605.l,X		; 7F 05 06 A6
	adc $A90605.l,X		; 7F 05 06 A9
	adc $A60C0C.l,X		; 7F 0C 0C A6
	adc $A90706.l,X		; 7F 06 07 A9
	adc $AB0706.l,X		; 7F 06 07 AB
	adc $AD0605.l,X		; 7F 05 06 AD
	adc $A90604.l,X		; 7F 04 06 A9
	adc $AB0605.l,X		; 7F 05 06 AB
	adc $A60605.l,X		; 7F 05 06 A6
	adc $A92421.l,X		; 7F 21 24 A9
	adc $AB0605.l,X		; 7F 05 06 AB
	adc $AD0606.l,X		; 7F 06 06 AD
	adc $A90A09.l,X		; 7F 09 0A A9
	adc $B00C0B.l,X		; 7F 0B 0C B0
	adc $AD0B0B.l,X		; 7F 0B 0B AD
	adc $B20E0E.l,X		; 7F 0E 0E B2
	adc $B00C0C.l,X		; 7F 0C 0C B0
	adc $AB4847.l,X		; 7F 47 48 AB
	adc $B20C0B.l,X		; 7F 0B 0C B2
	adc $B00B0B.l,X		; 7F 0B 0B B0
	adc $AD0D0C.l,X		; 7F 0C 0D AD
	adc $A90D0C.l,X		; 7F 0C 0D A9
	adc $AB0C0B.l,X		; 7F 0B 0C AB
	adc $AD0B0B.l,X		; 7F 0B 0B AD
	adc $A60C0B.l,X		; 7F 0B 0C A6
	adc $A90C0B.l,X		; 7F 0B 0C A9
	adc $DC0C0B.l,X		; 7F 0B 0C DC
	php		; 08
	brk $DF.b		; 00 DF
	ora [$32.b]		; 07 32
	brk $AD.b		; 00 AD
	adc $AB554B.l,X		; 7F 4B 55 AB
	adc $AD0C03.l,X		; 7F 03 0C AD
	adc $AD110D.l,X		; 7F 0D 11 AD
	adc $AB120B.l,X		; 7F 0B 12 AB
	adc $AD0D06.l,X		; 7F 06 0D AD
	adc $AD120C.l,X		; 7F 0C 12 AD
	adc $AD110B.l,X		; 7F 0B 11 AD
	adc $AB0D06.l,X		; 7F 06 0D AB
	adc $AB5352.l,X		; 7F 52 53 AB
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $AB2F2E.l,X		; 7F 2E 2F AB
	adc $AE322A.l,X		; 7F 2A 32 AE
	adc $AD5251.l,X		; 7F 51 52 AD
	adc $AE0D0B.l,X		; 7F 0B 0D AE
	adc $AB2523.l,X		; 7F 23 25 AB
	adc $AE0C0B.l,X		; 7F 0B 0C AE
	adc $AB1917.l,X		; 7F 17 19 AB
	adc $B20D0B.l,X		; 7F 0B 0D B2
	adc $B00A0A.l,X		; 7F 0A 0A B0
	adc $AE5245.l,X		; 7F 45 52 AE
	adc $B00C0A.l,X		; 7F 0A 0C B0
	adc $AE2523.l,X		; 7F 23 25 AE
	adc $A41B17.l,X		; 7F 17 1B A4
	adc $DC221D.l,X		; 7F 1D 22 DC
	asl $DF00.w		; 0E 00 DF
	ora [$32.b]		; 07 32
	brk $AD.b		; 00 AD
	adc $AB544B.l,X		; 7F 4B 54 AB
	adc $AD0C03.l,X		; 7F 03 0C AD
	adc $AD110D.l,X		; 7F 0D 11 AD
	adc $AB120B.l,X		; 7F 0B 12 AB
	adc $AD0D06.l,X		; 7F 06 0D AD
	adc $AD120C.l,X		; 7F 0C 12 AD
	adc $AD110B.l,X		; 7F 0B 11 AD
	adc $AB0D06.l,X		; 7F 06 0D AB
	adc $AB5352.l,X		; 7F 52 53 AB
	adc $AD0C0B.l,X		; 7F 0B 0C AD
	adc $AB2F2E.l,X		; 7F 2E 2F AB
	adc $AE322A.l,X		; 7F 2A 32 AE
	adc $AD5251.l,X		; 7F 51 52 AD
	adc $AE0D0B.l,X		; 7F 0B 0D AE
	adc $AB2523.l,X		; 7F 23 25 AB
	adc $AE0C0B.l,X		; 7F 0B 0C AE
	adc $AB1917.l,X		; 7F 17 19 AB
	adc $B20D0B.l,X		; 7F 0B 0D B2
	adc $B00A0A.l,X		; 7F 0A 0A B0
	adc $AE5245.l,X		; 7F 45 52 AE
	adc $B00C0A.l,X		; 7F 0A 0C B0
	adc $AE2523.l,X		; 7F 23 25 AE
	adc $A41B17.l,X		; 7F 17 1B A4
	adc $DC201D.l,X		; 7F 1D 20 DC
	ora $00.b,S		; 03 00
	cmp $023207.l,X		; DF 07 32 02
	ldx $7F.b		; A6 7F
	asl A		; 0A
	ora ($A6.b,S),Y		; 13 A6
	adc $AD1110.l,X		; 7F 10 11 AD
	adc $A60C0A.l,X		; 7F 0A 0C A6
	adc $A6140C.l,X		; 7F 0C 14 A6
	adc $AD100F.l,X		; 7F 0F 10 AD
	adc $A60D0A.l,X		; 7F 0A 0D A6
	adc $A6120B.l,X		; 7F 0B 12 A6
	adc $AD1110.l,X		; 7F 10 11 AD
	adc $A60C0A.l,X		; 7F 0A 0C A6
	adc $AD0C0C.l,X		; 7F 0C 0C AD
	adc $AB0C0B.l,X		; 7F 0B 0C AB
	adc $AD0C0A.l,X		; 7F 0A 0C AD
	adc $A40D0D.l,X		; 7F 0D 0D A4
	adc $A4120A.l,X		; 7F 0A 12 A4
	adc $AB0F0F.l,X		; 7F 0F 0F AB
	adc $A40E0B.l,X		; 7F 0B 0E A4
	adc $A4130B.l,X		; 7F 0B 13 A4
	adc $AB0F0E.l,X		; 7F 0E 0F AB
	adc $A40D0C.l,X		; 7F 0C 0D A4
	adc $A41207.l,X		; 7F 07 12 A4
	adc $AB1211.l,X		; 7F 11 12 AB
	adc $A90C0C.l,X		; 7F 0C 0C A9
	adc $AB0D0C.l,X		; 7F 0C 0D AB
	adc $AD0C0C.l,X		; 7F 0C 0C AD
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $A60C0A.l,X		; 7F 0A 0C A6
	adc $A6130A.l,X		; 7F 0A 13 A6
	adc $AD1110.l,X		; 7F 10 11 AD
	adc $A60C0A.l,X		; 7F 0A 0C A6
	adc $A6140C.l,X		; 7F 0C 14 A6
	adc $AD100F.l,X		; 7F 0F 10 AD
	adc $A60D0A.l,X		; 7F 0A 0D A6
	adc $A6120B.l,X		; 7F 0B 12 A6
	adc $AD1110.l,X		; 7F 10 11 AD
	adc $A60C0A.l,X		; 7F 0A 0C A6
	adc $AD0C0C.l,X		; 7F 0C 0C AD
	adc $AB0C0B.l,X		; 7F 0B 0C AB
	adc $AD0C0A.l,X		; 7F 0A 0C AD
	adc $A40D0D.l,X		; 7F 0D 0D A4
	adc $A4120A.l,X		; 7F 0A 12 A4
	adc $AB0F0F.l,X		; 7F 0F 0F AB
	adc $A40E0B.l,X		; 7F 0B 0E A4
	adc $A4130B.l,X		; 7F 0B 13 A4
	adc $AB0F0E.l,X		; 7F 0E 0F AB
	adc $A40D0C.l,X		; 7F 0C 0D A4
	adc $A41207.l,X		; 7F 07 12 A4
	adc $AB1211.l,X		; 7F 11 12 AB
	adc $A90C0C.l,X		; 7F 0C 0C A9
	adc $AB0D0C.l,X		; 7F 0C 0D AB
	adc $AD0C0C.l,X		; 7F 0C 0C AD
	adc $A40C0C.l,X		; 7F 0C 0C A4
	adc $DC0B0A.l,X		; 7F 0A 0B DC
	ora #$DF00.w		; 09 00 DF
	ora [$3C.b]		; 07 3C
	ora ($A6.b,X)		; 01 A6
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	ldx $40.b		; A6 40
	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	lda #$0540.w		; A9 40 05
	asl $A6.b		; 06 A6
	rti		; 40

	ora $06.b		; 05 06
	plb		; AB
	rti		; 40

	ora $06.b		; 05 06
	lda $0540.w		; AD 40 05
	asl $A9.b		; 06 A9
	rti		; 40

	ora $06.b		; 05 06
	tay		; A8
	rti		; 40

	ora $06.b		; 05 06
	stp		; DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($62.b,X)		; 01 62
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	phd		; 0B
	eor [$74.b]		; 47 74
	adc ($2F.b)		; 72 2F
	adc $68.b,S		; 63 68
	adc ($64.b)		; 72 64
	jsr $0031.w		; 20 31 00
	brk $DC.b		; 00 DC
	bpl   0.b		; 10 00
	cmp $0C3C07.l,X		; DF 07 3C 0C
	txs		; 9A
	adc $A11615.l,X		; 7F 15 16 A1
	adc $811E81.l,X		; 7F 81 1E 81
	and #$7F98.w		; 29 98 7F
	ora [$18.b],Y		; 17 18
	sta $1A817F.l,X		; 9F 7F 81 1A
	sta ($29.b,X)		; 81 29
	txs		; 9A
	adc $A11615.l,X		; 7F 15 16 A1
	adc $811E81.l,X		; 7F 81 1E 81
	and #$7F98.w		; 29 98 7F
	ora [$18.b],Y		; 17 18
	sta $1A817F.l,X		; 9F 7F 81 1A
	sta ($29.b,X)		; 81 29
	txs		; 9A
	adc $A11615.l,X		; 7F 15 16 A1
	adc $811E81.l,X		; 7F 81 1E 81
	and #$7F98.w		; 29 98 7F
	ora [$18.b],Y		; 17 18
	sta $1A817F.l,X		; 9F 7F 81 1A
	sta ($29.b,X)		; 81 29
	txs		; 9A
	adc $A11615.l,X		; 7F 15 16 A1
	adc $811E81.l,X		; 7F 81 1E 81
	and #$7F98.w		; 29 98 7F
	ora [$18.b],Y		; 17 18
	sta $1A817F.l,X		; 9F 7F 81 1A
	sta ($1D.b,X)		; 81 1D
	jmp.w [$0011]		; DC 11 00
	cmp $003207.l,X		; DF 07 32 00
	lda #$4A7F.w		; A9 7F 4A
	mvn $7F,$A8		; 54 A8 7F
	tsb $0B.b		; 04 0B
	lda #$0D7F.w		; A9 7F 0D
	ora ($A9.b)		; 12 A9
	adc $A8120B.l,X		; 7F 0B 12 A8
	adc $A90C06.l,X		; 7F 06 0C A9
	adc $A9130C.l,X		; 7F 0C 13 A9
	adc $A9110A.l,X		; 7F 0A 11 A9
	adc $A80D06.l,X		; 7F 06 0D A8
	adc $A84745.l,X		; 7F 45 47 A8
	adc $A97871.l,X		; 7F 71 78 A9
	adc $A95F5C.l,X		; 7F 5C 5F A9
	adc $AB625E.l,X		; 7F 5E 62 AB
	adc $812B81.l,X		; 7F 81 2B 81
	bit $AB.b,X		; 34 AB
	adc $DC0C0B.l,X		; 7F 0B 0C DC
	ora ($00.b)		; 12 00
	cmp $003207.l,X		; DF 07 32 00
	lda #$4A7F.w		; A9 7F 4A
	mvn $7F,$A8		; 54 A8 7F
	tsb $0B.b		; 04 0B
	lda #$0D7F.w		; A9 7F 0D
	ora ($A9.b)		; 12 A9
	adc $A8120B.l,X		; 7F 0B 12 A8
	adc $A90C06.l,X		; 7F 06 0C A9
	adc $A9130C.l,X		; 7F 0C 13 A9
	adc $A9110A.l,X		; 7F 0A 11 A9
	adc $A80D06.l,X		; 7F 06 0D A8
	adc $A84745.l,X		; 7F 45 47 A8
	adc $A97871.l,X		; 7F 71 78 A9
	adc $A95F5C.l,X		; 7F 5C 5F A9
	adc $AB625E.l,X		; 7F 5E 62 AB
	adc $813181.l,X		; 7F 81 31 81
	bit $AB.b,X		; 34 AB
	adc $DC170B.l,X		; 7F 0B 17 DC
	bpl   0.b		; 10 00
	cmp $013207.l,X		; DF 07 32 01
	txs		; 9A
	adc $A11615.l,X		; 7F 15 16 A1
	adc $811E81.l,X		; 7F 81 1E 81
	and #$7F98.w		; 29 98 7F
	ora [$18.b],Y		; 17 18
	sta $1A817F.l,X		; 9F 7F 81 1A
	sta ($29.b,X)		; 81 29
	txs		; 9A
	adc $A11615.l,X		; 7F 15 16 A1
	adc $811E81.l,X		; 7F 81 1E 81
	and #$7F98.w		; 29 98 7F
	ora [$18.b],Y		; 17 18
	sta $1A817F.l,X		; 9F 7F 81 1A
	sta ($1D.b,X)		; 81 1D
	jmp.w [$0008]		; DC 08 00
	cmp $003207.l,X		; DF 07 32 00
	lda ($7F.b,X)		; A1 7F
	sta ($3E.b,X)		; 81 3E
	sta ($3F.b,X)		; 81 3F
	sta $41817F.l,X		; 9F 7F 81 41
	sta ($41.b,X)		; 81 41
	sta $817F.w,X		; 9D 7F 81
	and $9F3F81.l,X		; 3F 81 3F 9F
	adc $813B81.l,X		; 7F 81 3B 81
	eor ($A1.b,X)		; 41 A1
	adc $813E81.l,X		; 7F 81 3E 81
	and $817F9F.l,X		; 3F 9F 7F 81
	eor ($81.b,X)		; 41 81
	eor ($9D.b,X)		; 41 9D
	adc $813F81.l,X		; 7F 81 3F 81
	and $817F9F.l,X		; 3F 9F 7F 81
	and $4181.w,Y		; 39 81 41
	stp		; DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	plb		; AB
	brk $00.b		; 00 00
	ora ($66.b,X)		; 01 66
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	phd		; 0B
	eor [$74.b]		; 47 74
	adc ($2F.b)		; 72 2F
	adc $68.b,S		; 63 68
	adc ($64.b)		; 72 64
	jsr $0032.w		; 20 32 00
	brk $DC.b		; 00 DC
	asl $00.b		; 06 00
	cmp $173C07.l,X		; DF 07 3C 17
	sta $18167F.l,X		; 9F 7F 16 18
	ldx $7F.b		; A6 7F
	sta ($10.b,X)		; 81 10
	sta ($28.b,X)		; 81 28
	sta $187F.w,X		; 9D 7F 18
	clc		; 18
	ldy $7F.b		; A4 7F
	sta ($0D.b,X)		; 81 0D
	and ($DF.b),Y		; 31 DF
	ora [$32.b]		; 07 32
	adc [$9F.b],Y		; 77 9F
	adc $A61817.l,X		; 7F 17 18 A6
	adc $811081.l,X		; 7F 81 10 81
	plp		; 28
	sta $187F.w,X		; 9D 7F 18
	clc		; 18
	ldy $7F.b		; A4 7F
	sta ($0D.b,X)		; 81 0D
	sta ($28.b,X)		; 81 28
	sta $18177F.l,X		; 9F 7F 17 18
	ldx $7F.b		; A6 7F
	sta ($10.b,X)		; 81 10
	sta ($28.b,X)		; 81 28
	sta $187F.w,X		; 9D 7F 18
	clc		; 18
	ldy $7F.b		; A4 7F
	sta ($0D.b,X)		; 81 0D
	sta ($28.b,X)		; 81 28
	sta $18177F.l,X		; 9F 7F 17 18
	ldx $7F.b		; A6 7F
	sta ($10.b,X)		; 81 10
	sta ($28.b,X)		; 81 28
	sta $187F.w,X		; 9D 7F 18
	clc		; 18
	ldy $7F.b		; A4 7F
	sta ($0D.b,X)		; 81 0D
	sta ($11.b,X)		; 81 11
	jmp.w [$000C]		; DC 0C 00
	cmp $003207.l,X		; DF 07 32 00
	ldx $7F.b		; A6 7F
	lsr A		; 4A
	mvn $7F,$A4		; 54 A4 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $A611.w		; 0D 11 A6
	adc $A4120B.l,X		; 7F 0B 12 A4
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $A6130C.l,X		; 7F 0C 13 A6
	adc $A6110A.l,X		; 7F 0A 11 A6
	adc $A40D05.l,X		; 7F 05 0D A4
	adc $A43B37.l,X		; 7F 37 3B A4
	adc $04817C.l,X		; 7F 7C 81 04
	ldx $7F.b		; A6 7F
	jmp $7FA660.l		; 5C 60 A6 7F
	eor $A861.w,X		; 5D 61 A8
	adc $811D81.l,X		; 7F 81 1D 81
	plp		; 28
	tay		; A8
	adc $DC1815.l,X		; 7F 15 18 DC
	ora ($00.b,S),Y		; 13 00
	cmp $003207.l,X		; DF 07 32 00
	ldx $7F.b		; A6 7F
	lsr A		; 4A
	mvn $7F,$A4		; 54 A4 7F
	tsb $0C.b		; 04 0C
	ldx $7F.b		; A6 7F
	ora $A611.w		; 0D 11 A6
	adc $A4120B.l,X		; 7F 0B 12 A4
	adc $A60C06.l,X		; 7F 06 0C A6
	adc $A6130C.l,X		; 7F 0C 13 A6
	adc $A6110A.l,X		; 7F 0A 11 A6
	adc $A40D05.l,X		; 7F 05 0D A4
	adc $A43B37.l,X		; 7F 37 3B A4
	adc $04817C.l,X		; 7F 7C 81 04
	ldx $7F.b		; A6 7F
	jmp $7FA660.l		; 5C 60 A6 7F
	eor $A861.w,X		; 5D 61 A8
	adc $813F81.l,X		; 7F 81 3F 81
	plp		; 28
	tay		; A8
	adc $DC2F17.l,X		; 7F 17 2F DC
	asl $00.b		; 06 00
	cmp $003207.l,X		; DF 07 32 00
	sta $18177F.l,X		; 9F 7F 17 18
	ldx $7F.b		; A6 7F
	sta ($10.b,X)		; 81 10
	sta ($28.b,X)		; 81 28
	sta $187F.w,X		; 9D 7F 18
	clc		; 18
	ldy $7F.b		; A4 7F
	sta ($0D.b,X)		; 81 0D
	sta ($28.b,X)		; 81 28
	sta $18177F.l,X		; 9F 7F 17 18
	ldx $7F.b		; A6 7F
	sta ($10.b,X)		; 81 10
	sta ($28.b,X)		; 81 28
	sta $187F.w,X		; 9D 7F 18
	clc		; 18
	ldy $7F.b		; A4 7F
	sta ($0D.b,X)		; 81 0D
	sta ($11.b,X)		; 81 11
	jmp.w [$0011]		; DC 11 00
	cmp $003207.l,X		; DF 07 32 00
	lda #$817F.w		; A9 7F 81
	rol $3F81.w,X		; 3E 81 3F
	tay		; A8
	adc $814081.l,X		; 7F 81 40 81
	eor ($A6.b,X)		; 41 A6
	adc $813F81.l,X		; 7F 81 3F 81
	and $817FA8.l,X		; 3F A8 7F 81
	tsa		; 3B
	sta ($41.b,X)		; 81 41
	lda #$817F.w		; A9 7F 81
	rol $3F81.w,X		; 3E 81 3F
	tay		; A8
	adc $814081.l,X		; 7F 81 40 81
	eor ($A6.b,X)		; 41 A6
	adc $813F81.l,X		; 7F 81 3F 81
	and $817FA8.l,X		; 3F A8 7F 81
	and $4181.w,X		; 3D 81 41
	stp		; DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora ($E4.b,X)		; 01 E4
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	asl $53.b		; 06 53
	ror $7261.w		; 6E 61 72
	adc $00.b		; 65 00
	brk $DC.b		; 00 DC
	ora ($00.b,X)		; 01 00
	cmp $173C07.l,X		; DF 07 3C 17
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	adc ($06.b,X)		; 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0661.w		; 8E 61 06
	bmi -114.b		; 30 8E
	eor $3005.w,Y		; 59 05 30
	stx $0561.w		; 8E 61 05
	bmi -114.b		; 30 8E
	jmp $8E3004.l		; 5C 04 30 8E
	adc ($05.b,X)		; 61 05
	bmi -114.b		; 30 8E
	eor $3004.w,Y		; 59 04 30
	stx $055C.w		; 8E 5C 05
	ora $00DB.w,Y		; 19 DB 00
	cmp $0000.w,Y		; D9 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $6C.b,S		; 03 6C
	mvn $41,$52		; 54 52 41
	phk		; 4B
	brk $E7.b		; 00 E7
	ora $4B.b		; 05 4B
	adc #$6B63.w		; 69 63 6B
	brk $00.b		; 00 00
	jmp.w [$0000]		; DC 00 00
	cmp $003207.l,X		; DF 07 32 00
	sty $047F.w		; 8C 7F 04
	ora ($8C.b)		; 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C0C03.l,X		; 7F 03 0C 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E05.l,X		; 7F 05 1E 8C
	adc $8C3006.l,X		; 7F 06 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E03.l,X		; 7F 03 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C3005.l,X		; 7F 05 30 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $8C1E04.l,X		; 7F 04 1E 8C
	adc $8C1205.l,X		; 7F 05 12 8C
	adc $8C1204.l,X		; 7F 04 12 8C
	adc $DB0C03.l,X		; 7F 03 0C DB
	brk $D9.b		; 00 D9
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	brk $00.b		; 00 00
	ora $FF.b		; 05 FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	sbc $FFFFFF.l,X		; FF FF FF FF
	.db $FF		; Opcode FF overrunning bank boundry at 00FFFC. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 00FFFD. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 00FFFE. Skipping.
	.db $FF		; Opcode FF overrunning bank boundry at 00FFFF. Skipping.
.ENDS
