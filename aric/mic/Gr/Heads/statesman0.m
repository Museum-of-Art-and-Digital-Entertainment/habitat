;---------------------------------------
;
;	animation cel data
;

statesman0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	statesman0_start_end - statesman0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	statesman0_data_a - statesman0_data
	word	statesman0_data_b - statesman0_data
	word	statesman0_data_c - statesman0_data

statesman0_start_end:
	byte	0,0,1,1,0,0,2,2


statesman0_data_a:
	byte	0x05, 0x20, 0x00, 0x0a, 0x00, 0x01
	byte	run,0x80+7
	byte	2
	byte	run,5,1
	byte	170
	byte	170
	byte	run,4,2
	byte	run,11,10
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	154
	byte	85
	byte	85
	byte	86
	byte	87
	byte	87
	byte	85
	byte	169
	byte	run,10,170
	byte	run,4,169
	byte	170
	byte	128
	byte	run,0x80+2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	175
	byte	run,3,191
	byte	190
	byte	255
	byte	255
	byte	247
	byte	87
	byte	87
	byte	169
	byte	run,3,170
	byte	run,5,90
	byte	run,5,106
	byte	170
	byte	170
	byte	10
	byte	2
	byte	run,0x80+3
	byte	128
	byte	232
	byte	248
	byte	248
	byte	224
	byte	170
	byte	224
	byte	232
	byte	248
	byte	184
	byte	128
	byte	80
	byte	160
	byte	170
	byte	170
	byte	162
	byte	run,7,128
	byte	run,0x80+23
	byte	160
	byte	160
	byte	run,0x80+13




statesman0_data_b:
	byte	0x05, 0x20, 0xfe, 0x09, 0x00, 0x00
	byte	run,0x80+12
	byte	run,3,2
	byte	10
	byte	42
	byte	168
	byte	128
	byte	run,0x80+13
	byte	3
	byte	2
	byte	2
	byte	10
	byte	47
	byte	47
	byte	191
	byte	190
	byte	190
	byte	191
	byte	127
	byte	255
	byte	255
	byte	95
	byte	94
	byte	149
	byte	run,3,170
	byte	run,11,42
	byte	10
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	238
	byte	255
	byte	255
	byte	175
	byte	90
	byte	191
	byte	239
	byte	255
	byte	187
	byte	187
	byte	86
	byte	253
	byte	run,4,170
	byte	169
	byte	run,10,165
	byte	166
	byte	run,0x80+5
	byte	128
	byte	224
	byte	224
	byte	170
	byte	224
	byte	208
	byte	240
	byte	248
	byte	216
	byte	88
	byte	90
	byte	170
	byte	170
	byte	168
	byte	run,12,160
	byte	run,0x80+9
	byte	128
	byte	run,0x80+7
	byte	128
	byte	168
	byte	42
	byte	2
	byte	run,0x80+12




statesman0_data_c:
	byte	0x03, 0x0c, 0xff, 0xf9, 0x00, 0x00
	byte	10
	byte	37
	byte	run,4,149
	byte	run,3,85
	byte	90
	byte	170
	byte	42
	byte	170
	byte	149
	byte	run,7,85
	byte	run,3,170
	byte	128
	byte	128
	byte	run,4,96
	byte	80
	byte	80
	byte	88
	byte	152
	byte	168
	byte	160




