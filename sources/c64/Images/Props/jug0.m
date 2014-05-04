;---------------------------------------
;
;	animation cel data
;

jug0_data::
	byte	out	+ 3
	byte	0b00000000
	byte	jug0_start_end - jug0_data
	byte	no_cont+0x01

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000
	byte	0b00010000

	word	jug0_data_a - jug0_data
	word	jug0_data_b - jug0_data
	word	jug0_data_c - jug0_data
	word	jug0_data_d - jug0_data

jug0_start_end:
	byte	0,0,cycle+1,3


jug0_data_a:
	byte	0x03, 0x0c, 0x00, 0x03, 0x00, 0x00
	byte	5
	byte	run,4,21
	byte	5
	byte	run,0x80+1
	byte	run,4,1
	byte	run,0x80+1
	byte	1
	byte	run,4,69
	byte	1
	byte	80
	byte	run,4,84
	byte	80
	byte	64
	byte	run,4,80
	byte	64
	byte	run,0x80+6




jug0_data_b:
	byte	0x03, 0x1d, 0x00, 0x16, 0x00, 0x00
	byte	5
	byte	run,5,21
	byte	5
	byte	run,0x80+15
	byte	20
	byte	run,5,85
	byte	20
	byte	run,0x80+1
	byte	run,5,64
	byte	run,0x80+35
	byte	20
	byte	run,5,85
	byte	20
	byte	run,0x80+10




jug0_data_c:
	byte	0x03, 0x1d, 0x00, 0x15, 0x00, 0x00
	byte	run,0x80+15
	byte	20
	byte	run,5,85
	byte	20
	byte	run,0x80+7
	byte	20
	byte	run,4,85
	byte	20
	byte	run,0x80+44
	byte	20
	byte	run,6,85
	byte	20




jug0_data_d:
	byte	0x03, 0x24, 0x00, 0x1d, 0x00, 0x00
	byte	run,0x80+6
	byte	20
	byte	run,5,85
	byte	20
	byte	run,0x80+24
	byte	run,5,1
	byte	run,0x80+23
	byte	1
	byte	run,5,5
	byte	1
	byte	80
	byte	run,5,84
	byte	80
	byte	run,0x80+22
	byte	64
	byte	run,5,80
	byte	64




