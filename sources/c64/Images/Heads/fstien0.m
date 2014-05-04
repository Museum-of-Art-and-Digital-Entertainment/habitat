;---------------------------------------
;
;	animation cel data
;

fstien0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	fstien0_start_end - fstien0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	fstien0_data_a - fstien0_data
	word	fstien0_data_b - fstien0_data
	word	fstien0_data_c - fstien0_data

fstien0_start_end:
	byte	0,0,1,1,0,0,2,2


fstien0_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	run,19,2
	byte	run,0x80+2
	byte	37
	byte	42
	byte	41
	byte	41
	byte	165
	byte	run,4,170
	byte	run,4,169
	byte	run,13,170
	byte	40
	byte	152
	byte	88
	byte	106
	byte	149
	byte	149
	byte	150
	byte	150
	byte	149
	byte	run,4,85
	byte	101
	byte	run,3,165
	byte	170
	byte	165
	byte	166
	byte	167
	byte	167
	byte	166
	byte	run,4,170
	byte	run,0x80+3
	byte	128
	byte	run,3,96
	byte	160
	byte	96
	byte	96
	byte	104
	byte	run,4,88
	byte	144
	byte	144
	byte	168
	byte	run,4,88
	byte	96
	byte	run,3,160
	byte	128




fstien0_data_b:
	byte	0x03, 0x1c, 0xff, 0x05, 0x00, 0x00
	byte	1
	byte	2
	byte	34
	byte	42
	byte	34
	byte	9
	byte	9
	byte	38
	byte	38
	byte	165
	byte	run,4,149
	byte	165
	byte	165
	byte	166
	byte	166
	byte	170
	byte	165
	byte	166
	byte	167
	byte	167
	byte	166
	byte	run,3,170
	byte	42
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	85
	byte	101
	byte	86
	byte	170
	byte	85
	byte	85
	byte	169
	byte	run,4,85
	byte	86
	byte	86
	byte	170
	byte	85
	byte	86
	byte	87
	byte	87
	byte	86
	byte	run,4,170
	byte	run,0x80+2
	byte	32
	byte	160
	byte	32
	byte	128
	byte	128
	byte	96
	byte	96
	byte	104
	byte	run,4,88
	byte	run,4,104
	byte	168
	byte	run,5,104
	byte	168
	byte	168
	byte	160
	byte	160




fstien0_data_c:
	byte	0x03, 0x14, 0xff, 0x01, 0x00, 0x00
	byte	run,0x80+1
	byte	run,3,10
	byte	run,16,42
	byte	run,20,170
	byte	run,0x80+3
	byte	run,17,160




