;---------------------------------------
;
;	animation cel data
;

madsci0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	madsci0_start_end - madsci0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	madsci0_data_a - madsci0_data
	word	madsci0_data_b - madsci0_data
	word	madsci0_data_c - madsci0_data

madsci0_start_end:
	byte	0,0,1,1,0,0,2,2


madsci0_data_a:
	byte	0x04, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+7
	byte	run,7,2
	byte	1
	byte	2
	byte	1
	byte	1
	byte	6
	byte	1
	byte	5
	byte	1
	byte	21
	byte	20
	byte	20
	byte	81
	byte	5
	byte	17
	byte	4
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	191
	byte	255
	byte	255
	byte	254
	byte	219
	byte	219
	byte	91
	byte	91
	byte	86
	byte	run,5,85
	byte	87
	byte	87
	byte	31
	byte	86
	byte	84
	byte	64
	byte	64
	byte	run,0x80+2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	251
	byte	239
	byte	190
	byte	185
	byte	249
	byte	229
	byte	230
	byte	251
	byte	255
	byte	231
	byte	167
	byte	106
	byte	run,3,95
	byte	run,3,255
	byte	254
	byte	168
	byte	run,0x80+8
	byte	128
	byte	224
	byte	224
	byte	160
	byte	run,3,96
	byte	160
	byte	232
	byte	248
	byte	232
	byte	232
	byte	160
	byte	run,3,224
	byte	run,3,128
	byte	run,0x80+7




madsci0_data_b:
	byte	0x05, 0x1d, 0xfe, 0x06, 0x00, 0x00
	byte	run,0x80+8
	byte	run,4,2
	byte	run,0x80+1
	byte	2
	byte	1
	byte	run,0x80+1
	byte	1
	byte	9
	byte	17
	byte	6
	byte	17
	byte	5
	byte	73
	byte	21
	byte	37
	byte	20
	byte	21
	byte	68
	byte	16
	byte	3
	byte	run,3,2
	byte	11
	byte	47
	byte	190
	byte	185
	byte	249
	byte	229
	byte	234
	byte	251
	byte	191
	byte	186
	byte	165
	byte	149
	byte	149
	byte	165
	byte	106
	byte	run,3,111
	byte	91
	byte	86
	byte	80
	byte	64
	byte	run,0x80+3
	byte	255
	byte	254
	byte	170
	byte	238
	byte	255
	byte	171
	byte	86
	byte	85
	byte	85
	byte	169
	byte	254
	byte	239
	byte	255
	byte	254
	byte	185
	byte	101
	byte	101
	byte	185
	byte	254
	byte	run,4,255
	byte	170
	byte	run,0x80+9
	byte	128
	byte	224
	byte	248
	byte	184
	byte	190
	byte	110
	byte	174
	byte	190
	byte	248
	byte	186
	byte	105
	byte	90
	byte	89
	byte	105
	byte	169
	byte	run,3,229
	byte	149
	byte	85
	byte	21
	byte	4
	byte	1
	byte	run,0x80+19
	byte	128
	byte	run,0x80+1
	byte	96
	byte	132
	byte	64
	byte	80
	byte	97
	byte	80
	byte	72
	byte	80
	byte	17
	byte	64




madsci0_data_c:
	byte	0x03, 0x11, 0xff, 0xfd, 0x00, 0x00
	byte	run,0x80+1
	byte	10
	byte	46
	byte	187
	byte	175
	byte	run,3,255
	byte	221
	byte	149
	byte	149
	byte	165
	byte	85
	byte	85
	byte	101
	byte	85
	byte	87
	byte	136
	byte	170
	byte	254
	byte	run,5,255
	byte	221
	byte	run,5,85
	byte	117
	byte	253
	byte	255
	byte	run,0x80+1
	byte	128
	byte	224
	byte	184
	byte	232
	byte	run,4,254
	byte	120
	byte	90
	byte	101
	byte	90
	byte	run,3,85
	byte	213




