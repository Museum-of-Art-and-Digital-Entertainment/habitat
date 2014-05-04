;---------------------------------------
;
;	animation cel data
;

buckw0_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	buckw0_start_end - buckw0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	buckw0_data_a - buckw0_data
	word	buckw0_data_b - buckw0_data

buckw0_start_end:
	byte	0,0,1,1,0,0,1,1


buckw0_data_a:
	byte	0x05, 0x1f, 0xff, 0x09, 0x00, 0x00
	byte	run,0x80+17
	byte	2
	byte	137
	byte	42
	byte	run,0x80+2
	byte	2
	byte	34
	byte	10
	byte	run,0x80+13
	byte	run,4,2
	byte	run,3,9
	byte	37
	byte	149
	byte	149
	byte	85
	byte	101
	byte	165
	byte	37
	byte	149
	byte	89
	byte	98
	byte	130
	byte	8
	byte	8
	byte	10
	byte	32
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	154
	byte	85
	byte	85
	byte	86
	byte	run,4,91
	byte	90
	byte	run,10,85
	byte	89
	byte	162
	byte	2
	byte	run,0x80+3
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
	byte	111
	byte	111
	byte	107
	byte	91
	byte	86
	byte	run,5,85
	byte	105
	byte	98
	byte	96
	byte	152
	byte	40
	byte	2
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	128
	byte	130
	byte	162
	byte	88
	byte	160
	byte	128
	byte	104
	byte	160
	byte	run,0x80+4




buckw0_data_b:
	byte	0x05, 0x22, 0xfe, 0x0b, 0x00, 0x00
	byte	run,0x80+10
	byte	2
	byte	41
	byte	run,3,9
	byte	run,3,2
	byte	9
	byte	37
	byte	170
	byte	2
	byte	9
	byte	165
	byte	149
	byte	42
	byte	run,0x80+1
	byte	128
	byte	34
	byte	41
	byte	9
	byte	2
	byte	run,0x80+2
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	175
	byte	run,3,111
	byte	91
	byte	86
	byte	run,4,85
	byte	165
	byte	37
	byte	37
	byte	149
	byte	86
	byte	90
	byte	160
	byte	run,0x80+3
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,14,255
	byte	254
	byte	153
	byte	101
	byte	run,5,85
	byte	86
	byte	88
	byte	88
	byte	160
	byte	160
	byte	32
	byte	8
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	250
	byte	run,3,249
	byte	233
	byte	run,3,230
	byte	229
	byte	150
	byte	86
	byte	run,3,85
	byte	90
	byte	96
	byte	88
	byte	86
	byte	149
	byte	42
	byte	run,0x80+15
	byte	128
	byte	96
	byte	128
	byte	128
	byte	run,0x80+3
	byte	128
	byte	run,0x80+2
	byte	128
	byte	98
	byte	88
	byte	88
	byte	160
	byte	run,0x80+1
	byte	160
	byte	128
	byte	run,0x80+5




