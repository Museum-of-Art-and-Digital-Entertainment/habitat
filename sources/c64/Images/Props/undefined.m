;---------------------------------------
;
;	animation cel data
;

undefined_data::
	byte	out	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	0,0,0

	byte	0b11000000

	word	undefined_data_a - undefined_data
	word	undefined_data_b - undefined_data


undefined_data_a:
	byte	cel_box + both_bord + 0x06, 0x12, 0xfe, 0xfe, 0x00, 0x00
	byte	0q3333

undefined_data_b:
	byte	0x06, 0x08, 0xfe, 0xf9, 0x00, 0x00

	byte	run,8,2
	byte	162
	byte	2
	byte	2
	byte	130
	byte	run,3,2
	byte	162
	byte	run,4,34
	byte	run,3,162
	byte	34
	byte	run,0x80+3
	byte	160
	byte	run,3,32
	byte	162
	byte	run,5,128
	byte	130
	byte	130
	byte	162
	byte	run,5,128
	byte	160
	byte	32
	byte	32




