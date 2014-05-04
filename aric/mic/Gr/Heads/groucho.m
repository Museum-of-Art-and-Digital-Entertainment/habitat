;---------------------------------------
;
;	animation cel data
;

groucho_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	groucho_start_end - groucho_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	groucho_data_a - groucho_data
	word	groucho_data_b - groucho_data
	word	groucho_data_c - groucho_data

groucho_start_end:
	byte	0,0,1,1,0,0,2,2


groucho_data_a:
	byte	0x05, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+11
	byte	run,9,2
	byte	10
	byte	10
	byte	42
	byte	42
	byte	run,0x80+1
	byte	47
	byte	42
	byte	run,4,47
	byte	42
	byte	42
	byte	170
	byte	run,4,171
	byte	run,8,170
	byte	160
	byte	run,0x80+1
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	234
	byte	run,3,175
	byte	171
	byte	171
	byte	170
	byte	170
	byte	128
	byte	run,0x80+5
	byte	128
	byte	224
	byte	234
	byte	run,3,170
	byte	232
	byte	254
	byte	238
	byte	238
	byte	174
	byte	168
	byte	160
	byte	160
	byte	224
	byte	224
	byte	128
	byte	run,0x80+9
	byte	168
	byte	168
	byte	run,0x80+17




groucho_data_b:
	byte	0x05, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	2
	byte	run,0x80+9
	byte	run,6,2
	byte	10
	byte	10
	byte	3
	byte	run,4,2
	byte	11
	byte	171
	byte	170
	byte	47
	byte	47
	byte	175
	byte	191
	byte	170
	byte	165
	byte	165
	byte	186
	byte	186
	byte	170
	byte	175
	byte	174
	byte	170
	byte	170
	byte	160
	byte	128
	byte	run,0x80+1
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	255
	byte	run,4,171
	byte	255
	byte	254
	byte	185
	byte	185
	byte	238
	byte	254
	byte	254
	byte	255
	byte	run,3,170
	byte	run,0x80+8
	byte	128
	byte	128
	byte	run,3,224
	byte	232
	byte	248
	byte	168
	byte	104
	byte	104
	byte	184
	byte	184
	byte	170
	byte	234
	byte	234
	byte	170
	byte	170
	byte	42
	byte	10
	byte	2
	byte	run,0x80+23
	byte	128
	byte	128




groucho_data_c:
	byte	0x03, 0x0c, 0xff, 0xfd, 0x00, 0x00
	byte	run,12,42
	byte	run,12,170
	byte	run,12,160




