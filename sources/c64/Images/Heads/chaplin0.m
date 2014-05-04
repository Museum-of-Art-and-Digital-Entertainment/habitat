;---------------------------------------
;
;	animation cel data
;

chaplin0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	chaplin0_start_end - chaplin0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	chaplin0_data_a - chaplin0_data
	word	chaplin0_data_b - chaplin0_data
	word	chaplin0_data_c - chaplin0_data

chaplin0_start_end:
	byte	0,0,1,1,0,0,2,2


chaplin0_data_a:
	byte	0x04, 0x1c, 0x00, 0x06, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	run,0x80+1
	byte	run,3,2
	byte	run,3,10
	byte	42
	byte	170
	byte	170
	byte	2
	byte	2
	byte	run,0x80+9
	byte	47
	byte	42
	byte	run,4,47
	byte	43
	byte	171
	byte	170
	byte	170
	byte	run,3,171
	byte	run,12,170
	byte	42
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	250
	byte	235
	byte	239
	byte	175
	byte	190
	byte	191
	byte	191
	byte	255
	byte	255
	byte	234
	byte	174
	byte	171
	byte	run,10,170
	byte	168
	byte	160
	byte	run,0x80+4
	byte	128
	byte	224
	byte	224
	byte	160
	byte	run,3,232
	byte	254
	byte	190
	byte	184
	byte	176
	byte	224
	byte	170
	byte	170
	byte	160
	byte	run,3,128
	byte	run,0x80+6




chaplin0_data_b:
	byte	0x05, 0x1c, 0xfe, 0x05, 0x00, 0x00
	byte	run,0x80+13
	byte	2
	byte	10
	byte	2
	byte	10
	byte	10
	byte	170
	byte	170
	byte	run,0x80+8
	byte	3
	byte	run,4,2
	byte	10
	byte	11
	byte	run,3,47
	byte	175
	byte	run,3,191
	byte	175
	byte	170
	byte	174
	byte	171
	byte	170
	byte	170
	byte	run,5,42
	byte	10
	byte	2
	byte	run,0x80+1
	byte	255
	byte	254
	byte	run,3,170
	byte	254
	byte	255
	byte	235
	byte	174
	byte	175
	byte	171
	byte	run,3,255
	byte	187
	byte	186
	byte	186
	byte	255
	byte	run,9,170
	byte	168
	byte	run,0x80+5
	byte	128
	byte	128
	byte	run,3,224
	byte	232
	byte	248
	byte	248
	byte	250
	byte	234
	byte	170
	byte	234
	byte	run,3,170
	byte	run,5,160
	byte	128
	byte	run,0x80+16
	byte	128
	byte	run,0x80+1
	byte	128
	byte	128
	byte	160
	byte	160
	byte	run,0x80+8




chaplin0_data_c:
	byte	0x03, 0x0d, 0xff, 0xfb, 0x00, 0x00
	byte	run,5,10
	byte	run,21,170
	byte	run,5,128
	byte	run,8,160




