;---------------------------------------
;
;	animation cel data
;

shades0_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	shades0_start_end - shades0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	shades0_data_a - shades0_data
	word	shades0_data_b - shades0_data

shades0_start_end:
	byte	0,0,1,1,0,0,1,1


shades0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	155
	byte	run,6,91
	byte	107
	byte	106
	byte	106
	byte	90
	byte	run,3,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	run,8,255
	byte	234
	byte	run,3,170
	byte	107
	byte	91
	byte	86
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	248
	byte	248
	byte	168
	byte	168
	byte	160
	byte	160
	byte	224
	byte	224
	byte	run,3,128
	byte	run,0x80+2




shades0_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	191
	byte	191
	byte	186
	byte	run,3,170
	byte	175
	byte	175
	byte	171
	byte	42
	byte	37
	byte	41
	byte	10
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,7,255
	byte	186
	byte	run,3,170
	byte	run,3,255
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	248
	byte	248
	byte	184
	byte	run,3,168
	byte	232
	byte	168
	byte	168
	byte	160
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




