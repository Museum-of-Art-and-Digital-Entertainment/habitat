;---------------------------------------
;
;	animation cel data
;

grandma0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	grandma0_start_end - grandma0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	grandma0_data_a - grandma0_data
	word	grandma0_data_b - grandma0_data
	word	grandma0_data_c - grandma0_data

grandma0_start_end:
	byte	0,0,1,1,0,0,2,2


grandma0_data_a:
	byte	0x04, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+10
	byte	run,4,2
	byte	run,6,9
	byte	run,6,37
	byte	9
	byte	2
	byte	run,0x80+2
	byte	35
	byte	42
	byte	run,4,47
	byte	42
	byte	37
	byte	149
	byte	86
	byte	91
	byte	91
	byte	86
	byte	run,12,85
	byte	86
	byte	88
	byte	160
	byte	40
	byte	184
	byte	248
	byte	248
	byte	234
	byte	175
	byte	run,4,191
	byte	run,3,255
	byte	170
	byte	191
	byte	191
	byte	107
	byte	86
	byte	run,5,85
	byte	86
	byte	104
	byte	128
	byte	run,0x80+8
	byte	128
	byte	224
	byte	160
	byte	run,3,224
	byte	248
	byte	224
	byte	160
	byte	224
	byte	224
	byte	240
	byte	176
	byte	96
	byte	88
	byte	88
	byte	96
	byte	128
	byte	run,0x80+6




grandma0_data_b:
	byte	0x04, 0x1e, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+14
	byte	run,7,2
	byte	run,0x80+9
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,3,191
	byte	186
	byte	175
	byte	111
	byte	90
	byte	run,3,95
	byte	85
	byte	run,4,149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,3,255
	byte	235
	byte	255
	byte	255
	byte	239
	byte	255
	byte	254
	byte	187
	byte	171
	byte	186
	byte	run,3,255
	byte	run,9,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,3,248
	byte	184
	byte	234
	byte	230
	byte	166
	byte	run,3,214
	byte	86
	byte	run,4,88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+1




grandma0_data_c:
	byte	0x03, 0x0c, 0xff, 0xfd, 0x00, 0x00
	byte	run,0x80+1
	byte	174
	byte	169
	byte	run,4,149
	byte	run,5,85
	byte	128
	byte	86
	byte	run,10,85
	byte	run,0x80+1
	byte	232
	byte	168
	byte	run,3,88
	byte	90
	byte	run,5,86




