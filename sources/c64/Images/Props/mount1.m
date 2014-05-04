;---------------------------------------
;
;	animation cel data
;

mount1_data::
	byte	both	+ 2
	byte	0b11000000
	byte	mount1_start_end - mount1_data
	byte	no_cont

	byte	0,0,0

	byte	0b11000000
	byte	0b10000000
	byte	0b01000000

	word	mount1_data_a - mount1_data
;;	word	mount1_data_b - mount1_data
	word	mount1_data_c - mount1_data

mount1_start_end:
	byte	0,0,1,1,2,2


mount1_data_a:
	byte	cel_trap + col + 0x06, 0x2a, 0x00, 0x1d, 0x00, 0x00
	byte	pat_wild

	byte	0x6*4,	0x06*4,	0,	0x6*4*2-1



mount1_data_c:
	byte	0x04, 0x10, 0x04, 0x1d, 0x00, 0x00

	byte	run,0x80+3
	byte	run,5,2
	byte	run,0x80+8
	byte	run,0x80+1
	byte	128
	byte	130
	byte	162
	byte	235
	byte	235
	byte	255
	byte	255
	byte	191
	byte	191
	byte	47
	byte	47
	byte	11
	byte	11
	byte	2
	byte	2
	byte	2
	byte	10
	byte	8
	byte	46
	byte	175
	byte	191
	byte	255
	byte	255
	byte	254
	byte	254
	byte	248
	byte	248
	byte	224
	byte	224
	byte	128
	byte	128
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	128
	byte	128
	byte	run,0x80+8




