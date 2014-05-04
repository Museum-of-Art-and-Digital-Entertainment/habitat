;
;	toggle_ghost_mode.m
;
;	Action code for the ghost-mode toggle key.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	22-September-1986
;
	include	"action_head.i"

; These are the parameters returned by the request MSG_CHANGE_CORPOREALITY
define CORPOREAL_SUCCESS = 0
	; 0 = failure
	; 1 = success, here is new object vector
	; 2 = success, you already have new object
	; 3 = success 1 + you were the last ghost
	define ALREADY_THERE = 2
	define LAST_GHOST    = 3
define CORPOREAL_NOID = 1
define NEW_BANK_BALANCE=2
define CORPOREAL_BODY = 6

	actionStart

	sendMsg me_noid, MSG_CHANGE_CORPOREALITY, 0 ; Change to or from ghost
	getResponse CORPOREAL_SUCCESS		; Did it work?
	if (!zero) {				; Why yes, it did
		tax				; shorthand
		getResponse CORPOREAL_NOID
		cmp	#ghost_noid
		if (!equal) {			; I am now an Avatar
		    cpx	#LAST_GHOST
		    bne	Old_self_deleted	; was NOT the only ghost,skip
		}
		lda	me_noid
		rjsr	v_delete_object		; except #3, delete old me
Old_self_deleted:			
		getResponse NEW_BANK_BALANCE
		sta	bank_account_balance
		iny
		lda	y[@response_data]
		sta	bank_account_balance+1
		iny
		lda	y[@response_data]
		sta	bank_account_balance+2
		iny
		lda	y[@response_data]
		sta	bank_account_balance+3
		getResponse CORPOREAL_NOID
		sta me_noid
		sta Who_am_I
		getResponse CORPOREAL_SUCCESS
		cmp #ALREADY_THERE		; Is there already a ghost?
		if (!equal) {			; No! (Or we're now an avatar)
			addwwb response_data, response_data, #CORPOREAL_BODY
			lda	#0		; its in the region
			chainTo v_unpack_contents_vector
		}
		rts
	}
	chainTo v_boing				; Just beep if it didn't work

	actionEnd
