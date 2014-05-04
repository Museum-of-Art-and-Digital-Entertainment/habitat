;---------------------------------------
;
;	animation cel data
;

plaque_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b10000000

	word	plaque_data_a - plaque_data


plaque_data_a:
	byte	0x04, 0x10, 0x01, 0x03, 0x00, 0x00
	byte	170
	byte	149
	byte	153
	byte	run,10,149
	byte	153
	byte	149
	byte	170
	byte	170
	byte	run,3,85
	byte	153
	byte	85
	byte	166
	byte	85
	byte	154
	byte	85
	byte	166
	byte	85
	byte	154
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	169
	byte	85
	byte	153
	byte	85
	byte	105
	byte	85
	byte	105
	byte	85
	byte	153
	byte	85
	byte	153
	byte	85
	byte	85
	byte	170
	byte	170
	byte	86
	byte	102
	byte	run,10,86
	byte	102
	byte	86
	byte	170




