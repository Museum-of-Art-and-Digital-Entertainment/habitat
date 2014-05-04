;---------------------------------------
;
;	animation cel data
;


; short wall.....floor data!

bwall4_data::
	byte	0x00
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	0+left,0+left,12

	byte	0b10000000

	word    bwall4_data_a - bwall4_data


bwall4_data_a:
	byte	cel_trap + col + 0x02, 0x20, 0xf8, 0x52, 0x00, 0x00
	byte	pat_wild

	byte	0,	159,	0,	159

