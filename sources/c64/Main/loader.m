	include "ronmacros2.m"
	include "datamacros.m"
	include "diskmacros.m"
	include	"../Bin/class_equates.m"

	org	0x7200

loader_start::
	jsr	all_sfx_off
	moveb	#special_mode,	graphics_mode	; allow display without ani
	lda	#0
	sta	screen_is_off			; so we can see error
mif (debug_mode) {
} melse {
	lda	error_number			; ...start...
	sta	arguments			;  (6.4)
	lda	#1				; 1 arg (fe#)
	ldx	#0				; to region
	ldy	#MESSAGE_I_quit			;
	jsr	send_arguments			; ...end...
}
mif (dump_enabled) {
	lda	quit_flag
	cmp	#dump_key
	if (equal) {
do_dump:
	    movew	#dump_text,source
	    jsr		display_and_wait_for_key
	    cmp		#quit_key
	    beq		do_ss			; quit_key aborts save
	    jsr		test_habitat_disk
	    beq		do_dump				; HI HACKER!
	    movew	#0x0100, start_tracksector
	    movew	#top_of_heap, number_of_bytes
	    movew	#0x0000, buffer_pointer
	    jsr		d_write_segment
	}
}
do_ss:
mif (debug_mode) {
	lda	error_number			; ...start...
	sta	arguments			;  (6.4)
	lda	#1				; 1 arg (fe#)
	ldx	#0				; to region
	ldy	#MESSAGE_I_quit			;
	jsr	send_arguments			; ...end...
}
	jsr	send_SS_and_wait
skip_write:
	ldy	#0x0
	do {
	    lda	y[hold_page_2]
	    sta y[0x200]
	    dey
	} while (!zero)				; restore page 2

	ldy	#2
	do {
		lda	y[chainto_filename]
		sta	y[0x2f5]
		dey
	} while (plus)

get_QLINK_disk::
	movew	#swap_please,	source
	jsr	display_and_wait_for_key

	jsr	test_habitat_disk
	beq	get_QLINK_disk		; HI HACKER!

	bank_io_in

	sei

	clearb	NMI_timer_a
	sta	NMI_timer_b			; turn off timers
	moveb	#0x7f, NMI_interrupt		; turn off nmi's
	moveb	#0x7f, IRQ_interrupt		; turn off irq's
	clearb	0xd01a
	lda	0xd019
	sta	0xd019

	moveb	NXTSEQ, 0x2f8
	moveb	LSTSEQ, 0x2f9
	moveb	SEQOUT, 0x2fa
	moveb	LSTSQO, 0x2fb			; parameters for '2000'

	clearb	vic_control			; screen OFF!

	movew	#0x6000,load_address
	ldx	#'2'
	ldy	#'0'
	jsr	load_file

	jsr	disk_quit

	ldy	#0x0
	do {
	    lda	y[hold_page_3]
	    sta y[0x300]
	    lda	y[hold_zpage]
	    sta	y[0x000]
	    dey
	} while (!zero)

	moveb	#0x17, 0xd000
	jmp	0x6000

; 	field update routine....

define	update_buffer_pointer	=	temp_var_1

field_update::
	jsr	get_packet_stream_byte
	sta	start_tracksector+1			; track
	jsr	get_next_packet_stream_byte
	sta	start_tracksector			; sector
	clearb	update_buffer_pointer
	do {
	    jsr	get_next_packet_stream_byte
	    ldy	update_buffer_pointer
	    sta	y[sort_y]				; not in use
	    inc	update_buffer_pointer
	} while (!zero)					; 256 bytes!
	movew	#0x100,number_of_bytes
	movew	#sort_y,buffer_pointer
	jsr	d_write_segment
	rts

swap_disk::
	movew	instructions,source
	jsr	display_and_wait_for_key

	jsr	test_habitat_disk
	bne	swap_disk
	lda	back_drop+16
	cmp	desired_disk
	bne	swap_disk
	sta	disk_number
	lda	back_drop+26
	sta	version_number
	movew	#thank_you,	source
	moveb	#purple,	color
	ldx	#0
	jsr	draw_balloon

	movew	#loader_file, start_tracksector
	movew	#end_of_loader-loader_start+1,number_of_bytes
	movew	#loader_start,buffer_pointer
	jsr	d_write_segment

	open_file	#charset_file		; read disk charset
	seek_byte	#0000
	read_segment	#charset_at,#1024

	jsr	clear_text_line
	jsr	all_sfx_off			; so music doesn't die
; wipe out all memory refferences

	fill	object_table_hi,(static_end_of_heap - object_table_hi),0
	fill	0x200, 0x2ff, 0			; wipeout 0x200 - 0x4ff

; 	init master delete block

	movew	#top_of_heap-static_end_of_heap, static_end_of_heap
	clearw	static_end_of_heap+link_offset
	lda	#/static_end_of_heap
	sta	first_delete_block+link_offset
	sta	last_link
	lda	#?static_end_of_heap
	sta	first_delete_block+link_offset+1
	sta	last_link+1

	dec	new_region_flag
	ldx	#0
	ldy	#class_region
	jsr	create_object		; load the region object
	ldy	#0
	jsr	load_action
	ldy	#0
	jsr	load_sound

;	ldx	#ghost_noid
;	ldy	#class_ghost
;	jsr	create_object		; load the ghost object
;	lda	#ghost_noid
;	jsr	load_all_resources
;	lda	#ghost_noid
;	jsr	delete_object		; throw it away BUT leave most

	ldx	#1
	ldy	#class_avatar
	jsr	create_object		; load the avatar
	lda	#1
	jsr	load_all_resources
	lda	#1
	jsr	delete_object		; throw it away BUT leave most
	rts				; of it in memory

Im_dead::
	add16	response_data,#1,source
	jsr	display_and_wait_for_key
	jmp	loader_start

test_habitat_disk:				; zero = yes, nz = no
	open_file	#id_file		; check if really proper disk
	seek_byte	#0000
	read_segment	#back_drop,#40

	lda	back_drop
	cmp	#'H'
	if (equal) {
	    lda	back_drop+1
	    cmp	#'I'
	}
	rts

instructions::	block	2
desired_disk::	block	1

thank_you:
mif (debug_mode) {
	string	"Auto Version"
} melse {
	string "Version 1.0"
}

swap_please:
	string	"Insert Q-Link disk, press any key."

dump_text:
	string	"Insert blank formatted disk."

title_music_start::
title_music_v0::
		include	"../Sounds/titles_music_v0.sob"
title_music_v0_pw::
		include	"../Sounds/titles_music_v0.spb"
title_music_v1::
		include	"../Sounds/titles_music_v1.sob"
title_music_v1_pw::
		include	"../Sounds/titles_music_v1.spb"
title_music_v2::
		include	"../Sounds/titles_music_v2.sob"
title_music_v2_pw::
		include	"../Sounds/titles_music_v2.spb"
title_music_end::

end_of_loader::

