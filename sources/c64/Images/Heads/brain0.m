;---------------------------------------
;
;	animation cel data
;

brain0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	brain0_start_end - brain0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	brain0_data_a - brain0_data
	word	brain0_data_b - brain0_data
	word	brain0_data_c - brain0_data

brain0_start_end:
	byte	0,0,1,1,0,0,2,2


brain0_data_a:
	byte	0x04, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	10
	byte	run,3,42
	byte	run,4,170
	byte	186
	byte	191
	byte	191
	byte	47
	byte	47
	byte	11
	byte	11
	byte	2
	byte	run,0x80+2
	byte	47
	byte	43
	byte	47
	byte	47
	byte	175
	byte	191
	byte	191
	byte	171
	byte	170
	byte	run,4,171
	byte	run,5,170
	byte	run,5,255
	byte	191
	byte	42
	byte	40
	byte	184
	byte	248
	byte	250
	byte	254
	byte	251
	byte	239
	byte	191
	byte	191
	byte	run,4,255
	byte	239
	byte	170
	byte	run,3,171
	byte	175
	byte	run,4,255
	byte	254
	byte	248
	byte	160
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	160
	byte	224
	byte	224
	byte	232
	byte	254
	byte	174
	byte	168
	byte	run,5,160
	byte	224
	byte	224
	byte	128
	byte	128
	byte	run,0x80+3




brain0_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	2
	byte	run,4,11
	byte	run,8,10
	byte	2
	byte	run,0x80+3
	byte	3
	byte	run,4,2
	byte	11
	byte	47
	byte	191
	byte	run,4,255
	byte	234
	byte	149
	byte	149
	byte	150
	byte	149
	byte	149
	byte	234
	byte	191
	byte	191
	byte	255
	byte	255
	byte	191
	byte	43
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	255
	byte	175
	byte	255
	byte	255
	byte	239
	byte	255
	byte	254
	byte	185
	byte	169
	byte	186
	byte	185
	byte	185
	byte	254
	byte	run,6,255
	byte	170
	byte	run,0x80+5
	byte	128
	byte	224
	byte	248
	byte	254
	byte	254
	byte	255
	byte	255
	byte	175
	byte	91
	byte	run,4,90
	byte	174
	byte	250
	byte	250
	byte	254
	byte	254
	byte	248
	byte	160
	byte	run,0x80+11
	byte	run,12,128
	byte	run,0x80+4




brain0_data_c:
	byte	0x03, 0x0f, 0xff, 0xfc, 0x00, 0x00
	byte	2
	byte	10
	byte	46
	byte	187
	byte	58
	byte	234
	byte	234
	byte	run,9,170
	byte	254
	byte	254
	byte	239
	byte	run,10,170
	byte	254
	byte	run,0x80+1
	byte	128
	byte	224
	byte	184
	byte	190
	byte	174
	byte	175
	byte	171
	byte	171
	byte	run,6,170




