;---------------------------------------
;
;	animation cel data
;

plughead_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	plughead_start_end - plughead_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	plughead_data_a - plughead_data
	word	plughead_data_b - plughead_data
	word	plughead_data_c - plughead_data

plughead_start_end:
	byte	0,0,1,1,0,0,2,2


plughead_data_a:
	byte	0x04, 0x21, 0x00, 0x0b, 0x00, 0x00
	byte	run,0x80+7
	byte	run,12,2
	byte	10
	byte	15
	byte	2
	byte	10
	byte	15
	byte	2
	byte	10
	byte	15
	byte	2
	byte	2
	byte	run,0x80+5
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	85
	byte	85
	byte	86
	byte	run,4,89
	byte	90
	byte	run,4,85
	byte	170
	byte	255
	byte	85
	byte	170
	byte	255
	byte	85
	byte	170
	byte	255
	byte	85
	byte	170
	byte	run,3,37
	byte	42
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	run,7,85
	byte	101
	byte	165
	byte	90
	byte	91
	byte	90
	byte	85
	byte	170
	byte	255
	byte	85
	byte	170
	byte	255
	byte	85
	byte	170
	byte	255
	byte	85
	byte	170
	byte	run,3,86
	byte	170
	byte	run,0x80+3
	byte	128
	byte	run,3,96
	byte	160
	byte	96
	byte	96
	byte	104
	byte	run,4,88
	byte	160
	byte	224
	byte	160
	byte	96
	byte	168
	byte	252
	byte	96
	byte	168
	byte	252
	byte	96
	byte	168
	byte	252
	byte	96
	byte	160
	byte	run,0x80+4




plughead_data_b:
	byte	0x04, 0x22, 0xfe, 0x0b, 0x00, 0x00
	byte	run,0x80+20
	byte	2
	byte	3
	byte	run,0x80+1
	byte	2
	byte	3
	byte	run,0x80+1
	byte	2
	byte	3
	byte	run,0x80+6
	byte	1
	byte	run,4,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	165
	byte	run,4,149
	byte	165
	byte	149
	byte	154
	byte	155
	byte	154
	byte	149
	byte	170
	byte	255
	byte	149
	byte	170
	byte	255
	byte	149
	byte	170
	byte	255
	byte	149
	byte	170
	byte	run,3,9
	byte	10
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	run,3,85
	byte	169
	byte	85
	byte	85
	byte	101
	byte	run,4,85
	byte	170
	byte	239
	byte	170
	byte	85
	byte	170
	byte	255
	byte	85
	byte	170
	byte	255
	byte	85
	byte	170
	byte	255
	byte	85
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	96
	byte	96
	byte	104
	byte	run,4,88
	byte	104
	byte	88
	byte	run,3,152
	byte	88
	byte	170
	byte	255
	byte	88
	byte	170
	byte	255
	byte	88
	byte	170
	byte	255
	byte	88
	byte	168
	byte	run,4,128




plughead_data_c:
	byte	0x03, 0x0b, 0xff, 0xfc, 0x00, 0x00
	byte	run,0x80+2
	byte	run,9,21
	byte	84
	byte	run,0x80+1
	byte	run,9,85
	byte	run,0x80+2
	byte	run,9,80




