;---------------------------------------
;
;	animation cel data
;

rock2_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	236+right,24+left,255

	byte	0b10000000

	word	rock2_data_a - rock2_data


rock2_data_a:
	byte	0x03, 0x0a, 0x00, 0xff, 0x00, 0x00

	byte	10
	byte	37
	byte	run,5,149
	byte	37
	byte	9
	byte	2
	byte	170
	byte	run,7,85
	byte	86
	byte	168
	byte	128
	byte	96
	byte	run,5,88
	byte	96
	byte	128
	byte	run,0x80+1




