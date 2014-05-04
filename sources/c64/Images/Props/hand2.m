;---------------------------------------
;
;	animation cel data
;

hand2_data::
	byte	out	+ 13
	byte	0b00000000
	byte	hand2_start_end - hand2_data
	byte	no_cont

	byte	0,0,0

	byte	0b10000000
	byte	0b10000111
	byte	0b11000111
	byte	0b10100111
	byte	0b10010111
	byte	0b10001111
	byte	0b10011111
	byte	0b10001111
	byte	0b11001111
	byte	0b10101111
	byte	0b10011111
	byte	0b10001111
	byte	0b10011111
	byte	0b10001111

	word	hand2_data_a - hand2_data
	word	hand2_data_b - hand2_data
	word	hand2_data_c - hand2_data
	word	hand2_data_d - hand2_data
	word	hand2_data_e - hand2_data
	word	hand2_data_f - hand2_data
	word	hand2_data_g - hand2_data
	word	hand2_data_h - hand2_data

hand2_start_end:
	byte	0,0,1,1,1,13


hand2_data_a:
	byte	cel_box + 0x01, 0x01, 0x00, 0xe9, 0x00, 0x00
	byte	0xaa

hand2_data_b:
	byte	0x06, 0x25, 0x03, 0x2e, 0x00, 0x00
	byte	32
	byte	40
	byte	38
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+5
	byte	170
	byte	37
	byte	9
	byte	2
	byte	run,0x80+24
	byte	128
	byte	96
	byte	88
	byte	86
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	170
	byte	run,3,85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	42
	byte	9
	byte	2
	byte	run,0x80+16
	byte	128
	byte	96
	byte	88
	byte	86
	byte	run,9,85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	85
	byte	85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+16
	byte	128
	byte	96
	byte	88
	byte	86
	byte	85
	byte	85
	byte	106
	byte	128
	byte	96
	byte	88
	byte	86
	byte	85
	byte	85
	byte	149
	byte	149
	byte	85
	byte	85
	byte	86
	byte	88
	byte	88
	byte	86
	byte	150
	byte	37
	byte	9
	byte	2
	byte	run,0x80+16
	byte	128
	byte	96
	byte	168
	byte	run,0x80+4
	byte	128
	byte	96
	byte	88
	byte	86
	byte	85
	byte	85
	byte	170
	byte	run,0x80+4
	byte	run,3,128
	byte	160
	byte	run,0x80+26
	byte	128
	byte	96
	byte	168
	byte	run,0x80+8




hand2_data_c:
	byte	0x04, 0x18, 0x00, 0x09, 0x00, 0x00
	byte	run,0x80+2
	byte	2
	byte	43
	byte	47
	byte	run,5,191
	byte	43
	byte	run,3,11
	byte	2
	byte	run,0x80+9
	byte	2
	byte	11
	byte	139
	byte	239
	byte	run,8,255
	byte	254
	byte	254
	byte	249
	byte	169
	byte	2
	byte	run,0x80+7
	byte	160
	byte	run,3,248
	byte	254
	byte	run,3,255
	byte	254
	byte	248
	byte	254
	byte	255
	byte	191
	byte	106
	byte	86
	byte	86
	byte	85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+8
	byte	run,3,128
	byte	run,0x80+3
	byte	128
	byte	128
	byte	run,0x80+3
	byte	128
	byte	128
	byte	96
	byte	96
	byte	88
	byte	152
	byte	38
	byte	10




hand2_data_d:
	byte	0x07, 0x1a, 0xfd, 0x02, 0x00, 0x00
	byte	run,0x80+8
	byte	run,4,2
	byte	run,0x80+18
	byte	10
	byte	47
	byte	191
	byte	191
	byte	run,3,255
	byte	254
	byte	run,3,187
	byte	190
	byte	190
	byte	46
	byte	10
	byte	run,0x80+9
	byte	2
	byte	139
	byte	234
	byte	239
	byte	run,3,191
	byte	239
	byte	run,8,255
	byte	190
	byte	171
	byte	run,3,191
	byte	47
	byte	11
	byte	2
	byte	42
	byte	191
	byte	255
	byte	255
	byte	254
	byte	190
	byte	run,11,255
	byte	191
	byte	255
	byte	251
	byte	254
	byte	run,3,255
	byte	254
	byte	168
	byte	run,0x80+1
	byte	128
	byte	226
	byte	171
	byte	251
	byte	254
	byte	254
	byte	run,3,255
	byte	254
	byte	251
	byte	255
	byte	251
	byte	run,4,254
	byte	251
	byte	251
	byte	175
	byte	255
	byte	239
	byte	138
	byte	run,0x80+4
	byte	128
	byte	224
	byte	248
	byte	248
	byte	254
	byte	run,3,190
	byte	254
	byte	248
	byte	254
	byte	run,6,255
	byte	250
	byte	run,3,224
	byte	128
	byte	run,0x80+15
	byte	run,6,128
	byte	run,0x80+7




hand2_data_e:
	byte	0x05, 0x0e, 0xfe, 0xf6, 0x00, 0x00
	byte	run,0x80+2
	byte	8
	byte	2
	byte	run,0x80+11
	byte	8
	byte	162
	byte	42
	byte	170
	byte	40
	byte	10
	byte	8
	byte	2
	byte	2
	byte	run,0x80+4
	byte	128
	byte	8
	byte	42
	byte	130
	byte	170
	byte	136
	byte	34
	byte	170
	byte	42
	byte	168
	byte	162
	byte	40
	byte	168
	byte	32
	byte	run,0x80+1
	byte	32
	byte	170
	byte	42
	byte	170
	byte	168
	byte	170
	byte	136
	byte	160
	byte	128
	byte	run,0x80+6
	byte	34
	byte	128
	byte	160
	byte	128
	byte	run,0x80+8




hand2_data_f:
	byte	0x03, 0x1f, 0x08, 0x53, 0x00, 0x00
	byte	10
	byte	37
	byte	run,6,149
	byte	run,3,37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+17
	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	86
	byte	86
	byte	run,7,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+16
	byte	128
	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	86
	byte	86
	byte	run,7,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2




hand2_data_g:
	byte	0x05, 0x30, 0x0b, 0x68, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	9
	byte	run,4,37
	byte	137
	byte	137
	byte	106
	byte	101
	byte	101
	byte	run,13,149
	byte	run,3,37
	byte	run,3,9
	byte	run,3,2
	byte	run,0x80+15
	byte	170
	byte	86
	byte	run,6,85
	byte	149
	byte	101
	byte	89
	byte	run,9,86
	byte	89
	byte	89
	byte	86
	byte	run,10,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	10
	byte	37
	byte	149
	byte	149
	byte	85
	byte	85
	byte	149
	byte	101
	byte	89
	byte	86
	byte	run,6,85
	byte	149
	byte	106
	byte	run,5,85
	byte	86
	byte	86
	byte	89
	byte	89
	byte	169
	byte	run,14,85
	byte	169
	byte	2
	byte	run,0x80+2
	byte	2
	byte	9
	byte	137
	byte	101
	byte	run,3,89
	byte	86
	byte	86
	byte	run,3,85
	byte	149
	byte	149
	byte	170
	byte	run,4,149
	byte	run,3,85
	byte	106
	byte	149
	byte	149
	byte	run,20,85
	byte	165
	byte	9
	byte	2
	byte	168
	byte	86
	byte	run,7,85
	byte	run,4,149
	byte	165
	byte	90
	byte	run,7,85
	byte	169
	byte	86
	byte	run,24,85




hand2_data_h:
	byte	0x05, 0x2e, 0x10, 0x68, 0x00, 0x00
	byte	run,3,128
	byte	run,3,96
	byte	run,6,88
	byte	168
	byte	86
	byte	run,32,85
	byte	run,0x80+14
	byte	128
	byte	96
	byte	88
	byte	86
	byte	run,28,85
	byte	run,0x80+18
	byte	128
	byte	128
	byte	96
	byte	96
	byte	run,3,88
	byte	run,3,86
	byte	run,18,85
	byte	run,0x80+28
	byte	128
	byte	128
	byte	96
	byte	96
	byte	run,3,88
	byte	run,3,86
	byte	run,8,85
	byte	run,0x80+38
	byte	run,3,128
	byte	run,3,96
	byte	88
	byte	88




