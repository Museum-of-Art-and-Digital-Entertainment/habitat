;---------------------------------------
;
;	animation cel data
;

cinder_data::
	byte	out	+ 10
	byte	0b00000000
	byte	cinder_start_end - cinder_data
	byte	no_cont

	byte	0,0,0

	byte	0b10000000
	byte	0b10100000
	byte	0b10010000
	byte	0b10001000
	byte	0b01000000
	byte	0b01000100
	byte	0b01000010
	byte	0b01000010
	byte	0b01000010
	byte	0b01000100
	byte	0b01000000

	word	cinder_data_a - cinder_data
	word	cinder_data_b - cinder_data
	word	cinder_data_c - cinder_data
	word	cinder_data_d - cinder_data
	word	cinder_data_e - cinder_data
	word	cinder_data_f - cinder_data
	word	cinder_data_g - cinder_data

cinder_start_end:
	byte	0,0,0,10


cinder_data_a:
	byte	cel_box + 0x01, 0x01, 0xff, 0xf6, 0x00, 0x00
	byte	0x08

cinder_data_b:
	byte	0x05, 0x0e, 0xff, 0x01, 0x00, 0x00
	byte	run,0x80+2
	byte	8
	byte	2
	byte	run,0x80+11
	byte	8
	byte	162
	byte	42
	byte	170
	byte	40
	byte	10
	byte	8
	byte	2
	byte	2
	byte	run,0x80+4
	byte	128
	byte	8
	byte	42
	byte	130
	byte	170
	byte	136
	byte	34
	byte	170
	byte	42
	byte	168
	byte	162
	byte	40
	byte	168
	byte	32
	byte	run,0x80+1
	byte	32
	byte	170
	byte	42
	byte	170
	byte	168
	byte	170
	byte	136
	byte	160
	byte	128
	byte	run,0x80+6
	byte	34
	byte	128
	byte	160
	byte	128
	byte	run,0x80+8




cinder_data_c:
	byte	0x06, 0x25, 0x01, 0x26, 0x00, 0x00
	byte	32
	byte	40
	byte	38
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+5
	byte	170
	byte	37
	byte	9
	byte	2
	byte	run,0x80+24
	byte	128
	byte	96
	byte	88
	byte	86
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	170
	byte	run,3,85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	42
	byte	9
	byte	2
	byte	run,0x80+16
	byte	128
	byte	96
	byte	88
	byte	86
	byte	run,9,85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	85
	byte	85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+16
	byte	128
	byte	96
	byte	88
	byte	86
	byte	85
	byte	85
	byte	106
	byte	128
	byte	96
	byte	88
	byte	86
	byte	85
	byte	85
	byte	149
	byte	149
	byte	85
	byte	85
	byte	86
	byte	88
	byte	88
	byte	86
	byte	150
	byte	37
	byte	9
	byte	2
	byte	run,0x80+16
	byte	128
	byte	96
	byte	168
	byte	run,0x80+4
	byte	128
	byte	96
	byte	88
	byte	86
	byte	85
	byte	85
	byte	170
	byte	run,0x80+4
	byte	run,3,128
	byte	160
	byte	run,0x80+26
	byte	128
	byte	96
	byte	168
	byte	run,0x80+8




cinder_data_d:
	byte	0x04, 0x18, 0x00, 0x11, 0x00, 0x00
	byte	run,0x80+2
	byte	2
	byte	43
	byte	47
	byte	run,5,191
	byte	43
	byte	run,3,11
	byte	2
	byte	run,0x80+9
	byte	2
	byte	11
	byte	139
	byte	239
	byte	run,8,255
	byte	254
	byte	254
	byte	249
	byte	169
	byte	2
	byte	run,0x80+7
	byte	160
	byte	run,3,248
	byte	254
	byte	run,3,255
	byte	254
	byte	248
	byte	254
	byte	255
	byte	191
	byte	106
	byte	86
	byte	86
	byte	85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+8
	byte	run,3,128
	byte	run,0x80+3
	byte	128
	byte	128
	byte	run,0x80+3
	byte	128
	byte	128
	byte	96
	byte	96
	byte	88
	byte	152
	byte	38
	byte	10




cinder_data_e:
	byte	0x07, 0x1a, 0xfe, 0x0e, 0x00, 0x00
	byte	run,0x80+8
	byte	run,4,2
	byte	run,0x80+18
	byte	10
	byte	47
	byte	191
	byte	191
	byte	run,3,255
	byte	254
	byte	run,3,187
	byte	190
	byte	190
	byte	46
	byte	10
	byte	run,0x80+9
	byte	2
	byte	139
	byte	234
	byte	239
	byte	run,3,191
	byte	239
	byte	run,8,255
	byte	190
	byte	171
	byte	run,3,191
	byte	47
	byte	11
	byte	2
	byte	42
	byte	191
	byte	255
	byte	255
	byte	254
	byte	190
	byte	run,11,255
	byte	191
	byte	255
	byte	251
	byte	254
	byte	run,3,255
	byte	254
	byte	168
	byte	run,0x80+1
	byte	128
	byte	226
	byte	171
	byte	251
	byte	254
	byte	254
	byte	run,3,255
	byte	254
	byte	251
	byte	255
	byte	251
	byte	run,4,254
	byte	251
	byte	251
	byte	175
	byte	255
	byte	239
	byte	138
	byte	run,0x80+4
	byte	128
	byte	224
	byte	248
	byte	248
	byte	254
	byte	run,3,190
	byte	254
	byte	248
	byte	254
	byte	run,6,255
	byte	250
	byte	run,3,224
	byte	128
	byte	run,0x80+15
	byte	run,6,128
	byte	run,0x80+7




cinder_data_f:
	byte	0x02, 0x0b, 0x00, 0x0c, 0x00, 0x00
	byte	run,0x80+3
	byte	3
	byte	3
	byte	run,0x80+6
	byte	48
	byte	48
	byte	192
	byte	192
	byte	240
	byte	204
	byte	51
	byte	15
	byte	63
	byte	48
	byte	60




cinder_data_g:
	byte	0x02, 0x24, 0x01, 0x26, 0x00, 0x00
	byte	48
	byte	48
	byte	204
	byte	51
	byte	15
	byte	3
	byte	15
	byte	63
	byte	51
	byte	252
	byte	63
	byte	15
	byte	15
	byte	63
	byte	63
	byte	60
	byte	252
	byte	252
	byte	240
	byte	252
	byte	63
	byte	63
	byte	3
	byte	15
	byte	15
	byte	12
	byte	15
	byte	3
	byte	run,0x80+13
	byte	run,3,192
	byte	run,0x80+3
	byte	192
	byte	192
	byte	run,0x80+8
	byte	run,3,192
	byte	run,0x80+3
	byte	240
	byte	252
	byte	60
	byte	252
	byte	204
	byte	192
	byte	240
	byte	48
	byte	12




