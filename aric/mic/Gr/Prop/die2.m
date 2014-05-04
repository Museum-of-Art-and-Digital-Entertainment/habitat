;---------------------------------------
;
;	animation cel data
;

die2_data::
	byte	swing	+ 47
	byte	0b00000000
	byte	die2_start_end - die2_data
	byte	no_cont

	byte	236+right,24+left,255

	byte	0b11010000
	byte	0b10000000
	byte	0b10010000
	byte	0b10100000
	byte	0b10110000
	byte	0b11100000
	byte	0b11011101
	byte	0b11011000
	byte	0b11011001
	byte	0b11011010
	byte	0b11011011
	byte	0b11011110
	byte	0b10001101
	byte	0b10001000
	byte	0b10001001
	byte	0b10001010
	byte	0b10001011
	byte	0b10001110
	byte	0b10011101
	byte	0b10011000
	byte	0b10011001
	byte	0b10011010
	byte	0b10011011
	byte	0b10011110
	byte	0b10101101
	byte	0b10101000
	byte	0b10101001
	byte	0b10101010
	byte	0b10101011
	byte	0b10101110
	byte	0b10111101
	byte	0b10111000
	byte	0b10111001
	byte	0b10111010
	byte	0b10111011
	byte	0b10111110
	byte	0b11101101
	byte	0b11101000
	byte	0b11101001
	byte	0b11101010
	byte	0b11101011
	byte	0b11101110
	byte	0b11011000
	byte	0b10101110
	byte	0b11101001
	byte	0b10011010
	byte	0b10111101
	byte	0b11101001

	word	die2_data_a - die2_data
	word	die2_data_b - die2_data
	word	die2_data_c - die2_data
	word	die2_data_d - die2_data
	word	die2_data_e - die2_data
	word	die2_data_f - die2_data
	word	die2_data_g - die2_data
	word	die2_data_h - die2_data

die2_start_end:
	byte	cycle+0,5,0,0,1,1,2,2,3,3,4,4,5,5,cycle+42,47,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20,21,21,22,22,23,23,24,24,25,25,26,26,27,27,28,28,29,29,30,30,31,31,32,32,33,33,34,34,35,35,36,36,37,37,38,38,39,39,40,40,41,41


die2_data_a:
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




die2_data_b:
	byte	0x02, 0x05, 0x01, 0xfe, 0x00, 0x00
	byte	run,0x80+2
	byte	8
	byte	run,0x80+1
	byte	4
	byte	4
	byte	run,0x80+1
	byte	8
	byte	run,0x80+2




die2_data_c:
	byte	0x02, 0x05, 0x01, 0xfe, 0x00, 0x00
	byte	8
	byte	run,0x80+3
	byte	8
	byte	8
	byte	run,0x80+3
	byte	8




die2_data_d:
	byte	0x02, 0x01, 0x01, 0xfc, 0x00, 0x00
	byte	4
	byte	132




die2_data_e:
	byte	0x03, 0x0b, 0x04, 0x01, 0x00, 0x00
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




die2_data_f:
	byte	0x02, 0x05, 0x04, 0xfe, 0x00, 0x00
	byte	run,0x80+2
	byte	8
	byte	run,0x80+1
	byte	4
	byte	4
	byte	run,0x80+1
	byte	8
	byte	run,0x80+2




die2_data_g:
	byte	0x02, 0x05, 0x04, 0xfe, 0x00, 0x00
	byte	8
	byte	run,0x80+3
	byte	8
	byte	8
	byte	run,0x80+3
	byte	8




die2_data_h:
	byte	0x02, 0x01, 0x04, 0xfc, 0x00, 0x00
	byte	4
	byte	132




