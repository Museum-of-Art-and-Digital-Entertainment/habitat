;---------------------------------------
;
;	animation cel data
;

keystone0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	keystone0_start_end - keystone0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	keystone0_data_a - keystone0_data
	word	keystone0_data_b - keystone0_data
	word	keystone0_data_c - keystone0_data

keystone0_start_end:
	byte	0,0,1,1,0,0,2,2


keystone0_data_a:
	byte	0x04, 0x1f, 0x00, 0x09, 0x00, 0x00
	byte	run,0x80+10
	byte	2
	byte	2
	byte	42
	byte	9
	byte	2
	byte	run,0x80+17
	byte	47
	byte	42
	byte	run,4,47
	byte	42
	byte	170
	byte	171
	byte	171
	byte	170
	byte	170
	byte	85
	byte	run,3,170
	byte	150
	byte	run,8,149
	byte	run,3,37
	byte	9
	byte	2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	191
	byte	191
	byte	255
	byte	250
	byte	234
	byte	170
	byte	170
	byte	85
	byte	149
	byte	run,3,170
	byte	85
	byte	run,3,86
	byte	run,7,85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	128
	byte	run,3,224
	byte	run,3,232
	byte	254
	byte	190
	byte	106
	byte	86
	byte	168
	byte	run,4,160
	byte	224
	byte	224
	byte	160
	byte	run,4,96
	byte	128
	byte	128
	byte	run,0x80+2




keystone0_data_b:
	byte	0x05, 0x1f, 0xfe, 0x08, 0x00, 0x00
	byte	run,0x80+12
	byte	42
	byte	9
	byte	2
	byte	run,0x80+16
	byte	3
	byte	run,4,2
	byte	11
	byte	43
	byte	run,3,175
	byte	191
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	42
	byte	42
	byte	37
	byte	37
	byte	38
	byte	38
	byte	run,5,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+1
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,3,255
	byte	run,3,171
	byte	255
	byte	170
	byte	90
	byte	85
	byte	165
	byte	170
	byte	170
	byte	106
	byte	185
	byte	254
	byte	246
	byte	169
	byte	run,6,85
	byte	86
	byte	168
	byte	run,0x80+5
	byte	128
	byte	160
	byte	run,3,232
	byte	248
	byte	168
	byte	168
	byte	170
	byte	85
	byte	86
	byte	168
	byte	160
	byte	160
	byte	run,8,96
	byte	128
	byte	128
	byte	run,0x80+15
	byte	160
	byte	128
	byte	run,0x80+16




keystone0_data_c:
	byte	0x03, 0x11, 0xff, 0x00, 0x00, 0x00
	byte	46
	byte	run,5,170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	42
	byte	42
	byte	run,5,37
	byte	254
	byte	run,5,170
	byte	85
	byte	85
	byte	165
	byte	run,3,170
	byte	106
	byte	run,4,85
	byte	224
	byte	run,5,168
	byte	170
	byte	85
	byte	85
	byte	170
	byte	168
	byte	160
	byte	160
	byte	run,4,96




