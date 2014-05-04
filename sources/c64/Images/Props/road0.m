;---------------------------------------
;
;	animation cel data
;

road0_data::
	byte	out	+ 14
	byte	0b11111000
	byte	road0_start_end - road0_data
	byte	no_cont

	byte	0,0,0

	byte	0b11111000
	byte	0b11000000
	byte	0b10100000
	byte	0b10010000
	byte	0b10001000
	byte	0b11100000
	byte	0b10011000
	byte	0b11010000
	byte	0b11001000
	byte	0b10110000
	byte	0b10101000
	byte	0b11110000
	byte	0b11101000
	byte	0b11011000
	byte	0b10111000

	word	road0_data_a - road0_data
	word	road0_data_b - road0_data
	word	road0_data_c - road0_data
	word	road0_data_d - road0_data
	word	road0_data_e - road0_data

road0_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14


road0_data_a:
	byte	cel_trap + 0x08, 0x10, 0x06, 0x1b, 0x00, 0x00
	byte	pat_wild
	byte	4+1,	4+0x5*4-2,	4+0,	4+0x5*4-1

road0_data_b:
	byte	cel_trap + 0x09, 0x0c, 0x05, 0x0b, 0x00, 0x00
	byte	pat_wild
	byte	6+1,	7+0x5*4+1,	6+0,	7+0x5*4+2

road0_data_c:
	byte	cel_trap + 0x06, 0x14, 0x07, 0x2f, 0x00, 0x00
	byte	pat_wild
	byte	3,	0x5*4-4,	2,	0x5*4-3

road0_data_d:
	byte	cel_trap + 0x0c, 0x10, 0xf5, 0x1b, 0x00, 0x00
	byte	pat_wild
	byte	0,	0x12*4,	0,	0x12*4


road0_data_e:
	byte	cel_trap + 0x0c, 0x10, 0x0b, 0x1b, 0x00, 0x00
	byte	pat_wild
	byte	0,	0x12*4-1,	0,	0x12*4-1


