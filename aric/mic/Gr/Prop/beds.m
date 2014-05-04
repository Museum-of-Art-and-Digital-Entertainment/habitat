;---------------------------------------
;
;	animation cel data
;

beds_data::
	byte	both	+ 1
	byte	0b00100000
	byte	beds_start_end - beds_data
	byte	beds_contents_xy - beds_data

	byte	252+right,32+left,255

	byte	0b11111100
	byte	0b11101100

	word	beds_data_a - beds_data
	word	beds_data_b - beds_data
	word	beds_data_c - beds_data
	word	beds_data_d - beds_data
	word	beds_data_e - beds_data
	word	beds_data_f - beds_data

beds_start_end:
	byte	0,0,1,1

beds_contents_xy:
	byte	249,13,253,13


beds_data_a:
	byte	cel_box + 0x01, 0x29, 0xf7, 0x00, 0x00, 0x00
	byte	0xbe

beds_data_b:
	byte	cel_box + 0x01, 0x35, 0x04, 0x0c, 0x00, 0x00
	byte	0xbe

beds_data_c:
	byte	cel_box + tb_bord + 0x0c, 0x13, 0xf8, 0xf3, 0x00, 0x00
	byte	0q1111

beds_data_d:
	byte	0x05, 0x08, 0xff, 0xfa, 0x00, 0x00

	byte	run,0x80+1
	byte	2
	byte	11
	byte	47
	byte	11
	byte	2
	byte	run,0x80+2
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	255
	byte	175
	byte	10
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,3,255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	255
	byte	254
	byte	168
	byte	128
	byte	224
	byte	248
	byte	190
	byte	248
	byte	224
	byte	128
	byte	run,0x80+1




beds_data_e:
	byte	0x03, 0x04, 0xf6, 0x04, 0x00, 0x00

	byte	run,4,2
	byte	255
	byte	170
	byte	255
	byte	170
	byte	run,4,128




beds_data_f:
	byte	0x03, 0x04, 0x03, 0x10, 0x00, 0x00

	byte	run,4,2
	byte	255
	byte	170
	byte	255
	byte	170
	byte	run,4,128




