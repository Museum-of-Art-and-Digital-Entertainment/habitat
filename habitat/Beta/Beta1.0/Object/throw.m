;****************************************
;	throw to cursor position
;****************************************

	define	throw_vars	= temp_var_1

;	define	thrown_object	= temp_var_1
	define	gravity		= temp_var_1

	define	max_value	= temp_var_1+1

	define	min_x		= temp_var_2
	define	min_y		= temp_var_2+1
	define	dx		= temp_var_3
	define	dy		= temp_var_3+1

	define	tobject_x	= temp_var_4
	define	tobject_y	= temp_var_4+1

	define	destination_x	= temp_var_5
	define	destination_y	= temp_var_5+1

	define	x_direction	= temp_var_6
	define	y_direction	= temp_var_6+1

	define	vert_component	= temp_var_7
;	define	gravity		= temp_var_7+1

	define	thrown_object	= temp_var_7+1


	define	throw_store		= AVATAR_cel_4_state_table+2

throw_it_away::
mif (1) {
throw::
	rts
} melse {
	lda	desired_x
	and	#0xfc
	sta	destination_x
	lda	desired_y
	and	#0xfc
	sta	destination_y

	moveb	actor_noid, drawing_which_object
	moveb	subject_noid, thrown_object
	tax
	jsr	get_object_address

	ldy	#OBJECT_orientation
	lda	y[@actor_object]		; get avatar orient
	and	#cel_dx_mask
	sta	x_temp
	lda	y[@object_address]		; put in obj's orient
	and	#~cel_dx_mask
	ora	x_temp
	sta	y[@object_address]


	lda	#3*4
	ldx	x_temp
	if (!equal) {
		lda	#-3*4
	}
		ldy	#OBJECT_x_position		; get x,y position
	clc
	adc	y[@actor_object]		; start hand pos

	cmp	#200				; clamp for left edge
	if (carry) {
		lda	#0
	}

	and	#0xfc
	sta	tobject_x			; current x
	iny
	lda	y[@actor_object]
	clc
	adc	#43				; vert offset of throwing arm
	and	#0xfc
	sta	tobject_y


	ldx	#4
	lda	destination_x
	sec
	sbc	tobject_x
	if (!carry) {
		lda	tobject_x
		sec
		sbc	destination_x
		ldx	#-4
	}
	sta	dx
	lsr	a
	sta	min_x
	stx	x_direction

	ldx	#4
	lda	destination_y
	sec
	sbc	tobject_y
	if (!carry) {
		lda	tobject_y
		sec
		sbc	destination_y
		ldx	#-4
	}
	sta	dy
	lsr	a
	sta	min_y
	stx	y_direction

	lda	dx				; values for dda
	cmp	dy
	if (!carry) {
		lda	dy
	}
	sta	max_value


;****************************************
;	init arc code!
;****************************************

	clearb	vert_component
	lda	dx
	lsr	a
	lsr	a
	sta	gravity
	jsr	make_arc
	jsr	dest_test			; if at dest, fall out!
	jmp	store_vars

;****************************************
;	throw the damn object!
;****************************************
throw::
	jsr	restore_vars			; get vars from avatar

	ldx	thrown_object			; object being thrown?
	if (equal) { rts }
	jsr	get_object_address

	lda	min_x
	clc
	adc	dx
	sta	min_x
	cmp	max_value
	if (carry) {
		sec
		sbc	max_value
		sta	min_x

		lda	tobject_x
		clc
		adc	x_direction
		sta	tobject_x

		and	#3
		if (equal) {
			jsr	make_arc
		}
	}


	lda	min_y
	clc
	adc	dy
	sta	min_y
	cmp	max_value
	if (carry) {
		sec
		sbc	max_value
		sta	min_y

		lda	tobject_y		; change location!
		clc
		adc	y_direction
		sta	tobject_y
	}

dest_test:
	lda	destination_x
	and	#0xfc
	cmp	tobject_x			; at destination?
	if (equal) {
		lda	destination_y
		and	#0xfc
		cmp	tobject_y
		if (equal) {
			clearb	thrown_object		; end of throw!

			ldy	#OBJECT_x_position	; put loc into object
			moveb	destination_x,y[@object_address]
			iny
			moveb	destination_y,y[@object_address]
			jmp	store_vars
		}
	}


	ldy	#OBJECT_x_position			; put loc into object
	moveb	tobject_x,y[@object_address]
	iny
	lda	tobject_y
	clc
	adc	vert_component
	sta	y[@object_address]

	jmp	store_vars


;****************************************
;	create the arc effect!
;****************************************
make_arc:
	lda	gravity		; v=v-2
	sec
	sbc	#2
	sta	gravity

	if (plus) {
		lsr	a		; p=p+gravity/4
		lsr	a
	} else {
		lsr	a
		lsr	a
		ora	#0xc0
	}
	sec				; +1
	adc	vert_component
	sta	vert_component
	rts



;****************************************
;	save or get vars
;****************************************
store_vars:
	ldx	drawing_which_object		; save data from avatar
	jsr	get_object_address

	ldy	#throw_store+13
	ldx	#13
	do {
		lda	x[throw_vars]
		sta	y[@object_address]
		dey
		dex
	} while (plus)
	rts

restore_vars:
	ldx	drawing_which_object		; get data from avatar!
	jsr	get_object_address

	ldy	#throw_store+13
	ldx	#13
	do {
		lda	y[@object_address]
		sta	x[throw_vars]
		dey
		dex
	} while (plus)
	rts

}
