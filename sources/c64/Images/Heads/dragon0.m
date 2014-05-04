;---------------------------------------
;
;	animation cel data
;

dragon0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	dragon0_start_end - dragon0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	dragon0_data_a - dragon0_data
	word	dragon0_data_b - dragon0_data
	word	dragon0_data_c - dragon0_data

dragon0_start_end:
	byte	0,0,1,1,0,0,2,2


dragon0_data_a:
	byte	0x06, 0x1d, 0x00, 0x08, 0x00, 0x00
	byte	10
	byte	2
	byte	run,0x80+2
	byte	10
	byte	2
	byte	run,0x80+2
	byte	2
	byte	run,0x80+16
	byte	2
	byte	10
	byte	40
	byte	32
	byte	run,0x80+1
	byte	run,9,149
	byte	37
	byte	37
	byte	165
	byte	37
	byte	9
	byte	9
	byte	41
	byte	9
	byte	2
	byte	10
	byte	run,0x80+1
	byte	2
	byte	10
	byte	42
	byte	170
	byte	160
	byte	run,0x80+3
	byte	160
	byte	run,3,152
	byte	104
	byte	run,3,152
	byte	104
	byte	104
	byte	106
	byte	90
	byte	90
	byte	run,7,85
	byte	149
	byte	169
	byte	170
	byte	162
	byte	2
	byte	run,0x80+13
	byte	2
	byte	41
	byte	165
	byte	86
	byte	91
	byte	106
	byte	165
	byte	85
	byte	85
	byte	90
	byte	110
	byte	169
	byte	86
	byte	168
	byte	128
	byte	run,0x80+13
	byte	40
	byte	154
	byte	108
	byte	176
	byte	202
	byte	169
	byte	149
	byte	89
	byte	86
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+19
	byte	128
	byte	160
	byte	96
	byte	96
	byte	128
	byte	run,0x80+13




dragon0_data_b:
	byte	0x05, 0x22, 0xfe, 0x08, 0x00, 0x00
	byte	run,0x80+26
	byte	2
	byte	2
	byte	run,3,10
	byte	run,3,8
	byte	run,0x80+2
	byte	2
	byte	run,3,9
	byte	10
	byte	run,3,9
	byte	10
	byte	run,4,9
	byte	10
	byte	10
	byte	11
	byte	10
	byte	41
	byte	37
	byte	165
	byte	149
	byte	154
	byte	174
	byte	169
	byte	149
	byte	165
	byte	170
	byte	128
	byte	run,0x80+4
	byte	16
	byte	84
	byte	170
	byte	85
	byte	85
	byte	169
	byte	86
	byte	85
	byte	85
	byte	169
	byte	86
	byte	85
	byte	85
	byte	101
	byte	185
	byte	254
	byte	238
	byte	171
	byte	154
	byte	85
	byte	153
	byte	85
	byte	85
	byte	86
	byte	86
	byte	run,3,85
	byte	170
	byte	32
	byte	32
	byte	run,0x80+6
	byte	run,16,128
	byte	160
	byte	96
	byte	104
	byte	88
	byte	152
	byte	232
	byte	168
	byte	90
	byte	106
	byte	170
	byte	10
	byte	2
	byte	run,0x80+31
	byte	run,6,128




dragon0_data_c:
	byte	0x03, 0x0d, 0xff, 0x01, 0x00, 0x00
	byte	run,0x80+2
	byte	1
	byte	1
	byte	run,0x80+2
	byte	run,4,5
	byte	21
	byte	21
	byte	run,0x80+1
	byte	16
	byte	84
	byte	85
	byte	5
	byte	run,0x80+1
	byte	run,4,85
	byte	101
	byte	169
	byte	169
	byte	168
	byte	run,0x80+9
	byte	64
	byte	80
	byte	80
	byte	run,0x80+1




