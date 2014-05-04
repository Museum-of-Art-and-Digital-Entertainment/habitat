;---------------------------------------
;
;	animation cel data
;

skull0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	skull0_start_end - skull0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	skull0_data_a - skull0_data
	word	skull0_data_b - skull0_data
	word	skull0_data_c - skull0_data

skull0_start_end:
	byte	0,0,1,1,0,0,2,2


skull0_data_a:
	byte	0x04, 0x16, 0x00, 0x00, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	run,9,9
	byte	2
	byte	2
	byte	run,0x80+3
	byte	37
	byte	42
	byte	41
	byte	41
	byte	169
	byte	153
	byte	101
	byte	101
	byte	166
	byte	170
	byte	run,3,85
	byte	105
	byte	89
	byte	89
	byte	86
	byte	85
	byte	85
	byte	149
	byte	42
	byte	40
	byte	168
	byte	170
	byte	85
	byte	85
	byte	102
	byte	106
	byte	166
	byte	149
	byte	149
	byte	85
	byte	run,3,105
	byte	106
	byte	90
	byte	run,4,85
	byte	90
	byte	160
	byte	run,0x80+2
	byte	128
	byte	run,3,96
	byte	160
	byte	96
	byte	96
	byte	160
	byte	160
	byte	96
	byte	run,3,128
	byte	run,4,96
	byte	128
	byte	run,0x80+2




skull0_data_b:
	byte	0x03, 0x17, 0xff, 0x00, 0x00, 0x00
	byte	1
	byte	run,4,2
	byte	9
	byte	9
	byte	42
	byte	41
	byte	37
	byte	165
	byte	149
	byte	run,4,154
	byte	150
	byte	149
	byte	41
	byte	37
	byte	37
	byte	9
	byte	2
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	85
	byte	153
	byte	170
	byte	153
	byte	85
	byte	169
	byte	101
	byte	86
	byte	run,4,154
	byte	run,5,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	160
	byte	160
	byte	96
	byte	104
	byte	88
	byte	run,4,152
	byte	88
	byte	88
	byte	160
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




skull0_data_c:
	byte	0x03, 0x0b, 0xff, 0xfa, 0x00, 0x00
	byte	run,3,1
	byte	run,8,5
	byte	run,11,85
	byte	run,0x80+3
	byte	run,8,64




