;---------------------------------------
;
;	animation cel data
;

ostrich0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	ostrich0_start_end - ostrich0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	ostrich0_data_a - ostrich0_data
	word	ostrich0_data_b - ostrich0_data
	word	ostrich0_data_c - ostrich0_data

ostrich0_start_end:
	byte	0,0,1,1,0,0,2,2


ostrich0_data_a:
	byte	0x04, 0x1d, 0x00, 0x08, 0x00, 0x00
	byte	run,0x80+17
	byte	run,7,2
	byte	run,0x80+6
	byte	149
	byte	run,10,37
	byte	run,5,149
	byte	run,3,86
	byte	run,4,85
	byte	149
	byte	151
	byte	39
	byte	11
	byte	2
	byte	96
	byte	run,7,88
	byte	run,5,96
	byte	run,4,128
	byte	2
	byte	43
	byte	191
	byte	254
	byte	250
	byte	127
	byte	95
	byte	87
	byte	234
	byte	232
	byte	248
	byte	160
	byte	run,0x80+17
	byte	160
	byte	96
	byte	128
	byte	run,0x80+1
	byte	170
	byte	254
	byte	248
	byte	224
	byte	128
	byte	run,0x80+3




ostrich0_data_b:
	byte	0x03, 0x1f, 0xff, 0x08, 0x00, 0x00
	byte	run,21,2
	byte	10
	byte	43
	byte	47
	byte	37
	byte	41
	byte	37
	byte	46
	byte	46
	byte	47
	byte	10
	byte	run,18,86
	byte	102
	byte	186
	byte	238
	byte	186
	byte	255
	byte	255
	byte	253
	byte	117
	byte	85
	byte	154
	byte	154
	byte	239
	byte	138
	byte	run,0x80+21
	byte	128
	byte	160
	byte	224
	byte	96
	byte	160
	byte	96
	byte	run,3,224
	byte	128




ostrich0_data_c:
	byte	0x03, 0x0c, 0xff, 0x07, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	1
	byte	run,7,5
	byte	run,3,84
	byte	154
	byte	run,7,85
	byte	69
	byte	run,0x80+5
	byte	run,7,64




