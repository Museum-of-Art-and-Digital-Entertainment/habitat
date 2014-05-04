;---------------------------------------
;
;	animation cel data
;

cups0_data::
	byte	swing	+ 4
	byte	0b00000000
	byte	cups0_start_end - cups0_data
	byte	no_cont

	byte	236+right,24+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000
	byte	0b00010000
	byte	0b00001000

	word	cups0_data_a - cups0_data
	word	cups0_data_b - cups0_data
	word	cups0_data_c - cups0_data
	word	cups0_data_d - cups0_data
	word	cups0_data_e - cups0_data

cups0_start_end:
	byte	0,0,1,1,2,2,3,3,4,4


cups0_data_a:
	byte	0x03, 0x0e, 0x00, 0x00, 0x00, 0x00

	byte	170
	byte	37
	byte	9
	byte	10
	byte	run,3,2
	byte	9
	byte	run,3,37
	byte	42
	byte	149
	byte	170
	byte	170
	byte	86
	byte	88
	byte	104
	byte	run,3,96
	byte	88
	byte	run,3,86
	byte	170
	byte	85
	byte	170
	byte	128
	byte	run,0x80+11
	byte	128
	byte	128




cups0_data_b:
	byte	0x02, 0x0b, 0x01, 0xfd, 0x00, 0x00

	byte	2
	byte	2
	byte	42
	byte	run,6,130
	byte	42
	byte	2
	byte	170
	byte	run,9,86
	byte	170




cups0_data_c:
	byte	0x02, 0x0a, 0x00, 0xfc, 0x00, 0x00

	byte	2
	byte	run,0x80+5
	byte	run,4,2
	byte	170
	byte	run,4,32
	byte	152
	byte	run,3,86
	byte	170




cups0_data_d:
	byte	0x02, 0x0c, 0x00, 0xfe, 0x00, 0x00

	byte	10
	byte	run,0x80+4
	byte	2
	byte	9
	byte	33
	byte	42
	byte	run,3,3
	byte	168
	byte	run,4,128
	byte	32
	byte	72
	byte	66
	byte	170
	byte	run,0x80+3




cups0_data_e:
	byte	0x02, 0x18, 0x00, 0x0a, 0x00, 0x00

	byte	10
	byte	run,0x80+6
	byte	2
	byte	9
	byte	9
	byte	run,3,37
	byte	run,3,39
	byte	35
	byte	10
	byte	run,3,3
	byte	42
	byte	10
	byte	2
	byte	168
	byte	run,6,128
	byte	96
	byte	88
	byte	88
	byte	run,6,86
	byte	2
	byte	168
	byte	run,0x80+3
	byte	160
	byte	128
	byte	run,0x80+1




