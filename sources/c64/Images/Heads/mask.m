;---------------------------------------
;
;	animation cel data
;

mask_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	mask_start_end - mask_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	mask_data_a - mask_data
	word	mask_data_b - mask_data
	word	mask_data_c - mask_data

mask_start_end:
	byte	0,0,1,1,0,0,2,2


mask_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+5
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	run,13,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	40
	byte	152
	byte	88
	byte	90
	byte	111
	byte	111
	byte	191
	byte	190
	byte	191
	byte	175
	byte	175
	byte	191
	byte	186
	byte	170
	byte	170
	byte	111
	byte	106
	byte	run,5,85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	224
	byte	160
	byte	224
	byte	160
	byte	224
	byte	224
	byte	232
	byte	248
	byte	248
	byte	184
	byte	168
	byte	160
	byte	160
	byte	run,3,96
	byte	128
	byte	128
	byte	run,0x80+2




mask_data_b:
	byte	0x03, 0x19, 0xff, 0x02, 0x00, 0x00
	byte	3
	byte	run,3,2
	byte	11
	byte	11
	byte	run,4,47
	byte	175
	byte	175
	byte	191
	byte	186
	byte	170
	byte	170
	byte	175
	byte	154
	byte	run,3,149
	byte	37
	byte	37
	byte	9
	byte	10
	byte	255
	byte	254
	byte	170
	byte	170
	byte	255
	byte	255
	byte	239
	byte	255
	byte	171
	byte	255
	byte	239
	byte	239
	byte	255
	byte	254
	byte	186
	byte	170
	byte	171
	byte	170
	byte	run,6,85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	128
	byte	run,4,224
	byte	232
	byte	232
	byte	248
	byte	184
	byte	168
	byte	168
	byte	232
	byte	152
	byte	run,3,88
	byte	96
	byte	96
	byte	128
	byte	128




mask_data_c:
	byte	0x03, 0x12, 0xff, 0xfb, 0x00, 0x00
	byte	run,0x80+4
	byte	1
	byte	1
	byte	run,5,5
	byte	run,7,21
	byte	run,4,84
	byte	run,14,85
	byte	run,0x80+6
	byte	run,6,64
	byte	run,6,80




