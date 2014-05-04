; 	fn_key_pressed.m
; 	by F. Randall Farmer
; 	31 Aug 1987
; 
; 	do as of yet undefined system stuff (a hook for expansion)


	include	"action_head.i"

define	WHAT_KEY_PRESSED	=	0
define	WHERE_POINTING		=	1

define	FNKEY_SUCCESS		=	0

	actionStart

	moveb	me_noid,actor_noid
	sta	waitfor_noid
	jsr	v_set_up_actor_pointers
	jsr	v_update_cursor
	lda	pointed_noid
	putArg	WHERE_POINTING
	lda	select_value		; what action am I, really
	putArg	WHAT_KEY_PRESSED
	sendMsg	actor_noid, MSG_FnKey, 2
	getResponse	FNKEY_SUCCESS
	cmp	#SUCCESS_VALUE
	if (!equal) {
	    chainto	v_beep_or_boing
	}
	rts

	actionEnd
