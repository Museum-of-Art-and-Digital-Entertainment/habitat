;---------------------------------------
;
;	animation cel data
;

test_data::
	byte	out	+ 0
	byte	0b00000000
	byte	no_animation
	byte	test_contents_xy - test_data

	byte	24+right,24+right,255

	byte	0b11100000

	word	test_data_a - test_data
	word	test_data_b - test_data
	word	test_data_c - test_data

test_contents_xy:
	byte	255,218


test_data_a:
	byte	0x04, 0x03, 0xfe, 0xfb, 0x00, 0x00
	byte	run,0x80+2
	byte	32
	byte	8
	byte	42
	byte	38
	byte	run,0x80+5
	byte	32




test_data_b:
	byte	cel_box + tb_bord + 0x03, 0x04, 0xfe, 0x0c, 0x00, 0x00
	byte	0q1111

test_data_c:
	byte	0x05, 0x2c, 0xfd, 0x27, 0x00, 0x00
	byte	run,0x80+39
	byte	run,4,2
	byte	run,0x80+1
	byte	run,35,152
	byte	168
	byte	168
	byte	170
	byte	149
	byte	85
	byte	42
	byte	149
	byte	85
	byte	170
	byte	run,33,38
	byte	run,4,42
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+37
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,35,152
	byte	run,3,168
	byte	88
	byte	86
	byte	166
	byte	90
	byte	86
	byte	168




