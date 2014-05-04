;---------------------------------------
;
;	animation cel data
;

juke_data::
	byte	both	+ 0
	byte	0b11000000
	byte	no_animation
	byte	no_cont

	byte	244+right,32+left,255

	byte	0b11000000

	word	juke_data_a - juke_data
	word	juke_data_b - juke_data


juke_data_a:
	byte	0x06, 0x24, 0xff, 0xf6, 0x00, 0x00

	byte	170
	byte	149
	byte	149
	byte	150
	byte	run,32,151
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,6,254
	byte	run,17,234
	byte	254
	byte	174
	byte	254
	byte	174
	byte	254
	byte	174
	byte	254
	byte	254
	byte	255
	byte	170
	byte	85
	byte	85
	byte	run,6,102
	byte	103
	byte	run,3,93
	byte	87
	byte	101
	byte	run,12,106
	byte	85
	byte	run,4,106
	byte	85
	byte	86
	byte	171
	byte	255
	byte	170
	byte	85
	byte	85
	byte	run,7,102
	byte	run,3,214
	byte	86
	byte	102
	byte	run,12,166
	byte	86
	byte	run,4,166
	byte	86
	byte	86
	byte	170
	byte	255
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,6,255
	byte	run,17,175
	byte	255
	byte	235
	byte	255
	byte	235
	byte	255
	byte	235
	byte	run,3,255
	byte	170
	byte	run,35,86




juke_data_b:
	byte	0x06, 0x19, 0xff, 0x0f, 0x00, 0x00

	byte	run,16,151
	byte	39
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+3
	byte	170
	byte	191
	byte	187
	byte	191
	byte	187
	byte	191
	byte	187
	byte	191
	byte	170
	byte	255
	byte	170
	byte	190
	byte	190
	byte	191
	byte	170
	byte	191
	byte	234
	byte	239
	byte	123
	byte	94
	byte	87
	byte	85
	byte	149
	byte	42
	byte	run,0x80+1
	byte	170
	byte	254
	byte	238
	byte	254
	byte	238
	byte	254
	byte	238
	byte	254
	byte	170
	byte	255
	byte	run,3,170
	byte	190
	byte	238
	byte	239
	byte	239
	byte	191
	byte	255
	byte	191
	byte	234
	byte	127
	byte	85
	byte	85
	byte	170
	byte	170
	byte	255
	byte	239
	byte	255
	byte	239
	byte	255
	byte	239
	byte	255
	byte	170
	byte	255
	byte	run,3,170
	byte	run,6,255
	byte	250
	byte	175
	byte	245
	byte	85
	byte	85
	byte	170
	byte	171
	byte	251
	byte	187
	byte	251
	byte	187
	byte	251
	byte	187
	byte	251
	byte	171
	byte	255
	byte	171
	byte	run,5,251
	byte	239
	byte	237
	byte	181
	byte	213
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+1
	byte	run,16,86
	byte	run,3,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+3




