;---------------------------------------
;
;	animation cel data
;

bem2_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bem2_start_end - bem2_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bem2_data_a - bem2_data
	word	bem2_data_b - bem2_data
	word	bem2_data_c - bem2_data

bem2_start_end:
	byte	0,0,1,1,0,0,2,2


bem2_data_a:
	byte	0x05, 0x27, 0xff, 0x11, 0x00, 0x00
	byte	run,0x80+14
	byte	2
	byte	2
	byte	9
	byte	9
	byte	run,11,37
	byte	run,3,9
	byte	2
	byte	2
	byte	run,0x80+16
	byte	10
	byte	37
	byte	149
	byte	run,5,85
	byte	86
	byte	run,14,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	run,0x80+2
	byte	37
	byte	42
	byte	run,3,37
	byte	run,4,9
	byte	169
	byte	150
	byte	90
	byte	run,7,89
	byte	165
	byte	85
	byte	85
	byte	86
	byte	run,14,85
	byte	170
	byte	40
	byte	152
	byte	90
	byte	89
	byte	105
	byte	103
	byte	106
	byte	103
	byte	run,3,105
	byte	169
	byte	85
	byte	165
	byte	170
	byte	191
	byte	187
	byte	187
	byte	191
	byte	170
	byte	106
	byte	169
	byte	165
	byte	149
	byte	run,11,85
	byte	86
	byte	86
	byte	88
	byte	160
	byte	run,0x80+2
	byte	128
	byte	96
	byte	96
	byte	112
	byte	160
	byte	112
	byte	run,3,96
	byte	160
	byte	160
	byte	88
	byte	88
	byte	run,4,152
	byte	166
	byte	86
	byte	run,10,88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+4




bem2_data_b:
	byte	0x05, 0x28, 0xfe, 0x11, 0x00, 0x00
	byte	run,0x80+17
	byte	2
	byte	10
	byte	run,3,9
	byte	37
	byte	38
	byte	run,11,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+2
	byte	1
	byte	run,7,2
	byte	9
	byte	9
	byte	10
	byte	10
	byte	42
	byte	149
	byte	165
	byte	170
	byte	191
	byte	187
	byte	187
	byte	191
	byte	170
	byte	169
	byte	165
	byte	run,15,85
	byte	165
	byte	10
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	86
	byte	222
	byte	170
	byte	221
	byte	85
	byte	86
	byte	86
	byte	102
	byte	101
	byte	85
	byte	86
	byte	run,4,155
	byte	86
	byte	run,11,85
	byte	153
	byte	run,6,101
	byte	138
	byte	run,0x80+8
	byte	run,4,128
	byte	160
	byte	88
	byte	104
	byte	168
	byte	248
	byte	186
	byte	186
	byte	249
	byte	169
	byte	169
	byte	105
	byte	89
	byte	86
	byte	run,12,85
	byte	86
	byte	104
	byte	128
	byte	run,0x80+18
	byte	run,4,128
	byte	run,13,96
	byte	128
	byte	128
	byte	run,0x80+3




bem2_data_c:
	byte	0x03, 0x11, 0xff, 0xff, 0x00, 0x00
	byte	run,0x80+5
	byte	run,3,1
	byte	run,9,21
	byte	run,4,84
	byte	run,13,85
	byte	run,0x80+8
	byte	run,9,80




