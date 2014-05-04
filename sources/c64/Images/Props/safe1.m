;---------------------------------------
;
;	animation cel data
;

safe1_data::
	byte	both	+ 1
	byte	0b00000000
	byte	safe1_start_end - safe1_data
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b11000000
	byte	0b10100000

	word	safe1_data_a - safe1_data
	word	safe1_data_b - safe1_data
	word	safe1_data_c - safe1_data

safe1_start_end:
	byte	0,0,1,1


safe1_data_a:
	byte	0x04, 0x19, 0xff, 0xfe, 0x00, 0x00
	byte	run,3,170
	byte	175
	byte	run,17,173
	byte	175
	byte	run,6,170
	byte	255
	byte	run,17,85
	byte	255
	byte	run,6,170
	byte	255
	byte	run,17,85
	byte	255
	byte	run,6,170
	byte	250
	byte	run,17,122
	byte	250
	byte	run,3,170




safe1_data_b:
	byte	0x04, 0x11, 0xff, 0xfa, 0x00, 0x00
	byte	14
	byte	run,4,62
	byte	run,7,14
	byte	run,4,62
	byte	14
	byte	run,5,170
	byte	190
	byte	255
	byte	235
	byte	235
	byte	255
	byte	190
	byte	run,8,170
	byte	run,7,174
	byte	191
	byte	191
	byte	174
	byte	run,5,170
	byte	run,17,176




safe1_data_c:
	byte	0x04, 0x13, 0xfc, 0xfb, 0x00, 0x00
	byte	10
	byte	run,17,14
	byte	10
	byte	run,38,170
	byte	188
	byte	172
	byte	run,4,188
	byte	run,6,172
	byte	run,4,188
	byte	172
	byte	172
	byte	188




