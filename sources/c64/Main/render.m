;****************************************
;	render all objects (foreground and background)
;****************************************
	include "../Bin/class_equates.m"

render::
;;	ldx	change_background_object	; redraws object x?
;;	if (!equal) {
;;		moveb	#1,background_render	; change color_ram
;;		sta	stand_alone
;;		lda	#?back_drop & 0xf0	; draw in background
;;		sta	display_window
;;
;;		jsr	draw_object_x
;;		clearb	change_background_object
;;		sta	background_render
;;	}

	lda	background_render		; draw background states
	if (!equal) {				; 1 and 2
		lda	#?back_drop & 0xf0	; draw in background
		ldx	#0xff			; pick background objects
		jsr	create_sort_table
		inc	background_render
	}

	lda	display_page			; draw foreground objects
	ldx	#0x00				; pick foreground objects

;****************************************
;	create sort tables for objects
;****************************************
create_sort_table::
	sta	display_window			; foreground or background
	stx	eor_self_mod+1			; Self Mod!
	clearb	object_list_pointer

	ldx	#255		; Region_max_capacity-1	# of objects in world!
	do {
		lda	x[object_table_hi]	; does this object exist?
		if (!equal) {
			sta	object_address+1
			lda	x[object_table_lo]
			sta	object_address

;			ldy	#OBJECT_wait_state	; don't draw till
;			lda	y[@object_address]	; object loaded from
;			and	#draw_wait_bit		; disk!
;			bne	cnext

			ldy	#OBJECT_contained_by	; object NOT contained
			lda	y[@object_address]
			if (equal) {
				ldy	#OBJECT_y_position
				lda	y[@object_address]
eor_self_mod:			eor	#0x00		; Self Mod!
				if (minus) {
					sta	x[sort_y]

					inc	object_list_pointer
					ldy	object_list_pointer
					txa
					sta	y[object_list]
				}
			}
		}
cnext:		dex
	} until (equal)

;****************************************
;	sort all of the objects
;****************************************

	lda	object_list_pointer			; if no objects,
	beq	sort_exit
	sta	object_count
	do {
		clearb	largest_object			; zero if none drawn!
		lda	#127				; get anything > 127

		ldy	object_list_pointer
		do {
			ldx	y[object_list]
			cmp	x[sort_y]		; greater?
			if (!carry) {
				stx	largest_object
				lda	x[sort_y]	; get new larger
			}
			dey
		} until (equal)

		ldx	largest_object			; all objects drawn?
		beq	sort_exit

		clearb	x[sort_y]			; don't draw again

		moveb	#1,stand_alone
		jsr	draw_object_x			; draw this object

		dec	object_count
	} until (equal)
sort_exit:

	clearb	background_render
sexit:	rts


;****************************************
;	draw object in X register
;****************************************
draw_object_x::
	stx	drawing_which_object		; save what being drawn
	jsr	get_object_address

	ldy	#OBJECT_y_position		; get y position
	lda	y[@object_address]
	and	#0x7f
	eor	#0x7f
	clc
	adc	#1
	sta	cel_y_origin

	ldy	#OBJECT_x_position		; and x position
	lda	y[@object_address]
	cmp	#208
	if (carry) {
		sec				; KLUDGE???? testing!!!
		ror	a			; keep high bit!
		sec
		ror	a
	} else {
		lsr	a			; convert 0-255 to 0-63
		lsr	a
	}
	sta	cel_x_origin

	ldy	#OBJECT_orientation		; set up orientation
	lda	y[@object_address]		; for any object
	and	#cel_dx_mask
	sta	cel_dx


draw_any_object::
	ldy	#OBJECT_orientation		; set up orientation
	lda	y[@object_address]		; for any object
	and	#color_mask
	sta	d_wild				; color_ram change and w/color

	ldy	drawing_which_object
	jsr	get_image_address		; pass 'Y' reg


	ldy	#OBJECT_class_pointer		; avatar? or regular object
	lda	y[@object_address]
	cmp	#class_avatar
	if (equal) {

;		lda	sync_arrival
;		if (!zero) {
			ldy	#OBJECT_animation_state
			lda	y[@object_address]
			and	#avatar_on_hold
			bne	sexit		; waiting for sync
;		}


mif (develop) {
		lda	test_pointed_at
		if (equal) {
			jsr	getdrop		; attach to RENO routines
		}

		ldx	#0			; display animation wait bit
		ldy	#OBJECT_wait_state
		lda	y[@actor_object]
		and	#animation_wait_bit
		if (!equal) {
			ldx	#color_purple	; purple border if set
		}
		bank_io_in
		stx	0xd020
		bank_io_out
}

		jsr	display_avatar
		jsr	walk_to_cursor
		jmp	throw			; nuke's object_address
	}

mif (develop) {
	jsr	display_surface_type
	jsr	set_zone_image_state		; display diff surfaces
}
	jmp	draw_prop


