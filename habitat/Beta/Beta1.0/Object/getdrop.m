;****************************************
;	Kludged trigger routines
;****************************************

	include "../Bin/class_equates.m"

	define	temp_object_address	= pnt_tmp

getdrop::
	ldx	pointed_NOID				; trig press?
	beq	texit

	lda	me_noid
	cmp	drawing_which_object			; only move 1 avatar!
	bne	texit
;;	sta	actor_noid

	jsr	get_temp_object

	ldy	#OBJECT_class_pointer
	lda	y[@temp_object_address]

	cmp	#class_avatar
	beq	hold_change

	cmp	#class_trapezoid
	beq	ttest
	cmp	#class_super_trapezoid
	if (equal) {
ttest:		ldy	#generic_object_end
		lda	y[@temp_object_address]
		cmp	#type_grnd
		bne	texit
		beq	move_to_cursor
	}

	cmp	#class_wall
	beq	texit					; wall

	cmp	#class_street
	beq	move_to_cursor

	cmp	#class_ground				; floor?
	if (equal) {
move_to_cursor:
		ldy	#OBJECT_contained_by	; don't move if contained!
		lda	y[@object_address]
		bne	texit


		lda	cursor_screen_x
		ldy	#AVATAR_destination_x
		cmp	y[@object_address]		; destination_x
		if (equal) {
			lda	#down			; face forward at end
			jmp	go_walk
		}
		lda	#left
		if (carry) {
			lda	#right
		}

go_walk:	ldx	cursor_screen_x
		ldy	cursor_screen_y
		jmp	start_walk
	}

;****************************************
;	pick-up or drop object in hand!
;****************************************
hold_change:
;	lda	#AV_ACT_bend_over
;	jsr	set_chore

	ldy	#AVATAR_contents + AVATAR_HAND

	lda	pointed_NOID				; pointing to self??
	cmp	drawing_which_object
	if (equal) {
		lda	y[@object_address]		; and holding
		bne	release_object			; then release
texit:		rts					; else just forget
	}

;****************************************
;	Grab an object
;****************************************
	sta	y[@object_address]
	tax
	jsr	get_temp_object

	ldy	#OBJECT_contained_by			; don't render if
	lda	drawing_which_object			; contained by avatar!
	sta	y[@temp_object_address]

	clearb	object_x_offset				; clear x/y offsets
	sta	object_y_offset
	rts

;****************************************
;	Release an object
;****************************************
release_object::
	tax
	jsr	get_temp_object

	ldy	#OBJECT_contained_by			; object no longer
	clearb	y[@temp_object_address]			; contained

	ldy	#AVATAR_contents + AVATAR_HAND
	clearb	y[@object_address]

;;	ldy	#OBJECT_orientation
;;	lda	y[@object_address]			; get avatar orient
;;	and	#cel_dx_mask
;;	sta	x_temp
;;	lda	y[@temp_object_address]			; put in obj's orient
;;	and	#~cel_dx_mask
;;	ora	x_temp
;;	sta	y[@temp_object_address]

	lda	x_temp					; facing
	if (equal) {
		lda	#3*4				; drop object to right
	} else {
		lda	#-3*4				; drop object to left
	}

	ldy	#OBJECT_x_position
	clc
	adc	y[@object_address]
	sta	y[@temp_object_address]

	ldy	#OBJECT_y_position
	moveb	y[@object_address],y[@temp_object_address]
	rts


get_temp_object:
	lda	x[object_table_hi]			; x holds current obj
	sta	temp_object_address+1
	lda	x[object_table_lo]
	sta	temp_object_address
	rts
