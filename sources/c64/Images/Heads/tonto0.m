;---------------------------------------
;
;	animation cel data
;

tonto0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	tonto0_start_end - tonto0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	tonto0_data_a - tonto0_data
	word	tonto0_data_b - tonto0_data
	word	tonto0_data_c - tonto0_data

tonto0_start_end:
	byte	0,0,1,1,0,0,2,2


tonto0_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	run,3,2
	byte	run,4,10
	byte	138
	byte	170
	byte	150
	byte	149
	byte	42
	byte	2
	byte	2
	byte	10
	byte	10
	byte	2
	byte	run,0x80+4
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,3,170
	byte	106
	byte	170
	byte	85
	byte	85
	byte	run,3,170
	byte	40
	byte	run,0x80+2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	175
	byte	175
	byte	174
	byte	171
	byte	170
	byte	85
	byte	85
	byte	run,3,170
	byte	42
	byte	run,0x80+1
	byte	10
	byte	run,0x80+3
	byte	168
	byte	run,4,254
	byte	248
	byte	248
	byte	224
	byte	248
	byte	254
	byte	254
	byte	168
	byte	128
	byte	168
	byte	224
	byte	160
	byte	96
	byte	96
	byte	160
	byte	168
	byte	168
	byte	32
	byte	128
	byte	run,0x80+1




tonto0_data_b:
	byte	0x04, 0x1b, 0xfe, 0x04, 0x00, 0x00
	byte	run,0x80+8
	byte	run,6,2
	byte	170
	byte	150
	byte	37
	byte	9
	byte	34
	byte	153
	byte	149
	byte	42
	byte	run,0x80+5
	byte	3
	byte	2
	byte	2
	byte	10
	byte	47
	byte	run,4,191
	byte	175
	byte	run,4,191
	byte	175
	byte	171
	byte	174
	byte	171
	byte	106
	byte	165
	byte	165
	byte	42
	byte	138
	byte	10
	byte	2
	byte	run,0x80+2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	239
	byte	run,3,255
	byte	239
	byte	255
	byte	175
	byte	255
	byte	239
	byte	255
	byte	255
	byte	187
	byte	170
	byte	255
	byte	170
	byte	85
	byte	85
	byte	run,3,170
	byte	42
	byte	run,0x80+5
	byte	128
	byte	224
	byte	run,3,248
	byte	250
	byte	234
	byte	run,4,250
	byte	234
	byte	170
	byte	234
	byte	168
	byte	168
	byte	96
	byte	96
	byte	168
	byte	168
	byte	160
	byte	136
	byte	8
	byte	160




tonto0_data_c:
	byte	0x03, 0x0e, 0xff, 0xfb, 0x00, 0x00
	byte	run,14,42
	byte	run,14,170
	byte	run,14,160




