;---------------------------------------
;
;	animation cel data
;

tok_data::
	byte	swing	+ 4
	byte	0b00000000
	byte	tok_start_end - tok_data
	byte	no_cont+0x01

	byte	236+right,20+left,252

	byte	0b10010000
	byte	0b10010000
	byte	0b10010000
	byte	0b11010000
	byte	0b10100000

	word	tok_data_a - tok_data
	word	tok_data_b - tok_data
	word	tok_data_c - tok_data
	word	tok_data_d - tok_data

tok_start_end:
	byte	cycle+0,4


tok_data_a:
	byte	0x01, 0x05, 0x01, 0xfe, 0x00, 0x00
	byte	40
	byte	run,3,150
	byte	40




tok_data_b:
	byte	0x01, 0x07, 0x01, 0xff, 0x00, 0x00
	byte	run,3,16
	byte	86
	byte	run,3,16




tok_data_c:
	byte	0x03, 0x0c, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+5
	byte	21
	byte	run,0x80+6
	byte	run,5,16
	byte	85
	byte	run,6,16
	byte	run,0x80+5
	byte	80
	byte	run,0x80+6




tok_data_d:
	byte	cel_box  + 0x03, 0x0c, 0x00, 0x02, 0x00, 0x00
	byte	0q0000

