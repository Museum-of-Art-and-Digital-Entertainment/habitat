;---------------------------------------
;
;	animation cel data
;

fhead_data::
	byte	swing	+ 3
	byte	0b00000000
	byte	fhead_start_end - fhead_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000
	byte	0b00010000

	word	fhead_data_a - fhead_data
	word	fhead_data_b - fhead_data
	word	fhead_data_c - fhead_data
	word	fhead_data_d - fhead_data

fhead_start_end:
	byte	cycle+0,1,cycle+2,3,0,0,1,1


fhead_data_a:
	byte	0x03, 0x16, 0x01, 0x00, 0x00, 0x00
	byte	15
	byte	43
	byte	run,12,11
	byte	171
	byte	run,3,191
	byte	47
	byte	11
	byte	2
	byte	run,0x80+1
	byte	240
	byte	234
	byte	run,5,239
	byte	235
	byte	226
	byte	run,6,224
	byte	run,5,248
	byte	160
	byte	160
	byte	run,0x80+1
	byte	128
	byte	run,6,224
	byte	128
	byte	run,0x80+13




fhead_data_b:
	byte	0x03, 0x1a, 0x01, 0x04, 0x00, 0x00
	byte	15
	byte	43
	byte	run,16,11
	byte	171
	byte	run,3,191
	byte	47
	byte	11
	byte	2
	byte	run,0x80+1
	byte	240
	byte	234
	byte	run,5,239
	byte	235
	byte	226
	byte	run,10,224
	byte	run,5,248
	byte	160
	byte	160
	byte	run,0x80+1
	byte	128
	byte	run,6,224
	byte	128
	byte	run,0x80+17




fhead_data_c:
	byte	0x03, 0x12, 0xff, 0xfc, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	2
	byte	run,5,11
	byte	2
	byte	run,0x80+4
	byte	run,3,2
	byte	run,0x80+2
	byte	252
	byte	238
	byte	138
	byte	235
	byte	run,4,239
	byte	186
	byte	run,5,184
	byte	254
	byte	254
	byte	184
	byte	32
	byte	run,0x80+3
	byte	run,5,128
	byte	run,0x80+10




fhead_data_d:
	byte	0x03, 0x15, 0xff, 0xff, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	2
	byte	run,5,11
	byte	2
	byte	run,0x80+7
	byte	run,3,2
	byte	run,0x80+2
	byte	252
	byte	238
	byte	138
	byte	235
	byte	run,4,239
	byte	186
	byte	run,8,184
	byte	254
	byte	254
	byte	184
	byte	32
	byte	run,0x80+3
	byte	run,5,128
	byte	run,0x80+13




