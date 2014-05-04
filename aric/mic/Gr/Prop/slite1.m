;---------------------------------------
;
;	animation cel data
;

slite1_data::
	byte	both	+ 0
	byte	0b00100000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b11100000

	word	slite1_data_a - slite1_data
	word	slite1_data_b - slite1_data
	word	slite1_data_c - slite1_data


slite1_data_a:
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




slite1_data_b:
	byte	cel_box + 0x01, 0x4b, 0x01, 0x24, 0x00, 0x00
	byte	0xa8

slite1_data_c:
	byte	0x03, 0x1f, 0x00, 0x43, 0x00, 0x00

	byte	run,0x80+1
	byte	run,3,2
	byte	10
	byte	42
	byte	41
	byte	run,15,45
	byte	41
	byte	170
	byte	42
	byte	10
	byte	run,0x80+5
	byte	255
	byte	run,5,170
	byte	run,17,85
	byte	run,3,170
	byte	48
	byte	run,3,168
	byte	32
	byte	run,0x80+4
	byte	128
	byte	160
	byte	160
	byte	run,15,224
	byte	160
	byte	168
	byte	160
	byte	128
	byte	run,0x80+5




