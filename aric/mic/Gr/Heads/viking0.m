;---------------------------------------
;
;	animation cel data
;

viking0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	viking0_start_end - viking0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	viking0_data_a - viking0_data
	word	viking0_data_b - viking0_data
	word	viking0_data_c - viking0_data

viking0_start_end:
	byte	0,0,1,1,0,0,2,2


viking0_data_a:
	byte	0x05, 0x1e, 0x00, 0x08, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	10
	byte	42
	byte	10
	byte	run,4,42
	byte	149
	byte	149
	byte	170
	byte	149
	byte	37
	byte	38
	byte	10
	byte	47
	byte	47
	byte	191
	byte	190
	byte	187
	byte	175
	byte	238
	byte	8
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	171
	byte	171
	byte	175
	byte	175
	byte	170
	byte	86
	byte	85
	byte	85
	byte	170
	byte	191
	byte	run,3,255
	byte	250
	byte	229
	byte	186
	byte	248
	byte	224
	byte	128
	byte	run,0x80+1
	byte	40
	byte	184
	byte	248
	byte	250
	byte	run,6,170
	byte	run,5,175
	byte	171
	byte	86
	byte	85
	byte	165
	byte	154
	byte	run,3,229
	byte	149
	byte	86
	byte	104
	byte	128
	byte	run,0x80+6
	byte	run,5,170
	byte	168
	byte	160
	byte	168
	byte	run,3,248
	byte	184
	byte	160
	byte	170
	byte	85
	byte	85
	byte	150
	byte	102
	byte	88
	byte	88
	byte	96
	byte	128
	byte	run,0x80+9
	byte	run,3,128
	byte	run,0x80+10
	byte	128
	byte	128
	byte	run,0x80+11




viking0_data_b:
	byte	0x08, 0x20, 0xfc, 0x09, 0x00, 0x00
	byte	run,0x80+26
	byte	run,5,2
	byte	run,0x80+21
	byte	2
	byte	11
	byte	47
	byte	47
	byte	191
	byte	191
	byte	254
	byte	248
	byte	248
	byte	224
	byte	224
	byte	128
	byte	run,0x80+12
	byte	2
	byte	10
	byte	10
	byte	38
	byte	37
	byte	37
	byte	9
	byte	42
	byte	185
	byte	254
	byte	254
	byte	255
	byte	250
	byte	160
	byte	run,0x80+6
	byte	3
	byte	run,3,2
	byte	10
	byte	42
	byte	42
	byte	run,4,170
	byte	run,4,175
	byte	174
	byte	174
	byte	106
	byte	85
	byte	149
	byte	105
	byte	86
	byte	85
	byte	149
	byte	165
	byte	9
	byte	2
	byte	run,0x80+5
	byte	255
	byte	254
	byte	run,9,170
	byte	171
	byte	187
	byte	255
	byte	255
	byte	254
	byte	238
	byte	170
	byte	run,3,85
	byte	170
	byte	run,4,85
	byte	154
	byte	32
	byte	run,0x80+8
	byte	128
	byte	160
	byte	160
	byte	run,4,168
	byte	232
	byte	run,4,234
	byte	233
	byte	165
	byte	85
	byte	90
	byte	165
	byte	86
	byte	86
	byte	91
	byte	106
	byte	128
	byte	run,0x80+19
	byte	128
	byte	128
	byte	run,3,96
	byte	128
	byte	160
	byte	186
	byte	run,3,255
	byte	191
	byte	43
	byte	2
	byte	run,0x80+26
	byte	128
	byte	32
	byte	224
	byte	248
	byte	248
	byte	254
	byte	190
	byte	190
	byte	46
	byte	46
	byte	8




viking0_data_c:
	byte	0x03, 0x0b, 0xff, 0xff, 0x00, 0x00
	byte	run,4,42
	byte	85
	byte	85
	byte	86
	byte	169
	byte	run,3,85
	byte	run,4,170
	byte	85
	byte	85
	byte	170
	byte	run,4,85
	byte	run,4,128
	byte	run,3,84
	byte	168
	byte	run,3,84




