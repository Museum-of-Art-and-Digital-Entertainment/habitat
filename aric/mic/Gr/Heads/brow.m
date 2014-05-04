;---------------------------------------
;
;	animation cel data
;

brow_data::
	byte	swing	+ 1
	byte	0b01000000
	byte	brow_start_end - brow_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	brow_data_a - brow_data
	word	brow_data_b - brow_data

brow_start_end:
	byte	0,0,1,1,0,0,1,1


brow_data_a:
	byte	0x05, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	run,3,9
	byte	run,14,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+1
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	85
	byte	85
	byte	86
	byte	run,4,89
	byte	90
	byte	run,13,85
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
	byte	85
	byte	106
	byte	run,10,85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,6,96
	byte	104
	byte	run,4,88
	byte	96
	byte	170
	byte	85
	byte	85
	byte	86
	byte	86
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+18
	byte	run,3,128
	byte	run,0x80+10




brow_data_b:
	byte	0x04, 0x1e, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+17
	byte	run,6,2
	byte	run,0x80+7
	byte	1
	byte	run,4,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	165
	byte	run,7,149
	byte	170
	byte	run,5,85
	byte	run,4,149
	byte	37
	byte	37
	byte	10
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	run,12,85
	byte	170
	byte	run,11,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	96
	byte	96
	byte	104
	byte	run,7,88
	byte	170
	byte	run,5,86
	byte	run,4,88
	byte	96
	byte	96
	byte	128




