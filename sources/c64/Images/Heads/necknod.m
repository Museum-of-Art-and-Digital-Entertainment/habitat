;---------------------------------------
;
;	animation cel data
;

necknod_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	necknod_start_end - necknod_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	necknod_data_a - necknod_data
	word	necknod_data_b - necknod_data
	word	necknod_data_c - necknod_data

necknod_start_end:
	byte	0,0,1,1,0,0,2,2


necknod_data_a:
	byte	0x06, 0x29, 0x00, 0x13, 0x00, 0x00
	byte	run,0x80+15
	byte	run,5,2
	byte	run,0x80+22
	byte	47
	byte	42
	byte	37
	byte	run,4,9
	byte	25
	byte	37
	byte	37
	byte	run,4,149
	byte	run,5,86
	byte	150
	byte	run,3,149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+13
	byte	40
	byte	152
	byte	run,5,88
	byte	run,4,96
	byte	run,4,128
	byte	run,0x80+6
	byte	128
	byte	130
	byte	130
	byte	105
	byte	run,3,85
	byte	165
	byte	10
	byte	2
	byte	2
	byte	run,0x80+27
	byte	10
	byte	37
	byte	149
	byte	149
	byte	run,3,85
	byte	89
	byte	run,3,101
	byte	106
	byte	85
	byte	85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	run,0x80+2
	byte	8
	byte	10
	byte	run,0x80+18
	byte	160
	byte	90
	byte	85
	byte	85
	byte	86
	byte	89
	byte	101
	byte	101
	byte	85
	byte	85
	byte	86
	byte	86
	byte	89
	byte	86
	byte	run,4,85
	byte	90
	byte	160
	byte	40
	byte	162
	byte	8
	byte	2
	byte	run,0x80+19
	byte	128
	byte	96
	byte	160
	byte	88
	byte	88
	byte	106
	byte	run,5,86
	byte	152
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+6




necknod_data_b:
	byte	0x05, 0x2a, 0xfe, 0x13, 0x00, 0x00
	byte	run,0x80+24
	byte	2
	byte	10
	byte	run,3,46
	byte	42
	byte	2
	byte	2
	byte	run,0x80+10
	byte	1
	byte	run,8,2
	byte	run,7,9
	byte	run,3,2
	byte	10
	byte	37
	byte	37
	byte	150
	byte	153
	byte	89
	byte	run,3,85
	byte	86
	byte	86
	byte	89
	byte	86
	byte	149
	byte	149
	byte	37
	byte	37
	byte	10
	byte	run,0x80+1
	byte	8
	byte	2
	byte	run,0x80+2
	byte	85
	byte	run,8,86
	byte	run,7,88
	byte	86
	byte	86
	byte	170
	byte	86
	byte	85
	byte	85
	byte	170
	byte	85
	byte	169
	byte	153
	byte	85
	byte	85
	byte	86
	byte	86
	byte	85
	byte	154
	byte	run,4,85
	byte	86
	byte	168
	byte	168
	byte	34
	byte	32
	byte	128
	byte	run,0x80+19
	byte	128
	byte	96
	byte	96
	byte	88
	byte	152
	byte	150
	byte	run,5,86
	byte	150
	byte	86
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1
	byte	128
	byte	run,0x80+28
	byte	128
	byte	run,3,224
	byte	160
	byte	run,0x80+12




necknod_data_c:
	byte	0x03, 0x0e, 0xff, 0x09, 0x00, 0x00
	byte	run,0x80+4
	byte	run,10,5
	byte	run,4,84
	byte	run,10,85
	byte	run,0x80+4
	byte	run,10,64




