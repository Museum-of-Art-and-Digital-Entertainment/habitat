;---------------------------------------
;
;	animation cel data
;

die_data::
	byte	swing	+ 5
	byte	0b00000000
	byte	die_start_end - die_data
	byte	no_cont

	byte	236+right,24+left,255

	byte	0b11010000
	byte	0b10000000
	byte	0b10010000
	byte	0b10100000
	byte	0b10110000
	byte	0b11100000

	word	die_data_a - die_data
	word	die_data_b - die_data
	word	die_data_c - die_data
	word	die_data_d - die_data

die_start_end:
	byte	cycle+0,5,0,0,1,1,2,2,3,3,4,4,5,5


die_data_a:
	byte	0x03, 0x0b, 0x01, 0x01, 0x00, 0x00
	byte	170
	byte	run,6,149
	byte	153
	byte	149
	byte	149
	byte	170
	byte	170
	byte	85
	byte	85
	byte	89
	byte	run,6,85
	byte	170
	byte	run,11,128




die_data_b:
	byte	0x02, 0x05, 0x01, 0xfe, 0x00, 0x00
	byte	run,0x80+2
	byte	8
	byte	run,0x80+1
	byte	4
	byte	4
	byte	run,0x80+1
	byte	8
	byte	run,0x80+2




die_data_c:
	byte	0x02, 0x05, 0x01, 0xfe, 0x00, 0x00
	byte	8
	byte	run,0x80+3
	byte	8
	byte	8
	byte	run,0x80+3
	byte	8




die_data_d:
	byte	0x02, 0x01, 0x01, 0xfc, 0x00, 0x00
	byte	4
	byte	132




