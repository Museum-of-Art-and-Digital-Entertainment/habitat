;---------------------------------------
;
;	animation cel data
;

sherlock0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	sherlock0_start_end - sherlock0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	sherlock0_data_a - sherlock0_data
	word	sherlock0_data_b - sherlock0_data
	word	sherlock0_data_c - sherlock0_data

sherlock0_start_end:
	byte	0,0,1,1,0,0,2,2


sherlock0_data_a:
	byte	0x06, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+7
	byte	run,4,2
	byte	170
	byte	150
	byte	37
	byte	9
	byte	run,5,2
	byte	run,0x80+10
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	run,3,171
	byte	90
	byte	86
	byte	165
	byte	90
	byte	run,3,85
	byte	run,4,149
	byte	37
	byte	9
	byte	10
	byte	34
	byte	8
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,3,255
	byte	239
	byte	175
	byte	174
	byte	106
	byte	170
	byte	106
	byte	89
	byte	86
	byte	run,3,85
	byte	86
	byte	86
	byte	88
	byte	160
	byte	run,0x80+5
	byte	130
	byte	run,3,226
	byte	168
	byte	224
	byte	224
	byte	232
	byte	run,3,248
	byte	168
	byte	160
	byte	170
	byte	85
	byte	86
	byte	168
	byte	160
	byte	128
	byte	128
	byte	run,0x80+8
	byte	168
	byte	170
	byte	138
	byte	run,3,10
	byte	37
	byte	10
	byte	run,0x80+6
	byte	160
	byte	96
	byte	128
	byte	run,0x80+18
	byte	128
	byte	run,0x80+20




sherlock0_data_b:
	byte	0x05, 0x1e, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+11
	byte	run,3,2
	byte	10
	byte	10
	byte	2
	byte	2
	byte	run,0x80+12
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,3,191
	byte	175
	byte	run,3,170
	byte	169
	byte	149
	byte	169
	byte	150
	byte	149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+2
	byte	2
	byte	run,0x80+1
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	254
	byte	250
	byte	255
	byte	255
	byte	239
	byte	run,3,255
	byte	186
	byte	170
	byte	86
	byte	run,3,85
	byte	154
	byte	101
	byte	run,3,85
	byte	86
	byte	168
	byte	128
	byte	32
	byte	128
	byte	run,0x80+2
	byte	10
	byte	42
	byte	162
	byte	130
	byte	130
	byte	226
	byte	233
	byte	234
	byte	248
	byte	248
	byte	250
	byte	234
	byte	run,4,170
	byte	88
	byte	168
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+8
	byte	run,5,128
	byte	96
	byte	128
	byte	run,0x80+4
	byte	128
	byte	128
	byte	run,0x80+14




sherlock0_data_c:
	byte	0x03, 0x12, 0xff, 0xff, 0x00, 0x00
	byte	run,3,10
	byte	42
	byte	run,4,170
	byte	169
	byte	165
	byte	149
	byte	85
	byte	150
	byte	169
	byte	run,4,149
	byte	run,8,170
	byte	run,3,85
	byte	169
	byte	86
	byte	run,5,85
	byte	run,0x80+1
	byte	128
	byte	128
	byte	160
	byte	160
	byte	run,4,168
	byte	104
	byte	88
	byte	84
	byte	84
	byte	168
	byte	run,4,88




