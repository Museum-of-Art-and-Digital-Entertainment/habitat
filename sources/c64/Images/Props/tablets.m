;---------------------------------------
;
;	animation cel data
;

tablets_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b10000000

	word	tablets_data_a - tablets_data


tablets_data_a:
	byte	0x04, 0x19, 0x00, 0x04, 0x00, 0x00

	byte	170
	byte	149
	byte	149
	byte	153
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	154
	byte	149
	byte	153
	byte	149
	byte	154
	byte	run,3,149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	170
	byte	86
	byte	86
	byte	166
	byte	86
	byte	166
	byte	86
	byte	102
	byte	86
	byte	166
	byte	86
	byte	102
	byte	86
	byte	166
	byte	86
	byte	166
	byte	86
	byte	102
	byte	run,3,86
	byte	88
	byte	88
	byte	96
	byte	128
	byte	170
	byte	85
	byte	85
	byte	105
	byte	85
	byte	106
	byte	85
	byte	105
	byte	85
	byte	106
	byte	85
	byte	102
	byte	85
	byte	102
	byte	85
	byte	105
	byte	85
	byte	102
	byte	run,3,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	168
	byte	88
	byte	88
	byte	152
	byte	88
	byte	152
	byte	88
	byte	152
	byte	88
	byte	152
	byte	88
	byte	152
	byte	run,3,88
	byte	152
	byte	88
	byte	152
	byte	run,3,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




