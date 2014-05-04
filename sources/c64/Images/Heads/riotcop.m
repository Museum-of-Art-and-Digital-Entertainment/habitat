;---------------------------------------
;
;	animation cel data
;

riotcop_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	riotcop_start_end - riotcop_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	riotcop_data_a - riotcop_data
	word	riotcop_data_b - riotcop_data
	word	riotcop_data_c - riotcop_data

riotcop_start_end:
	byte	0,0,1,1,0,0,2,2


riotcop_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+6
	byte	run,14,2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	170
	byte	run,3,85
	byte	86
	byte	run,5,89
	byte	86
	byte	run,3,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	234
	byte	234
	byte	run,4,187
	byte	171
	byte	107
	byte	run,3,91
	byte	90
	byte	149
	byte	106
	byte	run,5,85
	byte	170
	byte	run,0x80+3
	byte	run,13,168
	byte	88
	byte	168
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




riotcop_data_b:
	byte	0x04, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+10
	byte	run,7,2
	byte	run,0x80+7
	byte	3
	byte	run,3,2
	byte	10
	byte	42
	byte	run,3,46
	byte	174
	byte	174
	byte	run,4,110
	byte	170
	byte	149
	byte	170
	byte	149
	byte	run,3,37
	byte	9
	byte	2
	byte	255
	byte	254
	byte	254
	byte	run,13,170
	byte	85
	byte	170
	byte	85
	byte	101
	byte	101
	byte	85
	byte	85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	run,4,160
	byte	168
	byte	170
	byte	run,4,166
	byte	170
	byte	88
	byte	168
	byte	88
	byte	run,3,96
	byte	128
	byte	run,0x80+1




riotcop_data_c:
	byte	0x03, 0x0f, 0xff, 0xfe, 0x00, 0x00
	byte	run,3,149
	byte	run,9,21
	byte	run,0x80+3
	byte	run,12,85
	byte	run,0x80+1
	byte	16
	byte	16
	byte	run,4,88
	byte	run,8,80
	byte	run,0x80+3




