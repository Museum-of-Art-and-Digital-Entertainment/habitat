;---------------------------------------
;
;	animation cel data
;

cleo_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	cleo_start_end - cleo_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	cleo_data_a - cleo_data
	word	cleo_data_b - cleo_data
	word	cleo_data_c - cleo_data

cleo_start_end:
	byte	0,0,1,1,0,0,2,2


cleo_data_a:
	byte	0x04, 0x19, 0x00, 0x02, 0x00, 0x00
	byte	run,19,10
	byte	9
	byte	10
	byte	2
	byte	2
	byte	run,0x80+2
	byte	run,19,170
	byte	85
	byte	run,4,170
	byte	42
	byte	128
	byte	168
	byte	run,3,184
	byte	174
	byte	171
	byte	175
	byte	190
	byte	191
	byte	191
	byte	run,4,255
	byte	190
	byte	171
	byte	174
	byte	171
	byte	85
	byte	run,5,170
	byte	run,0x80+5
	byte	128
	byte	192
	byte	run,3,128
	byte	192
	byte	224
	byte	240
	byte	240
	byte	176
	byte	128
	byte	192
	byte	128
	byte	224
	byte	run,5,144
	byte	4




cleo_data_b:
	byte	0x04, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,20,2
	byte	run,0x80+5
	byte	171
	byte	run,4,170
	byte	171
	byte	171
	byte	run,3,175
	byte	run,3,191
	byte	190
	byte	186
	byte	175
	byte	170
	byte	175
	byte	175
	byte	149
	byte	170
	byte	170
	byte	42
	byte	10
	byte	run,0x80+1
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	239
	byte	171
	byte	239
	byte	255
	byte	239
	byte	255
	byte	255
	byte	186
	byte	186
	byte	187
	byte	254
	byte	255
	byte	255
	byte	85
	byte	run,4,154
	byte	16
	byte	run,7,170
	byte	run,3,234
	byte	run,4,250
	byte	186
	byte	234
	byte	170
	byte	234
	byte	234
	byte	90
	byte	168
	byte	168
	byte	160
	byte	128
	byte	run,0x80+1




cleo_data_c:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	run,19,42
	byte	run,0x80+5
	byte	run,19,170
	byte	run,0x80+1
	byte	run,4,32
	byte	run,19,160
	byte	run,0x80+5




