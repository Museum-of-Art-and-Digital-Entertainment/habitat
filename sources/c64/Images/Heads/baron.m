;---------------------------------------
;
;	animation cel data
;

baron_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	baron_start_end - baron_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	baron_data_a - baron_data
	word	baron_data_b - baron_data

baron_start_end:
	byte	0,0,1,1,0,0,1,1


baron_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	85
	byte	85
	byte	86
	byte	run,4,89
	byte	86
	byte	run,5,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	86
	byte	90
	byte	154
	byte	105
	byte	run,3,85
	byte	101
	byte	165
	byte	86
	byte	90
	byte	86
	byte	run,4,85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	96
	byte	96
	byte	176
	byte	run,3,160
	byte	104
	byte	run,3,88
	byte	96
	byte	96
	byte	160
	byte	160
	byte	96
	byte	run,3,128
	byte	run,0x80+2




baron_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	10
	byte	32
	byte	2
	byte	run,4,9
	byte	2
	byte	run,0x80+8
	byte	3
	byte	run,4,2
	byte	9
	byte	9
	byte	run,3,170
	byte	150
	byte	85
	byte	run,3,149
	byte	150
	byte	154
	byte	150
	byte	149
	byte	run,3,37
	byte	9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	86
	byte	101
	byte	85
	byte	154
	byte	run,3,170
	byte	169
	byte	153
	byte	85
	byte	85
	byte	86
	byte	154
	byte	154
	byte	run,5,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	170
	byte	170
	byte	168
	byte	90
	byte	85
	byte	run,3,89
	byte	90
	byte	152
	byte	88
	byte	88
	byte	run,3,96
	byte	128
	byte	run,0x80+9
	byte	128
	byte	32
	byte	run,0x80+1
	byte	run,4,128
	byte	run,0x80+9




