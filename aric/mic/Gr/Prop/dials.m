;---------------------------------------
;
;	animation cel data
;

dials_data::
	byte	out	+ 5
	byte	0b00000000
	byte	dials_start_end - dials_data
	byte	no_cont

	byte	240+right,24+left,210

	byte	0b10100000
	byte	0b10010000
	byte	0b10001000
	byte	0b01100000
	byte	0b01010000
	byte	0b01001000

	word	dials_data_a - dials_data
	word	dials_data_b - dials_data
	word	dials_data_c - dials_data
	word	dials_data_d - dials_data
	word	dials_data_e - dials_data

dials_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


dials_data_a:
	byte	0x03, 0x0e, 0xfe, 0x13, 0x00, 0x00
	byte	2
	byte	9
	byte	37
	byte	42
	byte	run,6,155
	byte	38
	byte	37
	byte	9
	byte	2
	byte	170
	byte	85
	byte	169
	byte	170
	byte	run,6,255
	byte	254
	byte	169
	byte	85
	byte	170
	byte	run,0x80+1
	byte	128
	byte	96
	byte	96
	byte	run,6,152
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




dials_data_b:
	byte	0x05, 0x0b, 0xfd, 0x11, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	2
	byte	run,0x80+5
	byte	40
	byte	46
	byte	191
	byte	191
	byte	255
	byte	255
	byte	191
	byte	47
	byte	10
	byte	run,0x80+1
	byte	32
	byte	run,0x80+1
	byte	170
	byte	run,7,255
	byte	170
	byte	run,0x80+1
	byte	168
	byte	248
	byte	254
	byte	254
	byte	255
	byte	255
	byte	254
	byte	248
	byte	160
	byte	run,0x80+6
	byte	128
	byte	128
	byte	run,0x80+4




dials_data_c:
	byte	0x02, 0x05, 0xfe, 0x0e, 0x00, 0x00
	byte	3
	byte	3
	byte	19
	byte	18
	byte	18
	byte	224
	byte	128
	byte	128
	byte	run,0x80+2




dials_data_d:
	byte	cel_box + 0x01, 0x05, 0xff, 0x0e, 0x00, 0x00
	byte	0x20

dials_data_e:
	byte	0x01, 0x05, 0xff, 0x0e, 0x00, 0x00
	byte	47
	byte	11
	byte	11
	byte	2
	byte	2




