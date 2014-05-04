;****************************************
;	draw a line
;	passed y1, x1a, x1b
;****************************************

	include "../Bin/class_equates.m"

	define	pattern_table  = cartoon_buffer	; patterns up to 16 bytes wide
	define	ltemp		= temp_var_1
	define	x1a_temp	= temp_var_1+1
	define	pattern_pointer	= temp_var_2

dline::						; clip edges of line
	lda	x1a				; clip left
	cmp	#160
	if (carry) {
		lda	x1b
		cmp	#160
		bcs	texit

		clearb	x1a
	}
	and	#3
	sta	x1a_and_3

	lda	x1b				; clip right
	cmp	#160
	if (carry) {
		moveb	#159,x1b
	}
	and	#3
	sta	x1b_and_3


	lda	test_pointed_at		; cursor pointing at object?
	if (!equal) {
		lda	y1
		cmp	temp_cursor_y	; drawing line same as cursor?
		bne	texit

		lda	temp_cursor_x
		cmp	x1a
		if (carry) {
			cmp	x1b
			beq	here_ok
			if (!carry) {
here_ok:			inc	in_line
			}
		}
texit:		rts
	}


	lda	image_control			; trap?
	and	#cel_mask
	cmp	#cel_trap
	if (equal) {
		lda	shape_pattern		; then don't draw! (0=glass)
		beq	texit
	}


;****************************************
;	setup color table
;****************************************
	lda	image_control				; fill color or pat#
	and	#pat
	if (zero) {					; not special pattern

		clearb	horiz_and_mask
		sta	vert_and_mask
		moveb	shape_pattern,pattern_table
		cmp	#pat_wild
		if (equal) {
			movew	#swap_pat,pnt_tmp
			moveb	#3,vert_and_mask
			jmp	lpats
		}

	} else {

		ldy	#OBJECT_class_pointer
		lda	y[@object_address]
		cmp	#CLASS_super_trapezoid
		if (equal) {
			lda	object_address
			clc
			adc	#TRAP_pattern_x_size-11
			sta	cel_address
			lda	object_address+1
			adc	#0
			sta	cel_address+1
		}

		lda	cel_address		; pattern is 13th byte in cel
		clc				; allow 256 bytes in pattern!
		adc	#13
		sta	pnt_tmp
		lda	cel_address+1
		adc	#0
		sta	pnt_tmp+1

		ldy	#11				; h mask pos is 11th
		lda	y[@cel_address]
		and	#0x0f
		sta	horiz_and_mask
		iny
		moveb	y[@cel_address],vert_and_mask


lpats:		lda	y1			; mod vert pos by vert_mask
		and	vert_and_mask

		ldy	horiz_and_mask
		if (!equal) {
			sty	ltemp
			do {
				asl	a		; do multiply by 2
				lsr	ltemp
			} until (equal)
		}

		clc
		adc	horiz_and_mask
		sta	pattern_pointer

		ldx	horiz_and_mask
		do {
			ldy	pattern_pointer
			lda	y[@pnt_tmp]	; fill table with pattern line
			bit	d_wild
			if (plus) {		; convert wild color to blue
				tay
				lda	y[ora_table]
			}
			sta	x[pattern_table]
			dec	pattern_pointer
			dex
		} while (plus)
	}


;****************************************
;	find screen address
;****************************************

	ldx	y1
	ldy	x1a
	jsr	get_screen_address


;****************************************
;	draw the line
;****************************************

	lda	x1a				; byte position of left edge
	lsr	a
	lsr	a
	sta	x1a_div_4

	and	horiz_and_mask
	sta	x1a_temp			; pointer for start of pattern

	lda	x1b				; byte position of right edge
	lsr	a
	lsr	a
	sec
	sbc	x1a_div_4
	sta	x_index				; # of bytes to fill text_ram
	sta	fill_wid

	if (equal) {				; if start/end on same byte...
		lda	x1a_and_3
		beq	trail

		lda	x1b_and_3
		cmp	#3
		if (equal) {
			ldx	x1a_temp
			lda	x[pattern_table]
			ldx	x1a_and_3
			and	x[ora_mask_a]
			sta	or_value
			lda	y[@screen_address]
			and	x[and_pattern_a]
			ora	or_value
			sta	y[@screen_address]
			jmp	fill_back
		}

		clc
		adc	x1a_and_3
		sta	ltemp
		ldx	x1a_temp
		lda	x[pattern_table]
		ldx	ltemp
		and	x[ora_mask_c-2]
		sta	or_value

		lda	y[@screen_address]
		and	x[and_pattern_c-2]
		ora	or_value
		sta	y[@screen_address]
		jmp	fill_back
	}

;****************************************
;	leading edge
;****************************************

	ldx	x1a_temp
	inc	x1a_temp
	lda	x[pattern_table]			; draw leading edge
	ldx	x1a_and_3
	and	x[ora_mask_a]
	sta	or_value

	lda	y[@screen_address]
	and	x[and_pattern_a]
	ora	or_value
	sta	y[@screen_address]

	clc					; clear only once

	dec	x_index				; draw solid interior
	dec	x_index
	if (plus) {
		do {
			tya				; move to next byte
			adc	#8
			tay
			if (carry) {
				inc	screen_address+1
				clc
			}

			lda	x1a_temp
			inc	x1a_temp
			and	horiz_and_mask
			tax

			lda	x[pattern_table]
			sta	y[@screen_address]

			dec	x_index
		} while (plus)
	}
	
	tya					; next byte over
	adc	#8
	tay
	if (carry) {
		inc	screen_address+1
	}

trail:

	lda	x1a_temp			; draw trailing edge
	and	horiz_and_mask
	tax
	lda	x[pattern_table]
	ldx	x1b_and_3
	and	x[ora_mask_b]
	sta	or_value

	lda	y[@screen_address]
	and	x[and_pattern_b]
	ora	or_value
	sta	y[@screen_address]


;****************************************
;	draw into color/text ram
;****************************************
fill_back::
	lda	background_render			; don't reset colors!
	cmp	#2
	beq	fexit

	lda	color_control				; only if high bit set
	if (minus) {
		lda	y1
		lsr	a
		lsr	a
		lsr	a
		tax
		lda	x[text_lo]
		sta	self_mod1+1
		lda	x[text_hi]
		ora	#?text_ram_1
		sta	self_mod1+2

		ldy	x1a_div_4			; horizontal start pos
		ldx	fill_wid			; # of bytes
		lda	color_control			; text_ram color
		asl	a
		and	#0xf0
		do {
self_mod1:		sta	y[0xffff]
			iny
			dex
		} while (plus)
	}
fexit:
	rts


;****************************************
;	plot tables
;****************************************

and_pattern_b:
	byte	0q0333,0q0033,0q0003		; trailing edge
and_pattern_a:
	byte	0q0000,0q3000,0q3300,0q3330	; leading edge
and_pattern_c:
	byte	0q3033,0q3003,0q3303		; special case

ora_mask_b:
	byte	0q3000,0q3300,0q3330		; trailing edges
ora_mask_a:
	byte	0q3333,0q0333,0q0033,0q0003	; leading edges
ora_mask_c:
	byte	0q0300,0q0330,0q0030		; special case


text_hi:					; 16 bytes each!
	variable text_addr = colormap_offset	; start of bitmap color_ram

	repeat	screen_height/8 {
		byte ?text_addr
		text_addr = text_addr + 40
	}
text_lo:
	text_addr = colormap_offset

	repeat	screen_height/8 {
		byte /text_addr
		text_addr = text_addr + 40
	}

fill_wid::		block	1
