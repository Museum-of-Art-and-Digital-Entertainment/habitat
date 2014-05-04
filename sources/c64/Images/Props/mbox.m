;---------------------------------------
;
;	animation cel data
;

mbox_data::
	byte	both	+ 1
	byte	0b00000000
	byte	mbox_start_end - mbox_data
	byte	no_cont

	byte	236+right,16+left,255

	byte	0b11110000
	byte	0b11101000

	word	mbox_data_a - mbox_data
	word	mbox_data_b - mbox_data
	word	mbox_data_c - mbox_data
	word	mbox_data_d - mbox_data
	word	mbox_data_e - mbox_data

mbox_start_end:
	byte	0,0,1,1


mbox_data_a:
	byte	cel_box + 0x01, 0x1f, 0x00, 0xff, 0x00, 0x00
	byte	0x09

mbox_data_b:
	byte	cel_box + 0x01, 0x1b, 0x01, 0xfb, 0x00, 0x00
	byte	0xa8

mbox_data_c:
	byte	0x05, 0x10, 0xff, 0x0b, 0x00, 0x00
	byte	170
	byte	run,4,149
	byte	169
	byte	run,8,149
	byte	37
	byte	10
	byte	170
	byte	run,13,101
	byte	149
	byte	170
	byte	170
	byte	run,14,85
	byte	170
	byte	170
	byte	run,13,85
	byte	86
	byte	168
	byte	run,14,128
	byte	run,0x80+2




mbox_data_d:
	byte	0x03, 0x07, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+4
	byte	2
	byte	11
	byte	run,6,2
	byte	170
	byte	run,0x80+1
	byte	168
	byte	run,4,248
	byte	168
	byte	run,0x80+1




mbox_data_e:
	byte	0x02, 0x11, 0x00, 0x15, 0x00, 0x00
	byte	2
	byte	11
	byte	run,15,2
	byte	run,0x80+1
	byte	128
	byte	run,0x80+9
	byte	168
	byte	run,4,248
	byte	168




