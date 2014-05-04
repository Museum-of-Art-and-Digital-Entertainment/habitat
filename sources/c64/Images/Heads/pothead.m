;---------------------------------------
;
;	animation cel data
;

pothead_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	pothead_start_end - pothead_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	pothead_data_a - pothead_data
	word	pothead_data_b - pothead_data
	word	pothead_data_c - pothead_data

pothead_start_end:
	byte	0,0,1,1,0,0,2,2


pothead_data_a:
	byte	0x06, 0x28, 0xff, 0x12, 0x00, 0x00
	byte	run,0x80+10
	byte	run,10,2
	byte	run,0x80+24
	byte	2
	byte	11
	byte	47
	byte	47
	byte	191
	byte	191
	byte	run,10,255
	byte	run,8,191
	byte	run,5,47
	byte	11
	byte	11
	byte	2
	byte	2
	byte	run,0x80+4
	byte	47
	byte	42
	byte	47
	byte	170
	byte	run,17,255
	byte	239
	byte	run,5,187
	byte	239
	byte	run,8,255
	byte	191
	byte	175
	byte	10
	byte	40
	byte	184
	byte	248
	byte	170
	byte	run,6,255
	byte	254
	byte	run,4,249
	byte	250
	byte	251
	byte	251
	byte	run,20,255
	byte	250
	byte	160
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	run,3,248
	byte	170
	byte	run,4,86
	byte	170
	byte	run,6,254
	byte	251
	byte	251
	byte	234
	byte	150
	byte	154
	byte	154
	byte	150
	byte	232
	byte	run,4,248
	byte	run,3,224
	byte	128
	byte	128
	byte	run,0x80+18
	byte	128
	byte	run,6,224
	byte	128
	byte	run,0x80+16




pothead_data_b:
	byte	0x06, 0x2a, 0xfd, 0x13, 0x00, 0x00
	byte	run,0x80+24
	byte	run,5,2
	byte	run,0x80+18
	byte	2
	byte	11
	byte	11
	byte	run,3,47
	byte	run,9,191
	byte	run,3,47
	byte	175
	byte	239
	byte	239
	byte	run,3,251
	byte	171
	byte	run,3,11
	byte	run,4,2
	byte	run,0x80+5
	byte	3
	byte	2
	byte	2
	byte	42
	byte	191
	byte	run,5,255
	byte	254
	byte	249
	byte	249
	byte	229
	byte	229
	byte	230
	byte	235
	byte	239
	byte	run,6,255
	byte	250
	byte	229
	byte	230
	byte	230
	byte	229
	byte	250
	byte	run,7,255
	byte	191
	byte	191
	byte	47
	byte	11
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	run,5,255
	byte	171
	byte	86
	byte	run,4,85
	byte	170
	byte	255
	byte	255
	byte	235
	byte	run,6,190
	byte	169
	byte	102
	byte	86
	byte	101
	byte	186
	byte	run,11,255
	byte	170
	byte	run,0x80+3
	byte	160
	byte	248
	byte	254
	byte	run,5,255
	byte	191
	byte	191
	byte	run,3,111
	byte	175
	byte	239
	byte	239
	byte	run,5,255
	byte	191
	byte	run,4,111
	byte	191
	byte	255
	byte	run,3,254
	byte	run,3,248
	byte	run,3,224
	byte	128
	byte	run,0x80+7
	byte	128
	byte	128
	byte	run,3,224
	byte	run,10,248
	byte	224
	byte	224
	byte	232
	byte	238
	byte	238
	byte	run,4,190
	byte	168
	byte	run,0x80+11




pothead_data_c:
	byte	cel_box + 0x03, 0x15, 0xff, 0x07, 0x00, 0x00
	byte	0xff

