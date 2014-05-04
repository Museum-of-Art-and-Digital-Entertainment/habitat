;---------------------------------------
;
;	animation cel data
;

head5_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	head5_start_end - head5_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10100000
	byte	0b01000000

	word	head5_data_a - head5_data
	word	head5_data_b - head5_data
	word	head5_data_c - head5_data

head5_start_end:
	byte	0,0,1,1,0,0,1,1


head5_data_a:
	byte	0x05, 0x10, 0x01, 0xfb, 0x00, 0x00
	byte	run,4,37
	byte	38
	byte	38
	byte	150
	byte	run,3,153
	byte	150
	byte	run,3,149
	byte	165
	byte	170
	byte	88
	byte	88
	byte	106
	byte	149
	byte	run,12,85
	byte	run,0x80+2
	byte	10
	byte	165
	byte	run,10,85
	byte	101
	byte	102
	byte	8
	byte	166
	byte	85
	byte	102
	byte	105
	byte	85
	byte	85
	byte	89
	byte	90
	byte	85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	128
	byte	run,0x80+3
	byte	160
	byte	run,5,96
	byte	128
	byte	128
	byte	run,0x80+6




head5_data_b:
	byte	0x05, 0x22, 0xfe, 0x08, 0x00, 0x00
	byte	run,0x80+16
	byte	2
	byte	11
	byte	47
	byte	43
	byte	130
	byte	run,0x80+5
	byte	32
	byte	128
	byte	128
	byte	162
	byte	187
	byte	191
	byte	47
	byte	10
	byte	run,0x80+1
	byte	run,3,2
	byte	10
	byte	run,4,9
	byte	37
	byte	37
	byte	run,3,149
	byte	37
	byte	37
	byte	165
	byte	230
	byte	229
	byte	249
	byte	250
	byte	170
	byte	42
	byte	42
	byte	11
	byte	47
	byte	47
	byte	191
	byte	190
	byte	254
	byte	248
	byte	248
	byte	224
	byte	128
	byte	168
	byte	86
	byte	170
	byte	86
	byte	86
	byte	run,4,153
	byte	run,5,85
	byte	153
	byte	153
	byte	85
	byte	154
	byte	85
	byte	169
	byte	run,4,170
	byte	171
	byte	171
	byte	139
	byte	139
	byte	2
	byte	2
	byte	run,0x80+8
	byte	run,5,128
	byte	96
	byte	96
	byte	run,3,88
	byte	96
	byte	96
	byte	106
	byte	111
	byte	111
	byte	191
	byte	186
	byte	184
	byte	160
	byte	160
	byte	128
	byte	224
	byte	224
	byte	248
	byte	248
	byte	254
	byte	191
	byte	191
	byte	47
	byte	10
	byte	run,0x80+17
	byte	128
	byte	224
	byte	160
	byte	8
	byte	run,0x80+5
	byte	32
	byte	8
	byte	8
	byte	40
	byte	184
	byte	248
	byte	224
	byte	128




head5_data_c:
	byte	0x05, 0x0f, 0xff, 0x0a, 0x00, 0x00
	byte	run,0x80+6
	byte	8
	byte	32
	byte	40
	byte	46
	byte	47
	byte	11
	byte	2
	byte	run,0x80+2
	byte	2
	byte	11
	byte	10
	byte	32
	byte	run,0x80+2
	byte	32
	byte	128
	byte	160
	byte	170
	byte	170
	byte	234
	byte	255
	byte	191
	byte	42
	byte	250
	byte	254
	byte	255
	byte	175
	byte	43
	byte	10
	byte	run,3,47
	byte	191
	byte	191
	byte	254
	byte	254
	byte	248
	byte	160
	byte	149
	byte	165
	byte	165
	byte	run,4,170
	byte	232
	byte	232
	byte	160
	byte	160
	byte	128
	byte	run,0x80+3
	byte	86
	byte	168
	byte	88
	byte	run,3,160
	byte	128
	byte	run,0x80+8




