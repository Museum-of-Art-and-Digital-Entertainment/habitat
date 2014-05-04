;---------------------------------------
;
;	animation cel data
;

boone0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	boone0_start_end - boone0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10010000
	byte	0b01010000
	byte	0b01110000

	word	boone0_data_a - boone0_data
	word	boone0_data_b - boone0_data
	word	boone0_data_c - boone0_data
	word	boone0_data_d - boone0_data

boone0_start_end:
	byte	0,0,1,1,0,0,2,2


boone0_data_a:
	byte	0x04, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+7
	byte	run,5,2
	byte	162
	byte	106
	byte	90
	byte	106
	byte	106
	byte	170
	byte	10
	byte	run,4,2
	byte	8
	byte	run,0x80+2
	byte	47
	byte	42
	byte	47
	byte	43
	byte	run,5,170
	byte	run,4,171
	byte	170
	byte	170
	byte	90
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	105
	byte	170
	byte	138
	byte	40
	byte	184
	byte	248
	byte	250
	byte	175
	byte	175
	byte	run,3,191
	byte	run,3,255
	byte	235
	byte	235
	byte	171
	byte	171
	byte	170
	byte	86
	byte	85
	byte	165
	byte	170
	byte	86
	byte	149
	byte	170
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,4,224
	byte	160
	byte	224
	byte	232
	byte	run,3,248
	byte	184
	byte	224
	byte	168
	byte	104
	byte	88
	byte	96
	byte	160
	byte	104
	byte	152
	byte	136
	byte	128




boone0_data_b:
	byte	0x03, 0x19, 0xff, 0x02, 0xfe, 0x02
	byte	3
	byte	run,3,2
	byte	11
	byte	11
	byte	43
	byte	run,3,175
	byte	run,4,191
	byte	174
	byte	175
	byte	174
	byte	170
	byte	85
	byte	89
	byte	170
	byte	169
	byte	150
	byte	166
	byte	42
	byte	255
	byte	254
	byte	170
	byte	170
	byte	239
	byte	run,3,255
	byte	235
	byte	255
	byte	239
	byte	run,3,255
	byte	186
	byte	255
	byte	234
	byte	170
	byte	85
	byte	85
	byte	170
	byte	165
	byte	85
	byte	170
	byte	170
	byte	run,0x80+4
	byte	128
	byte	128
	byte	160
	byte	run,3,232
	byte	run,3,248
	byte	250
	byte	run,3,234
	byte	170
	byte	86
	byte	86
	byte	168
	byte	106
	byte	150
	byte	168
	byte	34




boone0_data_c:
	byte	0x03, 0x0d, 0x01, 0xf8, 0x00, 0x00
	byte	run,3,2
	byte	run,23,170
	byte	run,0x80+3
	byte	run,10,160




boone0_data_d:
	byte	0x03, 0x0c, 0xfe, 0xfd, 0x00, 0x00
	byte	10
	byte	41
	byte	9
	byte	10
	byte	2
	byte	2
	byte	run,0x80+7
	byte	128
	byte	160
	byte	88
	byte	106
	byte	102
	byte	150
	byte	154
	byte	153
	byte	41
	byte	10
	byte	run,0x80+6
	byte	160
	byte	106
	byte	90
	byte	106
	byte	106
	byte	170
	byte	8




