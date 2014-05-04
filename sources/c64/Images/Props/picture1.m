;---------------------------------------
;
;	animation cel data
;

picture1_data::
	byte	at_side	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b10000000

	word	picture1_data_a - picture1_data


picture1_data_a:
	byte	0x04, 0x13, 0xff, 0x08, 0x00, 0x00

	byte	42
	byte	run,3,149
	byte	154
	byte	run,4,153
	byte	154
	byte	run,4,153
	byte	154
	byte	run,3,149
	byte	42
	byte	170
	byte	run,3,85
	byte	run,5,102
	byte	89
	byte	89
	byte	run,4,102
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	run,10,101
	byte	102
	byte	run,3,85
	byte	170
	byte	168
	byte	run,3,86
	byte	run,10,150
	byte	166
	byte	run,3,86
	byte	168




