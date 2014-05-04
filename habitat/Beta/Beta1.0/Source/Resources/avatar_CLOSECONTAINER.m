;
;	avatar_CLOSECONTAINER.m
;
;	Action code for the asynchronous close-container operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters of the CLOSECONTAINER message:
define CLOSE_CONTAINER = 0
define CLOSE_FLAGS = 1

	actionStart

	chore AV_ACT_bend_over
	asyncAnimationWait

	getResponse CLOSE_CONTAINER		; What container?
	jsr v_get_subject_object

	getResponse CLOSE_FLAGS			; Grab flags...
	putPropC subject, CONTAINER_flags	; ...and set to closed

	lda #0					; was 'OPEN_BIT' (wrong)
	newImage subject_noid
	
	sound	CONTAINER_CLOSING, subject_noid
	
	chore AV_ACT_bend_back

	lda subject_noid
	chainTo v_purge_contents		; Flush its contents

	actionEnd
