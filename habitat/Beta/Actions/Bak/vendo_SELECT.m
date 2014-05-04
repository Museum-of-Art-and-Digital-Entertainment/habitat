;
;	vendo_SELECT.m
;
;	Action code for the asynch vendo flip-through-the-selections behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	19-June-1986
;
	include	"action_head.i"

	actionStart

; These are the parameters of the SELECT message:
define VSELECT_price = 0
define VSELECT_newDisplaySlot = 2
; This is a temp
define SAVE_VENDO_INSIDE_NOID = async_workspace
define ARGS_TO_PRINTF = async_workspace

	sound	VENDO_CHANGING, actor_noid

	; Then, take the displayed object out of the display window and put
	;  it back inside the front of the machine
	getProp	actor, OBJECT_contained_by	; Get inside-vendo object noid
	sta	SAVE_VENDO_INSIDE_NOID		; Save for future reference
	jsr v_get_subject_object		; Find out all about it
	getProp subject, OBJECT_x_position	; Save x-pos for balloon msg
	putProp actor
	getProp	subject, VENDO_INSIDE_productOnDisplay ; Get display obj noid
	jsr v_get_subject_object		; Make object subject for xfer
	getProp	actor, VENDO_FRONT_displaySlot	; Get slot it came from
	tay					; In Y for change_containers
	lda actor_noid				; New container is vendo front
	ldx #0					; X position doesn't matter
	rjsr v_change_containers		; Move it

	; Now, take the host-designated object from inside the front and put
	;  it in the display window
	getResponse VSELECT_newDisplaySlot	; What did host say?
	putProp actor, VENDO_FRONT_displaySlot	; This is new display obj slot
	clc
	adc	#OBJECT_contents
	tay					; In Y to get object itself
	getProp actor				; Get the object noid
	jsr v_get_subject_object		; Make object subject for xfer
	lda	SAVE_VENDO_INSIDE_NOID		; Put in inside object
	ldx #0					; X position doesn't matter
	ldy #VENDO_INSIDE_productOnDisplay-OBJECT_contents
						; Y position is window
	rjsr v_change_containers		; Move it

	; And, redisplay the vendo with the new object in it
	lda	SAVE_VENDO_INSIDE_NOID
	jsr	v_get_subject_object
	lda	SAVE_VENDO_INSIDE_NOID


	; Finally, display the message that goes with the new object
	getResponse	VSELECT_price	; fake long word
	sta	ARGS_TO_PRINTF		; ...using the denomination...
	getResponse	VSELECT_price+1
	sta	ARGS_TO_PRINTF+1	; ...bytes for padding
	lda #0				; ...byte plus 2 more zero...
	sta	ARGS_TO_PRINTF+2
	sta	ARGS_TO_PRINTF+3
	movew #ARGS_TO_PRINTF, printf_parameters
	jsr v_balloon_printf
	string "Price: $#"
	rts

	actionEnd

