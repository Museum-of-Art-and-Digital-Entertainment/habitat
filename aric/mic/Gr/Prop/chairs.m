;---------------------------------------
;
;	animation cel data
;

chairs_data::
	byte	both	+ 0
	byte	0b11110000
	byte	no_animation
	byte	chairs_contents_xy - chairs_data + 0x80

	byte	28+right,28+right,255

	byte	0b11110000

	word	chairs_data_a - chairs_data
	word	chairs_data_b - chairs_data
	word	chairs_data_c - chairs_data
	word	chairs_data_d - chairs_data

chairs_contents_xy:
	byte	2,242


chairs_data_a:
	byte	0x06, 0x04, 0xfe, 0xe1, 0x00, 0x00
	byte	170
	byte	run,3,149
	byte	128
	byte	128
	byte	160
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,0x80+3
	byte	170
	byte	2
	byte	2
	byte	10
	byte	170
	byte	170
	byte	run,3,86




chairs_data_b:
	byte	cel_box + lr_bord + 0x06, 0x16, 0xfe, 0xf7, 0x00, 0x00
	byte	0q1111

chairs_data_c:
	byte	0x06, 0x01, 0xfe, 0xf8, 0x00, 0x00
	byte	run,5,170
	byte	168




chairs_data_d:
	byte	0x02, 0x0f, 0xfe, 0x07, 0x00, 0x00
	byte	run,14,149
	byte	42
	byte	run,13,86
	byte	88
	byte	160




