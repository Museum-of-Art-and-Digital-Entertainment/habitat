;
;	vendo_do.m
;
;	Action code for the vendo flip-through-the-selections behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	19-June-1986
;
	include	"action_head.i"

	actionStart

; These are the parameters returned by the VSELECT request
define VSELECT_price = 0
define VSELECT_newDisplaySlot = 2
; This is a temp
define SAVE_VENDO_INSIDE_NOID = 0x10

	doMyAction	ACTION_GO		; walk to it.
	waitWhile	animation_wait_bit

	jsr	v_punt_if_not_adjacent		; if not adj, depends

	chore	AV_ACT_operate			; move hand...
	sendMsg pointed_noid, MSG_VSELECT, 0	; Get the next choice
	chore	AV_ACT_stand
	getResponse	VSELECT_newDisplaySlot
	cmp	#0xff				; special failure code
	if (equal) {
		chainTo	v_boing
	}
	sound	VENDO_CHANGING

	; Then, take the displayed object out of the display window and put
	;  it back inside the front of the machine
	getProp	pointed, OBJECT_contained_by	; Get inside-vendo object noid
	putArg	SAVE_VENDO_INSIDE_NOID		; Save for future reference
	jsr v_get_subject_object		; Find out all about it
	getProp subject, OBJECT_x_position	; Save x-pos for balloon msg
	putProp pointed
	getProp	subject, VENDO_INSIDE_productOnDisplay ; Get display obj noid
	jsr v_get_subject_object		; Make object subject for xfer
	getProp	pointed, VENDO_FRONT_displaySlot ; Get slot it came from
	tay					; In Y for change_containers
	lda	pointed_noid			; New container = vendo inside
	ldx #0					; X position doesn't matter
	rjsr v_change_containers		; Move it

	; Now, take the host-designated object from inside the front and put
	;  it in the display window
	getResponse VSELECT_newDisplaySlot	; What did host say?
	putProp pointed, VENDO_FRONT_displaySlot; This is new display obj slot
	clc
	adc	#OBJECT_contents
	tay					; In Y to get object itself
	getProp pointed				; Get the object noid
	jsr v_get_subject_object		; Make object subject for xfer
	getArg	SAVE_VENDO_INSIDE_NOID		; Put in inside object
	ldx #0					; X position doesn't matter
	ldy #VENDO_INSIDE_productOnDisplay-OBJECT_contents
						; Y position is window
	rjsr v_change_containers		; Move it

	; And, redisplay the vendo with the new object in it
	getArg SAVE_VENDO_INSIDE_NOID
	jsr	v_get_subject_object
	getArg SAVE_VENDO_INSIDE_NOID

	; Finally, display the message that goes with the new object
	moveb pointed_noid, actor_noid
	movew pointed_object, actor_object
	getResponse	VSELECT_price	; fake long word
	putArg 0			; ...using the denomination...
	getResponse	VSELECT_price+1
	putArg 1			; ...bytes for padding
	lda #0				; ...byte plus 2 more zero...
	putArg 2
	putArg 3
	movew #arguments, printf_parameters
	jsr v_balloon_printf
	string "Price: $#"
	rts

	actionEnd

