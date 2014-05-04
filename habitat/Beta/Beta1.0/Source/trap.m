;---------------------------------------
;
;	Draw a trapezoid defined in terms of
;
;	Y1, X1a, X1b
;	Y2, X2a, X2b
;	trap_color

	define	y1_save		= temp_var_3
	define	i_temp		= temp_var_3+1
	define	x1a_save	= temp_var_4
	define	x1b_save	= temp_var_4+1
	define	s_temp		= temp_var_5
	define	trap_border	= temp_var_5+1


;****************************************
;	draw the trapezoid
;****************************************
trap::
	ldy	cel_height
	if (minus) {				; border around trap!
		moveb	y1,y1_save		; save init y pos
	}
	cpy	#0x80
	if (equal) {
		dey
	}
	sty	trap_border


	lda	y2				; get abs(y1-y2) (y2>y1)
	sec
	sbc	y1
	sta	delta_y
	sta	vcount				; # of vertical lines in trap

;****************************************
;	left side line
;****************************************
	ldy	#0xc6				; dec
	lda	x1a				; get abs(x1-x2)
	sec
	sbc	x2a
	if (!carry) {
		eor	#0xff
		clc
		adc	#1
		ldy	#0xe6			; inc
	}
	sta	delta_x_a
	sty	inc_dec1


	cmp	delta_y				; find greater
	if (!carry) {
		lda	delta_y
	}
	sta	count_max_a

	lsr	a
	sta	x1a_lo
	sta	y1a_lo


;****************************************
;	right side line
;****************************************

	ldy	#0xc6				; dec
	lda	x1b				; get abs(x1-x2)
	sec
	sbc	x2b
	if (!carry) {
		eor	#0xff
		clc
		adc	#1
		ldy	#0xe6			; inc
	}
	sta	delta_x_b
	sty	inc_dec2

	cmp	delta_y				; find greater
	if (!carry) {
		lda	delta_y
	}
	sta	count_max_b

	lsr	a
	sta	x1b_lo
	sta	y1b_lo

;****************************************
;	draw one line across trap
;****************************************
draw_line:
	lda	y1				; clip vert
	if (plus) {

		jsr	dline			; draw a horizontal line

		bit	trap_border
		if (minus) {
			moveb	shape_pattern,s_temp	; line color to black
			moveb	#pat_black,shape_pattern

			moveb	image_control,i_temp	; supr trap blk border
			clearb	image_control

			moveb	x1a,x1a_save		; and init horiz pos's

			lda	vcount		; last line?
			beq	d_black

			lda	y1		; first line?
			cmp	y1_save
			beq	d_black

			lda	x1b		; draw left edge
			pha
			moveb	x1a,x1b
			jsr	dline
			pla
			sta	x1b

			moveb	x1b,x1a		; draw right edge
d_black:		jsr	dline

			moveb	x1a_save,x1a	; restore x1a
			moveb	s_temp,shape_pattern	; restore color/pat

			moveb	i_temp,image_control
		}
	}
next_line:
	dec	vcount
	bpl	cycle1
	rts

cycle1:
	lda	x1a_lo				; (x)=(x)+sx
	clc
	adc	delta_x_a
	cmp	count_max_a			; if (x)>=2 then (x)=-d x++
	if (carry) {
		sec
		sbc	count_max_a
inc_dec1:
		inc	x1a			; SELF MOD
	}
	sta	x1a_lo

	lda	y1a_lo
	clc
	adc	delta_y
	bcs	next_1
	cmp	count_max_a
	if (!carry) {
		sta	y1a_lo
		jmp	cycle1
	}
next_1:
	sec
	sbc	count_max_a
	sta	y1a_lo


cycle2:
	lda	x1b_lo				; (x)=(x)+sx
	clc
	adc	delta_x_b
	cmp	count_max_b			; if (x)>=2 then (x)=-d x++
	if (carry) {
		sec
		sbc	count_max_b
inc_dec2:
		inc	x1b			; SELF MOD
	}
	sta	x1b_lo

	lda	y1b_lo
	clc
	adc	delta_y
	bcs	next_2
	cmp	count_max_b
	if (!carry) {
		sta	y1b_lo			; if less, once again
		jmp	cycle2
	}
next_2:
	sec					; if greater, =-delta, draw
	sbc	count_max_b
	sta	y1b_lo

	inc	y1				; next line down
	jmp	draw_line

;; i_temp:	block	1
