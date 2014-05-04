; 	error trap routines

each_vblank::
	lda	heartbeat_counter
	if (zero) {
		jsr	lost_carrier
	}
	lda	rs232_enable
	and	#0x7f
	ldy	#5
	do {
	    cmp	y[valid_bits]
	    beq	valid
	    dey
	} while (!zero)
comm_screwed:
	error	invalid_comm
valid:
	rts

valid_bits:
	byte	0
	byte	0x10
	byte	0x11
	byte	0x01
	byte	0x03
	byte	0x02


process_error::
	sta	error_number
	if (minus) {
;	    movew	#error_number, printf_parameters
;	    jsr		balloon_printf
;	    string	"warning #"
	    rts
	}
	sty	error_regs_y
	stx	error_regs_x
	tsx
	stx	error_regs_stack
	movew	#error_number, printf_parameters
	jsr	balloon_printf
	string	"Fatal Error #. Wait..."
	moveb	#dump_key, quit_flag
	jmp	quit_to_talk

check_all_resource_types::
	jsr	check_heap_end
	ldx	#type_image
	jsr	check_resource_type
	ldx	#type_action
	jsr	check_resource_type
	ldx	#type_sound
	jsr	check_resource_type
	ldx	#type_class
	jmp	check_resource_type

define	somewhere	=	cel_x		; borrow some zpage

check_resource_type::
	jsr	unpack_resource_type
	ldy	#0
	sty	somewhere
	do {
	    ldy	somewhere
	    jsr	check_one_resource
	    dec	somewhere
	} while (!zero)
	rts

define	resource_address	=	cel_address	; more borrowing

check_one_resource::			;  in: y:offset, resource_tables
;	lda	resource_type
;	cmp	#type_image
;	if (equal) {
;	    cpy	#186			; super_trap_image (modifies mem)
;	    beq	check_exit
;	    cpy	#46			; glue image (same)
;	    beq	check_exit
;	}
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
;inc_border_color
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

check_heap_end:
	movew	last_link, somewhere
	ldy	#size_offset
	lda	y[@somewhere]
	clc
	adc	last_link
	cmp	#/top_of_heap
	beq	keep_going
oooops:
	error	heap_overrun
keep_going:
	lda	y[@somewhere]
	clc
	adc	last_link
	iny
	lda	y[@somewhere]
	adc	last_link+1
	cmp	#?top_of_heap
	bne	oooops
	rts

lost_carrier::
	jsr	balloon_printf
	string	"Lost carrier."
	rts

define looking_here	=	cel_x
define	n_d_b		=	cel_dx

check_heap_for_bad_links::
	lda	resource_type
	sta	save_rt+1
	movew	#static_end_of_heap, looking_here
	movew	first_delete_block+link_offset, n_d_b
	while (!zero) {
	    test16	looking_here, n_d_b
	    if (equal) {
		ldy	#link_offset
		lda	y[@looking_here]
		sta	n_d_b
		iny
		lda	y[@looking_here]
		sta	n_d_b+1
	    } else {
		ldy	#BLOCK_type
		lda	y[@looking_here]
		tax
		jsr	unpack_resource_type
		ldy	#BLOCK_number
		lda	y[@looking_here]
		tay				; ok, we HAVE it!
		lda	y[@resource_table_lo]
		cmp	looking_here
		bne	bad_links
		lda	y[@resource_table_hi]
		cmp	looking_here+1
		if (!equal) {
bad_links:
		    error very_bad_links
		}				; got past here OK!
	    }
	    ldy	#size_offset
	    clc
	    lda	y[@looking_here]
	    adc	looking_here
	    tax
	    iny
	    lda	y[@looking_here]
	    adc	looking_here+1
	    sta	looking_here+1
	    stx	looking_here
	    test16	looking_here, last_link	; at the end?
	}
save_rt:
	ldx	#0x00
	jsr unpack_resource_type
	rts
