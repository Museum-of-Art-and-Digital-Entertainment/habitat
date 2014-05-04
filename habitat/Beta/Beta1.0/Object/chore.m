;-----------------------------------
;
;	Choreography
;

	define	choreography_index	= temp_var_1
	define	choreography_tables	= temp_var_2

	define	y_holder		= temp_var_3
	define	limb_state		= temp_var_3+1
	define	requested_chore		= temp_var_4
	define	limb_to_init		= temp_var_4+1
	define	avatar_orientation	= temp_var_5
	define	special_hold		= temp_var_5+1


;	temp_var_6,7,8 WERE used by animate who calls this!

	define	c0	= 0*16			; legs
	define	c1	= 1*16			; legs2
	define	c2	= 2*16			; left arm
	define	c3	= 3*16			; torso
	define	c4	= 4*16			; face
	define	c5	= 5*16			; right arm
	define	c5a	= 6*16			; right arm 2

;****************************************
;	init a choreography
;****************************************
set_chore::
	ldy	actor_object
	sty	object_address
	ldy	actor_object+1
	sty	object_address+1

inner_set_chore::
	tax					; requested chore
	ldy	#OBJECT_wait_state		; if animating, ignore new
	lda	y[@object_address]		; requests
	and	#animation_wait_bit
	bne	sexit
	txa

;****************************************
;	A new chore WILL be executed,
;	ignore animation wait bit!
;	Caller MUST set Object_address
;****************************************
force_set_chore::
	tax

mif (develop) {
	ldy	#OBJECT_wait_state		; set wait bit
	lda	y[@object_address]
	ora	#animation_wait_bit
	sta	y[@object_address]
}

	cpx	#AV_ACT_nop			; no action
	beq	sexit

	cpx	#AV_ACT_face_left
	beq	change_orient
	cpx	#AV_ACT_face_right
	if (equal) {
change_orient:	ldy	#AVATAR_background_activity	; don't change facing
		lda	y[@object_address]
		cmp	#AV_ACT_walk			; if walking
		beq	sexit
		cmp	#AV_ACT_stand_front		; if standing front
		beq	turn_to_side
		cmp	#AV_ACT_stand_back		; or back
		if (equal) {
turn_to_side:		dex				; then stand to side
			dex
			dex
			jmp	ccont
		}

		ldy	#OBJECT_orientation
		lda	y[@object_address]
		and	#0b11111110		; just change orientation
		cpx	#AV_ACT_face_left
		if (equal) {
			ora	#0b00000001
		}
		sta	y[@object_address]
sexit:		rts
	}

ccont:
	ldy	#OBJECT_orientation		; set facing/sex
	lda	y[@object_address]
	cpx	#AV_ACT_stand_left
	if (equal) {
		ora	#0b00000001
		ldx	#AV_ACT_stand
	}
	cpx	#AV_ACT_stand_right
	if (equal) {
		and	#0b11111110
		ldx	#AV_ACT_stand
	}
	sta	y[@object_address]
	txa
	ldy	#AVATAR_background_activity
	sta	y[@object_address]
	ldy	#AVATAR_action
	sta	y[@object_address]
cexit:	rts


;****************************************
;	called by animate.m
;****************************************
new_chore::
	ldy	#AVATAR_action
	lda	y[@object_address]
	beq	cexit
	sta	requested_chore
	clearb	y[@object_address]		; clear request


	ldy	avatar_head_object
	if (!zero) {
		jsr	get_image_address
		ldy	#1
		lda	y[@prop_address]
		and	#0b00100000		; no bend over?
		if (!equal) {
			lda	requested_chore
			cmp	#AV_ACT_bend_over
			if (equal) {
				lda	#AV_ACT_arm_get
			}
			cmp	#AV_ACT_bend_back
			if (equal) {
				lda	#AV_ACT_arm_back
			}
			sta	requested_chore
		}
	}



	ldy	#OBJECT_orientation
	lda	y[@object_address]
	sta	avatar_orientation

	clearb	special_hold
	ldy	#AVATAR_contents + AVATAR_HAND
	lda	y[@object_address]		; holding?
	if (!equal) {
		tay
		lda	#0
		jsr	GetImage
		stx	pnt_tmp
		sty	pnt_tmp+1
		ldy	#block_data_offset + 0	; 1st byte of object says
		lda	y[@pnt_tmp]		; how object is held
		and	#hold_mask
		sta	special_hold
	}


	ldy	drawing_which_object
	jsr	get_image_address

	ldy	#0			; get chore table addresses
	lda	prop_address
	clc
	adc	y[@prop_address]
	sta	choreography_index
	iny
	lda	prop_address+1
	adc	y[@prop_address]
	sta	choreography_index+1

	iny
	lda	prop_address
	clc
	adc	y[@prop_address]
	sta	choreography_tables
	iny
	lda	prop_address+1
	adc	y[@prop_address]
	sta	choreography_tables+1

	ldy	#AVATAR_cel_state		; turn avatar sideways
	ldx	#17
	lda	#0
	do {
		sta	y[@object_address]
		iny
		dex
	} while (plus)

	lda	requested_chore			; init choreography
	and	#0x7f
	tay
	lda	y[@choreography_index]
	sta	y_holder
	do {
		ldy	y_holder
		lda	y[@choreography_tables]
		and	#0x7f			; mask stop bit
		sta	limb_state		

		ldy	avatar_style
		bne	no_special_cases

		cmp	#c3+4			; front torso
		if (equal) {
			ldy	requested_chore
			cpy	#AV_ACT_stand_front
			beq	change_sex
			cpy	#AV_ACT_walk_front
			if (equal) {
change_sex:			ldy	avatar_orientation
				if (minus) {
					inc	limb_state
				}
			}
		}

		cmp	#c5+0
		beq	hold_out
		cmp	#c5+1			; swing side
		if (equal) {
hold_out:		ldy	special_hold
			if (!equal) {
				lda	#c5a+3		; hold out
				sta	limb_state
			}
		}

		cmp	#c5+11			; swing front
		if (equal) {
			ldy	special_hold
			if (!equal) {
				lda	#c5a+4		; hold out
				sta	limb_state
			}
		}

no_special_cases:
		lda	limb_state
		lsr	a
		lsr	a
		lsr	a
		lsr	a
		tax				; limb to init

		lda	limb_state
		and	#0x0f			; state

		cpx	#6
		if (equal) {
			dex			; from limb 6 to 5
			ora	#0x10		; from 0+ to 16+
		}
		jsr	init_avatar_chores

		ldy	y_holder
		inc	y_holder
		lda	y[@choreography_tables]	; high bit set at end of chore
	} while (plus)


;****************************************
;	deal with avatar head!
;****************************************

	lda	#0			; set facing side(0),front(1),back(3)
	ldx	requested_chore
	cpx	#AV_ACT_stand_front
	beq	set_front
	cpx	#AV_ACT_walk_front
	beq	set_front
	cpx	#AV_ACT_sit_front
	if (equal) {
set_front:
		ldy	#OBJECT_orientation	; who uses this? set_facing!
		lda	y[@object_address]
		ora	#0x02
		sta	y[@object_address]
		lda	#1
	}
	cpx	#AV_ACT_stand_back
	beq	set_back
	cpx	#AV_ACT_walk_back
	if (equal) {
set_back:
		ldy	#OBJECT_orientation	; who uses this?
		lda	y[@object_address]
		ora	#0x02
		sta	y[@object_address]
		lda	#3
	}

	ldy	#OBJECT_animation_start		; get old facing
	cmp	y[@object_address]
	if (!equal) {
		ora	#0x80			; a new facing
		sta	y[@object_address]
	}
	rts


;****************************************
;	init chore locs for limb
;	X=limb, A=state
;****************************************
init_avatar_chores:
	sta	temp_gr_state			; save new state
	stx	limb_to_init
	txa
	jsr	get_av_prop_address
	jsr	get_states			; get anim state

	pha					; set state values
	lda	#AVATAR_cel_state_start		; start
	clc
	adc	limb_to_init
	tay
	pla
	sta	y[@object_address]

	lda	#AVATAR_cel_state		; sate
	clc
	adc	limb_to_init
	tay
	txa
	sta	y[@object_address]

	lda	#AVATAR_cel_state_end		; end
	clc
	adc	limb_to_init
	tay
	lda	end_holder
	sta	y[@object_address]
	rts
