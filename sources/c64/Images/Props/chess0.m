;---------------------------------------
;
;	animation cel data
;

chess0_data::
	byte	swing	+ 9
	byte	0b00000000
	byte	chess0_start_end - chess0_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11000000
	byte	0b10100000
	byte	0b10010000
	byte	0b10001000
	byte	0b10000100
	byte	0b10000010
	byte	0b10000001
	byte	0b10000100
	byte	0b10000001
	byte	0b10000001

	word	chess0_data_a - chess0_data
	word	chess0_data_b - chess0_data
	word	chess0_data_c - chess0_data
	word	chess0_data_d - chess0_data
	word	chess0_data_e - chess0_data
	word	chess0_data_f - chess0_data
	word	chess0_data_g - chess0_data
	word	chess0_data_h - chess0_data

chess0_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9


chess0_data_a:
	byte	cel_box + 0x01, 0x01, 0x00, 0xf8, 0x00, 0x00
	byte	0x20

chess0_data_b:
	byte	0x03, 0x0c, 0xff, 0xfe, 0x00, 0x00
	byte	42
	byte	37
	byte	9
	byte	2
	byte	run,0x80+3
	byte	2
	byte	9
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	85
	byte	85
	byte	86
	byte	run,3,152
	byte	86
	byte	85
	byte	85
	byte	86
	byte	168
	byte	160
	byte	96
	byte	128
	byte	run,0x80+5
	byte	128
	byte	128
	byte	run,0x80+2




chess0_data_c:
	byte	0x03, 0x0f, 0xff, 0x01, 0x00, 0x00
	byte	2
	byte	2
	byte	run,0x80+2
	byte	run,8,2
	byte	run,0x80+3
	byte	170
	byte	85
	byte	149
	byte	149
	byte	170
	byte	85
	byte	run,3,89
	byte	106
	byte	89
	byte	89
	byte	149
	byte	38
	byte	8
	byte	160
	byte	96
	byte	128
	byte	128
	byte	160
	byte	run,7,96
	byte	128
	byte	run,0x80+2




chess0_data_d:
	byte	0x03, 0x0f, 0xff, 0x01, 0x00, 0x00
	byte	2
	byte	2
	byte	run,10,10
	byte	2
	byte	2
	byte	run,0x80+1
	byte	170
	byte	85
	byte	149
	byte	149
	byte	150
	byte	86
	byte	88
	byte	88
	byte	106
	byte	101
	byte	85
	byte	149
	byte	165
	byte	170
	byte	168
	byte	160
	byte	96
	byte	128
	byte	128
	byte	run,0x80+3
	byte	40
	byte	150
	byte	86
	byte	86
	byte	104
	byte	128
	byte	run,0x80+2




chess0_data_e:
	byte	0x03, 0x0f, 0xff, 0x01, 0x00, 0x00
	byte	42
	byte	37
	byte	41
	byte	10
	byte	9
	byte	10
	byte	9
	byte	10
	byte	9
	byte	run,3,37
	byte	38
	byte	38
	byte	40
	byte	170
	byte	85
	byte	85
	byte	170
	byte	153
	byte	102
	byte	153
	byte	102
	byte	153
	byte	run,3,85
	byte	154
	byte	154
	byte	168
	byte	160
	byte	96
	byte	160
	byte	run,6,128
	byte	run,5,96
	byte	160




chess0_data_f:
	byte	0x03, 0x0f, 0xff, 0x01, 0x00, 0x00
	byte	2
	byte	2
	byte	run,0x80+1
	byte	2
	byte	9
	byte	38
	byte	42
	byte	2
	byte	run,0x80+1
	byte	run,3,2
	byte	run,0x80+3
	byte	170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	149
	byte	166
	byte	170
	byte	166
	byte	166
	byte	85
	byte	166
	byte	38
	byte	38
	byte	42
	byte	160
	byte	96
	byte	128
	byte	96
	byte	88
	byte	166
	byte	170
	byte	160
	byte	128
	byte	160
	byte	96
	byte	160
	byte	run,0x80+3




chess0_data_g:
	byte	0x03, 0x0e, 0xff, 0x00, 0x00, 0x00
	byte	run,4,2
	byte	9
	byte	38
	byte	42
	byte	2
	byte	run,0x80+6
	byte	170
	byte	85
	byte	170
	byte	89
	byte	85
	byte	149
	byte	166
	byte	170
	byte	170
	byte	42
	byte	8
	byte	8
	byte	38
	byte	8
	byte	160
	byte	96
	byte	160
	byte	96
	byte	88
	byte	166
	byte	170
	byte	160
	byte	128
	byte	run,0x80+5




chess0_data_h:
	byte	0x03, 0x0d, 0xff, 0xff, 0x00, 0x00
	byte	run,0x80+2
	byte	2
	byte	2
	byte	run,5,9
	byte	2
	byte	2
	byte	run,0x80+2
	byte	42
	byte	149
	byte	run,9,85
	byte	149
	byte	42
	byte	run,0x80+1
	byte	128
	byte	96
	byte	96
	byte	run,5,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




