;---------------------------------------
;
;	animation cel data
;

unicorn0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	unicorn0_start_end - unicorn0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	unicorn0_data_a - unicorn0_data
	word	unicorn0_data_b - unicorn0_data
	word	unicorn0_data_c - unicorn0_data

unicorn0_start_end:
	byte	0,0,1,1,0,0,2,2


unicorn0_data_a:
	byte	0x07, 0x1e, 0xff, 0x08, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	2
	byte	1
	byte	2
	byte	9
	byte	1
	byte	9
	byte	1
	byte	9
	byte	5
	byte	9
	byte	37
	byte	37
	byte	5
	byte	37
	byte	5
	byte	37
	byte	9
	byte	2
	byte	run,0x80+7
	byte	145
	byte	21
	byte	149
	byte	run,3,85
	byte	86
	byte	86
	byte	run,4,89
	byte	85
	byte	89
	byte	85
	byte	90
	byte	86
	byte	90
	byte	105
	byte	101
	byte	101
	byte	89
	byte	86
	byte	169
	byte	run,0x80+6
	byte	111
	byte	42
	byte	101
	byte	101
	byte	165
	byte	150
	byte	run,5,86
	byte	run,4,85
	byte	149
	byte	165
	byte	run,3,85
	byte	89
	byte	101
	byte	150
	byte	88
	byte	160
	byte	run,0x80+4
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	149
	byte	run,9,85
	byte	169
	byte	186
	byte	190
	byte	185
	byte	165
	byte	86
	byte	103
	byte	107
	byte	130
	byte	run,0x80+9
	byte	128
	byte	96
	byte	90
	byte	85
	byte	86
	byte	run,3,91
	byte	107
	byte	90
	byte	86
	byte	run,3,85
	byte	106
	byte	run,3,128
	byte	224
	byte	224
	byte	248
	byte	184
	byte	190
	byte	46
	byte	47
	byte	11
	byte	2
	byte	run,0x80+1
	byte	32
	byte	8
	byte	2
	byte	37
	byte	149
	byte	85
	byte	170
	byte	255
	byte	255
	byte	234
	byte	149
	byte	85
	byte	85
	byte	86
	byte	85
	byte	169
	byte	2
	byte	run,0x80+9
	byte	run,3,128
	byte	run,0x80+4
	byte	run,3,128
	byte	run,0x80+1
	byte	128
	byte	128
	byte	160
	byte	96
	byte	96
	byte	160
	byte	run,3,96
	byte	128
	byte	run,0x80+12




unicorn0_data_b:
	byte	0x05, 0x1e, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	2
	byte	run,5,9
	byte	10
	byte	9
	byte	9
	byte	run,3,2
	byte	10
	byte	9
	byte	37
	byte	38
	byte	8
	byte	run,0x80+6
	byte	3
	byte	2
	byte	62
	byte	62
	byte	254
	byte	233
	byte	149
	byte	86
	byte	107
	byte	175
	byte	191
	byte	190
	byte	185
	byte	165
	byte	149
	byte	86
	byte	170
	byte	106
	byte	110
	byte	105
	byte	149
	byte	38
	byte	139
	byte	2
	byte	run,0x80+1
	byte	2
	byte	run,0x80+1
	byte	2
	byte	run,0x80+2
	byte	255
	byte	238
	byte	154
	byte	86
	byte	86
	byte	85
	byte	85
	byte	170
	byte	run,3,255
	byte	170
	byte	85
	byte	153
	byte	153
	byte	86
	byte	86
	byte	170
	byte	254
	byte	169
	byte	185
	byte	254
	byte	187
	byte	254
	byte	184
	byte	254
	byte	184
	byte	254
	byte	184
	byte	32
	byte	run,0x80+2
	byte	240
	byte	240
	byte	252
	byte	172
	byte	88
	byte	86
	byte	165
	byte	233
	byte	249
	byte	249
	byte	185
	byte	106
	byte	89
	byte	85
	byte	170
	byte	166
	byte	230
	byte	166
	byte	89
	byte	101
	byte	138
	byte	run,0x80+15
	byte	run,8,128
	byte	run,0x80+3
	byte	128
	byte	128
	byte	96
	byte	96
	byte	128
	byte	run,0x80+6




unicorn0_data_c:
	byte	0x03, 0x12, 0xff, 0x00, 0x00, 0x00
	byte	233
	byte	133
	byte	25
	byte	85
	byte	89
	byte	89
	byte	101
	byte	101
	byte	85
	byte	89
	byte	85
	byte	86
	byte	85
	byte	86
	byte	86
	byte	149
	byte	38
	byte	137
	byte	run,13,85
	byte	86
	byte	85
	byte	86
	byte	85
	byte	86
	byte	172
	byte	136
	byte	146
	byte	84
	byte	149
	byte	101
	byte	101
	byte	149
	byte	149
	byte	85
	byte	149
	byte	86
	byte	150
	byte	86
	byte	86
	byte	89
	byte	101
	byte	138




