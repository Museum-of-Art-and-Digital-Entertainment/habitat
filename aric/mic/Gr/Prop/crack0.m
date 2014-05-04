;---------------------------------------
;
;	animation cel data
;

crack0_data::
	byte	out	+ 4
	byte	0b10000000
	byte	crack0_start_end - crack0_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b11111000
	byte	0b10001000
	byte	0b00001000
	byte	0b11110000

	word	crack0_data_a - crack0_data
	word	crack0_data_b - crack0_data
	word	crack0_data_c - crack0_data
	word	crack0_data_d - crack0_data
	word	crack0_data_e - crack0_data

crack0_start_end:
	byte	0,0,1,1,2,2,3,3


crack0_data_a:
	byte	0x03, 0x13, 0xfe, 0x2c, 0x00, 0x00
	byte	2
	byte	run,0x80+1
	byte	2
	byte	2
	byte	run,0x80+1
	byte	10
	byte	8
	byte	2
	byte	run,0x80+1
	byte	2
	byte	8
	byte	160
	byte	8
	byte	32
	byte	128
	byte	32
	byte	8
	byte	2
	byte	8
	byte	32
	byte	128
	byte	run,0x80+2
	byte	130
	byte	8
	byte	2
	byte	40
	byte	128
	byte	32
	byte	8
	byte	32
	byte	8
	byte	2
	byte	run,0x80+16
	byte	32
	byte	128
	byte	run,0x80+1
	byte	162
	byte	8
	byte	run,0x80+3




crack0_data_b:
	byte	0x01, 0x06, 0xfd, 0x2a, 0x00, 0x00
	byte	2
	byte	8
	byte	32
	byte	128
	byte	32
	byte	8




crack0_data_c:
	byte	0x02, 0x05, 0xfe, 0x30, 0x00, 0x00
	byte	8
	byte	8
	byte	2
	byte	run,0x80+1
	byte	2
	byte	run,0x80+3
	byte	128
	byte	run,0x80+1




crack0_data_d:
	byte	0x02, 0x08, 0x00, 0x2a, 0x00, 0x00
	byte	run,0x80+1
	byte	10
	byte	run,0x80+6
	byte	32
	byte	128
	byte	run,0x80+1
	byte	8
	byte	32
	byte	128
	byte	32
	byte	8




crack0_data_e:
	byte	0x03, 0x0c, 0xfe, 0x1e, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	8
	byte	2
	byte	8
	byte	32
	byte	136
	byte	run,0x80+5
	byte	32
	byte	128
	byte	run,0x80+3
	byte	2
	byte	8
	byte	run,0x80+4
	byte	2
	byte	run,0x80+7
	byte	32
	byte	128
	byte	32
	byte	128
	byte	run,0x80+1




