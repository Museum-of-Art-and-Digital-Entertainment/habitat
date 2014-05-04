;
;	spray_can_do.m
;
;	Action code for the spray can 'do' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-August-1986
;
;
	include	"action_head.i"

;This is the parameter to the SPRAY request
define SPRAY_LIMB = 0
; And these are the parameters it returns
define SPRAY_SUCCESS = 0
define SPRAY_CUSTOMIZE_0 = 1
define SPRAY_CUSTOMIZE_1 = 2

	actionStart

	lda	in_hand_noid		; Are we holding the spray can?
	cmp	pointed_noid
	if (equal) {			; Yes, change ourselves
		sound	SPRAY
		lda pointed_at_limb	; What body part are we indicating?
		putArg SPRAY_LIMB
		sendMsg pointed_noid, MSG_SPRAY, 1
		getResponse SPRAY_SUCCESS
		if (!zero) {
			getResponse SPRAY_CUSTOMIZE_0
			putProp actor, AVATAR_customize
			getResponse SPRAY_CUSTOMIZE_1
			putProp actor, AVATAR_customize+1
			rts
		}
	}
	chainTo v_beep

	actionEnd
