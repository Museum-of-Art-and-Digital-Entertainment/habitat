;---------------------------------------
;
;	animation cel data
;

barred_data::
	byte	out	+ 2
	byte	0b00100000
	byte	barred_start_end - barred_data
	byte	no_cont

	byte	240+right,36+left,255

	byte	0b11100000
	byte	0b00100000
	byte	0b11000000

	word	barred_data_a - barred_data
	word	barred_data_b - barred_data
	word	barred_data_c - barred_data

barred_start_end:
	byte	0,0,1,1,2,2


barred_data_a:
	byte	cel_box + 0x01, 0x01, 0xfd, 0x14, 0x00, 0x00
	byte	0x08

barred_data_b:
	byte	cel_box + 0x04, 0x1c, 0xfe, 0x38, 0x00, 0x00
	byte	0xaa

barred_data_c:
	byte	0x06, 0x2a, 0xfd, 0x3d, 0x00, 0x00
	byte	10
	byte	42
	byte	42
	byte	43
	byte	46
	byte	47
	byte	47
	byte	187
	byte	190
	byte	run,3,191
	byte	187
	byte	175
	byte	187
	byte	190
	byte	191
	byte	191
	byte	187
	byte	175
	byte	190
	byte	run,4,191
	byte	190
	byte	187
	byte	187
	byte	175
	byte	191
	byte	191
	byte	190
	byte	191
	byte	190
	byte	43
	byte	47
	byte	11
	byte	11
	byte	2
	byte	run,0x80+3
	byte	run,3,170
	byte	255
	byte	170
	byte	255
	byte	251
	byte	246
	byte	246
	byte	run,22,4
	byte	196
	byte	196
	byte	244
	byte	180
	byte	251
	byte	255
	byte	254
	byte	251
	byte	175
	byte	11
	byte	2
	byte	run,3,170
	byte	255
	byte	170
	byte	255
	byte	239
	byte	219
	byte	219
	byte	run,26,16
	byte	208
	byte	239
	byte	255
	byte	254
	byte	255
	byte	255
	byte	run,4,170
	byte	255
	byte	170
	byte	255
	byte	190
	byte	109
	byte	109
	byte	run,26,65
	byte	126
	byte	191
	byte	255
	byte	251
	byte	254
	byte	254
	byte	168
	byte	run,3,170
	byte	254
	byte	175
	byte	255
	byte	255
	byte	190
	byte	187
	byte	run,4,15
	byte	14
	byte	11
	byte	run,3,15
	byte	14
	byte	15
	byte	11
	byte	run,3,15
	byte	14
	byte	15
	byte	11
	byte	14
	byte	run,3,15
	byte	63
	byte	63
	byte	238
	byte	251
	byte	255
	byte	254
	byte	254
	byte	248
	byte	160
	byte	run,0x80+3
	byte	run,6,128
	byte	run,5,224
	byte	160
	byte	run,6,224
	byte	160
	byte	run,7,224
	byte	160
	byte	run,6,224
	byte	128
	byte	128
	byte	run,0x80+6




