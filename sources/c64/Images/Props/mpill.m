;---------------------------------------
;
;	animation cel data
;

mpill_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	236+right,20+left,255

	byte	0b10000000

	word	mpill_data_a - mpill_data


mpill_data_a:
	byte	0x01, 0x03, 0x01, 0xfd, 0x00, 0x00

	byte	32
	byte	184
	byte	32




