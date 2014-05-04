;---------------------------------------
;
;	animation cel data
;

dobbs0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	dobbs0_start_end - dobbs0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	dobbs0_data_a - dobbs0_data
	word	dobbs0_data_b - dobbs0_data
	word	dobbs0_data_c - dobbs0_data

dobbs0_start_end:
	byte	0,0,1,1,0,0,2,2


dobbs0_data_a:
	byte	0x05, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+11
	byte	run,9,2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	run,4,47
	byte	175
	byte	174
	byte	170
	byte	run,4,171
	byte	run,8,170
	byte	42
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	191
	byte	190
	byte	190
	byte	249
	byte	249
	byte	254
	byte	239
	byte	239
	byte	175
	byte	174
	byte	175
	byte	175
	byte	191
	byte	174
	byte	run,4,170
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	162
	byte	104
	byte	160
	byte	96
	byte	160
	byte	224
	byte	168
	byte	248
	byte	176
	byte	224
	byte	160
	byte	224
	byte	224
	byte	128
	byte	run,3,160
	byte	128
	byte	run,0x80+4
	byte	32
	byte	168
	byte	168
	byte	40
	byte	40
	byte	run,0x80+15




dobbs0_data_b:
	byte	0x04, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	3
	byte	run,3,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	46
	byte	174
	byte	186
	byte	190
	byte	191
	byte	191
	byte	174
	byte	174
	byte	run,4,175
	byte	170
	byte	42
	byte	10
	byte	10
	byte	255
	byte	254
	byte	170
	byte	170
	byte	239
	byte	254
	byte	234
	byte	154
	byte	86
	byte	102
	byte	186
	byte	250
	byte	239
	byte	255
	byte	186
	byte	254
	byte	187
	byte	255
	byte	255
	byte	235
	byte	run,4,170
	byte	run,0x80+2
	byte	2
	byte	10
	byte	170
	byte	130
	byte	226
	byte	224
	byte	224
	byte	232
	byte	184
	byte	run,3,248
	byte	run,6,232
	byte	168
	byte	160
	byte	128
	byte	run,0x80+4
	byte	run,4,128
	byte	run,0x80+17




dobbs0_data_c:
	byte	0x03, 0x11, 0xff, 0xfd, 0x00, 0x00
	byte	2
	byte	10
	byte	10
	byte	run,3,46
	byte	42
	byte	run,10,170
	byte	run,3,254
	byte	238
	byte	run,13,170
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,3,224
	byte	160
	byte	run,10,168




