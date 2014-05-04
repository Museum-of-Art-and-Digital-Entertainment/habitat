;---------------------------------------
;
;	animation cel data
;

witch0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	witch0_start_end - witch0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10011000
	byte	0b01000110
	byte	0b01100110

	word	witch0_data_a - witch0_data
	word	witch0_data_b - witch0_data
	word	witch0_data_c - witch0_data
	word	witch0_data_d - witch0_data
	word	witch0_data_e - witch0_data
	word	witch0_data_f - witch0_data
	word	witch0_data_g - witch0_data

witch0_start_end:
	byte	0,0,1,1,0,0,2,2


witch0_data_a:
	byte	0x03, 0x20, 0x01, 0x0a, 0x00, 0x00
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	171
	byte	171
	byte	run,13,170
	byte	run,5,42
	byte	40
	byte	160
	byte	40
	byte	184
	byte	250
	byte	250
	byte	239
	byte	239
	byte	191
	byte	190
	byte	190
	byte	254
	byte	249
	byte	250
	byte	191
	byte	175
	byte	run,13,170
	byte	168
	byte	128
	byte	run,0x80+5
	byte	168
	byte	254
	byte	248
	byte	254
	byte	170
	byte	run,3,88
	byte	104
	byte	190
	byte	234
	byte	168
	byte	run,3,170
	byte	run,6,168
	byte	160
	byte	run,3,128
	byte	run,0x80+5




witch0_data_b:
	byte	0x04, 0x20, 0xfe, 0x09, 0x00, 0x00
	byte	run,0x80+8
	byte	run,4,2
	byte	10
	byte	run,3,170
	byte	42
	byte	2
	byte	2
	byte	run,0x80+3
	byte	2
	byte	2
	byte	run,0x80+8
	byte	3
	byte	2
	byte	10
	byte	run,3,47
	byte	191
	byte	190
	byte	249
	byte	229
	byte	230
	byte	235
	byte	190
	byte	run,12,170
	byte	42
	byte	10
	byte	2
	byte	run,0x80+4
	byte	255
	byte	254
	byte	170
	byte	239
	byte	171
	byte	255
	byte	171
	byte	86
	byte	85
	byte	85
	byte	170
	byte	255
	byte	186
	byte	run,16,170
	byte	42
	byte	2
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	248
	byte	250
	byte	190
	byte	110
	byte	110
	byte	174
	byte	250
	byte	186
	byte	run,8,170
	byte	run,5,168
	byte	run,5,160




witch0_data_c:
	byte	0x03, 0x0c, 0xff, 0xf7, 0x00, 0x00
	byte	10
	byte	run,3,46
	byte	run,8,170
	byte	run,3,254
	byte	run,9,170
	byte	128
	byte	run,3,224
	byte	168
	byte	run,7,170




witch0_data_d:
	byte	0x02, 0x0a, 0xff, 0xfe, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	10
	byte	32
	byte	run,0x80+4
	byte	2
	byte	42
	byte	run,3,170
	byte	run,5,2




witch0_data_e:
	byte	0x02, 0x05, 0x04, 0xfd, 0x00, 0x00
	byte	160
	byte	170
	byte	170
	byte	10
	byte	run,0x80+2
	byte	128
	byte	168
	byte	42
	byte	2




witch0_data_f:
	byte	0x02, 0x05, 0xfc, 0xf9, 0x00, 0x00
	byte	10
	byte	10
	byte	run,0x80+4
	byte	170
	byte	170
	byte	2
	byte	2




witch0_data_g:
	byte	0x02, 0x0a, 0x02, 0x01, 0x00, 0x00
	byte	128
	byte	128
	byte	160
	byte	160
	byte	run,4,170
	byte	42
	byte	10
	byte	run,0x80+4
	byte	128
	byte	run,3,170
	byte	168
	byte	168




