;---------------------------------------
;
;	animation cel data
;

bwall9_data::					; glass wall or sky
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	0+left,0+left,12

	byte	0b10000000

	word	bwall9_data_a - bwall9_data


bwall9_data_a:
	byte	cel_trap + col + 0x01, 0x80, 0x01, 0x69, 0x00, 0x00
	byte	pat_glass

	byte	0,	159,	0,	159

