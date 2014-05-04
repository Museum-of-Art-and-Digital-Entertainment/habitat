;---------------------------------------
;
;	animation cel data
;

bush2_data::
	byte	out	+ 0
	byte	0b01100000
	byte	no_animation
	byte	no_cont

	byte	244+right,24+left,255

	byte	0b11100000

	word	bush2_data_a - bush2_data
	word	bush2_data_b - bush2_data
	word	bush2_data_c - bush2_data


bush2_data_a:
	byte	0x03, 0x10, 0x00, 0xf0, 0x00, 0x00

	byte	34
	byte	run,0x80+15
	byte	168
	byte	10
	byte	run,12,2
	byte	10
	byte	42
	byte	168
	byte	160
	byte	run,13,128
	byte	160




bush2_data_b:
	byte	0x08, 0x19, 0xfe, 0x09, 0x00, 0x00

	byte	2
	byte	9
	byte	2
	byte	2
	byte	run,0x80+1
	byte	10
	byte	run,0x80+1
	byte	10
	byte	37
	byte	9
	byte	2
	byte	9
	byte	38
	byte	8
	byte	130
	byte	41
	byte	37
	byte	9
	byte	2
	byte	9
	byte	9
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	2
	byte	137
	byte	101
	byte	85
	byte	149
	byte	85
	byte	149
	byte	37
	byte	149
	byte	run,4,85
	byte	149
	byte	run,10,85
	byte	149
	byte	128
	byte	98
	byte	90
	byte	86
	byte	86
	byte	run,20,85
	byte	162
	byte	130
	byte	2
	byte	10
	byte	42
	byte	162
	byte	138
	byte	106
	byte	106
	byte	98
	byte	96
	byte	98
	byte	89
	byte	run,12,85
	byte	168
	byte	138
	byte	130
	byte	130
	byte	160
	byte	160
	byte	168
	byte	42
	byte	10
	byte	130
	byte	137
	byte	165
	byte	run,13,85
	byte	run,0x80+1
	byte	2
	byte	9
	byte	165
	byte	165
	byte	37
	byte	run,3,149
	byte	run,16,85
	byte	168
	byte	86
	byte	88
	byte	88
	byte	86
	byte	89
	byte	98
	byte	88
	byte	86
	byte	85
	byte	85
	byte	86
	byte	86
	byte	run,7,85
	byte	86
	byte	85
	byte	85
	byte	86
	byte	88
	byte	run,0x80+5
	byte	128
	byte	run,0x80+1
	byte	128
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1
	byte	32
	byte	152
	byte	96
	byte	128
	byte	128
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1
	byte	128
	byte	96
	byte	128
	byte	run,0x80+1




bush2_data_c:
	byte	0x07, 0x0e, 0xfe, 0x17, 0x00, 0x00

	byte	run,3,2
	byte	8
	byte	run,0x80+10
	byte	85
	byte	85
	byte	149
	byte	37
	byte	149
	byte	153
	byte	34
	byte	2
	byte	9
	byte	2
	byte	run,0x80+4
	byte	run,8,85
	byte	101
	byte	137
	byte	9
	byte	2
	byte	run,0x80+2
	byte	run,10,85
	byte	150
	byte	38
	byte	8
	byte	run,0x80+1
	byte	run,9,85
	byte	149
	byte	38
	byte	150
	byte	40
	byte	8
	byte	run,6,85
	byte	86
	byte	86
	byte	88
	byte	150
	byte	40
	byte	run,0x80+3
	byte	86
	byte	88
	byte	96
	byte	88
	byte	86
	byte	152
	byte	32
	byte	run,0x80+7




