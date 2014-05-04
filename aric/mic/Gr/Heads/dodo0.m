;---------------------------------------
;
;	animation cel data
;

dodo0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	dodo0_start_end - dodo0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	dodo0_data_a - dodo0_data
	word	dodo0_data_b - dodo0_data
	word	dodo0_data_c - dodo0_data

dodo0_start_end:
	byte	0,0,1,1,0,0,2,2


dodo0_data_a:
	byte	0x06, 0x1c, 0xff, 0x06, 0x00, 0x00
	byte	run,0x80+16
	byte	2
	byte	40
	byte	run,0x80+1
	byte	42
	byte	run,0x80+1
	byte	10
	byte	run,0x80+1
	byte	2
	byte	run,0x80+10
	byte	2
	byte	run,3,10
	byte	42
	byte	42
	byte	run,3,170
	byte	42
	byte	run,3,170
	byte	42
	byte	138
	byte	34
	byte	40
	byte	130
	byte	8
	byte	32
	byte	2
	byte	run,0x80+2
	byte	run,4,42
	byte	run,4,170
	byte	166
	byte	165
	byte	165
	byte	169
	byte	169
	byte	run,9,170
	byte	10
	byte	160
	byte	130
	byte	8
	byte	40
	byte	40
	byte	run,3,168
	byte	166
	byte	166
	byte	149
	byte	149
	byte	85
	byte	170
	byte	165
	byte	101
	byte	85
	byte	105
	byte	165
	byte	166
	byte	166
	byte	169
	byte	169
	byte	run,4,170
	byte	168
	byte	128
	byte	run,0x80+9
	byte	160
	byte	104
	byte	86
	byte	169
	byte	run,3,85
	byte	86
	byte	152
	byte	224
	byte	224
	byte	160
	byte	96
	byte	run,3,128
	byte	run,0x80+14
	byte	run,5,128
	byte	run,0x80+15




dodo0_data_b:
	byte	0x04, 0x1c, 0xfe, 0x05, 0x00, 0x00
	byte	run,0x80+11
	byte	run,4,2
	byte	run,0x80+13
	byte	run,5,2
	byte	10
	byte	10
	byte	41
	byte	37
	byte	166
	byte	169
	byte	89
	byte	85
	byte	153
	byte	166
	byte	169
	byte	169
	byte	166
	byte	169
	byte	42
	byte	170
	byte	42
	byte	138
	byte	34
	byte	8
	byte	10
	byte	2
	byte	run,0x80+1
	byte	run,4,170
	byte	154
	byte	86
	byte	86
	byte	85
	byte	101
	byte	154
	byte	run,4,85
	byte	154
	byte	169
	byte	85
	byte	154
	byte	85
	byte	run,5,170
	byte	136
	byte	run,3,34
	byte	run,0x80+5
	byte	128
	byte	128
	byte	160
	byte	96
	byte	104
	byte	168
	byte	150
	byte	86
	byte	154
	byte	106
	byte	168
	byte	168
	byte	104
	byte	168
	byte	run,3,160
	byte	128
	byte	run,0x80+4
	byte	128




dodo0_data_c:
	byte	0x03, 0x0f, 0xff, 0xfc, 0x00, 0x00
	byte	2
	byte	run,4,10
	byte	run,25,170
	byte	run,0x80+1
	byte	run,3,128
	byte	run,11,168




