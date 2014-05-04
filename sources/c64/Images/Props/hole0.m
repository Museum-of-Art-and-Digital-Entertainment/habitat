;---------------------------------------
;
;	animation cel data
;

hole0_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	hole0_start_end - hole0_data
	byte	no_cont

	byte	240+right,40+left,248

	byte	0b11000000
	byte	0b10100000

	word	hole0_data_a - hole0_data
	word	hole0_data_b - hole0_data
	word	hole0_data_c - hole0_data

hole0_start_end:
	byte	0,0,1,1


hole0_data_a:
	byte	cel_box + 0x07, 0x01, 0xff, 0x03, 0x00, 0x00
	byte	pat_glass

hole0_data_b:
	byte	cel_box + 0x07, 0x0c, 0xff, 0x02, 0x00, 0x00
	byte	pat_glass

hole0_data_c:
	byte	0x07, 0x0c, 0xff, 0x02, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	2
	byte	run,3,8
	byte	2
	byte	2
	byte	run,0x80+2
	byte	2
	byte	42
	byte	170
	byte	42
	byte	run,4,170
	byte	42
	byte	10
	byte	160
	byte	42
	byte	run,10,170
	byte	run,0x80+1
	byte	run,11,170
	byte	run,0x80+1
	byte	run,11,170
	byte	run,0x80+1
	byte	170
	byte	160
	byte	run,8,170
	byte	168
	byte	2
	byte	168
	byte	run,0x80+2
	byte	128
	byte	160
	byte	136
	byte	168
	byte	136
	byte	136
	byte	8
	byte	32
	byte	128
	byte	run,0x80+1




