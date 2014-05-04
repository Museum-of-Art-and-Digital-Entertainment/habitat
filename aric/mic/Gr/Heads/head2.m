;---------------------------------------
;
;	animation cel data
;

head2_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	head2_start_end - head2_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	head2_data_a - head2_data
	word	head2_data_b - head2_data
	word	head2_data_c - head2_data

head2_start_end:
	byte	0,0,1,1,0,0,2,2


head2_data_a:
	byte	0x04, 0x1c, 0x00, 0x06, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	42
	byte	38
	byte	run,10,37
	byte	run,4,9
	byte	2
	byte	2
	byte	run,0x80+2
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	186
	byte	run,3,255
	byte	191
	byte	191
	byte	run,3,190
	byte	run,4,191
	byte	111
	byte	91
	byte	86
	byte	run,5,85
	byte	170
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	255
	byte	191
	byte	191
	byte	255
	byte	255
	byte	191
	byte	run,7,255
	byte	170
	byte	run,3,86
	byte	85
	byte	170
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	run,3,128
	byte	run,0x80+3
	byte	run,3,128




head2_data_b:
	byte	0x03, 0x1c, 0xff, 0x05, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,9,191
	byte	47
	byte	47
	byte	11
	byte	2
	byte	run,0x80+5
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,14,255
	byte	171
	byte	155
	byte	155
	byte	154
	byte	run,4,152
	byte	168
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,9,248
	byte	224
	byte	224
	byte	128
	byte	run,0x80+6




head2_data_c:
	byte	0x01, 0x0a, 0x00, 0xfd, 0x00, 0x00
	byte	168
	byte	run,9,152




