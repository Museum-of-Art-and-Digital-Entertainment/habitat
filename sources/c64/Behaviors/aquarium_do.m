;
;	aquarium_do.m
;
;	Action code for the aquarium 'do' behavior.
;
;	This file should be assembled as position independent code.
;
;	Interpretation of 'do' when pointing at an aquarium is to feed the
;	 fish.  This, of course, requires that you be holding the fish food,
;	 and that the fish be swimming around.  If you are not holding the
;	 fish food, it's an ordinary 'depends' operation.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

	getProp	pointed, OBJECT_class_pointer
	cmp CLASS_FISH_FOOD
	if (equal) {
		getProp pointed, AQUARIUM_state
		cmp FISH_SWIMMING
		if (equal) {
			chore AV_ACT_hand_out
			lda FISH_FEEDING
			putProp pointed
			newImage pointed_noid
			sendMsg pointed_noid, MSG_FEED, 0
			chore AV_ACT_hand_back
			rts
		} else {
			chainTo v_beep
		}
	}
	chainTo v_depends
	actionEnd
