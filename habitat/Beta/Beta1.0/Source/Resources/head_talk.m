;
;	head_talk.m
;
;	Action code for the head 'talk' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-June-1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

	getProp pointed, OBJECT_contained_by	; Get head container
	tax
	if (!zero) {
		jsr v_get_subject_object
		ldx	subject_noid		; The body if there is one
		getProp subject, OBJECT_class_pointer
		cmp #CLASS_AVATAR			; Is head on a body?
		if (equal) {
			getProp	pointed, OBJECT_contained_by
			cmp	me_noid			; MY body???
			if (equal) {
			    moveOb subject, pointed	; Become avatar
			    lda #ACTION_TALK		; Use avatar talk.
			    chainTo v_issue_nested_command
			}
		} else {
			ldx	#0		; No, just talk to the air
		}
	}
	chainTo	v_talk

	actionEnd
