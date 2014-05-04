;---------------------------------------
;
;	Draw a box defined in terms of
;
;	Y1, X1a, X1b
;	Y2,
;	shape_pattern

;	border lr_bord, tb_bord
;----------------------------------------


	define	y1_save		= temp_var_1
	define	black_border	= temp_var_1+1
	define	glass		= temp_var_2
	define	init_pat	= temp_var_2+1

	define	y_holder	= temp_var_3
	define	b_pattern	= temp_var_3+1
	define	pat_line	= temp_var_4
	define	pat_temp2	= temp_var_4+1

	define	temp_scrn_addr	= temp_var_5


box::
	clearb	glass
	sta	pat_line

	lda	y2				; get abs(y1-y2) (y2>y1)
	sec
	sbc	y1
	sta	vcount				; # of vertical lines in trap

	lda	shape_pattern
	if (equal) {
		inc	glass
	}

	ldx	cel_dx				; flip 1 byte wide boxes
	if (!equal) {
		tax
		lda	x[reverse_pixels]
	}
	sta	init_pat

	ldx	d_wild				; wild color?
	if (plus) {
		tax
		lda	x[ora_table]
	}
	sta	shape_pattern

	ldy	#0
	lda	image_control
	and	#lr_bord
	if (!equal) {				; if left/right border
		iny
	}
	sty	black_border


	lda	image_control
	and	#tb_bord
	if (!equal) {				; if top/bottom border
		moveb	y1,y1_save		; save init y pos

		inc	y1
		dec	vcount			; fewer vertical lines
		dec	vcount
	}


	lda	x1a				; clip left
	cmp	#160
	if (carry) {
		lda	x1b
		cmp	#160
		bcs	fexit
		clearb	x1a
	}

	lda	x1b				; clip right
	cmp	#160
	if (carry) {
		moveb	#159,x1b
	}


	lda	x1a				; byte position of left edge
	lsr	a
	lsr	a
	sta	x1a_div_4

	lda	x1b				; byte position of right edge
	lsr	a
	lsr	a
	sec
	sbc	x1a_div_4
	sta	x_index				; # of bytes to fill text_ram
	sta	fill_wid

	do {
		jsr	fline			; draw a horizontal line
		inc	y1			; next line down
		dec	vcount
	} while (plus)


	lda	image_control			; top and bottom borders?
	and	#tb_bord
	if (!equal) {
		clearb	glass

		lda	#pat_black		; black borders
		sta	shape_pattern
		jsr	fline			; draw line at y1

		moveb	y1_save,y1
		jmp	fline
	}
fexit:
	rts


;****************************************
;	SuperFast line drawer!
;	only bytes on byte boundaries
;****************************************
fline:
	ldx	y1				; clip top/bottom
	bmi	fexit

	lda	pat_line		; put pattern into pat
	and	#3
	tay
	lda	y[swap_pat]
	inc	pat_line
	sta	vert_pat

	ldy	shape_pattern
	if (!equal) {
		tya
	}
	sta	b_pattern


	lda	change_color_ram		; only change color_ram
	if (!equal) {				; don't draw box!
		jmp	fill_back
	}

	ldy	x1a
	jsr	get_screen_address

;****************************************
;	draw the line
;****************************************

	ldx	x_index				; if one byte wide or less!
	if (equal) {
		ldx	init_pat		;cartoon_buffer+5

		lda	vert_pat
		and	x[mask_blue]
		sta	pat_temp2

		lda	x[bluescreen]
		and	y[@screen_address]
		ora	x[ora_table]
		ora	pat_temp2
		sta	y[@screen_address]
		jmp	fill_back
	}

	movew	screen_address,temp_scrn_addr		; save 1st position
	sty	y_holder
	clc						; keep carry clear!
	dex
	if (plus) {
		do {
			lda	glass			; could be faster
			if (equal) {
				lda	b_pattern
;				lda	shape_pattern
				sta	y[@screen_address]
			}
			tya				; move to next byte
			adc	#8
			tay
			if (carry) {
				inc	screen_address+1
				clc
			}

			dex
		} while (plus)
	}
	lda	glass
	if (equal) {
;		lda	shape_pattern
		lda	b_pattern
		sta	y[@screen_address]
	}


	lda	black_border
	if (!equal) {
		lda	y[@screen_address]		; add black border
		and	#0q3330
		ora	#0q0002
		sta	y[@screen_address]

		ldy	y_holder
		lda	y[@temp_scrn_addr]
		and	#0q0333
		ora	#0q2000
		sta	y[@temp_scrn_addr]
	}		

	jmp	fill_back


vert_pat:		block	1
