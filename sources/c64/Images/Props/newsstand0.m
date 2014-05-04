;---------------------------------------
;
;	animation cel data
;

newsstand0_data::
	byte	both	+ 3
	byte	0b01000000
	byte	newsstand0_start_end - newsstand0_data
	byte	newsstand0_contents_xy - newsstand0_data

	byte	32+left,32+left,254

	byte	0b11000000
	byte	0b01000000
	byte	0b11000000
	byte	0b11000000

	word	newsstand0_data_a - newsstand0_data
	word	newsstand0_data_b - newsstand0_data

newsstand0_start_end:
	byte	0,0,1,1,2,2,3,3

newsstand0_contents_xy:
	byte	250,196,246,191


newsstand0_data_a:
	byte	0x06, 0x01, 0xf6, 0x30, 0x00, 0x00
	byte	84
	byte	run,0x80+3
	byte	5
	byte	64




newsstand0_data_b:
	byte	cel_box + both_bord + 0x07, 0x24, 0xf5, 0x63, 0x00, 0x00
	byte	0q1111

