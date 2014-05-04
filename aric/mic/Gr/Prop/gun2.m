;---------------------------------------
;
;	animation cel data
;

gun2_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,20+left,255

	byte	0b10000000

	word	gun2_data_a - gun2_data


gun2_data_a:
	byte	0x03, 0x0a, 0x00, 0xfe, 0x00, 0x00
	byte	run,6,1
	byte	5
	byte	5
	byte	1
	byte	4
	byte	run,3,80
	byte	84
	byte	81
	byte	81
	byte	run,3,85
	byte	run,0x80+7
	byte	run,3,85
	byte	1




