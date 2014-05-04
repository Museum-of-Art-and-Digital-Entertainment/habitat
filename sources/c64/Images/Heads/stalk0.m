;---------------------------------------
;
;	animation cel data
;

stalk0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	stalk0_start_end - stalk0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	stalk0_data_a - stalk0_data
	word	stalk0_data_b - stalk0_data
	word	stalk0_data_c - stalk0_data

stalk0_start_end:
	byte	0,0,1,1,0,0,2,2


stalk0_data_a:
	byte	0x04, 0x1c, 0x01, 0x06, 0x00, 0x00
	byte	run,0x80+1
	byte	47
	byte	42
	byte	run,3,37
	byte	run,8,9
	byte	run,5,2
	byte	run,0x80+9
	byte	40
	byte	152
	byte	88
	byte	88
	byte	104
	byte	150
	byte	run,3,86
	byte	106
	byte	149
	byte	run,3,85
	byte	90
	byte	101
	byte	run,3,85
	byte	149
	byte	150
	byte	150
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+12
	byte	run,5,128
	byte	96
	byte	96
	byte	106
	byte	101
	byte	149
	byte	run,5,86
	byte	85
	byte	169
	byte	2
	byte	run,0x80+17
	byte	128
	byte	160
	byte	184
	byte	248
	byte	run,3,232
	byte	248
	byte	184
	byte	160
	byte	128




stalk0_data_b:
	byte	0x06, 0x1d, 0xfd, 0x06, 0x00, 0x00
	byte	run,0x80+23
	byte	run,4,2
	byte	run,0x80+13
	byte	run,4,2
	byte	9
	byte	10
	byte	9
	byte	37
	byte	154
	byte	175
	byte	191
	byte	run,3,186
	byte	191
	byte	111
	byte	154
	byte	42
	byte	3
	byte	run,4,2
	byte	9
	byte	9
	byte	37
	byte	42
	byte	149
	byte	149
	byte	85
	byte	169
	byte	86
	byte	85
	byte	85
	byte	149
	byte	102
	byte	86
	byte	88
	byte	168
	byte	224
	byte	224
	byte	run,3,232
	byte	152
	byte	104
	byte	128
	byte	255
	byte	254
	byte	170
	byte	170
	byte	86
	byte	run,3,85
	byte	86
	byte	153
	byte	run,3,85
	byte	86
	byte	101
	byte	137
	byte	137
	byte	2
	byte	2
	byte	run,0x80+15
	byte	128
	byte	128
	byte	96
	byte	160
	byte	88
	byte	88
	byte	86
	byte	170
	byte	86
	byte	86
	byte	85
	byte	90
	byte	101
	byte	85
	byte	150
	byte	171
	byte	47
	byte	46
	byte	174
	byte	174
	byte	175
	byte	155
	byte	166
	byte	10
	byte	run,0x80+15
	byte	run,3,128
	byte	96
	byte	152
	byte	232
	byte	248
	byte	184
	byte	186
	byte	186
	byte	250
	byte	230
	byte	152
	byte	160




stalk0_data_c:
	byte	0x05, 0x07, 0xfe, 0x04, 0x00, 0x00
	byte	5
	byte	run,5,21
	byte	5
	byte	run,0x80+1
	byte	run,5,64
	byte	run,0x80+8
	byte	1
	byte	run,5,5
	byte	1
	byte	64
	byte	run,5,80
	byte	64




