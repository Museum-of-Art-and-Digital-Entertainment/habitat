;---------------------------------------
;
;	animation cel data
;

table0_data::
	byte	swing	+ 1
	byte	0b11111000
	byte	table0_start_end - table0_data
	byte	table0_contents_xy - table0_data

	byte	244+right,44+left,255

	byte	0b11111000
	byte	0b11110000

	word	table0_data_a - table0_data
	word	table0_data_b - table0_data
	word	table0_data_c - table0_data
	word	table0_data_d - table0_data
	word	table0_data_e - table0_data

table0_start_end:
	byte	0,0,1,1

table0_contents_xy:
	byte	254,230,3,230,0,230,255,230,1,230


table0_data_a:
	byte	0x01, 0x16, 0xfe, 0x15, 0x00, 0x00

	byte	168
	byte	152
	byte	152
	byte	168
	byte	run,16,152
	byte	168
	byte	168




table0_data_b:
	byte	0x01, 0x14, 0xff, 0x15, 0x00, 0x00

	byte	42
	byte	38
	byte	38
	byte	42
	byte	run,15,38
	byte	42




table0_data_c:
	byte	0x01, 0x14, 0x04, 0x15, 0x00, 0x00

	byte	168
	byte	152
	byte	152
	byte	168
	byte	run,15,152
	byte	168




table0_data_d:
	byte	0x01, 0x16, 0x05, 0x15, 0x00, 0x00

	byte	42
	byte	38
	byte	38
	byte	42
	byte	run,16,38
	byte	42
	byte	42




table0_data_e:
	byte	0x0a, 0x06, 0xfd, 0x1b, 0x00, 0x00

	byte	10
	byte	9
	byte	9
	byte	42
	byte	37
	byte	42
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	160
	byte	96
	byte	96
	byte	168
	byte	88
	byte	168




