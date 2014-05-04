;---------------------------------------
;
;	animation cel data
;

mbook0_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	236+right,20+left,255

	byte	0b10000000

	word	mbook0_data_a - mbook0_data


mbook0_data_a:
	byte	0x01, 0x0d, 0x01, 0x00, 0x00, 0x00
	byte	170
	byte	170
	byte	run,3,190
	byte	150
	byte	170
	byte	run,5,150
	byte	170




