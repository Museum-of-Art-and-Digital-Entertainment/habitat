;---------------------------------------
;
;	animation cel data
;

jaws0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	jaws0_start_end - jaws0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01110000

	word	jaws0_data_a - jaws0_data
	word	jaws0_data_b - jaws0_data
	word	jaws0_data_c - jaws0_data
	word	jaws0_data_d - jaws0_data

jaws0_start_end:
	byte	0,0,1,1,0,0,2,2


jaws0_data_a:
	byte	0x05, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+4
	byte	2
	byte	9
	byte	37
	byte	run,10,149
	byte	37
	byte	37
	byte	9
	byte	38
	byte	run,3,37
	byte	run,3,149
	byte	150
	byte	168
	byte	run,0x80+1
	byte	37
	byte	37
	byte	165
	byte	run,17,85
	byte	149
	byte	101
	byte	90
	byte	85
	byte	85
	byte	106
	byte	128
	byte	run,0x80+1
	byte	40
	byte	88
	byte	90
	byte	86
	byte	run,3,85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	130
	byte	run,3,139
	byte	138
	byte	101
	byte	85
	byte	86
	byte	91
	byte	90
	byte	85
	byte	86
	byte	168
	byte	96
	byte	128
	byte	run,0x80+6
	byte	160
	byte	88
	byte	86
	byte	170
	byte	184
	byte	184
	byte	32
	byte	run,0x80+1
	byte	2
	byte	139
	byte	139
	byte	170
	byte	85
	byte	85
	byte	169
	byte	233
	byte	254
	byte	168
	byte	96
	byte	128
	byte	run,0x80+18
	byte	run,3,128
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+10




jaws0_data_b:
	byte	0x05, 0x1d, 0xfe, 0x06, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	run,3,9
	byte	37
	byte	37
	byte	38
	byte	166
	byte	166
	byte	150
	byte	run,4,149
	byte	38
	byte	38
	byte	9
	byte	2
	byte	run,0x80+5
	byte	1
	byte	run,3,2
	byte	10
	byte	165
	byte	86
	byte	107
	byte	171
	byte	171
	byte	170
	byte	170
	byte	174
	byte	174
	byte	170
	byte	165
	byte	149
	byte	90
	byte	110
	byte	191
	byte	170
	byte	85
	byte	86
	byte	169
	byte	2
	byte	2
	byte	run,0x80+3
	byte	85
	byte	86
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,3,171
	byte	170
	byte	170
	byte	238
	byte	238
	byte	170
	byte	85
	byte	153
	byte	86
	byte	86
	byte	87
	byte	86
	byte	85
	byte	86
	byte	85
	byte	86
	byte	86
	byte	152
	byte	152
	byte	32
	byte	run,0x80+4
	byte	160
	byte	88
	byte	86
	byte	165
	byte	run,4,169
	byte	186
	byte	186
	byte	170
	byte	106
	byte	89
	byte	149
	byte	229
	byte	249
	byte	170
	byte	86
	byte	85
	byte	170
	byte	run,0x80+12
	byte	run,3,128
	byte	run,4,96
	byte	104
	byte	run,5,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+6




jaws0_data_c:
	byte	cel_box + 0x03, 0x11, 0xff, 0x00, 0x00, 0x00
	byte	0x55

jaws0_data_d:
	byte	cel_box + 0x01, 0x0a, 0xfe, 0xff, 0x00, 0x00
	byte	0x01

