;****************************************
;	Draw shape mixing cels and primitives
;****************************************

	include "../Bin/class_equates.m"


;	save temp_vars 1-5 for subroutines!

define	color_which_cels	= temp_var_6
define	current_state		= temp_var_6+1	; current frame of object
define	cels_to_draw		= temp_var_7	; bits set indicate cels
define	prop_cel_index		= temp_var_7+1	; index to cel_addresses
define	color_this_cel		= temp_var_8
define	animation_type		= temp_var_8+1


draw_prop::

;;	lda	#0				; containers that move cntents
;;	sta	last_cel_x_rel
;;	sta	last_cel_y_rel

	ldy	#3				; image has contents?
	lda	y[@prop_address]
	sta	container_type
	if (minus) {				; minus means draw
		lda	cel_dx			; contents first!
		if (!equal) {
			inc	cel_x_origin
			inc	cel_x_origin
		}

		lda	d_wild
		pha
		moveb	#1,stand_alone
		jsr	draw_contents
		pla
		sta	d_wild

		lda	cel_dx
		if (!equal) {
			dec	cel_x_origin
			dec	cel_x_origin
		}
	}

	jsr	pick_pattern			; only called once per object

	ldy	#0				; init
	sty	cel_x_rel
	sty	cel_y_rel

	iny
;;	ldy	#1
	lda	y[@prop_address]		; and bits showing which cels
	sta	color_which_cels		; to paint with color

	ldy	#OBJECT_animation_frame		; get current graphic frame
	lda	y[@object_address]
	tax
	and	#cycle_mask
	sta	animation_type
	txa
	and	#state_mask			; mask off control bits
	sta	current_state			; current frame of animation
	clc
	adc	#Header_total			; skip header info
	tay

	lda	y[@prop_address]		; get bits for cels to draw
	sta	cels_to_draw			; in THIS frame!



	lda	display_contents_noid		; if displaying region
	if (zero) {
		lda	test_pointed_at		; don't animate if pointing!
		bne	frozen

		lda	background_render	; and object is in background
		bne	frozen			; don't animate it!
	}


	lda	current_state			; Now update to next frame
	ldy	#OBJECT_animation_end
	ldx	animation_type

	if (minus) {		; cycle animation from start-end-start...
		inc	current_state
		cmp	y[@object_address]
		if (equal) {
			ldy	#OBJECT_animation_start
			lda	y[@object_address]
			sta	current_state		; then restart!
		}

	} else {	; cycle animation from start-end-stop at end
		cmp	y[@object_address]
		if (!equal) {	
			inc	current_state
		}
	}

	ldy	#OBJECT_animation_frame		; update to next frame
	lda	animation_type
	ora	current_state
	sta	y[@object_address]

frozen:
	ldy	#0				; find how far till cel addr's
	lda	y[@prop_address]		; add # of animation bytes
	and	#state_mask			; mask off animation type
	clc
	adc	#Header_total + 1
	sta	prop_cel_index			; save index to 1st cel offset

;****************************************
;	draw all of the cels in the object
;****************************************
	moveb	#1,cel_number			; start at 1st cel
	do {
		asl	cels_to_draw		; which cels do we draw?
		if (carry) {
			jsr	draw_this_cel
		}
		asl	color_which_cels	; high bit is color flag!

		inc	cel_number		; used by pointer.m
		inc	prop_cel_index		; inc for next cel!
		inc	prop_cel_index

		lda	cels_to_draw	
	} until (equal)


	lda	container_type
	if (!equal) {
		if (plus) {
			cmp	#0x01		; KLUDGE for solid pointer
			beq	dexit
			moveb	#1,stand_alone
			jmp	draw_contents
		}
	}
dexit:	rts


draw_this_cel:
	ldy	prop_cel_index
	jsr	get_cel_xy 

	lda	stand_alone			; ie. if not in hand!
	if (!equal) {				; 1st cel DRAWN! flattens base
		jsr	even_bottoms
		clearb	stand_alone
	}

	ldy	#0
	lda	background_render		; only do once
	if (!equal) {
	    bit	d_wild				; color in this shape?
	    if (minus) {
		bit	color_which_cels	; which cels have color?
		if (minus) {
			iny
		}
	    }
	}
	sty	color_this_cel

	ldy	#0					; get 1st byte of cel
	lda	y[@cel_address]
	and	#0b11110000				; cel_mask
	if (equal) {					; cel?

		jsr	paint				; draw the cel!

		lda	color_this_cel
		beq	dexit
		lda	#pat_wild			; if cel has color
		ldy	#1				; translate to box
		jmp	translate			; just change colr_ram
	}


	and	#cel_mask
	cmp	#cel_box			; box?
	if (equal) {
		ldy	#6
		lda	y[@cel_address]		; get pattern
		ldy	#0			; draw box, change color_ram
		jmp	translate
	}


;****************************************
;	draw a shape like a cel
;****************************************
draw_primitive:

	ldy	#10
	do {
		cpy	#4			; don't clobber x,y_rel
		beq	ny
		cpy	#5
		beq	ny
		lda	y[@cel_address]		; copy cel data into zpage
		sta	y[image_control]
ny:		dey
	} while (plus)


	ldy	#OBJECT_class_pointer		; Variable trap object!
	lda	y[@object_address]
	cmp	#class_super_trapezoid
	beq	set_trap_vals
	cmp	#class_trapezoid
	if (equal) {
set_trap_vals:	ldy	#TRAP_parameters	; location of data!
		ldx	#3
		do {
			lda	y[@object_address]
			sta	y[x1a-TRAP_parameters]
			iny
			dex
		} while (plus)
		lda	y[@object_address]
		sta	cel_height		; high bit set for border!
		and	#0x7f
		sta	cel_y_offset
	}


	ldy	#0
	lda	color_this_cel
	if (!equal) {
		ldy	d_wild
		bit	light_level		; nighttime??
		if (minus) {
			ldy	#0x80		; black!
		}
	}
	sty	color_control

	lda	cel_y
	clc
	sbc	cel_y_offset
	sta	cel_y
	sta	y1

	lda	cel_height		; high bit for border!
	cmp	#0x80			; except back walls!
	if (!equal) {
		and	#0x7f
	}
	clc
	adc	y1
	sta	y2
	inc	y1

	lda	cel_dx
	if (equal) {
		lda	cel_x
		clc
		adc	cel_x_offset
		asl	a
		asl	a
		tax				; add this value

		ldy	#3			; to all locations
		do {				; x1a,x1b,x2a,x2b
			txa
			clc
			adc	y[x1a]
			sta	y[x1a]
			dey
		} while (plus)

	} else {
		lda	cel_x
		sec
		sbc	cel_x_offset
		clc
		adc	#1
		asl	a
		asl	a
		sec
		sbc	#1
		tax

		sec
		sbc	x1a
		tay

		txa
		sec
		sbc	x1b
		sta	x1a
		sty	x1b

		txa
		sec
		sbc	x2a
		tay

		txa
		sec
		sbc	x2b
		sta	x2a
		sty	x2b
	}

;****************************************
;	draw shape
;****************************************
	lda	test_pointed_at			; do cursor test!
	if (!equal) {
		jmp	boundary_check		; don't draw for test!
	}

	lda	image_control			; trap,circle,box, or text?
	and	#cel_mask
	cmp	#cel_box
	if (equal) {
		jmp	box
	}
	cmp	#cel_trap
	if (equal) {
		jmp	trap
	}
	lda	image_control
	and	#0xf0
	cmp	#cel_text
	if (equal) {
		jmp	text
	}
	rts


;****************************************
;	translate cel coords into boxes
;****************************************
translate:
	sta	shape_pattern
	sty	change_color_ram

	ldy	#5
	do {
		lda	y[@cel_address]
		sta	y[image_control]
		dey
	} while (plus)

	lda	image_control			; shape is cel if high
	and	#0b11110000			; nibble is empty!
	if (equal) {
		lda	image_control
		and	#cel_wid_mask		; mask to get just width
		ora	#cel_box
		sta	image_control
	}

	lda	image_control
	and	#cel_wid_mask
	asl	a				; convert bytes to pixels
	asl	a
	sec
	sbc	#1
	sta	x1b
	sta	x2b

	lda	#0
	sta	x1a
	sta	x2a

	movew	#image_control,cel_address
	jmp	draw_primitive


;****************************************
;	even bottoms of first cel
;****************************************
even_bottoms:

	ldy	#1			; cel height
	lda	y[@cel_address]
	cmp	#0x80
	if (!equal) {
		and	#0x7f
	}
	sta	y_temp

	iny				; cel_x_offset
	lda	cel_x
	sec
	sbc	y[@cel_address]
	sta	cel_x
	sta	cel_x_origin		; save cel x,y origin

	iny				; add y_offset to cel_y
	lda	cel_y
	clc
	adc	y[@cel_address]
	sec
	sbc	y_temp
	sta	cel_y
	sta	cel_y_origin

;;	clearb	cel_x_rel		; needed?
;;	sta	cel_y_rel
	rts

;****************************************
;	get X/Y cel coords
;****************************************
get_cel_xy::
	lda	y[@prop_address]		; get index to cel_address
	clc
	adc	prop_address
	sta	cel_address
	iny
	lda	y[@prop_address]		; until end of list (0xff)
	adc	prop_address+1
	sta	cel_address+1

	moveb	cel_x_origin,cel_x
	moveb	cel_y_origin,cel_y
	jsr	find_cel_xy
	stx	cel_x_origin
	sty	cel_y_origin

	ldy	#4
	lda	y[@cel_address]			; x relocation for next cel
	sta	cel_x_rel
	iny
	lda	y[@cel_address]			; y relocation
	sta	cel_y_rel
	rts


;****************************************
;	draw container contents
;****************************************
draw_contents:
	jsr	get_class_address

	ldy	#CLASS_capacity
	lda	y[@class_address]
	if (!equal) {
	    tax					; save capacity
	    dex
	    stx	contents_counter

	    moveb	cel_dx,temp_cel_dx		; save containers face

	    do {
		lda	contents_counter
		clc
		adc	#OBJECT_contents
		tay
		lda	y[@object_address]	; object contained?
		if (!equal) {
			sta	contained_object

			ldy	#OBJECT_class_pointer	; Variable trap object
			lda	y[@object_address]
			cmp	#class_glue
			if (equal) {
			    lda	contents_counter
			    asl	a
			    clc
			    adc	#OBJECT_contents+9	; location of x/y data
			    tay
			    movew	object_address,prop_address

			} else {
			    lda	contents_counter
			    asl	a
			    clc
			    ldy	#3		; contents_xy table
			    adc	y[@prop_address]
			    and	#0x7f		; mask off high bit
			    tay			; draw before/after
			}

			lda	cel_x_origin
			ldx	temp_cel_dx	; facing?
			if (equal) {
				clc
				adc	y[@prop_address]
;;				adc	last_cel_x_rel
			} else {
				sec
				sbc	y[@prop_address]
;;				sbc	last_cel_x_rel
			}
			sta	cel_x

			iny
			lda	y[@prop_address]
			clc
			adc	cel_y_origin
;;			adc	last_cel_y_rel
			sta	cel_y

			jsr	draw_contained_object
			moveb	#1,stand_alone
		}
		dec	contents_counter
	    } while (plus)
	}
	rts


;****************************************
;	find x,y position of cel
;	rel's only change next cel but
;	rel on cel #1 changes origin of
;	all cels!
;****************************************
find_cel_xy::

	lda	cel_x_rel			; check for cel relocation
	if (zero) {
		ldy	cel_y_rel
	}
	if (zero) {				; if no relocation, then use
		ldx	cel_x_origin		; absolute coordinates
		ldy	cel_y_origin

	} else {				; otherwise...
		clc
		ldx	cel_dx			; relative coordinates
		if (!equal) {
			eor	#0xFF
			sec			; (check for l-r reversal)
		}
		adc	cel_x
		tax
		sec
		lda	cel_y
		sbc	cel_y_rel
		tay
	}
	stx	cel_x				; set x,y coordinates
	sty	cel_y
	rts


;****************************************
;	draw everything contained by object
;****************************************
draw_contained_object_and_clear::
	clearb	stand_alone

draw_contained_object::
	lda	drawing_which_object		; save container!
	pha
	lda	cel_x_origin
	pha
	lda	cel_y_origin
	pha
	lda	cel_number
	pha

	ldx	contained_object
	stx	drawing_which_object
	jsr	get_object_address

	ldy	#OBJECT_orientation		; give object containers
	lda	y[@object_address]		; orientation
	and	#~cel_dx_mask
	ora	cel_dx
	sta	y[@object_address]

mif (!develop) {
	moveb	cel_x,cel_x_origin
	moveb	cel_y,cel_y_origin
} melse {
	lda	cel_dx				; object facing
	if (equal) {
		lda	cel_x			; adjust hand/container pos!
		clc
		adc	object_x_offset
	} else {
		lda	cel_x
		sec
		sbc	object_x_offset
	}
	sta	cel_x_origin

	lda	cel_y
	clc
	adc	object_y_offset
	sta	cel_y_origin
}
	jsr	draw_any_object


	pla
	sta	cel_number
	pla
	sta	cel_y_origin
	pla
	sta	cel_x_origin

	pla
	tax
	tay
	stx	drawing_which_object
	jsr	get_object_address
	jmp	get_image_address



;****************************************
;	variables
;****************************************
stand_alone::		block	1
change_color_ram::	block	1
color_control::		block	1

temp_cel_dx:		block	1
contents_counter:	block	1
container_type::	block	1		; minus means drw contents 1st

