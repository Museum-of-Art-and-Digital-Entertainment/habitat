;---------------------------------------
;
;	animation cel data
;

port7_data::
	byte	both	+ 2
	byte	0b10000000
	byte	port7_start_end - port7_data
	byte	no_cont

	byte	8+down,8+down,3

	byte	0b11111100
	byte	0b11111100
	byte	0b10111100

	word	port7_data_a - port7_data
	word	port7_data_b - port7_data
	word	port7_data_c - port7_data
	word	port7_data_d - port7_data
	word	port7_data_e - port7_data
	word	port7_data_f - port7_data

port7_start_end:
	byte	0,0,cycle+0,2


port7_data_a:
	byte	cel_box + both_bord + 0x06, 0x28, 0xfe, 0xfb, 0x00, 0x00
	byte	0q1111

port7_data_b:
	byte	0x06, 0x10, 0xfe, 0xf1, 0x00, 0x00
	byte	8
	byte	10
	byte	run,4,11
	byte	43
	byte	59
	byte	run,3,63
	byte	47
	byte	11
	byte	2
	byte	run,0x80+4
	byte	128
	byte	224
	byte	248
	byte	254
	byte	255
	byte	255
	byte	239
	byte	235
	byte	226
	byte	run,3,224
	byte	160
	byte	32
	byte	32
	byte	40
	byte	46
	byte	run,3,47
	byte	175
	byte	239
	byte	run,3,255
	byte	191
	byte	47
	byte	11
	byte	2
	byte	run,0x80+4
	byte	128
	byte	224
	byte	248
	byte	254
	byte	255
	byte	191
	byte	175
	byte	139
	byte	130
	byte	run,5,128
	byte	160
	byte	184
	byte	190
	byte	run,4,191
	byte	run,4,254
	byte	190
	byte	46
	byte	10
	byte	2
	byte	run,0x80+4
	byte	128
	byte	224
	byte	248
	byte	252
	byte	252
	byte	188
	byte	44
	byte	8
	byte	run,0x80+4




port7_data_c:
	byte	0x06, 0x03, 0xfe, 0xfe, 0x00, 0x00
	byte	40
	byte	170
	byte	40
	byte	run,0x80+12
	byte	40
	byte	170
	byte	40




port7_data_d:
	byte	0x06, 0x1b, 0xfe, 0x3d, 0x00, 0x00
	byte	170
	byte	run,12,191
	byte	170
	byte	46
	byte	46
	byte	170
	byte	46
	byte	170
	byte	46
	byte	170
	byte	8
	byte	46
	byte	8
	byte	run,0x80+3
	byte	170
	byte	255
	byte	255
	byte	run,4,239
	byte	234
	byte	238
	byte	238
	byte	234
	byte	255
	byte	255
	byte	170
	byte	11
	byte	11
	byte	130
	byte	2
	byte	128
	byte	run,0x80+1
	byte	128
	byte	run,0x80+1
	byte	2
	byte	11
	byte	10
	byte	47
	byte	170
	byte	170
	byte	255
	byte	255
	byte	234
	byte	run,6,238
	byte	234
	byte	255
	byte	255
	byte	170
	byte	run,4,255
	byte	170
	byte	11
	byte	42
	byte	191
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	run,3,238
	byte	235
	byte	234
	byte	238
	byte	238
	byte	234
	byte	255
	byte	255
	byte	170
	byte	run,4,255
	byte	170
	byte	224
	byte	168
	byte	254
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	run,7,251
	byte	234
	byte	255
	byte	255
	byte	170
	byte	224
	byte	224
	byte	130
	byte	128
	byte	130
	byte	run,0x80+1
	byte	2
	byte	run,0x80+1
	byte	128
	byte	224
	byte	160
	byte	248
	byte	170
	byte	170
	byte	run,12,254
	byte	170
	byte	184
	byte	184
	byte	170
	byte	184
	byte	170
	byte	184
	byte	170
	byte	32
	byte	184
	byte	32
	byte	run,0x80+3




port7_data_e:
	byte	0x02, 0x06, 0x00, 0x43, 0x00, 0x00
	byte	run,4,11
	byte	2
	byte	2
	byte	run,4,224
	byte	128
	byte	128




port7_data_f:
	byte	0x08, 0x05, 0xfd, 0x22, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	2
	byte	run,0x80+2
	byte	40
	byte	170
	byte	255
	byte	190
	byte	40
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,0x80+13
	byte	2
	byte	2
	byte	run,0x80+2
	byte	40
	byte	170
	byte	255
	byte	190
	byte	40
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,0x80+2




