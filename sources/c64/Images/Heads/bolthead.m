;---------------------------------------
;
;	animation cel data
;

bolthead_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	bolthead_start_end - bolthead_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	bolthead_data_a - bolthead_data
	word	bolthead_data_b - bolthead_data

bolthead_start_end:
	byte	0,0,1,1,0,0,1,1


bolthead_data_a:
	byte	0x07, 0x21, 0xfd, 0x0b, 0x00, 0x00
	byte	run,0x80+32
	byte	2
	byte	run,0x80+23
	byte	2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	38
	byte	152
	byte	160
	byte	128
	byte	run,0x80+17
	byte	2
	byte	10
	byte	10
	byte	38
	byte	38
	byte	149
	byte	149
	byte	run,3,85
	byte	101
	byte	165
	byte	37
	byte	38
	byte	40
	byte	32
	byte	run,0x80+8
	byte	run,8,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	149
	byte	149
	byte	run,4,85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+5
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
	byte	run,9,85
	byte	149
	byte	149
	byte	150
	byte	152
	byte	160
	byte	128
	byte	run,0x80+3
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
	byte	91
	byte	91
	byte	86
	byte	85
	byte	85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+10
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,3,224
	byte	232
	byte	152
	byte	96
	byte	128
	byte	run,0x80+11




bolthead_data_b:
	byte	0x03, 0x24, 0xff, 0x0d, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	run,3,175
	byte	run,4,155
	byte	38
	byte	37
	byte	37
	byte	run,3,9
	byte	run,4,2
	byte	run,0x80+5
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,14,255
	byte	239
	byte	155
	byte	86
	byte	run,5,85
	byte	run,4,86
	byte	run,3,152
	byte	32
	byte	32
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,248
	byte	run,3,232
	byte	run,4,152
	byte	run,3,96
	byte	run,3,128
	byte	run,0x80+9




