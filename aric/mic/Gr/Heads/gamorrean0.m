;---------------------------------------
;
;	animation cel data
;

gamorrean0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	gamorrean0_start_end - gamorrean0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	gamorrean0_data_a - gamorrean0_data
	word	gamorrean0_data_b - gamorrean0_data
	word	gamorrean0_data_c - gamorrean0_data

gamorrean0_start_end:
	byte	0,0,1,1,0,0,2,2


gamorrean0_data_a:
	byte	0x07, 0x16, 0xfe, 0x00, 0x00, 0x00
	byte	run,0x80+16
	byte	2
	byte	run,0x80+19
	byte	10
	byte	165
	byte	85
	byte	149
	byte	37
	byte	10
	byte	2
	byte	run,0x80+6
	byte	2
	byte	10
	byte	42
	byte	41
	byte	run,7,149
	byte	101
	byte	90
	byte	86
	byte	89
	byte	169
	byte	2
	byte	run,0x80+1
	byte	37
	byte	42
	byte	run,3,165
	byte	170
	byte	106
	byte	86
	byte	89
	byte	101
	byte	149
	byte	149
	byte	154
	byte	101
	byte	85
	byte	90
	byte	110
	byte	111
	byte	106
	byte	149
	byte	170
	byte	40
	byte	152
	byte	90
	byte	90
	byte	106
	byte	101
	byte	run,3,149
	byte	85
	byte	89
	byte	110
	byte	170
	byte	149
	byte	85
	byte	85
	byte	165
	byte	165
	byte	150
	byte	88
	byte	164
	byte	run,0x80+4
	byte	128
	byte	168
	byte	170
	byte	86
	byte	run,4,85
	byte	165
	byte	186
	byte	187
	byte	186
	byte	101
	byte	85
	byte	170
	byte	2
	byte	run,0x80+9
	byte	160
	byte	run,6,88
	byte	152
	byte	160
	byte	88
	byte	104
	byte	104
	byte	88
	byte	160
	byte	run,0x80+2




gamorrean0_data_b:
	byte	0x07, 0x16, 0xfd, 0xff, 0x00, 0x00
	byte	run,0x80+17
	byte	2
	byte	9
	byte	2
	byte	run,0x80+9
	byte	2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	38
	byte	41
	byte	37
	byte	169
	byte	86
	byte	86
	byte	90
	byte	162
	byte	run,0x80+1
	byte	1
	byte	run,3,2
	byte	42
	byte	149
	byte	149
	byte	run,3,85
	byte	101
	byte	185
	byte	169
	byte	174
	byte	110
	byte	89
	byte	90
	byte	110
	byte	190
	byte	105
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	run,6,85
	byte	105
	byte	85
	byte	86
	byte	150
	byte	105
	byte	85
	byte	166
	byte	166
	byte	89
	byte	105
	byte	169
	byte	2
	byte	64
	byte	run,3,128
	byte	168
	byte	86
	byte	86
	byte	run,4,85
	byte	149
	byte	234
	byte	174
	byte	110
	byte	153
	byte	165
	byte	185
	byte	190
	byte	105
	byte	85
	byte	170
	byte	run,0x80+7
	byte	128
	byte	128
	byte	96
	byte	96
	byte	104
	byte	88
	byte	152
	byte	104
	byte	88
	byte	90
	byte	101
	byte	101
	byte	165
	byte	138
	byte	run,0x80+17
	byte	128
	byte	96
	byte	88
	byte	96
	byte	128
	byte	run,0x80+1




gamorrean0_data_c:
	byte	cel_box + 0x03, 0x0a, 0xff, 0xfd, 0x00, 0x00
	byte	0x55

