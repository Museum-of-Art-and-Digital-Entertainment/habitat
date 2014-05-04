;---------------------------------------
;
;	animation cel data
;

milkman0_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	milkman0_start_end - milkman0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	milkman0_data_a - milkman0_data
	word	milkman0_data_b - milkman0_data
	word	milkman0_data_c - milkman0_data

milkman0_start_end:
	byte	0,0,1,1,0,0,2,2


milkman0_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	run,12,2
	byte	9
	byte	37
	byte	37
	byte	10
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,5,170
	byte	run,4,85
	byte	165
	byte	10
	byte	run,0x80+2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	175
	byte	175
	byte	171
	byte	170
	byte	170
	byte	run,6,85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	224
	byte	224
	byte	170
	byte	170
	byte	168
	byte	160
	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	168




milkman0_data_b:
	byte	0x05, 0x1b, 0xfe, 0x04, 0x00, 0x00
	byte	run,0x80+17
	byte	2
	byte	run,0x80+2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	run,3,175
	byte	run,3,170
	byte	106
	byte	86
	byte	run,4,85
	byte	170
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,12,255
	byte	run,5,170
	byte	run,4,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,248
	byte	run,3,232
	byte	170
	byte	168
	byte	168
	byte	166
	byte	run,4,85
	byte	86
	byte	168
	byte	run,0x80+21
	byte	128
	byte	128
	byte	96
	byte	128
	byte	run,0x80+2




milkman0_data_c:
	byte	0x03, 0x12, 0xff, 0xff, 0x00, 0x00
	byte	2
	byte	run,5,10
	byte	run,7,170
	byte	169
	byte	165
	byte	149
	byte	85
	byte	85
	byte	run,13,170
	byte	run,5,85
	byte	run,0x80+1
	byte	run,5,128
	byte	run,8,160
	byte	96
	byte	run,3,80




