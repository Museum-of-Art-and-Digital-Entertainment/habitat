;---------------------------------------
;
;	animation cel data
;

bush4_data::
	byte	out	+ 2
	byte	0b11000000
	byte	bush4_start_end - bush4_data
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b11000000
	byte	0b10000000
	byte	0b01000000

	word	bush4_data_a - bush4_data
	word	bush4_data_b - bush4_data

bush4_start_end:
	byte	0,0,1,1,2,2


bush4_data_a:
	byte	0x06, 0x18, 0xfe, 0x15, 0x00, 0x00
	byte	2
	byte	42
	byte	run,0x80+3
	byte	10
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+6
	byte	2
	byte	2
	byte	run,0x80+5
	byte	160
	byte	88
	byte	152
	byte	154
	byte	168
	byte	170
	byte	run,4,85
	byte	86
	byte	168
	byte	run,0x80+1
	byte	2
	byte	2
	byte	42
	byte	149
	byte	85
	byte	85
	byte	149
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	42
	byte	run,0x80+1
	byte	168
	byte	run,3,150
	byte	102
	byte	102
	byte	run,3,150
	byte	152
	byte	88
	byte	168
	byte	168
	byte	86
	byte	run,5,85
	byte	86
	byte	168
	byte	run,0x80+1
	byte	168
	byte	150
	byte	149
	byte	37
	byte	37
	byte	38
	byte	42
	byte	10
	byte	9
	byte	37
	byte	run,3,149
	byte	37
	byte	10
	byte	128
	byte	96
	byte	88
	byte	88
	byte	96
	byte	128
	byte	run,0x80+5
	byte	run,5,128
	byte	168
	byte	86
	byte	run,3,85
	byte	86
	byte	88
	byte	160
	byte	run,0x80+18
	byte	run,3,128
	byte	run,0x80+11




bush4_data_b:
	byte	0x03, 0x10, 0x03, 0x0e, 0x00, 0x00
	byte	42
	byte	2
	byte	run,0x80+9
	byte	2
	byte	9
	byte	2
	byte	run,0x80+2
	byte	168
	byte	150
	byte	run,3,149
	byte	37
	byte	37
	byte	41
	byte	42
	byte	42
	byte	149
	byte	run,3,85
	byte	149
	byte	42
	byte	run,0x80+2
	byte	run,8,128
	byte	104
	byte	86
	byte	86
	byte	88
	byte	96
	byte	128




