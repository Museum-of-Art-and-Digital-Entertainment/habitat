;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

wand3_data::
	byte	swing	+ 7
	byte	0b00000000
	byte	wand3_start_end - wand3_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000
	byte	0b00010000
	byte	0b00001000
	byte	0b00000100
	byte	0b00000010
	byte	0b00000001

	word	wand3_data_a - wand3_data
	word	wand3_data_b - wand3_data
	word	wand3_data_c - wand3_data
	word	wand3_data_d - wand3_data
	word	wand3_data_e - wand3_data
	word	wand3_data_f - wand3_data
	word	wand3_data_g - wand3_data
	word	wand3_data_h - wand3_data

wand3_start_end:
	byte	0,0,1,1,cycle+0,1,2,2,3,3,cycle+2,3,4,4,5,5,cycle+4,5,6,6,7,7,cycle+6,7


wand3_data_a:
	byte	0x02, 0x19, 0x01, 0x0d, 0x00, 0x00
	byte	2
	byte	run,5,9
	byte	42
	byte	run,5,37
	byte	42
	byte	37
	byte	10
	byte	10
	byte	37
	byte	run,6,149
	byte	37
	byte	10
	byte	run,0x80+1
	byte	run,5,128
	byte	160
	byte	run,5,96
	byte	160
	byte	96
	byte	128
	byte	128
	byte	96
	byte	run,6,88
	byte	96
	byte	128




wand3_data_b:
	byte	0x02, 0x19, 0x01, 0x0d, 0x00, 0x00
	byte	2
	byte	run,10,9
	byte	10
	byte	42
	byte	37
	byte	10
	byte	10
	byte	47
	byte	run,6,191
	byte	47
	byte	10
	byte	run,0x80+1
	byte	run,11,128
	byte	160
	byte	96
	byte	128
	byte	128
	byte	224
	byte	run,6,248
	byte	224
	byte	128




wand3_data_c:
	byte	0x02, 0x1a, 0x01, 0x0f, 0x00, 0x00
	byte	42
	byte	run,3,38
	byte	37
	byte	37
	byte	42
	byte	47
	byte	42
	byte	run,3,37
	byte	42
	byte	run,3,2
	byte	10
	byte	run,4,42
	byte	8
	byte	8
	byte	run,0x80+1
	byte	8
	byte	run,0x80+1
	byte	42
	byte	38
	byte	38
	byte	166
	byte	86
	byte	86
	byte	run,3,170
	byte	run,3,86
	byte	170
	byte	96
	byte	96
	byte	160
	byte	168
	byte	run,4,170
	byte	136
	byte	136
	byte	128
	byte	8
	byte	128




wand3_data_d:
	byte	0x03, 0x1b, 0x01, 0x10, 0x00, 0x00
	byte	42
	byte	run,3,38
	byte	37
	byte	37
	byte	run,3,42
	byte	149
	byte	149
	byte	37
	byte	10
	byte	run,3,2
	byte	10
	byte	run,4,42
	byte	run,3,8
	byte	run,0x80+1
	byte	8
	byte	run,0x80+1
	byte	42
	byte	38
	byte	38
	byte	166
	byte	86
	byte	86
	byte	170
	byte	190
	byte	170
	byte	85
	byte	85
	byte	86
	byte	168
	byte	96
	byte	96
	byte	160
	byte	168
	byte	run,4,170
	byte	run,3,136
	byte	128
	byte	8
	byte	128
	byte	run,0x80+9
	byte	128
	byte	128
	byte	run,0x80+16




wand3_data_e:
	byte	0x03, 0x25, 0x01, 0x17, 0x00, 0x00
	byte	10
	byte	10
	byte	2
	byte	2
	byte	run,0x80+2
	byte	42
	byte	37
	byte	42
	byte	run,0x80+2
	byte	10
	byte	9
	byte	10
	byte	run,0x80+2
	byte	42
	byte	37
	byte	42
	byte	run,0x80+2
	byte	10
	byte	9
	byte	10
	byte	run,0x80+2
	byte	10
	byte	run,3,9
	byte	run,7,10
	byte	run,4,170
	byte	168
	byte	168
	byte	154
	byte	153
	byte	154
	byte	152
	byte	152
	byte	154
	byte	153
	byte	154
	byte	152
	byte	152
	byte	154
	byte	153
	byte	154
	byte	152
	byte	152
	byte	154
	byte	153
	byte	154
	byte	152
	byte	168
	byte	154
	byte	85
	byte	153
	byte	85
	byte	170
	byte	run,4,254
	byte	170
	byte	170
	byte	128
	byte	128
	byte	run,0x80+4
	byte	run,3,128
	byte	run,0x80+2
	byte	160
	byte	96
	byte	160
	byte	run,0x80+2
	byte	run,3,128
	byte	run,0x80+2
	byte	160
	byte	96
	byte	160
	byte	run,0x80+2
	byte	run,11,128




wand3_data_f:
	byte	0x03, 0x25, 0x01, 0x17, 0x00, 0x00
	byte	10
	byte	10
	byte	2
	byte	2
	byte	run,0x80+2
	byte	10
	byte	9
	byte	10
	byte	run,0x80+2
	byte	42
	byte	37
	byte	42
	byte	run,0x80+2
	byte	10
	byte	9
	byte	10
	byte	run,0x80+2
	byte	42
	byte	37
	byte	42
	byte	run,0x80+2
	byte	10
	byte	run,3,9
	byte	run,7,10
	byte	run,4,170
	byte	168
	byte	168
	byte	154
	byte	153
	byte	154
	byte	152
	byte	152
	byte	154
	byte	153
	byte	154
	byte	152
	byte	152
	byte	154
	byte	153
	byte	154
	byte	152
	byte	152
	byte	154
	byte	153
	byte	154
	byte	152
	byte	168
	byte	154
	byte	85
	byte	153
	byte	85
	byte	170
	byte	run,4,86
	byte	170
	byte	170
	byte	128
	byte	128
	byte	run,0x80+4
	byte	160
	byte	96
	byte	160
	byte	run,0x80+2
	byte	run,3,128
	byte	run,0x80+2
	byte	160
	byte	96
	byte	160
	byte	run,0x80+2
	byte	run,3,128
	byte	run,0x80+2
	byte	run,11,128




wand3_data_g:
	byte	0x04, 0x21, 0x01, 0x15, 0x00, 0x00
	byte	run,0x80+2
	byte	run,9,10
	byte	34
	byte	run,0x80+21
	byte	42
	byte	38
	byte	37
	byte	37
	byte	run,5,38
	byte	165
	byte	165
	byte	166
	byte	37
	byte	42
	byte	run,0x80+3
	byte	2
	byte	run,0x80+5
	byte	2
	byte	run,0x80+9
	byte	170
	byte	106
	byte	170
	byte	174
	byte	170
	byte	run,3,251
	byte	59
	byte	191
	byte	191
	byte	106
	byte	85
	byte	170
	byte	38
	byte	149
	byte	149
	byte	170
	byte	149
	byte	149
	byte	42
	byte	149
	byte	149
	byte	170
	byte	149
	byte	149
	byte	38
	byte	run,4,8
	byte	46
	byte	8
	byte	170
	byte	102
	byte	150
	byte	150
	byte	166
	byte	run,3,230
	byte	38
	byte	150
	byte	150
	byte	102
	byte	86
	byte	170
	byte	run,0x80+1
	byte	128
	byte	128
	byte	160
	byte	128
	byte	128
	byte	run,0x80+1
	byte	128
	byte	128
	byte	160
	byte	128
	byte	128
	byte	run,0x80+7




wand3_data_h:
	byte	0x04, 0x1e, 0x01, 0x12, 0x00, 0x00
	byte	run,0x80+2
	byte	run,9,10
	byte	34
	byte	run,0x80+18
	byte	42
	byte	38
	byte	37
	byte	37
	byte	run,5,38
	byte	165
	byte	165
	byte	166
	byte	37
	byte	42
	byte	run,0x80+2
	byte	2
	byte	run,0x80+3
	byte	2
	byte	run,0x80+9
	byte	170
	byte	106
	byte	170
	byte	174
	byte	170
	byte	251
	byte	235
	byte	239
	byte	47
	byte	191
	byte	191
	byte	106
	byte	85
	byte	170
	byte	38
	byte	149
	byte	170
	byte	149
	byte	42
	byte	149
	byte	170
	byte	149
	byte	38
	byte	run,5,8
	byte	46
	byte	8
	byte	170
	byte	102
	byte	150
	byte	150
	byte	166
	byte	run,3,230
	byte	38
	byte	150
	byte	150
	byte	102
	byte	86
	byte	170
	byte	run,0x80+1
	byte	128
	byte	160
	byte	128
	byte	run,0x80+1
	byte	128
	byte	160
	byte	128
	byte	run,0x80+8




