;---------------------------------------
;
;	animation cel data
;

mstaff_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	236+right,20+left,255

	byte	0b10000000

	word	mstaff_data_a - mstaff_data


mstaff_data_a:
	byte	0x01, 0x46, 0x01, 0x26, 0x00, 0x00
	byte	32
	byte	run,62,168
	byte	run,6,184
	byte	32




