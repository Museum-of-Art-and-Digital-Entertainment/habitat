;---------------------------------------
;
;	animation cel data
;

mring_data::
	byte	swing	+ 8
	byte	0b00000000
	byte	mring_start_end - mring_data
	byte	no_cont

	byte	236+right,20+left,252

	byte	0b10000000
	byte	0b10000000
	byte	0b10000000
	byte	0b10000000
	byte	0b10000000
	byte	0b10000000
	byte	0b10000000
	byte	0b10000000
	byte	0b11100000

	word	mring_data_a - mring_data
	word	mring_data_b - mring_data
	word	mring_data_c - mring_data

mring_start_end:
	byte	0,0,cycle+0,8


mring_data_a:
	byte	0x01, 0x04, 0x01, 0xfe, 0x00, 0x00

	byte	8
	byte	166
	byte	38
	byte	8




mring_data_b:
	byte	cel_box + 0x01, 0x09, 0x01, 0x01, 0x00, 0x00
	byte	0x0c

mring_data_c:
	byte	0x03, 0x01, 0x00, 0xfd, 0x00, 0x00

	byte	15
	byte	255
	byte	252




