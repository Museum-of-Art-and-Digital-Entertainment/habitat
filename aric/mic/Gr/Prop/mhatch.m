;---------------------------------------
;
;	animation cel data
;

mhatch_data::
	byte	swing	+ 1
	byte	0b00100000
	byte	mhatch_start_end - mhatch_data
	byte	no_cont

	byte	240+right,36+left,1

	byte	0b10100000
	byte	0b11100000

	word	mhatch_data_a - mhatch_data
	word	mhatch_data_b - mhatch_data
	word	mhatch_data_c - mhatch_data

mhatch_start_end:
	byte	0,0,1,1


mhatch_data_a:
	byte	cel_box + 0x01, 0x01, 0xfb, 0x00, 0x00, 0x00
	byte	0x08

mhatch_data_b:
	byte	0x09, 0x0f, 0xfa, 0x0b, 0x04, 0x07
	byte	run,0x80+6
	byte	run,3,2
	byte	run,0x80+8
	byte	2
	byte	42
	byte	run,3,170
	byte	106
	byte	106
	byte	150
	byte	149
	byte	41
	byte	2
	byte	run,0x80+2
	byte	2
	byte	42
	byte	run,8,170
	byte	106
	byte	86
	byte	149
	byte	41
	byte	2
	byte	run,12,170
	byte	85
	byte	85
	byte	run,13,170
	byte	85
	byte	85
	byte	run,13,170
	byte	85
	byte	85
	byte	170
	byte	160
	byte	run,10,170
	byte	165
	byte	85
	byte	90
	byte	160
	byte	run,0x80+2
	byte	160
	byte	run,6,170
	byte	165
	byte	85
	byte	90
	byte	160
	byte	run,0x80+6
	byte	128
	byte	128
	byte	160
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+4




mhatch_data_c:
	byte	0x09, 0x10, 0xfa, 0x0c, 0x00, 0x00
	byte	run,0x80+6
	byte	run,3,2
	byte	run,0x80+9
	byte	2
	byte	41
	byte	149
	byte	149
	byte	89
	byte	93
	byte	85
	byte	149
	byte	149
	byte	41
	byte	2
	byte	run,0x80+3
	byte	2
	byte	41
	byte	149
	byte	run,5,85
	byte	89
	byte	93
	byte	85
	byte	85
	byte	149
	byte	41
	byte	2
	byte	run,0x80+1
	byte	170
	byte	run,8,85
	byte	90
	byte	105
	byte	149
	byte	150
	byte	101
	byte	169
	byte	2
	byte	170
	byte	85
	byte	89
	byte	93
	byte	85
	byte	89
	byte	93
	byte	85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	run,7,85
	byte	149
	byte	169
	byte	90
	byte	149
	byte	101
	byte	150
	byte	90
	byte	160
	byte	160
	byte	90
	byte	run,6,85
	byte	101
	byte	117
	byte	85
	byte	149
	byte	149
	byte	90
	byte	160
	byte	run,0x80+3
	byte	160
	byte	90
	byte	85
	byte	85
	byte	101
	byte	117
	byte	run,3,85
	byte	90
	byte	160
	byte	run,0x80+7
	byte	128
	byte	128
	byte	run,3,96
	byte	128
	byte	128
	byte	run,0x80+5




