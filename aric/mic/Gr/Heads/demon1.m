;---------------------------------------
;
;	animation cel data
;

demon1_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	demon1_start_end - demon1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	demon1_data_a - demon1_data
	word	demon1_data_b - demon1_data
	word	demon1_data_c - demon1_data

demon1_start_end:
	byte	0,0,1,1,0,0,2,2


demon1_data_a:
	byte	0x06, 0x1b, 0xff, 0x05, 0x00, 0x00
	byte	run,0x80+15
	byte	2
	byte	2
	byte	run,0x80+3
	byte	2
	byte	11
	byte	47
	byte	42
	byte	162
	byte	138
	byte	8
	byte	run,0x80+7
	byte	run,3,2
	byte	10
	byte	37
	byte	38
	byte	149
	byte	154
	byte	105
	byte	138
	byte	10
	byte	43
	byte	191
	byte	255
	byte	254
	byte	170
	byte	168
	byte	128
	byte	run,0x80+3
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	85
	byte	153
	byte	166
	byte	85
	byte	169
	byte	149
	byte	89
	byte	165
	byte	86
	byte	107
	byte	191
	byte	255
	byte	255
	byte	250
	byte	165
	byte	149
	byte	42
	byte	run,0x80+3
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	149
	byte	run,7,85
	byte	90
	byte	171
	byte	170
	byte	234
	byte	229
	byte	149
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+6
	byte	128
	byte	96
	byte	104
	byte	110
	byte	191
	byte	175
	byte	186
	byte	191
	byte	111
	byte	110
	byte	90
	byte	152
	byte	160
	byte	168
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+11
	byte	32
	byte	160
	byte	160
	byte	224
	byte	128
	byte	128
	byte	run,0x80+15




demon1_data_b:
	byte	0x05, 0x21, 0xfe, 0x0a, 0x00, 0x00
	byte	run,0x80+11
	byte	2
	byte	9
	byte	38
	byte	149
	byte	154
	byte	160
	byte	128
	byte	2
	byte	11
	byte	run,3,47
	byte	run,4,190
	byte	47
	byte	11
	byte	2
	byte	run,0x80+3
	byte	1
	byte	run,4,2
	byte	10
	byte	11
	byte	43
	byte	42
	byte	170
	byte	run,3,155
	byte	150
	byte	150
	byte	155
	byte	170
	byte	169
	byte	run,4,229
	byte	137
	byte	2
	byte	run,0x80+3
	byte	160
	byte	248
	byte	184
	byte	40
	byte	32
	byte	128
	byte	85
	byte	86
	byte	170
	byte	170
	byte	186
	byte	254
	byte	239
	byte	239
	byte	186
	byte	254
	byte	run,3,255
	byte	254
	byte	186
	byte	171
	byte	86
	byte	run,6,85
	byte	170
	byte	run,0x80+14
	byte	128
	byte	128
	byte	160
	byte	160
	byte	168
	byte	152
	byte	154
	byte	153
	byte	90
	byte	89
	byte	154
	byte	168
	byte	168
	byte	110
	byte	run,3,111
	byte	139
	byte	run,4,2
	byte	43
	byte	191
	byte	186
	byte	160
	byte	32
	byte	8
	byte	run,0x80+12
	byte	128
	byte	96
	byte	88
	byte	152
	byte	40
	byte	8
	byte	run,0x80+1
	byte	128
	byte	run,3,224
	byte	run,4,248
	byte	224
	byte	128
	byte	run,0x80+4




demon1_data_c:
	byte	0x03, 0x0f, 0xff, 0xfc, 0x00, 0x00
	byte	run,0x80+2
	byte	1
	byte	run,12,5
	byte	16
	byte	84
	byte	run,13,85
	byte	run,0x80+3
	byte	run,12,64




