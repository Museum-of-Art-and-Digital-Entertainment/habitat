;
;	avatar_PUT.m
;
;	Action code for the avatar asynchronous 'PUT' behavior.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"
	include	"class_equates.m"

; These are the parameters of the PUT message:
define PUT_WHAT = 0
define PUT_CONTAINER = 1
define PUT_X = 2
define PUT_Y = 3
define PUT_HOW = 4
define PUT_ORIENT = 5

define SAVE_Y = async_workspace

	actionStart

	getResponse PUT_HOW		; Get on ground or in pocket?
	if (!zero) {			; 1==>in pocket
		lda #AV_ACT_stand	; Stand up when done
		pha
		lda #AV_ACT_unpocket	; Reach for pocket now
	} else {			; 0==>on ground
		lda #AV_ACT_bend_back	; Bend back when done
		pha
		lda #AV_ACT_bend_over	; Bend over now
	}
	jsr v_set_actor_chore
	asyncAnimationWait
	getResponse PUT_WHAT
	jsr	v_get_subject_object	; What to put
	getResponse PUT_ORIENT
	ldy	#OBJECT_orientation
	sta	y[@subject_object]	; host tells us how.	
	getResponse PUT_Y
	sta	SAVE_Y
	dey
	getResponse /* PUT_X */
	tax				; X-position
	dey
	getResponse /* PUT_CONTAINER */	; New container
	ldy	SAVE_Y			; Y-position or offset
	rjsr	v_change_containers	; DROP IT!
	pla				; Chore selected above
	chainTo v_set_actor_chore

	actionEnd
