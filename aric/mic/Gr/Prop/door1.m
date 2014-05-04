;---------------------------------------
;
;	animation cel data
;

door1_data::
	byte	both	+ 1
	byte	0b01000100
	byte	door1_start_end - door1_data
	byte	no_cont

	byte	0+right,32+left,255

	byte	0b10111110
	byte	0b11111001

	word	door1_data_a - door1_data
	word	door1_data_b - door1_data
	word	door1_data_c - door1_data
	word	door1_data_d - door1_data
	word	door1_data_e - door1_data
	word	door1_data_f - door1_data
	word	door1_data_g - door1_data
	word	door1_data_h - door1_data

door1_start_end:
	byte	0,0,1,1


door1_data_a:
	byte	cel_box + 0x07, 0x01, 0xff, 0xe0, 0x00, 0x00
	byte	pat_glass

door1_data_b:
	byte	cel_box + 0x03+2, 0x45, 0x00, 0x23, 0x00, 0x00
	byte	0xaa

door1_data_c:
	byte	cel_box + 0x01, 0x45, 0xff, 0x23, 0x00, 0x00
	byte	0x2e

door1_data_d:
	byte	cel_box + 0x01, 0x45, 0x05, 0x23, 0x00, 0x00
	byte	0xb8

door1_data_e:
	byte	0x07, 0x04, 0xff, 0x27, 0x00, 0x00
	byte	46
	byte	47
	byte	47
	byte	42
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	184
	byte	248
	byte	248
	byte	168




door1_data_f:
	byte	cel_box + 0x03+2, 0x45, 0x00, 0x23, 0x00, 0x00
	byte	0x55

door1_data_g:
	byte	0x02, 0x10, 0x03, 0x06, 0x00, 0x00
	byte	10
	byte	run,4,11
	byte	10
	byte	10
	byte	run,3,11
	byte	2
	byte	run,0x80+3
	byte	2
	byte	2
	byte	160
	byte	run,4,224
	byte	160
	byte	160
	byte	run,3,224
	byte	128
	byte	run,0x80+3
	byte	128
	byte	128




door1_data_h:
	byte	0x02, 0x43, 0x00, 0x23, 0x00, 0x00
	byte	80
	byte	run,66,85
	byte	run,0x80+2
	byte	80
	byte	run,19,85
	byte	165
	byte	run,4,185
	byte	169
	byte	174
	byte	190
	byte	190
	byte	174
	byte	170
	byte	85
	byte	85
	byte	89
	byte	89
	byte	run,28,85
	byte	80
	byte	run,0x80+1




