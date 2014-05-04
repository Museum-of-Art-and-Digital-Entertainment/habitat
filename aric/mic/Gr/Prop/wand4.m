;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

wand4_data::
	byte	swing	+ 7
	byte	0b00000000
	byte	wand4_start_end - wand4_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b11000000
	byte	0b00100000
	byte	0b00110000
	byte	0b00001000
	byte	0b00001100
	byte	0b00000010
	byte	0b00000001

	word	wand4_data_a - wand4_data
	word	wand4_data_b - wand4_data
	word	wand4_data_c - wand4_data
	word	wand4_data_d - wand4_data
	word	wand4_data_e - wand4_data
	word	wand4_data_f - wand4_data
	word	wand4_data_g - wand4_data
	word	wand4_data_h - wand4_data

wand4_start_end:
	byte	0,0,1,1,cycle+0,1,2,2,3,3,cycle+2,3,4,4,5,5,cycle+4,5,6,6,7,7,cycle+6,7


wand4_data_a:
	byte	0x03, 0x17, 0x01, 0x0a, 0x00, 0x00
	byte	run,0x80+1
	byte	168
	byte	8
	byte	10
	byte	run,3,2
	byte	10
	byte	2
	byte	run,0x80+1
	byte	2
	byte	10
	byte	2
	byte	run,0x80+1
	byte	2
	byte	2
	byte	run,4,11
	byte	2
	byte	2
	byte	run,0x80+1
	byte	168
	byte	32
	byte	32
	byte	34
	byte	34
	byte	run,3,170
	byte	138
	byte	168
	byte	170
	byte	170
	byte	138
	byte	168
	byte	254
	byte	254
	byte	255
	byte	215
	byte	215
	byte	255
	byte	254
	byte	254
	byte	168
	byte	run,0x80+1
	byte	168
	byte	128
	byte	128
	byte	run,0x80+3
	byte	128
	byte	run,0x80+3
	byte	128
	byte	run,0x80+4
	byte	run,4,128
	byte	run,0x80+3




wand4_data_b:
	byte	0x03, 0x09, 0x01, 0x0a, 0x00, 0x00
	byte	2
	byte	2
	byte	run,4,9
	byte	2
	byte	2
	byte	run,0x80+1
	byte	86
	byte	86
	byte	run,4,85
	byte	86
	byte	86
	byte	168
	byte	run,0x80+2
	byte	run,4,128
	byte	run,0x80+3




wand4_data_c:
	byte	0x03, 0x1b, 0x01, 0x0b, 0x00, 0x00
	byte	170
	byte	149
	byte	42
	byte	37
	byte	9
	byte	2
	byte	34
	byte	170
	byte	154
	byte	34
	byte	run,0x80+5
	byte	2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	43
	byte	38
	byte	37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,4,86
	byte	168
	byte	152
	byte	152
	byte	168
	byte	168
	byte	254
	byte	255
	byte	239
	byte	171
	byte	171
	byte	155
	byte	238
	byte	169
	byte	85
	byte	85
	byte	86
	byte	168
	byte	168
	byte	88
	byte	160
	byte	96
	byte	128
	byte	run,0x80+11
	byte	128
	byte	128
	byte	224
	byte	224
	byte	160
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+2




wand4_data_d:
	byte	0x03, 0x0b, 0x01, 0x0b, 0x00, 0x00
	byte	11
	byte	10
	byte	41
	byte	run,4,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+1
	byte	171
	byte	86
	byte	run,7,85
	byte	86
	byte	168
	byte	128
	byte	128
	byte	160
	byte	run,4,96
	byte	128
	byte	128
	byte	run,0x80+2




wand4_data_e:
	byte	0x03, 0x19, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+20
	byte	10
	byte	9
	byte	10
	byte	run,0x80+2
	byte	42
	byte	37
	byte	9
	byte	run,8,2
	byte	10
	byte	9
	byte	10
	byte	10
	byte	9
	byte	37
	byte	38
	byte	41
	byte	153
	byte	105
	byte	105
	byte	137
	byte	2
	byte	run,0x80+1
	byte	170
	byte	86
	byte	88
	byte	run,8,160
	byte	168
	byte	88
	byte	168
	byte	88
	byte	run,3,86
	byte	154
	byte	166
	byte	run,4,154
	byte	168




wand4_data_f:
	byte	0x03, 0x0e, 0x00, 0x0d, 0x00, 0x00
	byte	run,0x80+3
	byte	10
	byte	9
	byte	10
	byte	run,0x80+8
	byte	37
	byte	37
	byte	149
	byte	105
	byte	105
	byte	137
	byte	run,6,9
	byte	2
	byte	run,0x80+1
	byte	run,6,86
	byte	run,4,154
	byte	152
	byte	152
	byte	160
	byte	128




wand4_data_g:
	byte	0x04, 0x17, 0x00, 0x0c, 0x00, 0x00
	byte	run,0x80+7
	byte	168
	byte	170
	byte	168
	byte	run,0x80+13
	byte	170
	byte	149
	byte	37
	byte	9
	byte	10
	byte	2
	byte	170
	byte	149
	byte	149
	byte	170
	byte	149
	byte	170
	byte	run,10,38
	byte	42
	byte	170
	byte	85
	byte	85
	byte	101
	byte	run,3,170
	byte	85
	byte	85
	byte	170
	byte	137
	byte	138
	byte	run,5,2
	byte	run,0x80+6
	byte	168
	byte	88
	byte	96
	byte	128
	byte	128
	byte	run,0x80+1
	byte	168
	byte	88
	byte	88
	byte	168
	byte	88
	byte	168
	byte	run,4,96
	byte	160
	byte	run,0x80+6




wand4_data_h:
	byte	0x04, 0x17, 0x00, 0x0c, 0x00, 0x00
	byte	run,0x80+6
	byte	32
	byte	168
	byte	170
	byte	184
	byte	32
	byte	run,0x80+12
	byte	170
	byte	149
	byte	37
	byte	9
	byte	10
	byte	2
	byte	170
	byte	149
	byte	149
	byte	170
	byte	149
	byte	170
	byte	run,4,38
	byte	42
	byte	run,0x80+6
	byte	170
	byte	85
	byte	85
	byte	101
	byte	run,3,170
	byte	85
	byte	85
	byte	170
	byte	137
	byte	138
	byte	run,11,2
	byte	168
	byte	88
	byte	96
	byte	128
	byte	128
	byte	run,0x80+1
	byte	168
	byte	88
	byte	88
	byte	168
	byte	88
	byte	168
	byte	run,10,96
	byte	160




