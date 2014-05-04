;---------------------------------------
;
;	animation cel data
;

tbear_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000

	word	tbear_data_a - tbear_data


tbear_data_a:
	byte	0x05, 0x21, 0xff, 0x0b, 0x00, 0x00

	byte	run,0x80+1
	byte	2
	byte	run,4,9
	byte	2
	byte	run,0x80+5
	byte	10
	byte	37
	byte	37
	byte	run,3,38
	byte	9
	byte	2
	byte	run,0x80+13
	byte	160
	byte	88
	byte	86
	byte	101
	byte	101
	byte	149
	byte	85
	byte	149
	byte	41
	byte	run,3,9
	byte	137
	byte	105
	byte	86
	byte	run,3,85
	byte	90
	byte	160
	byte	2
	byte	run,7,9
	byte	37
	byte	38
	byte	37
	byte	37
	byte	10
	byte	run,0x80+3
	byte	128
	byte	106
	byte	run,14,85
	byte	149
	byte	85
	byte	102
	byte	89
	byte	106
	byte	106
	byte	85
	byte	149
	byte	149
	byte	85
	byte	85
	byte	170
	byte	128
	byte	run,0x80+1
	byte	2
	byte	9
	byte	37
	byte	150
	byte	86
	byte	run,3,85
	byte	90
	byte	run,4,88
	byte	90
	byte	101
	byte	run,3,85
	byte	105
	byte	130
	byte	96
	byte	run,5,88
	byte	152
	byte	152
	byte	86
	byte	102
	byte	150
	byte	150
	byte	40
	byte	128
	byte	96
	byte	run,3,88
	byte	152
	byte	96
	byte	128
	byte	run,0x80+4
	byte	168
	byte	86
	byte	86
	byte	run,3,102
	byte	88
	byte	160
	byte	run,0x80+13




