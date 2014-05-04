;---------------------------------------
;
;	animation cel data
;

gabor0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	gabor0_start_end - gabor0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	gabor0_data_a - gabor0_data
	word	gabor0_data_b - gabor0_data
	word	gabor0_data_c - gabor0_data

gabor0_start_end:
	byte	0,0,1,1,0,0,2,2


gabor0_data_a:
	byte	0x05, 0x1b, 0xff, 0x05, 0x00, 0x00
	byte	run,0x80+12
	byte	1
	byte	run,0x80+4
	byte	run,3,1
	byte	run,0x80+2
	byte	1
	byte	run,0x80+6
	byte	17
	byte	5
	byte	20
	byte	65
	byte	5
	byte	21
	byte	81
	byte	70
	byte	5
	byte	21
	byte	17
	byte	66
	byte	5
	byte	85
	byte	17
	byte	69
	byte	21
	byte	21
	byte	85
	byte	69
	byte	20
	byte	16
	byte	1
	byte	run,0x80+3
	byte	47
	byte	42
	byte	87
	byte	93
	byte	87
	byte	run,3,85
	byte	86
	byte	87
	byte	run,11,85
	byte	69
	byte	89
	byte	5
	byte	4
	byte	run,0x80+1
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	95
	byte	126
	byte	249
	byte	229
	byte	230
	byte	251
	byte	127
	byte	127
	byte	95
	byte	110
	byte	86
	byte	94
	byte	87
	byte	run,6,85
	byte	96
	byte	65
	byte	16
	byte	run,0x80+4
	byte	128
	byte	224
	byte	160
	byte	96
	byte	96
	byte	160
	byte	248
	byte	254
	byte	248
	byte	144
	byte	170
	byte	224
	byte	225
	byte	149
	byte	84
	byte	84
	byte	81
	byte	84
	byte	81
	byte	84
	byte	81
	byte	16
	byte	run,0x80+1




gabor0_data_b:
	byte	0x05, 0x1b, 0xfe, 0x04, 0x00, 0x00
	byte	run,0x80+3
	byte	1
	byte	17
	byte	5
	byte	17
	byte	69
	byte	5
	byte	17
	byte	69
	byte	5
	byte	21
	byte	85
	byte	5
	byte	21
	byte	85
	byte	17
	byte	21
	byte	84
	byte	21
	byte	4
	byte	21
	byte	4
	byte	run,0x80+3
	byte	3
	byte	2
	byte	22
	byte	70
	byte	90
	byte	111
	byte	47
	byte	190
	byte	185
	byte	185
	byte	190
	byte	191
	byte	191
	byte	185
	byte	170
	byte	111
	byte	111
	byte	106
	byte	155
	byte	run,3,85
	byte	73
	byte	18
	byte	20
	byte	68
	byte	run,0x80+1
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	171
	byte	86
	byte	85
	byte	169
	byte	254
	byte	239
	byte	255
	byte	185
	byte	186
	byte	255
	byte	187
	byte	254
	byte	245
	byte	run,4,85
	byte	170
	byte	85
	byte	65
	byte	1
	byte	run,0x80+2
	byte	16
	byte	68
	byte	149
	byte	229
	byte	229
	byte	249
	byte	185
	byte	185
	byte	249
	byte	249
	byte	245
	byte	185
	byte	169
	byte	233
	byte	228
	byte	148
	byte	88
	byte	81
	byte	81
	byte	100
	byte	132
	byte	17
	byte	84
	byte	84
	byte	16
	byte	run,0x80+4
	byte	16
	byte	68
	byte	68
	byte	run,0x80+1
	byte	68
	byte	81
	byte	run,3,20
	byte	64
	byte	68
	byte	16
	byte	65
	byte	17
	byte	64
	byte	16
	byte	80
	byte	84
	byte	81
	byte	1
	byte	run,0x80+3




gabor0_data_c:
	byte	cel_box + 0x03, 0x15, 0xff, 0x01, 0x00, 0x00
	byte	0x55

