;---------------------------------------
;
;	animation cel data
;

sign0_data::
	byte	out	+ 1+4+2+3+3+3
	byte	0b10000000
	byte	sign0_start_end - sign0_data
	byte	no_cont

	byte	240+right,36+left,255

	byte	0b11000000
	byte	0b01000000

	byte	0b10100000
	byte	0b00100000

	byte	0b10010000
	byte	0b00010000

	byte	0b00000000
	byte	0b00000000

	byte	0b01000000
	byte	0b00000000
	byte	0b00000000

	byte	0b00100000
	byte	0b00000000
	byte	0b00000000

	byte	0b00010000
	byte	0b00000000
	byte	0b00000000


	word	sign0_data_a - sign0_data
	word	sign0_data_b - sign0_data
	word	sign0_data_c - sign0_data
	word	sign0_data_d - sign0_data

sign0_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5
	byte	cycle+8,10,cycle+7,9,cycle+6,8
	byte	cycle+11,13,cycle+10,12,cycle+9,11
	byte	cycle+14,16,cycle+13,15,cycle+12,14


sign0_data_a:
	byte	cel_box + both_bord + 0x06, 0x18, 0xfc, 0x22, 0x00, 0x00
	byte	0q1111

sign0_data_b:
	byte	cel_text + 0x01, 0x01, 0xfc, 0x1e, 0x00, 0x00
	byte	pat_black
	byte	2

sign0_data_c:
	byte	cel_text + 0x01, 0x01, 0xfc, 0x1e, 0x00, 0x00
	byte	pat_sky
	byte	2

sign0_data_d:
	byte	cel_text + 0x01, 0x01, 0xfc, 0x1e, 0x00, 0x00
	byte	pat_pink
	byte	2


