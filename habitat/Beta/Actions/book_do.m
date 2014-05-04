;
;	book_do.m
;
;	Action code for the book reading operation.
;	This is the 'do' behavior for the book.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

; This is the parameter to the READ request:
define READ_PAGE = 0

; These are the parameters returned by the READ request:
define READ_NEWPAGE = 0
define READ_TEXT = 1

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {			; Have to be holding book to read it
		lda #ENTER_TEXT_MODE_COMMAND
		rjsr v_text_handler	; Initialize text mode
		lda #1			; Start with page zero
		putProp pointed, BOOK_pageNumber; Save away
		do {
			getProp pointed, BOOK_pageNumber
			putArg READ_PAGE	; Set parameter
		    	sendMsg pointed_noid, MSG_READ, 1 ; Read a page
			getResponse READ_NEWPAGE
			putProp pointed, BOOK_pageNumber
			lda #(TEXT_EXITABLE_MODE | TEXT_MULTIPAGE_MODE |
				RECEIVE_PAGE_COMMAND)	; Book modes
			rjsr v_text_handler		; Do it
			and #TEXT_EXITED_BIT		; Test player for done
		} while (zero)
		lda #EXIT_TEXT_MODE_COMMAND		; Turn off text mode
		chainTo v_text_handler
	}
	chainTo v_depends	; Punt to 'depends' if not holding

	actionEnd

