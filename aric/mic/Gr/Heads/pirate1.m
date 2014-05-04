;---------------------------------------
;
;	animation cel data
;

pirate1_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	pirate1_start_end - pirate1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	pirate1_data_a - pirate1_data
	word	pirate1_data_b - pirate1_data

pirate1_start_end:
	byte	0,0,1,1,0,0,1,1


pirate1_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	run,9,2
	byte	42
	byte	run,5,170
	byte	168
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	154
	byte	85
	byte	85
	byte	86
	byte	run,4,91
	byte	90
	byte	85
	byte	run,7,170
	byte	42
	byte	10
	byte	2
	byte	run,0x80+1
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
	byte	111
	byte	175
	byte	run,10,170
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	224
	byte	232
	byte	run,8,168
	byte	160
	byte	160




pirate1_data_b:
	byte	0x05, 0x1c, 0xfe, 0x05, 0x00, 0x00
	byte	run,0x80+17
	byte	run,5,42
	byte	2
	byte	run,0x80+5
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	175
	byte	170
	byte	175
	byte	run,9,170
	byte	42
	byte	10
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,7,255
	byte	250
	byte	250
	byte	234
	byte	170
	byte	255
	byte	run,11,170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	248
	byte	248
	byte	184
	byte	184
	byte	168
	byte	168
	byte	232
	byte	run,6,170
	byte	run,4,168
	byte	160
	byte	run,0x80+17
	byte	run,5,160
	byte	run,0x80+6




