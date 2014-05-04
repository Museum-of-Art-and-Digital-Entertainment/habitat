define	Q3			=	True
define	dump_enabled		=	False
 
define	command_entry		=	0x00
define	async_entry		=	0xff

define	top_of_heap		=	0xeb40
define	OBUFFS			=	0x4800	; max_buffs*128 (512)

define	request_buffers		=	0x6800	; max_request_buffers*128(256)
define	region_contents_list	=	0x6900	; region_max_capacity (128)
define	text_line		=	0x6980	; 

define	RSINBF			=	0x7f40	; 128
define	history			=	0x7fc0	; 64

; fatal errors
define	user_requested_dump	=	0	; no TRAPPED error occurred
define	memory_full		=	1
define	memory_fault		=	2
define	memory_corrupt		=	3	; lrc got corrupted
define	indirect_address_error	=	4
define	bad_image_state		=	5
define	no_room_for_head	=	6
define	indirect_address_jmp	=	7
define	indirect_address_rts	=	8
define	heap_overrun		=	9
define	invalid_comm		=	10
define	missing_object		=	11
define	bad_link_attempt	=	12
define	very_bad_links		=	13
define	host_requested_dump	=	47

; warnings:
define	simple_disk_error	=	128	; returned by rom
define	disk_write_error	=	129	; write protect(?)
define	sector_lrc_error	=	130	; transmission problem	

define	SUCCESS_VALUE		=	1	; any other is false

define	ghost_noid		=	255

define	short_async_frames		=	5	; max frames to wait
define	long_async_frames		=	56

define	Default_Throttle_Increment	=	15	; jiffies (1200 baud)
define	Default_Throttle_Decrement	=	-15	; jiffies (1200 baud)

define	one_minute		=	60*60

define	special_mode		=	1

define	hold_zpage		=	title_music_start
define	hold_page_2		=	hold_zpage+256
define	hold_page_3		=	hold_zpage+512

define	max_number_of_heads	=	31
define	getdrop_offset		=	16		; pixel offset
define	region_max_capacity	=	128

define	LRU_bits		=	0b11000000
define	ref_bits		=	255-LRU_bits
define	oldest_LRU		=	0b01000000
define	old_LRU			=	0b10000000
define	just_deleted		=	0b11000000

define	mid_header	=	8
define	seq_header	=	9
define	obj_header	=	10		; only ALWAYS true in resps
define	req_header	=	11		; ditto
define	resp_data	=	12		; ditto

define	end_of_request_bit	=	0b10000000
define	start_of_request_bit	=	0b00100000
define	fixed_on_bits		=	0b01000000

define	direction_left		= 0	; for region trans
define	direction_up		= 1
define	direction_right		= 2
define	direction_down		= 3

define	command_DO		=	0
define	command_GO		=	2
define	command_STOP		=	3
define	command_GET		=	4
define	command_PUT		=	5
define	command_TALK		=	6
define	special_command		=	8	; lowest special command #

; region TYPES
define	SHOWROOM_region_type	=	0b10000000

; region messages
define	MESSAGE_describe	=	1
define	MESSAGE_I_quit		=	2
define	MESSAGE_Im_alive	=	3
define	MESSAGE_customize	=	4
define	MESSAGE_FINGER_IN_QUE	=	5		; while catchup
define	MESSAGE_HERE_I_AM	=	6		; materialize!
define	MESSAGE_PROMPT_REPLY	=	7

define	MESSAGE_HEREIS		=	8
define	MESSAGE_GOAWAY		=	9		; object has left
define	MESSAGE_PORT		=	10		; we have moved!
define	MESSAGE_UPDATE_DISK	=	11		; update disk..
define	MESSAGE_FIDDLE		=	12		; fiddle with object
define	MESSAGE_LIGHTING	=	13		; change light level
define	MESSAGE_MUSIC		=	14		; play a tune
define	MESSAGE_OBJECT_TALKS	=	15		; an object speaks!
define	MESSAGE_WAIT_FOR_ANI	=	16		; wait for an object
define	MESSAGE_CAUGHT_UP	=	17
define	MESSAGE_APPEAR		=	18
define	MESSAGE_CHANGE_CONT	=	19
define	MESSAGE_PROMPT_USER	=	20
define	MESSAGE_BEEN_MOVED	=	21
define  MESSAGE_HOST_DUMP	=	22

; object messages
define	MESSAGE_answer		=	4
define	MESSAGE_askoracle	=	4
define	MESSAGE_attack		=	4
define	MESSAGE_bash		=	5
define	MESSAGE_bugout		=	4
define	MESSAGE_catalog		=	5
define	MESSAGE_close		=	4
define	MESSAGE_closecontainer	=	4
define	MESSAGE_deposit		=	1
define	MESSAGE_dial		=	5
define	MESSAGE_fakeshoot	=	4
define	MESSAGE_feed		=	4
define	MESSAGE_fill		=	4
define	MESSAGE_flush		=	6
define	MESSAGE_get		=	1
define	MESSAGE_grab		=	4
define	MESSAGE_hand		=	5
define	MESSAGE_hang		=	6
define	MESSAGE_load		=	6
define	MESSAGE_magic		=	4
define	MESSAGE_newregion	=	9
define	MESSAGE_off		=	4
define	MESSAGE_offplayer	=	4
define	MESSAGE_on		=	5
define	MESSAGE_onplayer	=	5
define	MESSAGE_open		=	5
define	MESSAGE_opencontainer	=	5
define	MESSAGE_pay		=	4
define	MESSAGE_payto		=	4
define	MESSAGE_playmessage	=	4
define	MESSAGE_posture		=	6
define	MESSAGE_pour		=	5
define	MESSAGE_pullpin		=	4
define	MESSAGE_put		=	2
define	MESSAGE_read		=	4
define	MESSAGE_readlabel	=	4
define	MESSAGE_readmail	=	4
define	MESSAGE_readme		=	4
define	MESSAGE_reset		=	5
define	MESSAGE_roll		=	4
define	MESSAGE_rub		=	4
define	MESSAGE_scan		=	4
define	MESSAGE_select		=	6
define	MESSAGE_sendmail	=	5
define	MESSAGE_setanswer	=	5
define	MESSAGE_speak		=	7
define	MESSAGE_take		=	4
define	MESSAGE_talk		=	7
define	MESSAGE_throw		=	3
define	MESSAGE_throwaway	=	3
define	MESSAGE_unhook		=	8
define	MESSAGE_unload		=	7
define	MESSAGE_walk		=	8
define	MESSAGE_wind		=	4
define	MESSAGE_wish		=	5
define	MESSAGE_withdraw	=	2
define	MESSAGE_write		=	5
define	MESSAGE_zapto		=	5

define	MESSAGE_esp_speak	=	11

define	separator_byte		=	0x00	; can NOT be valid class/NOID

define	vic_bank_bits		= 0b10		; BANK 1 for VIC
define	vic_bank_start		= 0x4000
define	charset_at		= 0x6000	; (+0x2000)
define	sprites_at		= 0x4000	; (+0x0000)
define	customize_hold_area	= 0x7800
define	customize_target	= back_drop - 0x800
define	where_music_goes	= static_end_of_heap
define	where_music_goes_1	= where_music_goes + 0x100
define	where_music_goes_2	= where_music_goes + 0x200
define	where_music_goes_3	= where_music_goes + 0x300

define	sprite_pointers		= text_RAM_1 + 0x3f8
define	text_window_size	= 7
define	text_window_width	= 40
define	max_balloon_size	= 3

define	max_BUFFS			=	4	; protocol out buffs
define	max_req_buffers			=	2	; valid 2,4,8,16
define	response_free_space		=	768
define	buffer_base			=	response_buffers
define	buffer_end		=	response_buffers+response_free_space-2

define	reply_wait_bit		= 0b10000000
define	animation_wait_bit	= 0b01000000
define	draw_wait_bit		= 0b00100000
define	animation_init_flag	= 0b00010000
define	used_wait_bits		= 0b11100000

define	blank_char		= 0
define	cursor_char		= 0
define	delete_key		= 0xfe
define	clr_key			= 0xfd
define	return_key		= 0x81
define	control_key		= 0x82
define	shift_right		= 0x83
define	shift_left		= 0x84
define	null_key		= 0x8f
define	nk			= null_key
define	quit_key		= 0x91
define	function_key_1		= 0x92
define	function_key_2		= 0x93
define	function_key_3		= 0x94
define	function_key_4		= 0x95
define	function_key_5		= 0x96
define	function_key_6		= 0x97
define	function_key_7		= 0x98
define	function_key_8		= 0x99
define	gesture_key_1		= 0x9a
define	gesture_key_2		= 0x9b
define	gesture_key_3		= 0x9c
define	gesture_key_4		= 0x9d
define	gesture_key_5		= 0x9e
define	gesture_key_6		= 0x9f
define	gesture_key_7		= 0xa1
define	gesture_key_8		= 0xa2
define	gesture_key_9		= 0xa3
define	gesture_key_0		= 0xa4
define	gesture_max		= gesture_key_0
define	dump_key		= 0xb0
define	token_symbol		= '$'
define	escape_char		= 0x5d		; not ASCII esc
define	end_of_message		= 0x0d		; cr
define	mid_byte		= 'U'
define	phantom_request		= 'Z'

define	max_text_line_length	=	100

define	kb_buffer_length	=	32	; valid: 2,4,8,16,32,64,128
define	text_screen_address	=	Text_Ram_1	;(40 * 24)+Text_RAM_1
;;define	text_screen2_address	=	(40 * 24) + Text_RAM_2
define	max_text_display_length	=	40
define	text_color		=	white

define	flash_rate		=	16
define	quip_y			= 	text_window_size * 8 + 50 + 8
define	cursor_left_bound	=	12 / 2
define	cursor_right_bound	=	332 / 2
define	cursor_top_bound	=	quip_y - 1
define	cursor_top_interrupt	=	quip_y + 2
define	cursor_bottom_bound	=	240
define	cursor_over_interrupt	=	999		;221
define	cursor_sprite		=	5
define	cursor_position		=	cursor_sprite * 2 + sprite_position
define	normal_cursor		=	0
define	do_cursor		=	1
define	go_cursor		=	2
define	stop_cursor		=	3
define	get_cursor		=	4
define	put_cursor		=	5
define	pen_cursor		=	6

define	black			=	0x00
define	white			=	0x01
define	red			=	0x02
define	cyan			=	0x03
define	purple			=	0x04
define	green			=	0x05
define	blue			=	0x06
define	yellow			=	0x07
define	orange			=	0x08
define	brown			=	0x09
define	light_red		=	0x0a
define	gray_1			=	0x0b
define	gray_2			=	0x0c
define	light_green		=	0x0d
define	light_blue		=	0x0e
define	gray_3			=	0x0f

define	D6510			=	0x00
define	data_direction		=	0x00
define	R6510			=	0x01
define	IO_reg			=	0x01

define	sprite_position		=	0xd000
define	sprite_x_msb		=	0xd010
define	VIC_control		=	0xd011
define	IRQ_scanline		=	0xd012
define	sprite_enable		=	0xd015
define	VIC_control_2		=	0xd016
define	expand_sprite_y		=	0xd017
define	VIC_memory_control	=	0xd018
define	IRQ_flag		=	0xd019
define	IRQ_mask		=	0xd01a
define	sprite_priority		=	0xd01b
define	multicolor_sprite	=	0xd01c
define	expand_sprite_x		=	0xd01d
define	sprite_collision	=	0xd01e
define	backround_collision	=	0xd01f
define	background_collision	=	0xd01f
define	border_color		=	0xd020
define	background_color	=	0xd021
define	background_color_0	=	0xd021
define	background_color_1	=	0xd022
define	background_color_2	=	0xd023
define	background_color_3	=	0xd024
define	multicolor_0		=	0xd025
define	multicolor_1		=	0xd026
define	sprite_colors		=	0xd027

define	Joystick_port_2		=	0xdc00
define	Joystick_port_1		=	0xdc01
define	data_direction_1	=	0xdc02
define	data_direction_2	=	0xdc03
define	interrupt_control	=	0xdc0d
define	IRQ_interrupt		=	0xdc0d
define	IRQ_timer_a		=	0xdc0e
define	IRQ_timer_b		=	0xdc0f

define	data_port_a		=	0xdd00
define	data_port_b		=	0xdd01
define	data_direction_a	=	0xdd02
define	data_direction_b	=	0xdd03
define	timer_a			=	0xdd04
define	timer_b			=	0xdd06
define	real_clock		=	0xdd08
define	NMI_interrupt		=	0xdd0d
define	NMI_timer_a		=	0xdd0e
define	NMI_timer_b		=	0xdd0f

define	ioinit	=	0xff84
define	setlfs	=	0xffba
define	setnam	=	0xffbd
define	open	=	0xffc0
define	chkout	=	0xffc9
define	chrout	=	0xffd2
define	clrchn	=	0xffcc
define	close	=	0xffc3

; special characters in the character set:
; D = Down U = Up L = Left R = Right C = Center

define	Diag_DR		=	9
define	Diag_DL		=	31		;10 is linefeed!
define	Diag_UL		=	11
define	Diag_UR		=	12
define	Box_DR		=	13
define	Box_DL		=	14
define	Box_UL		=	15
define	Box_UR		=	16
define	Circ_DR		=	17
define	Circ_DL		=	18
define	Circ_UL		=	19
define	Circ_UR		=	20
define	Box_CR		=	21
define	Box_CL		=	22
define	Box_CU		=	23
define	Box_CD		=	24
define	Box_C		=	25
define	Line_UD		=	26
define	Line_LR		=	27
define	Ball		=	28
define	Ball_filled	=	29
define	Ball_alternate	=	30
define	Arrow_U		=	124
define	Arrow_D		=	125
define	Arrow_L		=	126
define	Arrow_R		=	127
define	Squiggle	=	123
define	Black_char	=	96
