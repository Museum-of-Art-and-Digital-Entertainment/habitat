;---------------------------------------
;
;	animation cel data
;

beard0_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	beard0_start_end - beard0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	beard0_data_a - beard0_data
	word	beard0_data_b - beard0_data

beard0_start_end:
	byte	0,0,1,1,0,0,1,1


beard0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
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
	byte	run,5,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	229
	byte	229
	byte	150
	byte	155
	byte	175
	byte	run,5,239
	byte	175
	byte	111
	byte	111
	byte	107
	byte	91
	byte	86
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+2
	byte	160
	byte	run,3,88
	byte	160
	byte	run,3,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	run,3,128
	byte	run,0x80+2




beard0_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	3
	byte	2
	byte	2
	byte	10
	byte	9
	byte	37
	byte	38
	byte	38
	byte	43
	byte	run,9,175
	byte	155
	byte	150
	byte	37
	byte	37
	byte	9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	run,3,85
	byte	154
	byte	238
	byte	run,11,255
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+3
	byte	128
	byte	128
	byte	run,3,96
	byte	160
	byte	run,8,232
	byte	168
	byte	152
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




