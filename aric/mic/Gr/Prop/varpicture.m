;---------------------------------------
;
;	animation cel data
;

varpicture_data::
	byte	out	+ 5
	byte	0b11000000
	byte	varpicture_start_end - varpicture_data
	byte	no_cont

	byte	244+right,24+left,255

	byte	0b10111100
	byte	0b11110010
	byte	0b11000000
	byte	0b10001100
	byte	0b11010101
	byte	0b11110111

	word	varpicture_data_a - varpicture_data
	word	varpicture_data_b - varpicture_data
	word	varpicture_data_c - varpicture_data
	word	varpicture_data_d - varpicture_data
	word	varpicture_data_e - varpicture_data
	word	varpicture_data_f - varpicture_data
	word	varpicture_data_g - varpicture_data
	word	varpicture_data_h - varpicture_data

varpicture_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


varpicture_data_a:
	byte	cel_box + 0x04, 0x18, 0xfa, 0x27, 0x00, 0x00
	byte	0x55

varpicture_data_b:
	byte	cel_box + 0x08, 0x18, 0xfe, 0x27, 0x00, 0x00
	byte	0x55

varpicture_data_c:
	byte	cel_box + 0x04, 0x01, 0xfa, 0x27, 0x00, 0x00
	byte	0xaa

varpicture_data_d:
	byte	cel_box + 0x01, 0x18, 0xfa, 0x27, 0x00, 0x00
	byte	0x80

varpicture_data_e:
	byte	cel_box + 0x01, 0x18, 0xfd, 0x27, 0x00, 0x00
	byte	0x02

varpicture_data_f:
	byte	cel_box + 0x04, 0x01, 0xfa, 0x10, 0x00, 0x00
	byte	0xaa

varpicture_data_g:
	byte	cel_box + 0x08, 0x01, 0xfe, 0x27, 0x00, 0x00
	byte	0xaa

varpicture_data_h:
	byte	cel_box + 0x08, 0x01, 0xfe, 0x10, 0x00, 0x00
	byte	0xaa

