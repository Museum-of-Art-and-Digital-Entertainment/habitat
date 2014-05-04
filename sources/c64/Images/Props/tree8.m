;---------------------------------------
;
;	animation cel data
;

tree8_data::
	byte	both	+ 2
	byte	0b00000000
	byte	tree8_start_end - tree8_data
	byte	no_cont

	byte	244+right,32+left,255

	byte	0b11100000
	byte	0b10000000
	byte	0b01000000

	word	tree8_data_a - tree8_data
	word	tree8_data_b - tree8_data
	word	tree8_data_c - tree8_data

tree8_start_end:
	byte	0,0,1,1,2,2


tree8_data_a:
	byte	0x05, 0x10, 0xfa, 0x0d, 0x00, 0x00
	byte	10
	byte	47
	byte	190
	byte	run,5,187
	byte	190
	byte	47
	byte	11
	byte	2
	byte	run,0x80+4
	byte	160
	byte	234
	byte	250
	byte	186
	byte	190
	byte	238
	byte	238
	byte	190
	byte	250
	byte	250
	byte	234
	byte	170
	byte	2
	byte	run,0x80+5
	byte	160
	byte	run,10,170
	byte	10
	byte	run,0x80+6
	byte	160
	byte	run,9,170
	byte	42
	byte	run,0x80+7
	byte	160
	byte	run,7,170
	byte	168
	byte	40




tree8_data_b:
	byte	0x05, 0x11, 0xff, 0x15, 0x00, 0x00
	byte	128
	byte	168
	byte	run,8,170
	byte	10
	byte	run,0x80+8
	byte	128
	byte	168
	byte	run,7,170
	byte	42
	byte	2
	byte	run,0x80+8
	byte	128
	byte	168
	byte	run,7,170
	byte	42
	byte	10
	byte	run,0x80+9
	byte	128
	byte	160
	byte	run,7,170
	byte	2
	byte	run,0x80+10
	byte	168
	byte	run,4,170
	byte	168
	byte	160




tree8_data_c:
	byte	0x03, 0x09, 0xfc, 0x14, 0x00, 0x00
	byte	run,0x80+4
	byte	10
	byte	32
	byte	34
	byte	130
	byte	2
	byte	run,0x80+1
	byte	2
	byte	10
	byte	170
	byte	168
	byte	160
	byte	128
	byte	128
	byte	run,0x80+1
	byte	2
	byte	130
	byte	130
	byte	run,0x80+6




