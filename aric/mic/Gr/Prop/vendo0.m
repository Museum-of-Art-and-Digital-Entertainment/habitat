;---------------------------------------
;
;	animation cel data
;

vendo0_data::
	byte	both	+ 1
	byte	0b00000000
	byte	vendo0_start_end - vendo0_data
	byte	vendo0_contents_xy - vendo0_data

	byte	48+left,48+left,254

	byte	0b11100000
	byte	0b10100000

	word	vendo0_data_a - vendo0_data
	word	vendo0_data_b - vendo0_data
	word	vendo0_data_c - vendo0_data

vendo0_start_end:
	byte	0,0,1,1,1,1

vendo0_contents_xy:
	byte	252,187,253,185


vendo0_data_a:
	byte	cel_box + 0x05, 0x01, 0xfb, 0x2d, 0x00, 0x00
	byte	pat_glass

vendo0_data_b:
	byte	0x08, 0x03, 0xfc, 0x34, 0x00, 0x00
	byte	42
	byte	42
	byte	170
	byte	run,0x80+2
	byte	170
	byte	run,0x80+2
	byte	170
	byte	run,0x80+2
	byte	170
	byte	run,0x80+2
	byte	170
	byte	run,0x80+2
	byte	170
	byte	run,0x80+2
	byte	170
	byte	168
	byte	168
	byte	170




vendo0_data_c:
	byte	cel_box + both_bord + 0x06, 0x2a, 0xfc, 0x6f, 0x00, 0x00
	byte	0q3333

