;---------------------------------------
;
;	animation cel data
;

chango_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	chango_start_end - chango_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11000000
	byte	0b10100000
	byte	0b10010000

	word	chango_data_a - chango_data
	word	chango_data_b - chango_data
	word	chango_data_c - chango_data
	word	chango_data_d - chango_data

chango_start_end:
	byte	0,0,cycle+0,2


chango_data_a:
	byte	0x02, 0x10, 0x00, 0x05, 0x00, 0x00

	byte	run,0x80+8
	byte	10
	byte	10
	byte	run,3,42
	byte	10
	byte	2
	byte	run,0x80+1
	byte	168
	byte	168
	byte	run,4,160
	byte	168
	byte	174
	byte	170
	byte	run,3,171
	byte	235
	byte	171
	byte	226
	byte	128




chango_data_b:
	byte	0x02, 0x0f, 0x02, 0x08, 0x00, 0x00

	byte	run,0x80+5
	byte	130
	byte	run,3,170
	byte	130
	byte	run,0x80+5
	byte	8
	byte	42
	byte	8
	byte	40
	byte	160
	byte	128
	byte	8
	byte	174
	byte	8
	byte	128
	byte	160
	byte	40
	byte	8
	byte	42
	byte	8




chango_data_c:
	byte	0x02, 0x0f, 0x02, 0x08, 0x00, 0x00

	byte	run,0x80+4
	byte	2
	byte	138
	byte	168
	byte	170
	byte	168
	byte	138
	byte	2
	byte	run,0x80+4
	byte	32
	byte	184
	byte	32
	byte	160
	byte	128
	byte	run,0x80+1
	byte	32
	byte	168
	byte	32
	byte	run,0x80+1
	byte	128
	byte	160
	byte	32
	byte	168
	byte	32




chango_data_d:
	byte	0x02, 0x0f, 0x02, 0x08, 0x00, 0x00

	byte	run,0x80+4
	byte	2
	byte	138
	byte	168
	byte	170
	byte	168
	byte	138
	byte	2
	byte	run,0x80+4
	byte	32
	byte	168
	byte	32
	byte	160
	byte	128
	byte	run,0x80+1
	byte	32
	byte	168
	byte	32
	byte	run,0x80+1
	byte	128
	byte	160
	byte	32
	byte	184
	byte	32




