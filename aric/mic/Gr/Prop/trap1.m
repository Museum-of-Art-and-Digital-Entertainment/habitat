;---------------------------------------
;
;	animation cel data
;

trap1_data::
	byte	both	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	0,0,0

	byte	0b10000000

	word	trap1_data_a - trap1_data

trap1_data_a:
	byte	cel_trap + pat + 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	byte	pat_wild

	byte	0,	24-1,	0,	24-1

;	include "../Pat/brick1.m"
	include "../Pat/mod.m"



