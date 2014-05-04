;---------------------------------------
;
;	animation cel data
;

coldlady0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	coldlady0_start_end - coldlady0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	coldlady0_data_a - coldlady0_data
	word	coldlady0_data_b - coldlady0_data
	word	coldlady0_data_c - coldlady0_data

coldlady0_start_end:
	byte	0,0,1,1,0,0,2,2


coldlady0_data_a:
	byte	0x05, 0x1a, 0xff, 0x04, 0x00, 0x00
	byte	2
	byte	9
	byte	2
	byte	2
	byte	run,0x80+22
	byte	168
	byte	86
	byte	85
	byte	165
	byte	run,17,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+3
	byte	175
	byte	106
	byte	86
	byte	run,20,85
	byte	165
	byte	10
	byte	40
	byte	184
	byte	248
	byte	248
	byte	184
	byte	106
	byte	run,4,91
	byte	90
	byte	86
	byte	86
	byte	run,4,85
	byte	run,3,86
	byte	run,5,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	224
	byte	224
	byte	160
	byte	224
	byte	224
	byte	232
	byte	248
	byte	184
	byte	run,6,160
	byte	96
	byte	96
	byte	88
	byte	88
	byte	96
	byte	128




coldlady0_data_b:
	byte	0x05, 0x1b, 0xfe, 0x04, 0x00, 0x00
	byte	run,0x80+1
	byte	42
	byte	149
	byte	149
	byte	37
	byte	37
	byte	run,15,9
	byte	10
	byte	2
	byte	2
	byte	run,0x80+3
	byte	3
	byte	170
	byte	run,4,86
	byte	90
	byte	111
	byte	111
	byte	175
	byte	run,4,191
	byte	run,6,170
	byte	169
	byte	run,3,85
	byte	149
	byte	37
	byte	10
	byte	255
	byte	run,4,254
	byte	170
	byte	170
	byte	255
	byte	255
	byte	239
	byte	255
	byte	255
	byte	239
	byte	255
	byte	186
	byte	186
	byte	170
	byte	186
	byte	190
	byte	106
	byte	run,6,85
	byte	170
	byte	run,0x80+1
	byte	170
	byte	run,4,85
	byte	149
	byte	229
	byte	229
	byte	233
	byte	run,4,249
	byte	run,7,169
	byte	85
	byte	85
	byte	86
	byte	86
	byte	88
	byte	160
	byte	run,0x80+1
	byte	160
	byte	88
	byte	86
	byte	88
	byte	160
	byte	run,17,128
	byte	run,0x80+4




coldlady0_data_c:
	byte	cel_box + 0x03, 0x13, 0xff, 0xfe, 0x00, 0x00
	byte	0x55

