;---------------------------------------
;
;	animation cel data
;

camera0_data::
	byte	out	+ 2
	byte	0b00000000
	byte	camera0_start_end - camera0_data
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b01000000
	byte	0b11000000
	byte	0b10000000

	word	camera0_data_a - camera0_data
	word	camera0_data_b - camera0_data

camera0_start_end:
	byte	0,0,1,1,2,2


camera0_data_a:
	byte	0x05, 0x24, 0xfe, 0xf9, 0x00, 0x00
	byte	run,0x80+32
	byte	run,3,10
	byte	run,0x80+1
	byte	run,8,40
	byte	42
	byte	42
	byte	run,7,10
	byte	run,8,2
	byte	run,0x80+7
	byte	160
	byte	170
	byte	160
	byte	run,0x80+3
	byte	run,13,2
	byte	run,7,130
	byte	run,8,162
	byte	170
	byte	21
	byte	42
	byte	170
	byte	42
	byte	10
	byte	run,0x80+2
	byte	run,20,128
	byte	run,7,130
	byte	162
	byte	170
	byte	85
	byte	run,3,170
	byte	168
	byte	run,8,10
	byte	42
	byte	42
	byte	run,5,40
	byte	168
	byte	168
	byte	run,8,160
	byte	run,6,128
	byte	run,0x80+5




camera0_data_b:
	byte	0x05, 0x13, 0xff, 0x07, 0x00, 0x00
	byte	run,0x80+14
	byte	2
	byte	run,3,9
	byte	run,8,10
	byte	170
	byte	170
	byte	255
	byte	170
	byte	190
	byte	run,5,170
	byte	85
	byte	170
	byte	160
	byte	run,4,128
	byte	176
	byte	176
	byte	170
	byte	170
	byte	255
	byte	170
	byte	234
	byte	run,5,170
	byte	85
	byte	170
	byte	run,0x80+7
	byte	168
	byte	168
	byte	252
	byte	168
	byte	170
	byte	run,4,171
	byte	170
	byte	84
	byte	168
	byte	run,0x80+9
	byte	2
	byte	42
	byte	run,6,166
	byte	38
	byte	2




