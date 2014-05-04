;---------------------------------------
;
;	animation cel data
;

umbrella_data::
	byte	out	+ 1
	byte	0b00000000
	byte	umbrella_start_end - umbrella_data
	byte	no_cont

	byte	240+right,36+left,1

	byte	0b11000000
	byte	0b10100000

	word	umbrella_data_a - umbrella_data
	word	umbrella_data_b - umbrella_data
	word	umbrella_data_c - umbrella_data

umbrella_start_end:
	byte	0,0,1,1


umbrella_data_a:
	byte	0x02, 0x33, 0x00, 0x25, 0x00, 0x00
	byte	10
	byte	47
	byte	191
	byte	186
	byte	run,5,184
	byte	32
	byte	run,0x80+41
	byte	128
	byte	224
	byte	248
	byte	248
	byte	run,6,184
	byte	32
	byte	32
	byte	168
	byte	run,38,32




umbrella_data_b:
	byte	cel_box + 0x01, 0x23, 0x01, 0x23, 0x00, 0x00
	byte	0x54

umbrella_data_c:
	byte	0x09, 0x0c, 0xfd, 0x23, 0x00, 0x00
	byte	16
	byte	16
	byte	20
	byte	5
	byte	1
	byte	run,0x80+7
	byte	1
	byte	1
	byte	5
	byte	run,3,85
	byte	21
	byte	5
	byte	run,0x80+6
	byte	64
	byte	run,6,85
	byte	5
	byte	run,0x80+2
	byte	16
	byte	16
	byte	84
	byte	run,8,85
	byte	1
	byte	run,0x80+3
	byte	run,9,85
	byte	16
	byte	16
	byte	84
	byte	run,7,85
	byte	84
	byte	run,0x80+1
	byte	1
	byte	1
	byte	5
	byte	run,5,85
	byte	84
	byte	64
	byte	run,0x80+4
	byte	64
	byte	85
	byte	85
	byte	84
	byte	80
	byte	64
	byte	run,0x80+4
	byte	16
	byte	16
	byte	80
	byte	64
	byte	run,0x80+8




