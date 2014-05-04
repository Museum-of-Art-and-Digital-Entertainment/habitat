;---------------------------------------
;
;	animation cel data
;

fishead0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	fishead0_start_end - fishead0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	fishead0_data_a - fishead0_data
	word	fishead0_data_b - fishead0_data

fishead0_start_end:
	byte	0,0,1,1,0,0,1,1


fishead0_data_a:
	byte	0x05, 0x18, 0x01, 0x02, 0x00, 0x00
	byte	run,0x80+1
	byte	47
	byte	42
	byte	37
	byte	37
	byte	165
	byte	run,6,149
	byte	37
	byte	37
	byte	38
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+4
	byte	40
	byte	152
	byte	88
	byte	88
	byte	104
	byte	104
	byte	88
	byte	86
	byte	85
	byte	85
	byte	90
	byte	106
	byte	101
	byte	149
	byte	149
	byte	101
	byte	90
	byte	run,3,85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	10
	byte	37
	byte	149
	byte	85
	byte	85
	byte	165
	byte	169
	byte	89
	byte	86
	byte	89
	byte	89
	byte	169
	byte	153
	byte	153
	byte	150
	byte	101
	byte	85
	byte	85
	byte	170
	byte	run,0x80+5
	byte	168
	byte	86
	byte	run,3,85
	byte	86
	byte	86
	byte	105
	byte	86
	byte	105
	byte	190
	byte	run,3,186
	byte	105
	byte	85
	byte	86
	byte	104
	byte	128
	byte	run,0x80+7
	byte	128
	byte	104
	byte	150
	byte	86
	byte	168
	byte	86
	byte	86
	byte	150
	byte	104
	byte	88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+3




fishead0_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+12
	byte	2
	byte	9
	byte	37
	byte	149
	byte	37
	byte	10
	byte	run,0x80+6
	byte	3
	byte	run,4,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	149
	byte	150
	byte	150
	byte	153
	byte	153
	byte	150
	byte	154
	byte	175
	byte	190
	byte	190
	byte	46
	byte	42
	byte	37
	byte	9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	86
	byte	run,4,85
	byte	169
	byte	86
	byte	170
	byte	85
	byte	85
	byte	170
	byte	86
	byte	155
	byte	run,3,154
	byte	86
	byte	85
	byte	85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	96
	byte	96
	byte	run,3,88
	byte	154
	byte	153
	byte	89
	byte	169
	byte	233
	byte	250
	byte	248
	byte	224
	byte	160
	byte	96
	byte	128
	byte	run,0x80+14
	byte	128
	byte	96
	byte	88
	byte	96
	byte	128
	byte	run,0x80+6




