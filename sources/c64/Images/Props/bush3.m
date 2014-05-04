;---------------------------------------
;
;	animation cel data
;

bush3_data::
	byte	out	+ 12
	byte	0b01000000
	byte	bush3_start_end - bush3_data
	byte	no_cont

	byte	248+right,32+left,255

	byte	0b10000000
	byte	0b11111100
	byte	0b11001000
	byte	0b10110000
	byte	0b11000100
	byte	0b10011100
	byte	0b10010100
	byte	0b10101000
	byte	0b11000100
	byte	0b10101100
	byte	0b11010000
	byte	0b10101000
	byte	0b11100100

	word	bush3_data_a - bush3_data
	word	bush3_data_b - bush3_data
	word	bush3_data_c - bush3_data
	word	bush3_data_d - bush3_data
	word	bush3_data_e - bush3_data
	word	bush3_data_f - bush3_data

bush3_start_end:
	byte	0,0,1,1,cycle+2,12


bush3_data_a:
	byte	0x06, 0x2a, 0xfd, 0x27, 0x00, 0x00
	byte	run,0x80+26
	byte	8
	byte	2
	byte	run,0x80+27
	byte	8
	byte	2
	byte	run,0x80+3
	byte	2
	byte	8
	byte	160
	byte	128
	byte	run,0x80+5
	byte	162
	byte	10
	byte	2
	byte	run,3,8
	byte	32
	byte	32
	byte	128
	byte	128
	byte	run,0x80+1
	byte	2
	byte	run,0x80+1
	byte	42
	byte	run,0x80+1
	byte	10
	byte	128
	byte	run,0x80+10
	byte	128
	byte	130
	byte	10
	byte	168
	byte	32
	byte	128
	byte	run,0x80+3
	byte	2
	byte	10
	byte	170
	byte	168
	byte	128
	byte	128
	byte	2
	byte	8
	byte	32
	byte	run,0x80+5
	byte	run,3,2
	byte	10
	byte	162
	byte	2
	byte	run,0x80+1
	byte	162
	byte	run,3,40
	byte	42
	byte	42
	byte	run,6,40
	byte	run,3,168
	byte	run,3,42
	byte	run,3,168
	byte	170
	byte	170
	byte	42
	byte	170
	byte	138
	byte	138
	byte	10
	byte	42
	byte	42
	byte	34
	byte	34
	byte	run,3,130
	byte	2
	byte	2
	byte	run,0x80+4
	byte	128
	byte	run,0x80+6
	byte	128
	byte	40
	byte	run,3,2
	byte	run,0x80+6
	byte	130
	byte	136
	byte	32
	byte	32
	byte	8
	byte	2
	byte	128
	byte	160
	byte	40
	byte	8
	byte	run,3,2
	byte	run,0x80+2
	byte	128
	byte	32
	byte	8
	byte	run,0x80+2
	byte	128
	byte	136
	byte	32
	byte	10
	byte	run,0x80+12
	byte	160
	byte	128
	byte	42
	byte	2
	byte	run,0x80+1
	byte	128
	byte	run,0x80+4
	byte	8
	byte	160
	byte	run,0x80+7
	byte	160
	byte	128
	byte	128
	byte	32
	byte	run,0x80+8




bush3_data_b:
	byte	0x04, 0x0d, 0xfd, 0x29, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	run,3,9
	byte	2
	byte	run,0x80+9
	byte	160
	byte	88
	byte	88
	byte	96
	byte	128
	byte	run,0x80+2
	byte	8
	byte	38
	byte	37
	byte	37
	byte	38
	byte	9
	byte	run,3,37
	byte	10
	byte	2
	byte	2
	byte	run,0x80+3
	byte	128
	byte	128
	byte	run,0x80+1
	byte	128
	byte	136
	byte	168
	byte	152
	byte	run,3,88
	byte	160




bush3_data_c:
	byte	0x03, 0x11, 0x01, 0x27, 0x00, 0x00
	byte	run,0x80+2
	byte	2
	byte	10
	byte	38
	byte	150
	byte	149
	byte	150
	byte	40
	byte	run,0x80+3
	byte	2
	byte	run,3,9
	byte	2
	byte	32
	byte	152
	byte	88
	byte	88
	byte	90
	byte	89
	byte	165
	byte	37
	byte	37
	byte	10
	byte	run,0x80+1
	byte	128
	byte	run,4,96
	byte	128
	byte	run,0x80+3
	byte	run,6,128
	byte	run,0x80+8




bush3_data_d:
	byte	0x04, 0x08, 0xfd, 0x1c, 0x00, 0x00
	byte	32
	byte	40
	byte	38
	byte	run,3,37
	byte	38
	byte	8
	byte	run,0x80+3
	byte	128
	byte	130
	byte	130
	byte	2
	byte	run,0x80+4
	byte	130
	byte	98
	byte	90
	byte	88
	byte	160
	byte	32
	byte	152
	byte	152
	byte	88
	byte	86
	byte	86
	byte	168
	byte	run,0x80+1




bush3_data_e:
	byte	0x02, 0x0a, 0xfe, 0x0f, 0x00, 0x00
	byte	128
	byte	160
	byte	152
	byte	150
	byte	150
	byte	154
	byte	run,3,37
	byte	10
	byte	32
	byte	152
	byte	150
	byte	86
	byte	86
	byte	104
	byte	run,3,128
	byte	run,0x80+1




bush3_data_f:
	byte	0x04, 0x0f, 0x00, 0x14, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	run,3,9
	byte	2
	byte	run,0x80+9
	byte	128
	byte	96
	byte	88
	byte	88
	byte	154
	byte	41
	byte	9
	byte	2
	byte	run,0x80+6
	byte	2
	byte	9
	byte	9
	byte	41
	byte	162
	byte	88
	byte	88
	byte	152
	byte	32
	byte	10
	byte	37
	byte	37
	byte	9
	byte	2
	byte	128
	byte	run,5,96
	byte	128
	byte	run,0x80+2
	byte	128
	byte	run,3,96
	byte	128
	byte	run,0x80+1




