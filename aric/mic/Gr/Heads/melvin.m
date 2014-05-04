;---------------------------------------
;
;	animation cel data
;

melvin_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	melvin_start_end - melvin_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	melvin_data_a - melvin_data
	word	melvin_data_b - melvin_data
	word	melvin_data_c - melvin_data

melvin_start_end:
	byte	0,0,1,1,0,0,2,2


melvin_data_a:
	byte	0x07, 0x22, 0xff, 0x0c, 0x00, 0x00
	byte	run,0x80+14
	byte	run,3,2
	byte	9
	byte	137
	byte	41
	byte	9
	byte	165
	byte	37
	byte	37
	byte	137
	byte	41
	byte	34
	byte	2
	byte	40
	byte	128
	byte	2
	byte	8
	byte	run,0x80+9
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	149
	byte	149
	byte	run,13,85
	byte	165
	byte	42
	byte	136
	byte	34
	byte	130
	byte	8
	byte	32
	byte	run,0x80+1
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	run,4,85
	byte	run,3,86
	byte	150
	byte	154
	byte	154
	byte	107
	byte	86
	byte	run,4,85
	byte	run,3,86
	byte	85
	byte	85
	byte	170
	byte	130
	byte	8
	byte	run,0x80+1
	byte	32
	byte	run,0x80+1
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	85
	byte	90
	byte	107
	byte	190
	byte	190
	byte	238
	byte	run,3,186
	byte	187
	byte	251
	byte	250
	byte	169
	byte	85
	byte	85
	byte	105
	byte	190
	byte	250
	byte	250
	byte	254
	byte	190
	byte	105
	byte	86
	byte	168
	byte	40
	byte	128
	byte	32
	byte	run,0x80+4
	byte	170
	byte	run,3,85
	byte	170
	byte	239
	byte	251
	byte	187
	byte	186
	byte	186
	byte	235
	byte	239
	byte	239
	byte	234
	byte	165
	byte	85
	byte	90
	byte	90
	byte	86
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+10
	byte	168
	byte	86
	byte	166
	byte	248
	byte	190
	byte	187
	byte	235
	byte	235
	byte	239
	byte	170
	byte	166
	byte	150
	byte	88
	byte	96
	byte	128
	byte	128
	byte	run,0x80+23
	byte	run,4,128
	byte	run,0x80+21




melvin_data_b:
	byte	0x05, 0x25, 0xfe, 0x0e, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	9
	byte	9
	byte	10
	byte	43
	byte	42
	byte	run,3,46
	byte	154
	byte	153
	byte	149
	byte	run,4,37
	byte	9
	byte	9
	byte	34
	byte	10
	byte	34
	byte	10
	byte	run,0x80+1
	byte	34
	byte	8
	byte	run,0x80+6
	byte	1
	byte	2
	byte	9
	byte	42
	byte	170
	byte	149
	byte	90
	byte	111
	byte	175
	byte	238
	byte	171
	byte	175
	byte	239
	byte	238
	byte	233
	byte	149
	byte	85
	byte	85
	byte	90
	byte	90
	byte	run,3,85
	byte	90
	byte	111
	byte	110
	byte	110
	byte	175
	byte	155
	byte	38
	byte	9
	byte	10
	byte	32
	byte	2
	byte	8
	byte	run,0x80+2
	byte	85
	byte	86
	byte	169
	byte	169
	byte	86
	byte	85
	byte	169
	byte	174
	byte	175
	byte	234
	byte	175
	byte	171
	byte	171
	byte	170
	byte	run,4,85
	byte	154
	byte	86
	byte	run,3,85
	byte	86
	byte	155
	byte	run,4,235
	byte	150
	byte	85
	byte	85
	byte	149
	byte	42
	byte	162
	byte	32
	byte	128
	byte	run,0x80+2
	byte	128
	byte	96
	byte	168
	byte	170
	byte	85
	byte	169
	byte	190
	byte	191
	byte	170
	byte	run,3,238
	byte	174
	byte	90
	byte	85
	byte	85
	byte	run,3,149
	byte	85
	byte	85
	byte	149
	byte	229
	byte	186
	byte	186
	byte	250
	byte	230
	byte	150
	byte	88
	byte	88
	byte	98
	byte	128
	byte	run,0x80+1
	byte	160
	byte	run,0x80+7
	byte	128
	byte	96
	byte	96
	byte	168
	byte	232
	byte	168
	byte	run,3,232
	byte	run,3,152
	byte	run,4,96
	byte	run,3,128
	byte	32
	byte	128
	byte	run,0x80+1
	byte	32
	byte	128
	byte	run,0x80+1
	byte	128
	byte	run,0x80+5




melvin_data_c:
	byte	0x05, 0x18, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+1
	byte	run,4,1
	byte	run,7,5
	byte	run,0x80+12
	byte	run,12,85
	byte	run,10,21
	byte	5
	byte	5
	byte	run,36,85
	byte	run,12,84
	byte	run,0x80+2
	byte	64
	byte	64
	byte	run,8,80
	byte	run,0x80+12




