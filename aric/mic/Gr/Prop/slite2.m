;---------------------------------------
;
;	animation cel data
;

slite2_data::
	byte	both	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b11110000

	word	slite2_data_a - slite2_data
	word	slite2_data_b - slite2_data
	word	slite2_data_c - slite2_data
	word	slite2_data_d - slite2_data


slite2_data_a:
	byte	0x04, 0x07, 0xff, 0xd9, 0x00, 0x00
	byte	2
	byte	2
	byte	run,0x80+5
	byte	170
	byte	170
	byte	63
	byte	10
	byte	2
	byte	2
	byte	run,0x80+1
	byte	170
	byte	170
	byte	255
	byte	run,3,170
	byte	252
	byte	170
	byte	170
	byte	240
	byte	128
	byte	run,0x80+3




slite2_data_b:
	byte	cel_box + 0x01, 0x53, 0x01, 0x2c, 0x00, 0x00
	byte	0xa8

slite2_data_c:
	byte	0x05, 0x10, 0x01, 0x3c, 0x00, 0x00
	byte	run,10,170
	byte	168
	byte	252
	byte	168
	byte	168
	byte	run,0x80+4
	byte	128
	byte	128
	byte	160
	byte	168
	byte	run,4,170
	byte	42
	byte	2
	byte	run,0x80+11
	byte	128
	byte	168
	byte	run,3,170
	byte	42
	byte	run,0x80+12
	byte	160
	byte	run,4,170
	byte	2
	byte	run,0x80+11
	byte	128
	byte	run,4,170
	byte	2




slite2_data_d:
	byte	0x04, 0x0f, 0x06, 0x41, 0x00, 0x00
	byte	run,0x80+4
	byte	2
	byte	run,5,170
	byte	run,0x80+6
	byte	2
	byte	9
	byte	9
	byte	run,7,170
	byte	15
	byte	run,3,10
	byte	170
	byte	run,3,85
	byte	run,7,170
	byte	192
	byte	run,4,128
	byte	96
	byte	88
	byte	88
	byte	run,4,170
	byte	168
	byte	160
	byte	128
	byte	run,0x80+4




