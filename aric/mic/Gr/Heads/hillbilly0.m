;---------------------------------------
;
;	animation cel data
;

hillbilly0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	hillbilly0_start_end - hillbilly0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	hillbilly0_data_a - hillbilly0_data
	word	hillbilly0_data_b - hillbilly0_data
	word	hillbilly0_data_c - hillbilly0_data

hillbilly0_start_end:
	byte	0,0,1,1,0,0,2,2


hillbilly0_data_a:
	byte	0x05, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+3
	byte	4
	byte	run,6,1
	byte	5
	byte	5
	byte	run,4,21
	byte	run,7,85
	byte	21
	byte	4
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	95
	byte	95
	byte	run,4,85
	byte	run,4,87
	byte	run,11,85
	byte	21
	byte	run,0x80+3
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	127
	byte	127
	byte	126
	byte	run,4,255
	byte	223
	byte	95
	byte	94
	byte	95
	byte	87
	byte	87
	byte	run,7,85
	byte	run,0x80+6
	byte	160
	byte	run,3,248
	byte	168
	byte	224
	byte	224
	byte	232
	byte	248
	byte	248
	byte	160
	byte	128
	byte	168
	byte	run,3,224
	byte	80
	byte	84
	byte	run,6,85
	byte	21
	byte	69
	byte	run,0x80+22
	byte	run,5,64
	byte	run,0x80+2




hillbilly0_data_b:
	byte	0x05, 0x1e, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+14
	byte	run,6,1
	byte	run,0x80+10
	byte	3
	byte	run,3,2
	byte	26
	byte	run,4,95
	byte	94
	byte	run,4,127
	byte	95
	byte	94
	byte	95
	byte	95
	byte	87
	byte	run,4,85
	byte	17
	byte	5
	byte	5
	byte	1
	byte	run,0x80+3
	byte	255
	byte	254
	byte	run,3,170
	byte	239
	byte	255
	byte	255
	byte	171
	byte	254
	byte	255
	byte	171
	byte	255
	byte	255
	byte	187
	byte	186
	byte	255
	byte	253
	byte	213
	byte	run,8,85
	byte	21
	byte	5
	byte	1
	byte	run,0x80+4
	byte	144
	byte	run,3,212
	byte	213
	byte	213
	byte	run,4,245
	byte	run,3,213
	byte	85
	byte	84
	byte	run,9,85
	byte	84
	byte	68
	byte	run,0x80+11
	byte	run,6,64
	byte	run,0x80+5
	byte	64
	byte	run,0x80+1
	byte	run,3,64
	byte	run,0x80+3




hillbilly0_data_c:
	byte	cel_box + 0x03, 0x0e, 0xff, 0xfc, 0x00, 0x00
	byte	0x55

