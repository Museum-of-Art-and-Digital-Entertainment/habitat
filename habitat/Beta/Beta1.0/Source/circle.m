;---------------------------------------
;
;	Draw a circle defined in terms of
;
;	x1a	 y1	  y2
;	x_center y_center size
;


define	lasty 		= delta_x_b
define	x_loc_hi	= x1a_lo
define	x_loc_lo	= x1b_lo

define	y_loc_hi	= y1a_lo
define	y_loc_lo	= y1b_lo

define	x_center	= delta_x_a
define	y_center	= delta_y


circle::
mif (0) {
	moveb	x1a,x_center			; center of circle
	moveb	y1,y_center

	lda	cel_height			; size
	if (equal) {
		lda	#1			; minimum size = 1
	}
	sta	x_loc_hi


	clearb	y_loc_hi			; init values
	sta	y_loc_lo
	sta	x_loc_lo

	lda	#0xff
	sta	lasty

circle_continue:
	do {
		lda	y_loc_hi		; 1/2 'Y' for round circles
		lsr	a
		eor	#0xff
		sec
		adc	x_loc_lo
		sta	x_loc_lo
		if (!carry) {
			dec	x_loc_hi
			if (equal) { rts }	; done?
		}

		lda	x_loc_hi
		clc
		adc	y_loc_lo
		sta	y_loc_lo
		if (carry) {
			inc	y_loc_hi
		}

		lda	y_loc_hi
		cmp	lasty
	} until (!equal)

	sta	lasty

	lda	x_center			; draw line across top
	sec
	sbc	x_loc_hi
	sta	x1a
	lda	x_center
	clc
	adc	x_loc_hi
	sta	x1b
	lda	y_center
	sec
	sbc	y_loc_hi
	sta	y1
	if (plus) {				; y clip
		jsr	dline
	}


	lda	x_center			; draw line across bottom
	sec
	sbc	x_loc_hi
	sta	x1a
	lda	x_center
	clc
	adc	x_loc_hi
	sta	x1b
	lda	y_center
	clc
	adc	y_loc_hi
	sta	y1
	if (plus) {				; y clip
		jsr	dline
	}

	jmp	circle_continue			; continue till done
}
 rts
