; 	error trap routines

process_error::
	sta	error_number
	sty	error_regs_y
	stx	error_regs_x
	tsx
	stx	error_regs_stack
	movew	#error_number, printf_parameters
	jsr	balloon_printf
	string	"Fatal Error #. Wait..."
	moveb	#dump_key, quit_flag
	jmp	quit_to_talk

define	resource_address	=	cel_address	; more borrowing

check_one_resource::			;  in: y:offset, resource_tables
	lda	y[@resource_table_hi]
	if (!zero) {
		sta	resource_address+1
		sta	LRC_selfmod+2
		lda	y[@resource_table_lo]
		sta	resource_address
		sta	LRC_selfmod+1
		lda	#Block_data_offset
		bump	LRC_selfmod+1		; 1st byte pointer finished

		ldy	#0
		lda	y[@resource_address]		; lo byte of len
		sec
		sbc	#block_data_offset
		tax
		iny
		lda	y[@resource_address]		; hi byte of len
		sbc	#0
		tay
		jsr	calc_LRC
		ldy	#BLOCK_lrc
		cmp	y[@resource_address]
		if (!equal) {
		    error	memory_corrupt
		}
	}
check_exit:
	rts

calc_LRC::				; in:  yx:len LRC_selfmod+1:address
	lda	#0			; out: a:LRC
	cpx	#0			; exactly page boundry?
	if (!equal) {
	    iny
	}
	do {
	    do {
LRC_selfmod::
		eor	0xffff
		inc16	LRC_selfmod+1
		dex
	    } while (!zero)
	    dey
	} while (!zero)			; only works up to 32k
	rts

