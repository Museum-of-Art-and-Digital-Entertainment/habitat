;****************************************
;	init animation for objects
;
;	passed 'X' which is object #
;	passed 'A' which is graphic state

	include "../Bin/class_equates.m";
;****************************************
init_state_animation::

	sta	temp_gr_state			; save new state
	stx	temp_object
	jsr	get_object_address

	ldy	#OBJECT_class_pointer
	lda	y[@object_address]
	cmp	#class_avatar
	if (equal) {

		lda	#0
		jsr	find_talker_number	; returns offset in y
		lda	hold_noid
		sta	y[talker_color_table]

		ldy	#OBJECT_x_position		; set distination
		lda	y[@object_address]		; so av doesn't walk
		and	#0b11111100
		sta	y[@object_address]
		ldy	#AVATAR_destination_x
		sta	y[@object_address]
		ldy	#OBJECT_y_position
		lda	y[@object_address]
		ldy	#AVATAR_destination_y
		sta	y[@object_address]

		ldy	#OBJECT_animation_start		; init head facing
		moveb	#0xff,y[@object_address]

		lda	me_noid
		cmp	temp_object
		if (equal) {
			ldx	#0xff
			ldy	#OBJECT_contained_by	; 0 if not sitting
			lda	y[@object_address]
			if (zero) {
				inx
			}
			stx	Im_sitting
		}

		ldy	#AVATAR_background_activity	; get last command
		lda	y[@object_address]		; given to HOST
		tax
		lda	#0				; don't trip over
		sta	y[@object_address]		; old value
		txa
		if (zero) {
		    lda	#AV_ACT_stand			; if zero, then stand
		}

		cmp	#av_act_face_left		; turn face left/right
		if (carry) {				; into stand left/rght
		    sbc	#3
		}
		jmp	inner_set_chore
	}


;****************************************
;	init animation for other objects
;****************************************
	ldy	#OBJECT_animation_state		; save state of object
	lda	temp_gr_state
	sta	y[@object_address]

	ldy	temp_object			; set states for objects
	jsr	get_image_address
	jsr	get_states

	ldy	#OBJECT_animation_start
	sta	y[@object_address]
	txa
	ldy	#OBJECT_animation_frame
	sta	y[@object_address]
	lda	end_holder
	ldy	#OBJECT_animation_end
	sta	y[@object_address]


	ldy	#OBJECT_contained_by
	lda	y[@object_address]
	if (equal) {
		ldy	#OBJECT_y_position
		lda	y[@object_address]	; if high bit clear, backgrnd
		if (plus) {
			moveb	#2, background_render
;			lda	temp_object
;			sta	change_background_object
		}
	}
animexit:
	rts

;****************************************
;	get state/start/end values
;****************************************
get_states::
	ldy	#2				; get index to start_end table
	lda	y[@prop_address]
	if (equal) {				; object has no_animation?
		tax				; set all values to zero
		clearb	end_holder
	} else {

		lda	temp_gr_state		; state for object
		asl	a
		adc	y[@prop_address]
		tay				; point to start_end contents

		lda	y[@prop_address]	; get state
		tax				; X = state
		iny
		lda	y[@prop_address]	; get end
		sta	end_holder

		txa
;;		and	#~cycle_mask		; mask animation type
		and	#0b01111111		; get start!
	}
	rts


temp_gr_state::	block	1
temp_object:	block	1
end_holder::	block	1
