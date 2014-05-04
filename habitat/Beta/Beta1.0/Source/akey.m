;****************************************
;	Aric's keyboard kludge
;****************************************

	define	object_exists	= test_object_address+1


	include "../Bin/class_equates.m"


akey::
	sta	a_text_char			; key pressed
	clearb	exit_flag

	jsr	get_test_object			; get test_object_address

	ldx	#0				; is the object a sign?
	ldy	#OBJECT_class_pointer
	lda	y[@test_object_address]
	cmp	#class_short_sign
	if (equal) { inx }
	cmp	#class_sign
	if (equal) { inx }
	stx	obj_sign

	ldx	#0				; is the object a trap?
	cmp	#CLASS_trapezoid
	if (equal) { inx }
	cmp	#CLASS_super_trapezoid
	if (equal) { inx }
	stx	obj_trap


;****************************************
;	Keyboard controls!
;****************************************
	lda	a_text_char				; test for funct keys
	cmp	#0x12
	if (carry) {
		cmp	#0x1a
		if (!carry) {
			sec
			sbc	#0x12
			sta	function_key_number
			sta	trap_function_key_number
			rts
		}
	}

	cmp	#start_text			; Toggle into text mode!
	if (equal) {
		ldy	#OBJECT_class_pointer
		lda	y[@test_object_address]
		cmp	#class_zone
		beq	t_on

		lda	obj_sign
		if (!zero) {
t_on:			clearb	graphic_chars		; special chars off!

			lda	text_insert_mode
			eor	#1
			sta	text_insert_mode
			jsr	change_border_color

			lda	text_insert_mode	; if into text mode!
			if (!equal) {
				moveb	#OBJECT_text_start,text_position
			}
			rts
		}
		jmp	beep				; beep if not sign
	}

	ldy	text_insert_mode			; if text mode, insert
	if (!equal) {
		jmp	insert_text
	}


	cmp	#shift_plus				; next object
	if (equal) {
		inc	test_object
		jmp	set_touch_pointers
	}

	cmp	#shift_minus				; prev object
	if (equal) {
		dec	test_object
		jmp	set_touch_pointers
	}


	cmp	#'R'
	if (equal) {				; Realm Mode
		lda	Realm_mode
		eor	#1
		sta	Realm_mode
		sta	detach_from_stick	; no joystick movement
		tax
		if (equal) {
			ldx	#color_pink
		}
		jsr	set_player_color
		rts
	}


	ldy	realm_mode				; Realm mode!
	if (!equal) {
		jmp	CREATE_REALM
	}


	cmp	#'t'				; pick test object
	if (equal) {
pick_test_object::
		jsr	update_cursor
		moveb	pointed_noid,test_object
		clearb	pointed_NOID
		sta	trap_mode
		jmp	set_touch_pointers
	}


	cmp	#'w'				; Walk to pointed object
	if (equal) {
		lda	test_object		; is object there?
		beq	bexit
		jsr	get_object_walk_xy	; returns A,X,Y
		jmp	start_walk
	}


	cmp	#'B'
	if (equal) {				; border/unborder traps
		lda	obj_trap
		if (!zero) {
			ldy	#TRAP_parameters+4		; vert size
			lda	y[@test_object_address]
			eor	#0x80				; set high bit
			jmp	obj_exit
		}
bexit:		jmp	beep
	}



	cmp	#'m'
	if (equal) {				; change type of flat (grnd...
		lda	obj_trap		; trap or super trap
		bne	chg_wall
		ldy	#OBJECT_class_pointer
		lda	y[@test_object_address]
		cmp	#CLASS_flat
		if (equal) {
chg_wall:		ldy	#TRAP_type		; of wall!
			lda	y[@test_object_address]
			clc
			adc	#1
			and	#3
			jmp	obj_exit
		}
		jmp	beep
	}


;;	cmp	#'Q'
;;	if (equal) {
;;		jmp	randomize_pattern
;;	}

;;	cmp	#'h'
;;	if (equal) {
;;		jmp	init_throw
;;	}

;;	cmp	#'j'
;;	if (equal) {
;;		jmp	init_jump
;;	}


	cmp	#'U'				; select objects 21-40
	if (equal) {
		lda	upper_case
		eor	#20
		sta	upper_case
		rts
	}

	cmp	#'K'				; call customizer!
	if (equal) {
		lda	custom_frame		; only if code still there!
		cmp	#0xa9
		if (equal) {
			jsr	custom_frame
			save_and_bank_IO_in
			ldy	#0
			do {
				lda	#color_blue
				sta	y[color_ram]
				clearb	y[text_ram_1]
				dey
			} until (equal)
			restore_IO
		}
		rts
	}

	cmp	#'E'					; Erase text
	if (equal) {
		lda	obj_sign
		beq	bbeep

		jsr	get_class_address
		ldy	#CLASS_object_length
		lda	y[@class_address]
		tay
		lda	#char_space		; space bar
		do {
			sta	y[@test_object_address]
			dey
			cpy	#OBJECT_text_start
		} while (plus)
		rts
	}

	cmp	#british_pound			; Toggle into trap editor
	if (equal) {
		lda	obj_trap
		if (!zero) {
			lda	trap_mode
			eor	#1
			sta	trap_mode
			sta	detach_from_stick	; no joystick movement

			lda	trap_mode
			if (!equal) {
				lda	#color_sky
			}
			jmp	change_border_color
		}
bbeep:		jmp	beep
	}


	cmp	#'T'				; Twin this object
	if (equal) {
		lda	object_exists		; no object!
		beq	bbeep
		jsr	set_touch_pointers

		jsr	empty_fake_state_bytes

		lda	obj_sign
		bne	copy_state_bytes
		lda	obj_trap
		if (!zero) {
copy_state_bytes:	ldy	#OBJECT_object_length
			lda	y[@test_object_address]
			tay
			dey
			do {
				lda	y[@test_object_address]
				sta	y[fake_state_bytes-generic_object_end]
				dey
				cpy	#generic_object_end-1
			} while (!equal)
		}

		jmp	fake_hereis		; create the object!
	}


	cmp	#char_space			; freeze picture
	if (equal) {
		lda	#0x7f			; lock
		sta	switcher
		rts
	}

	cmp	#'v'				; Build contents vector
	if (equal) {
		jsr	build_cv
		lda	cv_length+1
		ldy	#3*40+36
		jsr	d2hex
		lda	cv_length
		jmp	d2hex
	}


;;	cmp	#'N'				; Nuke region...rebuild
;;	if (equal) {
;;		jmp	nuke_region
;;	}

	cmp	#'D'				; Delete this object
	if (equal) {
		lda	object_exists
		beq	bbeep

		ldy	#OBJECT_class_pointer	; don't delete class zero
		lda	y[@test_object_address]
		beq	bbeep

		lda	test_object
		jsr	delete_object
		clearb	trap_mode
		sta	detach_from_stick	; no joystick movement
		jmp	redraw
	}


	cmp	#'C'				; put test object into this
	if (equal) {				; container
		jsr	update_cursor
		jsr	set_up_pointed_pointers
		lda	pointed_noid
		jsr	get_xy_from_container

		cpy	#0xff
		beq	bbeep
		stx	container_x
		sty	container_y


		ldy	#OBJECT_class_pointer
		lda	y[@pointed_object]
		cmp	#class_avatar
		if (equal) {
			lda	y[@test_object_address]
			cmp	#class_head
			if (equal) {
				moveb	#6,container_y
			}
		}

		lda	test_object
		jsr	get_subject_object

		ldx	container_x
		ldy	container_y
		lda	container
		jsr	change_containers

		clearb	pointed_NOID
		rts
	}


	cmp	#'l'				; look inside container
	if (equal) {
		moveb	#0xff,lowest_to_display

		ldy	#OBJECT_class_pointer
		lda	y[@object_address]
		cmp	#CLASS_avatar
		if (equal) {
			lda	#5		; slots in avatar pouch
		} else {
			ldy	#CLASS_capacity
			lda	y[@class_address]
		}
		sta	highest_to_display

		moveb	test_object,display_contents_noid
		rts
	}


	cmp	#'e'				; erase background
	if (equal) {
		jmp	clear_back_drop
	}

	cmp	#'n'				; night
	if (equal) {
		lda	#255
		sta	light_level
		moveb	#1,background_render		; redraw background
		ldx	#0				; black for pink!
		jmp	set_player_color
	}

set_state:
	cmp	#'s'				; set to state 0
	if (equal) {
		lda	#0			; desired state
		ldx	test_object		; obj num
		jmp	init_state_animation
	}

	cmp	#'S'				; increment animation state
	if (equal) {
		ldy	#OBJECT_animation_state
		lda	y[@test_object_address]
		clc
		adc	#1
		ldx	test_object
		jmp	init_state_animation
	}

	cmp	#'g'				; display floors/wals/grnd/sky
	if (equal) {				; in different patterns
		inc	display_surface
		jmp	redraw
	}


	cmp	#'r'				; redraw background
	if (equal) {

		clearb	display_contents_noid	; draw contents of region
		sta	display_surface
redraw::	jsr	clear_back_drop

		lda	#0
		sta	light_level
		moveb	#1,background_render		; redraw background
		ldx	player_color
		jmp	set_player_color
	}


	cmp	#'i'				; initialize object
	if (equal) {
		ldy	#OBJECT_orientation
		lda	#0
		jsr	obj_exit

		clearb	change_background_object
		jsr	clear_back_drop
		moveb	#1,background_render
		rts
	}


	cmp	#'p'				; change pattern or wild color
	if (equal) {
		ldy	#OBJECT_orientation
		lda	y[@test_object_address]
		clc
		adc	#8
		jmp	obj_exit
	}

	cmp	#'P'				; change pattern or wild color
	if (equal) {
		ldy	#OBJECT_orientation
		lda	y[@test_object_address]
		sec
		sbc	#8
		jmp	obj_exit
	}

	cmp	#'o'				; change orientation
	if (equal) {
		ldy	#OBJECT_orientation
		lda	y[@test_object_address]
		eor	#1
		jmp	obj_exit
	}

	cmp	#'f'				; foreground obj
	if (equal) {
		ldy	#OBJECT_contained_by		; can't move if contai
		lda	y[@test_object_address]
		if (!equal) { jmp beep }

		ldy	#OBJECT_y_position
		lda	y[@test_object_address]
		ora	#0x80
		jmp	obj_exit
	}

	cmp	#'b'				; background obj
	if (equal) {
		ldy	#OBJECT_contained_by		; can't move if contai
		lda	y[@test_object_address]
		if (!equal) { jmp beep }

		ldy	#OBJECT_y_position
		lda	y[@test_object_address]
		and	#0b01111111
		jmp	obj_exit
	}


	cmp	#'.'				; change x pos
	if (equal) {
		ldx	#1
		bne	change_x
	}

	cmp	#','				; change x pos
	if (equal) {
		ldx	#-1
change_x:
		ldy	#OBJECT_contained_by		; can't move if contai
		lda	y[@test_object_address]
		if (!equal) {
			ldy	#0			; change x tables
			jmp	contained
		}

		txa					; actually +-4
		asl	a
		asl	a
		ldy	#OBJECT_x_position
		clc
		adc	y[@test_object_address]
		jmp	obj_exit
	}

	cmp	#'>'				; change y pos
	if (equal) {
		ldx	#-10
		bne	change_y
	}

	cmp	#'?'				; change y pos
	if (equal) {
		ldx	#-1
		bne	change_y
	}

	cmp	#'<'				; change y pos
	if (equal) {
		ldx	#10
		bne	change_y
	}

	cmp	#'/'				; change y pos
	if (equal) {
		ldx	#1

change_y:
		ldy	#OBJECT_contained_by		; can't move if contai
		lda	y[@test_object_address]
		if (!equal) {
			ldy	#1			; change y tables
			jmp	contained
		}

		txa
		eor	#0xff
		clc
		adc	#1
		ldy	#OBJECT_y_position
		adc	y[@test_object_address]
		jmp	obj_exit
	}	


	ldx	#19				; select chore/test object
	do {
		cmp	x[act_string]
		if (equal) {

			ldy	actor_object	; must be set for force_set
			sty	object_address
			ldy	actor_object+1
			sty	object_address+1

			inx
			txa
			clc			; for obj's over 20!
			adc	upper_case
			ora	#0x80
			jmp	force_set_chore

;; temp			sta	test_object	; for Region editor
;;			jsr	set_touch_pointers
;;
;;			clearb	trap_mode
;;			sta	detach_from_stick
;;			jsr	change_border_color
;;
;;			lda	test_object
;;			jmp	test_act
		}
		dex
	} while (plus)
		

	cmp	#'+'				; offset to right
	if (equal) {
		inc	object_x_offset
;;		inc	object_x_offset
;;		inc	object_x_offset
;;		inc	object_x_offset
		rts
	}
	cmp	#'-'				; offset to left
	if (equal) {
		dec	object_x_offset
;;		dec	object_x_offset
;;		dec	object_x_offset
;;		dec	object_x_offset
		rts
	}
	cmp	#'@'				; offset up
	if (equal) {
		inc	object_y_offset
		rts
	}
	cmp	#'*'				; offset down
	if (equal) {
		dec	object_y_offset
		rts
	}

	cmp	#'='				; change how held
	if (equal) {
		jmp	change_how_held
	}

	inc	exit_flag
	rts


;****************************************
;	object contained (maybe by glue!)
;****************************************
contained:
	sty	y_temp
	stx	x_temp
	tax
	jsr	get_object_address
	ldy	#OBJECT_class_pointer
	lda	y[@object_address]
	cmp	#class_glue
	if (equal) {
		ldy	#OBJECT_container_offset	; which slot
		lda	y[@test_object_address]
		asl	a				; * 2
		clc
		adc	#OBJECT_contents+6+3		; loc of x/y table
		adc	y_temp				; x or y slot!
		tay

		lda	x_temp
		clc
		adc	y[@object_address]		; change in glue obj!
		sta	y[@object_address]
;		rts
	}
	jmp	beep


;****************************************
;	common code for value change
;****************************************
obj_exit:
	ldx	test_object
	if (equal) {
		jmp	beep
	}
	ldx	object_exists
	if (equal) {
		jmp	beep
	}
	sta	y[@test_object_address]

	ldy	#OBJECT_contained_by
	lda	y[@test_object_address]
	if (!equal) {
		sta	change_background_object
		rts
	}

	ldy	#OBJECT_y_position
	lda	y[@test_object_address]
	if (plus) {
		moveb	test_object,change_background_object
	}

	ldy	#OBJECT_orientation			; wild color?
	lda	y[@test_object_address]
	if (minus) {
		ldy	test_object			; if color ram changed
		jsr	get_image_address
		ldy	#1
		lda	y[@prop_address]
		if (!equal) {
			moveb	test_object,change_background_object
		}
	}
	rts

;****************************************
;	put test object into test_object_address
;****************************************
get_test_object:
	ldx	test_object			; setup test object address
	ldy	x[object_table_hi]
	sty	test_object_address+1
	ldy	x[object_table_lo]
	sty	test_object_address
	rts


;****************************************
;	setup pointers for 'touched' object
;****************************************
set_touch_pointers::
	jsr	get_test_object

	ldy	#OBJECT_class_pointer		; avatar? or regular object
	lda	y[@test_object_address]
	cmp	#class_avatar
	if (equal) {
		movew	test_object_address,actor_object
		moveb	test_object, me_noid
	}


	ldy	#OBJECT_class_pointer		; update pointers
	lda	y[@test_object_address]
	sta	fake_class

	ldy	#OBJECT_style_pointer
	lda	y[@test_object_address]
	ldx	fake_class			; head hack
	cpx	#127
	if (equal) {
		tax
		lda	x[head_style_list]
	}
	sta	fake_style


	ldy	#OBJECT_x_position
	lda	y[@test_object_address]
	sta	fake_x

	ldy	#OBJECT_y_position
	lda	y[@test_object_address]
	sta	fake_y

	ldy	#OBJECT_orientation
	lda	y[@test_object_address]
	sta	fake_orient

	ldy	#OBJECT_animation_state
	lda	y[@test_object_address]
	sta	fake_gr_init
	rts


;****************************************
;	Put text into signs!
;****************************************
insert_text:
	cmp	#return_key			; turn return into diff return
	if (equal) {
		lda	#sign_char_return_key
	}
	sta	a_text_char

	cmp	#char_delete				; DELETE key
	if (equal) {
		lda	text_position		; don't delete past
		cmp	#OBJECT_text_start	; start of sign!
		if (!equal) {
			dec	text_position
			ldy	text_position
			lda	#char_space	; space bar
			sta	y[@test_object_address]
			rts
		}
terror:		jmp	beep
	}


	ldy	#OBJECT_class_pointer		; if Zone name, only 10 chars
	lda	y[@test_object_address]
	cmp	#class_zone
	if (equal) {
		lda	text_position
		cmp	#zone_name+10
		beq	terror
	}


	ldy	#OBJECT_object_length		; end of sign length?
	lda	y[@test_object_address]
	cmp	text_position
	beq	terror

	lda	a_text_char		; move char to right
	cmp	#cursor_right
	beq	next_char

	cmp	#british_pound		; graphic keys
	if (equal) {
		lda	graphic_chars		; SELECT SPECIAL GRAPHIC CHARS
		clc
		adc	#1
		and	#3
		sta	graphic_chars

		lda	text_insert_mode
		clc
		adc	graphic_chars
		jmp	change_border_color
	}

	lda	a_text_char
	ldy	graphic_chars
	if (!equal) {
		cmp	#'a'		; chars from a to p
		bcc	normal_char
		cmp	#'q'
		bcs	normal_char
		cpy	#1
		if (equal) {		; 0-15
			sec
			sbc	#'a'
		}
		cpy	#2		; 16-31
		if (equal) {
			sec
			sbc	#'a'-16
		}
		cpy	#3
		if (equal) {		; odds and ends!
			sec
			sbc	#'a'
			tay
			lda	y[special_char]
		}
	}

normal_char:
	ldy	text_position		; Add character
	sta	y[@test_object_address]
next_char:
	inc	text_position
	rts


change_border_color:
	tay
	bank_io_in
	sty	0xd020			; border color
	bank_io_out
	rts


empty_fake_state_bytes::
	lda	#0				; empty out state bytes
	ldy	#63
	do {
		sta	y[fake_state_bytes]
		dey
	} while (plus)
	rts


special_char:	byte	 91,92,93,94,95, 96, 123,124,125,126,127, 0,0,0,0,0


MODE::				byte	0		; Region or Realm edit

realm_mode::			byte	0

text_insert_mode::		byte	0
text_position::			byte	0

cursor_blink::			byte	1
graphic_chars:			block	1

trap_mode::			byte	0
function_key_number::		byte	0
trap_function_key_number::	byte	0

a_text_char:			block	1

display_surface::		byte	0
upper_case:			byte	0		; for obj's 21-40

act_string:			byte	"1234567890!\"#$%&'()",shift_0
exit_flag::			block	1

obj_sign:			block	1
obj_trap:			block	1

object_x_offset::		byte	0	; for adjusting hand position
object_y_offset::		byte	0





;****************************************
;	Realm creation utility
;****************************************
Create_realm:
	cmp	#'c'				; create region at cursor loc
	if (equal) {
		lda	#class_zone
		sta	fake_class
		clearb	fake_style
		sta	fake_orient
		sta	fake_gr_init
		ldy	#9
		do {
			moveb	#char_space, y[fake_state_bytes]
			dey
		} while (plus)
		jmp	fake_create_object
	}

	cmp	#'a'				; attach to regions around
	if (equal) {

		ldx	#0
		stx	connect
		do {
			jsr	get_object_address	; region exists?
			lda	object_address+1
			if (!zero) {

				ldy	#OBJECT_x_position
				lda	y[@object_address]
				sec
				sbc	y[@test_object_address]
				sta	x_temp

				ldy	#OBJECT_y_position
				lda	y[@object_address]
				sec
				sbc	y[@test_object_address]
				sta	y_temp


				ldy	#3
				do {
					lda	x_temp
					cmp	y[xc_tab]
					if (equal) {
						lda	y_temp
						cmp	y[yc_tab]
						if (equal) {
						   tya
						   clc
						   adc	#ZONE_west
						   tay
						   txa
						   sta y[@test_object_address]
						   inc	connect
						   jmp	nextx
						}
					}
					dey
				} while (plus)
			}
nextx:			dex
		} while (!zero)
	}

	lda	connect				; if connection made...
	if (!equal) {
		jmp	redraw
	}
	rts

connect:	block	1
xc_tab:		byte	0,  8,  0,  -8
yc_tab:		byte	8,  0,  -8,  0


end_of_objects1:
