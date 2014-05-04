;---------------------------------------
;
;	animation cel data
;

cave0_data::
	byte	swing	+ 2
	byte	0b11100000
	byte	cave0_start_end - cave0_data
	byte	no_cont

	byte	0,0,0

	byte	0b11000000
	byte	0b10000000
	byte	0b00100000

	word	cave0_data_a - cave0_data
	word	cave0_data_b - cave0_data
	word	cave0_data_c - cave0_data

cave0_start_end:
	byte	0,0,1,1,2,2


cave0_data_a:
	byte	cel_box + 0x0c, 0x48, 0xfb, 0x37, 0x00, 0x00
	byte	0x55

cave0_data_b:
	byte	cel_trap + col + 0x02, 0x10, 0xfb, 0x47, 0x00, 0x00
	byte	pat_wild

	byte	10,	0x0c*4-1 -10,	0,	0x0c*4-1


cave0_data_c:
	byte	cel_box + 0x08, 0x1d, 0xf9, 0x10, 0x00, 0x00
	byte	pat_glass

