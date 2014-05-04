;
;	Routines used during development!
;

	include "../Bin/class_equates.m"

	define	heap_use		= temp_var_1
	define	mem_table		= temp_var_2

	define	west_to_south		= temp_var_3
	define	lcount			= temp_var_3+1
	define	region_exists		= temp_var_4
	define	label_color		= temp_var_4+1


;****************************************
;	things to be called each frame
;****************************************
once_per_frame::
	jsr	test_text			; display important numbers
	jsr	sun_control			; test for outside commands
	jsr	trap_control
	jsr	cursor_on_bounds
	rts

;****************************************
;	Move cursor around map screen
;****************************************
cursor_on_bounds:
	lda	realm_mode
	if (!equal) {
		ldy	#0

		lda	cursor_x
		ldx	stick_is_left
		if (equal) {
			iny
			sec
			sbc	#8
		}
		ldx	stick_is_right
		if (equal) {
			iny
			clc
			adc	#8
		}
		and	#0b11111000
		sta	cursor_x

		lda	cursor_y
		ldx	stick_is_up
		if (equal) {
			iny
			sec
			sbc	#8
		}
		ldx	stick_is_down
		if (equal) {
			iny
			clc
			adc	#8
		}
		and	#0b11111000
		sta	cursor_y

		cpy	#0			; no movement this turn
		if (equal) {
			lda	tested
			if (equal) {
				jsr	pick_test_object
				moveb	#1,tested
			}
		} else {
			clearb	tested
		}

		bank_io_in
		jsr	move_cursor_sprites
		bank_io_out
	}
	rts

tested:	byte	0


;****************************************
;	display zone information
;****************************************
zone_display:
	ldx	#119
	lda	#0
	do {
		sta	x[text_ram_1+4*40]
		dex
	} while (plus)

	ldx	test_object
	jsr	get_object_address

	ldy	#OBJECT_class_pointer			; if not pointing at
	lda	y[@object_address]			; zone, just return
	cmp	#class_zone
	bne	zexit

	ldx	#40+15					; display center zone
	lda	#color_blue
	jsr	display_region_name

	lda	#3
	sta	west_to_south
	do {
		ldx	test_object
		jsr	get_object_address

		lda	west_to_south			; circle around center
		clc
		adc	#zone_west
		tay
		lda	y[@object_address]		; if connections
		if (!zero) {
			tax
			jsr	get_object_address
			ldy	west_to_south
			ldx	y[label_location]
			lda	#color_peach
			jsr	display_region_name
		}

		dec	west_to_south
	} while (plus)
zexit:	rts


label_location:	byte	15, 40+28, 80+15, 40+2		; , 40+15

display_region_name:
	sta	label_color
	ldy	#ZONE_name
	moveb	#9,lcount
	do {
		lda	y[@object_address]
		sta	x[text_ram_1+4*40]

		bank_io_in
		lda	label_color
		sta	x[color_ram+4*40]
		bank_io_out

		iny
		inx
		dec	lcount
	} while (plus)
drexit:	rts


;****************************************
;	Control region editor from sun
;****************************************
sun_control:
	ldy	key_override			; SEND COMMANDS FROM SUN!
	beq	drexit

	clearb	key_override
	sta	text_insert_mode
	sta	trap_mode
	sta	detach_from_stick		; stick moves again!

	cpy	#1				; create an object
	if (equal) {
		jsr	empty_fake_state_bytes
fake_create_object::
		lda	cursor_x
		sec
		sbc	#6
		and	#0b11111000
		sta	fake_x			; cursor_screen_x
		lda	cursor_y
		sec
		sbc	#231
		eor	#0x7f
		ldy	Realm_mode		; create realms in background
		if (!equal) {
			and	#0x7f
		}
		sta	fake_y			; cursor_screen_y

		lda	fake_class			; don't create a zone
		cmp	#class_zone			; where a zone already
		if (equal) {				; exists!
			ldx	#0
			do {
				jsr	get_object_address
				lda	fake_x
				ldy	#OBJECT_x_position
				cmp	y[@object_address]
				if (equal) {
					lda	fake_y
					ldy	#OBJECT_y_position
					cmp	y[@object_address]
					if (equal) {
						jmp	beep
					}
				}
				dex
			} until (equal)
		}

		jsr	fake_hereis
		jmp	set_touch_pointers
	}

	cpy	#2				; create cv
	if (equal) {
		jsr	clear_back_drop
		jmp	build_cv
	}

	cpy	#3				; load & draw new region
	if (equal) {
		clearb	region_is_ready
		jmp	nuke_region
	}

;;	cpy	#4				; change an object's
;;	if (equal) {				; color/x/y/state
;;			
;;		ldx	test_object		; setup object address
;;		if (equal) {			; no object 0!
;;			jmp	boing
;;		}
;;		ldy	x[object_table_hi]
;;		if (equal) {			; only if exists!
;;			jmp	boing
;;		}
;;		sty	test_object_address+1
;;		ldy	x[object_table_lo]
;;		sty	test_object_address
;;
;;		ldy	#OBJECT_class_pointer	; only if same
;;		lda	fake_class		; class!?!
;;		cmp	y[@test_object_address]
;;		if (!equal) {
;;			jmp	boing
;;		}
;;
;;		ldy	#OBJECT_x_position
;;		lda	fake_x
;;		sta	y[@test_object_address]
;;		ldy	#OBJECT_y_position
;;		lda	fake_y
;;		sta	y[@test_object_address]
;;
;;		ldy	#OBJECT_orientation
;;		lda	fake_orient
;;		sta	y[@test_object_address]
;;
;;		lda	fake_gr_init
;;		ldx	test_object
;;		jsr	init_state_animation
;;		clearb	change_background_object	; don't draw
;;		jmp	redraw				; render scrn
;;	}

;;	cpy	#5					; exercise balloon-o-
;;	if (equal) {					; matic
;;		movew	#temp_buffer,source
;;		moveb	bcolor,	color
;;		ldx	xget
;;		jsr	draw_balloon
;;	}
	rts

;;key_override:	byte	0


;; bcolor:	block	1
;; xget:	block	1
;; temp_buffer:	block	120				; for balloon-o-matic



;****************************************
;	Control size of trapazoids
;****************************************
trap_control:
	lda	trap_mode			; if editing trap
	if (!equal) {
		lda	trap_function_key_number
		cmp	#4			; only keys 0-3
		bcs	dexit
;		clc
		adc	#TRAP_parameters	; horiz info
		tay
		lda	#0
		sec
		sbc	stick_is_left
		clc
		adc	y[@test_object_address]
		clc
		adc	stick_is_right
		sta	y[@test_object_address]

		ldy	#TRAP_parameters+4		; vert size
		lda	#0
		sec
		sbc	stick_is_down
		clc
		adc	y[@test_object_address]
		clc
		adc	stick_is_up
;		if (plus) {
			sta	y[@test_object_address]
;		}
	}
dexit:	rts


;****************************************
;	reset clock and display # of jiffies
;****************************************
update_clock:
	lda	jiffy_counter
	ldy	#200-3
	jsr	d2char
	clearb	jiffy_counter
	rts

jiffy_counter::		block	1		; inc'd in vblank


;****************************************
;	display development text on screen
;****************************************
test_text::
	jsr	zone_display
	jsr	update_clock
	jsr	display_heap_usage

	ldx	test_object
	jsr	get_object_address

	ldy	#6				; erase class/style loc
	lda	#0
	do {
		sta	y[text_ram_1]
		dey
	} while (plus)

	lda	object_address+1		; object exists?
	if (!equal) {
		ldy	#OBJECT_class_pointer	; display class
		lda	y[@object_address]
		ldy	#0
		jsr	d2char

		lda	fake_style		; style
		ldy	#4
		jsr	d2char
	}

	jsr	display_wall_type		; display if grnd/sky...

	lda	object_x_offset			; display container offset
	ldy	#20
	jsr	d2char
	lda	object_y_offset
	ldy	#24
	jsr	d2char


	lda	test_object
	ldy	#80+0
	jsr	d2char

	ldy	#OBJECT_orientation
	lda	y[@object_address]
	ldy	#80+4
	jsr	d2char

	ldy	#OBJECT_x_position
	lda	y[@object_address]
	ldy	#80+8
	jsr	d2char

	ldy	#OBJECT_y_position
	lda	y[@object_address]
	ldy	#80+12
	jsr	d2char


	ldy	test_object			; address of image!
	jsr	get_image_address

	ldy	#120+0
	lda	prop_address+1
	jsr	d2hex
	lda	prop_address
	jsr	d2hex

	ldy	#OBJECT_animation_state
	lda	y[@object_address]
	ldy	#120+6
	jsr	d2char

	ldy	#OBJECT_contained_by
	lda	y[@object_address]
	ldy	#120+10
	jsr	d2char


	ldy	#36+0
	lda	object_address+1
	jsr	d2hex
	lda	object_address
	jsr	d2hex



;;	lda	pointed_NOID
;;	ldy	#0
;;	jsr	d2char
;;	lda	pointed_at_cel_number
;;	ldy	#4
;;	jsr	d2char
;;	lda	pointed_at_limb
;;	ldy	#9
;;	jsr	d2char


;;	bank_io_in
;;	lda	0xdd00
;;	ldy	#200+0
;;	jsr	d2hex
;;
;;	lda	0xdd02
;;	ldy	#200+4
;;	jsr	d2hex
	rts


;****************************************
;	display type of surface in text window
;****************************************
display_wall_type:
	jsr	get_wall_type
	txa
	asl	a
	asl	a
	clc
	adc	#3
	tay

	ldx	#3
	do {
		lda	y[wall_type]
		sta	x[text_ram_1 + 10]
		dey
		dex
	} while (plus)
	rts

wall_type:
	byte	"SKY "
	byte	"WALL"
	byte	"GRND"
	byte	"NOGO"
	byte	"    "
	byte	"MPTY"


;****************************************
;	change pattern of walls/ground/sky etc.
;****************************************
display_surface_type::
	lda	display_surface
	if (!equal) {
		jsr	get_wall_type
		cpx	#4			; not wall/sky etc.
		if (!equal) {
			lda	x[surf_pat]
			sta	d_wild
		}
	}
	rts


surf_pat:
	byte	0*8		;"SKY "
	byte	3*8		;"WALL"
	byte	6*8		;"GRND"
	byte	4*8		;"NOGO"


;****************************************
;	look at surface and decide if wall/sky/grnd
;****************************************
get_wall_type:
	ldx	#4					; assume not special!
	lda	object_address+1			; object exists?
	if (equal) {
		ldx	#5				; no object!!!
		rts
	}

	ldy	#OBJECT_class_pointer			; get class of
	lda	y[@object_address]			; touched object!

	cmp	#CLASS_sky
	if (equal) {
		ldx	#0
		rts
	}
	cmp	#CLASS_wall
	if (equal) {
		ldx	#1
		rts
	}
	cmp	#CLASS_ground
	if (equal) {
		ldx	#2
		rts
	}

	cmp	#CLASS_trapezoid
	beq	get_type
	cmp	#CLASS_super_trapezoid
	beq	get_type
	cmp	#CLASS_flat
	if (equal) {
get_type:	ldy	#OBJECT_contents		; get type of wall!
		lda	y[@object_address]
		tax
	}
	rts


;****************************************
;	display heap used
;****************************************
display_heap_usage:
	clearb	heap_use
	sta	heap_use+1

	ldx	#0
	do {
		lda	x[class_table_ref]
		and	#0x3f
		if (!equal) {
			ldy	x[class_table_lo]
			lda	x[class_table_hi]
			jsr	mem_add
		}
		lda	x[image_table_ref]
		and	#0x3f
		if (!equal) {
			ldy	x[image_table_lo]
			lda	x[image_table_hi]
			jsr	mem_add
		}
		lda	x[sound_table_ref]
		and	#0x3f
		if (!equal) {
			ldy	x[sound_table_lo]
			lda	x[sound_table_hi]
			jsr	mem_add
		}
		lda	x[action_table_ref]
		and	#0x3f
		if (!equal) {
			ldy	x[action_table_lo]
			lda	x[action_table_hi]
			jsr	mem_add
		}
		lda	x[object_table_hi]
		if (!equal) {
			ldy	x[object_table_lo]
			jsr	mem_add
		}
		dex
	} until (equal)


	lda	heap_use+1			; heap usage
	ldy	#120+26
	jsr	d2hex
	lda	heap_use
	jsr	d2hex


	lda	#0				; # of objects
	tax
	do {
		clc
		adc	x[image_table_ref]
		dex
	} until (equal)

	ldy	#120+31
	jsr	d2char
	rts

mem_add:
	sty	mem_table			; y passed low addr
	sta	mem_table+1			; a passed high addr

	ldy	#0
	lda	y[@mem_table]
	clc
	adc	heap_use
	sta	heap_use
	iny
	lda	y[@mem_table]
	adc	heap_use+1
	sta	heap_use+1
	rts

;****************************************
;	display value in A at Y in HEX
;****************************************
d2hex::
	pha
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	tax
	lda	x[hex]
	sta	y[text_ram_1]
	iny
	pla
	and	#0x0f
	tax
	lda	x[hex]
	sta	y[text_ram_1]
	iny
itexit:	rts

hex:	byte	"0123456789abcdef"



;****************************************
;	display value between 0-255
;****************************************
d2char::
	ldx	#0x30-1
	sec
dloop43:
	inx
	sbc	#100
	bcs	dloop43
	adc	#100
	pha
	txa
	sta	y[text_ram_1]
	pla

	ldx	#0x30-1
	sec
dloop44:
	inx
	sbc	#10
	bcs	dloop44
	adc	#0x30+10
	sta	y[text_ram_1+2]
	txa
	sta	y[text_ram_1+1]
	rts



;****************************************
;	change how object held 0-4
;****************************************
change_how_held::
	rts

;;	ldy	avatar_held_object
;;	jsr	get_image_address
;;
;;	ldy	#0
;;	lda	y[@prop_address]
;;	clc
;;	adc	#0b00100000
;;	sta	y[@prop_address]
;;
;;	lda	#2				; display walking state
;;	ora	#0x80				; add 128 to all tests
;;	jmp	force_set_chore


;; ;****************************************
;; ;	return random in A
;; ;****************************************
;; get_random::
;;	lda	rand		; get old value into a
;;	lsr	rand		; shift old value one bit right
;;	and	#0x41		; isolate bits 6 and 0 of unshifted old value
;;	clc
;;	adc	#0x7f		; exlusive-nor bit 0 into bit 6
;;	and	#0x40		; isolate bit 6
;;	ora	rand		; or into shifted old value
;;	sta	rand		; new value
;;	rts
;;
;; rand:		byte	0x25


;****************************************
;	pixel fill
;****************************************
;; pixel_fill::
;;	jsr	get_random
;;
;;	tay
;;	lda	#10
;;	sta	y[text_ram_1]
;;	jmp	pixel_fill
;;
;;
;;	clearb	image_control
;;	sta	color_control
;;	moveb	#0b00001000,shape_pattern
;;
;;	jsr	get_random
;;	sta	x1a
;;	sta	x1b
;;	jsr	get_random
;;	and	#0x7f
;;	sta	y1
;;	jsr	dline
;;
;;	jmp	pixel_fill
;;	rts


		

;****************************************
;	test throw routine
;****************************************
;; init_throw::
;; 	lda	me_noid				; who is throwing?
;; 	beq	itexit
;; 	sta	actor_noid
;; 	sta	drawing_which_object		; for setup...
;; 
;; 	lda	cursor_x
;; 	sec
;; 	sbc	#6				; same as cursor_screen_x!
;; 	sta	desired_x
;; 
;; 	lda	cursor_y
;; 	sec
;; 	sbc	#231
;; 	eor	#0xff
;; 	ora	#0x80
;; 	sta	desired_y
;; 
;; 
;; 	ldy	#AVATAR_contents + AVATAR_HAND
;; 	lda	y[@actor_object]		; is he holding an object?
;; 	beq	itexit
;; 	sta	subject_noid
;; 	tax
;; 	clearb	y[@actor_object]
;; 
;; 	jsr	get_object_address
;; 
;; 	ldy	#OBJECT_contained_by		; object no longer
;; 	clearb	y[@object_address]		; contained
;; 
;; 	jmp	throw_it_away
;; 
;; 
;; 
;; ;****************************************
;; ;	test throw routine
;; ;****************************************
;; init_jump::
;; 	lda	me_noid				; who is throwing?
;; 	beq	itexit
;; 	sta	actor_noid
;; 	sta	drawing_which_object		; for setup...
;; 	sta	subject_noid			; obj getting thrown
;; 
;; 	lda	cursor_x
;; 	sec
;; 	sbc	#6				; same as cursor_screen_x!
;; 	sta	desired_x
;; 
;; 	lda	cursor_y
;; 	sec
;; 	sbc	#231
;; 	eor	#0xff
;; 	ora	#0x80
;; 	sta	desired_y
;; 
;; 	ldy	#AVATAR_destination_x
;; 	lda	desired_x
;; 	sta	y[@actor_object]
;; 	ldy	#AVATAR_destination_y
;; 	lda	desired_y
;; 	sta	y[@actor_object]
;; 
;; 	jmp	throw_it_away




;; randomize_pattern::
;;	lda	#0
;;	sta	rcount
;;	do {
;;		lda	clock			; only 256 outcomes?
;;		adc	random2
;;		tax
;;		lda	x[reverse_pixels]
;;		adc	x[image_table_lo]
;;		adc	random2
;;		sta	random2
;;		and	#0x03
;;		tax				; quad position
;;
;;		lda	random2			; pattern #
;;		lsr	a
;;		lsr	a
;;		and	#3
;;		tay
;;		lda	y[color_tab]
;;		and	x[quad_mask]
;;		sta	pat_temp
;;
;;		lda	random2
;;		lsr	a
;;		lsr	a
;;		lsr	a
;;		lsr	a
;;		and	#3
;;		tay
;;
;;		lda	y[cel_patterns]
;;		and	x[quad_and]
;;		ora	pat_temp
;;		sta	y[cel_patterns]
;;
;;		dec	rcount
;;	} while (!equal)
;;	rts

;;quad_mask:	byte	0q3000, 0q0300, 0q0030, 0q0003
;;quad_and:	byte	0q0333, 0q3033, 0q3303, 0q3330
;;
;;random2:	block	1
;;rcount:		block	1
;;pat_temp:	block	1
;;
;;color_tab:
;;	byte	pat_sky
;;	byte	pat_sky
;;	byte	pat_black
;;	byte	pat_pink


;****************************************
;	sets bits for connectors/orientation
;****************************************
set_zone_image_state::

	ldy	#OBJECT_class_pointer		; Variable trap object!
	lda	y[@object_address]
	cmp	#class_zone
	bne	sexit

	clearb	bitpat
	ldx	#3
	ldy	#ZONE_west+3
	do {
		lda	y[@object_address]
		if (!zero) {
			lda	bitpat
			ora	x[bits_to_set]
			sta	bitpat
		}
		dey
		dex
	} while (plus)

	ldy	#4				; cels to draw
	lda	bitpat
	ora	#0b00010000
	sta	y[@prop_address]

sexit:	rts

bits_to_set:	byte	0b00000010, 0b00000100, 0b00001000, 0b00000001
bitpat:		block	1
