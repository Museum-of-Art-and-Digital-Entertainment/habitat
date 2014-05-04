; 	do_a_gesture

	include	"action_head.i"

	actionStart

	lda	select_value
	cmp	#gesture_key_1
	if (equal) {
	    ldy	#AV_ACT_wave
	}
	cmp	#gesture_key_2
	if (equal) {
	    ldy	#AV_ACT_point
	}
	cmp	#gesture_key_3
	if (equal) {
	    ldy	#AV_ACT_gimme
	}
	cmp	#gesture_key_4
	if (equal) {
	    ldy	#AV_ACT_jump
	}
	cmp	#gesture_key_5
	if (equal) {
	    ldy	#AV_ACT_stand_front
	}
	cmp	#gesture_key_6
	if (equal) {
	    ldy	#AV_ACT_stand_back
	}
	cmp	#gesture_key_7
	if (equal) {
	    ldy	#AV_ACT_bend_over
	}
	cmp	#gesture_key_8
	if (equal) {
	    ldy	#AV_ACT_bend_back
	}
	cmp	#gesture_key_9
	if (equal) {
	    ldy	#AV_ACT_punch
	}
	cmp	#gesture_key_0
	if (equal) {
	    ldy	#AV_ACT_frown
	}
	sty	arguments
	tya
	jsr		v_set_actor_chore		; do it
	sendMsg		actor_noid, MSG_POSTURE, 1	; send it!
	rts

	actionEnd	
