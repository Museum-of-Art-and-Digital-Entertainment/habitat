;---------------------------------------
;
;	animation cel data
;

ccard_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,28+left,252

	byte	0b10000000

	word	ccard_data_a - ccard_data


ccard_data_a:
	byte	0x02, 0x07, 0x00, 0xfe, 0x00, 0x00

	byte	42
	byte	46
	byte	42
	byte	42
	byte	37
	byte	37
	byte	42
	byte	170
	byte	250
	byte	170
	byte	170
	byte	86
	byte	86
	byte	170




