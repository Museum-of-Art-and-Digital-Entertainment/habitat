; 	action code that runs in mainline
	include "ronmacros2.m"
	include "datamacros.m"
	include	"../Bin/class_equates.m"

balloon_flag:		byte	0
in_counter:		byte	0
loop_counter:		byte	0
parameter_counter:	byte	0
async_noid:		byte	0
counter:		byte	0
waitfor_counter:	byte	short_async_frames
hold_subject_noid:	byte	0
hold_ASYNC_subject:	byte	0
delete_save:		byte	0
delete_object_noid:	byte	0

region_special_case::
	iny
	lda	y[@response_data]
	tax
	jsr	bump_vector
	cpx	#MESSAGE_describe
	if (equal) {			; description of region?
	    jmp	unpack_region
	}
	cpx #MESSAGE_Im_alive
	if (equal) {
	    ldy	#0
	    lda	y[@response_data]
	    tax
	    if (zero) {
		jmp	Im_dead		;fatal exit
	    }
	    dex
	    if (zero) {			; alive, check realm disk
		iny
		lda	y[@response_data]
		sta	desired_disk
		cmp	disk_number
		if (!equal) {
		    jsr	get_loader_from_disk
		    add16	response_data,#2, instructions
		    jsr	swap_disk
		}
	    } else {
		inc16	response_data
		jsr	unpack_region			; get custom region
		jsr	custom_frame			; hey! you are new!
		jmp	im_alive
	    }
	    jmp	wait_for_region			; ok where are we?
	}
	cpx	#MESSAGE_customize
	if (equal) {
	    ldy	#0
	    lda	y[@response_data]
	    sta	customize_reply
	}
	cpx	#MESSAGE_HEREIS
	if (equal) {
	    jmp	here_is
	}
	cpx	#MESSAGE_GOAWAY
	if (equal) {
	    ldy	#0
	    lda	y[@response_data]
	    jmp	delete_object
	}
	cpx	#MESSAGE_PORT
	if (equal) {
	    ldx	stack_before_execution	; did we get warped
	    if (!zero) {		; while waiting?
		txs
	    }
	    jmp	wait_for_region
	}
	cpx	#MESSAGE_UPDATE_DISK
	if (equal) {
	    jsr	get_loader_from_disk
	    jsr	field_update
	    jmp	wait_for_region
	}
	cpx	#MESSAGE_FIDDLE
	if (equal) {
	    jmp	fiddle_with_object
	}
	cpx	#MESSAGE_LIGHTING
	if (equal) {
	    jmp	change_lighting
	}
	cpx	#MESSAGE_MUSIC
	if (equal) {
	    jmp	make_a_sound
	}
	cpx	#MESSAGE_OBJECT_TALKS
	if (equal) {
	    jmp	make_object_speak
	}
	cpx	#MESSAGE_WAIT_FOR_ANI
	if (equal) {
	    ldy	#0
	    lda	y[@response_data]
	    sta	actor_NOID			; who to wait for
	    jsr	set_up_actor_pointers
	    moveb	#long_async_frames, waitfor_counter
	    jmp	ASYNC_animation_wait		; ok, wait for it!
	}
	cpx	#MESSAGE_CHANGE_CONT	; a kernal command
	if (equal) {			; noid, contnoid,x,y
	    ldy	#0
	    lda	y[@response_data]
	    jsr	get_subject_object		; move WHAT to WHERE?
	    ldy	#1
	    lda	y[@response_data]
	    pha
	    iny
	    lda	y[@response_data]
	    tax
	    iny
	    lda	y[@response_data]
	    tay
	    pla
	    jmp	change_containers
	}
	cpx	#MESSAGE_PROMPT_USER
	if (equal) {			;note that this procedure should NOT
	    jsr	clear_text_line		;interfere with the std command 
	    ldy	#255			;structure, even if a command is
	    do {			;in a wait state.
		iny
		lda	y[@response_data]
		sta	y[text_line]
	    } while (!zero)		; display prompt
	    sty	out_counter
	    jsr	wait_for_text_string	; get answer
	    lda	input_text_length	; Length from input
	    ldy	#MESSAGE_PROMPT_REPLY
	    ldx	#0			; Direct to to region
	    jsr	send_string		; Send answer to host
            jmp clear_text_line         ; 6.5
	}
	cpx	#MESSAGE_BEEN_MOVED	; NEW _PORT stuff  (6.4)
	if (equal) {
	    ldy	#0
	    lda	y[@response_data]
	    sta	have_been_ported
	    rts
	}
	cpx	#MESSAGE_HOST_DUMP		; 6.4 Host caused crash
	if (equal) {
	    error	host_requested_dump
	}
;	lda	sync_arrival
;	if (!zero) {
	    cpx	#MESSAGE_CAUGHT_UP
	    beq	here_I_am_part2
	    cpx	#MESSAGE_APPEAR
	    beq	here_is_someone
;	}
	rts

here_I_am::
;	ldy	sync_arrival
;	if (zero) {
;	    jmp	sprites_on
;	}
	jsr	quip_on
	ldy	me_noid
	iny
	if (zero) {
	    jmp	sprites_on		; free up cursor NOW, I am a ghost!
	}
	lda	avatar_count
	cmp	#2			; 2 or move avatars here (me included)
	bcc	here_I_am_part2		; If I am the only one, no need
	lda	#0
	tax
	ldy	#MESSAGE_FINGER_IN_QUE
	jmp	send_arguments		; and process all things normal

here_I_am_part2:			; inform others I have caught up!
	lda	#0
	tax
	ldy	#MESSAGE_HERE_I_AM
	jmp	send_arguments		; host will call back!

here_is_someone:			; might be me, might not!
	ldy	#0
	lda	y[@response_data]	; noid of avatar appearing
	tay
	cmp	me_noid
	if (equal) {
	    jsr	sprites_on		;  It's ME! enable cursor.
	    ldy	me_noid
	}
	fGetObjectAddr	object_address
	ldy	#OBJECT_animation_state
	lda	y[@object_address]
	and	#255-avatar_on_hold		; OK!!! DRAW ME!
	sta	y[@object_address]
	rts

Im_alive::
	do {
	    lda	INITST			; wait for communications to resume
	} while (!zero)
	ldy	#MESSAGE_Im_alive
	jmp	send_region_message	;  and aWAAAY WE GOOO!

set_up_actor_pointers::
	lGetObjectAddr	actor_NOID, actor_object	; set up PLAYER
	ldy	#OBJECT_class_pointer			; variables for
	lda	y[@actor_object]			; Action code
	sta	class
	lGetClassAddr	class, actor_class
	ldy	#CLASS_capacity
	lda	y[@actor_class]
	clc
	adc	#OBJECT_contents
	sta	actor_variables_offset

	ldy	#OBJECT_contents+AVATAR_HAND
	lda	y[@actor_object]
	sta	in_hand_NOID
	lGetObjectAddr	in_hand_noid,in_hand_object
	ldy	#OBJECT_class_pointer			; variables for
	lda	y[@in_hand_object]			; Action code
	sta	class
	lGetClassAddr	class, in_hand_class
	ldy	#CLASS_capacity
	lda	y[@in_hand_class]
	clc
	adc	#OBJECT_contents
	sta	in_hand_variables_offset
	rts

set_up_pointed_pointers::
	lGetObjectAddr	pointed_noid,pointed_object
	ldy	#OBJECT_class_pointer
	lda	y[@pointed_object]
	sta	class
	lGetClassAddr	class,pointed_class
	ldy	#CLASS_capacity
	lda	y[@pointed_class]
	clc
	adc	#OBJECT_contents
	sta	pointed_variables_offset		; end of setup
	rts


execute_command::
	tsx
	stx	stack_before_execution		; save incase command fails
	moveb	who_am_I, actor_NOID
	sta	waitfor_noid
	jsr	set_up_actor_pointers
	jsr	update_cursor			; what are we pointing at?

	cmp	first_pointed_noid
	bne	no_go	

	moveb	desired_x, face_cursor_x

	lda	command_selected		; fn keys?
	cmp	#special_command		; 
	if (carry) {				; qeq
	    moveb	#0,pointed_noid		; point at the region
	}					; 
	jsr	set_up_pointed_pointers

	ldy	command_selected
	lda	actor_noid
	cmp	#ghost_noid
	if (equal) {
	    cpy	#COMMAND_GO			; ghosts can ONLY go!
	    if (!equal) {
		lda	pointed_noid		; region command?
		bne	no_go
		cpy	#9			; deghost
		bne	no_go
	    }
	    beq	skip_facing
	}

	cpy	#COMMAND_TALK
	beq	skip_facing
	lda	im_sitting			; can only GO while sitting
	beq	ok_to_execute
	cpy	#COMMAND_GO
	if (!equal) {
no_go:		lda	#0xff
		sta	command_selected
		jmp	beep
	}
	ldy	#OBJECT_contained_by		; what am I sitting in?
	lda	y[@actor_object]
	sta	pointed_noid
	jsr	set_up_pointed_pointers		; pretend I point to container
	jmp	skip_facing
ok_to_execute:
	jsr	face_cursor
skip_facing:
	clearb	prevent_region_trans	; 6.3 
	ldy	command_selected	; and what do we want to do?
	sty	last_command_selected
	ldx	#0xff
	stx	command_selected	; don't infinite loop...
	tya
issue_nested_command::
	sta	save_accumulator		; 6.4
	jsr	set_up_pointed_pointers		; 
	lda	pointed_object+1		; incase object
	if (zero) {				; gets wiped out
	    jmp	boing				; EARLY!
	}					; 
	lda	save_accumulator		; 
	ldy	pointed_noid
	jsr	GetAction			; command in a
	lda	#command_entry
	jmp	indirect_jump

caller::		; This is the routine that gets executed by actions
			; INSTEAD OF a jsr (anything that maintains frame)

	sty	temp_var_2
	movew	target_routine, jsr_place+1
	ldy	current_action_number
	sec
	pla
	sbc	y[action_table_lo]
	sta	temp_var_1
	pla
	sbc	y[action_table_hi]
	pha
	lda	temp_var_1
	pha				; stack now hold RELATIVE return addr
	tya
	pha				; so we can do a lookup later

	ldy	temp_var_2
	lda	save_status
	pha
	lda	save_accumulator	; set by action
	plp
jsr_place:
	jsr	0x0000			; modified above
	php
	sta	save_accumulator	; incase it was a return value
	pla
	sta	save_status
	sty	caller_save_y
	stx	caller_save_x

	pla				; get what action # this was
	tay
	sty	current_action_number
	clc
	pla
	adc	y[action_table_lo]
	sta	temp_var_1
	pla
	adc	y[action_table_hi]
	if (zero) {
	    error	indirect_address_rts
	}
	pha
	lda	temp_var_1
	pha				; put FIXED address on the stack

	jsr	recover_stuff		; pointers could be wrong now...
	ldy	caller_save_y
	ldx	caller_save_x
	lda	save_status
	pha
	lda	save_accumulator
	plp
	rts			; Phew! Back to caller, even if it MOVED!

wait_for_something::
	pha
	lGetObjectAddr	waitfor_noid,waitfor_object
	moveb	subject_noid, hold_subject_noid
	pla
	ldy	#OBJECT_wait_state
	ora	y[@waitfor_object]
	sta	y[@waitfor_object]	; if we need to wait for something
	do {
	    jsr	maintain_frame
	    lGetObjectAddr	waitfor_noid,waitfor_object
	    ldy	#OBJECT_wait_state
	    lda	y[@waitfor_object]
	    and	#reply_wait_bit			;*
	    if (!zero) {			;*
		ldx	request_OID		;*
		lda	x[object_table_hi]	;*
		if (zero) {			; was object deleted?
			ldx	stack_before_execution
			txs			;*
			jsr	beep		;*
			jmp	emergency_exit	;then return to mail_loop
		}				;*
	    }					;*
	    lda	y[@waitfor_object]
	    and	#used_wait_bits
	} while (!zero)
emergency_exit:
;	clearb	stack_before_execution
	moveb	waitfor_noid, actor_noid
	moveb	hold_subject_noid,subject_noid
recover_stuff::
	jsr	set_up_actor_pointers		; recover stuff
	jsr	set_up_pointed_pointers		; recover stuff
	lda	subject_noid
	jmp	get_subject_object		; recover stuff

ASYNC_animation_wait::
	lda	display_contents_noid		; no waits during select
	if (zero) {
	    lda	text_mode_command
	    if (zero) {				; nor during text select
		moveb	subject_noid, hold_ASYNC_subject
		ldy	actor_noid
		sty	ASYNC_noid
		fGetObjectAddr	ASYNC_object
		ldy	#OBJECT_wait_state
		lda	y[@ASYNC_object]
		ora	#animation_wait_bit
		sta	y[@ASYNC_object]
		clearb	enable_event_processor
		do {
		    jsr	maintain_frame
		    lGetObjectAddr	ASYNC_noid,ASYNC_object
		    ldy	#OBJECT_wait_state
		    dec	waitfor_counter
		    beq	dead_animation
		    lda	y[@ASYNC_object]
		    and	#used_wait_bits
		} while (!zero)
dead_animation:
		lda	y[@ASYNC_object]
		and	#255-animation_wait_bit		; bit off!
		sta	y[@ASYNC_object]
		dec	enable_event_processor
		moveb	ASYNC_noid, actor_noid
		moveb	hold_ASYNC_subject, subject_noid
		jsr	recover_stuff
	    }
	}
	moveb	#short_async_frames, waitfor_counter	; next wait
	rts

type_of_walk:
	byte	0

goXY::
	lda	Im_sitting
	if (!zero) {
	    jmp	go_fail
	}
	moveb	#1,go_success
	lda	me_noid
	cmp	#ghost_noid
	if (equal) {
	    rts
	}
	lda	desired_x
	and	#0b11111100			; KLUDGE, arics animate!
	sta	desired_x
	lda	desired_y
	and	#0b01111111
	cmp	region_depth
	if (gt) {
	    lda	region_depth
	}
	ora	#0x80
	sta	desired_y			; clamp!
	ldy	#OBJECT_x_position
	lda	y[@actor_object]
	cmp	desired_x
	if (equal) {
	    iny
	    lda	y[@actor_object]
	    cmp	desired_y
	    if (equal) {
do_nothing:
		lda	#AV_ACT_nop
		jsr	set_actor_chore
		rts				; all ready done
	    }
	}
	lda	#3				; 3: x,y,how
	ldx	actor_noid
	ldy	#MESSAGE_walk
	jsr	send_arguments
	lda	#reply_wait_bit
	jsr	wait_for_something		; issue walk, wait for reply

	ldy	#1
	lda	y[@response_data]
	beq	go_fail				; y = 0 means fail

	pha
	iny
	lda	y[@response_data]		; how?
	sta	type_of_walk

	ldy	#OBJECT_wait_state
	lda	#animation_wait_bit
	ora	y[@actor_object]
	sta	y[@actor_object]

	ldy	#0
	lda	y[@response_data]
	tax
	cpx	desired_x
	if (!equal) {
	    clearb	go_success
	}
	pla
	tay
	cpy	desired_y
	if (!equal) {
	    clearb	go_success
	}
	lda	type_of_walk
	jmp	start_walk

go_fail::
	clearb	go_success
	jmp	do_nothing


do_a_sound::					; offset in a
						; noid in y
	jsr	GetSound			; get ISA_number
	inc	sound_timer		; a counter of total # sfx played
	if (zero) {			; it wrapped! Better clean up table
	    clearb	sound_started	; so that all voices remain active.
	    sta		sound_started+1	; (before I put this in it would
	    sta		sound_started+2	; drop voices after awhile)
	    inc		sound_timer	; May NEVER be zero!
	}
	ldy	#2				; default voice
	ldx	#2
	lda	#0xff				; best start time
	do {
	    cmp	y[sound_started]
	    if (carry) {
		tya
		tax		; 'this is the voice we are looking for'
		lda	y[sound_started]		; OLDEST
	    }
	    dey
	} while (plus)
	lda	sound_timer
	sta	x[sound_started]
	lda	ISA_number
	jmp	que_sound_effect

make_a_sound::
	ldy	#0
	lda	y[@response_data]	; sfx number (hibit = complex)
	pha
	iny
	lda	y[@response_data]	; noid
	tay
	pla
	bpl	do_a_sound
	and	#0x7f			; mask off hi bit

do_a_complex_sound::
	jsr	do_a_sound			; assumes PW is NEXT ISA #!
	clc
	adc	#1
	inx
	inx
	inx
	inx					;  appropriate pw...
	jmp	que_sound_effect

make_object_speak::
	add16	response_data,#1, source
	ldy	#0
	lda	y[@response_data]
	sta	actor_noid
balloonMessage::
	jsr	set_up_actor_pointers
	lda	actor_noid			; color if non-avatar
	jsr	find_talker_number
	if (plus) {
	    iny
	    tya					; avatar, use offset for color
	}
	sta	color
	ldy	#OBJECT_contained_by
	lda	y[@actor_object]
	if (!zero) {
	    tay
	} else {
	    ldy	actor_noid
	}
	fGetObjectAddr	object_address
	ldy	#OBJECT_x_position
	lda	y[@object_address]		; x position
	adc	#8
	tax
	ldy	#OBJECT_class_pointer
	lda	y[@object_address]
	cmp	#class_couch
	if (!equal) {
	    cmp	#class_bed
	    if (!equal) {
		jmp	draw_balloon
	    }
	}
	txa
	adc	#8
	tax
	ldy	#OBJECT_y_position			; must be bed or couch
	lda	y[@actor_object]			; yep actor!
	if (!zero) {
	    txa
	    adc	#24					; ?
	    tax
	}
	jmp	draw_balloon

ESP_talk::
	lda	#MESSAGE_ESP_speak
	if (zero) {
talk::					; x=noid to send it to...
					; @source= text to send
	lda	#MESSAGE_speak
	}
	pha
	movew	#text_line,source
	dec16	source			; backup a char (CAREFUL!)
	ldy	#0
	txa
	sta	y[@source]
	ldx	input_text_length
	inx

	pla
	tay				; speak message (ESP or normal)
	txa
	ldx	actor_noid		; noid (who's talking)
	jsr	send_string
	inc16	source
	jsr	clear_text_line
	lda	#reply_wait_bit
	jmp	wait_for_something	    


putInto::				; a - noid
	ldy	desired_y
	ldx	desired_x
	sta	container
	stx	container_x
	sty	container_y

	lda	in_hand_noid
	beq	put_fail
	jsr	get_subject_object
	ldy	#OBJECT_orientation
	lda	y[@subject_object]
	and	#1
	sta	obj_orient

	lda	#4			; 4 data bytes in message
	ldy	#MESSAGE_put
	ldx	in_hand_noid
	jsr	send_arguments		; tell host we are dropping this
	lda	#reply_wait_bit
	jsr	wait_for_something

	ldy	#0
	lda	y[@response_data]
	if (zero) {
put_fail:
	    jmp	beep
	}				; FAIL!
	iny
	lda	y[@response_data]
	tay				; where host said to put (y)
	ldx	container_x
	lda	container
	jmp	change_containers

get_subject_object::
	sta	subject_noid
	lGetObjectADDR	subject_noid,subject_object
	ldy	#OBJECT_class_pointer
	lda	y[@subject_object]
	sta	class
	lGetClassADDR	class,subject_class
	ldy	#CLASS_capacity
	lda	y[@subject_class]
	clc
	adc	#OBJECT_contents
	sta	subject_variables_offset
	rts

new_container_x:	block	1
new_container_y:	block	1
was_contained_by:	block	1
was_container_y:	block	1
container_noid:		block	1

define	container_object	=	temp_var_1
define	destin_class		=	temp_var_2

change_containers::		; move subject_object into new container
	sta	container_noid	; a - container x,y - new position
	stx	new_container_x
	sty	new_container_y
	jsr	get_object_class		; NEW
	sty	destin_class			; 

	lda	subject_noid			; just in case we try to
	if (zero) {				; drop the region
	    jmp	beep
	}
	moveb	#2, background_render		; re-render, no color

	ldy	#CLASS_flags			;
	lda	y[@temp_var_8]			; 
	if (minus) {				; Avatar Hand
	    ldx	destin_class			; and Head
	    cpx	#class_avatar			; Special
	    if (equal) {			; Case...
		ldx	new_container_y		; Make the Minus
		cpx	#AVATAR_HAND		; a Plus (locally)
		bcs	pretend_its_open	; 
	    }					; 
	    ldy	subject_noid			; 
	    jsr	unreff_resources		; to non-display
	} else {				; 'display' container
pretend_its_open:				; 
		lda	destin_class		; 
		if (!zero) {			; 
		    lda	subject_noid		; 
		    jsr	load_all_resources	; to display (moves mem!)
		}
	}					; END NEW

	lda	subject_noid
	jsr	get_subject_object		; recover pointers

	ldy	#OBJECT_contained_by
	lda	y[@subject_object]
	sta	was_contained_by		; where WAS this?
	lda	container_noid
	sta	y[@subject_object]		; new container

	ldy	#OBJECT_container_offset
	lda	y[@subject_object]
	sta	was_container_y			; What WAS its offset?
	lda	new_container_y
	sta	y[@subject_object]		; new offset (or y)

	ldy	#Object_x_position
	lda	new_container_x
	sta	y[@subject_object]		; new x

	ldy	container_noid
	if (!zero) {			;dont add to REGION contents list
	    fGetObjectAddr	container_object
	    lda	#OBJECT_contents
	    clc
	    adc	new_container_y
	    tay
	    lda	subject_noid
	    sta	y[@container_object]	; put 'in' contents list
	}

	ldy	was_contained_by	; dont remove from REGION cl
	if (!zero) {
	    fGetObjectADDR	container_object
	    lda	#OBJECT_contents
	    clc
	    adc	was_container_y
	    tay
	    lda	#0
	    sta	y[@container_object]	; remove from old container
	}
		
	rts

set_actor_chore::
	jmp	set_chore

beep_or_boing::				; a = failure code
	cmp	#SUCCESS_VALUE		; 0 - 1 = -1 (carry_clear = beep)
	bcc	beep			; 2 - 1 = 1 (carry_set = boing)
boing::
	lda	#1
	ldy	#0
	jmp	do_a_sound
beep::
	lda	#0
	tay
	jmp	do_a_sound

depends::
	moveb	pointed_noid, subject_noid
	movew	pointed_object, subject_object
	movew	pointed_class, subject_class
	moveb	pointed_variables_offset, subject_variables_offset

	lda	in_hand_noid
	if (zero) {
		moveb	actor_noid, pointed_noid
		movew	actor_object, pointed_object
		movew	actor_class, pointed_class
		moveb	actor_variables_offset, pointed_variables_offset
	} else {
		moveb	in_hand_noid, pointed_noid
		movew	in_hand_object, pointed_object
		movew	in_hand_class, pointed_class
		moveb	in_hand_variables_offset, pointed_variables_offset
	}
	lda #1					; ACTION_RDO
	jsr issue_nested_command
	rts

delete_object::
	sta	delete_object_noid
	jsr	purge_contents		; if it has any
	moveb	subject_noid, hold_subject_object
	lda	delete_object_noid
	jsr	get_subject_object
	lda	#0			; x & y useless anyway
	jsr	change_containers	; move it to region so we can delete
	lda	hold_subject_object
	jsr	get_subject_object	; recover
	ldy	delete_object_noid
	jmp	UnCreate_object		; throw it away

region_change::
	lda	me_noid
	sta	actor_noid
	jsr	set_up_actor_pointers

	ldx	desired_x
	ldy	#direction_up			; default

	lda	cursor_y
	cmp	#cursor_bottom_bound - 3
	if (gt) {
	    moveb	#cursor_bottom_bound - 2, cursor_y
	    ldy		#direction_down
	}

	cpx	#0
	if (equal) {
	    inc		cursor_x
	    ldy		#direction_left
	}
	cpx	#160
	if (equal) {
	    dec		cursor_x
	    ldy		#direction_right
	}
	tya
	sta	new_region_flag
	jsr	update_cursor
	jsr	set_up_pointed_pointers
	lda	#command_go
	jsr	issue_nested_command
	lda	new_region_flag
	ldy	go_success
	if (zero) {
	    jmp		beep
	}

GoToNewRegion::
	ldy	prevent_region_trans		; something block this?
	if (!zero) {				; 6.3 added for rdo's.
	    rts
	}
	sta	NewRegionDirection

	lda	me_noid				; 6.4
	sta	actor_noid			; 
	sta	waitfor_noid			; 
	jsr	set_up_actor_pointers		; 

	moveb	pointed_noid, NewRegionDirection+1
	lda	#2			; 1 data byte
	ldx	actor_noid
	ldy	#MESSAGE_newregion
	jsr	send_arguments

	lda	#reply_wait_bit+animation_wait_bit
	ldy	actor_noid
	cpy	#ghost_noid
	if (equal) {
	    lda	#reply_wait_bit
	}
	jsr	wait_for_something	; wait for host to say yea or nay!

	lda	#0xff
	sta	new_region_flag
	ldy	#0
	lda	y[@response_data]
	cmp	#SUCCESS_VALUE
	if (!equal) {jmp beep_or_boing}			; fail!
	jmp	wait_for_region

pick_from_container::
	jsr	send_SS_and_wait
	lda	#normal_cursor
	jsr	set_cursor_state		; for pointing
	lda	cursor_x
	pha
	lda	cursor_y
	pha
	tsx					; incase images alloc
	stx	saved_stack_position		; fails..clean up!
;	dec	nak_everything			; drop packets on floor
	moveb	subject_noid, hold_subject_noid
	moveb	pointed_noid, display_contents_noid
	jsr	get_good_stuff
	cpx	#class_avatar
	if (equal) {
	    lda	#5
	}
	tay					; save cap in y
	clearb	pointed_noid
	lda	#OBJECT_contents
	bump	object_ptr1
	dey
	sty	highest_to_display		; for pick.m
	do {
	    lda	y[@object_ptr1]
	    sta	y[region_contents_list]
	    dey
	} while (plus)
display_some_contents:
	movew	#region_contents_list, contents_list
	ldy	highest_to_display
	iny
	jsr	get_images			; get images from htd down
				; IF THIS FAILS, see get_images_failed
let_user_pick:
	movew	#one_minute/2, vblank_timer	; start timer
	do {
	    lda	vblank_timer+1			; TIMEOUT? (for protocol)
	    if (!zero) {
		jsr	maintain_frame
		bit	trigger_is_pressed
	    }
	} while (minus)
	moveb	who_am_i, actor_noid
	moveb	hold_subject_noid, subject_noid
	jsr	recover_stuff
	jsr	update_cursor

	movew	#region_contents_list, contents_list
	ldy	highest_to_display
	sty	counter				; remove 'used' images
	do {
	    lda	y[@contents_list]
	    if (!zero) {
		tay
		jsr	unreff_resources
	    }
	    dec	counter
	    ldy	counter
	    cpy	lowest_to_display
	} while (!equal)

	lda	pointed_noid			; what did user point at?
	if (zero) {				; nothing?
	    lda	lowest_to_display		; any more to display?
	    if (plus) {				; YES!
		sta	highest_to_display
		jmp	display_some_contents	; a contains new top limit
	    }
	}
really_too_full:
	clearb	display_contents_noid
	jsr	send_SG				; host! Hello!
	pla
	sta	cursor_y
	pla
	sta	cursor_x
	lda	pointed_noid
	rts

get_images_failed::				; alloc comes here if fail
	lda	highest_to_display
	cmp	lowest_to_display
	beq	really_too_full
	jmp	let_user_pick

textline_printf::
	moveb	#0x00, balloon_flag	
	movew	#text_line, destination			; work string
	jmp	printf_start
balloon_printf::
	moveb	#0xff, balloon_flag
	movew	#balloon_work_area_2, destination		; work string
printf_start:
	clc
	pla
	adc	#1
	sta	source
	pla
	adc	#0
	sta	source+1		; data starts just after 'jsr'
	clearb	in_counter
	sta	out_counter
	sta	parameter_counter
	do {
	    ldy	in_counter
	    lda	y[@source]
	    cmp	#'@'
	    if (equal) {
		jsr	insert_string_here
		dec	out_counter
	    } else {
		cmp	#'#'
		if (equal) {
		    jsr	insert_number_here
		    dec	out_counter
		} else {
		    ldy	out_counter
		    sta	y[@destination]
		    inc	out_counter
		    cmp	#0		; done inputing?
		    beq	printf_ready
		}
	    }
	    inc	in_counter
	} while (plus)			; up to 128 bytes
printf_ready:
	clc
	lda	source
	adc	in_counter
	sta	in_counter		; save
	lda	source+1
	adc	#0
	pha
	lda	in_counter		; restore
	pha				; fix-a the stack-a
	movew	destination,source	; set up for balloons
	lda	balloon_flag
	if (!zero) {
	    jsr	balloonMessage		; actor_noid used for position
	}
	rts

insert_string_here:
	jsr	get_parameters
	clearb	loop_counter
	do {
	    ldy	loop_counter
	    lda	y[@length]
	    ldy	out_counter
	    sta	y[@destination]
	    inc	out_counter
	    inc	loop_counter
	    cmp	#0
	} while (!zero)
	rts

insert_number_here:
	jsr	get_parameters
	moveb	#4,precision			; size
	movew	length,c_value_ptr		; where value is
	addwwb	print_ptr, destination, out_counter	; where to put
	jsr	decimal
	tya
	sec
	adc	out_counter
	sta	out_counter			; adjust output
	rts
	
get_parameters:
	ldx	parameter_counter
	lda	x[printf_parameters]
	sta	length
	inx
	lda	x[printf_parameters]
	sta	length+1
	inx
	stx	parameter_counter
	rts

select_denomination::
	jsr	clear_text_line
	jsr	textline_printf
	string	"Available: #, Choose amount: "
	jsr	wait_for_text_string
	addwwb	source, #text_line-1, out_counter	; where is number?
	clearw	select_value
	jsr	convert_decimal
	if (!carry) {					; valid?
	    movew	destination, select_value
	}
	jsr	clear_text_line
	lda	#0
	cmp	select_value
	if (equal) {
	    cmp	select_value+1
	}				; set zero flag based on input
	rts

get_ESP_text::
	jsr	clear_text_line
	jsr	textline_printf
	string	"ESP:"
;	jmp	wait_for_text_string
wait_for_text_string::
	dec	flashing
	ldx	out_counter
	dex
	lda	#blank_char
	sta	x[text_line]
	dex					; ff
	stx	text_cursor
	stx	text_left_hand_bound
	ldx	text_cursor
	jsr	display_text_line
	inc	awaiting_text_input		; wait for user to type
	moveb	actor_noid, waitfor_noid
	moveb	subject_noid, hold_subject_noid
	do {
	    jsr	maintain_frame
	    lda	awaiting_text_input
	} while (!zero)
	movew	#text_line, source
	inc	flashing
	moveb	#0xff,text_left_hand_bound		; allow normal text
	moveb	waitfor_noid, actor_noid
	moveb	hold_subject_noid,subject_noid
	jmp	recover_stuff

define	left_facing		=	0b00000001
define	right_facing		=	0b00000000

face_cursor::
	lda	command_selected
	pha
	moveb	#0xff,command_selected
	sta	in_face_cursor
	lda	arguments
	pha
	ldy	#OBJECT_contained_by
	lda	y[@actor_object]
	if (equal) {
		ldy	#OBJECT_orientation
		lda	y[@actor_object]
		and	#0b00000011			; facing
		tax
		ldy	#OBJECT_x_position
		lda	y[@actor_object]
		ldy	#OBJECT_orientation
		cmp	face_cursor_x
		if (lt) {
		    moveb	#right, walk_how	; on arrival
		    cpx	#right_facing
		    if (!equal) {
			lda	in_hand_noid
			if (!zero) {
				lda	y[@in_hand_object]
				and	#0xfe		; set orient right
				sta	y[@in_hand_object]
			}
			lda	#AV_ACT_face_right
			jsr	change_facing
		    }
		} else {
		    moveb	#left, walk_how		; on arrival
		    cpx	#left_facing
		    if (!equal) {
			lda	in_hand_noid
			if (!zero) {
				lda	y[@in_hand_object]
				ora	#0x01		; set orient left
				sta	y[@in_hand_object]
			}
			lda	#AV_ACT_face_left
			jsr	change_facing
		    }
		}
	}
	inc	in_face_cursor
	pla
	sta	arguments
	pla
	sta	command_selected
	rts					; do nothing

punt_if_not_adjacent::
	jsr	adjacency_check
	if (!carry) {
	    rts				; adjacent, go back
	}
	pla
	pla				; fixo the stacko Spocko
	jmp	depends

define	adj_save_y	=	temp_var_8

adjacency_check::				; carry = not adjacent
	jsr	find_goto_coords		; find container
	sty	adj_save_y
	txa
	ldy	#OBJECT_x_position		; !carry = adjacent
	cmp	y[@actor_object]
	if (equal) {
	    iny
	    lda	adj_save_y
	    ora	#0x80
	    sec
	    sbc	y[@actor_object]
	    and	#0x7f
	    if (zero) {
		clc
		rts
	    }
	}
not_adjacent:
	sec
	rts

spend::
; a = price_hi
; y = price_lo
; x = buyer noid
	sta	temp_word+1			; Save the price
	sty	temp_word
	stx	actor_noid			; Make buyer the actor
	jsr	set_up_actor_pointers
	lda	#AV_ACT_operate			; Operate the machine
	jsr	set_actor_chore
	jsr	ASYNC_animation_wait		; Wait for animation to end
	lda	#AV_ACT_hand_back		; Finish up animation
	jsr	set_actor_chore

	ldy	#TOKENS_denomination		; Get size of coin in hand
	lda	y[@in_hand_object]
	sec					; Subtract price
	sbc	temp_word
	sta	y[@in_hand_object]		; Save new denomination
	iny
	lda	y[@in_hand_object]
	sbc	temp_word+1
	sta	y[@in_hand_object]		; 16 bits of it!

	ldy	#TOKENS_denomination		; Get size of coin in hand
	lda	y[@in_hand_object]
	if (zero) {				; If coin is all used up...
		iny
		lda	y[@in_hand_object]
		if (zero) {
			lda in_hand_noid		; Nuke the sucker!
			jsr delete_object
		}
	}

	rts

define	left_side	=	temp_var_7
define	right_side	=	temp_var_7+1

find_goto_coords::
	ldy	pointed_noid

get_furniture_xy::
	sty	object_noid
	fGetObjectaddr	object_address

find_goto_alt_entry::
	do {
	    ldy	#OBJECT_contained_by
	    lda	y[@object_address]
	    if (!zero) {
	    	sta	object_noid
		tay
		fGetObjectaddr	object_address
	    }
	} while (!zero)				; until we found outtermost
	lda	object_noid
	jmp	get_object_walk_xy		; ask object for coords

define	fiddle_offset		=	temp_var_1
define	fiddle_object		=	temp_var_2
define	fiddle_count		=	temp_var_3
define	fiddle_save_y		=	temp_var_4

fiddle_with_object::
	ldy	#0
more_fiddle:
	sty	fiddle_save_y
	lda	y[@response_data]	; object
	beq	fiddle_exit		; no more things to fiddle
	sta	fiddle_object
	tay
	fGetObjectAddr object_address
	ldy	fiddle_save_y
	iny
	lda	y[@response_data]	; where (offset)
	sta	fiddle_offset
	iny
	lda	y[@response_data]	; count
	sta	fiddle_count

	do {
	    iny
	    sty	fiddle_save_y
	    lda	y[@response_data]	; what value
	    ldy	fiddle_offset
	    sta	y[@object_address]
	    cpy	#OBJECT_animation_state
	    if (equal) {
		ldy	#OBJECT_wait_state
		lda	y[@object_address]
		ora	#animation_init_flag
		sta	y[@object_address]
		jsr	is_object_in_opaque_container
		if (zero) {				; no, do animation
		    ldy	fiddle_object
		    jsr	start_animation	; iff appropriate
		}
	    }
	    ldy	fiddle_save_y
	    inc	fiddle_offset
	    dec	fiddle_count
	} while (!zero)
	iny
	bne	more_fiddle

fiddle_exit:
	moveb	#2, background_render	; re-render, no color
	rts

change_lighting::			; from host
	ldy	#0
	lda	y[@response_data]
change_light_level::			; a: value to add to level
	clc
	adc	light_level
	sta	light_level
	eor	old_light_level		;  check to re-render
	and	#0b10000000
	if (!zero) {
	    lda	light_level
	    sta	old_light_level
	    if (minus) {
		ldx	#0
	    } else {
		ldx	player_color
	    }
;	    lda	graphics_mode
;	    cmp	#1				; (text mode)
;	    beq	c_l_l_exit			; not bitmap?? Hang it up! 6.2
	    moveb	#1,background_render	; start by drawing background
	    jsr		set_player_color
	}
;c_l_l_exit:
	rts

all_sfx_off::
	bank_io_in
	clearb	sfx_voices_active		; gate voices off
	sta	0xd404
	sta	0xd40b
	sta	0xd412				; release all voices
	bank_io_out
play_music::
	rts
	
find_talker_number::
	ldy	#0
	do {
	    cmp	y[talker_color_table]
	    beq	find_talker_exit
	    iny
	    cpy	#6
	} while (!equal)
	ldy	#0xff
find_talker_exit:
	rts

send_SS_and_wait::
	jsr	send_ss
	do {
	    lda	got_ss_packet
	} while (zero)				; wait for host to say OK!
	rts

toggle_walking_music::
	lda	region_trans_sound_toggle
	eor	#0x80
	sta	region_trans_sound_toggle
	sta	region_trans_type	; default back to walk
	rts
