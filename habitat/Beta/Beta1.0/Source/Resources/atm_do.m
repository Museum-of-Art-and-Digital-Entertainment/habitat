;
;	atm_do.m
;
;	Action code for the ATM balance inquiry operation.
;	This is the 'do' behavior for the ATM.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	moveb pointed_noid, actor_noid
	movew pointed_object, actor_object	; all this for who's talking
	movew #bank_account_balance, printf_parameters
	jsr v_balloon_printf
	string "Balance: $#"
	rts

	actionEnd

