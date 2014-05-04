;****************************************
;	walk to cursor position
;****************************************

	include "../Bin/class_equates.m"

	define	destination_x	= temp_var_2
	define	destination_y	= temp_var_2+1
	define	avatar_x	= temp_var_3
	define	avatar_y	= temp_var_3+1

	define	temp_or		= temp_var_5
	define	walk_type	= temp_var_5+1

	define	flipped		=  temp_var_6
	define	object_x	=  temp_var_6+1

	define	try_side	= temp_var_7
	define	pass		= temp_var_7+1

	define	clamp_save	= temp_var_8

;****************************************
;	start avatar walking
;	Passed A for end choreography (0-3)
;	X,Y walkto location
;****************************************
start_walk::
	sta	walk_type			; 0-3	+ high bit for how
	movew	actor_object, object_address	; for force_set

	tya
	ora	#0x80				; always foreground
	ldy	#AVATAR_destination_y
	sta	y[@object_address]		; destination_y

	ldy	#OBJECT_animation_end		; clear at destination bit
	lda	walk_type			; high bit is walk_how
	ora	#on_my_way
	sta	y[@object_address]

	txa
	ldy	#AVATAR_destination_x		; don't change x?
	cmp	y[@object_address]		; only walk up/down?
	sta	y[@object_address]
	beq	wexit

	jsr	get_av_coords
	jmp	chore_at_end


;****************************************
;	Move the avatar around...
;****************************************
walk_to_cursor::
	ldy	#OBJECT_contained_by		; don't move if contained
	lda	y[@object_address]
	bne	wexit

	ldy	#OBJECT_animation_end
	lda	y[@object_address]		; get type of walk
	sta	walk_type
	and	#on_my_way
	beq	wexit				; if not walking, exit

	jsr	get_av_coords			; get current av location
	jsr	chore_at_end			; see if avatar at destination


;****************************************
;	move towards destination
;****************************************

	lda	walk_type
	if (minus) {
		lda	avatar_y
		cmp	destination_y
		bne	change_y
	}

	lda	avatar_x
	cmp	destination_x			; change X first if not equal
	if (!equal) {
		if (carry) {
			sbc	#4
		} else {
			adc	#4
		}
		ldy	#OBJECT_x_position	; set new X loc
		sta	y[@object_address]
		rts
	}

change_y:
	lda	avatar_y			; set new Y loc
	tax
	sec
	sbc	destination_y
	if (!equal) {
		if (carry) {
			cmp	#1		; move by 1
			if (!equal) {
				dex		; move by 2
			}
			dex
		} else {
			cmp	#-1
			if (!equal) {
				inx
			}
			inx
		}
		txa
		ldy	#OBJECT_y_position
		sta	y[@object_address]
	}
wexit:	rts


;****************************************
;	set choreography at end of walk
;****************************************
chore_at_end:
	ldy	#OBJECT_animation_state		; moonwalk?
	lda	y[@object_address]
	and	#moonwalk_bit
	sta	temp_or

	ldy	walk_type			; if walk type 0 (old)
	if (plus) {
		lda	destination_x		; and still changing x
		cmp	avatar_x
		bne	x_change
	}

	lda	#AV_ACT_walk_back
	ldy	avatar_y
	cpy	destination_y
	if (!equal) {
		if (carry) {			; not at destination
			lda	#AV_ACT_walk_front
		}
		eor	temp_or			; flip walk facings
		bne	chore_test
	}

	lda	destination_x
	cmp	avatar_x			; set carry for x_change
	if (equal) {
		lda	walk_type		; clear if at
		and	#~on_my_way		; destination
		ldy	#OBJECT_animation_end
		sta	y[@object_address]

		and	#walk_end_chore
		tay
		lda	y[chore_table]
		jmp	force_set_chore		; set end chore...get out!
	}


x_change:
	ldy	#OBJECT_orientation		; set new avatar orient
	lda	y[@object_address]
	and	#~orient_left
	if (!carry) {
		ora	#orient_left
	}
	eor	temp_or
	sta	y[@object_address]
	lda	#AV_ACT_walk			; must be side walk

chore_test:
	ldy	#AVATAR_background_activity	; if request diff than
	cmp	y[@object_address]		; current action,
	beq	wexit
	jmp	force_set_chore


chore_table:
	byte	AV_ACT_stand_left
	byte	AV_ACT_stand_right
	byte	AV_ACT_stand_back
	byte	AV_ACT_stand_front

;****************************************
;	get coordinates of the avatar
;****************************************
get_av_coords:
	ldy	#OBJECT_x_position
	lda	y[@object_address]
	and	#0b11111100			; mask off every 4 pixels
	sta	avatar_x
	iny
	lda	y[@object_address]
	sta	avatar_y

	ldy	#AVATAR_destination_x
	lda	y[@object_address]
	and	#0b11111100			; mask off every 4 pixels
	sta	destination_x
	iny
	lda	y[@object_address]
	sta	destination_y
sexit:	rts


;****************************************
;	get X/Y walkto coords for an object
;	Passed X=noid of object to walk to
;****************************************
get_object_walk_xy::

	tax
	tay
	jsr	get_object_address
	jsr	get_image_address
	clearb	pass

try_other_side:
	ldy	#OBJECT_orientation		; flipped?
	lda	y[@object_address]
	and	#1
	sta	flipped

	lda	pass				; second pass, try other side
	if (zero) {				; first pass..get side
	    ldy	#OBJECT_x_position		; which side is av on?
	    lda	y[@object_address]
	    sta	object_x			; save object x pos
	    cmp	y[@actor_object]
	    if (carry) {
		lda	#0			; goto left side
	    } else {
		lda	#1			; goto right side
	    }
	}
	and	#1
	sta	try_side
	eor	flipped
	clc
	adc	#image_walk_offset
	tay
	lda	y[@prop_address]		; get walk position
	tax
	and	#0xfc				; mask animation
	sta	x_temp
	txa
	and	#3
	eor	flipped				; flip left/right if orient..
	pha					; save end chore

	ldx	flipped
	if (!equal) {
		ldy	#OBJECT_class_pointer	; don't get 1st cel if
		lda	y[@object_address]	; avatar
		cmp	#CLASS_avatar
		if (equal) {
			lda	x_temp
			jmp	flip_xtemp
		}

		ldy	#0			; 1st byte in image
		lda	y[@prop_address]
		and	#state_mask		; up to 32 graphic frames
		clc
		adc	#header_total+1		; get ptr to 1st cel
		tay
		lda	y[@prop_address]
		tay
		iny
		iny				; get x_offset from cel
		lda	y[@prop_address]
		asl	a			; * 2
		asl	a			; pixels into bytes * 4
		asl	a
		clc
		adc	x_temp
flip_xtemp:
		eor	#0xff			; flip if mirrored
		sta	x_temp
		inc	x_temp
	}

	lda	object_x			; x position
	clc
	adc	x_temp
	tax
	ldy	#OBJECT_y_position		; y position
	lda	y[@object_address]
	and	#0x7f
	ldy	#image_walk_offset+2
	clc
	adc	y[@prop_address]
	tay
	pla					; get end chore
clamp_x:
	sta	clamp_save
	tya
	if (minus) {
	    lda	#0
	}
	cmp	region_depth
	if (gt) {
	    lda	region_depth
	}
	sta	clamp_save+1
	txa
	and	#0b11111100			; CLAMP! (frf)
	tax
	cmp	#156
	if (carry) {				; out of range
	    ldy	pass
	    if (zero) {				; 1st pass, try other side
		lda	#0b10000001
		eor	try_side
		sta	pass
		jmp	try_other_side
	    } else {
		ldx	#8
		cmp	#208			; 256 - ((256-160)/2)
		if (!carry) {
		    ldx	#156
		}
	    }
	}
	ldy	clamp_save+1
	lda	clamp_save
	rts
