;---------------------------------------
;
;	animation cel data
;

paper_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	paper_start_end - paper_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b11000000
	byte	0b00100000

	word	paper_data_a - paper_data
	word	paper_data_b - paper_data
	word	paper_data_c - paper_data

paper_start_end:
	byte	0,0,1,1,2,2


paper_data_a:
	byte	0x02, 0x10, 0x00, 0xff, 0x00, 0x00
	byte	170
	byte	run,14,149
	byte	170
	byte	170
	byte	run,14,86
	byte	170




paper_data_b:
	byte	0x02, 0x0b, 0x00, 0xfc, 0x00, 0x00
	byte	26
	byte	21
	byte	26
	byte	21
	byte	26
	byte	21
	byte	22
	byte	21
	byte	25
	byte	21
	byte	26
	byte	84
	byte	84
	byte	100
	byte	84
	byte	164
	byte	84
	byte	164
	byte	84
	byte	164
	byte	84
	byte	164




paper_data_c:
	byte	0x03, 0x09, 0x00, 0xfd, 0x00, 0x00
	byte	170
	byte	run,3,149
	byte	150
	byte	153
	byte	165
	byte	149
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,4,85
	byte	170
	byte	170
	byte	run,3,86
	byte	150
	byte	102
	byte	90
	byte	86
	byte	170




