;---------------------------------------
;
;	animation cel data
;

bwall5_data::					; plain wall or sky
	byte	swing	+ 1
	byte	0b11000000
	byte	bwall5_start_end - bwall5_data
	byte	no_cont

	byte	0+left,0+left,12

	byte	0b10000000
	byte	0b01000000

	word	bwall5_data_a - bwall5_data
	word	bwall5_data_b - bwall5_data


bwall5_start_end:
	byte	0,0,1,1



bwall5_data_a:
	byte	cel_trap + col + 0x01, 0x80, 0x01, 0x69, 0x00, 0x00
	byte	pat_wild

	byte	0,	159,	0,	159


bwall5_data_b:
	byte	cel_trap + col + 0x01, 0x80, 0x01, 0x69, 0x00, 0x00
	byte	pat_glass

	byte	0,	159,	0,	159


