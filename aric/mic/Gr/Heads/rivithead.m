;---------------------------------------
;
;	animation cel data
;

rivithead_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	rivithead_start_end - rivithead_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	rivithead_data_a - rivithead_data
	word	rivithead_data_b - rivithead_data
	word	rivithead_data_c - rivithead_data

rivithead_start_end:
	byte	0,0,1,1,0,0,2,2


rivithead_data_a:
	byte	0x05, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+7
	byte	run,3,2
	byte	42
	byte	run,7,37
	byte	run,4,9
	byte	6
	byte	2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	171
	byte	91
	byte	86
	byte	90
	byte	run,3,89
	byte	90
	byte	85
	byte	85
	byte	149
	byte	run,3,85
	byte	149
	byte	42
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	191
	byte	190
	byte	191
	byte	255
	byte	254
	byte	250
	byte	169
	byte	165
	byte	86
	byte	86
	byte	85
	byte	170
	byte	85
	byte	85
	byte	149
	byte	run,4,85
	byte	170
	byte	run,0x80+3
	byte	128
	byte	224
	byte	160
	byte	224
	byte	160
	byte	234
	byte	165
	byte	149
	byte	106
	byte	106
	byte	85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	86
	byte	86
	byte	152
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+10
	byte	run,3,128
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,0x80+8




rivithead_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+10
	byte	run,7,10
	byte	9
	byte	run,4,2
	byte	run,0x80+4
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	170
	byte	149
	byte	85
	byte	90
	byte	90
	byte	85
	byte	106
	byte	106
	byte	85
	byte	170
	byte	85
	byte	85
	byte	101
	byte	85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	239
	byte	255
	byte	171
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	101
	byte	run,4,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	168
	byte	88
	byte	86
	byte	150
	byte	150
	byte	86
	byte	166
	byte	166
	byte	86
	byte	169
	byte	86
	byte	86
	byte	102
	byte	86
	byte	88
	byte	88
	byte	96
	byte	128
	byte	run,0x80+10
	byte	run,8,128
	byte	run,0x80+8




rivithead_data_c:
	byte	0x04, 0x0d, 0xfe, 0xfa, 0x00, 0x00
	byte	run,0x80+8
	byte	run,5,1
	byte	run,0x80+1
	byte	run,3,10
	byte	run,4,170
	byte	run,5,85
	byte	168
	byte	run,7,170
	byte	run,5,85
	byte	run,0x80+1
	byte	run,3,128
	byte	run,4,168
	byte	run,5,85




