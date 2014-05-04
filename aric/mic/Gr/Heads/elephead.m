;---------------------------------------
;
;	animation cel data
;

elephead_data::
	byte	swing	+ 2
	byte	0b10000000
	byte	elephead_start_end - elephead_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01100000
	byte	0b01000000

	word	elephead_data_a - elephead_data
	word	elephead_data_b - elephead_data
	word	elephead_data_c - elephead_data

elephead_start_end:
	byte	0,0,1,1,0,0,2,2


elephead_data_a:
	byte	0x06, 0x1d, 0xff, 0x02, 0x00, 0x00
	byte	run,0x80+14
	byte	8
	byte	38
	byte	run,3,37
	byte	run,3,9
	byte	2
	byte	2
	byte	run,0x80+16
	byte	8
	byte	38
	byte	150
	byte	149
	byte	149
	byte	run,6,85
	byte	102
	byte	89
	byte	149
	byte	37
	byte	10
	byte	run,0x80+8
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	85
	byte	85
	byte	149
	byte	149
	byte	101
	byte	101
	byte	105
	byte	89
	byte	85
	byte	149
	byte	89
	byte	101
	byte	run,3,149
	byte	37
	byte	10
	byte	run,0x80+5
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	86
	byte	run,7,85
	byte	run,3,86
	byte	101
	byte	89
	byte	run,3,85
	byte	86
	byte	168
	byte	run,0x80+1
	byte	2
	byte	2
	byte	run,0x80+5
	byte	130
	byte	98
	byte	169
	byte	run,5,85
	byte	run,3,86
	byte	run,3,88
	byte	run,3,96
	byte	128
	byte	128
	byte	run,0x80+2
	byte	32
	byte	152
	byte	88
	byte	run,5,152
	byte	run,4,88
	byte	run,3,96
	byte	128
	byte	run,0x80+13




elephead_data_b:
	byte	0x09, 0x15, 0xfc, 0x00, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	run,4,9
	byte	run,3,2
	byte	run,0x80+10
	byte	2
	byte	9
	byte	37
	byte	37
	byte	165
	byte	run,6,85
	byte	153
	byte	150
	byte	37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	128
	byte	128
	byte	96
	byte	96
	byte	run,3,88
	byte	86
	byte	86
	byte	85
	byte	89
	byte	101
	byte	150
	byte	88
	byte	96
	byte	160
	byte	run,0x80+3
	byte	2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	run,4,149
	byte	85
	byte	run,3,86
	byte	149
	byte	153
	byte	38
	byte	37
	byte	37
	byte	9
	byte	2
	byte	86
	byte	86
	byte	run,9,85
	byte	run,3,86
	byte	85
	byte	85
	byte	86
	byte	run,3,85
	byte	170
	byte	run,0x80+2
	byte	128
	byte	128
	byte	96
	byte	96
	byte	run,3,88
	byte	90
	byte	86
	byte	run,3,85
	byte	90
	byte	152
	byte	run,3,96
	byte	128
	byte	run,0x80+3
	byte	10
	byte	9
	byte	37
	byte	37
	byte	run,3,149
	byte	run,3,85
	byte	149
	byte	101
	byte	90
	byte	149
	byte	37
	byte	42
	byte	run,0x80+6
	byte	128
	byte	96
	byte	98
	byte	105
	byte	run,3,85
	byte	run,3,86
	byte	152
	byte	88
	byte	96
	byte	128
	byte	run,0x80+10
	byte	run,4,128
	byte	run,0x80+11




elephead_data_c:
	byte	0x03, 0x07, 0xff, 0xeb, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	2
	byte	10
	byte	41
	byte	run,3,149
	byte	86
	byte	86
	byte	128
	byte	96
	byte	88
	byte	88
	byte	152
	byte	32
	byte	run,0x80+1




