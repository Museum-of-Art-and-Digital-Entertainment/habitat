;---------------------------------------
;
;	animation cel data
;

rock3_data::
	byte	both	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	244+right,36+left,255

	byte	0b10000000

	word	rock3_data_a - rock3_data


rock3_data_a:
	byte	0x06, 0x20, 0xfd, 0x03, 0x00, 0x00
	byte	run,0x80+7
	byte	run,4,2
	byte	run,7,9
	byte	run,5,2
	byte	run,0x80+10
	byte	2
	byte	9
	byte	37
	byte	run,3,149
	byte	run,16,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+2
	byte	42
	byte	149
	byte	run,28,85
	byte	149
	byte	42
	byte	170
	byte	run,30,85
	byte	170
	byte	128
	byte	104
	byte	86
	byte	run,25,85
	byte	86
	byte	88
	byte	160
	byte	run,0x80+4
	byte	128
	byte	96
	byte	96
	byte	run,4,88
	byte	run,12,86
	byte	run,3,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+4




