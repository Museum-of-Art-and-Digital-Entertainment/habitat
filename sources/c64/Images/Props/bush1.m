;---------------------------------------
;
;	animation cel data
;

bush1_data::
	byte	out	+ 1
	byte	0b01000000
	byte	bush1_start_end - bush1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b11000000
	byte	0b01000000

	word	bush1_data_a - bush1_data
	word	bush1_data_b - bush1_data

bush1_start_end:
	byte	0,0,1,1


bush1_data_a:
	byte	0x03, 0x08, 0xff, 0xfc, 0x00, 0x00
	byte	8
	byte	run,0x80+7
	byte	170
	byte	2
	byte	run,0x80+6
	byte	42
	byte	168
	byte	run,6,160




bush1_data_b:
	byte	0x07, 0x24, 0xfe, 0x20, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	9
	byte	9
	byte	run,4,37
	byte	run,9,149
	byte	run,3,37
	byte	9
	byte	9
	byte	run,3,2
	byte	run,0x80+7
	byte	2
	byte	9
	byte	37
	byte	149
	byte	149
	byte	run,24,85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+2
	byte	10
	byte	37
	byte	149
	byte	run,31,85
	byte	169
	byte	2
	byte	106
	byte	run,33,85
	byte	86
	byte	168
	byte	32
	byte	152
	byte	86
	byte	run,29,85
	byte	90
	byte	96
	byte	128
	byte	run,0x80+3
	byte	128
	byte	96
	byte	96
	byte	88
	byte	run,3,86
	byte	run,18,85
	byte	86
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+13
	byte	run,5,128
	byte	run,11,96
	byte	128
	byte	128
	byte	run,0x80+9




