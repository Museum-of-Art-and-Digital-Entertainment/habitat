;---------------------------------------
;
;	animation cel data
;

mic0_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	236+right,20+left,255

	byte	0b10000000

	word	mic0_data_a - mic0_data


mic0_data_a:
	byte	0x02, 0x14, 0x01, 0x04, 0x00, 0x00

	byte	8
	byte	run,9,38
	byte	42
	byte	42
	byte	46
	byte	187
	byte	174
	byte	187
	byte	174
	byte	187
	byte	46
	byte	8
	byte	run,0x80+13
	byte	run,5,128
	byte	run,0x80+2




