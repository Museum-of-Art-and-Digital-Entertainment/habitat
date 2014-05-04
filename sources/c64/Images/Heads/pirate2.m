;---------------------------------------
;
;	animation cel data
;

pirate2_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	pirate2_start_end - pirate2_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	pirate2_data_a - pirate2_data
	word	pirate2_data_b - pirate2_data
	word	pirate2_data_c - pirate2_data

pirate2_start_end:
	byte	0,0,1,1,0,0,2,2


pirate2_data_a:
	byte	0x04, 0x20, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	run,0x80+5
	byte	run,9,2
	byte	42
	byte	run,4,149
	byte	150
	byte	168
	byte	run,0x80+10
	byte	47
	byte	170
	byte	171
	byte	171
	byte	run,5,170
	byte	run,4,171
	byte	run,3,170
	byte	run,5,85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+3
	byte	2
	byte	2
	byte	10
	byte	42
	byte	170
	byte	run,4,234
	byte	170
	byte	170
	byte	174
	byte	254
	byte	255
	byte	255
	byte	254
	byte	238
	byte	175
	byte	170
	byte	175
	byte	90
	byte	run,8,85
	byte	170
	byte	run,4,128
	byte	run,5,160
	byte	224
	byte	248
	byte	248
	byte	232
	byte	184
	byte	168
	byte	170
	byte	254
	byte	254
	byte	248
	byte	248
	byte	160
	byte	232
	byte	152
	byte	run,7,88
	byte	96
	byte	160




pirate2_data_b:
	byte	0x05, 0x20, 0xfe, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	run,0x80+13
	byte	42
	byte	run,3,37
	byte	41
	byte	2
	byte	run,0x80+6
	byte	run,3,2
	byte	run,4,10
	byte	138
	byte	run,4,170
	byte	174
	byte	191
	byte	191
	byte	190
	byte	190
	byte	175
	byte	170
	byte	175
	byte	170
	byte	run,5,85
	byte	run,3,149
	byte	37
	byte	10
	byte	136
	byte	136
	byte	138
	byte	138
	byte	run,4,170
	byte	254
	byte	254
	byte	238
	byte	254
	byte	170
	byte	170
	byte	187
	byte	255
	byte	250
	byte	250
	byte	234
	byte	170
	byte	255
	byte	170
	byte	run,9,85
	byte	170
	byte	run,0x80+4
	byte	run,3,128
	byte	130
	byte	136
	byte	run,3,168
	byte	232
	byte	232
	byte	248
	byte	248
	byte	184
	byte	184
	byte	168
	byte	168
	byte	232
	byte	170
	byte	run,4,85
	byte	86
	byte	run,3,88
	byte	96
	byte	128
	byte	run,0x80+21
	byte	160
	byte	run,3,96
	byte	160
	byte	run,0x80+6




pirate2_data_c:
	byte	cel_box + 0x03, 0x0d, 0xff, 0xfa, 0x00, 0x00
	byte	0xaa

