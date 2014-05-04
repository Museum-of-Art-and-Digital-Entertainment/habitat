;---------------------------------------
;
;	animation cel data
;

tiger_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	tiger_start_end - tiger_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	tiger_data_a - tiger_data
	word	tiger_data_b - tiger_data
	word	tiger_data_c - tiger_data

tiger_start_end:
	byte	0,0,1,1,0,0,2,2


tiger_data_a:
	byte	0x06, 0x1a, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+2
	byte	run,9,2
	byte	run,0x80+15
	byte	1
	byte	86
	byte	25
	byte	101
	byte	102
	byte	153
	byte	153
	byte	101
	byte	166
	byte	150
	byte	154
	byte	run,3,153
	byte	166
	byte	38
	byte	38
	byte	41
	byte	9
	byte	10
	byte	2
	byte	2
	byte	run,0x80+4
	byte	152
	byte	86
	byte	102
	byte	149
	byte	85
	byte	89
	byte	101
	byte	149
	byte	150
	byte	89
	byte	101
	byte	101
	byte	run,3,150
	byte	run,3,149
	byte	101
	byte	101
	byte	run,3,165
	byte	169
	byte	42
	byte	10
	byte	run,0x80+3
	byte	128
	byte	128
	byte	106
	byte	85
	byte	101
	byte	101
	byte	149
	byte	153
	byte	105
	byte	86
	byte	85
	byte	85
	byte	105
	byte	169
	byte	85
	byte	102
	byte	88
	byte	160
	byte	run,5,128
	byte	run,0x80+4
	byte	160
	byte	88
	byte	86
	byte	170
	byte	85
	byte	89
	byte	149
	byte	89
	byte	165
	byte	150
	byte	88
	byte	96
	byte	128
	byte	128
	byte	run,0x80+16
	byte	128
	byte	128
	byte	160
	byte	96
	byte	128
	byte	run,0x80+13




tiger_data_b:
	byte	0x05, 0x19, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+10
	byte	run,9,2
	byte	run,3,9
	byte	37
	byte	42
	byte	40
	byte	41
	byte	37
	byte	38
	byte	41
	byte	38
	byte	41
	byte	41
	byte	37
	byte	169
	byte	149
	byte	105
	byte	150
	byte	106
	byte	101
	byte	149
	byte	90
	byte	105
	byte	85
	byte	89
	byte	150
	byte	90
	byte	106
	byte	168
	byte	128
	byte	run,0x80+1
	byte	101
	byte	153
	byte	86
	byte	169
	byte	86
	byte	85
	byte	169
	byte	101
	byte	101
	byte	169
	byte	85
	byte	86
	byte	86
	byte	153
	byte	101
	byte	86
	byte	85
	byte	153
	byte	101
	byte	102
	byte	102
	byte	170
	byte	run,0x80+3
	byte	160
	byte	96
	byte	96
	byte	160
	byte	96
	byte	160
	byte	160
	byte	96
	byte	168
	byte	88
	byte	166
	byte	90
	byte	166
	byte	102
	byte	90
	byte	150
	byte	166
	byte	86
	byte	150
	byte	89
	byte	149
	byte	165
	byte	169
	byte	10
	byte	run,0x80+20
	byte	run,3,128
	byte	96
	byte	160
	byte	160




tiger_data_c:
	byte	0x03, 0x12, 0xff, 0xfc, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	9
	byte	4
	byte	2
	byte	8
	byte	4
	byte	2
	byte	run,0x80+2
	byte	2
	byte	1
	byte	run,0x80+3
	byte	10
	byte	164
	byte	run,0x80+1
	byte	16
	byte	170
	byte	1
	byte	84
	byte	170
	byte	run,0x80+1
	byte	84
	byte	170
	byte	16
	byte	84
	byte	170
	byte	1
	byte	170
	byte	68
	byte	16
	byte	170
	byte	run,0x80+1
	byte	68
	byte	run,0x80+2
	byte	128
	byte	64
	byte	run,0x80+1
	byte	128
	byte	64
	byte	run,0x80+5
	byte	16
	byte	run,0x80+2
	byte	128
	byte	168
	byte	run,0x80+1




