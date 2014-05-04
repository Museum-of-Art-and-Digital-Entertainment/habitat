;---------------------------------------
;
;	animation cel data
;

head7_data::
	byte	swing	+ 1
	byte	0b01000000
	byte	head7_start_end - head7_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	head7_data_a - head7_data
	word	head7_data_b - head7_data

head7_start_end:
	byte	0,0,1,1,0,0,1,1


head7_data_a:
	byte	0x04, 0x1f, 0x00, 0x09, 0x00, 0x00
	byte	run,0x80+7
	byte	run,11,2
	byte	run,0x80+14
	byte	47
	byte	42
	byte	37
	byte	37
	byte	165
	byte	154
	byte	run,5,85
	byte	run,3,86
	byte	run,3,85
	byte	run,4,149
	byte	run,3,37
	byte	run,3,9
	byte	2
	byte	2
	byte	run,0x80+1
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	run,3,149
	byte	85
	byte	149
	byte	149
	byte	85
	byte	85
	byte	149
	byte	run,7,85
	byte	run,3,86
	byte	run,3,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+3
	byte	128
	byte	run,6,96
	byte	104
	byte	run,4,88
	byte	run,4,96
	byte	run,3,128
	byte	run,0x80+9




head7_data_b:
	byte	0x03, 0x1e, 0xff, 0x07, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	165
	byte	run,9,149
	byte	run,4,37
	byte	run,3,9
	byte	2
	byte	2
	byte	run,0x80+2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	86
	byte	run,21,85
	byte	86
	byte	86
	byte	152
	byte	32
	byte	run,0x80+5
	byte	128
	byte	128
	byte	96
	byte	96
	byte	104
	byte	run,9,88
	byte	run,4,96
	byte	run,3,128
	byte	run,0x80+4




