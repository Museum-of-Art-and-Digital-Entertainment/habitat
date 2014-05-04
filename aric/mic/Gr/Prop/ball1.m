;---------------------------------------
;
;	animation cel data
;

ball1_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000

	word	ball1_data_a - ball1_data


ball1_data_a:
	byte	0x03, 0x0d, 0x00, 0x00, 0x00, 0x00

	byte	run,0x80+2
	byte	2
	byte	2
	byte	run,5,9
	byte	2
	byte	2
	byte	run,0x80+2
	byte	42
	byte	149
	byte	run,9,85
	byte	149
	byte	42
	byte	run,0x80+1
	byte	128
	byte	96
	byte	96
	byte	run,5,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




