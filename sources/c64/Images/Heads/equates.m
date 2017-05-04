;---------------------------------
;
;	defines and equates
;

	define	swap_pat	= cartoon_buffer+12

	define	rtstick		= 0b00001000	; joystick bit masks
	define	ltstick		= 0b00000100
	define	dnstick		= 0b00000010
	define	upstick		= 0b00000001

	define	run		= 0x00	; used in run_length decoding in paint

	define	type_sky	= 0
	define	type_wall	= 1
	define	type_grnd	= 2
	define	type_nogo	= 3

	define	bg	= 0x00			; background object
	define	fg	= 0x80			; foreground object

	define	color_black	= 0x00
	define	color_white	= 0x01
	define	color_red	= 0x02
	define	color_cyan	= 0x03
	define	color_purple	= 0x04
	define	color_green	= 0x05
	define	color_blue	= 0x06
	define	color_yellow	= 0x07
	define	color_peach	= 0x08
	define	color_brown	= 0x09
	define	color_pink	= 0x0a
	define	color_gray1	= 0x0b
	define	color_gray2	= 0x0c
	define	color_lgreen	= 0x0d
	define	color_sky	= 0x0e
	define	color_gray3	= 0x0f

	define	pat_glass	= 0q0000	; bitmap patterns
	define	pat_sky		= 0q0000	; bitmap patterns
	define	pat_wild	= 0q1111
	define	pat_black	= 0q2222
	define	pat_pink	= 0q3333

	define	AVATAR_LEG_LIMB		=	0
	define	AVATAR_TORSO_LIMB	=	1
	define	AVATAR_ARM_LIMB		=	2
	define	AVATAR_FACE_LIMB	=	3



;****************************************
;	CHARACTERS USED IN SIGNS!
;****************************************

	define	char_space			= 0x20
	define	char_delete			= 0x7c


	define	shift_0				= 128 + 0
	define	shift_plus			= 128 + 1
	define	shift_minus			= 128 + 2
	define	shift_asterisk			= 128 + 3
	define	shift_at			= 128 + 4
	define	shift_equal			= 128 + 5
	define	sign_char_return_key		= 128 + 6
	define	cursor_right			= 128 + 7
	define	cursor_left			= 128 + 8
	define	cursor_up			= 128 + 9
	define	cursor_down			= 128 + 10
	define	home_key			= 128 + 11
	define	clear_key			= 128 + 12
	define	british_pound			= 128 +	13
	define	insert_key			= 128 + 14
	define	shift_british_pound		= 128 +	15


	define	start_text			= insert_key
	define	sign_char_half_space		= shift_0
	define	sign_char_double_space		= shift_british_pound
	define	sign_char_inc_width		= shift_plus
	define	sign_char_dec_width		= shift_minus
	define	sign_char_inc_height		= shift_asterisk
	define	sign_char_dec_height		= shift_at
	define	sign_char_half_size		= shift_equal
	define	sign_char_half_char_down	= home_key
	define	sign_char_inverse_video		= clear_key
	define	sign_char_cursor_right		= cursor_right
	define	sign_char_cursor_left		= cursor_left
	define	sign_char_cursor_up		= cursor_up
	define	sign_char_cursor_down		= cursor_down


;	Graphic data in the form of...
;
;	How Held + # of states				1 byte
;	Which cels change color_ram			1 byte
;	Offset to graphic state tables			1 byte
;	Container?  if yes, offset for x/y tables	1 byte
	define	image_walk_offset			= 4	; 3 bytes
;							-------
	define	Header_total				= 7



	define	left		= 0x00		; walkto object facing!
	define	right		= 0x01
	define	up		= 0x02
	define	down		= 0x03



;	FIRST BYTE IN CEL
	define	cel_cel		= 0b00000000
	define	cel_trap	= 0b01000000
	define	cel_box		= 0b10000000
	define	cel_circle	= 0b11000000
	define	cel_mask	= 0b11000000
	define	cel_text	= 0b00100000
	define	cel_wid_mask	= 0b00001111

	define	lr_bord		= 0b00100000	; borders on boxes
	define	tb_bord		= 0b00010000
	define	both_bord	= 0b00110000

	define	col		= 0b00000000	; get color or pattern
	define	pat		= 0b00010000


;	FIRST BYTE OF GRAPHIC DESCRIPTER
	define	swing		= 0b00000000	; how objects are held
	define	out		= 0b01000000	; 2nd two bits
	define	both		= 0b10000000
	define	at_side		= 0b11000000
	define	hold_mask	= 0b11000000

	define	state_mask	= 0b00111111	; # of graphic states (0-63)

;;	define	swing		= 0b00000000	; how objects are held
;;	define	out		= 0b00100000	; 2nd two bits
;;	define	both		= 0b01000000
;;	define	at_side		= 0b01100000
;;	define	hold_mask	= 0b01100000
;;
;;	define	state_mask	= 0b00011111	; # of graphic states (0-31)


;	ANIMATION DATA
	define	no_animation	= 0b00000000
	define	cycle		= 0b10000000	; high bit cycle animation
	define	cycle_mask	= 0b10000000

	define	no_cont		= 0b00000000

;	ORIENTATION BYTE
	define	st_colr		= 0b10000000		; whether trap stores
	define	no_colr		= 0b00000000		; into color_map
	define	color_mask	= 0b11111000		; if color, and color


	define	orient_right	= 0b00000000
	define	orient_left	= 0b00000001
;;	define	orient_forward	= 0b00000010
;;	define	orient_back	= 0b00000011
	define	cel_dx_mask	= 0b00000001
;;	define	face_left_bit	= 0b00000100


;	AVATARS use of OBJECT_animation_state

	define	invisible_bit	= 0b10000000
	define	moonwalk_bit	= 0b00000001
	define	avatar_on_hold	= 0b01000000	; don't draw for now
						; DIFFERENT from invis.
;	OBJECT_animation_start
;	define	new_head_facing	= 0b10000000
;	define	head_gr_state	= 0b00000011

;	OBJECT_animation_end
	define	walk_end_chore	= 0b00000011
	define	on_my_way	= 0b00001000	; 0 if at_destination
	define	walk_this_way	= 0b10000000



;	define	AV_ACT_init		= 0x80	+ 0
	define	AV_ACT_stand		= 0x80	+ 1
	define	AV_ACT_walk		= 0x80	+ 2
	define	AV_ACT_hand_back	= 0x80	+ 3
	define	AV_ACT_sit_floor	= 0x80	+ 4
	define	AV_ACT_sit_chair	= 0x80	+ 5
	define	AV_ACT_bend_over	= 0x80	+ 6
	define	AV_ACT_bend_back	= 0x80	+ 7
	define	AV_ACT_point		= 0x80	+ 8
	define	AV_ACT_throw		= 0x80	+ 9
	define	AV_ACT_get_shot		= 0x80	+ 10
	define	AV_ACT_jump		= 0x80	+ 11
	define	AV_ACT_punch		= 0x80	+ 12
	define	AV_ACT_wave		= 0x80	+ 13
	define	AV_ACT_frown		= 0x80	+ 14
	define	AV_ACT_stand_back	= 0x80	+ 15
	define	AV_ACT_walk_front	= 0x80	+ 16
	define	AV_ACT_walk_back	= 0x80	+ 17
	define	AV_ACT_stand_front	= 0x80	+ 18
	define	AV_ACT_unpocket		= 0x80	+ 19
	define	AV_ACT_gimme		= 0x80	+ 20
	define	AV_ACT_knife		= 0x80	+ 21
	define	AV_ACT_arm_get		= 0x80	+ 22
	define	AV_ACT_hand_out		= 0x80	+ 23
	define	AV_ACT_operate		= 0x80	+ 24
	define	AV_ACT_arm_back		= 0x80	+ 25
	define	AV_ACT_shoot1		= 0x80	+ 26
	define	AV_ACT_shoot2		= 0x80	+ 27
	define	AV_ACT_nop		= 0x80	+ 28
	define	AV_ACT_sit_front	= 0x80	+ 29


	define	AV_ACT_help_key		= 0x80	+ 122

	define	AV_ACT_stand_left	= 0x80	+ 123
	define	AV_ACT_stand_right	= 0x80	+ 124

	define	AV_ACT_change_color	= 0x80	+ 125
	define	AV_ACT_face_left	= 0x80	+ 126
	define	AV_ACT_face_right	= 0x80	+ 127


