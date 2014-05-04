;---------------------------------------
;
;	animation cel data
;

luggages_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	luggages_start_end - luggages_data
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b11000000
	byte	0b11100000

	word	luggages_data_a - luggages_data
	word	luggages_data_b - luggages_data
	word	luggages_data_c - luggages_data

luggages_start_end:
	byte	0,0,1,1


luggages_data_a:
	byte	cel_box + both_bord + 0x04, 0x11, 0xff, 0xf6, 0x00, 0x00
	byte	0q1111

luggages_data_b:
	byte	0x02, 0x04, 0x00, 0xfa, 0x00, 0x00

	byte	32
	byte	42
	byte	37
	byte	10
	byte	8
	byte	168
	byte	88
	byte	160




luggages_data_c:
	byte	cel_box + 0x04, 0x0d, 0xff, 0xf6, 0x00, 0x00
	byte	0xaa

