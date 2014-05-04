;---------------------------------------
;
;	animation cel data
;

executioner0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	executioner0_start_end - executioner0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	executioner0_data_a - executioner0_data
	word	executioner0_data_b - executioner0_data
	word	executioner0_data_c - executioner0_data

executioner0_start_end:
	byte	0,0,1,1,0,0,2,2


executioner0_data_a:
	byte	0x05, 0x1a, 0xff, 0x04, 0x00, 0x00
	byte	run,0x80+20
	byte	8
	byte	2
	byte	2
	byte	run,0x80+10
	byte	run,10,2
	byte	run,4,10
	byte	42
	byte	170
	byte	170
	byte	42
	byte	10
	byte	run,0x80+1
	byte	47
	byte	run,3,42
	byte	run,21,170
	byte	40
	byte	184
	byte	248
	byte	run,12,170
	byte	171
	byte	170
	byte	170
	byte	169
	byte	165
	byte	165
	byte	169
	byte	170
	byte	168
	byte	128
	byte	run,0x80+4
	byte	128
	byte	run,6,160
	byte	run,4,168
	byte	232
	byte	224
	byte	run,3,160
	byte	128
	byte	64
	byte	128
	byte	run,0x80+4




executioner0_data_b:
	byte	0x04, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+14
	byte	run,3,2
	byte	130
	byte	34
	byte	34
	byte	run,3,42
	byte	10
	byte	10
	byte	2
	byte	3
	byte	2
	byte	2
	byte	run,3,42
	byte	run,9,170
	byte	171
	byte	170
	byte	170
	byte	169
	byte	165
	byte	165
	byte	169
	byte	run,4,170
	byte	255
	byte	254
	byte	run,12,170
	byte	238
	byte	239
	byte	170
	byte	154
	byte	153
	byte	153
	byte	85
	byte	153
	byte	run,3,170
	byte	168
	byte	run,0x80+3
	byte	run,3,160
	byte	run,13,168
	byte	104
	byte	104
	byte	160
	byte	160
	byte	128
	byte	run,0x80+2




executioner0_data_c:
	byte	0x03, 0x08, 0xff, 0xff, 0x00, 0x00
	byte	run,8,10
	byte	run,8,170
	byte	run,8,128




