;---------------------------------------
;
;	animation cel data
;

bwall6_data::					; bricks
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	0+left,0+left,12

	byte	0b10000000

	word	bwall6_data_a - bwall6_data


bwall6_data_a:
	byte	cel_trap + pat + 0x01, 0x80, 0x01, 0x69, 0x00, 0x00
	byte	0xff

	byte	0,	159,	0,	159

	include "../Pat/brick1.m"
;	include "../Pat/mod.m"


