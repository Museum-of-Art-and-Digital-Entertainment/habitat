;---------------------------------------
;
;	animation cel data
;

bem3_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bem3_start_end - bem3_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bem3_data_a - bem3_data
	word	bem3_data_b - bem3_data
	word	bem3_data_c - bem3_data

bem3_start_end:
	byte	0,0,1,1,0,0,2,2


bem3_data_a:
	byte	0x05, 0x23, 0x00, 0x0c, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	2
	byte	run,3,9
	byte	run,3,37
	byte	run,5,149
	byte	150
	byte	run,8,149
	byte	run,3,37
	byte	9
	byte	2
	byte	run,0x80+2
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	85
	byte	85
	byte	86
	byte	run,3,85
	byte	run,3,89
	byte	run,4,86
	byte	89
	byte	165
	byte	run,11,85
	byte	170
	byte	run,0x80+1
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	run,3,149
	byte	run,8,85
	byte	run,5,86
	byte	85
	byte	85
	byte	86
	byte	run,6,85
	byte	86
	byte	88
	byte	160
	byte	2
	byte	9
	byte	9
	byte	42
	byte	138
	byte	106
	byte	run,3,102
	byte	166
	byte	101
	byte	153
	byte	85
	byte	149
	byte	85
	byte	85
	byte	105
	byte	170
	byte	248
	byte	254
	byte	238
	byte	238
	byte	254
	byte	168
	byte	168
	byte	88
	byte	88
	byte	run,3,96
	byte	128
	byte	128
	byte	run,0x80+4
	byte	128
	byte	run,10,96
	byte	160
	byte	run,4,128
	byte	run,0x80+18




bem3_data_b:
	byte	0x05, 0x23, 0xfe, 0x0b, 0x00, 0x00
	byte	run,0x80+15
	byte	run,3,2
	byte	run,10,9
	byte	run,3,2
	byte	run,0x80+5
	byte	run,3,2
	byte	10
	byte	run,5,38
	byte	165
	byte	153
	byte	150
	byte	153
	byte	149
	byte	101
	byte	105
	byte	170
	byte	190
	byte	191
	byte	187
	byte	187
	byte	191
	byte	106
	byte	90
	byte	89
	byte	101
	byte	run,4,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	136
	byte	run,9,102
	byte	153
	byte	85
	byte	86
	byte	85
	byte	run,3,153
	byte	86
	byte	86
	byte	run,4,155
	byte	86
	byte	86
	byte	run,9,85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	run,5,96
	byte	104
	byte	152
	byte	88
	byte	152
	byte	88
	byte	102
	byte	166
	byte	170
	byte	249
	byte	249
	byte	185
	byte	185
	byte	249
	byte	165
	byte	149
	byte	149
	byte	101
	byte	85
	byte	run,3,86
	byte	88
	byte	88
	byte	96
	byte	128
	byte	run,0x80+18
	byte	run,10,128
	byte	run,0x80+7




bem3_data_c:
	byte	0x03, 0x16, 0xff, 0x03, 0x00, 0x00
	byte	run,10,5
	byte	run,34,85
	byte	run,10,64
	byte	run,3,84
	byte	run,9,85




