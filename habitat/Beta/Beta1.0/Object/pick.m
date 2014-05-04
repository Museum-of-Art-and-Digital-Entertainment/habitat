;****************************************
;	display pick menu
;****************************************
	include "../Bin/class_equates.m"

lowest_to_display::	byte	0
highest_to_display::	byte	0

pick::

	moveb	display_page,display_window
	lda	screen
	if (equal) {
		fill	bitmap_screen_1, (0x1400), 0xff		;clear scrn1
	} else {
		fill	bitmap_screen_2, (0x1400), 0xff		;clear scrn2
	}


display_contents_screen::

	clearb	cel_dx					; always face rght 6.4

	ldx	display_contents_noid
	jsr	get_object_address
	jsr	get_class_address

	ldx	highest_to_display
	stx	object_count
	if (plus) {
		do {
			ldx	display_contents_noid
			jsr	get_object_address

			lda	object_count
			clc
			adc	#OBJECT_contents
			tay
			lda	y[@object_address]	; contained obj num
			if (!equal) {
				sta	drawing_which_object
				tax
				jsr	get_object_address

				ldy	#OBJECT_class_pointer	; don't displa
				lda	y[@object_address]	; avatars!
				cmp	#1
				beq	next_cont

				lda	object_count
				tax
				and	#3
				tay
				lda	y[cont_x_pos]
				cpx	#16
				if (carry) {
					adc	#3
				}
				sta	cel_x_origin

				lda	object_count
				lsr	a
				lsr	a
				tay
				lda	y[cont_y_pos]
				sta	cel_y_origin

				moveb	#1,stand_alone
				jsr	draw_any_object
			}
next_cont:
			dec	object_count
			ldx	object_count
			cpx	lowest_to_display
		} while (!equal)
	}
	rts



cont_x_pos:	byte	4, 13, 22, 31

cont_y_pos:	byte	58, 85, 110, 34
		byte	72, 96, 123, 46


display_contents_noid::	byte	0
