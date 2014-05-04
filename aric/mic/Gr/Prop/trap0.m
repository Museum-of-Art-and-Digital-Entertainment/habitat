;---------------------------------------
;
;	animation cel data
;

trap0_data::
	byte	both	+ 3
	byte	0b11111000
	byte	trap0_start_end - trap0_data
	byte	no_cont

	byte	0,0,0

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000
	byte	0b00010000

	word	trap0_data_a - trap0_data
	word	trap0_data_b - trap0_data
	word	trap0_data_c - trap0_data
	word	trap0_data_d - trap0_data


trap0_start_end:
	byte	0,0,1,1,2,2,3,3



trap0_data_a:
	byte	cel_trap + col + 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	byte	pat_wild

	byte	0,	24-1,	0,	24-1



trap0_data_b:
	byte	cel_box + col + 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	byte	pat_wild

;	byte	0,	24-1,	0,	24-1



trap0_data_c:
	byte	cel_box + col + 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	byte	pat_glass

;	byte	0,	24-1,	0,	24-1


trap0_data_d:
	byte	cel_box + col + both_bord+ 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	byte	pat_wild

;	byte	0,	24-1,	0,	24-1




