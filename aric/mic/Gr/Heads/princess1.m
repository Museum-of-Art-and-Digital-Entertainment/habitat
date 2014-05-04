;---------------------------------------
;
;	animation cel data
;

princess1_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	princess1_start_end - princess1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01110000

	word	princess1_data_a - princess1_data
	word	princess1_data_b - princess1_data
	word	princess1_data_c - princess1_data
	word	princess1_data_d - princess1_data

princess1_start_end:
	byte	0,0,1,1,0,0,2,2


princess1_data_a:
	byte	0x05, 0x19, 0xff, 0x03, 0x00, 0x00
	byte	run,0x80+14
	byte	run,4,2
	byte	10
	byte	9
	byte	9
	byte	10
	byte	8
	byte	run,0x80+5
	byte	2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	165
	byte	run,5,149
	byte	run,3,86
	byte	106
	byte	98
	byte	98
	byte	186
	byte	32
	byte	run,0x80+4
	byte	47
	byte	170
	byte	run,6,85
	byte	86
	byte	106
	byte	174
	byte	run,11,170
	byte	42
	byte	10
	byte	40
	byte	168
	byte	104
	byte	120
	byte	110
	byte	111
	byte	187
	byte	175
	byte	187
	byte	239
	byte	191
	byte	191
	byte	190
	byte	170
	byte	174
	byte	175
	byte	170
	byte	175
	byte	171
	byte	run,6,170
	byte	run,0x80+4
	byte	128
	byte	224
	byte	224
	byte	144
	byte	224
	byte	240
	byte	248
	byte	252
	byte	160
	byte	232
	byte	224
	byte	160
	byte	224
	byte	168
	byte	224
	byte	run,4,160
	byte	128
	byte	run,0x80+1




princess1_data_b:
	byte	0x05, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	42
	byte	186
	byte	41
	byte	185
	byte	41
	byte	185
	byte	37
	byte	165
	byte	229
	byte	37
	byte	run,4,149
	byte	233
	byte	130
	byte	11
	byte	2
	byte	run,0x80+1
	byte	3
	byte	10
	byte	38
	byte	150
	byte	150
	byte	155
	byte	91
	byte	111
	byte	111
	byte	run,3,175
	byte	174
	byte	171
	byte	170
	byte	171
	byte	174
	byte	175
	byte	171
	byte	run,3,106
	byte	170
	byte	10
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	239
	byte	155
	byte	239
	byte	255
	byte	239
	byte	255
	byte	186
	byte	187
	byte	186
	byte	187
	byte	254
	byte	187
	byte	255
	byte	run,6,170
	byte	run,0x80+1
	byte	128
	byte	96
	byte	88
	byte	88
	byte	154
	byte	150
	byte	230
	byte	229
	byte	run,4,233
	byte	run,3,169
	byte	233
	byte	233
	byte	169
	byte	165
	byte	165
	byte	166
	byte	171
	byte	130
	byte	run,0x80+7
	byte	160
	byte	184
	byte	160
	byte	184
	byte	160
	byte	184
	byte	96
	byte	104
	byte	110
	byte	88
	byte	88
	byte	86
	byte	86
	byte	88
	byte	174
	byte	8
	byte	128
	byte	run,0x80+2




princess1_data_c:
	byte	cel_box + 0x03, 0x0f, 0xff, 0xff, 0x00, 0x00
	byte	0x55

princess1_data_d:
	byte	0x03, 0x05, 0xff, 0xf0, 0x00, 0x00
	byte	run,5,5
	byte	run,5,85
	byte	run,5,64




