;
;	spray_can_SPRAY.m
;
;	Action code for the asynchronous spray can behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-August-1986
;
;
	include	"action_head.i"

; These are the parameters for the SPRAY message
define SPRAY_SPRAYEE = 0
define SPRAY_CUSTOMIZE_0 = 1
define SPRAY_CUSTOMIZE_1 = 2

	actionStart

	sound	SPRAY, actor_noid
	getResponse SPRAY_SPRAYEE
	jsr v_get_subject_object
	getResponse SPRAY_CUSTOMIZE_0
	putProp subject, AVATAR_customize
	getResponse SPRAY_CUSTOMIZE_1
	putProp subject, AVATAR_customize+1
	rts

	actionEnd
