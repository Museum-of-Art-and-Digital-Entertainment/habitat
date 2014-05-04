;---------------------------------------
;
;	animation cel data
;

doll_data::
	byte	out	+ 2
	byte	0b00000000
	byte	doll_start_end - doll_data
	byte	no_cont

	byte	236+right,24+left,255

	byte	0b10011000
	byte	0b01010100
	byte	0b00111000

	word	doll_data_a - doll_data
	word	doll_data_b - doll_data
	word	doll_data_c - doll_data
	word	doll_data_d - doll_data
	word	doll_data_e - doll_data
	word	doll_data_f - doll_data

doll_start_end:
	byte	0,0,cycle+0,2


doll_data_a:
	byte	0x02, 0x06, 0x00, 0xf2, 0x00, 0x00
	byte	run,3,10
	byte	run,3,11
	byte	run,3,160
	byte	run,3,128




doll_data_b:
	byte	0x03, 0x06, 0x00, 0xf2, 0x00, 0x00
	byte	run,3,42
	byte	run,3,46
	byte	128
	byte	130
	byte	138
	byte	46
	byte	190
	byte	248
	byte	run,0x80+2
	byte	128
	byte	160
	byte	160
	byte	128




doll_data_c:
	byte	0x02, 0x06, 0x00, 0xf2, 0x00, 0x00
	byte	8
	byte	42
	byte	170
	byte	168
	byte	190
	byte	47
	byte	run,0x80+1
	byte	40
	byte	40
	byte	32
	byte	run,0x80+1
	byte	128




doll_data_d:
	byte	0x03, 0x12, 0x00, 0x04, 0x00, 0x00
	byte	170
	byte	85
	byte	149
	byte	149
	byte	42
	byte	37
	byte	165
	byte	38
	byte	38
	byte	10
	byte	171
	byte	175
	byte	175
	byte	174
	byte	175
	byte	170
	byte	42
	byte	10
	byte	170
	byte	86
	byte	88
	byte	88
	byte	160
	byte	96
	byte	96
	byte	170
	byte	255
	byte	170
	byte	130
	byte	224
	byte	224
	byte	248
	byte	224
	byte	160
	byte	128
	byte	run,0x80+8
	byte	run,3,128
	byte	run,0x80+8




doll_data_e:
	byte	0x01, 0x0b, 0xff, 0xfd, 0x00, 0x00
	byte	2
	byte	2
	byte	40
	byte	190
	byte	190
	byte	174
	byte	47
	byte	174
	byte	190
	byte	190
	byte	40




doll_data_f:
	byte	0x01, 0x08, 0xff, 0xfa, 0x00, 0x00
	byte	2
	byte	2
	byte	run,0x80+3
	byte	42
	byte	191
	byte	42




