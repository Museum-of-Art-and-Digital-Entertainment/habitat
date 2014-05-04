;---------------------------------------
;
;	animation cel data
;

pfork_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	236+right,20+left,255

	byte	0b11000000

	word	pfork_data_a - pfork_data
	word	pfork_data_b - pfork_data


pfork_data_a:
	byte	0x01, 0x36, 0x01, 0x16, 0x00, 0x00
	byte	32
	byte	run,52,152
	byte	168




pfork_data_b:
	byte	0x03, 0x1a, 0x00, 0x30, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	run,0x80+1
	byte	10
	byte	37
	byte	37
	byte	150
	byte	run,11,152
	byte	run,4,32
	byte	run,0x80+4
	byte	168
	byte	154
	byte	152
	byte	86
	byte	85
	byte	85
	byte	154
	byte	run,14,152
	byte	run,5,32
	byte	run,0x80+3
	byte	128
	byte	96
	byte	96
	byte	88
	byte	run,11,152
	byte	run,4,32
	byte	run,0x80+4




