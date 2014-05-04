;---------------------------------------
;
;	animation cel data
;

tube0_data::
	byte	out	+ 5
	byte	0b11101111
	byte	tube0_start_end - tube0_data
	byte	no_cont

	byte	12+right,12+right,252

	byte	0b11111111
	byte	0b11101111
	byte	0b11011111
	byte	0b11001111
	byte	0b11011110
	byte	0b11001110

	word	tube0_data_a - tube0_data
	word	tube0_data_b - tube0_data
	word	tube0_data_c - tube0_data
	word	tube0_data_d - tube0_data
	word	tube0_data_e - tube0_data
	word	tube0_data_f - tube0_data
	word	tube0_data_g - tube0_data
	word	tube0_data_h - tube0_data

tube0_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


tube0_data_a:
	byte	cel_box + lr_bord + 0x02+5, 0x62, 0xfd, 0x44, 0x00, 0x00
	byte	0q1111

tube0_data_b:
	byte	0x07, 0x07, 0xfd, 0xe2, 0x00, 0x00
	byte	2
	byte	25
	byte	37
	byte	150
	byte	run,3,154
	byte	170
	byte	85
	byte	106
	byte	149
	byte	85
	byte	149
	byte	170
	byte	170
	byte	85
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	85
	byte	169
	byte	86
	byte	85
	byte	86
	byte	170
	byte	128
	byte	96
	byte	88
	byte	150
	byte	run,3,166




tube0_data_c:
	byte	0x09, 0x0b, 0xfc, 0xe0, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	9
	byte	run,4,37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	10
	byte	165
	byte	85
	byte	85
	byte	165
	byte	229
	byte	85
	byte	85
	byte	86
	byte	106
	byte	42
	byte	149
	byte	85
	byte	90
	byte	94
	byte	run,3,85
	byte	106
	byte	149
	byte	85
	byte	170
	byte	run,7,85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	165
	byte	229
	byte	run,3,85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	86
	byte	87
	byte	run,3,85
	byte	170
	byte	85
	byte	85
	byte	168
	byte	86
	byte	85
	byte	149
	byte	149
	byte	run,3,85
	byte	169
	byte	86
	byte	85
	byte	run,0x80+1
	byte	160
	byte	90
	byte	85
	byte	85
	byte	105
	byte	121
	byte	85
	byte	85
	byte	149
	byte	169
	byte	run,0x80+3
	byte	128
	byte	96
	byte	run,4,88
	byte	96
	byte	128




tube0_data_d:
	byte	0x02, 0x12, 0x04, 0x0b, 0x00, 0x00
	byte	42
	byte	37
	byte	166
	byte	165
	byte	165
	byte	run,3,38
	byte	37
	byte	37
	byte	38
	byte	37
	byte	38
	byte	38
	byte	166
	byte	165
	byte	165
	byte	42
	byte	170
	byte	86
	byte	102
	byte	86
	byte	86
	byte	166
	byte	230
	byte	166
	byte	86
	byte	86
	byte	102
	byte	86
	byte	166
	byte	230
	byte	166
	byte	86
	byte	86
	byte	170




tube0_data_e:
	byte	cel_box + 0x01, 0x40, 0xfd, 0x22, 0x00, 0x00
	byte	0x0a

tube0_data_f:
	byte	cel_box + 0x01, 0x40, 0x03, 0x22, 0x00, 0x00
	byte	0xa0

tube0_data_g:
	byte	0x07, 0x04, 0xfd, 0x26, 0x00, 0x00
	byte	150
	byte	run,5,149
	byte	105
	byte	86
	byte	run,3,85
	byte	170
	byte	run,3,85
	byte	170
	byte	run,3,85
	byte	170
	byte	86
	byte	90
	byte	105
	byte	149
	byte	150
	byte	run,3,86




tube0_data_h:
	byte	0x07, 0x06, 0xfd, 0x34, 0x00, 0x00
	byte	169
	byte	150
	byte	149
	byte	154
	byte	158
	byte	149
	byte	85
	byte	169
	byte	86
	byte	run,5,85
	byte	170
	byte	85
	byte	165
	byte	229
	byte	85
	byte	85
	byte	170
	byte	run,5,85
	byte	170
	byte	85
	byte	105
	byte	121
	byte	85
	byte	106
	byte	149
	byte	run,3,85
	byte	106
	byte	150
	byte	86
	byte	166
	byte	230
	byte	86




