atm_get.m:	putArg	SAVE_FOR_LATER
atm_get.m:	putArg WITHDRAW_AMOUNT				; Set it
atm_get.m:	putArg WITHDRAW_AMOUNT+1			; Set it
atm_put.m:	putArg	TOKEN_NOID
avatar_THROW.m:	putArg TEMP_Y
avatar_do.m:	putArg	AVATAR_TOUCHED
avatar_do.m:		putArg	TOUCH_CHORE
avatar_go.m:		putArg	NEW_POSTURE
book_do.m:			putArg READ_PAGE	; Set parameter
changomatic_rdo.m:	putArg CHANGE_TARGET			; Set it
credit_card_rdo.m:		putArg PAYTO_TARGET	; Set it
credit_card_rdo.m:		putArg PAYTO_AMOUNT	; Set it
generic_adjacentDoMagic.m:	putArg	AFFECTED_OBJECT
generic_adjacentOpenClose.m:	putArg have_key
generic_adjacentOpenClose.m:			putArg have_key
generic_adjacentOpenCloseContainer.m:	putArg have_key
generic_adjacentOpenCloseContainer.m:			putArg have_key
generic_coinOp.m:		putArg COINOP_SUCCESS
generic_coinOp.m:	putArg		COINOP_SUCCESS
generic_coinOp.m:	putArg COINOP_SUCCESS
generic_doMagic.m:		putArg	AFFECTED_OBJECT
generic_doMagicIfMagic.m:			putArg	AFFECTED_OBJECT
generic_goToAndDropInto.m:	putArg SAVE_TARGET
generic_goToAndDropIntoIfOpen.m:	putArg SAVE_TARGET
generic_goToFurniture.bad.m:		putarg	SIT_OR_GET_UP
generic_goToFurniture.bad.m:	putarg	SIT_OR_GET_UP
generic_goToFurniture.m:		putarg	SIT_OR_GET_UP
generic_goToFurniture.m:		putarg	SEAT_NOID
generic_goToFurniture.m:	putarg	SIT_OR_GET_UP
generic_goToFurniture.m:	putarg	SEAT_NOID
generic_goToFurniture.m:		putArg	NEW_POSTURE
generic_patternSwap.m:	putArg SWAP_MASK_COMP
generic_patternSwap.m:	putArg SWAP_TEMP		; Save the masked pattern
generic_rdoMagic.m:	putArg	AFFECTED_OBJECT
generic_rdoMagicIfMagic.m:	putArg	AFFECTED_OBJECT
generic_shoot.m:	putArg	SHOOT_TARGET			; Set it
generic_strike.m:		putArg	STRIKE_TARGET			; Set it
generic_throw.m:	putArg	THROW_Y
generic_throw.m:	putArg	THROW_X
generic_throw.m:	putArg	THROW_TARGET
generic_throw.m:	putArg	TEMP_NEW_Y
generic_wearHead.m:	putArg WEAR_WHERE
generic_wearLegs.m:	putArg WEAR_WHERE
generic_wearTorso.m:	putArg WEAR_WHERE
key_do.m:		putArg 0			; ...using the number...
key_do.m:		putArg 1			; ...bytes for padding
key_do.m:		putArg 2
key_do.m:		putArg 3
paper_do.m:	putArg READ_PAGE		; Set parameter
plaque_do.m:		putArg READ_PAGE	; Set parameter
spray_can_do.m:		putArg SPRAY_LIMB
stereo_put.m:		    putArg TAPE_TO_LOAD
stun_gun_rdo.m:		putArg STUN_TARGET		; Set it
tokens_do.m:		putArg 0			; ...using the denomination...
tokens_do.m:		putArg 1			; ...bytes for padding
tokens_do.m:		putArg 2
tokens_do.m:		putArg 3
tokens_rdo.m:	putArg 0				; ...using the denomination...
tokens_rdo.m:	putArg 1				; ...bytes for padding
tokens_rdo.m:	putArg 2
tokens_rdo.m:	putArg 3
tokens_rdo.m:	putArg PAY_AMOUNT			; Set it
tokens_rdo.m:	putArg PAY_AMOUNT+1			; Set it
tokens_rdo.m:	putArg PAY_TARGET			; Set it
vendo_SELECT.m:	putArg	SAVE_VENDO_INSIDE_NOID		; Save for future reference
vendo_SELECT.m:	putArg ARGS_TO_PRINTF		; ...using the denomination...
vendo_SELECT.m:	putArg ARGS_TO_PRINTF+1		; ...bytes for padding
vendo_SELECT.m:	putArg ARGS_TO_PRINTF+2
vendo_SELECT.m:	putArg ARGS_TO_PRINTF+3
vendo_do.m:	putArg	SAVE_VENDO_INSIDE_NOID		; Save for future reference
vendo_do.m:	putArg 0			; ...using the denomination...
vendo_do.m:	putArg 1			; ...bytes for padding
vendo_do.m:	putArg 2
vendo_do.m:	putArg 3
