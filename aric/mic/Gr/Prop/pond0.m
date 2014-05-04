;---------------------------------------
;
;	animation cel data
;

pond0_data::
	byte	swing	+ 5
	byte	0b00000000
	byte	pond0_start_end - pond0_data
	byte	no_cont

	byte	244+right,44+left,255

	byte	0b11100000
	byte	0b10000000
	byte	0b11000000
	byte	0b10100000
	byte	0b01000000
	byte	0b00100000

	word	pond0_data_a - pond0_data
	word	pond0_data_b - pond0_data
	word	pond0_data_c - pond0_data

pond0_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


pond0_data_a:
	byte	0x0c, 0x0f, 0xf9, 0x10, 0x00, 0x00
	byte	run,0x80+5
	byte	5
	byte	21
	byte	run,3,85
	byte	21
	byte	5
	byte	run,0x80+6
	byte	1
	byte	run,8,85
	byte	21
	byte	run,0x80+4
	byte	5
	byte	run,10,85
	byte	1
	byte	run,0x80+2
	byte	1
	byte	run,12,85
	byte	run,0x80+2
	byte	run,13,85
	byte	21
	byte	5
	byte	run,29,85
	byte	64
	byte	run,14,85
	byte	run,0x80+2
	byte	run,12,85
	byte	84
	byte	run,0x80+3
	byte	run,11,85
	byte	run,0x80+5
	byte	84
	byte	run,8,85
	byte	80
	byte	run,0x80+6
	byte	64
	byte	80
	byte	84
	byte	run,3,85
	byte	84
	byte	64
	byte	run,0x80+2




pond0_data_b:
	byte	0x05, 0x0f, 0xfa, 0x15, 0x00, 0x00
	byte	run,0x80+2
	byte	3
	byte	12
	byte	run,0x80+1
	byte	3
	byte	run,3,11
	byte	2
	byte	2
	byte	run,0x80+4
	byte	15
	byte	255
	byte	240
	byte	15
	byte	run,7,255
	byte	191
	byte	47
	byte	10
	byte	run,0x80+1
	byte	255
	byte	255
	byte	run,0x80+1
	byte	run,11,255
	byte	170
	byte	240
	byte	255
	byte	run,0x80+1
	byte	252
	byte	run,8,255
	byte	250
	byte	160
	byte	run,0x80+3
	byte	192
	byte	48
	byte	192
	byte	240
	byte	run,3,248
	byte	224
	byte	224
	byte	128
	byte	run,0x80+3




pond0_data_c:
	byte	0x04, 0x2a, 0x00, 0x30, 0x00, 0x00
	byte	run,0x80+7
	byte	12
	byte	run,0x80+1
	byte	run,11,12
	byte	run,3,48
	byte	192
	byte	run,0x80+21
	byte	12
	byte	12
	byte	192
	byte	run,0x80+1
	byte	12
	byte	run,12,204
	byte	run,3,195
	byte	run,4,51
	byte	48
	byte	48
	byte	run,4,12
	byte	run,4,3
	byte	run,0x80+5
	byte	12
	byte	run,3,204
	byte	run,0x80+1
	byte	192
	byte	run,5,204
	byte	195
	byte	195
	byte	run,3,192
	byte	run,4,48
	byte	run,4,12
	byte	run,3,3
	byte	run,3,192
	byte	48
	byte	48
	byte	12
	byte	run,0x80+4
	byte	run,3,192
	byte	48
	byte	12
	byte	run,0x80+13
	byte	192
	byte	192
	byte	48
	byte	12
	byte	3
	byte	run,0x80+9
	byte	192
	byte	run,0x80+14




