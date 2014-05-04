;---------------------------------------
;
;	animation cel data
;

kitty3_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	kitty3_start_end - kitty3_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	kitty3_data_a - kitty3_data
	word	kitty3_data_b - kitty3_data
	word	kitty3_data_c - kitty3_data

kitty3_start_end:
	byte	0,0,1,1,0,0,2,2


kitty3_data_a:
	byte	0x04, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+1
	byte	1
	byte	5
	byte	5
	byte	run,3,21
	byte	run,10,85
	byte	89
	byte	27
	byte	27
	byte	run,4,11
	byte	10
	byte	run,0x80+1
	byte	64
	byte	run,14,85
	byte	86
	byte	85
	byte	85
	byte	213
	byte	245
	byte	250
	byte	233
	byte	165
	byte	128
	byte	4
	byte	80
	byte	88
	byte	104
	byte	168
	byte	254
	byte	255
	byte	254
	byte	254
	byte	run,3,255
	byte	245
	byte	214
	byte	106
	byte	89
	byte	95
	byte	169
	byte	93
	byte	run,4,85
	byte	84
	byte	run,0x80+7
	byte	128
	byte	160
	byte	248
	byte	254
	byte	254
	byte	250
	byte	248
	byte	224
	byte	160
	byte	228
	byte	212
	byte	148
	byte	84
	byte	84
	byte	80
	byte	80
	byte	64
	byte	run,0x80+2




kitty3_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+2
	byte	1
	byte	1
	byte	run,3,5
	byte	run,8,21
	byte	5
	byte	5
	byte	9
	byte	9
	byte	run,4,11
	byte	10
	byte	3
	byte	run,3,86
	byte	85
	byte	87
	byte	95
	byte	127
	byte	127
	byte	255
	byte	255
	byte	217
	byte	217
	byte	218
	byte	171
	byte	127
	byte	175
	byte	95
	byte	87
	byte	85
	byte	213
	byte	233
	byte	160
	byte	128
	byte	255
	byte	186
	byte	186
	byte	170
	byte	253
	byte	255
	byte	239
	byte	171
	byte	255
	byte	239
	byte	255
	byte	253
	byte	253
	byte	254
	byte	255
	byte	255
	byte	253
	byte	213
	byte	run,4,85
	byte	run,0x80+3
	byte	84
	byte	run,4,85
	byte	213
	byte	245
	byte	245
	byte	253
	byte	253
	byte	run,3,157
	byte	169
	byte	213
	byte	105
	byte	85
	byte	85
	byte	87
	byte	95
	byte	175
	byte	43
	byte	10
	byte	run,0x80+4
	byte	run,3,64
	byte	run,8,80
	byte	64
	byte	64
	byte	run,7,128




kitty3_data_c:
	byte	0x03, 0x12, 0xff, 0xfc, 0x00, 0x00
	byte	run,36,85
	byte	run,18,84




