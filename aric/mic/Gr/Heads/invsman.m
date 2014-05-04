;---------------------------------------
;
;	animation cel data
;

invsman_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	invsman_start_end - invsman_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	invsman_data_a - invsman_data
	word	invsman_data_b - invsman_data
	word	invsman_data_c - invsman_data

invsman_start_end:
	byte	0,0,1,1,0,0,2,2


invsman_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+5
	byte	37
	byte	42
	byte	37
	byte	37
	byte	169
	byte	150
	byte	149
	byte	101
	byte	89
	byte	86
	byte	85
	byte	149
	byte	101
	byte	90
	byte	170
	byte	170
	byte	85
	byte	149
	byte	101
	byte	154
	byte	149
	byte	37
	byte	10
	byte	40
	byte	152
	byte	152
	byte	106
	byte	run,3,85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	86
	byte	91
	byte	110
	byte	174
	byte	174
	byte	91
	byte	86
	byte	85
	byte	170
	byte	85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,3,96
	byte	160
	byte	96
	byte	96
	byte	168
	byte	88
	byte	152
	byte	232
	byte	run,3,184
	byte	224
	byte	160
	byte	96
	byte	96
	byte	128
	byte	run,0x80+2




invsman_data_b:
	byte	0x03, 0x19, 0xff, 0x02, 0x00, 0x00
	byte	1
	byte	run,4,2
	byte	9
	byte	9
	byte	38
	byte	37
	byte	169
	byte	150
	byte	149
	byte	154
	byte	175
	byte	run,3,186
	byte	175
	byte	154
	byte	149
	byte	169
	byte	38
	byte	37
	byte	9
	byte	2
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	171
	byte	run,3,238
	byte	171
	byte	86
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	96
	byte	96
	byte	168
	byte	88
	byte	88
	byte	152
	byte	232
	byte	run,3,184
	byte	232
	byte	152
	byte	88
	byte	168
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




invsman_data_c:
	byte	0x03, 0x06, 0xff, 0xfc, 0x00, 0x00
	byte	5
	byte	21
	byte	21
	byte	26
	byte	5
	byte	21
	byte	run,3,85
	byte	170
	byte	85
	byte	85
	byte	64
	byte	80
	byte	80
	byte	144
	byte	64
	byte	80




