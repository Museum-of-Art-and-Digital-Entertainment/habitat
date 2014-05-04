; 	text mode

backcnt:	byte	0

define Menu_List		= pnt_tmp	; borrowed zpage

define ENTER_TEXT_MODE_COMMAND	= 0x00
define EXIT_TEXT_MODE_COMMAND	= 0x01
define RECEIVE_PAGE_COMMAND	= 0x02
define TRANSMIT_PAGE_COMMAND	= 0x03
define TEXT_WRITEABLE_MODE	= 0x04
define TEXT_WRITTEN_BIT		= 0x04
define TEXT_MULTIPAGE_MODE	= 0x08
define IS_A_BOOK		= TEXT_MULTIPAGE_MODE
define TEXT_EXITABLE_MODE	= 0x10
define TEXT_EXITED_BIT		= 0x10

define TEXT_MAIL_BIT		= 0x20
define TEXT_ERASE_BIT		= 0x40
define TEXT_REPLY_BIT		= 0x80
define BOOK_NEXT_PAGE_BIT	= 0x20
define BOOK_BACK_PAGE_BIT	= 0x40
define BOOK_RANDOM_ACCESS_BIT	= 0x80

define	paper_window_start	= text_ram_1 + (text_window_size + 1) * 40
define	paper_window_size	= 23 - text_window_size
define	page_line_delimiter	= 10
define	menu_line_address	= text_ram_1 + 24*40
define	menu_color_ram		= color_ram + 24*40
define	debounce_color_ram	= color_ram + (text_window_size + 1) * 40

char_to_write:		byte	0
put_delim_here:		byte	0
page_line_counter:	byte	0
print_mode:		byte	0xff

define	where_on_page	=	temp_var_2
define	pen_x_offset	=	4
define	pen_y_offset	=	quip_y - 2

write_to_page::					; to piece of paper
	tay
	if (zero) {
wtp_exit:	    rts
	}
	clearb	keyboard_latch
	lda	write_enabled
	bpl	wtp_exit
	lda	return_bits
	ora	#TEXT_WRITTEN_BIT	; tell that we typed
	sta	return_bits
	clearb	print_mode		; disable wrap

print_to_page:
	tya
	sta	char_to_write
	cmp	#clr_key
	if (equal) {
	    lda	#41
	    sta	backcnt
	    do {
		ldy	#delete_key
		jsr	print_to_page
		dec	backcnt
	    } while (!zero)
	    rts
	}
	cmp	#return_key
	if (equal) {
	    lda	cursor_y
	    and	#0b11111000
	    clc
	    adc	#8
	    cmp	#250-12			; was -20
	    if (gt) {
		lda	#pen_y_offset+5
	    }
	    sta	cursor_y
	    lda	#pen_x_offset
	    sta	cursor_x
	    rts
	}
	cmp	#delete_key
	if (equal) {
	    lda	cursor_x
	    sec
	    sbc	#4
	    cmp	#pen_x_offset
	    if (lt) {
		lda	#pen_x_offset
	    }
	    sta	cursor_x
	    pha
	    lda	#32				; space
	    jsr	write_to_page
	    pla
	    sta	cursor_x
	    rts
	}
	lda	cursor_x
	and	#0b11111100
	sec
	sbc	#pen_x_offset
	lsr	a
	lsr	a
	tay					; giving char offset
	cpy	#39
	if (gt) {
	    jmp	beep				; tell user!
	}
	lda	cursor_y
	sec
	sbc	#(pen_y_offset)			; HERE!
	lsr	a
	lsr	a
	lsr	a
	cmp	#paper_window_size
	if (geq) {
	    lda	#15
	}
	tax
	jsr	find_where_on_page
	lda	char_to_write
	sta	y[@where_on_page]
	iny
	cpy	#40			; line wrap?
	if (geq) {
	    lda	print_mode		; wrap ONLY during download
	    if (!zero) {
		ldy	#return_key
	        jmp	print_to_page
	    }
	}
	lda	cursor_x
	adc	#4
	sta	cursor_x
	moveb	#0xff, print_mode
	rts

text_handler::
	sta	text_mode_command
	cmp	#ENTER_TEXT_MODE_COMMAND
	if (equal) {
	    jsr	goto_screen_2
	    jsr	clear_full_sheet
	    jsr	clear_text_line
	    clearb return_bits
	    sta	write_enabled
	    sta	flashing
	    moveb #-1, graphics_mode
	    sta	detach_from_stick			; freeze cursor
	    ldy	#pen_cursor
	    sty	last_icon
	    sty	reset_to_icon
	    jmp	change_cursor
	}
	cmp	#EXIT_TEXT_MODE_COMMAND
	if (equal) {
exit_text_mode::
	    ldy	#0
	    sty	text_mode_command
	    jsr	change_cursor
	    jsr	clear_full_sheet
	    ldx	#black
	    jsr	color_debounce_line
	    jsr	forced_render_region	; redraw it all!
	    jmp	clear_text_line
	}
	and	#3
	cmp	#TRANSMIT_PAGE_COMMAND
	if (equal) {
	    dec	flashing
	    dec	detach_from_stick
	    inc	write_enabled		; no more!
	    ldx	pointed_noid
	    lda	#MESSAGE_WRITE
	    jsr	prepare_to_send_request
	    moveb	#0,page_line_counter
	    do {
		ldx	page_line_counter
		jsr	find_where_on_page
		ldy	#40
		do	{
		    dey
		    bmi	no_text_on_this_line
		    lda	y[@where_on_page]
		    cmp	#32			; find end
		} while (equal)
no_text_on_this_line:
		iny
		sty	put_delim_here
		ldy	#0
		do {
		    cpy	put_delim_here
		    if (equal) {
			lda	#page_line_delimiter
			ldy	#39
		    } else {
			lda	y[@where_on_page]
		    }
		    jsr	send_request_byte
		    iny
		    cpy	#40
		} while (!equal)
		inc	page_line_counter
		lda	page_line_counter
		cmp	#paper_window_size
	    } while (!equal)
	    jsr		send_request			; whatever is left
	    lda		#reply_wait_bit
	    jsr		wait_for_something		; wait for reply
	    clearb	detach_from_stick
	    rts
	} else {
	    cmp	#RECEIVE_PAGE_COMMAND
	    if (equal) {
		dec	flashing
		dec	detach_from_stick
		jsr	clear_sheet
		jsr	get_next_packet_stream_byte	;  skip page #
		while (!zero) {
		    tay
		    cpy	#page_line_delimiter
		    if (equal) {
			ldy	#return_key
		    }
		    jsr	print_to_page
		    jsr	get_next_packet_stream_byte	; read in page
		}
	    }
	}
	jsr	display_menu
	
	moveb #pen_x_offset+2, cursor_x
	ldy	#232+8				; HERE
	lda	text_mode_command
	and	#TEXT_WRITEABLE_MODE
	if (!zero) {
	    ldy	#pen_y_offset+5
	    moveb #0xff,write_enabled
	}
	sty	cursor_y
	clearb	detach_from_stick
	sta	flashing
wait_around:
	lda	return_bits
	and	#TEXT_WRITTEN_BIT			; preserve
	sta	return_bits
	moveb	subject_noid, salvage_subject_noid
	do {
	    do {
		jsr	maintain_frame
		lda	trigger_is_pressed
	    } while (minus)
	    ldy	cursor_y
	    cpy	#250-20
	} while (lt)
	moveb	who_am_I, actor_noid
	moveb	salvage_subject_noid, subject_noid
	jsr	recover_stuff

	ldy	#0
	ldx	cursor_x
	do {
	    txa
	    cmp	y[@Menu_List]
	    iny
	    bcc	option_selected
	    iny
	} while (plus)				; runs out in 3 or 4 loops
option_selected:
	lda	y[@Menu_List]			; bits to set.
	ora	return_bits
	sta	return_bits
	ldy	write_enabled
	if (minus) {
	    and	#TEXT_ERASE_BIT+TEXT_REPLY_BIT
	    if (!zero) {
		and	#TEXT_ERASE_BIT
		if (!zero) {
		    jsr	clear_sheet
		} else {
		    jsr	setup_reply
		}
		jmp	wait_around
	    }
	} else {
	    dec	detach_from_stick
	    ldy	#BOOK_pageNumber
	    lda	y[@pointed_object]
	    tax				; x = page (next)
	    lda	#TEXT_EXITED_BIT
	    bit	return_bits		; minus=7, overflow=6 nz=1
	    if (zero) {			; NOT exit condition
		if (minus) {
		    jsr	random_access_page
		} else {
		    if (overflow) {
			dex
			dex
		    }
		    txa
		    sta	y[@pointed_object]		; NEW current page
		}
	    }
	}
	clearb	text_mode_command
	lda	return_bits
	rts					; return to caller

setup_reply:
	ldy	#6
	do {
	    lda	y[paper_window_start]
	    sta	y[Reply_Text]
	    iny
	    cpy	#16
	} while (!equal)
	jsr	clear_sheet
	ldy	#15
	do {
	    lda	y[Reply_Text]
	    sta	y[paper_window_start]
	    dey
	} while (plus)
	moveb #pen_y_offset+13, cursor_y
	rts

clear_full_sheet:
	fill paper_window_start,paper_window_size*40+40, 32
	jmp	skip_clear_sheet
clear_sheet:
	fill paper_window_start,paper_window_size*40, 32
skip_clear_sheet:
	moveb #pen_x_offset+2, cursor_x
	moveb #pen_y_offset+5, cursor_y
	ldx	player_color
color_debounce_line:
	save_and_bank_io_in
	txa				; color in x
	ldy	#39
	do {
	    sta	y[debounce_color_ram]
	    dey
	} while (plus)
	restore_io
	rts


change_cursor:
	sei				; so vblank will NOT screw this up
	bank_io_in
	tya
	jsr	set_cursor_state
	jsr	skip_trigger_check	; set sprite position
	bank_io_out
	cli
	rts

find_where_on_page::
	clc
	lda	x[times_40]
	adc	#/paper_window_start
	sta	where_on_page
	lda	x[times_40_hi]
	adc	#?paper_window_start
	sta	where_on_page+1
	rts


random_access_page:
	dec	write_to_paper_mode
	jsr	clear_text_line
	jsr	textline_printf
	string	"Page Number ?"
	jsr	wait_for_text_string
	addwwb	source, #text_line-1, out_counter	; where is number?
	jsr	convert_decimal
	lda	destination
	ldy	#BOOK_pageNumber
	sta	y[@pointed_object]	
	inc	write_to_paper_mode
	jmp	clear_text_line

display_menu:
	lda	text_mode_command
	and	#TEXT_MULTIPAGE_MODE
	if (!zero) {
	    movew	#Book_Menu,source
	    movew	#Book_Menu_List, Menu_List
	} else {
	    movew	#Paper_Menu,source
	    movew	#Paper_Menu_List, Menu_List
	}
	save_and_bank_io_in
	ldy	#39
	do {
	    lda	y[@source]
	    sta	y[menu_line_address]
	    lda	#yellow
	    sta	y[menu_color_ram]
	    dey
	} while (plus)
	restore_io
	rts

Reply_Text:
	byte	"To:             "
Paper_Menu:
	byte	"ERASE     REPLY     MAIL IT   QUIT      "
Book_Menu:
	byte	"NEXT      BACK      PAGE #    QUIT      "

define	quarter_bound	= cursor_right_bound / 4

Paper_Menu_List:
	byte	quarter_bound,		TEXT_ERASE_BIT+TEXT_WRITTEN_BIT
	byte	quarter_bound*2,	TEXT_REPLY_BIT+TEXT_WRITTEN_BIT
	byte	quarter_bound*3,	TEXT_MAIL_BIT+TEXT_EXITED_BIT
	byte	cursor_right_bound+1,	TEXT_EXITED_BIT

Book_Menu_List:
	byte	quarter_bound,		BOOK_NEXT_PAGE_BIT
	byte	quarter_bound*2,	BOOK_BACK_PAGE_BIT
	byte	quarter_bound*3,	BOOK_RANDOM_ACCESS_BIT
	byte	cursor_right_bound+1,	TEXT_EXITED_BIT

salvage_subject_noid:	block	1
