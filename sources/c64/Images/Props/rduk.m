;---------------------------------------
;
;	animation cel data
;

rduk_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000

	word	rduk_data_a - rduk_data


rduk_data_a:
	byte	0x04, 0x0e, 0xff, 0x04, 0x00, 0x00

	byte	2
	byte	9
	byte	37
	byte	149
	byte	150
	byte	153
	byte	37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	170
	byte	85
	byte	90
	byte	165
	byte	run,4,85
	byte	170
	byte	run,0x80+5
	byte	160
	byte	88
	byte	86
	byte	150
	byte	150
	byte	86
	byte	86
	byte	150
	byte	run,3,37
	byte	38
	byte	37
	byte	10
	byte	run,0x80+8
	byte	128
	byte	104
	byte	110
	byte	106
	byte	128
	byte	run,0x80+1




