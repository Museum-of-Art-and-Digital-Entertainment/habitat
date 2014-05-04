;---------------------------------------
;
;	animation cel data
;

airforce0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	airforce0_start_end - airforce0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	airforce0_data_a - airforce0_data
	word	airforce0_data_b - airforce0_data
	word	airforce0_data_c - airforce0_data

airforce0_start_end:
	byte	0,0,1,1,0,0,2,2


airforce0_data_a:
	byte	0x06, 0x1b, 0xff, 0x05, 0x00, 0x00
	byte	run,0x80+11
	byte	run,9,2
	byte	run,0x80+11
	byte	2
	byte	10
	byte	37
	byte	37
	byte	run,3,149
	byte	run,3,85
	byte	run,3,86
	byte	run,3,85
	byte	149
	byte	149
	byte	165
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	170
	byte	170
	byte	run,7,85
	byte	165
	byte	run,3,89
	byte	154
	byte	170
	byte	90
	byte	86
	byte	run,5,85
	byte	170
	byte	40
	byte	184
	byte	248
	byte	250
	byte	229
	byte	170
	byte	run,3,191
	byte	190
	byte	run,4,191
	byte	190
	byte	186
	byte	run,6,170
	byte	106
	byte	90
	byte	86
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	96
	byte	96
	byte	160
	byte	224
	byte	160
	byte	224
	byte	232
	byte	248
	byte	248
	byte	184
	byte	168
	byte	160
	byte	run,9,170
	byte	40
	byte	run,0x80+17
	byte	run,6,160
	byte	128
	byte	128
	byte	run,0x80+3




airforce0_data_b:
	byte	0x05, 0x1b, 0xfe, 0x04, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	9
	byte	9
	byte	run,3,37
	byte	149
	byte	149
	byte	165
	byte	153
	byte	run,3,154
	byte	run,3,170
	byte	42
	byte	42
	byte	10
	byte	2
	byte	run,0x80+1
	byte	3
	byte	run,3,2
	byte	42
	byte	170
	byte	91
	byte	111
	byte	111
	byte	174
	byte	run,4,191
	byte	175
	byte	175
	byte	run,11,170
	byte	255
	byte	254
	byte	170
	byte	170
	byte	86
	byte	86
	byte	171
	byte	255
	byte	171
	byte	255
	byte	239
	byte	255
	byte	255
	byte	187
	byte	255
	byte	255
	byte	186
	byte	run,10,170
	byte	run,0x80+4
	byte	160
	byte	168
	byte	150
	byte	229
	byte	229
	byte	233
	byte	run,4,249
	byte	233
	byte	233
	byte	run,10,170
	byte	168
	byte	run,0x80+7
	byte	128
	byte	128
	byte	run,3,96
	byte	88
	byte	88
	byte	104
	byte	run,4,152
	byte	run,3,168
	byte	160
	byte	160
	byte	128
	byte	run,0x80+2




airforce0_data_c:
	byte	cel_box + 0x03, 0x0d, 0xff, 0xfc, 0x00, 0x00
	byte	0x55

