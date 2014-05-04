;---------------------------------------
;
;	animation cel data
;

motohead_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	motohead_start_end - motohead_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000

	word	motohead_data_a - motohead_data
	word	motohead_data_b - motohead_data
	word	motohead_data_c - motohead_data

motohead_start_end:
	byte	0,0,1,1,0,0,2,2


motohead_data_a:
	byte	0x07, 0x24, 0xfd, 0x0e, 0x00, 0x00
	byte	run,0x80+26
	byte	run,5,2
	byte	run,0x80+11
	byte	42
	byte	47
	byte	42
	byte	run,9,2
	byte	9
	byte	37
	byte	37
	byte	38
	byte	170
	byte	37
	byte	149
	byte	149
	byte	90
	byte	run,3,101
	byte	90
	byte	149
	byte	149
	byte	37
	byte	10
	byte	run,0x80+7
	byte	160
	byte	224
	byte	160
	byte	run,0x80+1
	byte	2
	byte	9
	byte	9
	byte	2
	byte	run,0x80+2
	byte	2
	byte	170
	byte	86
	byte	86
	byte	170
	byte	130
	byte	160
	byte	128
	byte	96
	byte	96
	byte	88
	byte	152
	byte	154
	byte	154
	byte	88
	byte	96
	byte	98
	byte	130
	byte	2
	byte	run,0x80+8
	byte	run,3,2
	byte	170
	byte	run,3,85
	byte	149
	byte	149
	byte	37
	byte	165
	byte	105
	byte	105
	byte	170
	byte	34
	byte	run,0x80+7
	byte	40
	byte	130
	byte	162
	byte	run,3,34
	byte	128
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,5,170
	byte	run,7,85
	byte	105
	byte	121
	byte	85
	byte	85
	byte	149
	byte	42
	byte	9
	byte	170
	byte	37
	byte	170
	byte	9
	byte	9
	byte	37
	byte	37
	byte	165
	byte	37
	byte	165
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	255
	byte	255
	byte	191
	byte	111
	byte	106
	byte	run,4,85
	byte	165
	byte	229
	byte	85
	byte	85
	byte	86
	byte	168
	byte	96
	byte	170
	byte	88
	byte	170
	byte	96
	byte	96
	byte	88
	byte	88
	byte	90
	byte	88
	byte	88
	byte	160
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	160
	byte	224
	byte	224
	byte	232
	byte	248
	byte	248
	byte	170
	byte	150
	byte	154
	byte	154
	byte	150
	byte	106
	byte	96
	byte	128
	byte	128
	byte	run,0x80+4
	byte	8
	byte	174
	byte	8
	byte	run,0x80+2
	byte	8
	byte	174
	byte	8
	byte	run,0x80+2




motohead_data_b:
	byte	0x05, 0x24, 0xfe, 0x0d, 0x00, 0x00
	byte	run,0x80+9
	byte	2
	byte	42
	byte	38
	byte	37
	byte	run,5,9
	byte	run,3,2
	byte	run,0x80+15
	byte	3
	byte	run,3,2
	byte	run,3,11
	byte	47
	byte	47
	byte	175
	byte	175
	byte	191
	byte	191
	byte	170
	byte	149
	byte	154
	byte	154
	byte	149
	byte	106
	byte	85
	byte	85
	byte	149
	byte	149
	byte	150
	byte	38
	byte	10
	byte	9
	byte	42
	byte	2
	byte	2
	byte	run,5,9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	255
	byte	239
	byte	255
	byte	171
	byte	255
	byte	255
	byte	239
	byte	255
	byte	255
	byte	170
	byte	85
	byte	154
	byte	154
	byte	85
	byte	170
	byte	run,4,85
	byte	170
	byte	86
	byte	170
	byte	101
	byte	186
	byte	102
	byte	86
	byte	85
	byte	101
	byte	185
	byte	101
	byte	85
	byte	170
	byte	run,0x80+4
	byte	run,3,128
	byte	224
	byte	224
	byte	234
	byte	234
	byte	250
	byte	249
	byte	169
	byte	89
	byte	153
	byte	153
	byte	89
	byte	166
	byte	86
	byte	86
	byte	run,3,88
	byte	96
	byte	128
	byte	128
	byte	160
	byte	run,0x80+2
	byte	run,5,128
	byte	run,0x80+11
	byte	160
	byte	96
	byte	96
	byte	run,5,128
	byte	run,0x80+18




motohead_data_c:
	byte	0x05, 0x24, 0xfe, 0x0d, 0x00, 0x00
	byte	run,0x80+9
	byte	2
	byte	41
	byte	37
	byte	37
	byte	run,5,9
	byte	run,3,2
	byte	run,0x80+15
	byte	3
	byte	run,3,2
	byte	run,3,10
	byte	42
	byte	42
	byte	170
	byte	run,7,85
	byte	149
	byte	214
	byte	86
	byte	86
	byte	149
	byte	154
	byte	150
	byte	153
	byte	41
	byte	run,6,37
	byte	9
	byte	10
	byte	9
	byte	2
	byte	255
	byte	254
	byte	run,5,170
	byte	254
	byte	170
	byte	170
	byte	run,7,101
	byte	169
	byte	run,3,154
	byte	153
	byte	170
	byte	86
	byte	run,9,85
	byte	86
	byte	169
	byte	170
	byte	run,0x80+4
	byte	run,3,128
	byte	160
	byte	160
	byte	170
	byte	86
	byte	run,6,85
	byte	89
	byte	94
	byte	86
	byte	86
	byte	88
	byte	152
	byte	88
	byte	160
	byte	128
	byte	run,6,96
	byte	run,3,128
	byte	run,0x80+11
	byte	160
	byte	96
	byte	96
	byte	run,5,128
	byte	run,0x80+18




