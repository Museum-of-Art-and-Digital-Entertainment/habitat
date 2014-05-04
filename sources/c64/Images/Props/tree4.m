;---------------------------------------
;
;	animation cel data
;

tree4_data::
	byte	both	+ 4
	byte	0b00000000
	byte	tree4_start_end - tree4_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11110000
	byte	0b10000000
	byte	0b01110000
	byte	0b00100000
	byte	0b00110000

	word	tree4_data_a - tree4_data
	word	tree4_data_b - tree4_data
	word	tree4_data_c - tree4_data
	word	tree4_data_d - tree4_data

tree4_start_end:
	byte	0,0,1,1,2,2,3,3,4,4


tree4_data_a:
	byte	0x03, 0x17, 0xfe, 0x15, 0x00, 0x00
	byte	run,0x80+2
	byte	8
	byte	2
	byte	run,0x80+11
	byte	2
	byte	run,4,10
	byte	run,3,42
	byte	32
	byte	10
	byte	170
	byte	42
	byte	run,4,10
	byte	run,4,42
	byte	run,3,170
	byte	168
	byte	160
	byte	run,3,128
	byte	run,0x80+3
	byte	2
	byte	168
	byte	168
	byte	162
	byte	run,4,160
	byte	run,5,128
	byte	run,0x80+10




tree4_data_b:
	byte	0x03, 0x1a, 0xfc, 0x2f, 0x00, 0x00
	byte	32
	byte	10
	byte	run,0x80+10
	byte	8
	byte	2
	byte	run,0x80+3
	byte	128
	byte	160
	byte	8
	byte	run,3,2
	byte	8
	byte	32
	byte	128
	byte	128
	byte	40
	byte	10
	byte	2
	byte	2
	byte	run,0x80+6
	byte	run,3,2
	byte	170
	byte	10
	byte	10
	byte	40
	byte	40
	byte	160
	byte	128
	byte	run,0x80+5
	byte	42
	byte	42
	byte	170
	byte	170
	byte	run,3,168
	byte	run,5,160
	byte	run,4,128
	byte	run,0x80+10




tree4_data_c:
	byte	0x04, 0x20, 0xfe, 0x34, 0x00, 0x00
	byte	10
	byte	run,3,2
	byte	run,0x80+16
	byte	2
	byte	2
	byte	10
	byte	40
	byte	32
	byte	160
	byte	run,0x80+6
	byte	128
	byte	run,8,160
	byte	32
	byte	32
	byte	40
	byte	40
	byte	42
	byte	10
	byte	40
	byte	40
	byte	42
	byte	162
	byte	160
	byte	128
	byte	run,0x80+3
	byte	2
	byte	run,0x80+21
	byte	130
	byte	40
	byte	2
	byte	run,0x80+2
	byte	128
	byte	run,3,32
	byte	136
	byte	2
	byte	run,0x80+5
	byte	2
	byte	8
	byte	run,0x80+11
	byte	8
	byte	32
	byte	128
	byte	run,0x80+11
	byte	128
	byte	160
	byte	136
	byte	128
	byte	128
	byte	run,0x80+2




tree4_data_d:
	byte	0x04, 0x12, 0xfc, 0x38, 0x00, 0x00
	byte	run,0x80+14
	byte	128
	byte	42
	byte	run,0x80+10
	byte	2
	byte	10
	byte	8
	byte	32
	byte	run,3,128
	byte	run,0x80+5
	byte	2
	byte	2
	byte	10
	byte	40
	byte	32
	byte	160
	byte	128
	byte	32
	byte	8
	byte	2
	byte	2
	byte	run,0x80+3
	byte	10
	byte	run,0x80+1
	byte	160
	byte	160
	byte	128
	byte	run,0x80+10
	byte	run,3,128
	byte	32
	byte	8




