;---------------------------------------
;
;	animation cel data
;

knight2_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	knight2_start_end - knight2_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	knight2_data_a - knight2_data
	word	knight2_data_b - knight2_data
	word	knight2_data_c - knight2_data

knight2_start_end:
	byte	0,0,1,1,0,0,2,2


knight2_data_a:
	byte	0x05, 0x23, 0x00, 0x0d, 0x00, 0x00
	byte	run,0x80+2
	byte	run,3,2
	byte	run,0x80+1
	byte	run,3,2
	byte	run,11,9
	byte	2
	byte	2
	byte	run,0x80+14
	byte	37
	byte	170
	byte	85
	byte	149
	byte	150
	byte	run,4,86
	byte	89
	byte	89
	byte	101
	byte	105
	byte	110
	byte	105
	byte	101
	byte	90
	byte	run,4,85
	byte	149
	byte	42
	byte	run,3,9
	byte	42
	byte	2
	byte	9
	byte	9
	byte	run,4,2
	byte	40
	byte	152
	byte	90
	byte	106
	byte	149
	byte	90
	byte	85
	byte	90
	byte	85
	byte	90
	byte	run,4,85
	byte	90
	byte	90
	byte	149
	byte	170
	byte	run,4,85
	byte	86
	byte	168
	byte	run,3,128
	byte	160
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,0x80+7
	byte	168
	byte	86
	byte	106
	byte	85
	byte	106
	byte	85
	byte	106
	byte	run,4,85
	byte	165
	byte	166
	byte	86
	byte	168
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+19
	byte	128
	byte	128
	byte	96
	byte	160
	byte	88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+20




knight2_data_b:
	byte	0x04, 0x24, 0xfe, 0x0d, 0x00, 0x00
	byte	run,0x80+10
	byte	run,8,2
	byte	run,0x80+18
	byte	2
	byte	10
	byte	37
	byte	38
	byte	42
	byte	37
	byte	169
	byte	149
	byte	169
	byte	149
	byte	105
	byte	run,4,85
	byte	106
	byte	106
	byte	85
	byte	170
	byte	149
	byte	run,3,37
	byte	9
	byte	2
	byte	run,0x80+3
	byte	2
	byte	run,0x80+7
	byte	170
	byte	86
	byte	85
	byte	170
	byte	170
	byte	85
	byte	169
	byte	85
	byte	169
	byte	85
	byte	169
	byte	run,4,85
	byte	154
	byte	154
	byte	85
	byte	170
	byte	run,5,85
	byte	170
	byte	run,3,152
	byte	170
	byte	32
	byte	152
	byte	152
	byte	run,4,32
	byte	run,0x80+1
	byte	128
	byte	96
	byte	96
	byte	160
	byte	96
	byte	168
	byte	88
	byte	168
	byte	88
	byte	166
	byte	run,4,86
	byte	166
	byte	166
	byte	86
	byte	168
	byte	88
	byte	run,3,96
	byte	128
	byte	run,0x80+12




knight2_data_c:
	byte	0x03, 0x0b, 0xff, 0xfa, 0x00, 0x00
	byte	run,11,21
	byte	run,11,85
	byte	64
	byte	run,10,80




