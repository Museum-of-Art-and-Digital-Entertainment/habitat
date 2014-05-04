;---------------------------------------
;
;	animation cel data
;

bwall8_data::
	byte	swing	+ 0
	byte	0b01000000
	byte	no_animation
	byte	no_cont

	byte	0+left,0+left,12

	byte	0b11000000

	word	bwall8_data_a - bwall8_data
	word	bwall8_data_b - bwall8_data


bwall8_data_a:
	byte	cel_box + 0x01, 0x01, 0x00, 0x02, 0x00, 0x00
	byte	0x00

bwall8_data_b:
	byte	cel_trap + col + 0x01, 0x40, 0x00, 0x3f, 0x00, 0x00
	byte	pat_wild

	byte	0,	159,	0,	159



