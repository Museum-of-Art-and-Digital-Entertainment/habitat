;****************************************
;	pointer system to point at cels
;	or items in background
;****************************************
update_cursor::
	clearb	pointed_NOID

	lda	cursor_x		; find location to left of
	sec
	sbc	#6
	sta	cursor_screen_x
	sta	desired_x
	sta	temp_cursor_x


	beq	pexit
	cmp	#160
	beq	pexit

	lda	cursor_y		; and above cursor
	sec
	sbc	#231+8
	eor	#0xff
	sta	cursor_screen_y
	eor	#0x7f
	sta	temp_cursor_y
	lda	cursor_screen_y
	ora	#0x80
	sta	desired_y


	moveb	#1,test_pointed_at	; don't draw objects

	lda	display_contents_noid
	if (equal) {
	    lda	display_page
	    ldx	#0xff			; test for background objects
	    jsr	create_sort_table
	    ldx	#0x00			; test for foreground objects
	    lda	display_page
	    jsr	create_sort_table
	} else {
	    jsr	display_contents_screen
	}
	clearb	test_pointed_at		; draw objects again!
pexit:
	lda	pointed_NOID
	rts


;****************************************
;	cursor pointing at trap or box?
;****************************************

	define	box_y1	= y1a_lo
	define	box_y2	= y1b_lo
	define	box_x1	= x1a_lo
	define	box_x2	= x1b_lo

boundary_check::

;;	ldy	#OBJECT_orientation		; Objects you can't point at
;;	lda	y[@object_address]
;;	and	#4
;;	bne	pexit

	lda	image_control
	and	#0b11100000			; can't point to text
	cmp	#cel_text
	beq	pexit

	and	#cel_mask
	if (equal) {
		moveb	screen_y,box_y1			; if cel...
		moveb	screen_y_limit,box_y2
		lda	screen_x
		if (minus) {
			lda	#0			; clip if off screen
		}
		asl	a
		asl	a
		sta	box_x1
		lda	screen_x_limit
		asl	a
		asl	a
		sta	box_x2

	} else {

		cmp	#cel_trap
		if (equal) {				; get closest corners

			clearb	in_line
			jsr	trap
			lda	in_line
			bne	pointed_at
			rts

		} else {
			moveb	x1a,box_x1		; box is OK
			moveb	x1b,box_x2
		}

		lda	box_x1				; if x1>x2, x1=0
		cmp	box_x2				; for boxes off left!
		if (!equal) {
			if (carry) {
				clearb	box_x1
			}
		}

		lda	y1
		if (minus) {
			lda	#0
		}
		sta	box_y1
		moveb	y2,box_y2
	}		

	lda	box_y1				; if off top of screen!
	if (minus) {				; clip box
		lda	box_y2
		if (plus) {
			clearb	box_y1
		}
	}


	ldy	temp_cursor_y			; use 'y' reg and dec between!
	cpy	box_y1				; to get x1< cursor >x2
	if (carry) {
		dey
		cpy	box_y2
		if (!carry) {
			ldy	temp_cursor_x
			cpy	box_x1
			if (carry) {
				dey
				cpy	box_x2
				if (!carry) {

					lda	image_control	; cel?
					and	#cel_mask
					beq	fine_cel_point


pointed_at:				lda	drawing_which_object	; hit
					sta	pointed_NOID
					lda	cel_number
					sta	pointed_at_cel_number
					lda	which_limb
					sta	pointed_at_limb
				}
			}
		}
	}
	rts



fine_cel_point:
	lda	container_type		; no fine point test on this object
	cmp	#1
	beq	pointed_at

	moveb	#0x55,plot_color	; put wild there
	jsr	plot
	jsr	paint_2			; draw the cel
	jsr	plot
	bne	pointed_at		; color different, then hit

	clearb	plot_color		; put a different color there
	jsr	plot
	jsr	paint_1
	jsr	paint_2			; draw the cel
	jsr	plot
	bne	pointed_at		; color different, then hit
	rts

;****************************************

cursor_screen_x::	block	1
cursor_screen_y::	block	1

temp_cursor_x::		block	1
temp_cursor_y::		block	1

test_pointed_at::	byte	0

in_line::		block	1	; cursor in trap line?


;****************************************
;	plot a single point
;****************************************
plot:
	ldy	temp_cursor_x
	ldx	temp_cursor_y

	jsr	get_screen_address

	lda	horiz_pos
	and	#3
	tax

	lda	plot_color			; value to or in
	and	x[ora_pattern_mask]
	sta	or_value

	lda	y[@screen_address]		; get screen value
	and	x[ora_pattern_mask]		; same as what is there?
	cmp	or_value
	php

	lda	y[@screen_address]		; plot point
	and	x[and_pattern]
	ora	or_value
	sta	y[@screen_address]

	plp
	rts


;****************************************
;	plot tables
;****************************************
and_pattern:
	byte	0q0333,0q3033,0q3303,0q3330

ora_pattern_mask:
	byte	0q3000,0q0300,0q0030,0q0003


;****************************************
;	get address of spot on screen
;****************************************
get_screen_address::
	sty	horiz_pos			; save horiz pos

	txa					; vert position
	lsr	a
	lsr	a
	lsr	a
	tay

	txa
	and	#0x1f
	tax

	lda	x[rowlo]
	sta	screen_address
	lda	y[rowhi]
	ora	display_window			; high byte offset into window
	tax

	lda	horiz_pos			; # of bytes across
	and	#0xfc				; multiply by 2 for byte
	asl	a
	tay					; y offset from edge
	if (carry) {
		inx
	}
	stx	screen_address+1
	rts

horiz_pos:	block	1
