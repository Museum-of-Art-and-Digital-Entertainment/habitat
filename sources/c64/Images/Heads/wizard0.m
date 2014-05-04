;---------------------------------------
;
;	animation cel data
;

wizard0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	wizard0_start_end - wizard0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10010000
	byte	0b01010000
	byte	0b01110000

	word	wizard0_data_a - wizard0_data
	word	wizard0_data_b - wizard0_data
	word	wizard0_data_c - wizard0_data
	word	wizard0_data_d - wizard0_data

wizard0_start_end:
	byte	0,0,1,1,0,0,2,2


wizard0_data_a:
	byte	0x05, 0x1a, 0x00, 0x04, 0x01, 0x00
	byte	run,0x80+1
	byte	10
	byte	37
	byte	37
	byte	run,7,9
	byte	2
	byte	2
	byte	130
	byte	162
	byte	42
	byte	42
	byte	10
	byte	9
	byte	10
	byte	9
	byte	run,5,10
	byte	run,0x80+1
	byte	175
	byte	106
	byte	111
	byte	run,5,85
	byte	86
	byte	89
	byte	89
	byte	run,3,85
	byte	149
	byte	170
	byte	170
	byte	154
	byte	106
	byte	90
	byte	106
	byte	170
	byte	170
	byte	153
	byte	166
	byte	40
	byte	184
	byte	250
	byte	249
	byte	229
	byte	101
	byte	149
	byte	149
	byte	154
	byte	run,4,91
	byte	111
	byte	111
	byte	110
	byte	111
	byte	171
	byte	170
	byte	153
	byte	166
	byte	149
	byte	166
	byte	170
	byte	168
	byte	168
	byte	run,0x80+1
	byte	40
	byte	150
	byte	86
	byte	86
	byte	run,4,88
	byte	160
	byte	232
	byte	254
	byte	254
	byte	248
	byte	184
	byte	160
	byte	80
	byte	224
	byte	run,3,170
	byte	168
	byte	128
	byte	run,0x80+21
	byte	168
	byte	160
	byte	run,0x80+6




wizard0_data_b:
	byte	0x06, 0x1a, 0xfd, 0x03, 0x00, 0x00
	byte	run,0x80+16
	byte	2
	byte	10
	byte	2
	byte	run,0x80+11
	byte	2
	byte	run,8,9
	byte	41
	byte	169
	byte	169
	byte	run,3,170
	byte	10
	byte	run,3,2
	byte	run,0x80+3
	byte	3
	byte	2
	byte	9
	byte	165
	byte	run,5,85
	byte	165
	byte	186
	byte	run,3,191
	byte	111
	byte	110
	byte	101
	byte	111
	byte	170
	byte	170
	byte	153
	byte	166
	byte	149
	byte	170
	byte	170
	byte	42
	byte	255
	byte	170
	byte	run,5,85
	byte	153
	byte	101
	byte	85
	byte	154
	byte	239
	byte	255
	byte	255
	byte	187
	byte	186
	byte	117
	byte	255
	byte	170
	byte	170
	byte	169
	byte	170
	byte	169
	byte	run,3,170
	byte	run,0x80+2
	byte	128
	byte	104
	byte	86
	byte	run,4,85
	byte	105
	byte	185
	byte	run,3,249
	byte	229
	byte	229
	byte	86
	byte	150
	byte	170
	byte	170
	byte	154
	byte	104
	byte	152
	byte	168
	byte	168
	byte	160
	byte	run,0x80+5
	byte	run,8,128
	byte	160
	byte	168
	byte	run,4,170
	byte	run,0x80+7




wizard0_data_c:
	byte	0x04, 0x0b, 0xfe, 0xfb, 0x00, 0x00
	byte	run,5,1
	byte	run,6,2
	byte	run,5,85
	byte	run,6,170
	byte	run,5,85
	byte	run,6,170
	byte	run,5,85
	byte	run,6,170




wizard0_data_d:
	byte	0x03, 0x11, 0xff, 0x13, 0x00, 0x00
	byte	10
	byte	10
	byte	9
	byte	10
	byte	9
	byte	10
	byte	2
	byte	2
	byte	run,0x80+9
	byte	170
	byte	170
	byte	154
	byte	106
	byte	90
	byte	106
	byte	170
	byte	166
	byte	168
	byte	148
	byte	42
	byte	42
	byte	10
	byte	10
	byte	2
	byte	run,0x80+2
	byte	160
	byte	96
	byte	run,4,128
	byte	run,0x80+8
	byte	run,3,128




