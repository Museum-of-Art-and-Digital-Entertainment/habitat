;---------------------------------------
;
;	animation cel data
;

brain_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	brain_start_end - brain_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01100000
	byte	0b01000000

	word	brain_data_a - brain_data
	word	brain_data_b - brain_data
	word	brain_data_c - brain_data

brain_start_end:
	byte	0,0,1,1,0,0,2,2


brain_data_a:
	byte	0x04, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	run,3,9
	byte	run,14,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+1
	byte	47
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
	byte	run,12,85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,6,96
	byte	104
	byte	run,4,88
	byte	run,10,96
	byte	128
	byte	128
	byte	run,0x80+2




brain_data_b:
	byte	0x03, 0x1e, 0xff, 0x07, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	165
	byte	run,17,149
	byte	37
	byte	37
	byte	10
	byte	255
	byte	254
	byte	170
	byte	170
	byte	86
	byte	run,24,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	96
	byte	96
	byte	104
	byte	run,17,88
	byte	96
	byte	96
	byte	128




brain_data_c:
	byte	0x03, 0x02, 0xff, 0xf9, 0x00, 0x00
	byte	32
	byte	32
	byte	run,0x80+2
	byte	32
	byte	32




