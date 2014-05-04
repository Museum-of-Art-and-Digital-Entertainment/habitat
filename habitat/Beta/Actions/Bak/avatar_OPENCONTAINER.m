;
;	avatar_OPENCONTAINER.m
;
;	Action code for the asynchronous open-container operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters of the OPENCONTAINER message:
define OPEN_CONTAINER = 0
define OPEN_CONTENTS = 1

	actionStart

	chore AV_ACT_bend_over
	asyncAnimationWait
	getResponse OPEN_CONTAINER		; What container?
	jsr v_get_subject_object

	sound	CONTAINER_OPENING, subject_noid

	lda #(OPEN_BIT | UNLOCKED_BIT)		; Set to open
	putPropC subject, CONTAINER_flags

	and #OPEN_BIT
	newImage subject_noid

	addwwb response_data, response_data, #OPEN_CONTENTS
	lda	subject_noid		; what is opening?
	rjsr v_unpack_contents_vector	; Get the contents

	chore AV_ACT_bend_back
	rts

	actionEnd
