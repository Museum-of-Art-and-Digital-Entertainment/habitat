;
;	head_do.m
;
;	Action code for the head 'do' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-June-1986
;
;	If the head is being worn, we want to punt to avatar 'do', but we
;	 have to change our notion of self first.  If not worn, punt to
;	 'depends'.
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

	getProp pointed, OBJECT_contained_by
	cmp	me_noid
	if (equal) {					; container must be me
		jsr v_get_subject_object
		getProp	subject, OBJECT_contents+AVATAR_HEAD
		cmp	pointed_noid
		if (equal) {
		    moveb  #AVATAR_FACE_LIMB, pointed_at_limb ; point to face
		    moveOb subject, pointed	; Become avatar whose this is
		    lda #ACTION_DO		; Use avatar do.
		    chainTo v_issue_nested_command
		} else {
		    chainTo	v_beep		; in hand?
		}
	}
	chainTo v_depends

	actionEnd
