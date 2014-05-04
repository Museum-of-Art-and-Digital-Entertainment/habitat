;---------------------------------------
;
;	animation cel data
;

rabbit0_data::
	byte	swing	+ 2
	byte	0b10000000
	byte	rabbit0_start_end - rabbit0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	rabbit0_data_a - rabbit0_data
	word	rabbit0_data_b - rabbit0_data
	word	rabbit0_data_c - rabbit0_data

rabbit0_start_end:
	byte	0,0,1,1,0,0,2,2


rabbit0_data_a:
	byte	0x04, 0x23, 0x00, 0x0d, 0x00, 0x00
	byte	run,0x80+8
	byte	10
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+23
	byte	37
	byte	42
	byte	run,3,37
	byte	42
	byte	37
	byte	149
	byte	run,4,85
	byte	165
	byte	154
	byte	run,7,149
	byte	153
	byte	41
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+7
	byte	40
	byte	152
	byte	88
	byte	88
	byte	104
	byte	106
	byte	86
	byte	86
	byte	89
	byte	run,4,85
	byte	86
	byte	170
	byte	101
	byte	89
	byte	89
	byte	86
	byte	85
	byte	85
	byte	86
	byte	230
	byte	234
	byte	120
	byte	120
	byte	94
	byte	94
	byte	158
	byte	23
	byte	37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+5
	byte	128
	byte	64
	byte	64
	byte	128
	byte	96
	byte	88
	byte	168
	byte	188
	byte	88
	byte	128
	byte	160
	byte	run,3,128
	byte	64
	byte	128
	byte	128
	byte	run,0x80+8
	byte	128
	byte	224
	byte	run,3,96
	byte	160




rabbit0_data_b:
	byte	0x05, 0x23, 0xfe, 0x0c, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	run,4,9
	byte	2
	byte	run,0x80+11
	byte	run,5,2
	byte	11
	byte	11
	byte	9
	byte	9
	byte	2
	byte	1
	byte	run,4,2
	byte	9
	byte	9
	byte	37
	byte	166
	byte	101
	byte	run,3,85
	byte	86
	byte	170
	byte	37
	byte	37
	byte	41
	byte	38
	byte	37
	byte	37
	byte	41
	byte	42
	byte	190
	byte	189
	byte	245
	byte	246
	byte	214
	byte	214
	byte	216
	byte	216
	byte	88
	byte	96
	byte	128
	byte	run,0x80+1
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	169
	byte	153
	byte	169
	byte	102
	byte	101
	byte	101
	byte	185
	byte	169
	byte	86
	byte	154
	byte	run,3,153
	byte	86
	byte	run,4,85
	byte	170
	byte	137
	byte	137
	byte	run,3,2
	byte	run,0x80+11
	byte	128
	byte	128
	byte	96
	byte	106
	byte	101
	byte	run,3,85
	byte	86
	byte	168
	byte	96
	byte	96
	byte	160
	byte	run,4,96
	byte	168
	byte	248
	byte	248
	byte	126
	byte	126
	byte	94
	byte	94
	byte	158
	byte	159
	byte	151
	byte	37
	byte	9
	byte	2
	byte	run,0x80+9
	byte	run,4,128
	byte	run,0x80+17
	byte	run,4,128
	byte	run,0x80+1




rabbit0_data_c:
	byte	0x04, 0x09, 0xfe, 0x09, 0x00, 0x00
	byte	run,0x80+7
	byte	1
	byte	1
	byte	20
	byte	20
	byte	80
	byte	80
	byte	run,4,64
	byte	run,0x80+10
	byte	80
	byte	80
	byte	20
	byte	20
	byte	run,3,4
	byte	5
	byte	1




