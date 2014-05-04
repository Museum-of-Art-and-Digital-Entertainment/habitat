;---------------------------------------
;
;	animation cel data
;

club2_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	club2_start_end - club2_data
	byte	no_cont

	byte	244+right,32+left,253

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000

	word	club2_data_a - club2_data
	word	club2_data_b - club2_data
	word	club2_data_c - club2_data

club2_start_end:
	byte	0,0,1,1,2,2,cycle+0,2


club2_data_a:
	byte	0x06, 0x06, 0xff, 0xfc, 0x00, 0x00
	byte	run,0x80+2
	byte	1
	byte	1
	byte	run,0x80+4
	byte	85
	byte	85
	byte	run,0x80+3
	byte	21
	byte	85
	byte	85
	byte	21
	byte	run,0x80+1
	byte	5
	byte	run,4,85
	byte	5
	byte	run,6,85
	byte	64
	byte	80
	byte	84
	byte	84
	byte	80
	byte	64




club2_data_b:
	byte	0x06, 0x15, 0xff, 0x0c, 0x00, 0x00
	byte	1
	byte	1
	byte	run,0x80+20
	byte	64
	byte	80
	byte	20
	byte	5
	byte	run,3,1
	byte	run,0x80+17
	byte	80
	byte	84
	byte	run,3,85
	byte	21
	byte	5
	byte	run,3,1
	byte	run,0x80+14
	byte	64
	byte	run,7,85
	byte	21
	byte	5
	byte	1
	byte	run,0x80+12
	byte	64
	byte	80
	byte	84
	byte	run,7,85
	byte	21
	byte	1
	byte	run,0x80+13
	byte	run,3,64
	byte	run,4,80
	byte	64




club2_data_c:
	byte	0x02, 0x23, 0xfe, 0x1a, 0x00, 0x00
	byte	run,0x80+8
	byte	run,9,1
	byte	run,15,5
	byte	1
	byte	1
	byte	run,0x80+1
	byte	run,8,64
	byte	run,9,80
	byte	run,15,84
	byte	80
	byte	80
	byte	64




