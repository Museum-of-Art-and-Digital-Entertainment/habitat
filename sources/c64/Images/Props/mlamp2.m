;---------------------------------------
;
;	animation cel data
;

mlamp2_data::
	byte	swing	+ 10
	byte	0b00000000
	byte	mlamp2_start_end - mlamp2_data
	byte	no_cont

	byte	244+right,32+left,255

	byte	0b10000000
	byte	0b11000000
	byte	0b10100000
	byte	0b10010000
	byte	0b10001000
	byte	0b10000100
	byte	0b10001000
	byte	0b10010000
	byte	0b10100000
	byte	0b11000000
	byte	0b10000000

	word	mlamp2_data_a - mlamp2_data
	word	mlamp2_data_b - mlamp2_data
	word	mlamp2_data_c - mlamp2_data
	word	mlamp2_data_d - mlamp2_data
	word	mlamp2_data_e - mlamp2_data
	word	mlamp2_data_f - mlamp2_data

mlamp2_start_end:
	byte	0,0,0,5,cycle+4,5,6,10


mlamp2_data_a:
	byte	0x06, 0x15, 0x00, 0xff, 0x00, 0x00
	byte	run,0x80+9
	byte	10
	byte	37
	byte	37
	byte	run,5,38
	byte	37
	byte	9
	byte	10
	byte	run,0x80+1
	byte	10
	byte	11
	byte	10
	byte	2
	byte	run,0x80+3
	byte	10
	byte	165
	byte	85
	byte	85
	byte	165
	byte	37
	byte	run,4,38
	byte	166
	byte	86
	byte	170
	byte	run,0x80+1
	byte	170
	byte	255
	byte	170
	byte	85
	byte	149
	byte	37
	byte	165
	byte	run,6,85
	byte	170
	byte	149
	byte	41
	byte	2
	byte	9
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	255
	byte	170
	byte	85
	byte	85
	byte	86
	byte	86
	byte	run,6,85
	byte	170
	byte	85
	byte	90
	byte	96
	byte	88
	byte	88
	byte	96
	byte	128
	byte	168
	byte	248
	byte	168
	byte	96
	byte	128
	byte	run,0x80+1
	byte	128
	byte	106
	byte	run,4,85
	byte	105
	byte	130
	byte	130
	byte	2
	byte	run,0x80+13
	byte	128
	byte	96
	byte	96
	byte	run,3,88
	byte	86
	byte	170
	byte	run,0x80+5




mlamp2_data_b:
	byte	0x02, 0x09, 0x04, 0x03, 0x00, 0x00
	byte	run,0x80+1
	byte	3
	byte	run,3,15
	byte	3
	byte	run,0x80+1
	byte	3
	byte	12
	byte	240
	byte	192
	byte	192
	byte	run,0x80+1
	byte	run,3,240
	byte	192
	byte	run,0x80+1




mlamp2_data_c:
	byte	0x03, 0x19, 0x04, 0x13, 0x00, 0x00
	byte	run,0x80+1
	byte	run,4,3
	byte	run,0x80+4
	byte	3
	byte	3
	byte	15
	byte	run,3,63
	byte	15
	byte	15
	byte	3
	byte	run,0x80+7
	byte	252
	byte	240
	byte	192
	byte	192
	byte	252
	byte	255
	byte	63
	byte	63
	byte	run,6,255
	byte	run,3,252
	byte	255
	byte	255
	byte	63
	byte	3
	byte	run,0x80+3
	byte	3
	byte	run,0x80+7
	byte	run,6,192
	byte	run,0x80+7
	byte	192
	byte	48
	byte	48
	byte	240
	byte	run,0x80+1




mlamp2_data_d:
	byte	0x04, 0x40, 0x04, 0x3a, 0x00, 0x00
	byte	run,0x80+16
	byte	run,5,3
	byte	run,0x80+8
	byte	3
	byte	3
	byte	run,3,15
	byte	run,5,63
	byte	62
	byte	62
	byte	14
	byte	14
	byte	2
	byte	9
	byte	run,5,47
	byte	43
	byte	run,8,11
	byte	2
	byte	2
	byte	run,0x80+3
	byte	48
	byte	12
	byte	12
	byte	48
	byte	192
	byte	252
	byte	60
	byte	63
	byte	run,4,15
	byte	63
	byte	run,10,255
	byte	run,5,63
	byte	run,7,255
	byte	250
	byte	239
	byte	191
	byte	191
	byte	254
	byte	251
	byte	186
	byte	run,3,191
	byte	254
	byte	run,4,255
	byte	190
	byte	170
	byte	run,9,255
	byte	191
	byte	47
	byte	10
	byte	run,0x80+8
	byte	run,4,192
	byte	run,0x80+4
	byte	192
	byte	240
	byte	252
	byte	252
	byte	run,15,255
	byte	171
	byte	254
	byte	255
	byte	255
	byte	175
	byte	251
	byte	171
	byte	255
	byte	255
	byte	191
	byte	175
	byte	run,4,255
	byte	239
	byte	234
	byte	run,10,255
	byte	254
	byte	168
	byte	run,0x80+23
	byte	run,5,192
	byte	run,6,240
	byte	run,3,252
	byte	191
	byte	191
	byte	239
	byte	239
	byte	175
	byte	175
	byte	163
	byte	152
	byte	run,5,254
	byte	186
	byte	184
	byte	run,7,248
	byte	224
	byte	224
	byte	128
	byte	run,0x80+2




mlamp2_data_e:
	byte	0x04, 0x1d, 0x04, 0x3a, 0x00, 0x00
	byte	run,0x80+4
	byte	run,5,2
	byte	11
	byte	run,5,47
	byte	43
	byte	run,8,11
	byte	2
	byte	2
	byte	run,0x80+3
	byte	10
	byte	47
	byte	191
	byte	191
	byte	254
	byte	251
	byte	186
	byte	run,3,191
	byte	254
	byte	run,4,255
	byte	190
	byte	170
	byte	run,9,255
	byte	191
	byte	47
	byte	10
	byte	168
	byte	254
	byte	255
	byte	255
	byte	175
	byte	251
	byte	171
	byte	255
	byte	255
	byte	191
	byte	175
	byte	run,4,255
	byte	239
	byte	234
	byte	run,10,255
	byte	254
	byte	168
	byte	run,0x80+2
	byte	128
	byte	128
	byte	224
	byte	224
	byte	run,3,160
	byte	184
	byte	run,5,254
	byte	186
	byte	184
	byte	run,7,248
	byte	224
	byte	224
	byte	128
	byte	run,0x80+2




mlamp2_data_f:
	byte	0x04, 0x1e, 0x04, 0x3a, 0x00, 0x00
	byte	run,0x80+5
	byte	run,5,2
	byte	11
	byte	run,5,47
	byte	43
	byte	run,8,11
	byte	2
	byte	2
	byte	run,0x80+3
	byte	10
	byte	47
	byte	47
	byte	191
	byte	190
	byte	251
	byte	251
	byte	190
	byte	run,3,191
	byte	254
	byte	run,4,255
	byte	190
	byte	170
	byte	run,9,255
	byte	191
	byte	47
	byte	10
	byte	168
	byte	254
	byte	254
	byte	255
	byte	175
	byte	251
	byte	251
	byte	175
	byte	255
	byte	255
	byte	191
	byte	175
	byte	run,4,255
	byte	239
	byte	234
	byte	run,10,255
	byte	254
	byte	168
	byte	run,0x80+3
	byte	128
	byte	128
	byte	224
	byte	224
	byte	run,3,160
	byte	184
	byte	run,5,254
	byte	186
	byte	184
	byte	run,7,248
	byte	224
	byte	224
	byte	128
	byte	run,0x80+2




