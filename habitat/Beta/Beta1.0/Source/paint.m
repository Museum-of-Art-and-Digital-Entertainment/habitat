;------------------------------------------
;
;	cartoon cel painter
;	paint one cel!
;
;------------------------------------------

	include "../Bin/class_equates.m"

	define	screen_index		= temp_var_1
	define	screen_index_hold	= temp_var_1+1
	define	pattern			= temp_var_2
	define	run_length		= temp_var_2+1
	define	horz_run_index		= temp_var_3
	define	vert_run_index		= temp_var_3+1
	define	screen_x_temp		= temp_var_4
	define	screen_y_temp		= temp_var_4+1
	define	start_address		= temp_var_5

	define	top_clip		= pnt_tmp
	define	top_clip_hold		= pnt_tmp+1
	define	mask_b			= cartoon_buffer+0
	define	blues			= cartoon_buffer+1
	define	ora_t			= cartoon_buffer+2
	define	horiz_hold		= cartoon_buffer+3
	define	patterns		= cartoon_buffer+4	; 8 bytes long
;;	define	swap_pat		= cartoon_buffer+12

paint::
	jsr	paint_1				; calculate cel scrn location
	bcs	pexit				; cel not on screen

	lda	test_pointed_at			; test if cursor pointing at
	if (!equal) {				; this cel
		jmp	boundary_check		; uses screen_x,x_limit...
	}
	jmp	paint_2



paint_1::
	ldy	#3				; get cel data
	do {
		lda	y[@cel_address]
		sta	y[cel_width]
		dey
	} while (plus)
	and	#0x0f				; jump out w/ bad data
	beq	pout
	sta	horz_run_index

	lda	cel_height			; out if bad data
	and	#0x7f
	beq	pout
	sta	cel_height


	lda	cel_x_offset
	ldy	cel_dx				; check for x reversal
	if (!equal) {
		lda	#1
		sec
		sbc	cel_x_offset
		sec
		sbc	horz_run_index
	}
	clc
	adc	cel_x
	sta	screen_x			; screen x start
	sta	screen_x_temp
	clc
	adc	horz_run_index
	sta	screen_x_limit			; screen x end for pointer
	beq	pout
	bmi	pout
	cmp	#screen_width
	if (carry) {
		lda	#screen_width		; horizontal clipping
		sta	screen_x_limit
		sbc	screen_x
		beq	pout
		bcc	pout
		sta	horz_run_index		; new object width
	}


	lda	cel_y
	sec
	sbc	cel_y_offset
	sta	screen_y
	clc
	adc	cel_height
	sta	screen_y_temp
	if (minus) {
		bit	screen_y
		bmi	pout
		lda	#screen_height
	}
	sta	screen_y_limit			; screen y end

	lda	screen_y			; check for off top
	if (minus) {
		clearb	screen_y
	}
	clc
	rts

pout:	sec
pexit:	rts

;****************************************
;	actually draw the cel
;****************************************
paint_2::
	ldy	cel_dx				; changes for run_length
	if (!equal) {
		lda	screen_x_temp
		clc
		adc	horz_run_index
		sbc	#0x00
		sta	screen_x_temp

		lda	screen_x
		if (minus) {
			clc
			adc	horz_run_index
			sta	horz_run_index
			dec	screen_x_temp
		}
	} else {
		lda	screen_x_temp
		if (minus) {
			clearb	screen_x_temp
		}
	}


	dec	screen_y_temp
	lda	screen_y_temp
	and	#0x07				; hmmmm....
	sta	screen_index			; scan line index
	sta	screen_index_hold

	lda	screen_y_temp			; point into scrn addr tables
	and	#0x7f
	lsr	a
	lsr	a
	lsr	a
	tay					; save for top_clip

	lda	screen_y_temp
	and	#0x18
	tax

	lda	screen_x_temp
	asl	a				; divide screen_x by 8
	asl	a
	asl	a
	clc
	adc	x[rowlo]
	sta	screen_address
	lda	y[rowhi]
	adc	display_window
	ldx	screen_x_temp			; if past midscreen...
	cpx	#32				; inc high address
	if (carry) {
		adc	#0
	}
	sta	screen_address+1

	lda	screen_y_temp
	if (minus) {
		tya
		ora	#0x80
		tay
		addw	screen_address,screen_address,#0x1400	; scrn height
	}
	sty	top_clip
	sty	top_clip_hold

	ldx	cel_y_origin			; use object y for pattern
	ldy	#OBJECT_class_pointer		; start
	lda	y[@object_address]
	cmp	#CLASS_avatar
	if (equal) {
		inx
	}

	ldy	#3				; 8 byte pattern table
	do {
		txa
		and	#3
		tax
		lda	x[swap_pat]
		sta	y[patterns]
		sta	y[patterns+4]
		dex
		dey
	} while (plus)


	moveb	cel_height,vert_run_index
	moveb	#6,cel_index			; set index...skip cel header

	lda	cel_dx
	and	#orient_left
	if (equal) {				; face right
		movew	#8,temp_address
		lda	#0xea	; nop
	} else {
		movew	#-8,temp_address
		lda	#0xaa	; tax
	}
	sta	nop1
	sta	nop2


	ldx	#0xff
	lda	cel_dx
	if (!equal) {
		lda	screen_x_limit		; off right side of screen?
		cmp	#40
		if (carry) {
			lda	cel_width
			sec
			sbc	horz_run_index
			if (!equal) {
				tax
				dex
				asl	a
				asl	a
				asl	a
				clc
				adc	screen_address
				sta	screen_address
				if (carry) {
					inc	screen_address+1
				}

				moveb	cel_width,horz_run_index
				moveb	#0xff,top_clip		 ; don't draw
			}
		}
	} else {

		lda	screen_x
		if (minus) {
			lda	cel_width
			sec
			sbc	screen_x_limit
			tax
			dex
			asl	a
			asl	a
			asl	a
			sta	x_temp

			lda	screen_address
			sec
			sbc	x_temp
			sta	screen_address
			if (!carry) {
				dec	screen_address+1
			}
			moveb	cel_width,horz_run_index
			moveb	#0xff,top_clip		 ; don't draw
		}
	}
	stx	horiz_hold

	movew	screen_address,start_address

;****************************************
;	draw the cel
;****************************************
paint_cel:
	ldy	cel_index			; get data from cel
	inc	cel_index			; next byte in cel
	lda	y[@cel_address]
	beq	paint_run			; is it a run?

	ldx	top_clip			; off top of screen?
	if (plus) {
		tax				; reversible test? (x/a)
		lda	x[reverse_pixels]
nop1:		tax				; self mod for no reversal

		ldy	screen_index
		lda	y[patterns]
		and	x[mask_blue]
		sta	pattern

		lda	y[@screen_address]
		and	x[bluescreen]
		ora	x[ora_table]
		ora	pattern
		sta	y[@screen_address]
	}

	lda	#1				; drop through

clear_run:
	and	#0x7f
	tax

crun:	dec	vert_run_index			; if done w/vert
	if (equal) {
		dec	horz_run_index		; then done w/horz
		beq	rexit

		lda	start_address		; start of new line!
		clc				; move one char to right
		adc	temp_address		; or left
		sta	start_address
		sta	screen_address
		lda	start_address+1
		adc	temp_address+1
		sta	start_address+1
		sta	screen_address+1

		moveb	cel_height,vert_run_index	; reset height of cel
		moveb	screen_index_hold,screen_index	; and clip values
		dec	horiz_hold
		if (minus) {
			moveb	top_clip_hold,top_clip
		}
		dex
		bne	crun
		jmp	paint_cel
	}

	dec	screen_index			; next line up
	if (minus) {
		subw	screen_address,screen_address,#320  ; every 8 lines
		moveb	#7,screen_index
		dec	top_clip
	}
	dex
	bne	crun
	jmp	paint_cel

rexit:	rts


;****************************************
;	draw a filled run
;****************************************
paint_run:
	inc	cel_index			; next byte in cel
	iny
	lda	y[@cel_address]			; get run length
	bmi	clear_run
	sta	run_length
	inc	cel_index			; one more byte in

	iny
	lda	y[@cel_address]			; get byte to run
	tax					; reversible test? (x/a)
	lda	x[reverse_pixels]
nop2:	tax					; self mod for no reversal
	moveb	x[mask_blue], mask_b
	moveb	x[bluescreen],blues
	moveb	x[ora_table], ora_t
	ldx	run_length

prun:	lda	top_clip
	if (plus) {
		ldy	screen_index
		lda	y[patterns]
		and	mask_b
		sta	pattern

		lda	y[@screen_address]
		and	blues
		ora	ora_t
		ora	pattern
		sta	y[@screen_address]
	}

	dec	vert_run_index			; if done w/vert
	if (equal) {
		dec	horz_run_index		; then done w/horz
		beq	rexit

		lda	start_address		; move one char to right
		clc				; or left
		adc	temp_address
		sta	start_address
		sta	screen_address
		lda	start_address+1
		adc	temp_address+1
		sta	start_address+1
		sta	screen_address+1

		moveb	cel_height,vert_run_index	; reset vert counter
		moveb	screen_index_hold,screen_index
		dec	horiz_hold			; lt/rt clip?
		if (minus) {
			moveb	top_clip_hold,top_clip
		}
		dex					; run till x=0
		bne	prun
		jmp	paint_cel
	}

	dec	screen_index				; next line up
	if (minus) {
		subw	screen_address,screen_address,#320
		moveb	#7,screen_index			; restart counter
		dec	top_clip
	}
	dex
	bne	prun
	jmp	paint_cel



;****************************************
;	set pattern table for cels
;
;	AVATARS....
;	legs / torsos  arms / hair
;	low  / high    low  / high
;	0      1       2      3 
;****************************************
pick_pattern::

	ldx	#4*15			; wild color
	lda	d_wild
	if (plus) {
		lsr	a		; pattern # from orientation
		tax
	}

	lda	x[cel_patterns+0]
	sta	swap_pat
	lda	x[cel_patterns+1]
	sta	swap_pat+1
	lda	x[cel_patterns+2]
	sta	swap_pat+2
	lda	x[cel_patterns+3]
	sta	swap_pat+3
	rts


cel_patterns::
	byte	0x00, 0x00, 0x00, 0x00
	byte	0xaa, 0xaa, 0xaa, 0xaa
	byte	0xff, 0xff, 0xff, 0xff
	byte	0xe2, 0xe2, 0xe2, 0xe2
	byte	0x8b, 0xbe, 0x0f, 0xcc
	byte	0xee, 0x00, 0xee, 0x00
	byte	0xf0, 0xf0, 0x0f, 0x0f
	byte	0x22, 0x88, 0x22, 0x88
	byte	0x32, 0x88, 0x23, 0x88
	byte	0x00, 0x28, 0x3b, 0x0c
	byte	0x33, 0xcc, 0x33, 0xcc
	byte	0x08, 0x80, 0x0c, 0x80
	byte	0x3f, 0x3f, 0xf3, 0xf3
	byte	0xaa, 0x3f, 0xaa, 0xf3
	byte	0xaa, 0x00, 0xaa, 0x00
	byte	0x55, 0x55, 0x55, 0x55



	variable	temp_line
	variable	count_temp
rowhi::
	count_temp = bitmap_offset / screen_width
	repeat	screen_height/8 {
		temp_line= (count_temp/8*320)
		byte ?temp_line
		count_temp += 8
	}

rowlo::
	count_temp = bitmap_offset / screen_width
	repeat screen_height/4 {
		temp_line = ( count_temp/8*320) + ( count_temp & 7)
		byte /temp_line
		count_temp++
	}

