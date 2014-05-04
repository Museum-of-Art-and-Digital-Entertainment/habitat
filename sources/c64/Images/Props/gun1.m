;---------------------------------------
;
;	animation cel data
;

gun1_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,20+left,255

	byte	0b10000000

	word	gun1_data_a - gun1_data


gun1_data_a:
	byte	0x03, 0x0a, 0x00, 0xfd, 0x00, 0x00
	byte	run,4,5
	byte	run,3,1
	byte	5
	byte	5
	byte	4
	byte	run,3,64
	byte	84
	byte	81
	byte	81
	byte	run,3,85
	byte	run,0x80+7
	byte	80
	byte	85
	byte	85
	byte	1




