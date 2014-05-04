;---------------------------------------
;
;	animation cel data
;

phair0_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	phair0_start_end - phair0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	phair0_data_a - phair0_data
	word	phair0_data_b - phair0_data

phair0_start_end:
	byte	0,0,1,1,0,0,1,1


phair0_data_a:
	byte	0x04, 0x20, 0x00, 0x0a, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+13
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	154
	byte	85
	byte	85
	byte	86
	byte	run,4,91
	byte	90
	byte	run,5,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+4
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	175
	byte	111
	byte	111
	byte	107
	byte	91
	byte	86
	byte	run,8,85
	byte	149
	byte	37
	byte	10
	byte	2
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	160
	byte	run,8,96
	byte	128
	byte	128
	byte	run,0x80+2




phair0_data_b:
	byte	0x03, 0x21, 0xff, 0x0a, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	run,3,175
	byte	155
	byte	155
	byte	150
	byte	run,3,149
	byte	run,4,37
	byte	run,3,9
	byte	2
	byte	run,0x80+2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,14,255
	byte	170
	byte	run,10,85
	byte	86
	byte	152
	byte	32
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,248
	byte	run,3,232
	byte	152
	byte	152
	byte	run,5,88
	byte	run,3,96
	byte	run,3,128
	byte	run,0x80+3




