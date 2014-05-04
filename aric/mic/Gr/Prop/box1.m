;---------------------------------------
;
;	animation cel data
;

box1_data::
	byte	both	+ 1
	byte	0b10000000
	byte	box1_start_end - box1_data
	byte	no_cont

	byte	240+right,32+left,255

	byte	0b11100000
	byte	0b11000000

	word	box1_data_a - box1_data
	word	box1_data_b - box1_data
	word	box1_data_c - box1_data

box1_start_end:
	byte	0,0,1,1


box1_data_a:
	byte	cel_box + both_bord + 0x05, 0x13, 0xff, 0xfc, 0x00, 0x00
	byte	0q1111

box1_data_b:
	byte	0x05, 0x04, 0xff, 0x00, 0x00, 0x00

	byte	154
	byte	149
	byte	149
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	166
	byte	86
	byte	86
	byte	170




box1_data_c:
	byte	0x07, 0x07, 0xfe, 0x02, 0x00, 0x00

	byte	run,5,2
	byte	run,0x80+2
	byte	170
	byte	run,3,85
	byte	170
	byte	149
	byte	42
	byte	170
	byte	run,3,85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	86
	byte	168
	byte	run,5,128
	byte	run,0x80+2




