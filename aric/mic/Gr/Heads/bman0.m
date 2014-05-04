;---------------------------------------
;
;	animation cel data
;

bman0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	bman0_start_end - bman0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	bman0_data_a - bman0_data
	word	bman0_data_b - bman0_data

bman0_start_end:
	byte	0,0,1,1,0,0,1,1


bman0_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+8
	byte	47
	byte	42
	byte	37
	byte	37
	byte	165
	byte	150
	byte	run,13,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	40
	byte	152
	byte	88
	byte	106
	byte	111
	byte	111
	byte	175
	byte	175
	byte	111
	byte	111
	byte	run,4,106
	byte	107
	byte	run,3,106
	byte	90
	byte	86
	byte	85
	byte	101
	byte	150
	byte	168
	byte	160
	byte	160
	byte	128
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	128
	byte	224
	byte	224
	byte	232
	byte	168
	byte	152
	byte	152
	byte	232
	byte	232
	byte	run,5,160
	byte	128
	byte	128
	byte	run,0x80+5




bman0_data_b:
	byte	0x03, 0x1b, 0xff, 0x04, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	run,3,47
	byte	175
	byte	159
	byte	159
	byte	run,3,154
	byte	155
	byte	run,4,154
	byte	153
	byte	169
	byte	170
	byte	170
	byte	168
	byte	160
	byte	128
	byte	255
	byte	254
	byte	170
	byte	170
	byte	238
	byte	255
	byte	255
	byte	171
	byte	255
	byte	255
	byte	239
	byte	155
	byte	90
	byte	154
	byte	238
	byte	239
	byte	run,4,170
	byte	169
	byte	85
	byte	85
	byte	170
	byte	run,0x80+8
	byte	128
	byte	run,3,224
	byte	216
	byte	216
	byte	232
	byte	run,7,152
	byte	168
	byte	run,4,104
	byte	168
	byte	40
	byte	8




