;---------------------------------------
;
;	animation cel data
;

metro0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	metro0_start_end - metro0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	metro0_data_a - metro0_data
	word	metro0_data_b - metro0_data

metro0_start_end:
	byte	0,0,1,1,0,0,1,1


metro0_data_a:
	byte	0x04, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+6
	byte	37
	byte	42
	byte	37
	byte	38
	byte	166
	byte	170
	byte	85
	byte	85
	byte	86
	byte	run,4,89
	byte	86
	byte	run,5,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	run,0x80+1
	byte	40
	byte	152
	byte	168
	byte	106
	byte	165
	byte	165
	byte	149
	byte	149
	byte	170
	byte	149
	byte	149
	byte	85
	byte	85
	byte	101
	byte	167
	byte	102
	byte	102
	byte	run,5,101
	byte	102
	byte	168
	byte	32
	byte	run,0x80+3
	byte	128
	byte	run,3,96
	byte	160
	byte	160
	byte	96
	byte	96
	byte	104
	byte	88
	byte	216
	byte	160
	byte	224
	byte	160
	byte	160
	byte	96
	byte	run,3,128
	byte	run,0x80+3




metro0_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	1
	byte	run,3,2
	byte	34
	byte	41
	byte	9
	byte	37
	byte	42
	byte	37
	byte	run,3,149
	byte	151
	byte	158
	byte	155
	byte	154
	byte	150
	byte	149
	byte	37
	byte	37
	byte	9
	byte	10
	byte	2
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	85
	byte	85
	byte	169
	byte	170
	byte	85
	byte	85
	byte	101
	byte	85
	byte	87
	byte	222
	byte	155
	byte	154
	byte	86
	byte	run,4,85
	byte	154
	byte	34
	byte	run,0x80+4
	byte	32
	byte	160
	byte	128
	byte	96
	byte	160
	byte	96
	byte	run,4,88
	byte	216
	byte	152
	byte	152
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+1




