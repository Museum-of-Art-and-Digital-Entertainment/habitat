;---------------------------------------
;
;	animation cel data
;

mdrop_data::
	byte	both	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000

	word	mdrop_data_a - mdrop_data


mdrop_data_a:
	byte	0x04, 0x35, 0x00, 0x08, 0x00, 0x00
	byte	170
	byte	run,5,150
	byte	149
	byte	149
	byte	154
	byte	run,18,153
	byte	170
	byte	run,8,149
	byte	154
	byte	run,3,153
	byte	154
	byte	run,7,153
	byte	42
	byte	run,0x80+7
	byte	128
	byte	128
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,18,85
	byte	170
	byte	85
	byte	106
	byte	run,3,111
	byte	106
	byte	85
	byte	85
	byte	170
	byte	run,3,85
	byte	170
	byte	85
	byte	85
	byte	90
	byte	101
	byte	106
	byte	101
	byte	85
	byte	170
	byte	run,3,47
	byte	42
	byte	run,0x80+3
	byte	2
	byte	2
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,18,85
	byte	170
	byte	85
	byte	169
	byte	run,3,249
	byte	169
	byte	85
	byte	85
	byte	170
	byte	run,3,85
	byte	170
	byte	85
	byte	85
	byte	165
	byte	89
	byte	169
	byte	89
	byte	85
	byte	170
	byte	run,3,248
	byte	168
	byte	170
	byte	run,5,150
	byte	86
	byte	86
	byte	166
	byte	run,18,102
	byte	170
	byte	run,8,86
	byte	166
	byte	run,3,102
	byte	166
	byte	run,7,102
	byte	168
	byte	run,0x80+4




