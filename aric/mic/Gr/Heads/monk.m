;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

monk_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	monk_start_end - monk_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	monk_data_a - monk_data
	word	monk_data_b - monk_data
	word	monk_data_c - monk_data

monk_start_end:
	byte	0,0,1,1,0,0,2,2


monk_data_a:
	byte	0x05, 0x1b, 0xff, 0x05, 0x00, 0x00
	byte	run,0x80+15
	byte	2
	byte	run,4,9
	byte	2
	byte	2
	byte	run,0x80+6
	byte	10
	byte	37
	byte	run,3,149
	byte	37
	byte	38
	byte	37
	byte	37
	byte	run,6,149
	byte	run,3,101
	byte	89
	byte	86
	byte	86
	byte	149
	byte	41
	byte	2
	byte	run,0x80+3
	byte	149
	byte	106
	byte	85
	byte	85
	byte	86
	byte	89
	byte	165
	byte	149
	byte	85
	byte	86
	byte	run,11,85
	byte	149
	byte	101
	byte	85
	byte	165
	byte	10
	byte	106
	byte	150
	byte	90
	byte	90
	byte	166
	byte	86
	byte	91
	byte	91
	byte	111
	byte	175
	byte	111
	byte	run,4,191
	byte	175
	byte	111
	byte	107
	byte	90
	byte	90
	byte	86
	byte	run,4,85
	byte	90
	byte	160
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	160
	byte	168
	byte	88
	byte	88
	byte	96
	byte	128
	byte	run,0x80+2




monk_data_b:
	byte	0x05, 0x1f, 0xfe, 0x06, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	9
	byte	9
	byte	2
	byte	run,0x80+1
	byte	run,4,2
	byte	1
	byte	run,9,9
	byte	run,4,2
	byte	run,0x80+1
	byte	2
	byte	2
	byte	run,0x80+3
	byte	2
	byte	169
	byte	85
	byte	90
	byte	102
	byte	150
	byte	155
	byte	91
	byte	run,4,111
	byte	run,6,191
	byte	175
	byte	175
	byte	106
	byte	106
	byte	90
	byte	89
	byte	85
	byte	149
	byte	101
	byte	85
	byte	149
	byte	42
	byte	170
	byte	86
	byte	85
	byte	85
	byte	170
	byte	170
	byte	254
	byte	run,13,255
	byte	171
	byte	170
	byte	170
	byte	86
	byte	run,5,85
	byte	90
	byte	160
	byte	run,0x80+1
	byte	128
	byte	168
	byte	86
	byte	149
	byte	101
	byte	89
	byte	150
	byte	150
	byte	run,3,230
	byte	229
	byte	run,6,249
	byte	233
	byte	233
	byte	165
	byte	165
	byte	149
	byte	150
	byte	86
	byte	86
	byte	88
	byte	160
	byte	run,0x80+6
	byte	run,3,128
	byte	run,0x80+5
	byte	run,12,128
	byte	run,0x80+7




monk_data_c:
	byte	0x03, 0x14, 0xff, 0x00, 0x00, 0x00
	byte	run,3,5
	byte	run,5,21
	byte	run,32,85
	byte	run,4,64
	byte	run,3,80
	byte	run,12,85
	byte	84




