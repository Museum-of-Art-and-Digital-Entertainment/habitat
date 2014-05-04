; 	avatar_gesture.m 
; 	an attempt to put these problems to bed for good.
; 	FRF

; 	in arguments = gesture requested.

	getProp	actor,OBJECT_wait_state
	if (zero) {
	    lda	argmuents
	    jsr	v_set_actor_chore
	    sendMsgN	actor,MSG_POSTURE,1
	    movew	#text_line, source
	}
	rts
