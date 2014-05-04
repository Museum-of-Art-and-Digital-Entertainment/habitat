;---------------------------------------
;
;	animation cel data
;

rotohead_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	rotohead_start_end - rotohead_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	rotohead_data_a - rotohead_data
	word	rotohead_data_b - rotohead_data
	word	rotohead_data_c - rotohead_data

rotohead_start_end:
	byte	0,0,1,1,0,0,2,2


rotohead_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+2
	byte	42
	byte	9
	byte	2
	byte	run,0x80+3
	byte	2
	byte	run,13,9
	byte	10
	byte	8
	byte	run,0x80+1
	byte	47
	byte	170
	byte	85
	byte	85
	byte	149
	byte	42
	byte	149
	byte	run,4,85
	byte	run,7,90
	byte	88
	byte	96
	byte	128
	byte	run,0x80+2
	byte	40
	byte	248
	byte	170
	byte	run,3,85
	byte	170
	byte	run,5,85
	byte	run,3,170
	byte	168
	byte	160
	byte	128
	byte	run,0x80+8
	byte	170
	byte	88
	byte	96
	byte	128
	byte	run,0x80+1
	byte	128
	byte	96
	byte	88
	byte	86
	byte	88
	byte	160
	byte	128
	byte	run,0x80+10




rotohead_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+3
	byte	10
	byte	2
	byte	run,0x80+5
	byte	2
	byte	9
	byte	2
	byte	2
	byte	run,0x80+12
	byte	3
	byte	2
	byte	2
	byte	170
	byte	85
	byte	149
	byte	37
	byte	10
	byte	37
	byte	149
	byte	run,3,85
	byte	90
	byte	154
	byte	150
	byte	38
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+4
	byte	255
	byte	254
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,5,85
	byte	run,4,170
	byte	169
	byte	169
	byte	101
	byte	102
	byte	86
	byte	152
	byte	152
	byte	32
	byte	32
	byte	run,0x80+3
	byte	170
	byte	86
	byte	88
	byte	96
	byte	128
	byte	96
	byte	88
	byte	86
	byte	85
	byte	86
	byte	150
	byte	152
	byte	88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+9
	byte	128
	byte	run,0x80+7
	byte	128
	byte	run,0x80+14




rotohead_data_c:
	byte	0x03, 0x08, 0xff, 0xfe, 0x00, 0x00
	byte	5
	byte	5
	byte	1
	byte	1
	byte	run,0x80+4
	byte	run,4,85
	byte	84
	byte	84
	byte	16
	byte	16
	byte	64
	byte	64
	byte	run,0x80+6




