;---------------------------------------
;
;	animation cel data
;

rock1_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	236+right,24+left,255

	byte	0b10000000

	word	rock1_data_a - rock1_data


rock1_data_a:
	byte	0x02, 0x06, 0x00, 0xff, 0x00, 0x00

	byte	10
	byte	run,3,37
	byte	9
	byte	2
	byte	168
	byte	run,3,88
	byte	96
	byte	128




