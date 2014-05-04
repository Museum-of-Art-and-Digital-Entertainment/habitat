;---------------------------------------
;
;	animation cel data
;

car4_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,28+left,252

	byte	0b11111100

	word	car4_data_a - car4_data
	word	car4_data_b - car4_data
	word	car4_data_c - car4_data
	word	car4_data_d - car4_data
	word	car4_data_e - car4_data
	word	car4_data_f - car4_data


car4_data_a:
	byte	0x08, 0x20, 0xf8, 0x1c, 0x00, 0x00
	byte	run,0x80+15
	byte	10
	byte	run,11,170
	byte	37
	byte	42
	byte	run,3,37
	byte	run,0x80+13
	byte	2
	byte	41
	byte	run,4,149
	byte	170
	byte	run,7,149
	byte	85
	byte	170
	byte	run,3,85
	byte	run,0x80+12
	byte	42
	byte	150
	byte	run,4,86
	byte	85
	byte	170
	byte	run,8,85
	byte	170
	byte	run,3,85
	byte	run,0x80+5
	byte	2
	byte	2
	byte	run,4,10
	byte	42
	byte	run,5,234
	byte	250
	byte	run,3,186
	byte	98
	byte	110
	byte	88
	byte	91
	byte	86
	byte	85
	byte	85
	byte	169
	byte	86
	byte	85
	byte	85
	byte	run,0x80+1
	byte	2
	byte	10
	byte	42
	byte	run,8,170
	byte	run,4,171
	byte	run,8,170
	byte	234
	byte	250
	byte	190
	byte	111
	byte	91
	byte	86
	byte	149
	byte	101
	byte	run,9,170
	byte	191
	byte	run,8,255
	byte	191
	byte	run,9,170
	byte	255
	byte	170
	byte	85
	byte	85
	byte	128
	byte	160
	byte	168
	byte	run,7,170
	byte	234
	byte	234
	byte	run,4,250
	byte	234
	byte	234
	byte	run,7,170
	byte	171
	byte	175
	byte	190
	byte	249
	byte	165
	byte	85
	byte	86
	byte	run,0x80+4
	byte	128
	byte	160
	byte	160
	byte	run,4,168
	byte	run,6,170
	byte	168
	byte	run,3,171
	byte	174
	byte	174
	byte	185
	byte	249
	byte	229
	byte	149
	byte	85
	byte	90
	byte	101
	byte	149
	byte	85




car4_data_b:
	byte	0x0a, 0x17, 0x00, 0x1e, 0x00, 0x00
	byte	234
	byte	run,4,229
	byte	234
	byte	229
	byte	149
	byte	149
	byte	150
	byte	86
	byte	89
	byte	89
	byte	101
	byte	101
	byte	149
	byte	149
	byte	170
	byte	run,3,149
	byte	85
	byte	85
	byte	170
	byte	run,4,85
	byte	170
	byte	101
	byte	149
	byte	149
	byte	run,8,85
	byte	170
	byte	run,5,85
	byte	170
	byte	run,4,85
	byte	170
	byte	run,11,85
	byte	170
	byte	run,5,85
	byte	170
	byte	run,4,85
	byte	170
	byte	run,11,85
	byte	170
	byte	run,5,85
	byte	170
	byte	run,4,85
	byte	170
	byte	run,11,85
	byte	170
	byte	run,5,85
	byte	170
	byte	run,4,85
	byte	170
	byte	run,11,85
	byte	170
	byte	run,5,85
	byte	170
	byte	run,4,85
	byte	170
	byte	run,11,85
	byte	170
	byte	run,5,85
	byte	170
	byte	run,4,85
	byte	170
	byte	run,11,85
	byte	170
	byte	run,5,85
	byte	170
	byte	run,4,85
	byte	170
	byte	run,3,149
	byte	run,3,101
	byte	run,3,89
	byte	86
	byte	86
	byte	170
	byte	run,3,86
	byte	89
	byte	89
	byte	174
	byte	run,4,110
	byte	174
	byte	111
	byte	run,3,91
	byte	86
	byte	86
	byte	run,5,85
	byte	170
	byte	run,5,85




car4_data_c:
	byte	0x07, 0x23, 0x0a, 0x1f, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	10
	byte	42
	byte	42
	byte	run,14,170
	byte	234
	byte	234
	byte	186
	byte	190
	byte	111
	byte	91
	byte	86
	byte	149
	byte	101
	byte	89
	byte	86
	byte	run,3,85
	byte	10
	byte	42
	byte	run,7,170
	byte	171
	byte	175
	byte	175
	byte	run,4,191
	byte	175
	byte	175
	byte	171
	byte	run,7,170
	byte	234
	byte	250
	byte	191
	byte	106
	byte	85
	byte	85
	byte	165
	byte	90
	byte	85
	byte	168
	byte	run,8,170
	byte	250
	byte	254
	byte	254
	byte	run,4,255
	byte	254
	byte	254
	byte	250
	byte	run,8,170
	byte	171
	byte	255
	byte	170
	byte	85
	byte	85
	byte	86
	byte	169
	byte	85
	byte	run,0x80+2
	byte	128
	byte	160
	byte	168
	byte	run,18,170
	byte	171
	byte	175
	byte	190
	byte	249
	byte	229
	byte	149
	byte	86
	byte	89
	byte	101
	byte	149
	byte	85
	byte	85
	byte	run,0x80+7
	byte	run,4,128
	byte	160
	byte	run,5,174
	byte	190
	byte	185
	byte	186
	byte	185
	byte	229
	byte	229
	byte	149
	byte	149
	byte	run,3,85
	byte	170
	byte	run,6,85
	byte	run,0x80+11
	byte	2
	byte	170
	byte	run,6,86
	byte	170
	byte	86
	byte	86
	byte	85
	byte	85
	byte	86
	byte	91
	byte	111
	byte	111
	byte	175
	byte	run,3,111
	byte	110
	byte	104
	byte	96
	byte	run,0x80+11
	byte	168
	byte	run,10,170
	byte	88
	byte	88
	byte	168
	byte	run,3,248
	byte	224
	byte	224
	byte	128
	byte	128
	byte	run,0x80+3




car4_data_d:
	byte	0x09, 0x1c, 0xf8, 0x38, 0x00, 0x00
	byte	run,8,37
	byte	38
	byte	40
	byte	run,0x80+18
	byte	run,8,85
	byte	170
	byte	run,0x80+19
	byte	run,8,85
	byte	165
	byte	10
	byte	run,0x80+18
	byte	run,9,85
	byte	170
	byte	32
	byte	8
	byte	2
	byte	run,0x80+15
	byte	90
	byte	run,8,85
	byte	165
	byte	10
	byte	run,0x80+2
	byte	128
	byte	32
	byte	8
	byte	2
	byte	run,0x80+11
	byte	85
	byte	170
	byte	run,8,85
	byte	169
	byte	2
	byte	2
	byte	run,0x80+4
	byte	128
	byte	32
	byte	8
	byte	2
	byte	run,0x80+7
	byte	105
	byte	149
	byte	run,11,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	128
	byte	32
	byte	8
	byte	2
	byte	run,0x80+3
	byte	run,21,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	169
	byte	10
	byte	run,0x80+1
	byte	148
	byte	148
	byte	run,25,84
	byte	170




car4_data_e:
	byte	0x09, 0x1a, 0x00, 0x38, 0x00, 0x00
	byte	run,4,37
	byte	run,4,9
	byte	run,15,2
	byte	1
	byte	1
	byte	2
	byte	85
	byte	106
	byte	170
	byte	255
	byte	run,4,85
	byte	170
	byte	run,0x80+14
	byte	170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	149
	byte	213
	byte	run,4,85
	byte	170
	byte	run,0x80+14
	byte	170
	byte	85
	byte	170
	byte	run,8,85
	byte	170
	byte	run,0x80+14
	byte	170
	byte	85
	byte	170
	byte	run,8,85
	byte	170
	byte	run,0x80+14
	byte	170
	byte	85
	byte	170
	byte	run,8,85
	byte	170
	byte	run,0x80+11
	byte	2
	byte	9
	byte	37
	byte	150
	byte	88
	byte	160
	byte	run,8,85
	byte	170
	byte	run,0x80+7
	byte	2
	byte	9
	byte	37
	byte	150
	byte	88
	byte	96
	byte	128
	byte	run,0x80+3
	byte	run,8,85
	byte	170
	byte	2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	150
	byte	88
	byte	96
	byte	128
	byte	run,0x80+7
	byte	89
	byte	run,3,101
	byte	run,4,149
	byte	run,3,85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+11




car4_data_f:
	byte	0x07, 0x0b, 0x09, 0x29, 0x00, 0x00
	byte	run,9,85
	byte	90
	byte	160
	byte	64
	byte	run,7,85
	byte	106
	byte	128
	byte	run,0x80+2
	byte	run,5,85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	run,4,85
	byte	90
	byte	160
	byte	run,0x80+5
	byte	run,3,85
	byte	106
	byte	128
	byte	run,0x80+6
	byte	85
	byte	90
	byte	160
	byte	run,0x80+8
	byte	160
	byte	run,0x80+9




