;---------------------------------------
;
;	animation cel data
;

gren_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000

	word	gren_data_a - gren_data


gren_data_a:
	byte	0x02, 0x0f, 0x00, 0x00, 0x00, 0x00

	byte	10
	byte	42
	byte	42
	byte	46
	byte	42
	byte	46
	byte	42
	byte	46
	byte	43
	byte	10
	byte	2
	byte	34
	byte	138
	byte	138
	byte	32
	byte	128
	byte	160
	byte	run,7,162
	byte	130
	byte	138
	byte	168
	byte	160
	byte	run,0x80+2




