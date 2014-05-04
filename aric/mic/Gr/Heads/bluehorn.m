;---------------------------------------
;
;	animation cel data
;

bluehorn_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bluehorn_start_end - bluehorn_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bluehorn_data_a - bluehorn_data
	word	bluehorn_data_b - bluehorn_data
	word	bluehorn_data_c - bluehorn_data

bluehorn_start_end:
	byte	0,0,1,1,0,0,2,2


bluehorn_data_a:
	byte	0x07, 0x1f, 0x00, 0x09, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+12
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	85
	byte	85
	byte	run,8,86
	byte	run,3,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	run,0x80+7
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	run,3,149
	byte	run,8,85
	byte	149
	byte	149
	byte	101
	byte	89
	byte	run,3,85
	byte	149
	byte	42
	byte	run,0x80+8
	byte	170
	byte	run,4,85
	byte	86
	byte	106
	byte	89
	byte	86
	byte	run,5,85
	byte	90
	byte	106
	byte	107
	byte	106
	byte	run,3,85
	byte	86
	byte	168
	byte	run,0x80+8
	byte	170
	byte	run,3,85
	byte	170
	byte	204
	byte	170
	byte	run,8,85
	byte	165
	byte	149
	byte	85
	byte	85
	byte	86
	byte	104
	byte	128
	byte	run,0x80+10
	byte	128
	byte	96
	byte	96
	byte	128
	byte	206
	byte	169
	byte	85
	byte	85
	byte	run,3,105
	byte	165
	byte	86
	byte	85
	byte	85
	byte	86
	byte	91
	byte	155
	byte	47
	byte	run,3,11
	byte	run,3,2
	byte	11
	byte	10
	byte	run,0x80+8
	byte	run,8,128
	byte	run,0x80+1
	byte	128
	byte	128
	byte	224
	byte	224
	byte	run,6,248
	byte	224
	byte	224
	byte	128
	byte	run,0x80+1




bluehorn_data_b:
	byte	0x05, 0x20, 0xfe, 0x09, 0x00, 0x00
	byte	run,0x80+10
	byte	run,3,2
	byte	run,4,9
	byte	37
	byte	42
	byte	46
	byte	42
	byte	37
	byte	37
	byte	10
	byte	9
	byte	9
	byte	2
	byte	run,0x80+5
	byte	1
	byte	run,4,2
	byte	9
	byte	37
	byte	38
	byte	155
	byte	174
	byte	105
	byte	149
	byte	run,4,85
	byte	86
	byte	85
	byte	85
	byte	149
	byte	85
	byte	86
	byte	102
	byte	150
	byte	86
	byte	86
	byte	85
	byte	170
	byte	run,0x80+4
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	85
	byte	85
	byte	170
	byte	255
	byte	170
	byte	run,3,85
	byte	run,3,153
	byte	86
	byte	85
	byte	85
	byte	101
	byte	185
	byte	run,5,254
	byte	185
	byte	186
	byte	184
	byte	184
	byte	32
	byte	32
	byte	run,0x80+5
	byte	128
	byte	96
	byte	96
	byte	152
	byte	232
	byte	166
	byte	90
	byte	86
	byte	run,5,85
	byte	86
	byte	90
	byte	86
	byte	85
	byte	101
	byte	90
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+17
	byte	run,4,128
	byte	96
	byte	160
	byte	224
	byte	160
	byte	96
	byte	96
	byte	run,3,128
	byte	run,0x80+6




bluehorn_data_c:
	byte	0x05, 0x14, 0xfe, 0x04, 0x00, 0x00
	byte	run,0x80+10
	byte	run,5,5
	byte	1
	byte	1
	byte	run,0x80+3
	byte	5
	byte	5
	byte	21
	byte	run,37,85
	byte	64
	byte	80
	byte	80
	byte	run,8,84
	byte	run,6,85
	byte	run,3,84
	byte	run,0x80+11
	byte	run,5,64
	byte	run,0x80+4




