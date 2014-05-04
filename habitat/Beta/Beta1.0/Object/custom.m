;****************************************
;	customize your avatar!
;****************************************

	org	customize_hold_area
	target	customize_target			; end of heap


	define	destination_x	= temp_var_2		; from walkto
	define	destination_y	= temp_var_2+1
	define	avatar_x	= temp_var_3
	define	avatar_y	= temp_var_3+1

	define	first_head	= 4			; av,wall,floor,head0


custom_frame::
	moveb	#200,cursor_x
	sta	custom_running
	jsr	init_cust
	clearb	customize_done
	sta	panel_number
	sta	walk_around

	ldx	#1				; avatar is object #1!!!
	lda	x[object_table_lo]
	sta	actor_object
	lda	x[object_table_hi]
	sta	actor_object+1

	jsr	disp_head			;  FRF patch

	do {
		jsr	copy_back_to_screen	; copy backdrop to main screen
		jsr	render			; draw backdrop or foreground
		jsr	switch_pages		; show the finished page
		jsr	customize

		moveb	#0xff,detach_from_stick	; lock cursor!

		ldy	#OBJECT_orientation	; save vars away!
		lda	y[@actor_object]
		sta	av_orient
		ldy	#AVATAR_customize
		lda	y[@actor_object]
		sta	custom1
		iny
		lda	y[@actor_object]
		sta	custom2

		lda	customize_done
	} until (!equal)

	clearb	detach_from_stick		; bring cursor back!
	sta	custom_running
	moveb	#100,cursor_x

	movew	#please_wait,	source
	jsr	draw_balloon_quip


mif (!develop) {
	lda	#5
	ldy	#MESSAGE_customize
	ldx	#0
	jsr	send_arguments

	moveb	#0xff, customize_reply		; FRF start patch
	do {					; wait for host to say OK!
	    jsr	event_handler
	    lda	customize_reply
	} while (minus)
	if (zero) {				; fail!
	    jmp	custom_frame
	}
}
	rts

customize_reply::	byte	0		; FRF end patch

;****************************************
;	vars to return to host!
;****************************************

	define	head_style	= arguments + 0
	define	hair_pattern	= arguments + 1
	define	av_orient	= arguments + 2
	define	custom1		= arguments + 3
	define	custom2		= arguments + 4


customize:
	jsr	display_panels

	lda	walk_around
	if (!equal) {
		jsr	show_off
	}

;****************************************
;	let the player customize!
;****************************************
;	ldy	kb_buffer_pointer		; get key from keyboard!
;	cpy	kb_buffer_end
;	if (equal) {
;		clearb	text_char
;		rts				; no new keys to display
;	}
; 
;	inc	kb_buffer_pointer
;	lda	kb_buffer_pointer
;	and	#(kb_buffer_length - 1)
;	sta	kb_buffer_pointer			; point to next
;	tay
;	lda	y[kb_buffer]
	jsr	read_keyboard
	sta	text_char


change_characteristics:
	cmp	#function_key_1
	if (equal) {				; change sex!
		ldy	#OBJECT_orientation
		lda	y[@actor_object]
		eor	#0x80
		sta	y[@actor_object]
		movew	actor_object,object_address
		ldy	#AVATAR_background_activity	; redraw avatar
		lda	y[@actor_object]
		lda	#AV_ACT_stand
		jmp	force_set_chore
	}

	cmp	#function_key_2			; select head
	if (equal) {
		inc	head_number		; next head selection
disp_head:	lda	head_number
		and	#7
		sta	head_number
		clc
		adc	#first_head		; heads start at object #4
		ldy	#OBJECT_contents + AVATAR_HEAD
		sta	y[@actor_object]

		movew	actor_object,object_address

		ldy	#OBJECT_animation_start		; turn head
		moveb	#0x7f,y[@actor_object]

		ldy	#AVATAR_background_activity	; redraw avatar
		lda	y[@actor_object]
		jsr	force_set_chore
		jmp	set_hair
	}

	cmp	#function_key_3			; change height
	if (equal) {
		ldy	#OBJECT_orientation
		lda	y[@actor_object]
		and	#0b10000111
		sta	x_temp

		lda	y[@actor_object]
		clc
		adc	#16
		and	#0b00111000
		ora	x_temp
		sta	y[@actor_object]
		rts
	}

	cmp	#function_key_4			; walk avatar around
	if (equal) {
		lda	walk_around
		eor	#1
		sta	walk_around

		if (!equal) {			; clear at destination bit
			ldy	#OBJECT_animation_state
			lda	y[@actor_object]
			and	#0b11110001
			ora	#down*2
			sta	y[@actor_object]
			rts
		}

		ldy	#OBJECT_x_position	; stop walk!
		lda	y[@actor_object]
		tax
		iny
		lda	y[@actor_object]

		ldy	#AVATAR_destination_y
		sta	y[@actor_object]
		dey
		txa
		sta	y[@actor_object]
		rts
;;		lda	#AV_ACT_stand_front
;;		jmp	set_chore
	}

	cmp	#function_key_5			; change hair
	if (equal) {
		lda	hair_pattern
hair_add:	clc
		adc	#8
		and	#0x78
		cmp	#0x78
		beq	hair_add
		sta	hair_pattern

set_hair:
		lda	head_number
		clc
		adc	#first_head
		tax
		jsr	get_object_address
		ldy	#OBJECT_orientation
		lda	hair_pattern
		sta	y[@object_address]

		ldy	#OBJECT_style_pointer
		lda	y[@object_address]
		tax
		lda	x[head_style_list]
		sta	head_style
		rts
	}

	cmp	#function_key_6			; change leg pattern
	if (equal) {
		ldy	#AVATAR_customize
leg_add:	lda	y[@actor_object]
		clc
		adc	#16
		sta	y[@actor_object]
		and	#0xf0
		cmp	#0xf0
		beq	leg_add
		rts
	}

	cmp	#function_key_7			; change torso pattern
	if (equal) {
		ldy	#AVATAR_customize
torso_add:	lda	y[@actor_object]
		and	#0xf0
		sta	x_temp
		lda	y[@actor_object]
		clc
		adc	#1
		and	#0x0f
		ora	x_temp
		sta	y[@actor_object]
		and	#0x0f			; wild card?
		cmp	#0x0f
		beq	torso_add
		rts
	}

	cmp	#function_key_8			; change sleeve pattern
	if (equal) {
		ldy	#AVATAR_customize+1
		lda	y[@actor_object]
sleeve_add:	clc
		adc	#16
		and	#0xf0
		cmp	#0xf0
		beq	sleeve_add
		sta	y[@actor_object]
;		rts
	}

	cmp	#'R'				; completely randomize!
	if (equal) {
		jmp	init_cust
	}
	rts


show_off:
	ldy	#OBJECT_animation_end
	lda	y[@actor_object]
	and	#on_my_way
	if (zero) {				; at destination?

		inc	dest_loc		; set next destination!
		lda	dest_loc
		and	#3
		sta	dest_loc
		tay
		ldx	y[dest_x]
		lda	y[dest_y]
		sta	destination_y

		ldy	#OBJECT_y_position
		cmp	y[@actor_object]
		if (!carry) {			; walking down
			lda	#down
		} else {
			ldy	#Object_x_position
			txa
			cmp	y[@actor_object]
			lda	#left
			if (carry) {
				lda	#right
			}
		}
		ldy	destination_y
		jmp	start_walk
	}
shexit:	rts

dest_x:		byte	0x5a,0x35,0x7e,0x11,0x8f,0x18,0x92,0x40
dest_y:		byte	0x8b,0x84,0x9b,0x8c,0x89,0x81,0x99,0x86


;****************************************
;	call the change routines
;****************************************
init_cust::
	clearb	init_count
	do {
		lda	clock			; only 256 outcomes?
		adc	random
		tax
		lda	x[reverse_pixels]
		adc	x[image_table_lo]
		adc	random
		sta	random
		and	#7
		cmp	#3		; no walk
		if (!equal) {
			clc
			adc	#function_key_1
			jsr	change_characteristics
		}
		dec	init_count
	} while (!equal)


	ldy	#OBJECT_orientation	; make sex match head type
	lda	y[@actor_object]
	and	#0x7f
	ldx	head_number
	cpx	#5
	if (carry) {			; heads 0,1,2,3,4 are male
		ora	#0x80		; heads 5,6,7 are female
	}
	sta	y[@actor_object]
	rts



text_char:	block	1
head_number:	block	1

init_count:	block	1
random:		block	1
customize_done:	block	1

walk_around:		byte	0
dest_loc:		byte	0


panel_number:	byte	0
last_panel:	byte	0xff


;****************************************
;	text to support the customization procedure
;****************************************
display_panels:
	lda	panel_number		; if same as last?
	cmp	last_panel

	if (equal) {

		cmp	#4
		if (equal) {
			lda	text_char
			cmp	#'n'
			beq	dec_panel
			cmp	#'N'
			if (equal) {
dec_panel:			dec	panel_number
				jmp	display_a_panel
			}
			cmp	#'y'
			beq	next_panel
			cmp	#'Y'
			beq	next_panel
			rts
		}

		lda	text_char
		cmp	#0x20		; space bar
		if (equal) {
next_panel:		inc	panel_number
		}
		rts
	}

;****************************************
;	display a new panel
;****************************************
display_a_panel:

	lda	panel_number
	cmp	#6			; only 2 screens
	if (equal) {
		inc	customize_done
		rts
	}
	moveb	panel_number,last_panel

	lda	panel_number
	asl	a
	tay
	lda	y[panel_table]
	sta	panel_jmp+1
	lda	y[panel_table+1]
	sta	panel_jmp+2

panel_jmp:
	jmp	0x0000


panel_table:
	word	panel_0
	word	panel_1
	word	panel_2
	word	panel_3
	word	panel_4
	word	panel_5


panel_0:
	jsr	one_black_line
	movew	#intro_0,	source
	jsr	draw_balloon_quip
	movew	#intro_0b,	source
	jsr	draw_balloon_quip
	jmp	instructs

panel_1:
	jsr	one_black_line
	movew	#intro_1,	source
	jsr	draw_balloon_quip
	movew	#intro_1b,	source
	jsr	draw_balloon_quip
	jsr	one_black_line
	jmp	instructs


panel_2:
	movew	#intro_2,	source
	jsr	draw_balloon_quip
	movew	#intro_2b,	source
	jsr	draw_balloon_quip
	jsr	one_black_line
	jmp	instructs

panel_3:
	jsr	one_black_line

	movew	#intro_3,	source
	jsr	draw_balloon_quip
	movew	#intro_3b,	source
	jsr	draw_balloon_quip
	movew	#intro_3c,	source
	jsr	draw_balloon_quip
	movew	#intro_3d,	source
	jsr	draw_balloon_quip
	movew	#intro_3e,	source

	jsr	one_black_line

	movew	#intro_3e,	source
	moveb	#green,		color
	ldy	#Object_x_position		; adjust quip
	lda	y[@actor_object]
	tax
	jmp	draw_balloon


panel_4:
	jsr	one_black_line
	jsr	one_black_line
	jsr	one_black_line
	jsr	one_black_line
	jsr	one_black_line

	movew	#intro_4,	source
	jmp	draw_balloon_quip


panel_5:
	movew	#intro_5,	source
	jsr	draw_balloon_quip

	movew	#intro_5b,	source
	jsr	draw_balloon_quip

	movew	#intro_5c,	source
	jsr	draw_balloon_quip

	movew	#intro_5d,	source
	jsr	draw_balloon_quip

	jmp	instructs





draw_balloon_quip:
	moveb	#red,		color
	ldy	#Object_x_position		; adjust quip
	lda	y[@actor_object]
	tax
;	ldx	#0
	jmp	draw_balloon


instructs:
	movew	#press_return,	source
	moveb	#green,		color
	ldy	#Object_x_position		; adjust quip
	lda	y[@actor_object]
	tax
	jmp	draw_balloon


one_black_line:
	movew	#press_return,	source
	moveb	#black,		color
	ldx	#0
	jmp	draw_balloon_2





press_return:
	string	"Press space bar"

intro_0:
	byte	"   Welcome to Lucasfilm's Habitat!    "
	byte	"You are about to enter an exciting new "
	string	"world of fun and adventure!"
intro_0b:
	byte	"In Habitat, you will be represented by "
	string	"me, your Avatar."



intro_1:
	byte	"Before you begin  your adventures, you get "
	string	"to customize my appearance."

intro_1b:
	byte	"You can select my sex, height, "
	string	"head style, and hair and body colors."


intro_2:
	byte	" In a moment, you will use the function keys to "
	string	"alter my appearance until it suits you."

intro_2b:
	byte	" You will then be prepared to enter the "
	string	"world of Habitat."


intro_3:
	string	"F1 changes my sex, F2 changes my head"
intro_3b:
	string	"F3 changes height, F4 walks me around"
intro_3c:
	string	"F5 changes hair, F6 changes leg color"
intro_3d:
	string	"F7 changes my torso,  F8 changes arms"
intro_3e:
	string	" When finished, press the space bar. "


intro_4:
	byte	"Am I now customized the way "
	string	"you want me to be? (Type Y or N)"


intro_5:
	string	"OK!  Here we go!"
intro_5b:
	string	" I will first appear inside our Turf. "
intro_5c:
	string	" This is our home within the Habitat. "
intro_5d:
	byte	" Practice with the controls a bit,    then "
	byte	"head out into the world. Explore! "
	string	"Meet people!  Above all, have fun!"

please_wait:
	string	"Please wait a few moments..."
