;---------------------------------------
;
;	animation cel data
;

army1_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	army1_start_end - army1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	army1_data_a - army1_data
	word	army1_data_b - army1_data
	word	army1_data_c - army1_data

army1_start_end:
	byte	0,0,1,1,0,0,2,2


army1_data_a:
	byte	0x05, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+9
	byte	run,3,2
	byte	170
	byte	149
	byte	150
	byte	37
	byte	38
	byte	10
	byte	10
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+4
	byte	47
	byte	42
	byte	run,4,47
	byte	174
	byte	170
	byte	170
	byte	171
	byte	171
	byte	170
	byte	150
	byte	150
	byte	101
	byte	149
	byte	150
	byte	86
	byte	90
	byte	89
	byte	85
	byte	90
	byte	150
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	234
	byte	235
	byte	186
	byte	187
	byte	187
	byte	251
	byte	251
	byte	171
	byte	170
	byte	106
	byte	149
	byte	149
	byte	85
	byte	150
	byte	149
	byte	89
	byte	90
	byte	150
	byte	150
	byte	101
	byte	106
	byte	170
	byte	run,0x80+2
	byte	32
	byte	162
	byte	248
	byte	232
	byte	250
	byte	248
	byte	168
	byte	224
	byte	232
	byte	248
	byte	248
	byte	168
	byte	170
	byte	90
	byte	165
	byte	165
	byte	153
	byte	106
	byte	90
	byte	102
	byte	166
	byte	152
	byte	88
	byte	160
	byte	run,0x80+14
	byte	128
	byte	160
	byte	96
	byte	96
	byte	128
	byte	run,0x80+7




army1_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	run,0x80+4
	byte	2
	byte	2
	byte	10
	byte	38
	byte	37
	byte	9
	byte	10
	byte	10
	byte	9
	byte	9
	byte	run,3,2
	byte	run,0x80+3
	byte	3
	byte	2
	byte	34
	byte	10
	byte	47
	byte	187
	byte	191
	byte	175
	byte	191
	byte	175
	byte	239
	byte	239
	byte	174
	byte	170
	byte	170
	byte	154
	byte	101
	byte	85
	byte	150
	byte	86
	byte	85
	byte	86
	byte	106
	byte	169
	byte	37
	byte	10
	byte	255
	byte	254
	byte	170
	byte	170
	byte	238
	byte	255
	byte	239
	byte	255
	byte	170
	byte	255
	byte	239
	byte	255
	byte	186
	byte	run,3,170
	byte	86
	byte	102
	byte	149
	byte	149
	byte	102
	byte	90
	byte	86
	byte	101
	byte	89
	byte	170
	byte	run,0x80+3
	byte	136
	byte	224
	byte	248
	byte	250
	byte	184
	byte	250
	byte	232
	byte	238
	byte	238
	byte	234
	byte	169
	byte	165
	byte	153
	byte	105
	byte	89
	byte	165
	byte	105
	byte	102
	byte	150
	byte	150
	byte	104
	byte	96
	byte	128
	byte	run,0x80+12
	byte	128
	byte	96
	byte	96
	byte	run,5,128
	byte	run,0x80+6




army1_data_c:
	byte	0x03, 0x0e, 0xff, 0xf9, 0x00, 0x00
	byte	34
	byte	10
	byte	46
	byte	186
	byte	190
	byte	174
	byte	186
	byte	170
	byte	234
	byte	234
	byte	170
	byte	102
	byte	170
	byte	154
	byte	254
	byte	254
	byte	238
	byte	run,8,170
	byte	150
	byte	106
	byte	106
	byte	run,0x80+1
	byte	136
	byte	160
	byte	248
	byte	250
	byte	184
	byte	186
	byte	168
	byte	174
	byte	174
	byte	170
	byte	105
	byte	149
	byte	153




