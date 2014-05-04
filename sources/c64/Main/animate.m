;****************************************
;	Draw shape mixing cels and primitives
;****************************************

	include "../Bin/class_equates.m"


;	Avatar uses
;	OBJECT_animation_state for flags from host
;	0b000000001	= invisibility
;
;	OBJECT_animation_start
;	saves avatar_head_facing... high bit set if facing changed
;
;	OBJECT_animation_end
;	stores ending choreography and walk_how


;	save temp_vars 1-5 for subroutines!

define	current_state		= temp_var_6
define	avatar_orientation	= temp_var_6+1
define	cels_to_draw		= temp_var_7	; bits set indicate cels
define	cels_to_draw2		= temp_var_7+1	; bits set indicate cels
define	prop_cel_index		= temp_var_8	; index to cel_addresses
define	animation_type		= temp_var_8+1

define	Avatar_header_bytes	= 3

display_avatar::
	ldx	#25				; move tables from images
	ldy	#19
	do {
		lda	y[@prop_address]
		sta	y[head_cel_number-19]
		iny
		dex
	} while (plus)

	ldy	#OBJECT_style_pointer		; setup type of avatar
	lda	y[@object_address]
	sta	avatar_style

	ldy	#AVATAR_contents + AVATAR_HEAD
	lda	y[@object_address]
	sta	avatar_head_object

	jsr	new_chore

	lda	#0
;;	sta	stand_alone
	sta	cel_x_rel			; no relocation for first cel
	sta	cel_y_rel
	sta	avatar_animating

	moveb	cel_x_origin,cel_x		; move origin into 1st cel
	moveb	cel_y_origin,cel_y

	ldy	#OBJECT_animation_state		; invisible?
	lda	y[@object_address]
	bmi	clear_wait

	ldy	#OBJECT_orientation
	lda	y[@object_address]
	sta	avatar_orientation
	and	#0x7f
	lsr	a
	lsr	a
	lsr	a
	sta	avatar_height

	ldy	#AVATAR_contents + AVATAR_HAND
	lda	y[@object_address]
	sta	avatar_held_object

	lda	avatar_head_object
	sta	disk_face			; zero if no head
	if (!equal) {				; if there is a head

		ldy	#OBJECT_animation_start	; new facing?
		lda	y[@object_address]
		if (minus) {
			and	#0x7f
			sta	y[@object_address]
			ldx	avatar_head_object
			jsr	init_state_animation
		}
		ldx	avatar_head_object
		jsr	get_object_address

		ldy	avatar_head_object
		jsr	get_image_address	; find out about disks
		ldy	#1
		lda	y[@prop_address]
		sta	disk_face

		ldy	#OBJECT_orientation
		lda	y[@object_address]
		and	#color_mask
		sta	head_pattern

		ldx	drawing_which_object		; restore obj addr
		jsr	get_object_address

;		REGET Prop_address???
	}


;****************************************
;	calculate address/xy for cels
;****************************************
	moveb	#0,cel_number			; loop for cels 1-6
	do {
		lda	cel_number
		jsr	get_av_prop_address

		jsr	get_limb_coords
		inc	cel_number
		lda	cel_number
		cmp	#6
	} until (equal)				; that's all folks


;****************************************
;	draw the avatar
;****************************************
	moveb	#0,cel_count			; loop for cels 1-6
	do {
		ldx	cel_count
		jsr	draw_a_limb
		inc	cel_count
		lda	cel_count
		cmp	#6
	} until (equal)				; that's all folks

clear_wait:
	lda	avatar_animating		; avatar is not animating
	and	frozen_when_stands
	if (equal) {

		ldy	#OBJECT_animation_end
		lda	y[@object_address]
		and	#on_my_way
		if (equal) {
			ldy	#OBJECT_wait_state	; clear the wait bit!
			lda	y[@object_address]
			and	#~(animation_wait_bit)
			sta	y[@object_address]
		}
	}
aexit:	rts


draw_a_limb:
	ldy	#OBJECT_animation_start		; side(0), front(1) or back(2)
	lda	y[@object_address]
	and	#0x7f

	sta	facing
	if (!equal) {
		cmp	#1
		if (equal) {
			lda	x[fv_cels]	; order of frnt view
		} else {
			lda	x[bv_cels]	; order of back view
		}
		tax
	}
	stx	cel_number

	cpx	head_cel_number			; head cel
	if (equal) {
;;		lda	x[ch_tab]		; no face cel
;;		beq	aexit

		lda	avatar_head_object	; exit if no head
		beq	aexit
		sta	contained_object

		moveb	x[cx_tab], cel_x		; use loc (head_cel_n)
		lda	x[cy_tab]
		sec
		sbc	#63
		sta	cel_y
		jsr	draw_contained_object_and_clear

		lda	facing
		if (equal) {			; sideways
test_if_face:		lda	disk_face
			and	#0x40
			beq	aexit		; no face?
		} else {
			cmp	#1		; front face?
			beq	test_if_face
			lda	disk_face	; back disk?
			bpl	aexit
		}

		jmp	paint_limb
	}

	cpx	#AVATAR_HAND
	if (equal) {
		lda	avatar_held_object	; object in hand
		if (!equal) {

			sta	contained_object
			moveb	cx_tab+5, cel_x
			moveb	cy_tab+5, cel_y
			moveb	last_cel_x_rel,cel_x_rel ; needed??? YES
			moveb	last_cel_y_rel,cel_y_rel

			jsr	find_cel_xy
			jsr	draw_contained_object_and_clear
		}
	}

paint_limb:
		ldy	cel_number			; draw limb
		lda	y[ch_tab]			; not drawn?
		if (equal) { rts }
		sta	cel_address+1
		moveb	y[cl_tab], cel_address
		moveb	y[cx_tab], cel_x
		moveb	y[cy_tab], cel_y
		jsr	get_limb_cel_pattern
		jsr	pick_pattern

		clearb	container_type		; do fine point

		jmp	paint


;****************************************
;	get the address/xy of given limb
;	and animate the cel
;****************************************
get_limb_coords:

	ldy	cel_number			; set to not draw
	clearb	y[ch_tab]

	lda	cel_number
	clc
	adc	#AVATAR_cel_state
	tay
	lda	y[@object_address]
	tax
	and	#cycle_mask
	sta	animation_type
	txa
	and	#0x7f				; mask off control bits
	sta	current_state			; current frame of animation

	adc	#Avatar_header_bytes		; skip header info
	tay
	lda	y[@prop_address]		; get bits for cels to draw


	if (minus) {				; cel not drawn!!!
		lda	#0
		tax
		beq	save_which_cels
	}

	if (equal) {					; state 0?
		ldy	avatar_style			; normal body?
		if (equal) {
			ldy	cel_number
			cpy	#3				; torso?
			if (equal) {
				ldy	avatar_orientation	; female?
				if (minus) {
					lda	#1		; next cel
				}
			}
		}
	}

	tax					; turn byte into bit patterns!
	and	#7
	tay
	cpx	#8
	if (!carry) {				; 0 to 7
		lda	y[byte_to_bit]
		ldx	#0
	} else {				; 8 to 15
		lda	#0
		ldx	y[byte_to_bit]
	}
save_which_cels:
	sta	cels_to_draw
	stx	cels_to_draw2


	lda	cel_number
	clc
	adc	#AVATAR_cel_state_end
	tay
	lda	current_state			; Now update to next frame
	ldx	animation_type

	if (minus) {		; cycle animation from start-end-start...
		inc	current_state
		cmp	y[@object_address]
		if (equal) {
			lda	cel_number		; if at end...
			clc
			adc	#AVATAR_cel_state_start
			tay
			lda	y[@object_address]
			sta	current_state		; then restart!
		}
		inc	avatar_animating

	} else {	; cycle animation from start-end-stop at end
		cmp	y[@object_address]
		if (!equal) {	
			inc	current_state
			inc	avatar_animating
		}
	}

	lda	test_pointed_at			; don't anim if point testing
	if (equal) {

		lda	cel_number		; update current graphic state
		clc
		adc	#AVATAR_cel_state
		tay
		lda	animation_type
		ora	current_state
		sta	y[@object_address]
	}

	ldy	#0				; find how far till cel addr's
	lda	y[@prop_address]		; add # of animation bytes
	and	#0x7f				; mask off animation type
	clc
	adc	#Avatar_header_bytes + 1
	sta	prop_cel_index			; save index to 1st cel offset

;****************************************
;	draw all of the cels in the object
;****************************************
	do {
		asl	cels_to_draw2
		rol	cels_to_draw		; which cels do we draw?
		if (carry) {
			jsr	get_cel_loc_addr
		}
		inc	prop_cel_index		; inc for next cel!
		inc	prop_cel_index

		lda	cels_to_draw
		ora	cels_to_draw2
	} until (equal)

	moveb	cel_x_rel,last_cel_x_rel	; last rel for held objs
	moveb	cel_y_rel,last_cel_y_rel
	rts


get_cel_loc_addr:
	ldy	prop_cel_index			; diff loc in mix
	jsr	get_cel_xy

	moveb	cel_x,cel_x_origin		; test...
	moveb	cel_y,cel_y_origin

	ldy	cel_number
	moveb	cel_address,y[cl_tab]
	moveb	cel_address+1,y[ch_tab]
	moveb	cel_x,y[cx_tab]
;;	moveb	cel_y,y[cy_tab]

	lda	cel_y				; height doesn't affect
	ldx	y[cels_affected_by_height]
	if (!equal) {
		clc
		adc	avatar_height
	}
	sta	y[cy_tab]
	rts

;****************************************
;	get limb address passed limb in A
;****************************************
get_av_prop_address::
	pha
	ldy	drawing_which_object
	jsr	get_image_address
	pla

	asl	a				; get high byte of offset
	clc
	adc	#8
	tay

	lda	y[@prop_address]		; get high
	tax
	dey
	lda	y[@prop_address]		; get low
	clc
	adc	prop_address
	sta	prop_address
	txa
	adc	prop_address+1
	sta	prop_address+1
	rts


;****************************************
;	get d_wild for limbs
;	0/legs	1/torso	2/arms	3/hair
;****************************************
get_limb_cel_pattern:
	ldy	cel_number
	lda	y[pattern_for_limb]		; limb custom pat 0-3
	sta	which_limb			; used by pointer.m

	cmp	#AVATAR_FACE_LIMB
	if (equal) {
		ldx	avatar_head_object
		if (!equal) {
			lda	head_pattern
			sta	d_wild
			rts
		}
	}

	ldy	#AVATAR_customize		; wch custom byte 0/1
	cmp	#AVATAR_ARM_LIMB		; arms and hair use
	if (carry) {				; next byte
		iny
	}
	and	#1				; low or high nibble
	if (equal) {
		lda	y[@object_address]	; get high
		and	#0xf0
		lsr	a
	} else {
		lda	y[@object_address]	; get low
		and	#0x0f
		asl	a
		asl	a
		asl	a
	}
	sta	d_wild
	rts


;****************************************
;	These tables loaded from avatar Images!!!
;****************************************

head_cel_number:
	byte	4
frozen_when_stands:
	byte	0xff

pattern_for_limb:
	byte	AVATAR_LEG_LIMB
	byte	AVATAR_LEG_LIMB
	byte	AVATAR_ARM_LIMB
	byte	AVATAR_TORSO_LIMB
	byte	AVATAR_FACE_LIMB
	byte	AVATAR_ARM_LIMB

fv_cels:					; order of cels front view
	byte	0,1,3,4,2,5
bv_cels:
	byte	5,2,4,0,1,3

cels_affected_by_height:
	byte	0,0,1,1,1,1


;****************************************
;	These are just locals
;****************************************
cel_count:		block	1		; clobbered by mix
contained_object::	block	1

avatar_held_object::	block	1		; object being held!
avatar_head_object::	block	1		; object being held!
avatar_animating:	block	1

avatar_style::		block	1
avatar_height:		block	1
disk_face:		block	1
facing:			block	1
head_pattern:		block	1
which_limb::		block	1		; used by pointer

byte_to_bit:		byte	0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01

last_cel_x_rel:		block	1		; rel position for hands
last_cel_y_rel:		block	1


