zoom:					; The Comet, By Kevin Furry
	bank_io_in
	moveb	#0b00000001,sprite_enable		; turn on sprite 0
	sta	sprite_priority				; priority
	sta	0xd027					; color equals white

	ldy	#63
	do	{
		lda	y[0x4000]
		sta	y[customize_hold_area]
		lda	#0
		sta	y[0x4000]
		dey
	} until (minus)

	moveb	#0b00100001,0x4001		; draw sprite
	moveb	#0b00100110,0x4002

	moveb	#0b10000100,0x4003
	moveb	#0b01000100,0x4004
	moveb	#0b01011111,0x4005

	moveb	#0b00010000,0x4007
	moveb	#0b10010110,0x4008

comet_x_pos:	byte	24
comet_y_pos:	byte	128
comet_y_inc:	byte	10
comet_x_inc:	byte	10

move_comet:
	do	{
		dec	comet_x_inc
		if	(zero)	{			; can we move
			moveb	#200,comet_x_inc	; restore counter
			dec	comet_y_inc		; can we move y
			if	(zero)	{
				moveb	#20,comet_y_inc	; restore counter
				inc	comet_y_pos	; ok move it
				ldy	comet_y_pos
			}
			inc	comet_x_pos		; is x over 255
			if	(zero)	{
				moveb	#0b00000001,0xd010 ; set its msb
			}
			moveb	comet_x_pos,0xd000	; move sprite
			moveb	comet_y_pos,0xd001
			cmp	#71+16			; are we done yet ?
		}
	} until	(zero)

	ldy	#63				; recover sprite
	do	{
		lda	y[customize_hold_area]
		sta	y[0x4000]
		dey
	} until (minus)
	clearb	sprite_enable
	sta	sprite_priority
	bank_io_out
	rts
