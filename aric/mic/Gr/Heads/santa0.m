;---------------------------------------
;
;	animation cel data
;

santa0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	santa0_start_end - santa0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	santa0_data_a - santa0_data
	word	santa0_data_b - santa0_data
	word	santa0_data_c - santa0_data

santa0_start_end:
	byte	0,0,1,1,0,0,2,2


santa0_data_a:
	byte	0x05, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,4,2
	byte	run,10,9
	byte	2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	154
	byte	85
	byte	85
	byte	run,3,86
	byte	run,10,85
	byte	149
	byte	42
	byte	40
	byte	186
	byte	249
	byte	249
	byte	229
	byte	229
	byte	149
	byte	149
	byte	170
	byte	91
	byte	219
	byte	239
	byte	155
	byte	86
	byte	86
	byte	run,7,85
	byte	86
	byte	168
	byte	168
	byte	86
	byte	run,4,85
	byte	86
	byte	88
	byte	86
	byte	166
	byte	232
	byte	238
	byte	254
	byte	248
	byte	248
	byte	160
	byte	run,3,96
	byte	run,3,128
	byte	run,0x80+4
	byte	run,4,128
	byte	run,0x80+18




santa0_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+3
	byte	run,4,2
	byte	10
	byte	37
	byte	run,4,38
	byte	run,4,37
	byte	run,3,9
	byte	2
	byte	2
	byte	run,0x80+2
	byte	10
	byte	37
	byte	149
	byte	run,3,85
	byte	90
	byte	101
	byte	165
	byte	105
	byte	126
	byte	255
	byte	175
	byte	90
	byte	run,8,85
	byte	165
	byte	10
	byte	170
	byte	run,5,85
	byte	86
	byte	169
	byte	101
	byte	85
	byte	170
	byte	255
	byte	255
	byte	254
	byte	185
	byte	101
	byte	101
	byte	run,5,85
	byte	101
	byte	138
	byte	128
	byte	96
	byte	88
	byte	run,3,86
	byte	150
	byte	102
	byte	105
	byte	166
	byte	246
	byte	254
	byte	234
	byte	149
	byte	run,6,85
	byte	86
	byte	86
	byte	104
	byte	128
	byte	run,0x80+7
	byte	128
	byte	run,9,96
	byte	run,3,128
	byte	run,0x80+4




santa0_data_c:
	byte	0x04, 0x11, 0xfe, 0xfa, 0x00, 0x00
	byte	run,0x80+9
	byte	run,8,1
	byte	11
	byte	38
	byte	run,3,22
	byte	26
	byte	101
	byte	149
	byte	run,9,85
	byte	255
	byte	run,3,254
	byte	170
	byte	86
	byte	run,11,85
	byte	128
	byte	96
	byte	88
	byte	86
	byte	86
	byte	150
	byte	102
	byte	90
	byte	84
	byte	run,8,85




