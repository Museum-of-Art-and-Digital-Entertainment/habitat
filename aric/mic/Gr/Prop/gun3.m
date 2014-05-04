;---------------------------------------
;
;	animation cel data
;

gun3_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,20+left,255

	byte	0b10000000

	word	gun3_data_a - gun3_data


gun3_data_a:
	byte	0x04, 0x0b, 0x00, 0xfe, 0x00, 0x00
	byte	run,4,5
	byte	1
	byte	1
	byte	run,0x80+2
	byte	1
	byte	1
	byte	run,0x80+1
	byte	80
	byte	80
	byte	64
	byte	84
	byte	81
	byte	81
	byte	run,3,85
	byte	21
	byte	run,0x80+7
	byte	64
	byte	80
	byte	85
	byte	85
	byte	run,0x80+9
	byte	80
	byte	80
	byte	16




