;---------------------------------------
;
;	animation cel data
;

ans_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	ans_start_end - ans_data
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b10000000
	byte	0b11000000

	word	ans_data_a - ans_data
	word	ans_data_b - ans_data

ans_start_end:
	byte	0,0,1,1,cycle+0,1


ans_data_a:
	byte	0x04, 0x09, 0x00, 0xfb, 0x00, 0x00
	byte	run,5,170
	byte	255
	byte	170
	byte	42
	byte	10
	byte	run,5,170
	byte	255
	byte	170
	byte	191
	byte	run,6,170
	byte	255
	byte	170
	byte	250
	byte	170
	byte	run,5,168
	byte	252
	byte	168
	byte	160
	byte	128




ans_data_b:
	byte	cel_box + 0x01, 0x02, 0x00, 0xf6, 0x00, 0x00
	byte	0x30

