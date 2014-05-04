; 	ask_for_help.m
; 	by F. Randall Farmer
; 	19 Aug 1986
; 
; 	get some help text.


	include	"action_head.i"

define	HELP_TEXT	=	0

	actionStart

	moveb	me_noid,actor_noid
	sta	waitfor_noid
	jsr	v_set_up_actor_pointers
	jsr	v_update_cursor
	lda	pointed_noid		; pointing at diddly.
	if (zero) {
	    rts
	}
	sendMsg	pointed_noid, MSG_help, 0
	movew response_data, source
	moveb pointed_noid, actor_noid
	chainTo	v_balloonMessage

	actionEnd
