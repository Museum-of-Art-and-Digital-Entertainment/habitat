;---------------------------------------
;
;	animation cel data
;

gcan_data::
	byte	both	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b11000000

	word	gcan_data_a - gcan_data
	word	gcan_data_b - gcan_data


gcan_data_a:
	byte	0x04, 0x26, 0xff, 0xfc, 0x00, 0x00
	byte	10
	byte	37
	byte	run,3,149
	byte	run,26,150
	byte	run,3,149
	byte	170
	byte	170
	byte	41
	byte	2
	byte	170
	byte	run,3,85
	byte	150
	byte	run,26,89
	byte	150
	byte	85
	byte	85
	byte	170
	byte	106
	byte	85
	byte	170
	byte	170
	byte	run,3,85
	byte	89
	byte	run,26,101
	byte	89
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	160
	byte	88
	byte	86
	byte	86
	byte	102
	byte	run,26,150
	byte	102
	byte	86
	byte	86
	byte	170
	byte	154
	byte	88
	byte	160




gcan_data_b:
	byte	0x06, 0x08, 0xfe, 0x00, 0x00, 0x00
	byte	run,0x80+2
	byte	run,4,2
	byte	run,0x80+2
	byte	42
	byte	149
	byte	85
	byte	106
	byte	149
	byte	85
	byte	170
	byte	run,0x80+1
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	101
	byte	170
	byte	42
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	89
	byte	170
	byte	168
	byte	168
	byte	86
	byte	85
	byte	169
	byte	86
	byte	85
	byte	170
	byte	run,0x80+3
	byte	run,4,128
	byte	run,0x80+2




