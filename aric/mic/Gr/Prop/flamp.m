;---------------------------------------
;
;	animation cel data
;

flamp_data::
	byte	out	+ 5
	byte	0b00001000
	byte	flamp_start_end - flamp_data
	byte	no_cont

	byte	244+right,20+left,255

	byte	0b11011000
	byte	0b11010000
	byte	0b11111000
	byte	0b11110000
	byte	0b00111000
	byte	0b00110000

	word	flamp_data_a - flamp_data
	word	flamp_data_b - flamp_data
	word	flamp_data_c - flamp_data
	word	flamp_data_d - flamp_data
	word	flamp_data_e - flamp_data

flamp_start_end:
	byte	0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5


flamp_data_a:
	byte	0x03, 0x08, 0x00, 0xdb, 0x00, 0x00

	byte	42
	byte	47
	byte	42
	byte	47
	byte	11
	byte	2
	byte	run,0x80+2
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	191
	byte	46
	byte	170
	byte	254
	byte	170
	byte	254
	byte	248
	byte	224
	byte	128
	byte	run,0x80+1




flamp_data_b:
	byte	cel_box + 0x01, 0x2d, 0x01, 0x08, 0x00, 0x00
	byte	0x2e

flamp_data_c:
	byte	0x03, 0x03, 0xff, 0x09, 0xfe, 0x01

	byte	10
	byte	47
	byte	46
	byte	170
	byte	255
	byte	170
	byte	174
	byte	254
	byte	168




flamp_data_d:
	byte	0x02, 0x15, 0x01, 0x1d, 0x00, 0x00

	byte	174
	byte	42
	byte	46
	byte	run,5,191
	byte	170
	byte	191
	byte	170
	byte	46
	byte	191
	byte	run,3,183
	byte	157
	byte	run,3,191
	byte	42
	byte	run,0x80+3
	byte	run,8,128
	byte	run,0x80+1
	byte	run,8,128
	byte	run,0x80+1




flamp_data_e:
	byte	0x05, 0x14, 0xff, 0x1f, 0x00, 0x00

	byte	10
	byte	run,4,9
	byte	run,5,2
	byte	run,0x80+10
	byte	170
	byte	run,9,85
	byte	run,5,149
	byte	run,4,37
	byte	42
	byte	170
	byte	run,18,85
	byte	170
	byte	170
	byte	run,14,85
	byte	run,4,86
	byte	170
	byte	168
	byte	run,4,88
	byte	run,5,96
	byte	run,5,128
	byte	run,0x80+5




