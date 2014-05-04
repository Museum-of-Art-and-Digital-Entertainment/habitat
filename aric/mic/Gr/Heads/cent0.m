;---------------------------------------
;
;	animation cel data
;

cent0_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	cent0_start_end - cent0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	cent0_data_a - cent0_data
	word	cent0_data_b - cent0_data

cent0_start_end:
	byte	0,0,1,1,0,0,1,1


cent0_data_a:
	byte	0x04, 0x1e, 0x00, 0x08, 0x00, 0x00
	byte	run,0x80+4
	byte	170
	byte	37
	byte	9
	byte	run,4,2
	byte	9
	byte	9
	byte	41
	byte	run,6,153
	byte	150
	byte	150
	byte	run,4,37
	byte	9
	byte	2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	170
	byte	run,17,85
	byte	149
	byte	101
	byte	90
	byte	run,3,85
	byte	149
	byte	42
	byte	40
	byte	184
	byte	250
	byte	230
	byte	166
	byte	run,7,86
	byte	90
	byte	run,4,111
	byte	90
	byte	run,5,85
	byte	86
	byte	169
	byte	run,3,85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	234
	byte	run,5,230
	byte	152
	byte	88
	byte	run,4,96
	byte	128
	byte	run,0x80+1
	byte	128
	byte	96
	byte	88
	byte	96
	byte	128
	byte	run,0x80+1




cent0_data_b:
	byte	0x04, 0x1f, 0xfe, 0x08, 0x00, 0x00
	byte	run,0x80+9
	byte	run,10,2
	byte	run,0x80+12
	byte	3
	byte	2
	byte	2
	byte	34
	byte	154
	byte	run,4,155
	byte	run,4,91
	byte	107
	byte	run,4,111
	byte	90
	byte	run,4,149
	byte	37
	byte	37
	byte	10
	byte	run,0x80+5
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,5,255
	byte	171
	byte	171
	byte	run,6,155
	byte	86
	byte	run,3,85
	byte	run,3,169
	byte	154
	byte	run,4,152
	byte	32
	byte	run,0x80+3
	byte	32
	byte	run,5,152
	byte	run,5,150
	byte	run,4,230
	byte	150
	byte	run,4,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+5




