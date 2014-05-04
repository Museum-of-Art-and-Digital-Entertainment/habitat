;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

dungdoor_data::
	byte	both	+ 1
	byte	0b00111100
	byte	dungdoor_start_end - dungdoor_data
	byte	no_cont

	byte	0+right,32+left,255

	byte	0b11101000
	byte	0b11010100

	word	dungdoor_data_a - dungdoor_data
	word	dungdoor_data_b - dungdoor_data
	word	dungdoor_data_c - dungdoor_data
	word	dungdoor_data_d - dungdoor_data
	word	dungdoor_data_e - dungdoor_data
	word	dungdoor_data_f - dungdoor_data

dungdoor_start_end:
	byte	0,0,1,1


dungdoor_data_a:
	byte	cel_box + 0x07, 0x01, 0xff, 0xe0, 0x00, 0x00
	byte	0x55

dungdoor_data_b:
	byte	cel_box + 0x05, 0x41, 0x00, 0x20, 0x00, 0x00
	byte	0xaa

dungdoor_data_c:
	byte	0x07, 0x24, 0xff, 0x02, 0x00, 0x00
	byte	170
	byte	run,7,149
	byte	42
	byte	run,11,149
	byte	42
	byte	run,11,149
	byte	42
	byte	run,3,149
	byte	run,0x80+1
	byte	170
	byte	run,8,191
	byte	175
	byte	155
	byte	run,5,171
	byte	155
	byte	175
	byte	run,17,191
	byte	run,0x80+1
	byte	170
	byte	run,34,251
	byte	run,0x80+1
	byte	170
	byte	run,24,255
	byte	run,6,254
	byte	255
	byte	250
	byte	246
	byte	250
	byte	run,0x80+1
	byte	170
	byte	run,24,239
	byte	170
	byte	run,5,238
	byte	171
	byte	170
	byte	154
	byte	170
	byte	run,0x80+1
	byte	170
	byte	run,31,254
	byte	190
	byte	126
	byte	190
	byte	170
	byte	run,7,86
	byte	168
	byte	run,11,86
	byte	168
	byte	run,11,86
	byte	168
	byte	run,3,86




dungdoor_data_d:
	byte	0x07, 0x24, 0xff, 0x02, 0x00, 0x00
	byte	170
	byte	run,7,149
	byte	42
	byte	run,11,149
	byte	42
	byte	run,11,149
	byte	42
	byte	run,3,149
	byte	run,0x80+1
	byte	128
	byte	160
	byte	184
	byte	186
	byte	run,12,187
	byte	171
	byte	155
	byte	run,4,171
	byte	155
	byte	171
	byte	run,11,187
	byte	run,0x80+5
	byte	128
	byte	160
	byte	run,21,184
	byte	168
	byte	run,5,184
	byte	168
	byte	152
	byte	run,0x80+73
	byte	run,35,2
	byte	170
	byte	run,7,86
	byte	168
	byte	run,11,86
	byte	168
	byte	run,11,86
	byte	168
	byte	run,3,86




dungdoor_data_e:
	byte	0x07, 0x24, 0xff, 0x26, 0x00, 0x00
	byte	run,8,149
	byte	42
	byte	run,10,149
	byte	42
	byte	run,5,149
	byte	run,3,37
	byte	10
	byte	9
	byte	2
	byte	run,0x80+5
	byte	run,4,191
	byte	175
	byte	155
	byte	run,5,171
	byte	155
	byte	175
	byte	run,9,191
	byte	run,3,111
	byte	91
	byte	102
	byte	149
	byte	run,3,85
	byte	149
	byte	37
	byte	10
	byte	run,0x80+2
	byte	run,5,251
	byte	170
	byte	170
	byte	149
	byte	run,5,154
	byte	150
	byte	run,4,154
	byte	149
	byte	170
	byte	run,7,251
	byte	187
	byte	107
	byte	86
	byte	89
	byte	101
	byte	101
	byte	149
	byte	165
	byte	10
	byte	run,5,255
	byte	170
	byte	170
	byte	85
	byte	170
	byte	run,4,105
	byte	89
	byte	run,3,105
	byte	170
	byte	85
	byte	170
	byte	run,9,255
	byte	170
	byte	run,5,85
	byte	170
	byte	run,5,239
	byte	170
	byte	170
	byte	86
	byte	run,5,166
	byte	102
	byte	run,4,166
	byte	86
	byte	170
	byte	run,7,239
	byte	238
	byte	233
	byte	149
	byte	101
	byte	89
	byte	89
	byte	86
	byte	90
	byte	160
	byte	run,22,254
	byte	run,3,249
	byte	229
	byte	153
	byte	86
	byte	run,3,85
	byte	86
	byte	88
	byte	160
	byte	run,0x80+2
	byte	run,8,86
	byte	168
	byte	run,10,86
	byte	168
	byte	run,5,86
	byte	run,3,88
	byte	160
	byte	96
	byte	128
	byte	run,0x80+5




dungdoor_data_f:
	byte	0x07, 0x24, 0xff, 0x26, 0x00, 0xff
	byte	run,8,149
	byte	42
	byte	run,10,149
	byte	42
	byte	run,5,149
	byte	run,3,37
	byte	10
	byte	9
	byte	2
	byte	run,0x80+5
	byte	187
	byte	187
	byte	171
	byte	155
	byte	171
	byte	170
	byte	170
	byte	169
	byte	153
	byte	169
	byte	run,8,185
	byte	186
	byte	run,3,187
	byte	run,3,107
	byte	91
	byte	102
	byte	149
	byte	run,3,85
	byte	149
	byte	37
	byte	10
	byte	run,0x80+2
	byte	168
	byte	168
	byte	run,4,184
	byte	168
	byte	168
	byte	88
	byte	run,3,152
	byte	88
	byte	run,4,152
	byte	88
	byte	152
	byte	168
	byte	run,6,184
	byte	160
	byte	128
	byte	104
	byte	86
	byte	89
	byte	101
	byte	101
	byte	149
	byte	165
	byte	10
	byte	run,0x80+29
	byte	170
	byte	run,5,85
	byte	170
	byte	run,0x80+27
	byte	2
	byte	41
	byte	149
	byte	101
	byte	89
	byte	89
	byte	86
	byte	90
	byte	160
	byte	run,22,2
	byte	run,3,9
	byte	37
	byte	153
	byte	86
	byte	run,3,85
	byte	86
	byte	88
	byte	160
	byte	run,0x80+2
	byte	run,8,86
	byte	168
	byte	run,10,86
	byte	168
	byte	run,5,86
	byte	run,3,88
	byte	160
	byte	96
	byte	128
	byte	run,0x80+5




