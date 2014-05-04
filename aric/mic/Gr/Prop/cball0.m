;---------------------------------------
;
;	animation cel data
;

cball0_data::
	byte	swing	+ 3
	byte	0b00000000
	byte	cball0_start_end - cball0_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b11000000
	byte	0b10100000
	byte	0b10010000

	word	cball0_data_a - cball0_data
	word	cball0_data_b - cball0_data
	word	cball0_data_c - cball0_data
	word	cball0_data_d - cball0_data

cball0_start_end:
	byte	0,0,cycle+1,3


cball0_data_a:
	byte	0x03, 0x13, 0x01, 0x0a, 0x00, 0x00
	byte	170
	byte	170
	byte	42
	byte	10
	byte	42
	byte	42
	byte	11
	byte	47
	byte	47
	byte	run,6,191
	byte	47
	byte	47
	byte	11
	byte	2
	byte	run,3,170
	byte	168
	byte	170
	byte	170
	byte	248
	byte	254
	byte	254
	byte	run,6,255
	byte	254
	byte	254
	byte	248
	byte	160
	byte	128
	byte	128
	byte	run,0x80+7
	byte	run,6,128
	byte	run,0x80+4




cball0_data_b:
	byte	0x02, 0x08, 0x01, 0x07, 0x00, 0x00
	byte	run,0x80+4
	byte	5
	byte	run,0x80+3
	byte	run,4,64
	byte	84
	byte	run,3,64




cball0_data_c:
	byte	0x02, 0x06, 0x01, 0x06, 0x00, 0x00
	byte	1
	byte	1
	byte	run,0x80+1
	byte	1
	byte	5
	byte	run,0x80+2
	byte	4
	byte	80
	byte	64
	byte	16
	byte	16




cball0_data_d:
	byte	0x02, 0x05, 0x01, 0x05, 0x00, 0x00
	byte	run,0x80+1
	byte	5
	byte	1
	byte	1
	byte	4
	byte	16
	byte	64
	byte	64
	byte	80
	byte	20




