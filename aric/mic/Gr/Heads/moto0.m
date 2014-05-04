;---------------------------------------
;
;	animation cel data
;

moto0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	moto0_start_end - moto0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	moto0_data_a - moto0_data
	word	moto0_data_b - moto0_data
	word	moto0_data_c - moto0_data

moto0_start_end:
	byte	0,0,1,1,0,0,2,2


moto0_data_a:
	byte	0x05, 0x19, 0xff, 0x03, 0x00, 0x00
	byte	run,0x80+12
	byte	run,8,2
	byte	run,0x80+11
	byte	2
	byte	10
	byte	37
	byte	run,3,149
	byte	run,7,85
	byte	170
	byte	170
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	47
	byte	run,3,42
	byte	170
	byte	165
	byte	run,6,85
	byte	86
	byte	run,3,89
	byte	86
	byte	85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	40
	byte	184
	byte	248
	byte	170
	byte	170
	byte	run,5,85
	byte	86
	byte	91
	byte	175
	byte	110
	byte	run,3,106
	byte	149
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	90
	byte	160
	byte	run,0x80+3
	byte	168
	byte	150
	byte	run,4,86
	byte	90
	byte	168
	byte	248
	byte	248
	byte	184
	byte	160
	byte	160
	byte	170
	byte	86
	byte	86
	byte	168
	byte	168
	byte	96
	byte	128
	byte	run,0x80+2




moto0_data_b:
	byte	0x05, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+4
	byte	2
	byte	10
	byte	9
	byte	run,3,37
	byte	149
	byte	149
	byte	150
	byte	run,4,153
	byte	150
	byte	149
	byte	37
	byte	42
	byte	10
	byte	2
	byte	run,0x80+2
	byte	3
	byte	2
	byte	2
	byte	42
	byte	170
	byte	149
	byte	run,4,85
	byte	86
	byte	107
	byte	191
	byte	186
	byte	run,3,170
	byte	149
	byte	85
	byte	86
	byte	170
	byte	170
	byte	85
	byte	149
	byte	42
	byte	255
	byte	254
	byte	run,3,170
	byte	run,5,85
	byte	170
	byte	255
	byte	187
	byte	186
	byte	run,3,170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	102
	byte	101
	byte	101
	byte	170
	byte	run,0x80+3
	byte	160
	byte	170
	byte	90
	byte	run,5,85
	byte	165
	byte	250
	byte	185
	byte	run,3,169
	byte	90
	byte	85
	byte	85
	byte	170
	byte	170
	byte	86
	byte	88
	byte	160
	byte	run,0x80+5
	byte	128
	byte	128
	byte	run,3,96
	byte	104
	byte	88
	byte	88
	byte	run,5,152
	byte	88
	byte	96
	byte	160
	byte	128
	byte	run,0x80+3




moto0_data_c:
	byte	0x05, 0x08, 0xfe, 0xfb, 0x00, 0x00
	byte	run,8,5
	byte	run,24,85
	byte	run,8,64




