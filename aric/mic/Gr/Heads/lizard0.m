;---------------------------------------
;
;	animation cel data
;

lizard0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	lizard0_start_end - lizard0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	lizard0_data_a - lizard0_data
	word	lizard0_data_b - lizard0_data
	word	lizard0_data_c - lizard0_data

lizard0_start_end:
	byte	0,0,1,1,0,0,2,2


lizard0_data_a:
	byte	0x08, 0x18, 0xff, 0x02, 0x00, 0x00
	byte	run,0x80+11
	byte	run,8,2
	byte	run,0x80+12
	byte	2
	byte	9
	byte	37
	byte	149
	byte	run,8,85
	byte	149
	byte	149
	byte	41
	byte	2
	byte	run,0x80+2
	byte	47
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	85
	byte	86
	byte	86
	byte	89
	byte	89
	byte	105
	byte	run,9,85
	byte	165
	byte	10
	byte	40
	byte	152
	byte	run,3,88
	byte	106
	byte	101
	byte	149
	byte	run,10,85
	byte	86
	byte	85
	byte	149
	byte	105
	byte	86
	byte	168
	byte	run,0x80+5
	byte	160
	byte	88
	byte	86
	byte	run,9,85
	byte	169
	byte	250
	byte	169
	byte	85
	byte	86
	byte	168
	byte	run,0x80+9
	byte	160
	byte	90
	byte	run,3,85
	byte	170
	byte	run,4,85
	byte	106
	byte	128
	byte	128
	byte	run,0x80+13
	byte	160
	byte	88
	byte	86
	byte	170
	byte	run,3,85
	byte	86
	byte	166
	byte	37
	byte	10
	byte	run,0x80+14
	byte	8
	byte	168
	byte	152
	byte	run,3,88
	byte	152
	byte	96
	byte	128
	byte	run,0x80+4




lizard0_data_b:
	byte	0x05, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+11
	byte	run,3,2
	byte	9
	byte	9
	byte	38
	byte	37
	byte	38
	byte	38
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	1
	byte	run,4,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	165
	byte	150
	byte	106
	byte	85
	byte	85
	byte	105
	byte	105
	byte	101
	byte	90
	byte	165
	byte	185
	byte	165
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	85
	byte	85
	byte	169
	byte	85
	byte	101
	byte	170
	byte	154
	byte	run,4,85
	byte	153
	byte	86
	byte	run,5,153
	byte	86
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	96
	byte	96
	byte	104
	byte	88
	byte	166
	byte	86
	byte	86
	byte	165
	byte	165
	byte	102
	byte	149
	byte	106
	byte	186
	byte	105
	byte	85
	byte	85
	byte	170
	byte	160
	byte	run,0x80+14
	byte	128
	byte	128
	byte	run,6,96
	byte	128
	byte	run,0x80+2




lizard0_data_c:
	byte	0x04, 0x10, 0xfe, 0x00, 0x00, 0x00
	byte	run,0x80+7
	byte	run,9,1
	byte	run,0x80+3
	byte	run,4,21
	byte	run,9,85
	byte	run,3,84
	byte	run,13,85
	byte	run,0x80+3
	byte	run,4,80
	byte	run,9,85




