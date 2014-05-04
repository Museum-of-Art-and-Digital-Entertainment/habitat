;---------------------------------------
;
;	animation cel data
;

army0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	army0_start_end - army0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	army0_data_a - army0_data
	word	army0_data_b - army0_data
	word	army0_data_c - army0_data

army0_start_end:
	byte	0,0,1,1,0,0,2,2


army0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,6,2
	byte	run,6,9
	byte	2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,5,170
	byte	169
	byte	169
	byte	153
	byte	153
	byte	150
	byte	run,3,149
	byte	101
	byte	153
	byte	150
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	175
	byte	111
	byte	run,4,91
	byte	106
	byte	171
	byte	91
	byte	91
	byte	86
	byte	89
	byte	165
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	248
	byte	248
	byte	254
	byte	174
	byte	174
	byte	168
	byte	run,5,160
	byte	run,4,128
	byte	run,0x80+2




army0_data_b:
	byte	0x04, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+10
	byte	run,8,2
	byte	run,0x80+6
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	170
	byte	run,6,85
	byte	170
	byte	175
	byte	170
	byte	37
	byte	38
	byte	9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,3,255
	byte	239
	byte	255
	byte	186
	byte	185
	byte	185
	byte	169
	byte	run,3,185
	byte	186
	byte	255
	byte	170
	byte	169
	byte	102
	byte	101
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	170
	byte	run,6,86
	byte	170
	byte	232
	byte	168
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




army0_data_c:
	byte	0x03, 0x13, 0xff, 0x00, 0x00, 0x00
	byte	2
	byte	10
	byte	10
	byte	42
	byte	42
	byte	run,4,170
	byte	run,5,89
	byte	165
	byte	149
	byte	37
	byte	37
	byte	9
	byte	run,9,170
	byte	run,10,101
	byte	run,0x80+1
	byte	128
	byte	128
	byte	160
	byte	160
	byte	168
	byte	run,3,170
	byte	run,4,150
	byte	154
	byte	104
	byte	88
	byte	96
	byte	96
	byte	128




