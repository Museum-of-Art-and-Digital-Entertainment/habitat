;---------------------------------------
;
;	animation cel data
;

block0_data::
	byte	swing	+ 1
	byte	0b01000000
	byte	block0_start_end - block0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	block0_data_a - block0_data
	word	block0_data_b - block0_data

block0_start_end:
	byte	0,0,1,1,0,0,1,1


block0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+5
	byte	170
	byte	run,17,149
	byte	170
	byte	run,0x80+1
	byte	47
	byte	42
	byte	37
	byte	37
	byte	165
	byte	run,3,85
	byte	86
	byte	run,4,89
	byte	90
	byte	run,8,85
	byte	170
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	run,3,149
	byte	run,4,85
	byte	101
	byte	165
	byte	run,8,85
	byte	170
	byte	run,0x80+3
	byte	128
	byte	run,6,96
	byte	104
	byte	run,4,88
	byte	run,8,96
	byte	160




block0_data_b:
	byte	0x04, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+3
	byte	run,22,2
	byte	3
	byte	2
	byte	2
	byte	170
	byte	run,20,85
	byte	170
	byte	255
	byte	254
	byte	170
	byte	170
	byte	run,20,85
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,20,86
	byte	170




