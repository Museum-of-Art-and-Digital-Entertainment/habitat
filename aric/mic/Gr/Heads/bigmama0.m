;---------------------------------------
;
;	animation cel data
;

bigmama0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bigmama0_start_end - bigmama0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bigmama0_data_a - bigmama0_data
	word	bigmama0_data_b - bigmama0_data
	word	bigmama0_data_c - bigmama0_data

bigmama0_start_end:
	byte	0,0,1,1,0,0,2,2


bigmama0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+4
	byte	run,8,10
	byte	run,8,2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	run,16,170
	byte	149
	byte	149
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	175
	byte	191
	byte	run,3,255
	byte	191
	byte	189
	byte	189
	byte	191
	byte	175
	byte	170
	byte	171
	byte	174
	byte	175
	byte	171
	byte	170
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	216
	byte	224
	byte	216
	byte	240
	byte	112
	byte	120
	byte	240
	byte	176
	byte	168
	byte	224
	byte	224
	byte	160
	byte	run,4,128
	byte	run,0x80+2




bigmama0_data_b:
	byte	0x04, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+4
	byte	run,7,2
	byte	run,0x80+13
	byte	3
	byte	run,3,2
	byte	171
	byte	175
	byte	run,4,191
	byte	181
	byte	181
	byte	191
	byte	191
	byte	170
	byte	171
	byte	174
	byte	175
	byte	171
	byte	42
	byte	37
	byte	37
	byte	9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	255
	byte	255
	byte	239
	byte	155
	byte	239
	byte	255
	byte	237
	byte	253
	byte	255
	byte	187
	byte	186
	byte	255
	byte	254
	byte	255
	byte	255
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+4
	byte	170
	byte	234
	byte	run,4,250
	byte	122
	byte	120
	byte	248
	byte	248
	byte	168
	byte	168
	byte	232
	byte	232
	byte	168
	byte	160
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




bigmama0_data_c:
	byte	0x03, 0x10, 0xff, 0xfd, 0x00, 0x00
	byte	run,15,170
	byte	41
	byte	run,15,170
	byte	85
	byte	run,15,168
	byte	160




