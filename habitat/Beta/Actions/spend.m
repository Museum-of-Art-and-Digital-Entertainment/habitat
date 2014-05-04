; a = price
; x = buyer noid
	sta	save_NRD			; Save the price
	stx	actor_noid			; Make buyer the actor
	jsr	set_up_actor_pointers
	lda	#AV_ACT_operate			; Operate the machine
	jsr	set_actor_chore
	jsr	ASYNC_animation_wait		; Wait for animation to end
	lda	#AV_ACT_hand_back		; Finish up animation
	jsr	set_actor_chore
	ldy	#TOKEN_denomination		; Get size of coin in hand
	lda	y[@in_hand_object]
	sec					; Subtract price
	sbc	save_NRD
	sta	y[@in_hand_object]		; Save new denomination
	if (zero) {				; If coin is all used up...
		lda in_hand_noid		; Nuke the sucker!
		rjsr delete_object
	}
	rts					; Fini
