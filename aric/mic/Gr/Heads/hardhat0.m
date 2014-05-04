;---------------------------------------
;
;	animation cel data
;

hardhat0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	hardhat0_start_end - hardhat0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	hardhat0_data_a - hardhat0_data
	word	hardhat0_data_b - hardhat0_data
	word	hardhat0_data_c - hardhat0_data

hardhat0_start_end:
	byte	0,0,1,1,0,0,2,2


hardhat0_data_a:
	byte	0x05, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+8
	byte	run,4,2
	byte	42
	byte	149
	byte	run,4,37
	byte	run,4,9
	byte	2
	byte	2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	171
	byte	171
	byte	170
	byte	90
	byte	run,3,85
	byte	149
	byte	149
	byte	101
	byte	101
	byte	90
	byte	85
	byte	85
	byte	165
	byte	42
	byte	40
	byte	184
	byte	250
	byte	251
	byte	239
	byte	175
	byte	run,3,191
	byte	255
	byte	255
	byte	251
	byte	170
	byte	170
	byte	86
	byte	run,5,85
	byte	86
	byte	169
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+2
	byte	160
	byte	run,5,248
	byte	168
	byte	224
	byte	232
	byte	248
	byte	248
	byte	168
	byte	170
	byte	85
	byte	85
	byte	86
	byte	150
	byte	150
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+15
	byte	128
	byte	96
	byte	128
	byte	run,0x80+9




hardhat0_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+10
	byte	2
	byte	10
	byte	10
	byte	38
	byte	37
	byte	37
	byte	run,4,9
	byte	2
	byte	run,0x80+5
	byte	3
	byte	2
	byte	2
	byte	11
	byte	run,3,47
	byte	run,3,175
	byte	191
	byte	187
	byte	170
	byte	170
	byte	106
	byte	run,4,85
	byte	86
	byte	86
	byte	150
	byte	153
	byte	153
	byte	34
	byte	run,0x80+1
	byte	255
	byte	254
	byte	170
	byte	239
	byte	run,4,255
	byte	175
	byte	255
	byte	239
	byte	255
	byte	186
	byte	170
	byte	170
	byte	run,4,85
	byte	run,5,89
	byte	154
	byte	32
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	run,3,232
	byte	250
	byte	186
	byte	170
	byte	170
	byte	165
	byte	run,3,85
	byte	149
	byte	149
	byte	102
	byte	88
	byte	88
	byte	152
	byte	32
	byte	run,0x80+12
	byte	128
	byte	128
	byte	run,3,96
	byte	run,4,128
	byte	run,0x80+6




hardhat0_data_c:
	byte	0x03, 0x0c, 0xff, 0xf8, 0x00, 0x00
	byte	10
	byte	run,8,42
	byte	37
	byte	85
	byte	85
	byte	run,9,170
	byte	run,3,85
	byte	128
	byte	run,8,160
	byte	96
	byte	85
	byte	85




