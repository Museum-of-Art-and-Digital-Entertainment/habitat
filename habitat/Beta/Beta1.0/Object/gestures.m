special_limitations::			; protection against CR and Fnkeys
					; carry= fail
	lda	have_been_ported
	bne	limits_fail
special_limitations2::
	lda	command_selected
	if (minus) {
		lda	throttle_running
		ora	flashing
		ora	cursor_lock
		ora	in_face_cursor
		if (plus) {
			lda	display_contents_noid
			ora	detach_from_stick
			if (zero) {
			    lda	text_mode_command
			    if (zero) {
				lda	sprites_enabled
				cmp	#0xff
				if (equal) {
				    clc
				    rts
				}
			    }
			}
		}
	}
limits_fail:
	sec
	rts

que_gesture::
	pha
	jsr	special_limitations		; prevent
	pla
	if (carry) {jmp	beep}
	sta	arguments
	ldy	#18				; 18 = do_gesture behaviour
	sty	select_value
	cmp	#gesture_key_1			; is a f-key or gesture?
	if (minus) {
	    sec
	    sbc	#(function_key_1-9)		; 9 = offset into region
	    sta select_value
	    sta	arguments
	}
	lda	select_value
	sta	command_selected
	lda	arguments
	sta	select_value
	jmp	start_cursor_flashing
	rts

change_facing::
	sta	arguments			; for message to host
	ldx	me_noid
	jsr	get_object_address
 	lda	arguments			; for message to host
	jsr	inner_set_chore
	lda	#1
	ldx	who_am_I
	ldy	#MESSAGE_posture
	jsr	send_arguments			; tell ever body else.
	movew	#text_line,source		; recover for behaves
	lda	arguments
	rts
