;---------------------------------------
;
;	animation cel data
;

hand_data::
	byte	both	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	216+down,216+down,184

	byte	0b11100000

	word	hand_data_a - hand_data
	word	hand_data_b - hand_data
	word	hand_data_c - hand_data


hand_data_a:
	byte	0x05, 0x30, 0x07, 0x45, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	9
	byte	run,4,37
	byte	137
	byte	137
	byte	106
	byte	101
	byte	101
	byte	run,13,149
	byte	run,3,37
	byte	run,3,9
	byte	run,3,2
	byte	run,0x80+15
	byte	170
	byte	86
	byte	run,6,85
	byte	149
	byte	101
	byte	89
	byte	run,9,86
	byte	89
	byte	89
	byte	86
	byte	run,10,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	10
	byte	37
	byte	149
	byte	149
	byte	85
	byte	85
	byte	149
	byte	101
	byte	89
	byte	86
	byte	run,6,85
	byte	149
	byte	106
	byte	run,5,85
	byte	86
	byte	86
	byte	89
	byte	89
	byte	169
	byte	run,14,85
	byte	169
	byte	2
	byte	run,0x80+2
	byte	2
	byte	9
	byte	137
	byte	101
	byte	run,3,89
	byte	86
	byte	86
	byte	run,3,85
	byte	149
	byte	149
	byte	170
	byte	run,4,149
	byte	run,3,85
	byte	106
	byte	149
	byte	149
	byte	run,20,85
	byte	165
	byte	9
	byte	2
	byte	168
	byte	86
	byte	run,7,85
	byte	run,4,149
	byte	165
	byte	90
	byte	run,7,85
	byte	169
	byte	86
	byte	run,24,85




hand_data_b:
	byte	0x05, 0x2e, 0x0c, 0x45, 0x00, 0x00
	byte	run,3,128
	byte	run,3,96
	byte	run,6,88
	byte	168
	byte	86
	byte	run,32,85
	byte	run,0x80+14
	byte	128
	byte	96
	byte	88
	byte	86
	byte	run,28,85
	byte	run,0x80+18
	byte	128
	byte	128
	byte	96
	byte	96
	byte	run,3,88
	byte	run,3,86
	byte	run,18,85
	byte	run,0x80+28
	byte	128
	byte	128
	byte	96
	byte	96
	byte	run,3,88
	byte	run,3,86
	byte	run,8,85
	byte	run,0x80+38
	byte	run,3,128
	byte	run,3,96
	byte	88
	byte	88




hand_data_c:
	byte	0x03, 0x1f, 0x04, 0x30, 0x00, 0x00
	byte	10
	byte	37
	byte	run,6,149
	byte	run,3,37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+17
	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	86
	byte	86
	byte	run,7,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+16
	byte	128
	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	86
	byte	86
	byte	run,7,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2




