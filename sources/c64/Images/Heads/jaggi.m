;---------------------------------------
;
;	animation cel data
;

jaggi_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	jaggi_start_end - jaggi_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01110000

	word	jaggi_data_a - jaggi_data
	word	jaggi_data_b - jaggi_data
	word	jaggi_data_c - jaggi_data
	word	jaggi_data_d - jaggi_data

jaggi_start_end:
	byte	0,0,1,1,0,0,2,2


jaggi_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	38
	byte	run,3,37
	byte	38
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+9
	byte	37
	byte	42
	byte	37
	byte	165
	byte	run,6,85
	byte	86
	byte	149
	byte	101
	byte	101
	byte	153
	byte	102
	byte	90
	byte	170
	byte	2
	byte	2
	byte	9
	byte	run,4,37
	byte	10
	byte	40
	byte	152
	byte	88
	byte	90
	byte	90
	byte	run,3,89
	byte	105
	byte	169
	byte	149
	byte	85
	byte	85
	byte	105
	byte	105
	byte	149
	byte	85
	byte	85
	byte	86
	byte	88
	byte	104
	byte	184
	byte	168
	byte	168
	byte	104
	byte	96
	byte	128
	byte	run,0x80+3
	byte	128
	byte	96
	byte	88
	byte	86
	byte	106
	byte	110
	byte	120
	byte	120
	byte	104
	byte	88
	byte	152
	byte	152
	byte	96
	byte	96
	byte	128
	byte	run,0x80+9




jaggi_data_b:
	byte	0x05, 0x1d, 0xfe, 0x06, 0x00, 0x00
	byte	run,0x80+10
	byte	run,7,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	42
	byte	42
	byte	191
	byte	186
	byte	186
	byte	169
	byte	165
	byte	42
	byte	1
	byte	run,4,2
	byte	9
	byte	9
	byte	39
	byte	166
	byte	166
	byte	102
	byte	85
	byte	85
	byte	105
	byte	169
	byte	165
	byte	149
	byte	85
	byte	86
	byte	90
	byte	160
	byte	128
	byte	128
	byte	224
	byte	160
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	85
	byte	169
	byte	187
	byte	170
	byte	238
	byte	238
	byte	169
	byte	85
	byte	153
	byte	153
	byte	101
	byte	101
	byte	153
	byte	102
	byte	138
	byte	run,0x80+14
	byte	128
	byte	128
	byte	96
	byte	104
	byte	104
	byte	102
	byte	86
	byte	86
	byte	166
	byte	170
	byte	106
	byte	90
	byte	85
	byte	85
	byte	149
	byte	41
	byte	10
	byte	10
	byte	47
	byte	42
	byte	38
	byte	37
	byte	9
	byte	2
	byte	run,0x80+17
	byte	128
	byte	128
	byte	96
	byte	96
	byte	160
	byte	160
	byte	248
	byte	184
	byte	184
	byte	168
	byte	88
	byte	160




jaggi_data_c:
	byte	0x03, 0x0c, 0xff, 0xfb, 0x00, 0x00
	byte	run,0x80+1
	byte	1
	byte	run,5,21
	byte	run,5,85
	byte	84
	byte	run,11,85
	byte	run,0x80+1
	byte	64
	byte	80
	byte	80
	byte	run,8,84




jaggi_data_d:
	byte	0x05, 0x04, 0xfe, 0x04, 0x00, 0x00
	byte	run,4,21
	byte	run,4,64
	byte	run,0x80+4
	byte	run,4,5
	byte	run,4,80




