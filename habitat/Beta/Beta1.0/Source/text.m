;****************************************
;	display text
;****************************************

;	dline uses temp_var 1 and 2

	define	char_pos	= temp_var_3
	define	num_of_chars	= temp_var_3+1

	define	pixel_width	= temp_var_4
	define	pixel_height	= temp_var_4+1
	define	char_width	= temp_var_5
	define	char_height	= temp_var_5+1


	define	init_x		= temp_address
	define	pixel_hcount	= temp_address+1
	define	half_size	= y1a_lo
	define	invert_byte	= y1b_lo



text::
	moveb	x1a,x_temp
	sta	init_x
	moveb	y1,y_temp

	jsr	get_class_address
	ldy	#CLASS_object_length
	lda	y[@class_address]
	sec
	sbc	#OBJECT_text_start + 1			; one less!
	sta	num_of_chars

	moveb	#OBJECT_text_start,char_pos		; where is the text?


	lda	#1
	sta	pixel_width				; regular width
	sta	pixel_height				; regular height
	sta	half_size				; half size
	moveb	#0xff,invert_byte


	do {
		ldy	char_pos
		lda	y[@object_address]
		jsr	dchar
		inc	char_pos
		dec	num_of_chars
	} while (plus)
	rts


;****************************************
;	display char passed in 'A'
;****************************************
dchar:
	mif (develop) {					; blink cursor!
		ldy	test_object
		cpy	drawing_which_object
		if (equal) {

			ldy	char_pos
			cpy	text_position
			if (equal) {
				ldy	text_insert_mode
				if (!equal) {
					dec	cursor_blink
					ldy	cursor_blink
					if (equal) {
						cmp	#0	; not control
						if (plus) {	; characters
						    moveb    #2,cursor_blink
						    lda      #31 ; under score
						}
					}
				}
			}
		}
	}

	tax							; char to draw

	cmp	#sign_char_half_size
	if (equal) {
		lda	half_size
		eor	#1
		sta	half_size
		rts
	}


	cmp	#sign_char_inverse_video
	if (equal) {
		lda	invert_byte
		eor	#0xff
		sta	invert_byte
		rts
	}

	cmp	#sign_char_inc_width
	if (equal) {
		inc	pixel_width
		rts
	}
	cmp	#sign_char_dec_width
	if (equal) {
		dec	pixel_width
		rts
	}

	cmp	#sign_char_inc_height
	if (equal) {
		inc	pixel_height
		rts
	}
	cmp	#sign_char_dec_height
	if (equal) {
		dec	pixel_height
		rts
	}

	lda	pixel_width			; find width and height
	asl	a				; of the character
	asl	a
	ldy	half_size
	if (equal) {
		asl	a
	}
	sta	char_width

	lda	pixel_height
	asl	a
	asl	a
	asl	a
	sta	char_height


	txa
	cmp	#sign_char_return_key		; carraige return
	if (equal) {
		moveb	init_x,x_temp		; start at init x pos
		lda	y_temp
		clc
		adc	char_height
		sta	y_temp
		rts
	}

	cmp	#char_space
	if (equal) {
		lda	char_width		; add width to pos
		jmp	add_w
	}

	cmp	#sign_char_double_space
	if (equal) {
		lda	char_width		; add width to pos
		asl	a
		jmp	add_w
	}

	cmp	#sign_char_half_space
	if (equal) {
		lda	char_width		; add half of width
		lsr	a
add_w:		clc
		adc	x_temp
		sta	x_temp
		rts
	}

	cmp	#sign_char_cursor_up
	if (equal) {
		lda	y_temp
		sec
		sbc	char_height
		sta	y_temp
		rts
	}

	cmp	#sign_char_cursor_down
	if (equal) {
		lda	char_height
		jmp	add_h
	}

	cmp	#sign_char_half_char_down	; down half space
	if (equal) {
		lda	char_height
		lsr	a
add_h:		clc
		adc	y_temp
		sta	y_temp
		rts
	}

	cmp	#sign_char_cursor_left
	if (equal) {
		lda	x_temp
		sec
		sbc	char_width
		sta	x_temp
		rts
	}



	ldy	#0x02				; value that should be in spot
	sty	which_bit+1

	ldy	half_size
	if (!equal) {
		ldy	#0x04
		sty	which_bit+1
		ldy	#5
		do {
			cmp	y[chg_bits]
			if (equal) {
				lda	#0x02	; value for BMWJmw
				sta	which_bit+1
				ldy	#0
			}
			dey
		} while (plus)
	}


;****************************************
;	DRAW the character!
;****************************************

	clearb	text_adr+1			; find address in charset!
	txa
	asl	a
	rol	text_adr+1
	asl	a
	rol	text_adr+1
	asl	a
	rol	text_adr+1

	clc
	adc	#/charset
	sta	text_adr
	lda	text_adr+1
	adc	#?charset
	sta	text_adr+1

	lda	#0				; draw the char from charset
	sta	v_count
	do {
		lda	#7
		sta	h_count
		do {
			ldy	v_count
			ldx	h_count
			lda	y[@text_adr]

			eor	invert_byte
			beq	next_line		; if blank line, exit

			and	x[which_bit]
			if (!equal) {			; not inverted!

				moveb	pixel_height,pixel_hcount
				do {
					lda	x_temp
					sta	x1a
					clc
					adc	pixel_width
					sta	x1b
					dec	x1b
					moveb	y_temp,y1
					if (plus) {	; clip off screen
						jsr	dline
					}

					inc	y_temp

					dec	pixel_hcount
				} until (equal)

				lda	y_temp
				sec
				sbc	pixel_height
				sta	y_temp

			}
			lda	x_temp			; one pixel to right
			clc
			adc	pixel_width
			sta	x_temp


			lda	h_count			; skip every (other)
			clc				; pixel?
			sbc	half_size
			sta	h_count
		} while (plus)

		lda	x_temp
		sec
		sbc	char_width
		sta	x_temp

next_line:	lda	y_temp
		clc
		adc	pixel_height
		sta	y_temp

		inc	v_count
		lda	v_count
		cmp	#8
	} while (!equal)

	lda	y_temp
	sec
	sbc	char_height
	sta	y_temp

	lda	x_temp
	clc
	adc	char_width
	sta	x_temp
	rts


which_bit:
	byte	0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80


chg_bits:	byte	"BMWJwm"

