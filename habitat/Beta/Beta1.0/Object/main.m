;=======================================
;
;	main game loop
;
	include "ronmacros2.m"
	include "datamacros.m"

	start	begin
begin::
	jmp	start_of_program
	jmp	save_file

	byte	0x00,0x01,0x00,0x00,0x00	; File header
	byte	0x00,0x00,0x00,0x00,0x00
	byte	0x00

; Record header
	byte	0x01				; Encoding byte
	byte	/start_of_program
	byte	?start_of_program
	byte	/(end_of_program-start_of_program)
	byte	?(end_of_program-start_of_program)

;****************************************
;	Initialization
;****************************************
start_of_program:
	jsr	save_zpage
	jsr	init_disk
	jsr	farmers_init			; init vblank, and var space
	jsr	clear_back_drop			; fill backdrop with grid
	jsr	switch_pages			; display page 1 WHY???
	jsr	resume_communications		; with host & get first region
	inc	cursor_lock

main_loop:
	jsr	maintain_frame
	lda	heartbeat_counter
	if (zero) {
		jsr	balloon_printf
		string	"Lost carrier."
	}
	lda	have_been_ported		; 6.4
	if (!zero) {
	    jsr	special_limitations2
	    if (!carry) {
		jsr	start_cursor_flashing
		moveb	#2, region_trans_type
		lda	have_been_ported
		ldy	#0
		sty	have_been_ported
		jsr	GoToNewRegion		; a contains 'how'
		clearb	flashing
	    }
	}
	jmp	main_loop			; run til 6502 gets tired

indirect_jump::
	sta	save_from_where
	moveb	ISA_number, current_action_number
	lda	#BLOCK_data_offset
	bump	temp_ptr1			; put here to make
	lda	temp_ptr1+1			; sure @() never
	if (zero) {				; crosses page boundry
	    lda		save_from_where
	    if (!zero) {
		error	indirect_address_jmp	;  the HOST ordered this mess!
	    }
	    jmp	boing				; command on bad object
	}
	jmp	@(temp_ptr1)			; DoWhatIWant

maintain_frame::
	jsr	print_any_qlink_messages
	lda	graphics_mode		; 0 = bitmap ff= text 1=special bitmap
	if (plus) {
		bne	skip_key_read
		lda	display_contents_noid
		if (zero) {
		    lda	quit_flag
		    if (minus) {
			cmp	#dump_key
			if (equal) {
			    error	user_requested_dump
			}
			jmp	quit_to_talk
		    }
		    jsr	copy_back_to_screen	; copy backdrop to main screen
		    jsr	render			; draw backdrop or foreground
		} else {
		    jsr	pick
		}
		jsr	switch_pages		; show the finished page
	}
	jsr	get_key			; maintain keyboard
skip_key_read:
	lda	enable_event_processor
	if (!zero) {
	    jsr	event_handler		; did user/host ask to do something?
	}
	rts

rev_number::
	string	"6.4"
program_disk_number::
	byte	"2"
disk_number::
	byte	"0"
version_number::
	string	"0"
rev_number_end::

enable_event_processor::	byte	0xff

define	bandwidth_reduction	=	TRUE
    
bandwidth_factor::
mif (bandwidth_reduction) {
	byte	1				; must be 1
} melse {
	byte	0
}
give_memory::
	byte	0
save_from_where:
	byte	0xee
