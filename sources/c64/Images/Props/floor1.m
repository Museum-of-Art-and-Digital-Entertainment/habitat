;---------------------------------------
;
;	animation cel data
;

floor1_data::
	byte	swing	+ 0
	byte	0b01000000
	byte	no_animation
	byte	no_cont

	byte	0,0,0

	byte	0b11000000

	word	floor1_data_a - floor1_data
	word	floor1_data_b - floor1_data


floor1_data_a:
	byte	cel_box + 0x01, 0x01, 0x00, 0x04, 0x00, 0x00
	byte	0x00

floor1_data_b:
	byte	cel_trap + col + 0x01, 0x20, 0x00, 0x1f, 0x00, 0x00
	byte	pat_wild

	byte	0,	159,	0,	159

