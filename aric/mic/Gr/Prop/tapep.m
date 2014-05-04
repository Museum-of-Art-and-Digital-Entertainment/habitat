;---------------------------------------
;
;	animation cel data
;

tapep_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	244+right,24+left,255

	byte	0b10000000

	word	tapep_data_a - tapep_data


tapep_data_a:
	byte	0x05, 0x13, 0xff, 0xf7, 0x00, 0x00
	byte	42
	byte	170
	byte	175
	byte	170
	byte	191
	byte	170
	byte	191
	byte	170
	byte	191
	byte	170
	byte	175
	byte	170
	byte	149
	byte	170
	byte	42
	byte	run,3,2
	byte	run,0x80+1
	byte	run,3,170
	byte	171
	byte	235
	byte	170
	byte	233
	byte	169
	byte	233
	byte	169
	byte	169
	byte	170
	byte	85
	byte	170
	byte	187
	byte	34
	byte	run,0x80+1
	byte	run,5,170
	byte	255
	byte	255
	byte	170
	byte	85
	byte	85
	byte	153
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	run,0x80+2
	byte	run,4,170
	byte	171
	byte	170
	byte	175
	byte	170
	byte	175
	byte	170
	byte	175
	byte	170
	byte	171
	byte	170
	byte	85
	byte	170
	byte	186
	byte	34
	byte	2
	byte	170
	byte	168
	byte	160
	byte	168
	byte	232
	byte	168
	byte	248
	byte	168
	byte	248
	byte	168
	byte	248
	byte	168
	byte	232
	byte	168
	byte	88
	byte	168
	byte	160
	byte	run,0x80+4




