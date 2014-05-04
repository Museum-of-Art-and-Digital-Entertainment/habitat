;---------------------------------------
;
;	animation cel data
;

fhippie0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	fhippie0_start_end - fhippie0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	fhippie0_data_a - fhippie0_data
	word	fhippie0_data_b - fhippie0_data
	word	fhippie0_data_c - fhippie0_data

fhippie0_start_end:
	byte	0,0,1,1,0,0,2,2


fhippie0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	10
	byte	42
	byte	run,13,10
	byte	run,3,2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	170
	byte	171
	byte	run,14,170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	42
	byte	40
	byte	184
	byte	248
	byte	250
	byte	251
	byte	175
	byte	255
	byte	254
	byte	249
	byte	249
	byte	254
	byte	255
	byte	255
	byte	250
	byte	187
	byte	190
	byte	175
	byte	175
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	168
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	176
	byte	64
	byte	64
	byte	176
	byte	224
	byte	248
	byte	184
	byte	176
	byte	224
	byte	224
	byte	160
	byte	224
	byte	run,4,128
	byte	run,0x80+2




fhippie0_data_b:
	byte	0x05, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	10
	byte	42
	byte	10
	byte	run,12,2
	byte	run,0x80+6
	byte	3
	byte	2
	byte	2
	byte	162
	byte	171
	byte	175
	byte	175
	byte	190
	byte	185
	byte	185
	byte	190
	byte	191
	byte	190
	byte	186
	byte	175
	byte	187
	byte	190
	byte	175
	byte	170
	byte	149
	byte	149
	byte	42
	byte	42
	byte	10
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	255
	byte	255
	byte	171
	byte	86
	byte	85
	byte	169
	byte	254
	byte	239
	byte	254
	byte	186
	byte	255
	byte	255
	byte	254
	byte	255
	byte	186
	byte	85
	byte	85
	byte	run,4,170
	byte	run,0x80+3
	byte	42
	byte	170
	byte	234
	byte	234
	byte	250
	byte	186
	byte	186
	byte	run,3,250
	byte	186
	byte	234
	byte	186
	byte	250
	byte	234
	byte	170
	byte	88
	byte	88
	byte	160
	byte	160
	byte	128
	byte	run,0x80+5
	byte	128
	byte	160
	byte	128
	byte	run,0x80+18




fhippie0_data_c:
	byte	cel_box + 0x03, 0x0f, 0xff, 0xfc, 0x00, 0x00
	byte	0xaa

