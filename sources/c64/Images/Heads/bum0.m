;---------------------------------------
;
;	animation cel data
;

bum0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bum0_start_end - bum0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bum0_data_a - bum0_data
	word	bum0_data_b - bum0_data
	word	bum0_data_c - bum0_data

bum0_start_end:
	byte	0,0,1,1,0,0,2,2


bum0_data_a:
	byte	0x04, 0x17, 0x00, 0x01, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	9
	byte	9
	byte	10
	byte	169
	byte	149
	byte	42
	byte	run,7,2
	byte	run,0x80+2
	byte	2
	byte	42
	byte	42
	byte	171
	byte	174
	byte	171
	byte	175
	byte	155
	byte	111
	byte	111
	byte	154
	byte	105
	byte	86
	byte	169
	byte	run,3,170
	byte	run,4,85
	byte	169
	byte	2
	byte	168
	byte	184
	byte	234
	byte	191
	byte	run,3,255
	byte	253
	byte	255
	byte	run,3,191
	byte	174
	byte	91
	byte	run,4,170
	byte	run,4,85
	byte	170
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	144
	byte	152
	byte	164
	byte	248
	byte	224
	byte	224
	byte	128
	byte	224
	byte	160
	byte	168
	byte	170
	byte	162
	byte	run,4,128
	byte	run,0x80+1




bum0_data_b:
	byte	0x05, 0x17, 0xfe, 0x00, 0x00, 0x00
	byte	run,0x80+7
	byte	1
	byte	1
	byte	3
	byte	2
	byte	2
	byte	10
	byte	10
	byte	run,3,42
	byte	10
	byte	run,0x80+5
	byte	2
	byte	10
	byte	10
	byte	42
	byte	47
	byte	47
	byte	189
	byte	189
	byte	191
	byte	175
	byte	127
	byte	127
	byte	94
	byte	91
	byte	170
	byte	169
	byte	149
	byte	170
	byte	42
	byte	37
	byte	37
	byte	41
	byte	10
	byte	run,3,170
	byte	254
	byte	255
	byte	255
	byte	153
	byte	101
	byte	103
	byte	run,3,255
	byte	186
	byte	238
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	169
	byte	85
	byte	101
	byte	138
	byte	run,0x80+1
	byte	128
	byte	128
	byte	160
	byte	224
	byte	224
	byte	248
	byte	249
	byte	249
	byte	235
	byte	246
	byte	246
	byte	230
	byte	170
	byte	90
	byte	86
	byte	85
	byte	170
	byte	160
	byte	run,3,96
	byte	128
	byte	run,0x80+13
	byte	128
	byte	160
	byte	160
	byte	96
	byte	128
	byte	run,0x80+5




bum0_data_c:
	byte	0x04, 0x11, 0xfe, 0xfd, 0x00, 0x00
	byte	run,0x80+4
	byte	1
	byte	1
	byte	3
	byte	run,4,2
	byte	run,3,1
	byte	2
	byte	run,0x80+2
	byte	run,3,42
	byte	150
	byte	run,3,149
	byte	90
	byte	170
	byte	149
	byte	85
	byte	85
	byte	106
	byte	106
	byte	170
	byte	37
	byte	37
	byte	run,3,170
	byte	169
	byte	run,3,85
	byte	169
	byte	170
	byte	86
	byte	85
	byte	169
	byte	170
	byte	170
	byte	86
	byte	85
	byte	85
	byte	160
	byte	160
	byte	96
	byte	88
	byte	89
	byte	89
	byte	107
	byte	86
	byte	170
	byte	170
	byte	90
	byte	85
	byte	165
	byte	165
	byte	170
	byte	96
	byte	96




