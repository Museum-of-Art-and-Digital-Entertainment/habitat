;---------------------------------------
;
;	animation cel data
;

rhood_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	rhood_start_end - rhood_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	rhood_data_a - rhood_data
	word	rhood_data_b - rhood_data
	word	rhood_data_c - rhood_data

rhood_start_end:
	byte	0,0,1,1,0,0,2,2


rhood_data_a:
	byte	0x06, 0x1d, 0xff, 0x07, 0x00, 0x00
	byte	run,0x80+26
	byte	32
	byte	10
	byte	2
	byte	run,0x80+7
	byte	run,10,2
	byte	42
	byte	37
	byte	37
	byte	42
	byte	run,3,2
	byte	run,0x80+1
	byte	2
	byte	10
	byte	170
	byte	168
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,4,170
	byte	85
	byte	90
	byte	165
	byte	run,3,85
	byte	170
	byte	160
	byte	128
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
	byte	run,3,175
	byte	170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	86
	byte	88
	byte	160
	byte	run,0x80+7
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	224
	byte	224
	byte	170
	byte	86
	byte	168
	byte	96
	byte	128
	byte	run,0x80+24
	byte	128
	byte	run,0x80+11




rhood_data_b:
	byte	0x05, 0x1f, 0xfe, 0x08, 0x00, 0x00
	byte	run,0x80+20
	byte	run,4,2
	byte	run,0x80+7
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	run,4,175
	byte	170
	byte	170
	byte	165
	byte	86
	byte	89
	byte	165
	byte	37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+3
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,11,255
	byte	239
	byte	171
	byte	154
	byte	85
	byte	101
	byte	154
	byte	run,5,85
	byte	86
	byte	168
	byte	run,0x80+7
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,248
	byte	run,4,232
	byte	168
	byte	168
	byte	106
	byte	86
	byte	150
	byte	170
	byte	160
	byte	160
	byte	168
	byte	42
	byte	10
	byte	2
	byte	run,0x80+28
	byte	2
	byte	170
	byte	168
	byte	160




rhood_data_c:
	byte	0x03, 0x0f, 0xff, 0xfc, 0x00, 0x00
	byte	2
	byte	10
	byte	10
	byte	42
	byte	42
	byte	run,25,170
	byte	run,0x80+3
	byte	run,12,160




